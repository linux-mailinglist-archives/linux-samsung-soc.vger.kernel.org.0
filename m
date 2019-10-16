Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1A6AD8E46
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 16 Oct 2019 12:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392522AbfJPKqr (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 16 Oct 2019 06:46:47 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:43510 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2392422AbfJPKqr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Oct 2019 06:46:47 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 58013CFF3E76FCB7C8C4;
        Wed, 16 Oct 2019 18:46:44 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Wed, 16 Oct 2019
 18:46:34 +0800
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
Subject: [PATCH -next 00/13] hwrng: use devm_platform_ioremap_resource() to simplify code
Date:   Wed, 16 Oct 2019 18:46:08 +0800
Message-ID: <20191016104621.26056-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

devm_platform_ioremap_resource() internally have platform_get_resource()
and devm_ioremap_resource() in it. So instead of calling them separately
use devm_platform_ioremap_resource() directly.

YueHaibing (13):
  hwrng: atmel - use devm_platform_ioremap_resource() to simplify code
  hwrng: bcm2835 - use devm_platform_ioremap_resource() to simplify code
  hwrng: exynos - use devm_platform_ioremap_resource() to simplify code
  hwrng: hisi - use devm_platform_ioremap_resource() to simplify code
  hwrng: ks-sa - use devm_platform_ioremap_resource() to simplify code
  hwrng: meson - use devm_platform_ioremap_resource() to simplify code
  hwrng: npcm - use devm_platform_ioremap_resource() to simplify code
  hwrng: omap - use devm_platform_ioremap_resource() to simplify code
  hwrng: pasemi - use devm_platform_ioremap_resource() to simplify code
  hwrng: pic32 - use devm_platform_ioremap_resource() to simplify code
  hwrng: st - use devm_platform_ioremap_resource() to simplify code
  hwrng: tx4939 - use devm_platform_ioremap_resource() to simplify code
  hwrng: xgene - use devm_platform_ioremap_resource() to simplify code

 drivers/char/hw_random/atmel-rng.c   | 4 +---
 drivers/char/hw_random/bcm2835-rng.c | 5 +----
 drivers/char/hw_random/exynos-trng.c | 4 +---
 drivers/char/hw_random/hisi-rng.c    | 4 +---
 drivers/char/hw_random/ks-sa-rng.c   | 4 +---
 drivers/char/hw_random/meson-rng.c   | 4 +---
 drivers/char/hw_random/npcm-rng.c    | 4 +---
 drivers/char/hw_random/omap-rng.c    | 4 +---
 drivers/char/hw_random/pasemi-rng.c  | 4 +---
 drivers/char/hw_random/pic32-rng.c   | 4 +---
 drivers/char/hw_random/st-rng.c      | 4 +---
 drivers/char/hw_random/tx4939-rng.c  | 4 +---
 drivers/char/hw_random/xgene-rng.c   | 4 +---
 13 files changed, 13 insertions(+), 40 deletions(-)

-- 
2.7.4


