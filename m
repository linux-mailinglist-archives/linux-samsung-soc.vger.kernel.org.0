Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C14B333D79C
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 16 Mar 2021 16:34:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238088AbhCPPdu (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 16 Mar 2021 11:33:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238101AbhCPPdQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 16 Mar 2021 11:33:16 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE49EC061763
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Mar 2021 08:33:15 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id f22-20020a7bc8d60000b029010c024a1407so1709332wml.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Mar 2021 08:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tAmsDn5BdzFpIsfSDcu5mIHmvLYc/wJQn0BecfxLgl0=;
        b=ME4sGumFgKYUCqwSU9ZCBXBRBDOTgxTwFtahv+NVAVJHr+fD8AUrznH+V7FRtA8gOj
         B+CFMjnx7WbKUqyhiMCsTbXLvmFggAn1SQaPCFAka4KTPpVgwdX/WNFBVl3rpTLAziJj
         STDnUtNyyxJvOuElf8oAxewCR7SdYgUMXzeAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tAmsDn5BdzFpIsfSDcu5mIHmvLYc/wJQn0BecfxLgl0=;
        b=W1KehDz2RDuV9WOnAncz/vLNmi+2Mfz+YU1lKV9RYdXn3E2qvOkwHHtwm0wjyVSOBs
         smp0fm5Pn/OkaVvKWJDDc7B6q93bL1gmgnLARQmNqlEgzE1syv2lvDDQydpkq98EIOwL
         NcH6lnnmQHOGHGQtIXEI63+QcCcjBnyn8hlq8ik5q1/LUCkRTtPyhlp2mr+jd3kW9TG2
         kgIwi2VyR/OPEfuuURRlvCL6XgSR19brHQWeMn56aIfsDxd4Ve4Lgw2yyWk4P/UaJgoj
         78VGV0v0vmlPZof6Nu4hooHtJBiLFtZOvEZ0p+/MTxqP+qbCjLT1v00msI304KBuPRF6
         0f8Q==
X-Gm-Message-State: AOAM530kiFNIRcodI5g5IH1RDbFgm11MLtzb2OAeN8DciIp7d0032qd5
        /bMApKYpR/I6uflVzisMtQ54gA==
X-Google-Smtp-Source: ABdhPJxdFzaSGBW2sfC8QBc+tMQBXV96M89NWylJdwfCrwV7xrFzVSLG4KZ9deIsLAWFmFnloMhjFw==
X-Received: by 2002:a05:600c:4a06:: with SMTP id c6mr209965wmp.35.1615908794565;
        Tue, 16 Mar 2021 08:33:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id h22sm3985078wmb.36.2021.03.16.08.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 08:33:14 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>, Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Laurent Dufour <ldufour@linux.ibm.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Daniel Jordan <daniel.m.jordan@oracle.com>,
        Michel Lespinasse <walken@google.com>
Subject: [PATCH 2/3] media/videobuf1|2: Mark follow_pfn usage as unsafe
Date:   Tue, 16 Mar 2021 16:33:02 +0100
Message-Id: <20210316153303.3216674-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210316153303.3216674-1-daniel.vetter@ffwll.ch>
References: <20210316153303.3216674-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The media model assumes that buffers are all preallocated, so that
when a media pipeline is running we never miss a deadline because the
buffers aren't allocated or available.

This means we cannot fix the v4l follow_pfn usage through
mmu_notifier, without breaking how this all works. The only real fix
is to deprecate userptr support for VM_IO | VM_PFNMAP mappings and
tell everyone to cut over to dma-buf memory sharing for zerocopy.

userptr for normal memory will keep working as-is, this only affects
the zerocopy userptr usage enabled in 50ac952d2263 ("[media]
videobuf2-dma-sg: Support io userptr operations on io memory").

Acked-by: Tomasz Figa <tfiga@chromium.org>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kees Cook <keescook@chromium.org>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Jérôme Glisse <jglisse@redhat.com>
Cc: Jan Kara <jack@suse.cz>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: linux-mm@kvack.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: Pawel Osciak <pawel@osciak.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Tomasz Figa <tfiga@chromium.org>
Cc: Laurent Dufour <ldufour@linux.ibm.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Daniel Jordan <daniel.m.jordan@oracle.com>
Cc: Michel Lespinasse <walken@google.com>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
--
v3:
- Reference the commit that enabled the zerocopy userptr use case to
  make it abundandtly clear that this patch only affects that, and not
  normal memory userptr. The old commit message already explained that
  normal memory userptr is unaffected, but I guess that was not clear
  enough.
---
 drivers/media/common/videobuf2/frame_vector.c | 2 +-
 drivers/media/v4l2-core/videobuf-dma-contig.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/common/videobuf2/frame_vector.c b/drivers/media/common/videobuf2/frame_vector.c
index a0e65481a201..1a82ec13ea00 100644
--- a/drivers/media/common/videobuf2/frame_vector.c
+++ b/drivers/media/common/videobuf2/frame_vector.c
@@ -70,7 +70,7 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
 			break;
 
 		while (ret < nr_frames && start + PAGE_SIZE <= vma->vm_end) {
-			err = follow_pfn(vma, start, &nums[ret]);
+			err = unsafe_follow_pfn(vma, start, &nums[ret]);
 			if (err) {
 				if (ret == 0)
 					ret = err;
diff --git a/drivers/media/v4l2-core/videobuf-dma-contig.c b/drivers/media/v4l2-core/videobuf-dma-contig.c
index 52312ce2ba05..821c4a76ab96 100644
--- a/drivers/media/v4l2-core/videobuf-dma-contig.c
+++ b/drivers/media/v4l2-core/videobuf-dma-contig.c
@@ -183,7 +183,7 @@ static int videobuf_dma_contig_user_get(struct videobuf_dma_contig_memory *mem,
 	user_address = untagged_baddr;
 
 	while (pages_done < (mem->size >> PAGE_SHIFT)) {
-		ret = follow_pfn(vma, user_address, &this_pfn);
+		ret = unsafe_follow_pfn(vma, user_address, &this_pfn);
 		if (ret)
 			break;
 
-- 
2.30.0

