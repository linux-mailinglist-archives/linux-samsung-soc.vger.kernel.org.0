Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6552221DB21
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 13 Jul 2020 18:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729593AbgGMQDq (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 13 Jul 2020 12:03:46 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:49842 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729027AbgGMQDq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Jul 2020 12:03:46 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id B8047804F2;
        Mon, 13 Jul 2020 18:03:43 +0200 (CEST)
Date:   Mon, 13 Jul 2020 18:03:42 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Inki Dae <inki.dae@samsung.com>
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2] drm/exynos: gem: Fix sparse warning
Message-ID: <20200713160342.GB1223330@ravnborg.org>
References: <CGME20200713070718eucas1p2e717879ea21a6cc8a8945d1b0b766b6c@eucas1p2.samsung.com>
 <20200713070708.30828-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200713070708.30828-1-m.szyprowski@samsung.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8 a=7gkXJVJtAAAA:8 a=hD80L64hAAAA:8
        a=e5mUnYsNAAAA:8 a=ZMP1pjZxzPjGEdM3V3EA:9 a=CjuIK1q_8ugA:10
        a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Jul 13, 2020 at 09:07:08AM +0200, Marek Szyprowski wrote:
> kvaddr element of the exynos_gem object points to a memory buffer, thus
> it should not have a __iomem annotation. Then, to avoid a warning or
> casting on assignment to fbi structure, the screen_buffer element of the
> union should be used instead of the screen_base.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Suggested-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

I expect one of the exynos maintianers (Inki?) to pick it up.

	Sam

> ---
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 2 +-
>  drivers/gpu/drm/exynos/exynos_drm_gem.h   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> index 56a2b47e1af7..5147f5929be7 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> @@ -92,7 +92,7 @@ static int exynos_drm_fbdev_update(struct drm_fb_helper *helper,
>  	offset = fbi->var.xoffset * fb->format->cpp[0];
>  	offset += fbi->var.yoffset * fb->pitches[0];
>  
> -	fbi->screen_base = exynos_gem->kvaddr + offset;
> +	fbi->screen_buffer = exynos_gem->kvaddr + offset;
>  	fbi->screen_size = size;
>  	fbi->fix.smem_len = size;
>  
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.h b/drivers/gpu/drm/exynos/exynos_drm_gem.h
> index 7445748288da..74e926abeff0 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.h
> @@ -40,7 +40,7 @@ struct exynos_drm_gem {
>  	unsigned int		flags;
>  	unsigned long		size;
>  	void			*cookie;
> -	void __iomem		*kvaddr;
> +	void			*kvaddr;
>  	dma_addr_t		dma_addr;
>  	unsigned long		dma_attrs;
>  	struct sg_table		*sgt;
> -- 
> 2.17.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
