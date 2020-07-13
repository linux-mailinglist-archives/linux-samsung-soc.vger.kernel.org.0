Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5A4A218B5A
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  8 Jul 2020 17:35:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730283AbgGHPeq (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 8 Jul 2020 11:34:46 -0400
Received: from foss.arm.com ([217.140.110.172]:47166 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730028AbgGHPep (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Jul 2020 11:34:45 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21AB61045;
        Wed,  8 Jul 2020 08:34:45 -0700 (PDT)
Received: from e123648.arm.com (unknown [10.37.12.67])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AFCD23F237;
        Wed,  8 Jul 2020 08:34:40 -0700 (PDT)
From:   Lukasz Luba <lukasz.luba@arm.com>
To:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     lukasz.luba@arm.com, willy.mh.wolff.ml@gmail.com,
        k.konieczny@samsung.com, cw00.choi@samsung.com,
        b.zolnierkie@samsung.com, krzk@kernel.org, chanwoo@kernel.org,
        myungjoo.ham@samsung.com, kyungmin.park@samsung.com,
        s.nawrocki@samsung.com, kgene@kernel.org
Subject: [PATCH 1/2] memory: samsung: exynos5422-dmc: Adjust polling interval and uptreshold
Date:   Wed,  8 Jul 2020 16:34:19 +0100
Message-Id: <20200708153420.29484-2-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200708153420.29484-1-lukasz.luba@arm.com>
References: <20200708153420.29484-1-lukasz.luba@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

In order to react faster and make better decisions under some workloads,
benchmarking the memory subsystem behavior, adjust the polling interval
and upthreshold value used by the simple_ondemand governor.

Reported-by: Willy Wolff <willy.mh.wolff.ml@gmail.com>
Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
---
 drivers/memory/samsung/exynos5422-dmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/samsung/exynos5422-dmc.c b/drivers/memory/samsung/exynos5422-dmc.c
index 93e9c2429c0d..e03ee35f0ab5 100644
--- a/drivers/memory/samsung/exynos5422-dmc.c
+++ b/drivers/memory/samsung/exynos5422-dmc.c
@@ -1466,10 +1466,10 @@ static int exynos5_dmc_probe(struct platform_device *pdev)
 		 * Setup default thresholds for the devfreq governor.
 		 * The values are chosen based on experiments.
 		 */
-		dmc->gov_data.upthreshold = 30;
+		dmc->gov_data.upthreshold = 10;
 		dmc->gov_data.downdifferential = 5;
 
-		exynos5_dmc_df_profile.polling_ms = 500;
+		exynos5_dmc_df_profile.polling_ms = 100;
 	}
 
 
-- 
2.17.1

