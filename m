Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C42C4638F
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 14 Jun 2019 18:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725827AbfFNQBG (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 14 Jun 2019 12:01:06 -0400
Received: from cyberdimension.org ([80.67.179.20]:44498 "EHLO
        gnutoo.cyberdimension.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbfFNQBG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 14 Jun 2019 12:01:06 -0400
X-Greylist: delayed 397 seconds by postgrey-1.27 at vger.kernel.org; Fri, 14 Jun 2019 12:01:06 EDT
Received: from gnutoo.cyberdimension.org (localhost [127.0.0.1])
        by cyberdimension.org (OpenSMTPD) with ESMTP id 935a8d3d;
        Fri, 14 Jun 2019 15:52:12 +0000 (UTC)
Received: from primarylaptop.localdomain (localhost.localdomain [IPv6:::1])
        by gnutoo.cyberdimension.org (OpenSMTPD) with ESMTP id fe701c55;
        Fri, 14 Jun 2019 15:52:12 +0000 (UTC)
From:   Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
To:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Simon Shields <simon@lineageos.org>,
        Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
Subject: [PATCH] ARM: dts: exynos: add flash support to galaxy-s3 boards
Date:   Fri, 14 Jun 2019 17:54:19 +0200
Message-Id: <20190614155419.14260-1-GNUtoo@cyberdimension.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Simon Shields <simon@lineageos.org>

The galaxy s3 boards use an aat1290 to control the flash LED.
This patch adds the relevant device tree configuration to use it.

Signed-off-by: Simon Shields <simon@lineageos.org>
Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org> [rebase]
---
 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi | 32 +++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
index 30eee5942eff..375aeca09882 100644
--- a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
+++ b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
@@ -15,6 +15,24 @@
 		i2c10 = &i2c_cm36651;
 	};
 
+	aat1290 {
+		compatible = "skyworks,aat1290";
+		flen-gpios = <&gpj1 1 GPIO_ACTIVE_HIGH>;
+		enset-gpios = <&gpj1 2 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-names = "default", "host", "isp";
+		pinctrl-0 = <&camera_flash_host>;
+		pinctrl-1 = <&camera_flash_host>;
+		pinctrl-2 = <&camera_flash_isp>;
+
+		flash-led {
+			label = "flash";
+			led-max-microamp = <520833>;
+			flash-max-microamp = <1012500>;
+			flash-max-timeout-us = <1940000>;
+		};
+	};
+
 	lcd_vdd3_reg: voltage-regulator-6 {
 		compatible = "regulator-fixed";
 		regulator-name = "LCD_VDD_2.2V";
@@ -131,6 +149,20 @@
 	regulator-max-microvolt = <2800000>;
 };
 
+&pinctrl_0 {
+	camera_flash_host: camera-flash-host {
+		samsung,pins = "gpj1-0";
+		samsung,pin-function = <1>;
+		samsung,pin-val = <0>;
+	};
+
+	camera_flash_isp: camera-flash-isp {
+		samsung,pins = "gpj1-0";
+		samsung,pin-function = <1>;
+		samsung,pin-val = <1>;
+	};
+};
+
 &s5c73m3 {
 	standby-gpios = <&gpm0 1 GPIO_ACTIVE_LOW>;   /* ISP_STANDBY */
 	vdda-supply = <&ldo17_reg>;
-- 
2.21.0

