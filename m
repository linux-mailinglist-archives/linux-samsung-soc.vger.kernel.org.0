Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 063FE1DDC82
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 22 May 2020 03:17:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726835AbgEVBRa (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 21 May 2020 21:17:30 -0400
Received: from spam.zju.edu.cn ([61.164.42.155]:55446 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726335AbgEVBRa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 21 May 2020 21:17:30 -0400
Received: from localhost.localdomain (unknown [222.205.77.158])
        by mail-app4 (Coremail) with SMTP id cS_KCgCHFAgMKMdex2b4AQ--.49116S4;
        Fri, 22 May 2020 09:17:04 +0800 (CST)
From:   Dinghao Liu <dinghao.liu@zju.edu.cn>
To:     dinghao.liu@zju.edu.cn, kjlu@umn.edu
Cc:     =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>,
        Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] hwrng: exynos - Fix runtime PM imbalance on error
Date:   Fri, 22 May 2020 09:16:59 +0800
Message-Id: <20200522011659.26727-1-dinghao.liu@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: cS_KCgCHFAgMKMdex2b4AQ--.49116S4
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrWkur1fury5tFWrXr43Jrb_yoW8GFy3pa
        y8uF13Cr4xZ3y8AFyUta1DZas5u3y3ta4xK3yxC34kZrn8XFy0qa1rtFyjqFy8AFWkCw45
        tr13J3y8AFyY9aUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9q1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
        w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
        IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJr0_GcWl84ACjcxK6I8E
        87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
        8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_
        Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
        xGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc2xSY4AK
        67AK6w4l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uw4UJr1UMxC20s026x
        CaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_
        JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r
        1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_
        WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r
        4UJbIYCTnIWIevJa73UjIFyTuYvjfUOMKZDUUUU
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgwIBlZdtOP3rQABsH
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

pm_runtime_get_sync() increments the runtime PM usage counter even
when it returns an error code. Thus a pairing decrement is needed on
the error handling path to keep the counter balanced.

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---

Changelog:

v2: -- Remove unnecessary 'err_clock' label
---
 drivers/char/hw_random/exynos-trng.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/char/hw_random/exynos-trng.c b/drivers/char/hw_random/exynos-trng.c
index 8e1fe3f8dd2d..8393b898a50e 100644
--- a/drivers/char/hw_random/exynos-trng.c
+++ b/drivers/char/hw_random/exynos-trng.c
@@ -142,13 +142,13 @@ static int exynos_trng_probe(struct platform_device *pdev)
 	if (IS_ERR(trng->clk)) {
 		ret = PTR_ERR(trng->clk);
 		dev_err(&pdev->dev, "Could not get clock.\n");
-		goto err_clock;
+		goto err_pm_get;
 	}
 
 	ret = clk_prepare_enable(trng->clk);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not enable the clk.\n");
-		goto err_clock;
+		goto err_pm_get;
 	}
 
 	ret = devm_hwrng_register(&pdev->dev, &trng->rng);
@@ -164,10 +164,8 @@ static int exynos_trng_probe(struct platform_device *pdev)
 err_register:
 	clk_disable_unprepare(trng->clk);
 
-err_clock:
-	pm_runtime_put_sync(&pdev->dev);
-
 err_pm_get:
+	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
 	return ret;
-- 
2.17.1

