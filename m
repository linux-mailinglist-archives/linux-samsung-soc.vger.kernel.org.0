Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 952C625C7A0
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  3 Sep 2020 18:57:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728988AbgICQ5h (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 3 Sep 2020 12:57:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728503AbgICQ5f (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Sep 2020 12:57:35 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 005DDC061246
        for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Sep 2020 09:57:30 -0700 (PDT)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kDsY9-0003YH-O4; Thu, 03 Sep 2020 18:57:29 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1kDsY3-005L3l-O4; Thu, 03 Sep 2020 18:57:19 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     kernel@pengutronix.de, Laurent.pinchart@ideasonboard.com,
        krzk@kernel.org, narmstrong@baylibre.com,
        Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu,  3 Sep 2020 18:57:16 +0200
Message-Id: <20200903165717.1272492-16-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200903165717.1272492-1-m.tretter@pengutronix.de>
References: <20200903165717.1272492-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
        metis.ext.pengutronix.de
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=4.0 tests=AWL,BAYES_00,RDNS_NONE,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no autolearn_force=no
        version=3.4.2
Subject: [PATCH 15/16] drm/exynos: split out platform specific code
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Split the driver into the drm bridge driver and the exynos platform
specific driver.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/gpu/drm/exynos/Makefile               |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 312 ++----------------
 drivers/gpu/drm/exynos/exynos_drm_dsi.h       |  57 ++++
 drivers/gpu/drm/exynos/exynos_drm_dsi_pltfm.c | 307 +++++++++++++++++
 4 files changed, 393 insertions(+), 285 deletions(-)
 create mode 100644 drivers/gpu/drm/exynos/exynos_drm_dsi.h
 create mode 100644 drivers/gpu/drm/exynos/exynos_drm_dsi_pltfm.c

diff --git a/drivers/gpu/drm/exynos/Makefile b/drivers/gpu/drm/exynos/Makefile
index 2fd2f3ee4fcf..add70b336935 100644
--- a/drivers/gpu/drm/exynos/Makefile
+++ b/drivers/gpu/drm/exynos/Makefile
@@ -11,7 +11,7 @@ exynosdrm-$(CONFIG_DRM_EXYNOS_FIMD)	+= exynos_drm_fimd.o
 exynosdrm-$(CONFIG_DRM_EXYNOS5433_DECON)	+= exynos5433_drm_decon.o
 exynosdrm-$(CONFIG_DRM_EXYNOS7_DECON)	+= exynos7_drm_decon.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_DPI)	+= exynos_drm_dpi.o
-exynosdrm-$(CONFIG_DRM_EXYNOS_DSI)	+= exynos_drm_dsi.o
+exynosdrm-$(CONFIG_DRM_EXYNOS_DSI)	+= exynos_drm_dsi.o exynos_drm_dsi_pltfm.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_DP)	+= exynos_dp.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_MIXER)	+= exynos_mixer.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_HDMI)	+= exynos_hdmi.o
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index a9dac66c834f..a6ff6326e8f1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -32,8 +32,7 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
-#include "exynos_drm_crtc.h"
-#include "exynos_drm_drv.h"
+#include "exynos_drm_dsi.h"
 
 /* returns true iff both arguments logically differs */
 #define NEQV(a, b) (!(a) ^ !(b))
@@ -44,10 +43,6 @@
 #define DSIM_TX_READY_HS_CLK		(1 << 10)
 #define DSIM_PLL_STABLE			(1 << 31)
 
-/* DSIM_SWRST */
-#define DSIM_FUNCRST			(1 << 16)
-#define DSIM_SWRST			(1 << 0)
-
 /* DSIM_TIMEOUT */
 #define DSIM_LPDR_TIMEOUT(x)		((x) << 0)
 #define DSIM_BTA_TIMEOUT(x)		((x) << 16)
