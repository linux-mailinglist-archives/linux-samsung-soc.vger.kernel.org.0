Return-Path: <linux-samsung-soc+bounces-6529-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C71BA26500
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  3 Feb 2025 21:43:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F615188BBBB
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  3 Feb 2025 20:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D390820E6E7;
	Mon,  3 Feb 2025 20:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Zg/jxgRz"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3FE20FAA0;
	Mon,  3 Feb 2025 20:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738615257; cv=none; b=kn9WBldD0yd6hR6Tfn2ZCA8geKv+lrm3cEx/TWNWAWYg8iHK/p02NsGLxxWeYzpEWznhOkZakL/DGk47tQHVx+es/0g26tDSxleVr7KSGkpJ5Vkp1WuQioyKV/ibf4qYJhHm4OOvflMgCLE0VYrML2GaDIxai51kP1kzDxoaeYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738615257; c=relaxed/simple;
	bh=wt2GHvwQc8oyS/a94zlZqsI73cR1u9EzFQZlaA/5+ZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OSX+nYVanoWIn22o89mE4c1+fTl4jvb8bjQQbhkwtPwPEv21TsTXPURblHO3T7ugVFsdcRJe5MTL4WsgFFZXZXmuR3bSWHCBTL9x3r6IeVhNMMTfScXWuMigvUre1XSBFHUo9u3YGLje6BpxD/sf2xMhLdQh6TDOoLVRo0EAN2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Zg/jxgRz; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 03CC725C59;
	Mon,  3 Feb 2025 21:40:54 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3blw3TwI0hZa; Mon,  3 Feb 2025 21:40:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738615252; bh=wt2GHvwQc8oyS/a94zlZqsI73cR1u9EzFQZlaA/5+ZU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Zg/jxgRznMkz2a2RdPlY5Lo0N6vCZuL3AC4b3Kl/oWwzGfnGcUSlPUrJ7B2vFYm8Z
	 C6S5GNRWMqY9KiBw9yK8C+pylfgIotqkSN4rjKDZCPlBUJpcQOrYdoC45YiauFAibb
	 jrfUpoDLdQxLVsvWiAa6Gpw2705qnCC7OVXLuYSlg79unG16X8o9Q9Xsu8eTz265Wf
	 n+ZTqCuUscAq/4D61IdwYGQ+zcav//hr6dzTQSxvnQufT4pgqGNdeJ2IpIjgMjZis6
	 cWzD9wd8LmKeQtCmnFNstioo2BPy1E11GkOdJ7PRRzb6L3XFeAXeADlKGYYLfjHg5r
	 SiVl9RH5SQ7Ag==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 04 Feb 2025 02:10:13 +0530
Subject: [PATCH 2/4] phy: exynos5-usbdrd: use GENMASK and FIELD_PREP for
 Exynos5 PHY registers
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-exynos7870-usbphy-v1-2-f30a9857efeb@disroot.org>
References: <20250204-exynos7870-usbphy-v1-0-f30a9857efeb@disroot.org>
In-Reply-To: <20250204-exynos7870-usbphy-v1-0-f30a9857efeb@disroot.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Vivek Gautam <gautam.vivek@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738615219; l=12277;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=wt2GHvwQc8oyS/a94zlZqsI73cR1u9EzFQZlaA/5+ZU=;
 b=iia+uq4EAucOrUu4rUoWAsax86cUgcZKLtoZCcDA0W4GLOeOa4EHPXvxHCh634NZ/QhiQJNQD
 9mSrHGApBhKCUnj+yFtms7Twka906ct+HyVIB5uOWE5mysd/8bXn9ut
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Most Exynos850 and Exynos9 (GS101) DRD PHY registers use GENMASK for masks
and FIELD_PREP for writing values to registers.

Rewrite the register definitions which don't follow this approach to follow
it as much as possible. This patch doesn't introduce any fixes or
functional changes, it's merely an attempt to introduce some uniformity and
consistency in the driver code.

