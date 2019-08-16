Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E8D490ADA
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 17 Aug 2019 00:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727729AbfHPWV5 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 16 Aug 2019 18:21:57 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:38035 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727726AbfHPWV5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Aug 2019 18:21:57 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1hykbY-0002Yt-Bx; Fri, 16 Aug 2019 22:21:52 +0000
From:   Colin King <colin.king@canonical.com>
To:     Pankaj Dubey <pankaj.dubey@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] soc: samsung: exynos-chipid: fix memory leak
Date:   Fri, 16 Aug 2019 23:21:51 +0100
Message-Id: <20190816222151.11098-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently when the call to product_id_to_soc_id fails there
is a memory leak of soc_dev_attr->revision and soc_dev_attr
on the error return path.  Fix this by adding a common error
return path that frees there obects and use this for two
error return paths.

Addresses-Coverity: ("Resource leak")
Fixes: 3253b7b7cd44 ("soc: samsung: Add exynos chipid driver support")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/soc/samsung/exynos-chipid.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 006a95feb618..4e194a97c0fa 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -81,15 +81,15 @@ int __init exynos_chipid_early_init(void)
 	soc_dev_attr->soc_id = product_id_to_soc_id(product_id);
 	if (!soc_dev_attr->soc_id) {
 		pr_err("Unknown SoC\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto err;
 	}
 
 	/* please note that the actual registration will be deferred */
 	soc_dev = soc_device_register(soc_dev_attr);
 	if (IS_ERR(soc_dev)) {
-		kfree(soc_dev_attr->revision);
-		kfree(soc_dev_attr);
-		return PTR_ERR(soc_dev);
+		ret = PTR_ERR(soc_dev);
+		goto err;
 	}
 
 	/* it is too early to use dev_info() here (soc_dev is NULL) */
@@ -97,5 +97,11 @@ int __init exynos_chipid_early_init(void)
 		soc_dev_attr->soc_id, product_id, revision);
 
 	return 0;
+
+err:
+	kfree(soc_dev_attr->revision);
+	kfree(soc_dev_attr);
+	return ret;
 }
+
 early_initcall(exynos_chipid_early_init);
-- 
2.20.1

