Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF3B046F565
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  9 Dec 2021 21:59:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232403AbhLIVCg (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 9 Dec 2021 16:02:36 -0500
Received: from smtp2.axis.com ([195.60.68.18]:28277 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231624AbhLIVCf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Dec 2021 16:02:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1639083541;
  x=1670619541;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AUCEiMPmxwd/O8Y9YQId1F24RK5XSJC4aMxk8a7OQsY=;
  b=K+UnH8pBUPVbglAcdxPvhpsdRdaaL8sWvJ3l96uVW/+4krOrGae4fKrY
   S+kOthjVK7CYCeBKg4RgI/VQ+DZ4AWQLXmj/XWgrbyrK5KoFiOnEmnYDv
   e3kJc+ZVMa+4oakeR6S0kzflWtYFRXjAtQAx2xljsNgV+vHDb5D5lMIGq
   8y5v1ysc462Ho7qmjVqtwgo/qLFJuNEWshYAg+TGFTjKxa5xga/c0zETi
   3g00I0uYsY4sFWUNwvNj1vTFguWZoUlZkqHoXbVDzF9lYl4e7BZ2C635F
   92k2LhJ3mS9ziyOZMb6wdhbxuoaYkfbZjAJ39A5meozrf2B14KhMkNQU/
   g==;
From:   =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Jaehoon Chung <jh80.chung@samsung.com>
CC:     Doug Anderson <dianders@google.com>, <kernel@axis.com>,
        <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>,
        =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
Subject: [PATCH v4 2/4] mmc: dw_mmc-exynos: Add support for ARTPEC-8
Date:   Thu, 9 Dec 2021 21:54:54 +0100
Message-ID: <20211209205456.11027-3-marten.lindahl@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211209205456.11027-1-marten.lindahl@axis.com>
References: <20211209205456.11027-1-marten.lindahl@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The ARTPEC-8 SoC has a DWMMC controller that is compatible with the
Exynos 7 version v2.70a. The main differences from Exynos 7 is that it
does not support HS400 and has extended data read timeout.

This patch adds compatibility string "axis,artpec8-dw-mshc" for
ARTPEC-8, and DW_MCI_TYPE_ARTPEC8 is added to the dw_mci_exynos_type.

Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---

v2:
 - Change compatible string vendor prefix

v3 -> v4:
 - Add Krzysztof's Acked-by tag

 drivers/mmc/host/dw_mmc-exynos.c | 47 ++++++++++++++++++++++++--------
 1 file changed, 36 insertions(+), 11 deletions(-)

diff --git a/drivers/mmc/host/dw_mmc-exynos.c b/drivers/mmc/host/dw_mmc-exynos.c
index f76eeeb0cc53..86486e6659de 100644
--- a/drivers/mmc/host/dw_mmc-exynos.c
+++ b/drivers/mmc/host/dw_mmc-exynos.c
@@ -28,6 +28,7 @@ enum dw_mci_exynos_type {
 	DW_MCI_TYPE_EXYNOS5420_SMU,
 	DW_MCI_TYPE_EXYNOS7,
 	DW_MCI_TYPE_EXYNOS7_SMU,
+	DW_MCI_TYPE_ARTPEC8,
 };
 
 /* Exynos implementation specific driver private data */
@@ -69,6 +70,9 @@ static struct dw_mci_exynos_compatible {
 	}, {
 		.compatible	= "samsung,exynos7-dw-mshc-smu",
 		.ctrl_type	= DW_MCI_TYPE_EXYNOS7_SMU,
+	}, {
+		.compatible	= "axis,artpec8-dw-mshc",
+		.ctrl_type	= DW_MCI_TYPE_ARTPEC8,
 	},
 };
 
@@ -81,7 +85,8 @@ static inline u8 dw_mci_exynos_get_ciu_div(struct dw_mci *host)
 	else if (priv->ctrl_type == DW_MCI_TYPE_EXYNOS4210)
 		return EXYNOS4210_FIXED_CIU_CLK_DIV;
 	else if (priv->ctrl_type == DW_MCI_TYPE_EXYNOS7 ||
-			priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU)
+			priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU ||
+			priv->ctrl_type == DW_MCI_TYPE_ARTPEC8)
 		return SDMMC_CLKSEL_GET_DIV(mci_readl(host, CLKSEL64)) + 1;
 	else
 		return SDMMC_CLKSEL_GET_DIV(mci_readl(host, CLKSEL)) + 1;
@@ -133,7 +138,8 @@ static void dw_mci_exynos_set_clksel_timing(struct dw_mci *host, u32 timing)
 	u32 clksel;
 
 	if (priv->ctrl_type == DW_MCI_TYPE_EXYNOS7 ||
-		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU)
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU ||
+		priv->ctrl_type == DW_MCI_TYPE_ARTPEC8)
 		clksel = mci_readl(host, CLKSEL64);
 	else
 		clksel = mci_readl(host, CLKSEL);
@@ -141,7 +147,8 @@ static void dw_mci_exynos_set_clksel_timing(struct dw_mci *host, u32 timing)
 	clksel = (clksel & ~SDMMC_CLKSEL_TIMING_MASK) | timing;
 
 	if (priv->ctrl_type == DW_MCI_TYPE_EXYNOS7 ||
-		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU)
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU ||
+		priv->ctrl_type == DW_MCI_TYPE_ARTPEC8)
 		mci_writel(host, CLKSEL64, clksel);
 	else
 		mci_writel(host, CLKSEL, clksel);
