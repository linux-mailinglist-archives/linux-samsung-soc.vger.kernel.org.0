Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CE43379061
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 10 May 2021 16:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233641AbhEJONN (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 10 May 2021 10:13:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233706AbhEJOKF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 10 May 2021 10:10:05 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 876C1C0610E5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 May 2021 06:50:34 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id 76so15312426qkn.13
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 May 2021 06:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+2U891pcT5PFaAL7+dZJNGYBFLIb+qctBvykRURXgBY=;
        b=dACYFzmZp5FCubbaz661EkjXMEr4yIw8M3uTK3Kyf9WGXPYwdZw+Te0aQwLTIgwwC2
         IcIyUfISzla30F1Y5z5YNyfFMSuvpPToFEKyFwyWyzNO8J90FAq4FSLctkLmbUnqXieu
         lMQ7sIa6zzDWNW+3ZAA/Ywi2wnST8RvZfOXC1jXTR/nDU/u1OUAIwV5METsf0kVOPHrk
         PIuKStNqOQCBo7BK5+duLO5e2wBIi32E+Rgu2kNOG2SYryYXUN5IAmaJPspud5x7d6Vf
         5XGHOc/1cpdW83EDoXATbw25gMJUpTl30B68jCIFcCNIzm8fMivAz/aG2nH3kKyIFqz2
         KzIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+2U891pcT5PFaAL7+dZJNGYBFLIb+qctBvykRURXgBY=;
        b=ULX/m6m2L9FnspI6oJEUxKcg/eLD9D9YJE6pkQKDYaF/XysJUJt5PH0J9PRlGcsH8x
         dMK2u3n5BLxkrNZqzskeOmm1uf3ChZi+1NsEbMDdmHyUiA61H4RUzgbc3xwClAGXScOE
         NBkJ+9DPk6EYpyCJh/4DICkFIkef0AE4glQLc3kYEEWW+plKGde/1gHO23ScXUgjn+02
         gInNN709kGJZg14n2x15YREYitPgQygyDBdtTV79ecqUFxi+7ehCnKpe/h9xOkoFEw1n
         jzV5pCXOqwvp31TS3Amc01pAiC2wTP/0YMiR6mbHDpbBu8dIQJRJaKybL3iM3W7VXdIp
         hW1g==
X-Gm-Message-State: AOAM530kKcqxF0INy8+NBfwGLK9S3uOmUdI564cQdJ+TnIZVG6cHnHzt
        5ZZVtoY9Mx0bTMiajiIT5Oq2Hg==
X-Google-Smtp-Source: ABdhPJzBvEXIq3ZKj83MNPLUEszsweYjMFeVQA7SyU/yis3HOqTzVmEhu9DH0fP04ViEgC4gr5a3yA==
X-Received: by 2002:a05:620a:4543:: with SMTP id u3mr22610464qkp.118.1620654633736;
        Mon, 10 May 2021 06:50:33 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-113-94.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.113.94])
        by smtp.gmail.com with ESMTPSA id e7sm11644631qth.27.2021.05.10.06.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 06:50:32 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1lg6Ip-004ZFk-QY; Mon, 10 May 2021 10:50:31 -0300
Date:   Mon, 10 May 2021 10:50:31 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PULL] topic/iomem-mmap-vs-gup
Message-ID: <20210510135031.GF2047089@ziepe.ca>
References: <YJBHiRiCGzojk25U@phenom.ffwll.local>
 <CAHk-=wiwgOPQ+4Eaf0GD5P_GveE6vUHsKxAT=pMsjk1v_kh4ig@mail.gmail.com>
 <YJVijmznt1xnsCxc@phenom.ffwll.local>
 <CAHk-=wgjO8-f1bUwQB=5HGzkvSS+aGACR9+H5CkkDhRgud+3MA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgjO8-f1bUwQB=5HGzkvSS+aGACR9+H5CkkDhRgud+3MA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, May 08, 2021 at 09:46:41AM -0700, Linus Torvalds wrote:

> I think follow_pfn() is ok for the actual "this is not a 'struct page'
> backed area", and disabling that case is wrong even going forward.

Every place we've audited using follow_pfn() has been shown to have
some use-after-free bugs like Daniel describes, and a failure to check
permissions bug too.

All the other follow_pfn() users were moved to follow_pte() to fix the
permissions check and this shifts the use-after-free bug away from
being inside an MM API and into the caller mis-using the API by, say,
extracting and using the PFN outside the pte lock.

eg look at how VFIO wrongly uses follow_pte():

static int follow_fault_pfn()
        ret = follow_pte(vma->vm_mm, vaddr, &ptep, &ptl);
                *pfn = pte_pfn(*ptep);
        pte_unmap_unlock(ptep, ptl);

        // no protection that pte_pfn() is still valid!
        use_pfn(*pfn)

v4l is the only user that still has the missing permissions check
security bug too - so there is no outcome that should keep
follow_pfn() in the tree.

At worst v4l should change to follow_pte() and use it wrongly like
VFIO. At best we should delete all the v4l stuff.

Daniel I suppose we missed this relation to follow_pte(), so I agree
that keeping a unsafe_follow_pfn() around is not good.

Regards,
Jason
