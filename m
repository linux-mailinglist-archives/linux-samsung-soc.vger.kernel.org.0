Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5F3E4C39A9
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 25 Feb 2022 00:27:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233443AbiBXX17 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 24 Feb 2022 18:27:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233258AbiBXX16 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 24 Feb 2022 18:27:58 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D582415DDDC;
        Thu, 24 Feb 2022 15:27:27 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id p14so7437503ejf.11;
        Thu, 24 Feb 2022 15:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=GgRMEaWWsihNXcm9kb5g3aRwU5bYBZ4hRbaIjMsAJ28=;
        b=AUFG36AaZoBHCxj2mFa36Gyk2gtt4CovwS01kw+H9Xh/Ilh/GUSlQ2vfKMwue7wmNH
         dPFAMFOUUYE0aqRWl9qi4hxKOGpm64O0QhlKtMPlro/JPnglhWrhTsxdOs+j4OvvDe75
         +oL3TwZ2u3CAHcwHang4Pm+fuSzDy8EVlVb91DoWvMvhXETHQJpYTOqLkheHOq2XbGRV
         WXZ/7gpcSQvkhPzKqUQ75ZOtpN2ymWXC45ve8/YfmsnESiLHwQ6phg/zlUmfs4h6suiR
         rHVw2P5fhqaTpDCPs57g5YRQsimI2RO7Se4Cn0GNTcqSeZJ9NB8kDZL8vkwnVkOJ0uyL
         BH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=GgRMEaWWsihNXcm9kb5g3aRwU5bYBZ4hRbaIjMsAJ28=;
        b=Hkzb+n74O9Yae+21KlJrXMEVACgpJFIIrSdFLoWHFTMc5jpcv0B0E+5e6mRRX7OJ2b
         pFBbV2iEqB9El+RE8oTCKlMSqu3kI6rHuggpWOM1IVEmAe0TjPid7SiwGQadHqhRh3bP
         MEjfTjRcERoqzqPU2NEqTa1h04PYQfghFCI64vx/Dx989nBG9qV63A3A/ES4KD7mmWwq
         WmWkSQ+55cqAc5v6TP9/FHV81R5dMcpPpnjujGFiKS4etIsGyaQptrHotYGyMEMs/9JU
         oEeVwtBq+T51q/3YtALQz5Q8wyZprhVGHzsHzhTRa5MfVYEGiVK0d59kYmD2i05OMIXg
         /udA==
X-Gm-Message-State: AOAM530EslcNmA1D4jHZ/PK4p/VP/zORM69oB8dvKRfLprg/wQGvCzr3
        Ar0P1FTDoTQX80H+HW3ueNw=
X-Google-Smtp-Source: ABdhPJxeDqtcC7ApqeCiRw4GyrajKMiCm4h+3UL3v9qHMLe7wgfJLlcRMpgDniIYPQx7dWC1tP8cDA==
X-Received: by 2002:a17:907:1245:b0:6cc:e663:7baa with SMTP id wc5-20020a170907124500b006cce6637baamr4001071ejb.447.1645745246283;
        Thu, 24 Feb 2022 15:27:26 -0800 (PST)
Received: from adroid (027-177-184-091.ip-addr.vsenet.de. [91.184.177.27])
        by smtp.gmail.com with ESMTPSA id ie19-20020a170906df1300b006bc52a7e928sm283931ejc.111.2022.02.24.15.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 15:27:25 -0800 (PST)
Date:   Fri, 25 Feb 2022 00:27:23 +0100
From:   Martin =?iso-8859-1?Q?J=FCcker?= <martin.juecker@gmail.com>
To:     Inki Dae <inki.dae@samsung.com>
Cc:     Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Martin =?iso-8859-1?Q?J=FCcker?= <martin.juecker@gmail.com>
Subject: Re: [PATCH] drm/exynos: fimd: add BGR support for exynos4/5
Message-ID: <20220224232723.GA133007@adroid>
References: <CGME20220129220203epcas1p25b1704191dd7babfb8d5b8dc6704d566@epcas1p2.samsung.com>
 <20220129220153.GA33165@adroid>
 <5e18705f-79c1-18a7-57f2-74866abe21e9@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5e18705f-79c1-18a7-57f2-74866abe21e9@samsung.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hello Inki,

