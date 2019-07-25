Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B94B7748A4
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 25 Jul 2019 10:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388910AbfGYICH (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 25 Jul 2019 04:02:07 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42604 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388596AbfGYICH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 25 Jul 2019 04:02:07 -0400
Received: by mail-pf1-f196.google.com with SMTP id q10so22322025pff.9;
        Thu, 25 Jul 2019 01:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yJ0esR3gqyjabjnRdkv3xq8sELXYTmCusEQ+i32vrcQ=;
        b=ejWQUWNE/qfPXJAbUOv1iSK/jBAEsTxBG7WHLr+jBvLhnFCl2Wn8FqmDwIWiwvm+PS
         JrW0EU3VVY/weHtzAy1FOLU1HNs1jqXOS3bTX2m+yMk3tFxAcxrlu2cd/rjrGrxwMfsV
         8PNLURtPsJfIeKBwQFbxx6UY6VtW1G8BuO/ySnnZ4Jvn7VkuIiRd7CcbPQ7ZdzWDIagl
         Yb1+i7FufmI8y6PrFrWzVsf7O7gXRorMJlN3qjibgF7cqwoUIEptILF5jUfswOERuT2t
         RrPnHheuxAhCN8Frphy8iH3cSOhwZ1WU+iMBZN46lHz0nKVrsAqf7jHeW24Z/r/BY9sd
         Wz5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yJ0esR3gqyjabjnRdkv3xq8sELXYTmCusEQ+i32vrcQ=;
        b=FfiQ1nWOpht5ltjpIqGPqPEop9JWCDYv75tBN7XByoHyJ+9/om8TA6Eh8tqiGt0aP5
         62trkM0rZlslgAU+qHDQzcA6o8CYpjYkIsYu/zImTnY12mjfbg/xtQPQ2qTP//Vm/bjW
         +SdgazCgrh8qU1BpgawX8x+2d+uOBGnqtmv1zcLzSTxfqzHVUrDFePYNjaZSegvTfPmn
         Ur8AarR56piuYd9BuN7MUE1WAmbwkOyTzvgtcyy9KKJTYWLkgRlEfSfSf/ymTf0AlcCm
         M+mNYTOiEZl5V7RjEypD/zCGZ/ut0z/tsa0YRKFjj5VrWCj0b5OXNeq4G+6itp3Li/Z9
         PuNA==
X-Gm-Message-State: APjAAAWZ3qpFSjNcDBzdG+rH1jZiQm3gMpN+P5ytCOBIxEoA/xv3+CHL
        TnH0lA4KPMoRa0+tGkNfTCE=
X-Google-Smtp-Source: APXvYqwrO63J65nlVcYLjmqxh6lIEg38q2Kxx1VcwpM359myqL+zdL88hj1oGtrgK48MaYQXJeZIdA==
X-Received: by 2002:a62:483:: with SMTP id 125mr15831288pfe.245.1564041725605;
        Thu, 25 Jul 2019 01:02:05 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
        by smtp.gmail.com with ESMTPSA id p27sm73176877pfq.136.2019.07.25.01.01.59
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 25 Jul 2019 01:02:04 -0700 (PDT)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Deepak Saxena <dsaxena@plexity.net>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Patrice Chotard <patrice.chotard@st.com>,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] hwrng: Use device-managed registration API
Date:   Thu, 25 Jul 2019 16:01:55 +0800
Message-Id: <20190725080155.19875-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use devm_hwrng_register to simplify the implementation.
Manual unregistration and some remove functions can be
removed now.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/char/hw_random/atmel-rng.c     |  3 +--
 drivers/char/hw_random/cavium-rng-vf.c | 11 +----------
 drivers/char/hw_random/exynos-trng.c   |  3 +--
 drivers/char/hw_random/n2-drv.c        |  4 +---
 drivers/char/hw_random/nomadik-rng.c   |  3 +--
 drivers/char/hw_random/omap-rng.c      |  3 +--
 drivers/char/hw_random/powernv-rng.c   | 10 +---------
 drivers/char/hw_random/st-rng.c        |  4 +---
 drivers/char/hw_random/xgene-rng.c     |  4 +---
 9 files changed, 9 insertions(+), 36 deletions(-)

diff --git a/drivers/char/hw_random/atmel-rng.c b/drivers/char/hw_random/atmel-rng.c
index 433426242b87..e55705745d5e 100644
--- a/drivers/char/hw_random/atmel-rng.c
+++ b/drivers/char/hw_random/atmel-rng.c
@@ -86,7 +86,7 @@ static int atmel_trng_probe(struct platform_device *pdev)
 	trng->rng.name = pdev->name;
 	trng->rng.read = atmel_trng_read;
 
-	ret = hwrng_register(&trng->rng);
+	ret = devm_hwrng_register(&pdev->dev, &trng->rng);
 	if (ret)
 		goto err_register;
 
