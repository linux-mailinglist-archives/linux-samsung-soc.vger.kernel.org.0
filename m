Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A408D38BD16
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 21 May 2021 05:58:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238972AbhEUD7h (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 20 May 2021 23:59:37 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:3638 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233879AbhEUD7h (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 20 May 2021 23:59:37 -0400
Received: from dggems702-chm.china.huawei.com (unknown [172.30.72.58])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FmXp34bqCzlfPC;
        Fri, 21 May 2021 11:55:55 +0800 (CST)
Received: from dggeme759-chm.china.huawei.com (10.3.19.105) by
 dggems702-chm.china.huawei.com (10.3.19.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Fri, 21 May 2021 11:58:12 +0800
Received: from localhost.localdomain (10.69.192.56) by
 dggeme759-chm.china.huawei.com (10.3.19.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 21 May 2021 11:58:12 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <l.stelmach@samsung.com>, <krzysztof.kozlowski@canonical.com>
CC:     <linux-samsung-soc@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>, "Tian Tao" <tiantao6@hisilicon.com>
Subject: [PATCH] hwrng: exynos: Use pm_runtime_resume_and_get() to replace open coding
Date:   Fri, 21 May 2021 11:58:09 +0800
Message-ID: <1621569489-20554-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggeme759-chm.china.huawei.com (10.3.19.105)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

use pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
pm_runtime_put_noidle. this change is just to simplify the code, no
actual functional changes.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/char/hw_random/exynos-trng.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/char/hw_random/exynos-trng.c b/drivers/char/hw_random/exynos-trng.c
index 8e1fe3f..d71ef3c 100644
--- a/drivers/char/hw_random/exynos-trng.c
+++ b/drivers/char/hw_random/exynos-trng.c
@@ -196,10 +196,9 @@ static int __maybe_unused exynos_trng_resume(struct device *dev)
 {
 	int ret;
 
-	ret = pm_runtime_get_sync(dev);
-	if (ret < 0) {
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret) {
 		dev_err(dev, "Could not get runtime PM.\n");
-		pm_runtime_put_noidle(dev);
 		return ret;
 	}
 
-- 
2.7.4

