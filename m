Return-Path: <linux-samsung-soc+bounces-10243-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE97B31393
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 22 Aug 2025 11:42:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 058B0AE7DC0
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 22 Aug 2025 09:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E86A2FDC5D;
	Fri, 22 Aug 2025 09:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="WBIcevHD"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0EA2FDC42
	for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Aug 2025 09:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755855032; cv=none; b=GUxBF2taNzP8Dh6FZ1ouJG30LUaX02Z0nWARn+TSKGixLtrZj8+7d0PVd5VGI2FZP0nJzbQ+gF7ojb51VTBb4TOm3ViiNu/M/fRd2OfD0xJ9P3lldEKhL6B3bpzBfA1bDzaiw+jdY9dl3xCxcR6tMegkHv+P9Cqjtk9amhB3GsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755855032; c=relaxed/simple;
	bh=X7L3r0j4vwGb3jqAsah3FGEJfLKdc71/Uox/XrcEIPU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=kAqf6m3J82VaviyIOPXzk489+oamq9YWuvGtp+gxG9LrY+ocFT67Irjjgvl84yhl68OLXET7ctALQXmynRgspqITB2GD+Tk3APDlC0SM62sln4DlR0xh8Yw0tv/oxCJ6Er35TaCwKbeta0ubBhGsyGZ7CKx5oyNZwCrUjxc0l0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=WBIcevHD; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250822093028epoutp01d627c20b9e89f2bc4fa649e81ed0d802~eDNhywPMx2018220182epoutp01R
	for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Aug 2025 09:30:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250822093028epoutp01d627c20b9e89f2bc4fa649e81ed0d802~eDNhywPMx2018220182epoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755855028;
	bh=AhFTQmo4gSBUuElwHmm/ZJ7W+cgzaqW5LS5IcxhwK0w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WBIcevHDZtaP5xpRaHUbfd+iKpj4YouVvs46tpnoJ+EU690yAFNFkczJ6PRIJaRdk
	 qASIN1riGqCLY0fo2YznhMUeWIf5dJ3RIjKJtzWi05XgOZalqp7Jf/g0y91XQiQ0KT
	 qAmZxO2FuOQBJZVCYXvyMTJ/xjm7W2AA/up3qiac=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250822093027epcas5p3c065fb2f16f709cefa112c0342ab45bf~eDNhHm10K0430004300epcas5p3s;
	Fri, 22 Aug 2025 09:30:27 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.88]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4c7Zfp5z1nz2SSKb; Fri, 22 Aug
	2025 09:30:26 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250822093026epcas5p24ca84f56e803cbc65b5d21fc539dbd79~eDNfl23OL1676216762epcas5p2y;
	Fri, 22 Aug 2025 09:30:26 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250822093022epsmtip2c21e96d3a188982154726a60b0eb1741~eDNcgybpM0191101911epsmtip2j;
	Fri, 22 Aug 2025 09:30:22 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org,
	ivo.ivanov.ivanov1@gmail.com, igor.belwon@mentallysanemainliners.org,
	johan@kernel.org, m.szyprowski@samsung.com, s.nawrocki@samsung.com,
	pritam.sutar@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
	selvarasu.g@samsung.com
Subject: [PATCH v7 6/6] phy: exynos5-usbdrd: support SS combo phy for
 ExynosAutov920
Date: Fri, 22 Aug 2025 15:08:45 +0530
Message-Id: <20250822093845.1179395-7-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250822093845.1179395-1-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250822093026epcas5p24ca84f56e803cbc65b5d21fc539dbd79
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250822093026epcas5p24ca84f56e803cbc65b5d21fc539dbd79
References: <20250822093845.1179395-1-pritam.sutar@samsung.com>
	<CGME20250822093026epcas5p24ca84f56e803cbc65b5d21fc539dbd79@epcas5p2.samsung.com>

