Return-Path: <linux-samsung-soc+bounces-6531-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6412AA26506
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  3 Feb 2025 21:43:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD77416417D
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  3 Feb 2025 20:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28C51210F53;
	Mon,  3 Feb 2025 20:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="mZTTGcdd"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6344210180;
	Mon,  3 Feb 2025 20:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738615279; cv=none; b=N8wTiqLfAVat7B0UHuQY50+61kq9ItRf8/DbLFfrxdO/Mc+cl28S7T679Kb5Zvu0Qa+ew+O4MhaOc2rk7isWX1nJigTS/+TJno6B5AN+F0Zu+AWDm5yVzZEGXdRUZ20iqJ/hqtIWKZRkUkDLWHbKutfVpTJzagy6K1SQsofMUHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738615279; c=relaxed/simple;
	bh=rWj06FvYIxT7vbEmJHdYsqQCLp8XJbN54JJ1bJmwGx4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e3ucLd02V+bOVFSJvtfbjNYDGp7+gDMdGVRnPOyquaAzN5d9T8cZR1b+SDWFWQxvYC8LU0J5Jr1HOxl7CKp4EfVSkfNP+F7xId7g5/ozdOsA+7MQZMbnJVpNqahK4gUqtRMWIlUSGVxPDRZHnlXgJ81CDz8ykPGHeuMuKsx+TdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=mZTTGcdd; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A8CEB25BC9;
	Mon,  3 Feb 2025 21:41:16 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jnQ_KJNVvoAL; Mon,  3 Feb 2025 21:41:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738615272; bh=rWj06FvYIxT7vbEmJHdYsqQCLp8XJbN54JJ1bJmwGx4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mZTTGcddpINkDrE7Asn8ecdiHwl7akVgIeiDNvCndz77BcerGxfhizLTnerU8x0sk
	 S3EMr4AxuKYY48nDeevkcCi8AUVwIHbBHx/9ddboKBl083g1Z8Wn8HCdGS5I2y8n7I
	 A719R7aLOFJyoDv7h6OLGMxiC8kQud4ybnGeA8tto3UWKFnibGN6Gpcb9MNpIuDIU5
	 jbSNOXwHMSA5g0tuztRCi16AlraImINaHnuLSKyNaU+Fql3hVmO1EtYWexPuZhf1nU
	 NxR3Xa3j7cKFS8rvaodfJdHSswJFcO2aNpZHH4Ipxv0zaybQdDcWSDUvlsq/9EP3Re
	 GTn8f2p2whWwg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 04 Feb 2025 02:10:15 +0530
Subject: [PATCH 4/4] phy: exynos5-usbdrd: add exynos7870 USBDRD support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-exynos7870-usbphy-v1-4-f30a9857efeb@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738615219; l=13362;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=GTcOGWDNKNMwP6Bju0nlY+mIa3II8IQPsqSfD64jlOQ=;
 b=kc3inyHZ9+1OYVD7j0ft3nrBTG4B2+VqMqwUH72egkSS5e1QxDEyu8NP2lfQDNujyLk0slKqC
 LLlNQmjDSD4D+dDlhBQbu76yUlQG4mCTzOe8z6qHO43hCvjc+pcpg/Y
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

From: Sergey Lisov <sleirsgoevy@gmail.com>

Implement support for Exynos7870 USB DRD on top of the existing
exynos5-usbdrd driver.

Exynos7870 has a single USB 2.0 DRD PHY controller and no 3.0 PHYs. Thus,
it only supports the UTMI interface.

Moreover, the PMU register offset for enabling the PHY controller is
different for SoCs such as Exynos7870, where BIT(0) is for the 3.0 PHY and
BIT(1) is for the 2.0 PHY. The phy_isol function for Exynos7870 uses the
appropriate register offsets.

Signed-off-by: Sergey Lisov <sleirsgoevy@gmail.com>
Co-developed-by: Kaustabh Chakraborty <kauschluss@disroot.org>
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c    | 260 ++++++++++++++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h |   2 +
 2 files changed, 262 insertions(+)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index b2194134193984392c8b48bac249591a92eaa924..4fe926483343ee2edf15b53e35f83a721f5cedab 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -37,10 +37,22 @@
 /* Exynos5: USB 3.0 DRD PHY registers */
 #define EXYNOS5_DRD_LINKSYSTEM			0x04
 #define LINKSYSTEM_XHCI_VERSION_CONTROL		BIT(27)
