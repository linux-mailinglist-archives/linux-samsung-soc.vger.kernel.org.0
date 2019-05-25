Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D64A2A438
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 25 May 2019 13:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbfEYLra (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 25 May 2019 07:47:30 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:33906 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726672AbfEYLr3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 25 May 2019 07:47:29 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 984E0FCC31B82A3B33B2;
        Sat, 25 May 2019 19:47:26 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.439.0; Sat, 25 May 2019 19:47:19 +0800
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
To:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
CC:     <linux-samsung-soc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: [PATCH] clk: samsung: exynos5433: Use of_clk_get_parent_count()
Date:   Sat, 25 May 2019 19:55:42 +0800
Message-ID: <20190525115542.107929-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use of_clk_get_parent_count() instead of open coding.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 drivers/clk/samsung/clk-exynos5433.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index dae1c96de933..14e253915ca4 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -5590,8 +5590,8 @@ static int __init exynos5433_cmu_probe(struct platform_device *pdev)
 	data->nr_clk_save = info->nr_clk_regs;
 	data->clk_suspend = info->suspend_regs;
 	data->nr_clk_suspend = info->nr_suspend_regs;
-	data->nr_pclks = of_count_phandle_with_args(dev->of_node, "clocks",
-						    "#clock-cells");
+	data->nr_pclks = of_clk_get_parent_count(dev->of_node);
+
 	if (data->nr_pclks > 0) {
 		data->pclks = devm_kcalloc(dev, sizeof(struct clk *),
 					   data->nr_pclks, GFP_KERNEL);
-- 
2.20.1