Add required change in phy driver to support combo SS phy for this SoC.

Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c    | 325 +++++++++++++++++++-
 include/linux/soc/samsung/exynos-regs-pmu.h |   1 +
 2 files changed, 322 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 32178c5c120d..038230b1c433 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -273,6 +273,36 @@
 #define EXYNOSAUTOV920_DRD_HSPPLLTUNE		0x110
 #define HSPPLLTUNE_FSEL				GENMASK(18, 16)
 
+/* ExynosAutov920 phy usb31drd port reg */
+#define EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL	0x000
+#define PHY_RST_CTRL_PIPE_LANE0_RESET_N_OVRD_EN	BIT(5)
+#define PHY_RST_CTRL_PIPE_LANE0_RESET_N		BIT(4)
+#define PHY_RST_CTRL_PHY_RESET_OVRD_EN		BIT(1)
+#define PHY_RST_CTRL_PHY_RESET			BIT(0)
+
+#define EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0	0x0004
+#define PHY_CR_PARA_CON0_PHY0_CR_PARA_ADDR		GENMASK(31, 16)
+#define PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK		BIT(8)
+#define PHY_CR_PARA_CON0_PHY0_CR_PARA_ACK		BIT(4)
+#define PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL		BIT(0)
+
+#define EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON1	0x0008
+
+#define EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON2	0x000c
+#define PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_EN		BIT(0)
+#define PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_DATA		GENMASK(31, 16)
+
+#define EXYNOSAUTOV920_USB31DRD_PHY_CONFIG0	0x100
+#define PHY_CONFIG0_PHY0_PMA_PWR_STABLE		BIT(14)
+#define PHY_CONFIG0_PHY0_PCS_PWR_STABLE		BIT(13)
+#define PHY_CONFIG0_PHY0_ANA_PWR_EN		BIT(1)
+
+#define EXYNOSAUTOV920_USB31DRD_PHY_CONFIG7	0x11c
+#define PHY_CONFIG7_PHY_TEST_POWERDOWN		BIT(24)
+
+#define EXYNOSAUTOV920_USB31DRD_PHY_CONFIG4	0x110
+#define PHY_CONFIG4_PIPE_RX0_SRIS_MODE_EN	BIT(2)
+
 /* Exynos9 - GS101 */
 #define EXYNOS850_DRD_SECPMACTL			0x48
 #define SECPMACTL_PMA_ROPLL_REF_CLK_SEL		GENMASK(13, 12)
@@ -2077,6 +2107,251 @@ static const struct exynos5_usbdrd_phy_drvdata exynos990_usbdrd_phy = {
 	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
 };
 
