Return-Path: <linux-samsung-soc+bounces-8996-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A276AEA71B
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 26 Jun 2025 21:43:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D383A16936F
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 26 Jun 2025 19:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD3C72F365B;
	Thu, 26 Jun 2025 19:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="YkbX+B7N"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98E92F0E43;
	Thu, 26 Jun 2025 19:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750966804; cv=none; b=f6IzEt+sfb914LCj8fevbbrV6NlgKzB1no1sXlM+CAhXsJBqn9cdJGIapwWV8vy5irlniIjlhh7sG/Q6M68cc2EbxsC90i7oHGkp5Czlpc0fe2xh7b8x+/reURAEOVSFep7ZXO/hAekbJnwvFkSMg1D6SDvc7XboAom7PFvdwMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750966804; c=relaxed/simple;
	bh=GFz8GkKryTB6Xu0DxINoUES7zgptK83SPB4c1G1dUGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZqnWJTKBsjRFR3P48tTtIzyN5767Kl2SKy+7wK20lgmgsELFf7TKUegX7ccZU/gdectmvXWUsTaZu1KIEMkE6mN56uKsGIRqtTO4HcMPDQlyEymei6IoKLcE55lVpVlhoRYf+EbZ37WEduBdFeLb7AAxcd1fZGukJNSlzMwN9o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=YkbX+B7N; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 79B8A25E97;
	Thu, 26 Jun 2025 21:40:01 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lr6zwaKAxDRo; Thu, 26 Jun 2025 21:39:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750966799; bh=GFz8GkKryTB6Xu0DxINoUES7zgptK83SPB4c1G1dUGw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YkbX+B7NqB9bqO/BI/VoQpccYZxSmU3ohY20QM0pAoHBEPXqx+5+OiycnrS7Oxjdl
	 OBeLqWLl/UuaEDlHbrP/jdTJt1+CzewGov+iMpj0lVRePneAGFyBPAMjXjMGePcFJd
	 ZxFBox5h0pItnhJHYUghSuvS0Arq2RMARzpxK3h8qOuwK0OtQaldHFGk+7XDKMfewA
	 5Ie9WcCvhNK6ulMR7Ue1U1FYpJiyD2SPtNquEY5AJ2IZwFQJ5/v6xnA9mHBQBb5LGU
	 bb2yKj+XCCAlK5fvuRwi8yiELGj7Iy+QtnHeuW9TgFgAUJQ0lsqxxA/ga88PLO+YxV
	 ne63s68I+/TnA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 27 Jun 2025 01:08:53 +0530
Subject: [PATCH v2 04/13] drm/bridge: samsung-dsim: allow configuring bits
 and offsets of CLKCTRL register
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-exynos7870-dsim-v2-4-1433b67378d3@disroot.org>
References: <20250627-exynos7870-dsim-v2-0-1433b67378d3@disroot.org>
In-Reply-To: <20250627-exynos7870-dsim-v2-0-1433b67378d3@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750966738; l=7642;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=GFz8GkKryTB6Xu0DxINoUES7zgptK83SPB4c1G1dUGw=;
 b=xvcZUCyqGrAXkr0gJlGqc14YPhPdr0VXs+NHSl6rX6F2tCNM7oVSTtarvc9ZU0pApwZDdestu
 P6vQG6irOGLDpex4/saNyBDMQXvBdAOaiMP5jqjXXwzg8lS/onNiU10
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

DSIM_CLKCTRL bit and offset values hardcoded in the driver:

name                      | bit/offset value
--------------------------+-----------------
DSIM_LANE_ESC_CLK_EN_CLK  | 19
DSIM_LANE_ESC_CLK_EN_DATA | 20
DSIM_BYTE_CLKEN           | 24
DSIM_ESC_CLKEN            | 28
DSIM_TX_REQUEST_HSCLK     | 31

DSIM_CLKCTRL bit and offset values in Exynos7870 DSIM as per downstream
kernel sources:

name                      | bit/offset value
--------------------------+-----------------
DSIM_LANE_ESC_CLK_EN_CLK  | 8
DSIM_LANE_ESC_CLK_EN_DATA | 9
DSIM_BYTE_CLKEN           | 17
DSIM_ESC_CLKEN            | 16
DSIM_TX_REQUEST_HSCLK     | 20

