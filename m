Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E88264A3FD
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 12 Dec 2022 16:18:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232253AbiLLPSH (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 12 Dec 2022 10:18:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231721AbiLLPSG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 12 Dec 2022 10:18:06 -0500
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7865D6445
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Dec 2022 07:18:03 -0800 (PST)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20221212151759euoutp010a7b7af4d7407644edc071ed7084a9ee~wFMC-Ck0g2764127641euoutp01w
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Dec 2022 15:17:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20221212151759euoutp010a7b7af4d7407644edc071ed7084a9ee~wFMC-Ck0g2764127641euoutp01w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1670858279;
        bh=XRQ/mERfNuUjxn8ATPeNApa3vPStbxnJs63jZRvB3hs=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=gQm3f/5QI1K1gIOw/+2nVNbBHggZUa6etjluupRo/MSX9i3+n2AXDKhzu2yV5jo5L
         Y+/BzVdvysJrse8j5tTXkE8xjnqXFCqx+c1iGoAvH3+lCvGUsWXWMxJQvXjIAthLNa
         jdeKQrfGRFruNo0wqrD3dX1ucY4xYistc2jr6F3Y=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20221212151759eucas1p21f1ef7dfa09f3baeb07401be2a581ef3~wFMCQ_6ZL0443304433eucas1p2N;
        Mon, 12 Dec 2022 15:17:59 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 0E.34.09549.62647936; Mon, 12
        Dec 2022 15:17:58 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20221212151758eucas1p2819cc8f9d3abe95709a0dcf4aaf43ae9~wFMBi6IlX1545415454eucas1p2V;
        Mon, 12 Dec 2022 15:17:58 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20221212151758eusmtrp2000ad7226c00e7a4ee5fbfca2b78cf94~wFMBiCdzn2956629566eusmtrp2N;
        Mon, 12 Dec 2022 15:17:58 +0000 (GMT)
X-AuditID: cbfec7f5-f5dff7000000254d-a0-6397462634a1
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 71.DC.09026.62647936; Mon, 12
        Dec 2022 15:17:58 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20221212151756eusmtip27ee2f6ff911a137a968d74d69610442c~wFMAQMmps2221722217eusmtip2t;
        Mon, 12 Dec 2022 15:17:56 +0000 (GMT)
Message-ID: <6c60f751-5252-b630-62af-e3927220e9c0@samsung.com>
Date:   Mon, 12 Dec 2022 16:17:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
        Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v9 03/18] drm: exynos: dsi: Restore proper bridge chain
 order
Content-Language: en-US
To:     Jagan Teki <jagan@amarulasolutions.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
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
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Marek Vasut <marex@denx.de>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20221209152343.180139-4-jagan@amarulasolutions.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0xTVxze6X1wqSlcWx5HfMw0ATfm8DGDZw+JROcum9mWuGQyh9iUOyBr
        wbWCYPYoukJXHpYWeVyGkMBGrXEGZA04JtAZHpKW4VbCtFhRNgVRBEpkNJPRXtz473v8fvm+
        88uhMHEFGUGlZxxjVRkyhZQU4tbuvx0vR+2rkG+t6Y5Frpv9GHLXz+LowU0ziX6fmyJR8XcO
        AhndBhx5mg0kun9rEEf2k5MB6JvShgDUaLhCoua7QwTSL5zDUOXAFQGazM8DqP/ORQxdy9Pi
        6HrZLySa4UaXXNM4iQZ7ZzD0xGvHdocxF6bdBHOW68WZst6rBOMoGiGZNm4kgKnWVRFMffu4
        gLnqrCcY11A7ybgLewTMpYavmKZHrQKmpMUCmNnmDe8HfSR8I4VVpGezqi1xR4Rp3s4u7Kgp
        LIfznsc14JxYDwIpSO+AXUYHqQdCSkybAbzTZwU88QD4p2ZYwJPZJcesw56ttCw2YbzRCOCE
        qXt5fxrApq9LBL4pER0Hx/6qIn0YpyNhb557WV8N+6rGcB8OpVNgZ5t9SacoCX0A2oy7fDJG
        h8MbY7X+5BD6AgFLvi/yB2C+gKL5UX8Nkt4G9Q/1/oBAOh7WuiyA334envqx2l8P0iVCaKqt
        Jvnee2FbeSPBYwmc6GkJ4PE6uNjGx0G6AMA6r3uZGADU3LsB+KnXocuxQPq6YvSL8OLlLbwc
        D7X/lAKfDOkgOPxwNV8iCBqtFRgvi6Auf/naUZDr+eG/2K5fr2MGIOVW3IVbcQBuxXO4/3Pr
        AG4B4WyWWpnKql/JYI/HqGVKdVZGaow8U9kMlv5u/9OeuVZgnpiOsQEBBWwAUpg0RBT5Qrlc
        LEqR5Z5gVZnJqiwFq7aBtRQuDReZy3RyMZ0qO8Z+yrJHWdUzV0AFRmgENY+Hvz1Y9HOe9uPg
        S/mt4sD9l3clRO0JWnNYht3vOF6XYKlOllTs3PxugaEgnHo1+6f2wvH1r+2MnT5hPbAJbncW
        f6hYXLt9zYPK7g7mFFZ7N6zGWZnbEZK+PuQPY/Lkqg/0J5/m7M+RNCo8p98+k0NPOa8ppdGD
        5FTi4901ntA0421zcTa38QuFaQ84HO+01bvmlW8Osm48esazkFCpHbq39TnN597I2b5gneXg
        WGJ/F7NJYg5Oihy99Zk16Z1O95PbhaWJxMbRVZNxhxbPfmk/orbLM3PL8zd/8lvEgMkzonpr
        w3tgXcuOM4RUG+raF7u3NXXePt/w0kRS7KGB83OP0qS4Ok22LRpTqWX/Ah+P2IkqBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJKsWRmVeSWpSXmKPExsVy+t/xe7pqbtOTDaaf4rC4c/s0s8X9xZ9Z
        LF7fXsFmceXrezaL3qXnWC0m3Z/AYvFl0wQ2ixf3LrJYnG16w27ROXEJu8XyCfvYLDY9vsZq
        0fVrJbPFjPP7mCzetDUyWpx+tJ7Z4lRjK4vFpSmH2Sw+zXoIlJ38ks3i4olPzBbff59ldhDz
        WPvxPqvHvFknWDymnDjC6nGu5y6bx85Zd9k9ZnfMZPVYvOclk8eRq4tZPe5c28Pmcb/7OJPH
        5iX1Hhvf7WDy6NuyitHj8ya5AL4oPZui/NKSVIWM/OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsj
        UyV9O5uU1JzMstQifbsEvYzfBw4yF0wWq5j1ezVLA+NKoS5GTg4JAROJLf83MncxcnEICSxl
        lNjw7w8TREJG4uS0BlYIW1jiz7UuNoii94wS0242sIAkeAXsJJ48m8kGYrMIqEqcaLzPBBEX
        lDg58wlYjahAikR7zz+gOAeHsECwxKFJtiBhZgFxiVtP5jOBzBQR2MwqsffdBDCHWeAjo8Sl
        yVvYIbadZpTY/n4p2AY2AUOJrrddYDangKPE/DurGCFGmUl0be2CsuUlmrfOZp7AKDQLySGz
        kGychaRlFpKWBYwsqxhFUkuLc9Nzi430ihNzi0vz0vWS83M3MQLTzLZjP7fsYFz56qPeIUYm
        DsZDjBIczEoivKoa05KFeFMSK6tSi/Lji0pzUosPMZoCQ2Mis5Rocj4w0eWVxBuaGZgamphZ
        GphamhkrifN6FnQkCgmkJ5akZqemFqQWwfQxcXBKNTD5PlizbX7t71/PdsrorTVK+fU9/6Lb
        RP/OLdkZvj+3tFv+WGAb0nqJ73laXPDhSQ4V3LNV3ulMnL00MFmjk1+l/uvCU/JnrszviOTc
        fm5rbmfy0z8XbUyXOfa92qjxcGXMzLty2f9qRDfdyJM143zfvFeuy4nF1HTSwyXn89foSU8y
        enW2zYDX/oqBR/307qzyo/vmXdw5xbVU4oX0jBcZSvbtRhZLFCVOWbquPTg3cGqwjdZd/ooF
        XwVfv5xwROP13MfpHVVudmfv2a6aFnzJvLp+170Hv177HkhatuSrh47SPgejQluF46vML7tz
        aFk1r9qp8CTXotf8WYavYU5DxKxa0U4HRs8M/ZPGHq5KLMUZiYZazEXFiQA4fdz+vAMAAA==
