Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8A8B3792C8
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 10 May 2021 17:34:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234429AbhEJPfV (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 10 May 2021 11:35:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232384AbhEJPfU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 10 May 2021 11:35:20 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 309D1C06175F
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 May 2021 08:34:15 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id w9so8516990qvi.13
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 May 2021 08:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Kbo2+rSch+wM5JArQf3gDIi84RZdBPSju4RgHGRm0v8=;
        b=jInoHJDR26ARTH6tGpwVeeJogGk+P6na2ViO2DUIC+bGbMTDUi+8QZzkitdl3HzqhO
         qhzxVKEpk3y84tIr+YEon8WcnwbvCYIcrIg25Aj/b7Aw/UGidjezNDFr5jegnVEzomGc
         4efhSEvakB8sIdWnv6WdpTzrvm1E0Gx8lRr9GLBLLiIA4Ukwc+AzQ9ZD3NCYX5hM1Sd/
         ccEc+Vt5pnW3H8LiiDb5+QVBE1suwmzlBV6rdcmBxTtb5gWnK/b/QGiuyH818XA3RJ/w
         eI2Btdv2pxaao9VxPBbC4GWZvh6jQaHr7aGphsI2afnyj+BjF4p6gyMYvMUkwP1w7Elb
         RnQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Kbo2+rSch+wM5JArQf3gDIi84RZdBPSju4RgHGRm0v8=;
        b=MMKpnfQQVLC8NqsdRmnkep+kRVYKr039G5cm+q69i1lE+JSG02+vNDi1eA7jyyA05V
         SKcxa+LCWDdFUALaPbfFL+yN/TVjaDHH+8AHafF/EEVk6LVOGcH46Az+kXCiMpju0ObO
         07Dxkv3eKuYTCzVfGIqFDGaU4gQ3Kyyvah+h94NE/lvkyLUg4YIhIBZjuUU4n87XondQ
         dfzdDY5FucEVnvMr0eC/kpzjVrl4OEUT08d7siDO8wEWjCeCPSqvN0d1+AlWTwuTnVAB
         kckn4v4bxCizRGmmKiAN5dVqfCs8OBa8CwYBSHUTslMwXzOKsjk7CFY4RveEAcP0ztYM
         9PLw==
X-Gm-Message-State: AOAM5334j/5z83bTFNc38tRsegROcwG68aAGIzr7W7t9Jt6cjYBHOOjj
        kPomWpARBBDtMoKx5xkF1vyQrQ==
X-Google-Smtp-Source: ABdhPJyla2vALn9Ej+6umiMQDx3D5VWVB5hGHAU2fINWGaZnoagvIFv9v7XEtwXflVpOpTyJSRO84Q==
X-Received: by 2002:a05:6214:9aa:: with SMTP id du10mr24525830qvb.37.1620660853797;
        Mon, 10 May 2021 08:34:13 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-113-94.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.113.94])
        by smtp.gmail.com with ESMTPSA id t128sm11479176qkh.50.2021.05.10.08.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 08:34:13 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1lg7vA-004b0w-PZ; Mon, 10 May 2021 12:34:12 -0300
Date:   Mon, 10 May 2021 12:34:12 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PULL] topic/iomem-mmap-vs-gup
Message-ID: <20210510153412.GG2047089@ziepe.ca>
References: <YJBHiRiCGzojk25U@phenom.ffwll.local>
 <CAHk-=wiwgOPQ+4Eaf0GD5P_GveE6vUHsKxAT=pMsjk1v_kh4ig@mail.gmail.com>
 <YJVijmznt1xnsCxc@phenom.ffwll.local>
 <CAHk-=wgjO8-f1bUwQB=5HGzkvSS+aGACR9+H5CkkDhRgud+3MA@mail.gmail.com>
 <20210510135031.GF2047089@ziepe.ca>
 <CAKMK7uFfN3p2fE1Xq47nOTtkPY2vm10GMvBaupQ9hgK0rS8sgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uFfN3p2fE1Xq47nOTtkPY2vm10GMvBaupQ9hgK0rS8sgQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, May 10, 2021 at 04:55:39PM +0200, Daniel Vetter wrote:

> yeah vfio is still broken for the case I care about. I think there's
> also some questions open still about whether kvm really uses
> mmu_notifier in all cases correctly, 

IIRC kvm doesn't either.

> > Daniel I suppose we missed this relation to follow_pte(), so I agree
> > that keeping a unsafe_follow_pfn() around is not good.
> 
> tbh I never really got the additional issue with the missing write
> checks. That users of follow_pfn (or well follow_pte + immediate lock
> dropping like vfio) don't subscribe to the pte updates in general is
> the bug I'm seeing. That v4l also glosses over the read/write access
> stuff is kinda just the icing on the cake :-) It's pretty well broken
> even if it would check that.

It is just severity. Exploiting the use after free bug is somewhat
harder, exploiting the 'you can write to non-page write protected
memory' bug is not so hard.

Jason
