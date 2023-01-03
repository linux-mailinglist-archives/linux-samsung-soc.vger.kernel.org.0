Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5B4765BD79
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  3 Jan 2023 10:52:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233783AbjACJwB (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 3 Jan 2023 04:52:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237308AbjACJvw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Jan 2023 04:51:52 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72070EE13
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Jan 2023 01:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1672739509; x=1704275509;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HaOHD/dXS68xXURn+R9LoVsKFBSgwemRrONqLSwdBjc=;
  b=Zr4gBcp+jdxWfDmhId+yyMOz1bpb1FN4j8y4mqnGAwC+xYCVThC8eD0q
   Yl71nhPCCXtF4bGJDO8Mb1DvMe7h1vNqf5fqiqj5LJv7j28TgTgCMhV9z
   YjAJ6cOZACkFdMGZM2DvMlHFgfqC5DQuQf3lNlJPpqPW+yjOHtYaUojRY
   oW4tDrHUrniqeOmkzx5ceHISpTeGRniRHhByKq8RVnXoQhfcLZU492PV3
   LSMlvVLuU4doqru0G0RjxcogtO+YWTT5+atZpvILnnFbtk6DGgV/SLtU6
   JC1J7ZBdhfiGZyFEVyTKV5LhahFu0ze1LUFnJYJj0yDlAGgaFl4+zxRQ1
   A==;
X-IronPort-AV: E=Sophos;i="5.96,296,1665439200"; 
   d="scan'208";a="28217837"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 03 Jan 2023 10:51:47 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 03 Jan 2023 10:51:47 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 03 Jan 2023 10:51:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1672739507; x=1704275507;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HaOHD/dXS68xXURn+R9LoVsKFBSgwemRrONqLSwdBjc=;
  b=QHbb0E41O1umG0uCnQ5Fy6UNxUpCtrGLEIsoHgDmPE0hJgZtkwvbVJXt
   1cvAPJ17LC6UYdr1IOUOaJjUUbPgxJzw82NU7noJlVFT9HbSlIL230lmQ
   /vW24sKxbwcCCPpzJNnSmHD2g8+NQxnbe0Fuz+mhsRwB9AiUlTFQhdoc7
   35avELVf7SdtZbv/NswwojGUum+DRyFGZHYNIyxE2U4nm6m+7wxxCWY2m
   7VdQAE3y4/X1v6R/x9ZO+jr/sU6Q7TMyL2dtbYlQ7RB3oy4k/iy53t5nz
   X6t3zu5Q6FPa11K+zNZAopmR5GPK7S9gYAg9W4kWsdXGcrdC7lBDIpQY0
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,296,1665439200"; 
   d="scan'208";a="28217836"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 03 Jan 2023 10:51:47 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id C74FB280056;
        Tue,  3 Jan 2023 10:51:46 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
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
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        Marek Vasut <marex@denx.de>
Cc:     "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v10 00/18] drm: Add Samsung MIPI DSIM bridge
Date:   Tue, 03 Jan 2023 10:51:44 +0100
Message-ID: <1983452.PIDvDuAF1L@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <a6ad86a0-2831-34aa-2c2a-f6d683dc5713@denx.de>
References: <kcEE.rJtELH1tRkiK3DwrGM4cgg.ADqA2lER2QE@vtuxmail01.tq-net.de> <a6ad86a0-2831-34aa-2c2a-f6d683dc5713@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Marek,

Am Sonntag, 18. Dezember 2022, 00:55:57 CET schrieb Marek Vasut:
> On 12/16/22 14:25, Alexander Stein wrote:
> Hi,
> 
> [...]
> 
> > Oh, nice, thanks for the pointer. When setting
> > 
> >> samsung,burst-clock-frequency = <668250000>;
> > 
> > in imx8mm.dtsi
> > I get a non-flickering display using 4 lanes. Although admittedly this is
> > just random guessing. I'm not sure which clock exactly has to be in the
> > range CHA_DSI_CLK_RANGE is configured to. With 4 lanes SN65DSI84 is
> > configured for> 
> > 205-210 MHz (0x29), while I get these PLL PMS settings on DSIM:
> >> samsung-dsim 32e10000.dsi: PLL freq 668250000, (p 4, m 99, s 0)
> >> samsung-dsim 32e10000.dsi: hs_clk = 668250000, byte_clk = 83531250,
> >> esc_clk
> > 
> > = 16706250
> 
> If I recall it right, minimum PLL frequency is:
> 
> fPMS=1.2*width*height*bpp*fps=1.2*800*480*24*60=663.5 MHz
> 
> the link frequency is then
> 
> fHS=fPMS/lanes/2=82.9 MHz (on the DDR clock lane)

Mh, there is something bogus about this. Right now the PLL freq is set 
depending on 'samsung,burst-clock-frequency' property. But this actually is 
somehow depending on the number of lanes I configure. From the debug output 
hs_clk and PLL freq are identical. AFAICS there is also no divider from PLL to 
hs_clk in the register map.

> So DSI83 should be in the range of 80..85 MHz input clock if I calculate
> this right. Can you check what is the value of mode->clock, the
> mipi_dsi_panel_format_to_bpp() return value, ctx->dsi->lanes in dsi83
> sm65dsi83_get_dsi_range() ?

A working setup on a tianma,tm070jvhg33 display (1280x800) is:
> samsung-dsim 32e10000.dsi: PLL freq 891000000, (p 3, m 99, s 0)
> samsung-dsim 32e10000.dsi: hs_clk = 891000000, byte_clk = 111375000, esc_clk 
= 18562500
> sn65dsi83 2-002d: mode->clock: 68200
> sn65dsi83 2-002d: mode bpp: 24
> sn65dsi83 2-002d: ctx->dsi->lanes: 3
> sn65dsi83 2-002d: samsung_dsim_set_pll: 0x37

Calculating backwards, sn64dsi83 is expecting a clock in the range of 275-280 
MHz. But I fail to see a corresponding clock in the DSIM PLL configuration.

Best regards,
Alexander

> > AFAICS DSIM bridge is configurung hs_clk, byte_clk and esc_clk just from
> > DT
> > properties, while SN65DSI84 is using display mode and number of lanes.
> > 
> > Is it expected that the DSIM PLL frequencies are set in DT for a specific
> > bridge/display setup?
> 
> No, there should be negotiation between the host and bridge/panel, I
> tried to propose two variants, but they were all rejected.




