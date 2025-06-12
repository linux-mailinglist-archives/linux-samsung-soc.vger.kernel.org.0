Return-Path: <linux-samsung-soc+bounces-8756-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4BBAD760E
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 12 Jun 2025 17:29:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B54273B7162
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 12 Jun 2025 15:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 974F62DECAC;
	Thu, 12 Jun 2025 15:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="TRt79YF+"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24D32DCC15;
	Thu, 12 Jun 2025 15:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749741622; cv=none; b=t5iq+wUiMBuzRuWX+Skkbi2Us+Ud/PfPShK3uz4aWjeq2iEQCMARdSlNfN2qxUS5cMu3gHeB+0pvPx5P+Bs4XG44cCiC3Hgv3oh1VgEC46+ZFNiKRuz4h3uEAGKUVrRHp3QyHoJ762kDcRw67seVOl27Zo/usHVdghc1l1Ti++Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749741622; c=relaxed/simple;
	bh=YjHKXoGS9lM5GhA05KViUVsqZivIimAtQJUNBJMlZPA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fj0rhaR5bTUqXWn36YtKzfbvrM9AOmq/1AAmdv18k9veMiVH/+XeS/ZZOXddepUmLxkcYSXIEcy2XiYXe0KM5zA6L73L1N6aAOxjJ0MjxgnH4676BMYw1ssJHRUXTBJ4hVBvyg9WImmAdOb9YgdfWAckYy0vOqKRqkTrF0R6ohM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=TRt79YF+; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6F09525FB6;
	Thu, 12 Jun 2025 17:20:19 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tcELlw7S0eog; Thu, 12 Jun 2025 17:20:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749741613; bh=YjHKXoGS9lM5GhA05KViUVsqZivIimAtQJUNBJMlZPA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TRt79YF+PS3Os8Z++ofYAvsVOHcRXhlBRFiW1q9t4J7dZEHTujYCJnomfWyoeTNLr
	 AmOZ0pRISL43vGHj51ZMNIaeG+gdG1MQIb1OpRE843BvVolFk2BzQXnJUIH+BXoKtw
	 DOHMnYhHPafxht/8GoUqKb7u7iAiG91P3P9qVDdzEiiSXWGnXOVmml83wVDMufx+7s
	 i5LoXXQuLBzPI9SpGVzihCvLqNOVpmfH01Oge4bGQVgOJh6ZUPyfMcvYyncagf9/Pr
	 tDLr+ONs6FvgEMUuOZj43hzMdakkqbogMYUcs6yvyToyTg3NGY4xqZ/oiGSCWxFuu4
	 Mle7m1Clj0b1g==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 12 Jun 2025 20:48:15 +0530
Subject: [PATCH 11/12] drm/bridge: samsung-dsim: add driver support for
 exynos7870 DSIM bridge
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-exynos7870-dsim-v1-11-1a330bca89df@disroot.org>
References: <20250612-exynos7870-dsim-v1-0-1a330bca89df@disroot.org>
In-Reply-To: <20250612-exynos7870-dsim-v1-0-1a330bca89df@disroot.org>
To: Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749741499; l=4373;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=YjHKXoGS9lM5GhA05KViUVsqZivIimAtQJUNBJMlZPA=;
 b=wGhAuhziFS6IYeZJ62M7MY8r4R43oQKU+dXrxo0McfmoMd1W5bQwl5Br2ZWQrb2l7EgzLO/+8
 eJX20SR58v1AnwvB6rqDEiXnde4qSPvMJfi6nQw5xRQbGFjaWncQ6O+
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Add support for Exynos7870's DSIM IP block in the bridge driver.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 74 +++++++++++++++++++++++++++++++++++
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 75 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 50dcdb9b81f68098936fbb3f121a0010b11cd8dd..446fe1f42d7f81986307891485805aacea55a1b9 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -311,6 +311,32 @@ static const unsigned int exynos5433_reg_ofs[] = {
 	[DSIM_PHYTIMING2_REG] = 0xBC,
 };
 
