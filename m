Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6365425322A
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 26 Aug 2020 16:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728080AbgHZOw5 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 26 Aug 2020 10:52:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:39434 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727769AbgHZOwr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 Aug 2020 10:52:47 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CC7DF22B3F;
        Wed, 26 Aug 2020 14:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598453566;
        bh=Y7G4DkYRnj4ZC6IYiwugOSDmIVV0GnhDCg89XlxnjaM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=P2tzGz1PbCoU4kS+sLpzj1slIGGJOedVGNQUHWnnySa0173mP0PIvh/lMi9P1HJ/U
         rbC4oZik38HRxpeaCleLq+P7EY0GBgxMi6DXrZ4ey/6PsgisG3H+8/LRdoy0Z17RUK
         ES9Hj0kUVggFLJd/pQkCSs2w+CPSvnLOAo0jd6OQ=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Peter Rosin <peda@axentia.se>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Beniamin Bia <beniamin.bia@analog.com>,
        Tomasz Duszynski <tomasz.duszynski@octakon.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 08/16] iio: adc: stm32: Simplify with dev_err_probe()
Date:   Wed, 26 Aug 2020 16:51:45 +0200
Message-Id: <20200826145153.10444-8-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826145153.10444-1-krzk@kernel.org>
References: <20200826145153.10444-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and also it prints the error value.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/iio/adc/stm32-adc-core.c  | 62 ++++++++++++-------------------
 drivers/iio/adc/stm32-adc.c       | 10 ++---
 drivers/iio/adc/stm32-dfsdm-adc.c | 10 ++---
 3 files changed, 30 insertions(+), 52 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
index 0e2068ec068b..184d5491c7ed 100644
--- a/drivers/iio/adc/stm32-adc-core.c
+++ b/drivers/iio/adc/stm32-adc-core.c
@@ -582,11 +582,9 @@ static int stm32_adc_core_switches_probe(struct device *dev,
 	priv->syscfg = syscon_regmap_lookup_by_phandle(np, "st,syscfg");
 	if (IS_ERR(priv->syscfg)) {
 		ret = PTR_ERR(priv->syscfg);
-		if (ret != -ENODEV) {
-			if (ret != -EPROBE_DEFER)
-				dev_err(dev, "Can't probe syscfg: %d\n", ret);
-			return ret;
-		}
+		if (ret != -ENODEV)
+			return dev_err_probe(dev, ret, "Can't probe syscfg\n");
+
 		priv->syscfg = NULL;
 	}
 
@@ -596,12 +594,9 @@ static int stm32_adc_core_switches_probe(struct device *dev,
 		priv->booster = devm_regulator_get_optional(dev, "booster");
 		if (IS_ERR(priv->booster)) {
 			ret = PTR_ERR(priv->booster);
-			if (ret != -ENODEV) {
-				if (ret != -EPROBE_DEFER)
-					dev_err(dev, "can't get booster %d\n",
-						ret);
-				return ret;
-			}
+			if (ret != -ENODEV)
+				dev_err_probe(dev, ret, "can't get booster\n");
+
 			priv->booster = NULL;
 		}
 	}
@@ -612,11 +607,10 @@ static int stm32_adc_core_switches_probe(struct device *dev,
 		priv->vdd = devm_regulator_get_optional(dev, "vdd");
 		if (IS_ERR(priv->vdd)) {
 			ret = PTR_ERR(priv->vdd);
-			if (ret != -ENODEV) {
-				if (ret != -EPROBE_DEFER)
-					dev_err(dev, "can't get vdd %d\n", ret);
-				return ret;
-			}
+			if (ret != -ENODEV)
+				return dev_err_probe(dev, ret,
+						     "can't get vdd\n");
+
 			priv->vdd = NULL;
 		}
 	}
@@ -669,40 +663,32 @@ static int stm32_adc_probe(struct platform_device *pdev)
 	priv->common.phys_base = res->start;
 
 	priv->vdda = devm_regulator_get(&pdev->dev, "vdda");
-	if (IS_ERR(priv->vdda)) {
-		ret = PTR_ERR(priv->vdda);
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "vdda get failed, %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(priv->vdda))
+		return dev_err_probe(&pdev->dev, PTR_ERR(priv->vdda),
+				     "vdda get failed\n");
 
 	priv->vref = devm_regulator_get(&pdev->dev, "vref");
-	if (IS_ERR(priv->vref)) {
-		ret = PTR_ERR(priv->vref);
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "vref get failed, %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(priv->vref))
+		return dev_err_probe(&pdev->dev, PTR_ERR(priv->vref),
+				     "vref get failed\n");
 
 	priv->aclk = devm_clk_get(&pdev->dev, "adc");
 	if (IS_ERR(priv->aclk)) {
 		ret = PTR_ERR(priv->aclk);
-		if (ret != -ENOENT) {
-			if (ret != -EPROBE_DEFER)
-				dev_err(&pdev->dev, "Can't get 'adc' clock\n");
-			return ret;
-		}
+		if (ret != -ENOENT)
+			return dev_err_probe(&pdev->dev, ret,
+					     "Can't get 'adc' clock\n");
+
 		priv->aclk = NULL;
 	}
 
 	priv->bclk = devm_clk_get(&pdev->dev, "bus");
 	if (IS_ERR(priv->bclk)) {
 		ret = PTR_ERR(priv->bclk);
-		if (ret != -ENOENT) {
-			if (ret != -EPROBE_DEFER)
-				dev_err(&pdev->dev, "Can't get 'bus' clock\n");
-			return ret;
-		}
+		if (ret != -ENOENT)
+			return dev_err_probe(&pdev->dev, ret,
+					     "Can't get 'bus' clock\n");
+
 		priv->bclk = NULL;
 	}
 
diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index 3eb9ebe8372f..b3f31f147347 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -1805,13 +1805,9 @@ static int stm32_adc_dma_request(struct device *dev, struct iio_dev *indio_dev)
 	adc->dma_chan = dma_request_chan(dev, "rx");
 	if (IS_ERR(adc->dma_chan)) {
 		ret = PTR_ERR(adc->dma_chan);
-		if (ret != -ENODEV) {
-			if (ret != -EPROBE_DEFER)
-				dev_err(dev,
-					"DMA channel request failed with %d\n",
-					ret);
-			return ret;
-		}
+		if (ret != -ENODEV)
+			return dev_err_probe(dev, ret,
+					     "DMA channel request failed with\n");
 
 		/* DMA is optional: fall back to IRQ mode */
 		adc->dma_chan = NULL;
diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
index 5e10fb4f3704..c7e0109315f8 100644
--- a/drivers/iio/adc/stm32-dfsdm-adc.c
+++ b/drivers/iio/adc/stm32-dfsdm-adc.c
@@ -1473,13 +1473,9 @@ static int stm32_dfsdm_adc_init(struct device *dev, struct iio_dev *indio_dev)
 	/* Optionally request DMA */
 	ret = stm32_dfsdm_dma_request(dev, indio_dev);
 	if (ret) {
-		if (ret != -ENODEV) {
-			if (ret != -EPROBE_DEFER)
-				dev_err(dev,
-					"DMA channel request failed with %d\n",
-					ret);
-			return ret;
-		}
+		if (ret != -ENODEV)
+			return dev_err_probe(dev, ret,
+					     "DMA channel request failed with\n");
 
 		dev_dbg(dev, "No DMA support\n");
 		return 0;
-- 
2.17.1

