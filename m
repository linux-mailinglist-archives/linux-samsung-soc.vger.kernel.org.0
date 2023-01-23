Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EE5C677AD6
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 23 Jan 2023 13:25:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231491AbjAWMZN (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 23 Jan 2023 07:25:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231305AbjAWMZM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 07:25:12 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE901902B
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 04:25:11 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id bj3so11542582pjb.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 04:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6pfGP8F/CZnmySkaMhl1te7xx0K6up+05928JeSO18=;
        b=kZ23uLBa72QPvGH8JFgZ659UA8ul4NhSMuKb913Z8iWCzfJNN6g362hqZR45qNOzkV
         jxBTKH1zVW1R2wRTYjeS2I8QsxKNAYxwtCEMxxHf+vu59AUyzHNpGLJupsUlFwD5OvFy
         OZgv0TNBDqZaWwNIBBtiP3lSeROYDXK2A5ayE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F6pfGP8F/CZnmySkaMhl1te7xx0K6up+05928JeSO18=;
        b=os59zANbE4y+NQFKGfnZhGafmuQIlUYBwRy/ly1GvdLWL8FGa+okd+rYKUleMcaTvZ
         T/nDapI4NDZKRpmhzCk9Y5SI4C7Y7Pyl1EyY6F34voXDizU8Je1zue34ySDiTD1JpPas
         vnjCC53Uy0BsYg+DflNCSVKgXMFCnnFB6mLLxjqXYZXT28pFnj3Pq2vbsKe/XtJ/CsI3
         PJmaAaoOzLvoawtCAGNFA1A5vb8YUg4PNxmCcIYrAsgdt9jRCcTITNPLOOOb/iqlUcNI
         8kXqucPrXmG0Yx8qcecKb+aVw/t8C4ViD0c7tmTjemhdoWNIDq/jw03rKXSLF9i1BBu0
         pqIQ==
X-Gm-Message-State: AFqh2krhydkD91KjAWbusd3lYuuf6DVdTwi8t/bMVyQsOTG3A3qpA3+P
        FRD+IGbhgUawuTo4IBNVahq99Q==
X-Google-Smtp-Source: AMrXdXsKw/BzsIrIyNHdJz+GkxtRcdNQNzNmxzMAHT65+Py/7cvOqIAcb9ofTpBYLvHU99KS2ux3Xg==
X-Received: by 2002:a05:6a21:3982:b0:af:f1d1:6f7f with SMTP id ad2-20020a056a21398200b000aff1d16f7fmr27734000pzc.31.1674476711141;
        Mon, 23 Jan 2023 04:25:11 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
        by smtp.gmail.com with ESMTPSA id w10-20020a170902e88a00b001960806728asm1291811plg.88.2023.01.23.04.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 04:25:10 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Fancy Fang <chen.fang@nxp.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Marek Vasut <marex@denx.de>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v11 13/18] drm: exynos: dsi: Add Exynos based host irq hooks
Date:   Mon, 23 Jan 2023 17:53:14 +0530
Message-Id: <20230123122319.261341-14-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123122319.261341-1-jagan@amarulasolutions.com>
References: <20230123122319.261341-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Enable and disable of te_gpio's are Exynos platform specific
irq handling, so add the exynos based irq operations and hook
them for exynos plat_data.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v11:
- none
Changes for v10:
- split from previous series patch
"drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM bridge"

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 55 +++++++++++++++++++++----
 1 file changed, 47 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index fc7f00ab01b4..5e672209ed5f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -290,9 +290,15 @@ struct exynos_dsim_host_ops {
 	int (*detach)(struct exynos_dsi *dsim, struct mipi_dsi_device *device);
 };
 
