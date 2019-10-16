Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F55BD8E50
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 16 Oct 2019 12:47:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404694AbfJPKrD (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 16 Oct 2019 06:47:03 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4186 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2404688AbfJPKrC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Oct 2019 06:47:02 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 96F77AF0CE8A6DB49ED9;
        Wed, 16 Oct 2019 18:47:00 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Wed, 16 Oct 2019
 18:46:50 +0800
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
Subject: [PATCH -next 07/13] hwrng: npcm - use devm_platform_ioremap_resource() to simplify code
Date:   Wed, 16 Oct 2019 18:46:15 +0800
Message-ID: <20191016104621.26056-8-yuehaibing@huawei.com>
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
 drivers/char/hw_random/npcm-rng.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/char/hw_random/npcm-rng.c b/drivers/char/hw_random/npcm-rng.c
index b7c8c7e..01d0440 100644
--- a/drivers/char/hw_random/npcm-rng.c
+++ b/drivers/char/hw_random/npcm-rng.c
@@ -87,15 +87,13 @@ static int npcm_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
 static int npcm_rng_probe(struct platform_device *pdev)
 {
 	struct npcm_rng *priv;
-	struct resource *res;
 	int ret;
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->base = devm_ioremap_resource(&pdev->dev, res);
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
-- 
2.7.4