The CRPORT SuperSpeed control registers have been exempted from this
change. Since the writing of register values do not require any masking
operations, implementing it would unnecessarily complicate things.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 147 ++++++++++++++++---------------
 1 file changed, 75 insertions(+), 72 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 4a108fdab118c0edd76bd88dc9dbf6a498e064b3..b2194134193984392c8b48bac249591a92eaa924 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -37,8 +37,7 @@
 /* Exynos5: USB 3.0 DRD PHY registers */
 #define EXYNOS5_DRD_LINKSYSTEM			0x04
 #define LINKSYSTEM_XHCI_VERSION_CONTROL		BIT(27)
-#define LINKSYSTEM_FLADJ_MASK			(0x3f << 1)
-#define LINKSYSTEM_FLADJ(_x)			((_x) << 1)
+#define LINKSYSTEM_FLADJ			GENMASK(6, 1)
 
 #define EXYNOS5_DRD_PHYUTMI			0x08
 #define PHYUTMI_OTGDISABLE			BIT(6)
@@ -49,30 +48,27 @@
 
 #define EXYNOS5_DRD_PHYCLKRST			0x10
 #define PHYCLKRST_EN_UTMISUSPEND		BIT(31)
-#define PHYCLKRST_SSC_REFCLKSEL_MASK		(0xff << 23)
-#define PHYCLKRST_SSC_REFCLKSEL(_x)		((_x) << 23)
-#define PHYCLKRST_SSC_RANGE_MASK		(0x03 << 21)
-#define PHYCLKRST_SSC_RANGE(_x)			((_x) << 21)
+#define PHYCLKRST_SSC_REFCLKSEL			GENMASK(30, 23)
+#define PHYCLKRST_SSC_RANGE			GENMASK(22, 21)
 #define PHYCLKRST_SSC_EN			BIT(20)
 #define PHYCLKRST_REF_SSP_EN			BIT(19)
 #define PHYCLKRST_REF_CLKDIV2			BIT(18)
-#define PHYCLKRST_MPLL_MULTIPLIER_MASK		(0x7f << 11)
-#define PHYCLKRST_MPLL_MULTIPLIER_100MHZ_REF	(0x19 << 11)
-#define PHYCLKRST_MPLL_MULTIPLIER_50M_REF	(0x32 << 11)
-#define PHYCLKRST_MPLL_MULTIPLIER_24MHZ_REF	(0x68 << 11)
-#define PHYCLKRST_MPLL_MULTIPLIER_20MHZ_REF	(0x7d << 11)
-#define PHYCLKRST_MPLL_MULTIPLIER_19200KHZ_REF	(0x02 << 11)
-#define PHYCLKRST_FSEL_PIPE_MASK		(0x7 << 8)
-#define PHYCLKRST_FSEL_UTMI_MASK		(0x7 << 5)
-#define PHYCLKRST_FSEL(_x)			((_x) << 5)
-#define PHYCLKRST_FSEL_PAD_100MHZ		(0x27 << 5)
-#define PHYCLKRST_FSEL_PAD_24MHZ		(0x2a << 5)
-#define PHYCLKRST_FSEL_PAD_20MHZ		(0x31 << 5)
-#define PHYCLKRST_FSEL_PAD_19_2MHZ		(0x38 << 5)
+#define PHYCLKRST_MPLL_MULTIPLIER		GENMASK(17, 11)
+#define PHYCLKRST_MPLL_MULTIPLIER_100MHZ_REF	0x19
+#define PHYCLKRST_MPLL_MULTIPLIER_50M_REF	0x32
+#define PHYCLKRST_MPLL_MULTIPLIER_24MHZ_REF	0x68
+#define PHYCLKRST_MPLL_MULTIPLIER_20MHZ_REF	0x7d
+#define PHYCLKRST_MPLL_MULTIPLIER_19200KHZ_REF	0x02
+#define PHYCLKRST_FSEL_PIPE			GENMASK(10, 8)
+#define PHYCLKRST_FSEL_UTMI			GENMASK(7, 5)
+#define PHYCLKRST_FSEL_PAD_100MHZ		0x27
+#define PHYCLKRST_FSEL_PAD_24MHZ		0x2a
+#define PHYCLKRST_FSEL_PAD_20MHZ		0x31
+#define PHYCLKRST_FSEL_PAD_19_2MHZ		0x38
 #define PHYCLKRST_RETENABLEN			BIT(4)
