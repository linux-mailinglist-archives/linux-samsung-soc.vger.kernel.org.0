Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F207961F919
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  7 Nov 2022 17:20:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232546AbiKGQUI (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 7 Nov 2022 11:20:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232041AbiKGQUF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Nov 2022 11:20:05 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8E5410E6
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Nov 2022 08:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667837903;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3+oJWZfKWoSUzQaG7FZQskadqtB6uOuGd99hd1wAZnI=;
        b=YQt3KrApbSoNavawteuE+P/9x5PmCp7UXNaVfxq/uu2WSLYpWhcVPJmy0LRod/hbAmLfcH
        DdNNvWY/vKwhgeYGs/am1UwgfuJ85bONFO2l/ok5YuHJknZdytrB/oj2549AmjHsfAp4aA
        d9zqvczqc41KhWtlZzHkXllTaTQzmtE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-yxYkz-LWMkeOtOv1hyz8Xg-1; Mon, 07 Nov 2022 11:18:18 -0500
X-MC-Unique: yxYkz-LWMkeOtOv1hyz8Xg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E88B806001;
        Mon,  7 Nov 2022 16:18:17 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.195.106])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3DB084B3FC6;
        Mon,  7 Nov 2022 16:18:12 +0000 (UTC)
From:   David Hildenbrand <david@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-mm@kvack.org, etnaviv@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kselftest@vger.kernel.org,
        David Hildenbrand <david@redhat.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        John Hubbard <jhubbard@nvidia.com>,
        Peter Xu <peterx@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Hugh Dickins <hughd@google.com>, Nadav Amit <namit@vmware.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Matthew Wilcox <willy@infradead.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        David Airlie <airlied@gmail.com>,
        Oded Gabbay <ogabbay@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH RFC 05/19] mm: add early FAULT_FLAG_WRITE consistency checks
Date:   Mon,  7 Nov 2022 17:17:26 +0100
Message-Id: <20221107161740.144456-6-david@redhat.com>
In-Reply-To: <20221107161740.144456-1-david@redhat.com>
References: <20221107161740.144456-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Let's catch abuse of FAULT_FLAG_WRITE early, such that we don't have to
care in all other handlers and might get "surprises" if we forget to do
so.

Write faults without VM_MAYWRITE don't make any sense, and our
maybe_mkwrite() logic could have hidden such abuse for now.

Write faults without VM_WRITE on something that is not a COW mapping is
similarly broken, and e.g., do_wp_page() could end up placing an
anonymous page into a shared mapping, which would be bad.

This is a preparation for reliable R/O long-term pinning of pages in
private mappings, whereby we want to make sure that we will never break
COW in a read-only private mapping.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/mm/memory.c b/mm/memory.c
index fe131273217a..826353da7b23 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5159,6 +5159,14 @@ static vm_fault_t sanitize_fault_flags(struct vm_area_struct *vma,
 		 */
 		if (!is_cow_mapping(vma->vm_flags))
 			*flags &= ~FAULT_FLAG_UNSHARE;
+	} else if (*flags & FAULT_FLAG_WRITE) {
+		/* Write faults on read-only mappings are impossible ... */
+		if (WARN_ON_ONCE(!(vma->vm_flags & VM_MAYWRITE)))
+			return VM_FAULT_SIGSEGV;
+		/* ... and FOLL_FORCE only applies to COW mappings. */
+		if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE) &&
+				 !is_cow_mapping(vma->vm_flags)))
+			return VM_FAULT_SIGSEGV;
 	}
 	return 0;
 }
-- 
2.38.1

