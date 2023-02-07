Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA62A68E143
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  7 Feb 2023 20:33:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbjBGTdE (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 7 Feb 2023 14:33:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231572AbjBGTdD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Feb 2023 14:33:03 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C1C23B656
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Feb 2023 11:33:01 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id d14so14632497wrr.9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Feb 2023 11:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fSuoB4IgL+0KHcN4gvN6QaVojWpwSFr2mY0I+k3bLs0=;
        b=v/JFcetmcjwGGYaS8wQ2wLEvWCsjn37OPr0kKYZWgI1T7qbTU/6sAUJANbV8PYOqSe
         OLKALAFb+3j7ommNQ3CWd7r+DGgvwVdodH7/q7cUFEzReRVW4WFFOM3kmEEvAJRi0dOm
         lSPjsnt4jntZqB/mmkYA/kv+JO/EypR7Ipk0vmPVmiagMdbnYp2p1o9mmmuiNU+MVzr3
         mUTrHyXmdrJpGW8RypV7ulMhDqDgHbTweQ/1bEJ6OjFk46ATwDAEBQbjCwV8ZZ+s1wge
         ncwdckumvk3UWIEBMjgeFQnnmjwm8XgRh7cIH23oZ/2WhSmOuupBYEe25S/t6X5gy9z0
         LhXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fSuoB4IgL+0KHcN4gvN6QaVojWpwSFr2mY0I+k3bLs0=;
        b=Csv6uQmN+TTEUinsBJNy/UyNZN0gVGkgGZrQjPqFg3zoyE1/M03OuTga7/l8yOiPU0
         d9FnN/tiOlDT1kMfXxOpcgNOyvZLAiW8H2/j1Gw9qx8xuCnhJUyV0dltiguL29GyTNEX
         9HqalbbSg0Q42Ltsxe6nQdrSV3+y3YEbyEHEUgPoIYQz8yO+wChHmR0Ap9b+zSlLDjGI
         xDr6tmMH5mHagd7o3i8OdF1Z0ZafRCkXn6QyUqejh5GfcyBwCYLhxxXAEsETLkF94yZZ
         RMghmrdHC6S9CoAOmH+JbCaDpUgkNPdbpKWiD5JBuD4W/rEFz6mSo7TiTdnlhabE9ARO
         LQeA==
X-Gm-Message-State: AO0yUKW3hfhi//IcbR2sMvwag3BRy3dUYmgW7/HV/P4L9cH6QKY/6RJT
        tXzPWxju/HQhMUvviwq4AEI6SA==
X-Google-Smtp-Source: AK7set+yCl0xscd6K/QjrdVW4ZAjBoi3nmA2Kcuqn7OIxVOOjmdBYTEimKuJlM6khGQTzXYkJYO+Hw==
X-Received: by 2002:adf:9dd2:0:b0:2c3:efb7:e9a2 with SMTP id q18-20020adf9dd2000000b002c3efb7e9a2mr112678wre.16.1675798379782;
        Tue, 07 Feb 2023 11:32:59 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id d17-20020adff851000000b002c3dd82a0e9sm9199448wrq.91.2023.02.07.11.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 11:32:59 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] ARM: dts: s5pv210: drop simple-bus from FIMC
Date:   Tue,  7 Feb 2023 20:32:54 +0100
Message-Id: <20230207193254.550236-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230207193254.550236-1-krzysztof.kozlowski@linaro.org>
References: <20230207193254.550236-1-krzysztof.kozlowski@linaro.org>
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

The FIMC camera node wrapper is not a bus, so using simple-bus fallback
compatible just to instantiate its children nodes was never correct.

The change is not backwards compatible and expects the FIMC driver to
populate its children.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/s5pv210.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
index 12e90a1cc6a1..5cf75cccd088 100644
--- a/arch/arm/boot/dts/s5pv210.dtsi
+++ b/arch/arm/boot/dts/s5pv210.dtsi
@@ -547,8 +547,8 @@ i2c1: i2c@fab00000 {
 			status = "disabled";
 		};
 
-		camera: camera {
-			compatible = "samsung,fimc", "simple-bus";
+		camera: camera@fa600000 {
+			compatible = "samsung,fimc";
 			pinctrl-names = "default";
 			pinctrl-0 = <>;
 			clocks = <&clocks SCLK_CAM0>, <&clocks SCLK_CAM1>;
-- 
2.34.1

