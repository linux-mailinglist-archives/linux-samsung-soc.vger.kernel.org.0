Return-Path: <linux-samsung-soc+bounces-8598-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA36AC67CA
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 28 May 2025 12:54:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D19FB4E47EF
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 28 May 2025 10:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F7B627A915;
	Wed, 28 May 2025 10:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="2Yk7R9Xo"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C97F217F23
	for <linux-samsung-soc@vger.kernel.org>; Wed, 28 May 2025 10:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748429654; cv=none; b=FyEzQp/4oD01qXLEnRyhGMxY/0ANW/UOAgcOTxyl3anq0BM00TKFiAXdLXgNjliVj0PJKcoJbDgmRqpapzS01AZRBnwftbhNEtHdbVtlRTmS4A/CdFhMynvEPZARkl25tFo/6JBdmmRbJ0BsASaeSG09HOe/4sqOSPXdsjBZIV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748429654; c=relaxed/simple;
	bh=0pPylfzDfxShLC+1NXvmbMDM0mKUGGgu8xx79UZwJpw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e367uTxpbCY9OYf5EAMrCUsnYfe9qzsziBz11JTTB7w2qspGdSj7Gz2nft/7zXF59TJFkxWGEgot0+zfQSmoyW8eZXgDLerDvzQMio7BjvZH08mzPdijcyzt7/cjWGqO/XBZ6WGsmcc2z7esiRj7lJqiGsKq9VE2MsxO+2Iat4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=2Yk7R9Xo; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=2Yk7R9XoMM9siRLnRktw0LMuwLrIRn1j1Z6cgy9JIdD0DZn0wd/55pqoZ+UkCeaU2CgbXd8spYt/z4l1nkDBZ+xCswVRbnnQyo6sAZQYLRMD3lGQbf8jaqEMhgFpagcb4Inx0szqQTSl8U+D1zUd/TJgJd0GEEOGMkyXY04RgRBPXQFciayQwxn3w7Tce/+RDm67dTxcVw7wYI/eY4WPu+ghI0z3Mifpdyr5ohqEKSxTqISAAHqNgoIc8TB00Wp0D2jGrN9CjI/tI+ECDmeMv7IPvknBIIDdifcvUrvsMOH0u70oLPGkN41qHlRipEgrAP9gpwSGaznoP6poFhswsg==; s=purelymail3; d=purelymail.com; v=1; bh=0pPylfzDfxShLC+1NXvmbMDM0mKUGGgu8xx79UZwJpw=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 68229:10037:null:purelymail
X-Pm-Original-To: linux-samsung-soc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1157235224;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Wed, 28 May 2025 10:53:49 +0000 (UTC)
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] clk: samsung: exynos990: Add CMU_HSI1 block
Date: Wed, 28 May 2025 11:52:52 +0100
Message-ID: <20250528105252.157533-3-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250528105252.157533-1-umer.uddin@mentallysanemainliners.org>
References: <20250528105252.157533-1-umer.uddin@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

The CMU_HSI1 block is used for providing clocks for the DesignWare
MMC Controller, PCIE Subsystem and UFS subsystem, and has six
dependency clocks from CMU_TOP.

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 drivers/clk/samsung/clk-exynos990.c | 221 ++++++++++++++++++++++++++++
 1 file changed, 221 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-=
exynos990.c
index 8d3f193d2..91ecbafcf 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -20,6 +20,7 @@
 #define CLKS_NR_TOP (CLK_GOUT_CMU_VRA_BUS + 1)
 #define CLKS_NR_HSI0 (CLK_GOUT_HSI0_XIU_D_HSI0_ACLK + 1)
 #define CLKS_NR_PERIS (CLK_GOUT_PERIS_OTP_CON_TOP_OSCCLK + 1)
