Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B157A62D286
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 17 Nov 2022 06:01:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234427AbiKQFBg (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 17 Nov 2022 00:01:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238891AbiKQFBb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 17 Nov 2022 00:01:31 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ADEF6586E
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Nov 2022 21:01:20 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 30DD4851C0;
        Thu, 17 Nov 2022 06:01:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1668661278;
        bh=gLAm34Il3ocYB/w2bZE0g2ejwzA6wbkpm5k6qiv0Bso=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=kpKBtrerdgN040cjagqDdxouzIe0gGGoMqeOmLzbyyGLJU2cRF5+PkGbfLw2xtWg8
         GkqTEfQMBbpvCZgdJEW+VUOHArvcVBKDVU9A5lh8cwT1FIgH3Y4bBGPa46v5OT92KP
         SB8f3QGXMDDJBA6mvJiDQWB2R6npybwM+wi/nNU4nkDmzyUehiZ/31TqpQThzBgWmg
         wdwjs9QFrtDzGT44g67GwK3JulMibgwL62I6tPMw3PKQxPUKvIh+iNhlHqXVPu6pT8
         uS8iL2yMdjnS39/JCKLH5bNC/Sy7yt80V9a1/QjRFjqqx8eo5o2qRPWJt/IxoA49n9
         ARV6aKhZYgMWA==
Message-ID: <47ed3aae-308a-3b13-93c5-e31a3024f3a0@denx.de>
Date:   Thu, 17 Nov 2022 06:01:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v8 03/14] drm: bridge: Generalize Exynos-DSI driver into a
 Samsung DSIM bridge
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
 <20221110183853.3678209-4-jagan@amarulasolutions.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20221110183853.3678209-4-jagan@amarulasolutions.com>
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

[...]

> +static int samsung_dsim_wait_for_hdr_fifo(struct samsung_dsim *dsi)
> +{
> +	int timeout = 2000;
> +
> +	do {
> +		u32 reg = samsung_dsim_read(dsi, DSIM_FIFOCTRL_REG);
> +
> +		if (!(reg & DSIM_SFR_HEADER_FULL))

Seems that unless I wait for DSIM_SFR_HEADER_EMPTY here, there may be 
some command transfer corruption if very short commands are transferred 
in rapid succession. This can be triggered with icn6211 driver for example.

> +			return 0;
> +
> +		if (!cond_resched())
> +			usleep_range(950, 1050);
> +	} while (--timeout);
> +
> +	return -ETIMEDOUT;
> +}

[...]