-#define PHYCLKRST_REFCLKSEL_MASK		(0x03 << 2)
-#define PHYCLKRST_REFCLKSEL_PAD_REFCLK		(0x2 << 2)
-#define PHYCLKRST_REFCLKSEL_EXT_REFCLK		(0x3 << 2)
+#define PHYCLKRST_REFCLKSEL			GENMASK(3, 2)
+#define PHYCLKRST_REFCLKSEL_PAD_REFCLK		0x2
+#define PHYCLKRST_REFCLKSEL_EXT_REFCLK		0x3
 #define PHYCLKRST_PORTRESET			BIT(1)
 #define PHYCLKRST_COMMONONN			BIT(0)
 
@@ -81,22 +77,22 @@
 #define PHYREG0_SSC_RANGE			BIT(20)
 #define PHYREG0_CR_WRITE			BIT(19)
 #define PHYREG0_CR_READ				BIT(18)
-#define PHYREG0_CR_DATA_IN(_x)			((_x) << 2)
+#define PHYREG0_CR_DATA_IN			GENMASK(17, 2)
 #define PHYREG0_CR_CAP_DATA			BIT(1)
 #define PHYREG0_CR_CAP_ADDR			BIT(0)
 
 #define EXYNOS5_DRD_PHYREG1			0x18
-#define PHYREG1_CR_DATA_OUT(_x)			((_x) << 1)
+#define PHYREG0_CR_DATA_OUT			GENMASK(16, 1)
 #define PHYREG1_CR_ACK				BIT(0)
 
 #define EXYNOS5_DRD_PHYPARAM0			0x1c
 #define PHYPARAM0_REF_USE_PAD			BIT(31)
-#define PHYPARAM0_REF_LOSLEVEL_MASK		(0x1f << 26)
-#define PHYPARAM0_REF_LOSLEVEL			(0x9 << 26)
+#define PHYPARAM0_REF_LOSLEVEL			GENMASK(30, 26)
+#define PHYPARAM0_REF_LOSLEVEL_VAL		0x9
 
 #define EXYNOS5_DRD_PHYPARAM1			0x20
-#define PHYPARAM1_PCS_TXDEEMPH_MASK		(0x1f << 0)
-#define PHYPARAM1_PCS_TXDEEMPH			(0x1c)
+#define PHYPARAM1_PCS_TXDEEMPH			GENMASK(4, 0)
+#define PHYPARAM1_PCS_TXDEEMPH_VAL		0x1c
 
 #define EXYNOS5_DRD_PHYTERM			0x24
 
@@ -138,7 +134,7 @@
 #define LINKCTRL_FORCE_PHYSTATUS		BIT(17)
 #define LINKCTRL_FORCE_PIPE_EN			BIT(16)
 #define LINKCTRL_FORCE_QACT			BIT(8)
-#define LINKCTRL_BUS_FILTER_BYPASS(_x)		((_x) << 4)
+#define LINKCTRL_BUS_FILTER_BYPASS		GENMASK(7, 4)
 
 #define EXYNOS850_DRD_LINKPORT			0x08
 #define LINKPORT_HOST_NUM_U3			GENMASK(19, 16)
@@ -484,29 +480,34 @@ exynos5_usbdrd_pipe3_set_refclk(struct phy_usb_instance *inst)
 	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYCLKRST);
 
 	/* Use EXTREFCLK as ref clock */
