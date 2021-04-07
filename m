Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7B043570B9
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  7 Apr 2021 17:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353723AbhDGPpy (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 7 Apr 2021 11:45:54 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:46252 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245056AbhDGPpw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Apr 2021 11:45:52 -0400
Received: from mail-wm1-f71.google.com ([209.85.128.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lUAN9-0008QR-Bf
        for linux-samsung-soc@vger.kernel.org; Wed, 07 Apr 2021 15:45:40 +0000
Received: by mail-wm1-f71.google.com with SMTP id v8so1229493wmg.8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Apr 2021 08:45:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5rG51SJ9b2j59QDiuKuphq0VcbOFNOs71jH8++a6urQ=;
        b=aSOIPbcNpmUixAACpMhml//jOoyZC3TXt/BUnULW9LM4vu5EvpPjGH4O2Qq2XhcQvJ
         6mKq2XrG+aY3j8To57JcwvNzoZbumsP8ou8H2daEhCAuCHjSI2d15nCMdCsik6iESv3v
         qJx3Kc0yEY2jexnHCvt8aiGN5cCtsFwn42ZttTMVbO4ntBnvlyg/8WXdinYJJXQVaolT
         CVkwZSFNO3Fu+3kKPgP7/oZAPJ8WSz/BUD0JDIz5ViNfZS6bakreHwuG/QgjZSDxtGF2
         i0BfMlrajz9+fD9n4Mk+cxKNWuIoLxE7labebqTVxcUFu7lisZ/fx25t+GHwY3S2fJ2u
         q7CA==
X-Gm-Message-State: AOAM533h4cBu4bEimcGLONKYRRK+z8VXf9N9jcjUEo39mNxErFk5G2bU
        QostzikdT/WZQ+oNMB2EhHeQsz3op9wOLvJFCMbN5Wsa839Lc0ialutZqKrbc5IPXaFyXDyJfUB
        g+WwtXVN32bU39p5YnMK4SkcpNoCkYOOHBbsM0SxV5FXJYNem
X-Received: by 2002:a5d:47c4:: with SMTP id o4mr5102172wrc.138.1617810339103;
        Wed, 07 Apr 2021 08:45:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwO3yDp/yMNG0dr/oMAaV1wjrumOV1gXxmp2b3gm7xGo7YMYB/+jov0VlU3GDVXbeWhmTWV8w==
X-Received: by 2002:a5d:47c4:: with SMTP id o4mr5102154wrc.138.1617810338946;
        Wed, 07 Apr 2021 08:45:38 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id c2sm9215943wmr.22.2021.04.07.08.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 08:45:38 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lukasz Luba <lukasz.luba@arm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] memory: samsung: exynos5422-dmc: handle clk_set_parent() failure
Date:   Wed,  7 Apr 2021 17:45:35 +0200
Message-Id: <20210407154535.70756-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

clk_set_parent() can fail and ignoring such case could lead to invalid
clock setup for given frequency.

Addresses-Coverity: Unchecked return value
Fixes: 6e7674c3c6df ("memory: Add DMC driver for Exynos5422")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/memory/samsung/exynos5422-dmc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/memory/samsung/exynos5422-dmc.c b/drivers/memory/samsung/exynos5422-dmc.c
index 56f6e65d40cd..9c8318923ed0 100644
--- a/drivers/memory/samsung/exynos5422-dmc.c
+++ b/drivers/memory/samsung/exynos5422-dmc.c
@@ -1293,7 +1293,9 @@ static int exynos5_dmc_init_clks(struct exynos5_dmc *dmc)
 
 	dmc->curr_volt = target_volt;
 
-	clk_set_parent(dmc->mout_mx_mspll_ccore, dmc->mout_spll);
+	ret = clk_set_parent(dmc->mout_mx_mspll_ccore, dmc->mout_spll);
+	if (ret)
+		return ret;
 
 	clk_prepare_enable(dmc->fout_bpll);
 	clk_prepare_enable(dmc->mout_bpll);
-- 
2.25.1

