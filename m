Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 533806249BA
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 10 Nov 2022 19:41:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbiKJSlm (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 10 Nov 2022 13:41:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229757AbiKJSll (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Nov 2022 13:41:41 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B4151C916
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Nov 2022 10:41:40 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id v17so2219711plo.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Nov 2022 10:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hjviMJMFquemukmCld7+bjQzuHQnVpJu8jaKcC7GpZI=;
        b=Ga//SO59D/FZ3ZMvPhw7aIKdp3SD5kyDM8r/0wgCD+PGxyW94k8aBvdUvLFOlvxZN7
         9flCohieYTsQRuNfBBqAdfRhqdqh6mbGW0FnTyDtcgqQq5YLl4pYKZ0y36zB9Cl3Uspc
         8fWyZGqPW/wI6QvalCzmppT7JfbeOTGNsH2nY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hjviMJMFquemukmCld7+bjQzuHQnVpJu8jaKcC7GpZI=;
        b=lM/BXhIin+geSTTAvNQyEx9p6vznmqoG5JsgSTy6zj3vQuPFgg//pkq5O4j1Wv5BEX
         bS5wZKuU8eU54Q/u6FoDyPZegybBlLNbEClngTGMThAhjHoA/RR0/UE2RyICW2LzqNMk
         1kUlLxXTuUCscsuY6b38fkQJ17PPlo1BvWkVfhb9MzFaJriv7wwpw+XvG+UaP0GmgVZb
         qaUfObVAjQSAC/37mUTCdl1/xe3aPo7UHiJQ+LIb60/SJnn1xIF3Y2UNK55pojoBjY6k
         6kGhKOuGA851kxrGjmcNLuY6DNt5yurFes4ufgxVfJzyD9pG1/OrY3SA7qMWS9wdz+BF
         81fQ==
X-Gm-Message-State: ACrzQf2D/DIRyxX0TlgixgfJU55H9SCFnMxlwaqPXR1vgfC3uEBc4r94
        EYpZcUfPc3xEXMqFZph7irF+Fg==
X-Google-Smtp-Source: AMsMyM62G2Bu5LjB28rVFcadyMjRfvRPcFOUpz+MGkWW/I4UyF3AihsG+9Fp9Ya11sr/ilyhZY/+jA==
X-Received: by 2002:a17:90a:8c7:b0:214:e1:cad0 with SMTP id 7-20020a17090a08c700b0021400e1cad0mr52876577pjn.3.1668105700141;
        Thu, 10 Nov 2022 10:41:40 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:b5a4:486a:f07:f67e])
        by smtp.gmail.com with ESMTPSA id c2-20020a170903234200b001869efb722csm11635627plh.215.2022.11.10.10.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 10:41:39 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
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
        Marek Vasut <marex@denx.de>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v8 12/14] drm: bridge: samsung-dsim: Add i.MX8M Mini/Nano support
Date:   Fri, 11 Nov 2022 00:08:51 +0530
Message-Id: <20221110183853.3678209-13-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110183853.3678209-1-jagan@amarulasolutions.com>
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Samsung MIPI DSIM master can also be found in i.MX8M Mini/Nano SoC.

Add compatible and associated driver_data for it.

v8:
* fix and update the comment

v7, v6:
* none

v3:
* enable DSIM_QUIRK_FIXUP_SYNC_POL quirk

v5:
* [mszyprow] rebased and adjusted to the new driver initialization
* drop quirk

v4:
* none

v3:
* enable DSIM_QUIRK_FIXUP_SYNC_POL quirk

v2:
* collect Laurent r-b

v1:
* none

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 44 +++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 65f7d8522bc1..41aa998f5bc4 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -360,6 +360,24 @@ static const unsigned int exynos5433_reg_values[] = {
 	[PHYTIMING_HS_TRAIL] = DSIM_PHYTIMING2_HS_TRAIL(0x0c),
 };
 