-	reg &= ~PHYCLKRST_REFCLKSEL_MASK;
-	reg |=	PHYCLKRST_REFCLKSEL_EXT_REFCLK;
+	reg &= ~PHYCLKRST_REFCLKSEL;
+	reg |=	FIELD_PREP_CONST(PHYCLKRST_REFCLKSEL,
+				 PHYCLKRST_REFCLKSEL_EXT_REFCLK);
 
 	/* FSEL settings corresponding to reference clock */
-	reg &= ~(PHYCLKRST_FSEL_PIPE_MASK |
-		 PHYCLKRST_MPLL_MULTIPLIER_MASK |
-		 PHYCLKRST_SSC_REFCLKSEL_MASK);
+	reg &= ~(PHYCLKRST_FSEL_PIPE |
+		 PHYCLKRST_MPLL_MULTIPLIER |
+		 PHYCLKRST_SSC_REFCLKSEL);
 	switch (phy_drd->extrefclk) {
 	case EXYNOS5_FSEL_50MHZ:
-		reg |= (PHYCLKRST_MPLL_MULTIPLIER_50M_REF |
-			PHYCLKRST_SSC_REFCLKSEL(0x00));
+		reg |= (FIELD_PREP_CONST(PHYCLKRST_SSC_REFCLKSEL, 0x00) |
+			FIELD_PREP_CONST(PHYCLKRST_MPLL_MULTIPLIER,
+					 PHYCLKRST_MPLL_MULTIPLIER_50M_REF));
 		break;
 	case EXYNOS5_FSEL_24MHZ:
-		reg |= (PHYCLKRST_MPLL_MULTIPLIER_24MHZ_REF |
-			PHYCLKRST_SSC_REFCLKSEL(0x88));
+		reg |= (FIELD_PREP_CONST(PHYCLKRST_SSC_REFCLKSEL, 0x88) |
+			FIELD_PREP_CONST(PHYCLKRST_MPLL_MULTIPLIER,
+					 PHYCLKRST_MPLL_MULTIPLIER_24MHZ_REF));
 		break;
 	case EXYNOS5_FSEL_20MHZ:
-		reg |= (PHYCLKRST_MPLL_MULTIPLIER_20MHZ_REF |
-			PHYCLKRST_SSC_REFCLKSEL(0x00));
+		reg |= (FIELD_PREP_CONST(PHYCLKRST_SSC_REFCLKSEL, 0x00) |
+			FIELD_PREP_CONST(PHYCLKRST_MPLL_MULTIPLIER,
+					 PHYCLKRST_MPLL_MULTIPLIER_20MHZ_REF));
 		break;
 	case EXYNOS5_FSEL_19MHZ2:
-		reg |= (PHYCLKRST_MPLL_MULTIPLIER_19200KHZ_REF |
-			PHYCLKRST_SSC_REFCLKSEL(0x88));
+		reg |= (FIELD_PREP_CONST(PHYCLKRST_SSC_REFCLKSEL, 0x88) |
+			FIELD_PREP_CONST(PHYCLKRST_MPLL_MULTIPLIER,
+					 PHYCLKRST_MPLL_MULTIPLIER_19200KHZ_REF));
 		break;
 	default:
 		dev_dbg(phy_drd->dev, "unsupported ref clk\n");
@@ -529,13 +530,14 @@ exynos5_usbdrd_utmi_set_refclk(struct phy_usb_instance *inst)
 	/* restore any previous reference clock settings */
 	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYCLKRST);
 
-	reg &= ~PHYCLKRST_REFCLKSEL_MASK;
-	reg |=	PHYCLKRST_REFCLKSEL_EXT_REFCLK;
+	reg &= ~PHYCLKRST_REFCLKSEL;
+	reg |=	FIELD_PREP_CONST(PHYCLKRST_REFCLKSEL,
+				 PHYCLKRST_REFCLKSEL_EXT_REFCLK);
 
