Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E16972551A1
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 28 Aug 2020 01:35:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727845AbgH0Xe5 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 27 Aug 2020 19:34:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728046AbgH0Xez (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 27 Aug 2020 19:34:55 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EBFCC061235
        for <linux-samsung-soc@vger.kernel.org>; Thu, 27 Aug 2020 16:34:55 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id j9so6380755ilc.11
        for <linux-samsung-soc@vger.kernel.org>; Thu, 27 Aug 2020 16:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tcd-ie.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WedloSq7WEmmdLIoMis0OnTbQ3vwipQyHuMeYXqSrtc=;
        b=z5afeT1uAO8r4nUnyvdyA9XOFk/fx4rNEV7OzYIxSzIyRPXSSuP0kLR0uFLb5b32/u
         2F9MWfvV9WNZ+AXIi+QLZ8p0NAvNTBNro8XHBAkvaJyY3ufO9Q62GJ4oCd3Mw0z1agKr
         qFAx/HdJ+EmG1djyMZ9CSGcKQmWFu/zVKz5vJDxg6Nx++SMMng1dGMX9Fmd/wZDTKzHU
         hK7p1r057Z3QOjx4Tgjjmk5k/beu18E/9gkjDnfpmsN6+7UO8xqzHsjZBJhd37zZ1RdM
         prBipf1AI2muUbFcyfU3La5FJDcrT8wuyB+danzKbVnftQC2AzrWmBaIjshroZB9Cb96
         Llhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WedloSq7WEmmdLIoMis0OnTbQ3vwipQyHuMeYXqSrtc=;
        b=VVQSaBoKcjX5A7XQw6xVuQY3JOX9oI8LynMsUoVR6749cNEsqRObN38z6yrMpUiOA6
         kriRL9WxvzRjcZuX9iz5rAwTWkq9mzzc6rOmSo1IJRiEq8co6xIaP4vuZ2lr3cRTPBxv
         GQN2vq5xrfTDGCybneH+IFRcDKV5dSz1bpW3d+yYzBwJshjHAldTVffB6IIbwlU2/bQL
         NsU37BUwEB/CXx1ClHDwgKC41B7JxbW/0jwr5x0apP9m53GaEE4zIU7j01HoUjTr/GXa
         J3LVyMHqjrIUXqChSY1579soRZIH7NwWKerWATUzZYjRtQF+scgi50Nd60kkI245TEYW
         2Uiw==
X-Gm-Message-State: AOAM532LP9s/bS7jPvrRRjcD9JLqolZM/rk+zcORrYOP//0IL64CFp0h
        3uDB9oEoGkjwOTHJoHDUYp+Hg8eOlR0a1rH71Q0j+A==
X-Google-Smtp-Source: ABdhPJw0W2KNMSiVDCp6qP+D3bxqQi5szrf3hiteZz0kvkkYuvF0+Qn7lDLtjb0Ko+kJMcKtvMnZ3YU+iAfoJmlGVTk=
X-Received: by 2002:a92:4f:: with SMTP id 76mr18588367ila.11.1598571293162;
 Thu, 27 Aug 2020 16:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <20191221150402.13868-1-murphyt7@tcd.ie> <465815ae-9292-f37a-59b9-03949cb68460@deltatee.com>
 <20200529124523.GA11817@infradead.org> <CGME20200529190523eucas1p2c086133e707257c0cdc002f502d4f51d@eucas1p2.samsung.com>
 <33137cfb-603c-86e8-1091-f36117ecfaf3@deltatee.com> <ef2150d5-7b6a-df25-c10d-e43316fe7812@samsung.com>
 <b9140772-0370-a858-578c-af503a06d8e9@deltatee.com> <CALQxJuutRaeX89k2o4ffTKYRMizmMu0XbRnzpFuSSrkQR02jKg@mail.gmail.com>
 <766525c3-4da9-6db7-cd90-fb4b82cd8083@deltatee.com>
In-Reply-To: <766525c3-4da9-6db7-cd90-fb4b82cd8083@deltatee.com>
From:   Tom Murphy <murphyt7@tcd.ie>
Date:   Fri, 28 Aug 2020 00:34:41 +0100
Message-ID: <CALQxJuuS8KKUX_eWWSE81gsq5ePAETB-FoqRUSWFfqgr+B13gg@mail.gmail.com>
Subject: Re: [PATCH 0/8] Convert the intel iommu driver to the dma-iommu api
To:     Logan Gunthorpe <logang@deltatee.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Christoph Hellwig <hch@infradead.org>,
        iommu@lists.linux-foundation.org, kvm@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Julien Grall <julien.grall@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Will Deacon <will@kernel.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        linux-samsung-soc@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-rockchip@lists.infradead.org, Andy Gross <agross@kernel.org>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org,
        Alex Williamson <alex.williamson@redhat.com>,
        linux-mediatek@lists.infradead.org,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        virtualization@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org,
        Robin Murphy <robin.murphy@arm.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 27 Aug 2020 at 22:36, Logan Gunthorpe <logang@deltatee.com> wrote:
>
>
>
> On 2020-08-23 6:04 p.m., Tom Murphy wrote:
> > I have added a check for the sg_dma_len == 0 :
> > """
> >  } __sgt_iter(struct scatterlist *sgl, bool dma) {
> >         struct sgt_iter s = { .sgp = sgl };
> >
> > +       if (sgl && sg_dma_len(sgl) == 0)
> > +           s.sgp = NULL;
> >
> >         if (s.sgp) {
> >             .....
> > """
> > at location [1].
> > but it doens't fix the problem.
>
> Based on my read of the code, it looks like we also need to change usage
> of sgl->length... Something like the rough patch below, maybe?
>
> Also, Tom, do you have an updated version of the patchset to convert the
> Intel IOMMU to dma-iommu available? The last one I've found doesn't
> apply cleanly (I'm assuming parts of it have been merged in slightly
> modified forms).
>

I'll try and post one in the next 24hours

> Thanks,
>
> Logan
>
> --
>
> diff --git a/drivers/gpu/drm/i915/i915_scatterlist.h
> b/drivers/gpu/drm/i915/i915
> index b7b59328cb76..9367ac801f0c 100644
> --- a/drivers/gpu/drm/i915/i915_scatterlist.h
> +++ b/drivers/gpu/drm/i915/i915_scatterlist.h
> @@ -27,13 +27,19 @@ static __always_inline struct sgt_iter {
>  } __sgt_iter(struct scatterlist *sgl, bool dma) {
>         struct sgt_iter s = { .sgp = sgl };
>
> +       if (sgl && !sg_dma_len(s.sgp))
> +               s.sgp = NULL;
> +
>         if (s.sgp) {
>                 s.max = s.curr = s.sgp->offset;
> -               s.max += s.sgp->length;
> -               if (dma)
> +
> +               if (dma) {
> +                       s.max += sg_dma_len(s.sgp);
>                         s.dma = sg_dma_address(s.sgp);
> -               else
> +               } else {
> +                       s.max += s.sgp->length;
>                         s.pfn = page_to_pfn(sg_page(s.sgp));
> +               }
>         }
>
>         return s;
