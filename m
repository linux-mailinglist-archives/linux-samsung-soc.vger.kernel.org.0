Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5E3B61FC08
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  7 Nov 2022 18:53:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232124AbiKGRxv (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 7 Nov 2022 12:53:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232213AbiKGRxT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Nov 2022 12:53:19 -0500
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71A7C264AB;
        Mon,  7 Nov 2022 09:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1667843481; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BWOpGMi/Gahb/HHA/RmYT4lAUKRpVuAkm6/xu9rRqQo=;
        b=CHHJ5Aijxticl8HcJZ7tOrNmxB4mohR5XIniUHXf+VHXqamkVyk1a9MQRrP04gPpEiAve6
        81xzDOyx64JFBqrXHBk1+GBQKOXZ6+LLUu4IP9WZYMLoJAZfvfAmInEvu8MnmXVSASjBsT
        VA67qsfO4XnTwFYZ93w9oISYz/lcBx8=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 09/26] drm: exynos: Remove #ifdef guards for PM related functions
Date:   Mon,  7 Nov 2022 17:50:49 +0000
Message-Id: <20221107175106.360578-10-paul@crapouillou.net>
In-Reply-To: <20221107175106.360578-1-paul@crapouillou.net>
References: <20221107175106.360578-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use the DEFINE_RUNTIME_DEV_PM_OPS(), SYSTEM_SLEEP_PM_OPS(),
RUNTIME_PM_OPS() and pm_ptr() macros to handle the runtime and suspend
PM callbacks.

These macros allow the suspend and resume functions to be automatically
dropped by the compiler when CONFIG_PM is disabled, without having
to use #ifdef guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 13 ++++---------
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    | 12 +++---------
 drivers/gpu/drm/exynos/exynos_dp.c            | 11 +++--------
 drivers/gpu/drm/exynos/exynos_drm_fimc.c      | 11 +++--------
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 11 +++--------
 drivers/gpu/drm/exynos/exynos_drm_g2d.c       | 10 +++-------
 drivers/gpu/drm/exynos/exynos_drm_mic.c       | 11 +++--------
 drivers/gpu/drm/exynos/exynos_drm_rotator.c   | 12 +++---------
 drivers/gpu/drm/exynos/exynos_drm_scaler.c    | 12 +++---------
 9 files changed, 28 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 8155d7e650f1..2867b39fa35e 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -710,7 +710,6 @@ static irqreturn_t decon_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-#ifdef CONFIG_PM
 static int exynos5433_decon_suspend(struct device *dev)
 {
 	struct decon_context *ctx = dev_get_drvdata(dev);
@@ -741,14 +740,10 @@ static int exynos5433_decon_resume(struct device *dev)
 
 	return ret;
 }
-#endif
 