+static void
+exynosautov920_usb31drd_cr_clk(struct exynos5_usbdrd_phy *phy_drd, bool high)
+{
+	void __iomem *reg_phy = phy_drd->reg_phy;
+	u32 reg;
+
+	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
+	if (high)
+		reg |= PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK;
+	else
+		reg &= ~PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK;
+
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
+	fsleep(1);
+}
+
+static void
+exynosautov920_usb31drd_port_phy_ready(struct exynos5_usbdrd_phy *phy_drd)
+{
+	struct device *dev = phy_drd->dev;
+	void __iomem *reg_phy = phy_drd->reg_phy;
+	static const unsigned int timeout_us = 20000;
+	static const unsigned int sleep_us = 40;
+	u32 reg;
+	int err;
+
+	/* Clear cr_para_con */
+	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
+	reg &= ~(PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK |
+			PHY_CR_PARA_CON0_PHY0_CR_PARA_ADDR);
+	reg |= PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
+	writel(0x0, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON1);
+	writel(0x0, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON2);
+
+	exynosautov920_usb31drd_cr_clk(phy_drd, true);
+	exynosautov920_usb31drd_cr_clk(phy_drd, false);
+
+	/*
+	 * The maximum time from phy reset de-assertion to de-assertion of
+	 * tx/rx_ack can be as high as 5ms in fast simulation mode.
+	 * Time to phy ready is < 20ms
+	 */
+	err = readl_poll_timeout(reg_phy +
+				EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0,
+			reg, !(reg & PHY_CR_PARA_CON0_PHY0_CR_PARA_ACK),
+			sleep_us, timeout_us);
+	if (err)
+		dev_err(dev, "timed out waiting for rx/tx_ack: %#.8x\n", reg);
+
+	reg &= ~PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
+}
+
+static void
+exynosautov920_usb31drd_cr_write(struct exynos5_usbdrd_phy *phy_drd,
+				 u16 addr, u16 data)
+{
+	void __iomem *reg_phy = phy_drd->reg_phy;
+	u32 cnt = 0;
+	u32 reg;
+
+	/* Pre Clocking */
+	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
+	reg |= PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
+
+	/*
+	 * tx clks must be available prior to assertion of tx req.
+	 * tx pstate p2 to p0 transition directly is not permitted.
+	 * tx clk ready must be asserted synchronously on tx clk prior
+	 * to internal transmit clk alignment sequence in the phy
+	 * when entering from p2 to p1 to p0.
+	 */
+	do {
+		exynosautov920_usb31drd_cr_clk(phy_drd, true);
+		exynosautov920_usb31drd_cr_clk(phy_drd, false);
+		cnt++;
+	} while (cnt < 15);
+
+	reg &= ~PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
+
+	/*
+	 * tx data path is active when tx lane is in p0 state
+	 * and tx data en asserted. enable cr_para_wr_en.
+	 */
+	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON2);
+	reg &= ~PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_DATA;
+	reg |= FIELD_PREP(PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_DATA, data) |
+		PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_EN;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON2);
+
+	/* write addr */
+	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
+	reg &= ~PHY_CR_PARA_CON0_PHY0_CR_PARA_ADDR;
+	reg |= FIELD_PREP(PHY_CR_PARA_CON0_PHY0_CR_PARA_ADDR, addr) |
+		PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK |
+		PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
+
+	/* check cr_para_ack*/
+	cnt = 0;
+	do {
+		/*
+		 * data symbols are captured by phy on rising edge of the
+		 * tx_clk when tx data enabled.
+		 * completion of the write cycle is acknowledged by assertion
+		 * of the cr_para_ack.
+		 */
+		exynosautov920_usb31drd_cr_clk(phy_drd, true);
+		reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
+		if ((reg & PHY_CR_PARA_CON0_PHY0_CR_PARA_ACK))
+			break;
+
+		exynosautov920_usb31drd_cr_clk(phy_drd, false);
+
+		/*
+		 * wait for minimum of 10 cr_para_clk cycles after phy reset
+		 * is negated, before accessing control regs to allow for
+		 * internal resets.
+		 */
+		cnt++;
+	} while (cnt < 10);
+
+	if (cnt < 10)
+		exynosautov920_usb31drd_cr_clk(phy_drd, false);
+}
+
+static void
+exynosautov920_usb31drd_phy_reset(struct exynos5_usbdrd_phy *phy_drd, int val)
+{
+	void __iomem *reg_phy = phy_drd->reg_phy;
+	u32 reg;
+
+	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
+	reg &= ~PHY_RST_CTRL_PHY_RESET_OVRD_EN;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
+
+	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
+	if (val)
+		reg |= PHY_RST_CTRL_PHY_RESET;
+	else
+		reg &= ~PHY_RST_CTRL_PHY_RESET;
+
+	reg |= PHY_RST_CTRL_PHY_RESET_OVRD_EN;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
+}
+
+static void
+exynosautov920_usb31drd_lane0_reset(struct exynos5_usbdrd_phy *phy_drd, int val)
+{
+	void __iomem *reg_phy = phy_drd->reg_phy;
+	u32 reg;
+
+	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
+	reg |= PHY_RST_CTRL_PIPE_LANE0_RESET_N_OVRD_EN;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
+
+	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
+	if (val)
+		reg &= ~PHY_RST_CTRL_PIPE_LANE0_RESET_N;
+	else
+		reg |= PHY_RST_CTRL_PIPE_LANE0_RESET_N;
+
+	reg &= ~PHY_RST_CTRL_PIPE_LANE0_RESET_N_OVRD_EN;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
+}
+
+static void
+exynosautov920_usb31drd_pipe3_init(struct exynos5_usbdrd_phy *phy_drd)
+{
+	void __iomem *reg_phy = phy_drd->reg_phy;
+	u32 reg;
+
+	/*
+	 * Phy and Pipe Lane reset assert.
+	 * assert reset (phy_reset = 1).
+	 * The lane-ack outputs are asserted during reset (tx_ack = rx_ack = 1)
+	 */
+	exynosautov920_usb31drd_phy_reset(phy_drd, 1);
+	exynosautov920_usb31drd_lane0_reset(phy_drd, 1);
+
+	/*
+	 * ANA Power En, PCS & PMA PWR Stable Set
+	 * ramp-up power suppiles
+	 */
+	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG0);
+	reg |= PHY_CONFIG0_PHY0_ANA_PWR_EN | PHY_CONFIG0_PHY0_PCS_PWR_STABLE |
+		PHY_CONFIG0_PHY0_PMA_PWR_STABLE;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG0);
+
+	fsleep(10);
+
+	/*
+	 * phy is not functional in test_powerdown mode, test_powerdown to be
+	 * de-asserted for normal operation
+	 */
+	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG7);
+	reg &= ~PHY_CONFIG7_PHY_TEST_POWERDOWN;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG7);
+
+	/*
+	 * phy reset signal be asserted for minimum 10us after power
+	 * supplies are ramped-up
+	 */
+	fsleep(10);
+
+	/*
+	 * Phy and Pipe Lane reset assert de-assert
+	 */
+	exynosautov920_usb31drd_phy_reset(phy_drd, 0);
+	exynosautov920_usb31drd_lane0_reset(phy_drd, 0);
+
+	/* Pipe_rx0_sris_mode_en  = 1 */
+	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG4);
+	reg |= PHY_CONFIG4_PIPE_RX0_SRIS_MODE_EN;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG4);
+
+	/*
+	 * wait for lane ack outputs to de-assert (tx_ack = rx_ack = 0)
+	 * Exit from the reset state is indicated by de-assertion of *_ack
+	 */
+	exynosautov920_usb31drd_port_phy_ready(phy_drd);
+
+	/* override values for level settings */
+	exynosautov920_usb31drd_cr_write(phy_drd, 0x22, 0x00F5);
+}
+
+static void
+exynosautov920_usb31drd_ssphy_disable(struct exynos5_usbdrd_phy *phy_drd)
+{
+	void __iomem *reg_phy = phy_drd->reg_phy;
+	u32 reg;
+
+	/* 1. Assert reset (phy_reset = 1) */
+	exynosautov920_usb31drd_lane0_reset(phy_drd, 1);
+	exynosautov920_usb31drd_phy_reset(phy_drd, 1);
+
+	/* phy test power down */
+	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG7);
+	reg |= PHY_CONFIG7_PHY_TEST_POWERDOWN;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG7);
+}
+
 static void
 exynosautov920_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 {
@@ -2172,12 +2447,15 @@ exynosautov920_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 	/* after POR low and delay 75us, PHYCLOCK is guaranteed. */
 	fsleep(75);
 
-	/* force pipe3 signal for link */
+	/* Disable forcing pipe interface */
 	reg = readl(reg_phy + EXYNOS850_DRD_LINKCTRL);
-	reg |= LINKCTRL_FORCE_PIPE_EN;
-	reg &= ~LINKCTRL_FORCE_PHYSTATUS;
-	reg |= LINKCTRL_FORCE_RXELECIDLE;
+	reg &= ~LINKCTRL_FORCE_PIPE_EN;
 	writel(reg, reg_phy + EXYNOS850_DRD_LINKCTRL);
+
+	/* Pclk to pipe_clk */
+	reg = readl(reg_phy + EXYNOS2200_DRD_CLKRST);
+	reg |= EXYNOS2200_CLKRST_LINK_PCLK_SEL;
+	writel(reg, reg_phy + EXYNOS2200_DRD_CLKRST);
 }
 
 static void
