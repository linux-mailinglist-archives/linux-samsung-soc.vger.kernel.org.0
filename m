Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 111DC755EE0
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 17 Jul 2023 11:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbjGQJAa (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 17 Jul 2023 05:00:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230206AbjGQJA0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 17 Jul 2023 05:00:26 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C39AAE54
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jul 2023 02:00:24 -0700 (PDT)
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 17B073F213
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jul 2023 09:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1689584423;
        bh=JHnHS0B61qcl/Td8/lm9RDjYsfSOyiiTTr5PsC3FWaA=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=cjjX2f3GtORdVHhLvdkR6dCrcMHr2MAIBKwmMJggdDi0YC0ppg2CIOlluoaHaSTIz
         vQGsS3jNDlod/gBW/5VbbnSgCuQ+puWs/Jl1aL61Zgy1WLCbHlSnSf10xf3kLcZksF
         a3rXvBlKYWjUQBiV/HBZZMjjklEO/klZTs/KPxHhJW2PXw56iup6y6WD1rOkmCYZPb
         sfBXpgI+98ReWm6tCDYMyIUQZE4IdlSLvKcFfyiYCWCfHze3APSRUtfZ6OXrDZ9mr7
         Cykz3l3jUEmHVUzM/oF7gLS/mpBfBGDfLLwGvNHKxLhOpMO6TeIxHviEit9yL3d5Qw
         cg9O5lPS6/zOA==
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-6b750bebc82so6284567a34.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jul 2023 02:00:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689584422; x=1692176422;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JHnHS0B61qcl/Td8/lm9RDjYsfSOyiiTTr5PsC3FWaA=;
        b=UjlA5FKxl5E9cBskWCS6Doltzl0tSY1r//3W7ZSaGeMRJU0rDYiiTPXj1HyYhez6/z
         tPyif56vPduiR4UhKvD1frxIxT/66p6kdb84q4OnOoZ0Qi1bv2td1tCoJSupe93c0Q1h
         dccYnf/AhKOfy1krWtnkA3Ydc+y3Z8k6xvs9kEKrHsjc0WWqPYuTCMYF0gbycCbFRiSd
         DX+zxg19i/TcuDk4+LNBznEtA8exPUAZdN/UWUiCMHUGKsylUu1SxRiFWABTZAqhtCps
         8MGrolJCTSGxWz/t2vG8TnWYllNINFIkdsfqh+rkisT+JLJpNJ3NiwernmrMRz3aymwk
         xB3w==
X-Gm-Message-State: ABy/qLYDGndWgkXfPwu8PQEORUUVNsIfPk+T67MEmQHhN8XeMTrG40Q0
        C5Do9KM4IFIPeNES3X+renrGWA67RoAEg4Zxq3Of5f38MBAmVEC6P84HwgXWQxsc2glrYhujKTr
        aOMMfMPjbEsNPL9jm/eLt3l+qzFLjNsfy/wOTchKBcZ9DGMkoru5gU3C3Q+wdaHHf
X-Received: by 2002:ac8:7c48:0:b0:403:2dfd:1fdf with SMTP id o8-20020ac87c48000000b004032dfd1fdfmr15892556qtv.23.1689584401493;
        Mon, 17 Jul 2023 02:00:01 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEMazgMYki8IR1CHHFS4st+/s+/y1hah0oj0+nBQlO+NhXDM06BTdCzgvWJM4HcjDSd4KVriXj5Pmlo8MNpIrE=
X-Received: by 2002:ac8:7c48:0:b0:403:2dfd:1fdf with SMTP id
 o8-20020ac87c48000000b004032dfd1fdfmr15892526qtv.23.1689584401259; Mon, 17
 Jul 2023 02:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230714174901.4062397-1-robh@kernel.org>
In-Reply-To: <20230714174901.4062397-1-robh@kernel.org>
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date:   Mon, 17 Jul 2023 10:59:45 +0200
Message-ID: <CAJM55Z_Eba-LKxKAH0i0_vDM6JO_HvWgDLCLFQDave2+UFLMzA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Explicitly include correct DT includes
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Chester Lin <clin@suse.com>, NXP S32 Linux Team <s32@nxp.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Damien Le Moal <dlemoal@kernel.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Daniel Mack <daniel@zonque.org>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Jianlong Huang <jianlong.huang@starfivetech.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dvorkin Dmitry <dvorkin@tibbo.com>,
        Wells Lu <wellslutw@gmail.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-oxnas@groups.io, linux-rockchip@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 14 Jul 2023 at 19:52, Rob Herring <robh@kernel.org> wrote:
>
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

>  drivers/pinctrl/starfive/pinctrl-starfive-jh7110-aon.c | 5 +----
>  drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c | 2 --
>  drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c     | 1 -

Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Thanks,
/Emil