+#define CLKS_NR_HSI1 (CLK_MOUT_HSI1_UFS_EMBD_USER + 1)
=20
 /* ---- CMU_TOP ----------------------------------------------------------=
--- */
=20
@@ -1483,6 +1484,222 @@ static void __init exynos990_cmu_peris_init(struct =
device_node *np)
 CLK_OF_DECLARE(exynos990_cmu_peris, "samsung,exynos990-cmu-peris",
 =09       exynos990_cmu_peris_init);
=20
+/* ---- CMU_HSI1 ---------------------------------------------------------=
--- */
+
+/* Register Offset definitions for CMU_HSI1 (0x13000000) */
+#define PLL_CON0_MUX_CLKCMU_HSI1_BUS_USER=09=09=09=09=09=09=09=09=09=09=09=
=090x0600
+#define PLL_CON1_MUX_CLKCMU_HSI1_BUS_USER=09=09=09=09=09=09=09=09=09=09=09=
=090x0604
+#define PLL_CON0_MUX_CLKCMU_HSI1_MMC_CARD_USER=09=09=09=09=09=09=09=09=09=
=09=09=090x0610
+#define PLL_CON1_MUX_CLKCMU_HSI1_MMC_CARD_USER=09=09=09=09=09=09=09=09=09=
=09=09=090x0614
+#define PLL_CON0_MUX_CLKCMU_HSI1_PCIE_USER=09=09=09=09=09=09=09=09=09=09=
=09=090x0620
+#define PLL_CON1_MUX_CLKCMU_HSI1_PCIE_USER=09=09=09=09=09=09=09=09=09=09=
=09=090x0624
+#define PLL_CON0_MUX_CLKCMU_HSI1_UFS_CARD_USER=09=09=09=09=09=09=09=09=09=
=09=09=090x0630
+#define PLL_CON1_MUX_CLKCMU_HSI1_UFS_CARD_USER=09=09=09=09=09=09=09=09=09=
=09=09=090x0634
+#define PLL_CON0_MUX_CLKCMU_HSI1_UFS_EMBD_USER=09=09=09=09=09=09=09=09=09=
=09=09=090x0640
+#define PLL_CON1_MUX_CLKCMU_HSI1_UFS_EMBD_USER=09=09=09=09=09=09=09=09=09=
=09=09=090x0644
+#define HSI1_CMU_HSI1_CONTROLLER_OPTION=09=09=09=09=09=09=09=09=09=09=09=
=09=090x0800
+#define CLK_CON_GAT_CLK_BLK_HSI1_UID_PCIE_GEN2_IPCLKPORT_PHY_REFCLK_IN=09=
=09=09=09=09=09=09=09=090x2000
+#define CLK_CON_GAT_CLK_BLK_HSI1_UID_PCIE_GEN4_0_IPCLKPORT_PCIE_001_PCIE_S=
UB_CTRL_INST_0_PHY_REFCLK_IN=09=09=09=09=090x2004
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_D_TZPC_HSI1_IPCLKPORT_PCLK=09=09=09=
=09=09=09=09=09=090x2008
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_GPIO_HSI1_IPCLKPORT_PCLK=09=09=09=09=
=09=09=09=09=09=090x200c
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_HSI1_CMU_HSI1_IPCLKPORT_PCLK=09=09=
=09=09=09=09=09=09=090x2010
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_LHM_AXI_P_HSI1_IPCLKPORT_I_CLK=09=09=
=09=09=09=09=09=09=090x2014
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_LHS_ACEL_D_HSI1_IPCLKPORT_I_CLK=09=
=09=09=09=09=09=09=09=090x2018
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_MMC_CARD_IPCLKPORT_I_ACLK=09=09=09=
=09=09=09=09=09=09=090x201c
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_MMC_CARD_IPCLKPORT_SDCLKIN=09=09=09=
=09=09=09=09=09=090x2020
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN2_IPCLKPORT_DBI_ACLK=09=09=
=09=09=09=09=09=09=090x2024
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN2_IPCLKPORT_IEEE1500_WRAPPER=
_FOR_PCIEG2_PHY_X1_INST_0_I_SCL_APB_PCLK=09=09=090x2028
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN2_IPCLKPORT_MSTR_ACLK=09=09=
=09=09=09=09=09=09=090x202c
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN2_IPCLKPORT_PCIE_SUB_CTRL_IN=
ST_0_I_DRIVER_APB_CLK=09=09=09=09=09=090x2030
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN2_IPCLKPORT_PIPE2_DIGITAL_X1=
_WRAP_INST_0_I_APB_PCLK_SCL=09=09=09=09=090x2034
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN2_IPCLKPORT_SLV_ACLK=09=09=
=09=09=09=09=09=09=090x2038
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN4_0_IPCLKPORT_PCIE_001_G4X2_=
DWC_PCIE_CTL_INST_0_DBI_ACLK_UG=09=09=09=090x203c
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN4_0_IPCLKPORT_PCIE_001_G4X2_=
DWC_PCIE_CTL_INST_0_MSTR_ACLK_UG=09=09=09=090x2040
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN4_0_IPCLKPORT_PCIE_001_G4X2_=
DWC_PCIE_CTL_INST_0_SLV_ACLK_UG=09=09=09=090x2044
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN4_0_IPCLKPORT_PCIE_001_PCIE_=
SUB_CTRL_INST_0_I_DRIVER_APB_CLK=09=09=09=090x2048
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN4_0_IPCLKPORT_PCS_PMA_INST_0=
_PIPE_PAL_PCIE_INST_0_I_APB_PCLK=09=09=09=090x204c
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN4_0_IPCLKPORT_PCS_PMA_INST_0=
_SF_PCIEPHY000X2_LN07LPP_QCH_TM_WRAPPER_INST_0_I_APB_PCLK=090x2050
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_IA_GEN2_IPCLKPORT_I_CLK=09=09=
=09=09=09=09=09=09=090x2054
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_IA_GEN4_0_IPCLKPORT_I_CLK=09=09=
=09=09=09=09=09=09=090x2058
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PPMU_HSI1_IPCLKPORT_ACLK=09=09=09=09=
=09=09=09=09=09=090x205c
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PPMU_HSI1_IPCLKPORT_PCLK=09=09=09=09=
=09=09=09=09=09=090x2060
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_RSTNSYNC_CLK_HSI1_BUS_IPCLKPORT_CLK=
=09=09=09=09=09=09=09=090x2064
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_RSTNSYNC_CLK_HSI1_OSCCLK_IPCLKPORT_C=
LK=09=09=09=09=09=09=09=090x2068
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_SYSMMU_HSI1_IPCLKPORT_CLK_S2=09=09=
=09=09=09=09=09=09=090x206c
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_SYSREG_HSI1_IPCLKPORT_PCLK=09=09=09=
=09=09=09=09=09=090x2070
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_UFS_CARD_IPCLKPORT_I_ACLK=09=09=09=
=09=09=09=09=09=09=090x2074
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_UFS_CARD_IPCLKPORT_I_CLK_UNIPRO=09=
=09=09=09=09=09=09=09=090x2078
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_UFS_CARD_IPCLKPORT_I_FMP_CLK=09=09=
=09=09=09=09=09=09=090x207c
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_UFS_EMBD_IPCLKPORT_I_ACLK=09=09=09=
=09=09=09=09=09=09=090x2080
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_UFS_EMBD_IPCLKPORT_I_CLK_UNIPRO=09=
=09=09=09=09=09=09=09=090x2084
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_UFS_EMBD_IPCLKPORT_I_FMP_CLK=09=09=
=09=09=09=09=09=09=090x2088
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_VGEN_LITE_HSI1_IPCLKPORT_CLK=09=09=
=09=09=09=09=09=09=090x208c
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_XIU_D_HSI1_IPCLKPORT_ACLK=09=09=09=
=09=09=09=09=09=09=090x2090
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_XIU_P_HSI1_IPCLKPORT_ACLK=09=09=09=
=09=09=09=09=09=09=090x2094
+#define DMYQCH_CON_PCIE_GEN2_QCH_REF=09=09=09=09=09=09=09=09=09=09=09=09=
=090x3000
+#define DMYQCH_CON_PCIE_GEN4_0_QCH_REF=09=09=09=09=09=09=09=09=09=09=09=09=
=090x3004
+#define QCH_CON_D_TZPC_HSI1_QCH=09=09=09=09=09=09=09=09=09=09=09=09=09=090=
x3024
+#define QCH_CON_GPIO_HSI1_QCH=09=09=09=09=09=09=09=09=09=09=09=09=09=090x3=
028
+#define QCH_CON_HSI1_CMU_HSI1_QCH=09=09=09=09=09=09=09=09=09=09=09=09=090x=
302c
+#define QCH_CON_LHM_AXI_P_HSI1_QCH=09=09=09=09=09=09=09=09=09=09=09=09=090=
x3030
+#define QCH_CON_LHS_ACEL_D_HSI1_QCH=09=09=09=09=09=09=09=09=09=09=09=09=09=
0x3034
+#define QCH_CON_MMC_CARD_QCH=09=09=09=09=09=09=09=09=09=09=09=09=09=090x30=
38
+#define QCH_CON_PCIE_GEN2_QCH_APB=09=09=09=09=09=09=09=09=09=09=09=09=090x=
303c
+#define QCH_CON_PCIE_GEN2_QCH_DBI=09=09=09=09=09=09=09=09=09=09=09=09=090x=
3040
+#define QCH_CON_PCIE_GEN2_QCH_MSTR=09=09=09=09=09=09=09=09=09=09=09=09=090=
x3044
+#define QCH_CON_PCIE_GEN2_QCH_PCS=09=09=09=09=09=09=09=09=09=09=09=09=090x=
3048
+#define QCH_CON_PCIE_GEN2_QCH_PHY=09=09=09=09=09=09=09=09=09=09=09=09=090x=
304c
+#define QCH_CON_PCIE_GEN4_0_QCH_APB=09=09=09=09=09=09=09=09=09=09=09=09=09=
0x3050
+#define QCH_CON_PCIE_GEN4_0_QCH_AXI=09=09=09=09=09=09=09=09=09=09=09=09=09=
0x3054
+#define QCH_CON_PCIE_GEN4_0_QCH_DBI=09=09=09=09=09=09=09=09=09=09=09=09=09=
0x3058
+#define QCH_CON_PCIE_GEN4_0_QCH_PCS_APB=09=09=09=09=09=09=09=09=09=09=09=
=09=090x305c
+#define QCH_CON_PCIE_GEN4_0_QCH_PMA_APB=09=09=09=09=09=09=09=09=09=09=09=
=09=090x3060
+#define QCH_CON_PCIE_IA_GEN2_QCH=09=09=09=09=09=09=09=09=09=09=09=09=090x3=
064
+#define QCH_CON_PCIE_IA_GEN4_0_QCH=09=09=09=09=09=09=09=09=09=09=09=09=090=
x3068
+#define QCH_CON_PPMU_HSI1_QCH=09=09=09=09=09=09=09=09=09=09=09=09=09=090x3=
06c
+#define QCH_CON_SYSMMU_HSI1_QCH=09=09=09=09=09=09=09=09=09=09=09=09=09=090=
x3070
+#define QCH_CON_SYSREG_HSI1_QCH=09=09=09=09=09=09=09=09=09=09=09=09=09=090=
x3074
+#define QCH_CON_UFS_CARD_QCH=09=09=09=09=09=09=09=09=09=09=09=09=09=090x30=
78
+#define QCH_CON_UFS_CARD_QCH_FMP=09=09=09=09=09=09=09=09=09=09=09=09=090x3=
07c
+#define QCH_CON_UFS_EMBD_QCH=09=09=09=09=09=09=09=09=09=09=09=09=09=090x30=
80
+#define QCH_CON_UFS_EMBD_QCH_FMP=09=09=09=09=09=09=09=09=09=09=09=09=090x3=
084
+#define QCH_CON_VGEN_LITE_HSI1_QCH=09=09=09=09=09=09=09=09=09=09=09=09=090=
x3088
+
+static const unsigned long hsi1_clk_regs[] __initconst =3D {
+=09PLL_CON0_MUX_CLKCMU_HSI1_BUS_USER,
+=09PLL_CON1_MUX_CLKCMU_HSI1_BUS_USER,
+=09PLL_CON0_MUX_CLKCMU_HSI1_MMC_CARD_USER,
+=09PLL_CON1_MUX_CLKCMU_HSI1_MMC_CARD_USER,
+=09PLL_CON0_MUX_CLKCMU_HSI1_PCIE_USER,
+=09PLL_CON1_MUX_CLKCMU_HSI1_PCIE_USER,
+=09PLL_CON0_MUX_CLKCMU_HSI1_UFS_CARD_USER,
+=09PLL_CON1_MUX_CLKCMU_HSI1_UFS_CARD_USER,
+=09PLL_CON0_MUX_CLKCMU_HSI1_UFS_EMBD_USER,
+=09PLL_CON1_MUX_CLKCMU_HSI1_UFS_EMBD_USER,
+=09HSI1_CMU_HSI1_CONTROLLER_OPTION,
+=09CLK_CON_GAT_CLK_BLK_HSI1_UID_PCIE_GEN2_IPCLKPORT_PHY_REFCLK_IN,
+=09CLK_CON_GAT_CLK_BLK_HSI1_UID_PCIE_GEN4_0_IPCLKPORT_PCIE_001_PCIE_SUB_CT=
RL_INST_0_PHY_REFCLK_IN,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_D_TZPC_HSI1_IPCLKPORT_PCLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_GPIO_HSI1_IPCLKPORT_PCLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_HSI1_CMU_HSI1_IPCLKPORT_PCLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_LHM_AXI_P_HSI1_IPCLKPORT_I_CLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_LHS_ACEL_D_HSI1_IPCLKPORT_I_CLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_MMC_CARD_IPCLKPORT_I_ACLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_MMC_CARD_IPCLKPORT_SDCLKIN,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN2_IPCLKPORT_DBI_ACLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN2_IPCLKPORT_IEEE1500_WRAPPER_FOR_=
PCIEG2_PHY_X1_INST_0_I_SCL_APB_PCLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN2_IPCLKPORT_MSTR_ACLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN2_IPCLKPORT_PCIE_SUB_CTRL_INST_0_=
I_DRIVER_APB_CLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN2_IPCLKPORT_PIPE2_DIGITAL_X1_WRAP=
_INST_0_I_APB_PCLK_SCL,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN2_IPCLKPORT_SLV_ACLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN4_0_IPCLKPORT_PCIE_001_G4X2_DWC_P=
CIE_CTL_INST_0_DBI_ACLK_UG,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN4_0_IPCLKPORT_PCIE_001_G4X2_DWC_P=
CIE_CTL_INST_0_MSTR_ACLK_UG,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN4_0_IPCLKPORT_PCIE_001_G4X2_DWC_P=
CIE_CTL_INST_0_SLV_ACLK_UG,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN4_0_IPCLKPORT_PCIE_001_PCIE_SUB_C=
TRL_INST_0_I_DRIVER_APB_CLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN4_0_IPCLKPORT_PCS_PMA_INST_0_PIPE=
_PAL_PCIE_INST_0_I_APB_PCLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN4_0_IPCLKPORT_PCS_PMA_INST_0_SF_P=
CIEPHY000X2_LN07LPP_QCH_TM_WRAPPER_INST_0_I_APB_PCLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_IA_GEN2_IPCLKPORT_I_CLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_IA_GEN4_0_IPCLKPORT_I_CLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_PPMU_HSI1_IPCLKPORT_ACLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_PPMU_HSI1_IPCLKPORT_PCLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_RSTNSYNC_CLK_HSI1_BUS_IPCLKPORT_CLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_RSTNSYNC_CLK_HSI1_OSCCLK_IPCLKPORT_CLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_SYSMMU_HSI1_IPCLKPORT_CLK_S2,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_SYSREG_HSI1_IPCLKPORT_PCLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_UFS_CARD_IPCLKPORT_I_ACLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_UFS_CARD_IPCLKPORT_I_CLK_UNIPRO,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_UFS_CARD_IPCLKPORT_I_FMP_CLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_UFS_EMBD_IPCLKPORT_I_ACLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_UFS_EMBD_IPCLKPORT_I_CLK_UNIPRO,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_UFS_EMBD_IPCLKPORT_I_FMP_CLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_VGEN_LITE_HSI1_IPCLKPORT_CLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_XIU_D_HSI1_IPCLKPORT_ACLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_XIU_P_HSI1_IPCLKPORT_ACLK,
+=09DMYQCH_CON_PCIE_GEN2_QCH_REF,
+=09DMYQCH_CON_PCIE_GEN4_0_QCH_REF,
+=09QCH_CON_D_TZPC_HSI1_QCH,
+=09QCH_CON_GPIO_HSI1_QCH,
+=09QCH_CON_HSI1_CMU_HSI1_QCH,
+=09QCH_CON_LHM_AXI_P_HSI1_QCH,
+=09QCH_CON_LHS_ACEL_D_HSI1_QCH,
+=09QCH_CON_MMC_CARD_QCH,
+=09QCH_CON_PCIE_GEN2_QCH_APB,
+=09QCH_CON_PCIE_GEN2_QCH_DBI,
+=09QCH_CON_PCIE_GEN2_QCH_MSTR,
+=09QCH_CON_PCIE_GEN2_QCH_PCS,
+=09QCH_CON_PCIE_GEN2_QCH_PHY,
+=09QCH_CON_PCIE_GEN4_0_QCH_APB,
+=09QCH_CON_PCIE_GEN4_0_QCH_AXI,
+=09QCH_CON_PCIE_GEN4_0_QCH_DBI,
+=09QCH_CON_PCIE_GEN4_0_QCH_PCS_APB,
+=09QCH_CON_PCIE_GEN4_0_QCH_PMA_APB,
+=09QCH_CON_PCIE_IA_GEN2_QCH,
+=09QCH_CON_PCIE_IA_GEN4_0_QCH,
+=09QCH_CON_PPMU_HSI1_QCH,
+=09QCH_CON_SYSMMU_HSI1_QCH,
+=09QCH_CON_SYSREG_HSI1_QCH,
+=09QCH_CON_UFS_CARD_QCH,
+=09QCH_CON_UFS_CARD_QCH_FMP,
+=09QCH_CON_UFS_EMBD_QCH,
+=09QCH_CON_UFS_EMBD_QCH_FMP,
+=09QCH_CON_VGEN_LITE_HSI1_QCH,
+};
+
+/* Parent clock list for CMU_HSI1 muxes */
+PNAME(mout_hsi1_ufs_embd_p) =3D=09=09{ "oscclk",
+=09=09=09=09=09  "dout_cmu_shared0_div4",
+=09=09=09=09=09  "dout_cmu_shared2_div2",
+=09=09=09=09=09  "oscclk" };
+PNAME(mout_hsi1_ufs_card_p) =3D=09=09{ "oscclk",
+=09=09=09=09=09  "dout_cmu_shared0_div4",
+=09=09=09=09=09  "dout_cmu_shared2_div2",
+=09=09=09=09=09  "oscclk" };
+PNAME(mout_hsi1_pcie_p) =3D=09=09{ "oscclk", "fout_shared2_pll" };
+PNAME(mout_hsi1_bus_p) =3D=09=09{ "dout_cmu_shared0_div3",
+=09=09=09=09=09  "dout_cmu_shared0_div4",
+=09=09=09=09=09  "dout_cmu_shared1_div4",
+=09=09=09=09=09  "dout_cmu_shared4_div3",
+=09=09=09=09=09  "dout_cmu_shared2_div2",
+=09=09=09=09=09  "fout_mmc_pll",
+=09=09=09=09=09  "oscclk",
+=09=09=09=09=09  "oscclk" };
+PNAME(mout_hsi1_mmc_card_p) =3D=09=09{ "oscclk",
+=09=09=09=09=09  "fout_shared2_pll",
+=09=09=09=09=09  "fout_mmc_pll",
+=09=09=09=09=09  "dout_cmu_shared0_div4" };
+PNAME(mout_hsi1_bus_user_p) =3D=09=09{ "oscclk", "dout_cmu_hsi1_bus" };
+PNAME(mout_hsi1_mmc_card_user_p) =3D=09{ "oscclk", "dout_cmu_hsi1_mmc_card=
" };
+PNAME(mout_hsi1_pcie_user_p) =3D=09=09{ "oscclk", "dout_cmu_hsi1_pcie" };
+PNAME(mout_hsi1_ufs_card_user_p) =3D=09{ "oscclk", "dout_cmu_hsi1_ufs_card=
" };
+PNAME(mout_hsi1_ufs_embd_user_p) =3D=09{ "oscclk", "dout_cmu_hsi1_ufs_embd=
" };
+
+static const struct samsung_mux_clock hsi1_mux_clks[] __initconst =3D {
+=09MUX(CLK_MOUT_HSI1_BUS_USER, "mout_hsi1_bus_user",
+=09    mout_hsi1_bus_user_p, PLL_CON0_MUX_CLKCMU_HSI1_BUS_USER,
+=09    4, 1),
+=09MUX(CLK_MOUT_HSI1_MMC_CARD_USER, "mout_hsi1_mmc_card_user",
+=09    mout_hsi1_mmc_card_user_p, PLL_CON0_MUX_CLKCMU_HSI1_MMC_CARD_USER,
+=09    4, 1),
+=09MUX(CLK_MOUT_HSI1_PCIE_USER, "mout_hsi1_pcie_user",
+=09    mout_hsi1_pcie_user_p, PLL_CON0_MUX_CLKCMU_HSI1_PCIE_USER,
+=09    4, 1),
+=09MUX(CLK_MOUT_HSI1_UFS_CARD_USER, "mout_hsi1_ufs_card_user",
+=09    mout_hsi1_ufs_card_user_p, PLL_CON0_MUX_CLKCMU_HSI1_UFS_CARD_USER,
+=09    4, 1),
+=09MUX(CLK_MOUT_HSI1_UFS_EMBD_USER, "mout_hsi1_ufs_embd_user",
+=09    mout_hsi1_ufs_embd_user_p, PLL_CON0_MUX_CLKCMU_HSI1_UFS_EMBD_USER,
+=09    4, 1),
+};
+
+static const struct samsung_cmu_info hsi1_cmu_info __initconst =3D {
+=09.mux_clks =3D hsi1_mux_clks,
+=09.nr_mux_clks =3D ARRAY_SIZE(hsi1_mux_clks),
+=09.nr_clk_ids =3D CLKS_NR_HSI1,
+=09.clk_regs =3D hsi1_clk_regs,
+=09.nr_clk_regs =3D ARRAY_SIZE(hsi1_clk_regs),
+=09.clk_name=09=09=3D "bus",
+};
+
 /* ----- platform_driver ----- */
=20
 static int __init exynos990_cmu_probe(struct platform_device *pdev)
@@ -1501,6 +1718,10 @@ static const struct of_device_id exynos990_cmu_of_ma=
tch[] =3D {
 =09=09.compatible =3D "samsung,exynos990-cmu-hsi0",
 =09=09.data =3D &hsi0_cmu_info,
 =09},
+=09{
+=09=09.compatible =3D "samsung,exynos990-cmu-hsi1",
+=09=09.data =3D &hsi1_cmu_info,
+=09},
 =09{ },
 };
=20
--=20
2.47.2