X-CMS-MailID: 20221212151758eucas1p2819cc8f9d3abe95709a0dcf4aaf43ae9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20221209152522eucas1p2d4331673beb0c49a1afcc9822ca40000
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221209152522eucas1p2d4331673beb0c49a1afcc9822ca40000
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
        <CGME20221209152522eucas1p2d4331673beb0c49a1afcc9822ca40000@eucas1p2.samsung.com>
        <20221209152343.180139-4-jagan@amarulasolutions.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 09.12.2022 16:23, Jagan Teki wrote:
> From: Marek Szyprowski <m.szyprowski@samsung.com>
>
> Restore the proper bridge chain by finding the previous bridge
> in the chain instead of passing NULL.
>
> This establishes a proper bridge chain while attaching downstream
> bridges.
>
> v9, v4:
> * none
>
> v3:
> * new patch
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---

As we are resurrecting this patch, one more change is needed here:

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c 
b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index e5b1540c4ae4..9d10a89d28f1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1713,6 +1713,7 @@ static int exynos_dsi_probe(struct platform_device 
*pdev)
         dsi->bridge.funcs = &exynos_dsi_bridge_funcs;
         dsi->bridge.of_node = dev->of_node;
         dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
+       dsi->bridge.pre_enable_prev_first = true;

         ret = component_add(dev, &exynos_dsi_component_ops);
         if (ret)


On Exynos5433 Exynos DSI is together with Exynos MIC in the bridge 
chain: Decon -> MIC -> DSI -> Panel.

To ensure proper order of initialization we need to mark our bridge 
driver also with the pre_enable_prev_first flag. This would also need to 
be added to patch "[PATCH v9 06/18] drm: bridge: Generalize Exynos-DSI 
driver into a Samsung DSIM bridge".


>   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index ec673223d6b7..e5b1540c4ae4 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1428,7 +1428,8 @@ static int exynos_dsi_attach(struct drm_bridge *bridge,
>   {
>   	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
>   
> -	return drm_bridge_attach(bridge->encoder, dsi->out_bridge, NULL, flags);
> +	return drm_bridge_attach(bridge->encoder, dsi->out_bridge, bridge,
> +				 flags);
>   }
>   
>   static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
> @@ -1474,7 +1475,10 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>   
>   	drm_bridge_add(&dsi->bridge);
>   
> -	drm_bridge_attach(encoder, &dsi->bridge, NULL, 0);
> +	drm_bridge_attach(encoder, &dsi->bridge,
> +			  list_first_entry_or_null(&encoder->bridge_chain,
> +						   struct drm_bridge,
> +						   chain_node), 0);
>   
>   	/*
>   	 * This is a temporary solution and should be made by more generic way.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

