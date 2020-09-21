Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 122FB2733A1
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 21 Sep 2020 22:36:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726471AbgIUUgk (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 21 Sep 2020 16:36:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:50552 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726451AbgIUUgk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 21 Sep 2020 16:36:40 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1833A218AC;
        Mon, 21 Sep 2020 20:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600720600;
        bh=lOy30GO+Jkhn0brhzB+gqRNW28UTmEwtr6P+3l7XJMQ=;
        h=From:To:Subject:Date:From;
        b=RwjhNIBejcca0vsB7bxAWurdo+tHfwcQHke1IEvzCcWKEzuZqZVzLXCwHbtjb7Vkv
         8PV/oWq4XjJxMfjoxO1sqlXog7srzaFR25KxHaRh6arVtlBDlMtzosLb/zZshy2Sm+
         iFBnaGjpo6zRk+CWgtrls3LdPwQK/mfExZBZLC0E=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sangbeom Kim <sbkim73@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [RFT] regulator: s5m8767: initialize driver via module_platform_driver
Date:   Mon, 21 Sep 2020 22:36:16 +0200
Message-Id: <20200921203616.19623-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The driver was using subsys_initcall() because in old times deferred
probe was not supported everywhere and specific ordering was needed.
Since probe deferral works fine and specific ordering is discouraged
(hides dependencies between drivers and couples their boot order), the
driver can be converted to regular module_platform_driver.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/regulator/s5m8767.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/regulator/s5m8767.c b/drivers/regulator/s5m8767.c
index 4abd3ed31f60..3fa472127e9a 100644
--- a/drivers/regulator/s5m8767.c
+++ b/drivers/regulator/s5m8767.c
@@ -1000,18 +1000,7 @@ static struct platform_driver s5m8767_pmic_driver = {
 	.probe = s5m8767_pmic_probe,
 	.id_table = s5m8767_pmic_id,
 };
-
-static int __init s5m8767_pmic_init(void)
-{
-	return platform_driver_register(&s5m8767_pmic_driver);
-}
-subsys_initcall(s5m8767_pmic_init);
-
-static void __exit s5m8767_pmic_exit(void)
-{
-	platform_driver_unregister(&s5m8767_pmic_driver);
-}
-module_exit(s5m8767_pmic_exit);
+module_platform_driver(s5m8767_pmic_driver);
 
 /* Module information */
 MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
-- 
2.17.1

