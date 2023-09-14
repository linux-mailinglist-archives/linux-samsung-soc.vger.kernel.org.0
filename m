Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD65A7A0253
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 14 Sep 2023 13:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237860AbjINLSn (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 14 Sep 2023 07:18:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237253AbjINLSd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Sep 2023 07:18:33 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D3FF212C
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Sep 2023 04:18:25 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-501bd7711e8so1381351e87.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Sep 2023 04:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694690304; x=1695295104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dxUofEX7JvW4d1sce0CQyOiNxdylns5iYNZqQoeIs6k=;
        b=jt2dV+xCcdsHan5nRusfwoJ2jmHu2siafSZKt52McWqoJyFf5L/I6uL12536fu2trV
         zfSXXW86lz62V5ed3JYSmxQ0jpivpOGB/Uo/3VPQ+zZHzMq4hChJp8VTj4VZnfM79/bm
         cMpUtAv+eq6ysfzY9ByNyxS2fZ5+gveqftCF7UvPJofuIpbez2+Y27WAhbeI2lXU+Pia
         wiCIgQVxPT9MVS4qm8JUzhexDWMznxMkDifQYVrN7mCTnpkM68NHq+5Bjst99khUDKX9
         +9h9MZP02GlNARGn3dq88xuzLteLfhxNXzARlHRcGO7a3UeaV7qqTvt04FE2TjkwZ1HG
         oQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694690304; x=1695295104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dxUofEX7JvW4d1sce0CQyOiNxdylns5iYNZqQoeIs6k=;
        b=CKEz8SRN9auSsL62DVNevY1L5TsqULEapiv3IcfpMO4Dnt6Gbf2QV+L4BvSsJ1u7cw
         n9aCwpV3dip9AAQLqTvzQVkFLLB0Ebk9QHBdC9Wi9EOTIvwC51/nxW8Y1s7kgh/pM089
         nRsnlvhLfdJwZJHyHMf7hl1sCn7OJinZZcXYXnYS6RT9aWx7wsI7wuOs+k0oSXCkxH58
         Qg3ef/QHPzs/C7FFYhkmQ7NiJ9M+U42RKVh4j5HnfgKYuNzYdFGbaBIhAJ6b+CaaxlKC
         0/VbnqFMfEmjN2p8SrY+1KpRs8am5VtobiGakJ63xIEN93c93CLGb83FVL2rBCw+OpVB
         2OeA==
X-Gm-Message-State: AOJu0YwcXLY9vYIFaIeM+QcAotJ7/jR+a/JKHGGLs+939CNAqiPCJPdz
        nyXk1oWPUICp/zaWlIpwkLcEhg==
X-Google-Smtp-Source: AGHT+IECyQHUqtnFN9/j9xE0JHalnzMd/YBsRnoVECOTPF6IR0x4USQA3KdxsBpACd9No4jnwUmqcA==
X-Received: by 2002:a05:6512:20cc:b0:500:bfcb:1bf6 with SMTP id u12-20020a05651220cc00b00500bfcb1bf6mr3670193lfr.57.1694690303682;
        Thu, 14 Sep 2023 04:18:23 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-94-254-63-18.NA.cust.bahnhof.se. [94.254.63.18])
        by smtp.gmail.com with ESMTPSA id r10-20020ac252aa000000b004fb9c625b4asm231711lfm.210.2023.09.14.04.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 04:18:23 -0700 (PDT)
From:   Ulf Hansson <ulf.hansson@linaro.org>
To:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 11/17] pmdomain: samsung: Move Kconfig option to the pmdomain subsystem
Date:   Thu, 14 Sep 2023 13:18:19 +0200
Message-Id: <20230914111819.586688-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The Kconfig option belongs closer to the corresponding implementation,
hence let's move it from the soc subsystem to the pmdomain subsystem.

Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: <linux-samsung-soc@vger.kernel.org>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/Kconfig         | 1 +
 drivers/pmdomain/samsung/Kconfig | 8 ++++++++
 drivers/soc/samsung/Kconfig      | 4 ----
 3 files changed, 9 insertions(+), 4 deletions(-)
 create mode 100644 drivers/pmdomain/samsung/Kconfig

diff --git a/drivers/pmdomain/Kconfig b/drivers/pmdomain/Kconfig
index 74066c5daa37..1e2c5f531638 100644
--- a/drivers/pmdomain/Kconfig
+++ b/drivers/pmdomain/Kconfig
@@ -10,5 +10,6 @@ source "drivers/pmdomain/mediatek/Kconfig"
 source "drivers/pmdomain/qcom/Kconfig"
 source "drivers/pmdomain/renesas/Kconfig"
 source "drivers/pmdomain/rockchip/Kconfig"
+source "drivers/pmdomain/samsung/Kconfig"
 
 endmenu
diff --git a/drivers/pmdomain/samsung/Kconfig b/drivers/pmdomain/samsung/Kconfig
new file mode 100644
index 000000000000..0debfe36b00a
--- /dev/null
+++ b/drivers/pmdomain/samsung/Kconfig
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0
+if SOC_SAMSUNG
+
+config EXYNOS_PM_DOMAINS
+	bool "Exynos PM domains" if COMPILE_TEST
+	depends on (ARCH_EXYNOS && PM_GENERIC_DOMAINS) || COMPILE_TEST
+
+endif
diff --git a/drivers/soc/samsung/Kconfig b/drivers/soc/samsung/Kconfig
index 7a8f291e7704..27ec99af77e3 100644
--- a/drivers/soc/samsung/Kconfig
+++ b/drivers/soc/samsung/Kconfig
@@ -48,10 +48,6 @@ config EXYNOS_PMU_ARM_DRIVERS
 	bool "Exynos PMU ARMv7-specific driver extensions" if COMPILE_TEST
 	depends on EXYNOS_PMU
 
-config EXYNOS_PM_DOMAINS
-	bool "Exynos PM domains" if COMPILE_TEST
-	depends on (ARCH_EXYNOS && PM_GENERIC_DOMAINS) || COMPILE_TEST
-
 config SAMSUNG_PM_CHECK
 	bool "S3C2410 PM Suspend Memory CRC"
 	depends on PM && (ARCH_S3C64XX || ARCH_S5PV210)
-- 
2.34.1

