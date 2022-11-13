Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74C1B626CE7
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 13 Nov 2022 01:21:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231814AbiKMAVp (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 12 Nov 2022 19:21:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbiKMAVp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 12 Nov 2022 19:21:45 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B81AFDEFC
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Nov 2022 16:21:41 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 39CFD85150;
        Sun, 13 Nov 2022 01:21:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1668298899;
        bh=r7ImYBmMc5Fftf1Hu9F1mmrzzyi3vI2k0rgDLG7k0RM=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=p1v8dxD7E0XFY3Ib1Hkdho5LWQlj2XFlFlNMp4gW/yrbFHZhTwtQ11x84ReFr35dV
         /KyO+ULSVpqTgPuB5c8RyKgxlJ4UOIlArptYACoMcPPISfvYCYDeGAB9F33l4GfE/b
         BPu3XFdLTKebinTyYXUJJ7FCnZh7yhmjZZIZ/HrWW/PR4JqVjs21Bp25Ohqe9UnYaX
         3yShhQgyTUa9nPy6MhQ1HQ4fjHrsMKW+KEXJmym7Su2MwAGNmM49NY6lJ36I0JstlD
         vJNHgM+nm3uZv32V3NdKPbzoed8XU1fB4kVFTwV+9Ws+cK7eUNOCjo5+jn5Dn8m+QH
         qYQMxFA1bmqgw==
Message-ID: <694ccb10-15ad-5192-dd1b-86628227fb65@denx.de>
Date:   Sun, 13 Nov 2022 01:21:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v8 09/14] drm: bridge: samsung-dsim: Add
 atomic_get_input_bus_fmts
Content-Language: en-US
To:     Jagan Teki <jagan@amarulasolutions.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Fancy Fang <chen.fang@nxp.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <20221110183853.3678209-10-jagan@amarulasolutions.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20221110183853.3678209-10-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 11/10/22 19:38, Jagan Teki wrote:
> Finding the right input bus format throughout the pipeline is hard
> so add atomic_get_input_bus_fmts callback and initialize with the
> proper input format from list of supported output formats.
> 
> This format can be used in pipeline for negotiating bus format between
> the DSI-end of this bridge and the other component closer to pipeline
> components.
> 
> List of Pixel formats are taken from,
> AN13573 i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
> 3.7.4 Pixel formats
> Table 14. DSI pixel packing formats
> 
> v8:
> * added pixel formats supported by NXP AN13573 i.MX 8/RT MIPI DSI/CSI-2
> 
> v7, v6, v5, v4:
> * none
> 
> v3:
> * include media-bus-format.h
> 
> v2:
> * none
> 
> v1:
> * new patch
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>   drivers/gpu/drm/bridge/samsung-dsim.c | 53 +++++++++++++++++++++++++++
>   1 file changed, 53 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index 0fe153b29e4f..33e5ae9c865f 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -15,6 +15,7 @@
>   #include <linux/clk.h>
>   #include <linux/delay.h>
>   #include <linux/irq.h>
> +#include <linux/media-bus-format.h>
>   #include <linux/of_device.h>
>   #include <linux/phy/phy.h>
>   
> @@ -1321,6 +1322,57 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
>   	pm_runtime_put_sync(dsi->dev);
>   }
>   
> +/*
> + * This pixel output formats list referenced from,
> + * AN13573 i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
> + * 3.7.4 Pixel formats
> + * Table 14. DSI pixel packing formats
> + */
> +static const u32 samsung_dsim_pixel_output_fmts[] = {

You can also add :

MEDIA_BUS_FMT_YUYV10_1X20

MEDIA_BUS_FMT_YUYV12_1X24

> +	MEDIA_BUS_FMT_UYVY8_1X16,
> +	MEDIA_BUS_FMT_RGB101010_1X30,
> +	MEDIA_BUS_FMT_RGB121212_1X36,
> +	MEDIA_BUS_FMT_RGB565_1X16,
> +	MEDIA_BUS_FMT_RGB666_1X18,
> +	MEDIA_BUS_FMT_RGB888_1X24,
> +};
> +
> +static bool samsung_dsim_pixel_output_fmt_supported(u32 fmt)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(samsung_dsim_pixel_output_fmts); i++) {
> +		if (samsung_dsim_pixel_output_fmts[i] == fmt)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static u32 *
> +samsung_dsim_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +				       struct drm_bridge_state *bridge_state,
> +				       struct drm_crtc_state *crtc_state,
> +				       struct drm_connector_state *conn_state,
> +				       u32 output_fmt,
> +				       unsigned int *num_input_fmts)
> +{
> +	u32 *input_fmts;
> +
> +	if (!samsung_dsim_pixel_output_fmt_supported(output_fmt))
> +		return NULL;
> +
> +	*num_input_fmts = 1;

Shouldn't this be 6 ?

> +	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
> +	if (!input_fmts)
> +		return NULL;
> +
> +	input_fmts[0] = output_fmt;

Shouldn't this be a list of all 6 supported pixel formats ?

(replace 6 with 8 with the two new YUYV10/YUYV12 pixel formats above)
