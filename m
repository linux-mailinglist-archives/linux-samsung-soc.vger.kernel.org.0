Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00BB4E9DFA
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 30 Oct 2019 15:55:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbfJ3OzE (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 30 Oct 2019 10:55:04 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:50027 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbfJ3OzE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 30 Oct 2019 10:55:04 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1iPpNB-0000Y6-Dj; Wed, 30 Oct 2019 14:54:57 +0000
From:   Colin King <colin.king@canonical.com>
To:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] soc: samsung: exynos-asv: fix potential overflow in multiply
Date:   Wed, 30 Oct 2019 14:54:57 +0000
Message-Id: <20191030145457.10120-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The multiplication of opp_freq by MHZ is performed using unsigned int
multiplication however the result is being passed into a function where
the frequency is an unsigned long, so there is an expectation that the
result won't fit into an unsigned int. Fix any potential integer overflow
my making opp_freq an unsigned long.  Also change from %u to %lu format
specifiers

Addresses-Coverity: ("Unintentional integer overflow")
Fixes: 5ea428595cc5 ("soc: samsung: Add Exynos Adaptive Supply Voltage driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/soc/samsung/exynos-asv.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/samsung/exynos-asv.c b/drivers/soc/samsung/exynos-asv.c
index 8abf4dfaa5c5..d66fc74379a3 100644
--- a/drivers/soc/samsung/exynos-asv.c
+++ b/drivers/soc/samsung/exynos-asv.c
@@ -30,7 +30,7 @@ static int exynos_asv_update_cpu_opps(struct exynos_asv *asv,
 {
 	struct exynos_asv_subsys *subsys = NULL;
 	struct dev_pm_opp *opp;
-	unsigned int opp_freq;
+	unsigned long opp_freq;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(asv->subsys); i++) {
@@ -51,7 +51,7 @@ static int exynos_asv_update_cpu_opps(struct exynos_asv *asv,
 
 		opp = dev_pm_opp_find_freq_exact(cpu, opp_freq * MHZ, true);
 		if (IS_ERR(opp)) {
-			dev_info(asv->dev, "cpu%d opp%d, freq: %u missing\n",
+			dev_info(asv->dev, "cpu%d opp%d, freq: %lu missing\n",
 				 cpu->id, i, opp_freq);
 
 			continue;
@@ -68,11 +68,11 @@ static int exynos_asv_update_cpu_opps(struct exynos_asv *asv,
 						new_volt, new_volt, new_volt);
 		if (ret < 0)
 			dev_err(asv->dev,
-				"Failed to adjust OPP %u Hz/%u uV for cpu%d\n",
+				"Failed to adjust OPP %lu Hz/%u uV for cpu%d\n",
 				opp_freq, new_volt, cpu->id);
 		else
 			dev_dbg(asv->dev,
-				"Adjusted OPP %u Hz/%u -> %u uV, cpu%d\n",
+				"Adjusted OPP %lu Hz/%u -> %u uV, cpu%d\n",
 				opp_freq, volt, new_volt, cpu->id);
 	}
 
-- 
2.20.1