@@ -210,14 +217,16 @@ static int dw_mci_exynos_resume_noirq(struct device *dev)
 		return ret;
 
 	if (priv->ctrl_type == DW_MCI_TYPE_EXYNOS7 ||
-		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU)
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU ||
+		priv->ctrl_type == DW_MCI_TYPE_ARTPEC8)
 		clksel = mci_readl(host, CLKSEL64);
 	else
 		clksel = mci_readl(host, CLKSEL);
 
 	if (clksel & SDMMC_CLKSEL_WAKEUP_INT) {
 		if (priv->ctrl_type == DW_MCI_TYPE_EXYNOS7 ||
-			priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU)
+			priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU ||
+			priv->ctrl_type == DW_MCI_TYPE_ARTPEC8)
 			mci_writel(host, CLKSEL64, clksel);
 		else
 			mci_writel(host, CLKSEL, clksel);
@@ -238,7 +247,8 @@ static void dw_mci_exynos_config_hs400(struct dw_mci *host, u32 timing)
 	 * Not supported to configure register
 	 * related to HS400
 	 */
-	if (priv->ctrl_type < DW_MCI_TYPE_EXYNOS5420) {
+	if ((priv->ctrl_type < DW_MCI_TYPE_EXYNOS5420) ||
+		(priv->ctrl_type == DW_MCI_TYPE_ARTPEC8)) {
 		if (timing == MMC_TIMING_MMC_HS400)
 			dev_warn(host->dev,
 				 "cannot configure HS400, unsupported chipset\n");
@@ -394,7 +404,8 @@ static inline u8 dw_mci_exynos_get_clksmpl(struct dw_mci *host)
 	struct dw_mci_exynos_priv_data *priv = host->priv;
 
 	if (priv->ctrl_type == DW_MCI_TYPE_EXYNOS7 ||
-		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU)
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU ||
+		priv->ctrl_type == DW_MCI_TYPE_ARTPEC8)
 		return SDMMC_CLKSEL_CCLK_SAMPLE(mci_readl(host, CLKSEL64));
 	else
 		return SDMMC_CLKSEL_CCLK_SAMPLE(mci_readl(host, CLKSEL));
@@ -406,13 +417,15 @@ static inline void dw_mci_exynos_set_clksmpl(struct dw_mci *host, u8 sample)
 	struct dw_mci_exynos_priv_data *priv = host->priv;
 
 	if (priv->ctrl_type == DW_MCI_TYPE_EXYNOS7 ||
-		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU)
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU ||
+		priv->ctrl_type == DW_MCI_TYPE_ARTPEC8)
 		clksel = mci_readl(host, CLKSEL64);
 	else
 		clksel = mci_readl(host, CLKSEL);
 	clksel = SDMMC_CLKSEL_UP_SAMPLE(clksel, sample);
 	if (priv->ctrl_type == DW_MCI_TYPE_EXYNOS7 ||
-		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU)
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU ||
+		priv->ctrl_type == DW_MCI_TYPE_ARTPEC8)
 		mci_writel(host, CLKSEL64, clksel);
 	else
 		mci_writel(host, CLKSEL, clksel);
@@ -425,7 +438,8 @@ static inline u8 dw_mci_exynos_move_next_clksmpl(struct dw_mci *host)
 	u8 sample;
 
 	if (priv->ctrl_type == DW_MCI_TYPE_EXYNOS7 ||
-		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU)
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU ||
+		priv->ctrl_type == DW_MCI_TYPE_ARTPEC8)
 		clksel = mci_readl(host, CLKSEL64);
 	else
 		clksel = mci_readl(host, CLKSEL);
@@ -434,7 +448,8 @@ static inline u8 dw_mci_exynos_move_next_clksmpl(struct dw_mci *host)
 	clksel = SDMMC_CLKSEL_UP_SAMPLE(clksel, sample);
 
 	if (priv->ctrl_type == DW_MCI_TYPE_EXYNOS7 ||
-		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU)
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU ||
+		priv->ctrl_type == DW_MCI_TYPE_ARTPEC8)
 		mci_writel(host, CLKSEL64, clksel);
 	else
 		mci_writel(host, CLKSEL, clksel);
@@ -543,6 +558,14 @@ static const struct dw_mci_drv_data exynos_drv_data = {
 	.prepare_hs400_tuning	= dw_mci_exynos_prepare_hs400_tuning,
 };
 
+static const struct dw_mci_drv_data artpec_drv_data = {
+	.common_caps		= MMC_CAP_CMD23,
+	.init			= dw_mci_exynos_priv_init,
+	.set_ios		= dw_mci_exynos_set_ios,
+	.parse_dt		= dw_mci_exynos_parse_dt,
+	.execute_tuning		= dw_mci_exynos_execute_tuning,
+};
+
 static const struct of_device_id dw_mci_exynos_match[] = {
 	{ .compatible = "samsung,exynos4412-dw-mshc",
 			.data = &exynos_drv_data, },
@@ -556,6 +579,8 @@ static const struct of_device_id dw_mci_exynos_match[] = {
 			.data = &exynos_drv_data, },
 	{ .compatible = "samsung,exynos7-dw-mshc-smu",
 			.data = &exynos_drv_data, },
+	{ .compatible = "axis,artpec8-dw-mshc",
+			.data = &artpec_drv_data, },
 	{},
 };
 MODULE_DEVICE_TABLE(of, dw_mci_exynos_match);
-- 
2.20.1

