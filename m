Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 097B3256E5E
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 30 Aug 2020 16:07:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726726AbgH3OGo (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 30 Aug 2020 10:06:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:56442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728960AbgH3NzL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 30 Aug 2020 09:55:11 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E3E9820EDD;
        Sun, 30 Aug 2020 13:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598795710;
        bh=eiTubOxndxJqO717q+7D5nKZxHsqjsCWsm2ON9kdAOc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=w2YmAxXXitwr1QRg3Ffpl56+g28Jl/3epC0j9/YNWNGr48yxtp8sUB6CzZx94eQgh
         TiRL6VIfJKI8hiLfo6Zg/j40gBLdBxokSBztZy58ERTegLzU3PyA0Nird8vU7YRwYC
         IFPPydHeMK8Raj/7w9ngAebfHDKwGkcUdnCmyBNk=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Denis GNUtoo Carikli" <GNUtoo@cyberdimension.org>,
        Simon Shields <simon@lineageos.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH 25/33] ARM: dts: exynos: Add S5M8767 clocks for RTC in Exynos4412 Origen
Date:   Sun, 30 Aug 2020 15:51:52 +0200
Message-Id: <20200830135200.24304-25-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200830135200.24304-1-krzk@kernel.org>
References: <20200830135200.24304-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add node for clock controller of Samsung S5M8767 PMIC.  This provides
the 32768 Hz clock required by S3C RTC.  Except making the S3C RTC
working, this also fixes dtbs_check warnings:

  arch/arm/boot/dts/exynos4412-origen.dt.yaml: rtc@10070000: clocks: [[7, 346]] is too short
  arch/arm/boot/dts/exynos4412-origen.dt.yaml: rtc@10070000: clock-names: ['rtc'] is too short

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos4412-origen.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index 8b11ad391252..4c52ca6dbe57 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -11,6 +11,7 @@
 
 /dts-v1/;
 #include "exynos4412.dtsi"
+#include <dt-bindings/clock/samsung,s2mps11.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include "exynos-mfc-reserved-memory.dtsi"
@@ -129,6 +130,13 @@
 						 <1200000>, <1200000>,
 						 <1200000>, <1200000>;
 
+		s5m8767_osc: clocks {
+			compatible = "samsung,s5m8767-clk";
+			#clock-cells = <1>;
+			clock-output-names = "s5m8767_ap", "s5m8767_cp",
+					     "s5m8767_bt";
+		};
+
 		regulators {
 			ldo1_reg: LDO1 {
 				regulator-name = "VDD_ALIVE";
@@ -499,6 +507,8 @@
 
 &rtc {
 	status = "okay";
+	clocks = <&clock CLK_RTC>, <&s5m8767_osc S2MPS11_CLK_AP>;
+	clock-names = "rtc", "rtc_src";
 };
 
 &sdhci_2 {
-- 
2.17.1