@@ -239,25 +234,6 @@ struct exynos_dsi_transfer {
 #define DSIM_STATE_CMD_LPM		BIT(2)
 #define DSIM_STATE_VIDOUT_AVAILABLE	BIT(3)
 
-enum exynos_reg_offset {
-	EXYNOS_REG_OFS,
-	EXYNOS5433_REG_OFS
-};
-
-struct exynos_dsi_driver_data {
-	enum exynos_reg_offset reg_ofs;
-	unsigned int plltmr_reg;
-	unsigned int has_freqband:1;
-	unsigned int has_clklane_stop:1;
-	unsigned int num_clks;
-	unsigned int max_freq;
-	unsigned int wait_for_reset;
-	unsigned int num_bits_resol;
-	const unsigned int *reg_values;
-	void (*te_handler)(struct drm_encoder *encoder);
-	void (*set_command_node)(struct drm_encoder *encoder, bool enable);
-};
-
 struct exynos_dsi {
 	struct drm_encoder encoder;
 	struct drm_bridge bridge;
@@ -395,176 +371,6 @@ static inline u32 exynos_dsi_read(struct exynos_dsi *dsi, enum reg_idx idx)
 	return readl(dsi->reg_base + reg_ofs[idx]);
 }
 
-enum reg_value_idx {
-	RESET_TYPE,
-	PLL_TIMER,
-	STOP_STATE_CNT,
-	PHYCTRL_ULPS_EXIT,
-	PHYCTRL_VREG_LP,
-	PHYCTRL_SLEW_UP,
-	PHYTIMING_LPX,
-	PHYTIMING_HS_EXIT,
-	PHYTIMING_CLK_PREPARE,
-	PHYTIMING_CLK_ZERO,
-	PHYTIMING_CLK_POST,
-	PHYTIMING_CLK_TRAIL,
-	PHYTIMING_HS_PREPARE,
-	PHYTIMING_HS_ZERO,
-	PHYTIMING_HS_TRAIL
-};
-
-static const unsigned int reg_values[] = {
-	[RESET_TYPE] = DSIM_SWRST,
-	[PLL_TIMER] = 500,
-	[STOP_STATE_CNT] = 0xf,
-	[PHYCTRL_ULPS_EXIT] = 0x0af,
-	[PHYCTRL_VREG_LP] = 0,
-	[PHYCTRL_SLEW_UP] = 0,
-	[PHYTIMING_LPX] = 0x06,
-	[PHYTIMING_HS_EXIT] = 0x0b,
-	[PHYTIMING_CLK_PREPARE] = 0x07,
-	[PHYTIMING_CLK_ZERO] = 0x27,
-	[PHYTIMING_CLK_POST] = 0x0d,
-	[PHYTIMING_CLK_TRAIL] = 0x08,
-	[PHYTIMING_HS_PREPARE] = 0x09,
-	[PHYTIMING_HS_ZERO] = 0x0d,
-	[PHYTIMING_HS_TRAIL] = 0x0b,
-};
-
-static const unsigned int exynos5422_reg_values[] = {
-	[RESET_TYPE] = DSIM_SWRST,
-	[PLL_TIMER] = 500,
-	[STOP_STATE_CNT] = 0xf,
-	[PHYCTRL_ULPS_EXIT] = 0xaf,
-	[PHYCTRL_VREG_LP] = 0,
-	[PHYCTRL_SLEW_UP] = 0,
-	[PHYTIMING_LPX] = 0x08,
-	[PHYTIMING_HS_EXIT] = 0x0d,
-	[PHYTIMING_CLK_PREPARE] = 0x09,
-	[PHYTIMING_CLK_ZERO] = 0x30,
-	[PHYTIMING_CLK_POST] = 0x0e,
-	[PHYTIMING_CLK_TRAIL] = 0x0a,
-	[PHYTIMING_HS_PREPARE] = 0x0c,
-	[PHYTIMING_HS_ZERO] = 0x11,
-	[PHYTIMING_HS_TRAIL] = 0x0d,
-};
-
-static const unsigned int exynos5433_reg_values[] = {
-	[RESET_TYPE] = DSIM_FUNCRST,
-	[PLL_TIMER] = 22200,
-	[STOP_STATE_CNT] = 0xa,
-	[PHYCTRL_ULPS_EXIT] = 0x190,
-	[PHYCTRL_VREG_LP] = 1,
-	[PHYCTRL_SLEW_UP] = 1,
-	[PHYTIMING_LPX] = 0x07,
-	[PHYTIMING_HS_EXIT] = 0x0c,
-	[PHYTIMING_CLK_PREPARE] = 0x09,
-	[PHYTIMING_CLK_ZERO] = 0x2d,
-	[PHYTIMING_CLK_POST] = 0x0e,
-	[PHYTIMING_CLK_TRAIL] = 0x09,
-	[PHYTIMING_HS_PREPARE] = 0x0b,
-	[PHYTIMING_HS_ZERO] = 0x10,
-	[PHYTIMING_HS_TRAIL] = 0x0c,
-};
-
-static void exynos_dsi_te_handler(struct drm_encoder *encoder)
-{
-	exynos_drm_crtc_te_handler(encoder->crtc);
-}
-
-static void exynos_dsi_set_command_mode(struct drm_encoder *encoder,
-					bool enable)
-{
-	struct drm_device *drm = encoder->dev;
-	struct exynos_drm_crtc *crtc;
-
-	crtc = exynos_drm_crtc_get_by_type(drm, EXYNOS_DISPLAY_TYPE_LCD);
-	if (IS_ERR(crtc))
-		return;
-
-	crtc->i80_mode = enable;
-}
-
-static const struct exynos_dsi_driver_data exynos3_dsi_driver_data = {
-	.reg_ofs = EXYNOS_REG_OFS,
-	.plltmr_reg = 0x50,
-	.has_freqband = 1,
-	.has_clklane_stop = 1,
-	.num_clks = 2,
-	.max_freq = 1000,
-	.wait_for_reset = 1,
-	.num_bits_resol = 11,
-	.reg_values = reg_values,
-	.te_handler = exynos_dsi_te_handler,
-	.set_command_node = exynos_dsi_set_command_mode,
-};
-
-static const struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
-	.reg_ofs = EXYNOS_REG_OFS,
-	.plltmr_reg = 0x50,
-	.has_freqband = 1,
-	.has_clklane_stop = 1,
-	.num_clks = 2,
-	.max_freq = 1000,
-	.wait_for_reset = 1,
-	.num_bits_resol = 11,
-	.reg_values = reg_values,
-	.te_handler = exynos_dsi_te_handler,
-	.set_command_node = exynos_dsi_set_command_mode,
-};
-
-static const struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
-	.reg_ofs = EXYNOS_REG_OFS,
-	.plltmr_reg = 0x58,
-	.num_clks = 2,
-	.max_freq = 1000,
-	.wait_for_reset = 1,
-	.num_bits_resol = 11,
-	.reg_values = reg_values,
-	.te_handler = exynos_dsi_te_handler,
-	.set_command_node = exynos_dsi_set_command_mode,
-};
-
-static const struct exynos_dsi_driver_data exynos5433_dsi_driver_data = {
-	.reg_ofs = EXYNOS5433_REG_OFS,
-	.plltmr_reg = 0xa0,
-	.has_clklane_stop = 1,
-	.num_clks = 5,
-	.max_freq = 1500,
-	.wait_for_reset = 0,
-	.num_bits_resol = 12,
-	.reg_values = exynos5433_reg_values,
-	.te_handler = exynos_dsi_te_handler,
-	.set_command_node = exynos_dsi_set_command_mode,
-};
-
-static const struct exynos_dsi_driver_data exynos5422_dsi_driver_data = {
-	.reg_ofs = EXYNOS5433_REG_OFS,
-	.plltmr_reg = 0xa0,
-	.has_clklane_stop = 1,
-	.num_clks = 2,
-	.max_freq = 1500,
-	.wait_for_reset = 1,
-	.num_bits_resol = 12,
-	.reg_values = exynos5422_reg_values,
-	.te_handler = exynos_dsi_te_handler,
-	.set_command_node = exynos_dsi_set_command_mode,
-};
-
-static const struct of_device_id exynos_dsi_of_match[] = {
-	{ .compatible = "samsung,exynos3250-mipi-dsi",
-	  .data = &exynos3_dsi_driver_data },
-	{ .compatible = "samsung,exynos4210-mipi-dsi",
-	  .data = &exynos4_dsi_driver_data },
-	{ .compatible = "samsung,exynos5410-mipi-dsi",
-	  .data = &exynos5_dsi_driver_data },
-	{ .compatible = "samsung,exynos5422-mipi-dsi",
-	  .data = &exynos5422_dsi_driver_data },
-	{ .compatible = "samsung,exynos5433-mipi-dsi",
-	  .data = &exynos5433_dsi_driver_data },
-	{ }
-};
-
 static void exynos_dsi_wait_for_reset(struct exynos_dsi *dsi)
 {
 	if (wait_for_completion_timeout(&dsi->completed, msecs_to_jiffies(300)))
@@ -1611,8 +1417,6 @@ static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
 	.mode_set = exynos_dsi_bridge_mode_set,
 };
 
