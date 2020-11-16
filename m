Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C1532B51A0
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 16 Nov 2020 20:55:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727894AbgKPTyW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 16 Nov 2020 14:54:22 -0500
Received: from aposti.net ([89.234.176.197]:54660 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726575AbgKPTyV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 16 Nov 2020 14:54:21 -0500
Date:   Mon, 16 Nov 2020 19:54:03 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/2] drm/ingenic: depend on COMMON_CLK to fix compile
 tests
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Message-Id: <3ANWJQ.LV5B6V47KTYS2@crapouillou.net>
In-Reply-To: <20201116175301.402787-2-krzk@kernel.org>
References: <20201116175301.402787-1-krzk@kernel.org>
        <20201116175301.402787-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

Le lun. 16 nov. 2020 � 18:53, Krzysztof Kozlowski <krzk@kernel.org> a 
�crit :
> The Ingenic DRM uses Common Clock Framework thus it cannot be built on
> platforms without it (e.g. compile test on MIPS with RALINK and
> SOC_RT305X):
> 
>     /usr/bin/mips-linux-gnu-ld: 
> drivers/gpu/drm/ingenic/ingenic-drm-drv.o: in function 
> `ingenic_drm_bind.isra.0':
>     ingenic-drm-drv.c:(.text+0x1600): undefined reference to 
> `clk_get_parent'
>     /usr/bin/mips-linux-gnu-ld: ingenic-drm-drv.c:(.text+0x16b0): 
> undefined reference to `clk_get_parent'
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  drivers/gpu/drm/ingenic/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/ingenic/Kconfig 
> b/drivers/gpu/drm/ingenic/Kconfig
> index 477d5387e43e..3b57f8be007c 100644
> --- a/drivers/gpu/drm/ingenic/Kconfig
> +++ b/drivers/gpu/drm/ingenic/Kconfig
> @@ -4,6 +4,7 @@ config DRM_INGENIC
>  	depends on DRM
>  	depends on CMA
>  	depends on OF
> +	depends on COMMON_CLK
>  	select DRM_BRIDGE
>  	select DRM_PANEL_BRIDGE
>  	select DRM_KMS_HELPER
> --
> 2.25.1
> 