-	reg &= ~(PHYCLKRST_FSEL_UTMI_MASK |
-		 PHYCLKRST_MPLL_MULTIPLIER_MASK |
-		 PHYCLKRST_SSC_REFCLKSEL_MASK);
-	reg |= PHYCLKRST_FSEL(phy_drd->extrefclk);
+	reg &= ~(PHYCLKRST_FSEL_UTMI |
+		 PHYCLKRST_MPLL_MULTIPLIER |
+		 PHYCLKRST_SSC_REFCLKSEL);
+	reg |= FIELD_PREP(PHYCLKRST_FSEL_UTMI, phy_drd->extrefclk);
 
 	return reg;
 }
@@ -585,8 +587,9 @@ static void exynos5_usbdrd_pipe3_init(struct exynos5_usbdrd_phy *phy_drd)
 
 	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYPARAM1);
 	/* Set Tx De-Emphasis level */
-	reg &= ~PHYPARAM1_PCS_TXDEEMPH_MASK;
-	reg |=	PHYPARAM1_PCS_TXDEEMPH;
+	reg &= ~PHYPARAM1_PCS_TXDEEMPH;
+	reg |=	FIELD_PREP_CONST(PHYPARAM1_PCS_TXDEEMPH,
+				 PHYPARAM1_PCS_TXDEEMPH_VAL);
 	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYPARAM1);
 
 	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYTEST);
@@ -607,7 +610,7 @@ exynos5_usbdrd_usbdp_g2_v4_ctrl_pma_ready(struct exynos5_usbdrd_phy *phy_drd)
 
 	reg = readl(regs_base + EXYNOS850_DRD_SECPMACTL);
 	reg &= ~SECPMACTL_PMA_REF_FREQ_SEL;
-	reg |= FIELD_PREP(SECPMACTL_PMA_REF_FREQ_SEL, 1);
+	reg |= FIELD_PREP_CONST(SECPMACTL_PMA_REF_FREQ_SEL, 1);
 	/* SFR reset */
 	reg |= (SECPMACTL_PMA_LOW_PWR | SECPMACTL_PMA_APB_SW_RST);
 	reg &= ~(SECPMACTL_PMA_ROPLL_REF_CLK_SEL |
@@ -723,14 +726,16 @@ static void exynos5_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 
 	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYPARAM0);
 	/* Set Loss-of-Signal Detector sensitivity */
-	reg &= ~PHYPARAM0_REF_LOSLEVEL_MASK;
-	reg |=	PHYPARAM0_REF_LOSLEVEL;
+	reg &= ~PHYPARAM0_REF_LOSLEVEL;
+	reg |=	FIELD_PREP_CONST(PHYPARAM0_REF_LOSLEVEL,
+				 PHYPARAM0_REF_LOSLEVEL_VAL);
 	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYPARAM0);
 
 	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYPARAM1);
 	/* Set Tx De-Emphasis level */
-	reg &= ~PHYPARAM1_PCS_TXDEEMPH_MASK;
-	reg |=	PHYPARAM1_PCS_TXDEEMPH;
+	reg &= ~PHYPARAM1_PCS_TXDEEMPH;
+	reg |=	FIELD_PREP_CONST(PHYPARAM1_PCS_TXDEEMPH,
+				 PHYPARAM1_PCS_TXDEEMPH_VAL);
 	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYPARAM1);
 
 	/* UTMI Power Control */
@@ -761,7 +766,7 @@ static int exynos5_usbdrd_phy_init(struct phy *phy)
 	 * See xHCI 1.0 spec, 5.2.4
 	 */
 	reg =	LINKSYSTEM_XHCI_VERSION_CONTROL |
-		LINKSYSTEM_FLADJ(0x20);
+		FIELD_PREP_CONST(LINKSYSTEM_FLADJ, 0x20);
 	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_LINKSYSTEM);
 
 	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYPARAM0);
