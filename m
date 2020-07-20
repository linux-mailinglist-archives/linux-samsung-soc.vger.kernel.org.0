Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 515CF225D10
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 20 Jul 2020 13:05:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728494AbgGTLDO (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 20 Jul 2020 07:03:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:47696 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728348AbgGTLDN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Jul 2020 07:03:13 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 979B222BF3;
        Mon, 20 Jul 2020 11:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595242993;
        bh=dONBMDD5LZ2vZmwe51cbIkvnEd/Aviv6J8B5VLnLMwE=;
        h=From:To:Subject:Date:From;
        b=WtV5qGsmtTqSnUl+bSdlJIgXBC4W//GkRSqUNCjhs+mEzL7vpCKlL2XGpB+lQwUSR
         CQb73fvHzx1S3eLMuESoI4dfNkB+nIShhMXl791Dixk78xNg4s3JH1wiLN+O/UGvmb
         8N1G/zNJf9KeVXS4B5ZCCcwnrn1zadf1spI1sCuo=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Lukasz Luba <lukasz.luba@arm.com>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] memory: samsung: exynos5422-dmc: Do not ignore return code of regmap_read()
Date:   Mon, 20 Jul 2020 13:03:01 +0200
Message-Id: <20200720110301.22996-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Check for regmap_read() return code before using the read value in
following write in exynos5_switch_timing_regs().  Pass reading error
code to the callers.

This does not introduce proper error handling for such failed reads (and
obviously regmap_write() error is still ignored) because the driver
ignored this in all places.  Therefor it only fixes reported issue while
matching current driver coding style:

       drivers/memory/samsung/exynos5422-dmc.c: In function 'exynos5_switch_timing_regs':
    >> drivers/memory/samsung/exynos5422-dmc.c:216:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/memory/samsung/exynos5422-dmc.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/memory/samsung/exynos5422-dmc.c b/drivers/memory/samsung/exynos5422-dmc.c
index 93e9c2429c0d..2c326998cb1c 100644
--- a/drivers/memory/samsung/exynos5422-dmc.c
+++ b/drivers/memory/samsung/exynos5422-dmc.c
@@ -270,12 +270,14 @@ static int find_target_freq_idx(struct exynos5_dmc *dmc,
  * This function switches between these banks according to the
  * currently used clock source.
  */
-static void exynos5_switch_timing_regs(struct exynos5_dmc *dmc, bool set)
+static int exynos5_switch_timing_regs(struct exynos5_dmc *dmc, bool set)
 {
 	unsigned int reg;
 	int ret;
 
 	ret = regmap_read(dmc->clk_regmap, CDREX_LPDDR3PHY_CON3, &reg);
+	if (ret)
+		return ret;
 
 	if (set)
 		reg |= EXYNOS5_TIMING_SET_SWI;
@@ -283,6 +285,8 @@ static void exynos5_switch_timing_regs(struct exynos5_dmc *dmc, bool set)
 		reg &= ~EXYNOS5_TIMING_SET_SWI;
 
 	regmap_write(dmc->clk_regmap, CDREX_LPDDR3PHY_CON3, reg);
+
+	return 0;
 }
 
 /**
@@ -516,7 +520,7 @@ exynos5_dmc_switch_to_bypass_configuration(struct exynos5_dmc *dmc,
 	/*
 	 * Delays are long enough, so use them for the new coming clock.
 	 */
-	exynos5_switch_timing_regs(dmc, USE_MX_MSPLL_TIMINGS);
+	ret = exynos5_switch_timing_regs(dmc, USE_MX_MSPLL_TIMINGS);
 
 	return ret;
 }
@@ -577,7 +581,9 @@ exynos5_dmc_change_freq_and_volt(struct exynos5_dmc *dmc,
 
 	clk_set_rate(dmc->fout_bpll, target_rate);
 
-	exynos5_switch_timing_regs(dmc, USE_BPLL_TIMINGS);
+	ret = exynos5_switch_timing_regs(dmc, USE_BPLL_TIMINGS);
+	if (ret)
+		goto disable_clocks;
 
 	ret = clk_set_parent(dmc->mout_mclk_cdrex, dmc->mout_bpll);
 	if (ret)
-- 
2.17.1