+#define LINKSYSTEM_FORCE_VBUSVALID		BIT(8)
+#define LINKSYSTEM_FORCE_BVALID			BIT(7)
 #define LINKSYSTEM_FLADJ			GENMASK(6, 1)
 
 #define EXYNOS5_DRD_PHYUTMI			0x08
+#define PHYUTMI_UTMI_SUSPEND_COM_N		BIT(12)
+#define PHYUTMI_UTMI_L1_SUSPEND_COM_N		BIT(11)
+#define PHYUTMI_VBUSVLDEXTSEL			BIT(10)
+#define PHYUTMI_VBUSVLDEXT			BIT(9)
+#define PHYUTMI_TXBITSTUFFENH			BIT(8)
+#define PHYUTMI_TXBITSTUFFEN			BIT(7)
 #define PHYUTMI_OTGDISABLE			BIT(6)
+#define PHYUTMI_IDPULLUP			BIT(5)
+#define PHYUTMI_DRVVBUS				BIT(4)
+#define PHYUTMI_DPPULLDOWN			BIT(3)
+#define PHYUTMI_DMPULLDOWN			BIT(2)
 #define PHYUTMI_FORCESUSPEND			BIT(1)
 #define PHYUTMI_FORCESLEEP			BIT(0)
 
@@ -89,6 +101,16 @@
 #define PHYPARAM0_REF_USE_PAD			BIT(31)
 #define PHYPARAM0_REF_LOSLEVEL			GENMASK(30, 26)
 #define PHYPARAM0_REF_LOSLEVEL_VAL		0x9
+#define PHYPARAM0_TXVREFTUNE			GENMASK(25, 22)
+#define PHYPARAM0_TXRISETUNE			GENMASK(21, 20)
+#define PHYPARAM0_TXRESTUNE			GENMASK(19, 18)
+#define PHYPARAM0_TXPREEMPPULSETUNE		BIT(17)
+#define PHYPARAM0_TXPREEMPAMPTUNE		GENMASK(16, 15)
+#define PHYPARAM0_TXHSXVTUNE			GENMASK(14, 13)
+#define PHYPARAM0_TXFSLSTUNE			GENMASK(12, 9)
+#define PHYPARAM0_SQRXTUNE			GENMASK(8, 6)
+#define PHYPARAM0_OTGTUNE			GENMASK(5, 3)
+#define PHYPARAM0_COMPDISTUNE			GENMASK(2, 0)
 
 #define EXYNOS5_DRD_PHYPARAM1			0x20
 #define PHYPARAM1_PCS_TXDEEMPH			GENMASK(4, 0)
@@ -108,6 +130,12 @@
 #define EXYNOS5_DRD_PHYRESUME			0x34
 
 #define EXYNOS5_DRD_LINKPORT			0x44
+#define LINKPORT_HOST_U3_PORT_DISABLE		BIT(8)
+#define LINKPORT_HOST_U2_PORT_DISABLE		BIT(7)
+#define LINKPORT_HOST_PORT_OVCR_U3		BIT(5)
+#define LINKPORT_HOST_PORT_OVCR_U2		BIT(4)
+#define LINKPORT_HOST_PORT_OVCR_U3_SEL		BIT(3)
+#define LINKPORT_HOST_PORT_OVCR_U2_SEL		BIT(2)
 
 /* USB 3.0 DRD PHY SS Function Control Reg; accessed by CR_PORT */
 #define EXYNOS5_DRD_PHYSS_LOSLEVEL_OVRD_IN		(0x15)
@@ -128,6 +156,24 @@
 #define LANE0_TX_DEBUG_RXDET_MEAS_TIME_62M5		(0x20 << 4)
 #define LANE0_TX_DEBUG_RXDET_MEAS_TIME_96M_100M		(0x40 << 4)
 
+/* Exynos7870: USB DRD PHY registers */
+#define EXYNOS7870_DRD_PHYPCSVAL		0x3C
+#define PHYPCSVAL_PCS_RX_LOS_MASK		GENMASK(9, 0)
+
+#define EXYNOS7870_DRD_PHYPARAM2		0x50
+#define PHYPARAM2_TX_VBOOST_LVL		        GENMASK(6, 4)
+#define PHYPARAM2_LOS_BIAS			GENMASK(2, 0)
+
+#define EXYNOS7870_DRD_HSPHYCTRL		0x54
+#define HSPHYCTRL_PHYSWRSTALL			BIT(31)
+#define HSPHYCTRL_SIDDQ				BIT(6)
+#define HSPHYCTRL_PHYSWRST			BIT(0)
+
+#define EXYNOS7870_DRD_HSPHYPLLTUNE		0x70
+#define HSPHYPLLTUNE_PLL_B_TUNE			BIT(6)
+#define HSPHYPLLTUNE_PLL_I_TUNE			GENMASK(5, 4)
+#define HSPHYPLLTUNE_PLL_P_TUNE			GENMASK(3, 0)
+
 /* Exynos850: USB DRD PHY registers */
 #define EXYNOS850_DRD_LINKCTRL			0x04
 #define LINKCTRL_FORCE_RXELECIDLE		BIT(18)