In order to support both, move all values to the driver data struct and
define it for every driver compatible. Reference the values from there
instead, in functions wherever required.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 76 +++++++++++++++++++++++++----------
 include/drm/bridge/samsung-dsim.h     |  5 +++
 2 files changed, 59 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 112d558579d8f987c695e1704a5772ebbadfd625..c85c7c3af74ebce9732f9531ba5c31d992a19a23 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -45,17 +45,13 @@
 #define DSIM_BTA_TIMEOUT(x)		((x) << 16)
 
 /* DSIM_CLKCTRL */
-#define DSIM_ESC_PRESCALER(x)		(((x) & 0xffff) << 0)
-#define DSIM_ESC_PRESCALER_MASK		(0xffff << 0)
-#define DSIM_LANE_ESC_CLK_EN_CLK	BIT(19)
-#define DSIM_LANE_ESC_CLK_EN_DATA(x)	(((x) & 0xf) << 20)
-#define DSIM_LANE_ESC_CLK_EN_DATA_MASK	(0xf << 20)
-#define DSIM_BYTE_CLKEN			BIT(24)
-#define DSIM_BYTE_CLK_SRC(x)		(((x) & 0x3) << 25)
-#define DSIM_BYTE_CLK_SRC_MASK		(0x3 << 25)
-#define DSIM_PLL_BYPASS			BIT(27)
-#define DSIM_ESC_CLKEN			BIT(28)
-#define DSIM_TX_REQUEST_HSCLK		BIT(31)
+#define DSIM_ESC_PRESCALER(x)			(((x) & 0xffff) << 0)
+#define DSIM_ESC_PRESCALER_MASK			(0xffff << 0)
+#define DSIM_LANE_ESC_CLK_EN_DATA(x, offset)	(((x) & 0xf) << offset)
+#define DSIM_LANE_ESC_CLK_EN_DATA_MASK(offset)	(0xf << offset)
+#define DSIM_BYTE_CLK_SRC(x)			(((x) & 0x3) << 25)
+#define DSIM_BYTE_CLK_SRC_MASK			(0x3 << 25)
+#define DSIM_PLL_BYPASS				BIT(27)
 
 /* DSIM_CONFIG */
 #define DSIM_LANE_EN_CLK		BIT(0)
@@ -420,6 +416,11 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.esc_clken_bit = 28,
+	.byte_clken_bit = 24,
+	.tx_req_hsclk_bit = 31,
+	.lane_esc_clk_bit = 19,
+	.lane_esc_data_offset = 20,
 	.pll_p_offset = 13,
 	.reg_values = reg_values,
 	.pll_fin_min = 6,
@@ -440,6 +441,11 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.esc_clken_bit = 28,
+	.byte_clken_bit = 24,
+	.tx_req_hsclk_bit = 31,
+	.lane_esc_clk_bit = 19,
+	.lane_esc_data_offset = 20,
 	.pll_p_offset = 13,
 	.reg_values = reg_values,
 	.pll_fin_min = 6,
@@ -458,6 +464,11 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.esc_clken_bit = 28,
+	.byte_clken_bit = 24,
+	.tx_req_hsclk_bit = 31,
+	.lane_esc_clk_bit = 19,
+	.lane_esc_data_offset = 20,
 	.pll_p_offset = 13,
 	.reg_values = reg_values,
 	.pll_fin_min = 6,
@@ -476,6 +487,11 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
+	.esc_clken_bit = 28,
+	.byte_clken_bit = 24,
+	.tx_req_hsclk_bit = 31,
+	.lane_esc_clk_bit = 19,
+	.lane_esc_data_offset = 20,
 	.pll_p_offset = 13,
 	.reg_values = exynos5433_reg_values,
 	.pll_fin_min = 6,
@@ -494,6 +510,11 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
 	.num_bits_resol = 12,
+	.esc_clken_bit = 28,
+	.byte_clken_bit = 24,
+	.tx_req_hsclk_bit = 31,
+	.lane_esc_clk_bit = 19,
+	.lane_esc_data_offset = 20,
 	.pll_p_offset = 13,
 	.reg_values = exynos5422_reg_values,
 	.pll_fin_min = 6,
