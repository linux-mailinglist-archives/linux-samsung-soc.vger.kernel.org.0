Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E095677AC5
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 23 Jan 2023 13:24:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230344AbjAWMYV (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 23 Jan 2023 07:24:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229839AbjAWMYV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 07:24:21 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2449B7ED5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 04:24:20 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id lp10so8064354pjb.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 04:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9Y+6AYElVzmPLEEE0cyqelpoYne/+Yj3ASyLzLLBEM=;
        b=I4JqfJ1d7OS8H4P0qKF8lZBBfKLEmb8KS9NZGxv/X8G9JKRWyEKYsu1PURAlnkxVSg
         /1neoPdbTwyWwZLCZHD56ENYsDOIOBzs2Nq/EbwdawHEpcbxbPgdLQQ3zFOt7aVwFwGS
         hoaCBz5jO4bzpQoR8sMr6PfoBcOR8PN2xPA9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U9Y+6AYElVzmPLEEE0cyqelpoYne/+Yj3ASyLzLLBEM=;
        b=sSIRzG3TydchKjNmQwGNVC84ItReoSDraISNhWAtqjxL2wVE19qz2KE/bJ8G09c7E+
         T7JxP5jZiPpLllxR2WTIfP/HnpsAXdOJoktQUge5zXldFoeWJRVZUlClVOWmzFBOPhAC
         4G9aPA5Qs9+pEjR8vDYbGtAVaxhABfef4xFYf+QWGHkNqaE/ORFh0P3kbkkT7FlmQ/jt
         //h++zUDHYvm9XsgBnmH73LhZnh5637XTu9joQXiMRv6is/N2ZyW/qx6zCbkUS7+1Dr8
         CRrQCYc/Yqmc5lmOd/HKI1gBgmrGj3g43QUAe2tns2T1qGlY7y0b3qSv5dS7NWpxpw73
         qwiA==
X-Gm-Message-State: AFqh2koUwbbiezTLud2G9vp6TpI53fCw+7bOmFGOSZH4uobDOgUSPuSn
        Zvrp3s+BCK0it7uSDV7qgOo1Dw==
X-Google-Smtp-Source: AMrXdXukvO/K8Mcq3kYvwC9FrMf/hYzDTpQT9+5JXkCq0no1s3qE5FgDxEzRsDjyyd/uRgu/hXCYVQ==
X-Received: by 2002:a17:903:1c7:b0:194:ddea:2ebf with SMTP id e7-20020a17090301c700b00194ddea2ebfmr17540876plh.17.1674476659631;
        Mon, 23 Jan 2023 04:24:19 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
        by smtp.gmail.com with ESMTPSA id w10-20020a170902e88a00b001960806728asm1291811plg.88.2023.01.23.04.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 04:24:18 -0800 (PST)
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
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v11 06/18] drm: exynos: dsi: Add platform PLL_P (PMS_P) offset
Date:   Mon, 23 Jan 2023 17:53:07 +0530
Message-Id: <20230123122319.261341-7-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123122319.261341-1-jagan@amarulasolutions.com>
References: <20230123122319.261341-1-jagan@amarulasolutions.com>
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

Look like PLL PMS_P offset value varies between platforms that have
Samsung DSIM IP.

However, there is no clear evidence for it as both Exynos and i.MX
8M Mini Application Processor Reference Manual is still referring
the PMS_P offset as 13.

The offset 13 is not working for i.MX8M Mini SoCs but the downstream
NXP sec-dsim.c driver is using offset 14 for i.MX8M Mini SoC platforms
[1] [2].

PMS_P value set in sec_mipi_dsim_check_pll_out using PLLCTRL_SET_P()
with offset 13 and then an additional offset of one bit added in
sec_mipi_dsim_config_pll via PLLCTRL_SET_PMS().

Not sure whether it is reference manual documentation or something
else but this patch trusts the downstream code and handle PLL_P offset
via platform driver data so-that imx8mm driver data shall use
pll_p_offset to 14.

Similar to Mini the i.MX8M Nano/Plus also has P=14, unlike Exynos.

[1] https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/gpu/drm/bridge/sec-dsim.c?h=imx_5.4.47_2.2.0#n210
[2] https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/gpu/drm/bridge/sec-dsim.c?h=imx_5.4.47_2.2.0#n211

Reviewed-by: Marek Vasut <marex@denx.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v11, v10, v9:
- none
Changes for v8:
- updated commit message for 8M Nano/Plus
Changes for v7, v6:
- none
Changes for v5:
- updated clear commit message
Changes for v4, v3, v2:
- none
Changes for v1:
- updated commit message
- add downstream driver link

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 5918d31127aa..7a845badb1b2 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -194,7 +194,7 @@
 /* DSIM_PLLCTRL */
 #define DSIM_FREQ_BAND(x)		((x) << 24)
 #define DSIM_PLL_EN			(1 << 23)
-#define DSIM_PLL_P(x)			((x) << 13)
+#define DSIM_PLL_P(x, offset)		((x) << (offset))
 #define DSIM_PLL_M(x)			((x) << 4)
 #define DSIM_PLL_S(x)			((x) << 1)
 
@@ -263,6 +263,7 @@ struct exynos_dsi_driver_data {
 	unsigned int max_freq;
 	unsigned int wait_for_reset;
 	unsigned int num_bits_resol;
+	unsigned int pll_p_offset;
 	const unsigned int *reg_values;
 };
 
@@ -471,6 +472,7 @@ static const struct exynos_dsi_driver_data exynos3_dsi_driver_data = {
 	.max_freq = 1000,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.pll_p_offset = 13,
 	.reg_values = reg_values,
 };
 
@@ -483,6 +485,7 @@ static const struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
 	.max_freq = 1000,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.pll_p_offset = 13,
 	.reg_values = reg_values,
 };
 
@@ -493,6 +496,7 @@ static const struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
 	.max_freq = 1000,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.pll_p_offset = 13,
 	.reg_values = reg_values,
 };
 
@@ -504,6 +508,7 @@ static const struct exynos_dsi_driver_data exynos5433_dsi_driver_data = {
 	.max_freq = 1500,
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
+	.pll_p_offset = 13,
 	.reg_values = exynos5433_reg_values,
 };
 
@@ -515,6 +520,7 @@ static const struct exynos_dsi_driver_data exynos5422_dsi_driver_data = {
 	.max_freq = 1500,
 	.wait_for_reset = 1,
 	.num_bits_resol = 12,
+	.pll_p_offset = 13,
 	.reg_values = exynos5422_reg_values,
 };
 
@@ -628,7 +634,8 @@ static unsigned long exynos_dsi_set_pll(struct exynos_dsi *dsi,
 	writel(driver_data->reg_values[PLL_TIMER],
 			dsi->reg_base + driver_data->plltmr_reg);
 
-	reg = DSIM_PLL_EN | DSIM_PLL_P(p) | DSIM_PLL_M(m) | DSIM_PLL_S(s);
+	reg = DSIM_PLL_EN | DSIM_PLL_P(p, driver_data->pll_p_offset) |
+	      DSIM_PLL_M(m) | DSIM_PLL_S(s);
 
 	if (driver_data->has_freqband) {
 		static const unsigned long freq_bands[] = {
-- 
2.25.1