+struct exynos_dsim_irq_ops {
+	void (*enable)(struct exynos_dsi *dsim);
+	void (*disable)(struct exynos_dsi *dsim);
+};
+
 struct exynos_dsi_plat_data {
 	enum exynos_dsi_type hw_type;
 	const struct exynos_dsim_host_ops *host_ops;
+	const struct exynos_dsim_irq_ops *irq_ops;
 };
 
 struct exynos_dsi {
@@ -307,7 +313,6 @@ struct exynos_dsi {
 	struct clk **clks;
 	struct regulator_bulk_data supplies[2];
 	int irq;
-	struct gpio_desc *te_gpio;
 
 	u32 pll_clk_rate;
 	u32 burst_clk_rate;
@@ -331,6 +336,7 @@ struct exynos_dsi {
 
 struct exynos_dsi_enc {
 	struct drm_encoder encoder;
+	struct gpio_desc *te_gpio;
 };
 
 #define host_to_dsi(host) container_of(host, struct exynos_dsi, dsi_host)
@@ -1344,18 +1350,38 @@ static irqreturn_t exynos_dsi_te_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static void exynos_dsi_enable_irq(struct exynos_dsi *dsi)
+static void _exynos_dsi_enable_irq(struct exynos_dsi *dsim)
 {
-	enable_irq(dsi->irq);
+	struct _exynos_dsi *dsi = dsim->priv;
 
 	if (dsi->te_gpio)
 		enable_irq(gpiod_to_irq(dsi->te_gpio));
 }
 
-static void exynos_dsi_disable_irq(struct exynos_dsi *dsi)
+static void _exynos_dsi_disable_irq(struct exynos_dsi *dsim)
 {
+	struct _exynos_dsi *dsi = dsim->priv;
+
 	if (dsi->te_gpio)
 		disable_irq(gpiod_to_irq(dsi->te_gpio));
+}
+
+static void exynos_dsi_enable_irq(struct exynos_dsi *dsi)
+{
+	const struct exynos_dsi_plat_data *pdata = dsi->plat_data;
+
+	enable_irq(dsi->irq);
+
+	if (pdata->irq_ops && pdata->irq_ops->enable)
+		pdata->irq_ops->enable(dsi);
+}
+
+static void exynos_dsi_disable_irq(struct exynos_dsi *dsi)
+{
+	const struct exynos_dsi_plat_data *pdata = dsi->plat_data;
+
+	if (pdata->irq_ops && pdata->irq_ops->disable)
+		pdata->irq_ops->disable(dsi);
 
 	disable_irq(dsi->irq);
 }
@@ -1384,9 +1410,10 @@ static int exynos_dsi_init(struct exynos_dsi *dsi)
 	return 0;
 }
 
-static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi,
+static int exynos_dsi_register_te_irq(struct exynos_dsi *dsim,
 				      struct device *panel)
 {
+	struct _exynos_dsi *dsi = dsim->priv;
 	int ret;
 	int te_gpio_irq;
 
@@ -1394,7 +1421,7 @@ static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi,
 	if (!dsi->te_gpio) {
 		return 0;
 	} else if (IS_ERR(dsi->te_gpio)) {
-		dev_err(dsi->dev, "gpio request failed with %ld\n",
+		dev_err(dsim->dev, "gpio request failed with %ld\n",
 				PTR_ERR(dsi->te_gpio));
 		return PTR_ERR(dsi->te_gpio);
 	}
@@ -1404,7 +1431,7 @@ static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi,
 	ret = request_threaded_irq(te_gpio_irq, exynos_dsi_te_irq_handler, NULL,
 				   IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN, "TE", dsi);
 	if (ret) {
-		dev_err(dsi->dev, "request interrupt failed with %d\n", ret);
+		dev_err(dsim->dev, "request interrupt failed with %d\n", ret);
 		gpiod_put(dsi->te_gpio);
 		return ret;
 	}
@@ -1412,8 +1439,10 @@ static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi,
 	return 0;
 }
 
-static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsi)
+static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsim)
 {
+	struct _exynos_dsi *dsi = dsim->priv;
+
 	if (dsi->te_gpio) {
 		free_irq(gpiod_to_irq(dsi->te_gpio), dsi);
 		gpiod_put(dsi->te_gpio);
@@ -2033,6 +2062,11 @@ static const struct dev_pm_ops exynos_dsi_pm_ops = {
 				pm_runtime_force_resume)
 };
 
+static const struct exynos_dsim_irq_ops exynos_dsi_irq_ops = {
+	.enable = _exynos_dsi_enable_irq,
+	.disable = _exynos_dsi_disable_irq,
+};
+
 static const struct exynos_dsim_host_ops exynos_dsi_host_ops = {
 	.register_host = exynos_dsi_register_host,
 	.unregister_host = exynos_dsi_unregister_host,
@@ -2043,26 +2077,31 @@ static const struct exynos_dsim_host_ops exynos_dsi_host_ops = {
 static const struct exynos_dsi_plat_data exynos3250_dsi_pdata = {
 	.hw_type = DSIM_TYPE_EXYNOS3250,
 	.host_ops = &exynos_dsi_host_ops,
+	.irq_ops = &exynos_dsi_irq_ops,
 };
 
 static const struct exynos_dsi_plat_data exynos4210_dsi_pdata = {
 	.hw_type = DSIM_TYPE_EXYNOS4210,
 	.host_ops = &exynos_dsi_host_ops,
+	.irq_ops = &exynos_dsi_irq_ops,
 };
 
 static const struct exynos_dsi_plat_data exynos5410_dsi_pdata = {
 	.hw_type = DSIM_TYPE_EXYNOS5410,
 	.host_ops = &exynos_dsi_host_ops,
+	.irq_ops = &exynos_dsi_irq_ops,
 };
 
 static const struct exynos_dsi_plat_data exynos5422_dsi_pdata = {
 	.hw_type = DSIM_TYPE_EXYNOS5422,
 	.host_ops = &exynos_dsi_host_ops,
+	.irq_ops = &exynos_dsi_irq_ops,
 };
 
 static const struct exynos_dsi_plat_data exynos5433_dsi_pdata = {
 	.hw_type = DSIM_TYPE_EXYNOS5433,
 	.host_ops = &exynos_dsi_host_ops,
+	.irq_ops = &exynos_dsi_irq_ops,
 };
 
 static const struct of_device_id exynos_dsi_of_match[] = {
-- 
2.25.1