-MODULE_DEVICE_TABLE(of, exynos_dsi_of_match);
-
 static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 				  struct mipi_dsi_device *device)
 {
@@ -1756,11 +1560,6 @@ static int exynos_dsi_of_read_u32(const struct device_node *np,
 	return ret;
 }
 
-enum {
-	DSI_PORT_IN,
-	DSI_PORT_OUT
-};
-
 static int exynos_dsi_parse_dt(struct exynos_dsi *dsi)
 {
 	struct device *dev = dsi->dev;
@@ -1785,62 +1584,6 @@ static int exynos_dsi_parse_dt(struct exynos_dsi *dsi)
 	return 0;
 }
 
-static struct exynos_dsi *__exynos_dsi_probe(struct platform_device *pdev);
-static void __exynos_dsi_remove(struct exynos_dsi *dsi);
-
-static int exynos_dsi_bind(struct device *dev, struct device *master,
-				void *data)
-{
-	struct platform_device *pdev = to_platform_device(dev);
-	struct exynos_dsi *dsi;
-	struct drm_encoder *encoder;
-	struct drm_device *drm_dev = data;
-	struct device_node *in_bridge_node;
-	struct drm_bridge *in_bridge;
-	int ret;
-
-	dsi = __exynos_dsi_probe(pdev);
-	if (IS_ERR(dsi))
-		return PTR_ERR(dsi);
-	platform_set_drvdata(pdev, dsi);
-
-	encoder = &dsi->encoder;
-	drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_TMDS);
-
-	ret = exynos_drm_set_possible_crtcs(encoder, EXYNOS_DISPLAY_TYPE_LCD);
-	if (ret < 0)
-		return ret;
-
-	in_bridge_node = of_graph_get_remote_node(dev->of_node, DSI_PORT_IN, 0);
-	if (in_bridge_node) {
-		in_bridge = of_drm_find_bridge(in_bridge_node);
-		if (in_bridge)
-			drm_bridge_attach(encoder, in_bridge, NULL, 0);
-		of_node_put(in_bridge_node);
-	}
-
-	ret = drm_bridge_attach(encoder, &dsi->bridge, in_bridge, 0);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-static void exynos_dsi_unbind(struct device *dev, struct device *master,
-				void *data)
-{
-	struct exynos_dsi *dsi = dev_get_drvdata(dev);
-
-	exynos_dsi_disable(dsi);
-
-	__exynos_dsi_remove(dsi);
-}
-
-static const struct component_ops exynos_dsi_component_ops = {
-	.bind	= exynos_dsi_bind,
-	.unbind	= exynos_dsi_unbind,
-};
-
 static struct exynos_dsi *__exynos_dsi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1954,21 +1697,40 @@ static void __exynos_dsi_remove(struct exynos_dsi *dsi)
 	pm_runtime_disable(dsi->dev);
 }
 
