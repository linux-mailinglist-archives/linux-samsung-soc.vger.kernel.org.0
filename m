Return-Path: <linux-samsung-soc+bounces-9168-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87828AFA723
	for <lists+linux-samsung-soc@lfdr.de>; Sun,  6 Jul 2025 20:28:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20C6F189BAA8
	for <lists+linux-samsung-soc@lfdr.de>; Sun,  6 Jul 2025 18:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58ECC2BCF4A;
	Sun,  6 Jul 2025 18:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="cOem0uTu"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867F929E11D;
	Sun,  6 Jul 2025 18:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751826492; cv=none; b=NkLMIwZ4oom+aoH4y4gRFeMI/xtm3s50v1htXM1sjG5M2/8u6tmzIGqLaK6bycZpMTBC+rtBmZwytMd402Com5ridJvgUE6IIinPxFAJHKm0frWoRPpzmKAv90ntkhA7ERc5fXRvnMYhITA1FyER7KRbhmmoV2V3DgKGCqeHBok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751826492; c=relaxed/simple;
	bh=rdvOHTwEYMIGYf2BU402AK0xb5Ny1TbepuIZM7PW2P8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TyOotWXVaQiWt7BYoCX0dAp+yoeRAM6oGR20lQmJg+5pqFaG6JR8sHAPJdyidHGaDU1cWE0lp5UP5/ig1dUGdtwVPEi0grQnM9G/+VE1g7bt4FqG3y02Lxw7ay427Jiev1tWJ6kFGNalBcfyZUEz2ijCyUDBxAdZWG/c+1Rbbg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=cOem0uTu; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 48D7125B63;
	Sun,  6 Jul 2025 20:28:09 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZOZ-bn7qsTrC; Sun,  6 Jul 2025 20:28:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751826488; bh=rdvOHTwEYMIGYf2BU402AK0xb5Ny1TbepuIZM7PW2P8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=cOem0uTup6Eypof+O/hS+s6uh0iz+oE+q7gLJ2Kmc7FaKDLOcpiAMQYuiU0f3V8fP
	 YB6gdXaq+C6gIR6gMoFtHCkRXJEJetUkuk6CpGEGkP8+dGKR+D71Z14k1dR6PQWVxC
	 ZymCpQP6HIu352uVrhcfzyns201XUjYeoNv0/n06GJLJZChg6W9GPrRWc4aYO/8Tfe
	 ssR4JDaeZJX47MMje77chCg+QiRHUw1rXIgriKN9cqaEEeuuUYyNX1qf5Y2JJo3Wx+
	 2dyUjxObZwT7aO9kAQojBlUsA1Otlnog9qLWekLA30wJFr9FfbmldMgcpjZWAsqoRE
	 6EfwiR5Pocb1g==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 06 Jul 2025 23:55:46 +0530
Subject: [PATCH v3 12/13] drm/bridge: samsung-dsim: add driver support for
 exynos7870 DSIM bridge
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-exynos7870-dsim-v3-12-9879fb9a644d@disroot.org>
References: <20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org>
In-Reply-To: <20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751826342; l=4847;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=rdvOHTwEYMIGYf2BU402AK0xb5Ny1TbepuIZM7PW2P8=;
 b=eocA6E3lZ1Ho6yUG9/Hdx1mmN2ceovg/v6WUkS/EpfgCDxtUipMyXURQtBjFWeNSmaI2O4Qkf
 KScS0VbdFYhBc8FzqbwqKZ/YliTzUNo+L/k4MEx5YvD89+b9UK5Jv0q
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Add support for Exynos7870's DSIM IP block in the bridge driver.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 82 +++++++++++++++++++++++++++++++++++
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 83 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index b6b3bbcbd0f438e5e1d3faf18f8c2d532a4ecc93..a51c473545f02a543b88f5b52eed6427c7313ec2 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -244,6 +244,13 @@ static struct clk_bulk_data exynos5433_clk_bulk_data[] = {
 	{ .id = "sclk_rgb_vclk_to_dsim0" },
 };
 
+static struct clk_bulk_data exynos7870_clk_bulk_data[] = {
+	{ .id = "bus" },
+	{ .id = "pll" },
+	{ .id = "byte" },
+	{ .id = "esc" },
+};
+
 enum reg_idx {
 	DSIM_STATUS_REG,	/* Status register (legacy) */
 	DSIM_LINK_STATUS_REG,	/* Link status register */
@@ -320,6 +327,32 @@ static const unsigned int exynos5433_reg_ofs[] = {
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
@@ -392,6 +425,24 @@ static const unsigned int exynos5433_reg_values[] = {
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
@@ -563,6 +614,36 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.min_freq = 500,
 };
 
+static const struct samsung_dsim_driver_data exynos7870_dsi_driver_data = {
+	.reg_ofs = exynos7870_reg_ofs,
+	.plltmr_reg = 0xa0,
+	.has_clklane_stop = 1,
+	.has_sfrctrl = 1,
+	.clk_data = exynos7870_clk_bulk_data,
+	.num_clks = ARRAY_SIZE(exynos7870_clk_bulk_data),
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
@@ -604,6 +685,7 @@ samsung_dsim_types[DSIM_TYPE_COUNT] = {
 	[DSIM_TYPE_EXYNOS5410] = &exynos5_dsi_driver_data,
 	[DSIM_TYPE_EXYNOS5422] = &exynos5422_dsi_driver_data,
 	[DSIM_TYPE_EXYNOS5433] = &exynos5433_dsi_driver_data,
+	[DSIM_TYPE_EXYNOS7870] = &exynos7870_dsi_driver_data,
 	[DSIM_TYPE_IMX8MM] = &imx8mm_dsi_driver_data,
 	[DSIM_TYPE_IMX8MP] = &imx8mm_dsi_driver_data,
 };
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index eb9fdbab1b34074923daa0aa0443c33c5b99ae42..31d7ed589233ce560767afa1877f4cc885bf41f3 100644
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