@@ -103,7 +103,6 @@ static int atmel_trng_remove(struct platform_device *pdev)
 {
 	struct atmel_trng *trng = platform_get_drvdata(pdev);
 
-	hwrng_unregister(&trng->rng);
 
 	atmel_trng_disable(trng);
 	clk_disable_unprepare(trng->clk);
diff --git a/drivers/char/hw_random/cavium-rng-vf.c b/drivers/char/hw_random/cavium-rng-vf.c
index 2d1352b67168..3de4a6a443ef 100644
--- a/drivers/char/hw_random/cavium-rng-vf.c
+++ b/drivers/char/hw_random/cavium-rng-vf.c
@@ -67,7 +67,7 @@ static int cavium_rng_probe_vf(struct	pci_dev		*pdev,
 
 	pci_set_drvdata(pdev, rng);
 
-	ret = hwrng_register(&rng->ops);
+	ret = devm_hwrng_register(&pdev->dev, &rng->ops);
 	if (ret) {
 		dev_err(&pdev->dev, "Error registering device as HWRNG.\n");
 		return ret;
@@ -76,14 +76,6 @@ static int cavium_rng_probe_vf(struct	pci_dev		*pdev,
 	return 0;
 }
 
-/* Remove the VF */
-static void  cavium_rng_remove_vf(struct pci_dev *pdev)
-{
-	struct cavium_rng *rng;
-
-	rng = pci_get_drvdata(pdev);
-	hwrng_unregister(&rng->ops);
-}
 
 static const struct pci_device_id cavium_rng_vf_id_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_CAVIUM, 0xa033), 0, 0, 0},
@@ -95,7 +87,6 @@ static struct pci_driver cavium_rng_vf_driver = {
 	.name		= "cavium_rng_vf",
 	.id_table	= cavium_rng_vf_id_table,
 	.probe		= cavium_rng_probe_vf,
-	.remove		= cavium_rng_remove_vf,
 };
 module_pci_driver(cavium_rng_vf_driver);
 
diff --git a/drivers/char/hw_random/exynos-trng.c b/drivers/char/hw_random/exynos-trng.c
index 94235761955c..b4b52ab23b6b 100644
--- a/drivers/char/hw_random/exynos-trng.c
+++ b/drivers/char/hw_random/exynos-trng.c
@@ -153,7 +153,7 @@ static int exynos_trng_probe(struct platform_device *pdev)
 		goto err_clock;
 	}
 
-	ret = hwrng_register(&trng->rng);
+	ret = devm_hwrng_register(&pdev->dev, &trng->rng);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not register hwrng device.\n");
 		goto err_register;