@@ -920,26 +925,24 @@ static int crport_handshake(struct exynos5_usbdrd_phy *phy_drd,
 static int crport_ctrl_write(struct exynos5_usbdrd_phy *phy_drd,
 			     u32 addr, u32 data)
 {
+	u32 val;
 	int ret;
 
 	/* Write Address */
-	writel(PHYREG0_CR_DATA_IN(addr),
-	       phy_drd->reg_phy + EXYNOS5_DRD_PHYREG0);
-	ret = crport_handshake(phy_drd, PHYREG0_CR_DATA_IN(addr),
-			       PHYREG0_CR_CAP_ADDR);
+	val = FIELD_PREP(PHYREG0_CR_DATA_IN, addr);
+	writel(val, phy_drd->reg_phy + EXYNOS5_DRD_PHYREG0);
+	ret = crport_handshake(phy_drd, val, PHYREG0_CR_CAP_ADDR);
 	if (ret)
 		return ret;
 
 	/* Write Data */
-	writel(PHYREG0_CR_DATA_IN(data),
-	       phy_drd->reg_phy + EXYNOS5_DRD_PHYREG0);
-	ret = crport_handshake(phy_drd, PHYREG0_CR_DATA_IN(data),
-			       PHYREG0_CR_CAP_DATA);
+	val = FIELD_PREP(PHYREG0_CR_DATA_IN, data);
+	writel(val, phy_drd->reg_phy + EXYNOS5_DRD_PHYREG0);
+	ret = crport_handshake(phy_drd, val, PHYREG0_CR_CAP_DATA);
 	if (ret)
 		return ret;
 
-	ret = crport_handshake(phy_drd, PHYREG0_CR_DATA_IN(data),
-			       PHYREG0_CR_WRITE);
+	ret = crport_handshake(phy_drd, val, PHYREG0_CR_WRITE);
 
 	return ret;
 }
@@ -1108,7 +1111,7 @@ static void exynos850_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 
 	/* Set VBUS Valid and D+ pull-up control by VBUS pad usage */
 	reg = readl(regs_base + EXYNOS850_DRD_LINKCTRL);
-	reg |= LINKCTRL_BUS_FILTER_BYPASS(0xf);
+	reg |= FIELD_PREP_CONST(LINKCTRL_BUS_FILTER_BYPASS, 0xf);
 	writel(reg, regs_base + EXYNOS850_DRD_LINKCTRL);
 
 	reg = readl(regs_base + EXYNOS850_DRD_UTMI);
@@ -1123,19 +1126,19 @@ static void exynos850_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 	reg &= ~SSPPLLCTL_FSEL;
 	switch (phy_drd->extrefclk) {
 	case EXYNOS5_FSEL_50MHZ:
-		reg |= FIELD_PREP(SSPPLLCTL_FSEL, 7);
+		reg |= FIELD_PREP_CONST(SSPPLLCTL_FSEL, 7);
 		break;
 	case EXYNOS5_FSEL_26MHZ:
-		reg |= FIELD_PREP(SSPPLLCTL_FSEL, 6);
+		reg |= FIELD_PREP_CONST(SSPPLLCTL_FSEL, 6);
 		break;
 	case EXYNOS5_FSEL_24MHZ:
-		reg |= FIELD_PREP(SSPPLLCTL_FSEL, 2);
+		reg |= FIELD_PREP_CONST(SSPPLLCTL_FSEL, 2);
 		break;
 	case EXYNOS5_FSEL_20MHZ:
-		reg |= FIELD_PREP(SSPPLLCTL_FSEL, 1);
+		reg |= FIELD_PREP_CONST(SSPPLLCTL_FSEL, 1);
 		break;
 	case EXYNOS5_FSEL_19MHZ2:
-		reg |= FIELD_PREP(SSPPLLCTL_FSEL, 0);
+		reg |= FIELD_PREP_CONST(SSPPLLCTL_FSEL, 0);
 		break;
 	default:
 		dev_warn(phy_drd->dev, "unsupported ref clk: %#.2x\n",

-- 
2.48.1