@@ -512,6 +533,11 @@ static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
+	.esc_clken_bit = 28,
+	.byte_clken_bit = 24,
+	.tx_req_hsclk_bit = 31,
+	.lane_esc_clk_bit = 19,
+	.lane_esc_data_offset = 20,
 	/*
 	 * Unlike Exynos, PLL_P(PMS_P) offset 14 is used in i.MX8M Mini/Nano/Plus
 	 * downstream driver - drivers/gpu/drm/bridge/sec-dsim.c
@@ -715,6 +741,7 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 
 static int samsung_dsim_enable_clock(struct samsung_dsim *dsi)
 {
+	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
 	unsigned long hs_clk, byte_clk, esc_clk, pix_clk;
 	unsigned long esc_div;
 	u32 reg;
@@ -748,15 +775,17 @@ static int samsung_dsim_enable_clock(struct samsung_dsim *dsi)
 		hs_clk, byte_clk, esc_clk);
 
 	reg = samsung_dsim_read(dsi, DSIM_CLKCTRL_REG);
-	reg &= ~(DSIM_ESC_PRESCALER_MASK | DSIM_LANE_ESC_CLK_EN_CLK
-			| DSIM_LANE_ESC_CLK_EN_DATA_MASK | DSIM_PLL_BYPASS
-			| DSIM_BYTE_CLK_SRC_MASK);
-	reg |= DSIM_ESC_CLKEN | DSIM_BYTE_CLKEN
-			| DSIM_ESC_PRESCALER(esc_div)
-			| DSIM_LANE_ESC_CLK_EN_CLK
-			| DSIM_LANE_ESC_CLK_EN_DATA(BIT(dsi->lanes) - 1)
-			| DSIM_BYTE_CLK_SRC(0)
-			| DSIM_TX_REQUEST_HSCLK;
+	reg &= ~(DSIM_ESC_PRESCALER_MASK | BIT(driver_data->lane_esc_clk_bit)
+		| DSIM_LANE_ESC_CLK_EN_DATA_MASK(driver_data->lane_esc_data_offset)
+		| DSIM_PLL_BYPASS
+		| DSIM_BYTE_CLK_SRC_MASK);
+	reg |= BIT(driver_data->esc_clken_bit) | BIT(driver_data->byte_clken_bit)
+		| DSIM_ESC_PRESCALER(esc_div)
+		| BIT(driver_data->lane_esc_clk_bit)
+		| DSIM_LANE_ESC_CLK_EN_DATA(BIT(dsi->lanes) - 1,
+					    driver_data->lane_esc_data_offset)
+		| DSIM_BYTE_CLK_SRC(0)
+		| BIT(driver_data->tx_req_hsclk_bit);
 	samsung_dsim_write(dsi, DSIM_CLKCTRL_REG, reg);
 
 	return 0;
@@ -860,11 +889,14 @@ static void samsung_dsim_set_phy_ctrl(struct samsung_dsim *dsi)
 
 static void samsung_dsim_disable_clock(struct samsung_dsim *dsi)
 {
+	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
 	u32 reg;
 
 	reg = samsung_dsim_read(dsi, DSIM_CLKCTRL_REG);
-	reg &= ~(DSIM_LANE_ESC_CLK_EN_CLK | DSIM_LANE_ESC_CLK_EN_DATA_MASK
-			| DSIM_ESC_CLKEN | DSIM_BYTE_CLKEN);
+	reg &= ~(BIT(driver_data->lane_esc_clk_bit)
+		| DSIM_LANE_ESC_CLK_EN_DATA_MASK(driver_data->lane_esc_data_offset)
+		| BIT(driver_data->esc_clken_bit)
+		| BIT(driver_data->byte_clken_bit));
 	samsung_dsim_write(dsi, DSIM_CLKCTRL_REG, reg);
 
 	reg = samsung_dsim_read(dsi, DSIM_PLLCTRL_REG);
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index 3641c57557f42fd90cd2e8c0282f69dbe36ba2de..8938eccf78730019e0404101c855dc2d7d225668 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -63,6 +63,11 @@ struct samsung_dsim_driver_data {
 	unsigned int wait_for_hdr_fifo;
 	unsigned int wait_for_reset;
 	unsigned int num_bits_resol;
+	unsigned int esc_clken_bit;
+	unsigned int byte_clken_bit;
+	unsigned int tx_req_hsclk_bit;
+	unsigned int lane_esc_clk_bit;
+	unsigned int lane_esc_data_offset;
 	unsigned int pll_p_offset;
 	const unsigned int *reg_values;
 	unsigned int pll_fin_min;

-- 
2.49.0


