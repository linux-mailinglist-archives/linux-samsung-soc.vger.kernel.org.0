Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C5D1639A7B
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 27 Nov 2022 13:33:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbiK0MdH (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 27 Nov 2022 07:33:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbiK0MdE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 27 Nov 2022 07:33:04 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFB4DC76E
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Nov 2022 04:33:03 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id j4so13528079lfk.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Nov 2022 04:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cPN+BmEQYUICy1UGQadZzNzqjOx78Sh8uSqQROeddZE=;
        b=R2Bv2zPBNAl3ZUxMwVQ94JqwxnJpJG5mXOKSYD3VHvLrUz2pmoO7egVrIX2SfqctqC
         6l6g8zPjichLkNqzdYCMoJRUHCqnXy0PoWi74E5GCi6FX3W7QV0qMOVyW2DRpSpCXYqN
         DCrOt/IVhX6tYwdu9wqij+3COEEPWoP3Q12rFyI6YHzwUR0oMD2DpU+ii8QnSGXQmjmo
         lM3RJodFsgGFfR7Ge079wQ5nSFBkHa0L+KDJjk8CBV00WGVk96N6nvcUwOXLRjcUySHL
         /ki5yRrNugHMXrnV6H36Gyfw2qCokuvQ0Y2u0zH/ZGNaAWdwEHG/Mwwj9bph2TsmSQAb
         0KvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cPN+BmEQYUICy1UGQadZzNzqjOx78Sh8uSqQROeddZE=;
        b=xh3o4vh5Buh+MTJko730CUHY03Iz8lzaQ+hYPJhlPzFZ0sMfX5BXrm0lSpEz0+A15u
         eEGdazXrsnSkLGxu/FpHfpy98I0QEnS1nEF+gFVYxi2GXx62px4Sm4wdw7R3Bpa7R9uM
         ot04OJLn+bZ/06hTmzrq3aI465q1sVK6zUeaOPLEo2wkvrItx9PPka8H6BwZ7wvihVzS
         29dqqB8mT9LYM5VLQtNYaF6n7vsx7dFtv14GN9M2QXQadlLPwn5/H36q0LRpqhZVzaZ0
         hze6Rgo+quSSoQb/B798sl8izaOjS6c3Ie3PAQesSPpocHJYc6zGBSRGYVbicxq/DdiK
         E62g==
X-Gm-Message-State: ANoB5pnN64M6aZWVyqq/E2NQhq3OZnR16fx22iXmiYVv/avwoj+4RU7n
        tVeXHvnmLAv3H156gFVQAoq12g==
X-Google-Smtp-Source: AA0mqf4ZGewxA+MAxTSYQyTdPfXIgmWFQs7H/WvB19mYSjPeHIYBsOkM7+Ouac+VhOeyig59zSJdfQ==
X-Received: by 2002:a05:6512:c06:b0:4b4:a843:38b3 with SMTP id z6-20020a0565120c0600b004b4a84338b3mr12120722lfu.417.1669552382298;
        Sun, 27 Nov 2022 04:33:02 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bf36-20020a05651225a400b0049fff3f645esm1270435lfb.70.2022.11.27.04.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 04:33:01 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Sriranjani P <sriranjani.p@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v2 1/4] arm64: dts: exynos: add dedicated SYSREG compatibles to Exynos5433
Date:   Sun, 27 Nov 2022 13:32:56 +0100
Message-Id: <20221127123259.20339-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Exynos5433 has several different SYSREGs, so use dedicated compatibles
for them.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Reviewed-by: Sriranjani P <sriranjani.p@samsung.com>

---

Changes since v1:
1. Add Rb tags.

Cc: Sriranjani P <sriranjani.p@samsung.com>
Cc: Chanho Park <chanho61.park@samsung.com>
Cc: Sam Protsenko <semen.protsenko@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index bd6a354b9cb5..6976e45aa769 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -1118,22 +1118,26 @@ hdmiphy: hdmiphy@13af0000 {
 		};
 
 		syscon_disp: syscon@13b80000 {
-			compatible = "samsung,exynos5433-sysreg", "syscon";
+			compatible = "samsung,exynos5433-disp-sysreg",
+				     "samsung,exynos5433-sysreg", "syscon";
 			reg = <0x13b80000 0x1010>;
 		};
 
 		syscon_cam0: syscon@120f0000 {
-			compatible = "samsung,exynos5433-sysreg", "syscon";
+			compatible = "samsung,exynos5433-cam0-sysreg",
+				     "samsung,exynos5433-sysreg", "syscon";
 			reg = <0x120f0000 0x1020>;
 		};
 
 		syscon_cam1: syscon@145f0000 {
-			compatible = "samsung,exynos5433-sysreg", "syscon";
+			compatible = "samsung,exynos5433-cam1-sysreg",
+				     "samsung,exynos5433-sysreg", "syscon";
 			reg = <0x145f0000 0x1038>;
 		};
 
 		syscon_fsys: syscon@156f0000 {
-			compatible = "samsung,exynos5433-sysreg", "syscon";
+			compatible = "samsung,exynos5433-fsys-sysreg",
+				     "samsung,exynos5433-sysreg", "syscon";
 			reg = <0x156f0000 0x1044>;
 		};
 
-- 
2.34.1

