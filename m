Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BECC21BCFC
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 10 Jul 2020 20:30:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727059AbgGJSal (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 10 Jul 2020 14:30:41 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:47080 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726872AbgGJSal (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 10 Jul 2020 14:30:41 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id C08DE8051B;
        Fri, 10 Jul 2020 20:30:38 +0200 (CEST)
Date:   Fri, 10 Jul 2020 20:30:37 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>
Subject: Re: [PATCH] drm/exynos: gem: Fix sparse warning
Message-ID: <20200710183037.GI17565@ravnborg.org>
References: <CGME20200707110911eucas1p1e21621f402b2aac89457647c3b2ad46f@eucas1p1.samsung.com>
 <20200707110859.3822-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200707110859.3822-1-m.szyprowski@samsung.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8 a=hD80L64hAAAA:8 a=e5mUnYsNAAAA:8
        a=qO0_DFEm4Q4emWBWjJgA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Marek.

On Tue, Jul 07, 2020 at 01:08:59PM +0200, Marek Szyprowski wrote:
> Add a proper cast on the exynos_gem->kvaddr assignment to avoid a sparse warning.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 9940d9d93406 ("drm/exynos: gem: Get rid of the internal 'pages' array")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> index efa476858db5..65d11784f29f 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> @@ -59,7 +59,7 @@ static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem, bool kvmap)
>  	}
>  
>  	if (kvmap)
> -		exynos_gem->kvaddr = exynos_gem->cookie;
> +		exynos_gem->kvaddr = (void __iomem *)exynos_gem->cookie;

From a brif look at the code the correct fix looks to me to drop the
__iomem annotation of kvaddr.
And then no cast is needed.

Care to take a look at this?

	Sam

>  
>  	DRM_DEV_DEBUG_KMS(to_dma_dev(dev), "dma_addr(0x%lx), size(0x%lx)\n",
>  			(unsigned long)exynos_gem->dma_addr, exynos_gem->size);
> -- 
> 2.17.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
