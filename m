Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0102D5FFC0E
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 15 Oct 2022 23:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbiJOVhO (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 15 Oct 2022 17:37:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiJOVhO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 15 Oct 2022 17:37:14 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B1FA43336
        for <linux-samsung-soc@vger.kernel.org>; Sat, 15 Oct 2022 14:37:13 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id BA69084C60;
        Sat, 15 Oct 2022 23:37:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1665869832;
        bh=uRbP9Pbodg+ge1e9KjYY/y4+n4ffCzR8RDLeg56nY7I=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=WRgNp22zaL9hseJbLU8PNwQDlqTwV7UBy3YEi1v94gh2I1mGcaq2VLY/1g+4553Ze
         VtouUnVtCFAjcrHY2WlEjchZ98ffPDUDhzNaH6QqFFZN9JOtBDnBhUrIac7qtME2KJ
         3KPWxCZSoukXTxk8fwIY/pqyPt+9hshjJJCwWsL1XwgRNuSKSboTPuyQoOQmIWP6pL
         Q/L04k6ZCjQUOC3ttidCApAO2G/IPn25bSNMB8xBZZjSWE87SNeil9fX1wNTHdv+Cq
         KBLY2qKQPDWvc3YAYVmiGPmrfQCE+fw0VdCIKqQ3JDYnGVKJxJBPWHveVQz6pys2yz
         dvdb9e5B8bn2Q==
Message-ID: <90ab7268-ca93-0598-e09b-258030654545@denx.de>
Date:   Sat, 15 Oct 2022 23:37:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v7 08/10] drm: bridge: samsung-dsim: Add input_bus_flags
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
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <20221005151309.7278-9-jagan@amarulasolutions.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20221005151309.7278-9-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/5/22 17:13, Jagan Teki wrote:

[...]

> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index f714e49c1eab..f5cd80641cea 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1601,6 +1601,10 @@ static const struct samsung_dsim_host_ops samsung_dsim_generic_host_ops = {
>   	.unregister_host = samsung_dsim_unregister_host,
>   };
>   
> +static const struct drm_bridge_timings samsung_dsim_bridge_timings = {
> +	.input_bus_flags = DRM_BUS_FLAG_DE_LOW,
> +};
> +
>   int samsung_dsim_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -1681,6 +1685,7 @@ int samsung_dsim_probe(struct platform_device *pdev)
>   
>   	dsi->bridge.funcs = &samsung_dsim_bridge_funcs;
>   	dsi->bridge.of_node = dev->of_node;
> +	dsi->bridge.timings = &samsung_dsim_bridge_timings;

Is this really valid on Exynos too ?

My impression is that the DE_LOW requirement is only needed for MX8MM/MN 
where the LCDIF-DSIM glue logic inverts the HS/VS/DE signals, while on 
all other platforms (at least MX8MP) the inversion does not take place, 
so DE is really active HIGH there.
