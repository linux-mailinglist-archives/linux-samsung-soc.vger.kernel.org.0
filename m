Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D99A5475CDB
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 15 Dec 2021 17:09:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244483AbhLOQJV (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 15 Dec 2021 11:09:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238180AbhLOQJR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Dec 2021 11:09:17 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B956C06175F
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Dec 2021 08:09:16 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id p18so16933268wmq.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Dec 2021 08:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XyUPK5oGUcP/HrMf/GM7b7nDYwN4yorA9vguK3F3yGE=;
        b=veKA+/Yiqp9+4bkat66Iy8BK4lpAZbakowoIgHdXjQOmiOUFga4nrBzpJK7hwJ3oal
         I69YKE5QGJTlbESciVuXrRk93QbN2flSBdZ51RZCGYfw7zUwAlhjeogeDTC5Q3UwGQwc
         vnrc7lZSVbwfpBseM4tDm/A7Aj5gOwjyA1C3XK9uf+droavbD9AJ1GBREJzyT24sYlkr
         uF4lULL9ouu3t1nlFLcezHCi5w8JeRTkmfFnsKFbMjLsEanxnW1eRRE38N0kMUsvTfSN
         fvVnvZg+UuZDxU2KO5+8etXssdUFlJHbtXU+45yPFw3VSn5+OLLLCmXk06A98ue4eDxH
         8tcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XyUPK5oGUcP/HrMf/GM7b7nDYwN4yorA9vguK3F3yGE=;
        b=qPK0im5PLe+prXpOeoJ+nEp5ZnXDXB9h/e9c7POdQFpuHqiO5mAsFUSviO84+rqju2
         eEEV4Fo6WgWpsiNBbPqZnv3PG/A4vpY1QVgVb3+Py6F4asL0bG5kqTRYHtfD2BJD54MO
         Z/TWKj+Leo/8xdRPUM0u3TwbiUCqDs1B0t/FeM1NIFlvS1wAbZXP1ZyFyrR7z+Pz8rKX
         RFQOgR6HN7V3jzfm/z0xoHasioLzkjzP1aALb2TqQOmYmlzPK6nl77EYGV6QjM+WAlIW
         55YT65AyI2jaz0PodcYhb+JjGaQ6UEEPHq1pyyfXAEWDG3k4rAaDHfPe7FhCbGYOzO3k
         bqHw==
X-Gm-Message-State: AOAM533CYJHiQQ/VvS2wlXs8TQN3Z+jyV1UmB0sieZCvs4gvqZQRHOrC
        Xw12J8343R2b6JEgPgoTrnuIYw==
X-Google-Smtp-Source: ABdhPJx5uy/42LpyPG2TBIVJjk/xEkq7+9Y3BItPABNV1xkLczWxvRcOp7vIjtbb8EE9hQXCzMGdpw==
X-Received: by 2002:a05:600c:2295:: with SMTP id 21mr496406wmf.187.1639584554980;
        Wed, 15 Dec 2021 08:09:14 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id 8sm2762633wrb.49.2021.12.15.08.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 08:09:14 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Hao Fang <fanghao11@huawei.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 5/7] dt-bindings: pinctrl: samsung: Add pin drive definitions for Exynos850
Date:   Wed, 15 Dec 2021 18:09:04 +0200
Message-Id: <20211215160906.17451-6-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211215160906.17451-1-semen.protsenko@linaro.org>
References: <20211215160906.17451-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

All Exynos850 GPIO blocks can use EXYNOS5420_PIN_DRV* definitions,
except GPIO_HSI block. Add pin drive strength definitions for GPIO_HSI
block correspondingly.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 include/dt-bindings/pinctrl/samsung.h | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/pinctrl/samsung.h b/include/dt-bindings/pinctrl/samsung.h
index b1832506b923..950970634dfe 100644
--- a/include/dt-bindings/pinctrl/samsung.h
+++ b/include/dt-bindings/pinctrl/samsung.h
@@ -36,7 +36,10 @@
 #define EXYNOS5260_PIN_DRV_LV4		2
 #define EXYNOS5260_PIN_DRV_LV6		3
 
-/* Drive strengths for Exynos5410, Exynos542x and Exynos5800 */
+/*
+ * Drive strengths for Exynos5410, Exynos542x, Exynos5800 and Exynos850 (except
+ * GPIO_HSI block)
+ */
 #define EXYNOS5420_PIN_DRV_LV1		0
 #define EXYNOS5420_PIN_DRV_LV2		1
 #define EXYNOS5420_PIN_DRV_LV3		2
@@ -56,6 +59,14 @@
 #define EXYNOS5433_PIN_DRV_SLOW_SR5	0xc
 #define EXYNOS5433_PIN_DRV_SLOW_SR6	0xf
 
+/* Drive strengths for Exynos850 GPIO_HSI block */
+#define EXYNOS850_HSI_PIN_DRV_LV1	0	/* 1x   */
+#define EXYNOS850_HSI_PIN_DRV_LV1_5	1	/* 1.5x */
+#define EXYNOS850_HSI_PIN_DRV_LV2	2	/* 2x   */
+#define EXYNOS850_HSI_PIN_DRV_LV2_5	3	/* 2.5x */
+#define EXYNOS850_HSI_PIN_DRV_LV3	4	/* 3x   */
+#define EXYNOS850_HSI_PIN_DRV_LV4	5	/* 4x   */
+
 #define EXYNOS_PIN_FUNC_INPUT		0
 #define EXYNOS_PIN_FUNC_OUTPUT		1
 #define EXYNOS_PIN_FUNC_2		2
-- 
2.30.2

