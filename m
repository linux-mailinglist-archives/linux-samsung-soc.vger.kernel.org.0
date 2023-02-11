Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 206D0692ED1
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 11 Feb 2023 07:40:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbjBKGkC (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 11 Feb 2023 01:40:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbjBKGjx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 11 Feb 2023 01:39:53 -0500
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CE1FC65D
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Feb 2023 22:39:51 -0800 (PST)
Received: by mail-oo1-xc29.google.com with SMTP id r192-20020a4a37c9000000b00517677496d0so750437oor.13
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Feb 2023 22:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGLpsx3x56F4XExqZ+3YmAAyi85mUU1waCg5Al37KCU=;
        b=DDvBzjnkWpfUdwY/rg3cZnOUu1yzoDogUfZAj9PKlDg0d+bi2iRJAwo2/I8L4waloa
         yV8JoGtGvWKxVnUzAssHNflp2tHJBLPi0IVuB3pAozjIalNI+HoqJIWNum80Rg1yjxar
         uU5zIg3lHzWWvcs94fsLWAuaFrUu9pkKj4Av8LojcpFgiAZrbW8WntBJiqUT5mlen3oi
         a4fSEnlqpah0R3RIiXmq3QEfIy2m68z69lPe9/t44ZG0HnfsV4HBZN4tsmjWuGD/DN7m
         Cz5fESsBqIyKnykITNB2UmYZX1XDdohSMBLkxDp4zNV35FBx3HE/hMgeD7XKIHBPFq9r
         acBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hGLpsx3x56F4XExqZ+3YmAAyi85mUU1waCg5Al37KCU=;
        b=c1htGQTANmBAw7MDyTXD7iWSmL1f1F0pbuwjPfvVi8EOVE4E2x7JQ0iVAIqfF6nvE4
         B3I5zME0YHAaSUeDf/mtGi1DFtf+yrMGjzy5bQv4hO2y0iZe4SMYMkodMGgbK1KroX84
         U78XIftZ7Vbdnjo5HZCt/+osIDFTClWq1UtsbvbsMb1RsBDwqEO8N4ai85YnOPc6+JVO
         S0fb0y6NiEcxDUgvPZlAfjQjUMI7uhJW67qrtvhWmbExWfMXEtr4wJzj16u/Qg9gC+zR
         04mIfU4tJQ+Ja1BKPQClFG/n7wxTEwbCmHc0cuPNJfwZTGUnzFUoG2ylUwYhjDUkABsm
         swcw==
X-Gm-Message-State: AO0yUKUX9qTDLwzNqz9ql/0zYHYXzJIaz53c+pWsVnRYmVcpURbECtcV
        HDkJL4cppXZnQit/XRpbsOJLfw==
X-Google-Smtp-Source: AK7set/tShNgs95dQGGgbp9uDcpeqJIp3+i5sf5DZ8B+fDZhqHh5W/Si7avk5AdyR0qt4zd2I/7Y+A==
X-Received: by 2002:a4a:e841:0:b0:51a:6572:152 with SMTP id m1-20020a4ae841000000b0051a65720152mr9616288oom.3.1676097590615;
        Fri, 10 Feb 2023 22:39:50 -0800 (PST)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id t5-20020a4adbc5000000b00511e01623bbsm2808013oou.7.2023.02.10.22.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 22:39:50 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     David Virag <virag.david003@gmail.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] dt-bindings: clock: exynos850: Add Exynos850 CMU_G3D
Date:   Sat, 11 Feb 2023 00:40:01 -0600
Message-Id: <20230211064006.14981-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211064006.14981-1-semen.protsenko@linaro.org>
References: <20230211064006.14981-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

CMU_G3D generates Gondul GPU and bus clocks for BLK_G3D.
Add clock indices and binding documentation for CMU_G3D.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 .../clock/samsung,exynos850-clock.yaml        | 19 ++++++++++++++++++
 include/dt-bindings/clock/exynos850.h         | 20 ++++++++++++++++++-
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
index 141cf173f87d..8aa87b8c1b33 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
@@ -37,6 +37,7 @@ properties:
       - samsung,exynos850-cmu-cmgp
       - samsung,exynos850-cmu-core
       - samsung,exynos850-cmu-dpu
+      - samsung,exynos850-cmu-g3d
       - samsung,exynos850-cmu-hsi
       - samsung,exynos850-cmu-is
       - samsung,exynos850-cmu-mfcmscl
@@ -169,6 +170,24 @@ allOf:
             - const: oscclk
             - const: dout_dpu
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos850-cmu-g3d
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: G3D clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: dout_g3d_switch
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/exynos850.h b/include/dt-bindings/clock/exynos850.h
index 88d5289883d3..8bb62e43fd60 100644
--- a/include/dt-bindings/clock/exynos850.h
+++ b/include/dt-bindings/clock/exynos850.h
@@ -85,7 +85,10 @@
 #define CLK_DOUT_MFCMSCL_M2M		73
 #define CLK_DOUT_MFCMSCL_MCSC		74
 #define CLK_DOUT_MFCMSCL_JPEG		75
-#define TOP_NR_CLK			76
+#define CLK_MOUT_G3D_SWITCH		76
+#define CLK_GOUT_G3D_SWITCH		77
+#define CLK_DOUT_G3D_SWITCH		78
+#define TOP_NR_CLK			79
 
 /* CMU_APM */
 #define CLK_RCO_I3C_PMIC		1
@@ -195,6 +198,21 @@
 #define CLK_GOUT_SYSREG_CMGP_PCLK	15
 #define CMGP_NR_CLK			16
 
+/* CMU_G3D */
+#define CLK_FOUT_G3D_PLL		1
+#define CLK_MOUT_G3D_PLL		2
+#define CLK_MOUT_G3D_SWITCH_USER	3
+#define CLK_MOUT_G3D_BUSD		4
+#define CLK_DOUT_G3D_BUSP		5
+#define CLK_GOUT_G3D_CMU_G3D_PCLK	6
+#define CLK_GOUT_G3D_GPU_CLK		7
+#define CLK_GOUT_G3D_TZPC_PCLK		8
+#define CLK_GOUT_G3D_GRAY2BIN_CLK	9
+#define CLK_GOUT_G3D_BUSD_CLK		10
+#define CLK_GOUT_G3D_BUSP_CLK		11
+#define CLK_GOUT_G3D_SYSREG_PCLK	12
+#define G3D_NR_CLK			13
+
 /* CMU_HSI */
 #define CLK_MOUT_HSI_BUS_USER		1
 #define CLK_MOUT_HSI_MMC_CARD_USER	2
-- 
2.39.1