@@ -2264,6 +2542,8 @@ static int exynosautov920_usbdrd_combo_phy_exit(struct phy *phy)
 
 	if (inst->phy_cfg->id == EXYNOS5_DRDPHY_UTMI)
 		exynosautov920_usbdrd_hsphy_disable(phy_drd);
+	else if (inst->phy_cfg->id == EXYNOS5_DRDPHY_PIPE3)
+		exynosautov920_usb31drd_ssphy_disable(phy_drd);
 
 	/* enable PHY isol */
 	inst->phy_cfg->phy_isol(inst, true);
@@ -2320,10 +2600,44 @@ static int exynosautov920_usbdrd_phy_power_off(struct phy *phy)
 	return 0;
 }
 
+static const char * const exynosautov920_usb30_regulators[] = {
+	"dvdd075-usb30", "vdd18-usb30",
+};
+
 static const char * const exynosautov920_usb20_regulators[] = {
 	"dvdd075-usb20", "vdd18-usb20", "vdd33-usb20",
 };
 
+static const struct
+exynos5_usbdrd_phy_config usb31drd_phy_cfg_exynosautov920[] = {
+	{
+		.id		= EXYNOS5_DRDPHY_PIPE3,
+		.phy_isol	= exynos5_usbdrd_phy_isol,
+		.phy_init	= exynosautov920_usb31drd_pipe3_init,
+	},
+};
+
+static const struct phy_ops exynosautov920_usb31drd_combo_ssphy_ops = {
+	.init		= exynosautov920_usbdrd_phy_init,
+	.exit		= exynosautov920_usbdrd_combo_phy_exit,
+	.power_on	= exynosautov920_usbdrd_phy_power_on,
+	.power_off	= exynosautov920_usbdrd_phy_power_off,
+	.owner		= THIS_MODULE,
+};
+
+static const
+struct exynos5_usbdrd_phy_drvdata exynosautov920_usb31drd_combo_ssphy = {
+	.phy_cfg		= usb31drd_phy_cfg_exynosautov920,
+	.phy_ops		= &exynosautov920_usb31drd_combo_ssphy_ops,
+	.pmu_offset_usbdrd0_phy	= EXYNOSAUTOV920_PHY_CTRL_USB31,
+	.clk_names		= exynos5_clk_names,
+	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
+	.core_clk_names		= exynos5_core_clk_names,
+	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),
+	.regulator_names	= exynosautov920_usb30_regulators,
+	.n_regulators		= ARRAY_SIZE(exynosautov920_usb30_regulators),
+};
+
 static const struct phy_ops exynosautov920_usbdrd_combo_hsphy_ops = {
 	.init		= exynosautov920_usbdrd_phy_init,
 	.exit		= exynosautov920_usbdrd_combo_phy_exit,
@@ -2588,6 +2902,9 @@ static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
 	}, {
 		.compatible = "samsung,exynos990-usbdrd-phy",
 		.data = &exynos990_usbdrd_phy
+	}, {
+		.compatible = "samsung,exynosautov920-usb31drd-combo-ssphy",
+		.data = &exynosautov920_usb31drd_combo_ssphy
 	}, {
 		.compatible = "samsung,exynosautov920-usbdrd-combo-hsphy",
 		.data = &exynosautov920_usbdrd_combo_hsphy
diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
index 4923f9be3d1f..f96c773b85c9 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -690,4 +690,5 @@
 
 /* exynosautov920 */
 #define EXYNOSAUTOV920_PHY_CTRL_USB20				(0x0710)
+#define EXYNOSAUTOV920_PHY_CTRL_USB31				(0x0714)
 #endif /* __LINUX_SOC_EXYNOS_REGS_PMU_H */
-- 
2.34.1


