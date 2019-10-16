Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D2DDD8E63
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 16 Oct 2019 12:47:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404712AbfJPKrI (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 16 Oct 2019 06:47:08 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3783 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2404702AbfJPKrG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Oct 2019 06:47:06 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 97CE53AA7BC64B30075C;
        Wed, 16 Oct 2019 18:47:04 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Wed, 16 Oct 2019
 18:46:57 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <herbert@gondor.apana.org.au>, <mpm@selenic.com>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <ludovic.desroches@microchip.com>,
        <f.fainelli@gmail.com>, <rjui@broadcom.com>,
        <sbranden@broadcom.com>, <bcm-kernel-feedback-list@broadcom.com>,
        <eric@anholt.net>, <wahrenst@gmx.net>, <l.stelmach@samsung.com>,
        <kgene@kernel.org>, <krzk@kernel.org>, <khilman@baylibre.com>,
        <dsaxena@plexity.net>, <patrice.chotard@st.com>
CC:     <linux-crypto@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-rpi-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>,
        <linux-amlogic@lists.infradead.org>,
        <linuxppc-dev@lists.ozlabs.org>, YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 10/13] hwrng: pic32 - use devm_platform_ioremap_resource() to simplify code
Date:   Wed, 16 Oct 2019 18:46:18 +0800
Message-ID: <20191016104621.26056-11-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
In-Reply-To: <20191016104621.26056-1-yuehaibing@huawei.com>
References: <20191016104621.26056-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/char/hw_random/pic32-rng.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/char/hw_random/pic32-rng.c b/drivers/char/hw_random/pic32-rng.c
index 90f498c..81080cb 100644
--- a/drivers/char/hw_random/pic32-rng.c
+++ b/drivers/char/hw_random/pic32-rng.c
@@ -70,7 +70,6 @@ static int pic32_rng_read(struct hwrng *rng, void *buf, size_t max,
 static int pic32_rng_probe(struct platform_device *pdev)
 {
 	struct pic32_rng *priv;
-	struct resource *res;
 	u32 v;
 	int ret;
 
@@ -78,8 +77,7 @@ static int pic32_rng_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->base = devm_ioremap_resource(&pdev->dev, res);
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
-- 
2.7.4


