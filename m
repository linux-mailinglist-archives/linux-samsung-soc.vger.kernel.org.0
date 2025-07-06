Return-Path: <linux-samsung-soc+bounces-9163-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB76AFA718
	for <lists+linux-samsung-soc@lfdr.de>; Sun,  6 Jul 2025 20:28:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D3093A4F4D
	for <lists+linux-samsung-soc@lfdr.de>; Sun,  6 Jul 2025 18:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4071929E102;
	Sun,  6 Jul 2025 18:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="SnMoag0U"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C061917FB;
	Sun,  6 Jul 2025 18:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751826426; cv=none; b=s0dk2gJsS96pTPBhuY1WvjafPIP1ntY/KBLePKYq8WJ+bbBCpbsCO3Uw/LEYheaqIgjCVM34DzutROq9G5Yj7Rb7EOl2PRiZgDZ3jL1Uf4ZdRgKSJqSnbxFgHPKxGVOhhBOp+Pkd16a4Dldan89rxEGjPHOhoknNUGhioyTpRZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751826426; c=relaxed/simple;
	bh=yV1S3LkR7pDpOCA3qlLl29yKKSgYL2avi9WcKPGccBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PdT3VXZTFhakZxkXeCynaueqgLSY/lQluDVpXcfuFUXiFE/qhXVm4CBTGe7qiO/E2CwhaKKREepeCt9nIDalywz3bUi4SK2t/pEHgHmJzrWFD9D/Hq7Hu7rFUJp8RGmxxg4mjNS3IXy6UqzaSpNOwlYkC0PTkrrivxg5LNQqnwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=SnMoag0U; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E501C20D0D;
	Sun,  6 Jul 2025 20:27:02 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lGao_ixhMOOV; Sun,  6 Jul 2025 20:27:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751826421; bh=yV1S3LkR7pDpOCA3qlLl29yKKSgYL2avi9WcKPGccBI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SnMoag0UteSaucE+3VMaTczLuOI1o77XlHmWMS9getHKDIPu5Z645XUI/+AgM0hPQ
	 IeeQqPzI1S1vhY86Wv56C2i5zCcwgT42/7Prgr/NASM4Vy2ukxhCCvfhZtPNSXCeMZ
	 5SADlyRMVF0zqhka+X6OKuqEIcehZkq3akjvaxr33h8xBfirBSxSNcetmw4ghK19ax
	 MYG88UIdbHrP/RlMQJybt4/l4sCA5Fn7VDw3/0eKejgu6ap49RkdDs2bKdjrMJ989o
	 q43GFEF34rXumWRP1IfiwyVsbJuoZWsYtTBoyRaQyLL9BT7lsKTMx+DQHDQyjT2L7/
	 p7GbNKrDLODmw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 06 Jul 2025 23:55:41 +0530
Subject: [PATCH v3 07/13] drm/bridge: samsung-dsim: allow configuring PLL_M
 and PLL_S offsets
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-exynos7870-dsim-v3-7-9879fb9a644d@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751826342; l=4314;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=yV1S3LkR7pDpOCA3qlLl29yKKSgYL2avi9WcKPGccBI=;
 b=vuJCOthkg2kn+REcxDKgtNYB7C1fv0oBJLRMxyMGVr1fd9vwsqah68ApQ/l4mt2R77Px2CAsl
 VMoFvsFCOYAD+6kBVF2Cemr8LN9HOoNHQkC1fiNHBm7YZvakzKAxm3T
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Currently, PLL_P offset of DSIM_PLLCTRL is configurable in the driver
data, while PLL_M and PLL_S offsets are hardcoded as 4-bit and 1-bit
offsets respectively, but Exynos7870's DSIM have them at 3-bit and 0-bit
offsets as per downstream kernel sources.

In order to support both, move both offset values to the driver data
struct and define it for every driver compatible. Reference the values
from there instead, in functions wherever required.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 21 ++++++++++++++++-----
 include/drm/bridge/samsung-dsim.h     |  2 ++
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 4ef052ea819cf9fdec9f72c920c04ecd4469e90c..d67fb857d0359b813c268a77c2a0f2c3574d6dc2 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -191,9 +191,7 @@
 #define DSIM_PLL_DPDNSWAP_DAT		(1 << 24)
 #define DSIM_FREQ_BAND(x)		((x) << 24)
 #define DSIM_PLL_EN			BIT(23)