@@ -1052,6 +1098,172 @@ static const struct phy_ops exynos5_usbdrd_phy_ops = {
 	.owner		= THIS_MODULE,
 };
 
+static void exynos7870_usbdrd_phy_isol(struct phy_usb_instance *inst,
+				       bool isolate)
+{
+	unsigned int val;
+
+	if (!inst->reg_pmu)
+		return;
+
+	val = isolate ? 0 : EXYNOS7870_USB2PHY_ENABLE;
+
+	regmap_update_bits(inst->reg_pmu, inst->pmu_offset,
+			   EXYNOS7870_USB2PHY_ENABLE, val);
+}
+
+static void exynos7870_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
+{
+	u32 reg;
+
+	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYCLKRST);
+	/* Use PADREFCLK as ref clock */
+	reg &= ~PHYCLKRST_REFCLKSEL;
+	reg |= FIELD_PREP_CONST(PHYCLKRST_REFCLKSEL,
+				PHYCLKRST_REFCLKSEL_PAD_REFCLK);
+	/* Select ref clock rate */
+	reg &= ~PHYCLKRST_FSEL_UTMI;
+	reg &= ~PHYCLKRST_FSEL_PIPE;
+	reg |= FIELD_PREP(PHYCLKRST_FSEL_UTMI, phy_drd->extrefclk);
+	/* Enable suspend and reset the port */
+	reg |= PHYCLKRST_EN_UTMISUSPEND;
+	reg |= PHYCLKRST_COMMONONN;
+	reg |= PHYCLKRST_PORTRESET;
+	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYCLKRST);
+	udelay(10);
+
+	/* Clear the port reset bit */
+	reg &= ~PHYCLKRST_PORTRESET;
+	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYCLKRST);
+
+	/* Change PHY PLL tune value */
+	reg = readl(phy_drd->reg_phy + EXYNOS7870_DRD_HSPHYPLLTUNE);
+	if (phy_drd->extrefclk == EXYNOS5_FSEL_24MHZ)
+		reg |= HSPHYPLLTUNE_PLL_B_TUNE;
+	else
+		reg &= ~HSPHYPLLTUNE_PLL_B_TUNE;
+	reg &= ~HSPHYPLLTUNE_PLL_P_TUNE;
+	reg |= FIELD_PREP_CONST(HSPHYPLLTUNE_PLL_P_TUNE, 14);
+	writel(reg, phy_drd->reg_phy + EXYNOS7870_DRD_HSPHYPLLTUNE);
+
+	/* High-Speed PHY control */
+	reg = readl(phy_drd->reg_phy + EXYNOS7870_DRD_HSPHYCTRL);
+	reg &= ~HSPHYCTRL_SIDDQ;
+	reg &= ~HSPHYCTRL_PHYSWRST;
+	reg &= ~HSPHYCTRL_PHYSWRSTALL;
+	writel(reg, phy_drd->reg_phy + EXYNOS7870_DRD_HSPHYCTRL);
+	udelay(500);
+
+	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_LINKSYSTEM);
+	/*
+	 * Setting the Frame length Adj value[6:1] to default 0x20
+	 * See xHCI 1.0 spec, 5.2.4
+	 */
+	reg |= LINKSYSTEM_XHCI_VERSION_CONTROL;
+	reg |= FIELD_PREP_CONST(LINKSYSTEM_FLADJ, 0x20);
+	/* Set VBUSVALID signal as the VBUS pad is not used */
+	reg |= LINKSYSTEM_FORCE_BVALID;
+	reg |= LINKSYSTEM_FORCE_VBUSVALID;
+	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_LINKSYSTEM);
+
+	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYUTMI);
+	/* Release force_sleep & force_suspend */
+	reg &= ~PHYUTMI_FORCESLEEP;
+	reg &= ~PHYUTMI_FORCESUSPEND;
+	/* DP/DM pull down control */
+	reg &= ~PHYUTMI_DMPULLDOWN;
+	reg &= ~PHYUTMI_DPPULLDOWN;
+	reg &= ~PHYUTMI_DRVVBUS;
+	/* Set DP-pull up as the VBUS pad is not used */
+	reg |= PHYUTMI_VBUSVLDEXTSEL;
+	reg |= PHYUTMI_VBUSVLDEXT;
+	/* Disable OTG block and VBUS valid comparator */
+	reg |= PHYUTMI_OTGDISABLE;
+	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYUTMI);
+
+	/* Configure OVC IO usage */
+	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_LINKPORT);
+	reg |= LINKPORT_HOST_PORT_OVCR_U3_SEL | LINKPORT_HOST_PORT_OVCR_U2_SEL;
+	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_LINKPORT);
+
+	/* High-Speed PHY swrst */
+	reg = readl(phy_drd->reg_phy + EXYNOS7870_DRD_HSPHYCTRL);
+	reg |= HSPHYCTRL_PHYSWRST;
+	writel(reg, phy_drd->reg_phy + EXYNOS7870_DRD_HSPHYCTRL);
+	udelay(20);
+
+	/* Clear the PHY swrst bit */
+	reg = readl(phy_drd->reg_phy + EXYNOS7870_DRD_HSPHYCTRL);
+	reg &= ~HSPHYCTRL_PHYSWRST;
+	writel(reg, phy_drd->reg_phy + EXYNOS7870_DRD_HSPHYCTRL);
+
+	if (phy_drd->drv_data->phy_tunes)
+		exynos5_usbdrd_apply_phy_tunes(phy_drd,
+					       PTS_UTMI_POSTINIT);
+}
+
+static int exynos7870_usbdrd_phy_init(struct phy *phy)
+{
+	struct phy_usb_instance *inst = phy_get_drvdata(phy);
+	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
+	int ret;
+
+	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clks);
+	if (ret)
+		return ret;
+
+	/* UTMI or PIPE3 specific init */
+	inst->phy_cfg->phy_init(phy_drd);
+
+	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
+
+	return 0;
+}
+
+static int exynos7870_usbdrd_phy_exit(struct phy *phy)
+{
+	int ret;
+	u32 reg;
+	struct phy_usb_instance *inst = phy_get_drvdata(phy);
+	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
+
+	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clks);
+	if (ret)
+		return ret;
+
+	/*
+	 * Disable the VBUS signal and the ID pull-up resistor.
+	 * Enable force-suspend and force-sleep modes.
+	 */
+	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYUTMI);
+	reg &= ~(PHYUTMI_DRVVBUS | PHYUTMI_VBUSVLDEXT | PHYUTMI_VBUSVLDEXTSEL);
+	reg &= ~PHYUTMI_IDPULLUP;
+	reg |= PHYUTMI_FORCESUSPEND | PHYUTMI_FORCESLEEP;
+	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYUTMI);
+
+	/* Power down PHY analog blocks */
+	reg = readl(phy_drd->reg_phy + EXYNOS7870_DRD_HSPHYCTRL);
+	reg |= HSPHYCTRL_SIDDQ;
+	writel(reg, phy_drd->reg_phy + EXYNOS7870_DRD_HSPHYCTRL);
+
+	/* Clear VBUSVALID signal as the VBUS pad is not used */
+	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_LINKSYSTEM);
+	reg &= ~(LINKSYSTEM_FORCE_BVALID | LINKSYSTEM_FORCE_VBUSVALID);
+	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_LINKSYSTEM);
+
+	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
+
+	return 0;
+}
+
+static const struct phy_ops exynos7870_usbdrd_phy_ops = {
+	.init		= exynos7870_usbdrd_phy_init,
+	.exit		= exynos7870_usbdrd_phy_exit,
+	.power_on	= exynos5_usbdrd_phy_power_on,
+	.power_off	= exynos5_usbdrd_phy_power_off,
+	.owner		= THIS_MODULE,
+};
+
 static void
 exynos5_usbdrd_usb_v3p1_pipe_override(struct exynos5_usbdrd_phy *phy_drd)
 {
@@ -1389,6 +1601,14 @@ static const struct exynos5_usbdrd_phy_config phy_cfg_exynos5[] = {
 	},
 };
 
