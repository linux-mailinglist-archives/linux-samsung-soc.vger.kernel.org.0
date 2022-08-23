Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C3CE59D230
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 23 Aug 2022 09:33:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241045AbiHWHcY (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 23 Aug 2022 03:32:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241053AbiHWHcH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 23 Aug 2022 03:32:07 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B51B4642DF
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Aug 2022 00:31:58 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id z20so12717881ljq.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Aug 2022 00:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=7YI1/mD3H5QF1O/Ij6koXffrhM7CpoDCp7KLGJ6O08c=;
        b=G00hZRHnUf2Hz3UvWhraxzEB0JU27Y0SFqnd5o1A18QbOAY7d/xlIN22REHnZfO1Dh
         7jprbbDtgbnLsIfJflevOAEYkZHOHTTgrFeJsuWeLFglnC1imgmANcRb8VDhUsMM1jHe
         u3xrNgozooLDNcpSmLiy+zztG1yrsRGbzmbJ5wP4Iph3jb7PTt/ZHGz14Qc+yQC3XZqC
         aUHzAuwxDwv1k6l7E6Qm+qzZAnTDqUqQ3JldMyPjGKiMUtnjeAST5hmJqXBSr21sAVMy
         Cyawd5b1H03v8bu9zYxwYSUjb6yM/WGTl0TjsnX+iYJSoqCUPwbLCXbYWewcgIT+0MUX
         cNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=7YI1/mD3H5QF1O/Ij6koXffrhM7CpoDCp7KLGJ6O08c=;
        b=jzH8Hj9KcBpCt7w/KN7lljX1Y/qJVWBCXedoIHa6h/GHdPqHDTjEb6WKNC2LUv3DVJ
         dlbI8YDXzaVcCIGwnbPzj3+e1YngmZcyW9MlDGW4y8ik7es0aEgKnMCMjpJcMw2TZG+S
         tMaQrT1Yng9iZKKXdnl8xXbl0lOFGeo7+iMrqjDoRv455QUyDDn2lwv1EQfDjdJCL2l3
         o0JxF8+K0LNUh+M298uLFgEz+OI2AfNebGiWgOUeEvFOLhaU26p42iljvbLRw8mO0F3U
         71yXBuVz7L47pmwGJvHb8yhDm2QAjIKBLNdY6ND71t8vRoIxry9IgSU/HYB596ZyfdjP
         2Zlg==
X-Gm-Message-State: ACgBeo0ZPSJVnWjBt0zsZoh1JDf7V0U2EVNlNavG1vdSbA+MRiTFTAFR
        k197l403c1y5waJV0rLX4XZzrA==
X-Google-Smtp-Source: AA6agR67LH3YIXGRYOJYLyEPYICUo0sBRP/ptta4AAYJ64nephyTvVgVKF/3OT3Y7CTNH/7bXXCODw==
X-Received: by 2002:a2e:9d97:0:b0:261:bb31:4b6e with SMTP id c23-20020a2e9d97000000b00261bb314b6emr5479712ljj.59.1661239916815;
        Tue, 23 Aug 2022 00:31:56 -0700 (PDT)
Received: from krzk-bin.. (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id z13-20020a056512370d00b00492f21c161esm398504lfr.123.2022.08.23.00.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 00:31:56 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] clk: samsung: MAINTAINERS: add Krzysztof Kozlowski
Date:   Tue, 23 Aug 2022 10:31:54 +0300
Message-Id: <20220823073154.359090-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add Krzysztof Kozlowski (already Samsung SoC maintainer) as Samsung SoC
clock maintainer to handle the patches.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Agreed with Sylwester who is recently busy. Let me handle some patches
as I already handle rest of Samsung SoC.

I plan to send pulls the same way Sylwester did - to Stephen.
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5a72b303aed5..13d2b804dfa1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18048,12 +18048,14 @@ Q:	https://patchwork.linuxtv.org/project/linux-media/list/
 F:	drivers/media/platform/samsung/exynos4-is/
 
 SAMSUNG SOC CLOCK DRIVERS
+M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 M:	Tomasz Figa <tomasz.figa@gmail.com>
 M:	Chanwoo Choi <cw00.choi@samsung.com>
 R:	Alim Akhtar <alim.akhtar@samsung.com>
 L:	linux-samsung-soc@vger.kernel.org
 S:	Supported
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git
 F:	Documentation/devicetree/bindings/clock/samsung,*.yaml
 F:	Documentation/devicetree/bindings/clock/samsung,s3c*
-- 
2.34.1

