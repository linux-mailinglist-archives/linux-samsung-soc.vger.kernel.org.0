Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F53335952E
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  9 Apr 2021 08:11:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231515AbhDIGLp (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 9 Apr 2021 02:11:45 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:16427 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbhDIGLp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Apr 2021 02:11:45 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FGnlq0VpZzlWvj;
        Fri,  9 Apr 2021 14:09:43 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.149) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Fri, 9 Apr 2021 14:11:21 +0800
From:   Ye Weihua <yeweihua4@huawei.com>
To:     <l.stelmach@samsung.com>, <mpm@selenic.com>,
        <herbert@gondor.apana.org.au>, <krzk@kernel.org>
CC:     <linux-samsung-soc@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <yangjihong1@huawei.com>,
        <zhangjinhao2@huawei.com>
Subject: [PATCH -next] hwrng: exynos - fix PM reference leak in exynos_trng_probe()
Date:   Fri, 9 Apr 2021 14:11:25 +0800
Message-ID: <20210409061125.214255-1-yeweihua4@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.149]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

pm_runtime_get_sync will increment pm usage counter even it failed.
Forgetting to putting operation will result in reference leak here.
Fix it by replacing it with pm_runtime_resume_and_get to keep usage
counter balanced.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Ye Weihua <yeweihua4@huawei.com>
---
 drivers/char/hw_random/exynos-trng.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/hw_random/exynos-trng.c b/drivers/char/hw_random/exynos-trng.c
index 8e1fe3f8dd2d..666246bc8cca 100644
--- a/drivers/char/hw_random/exynos-trng.c
+++ b/drivers/char/hw_random/exynos-trng.c
@@ -132,7 +132,7 @@ static int exynos_trng_probe(struct platform_device *pdev)
 		return PTR_ERR(trng->mem);
 
 	pm_runtime_enable(&pdev->dev);
-	ret = pm_runtime_get_sync(&pdev->dev);
+	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Could not get runtime PM.\n");
 		goto err_pm_get;
-- 
2.17.1