+static const unsigned int exynos7870_reg_ofs[] = {
+	[DSIM_LINK_STATUS_REG] = 0x04,
+	[DSIM_DPHY_STATUS_REG] = 0x08,
+	[DSIM_SWRST_REG] = 0x0C,
+	[DSIM_CLKCTRL_REG] = 0x10,
+	[DSIM_TIMEOUT_REG] = 0x14,
+	[DSIM_ESCMODE_REG] = 0x1C,
+	[DSIM_MDRESOL_REG] = 0x20,
+	[DSIM_MVPORCH_REG] = 0x24,
+	[DSIM_MHPORCH_REG] = 0x28,
+	[DSIM_MSYNC_REG] = 0x2C,
+	[DSIM_CONFIG_REG] = 0x30,
+	[DSIM_INTSRC_REG] = 0x34,
+	[DSIM_INTMSK_REG] = 0x38,
+	[DSIM_PKTHDR_REG] = 0x3C,
+	[DSIM_PAYLOAD_REG] = 0x40,
+	[DSIM_RXFIFO_REG] = 0x44,
+	[DSIM_SFRCTRL_REG] = 0x48,
+	[DSIM_FIFOCTRL_REG] = 0x4C,
+	[DSIM_PLLCTRL_REG] = 0x94,
+	[DSIM_PHYCTRL_REG] = 0xA4,
+	[DSIM_PHYTIMING_REG] = 0xB4,
+	[DSIM_PHYTIMING1_REG] = 0xB8,
+	[DSIM_PHYTIMING2_REG] = 0xBC,
+};
+
 enum reg_value_idx {
 	RESET_TYPE,
 	PLL_TIMER,
@@ -383,6 +409,24 @@ static const unsigned int exynos5433_reg_values[] = {
 	[PHYTIMING_HS_TRAIL] = DSIM_PHYTIMING2_HS_TRAIL(0x0c),
 };
 
+static const unsigned int exynos7870_reg_values[] = {
+	[RESET_TYPE] = DSIM_SWRST,
+	[PLL_TIMER] = 80000,
+	[STOP_STATE_CNT] = 0xa,
+	[PHYCTRL_ULPS_EXIT] = DSIM_PHYCTRL_ULPS_EXIT(0x177),
+	[PHYCTRL_VREG_LP] = 0,
+	[PHYCTRL_SLEW_UP] = 0,
+	[PHYTIMING_LPX] = DSIM_PHYTIMING_LPX(0x07),
+	[PHYTIMING_HS_EXIT] = DSIM_PHYTIMING_HS_EXIT(0x0c),
+	[PHYTIMING_CLK_PREPARE] = DSIM_PHYTIMING1_CLK_PREPARE(0x08),
+	[PHYTIMING_CLK_ZERO] = DSIM_PHYTIMING1_CLK_ZERO(0x2b),
+	[PHYTIMING_CLK_POST] = DSIM_PHYTIMING1_CLK_POST(0x0d),
+	[PHYTIMING_CLK_TRAIL] = DSIM_PHYTIMING1_CLK_TRAIL(0x09),
+	[PHYTIMING_HS_PREPARE] = DSIM_PHYTIMING2_HS_PREPARE(0x09),
+	[PHYTIMING_HS_ZERO] = DSIM_PHYTIMING2_HS_ZERO(0x0f),
+	[PHYTIMING_HS_TRAIL] = DSIM_PHYTIMING2_HS_TRAIL(0x0c),
+};
+
 static const unsigned int imx8mm_dsim_reg_values[] = {
 	[RESET_TYPE] = DSIM_SWRST,
 	[PLL_TIMER] = 500,
@@ -544,6 +588,35 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.min_freq = 500,
 };
 
+static const struct samsung_dsim_driver_data exynos7870_dsi_driver_data = {
+	.reg_ofs = exynos7870_reg_ofs,
+	.plltmr_reg = 0xa0,
+	.has_clklane_stop = 1,
+	.has_sfrctrl = 1,
+	.num_clks = 4,
+	.max_freq = 1500,
+	.wait_for_hdr_fifo = 0,
+	.wait_for_reset = 1,
+	.num_bits_resol = 12,
+	.video_mode_bit = 18,
+	.pll_stable_bit = 24,
+	.esc_clken_bit = 16,
+	.byte_clken_bit = 17,
+	.tx_req_hsclk_bit = 20,
+	.lane_esc_clk_bit = 8,
+	.lane_esc_data_offset = 9,
+	.pll_p_offset = 13,
+	.pll_m_offset = 3,
+	.pll_s_offset = 0,
+	.main_vsa_offset = 16,
+	.reg_values = exynos7870_reg_values,
+	.pll_fin_min = 6,
+	.pll_fin_max = 12,
+	.m_min = 41,
+	.m_max = 125,
+	.min_freq = 500,
+};
+
 static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
 	.reg_ofs = exynos5433_reg_ofs,
 	.plltmr_reg = 0xa0,
@@ -583,6 +656,7 @@ samsung_dsim_types[DSIM_TYPE_COUNT] = {
 	[DSIM_TYPE_EXYNOS5410] = &exynos5_dsi_driver_data,
 	[DSIM_TYPE_EXYNOS5422] = &exynos5422_dsi_driver_data,
 	[DSIM_TYPE_EXYNOS5433] = &exynos5433_dsi_driver_data,
+	[DSIM_TYPE_EXYNOS7870] = &exynos7870_dsi_driver_data,
 	[DSIM_TYPE_IMX8MM] = &imx8mm_dsi_driver_data,
 	[DSIM_TYPE_IMX8MP] = &imx8mm_dsi_driver_data,
 };
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index 2dd63032d83ab5df0e1780a692789c340c2126dc..842cbb44f5a803191a9b2f6252846bc8b848bb4f 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -29,6 +29,7 @@ enum samsung_dsim_type {
 	DSIM_TYPE_EXYNOS5410,
 	DSIM_TYPE_EXYNOS5422,
 	DSIM_TYPE_EXYNOS5433,
+	DSIM_TYPE_EXYNOS7870,
 	DSIM_TYPE_IMX8MM,
 	DSIM_TYPE_IMX8MP,
 	DSIM_TYPE_COUNT,

-- 
2.49.0


