Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A389E57BADA
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 20 Jul 2022 17:53:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbiGTPxW (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 20 Jul 2022 11:53:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiGTPxV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 20 Jul 2022 11:53:21 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B5C14BD18
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Jul 2022 08:53:20 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id n4-20020a17090a73c400b001f1e87432c2so2646983pjk.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Jul 2022 08:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QxR6CUOwwWEjMcW3mif4HEJmZlAI1+6I4LruC075u5Y=;
        b=GkZXTRM+UVefP5k4OwsF140G9crKAV/V/JVCy2Ea1fAj3nc/qpJPSdSlyrit+okO4O
         cDf0UoGpzhh61Sxc57RaLxVpBAyiHRM1c/YDKfOTRkq2PyY3Gud5qmvFRDP0xtACn4sN
         O4S7HYNr9sGMN+Ntp8FF1FHFIrutVDHM6nUy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QxR6CUOwwWEjMcW3mif4HEJmZlAI1+6I4LruC075u5Y=;
        b=mOGLgANA8bqV6T0SePn+5bWOxUWxLqizxJ6mnlaoVwMxLT53xuDuk6T+glzmue8TIv
         IBROteplIizMGk/iYw/ggNXQyZQ/taS9X+jTJNT0TCLcYBzxGLLPH2EXB5huBolK/nmQ
         /fd2Lq7tbAhcXBIeRErV6o56598Eknqqgpc8x8gb0dHzFcx57Zq2D53H+37mXeAYm5Qx
         QE/kSiq4bR13Nnuplkuam/BNRdytvTptlC2HmQ9GDYvyQ75BiR/JcbEiWBlxrgj9L3jw
         sHUIdGOQbtIMopXQBO7lZucvw7b/Me6d6L2CLlvnZzi/OrZrR/kY5cQY2GJUld2ddO7q
         jUoQ==
X-Gm-Message-State: AJIora+qE9XJcL/BHyHdobFW/gHSJjr6iFrQch2PiU7gqxUtNpU8VrM/
        x2X3eXcaAHW2fuus4qKziiQlfg==
X-Google-Smtp-Source: AGRyM1uPiDP7h7UWMqmKKgE/5fBEmPp6YbpTJx1Z+Nc08lqFIzPL5n7tTSO6OAR87FzxpIcruqX2/g==
X-Received: by 2002:a17:90b:1e53:b0:1f0:2a08:e101 with SMTP id pi19-20020a17090b1e5300b001f02a08e101mr6356268pjb.208.1658332399980;
        Wed, 20 Jul 2022 08:53:19 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:d177:d5:aee:4f03])
        by smtp.gmail.com with ESMTPSA id a8-20020a170902710800b0015e8d4eb1d7sm13919198pll.33.2022.07.20.08.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 08:53:19 -0700 (PDT)
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
        Neil Armstrong <narmstrong@baylibre.com>,
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
Subject: [PATCH v3 07/13] drm: bridge: samsung-dsim: Fix PLL_P (PMS_P) offset
Date:   Wed, 20 Jul 2022 21:22:04 +0530
Message-Id: <20220720155210.365977-8-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220720155210.365977-1-jagan@amarulasolutions.com>
References: <20220720155210.365977-1-jagan@amarulasolutions.com>
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

The i.MX 8M Mini Applications Processor Reference Manual, Rev. 3, 11/2020
with 13.7.10.1 Master PLL PMS Value setting Register mentioned PMS_P offset
range from BIT[18-13] and the upstream driver is using the same offset.

However, offset 13 is not working on i.MX8M Mini platforms but downstream
NXP driver is using 14 [1] and it is working with i.MX8M Mini SoC.

Not sure about whether it is reference manual documentation or something
else but this patch trusts the downstream code and fixes the PLL_P offset.

[1] https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/gpu/drm/bridge/sec-dsim.c?h=imx_5.4.47_2.2.0#n211

v3, v2:
* none

v1:
* updated commit message
* add downstream driver link

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 10 ++++++++--
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index b07909a52f2d..5eb594ea0bdf 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -168,7 +168,7 @@
 /* DSIM_PLLCTRL */
 #define DSIM_FREQ_BAND(x)		((x) << 24)
 #define DSIM_PLL_EN			(1 << 23)
-#define DSIM_PLL_P(x)			((x) << 13)
+#define DSIM_PLL_P(x, offset)		((x) << (offset))
 #define DSIM_PLL_M(x)			((x) << 4)
 #define DSIM_PLL_S(x)			((x) << 1)
 
@@ -368,6 +368,7 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.max_freq = 1000,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.pll_p_offset = 13,
 	.reg_values = reg_values,
 	.quirks = DSIM_QUIRK_PLAT_DATA,
 };
@@ -381,6 +382,7 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.max_freq = 1000,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.pll_p_offset = 13,
 	.reg_values = reg_values,
 	.quirks = DSIM_QUIRK_PLAT_DATA,
 };
@@ -392,6 +394,7 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.max_freq = 1000,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.pll_p_offset = 13,
 	.reg_values = reg_values,
 	.quirks = DSIM_QUIRK_PLAT_DATA,
 };
@@ -404,6 +407,7 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.max_freq = 1500,
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
+	.pll_p_offset = 13,
 	.reg_values = exynos5433_reg_values,
 	.quirks = DSIM_QUIRK_PLAT_DATA,
 };
@@ -416,6 +420,7 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.max_freq = 1500,
 	.wait_for_reset = 1,
 	.num_bits_resol = 12,
+	.pll_p_offset = 13,
 	.reg_values = exynos5422_reg_values,
 	.quirks = DSIM_QUIRK_PLAT_DATA,
 };
@@ -563,7 +568,8 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 	writel(driver_data->reg_values[PLL_TIMER],
 			dsi->reg_base + driver_data->plltmr_reg);
 
-	reg = DSIM_PLL_EN | DSIM_PLL_P(p) | DSIM_PLL_M(m) | DSIM_PLL_S(s);
+	reg = DSIM_PLL_EN | DSIM_PLL_P(p, driver_data->pll_p_offset) |
+	      DSIM_PLL_M(m) | DSIM_PLL_S(s);
 
 	if (driver_data->has_freqband) {
 		static const unsigned long freq_bands[] = {
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index 97fdee5ef5df..c852d7b9981e 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -46,6 +46,7 @@ struct samsung_dsim_driver_data {
 	unsigned int max_freq;
 	unsigned int wait_for_reset;
 	unsigned int num_bits_resol;
+	unsigned int pll_p_offset;
 	const unsigned int *reg_values;
 	enum samsung_dsim_quirks quirks;
 };
-- 
2.25.1

