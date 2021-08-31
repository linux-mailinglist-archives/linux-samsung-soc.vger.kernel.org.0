Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0902A3FC3F1
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 31 Aug 2021 10:22:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239908AbhHaHvQ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 31 Aug 2021 03:51:16 -0400
Received: from mx21.baidu.com ([220.181.3.85]:46534 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239790AbhHaHvQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 31 Aug 2021 03:51:16 -0400
Received: from BJHW-Mail-Ex07.internal.baidu.com (unknown [10.127.64.17])
        by Forcepoint Email with ESMTPS id 0296D3971EF51398CBFD;
        Tue, 31 Aug 2021 15:50:13 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex07.internal.baidu.com (10.127.64.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Tue, 31 Aug 2021 15:50:12 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Tue, 31 Aug 2021 15:50:12 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <inki.dae@samsung.com>, <jy0922.shim@samsung.com>,
        <sw0312.kim@samsung.com>, <kyungmin.park@samsung.com>,
        <airlied@linux.ie>, <daniel@ffwll.ch>,
        <krzysztof.kozlowski@canonical.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        "Cai Huoqing" <caihuoqing@baidu.com>
Subject: [PATCH] drm/exynos: Make use of the helper function devm_platform_ioremap_resource()
Date:   Tue, 31 Aug 2021 15:49:58 +0800
Message-ID: <20210831074958.608-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex16.internal.baidu.com (172.31.51.56) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-Baidu-BdMsfe-DateCheck: 1_BJHW-Mail-Ex07_2021-08-31 15:50:12:864
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use the devm_platform_ioremap_resource() helper instead of
calling platform_get_resource() and devm_ioremap_resource()
separately

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 4 +---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 4 +---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c      | 5 +----
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 4 +---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c       | 5 +----
 drivers/gpu/drm/exynos/exynos_drm_gsc.c       | 6 +-----
 drivers/gpu/drm/exynos/exynos_drm_rotator.c   | 4 +---
 drivers/gpu/drm/exynos/exynos_drm_scaler.c    | 4 +---
 drivers/gpu/drm/exynos/exynos_hdmi.c          | 4 +---
 9 files changed, 9 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 9870c4e6af36..b5001db7a95c 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -793,7 +793,6 @@ static int exynos5433_decon_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct decon_context *ctx;
-	struct resource *res;
 	int ret;
 	int i;
 
@@ -818,8 +817,7 @@ static int exynos5433_decon_probe(struct platform_device *pdev)
 		ctx->clks[i] = clk;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	ctx->addr = devm_ioremap_resource(dev, res);
+	ctx->addr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ctx->addr))
 		return PTR_ERR(ctx->addr);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index e39fac889edc..8d137857818c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1738,7 +1738,6 @@ static const struct component_ops exynos_dsi_component_ops = {
 static int exynos_dsi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	struct exynos_dsi *dsi;
 	int ret, i;
 
@@ -1789,8 +1788,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 		}
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dsi->reg_base = devm_ioremap_resource(dev, res);
+	dsi->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dsi->reg_base))
 		return PTR_ERR(dsi->reg_base);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index a3c718148c45..ecfd82d0afb7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -85,7 +85,6 @@ struct fimc_scaler {
 /*
  * A structure of fimc context.
  *
- * @regs_res: register resources.
  * @regs: memory mapped io registers.
  * @lock: locking of operations.
  * @clocks: fimc clocks.
@@ -103,7 +102,6 @@ struct fimc_context {
 	struct exynos_drm_ipp_formats	*formats;
 	unsigned int			num_formats;
 
-	struct resource	*regs_res;
 	void __iomem	*regs;
 	spinlock_t	lock;
 	struct clk	*clocks[FIMC_CLKS_MAX];
@@ -1327,8 +1325,7 @@ static int fimc_probe(struct platform_device *pdev)
 	ctx->num_formats = num_formats;
 
 	/* resource memory */
-	ctx->regs_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	ctx->regs = devm_ioremap_resource(dev, ctx->regs_res);
+	ctx->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ctx->regs))
 		return PTR_ERR(ctx->regs);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 700ca4fa6665..c735e53939d8 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -1202,9 +1202,7 @@ static int fimd_probe(struct platform_device *pdev)
 		return PTR_ERR(ctx->lcd_clk);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