+static const unsigned int imx8mm_dsim_reg_values[] = {
+	[RESET_TYPE] = DSIM_SWRST,
+	[PLL_TIMER] = 500,
+	[STOP_STATE_CNT] = 0xf,
+	[PHYCTRL_ULPS_EXIT] = 0,
+	[PHYCTRL_VREG_LP] = 0,
+	[PHYCTRL_SLEW_UP] = 0,
+	[PHYTIMING_LPX] = DSIM_PHYTIMING_LPX(0x06),
+	[PHYTIMING_HS_EXIT] = DSIM_PHYTIMING_HS_EXIT(0x0b),
+	[PHYTIMING_CLK_PREPARE] = DSIM_PHYTIMING1_CLK_PREPARE(0x07),
+	[PHYTIMING_CLK_ZERO] = DSIM_PHYTIMING1_CLK_ZERO(0x26),
+	[PHYTIMING_CLK_POST] = DSIM_PHYTIMING1_CLK_POST(0x0d),
+	[PHYTIMING_CLK_TRAIL] = DSIM_PHYTIMING1_CLK_TRAIL(0x08),
+	[PHYTIMING_HS_PREPARE] = DSIM_PHYTIMING2_HS_PREPARE(0x08),
+	[PHYTIMING_HS_ZERO] = DSIM_PHYTIMING2_HS_ZERO(0x0d),
+	[PHYTIMING_HS_TRAIL] = DSIM_PHYTIMING2_HS_TRAIL(0x0b),
+};
+
 static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.reg_ofs = exynos_reg_ofs,
 	.plltmr_reg = 0x50,
@@ -421,6 +439,22 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.reg_values = exynos5422_reg_values,
 };
 
+static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
+	.reg_ofs = exynos5433_reg_ofs,
+	.plltmr_reg = 0xa0,
+	.has_clklane_stop = 1,
+	.num_clks = 2,
+	.max_freq = 2100,
+	.wait_for_reset = 0,
+	.num_bits_resol = 12,
+	/*
+	 * Unlike Exynos, PLL_P(PMS_P) offset 14 is used in i.MX8M Mini/Nano/Plus
+	 * downstream driver - drivers/gpu/drm/bridge/sec-dsim.c
+	 */
+	.pll_p_offset = 14,
+	.reg_values = imx8mm_dsim_reg_values,
+};
+
 static const struct samsung_dsim_driver_data *
 samsung_dsim_types[SAMSUNG_DSIM_TYPE_COUNT] = {
 	[SAMSUNG_DSIM_TYPE_EXYNOS3250] = &exynos3_dsi_driver_data,
@@ -428,6 +462,7 @@ samsung_dsim_types[SAMSUNG_DSIM_TYPE_COUNT] = {
 	[SAMSUNG_DSIM_TYPE_EXYNOS5410] = &exynos5_dsi_driver_data,
 	[SAMSUNG_DSIM_TYPE_EXYNOS5422] = &exynos5422_dsi_driver_data,
 	[SAMSUNG_DSIM_TYPE_EXYNOS5433] = &exynos5433_dsi_driver_data,
+	[SAMSUNG_DSIM_TYPE_IMX8MM] = &imx8mm_dsi_driver_data,
 };
 
 static inline struct samsung_dsim *host_to_dsi(struct mipi_dsi_host *h)
@@ -1817,7 +1852,16 @@ const struct dev_pm_ops samsung_dsim_pm_ops = {
 };
 EXPORT_SYMBOL_GPL(samsung_dsim_pm_ops);
 
+static const struct samsung_dsim_plat_data samsung_dsim_imx8mm_pdata = {
+	.hw_type = SAMSUNG_DSIM_TYPE_IMX8MM,
+	.host_ops = &samsung_dsim_generic_host_ops,
+};
+
 static const struct of_device_id samsung_dsim_of_match[] = {
+	{
+		.compatible = "fsl,imx8mm-mipi-dsim",
+		.data = &samsung_dsim_imx8mm_pdata,
+	},
 	{ /* sentinel. */ }
 };
 MODULE_DEVICE_TABLE(of, samsung_dsim_of_match);
-- 
2.25.1

