Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AC6CD8E6D
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 16 Oct 2019 12:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392552AbfJPKqy (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 16 Oct 2019 06:46:54 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:43814 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2392494AbfJPKqu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Oct 2019 06:46:50 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 6BC042E696B294CD8DC3;
        Wed, 16 Oct 2019 18:46:49 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Wed, 16 Oct 2019
 18:46:39 +0800
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
Subject: [PATCH -next 02/13] hwrng: bcm2835 - use devm_platform_ioremap_resource() to simplify code
Date:   Wed, 16 Oct 2019 18:46:10 +0800
Message-ID: <20191016104621.26056-3-yuehaibing@huawei.com>
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
 drivers/char/hw_random/bcm2835-rng.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/char/hw_random/bcm2835-rng.c b/drivers/char/hw_random/bcm2835-rng.c
index f759790..d2a5791 100644
--- a/drivers/char/hw_random/bcm2835-rng.c
+++ b/drivers/char/hw_random/bcm2835-rng.c
@@ -142,7 +142,6 @@ static int bcm2835_rng_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	const struct of_device_id *rng_id;
 	struct bcm2835_rng_priv *priv;
-	struct resource *r;
 	int err;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -151,10 +150,8 @@ static int bcm2835_rng_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
 	/* map peripheral */
-	priv->base = devm_ioremap_resource(dev, r);
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
-- 
2.7.4