+static const struct exynos5_usbdrd_phy_config phy_cfg_exynos7870[] = {
+	{
+		.id		= EXYNOS5_DRDPHY_UTMI,
+		.phy_isol	= exynos7870_usbdrd_phy_isol,
+		.phy_init	= exynos7870_usbdrd_utmi_init,
+	},
+};
+
 static const struct exynos5_usbdrd_phy_config phy_cfg_exynos850[] = {
 	{
 		.id		= EXYNOS5_DRDPHY_UTMI,
@@ -1397,6 +1617,30 @@ static const struct exynos5_usbdrd_phy_config phy_cfg_exynos850[] = {
 	},
 };
 
+static
+const struct exynos5_usbdrd_phy_tuning exynos7870_tunes_utmi_postinit[] = {
+	PHY_TUNING_ENTRY_PHY(EXYNOS5_DRD_PHYPARAM0,
+			     (PHYPARAM0_TXVREFTUNE | PHYPARAM0_TXRISETUNE |
+			      PHYPARAM0_TXRESTUNE | PHYPARAM0_TXPREEMPPULSETUNE |
+			      PHYPARAM0_TXPREEMPAMPTUNE | PHYPARAM0_TXHSXVTUNE |
+			      PHYPARAM0_TXFSLSTUNE | PHYPARAM0_SQRXTUNE |
+			      PHYPARAM0_OTGTUNE | PHYPARAM0_COMPDISTUNE),
+			     (FIELD_PREP_CONST(PHYPARAM0_TXVREFTUNE, 14) |
+			      FIELD_PREP_CONST(PHYPARAM0_TXRISETUNE, 1) |
+			      FIELD_PREP_CONST(PHYPARAM0_TXRESTUNE, 3) |
+			      FIELD_PREP_CONST(PHYPARAM0_TXPREEMPAMPTUNE, 0) |
+			      FIELD_PREP_CONST(PHYPARAM0_TXHSXVTUNE, 0) |
+			      FIELD_PREP_CONST(PHYPARAM0_TXFSLSTUNE, 3) |
+			      FIELD_PREP_CONST(PHYPARAM0_SQRXTUNE, 6) |
+			      FIELD_PREP_CONST(PHYPARAM0_OTGTUNE, 2) |
+			      FIELD_PREP_CONST(PHYPARAM0_COMPDISTUNE, 3))),
+	PHY_TUNING_ENTRY_LAST
+};
+
+static const struct exynos5_usbdrd_phy_tuning *exynos7870_tunes[PTS_MAX] = {
+	[PTS_UTMI_POSTINIT] = exynos7870_tunes_utmi_postinit,
+};
+
 static const char * const exynos5_clk_names[] = {
 	"phy",
 };
@@ -1463,6 +1707,19 @@ static const struct exynos5_usbdrd_phy_drvdata exynos7_usbdrd_phy = {
 	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
 };
 
+static const struct exynos5_usbdrd_phy_drvdata exynos7870_usbdrd_phy = {
+	.phy_cfg		= phy_cfg_exynos7870,
+	.phy_tunes		= exynos7870_tunes,
+	.phy_ops		= &exynos7870_usbdrd_phy_ops,
+	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
+	.clk_names		= exynos5_clk_names,
+	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
+	.core_clk_names		= exynos5_core_clk_names,
+	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),
+	.regulator_names	= exynos5_regulator_names,
+	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
+};
+
 static const struct exynos5_usbdrd_phy_drvdata exynos850_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos850,
 	.phy_ops		= &exynos850_usbdrd_phy_ops,
@@ -1666,6 +1923,9 @@ static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
 	}, {
 		.compatible = "samsung,exynos7-usbdrd-phy",
 		.data = &exynos7_usbdrd_phy
+	}, {
+		.compatible = "samsung,exynos7870-usbdrd-phy",
+		.data = &exynos7870_usbdrd_phy
 	}, {
 		.compatible = "samsung,exynos850-usbdrd-phy",
 		.data = &exynos850_usbdrd_phy
diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
index ce1a3790d6fb0400021f5cc22394afedfb742152..cde299a85384a70d04dae49ee9a4e2daa88fbbf6 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -55,6 +55,8 @@
 #define EXYNOS4_MIPI_PHY_SRESETN		(1 << 1)
 #define EXYNOS4_MIPI_PHY_MRESETN		(1 << 2)
 #define EXYNOS4_MIPI_PHY_RESET_MASK		(3 << 1)
+/* USB PHY enable bit, valid for Exynos7870 */
+#define EXYNOS7870_USB2PHY_ENABLE		(1 << 1)
 
 #define S5P_INFORM0				0x0800
 #define S5P_INFORM1				0x0804

-- 
2.48.1