-static int exynos_dsi_probe(struct platform_device *pdev)
+/*
+ * Bind/unbind API, used from platforms based on the component framework.
+ */
+struct exynos_dsi *exynos_dsi_bind(struct platform_device *pdev,
+				   struct drm_encoder *encoder)
 {
-	return component_add(&pdev->dev, &exynos_dsi_component_ops);
+	struct exynos_dsi *dsi;
+	struct drm_bridge *previous = drm_bridge_chain_get_first_bridge(encoder);
+	int ret;
+
+	dsi = __exynos_dsi_probe(pdev);
+	if (IS_ERR(dsi))
+		return dsi;
+
+	ret = drm_bridge_attach(encoder, &dsi->bridge, previous, 0);
+	if (ret) {
+		__exynos_dsi_remove(dsi);
+		return ERR_PTR(ret);
+	}
+
+	return dsi;
 }
+EXPORT_SYMBOL_GPL(exynos_dsi_bind);
 
-static int exynos_dsi_remove(struct platform_device *pdev)
+void exynos_dsi_unbind(struct exynos_dsi *dsi)
 {
-	component_del(&pdev->dev, &exynos_dsi_component_ops);
+	exynos_dsi_disable(dsi);
 
-	return 0;
+	__exynos_dsi_remove(dsi);
 }