-	ctx->regs = devm_ioremap_resource(dev, res);
+	ctx->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ctx->regs))
 		return PTR_ERR(ctx->regs);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index b00230626c6a..471fd6c8135f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -1449,7 +1449,6 @@ static const struct component_ops g2d_component_ops = {
 static int g2d_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	struct g2d_data *g2d;
 	int ret;
 
@@ -1491,9 +1490,7 @@ static int g2d_probe(struct platform_device *pdev)
 	clear_bit(G2D_BIT_SUSPEND_RUNQUEUE, &g2d->flags);
 	clear_bit(G2D_BIT_ENGINE_BUSY, &g2d->flags);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
-	g2d->regs = devm_ioremap_resource(dev, res);
+	g2d->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(g2d->regs)) {
 		ret = PTR_ERR(g2d->regs);
 		goto err_put_clk;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
index 90d7bf906885..166a80262896 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
@@ -86,7 +86,6 @@ struct gsc_scaler {
 /*
  * A structure of gsc context.
  *
- * @regs_res: register resources.
  * @regs: memory mapped io registers.
  * @gsc_clk: gsc gate clock.
  * @sc: scaler infomations.
@@ -103,7 +102,6 @@ struct gsc_context {
 	struct exynos_drm_ipp_formats	*formats;
 	unsigned int			num_formats;
 
-	struct resource	*regs_res;
 	void __iomem	*regs;
 	const char	**clk_names;
 	struct clk	*clocks[GSC_MAX_CLOCKS];
@@ -1272,9 +1270,7 @@ static int gsc_probe(struct platform_device *pdev)
 		}
 	}
 
-	/* resource memory */
-	ctx->regs_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	ctx->regs = devm_ioremap_resource(dev, ctx->regs_res);
+	ctx->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ctx->regs))
 		return PTR_ERR(ctx->regs);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_rotator.c b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
index ee61be4cf152..dec7df35baa9 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_rotator.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
@@ -278,7 +278,6 @@ static const struct component_ops rotator_component_ops = {
 static int rotator_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource	*regs_res;
 	struct rot_context *rot;
 	const struct rot_variant *variant;
 	int irq;
@@ -292,8 +291,7 @@ static int rotator_probe(struct platform_device *pdev)
 	rot->formats = variant->formats;
 	rot->num_formats = variant->num_formats;
 	rot->dev = dev;
-	regs_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	rot->regs = devm_ioremap_resource(dev, regs_res);
+	rot->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(rot->regs))
 		return PTR_ERR(rot->regs);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_scaler.c b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
index f9ae5b038d59..3a7851b7dc66 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_scaler.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
@@ -485,7 +485,6 @@ static const struct component_ops scaler_component_ops = {
 static int scaler_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource	*regs_res;
 	struct scaler_context *scaler;
 	int irq;
 	int ret, i;
@@ -498,8 +497,7 @@ static int scaler_probe(struct platform_device *pdev)
 		(struct scaler_data *)of_device_get_match_data(dev);
 
 	scaler->dev = dev;
-	regs_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	scaler->regs = devm_ioremap_resource(dev, regs_res);
+	scaler->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(scaler->regs))
 		return PTR_ERR(scaler->regs);
 
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index c769dec576de..7655142a4651 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1957,7 +1957,6 @@ static int hdmi_probe(struct platform_device *pdev)
 	struct hdmi_audio_infoframe *audio_infoframe;
 	struct device *dev = &pdev->dev;
 	struct hdmi_context *hdata;
-	struct resource *res;
 	int ret;
 
 	hdata = devm_kzalloc(dev, sizeof(struct hdmi_context), GFP_KERNEL);
@@ -1979,8 +1978,7 @@ static int hdmi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	hdata->regs = devm_ioremap_resource(dev, res);
+	hdata->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(hdata->regs)) {
 		ret = PTR_ERR(hdata->regs);
 		return ret;
-- 
2.25.1

