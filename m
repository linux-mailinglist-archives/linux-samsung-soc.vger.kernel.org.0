Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 910982D6A12
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 10 Dec 2020 22:40:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404778AbgLJV36 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 10 Dec 2020 16:29:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:41044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394058AbgLJV34 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 16:29:56 -0500
From:   Krzysztof Kozlowski <krzk@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH 2/9] ARM: dts: exynos: correct PMIC interrupt trigger level on Monk
Date:   Thu, 10 Dec 2020 22:28:56 +0100
Message-Id: <20201210212903.216728-2-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201210212903.216728-1-krzk@kernel.org>
References: <20201210212903.216728-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The Samsung PMIC datasheets describe the interrupt line as active low
with a requirement of acknowledge from the CPU.  Without specifying the
interrupt type in Devicetree, kernel might apply some fixed
configuration, not necessarily working for this hardware.

Fixes: e0cefb3f79d3 ("ARM: dts: add board dts file for Exynos3250-based Monk board")
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos3250-monk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos3250-monk.dts b/arch/arm/boot/dts/exynos3250-monk.dts
index 69451566945d..fae046e08a5d 100644
--- a/arch/arm/boot/dts/exynos3250-monk.dts
+++ b/arch/arm/boot/dts/exynos3250-monk.dts
@@ -200,7 +200,7 @@ &i2c_0 {
 	pmic@66 {
 		compatible = "samsung,s2mps14-pmic";
 		interrupt-parent = <&gpx0>;
-		interrupts = <7 IRQ_TYPE_NONE>;
+		interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
 		reg = <0x66>;
 		wakeup-source;
 
-- 
2.25.1