On Thu, Feb 24, 2022 at 10:41:04AM +0900, Inki Dae wrote:
> Hi Martin.
> 
> I found that exynos4 and 5 data sheet include documented same register.
> RGB_ORDER_E field of VIDCONx registers will do same thing.

If I read the manual correctly, this register combined with the
RGB_ORDER_O makes it possible to map the whole RGB interface output to a
different order. What my patch provides is a way to configure each
hardware plane separately while maintaining a consistent output on the
RGB interface.

Implementing the RGB_ORDER_O and E would need some logic to make sure
that all planes are always using the same RGB order.

> 
> I'm not sure whether the use of undocumented register is safe or not - maybe some HW bug exists.

I see, that makes sense. Would it be possible then to introduce a new
compatible, e.g. samsung,exynos4210-fimd-ext which can be used on tested
devices? I know that some other Galaxy Note and S devices with the
exynos4 chip have the same problem (and solution).

> 
> Anyway, I'd like to recommend you to use documented register only.
> 
> Sorry for late and thanks,
> Inki Dae

Kind Regards
Martin

> 
> 22. 1. 30. 07:01에 Martin Jücker 이(가) 쓴 글:
> > In the downstream kernels for exynos4 and exynos5 devices, there is an
> > undocumented register that controls the order of the RGB output. It can
> > be set to either normal order or reversed, which enables BGR support for
> > those SoCs.
> > 
> > This patch enables the BGR support for all the SoCs that were found to
> > have at least one device with this logic in the corresponding downstream
> > kernels.
> > 
> > Signed-off-by: Martin Jücker <martin.juecker@gmail.com>
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 42 ++++++++++++++++++++++--
> >  include/video/samsung_fimd.h             |  4 +++
> >  2 files changed, 44 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > index c735e53939d8..cb632360c968 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > @@ -109,6 +109,7 @@ struct fimd_driver_data {
> >  	unsigned int has_dp_clk:1;
> >  	unsigned int has_hw_trigger:1;
> >  	unsigned int has_trigger_per_te:1;
> > +	unsigned int has_bgr_support:1;
> >  };
> >  
> >  static struct fimd_driver_data s3c64xx_fimd_driver_data = {
> > @@ -138,6 +139,7 @@ static struct fimd_driver_data exynos4_fimd_driver_data = {
> >  	.lcdblk_bypass_shift = 1,
> >  	.has_shadowcon = 1,
> >  	.has_vtsel = 1,
> > +	.has_bgr_support = 1,
> >  };
> >  
> >  static struct fimd_driver_data exynos5_fimd_driver_data = {
> > @@ -149,6 +151,7 @@ static struct fimd_driver_data exynos5_fimd_driver_data = {
> >  	.has_vidoutcon = 1,
> >  	.has_vtsel = 1,
> >  	.has_dp_clk = 1,
> > +	.has_bgr_support = 1,
> >  };
> >  
> >  static struct fimd_driver_data exynos5420_fimd_driver_data = {
> > @@ -162,6 +165,7 @@ static struct fimd_driver_data exynos5420_fimd_driver_data = {
> >  	.has_vtsel = 1,
> >  	.has_mic_bypass = 1,
> >  	.has_dp_clk = 1,
> > +	.has_bgr_support = 1,
> >  };
> >  
> >  struct fimd_context {
> > @@ -226,6 +230,18 @@ static const uint32_t fimd_formats[] = {
> >  	DRM_FORMAT_ARGB8888,
> >  };
> >  
> > +static const uint32_t fimd_extended_formats[] = {
> > +	DRM_FORMAT_C8,
> > +	DRM_FORMAT_XRGB1555,
> > +	DRM_FORMAT_XBGR1555,
> > +	DRM_FORMAT_RGB565,
> > +	DRM_FORMAT_BGR565,
> > +	DRM_FORMAT_XRGB8888,
> > +	DRM_FORMAT_XBGR8888,
> > +	DRM_FORMAT_ARGB8888,
> > +	DRM_FORMAT_ABGR8888,
> > +};
> > +
> >  static const unsigned int capabilities[WINDOWS_NR] = {
> >  	0,
> >  	EXYNOS_DRM_PLANE_CAP_WIN_BLEND | EXYNOS_DRM_PLANE_CAP_PIX_BLEND,
> > @@ -673,21 +689,25 @@ static void fimd_win_set_pixfmt(struct fimd_context *ctx, unsigned int win,
> >  		val |= WINCONx_BYTSWP;
> >  		break;
> >  	case DRM_FORMAT_XRGB1555:
> > +	case DRM_FORMAT_XBGR1555:
> >  		val |= WINCON0_BPPMODE_16BPP_1555;
> >  		val |= WINCONx_HAWSWP;
> >  		val |= WINCONx_BURSTLEN_16WORD;
> >  		break;
> >  	case DRM_FORMAT_RGB565:
> > +	case DRM_FORMAT_BGR565:
> >  		val |= WINCON0_BPPMODE_16BPP_565;
> >  		val |= WINCONx_HAWSWP;
> >  		val |= WINCONx_BURSTLEN_16WORD;
> >  		break;
> >  	case DRM_FORMAT_XRGB8888:
> > +	case DRM_FORMAT_XBGR8888:
> >  		val |= WINCON0_BPPMODE_24BPP_888;
> >  		val |= WINCONx_WSWP;
> >  		val |= WINCONx_BURSTLEN_16WORD;
> >  		break;
> >  	case DRM_FORMAT_ARGB8888:
> > +	case DRM_FORMAT_ABGR8888:
> >  	default:
> >  		val |= WINCON1_BPPMODE_25BPP_A1888;
> >  		val |= WINCONx_WSWP;
> > @@ -695,6 +715,18 @@ static void fimd_win_set_pixfmt(struct fimd_context *ctx, unsigned int win,
> >  		break;
> >  	}
> >  
> > +	switch (pixel_format) {
> > +	case DRM_FORMAT_XBGR1555:
> > +	case DRM_FORMAT_XBGR8888:
> > +	case DRM_FORMAT_ABGR8888:
> > +	case DRM_FORMAT_BGR565:
> > +		writel(WIN_RGB_ORDER_REVERSE, ctx->regs + WIN_RGB_ORDER(win));
> > +		break;
> > +	default:
> > +		writel(WIN_RGB_ORDER_FORWARD, ctx->regs + WIN_RGB_ORDER(win));
> > +		break;
> > +	}
> > +
> >  	/*
> >  	 * Setting dma-burst to 16Word causes permanent tearing for very small
> >  	 * buffers, e.g. cursor buffer. Burst Mode switching which based on
> > @@ -1074,8 +1106,14 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
> >  	ctx->drm_dev = drm_dev;
> >  
> >  	for (i = 0; i < WINDOWS_NR; i++) {
> > -		ctx->configs[i].pixel_formats = fimd_formats;
> > -		ctx->configs[i].num_pixel_formats = ARRAY_SIZE(fimd_formats);
> > +		if (ctx->driver_data->has_bgr_support) {
> > +			ctx->configs[i].pixel_formats = fimd_extended_formats;
> > +			ctx->configs[i].num_pixel_formats = ARRAY_SIZE(fimd_extended_formats);
> > +		} else {
> > +			ctx->configs[i].pixel_formats = fimd_formats;
> > +			ctx->configs[i].num_pixel_formats = ARRAY_SIZE(fimd_formats);
> > +		}
> > +
> >  		ctx->configs[i].zpos = i;
> >  		ctx->configs[i].type = fimd_win_types[i];
> >  		ctx->configs[i].capabilities = capabilities[i];
> > diff --git a/include/video/samsung_fimd.h b/include/video/samsung_fimd.h
> > index c4a93ce1de48..e6966d187591 100644
> > --- a/include/video/samsung_fimd.h
> > +++ b/include/video/samsung_fimd.h
> > @@ -476,6 +476,10 @@
> >   * 1111		-none-	 -none-   -none-   -none-    -none-
> >  */
> >  
> > +#define WIN_RGB_ORDER(_win)			(0x2020 + ((_win) * 4))
> > +#define WIN_RGB_ORDER_FORWARD			(0 << 11)
> > +#define WIN_RGB_ORDER_REVERSE			(1 << 11)
> > +
> >  /* FIMD Version 8 register offset definitions */
> >  #define FIMD_V8_VIDTCON0	0x20010
> >  #define FIMD_V8_VIDTCON1	0x20014