+EXPORT_SYMBOL_GPL(exynos_dsi_unbind);
 
-static int __maybe_unused exynos_dsi_suspend(struct device *dev)
+int __maybe_unused exynos_dsi_suspend(struct exynos_dsi *dsi)
 {
-	struct exynos_dsi *dsi = dev_get_drvdata(dev);
 	const struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
 	int ret, i;
 
@@ -1996,9 +1758,8 @@ static int __maybe_unused exynos_dsi_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused exynos_dsi_resume(struct device *dev)
+int __maybe_unused exynos_dsi_resume(struct exynos_dsi *dsi)
 {
-	struct exynos_dsi *dsi = dev_get_drvdata(dev);
 	const struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
 	int ret, i;
 
@@ -2030,23 +1791,6 @@ static int __maybe_unused exynos_dsi_resume(struct device *dev)
 	return ret;
 }
 
-static const struct dev_pm_ops exynos_dsi_pm_ops = {
-	SET_RUNTIME_PM_OPS(exynos_dsi_suspend, exynos_dsi_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
-};
-
-struct platform_driver dsi_driver = {
-	.probe = exynos_dsi_probe,
-	.remove = exynos_dsi_remove,
-	.driver = {
-		   .name = "exynos-dsi",
-		   .owner = THIS_MODULE,
-		   .pm = &exynos_dsi_pm_ops,
-		   .of_match_table = exynos_dsi_of_match,
-	},
-};
-
 MODULE_AUTHOR("Tomasz Figa <t.figa@samsung.com>");
 MODULE_AUTHOR("Andrzej Hajda <a.hajda@samsung.com>");
 MODULE_DESCRIPTION("Samsung SoC MIPI DSI Master");
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.h b/drivers/gpu/drm/exynos/exynos_drm_dsi.h
new file mode 100644
index 000000000000..5b44f8bbd38d
--- /dev/null
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.h
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef __EXYNOS_DRM_DSI__
+#define __EXYNOS_DRM_DSI__
+
+struct drm_encoder;
+struct exynos_dsi;
+struct platform_device;
+
+enum exynos_reg_offset {
+	EXYNOS_REG_OFS,
+	EXYNOS5433_REG_OFS
+};
+
+struct exynos_dsi *exynos_dsi_bind(struct platform_device *pdev,
+				   struct drm_encoder *encoder);
+void exynos_dsi_unbind(struct exynos_dsi *dsi);
+
+int exynos_dsi_suspend(struct exynos_dsi *dsi);
+int exynos_dsi_resume(struct exynos_dsi *dsi);
+
+enum reg_value_idx {
+	RESET_TYPE,
+	PLL_TIMER,
+	STOP_STATE_CNT,
+	PHYCTRL_ULPS_EXIT,
+	PHYCTRL_VREG_LP,
+	PHYCTRL_SLEW_UP,
+	PHYTIMING_LPX,
+	PHYTIMING_HS_EXIT,
+	PHYTIMING_CLK_PREPARE,
+	PHYTIMING_CLK_ZERO,
+	PHYTIMING_CLK_POST,
+	PHYTIMING_CLK_TRAIL,
+	PHYTIMING_HS_PREPARE,
+	PHYTIMING_HS_ZERO,
+	PHYTIMING_HS_TRAIL
+};
+
+/* DSIM_SWRST */
+#define DSIM_FUNCRST			(1 << 16)
+#define DSIM_SWRST			(1 << 0)
+
+struct exynos_dsi_driver_data {
+	enum exynos_reg_offset reg_ofs;
+	unsigned int plltmr_reg;
+	unsigned int has_freqband:1;
+	unsigned int has_clklane_stop:1;
+	unsigned int num_clks;
+	unsigned int max_freq;
+	unsigned int wait_for_reset;
+	unsigned int num_bits_resol;
+	const unsigned int *reg_values;
+	void (*te_handler)(struct drm_encoder *encoder);
+	void (*set_command_node)(struct drm_encoder *encoder, bool enable);
+};
+
+#endif /* __EXYNOS_DRM_DSI__ */
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi_pltfm.c b/drivers/gpu/drm/exynos/exynos_drm_dsi_pltfm.c
new file mode 100644
index 000000000000..8d8c3a652773
--- /dev/null
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi_pltfm.c
@@ -0,0 +1,307 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Samsung SoC MIPI DSI Master driver.
+ *
+ * Copyright (c) 2014 Samsung Electronics Co., Ltd
+ *
+ * Contacts: Tomasz Figa <t.figa@samsung.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/component.h>
+#include <linux/gpio/consumer.h>
+#include <linux/irq.h>
+#include <linux/of_device.h>
+#include <linux/of_gpio.h>
+#include <linux/of_graph.h>
+#include <linux/phy/phy.h>
+#include <linux/regulator/consumer.h>
+
+#include <asm/unaligned.h>
+
+#include <video/mipi_display.h>
+#include <video/videomode.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
+
+#include "exynos_drm_crtc.h"
+#include "exynos_drm_drv.h"
+
+#include "exynos_drm_dsi.h"
+
+enum {
+	DSI_PORT_IN,
+	DSI_PORT_OUT
+};
+
+struct exynos_dsi_pltfm {
+	struct exynos_dsi *dsi;
+	struct drm_encoder encoder;
+};
+
+static const unsigned int reg_values[] = {
+	[RESET_TYPE] = DSIM_SWRST,
+	[PLL_TIMER] = 500,
+	[STOP_STATE_CNT] = 0xf,
+	[PHYCTRL_ULPS_EXIT] = 0x0af,
+	[PHYCTRL_VREG_LP] = 0,
+	[PHYCTRL_SLEW_UP] = 0,
+	[PHYTIMING_LPX] = 0x06,
+	[PHYTIMING_HS_EXIT] = 0x0b,
+	[PHYTIMING_CLK_PREPARE] = 0x07,
+	[PHYTIMING_CLK_ZERO] = 0x27,
+	[PHYTIMING_CLK_POST] = 0x0d,
+	[PHYTIMING_CLK_TRAIL] = 0x08,
+	[PHYTIMING_HS_PREPARE] = 0x09,
+	[PHYTIMING_HS_ZERO] = 0x0d,
+	[PHYTIMING_HS_TRAIL] = 0x0b,
+};
+
+static const unsigned int exynos5422_reg_values[] = {
+	[RESET_TYPE] = DSIM_SWRST,
+	[PLL_TIMER] = 500,
+	[STOP_STATE_CNT] = 0xf,
+	[PHYCTRL_ULPS_EXIT] = 0xaf,
+	[PHYCTRL_VREG_LP] = 0,
+	[PHYCTRL_SLEW_UP] = 0,
+	[PHYTIMING_LPX] = 0x08,
+	[PHYTIMING_HS_EXIT] = 0x0d,
+	[PHYTIMING_CLK_PREPARE] = 0x09,
+	[PHYTIMING_CLK_ZERO] = 0x30,
+	[PHYTIMING_CLK_POST] = 0x0e,
+	[PHYTIMING_CLK_TRAIL] = 0x0a,
+	[PHYTIMING_HS_PREPARE] = 0x0c,
+	[PHYTIMING_HS_ZERO] = 0x11,
+	[PHYTIMING_HS_TRAIL] = 0x0d,
+};
+
+static const unsigned int exynos5433_reg_values[] = {
+	[RESET_TYPE] = DSIM_FUNCRST,
+	[PLL_TIMER] = 22200,
+	[STOP_STATE_CNT] = 0xa,
+	[PHYCTRL_ULPS_EXIT] = 0x190,
+	[PHYCTRL_VREG_LP] = 1,
+	[PHYCTRL_SLEW_UP] = 1,
+	[PHYTIMING_LPX] = 0x07,
+	[PHYTIMING_HS_EXIT] = 0x0c,
+	[PHYTIMING_CLK_PREPARE] = 0x09,
+	[PHYTIMING_CLK_ZERO] = 0x2d,
+	[PHYTIMING_CLK_POST] = 0x0e,
+	[PHYTIMING_CLK_TRAIL] = 0x09,
+	[PHYTIMING_HS_PREPARE] = 0x0b,
+	[PHYTIMING_HS_ZERO] = 0x10,
+	[PHYTIMING_HS_TRAIL] = 0x0c,
+};
+
+static void exynos_dsi_te_handler(struct drm_encoder *encoder)
+{
+	exynos_drm_crtc_te_handler(encoder->crtc);
+}
+
+static void exynos_dsi_set_command_mode(struct drm_encoder *encoder,
+					bool enable)
+{
+	struct drm_device *drm = encoder->dev;
+	struct exynos_drm_crtc *crtc;
+
+	crtc = exynos_drm_crtc_get_by_type(drm, EXYNOS_DISPLAY_TYPE_LCD);
+	if (IS_ERR(crtc))
+		return;
+
+	crtc->i80_mode = enable;
+}
+
+static const struct exynos_dsi_driver_data exynos3_dsi_driver_data = {
+	.reg_ofs = EXYNOS_REG_OFS,
+	.plltmr_reg = 0x50,
+	.has_freqband = 1,
+	.has_clklane_stop = 1,
+	.num_clks = 2,
+	.max_freq = 1000,
+	.wait_for_reset = 1,
+	.num_bits_resol = 11,
+	.reg_values = reg_values,
+	.te_handler = exynos_dsi_te_handler,
+	.set_command_node = exynos_dsi_set_command_mode,
+};
+
+static const struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
+	.reg_ofs = EXYNOS_REG_OFS,
+	.plltmr_reg = 0x50,
+	.has_freqband = 1,
+	.has_clklane_stop = 1,
+	.num_clks = 2,
+	.max_freq = 1000,
+	.wait_for_reset = 1,
+	.num_bits_resol = 11,
+	.reg_values = reg_values,
+	.te_handler = exynos_dsi_te_handler,
+	.set_command_node = exynos_dsi_set_command_mode,
+};
+
+static const struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
+	.reg_ofs = EXYNOS_REG_OFS,
+	.plltmr_reg = 0x58,
+	.num_clks = 2,
+	.max_freq = 1000,
+	.wait_for_reset = 1,
+	.num_bits_resol = 11,
+	.reg_values = reg_values,
+	.te_handler = exynos_dsi_te_handler,
+	.set_command_node = exynos_dsi_set_command_mode,
+};
+
+static const struct exynos_dsi_driver_data exynos5433_dsi_driver_data = {
+	.reg_ofs = EXYNOS5433_REG_OFS,
+	.plltmr_reg = 0xa0,
+	.has_clklane_stop = 1,
+	.num_clks = 5,
+	.max_freq = 1500,
+	.wait_for_reset = 0,
+	.num_bits_resol = 12,
+	.reg_values = exynos5433_reg_values,
+	.te_handler = exynos_dsi_te_handler,
+	.set_command_node = exynos_dsi_set_command_mode,
+};
+
+static const struct exynos_dsi_driver_data exynos5422_dsi_driver_data = {
+	.reg_ofs = EXYNOS5433_REG_OFS,
+	.plltmr_reg = 0xa0,
+	.has_clklane_stop = 1,
+	.num_clks = 2,
+	.max_freq = 1500,
+	.wait_for_reset = 1,
+	.num_bits_resol = 12,
+	.reg_values = exynos5422_reg_values,
+	.te_handler = exynos_dsi_te_handler,
+	.set_command_node = exynos_dsi_set_command_mode,
+};
+
+static const struct of_device_id exynos_dsi_of_match[] = {
+	{ .compatible = "samsung,exynos3250-mipi-dsi",
+	  .data = &exynos3_dsi_driver_data },
+	{ .compatible = "samsung,exynos4210-mipi-dsi",
+	  .data = &exynos4_dsi_driver_data },
+	{ .compatible = "samsung,exynos5410-mipi-dsi",
+	  .data = &exynos5_dsi_driver_data },
+	{ .compatible = "samsung,exynos5422-mipi-dsi",
+	  .data = &exynos5422_dsi_driver_data },
+	{ .compatible = "samsung,exynos5433-mipi-dsi",
+	  .data = &exynos5433_dsi_driver_data },
+	{ }
+};
+
+static int exynos_dsi_pltfm_bind(struct device *dev, struct device *master, void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct exynos_dsi_pltfm *dsi = platform_get_drvdata(pdev);
+	struct drm_encoder *encoder = &dsi->encoder;
+	struct drm_device *drm_dev = data;
+	struct drm_bridge *in_bridge;
+	struct device_node *in_bridge_node;
+	struct device_node *node = dev->of_node;
+	int ret;
+
+	drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_TMDS);
+
+	ret = exynos_drm_set_possible_crtcs(encoder, EXYNOS_DISPLAY_TYPE_LCD);
+	if (ret < 0)
+		return ret;
+
+	in_bridge_node = of_graph_get_remote_node(node, DSI_PORT_IN, 0);
+	if (in_bridge_node) {
+		in_bridge = of_drm_find_bridge(in_bridge_node);
+		if (in_bridge)
+			drm_bridge_attach(encoder, in_bridge, NULL, 0);
+		of_node_put(in_bridge_node);
+	}
+
+	dsi->dsi = exynos_dsi_bind(pdev, encoder);
+	if (IS_ERR(dsi->dsi))
+		return PTR_ERR(dsi->dsi);
+
+	return 0;
+}
+
+static void exynos_dsi_pltfm_unbind(struct device *dev, struct device *master,
+				    void *data)
+{
+	struct exynos_dsi_pltfm *dsi = dev_get_drvdata(dev);
+
+	exynos_dsi_unbind(dsi->dsi);
+}
+
+static const struct component_ops exynos_dsi_component_ops = {
+	.bind	= exynos_dsi_pltfm_bind,
+	.unbind	= exynos_dsi_pltfm_unbind,
+};
+
+static int exynos_dsi_pltfm_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct exynos_dsi_pltfm *dsi;
+	unsigned int ret;
+
+	dsi = devm_kzalloc(&pdev->dev, sizeof(*dsi), GFP_KERNEL);
+	if (!dsi)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, dsi);
+
+	ret = component_add(dev, &exynos_dsi_component_ops);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int exynos_dsi_pltfm_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &exynos_dsi_component_ops);
+
+	return 0;
+}
+
+static int exynos_dsi_pltfm_suspend(struct device *dev)
+{
+	struct exynos_dsi_pltfm *dsi = dev_get_drvdata(dev);
+
+	return exynos_dsi_suspend(dsi->dsi);
+}
+
+static int exynos_dsi_pltfm_resume(struct device *dev)
+{
+	struct exynos_dsi_pltfm *dsi = dev_get_drvdata(dev);
+
+	return exynos_dsi_resume(dsi->dsi);
+}
+
+static const struct dev_pm_ops exynos_dsi_pm_ops = {
+	SET_RUNTIME_PM_OPS(exynos_dsi_pltfm_suspend,
+			   exynos_dsi_pltfm_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+};
+
+struct platform_driver dsi_driver = {
+	.probe = exynos_dsi_pltfm_probe,
+	.remove = exynos_dsi_pltfm_remove,
+	.driver = {
+		   .name = "exynos-dsi",
+		   .owner = THIS_MODULE,
+		   .pm = &exynos_dsi_pm_ops,
+		   .of_match_table = exynos_dsi_of_match,
+	},
+};
+
+MODULE_AUTHOR("Tomasz Figa <t.figa@samsung.com>");
+MODULE_AUTHOR("Andrzej Hajda <a.hajda@samsung.com>");
+MODULE_DESCRIPTION("Samsung SoC MIPI DSI Master");
+MODULE_LICENSE("GPL v2");
-- 
2.20.1