-static const struct dev_pm_ops exynos5433_decon_pm_ops = {
-	SET_RUNTIME_PM_OPS(exynos5433_decon_suspend, exynos5433_decon_resume,
-			   NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				     pm_runtime_force_resume)
-};
+static DEFINE_RUNTIME_DEV_PM_OPS(exynos5433_decon_pm_ops,
+				 exynos5433_decon_suspend,
+				 exynos5433_decon_resume, NULL);
 
 static const struct of_device_id exynos5433_decon_driver_dt_match[] = {
 	{
@@ -881,7 +876,7 @@ struct platform_driver exynos5433_decon_driver = {
 	.remove		= exynos5433_decon_remove,
 	.driver		= {
 		.name	= "exynos5433-decon",
-		.pm	= &exynos5433_decon_pm_ops,
+		.pm	= pm_ptr(&exynos5433_decon_pm_ops),
 		.of_match_table = exynos5433_decon_driver_dt_match,
 	},
 };
diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index 7080cf7952ec..3126f735dedc 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -779,7 +779,6 @@ static int decon_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM
 static int exynos7_decon_suspend(struct device *dev)
 {
 	struct decon_context *ctx = dev_get_drvdata(dev);
@@ -836,21 +835,16 @@ static int exynos7_decon_resume(struct device *dev)
 err_pclk_enable:
 	return ret;
 }
-#endif
 
-static const struct dev_pm_ops exynos7_decon_pm_ops = {
-	SET_RUNTIME_PM_OPS(exynos7_decon_suspend, exynos7_decon_resume,
-			   NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
-};
+static DEFINE_RUNTIME_DEV_PM_OPS(exynos7_decon_pm_ops, exynos7_decon_suspend,
+				 exynos7_decon_resume, NULL);
 
 struct platform_driver decon_driver = {
 	.probe		= decon_probe,
 	.remove		= decon_remove,
 	.driver		= {
 		.name	= "exynos-decon",
-		.pm	= &exynos7_decon_pm_ops,
+		.pm	= pm_ptr(&exynos7_decon_pm_ops),
 		.of_match_table = decon_driver_dt_match,
 	},
 };
diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index 4e3d3d5f6866..3404ec1367fb 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -260,7 +260,6 @@ static int exynos_dp_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM
 static int exynos_dp_suspend(struct device *dev)
 {
 	struct exynos_dp_device *dp = dev_get_drvdata(dev);
@@ -274,13 +273,9 @@ static int exynos_dp_resume(struct device *dev)
 
 	return analogix_dp_resume(dp->adp);
 }
-#endif
 
-static const struct dev_pm_ops exynos_dp_pm_ops = {
-	SET_RUNTIME_PM_OPS(exynos_dp_suspend, exynos_dp_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
-};
+static DEFINE_RUNTIME_DEV_PM_OPS(exynos_dp_pm_ops, exynos_dp_suspend,
+				 exynos_dp_resume, NULL);
 
 static const struct of_device_id exynos_dp_match[] = {
 	{ .compatible = "samsung,exynos5-dp" },
@@ -294,7 +289,7 @@ struct platform_driver dp_driver = {
 	.driver		= {
 		.name	= "exynos-dp",
 		.owner	= THIS_MODULE,
-		.pm	= &exynos_dp_pm_ops,
+		.pm	= pm_ptr(&exynos_dp_pm_ops),
 		.of_match_table = exynos_dp_match,
 	},
 };
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index 0ee32e4b1e43..8de2714599fc 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -1381,7 +1381,6 @@ static int fimc_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM
 static int fimc_runtime_suspend(struct device *dev)
 {
 	struct fimc_context *ctx = get_fimc_context(dev);
@@ -1398,13 +1397,9 @@ static int fimc_runtime_resume(struct device *dev)
 	DRM_DEV_DEBUG_KMS(dev, "id[%d]\n", ctx->id);
 	return clk_prepare_enable(ctx->clocks[FIMC_CLK_GATE]);
 }
-#endif
 
-static const struct dev_pm_ops fimc_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
-	SET_RUNTIME_PM_OPS(fimc_runtime_suspend, fimc_runtime_resume, NULL)
-};
+static DEFINE_RUNTIME_DEV_PM_OPS(fimc_pm_ops, fimc_runtime_suspend,
+				 fimc_runtime_resume, NULL);
 
 static const struct of_device_id fimc_of_match[] = {
 	{ .compatible = "samsung,exynos4210-fimc" },
@@ -1420,6 +1415,6 @@ struct platform_driver fimc_driver = {
 		.of_match_table = fimc_of_match,
 		.name	= "exynos-drm-fimc",
 		.owner	= THIS_MODULE,
-		.pm	= &fimc_pm_ops,
+		.pm	= pm_ptr(&fimc_pm_ops),
 	},
 };
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index ae6636e6658e..7f4a0be03dd1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -1287,7 +1287,6 @@ static int fimd_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM
 static int exynos_fimd_suspend(struct device *dev)
 {
 	struct fimd_context *ctx = dev_get_drvdata(dev);
@@ -1321,13 +1320,9 @@ static int exynos_fimd_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-static const struct dev_pm_ops exynos_fimd_pm_ops = {
-	SET_RUNTIME_PM_OPS(exynos_fimd_suspend, exynos_fimd_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
-};
+static DEFINE_RUNTIME_DEV_PM_OPS(exynos_fimd_pm_ops, exynos_fimd_suspend,
+				 exynos_fimd_resume, NULL);
 
 struct platform_driver fimd_driver = {
 	.probe		= fimd_probe,
@@ -1335,7 +1330,7 @@ struct platform_driver fimd_driver = {
 	.driver		= {
 		.name	= "exynos4-fb",
 		.owner	= THIS_MODULE,
-		.pm	= &exynos_fimd_pm_ops,
+		.pm	= pm_ptr(&exynos_fimd_pm_ops),
 		.of_match_table = fimd_driver_dt_match,
 	},
 };
diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index 471fd6c8135f..7711cb67b807 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -1549,7 +1549,6 @@ static int g2d_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int g2d_suspend(struct device *dev)
 {
 	struct g2d_data *g2d = dev_get_drvdata(dev);
@@ -1574,9 +1573,7 @@ static int g2d_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-#ifdef CONFIG_PM
 static int g2d_runtime_suspend(struct device *dev)
 {
 	struct g2d_data *g2d = dev_get_drvdata(dev);
@@ -1597,11 +1594,10 @@ static int g2d_runtime_resume(struct device *dev)
 
 	return ret;
 }
-#endif
 
 static const struct dev_pm_ops g2d_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(g2d_suspend, g2d_resume)
-	SET_RUNTIME_PM_OPS(g2d_runtime_suspend, g2d_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(g2d_suspend, g2d_resume)
+	RUNTIME_PM_OPS(g2d_runtime_suspend, g2d_runtime_resume, NULL)
 };
 
 static const struct of_device_id exynos_g2d_match[] = {
@@ -1617,7 +1613,7 @@ struct platform_driver g2d_driver = {
 	.driver		= {
 		.name	= "exynos-drm-g2d",
 		.owner	= THIS_MODULE,
-		.pm	= &g2d_pm_ops,
+		.pm	= pm_ptr(&g2d_pm_ops),
 		.of_match_table = exynos_g2d_match,
 	},
 };
diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
index 09ce28ee08d9..17bab5b1663f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
@@ -340,7 +340,6 @@ static const struct component_ops exynos_mic_component_ops = {
 	.unbind	= exynos_mic_unbind,
 };
 
-#ifdef CONFIG_PM
 static int exynos_mic_suspend(struct device *dev)
 {
 	struct exynos_mic *mic = dev_get_drvdata(dev);
@@ -369,13 +368,9 @@ static int exynos_mic_resume(struct device *dev)
 	}
 	return 0;
 }
-#endif
 
-static const struct dev_pm_ops exynos_mic_pm_ops = {
-	SET_RUNTIME_PM_OPS(exynos_mic_suspend, exynos_mic_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
-};
+static DEFINE_RUNTIME_DEV_PM_OPS(exynos_mic_pm_ops, exynos_mic_suspend,
+				 exynos_mic_resume, NULL);
 
 static int exynos_mic_probe(struct platform_device *pdev)
 {
@@ -470,7 +465,7 @@ struct platform_driver mic_driver = {
 	.remove		= exynos_mic_remove,
 	.driver		= {
 		.name	= "exynos-mic",
-		.pm	= &exynos_mic_pm_ops,
+		.pm	= pm_ptr(&exynos_mic_pm_ops),
 		.owner	= THIS_MODULE,
 		.of_match_table = exynos_mic_of_match,
 	},
diff --git a/drivers/gpu/drm/exynos/exynos_drm_rotator.c b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
index dec7df35baa9..8706f377c349 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_rotator.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
@@ -340,7 +340,6 @@ static int rotator_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM
 static int rotator_runtime_suspend(struct device *dev)
 {
 	struct rot_context *rot = dev_get_drvdata(dev);
@@ -355,7 +354,6 @@ static int rotator_runtime_resume(struct device *dev)
 
 	return clk_prepare_enable(rot->clock);
 }
-#endif
 
 static const struct drm_exynos_ipp_limit rotator_s5pv210_rbg888_limits[] = {
 	{ IPP_SIZE_LIMIT(BUFFER, .h = { 8, SZ_16K }, .v = { 8, SZ_16K }) },
@@ -450,12 +448,8 @@ static const struct of_device_id exynos_rotator_match[] = {
 };
 MODULE_DEVICE_TABLE(of, exynos_rotator_match);
 
-static const struct dev_pm_ops rotator_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
-	SET_RUNTIME_PM_OPS(rotator_runtime_suspend, rotator_runtime_resume,
-									NULL)
-};
+static DEFINE_RUNTIME_DEV_PM_OPS(rotator_pm_ops, rotator_runtime_suspend,
+				 rotator_runtime_resume, NULL);
 
 struct platform_driver rotator_driver = {
 	.probe		= rotator_probe,
@@ -463,7 +457,7 @@ struct platform_driver rotator_driver = {
 	.driver		= {
 		.name	= "exynos-rotator",
 		.owner	= THIS_MODULE,
-		.pm	= &rotator_pm_ops,
+		.pm	= pm_ptr(&rotator_pm_ops),
 		.of_match_table = exynos_rotator_match,
 	},
 };
diff --git a/drivers/gpu/drm/exynos/exynos_drm_scaler.c b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
index 3c049fb658a3..20608e9780ce 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_scaler.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
@@ -550,8 +550,6 @@ static int scaler_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM
-
 static int clk_disable_unprepare_wrapper(struct clk *clk)
 {
 	clk_disable_unprepare(clk);
@@ -584,13 +582,9 @@ static int scaler_runtime_resume(struct device *dev)
 
 	return  scaler_clk_ctrl(scaler, true);
 }
-#endif
 
-static const struct dev_pm_ops scaler_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
-	SET_RUNTIME_PM_OPS(scaler_runtime_suspend, scaler_runtime_resume, NULL)
-};
+static DEFINE_RUNTIME_DEV_PM_OPS(scaler_pm_ops, scaler_runtime_suspend,
+				 scaler_runtime_resume, NULL);
 
 static const struct drm_exynos_ipp_limit scaler_5420_two_pixel_hv_limits[] = {
 	{ IPP_SIZE_LIMIT(BUFFER, .h = { 16, SZ_8K }, .v = { 16, SZ_8K }) },
@@ -731,7 +725,7 @@ struct platform_driver scaler_driver = {
 	.driver		= {
 		.name	= "exynos-scaler",
 		.owner	= THIS_MODULE,
-		.pm	= &scaler_pm_ops,
+		.pm	= pm_ptr(&scaler_pm_ops),
 		.of_match_table = exynos_scaler_match,
 	},
 };
-- 
2.35.1

