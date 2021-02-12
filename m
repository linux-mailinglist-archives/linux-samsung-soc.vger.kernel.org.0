Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE6431A2DE
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 12 Feb 2021 17:40:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbhBLQiW (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 12 Feb 2021 11:38:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:37308 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231139AbhBLQgP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 12 Feb 2021 11:36:15 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C5846186A;
        Fri, 12 Feb 2021 16:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613147733;
        bh=dsE/PR09Yy1lTaGcykGZP72nwOIqpU7wlx9keyjzDYg=;
        h=From:To:Cc:Subject:Date:From;
        b=tkcEEQgiQE87ZcAn5GYgtYaegaB5Olia7uq3lwJF6ahLQRHgvFgQ04gYHWzoIAdeP
         Hv1h9U0uH7576Wd5gBNfyRI+mLHKlBc0VhYGNMt6tfWlWrjZlgyMZkwknuNcaM0rjP
         Ui4CU8gtrVG8F8wIso+WjW1au9ls9bhbYBMOUDFX2gtqY9gDNhzs71rP6Xkbgjz05s
         ybFYa3+gnIsudj5IwZ/sgtYq5YYKpcCTvNeUW/UoVIcGmV8SC58sG/4vlWq8XVs4zt
         nBag+np+4Z20TojQ87mP55fR0vjFLKrNRht9aiPLDpCloqWZX198VNpq0tRcQiq/Lr
         ABV2PzbhIMuuQ==
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        linux-crypto@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Sylwester Nawrocki <snawrocki@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [RFT PATCH] crypto: s5p-sss - initialize APB clock after the AXI bus clock for SlimSSS
Date:   Fri, 12 Feb 2021 17:35:26 +0100
Message-Id: <20210212163526.69422-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The driver for Slim Security Subsystem (SlimSSS) on Exynos5433 takes two
clocks - aclk (AXI/AHB clock) and pclk (APB/Advanced Peripheral Bus
clock).  The "aclk", as main high speed bus clock, is enabled first.  Then
the "pclk" is enabled.

However the driver assigned reversed names for lookup of these clocks
from devicetree, so effectively the "pclk" was enabled first.

Although it might not matter in reality, the correct order is to enable
first main/high speed bus clock - "aclk".  Also this was the intention
of the actual code.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Not tested, please kindly test on Exynos5433 hardware.
---
 drivers/crypto/s5p-sss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/s5p-sss.c b/drivers/crypto/s5p-sss.c
index 682c8a450a57..8ed08130196f 100644
--- a/drivers/crypto/s5p-sss.c
+++ b/drivers/crypto/s5p-sss.c
@@ -401,7 +401,7 @@ static const struct samsung_aes_variant exynos_aes_data = {
 static const struct samsung_aes_variant exynos5433_slim_aes_data = {
 	.aes_offset	= 0x400,
 	.hash_offset	= 0x800,
-	.clk_names	= { "pclk", "aclk", },
+	.clk_names	= { "aclk", "pclk", },
 };
 
 static const struct of_device_id s5p_sss_dt_match[] = {
-- 
2.25.1