-#define DSIM_PLL_P(x, offset)		((x) << (offset))
-#define DSIM_PLL_M(x)			((x) << 4)
-#define DSIM_PLL_S(x)			((x) << 1)
+#define DSIM_PLL(x, offset)		((x) << (offset))
 
 /* DSIM_PHYCTRL */
 #define DSIM_PHYCTRL_ULPS_EXIT(x)	(((x) & 0x1ff) << 0)
@@ -423,6 +421,8 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.lane_esc_clk_bit = 19,
 	.lane_esc_data_offset = 20,
 	.pll_p_offset = 13,
+	.pll_m_offset = 4,
+	.pll_s_offset = 1,
 	.main_vsa_offset = 22,
 	.reg_values = reg_values,
 	.pll_fin_min = 6,
@@ -451,6 +451,8 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.lane_esc_clk_bit = 19,
 	.lane_esc_data_offset = 20,
 	.pll_p_offset = 13,
+	.pll_m_offset = 4,
+	.pll_s_offset = 1,
 	.main_vsa_offset = 22,
 	.reg_values = reg_values,
 	.pll_fin_min = 6,
@@ -477,6 +479,8 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.lane_esc_clk_bit = 19,
 	.lane_esc_data_offset = 20,
 	.pll_p_offset = 13,
+	.pll_m_offset = 4,
+	.pll_s_offset = 1,
 	.main_vsa_offset = 22,
 	.reg_values = reg_values,
 	.pll_fin_min = 6,
@@ -503,6 +507,8 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.lane_esc_clk_bit = 19,
 	.lane_esc_data_offset = 20,
 	.pll_p_offset = 13,
+	.pll_m_offset = 4,
+	.pll_s_offset = 1,
 	.main_vsa_offset = 22,
 	.reg_values = exynos5433_reg_values,
 	.pll_fin_min = 6,
@@ -529,6 +535,8 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.lane_esc_clk_bit = 19,
 	.lane_esc_data_offset = 20,
 	.pll_p_offset = 13,
+	.pll_m_offset = 4,
+	.pll_s_offset = 1,
 	.main_vsa_offset = 22,
 	.reg_values = exynos5422_reg_values,
 	.pll_fin_min = 6,
@@ -559,6 +567,8 @@ static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
 	 * downstream driver - drivers/gpu/drm/bridge/sec-dsim.c
 	 */
 	.pll_p_offset = 14,
+	.pll_m_offset = 4,
+	.pll_s_offset = 1,
 	.main_vsa_offset = 22,
 	.reg_values = imx8mm_dsim_reg_values,
 	.pll_fin_min = 2,
@@ -710,8 +720,9 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 	writel(driver_data->reg_values[PLL_TIMER],
 	       dsi->reg_base + driver_data->plltmr_reg);
 
-	reg = DSIM_PLL_EN | DSIM_PLL_P(p, driver_data->pll_p_offset) |
-	      DSIM_PLL_M(m) | DSIM_PLL_S(s);
+	reg = DSIM_PLL_EN | DSIM_PLL(p, driver_data->pll_p_offset)
+			  | DSIM_PLL(m, driver_data->pll_m_offset)
+			  | DSIM_PLL(s, driver_data->pll_s_offset);
 
 	if (driver_data->has_freqband) {
 		static const unsigned long freq_bands[] = {
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index 9d11c3e39fe532b83d4bc3d7f950645bbb8970b3..000ada3ece4d61c61412be550a8ccc13bd3f777e 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -71,6 +71,8 @@ struct samsung_dsim_driver_data {
 	unsigned int lane_esc_clk_bit;
 	unsigned int lane_esc_data_offset;
 	unsigned int pll_p_offset;
+	unsigned int pll_m_offset;
+	unsigned int pll_s_offset;
 	unsigned int main_vsa_offset;
 	const unsigned int *reg_values;
 	unsigned int pll_fin_min;

-- 
2.49.0


