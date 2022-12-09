Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C838764857E
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  9 Dec 2022 16:28:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230468AbiLIP2Q (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 9 Dec 2022 10:28:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230471AbiLIP15 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Dec 2022 10:27:57 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B68932E9EA
        for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Dec 2022 07:27:48 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id jn7so5195789plb.13
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Dec 2022 07:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vW9M8s0Vbvr7hHyCYd21b5KP7VTw4GLG2GncUlEkbew=;
        b=NyjM87Fw1znhbUtkTX8bX/aSJ515F1qoxZq895EWlcvLl/oQI3o4uJX5uZZr5tIeGb
         jKbKxjDD2LLCA0FLQq+fN46AiZ686YowlSFLix0kSQ6OxN13pzYItAkJcQDWQn3zMHf4
         gL1cbeARQ7juB5+C0ou2pq8OFYYS5yqBSuCgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vW9M8s0Vbvr7hHyCYd21b5KP7VTw4GLG2GncUlEkbew=;
        b=wdZ8IaBi+6l8c20eKJzvVPWdblMj0FyQWTyuznFkljKwex+RJsi+crdZeKrXBuS8Ug
         t96mEswIJWEnQKXJI96qQEh/NcJK+WmZAdAFWMPsTl3F/0x2dk5LlHLBsJcglxUt8ivZ
         /m78WKs21woXD6k1JBcWHW/plyc4uk5oWBgSa58erVqRjeFoTgoV2B+Tjl/Sd2tg/wb+
         d36r0YXCuGoAoDitSz+/51ZFCXg8R9ToYB9btuCMJNQB4n+XL6e2ELZNgfzxMmMpHnYX
         S/w6PL0ALNMVRakm9BARTfVLujjpR9DYuSLRFzGrGeQfzuYLH3morDobVxHQNK+CqLWm
         n/mA==
X-Gm-Message-State: ANoB5pk70dEAeoRCg4BXm5FZhIeCorjvLyVvo87Z3+NfkJCHkbYzH9PV
        mlXOsuYbQPZR4pamlGoajblI0A==
X-Google-Smtp-Source: AA0mqf6lDnzLDqv+LJEzSJh3VXV+6beDMGziJ58tM0raeBEJGuy15tVGywik7bFInGC4ZSBn6kmvtQ==
X-Received: by 2002:a17:902:e743:b0:185:4880:91bc with SMTP id p3-20020a170902e74300b00185488091bcmr7928096plf.60.1670599668115;
        Fri, 09 Dec 2022 07:27:48 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:6ba1:bbda:c542:ba0b])
        by smtp.gmail.com with ESMTPSA id x14-20020a170902ec8e00b00188c5f0f9e9sm1477587plg.199.2022.12.09.07.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 07:27:47 -0800 (PST)
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
Subject: [PATCH v9 12/18] drm: bridge: samsung-dsim: Add platform PLL_P (PMS_P) offset
Date:   Fri,  9 Dec 2022 20:53:37 +0530
Message-Id: <20221209152343.180139-13-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221209152343.180139-1-jagan@amarulasolutions.com>
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
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

Not sure whether it is reference manual documentation or something else
but this patch trusts the downstream code and handle PLL_P offset via
platform driver data so-that imx8mm driver data shall use pll_p_offset
to 14.

Similar to Mini the i.MX8M Nano/Plus also has P=14, unlike Exynos.

[1] https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/gpu/drm/bridge/sec-dsim.c?h=imx_5.4.47_2.2.0#n210
[2] https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/gpu/drm/bridge/sec-dsim.c?h=imx_5.4.47_2.2.0#n211

v9:
* none

v8:
* updated commit message for 8M Nano/Plus

v7, v6:
* none

v5:
* updated clear commit message

v4, v3, v2:
* none

v1:
* updated commit message
* add downstream driver link

Reviewed-by: Marek Vasut <marex@denx.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 10 ++++++++--
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index c79f7dc49e17..9203116f1efb 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -184,7 +184,7 @@
 /* DSIM_PLLCTRL */
 #define DSIM_FREQ_BAND(x)		((x) << 24)
 #define DSIM_PLL_EN			(1 << 23)
-#define DSIM_PLL_P(x)			((x) << 13)
+#define DSIM_PLL_P(x, offset)		((x) << (offset))
 #define DSIM_PLL_M(x)			((x) << 4)
 #define DSIM_PLL_S(x)			((x) << 1)
 
@@ -384,6 +384,7 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.max_freq = 1000,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.pll_p_offset = 13,
 	.reg_values = reg_values,
 };
 
@@ -396,6 +397,7 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.max_freq = 1000,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.pll_p_offset = 13,
 	.reg_values = reg_values,
 };
 
@@ -406,6 +408,7 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.max_freq = 1000,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.pll_p_offset = 13,
 	.reg_values = reg_values,
 };
 
@@ -417,6 +420,7 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.max_freq = 1500,
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
+	.pll_p_offset = 13,
 	.reg_values = exynos5433_reg_values,
 };
 
@@ -428,6 +432,7 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.max_freq = 1500,
 	.wait_for_reset = 1,
 	.num_bits_resol = 12,
+	.pll_p_offset = 13,
 	.reg_values = exynos5422_reg_values,
 };
 
@@ -559,7 +564,8 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 	writel(driver_data->reg_values[PLL_TIMER],
 			dsi->reg_base + driver_data->plltmr_reg);
 
-	reg = DSIM_PLL_EN | DSIM_PLL_P(p) | DSIM_PLL_M(m) | DSIM_PLL_S(s);
+	reg = DSIM_PLL_EN | DSIM_PLL_P(p, driver_data->pll_p_offset) |
+	      DSIM_PLL_M(m) | DSIM_PLL_S(s);
 
 	if (driver_data->has_freqband) {
 		static const unsigned long freq_bands[] = {
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index 0c5a905f3de7..df3d030daec6 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -53,6 +53,7 @@ struct samsung_dsim_driver_data {
 	unsigned int max_freq;
 	unsigned int wait_for_reset;
 	unsigned int num_bits_resol;
+	unsigned int pll_p_offset;
 	const unsigned int *reg_values;
 };
 
-- 
2.25.1

