Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C131B692EC8
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 11 Feb 2023 07:40:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbjBKGkA (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 11 Feb 2023 01:40:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbjBKGjy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 11 Feb 2023 01:39:54 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43B7419F34
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Feb 2023 22:39:52 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id v15so6259033oie.9
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Feb 2023 22:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I4igiEHaEmXun0PNs8idyPpF3JFCOMVYHO6/XkOONRk=;
        b=iVLNqp5H9xAotKjCH2143YbG1DjhQAnMxHnO7oLbAZ4cTcgZ2FETFK+op1wH29fwKv
         joLs0eOK1SM/Iyy01OhBkMCYMMdTj85atBZpGYsTO7/Zz6qRk1tINyzLeodcgtMOPH5u
         e9kQCU6rOa01YvF+k/R/oWfqnLsk/sDLoM36YdfILIV/57HpGnyyVL0dvWOHhd+ESX9y
         NAmMjRsu/HsWDlTfrHvG/SbW43gQkUt1fa+NOfKk/tBveYVZmB32Av1a1LSUiDUZJkuD
         eyigsIxXjhWqmFEsOouebjMXgo3mmD0TWMqboSCnpiWOsoO2G2Tp+6sfnZyFmezmnhGh
         jR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I4igiEHaEmXun0PNs8idyPpF3JFCOMVYHO6/XkOONRk=;
        b=OV2nOHYCRSaSkgDdR70i0L8XsVIc8Mq+plyJmgArWhMTK3dYEcjY8KF+V9flm72IPY
         Ueyosb1yA3v3pB+cwpD3hnQ7w/b5qiP/vrFrl4/znlXJEQxDxfTDtBkmA1QcSc8HYx5i
         pW6JSxXS3aMRsmXN2s6KttXBPcL6DHAcJE7EcPKPL275lWqKzP7Ketzysfr+iDXOAeMn
         y18nwpVs/IARndMBHP1OySu4W57IXYU9djp4VomMVDN8hf+KAMfZiQyHeHMM5g758inA
         s1K6e9RXd34lNwd/eWkbGOXR2ZDjtKFc7tE+4MlQyJXctVyErqRfwlvpHYJC7ux/IXeM
         hU8A==
X-Gm-Message-State: AO0yUKVscjlm6xyPh+baPTtddg2tML5DTbdsjNGmkYc9y0pfZgtL4Bzy
        POWmIuFOtRoKlkgIShdZT7UiZA==
X-Google-Smtp-Source: AK7set/qa6yurSTOn5/WHjazZGtNEvTxxlZmK3RRnck3dlM/Y9xw+45ndsO+m9XrEN0iaotaLDNyJg==
X-Received: by 2002:a05:6808:4396:b0:378:9bd:2cec with SMTP id dz22-20020a056808439600b0037809bd2cecmr8286614oib.51.1676097591592;
        Fri, 10 Feb 2023 22:39:51 -0800 (PST)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id b6-20020aca1b06000000b0037d813cd612sm58443oib.43.2023.02.10.22.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 22:39:51 -0800 (PST)
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
Subject: [PATCH 2/6] dt-bindings: clock: exynos850: Add AUD and HSI main gate clocks
Date:   Sat, 11 Feb 2023 00:40:02 -0600
Message-Id: <20230211064006.14981-3-semen.protsenko@linaro.org>
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

Add main gate clocks for controlling AUD and HSI CMUs:
  - gout_aud_cmu_aud_pclk
  - gout_hsi_cmu_hsi_pclk

While at it, add missing PPMU (Performance Profiling Monitor Unit)
clocks for CMU_HSI.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 include/dt-bindings/clock/exynos850.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/dt-bindings/clock/exynos850.h b/include/dt-bindings/clock/exynos850.h
index 8bb62e43fd60..afacba338c91 100644
--- a/include/dt-bindings/clock/exynos850.h
+++ b/include/dt-bindings/clock/exynos850.h
@@ -178,7 +178,8 @@
 #define IOCLK_AUDIOCDCLK5		58
 #define IOCLK_AUDIOCDCLK6		59
 #define TICK_USB			60
-#define AUD_NR_CLK			61
+#define CLK_GOUT_AUD_CMU_AUD_PCLK	61
+#define AUD_NR_CLK			62
 
 /* CMU_CMGP */
 #define CLK_RCO_CMGP			1
@@ -227,7 +228,10 @@
 #define CLK_GOUT_MMC_CARD_ACLK		11
 #define CLK_GOUT_MMC_CARD_SDCLKIN	12
 #define CLK_GOUT_SYSREG_HSI_PCLK	13
-#define HSI_NR_CLK			14
+#define CLK_GOUT_HSI_PPMU_ACLK		14
+#define CLK_GOUT_HSI_PPMU_PCLK		15
+#define CLK_GOUT_HSI_CMU_HSI_PCLK	16
+#define HSI_NR_CLK			17
 
 /* CMU_IS */
 #define CLK_MOUT_IS_BUS_USER		1
-- 
2.39.1