@@ -179,7 +179,6 @@ static int exynos_trng_remove(struct platform_device *pdev)
 {
 	struct exynos_trng_dev *trng =  platform_get_drvdata(pdev);
 
-	hwrng_unregister(&trng->rng);
 	clk_disable_unprepare(trng->clk);
 
 	pm_runtime_put_sync(&pdev->dev);
diff --git a/drivers/char/hw_random/n2-drv.c b/drivers/char/hw_random/n2-drv.c
index d4cab105796f..2d256b3470db 100644
--- a/drivers/char/hw_random/n2-drv.c
+++ b/drivers/char/hw_random/n2-drv.c
@@ -768,7 +768,7 @@ static int n2rng_probe(struct platform_device *op)
 	np->hwrng.data_read = n2rng_data_read;
 	np->hwrng.priv = (unsigned long) np;
 
-	err = hwrng_register(&np->hwrng);
+	err = devm_hwrng_register(&pdev->dev, &np->hwrng);
 	if (err)
 		goto out_hvapi_unregister;
 
@@ -793,8 +793,6 @@ static int n2rng_remove(struct platform_device *op)
 
 	cancel_delayed_work_sync(&np->work);
 
-	hwrng_unregister(&np->hwrng);
-
 	sun4v_hvapi_unregister(HV_GRP_RNG);
 
 	return 0;
diff --git a/drivers/char/hw_random/nomadik-rng.c b/drivers/char/hw_random/nomadik-rng.c
index fc0f6b0cb80d..74ed29f42e4f 100644
--- a/drivers/char/hw_random/nomadik-rng.c
+++ b/drivers/char/hw_random/nomadik-rng.c
@@ -57,7 +57,7 @@ static int nmk_rng_probe(struct amba_device *dev, const struct amba_id *id)
 	if (!base)
 		goto out_release;
 	nmk_rng.priv = (unsigned long)base;
-	ret = hwrng_register(&nmk_rng);
+	ret = devm_hwrng_register(&dev->dev, &nmk_rng);
 	if (ret)
 		goto out_release;
 	return 0;
@@ -71,7 +71,6 @@ static int nmk_rng_probe(struct amba_device *dev, const struct amba_id *id)
 
 static int nmk_rng_remove(struct amba_device *dev)
 {
-	hwrng_unregister(&nmk_rng);
 	amba_release_regions(dev);
 	clk_disable(rng_clk);
 	return 0;
diff --git a/drivers/char/hw_random/omap-rng.c b/drivers/char/hw_random/omap-rng.c
index e9b6ac61fb7f..b27f39688b5e 100644
--- a/drivers/char/hw_random/omap-rng.c
+++ b/drivers/char/hw_random/omap-rng.c
@@ -500,7 +500,7 @@ static int omap_rng_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_register;
 
-	ret = hwrng_register(&priv->rng);
+	ret = devm_hwrng_register(&pdev->dev, &priv->rng);
 	if (ret)
 		goto err_register;
 
@@ -525,7 +525,6 @@ static int omap_rng_remove(struct platform_device *pdev)
 {
 	struct omap_rng_dev *priv = platform_get_drvdata(pdev);
 
-	hwrng_unregister(&priv->rng);
 
 	priv->pdata->cleanup(priv);
 
diff --git a/drivers/char/hw_random/powernv-rng.c b/drivers/char/hw_random/powernv-rng.c
index f2e8272e276a..8da1d7917bdc 100644
--- a/drivers/char/hw_random/powernv-rng.c
+++ b/drivers/char/hw_random/powernv-rng.c
@@ -33,18 +33,11 @@ static struct hwrng powernv_hwrng = {
 	.read = powernv_rng_read,
 };
 
-static int powernv_rng_remove(struct platform_device *pdev)
-{
-	hwrng_unregister(&powernv_hwrng);
-
-	return 0;
-}
-
 static int powernv_rng_probe(struct platform_device *pdev)
 {
 	int rc;
 
-	rc = hwrng_register(&powernv_hwrng);
+	rc = devm_hwrng_register(&pdev->dev, &powernv_hwrng);
 	if (rc) {
 		/* We only register one device, ignore any others */
 		if (rc == -EEXIST)
@@ -70,7 +63,6 @@ static struct platform_driver powernv_rng_driver = {
 		.of_match_table = powernv_rng_match,
 	},
 	.probe	= powernv_rng_probe,
-	.remove = powernv_rng_remove,
 };
 module_platform_driver(powernv_rng_driver);
 
diff --git a/drivers/char/hw_random/st-rng.c b/drivers/char/hw_random/st-rng.c
index bd6a98b3479b..863448360a7d 100644
--- a/drivers/char/hw_random/st-rng.c
+++ b/drivers/char/hw_random/st-rng.c
@@ -102,7 +102,7 @@ static int st_rng_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(&pdev->dev, ddata);
 
-	ret = hwrng_register(&ddata->ops);
+	ret = devm_hwrng_register(&pdev->dev, &ddata->ops);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register HW RNG\n");
 		clk_disable_unprepare(clk);
@@ -118,8 +118,6 @@ static int st_rng_remove(struct platform_device *pdev)
 {
 	struct st_rng_data *ddata = dev_get_drvdata(&pdev->dev);
 
-	hwrng_unregister(&ddata->ops);
-
 	clk_disable_unprepare(ddata->clk);
 
 	return 0;
diff --git a/drivers/char/hw_random/xgene-rng.c b/drivers/char/hw_random/xgene-rng.c
index 8c6f9f63da5e..7e568db87ae2 100644
--- a/drivers/char/hw_random/xgene-rng.c
+++ b/drivers/char/hw_random/xgene-rng.c
@@ -361,7 +361,7 @@ static int xgene_rng_probe(struct platform_device *pdev)
 
 	xgene_rng_func.priv = (unsigned long) ctx;
 
-	rc = hwrng_register(&xgene_rng_func);
+	rc = devm_hwrng_register(&pdev->dev, &xgene_rng_func);
 	if (rc) {
 		dev_err(&pdev->dev, "RNG registering failed error %d\n", rc);
 		if (!IS_ERR(ctx->clk))
@@ -375,7 +375,6 @@ static int xgene_rng_probe(struct platform_device *pdev)
 			rc);
 		if (!IS_ERR(ctx->clk))
 			clk_disable_unprepare(ctx->clk);
-		hwrng_unregister(&xgene_rng_func);
 		return rc;
 	}
 
@@ -392,7 +391,6 @@ static int xgene_rng_remove(struct platform_device *pdev)
 		dev_err(&pdev->dev, "RNG init wakeup failed error %d\n", rc);
 	if (!IS_ERR(ctx->clk))
 		clk_disable_unprepare(ctx->clk);
-	hwrng_unregister(&xgene_rng_func);
 
 	return rc;
 }
-- 
2.20.1

