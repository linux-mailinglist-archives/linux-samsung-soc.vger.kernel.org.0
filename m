Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31C8D620C81
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  8 Nov 2022 10:41:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233215AbiKHJlk (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 8 Nov 2022 04:41:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233773AbiKHJlY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Nov 2022 04:41:24 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0069326C2
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Nov 2022 01:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667900428;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lW38e6pXJ1acSlo/JcbNSc5AQG/ffLUgHR8IViSMTS4=;
        b=UA8+oXJC+IW9OLSaXL9eq6ACo1uKgTXMGDp8u7oC1Eb0QB22A1MviLU6Azrm3pS2KZC++b
        W7rYPAu3vFu2/B4ilK3kQ08oBrOwkpk6r3vu40vEjTj4jkcJ5EaV/Pzryqx+XXCcDMVBZv
        7jvykvQekgcak06736A8bjvr1uY+kdo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-151-EvJ-kUyTMuyOjEFb9YTVVA-1; Tue, 08 Nov 2022 04:40:26 -0500
X-MC-Unique: EvJ-kUyTMuyOjEFb9YTVVA-1
Received: by mail-wm1-f69.google.com with SMTP id l42-20020a05600c1d2a00b003cf8e70c1ecso6116276wms.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Nov 2022 01:40:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lW38e6pXJ1acSlo/JcbNSc5AQG/ffLUgHR8IViSMTS4=;
        b=UIetOJsUOmBZTc6r4HFmS+N/SRtiEk+Psr+bjJ/LhCoQmio1oMZZ1gCW65aDeYQ9FC
         h8OqfVjV0kTfFw3vnbtN95p9XpeqBPj2CXaq0ER2wuhrK59YEj5YF7pQRfqJpdk1cWkn
         YrmcnfP4iXkfqV7Jr6rEEtnVNWQfvaQTAuclwtaqQ52otILPO0GoZwXFzrEOLeEKgfer
         qFsfB2awrJv+LVZF1cxTY73oD7IXt8GyCWlskhJQI+kO6NzFSU/mBYkEQn2723S/5GKn
         w/6EZxGtoXb03YXrssbWp6bqHJBuCLXQz10NPByxcy+pcDfh75W7K9MjURi9w6MS1ySj
         JSGQ==
X-Gm-Message-State: ACrzQf2Scl6JajsY8gl97eES/scrcm/7et3Y49YQmWjd9WthAXC1XMvT
        bVnrle6Dxw38G+AFQj9PQaSc+e1dSiz212qzAWM6ecnbcCG1LyQv0JdjvdR8FujcKCm5T8+u55d
        aMlgJnkofjXcfi91+vQsjgBh+ymQHj28=
X-Received: by 2002:a05:600c:54ca:b0:3cf:8e5d:7146 with SMTP id iw10-20020a05600c54ca00b003cf8e5d7146mr18675268wmb.191.1667900425631;
        Tue, 08 Nov 2022 01:40:25 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5cH9tWJ/7f+h1bsvSFgTQP1m4PENc1Ye2cP0NqhUl7fQavJfxFFKESh5AiG6/w6GmkhSUyjQ==
X-Received: by 2002:a05:600c:54ca:b0:3cf:8e5d:7146 with SMTP id iw10-20020a05600c54ca00b003cf8e5d7146mr18675241wmb.191.1667900425279;
        Tue, 08 Nov 2022 01:40:25 -0800 (PST)
Received: from ?IPV6:2003:cb:c708:db00:6510:da8d:df40:abbb? (p200300cbc708db006510da8ddf40abbb.dip0.t-ipconnect.de. [2003:cb:c708:db00:6510:da8d:df40:abbb])
        by smtp.gmail.com with ESMTPSA id bu12-20020a056000078c00b0023655e51c33sm10027356wrb.4.2022.11.08.01.40.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 01:40:24 -0800 (PST)
Message-ID: <040542e7-7d1c-4f25-b1ed-459f3c165283@redhat.com>
Date:   Tue, 8 Nov 2022 10:40:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To:     Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kselftest@vger.kernel.org,
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
        Oded Gabbay <ogabbay@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20221107161740.144456-1-david@redhat.com>
 <20221107161740.144456-17-david@redhat.com>
 <CAAFQd5C3Ba1WhjYJF_7tW06mgvzoz9KTakNo+Tz8h_f6dGKzHQ@mail.gmail.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH RFC 16/19] mm/frame-vector: remove FOLL_FORCE usage
In-Reply-To: <CAAFQd5C3Ba1WhjYJF_7tW06mgvzoz9KTakNo+Tz8h_f6dGKzHQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 08.11.22 05:45, Tomasz Figa wrote:
> Hi David,

Hi Tomasz,

thanks for looking into this!

> 
> On Tue, Nov 8, 2022 at 1:19 AM David Hildenbrand <david@redhat.com> wrote:
>>
>> FOLL_FORCE is really only for debugger access. According to commit
>> 707947247e95 ("media: videobuf2-vmalloc: get_userptr: buffers are always
>> writable"), the pinned pages are always writable.
> 

As reference, the cover letter of the series:

https://lkml.kernel.org/r/20221107161740.144456-1-david@redhat.com

> Actually that patch is only a workaround to temporarily disable
> support for read-only pages as they seemed to suffer from some
> corruption issues in the retrieved user pages. We expect to support
> read-only pages as hardware input after. That said, FOLL_FORCE doesn't
> sound like the right thing even in that case, but I don't know the
> background behind it being added here in the first place. +Hans
> Verkuil +Marek Szyprowski do you happen to remember anything about it?

Maybe I mis-interpreted 707947247e95; re-reading it again, I am not 
quite sure what the actual problem is and how it relates to GUP 
FOLL_WRITE handling. FOLL_FORCE already was in place before 707947247e95 
and should be removed.

What I understood is "Just always call vb2_create_framevec() with 
FOLL_WRITE to always allow writing to the buffers.".


If the pinned page is never written to via the obtained GUP reference:
* FOLL_WRITE should not be set
* FOLL_FORCE should not be set
* We should not dirty the page when unpinning

If the pinned page may be written to via the obtained GUP reference:
* FOLL_WRITE should be set
* FOLL_FORCE should not be set
* We should dirty the page when unpinning


If the function is called for both, we should think about doing it 
conditional based on a "write" variable, like pre-707947247e95 did.

@Hans, any insight?

-- 
Thanks,

David / dhildenb

