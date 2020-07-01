Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A913210B36
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  1 Jul 2020 14:48:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730653AbgGAMrT (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 1 Jul 2020 08:47:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730649AbgGAMrS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 1 Jul 2020 08:47:18 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D65CC03E97B
        for <linux-samsung-soc@vger.kernel.org>; Wed,  1 Jul 2020 05:47:17 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id j4so21212276wrp.10
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Jul 2020 05:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Yd63tKAD8TEw//9s1TXw4/kd8gj1ZByx7XV4rk7dLd0=;
        b=c9lB95ZlSkCDr8FrC6iJ4ySeiJo/PwpxEuvTW8mPxbMi7ihPg/iN9Ag0/siQ+aqpIN
         lJhnsv+KPo9I9zWCV2sxE1dhJLOJGFRNycvWH0auT6M8XZ7Mm/CEmwTqIi/r6BvFoFbn
         ZF67z9oamZZJ9uq+qhic/shA3dVgWeBSmdEv+aV9UMhqA1T2lxOnICn52HaGh14Z8zLs
         JlM+mZTh/a6C65EV3n2CX9SPSXdqj7qDRm8JgZVHxNSzK4s2KBtcxSMAE3tkpiwImxEL
         DLIl0Ew6S3oRNZnBNegDJAc0B6jWmDJxM/kmE9KyRsqZ+dUn1sLkGLyi21Q94OtsfMI6
         T5RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yd63tKAD8TEw//9s1TXw4/kd8gj1ZByx7XV4rk7dLd0=;
        b=q0jbA9C81ok6wTPqEDvmXsNbhy8nKfYOohT2GmTKRYJrDKrrnNZLoTFI6Tlhu2p8Jz
         dIB0poI2wKZ2KRwqQSq+X+8bN1wbL9D6tq+A1GE4TxLoAID6MCbG/ZZK/k2zoDXWw7wU
         7KCCbtosi9OEr/9qHAJlAcy6suSwd9DBwrnr5ZX6qmueIEXGGrPLaLmhbWeorO5CgbY5
         gf8PIjqt7GYBkvkORzh0MeJBzv7OmLnVZ9WlvWZRA7eKE3/MBA0z7ea4z4BSuoxaC54S
         fWjlq6SDuOGAWpOF9FSivRF87zTB58QA/taR4FeEfsve9hODRxo1b6PosDidYRrCxyvj
         CJuw==
X-Gm-Message-State: AOAM530sbIXEZX0rFDtLXiffHHulCyyrPdnI0/cCQsX19IFUFRca8b1t
        iLCPcwqEwhENNhFtPiduPYKOsA==
X-Google-Smtp-Source: ABdhPJwshEQk22UxiuotqnoaKHFLuGrVwcP2gpb1t5Bt9UatQsrYDEIsRgMqxO9yunUFcwD7M//wEQ==
X-Received: by 2002:a5d:420b:: with SMTP id n11mr26559514wrq.91.1593607636400;
        Wed, 01 Jul 2020 05:47:16 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id o29sm7817862wra.5.2020.07.01.05.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 05:47:15 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     ulf.hansson@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Thomas Abraham <thomas.ab@samsung.com>,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 08/15] mmc: host: dw_mmc-exynos: Add kerneldoc descriptions of for 'dev' args
Date:   Wed,  1 Jul 2020 13:46:55 +0100
Message-Id: <20200701124702.908713-9-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200701124702.908713-1-lee.jones@linaro.org>
References: <20200701124702.908713-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Provide missing documentation for dw_mci_exynos_suspend_noirq() and
dw_mci_exynos_resume_noirq() function headers.

Fixes the following W=1 kernel build warnings:

 drivers/mmc/host/dw_mmc-exynos.c:184: warning: Function parameter or member 'dev' not described in 'dw_mci_exynos_suspend_noirq'
 drivers/mmc/host/dw_mmc-exynos.c:200: warning: Function parameter or member 'dev' not described in 'dw_mci_exynos_resume_noirq'

Cc: Jaehoon Chung <jh80.chung@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thomas Abraham <thomas.ab@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mmc/host/dw_mmc-exynos.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mmc/host/dw_mmc-exynos.c b/drivers/mmc/host/dw_mmc-exynos.c
index 5e3d95b636769..bd59186f59b39 100644
--- a/drivers/mmc/host/dw_mmc-exynos.c
+++ b/drivers/mmc/host/dw_mmc-exynos.c
@@ -176,6 +176,7 @@ static int dw_mci_exynos_runtime_resume(struct device *dev)
 #ifdef CONFIG_PM_SLEEP
 /**
  * dw_mci_exynos_suspend_noirq - Exynos-specific suspend code
+ * @dev: Device to suspend (this device)
  *
  * This ensures that device will be in runtime active state in
  * dw_mci_exynos_resume_noirq after calling pm_runtime_force_resume()
@@ -188,6 +189,7 @@ static int dw_mci_exynos_suspend_noirq(struct device *dev)
 
 /**
  * dw_mci_exynos_resume_noirq - Exynos-specific resume code
+ * @dev: Device to resume (this device)
  *
  * On exynos5420 there is a silicon errata that will sometimes leave the
  * WAKEUP_INT bit in the CLKSEL register asserted.  This bit is 1 to indicate
-- 
2.25.1

