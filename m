Return-Path: <linux-samsung-soc+bounces-6947-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5BAA3A6D4
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 18 Feb 2025 20:07:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CBFC1760EA
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 18 Feb 2025 19:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22C591F5838;
	Tue, 18 Feb 2025 19:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Orc2USBR"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED981EB5DF;
	Tue, 18 Feb 2025 19:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739905452; cv=none; b=lcDv7MUz460LzhRgBIh+3hIZV51VWyfPYg+/n6QrsviSrN5pxtuwmXx27vGh2Yz3xN/tisxAptmD+mXAyTDdXhyvHRgwKpwpF37m9qOigfnVeWy6FkO376VL82zvQURR3J3Etunbn4tb+l59weQ+wQDVZxZ2d5fJOPX//SsW7o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739905452; c=relaxed/simple;
	bh=FrGJZul3UwzPV2j34owJUMHrrWKssFWYNJQgIvKR6a8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R1ORcIFixqmHGyFRXOigu8CfNshDsLUOqF8ImfXgVuNyPEx4Y5ZjZ4ydvZYPqvVx3R4p1NsSVzV/Hh86lSfzhWYEo/001evRIUOfst6rHIIrNwmCkk0uEtGYDWpbonJlbuc+SRlvZMf7ki76ytjFIGgzhZG25EaiQUuxaQokSuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Orc2USBR; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0080225FD3;
	Tue, 18 Feb 2025 20:04:08 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 59xl1hpKbp9o; Tue, 18 Feb 2025 20:04:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739905441; bh=FrGJZul3UwzPV2j34owJUMHrrWKssFWYNJQgIvKR6a8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Orc2USBRVhtHxU3ZJBeiilaZAOYwtRXAh7Xf2grwVqO2wT8ICO1UHUZmoz3161dRU
	 AEAYDFYL/ax/5ykcpASOVP7erqWAFSYUJlbsdTg0FOjZx61bN76VcyG4NRTpvNG41r
	 /jvm0b7JmtD1zQ7umyhVE+vL2pMXVYEx1p960/zgMUoWGBgFF0vYoLMh4hIYV9AcJY
	 VEf4ZtkZmrnAj6JsLrOiOxkGP5fB01y98v/IgYy/mt6qdqh5eCKYt6JGLA6mmEn4qO
	 qDp2WhLNYEKyeDw7+0761CxyylepWAXjM/scyv5yFI6I0q2UnToZZPXM7ZUyAixERd
	 DzMkFKmzTxu7Q==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Wed, 19 Feb 2025 00:33:14 +0530
Subject: [PATCH v3 4/7] arm64: dts: exynos: add initial devicetree support
 for exynos7870
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-exynos7870-v3-4-e384fb610cad@disroot.org>
References: <20250219-exynos7870-v3-0-e384fb610cad@disroot.org>
In-Reply-To: <20250219-exynos7870-v3-0-e384fb610cad@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739905418; l=48817;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=FrGJZul3UwzPV2j34owJUMHrrWKssFWYNJQgIvKR6a8=;
 b=sS7Yj2oh/1/532bwgOBIaq1omzoLrF+bKJMwQSpxre3l+B8n8VouKeb1e8Wi2JTMxHm/msnMR
 S6NI293tReFADlYE8PDxbgXTaj7XoJ8NAbVM5wt3CVIQrCTpHZCGCLK
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Exynos7870 is an arm64 SoC manufactured by Samsung and announced in
2016. It is present in multiple mid-range Samsung phones and tablets.

Add basic devicetree support for the SoC, which includes CMUs, pin
controllers, I2C, UART, DW-MMC, and USB-DRD.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 arch/arm64/boot/dts/exynos/exynos7870-pinctrl.dtsi | 1022 ++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         |  720 ++++++++++++++
 2 files changed, 1742 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos7870-pinctrl.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..4b651c7d3baa53871b7c8513161ad6a4d6c283a2
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos7870-pinctrl.dtsi
@@ -0,0 +1,1022 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Samsung Exynos7870 SoC pin-mux and pin-config device tree source
+ *
+ * Copyright (c) 2015 Samsung Electronics Co., Ltd.
+ * Copyright (c) 2025 Kaustabh Chakraborty <kauschluss@disroot.org>
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include "exynos-pinctrl.h"
+
+&pinctrl_alive {
+	etc0: etc0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	etc1: etc1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpa0: gpa0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpa1: gpa1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpa2: gpa2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpq0: gpq0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	bt_btwake: bt-btwake-pins {
+		samsung,pins = "gpa1-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	bt_hostwake: bt-hostwake-pins {
+		samsung,pins = "gpa1-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	gnss_sensor_i2c: gnss-sensor-i2c-pins {
+		samsung,pins = "gpa2-5", "gpa2-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_6>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	gnss_sensor_irq: gnss-sensor-irq-pins {
+		samsung,pins = "gpa2-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_6>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+	};
+
+	nfc_int: nfc-int-pins {
+		samsung,pins = "gpa2-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+	};
+
+	uart2_bus: uart2-bus-pins {
+		samsung,pins = "gpa1-1", "gpa1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart2_sleep: uart2-sleep-pins {
+		samsung,pins = "gpa1-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+	};
+};
+
+&pinctrl_dispaud {
+	gpz0: gpz0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpz1: gpz1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpz2: gpz2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	i2s_amp_bus: i2s-amp-bus-pins {
+		samsung,pins = "gpz1-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	i2s_amp_bus_idle: i2s-amp-bus-idle-pins {
+		samsung,pins = "gpz1-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	i2s_bt_bus: i2s-bt-bus-pins {
+		samsung,pins = "gpz0-0", "gpz0-1", "gpz0-2", "gpz0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	i2s_bt_bus_idle: i2s-bt-bus-idle-pins {
+		samsung,pins = "gpz0-0", "gpz0-1", "gpz0-2", "gpz0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	i2s_pmic_amp_bus: i2s-pmic-amp-bus-pins {
+		samsung,pins = "gpz1-0", "gpz1-1", "gpz1-2", "gpz1-3", "gpz1-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR6>;
+	};
+
+	i2s_pmic_amp_bus_idle: i2s-pmic-amp-bus-idle-pins {
+		samsung,pins = "gpz1-0", "gpz1-1", "gpz1-2", "gpz1-3", "gpz1-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR6>;
+	};
+
+	i2s_pmic_bus: i2s-pmic-bus-pins {
+		samsung,pins = "gpz1-0", "gpz1-2", "gpz1-3", "gpz1-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR6>;
+	};
+
+	i2s_pmic_bus_idle: i2s-pmic-bus-idle-pins {
+		samsung,pins = "gpz1-0", "gpz1-2", "gpz1-3", "gpz1-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR6>;
+	};
+
+	i2s_fm_bus: i2s-fm-bus-pins {
+		samsung,pins = "gpz2-0", "gpz2-1", "gpz2-2", "gpz2-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	i2s_fm_bus_idle: i2s-fm-bus-idle-pins {
+		samsung,pins = "gpz2-0", "gpz2-1", "gpz2-2", "gpz2-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+};
+
+&pinctrl_ese {
+	gpc7: gpc7-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	spi0_bus: spi0-bus-pins {
+		samsung,pins = "gpc7-3", "gpc7-2", "gpc7-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	spi0_cs0: spi0-cs0-pins {
+		samsung,pins = "gpc7-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	spi0_cs1: spi0-cs1-pins {
+		samsung,pins = "gpc7-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+};
+
+&pinctrl_fsys {
+	gpr0: gpr0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpr1: gpr1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpr2: gpr2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpr3: gpr3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpr4: gpr4-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	sd0_bus1: sd0-bus-width1-pins {
+		samsung,pins = "gpr1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	sd0_bus4: sd0-bus-width4-pins {
+		samsung,pins = "gpr1-1", "gpr1-2", "gpr1-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	sd0_bus8: sd0-bus-width8-pins {
+		samsung,pins = "gpr1-4", "gpr1-5", "gpr1-6", "gpr1-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	sd0_clk: sd0-clk-pins {
+		samsung,pins = "gpr0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	sd0_clk_fast_slew_rate_1x: sd0-clk-fast-slew-rate-1x-pins {
+		samsung,pins = "gpr0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	sd0_clk_fast_slew_rate_2x: sd0-clk-fast-slew-rate-2x-pins {
+		samsung,pins = "gpr0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR2>;
+	};
+
+	sd0_clk_fast_slew_rate_3x: sd0-clk-fast-slew-rate-3x-pins {
+		samsung,pins = "gpr0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	sd0_clk_fast_slew_rate_4x: sd0-clk-fast-slew-rate-4x-pins {
+		samsung,pins = "gpr0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR4>;
+	};
+
+	sd0_clk_fast_slew_rate_5x: sd0-clk-fast-slew-rate-5x-pins {
+		samsung,pins = "gpr0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR5>;
+	};
+
+	sd0_clk_fast_slew_rate_6x: sd0-clk-fast-slew-rate-6x-pins {
+		samsung,pins = "gpr0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR6>;
+	};
+
+	sd0_cmd: sd0-cmd-pins {
+		samsung,pins = "gpr0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	sd0_rdqs: sd0-rdqs-pins {
+		samsung,pins = "gpr0-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	sd1_bus1: sd1-bus-width1-pins {
+		samsung,pins = "gpr3-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	sd1_bus4: sd1-bus-width4-pins {
+		samsung,pins = "gpr3-1", "gpr3-2", "gpr3-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	sd1_clk: sd1-clk-pins {
+		samsung,pins = "gpr2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	sd1_cmd: sd1-cmd-pins {
+		samsung,pins = "gpr2-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	sd2_bus1: sd2-bus-width1-pins {
+		samsung,pins = "gpr4-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	sd2_bus4: sd2-bus-width4-pins {
+		samsung,pins = "gpr4-3", "gpr4-4", "gpr4-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	sd2_clk: sd2-clk-pins {
+		samsung,pins = "gpr4-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	sd2_clk_fast_slew_rate_1x: sd2-clk-fast-slew-rate-1x-pins {
+		samsung,pins = "gpr4-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	sd2_clk_fast_slew_rate_2x: sd2-clk-fast-slew-rate-2x-pins {
+		samsung,pins = "gpr4-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR2>;
+	};
+
+	sd2_clk_fast_slew_rate_3x: sd2-clk-fast-slew-rate-3x-pins {
+		samsung,pins = "gpr4-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	sd2_clk_fast_slew_rate_4x: sd2-clk-fast-slew-rate-4x-pins {
+		samsung,pins = "gpr4-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR4>;
+	};
+
+	sd2_cmd: sd2-cmd-pins {
+		samsung,pins = "gpr4-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+};
+
+&pinctrl_mif {
+	gpm0: gpm0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	hsi2c0_bus: hsi2c0-bus-pins {
+		samsung,pins = "gpm0-1", "gpm0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+};
+
+&pinctrl_nfc {
+	gpc2: gpc2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	i2c6_bus: i2c6-bus-pins {
+		samsung,pins = "gpc2-1", "gpc2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	nfc_en: nfc-en-pins {
+		samsung,pins = "gpc2-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+		samsung,pin-val = <1>;
+	};
+
+	nfc_n5_clk_req: nfc-n5-clk-req-pins {
+		samsung,pins = "gpc2-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	nfc_pd: nfc-pd-pins {
+		samsung,pins = "gpc2-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+};
+
+&pinctrl_top {
+	gpb0: gpb0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpc0: gpc0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpc1: gpc1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpc4: gpc4-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpc5: gpc5-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpc6: gpc6-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpc8: gpc8-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpc9: gpc9-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpd1: gpd1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpd2: gpd2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpd3: gpd3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpd4: gpd4-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpe0: gpe0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf0: gpf0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf1: gpf1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf2: gpf2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf3: gpf3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf4: gpf4-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	decon_te_off: decon-te-off-pins {
+		samsung,pins = "gpe0-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+	};
+
+	decon_te_on: decon-te-on-pins {
+		samsung,pins = "gpe0-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+	};
+
+	ese_pvdd_en: ese-pvdd-en-pins {
+		samsung,pins = "gpf4-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR4>;
+	};
+
+	fimc_is_flash: fimc-is-flash-pins {
+		samsung,pins = "gpd3-2", "gpd3-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	fimc_is_mclk0_fn: fimc-is-mclk0-fn-pins {
+		samsung,pins = "gpe0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR2>;
+	};
+
+	fimc_is_mclk0_in: fimc-is-mclk0-in-pins {
+		samsung,pins = "gpe0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	fimc_is_mclk0_out: fimc-is-mclk0-out-pins {
+		samsung,pins = "gpe0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	fimc_is_mclk1_fn: fimc-is-mclk1-fn-pins {
+		samsung,pins = "gpe0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR2>;
+	};
+
+	fimc_is_mclk1_in: fimc-is-mclk1-in-pins {
+		samsung,pins = "gpe0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	fimc_is_mclk1_out: fimc-is-mclk1-out-pins {
+		samsung,pins = "gpe0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	fimc_is_mclk2_fn: fimc-is-mclk2-fn-pins {
+		samsung,pins = "gpf4-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+	};
+
+	fimc_is_mclk2_out: fimc-is-mclk2-out-pins {
+		samsung,pins = "gpf4-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR3>;
+		samsung,pin-val = <0>;
+	};
+
+	hsi2c1_bus: hsi2c1-bus-pins {
+		samsung,pins = "gpf0-1", "gpf0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	hsi2c2_bus: hsi2c2-bus-pins {
+		samsung,pins = "gpf1-1", "gpf1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	hsi2c3_bus: hsi2c3-bus-pins {
+		samsung,pins = "gpf0-3", "gpf0-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	hsi2c4_bus: hsi2c4-bus-pins {
+		samsung,pins = "gpf2-1", "gpf2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	hsi2c5_bus: hsi2c5-bus-pins {
+		samsung,pins = "gpf3-0", "gpf3-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	hsi2c6_bus: hsi2c6-bus-pins {
+		samsung,pins = "gpf3-2", "gpf3-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	i2c0_bus: i2c0-bus-pins {
+		samsung,pins = "gpc4-1", "gpc4-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	i2c2_bus: i2c2-bus-pins {
+		samsung,pins = "gpc8-1", "gpc8-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	i2c3_bus: i2c3-bus-pins {
+		samsung,pins = "gpc9-1", "gpc9-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	i2c4_bus: i2c4-bus-pins {
+		samsung,pins = "gpc1-1", "gpc1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	i2c5_bus: i2c5-bus-pins {
+		samsung,pins = "gpc1-3", "gpc1-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	i2c7_bus: i2c7-bus-pins {
+		samsung,pins = "gpc4-3", "gpc4-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	i2c8_bus: i2c8-bus-pins {
+		samsung,pins = "gpc5-1", "gpc5-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	nfc_n5_firm: nfc-n5-firm-pins {
+		samsung,pins = "gpd4-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-val = <1>;
+	};
+
+	nfc_pvdd_en: nfc-pvdd-en-pins {
+		samsung,pins = "gpd2-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR4>;
+	};
+
+	pwm_tout0: pwm-tout0-pins {
+		samsung,pins = "gpc0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	pwm_tout1: pwm-tout1-pins {
+		samsung,pins = "gpc0-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	spi1_bus: spi1-bus-pins {
+		samsung,pins = "gpf3-3", "gpf3-2", "gpf3-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	spi1_cs0: spi1-cs0-pins {
+		samsung,pins = "gpf3-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	spi1_cs1: spi1-cs1-pins {
+		samsung,pins = "gpd1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	spi2_bus: spi2-bus-pins {
+		samsung,pins = "gpf4-3", "gpf4-2", "gpf4-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	spi2_cs0: spi2-cs0-pins {
+		samsung,pins = "gpf4-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	spi2_cs1: spi2-cs1-pins {
+		samsung,pins = "gpd1-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+
+	spi3_bus: spi3-bus-pins {
+		samsung,pins = "gpc6-0", "gpc6-2", "gpc6-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	spi3_bus_suspend: spi3-bus-suspend-pins {
+		samsung,pins = "gpc6-0", "gpc6-2", "gpc6-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	spi3_cs: spi3-cs-pins {
+		samsung,pins = "gpc6-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	spi4_bus: spi4-bus-pins {
+		samsung,pins = "gpc4-2", "gpc5-0", "gpc5-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	spi4_cs: spi4-cs-pins {
+		samsung,pins = "gpc4-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	spi4_cs_func: spi4-cs-func-pins {
+		samsung,pins = "gpc4-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	spi4_miso: spi4-miso-pins {
+		samsung,pins = "gpc5-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR4>;
+	};
+
+	spi4_mosi_sck_ssn: spi4-mosi-sck-ssn-pins {
+		samsung,pins = "gpc5-1", "gpc4-2", "gpc4-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR4>;
+	};
+
+	uart0_bus: uart0-bus-pins {
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pins = "gpd2-3", "gpd2-2", "gpd2-1", "gpd2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+	};
+
+	uart1_bus: uart1-bus-pins {
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pins = "gpb0-3", "gpb0-2", "gpb0-1", "gpb0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+	};
+};
+
+&pinctrl_touch {
+	gpc3: gpc3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	i2c1_bus: i2c1-bus-pins {
+		samsung,pins = "gpc3-1", "gpc3-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
+	ese_cs_func: ese-cs-func-pins {
+		samsung,pins = "gpc3-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+		samsung,pin-val = <1>;
+	};
+
+	ese_cs_func_suspend: ese-cs-func-suspend-pins {
+		samsung,pins = "gpc3-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/exynos/exynos7870.dtsi b/arch/arm64/boot/dts/exynos/exynos7870.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..8572f8f62ec99d5fadbd62419d51ff3ca8d826cc
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos7870.dtsi
@@ -0,0 +1,720 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Samsung Exynos7870 SoC device tree source
+ *
+ * Copyright (c) 2015 Samsung Electronics Co., Ltd.
+ * Copyright (c) 2025 Kaustabh Chakraborty <kauschluss@disroot.org>
+ */
+
+#include <dt-bindings/clock/exynos7870.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/soc/samsung,boot-mode.h>
+
+/ {
+	compatible = "samsung,exynos7870";
+	#address-cells = <2>;
+	#size-cells = <1>;
+
+	interrupt-parent = <&gic>;
+
+	aliases {
+		pinctrl0 = &pinctrl_alive;
+		pinctrl1 = &pinctrl_dispaud;
+		pinctrl2 = &pinctrl_ese;
+		pinctrl3 = &pinctrl_fsys;
+		pinctrl4 = &pinctrl_mif;
+		pinctrl5 = &pinctrl_nfc;
+		pinctrl6 = &pinctrl_top;
+		pinctrl7 = &pinctrl_touch;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+				core1 {
+					cpu = <&cpu1>;
+				};
+				core2 {
+					cpu = <&cpu2>;
+				};
+				core3 {
+					cpu = <&cpu3>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&cpu4>;
+				};
+				core1 {
+					cpu = <&cpu5>;
+				};
+				core2 {
+					cpu = <&cpu6>;
+				};
+				core3 {
+					cpu = <&cpu7>;
+				};
+			};
+		};
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0>;
+			enable-method = "psci";
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x1>;
+			enable-method = "psci";
+		};
+
+		cpu2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x2>;
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x3>;
+			enable-method = "psci";
+		};
+
+		cpu4: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x100>;
+			enable-method = "psci";
+		};
+
+		cpu5: cpu@101 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x101>;
+			enable-method = "psci";
+		};
+
+		cpu6: cpu@102 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x102>;
+			enable-method = "psci";
+		};
+
+		cpu7: cpu@103 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x103>;
+			enable-method = "psci";
+		};
+	};
+
+	oscclk: oscclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
+	psci {
+		compatible = "arm,psci";
+		method = "smc";
+		cpu_suspend = <0xc4000001>;
+		cpu_off = <0x84000002>;
+		cpu_on = <0xc4000003>;
+	};
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+		ranges = <0x0 0x0 0x0 0x20000000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		chipid@10100000 {
+			compatible = "samsung,exynos7870-chipid",
+				     "samsung,exynos4210-chipid";
+			reg = <0x10100000 0x100>;
+		};
+
+		cmu_peri: clock-controller@101f0000 {
+			compatible = "samsung,exynos7870-cmu-peri";
+			reg = <0x101f0000 0x1000>;
+			#clock-cells = <1>;
+
+			clock-names = "oscclk", "bus", "spi0", "spi1", "spi2",
+				      "spi3", "spi4", "uart0", "uart1", "uart2";
+			clocks = <&oscclk>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_PERI_BUS>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI0>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI1>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI2>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI3>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI4>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_PERI_UART0>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_PERI_UART1>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_PERI_UART2>;
+		};
+
+		cmu_mif: clock-controller@10460000 {
+			compatible = "samsung,exynos7870-cmu-mif";
+			reg = <0x10460000 0x1000>;
+			#clock-cells = <1>;
+
+			clock-names = "oscclk";
+			clocks = <&oscclk>;
+		};
+
+		pmu_system_controller: system-controller@10480000 {
+			compatible = "samsung,exynos7870-pmu",
+				     "samsung,exynos7-pmu", "syscon";
+			reg = <0x10480000 0x10000>;
+			#clock-cells = <1>;
+
+			clock-names = "clkout8", "clkout9", "clkout10",
+				      "clkout11", "clkout12";
+			clocks = <&oscclk>, <&oscclk>, <&oscclk>, <&oscclk>,
+				 <&oscclk>;
+
+			reboot-mode {
+				compatible = "syscon-reboot-mode";
+				offset = <0x080c>;
+				mode-bootloader = <EXYNOS7870_BOOT_BOOTLOADER>;
+				mode-download = <EXYNOS7870_BOOT_DOWNLOAD>;
+				mode-recovery = <EXYNOS7870_BOOT_RECOVERY>;
+			};
+		};
+
+		gic: interrupt-controller@104e1000 {
+			compatible = "arm,cortex-a15-gic";
+			reg = <0x104e1000 0x1000>,
+			      <0x104e2000 0x1000>,
+			      <0x104e4000 0x2000>,
+			      <0x104e6000 0x2000>;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) |
+						 IRQ_TYPE_LEVEL_HIGH)>;
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <3>;
+		};
+
+		hsi2c0: i2c@10510000 {
+			compatible = "samsung,exynos7870-hsi2c",
+				     "samsung,exynos7-hsi2c";
+			reg = <0x10510000 0x2000>;
+			interrupts = <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&hsi2c0_bus>;
+
+			clock-names = "hsi2c";
+			clocks = <&cmu_mif CLK_GOUT_MIF_HSI2C_IPCLK>;
+
+			status = "disabled";
+		};
+
+		pinctrl_mif: pinctrl@10530000 {
+			compatible = "samsung,exynos7870-pinctrl";
+			reg = <0x10530000 0x1000>;
+			interrupts = <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		gpu: gpu@11400000 {
+			compatible = "samsung,exynos7870-mali", "arm,mali-t830";
+			reg = <0x11400000 0x5000>;
+			interrupt-names = "job", "mmu", "gpu";
+			interrupts = <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>;
+
+			clock-names = "core", "bus";
+			clocks = <&cmu_g3d CLK_GOUT_G3D_CLK>,
+				 <&cmu_g3d CLK_GOUT_G3D_ASYNCS_D0_CLK>;
+
+			status = "disabled";
+		};
+
+		cmu_g3d: clock-controller@11460000 {
+			compatible = "samsung,exynos7870-cmu-g3d";
+			reg = <0x11460000 0x1000>;
+			#clock-cells = <1>;
+
+			clock-names = "oscclk", "switch";
+			clocks = <&oscclk>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_G3D_SWITCH>;
+		};
+
+		cmu_mfcmscl: clock-controller@12cb0000 {
+			compatible = "samsung,exynos7870-cmu-mfcmscl";
+			reg = <0x12cb0000 0x1000>;
+			#clock-cells = <1>;
+
+			clock-names = "oscclk", "mfc", "mscl";
+			clocks = <&oscclk>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_MFCMSCL_MFC>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_MFCMSCL_MSCL>;
+		};
+
+		cmu_fsys: clock-controller@13730000 {
+			compatible = "samsung,exynos7870-cmu-fsys";
+			reg = <0x13730000 0x1000>;
+			#clock-cells = <1>;
+
+			clock-names = "oscclk", "bus", "usb20drd_refclk";
+			clocks = <&oscclk>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_FSYS_BUS>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_FSYS_USB20DRD_REFCLK>;
+		};
+
+		pinctrl_alive: pinctrl@139f0000 {
+			compatible = "samsung,exynos7870-pinctrl";
+			reg = <0x139f0000 0x1000>;
+
+			wakeup-interrupt-controller {
+				compatible = "samsung,exynos7870-wakeup-eint",
+					     "samsung,exynos7-wakeup-eint";
+				interrupt-parent = <&gic>;
+				interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		mmc0: mmc@13540000 {
+			compatible = "samsung,exynos7870-dw-mshc-smu";
+			reg = <0x13540000 0x2000>;
+			interrupts = <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>;
+
+			clock-names = "biu", "ciu";
+			clocks = <&cmu_fsys CLK_GOUT_FSYS_MMC0_ACLK>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_FSYS_MMC0>;
+
+			status = "disabled";
+		};
+
+		mmc1: mmc@13550000 {
+			compatible = "samsung,exynos7870-dw-mshc-smu";
+			reg = <0x13550000 0x2000>;
+			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
+
+			clock-names = "biu", "ciu";
+			clocks = <&cmu_fsys CLK_GOUT_FSYS_MMC1_ACLK>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_FSYS_MMC1>;
+
+			status = "disabled";
+		};
+
+		mmc2: mmc@13560000 {
+			compatible = "samsung,exynos7870-dw-mshc-smu";
+			reg = <0x13560000 0x2000>;
+			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
+
+			clock-names = "biu", "ciu";
+			clocks = <&cmu_fsys CLK_GOUT_FSYS_MMC2_ACLK>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_FSYS_MMC2>;
+
+			status = "disabled";
+		};
+
+		usbdrd_phy: phy@135c0000 {
+			compatible = "samsung,exynos7870-usbdrd-phy";
+			reg = <0x135c0000 0x100>;
+			#phy-cells = <1>;
+
+			clock-names = "phy", "ref";
+			clocks = <&cmu_fsys CLK_GOUT_FSYS_MUX_USB20DRD_PHYCLOCK_USER>,
+				 <&cmu_fsys CLK_GOUT_FSYS_MUX_USB_PLL>;
+
+			samsung,pmu-syscon = <&pmu_system_controller>;
+		};
+
+		usbdrd: usb@13600000 {
+			compatible = "samsung,exynos7870-dwusb3";
+			ranges = <0x0 0x13600000 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			clock-names = "bus_early", "ctrl", "ref";
+			clocks = <&cmu_fsys CLK_GOUT_FSYS_USB20DRD_ACLK_HSDRD>,
+				 <&cmu_fsys CLK_GOUT_FSYS_USB20DRD_HCLK_USB20_CTRL>,
+				 <&cmu_fsys CLK_GOUT_FSYS_USB20DRD_HSDRD_REF_CLK>;
+
+			status = "disabled";
+
+			usb@0 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0x10000>;
+				interrupts = <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH>;
+
+				phy-names = "usb2-phy";
+				phys = <&usbdrd_phy 0>;
+
+				usb-role-switch;
+			};
+		};
+
+		pinctrl_fsys: pinctrl@13750000 {
+			compatible = "samsung,exynos7870-pinctrl";
+			reg = <0x13750000 0x1000>;
+			interrupts = <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		serial0: serial@13800000 {
+			compatible = "samsung,exynos7870-uart",
+				     "samsung,exynos8895-uart";
+			reg = <0x13800000 0x100>;
+			interrupts = <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart0_bus>;
+
+			clock-names = "uart", "clk_uart_baud0";
+			clocks = <&cmu_peri CLK_GOUT_PERI_UART0_PCLK>,
+				 <&cmu_peri CLK_GOUT_PERI_UART0_EXT_UCLK>;
+
+			samsung,uart-fifosize = <16>;
+
+			status = "disabled";
+		};
+
+		serial1: serial@13810000 {
+			compatible = "samsung,exynos7870-uart",
+				     "samsung,exynos8895-uart";
+			reg = <0x13810000 0x100>;
+			interrupts = <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart1_bus>;
+
+			clock-names = "uart", "clk_uart_baud0";
+			clocks = <&cmu_peri CLK_GOUT_PERI_UART1_PCLK>,
+				 <&cmu_peri CLK_GOUT_PERI_UART1_EXT_UCLK>;
+
+			samsung,uart-fifosize = <256>;
+
+			status = "disabled";
+		};
+
+		serial2: serial@13820000 {
+			compatible = "samsung,exynos7870-uart",
+				     "samsung,exynos8895-uart";
+			reg = <0x13820000 0x100>;
+			interrupts = <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart2_bus>;
+
+			clock-names = "uart", "clk_uart_baud0";
+			clocks = <&cmu_peri CLK_GOUT_PERI_UART2_PCLK>,
+				 <&cmu_peri CLK_GOUT_PERI_UART2_EXT_UCLK>;
+
+			samsung,uart-fifosize = <256>;
+
+			status = "disabled";
+		};
+
+
+		i2c0: i2c@13830000 {
+			compatible = "samsung,exynos7870-i2c",
+				     "samsung,s3c2440-i2c";
+			reg = <0x13830000 0x100>;
+			interrupts = <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c0_bus>;
+
+			clock-names = "i2c";
+			clocks = <&cmu_peri CLK_GOUT_PERI_I2C0_PCLK>;
+
+			status = "disabled";
+		};
+
+		i2c1: i2c@13840000 {
+			compatible = "samsung,exynos7870-i2c",
+				     "samsung,s3c2440-i2c";
+			reg = <0x13840000 0x100>;
+			interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c1_bus>;
+
+			clock-names = "i2c";
+			clocks = <&cmu_peri CLK_GOUT_PERI_I2C1_PCLK>;
+
+			status = "disabled";
+		};
+
+		i2c2: i2c@13850000 {
+			compatible = "samsung,exynos7870-i2c",
+				     "samsung,s3c2440-i2c";
+			reg = <0x13850000 0x100>;
+			interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c2_bus>;
+
+			clock-names = "i2c";
+			clocks = <&cmu_peri CLK_GOUT_PERI_I2C2_PCLK>;
+
+			status = "disabled";
+		};
+
+		i2c3: i2c@13860000 {
+			compatible = "samsung,exynos7870-i2c",
+				     "samsung,s3c2440-i2c";
+			reg = <0x13860000 0x100>;
+			interrupts = <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c3_bus>;
+
+			clock-names = "i2c";
+			clocks = <&cmu_peri CLK_GOUT_PERI_I2C3_PCLK>;
+
+			status = "disabled";
+		};
+
+		i2c4: i2c@13870000 {
+			compatible = "samsung,exynos7870-i2c",
+				     "samsung,s3c2440-i2c";
+			reg = <0x13870000 0x100>;
+			interrupts = <GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c4_bus>;
+
+			clock-names = "i2c";
+			clocks = <&cmu_peri CLK_GOUT_PERI_I2C4_PCLK>;
+
+			status = "disabled";
+		};
+
+		i2c5: i2c@13880000 {
+			compatible = "samsung,exynos7870-i2c",
+				     "samsung,s3c2440-i2c";
+			reg = <0x13880000 0x100>;
+			interrupts = <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c5_bus>;
+
+			clock-names = "i2c";
+			clocks = <&cmu_peri CLK_GOUT_PERI_I2C5_PCLK>;
+
+			status = "disabled";
+		};
+
+		i2c6: i2c@13890000 {
+			compatible = "samsung,exynos7870-i2c",
+				     "samsung,s3c2440-i2c";
+			reg = <0x13890000 0x100>;
+			interrupts = <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c6_bus>;
+
+			clock-names = "i2c";
+			clocks = <&cmu_peri CLK_GOUT_PERI_I2C6_PCLK>;
+
+			status = "disabled";
+		};
+
+		hsi2c1: i2c@138a0000 {
+			compatible = "samsung,exynos7870-hsi2c",
+				     "samsung,exynos7-hsi2c";
+			reg = <0x138a0000 0x1000>;
+			interrupts = <GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&hsi2c1_bus>;
+
+			clock-names = "hsi2c";
+			clocks = <&cmu_peri CLK_GOUT_PERI_HSI2C1_IPCLK>;
+
+			status = "disabled";
+		};
+
+		hsi2c2: i2c@138b0000 {
+			compatible = "samsung,exynos7870-hsi2c",
+				     "samsung,exynos7-hsi2c";
+			reg = <0x138b0000 0x1000>;
+			interrupts = <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&hsi2c2_bus>;
+
+			clock-names = "hsi2c";
+			clocks = <&cmu_peri CLK_GOUT_PERI_HSI2C2_IPCLK>;
+
+			status = "disabled";
+		};
+
+		hsi2c3: i2c@138c0000 {
+			compatible = "samsung,exynos7870-hsi2c",
+				     "samsung,exynos7-hsi2c";
+			reg = <0x138c0000 0x1000>;
+			interrupts = <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&hsi2c3_bus>;
+
+			clock-names = "hsi2c";
+			clocks = <&cmu_peri CLK_GOUT_PERI_HSI2C3_IPCLK>;
+
+			status = "disabled";
+		};
+
+		i2c7: i2c@138d0000 {
+			compatible = "samsung,exynos7870-i2c",
+				     "samsung,s3c2440-i2c";
+			reg = <0x138d0000 0x100>;
+			interrupts = <GIC_SPI 453 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c7_bus>;
+
+			clock-names = "i2c";
+			clocks = <&cmu_peri CLK_GOUT_PERI_I2C7_PCLK>;
+
+			status = "disabled";
+		};
+
+		i2c8: i2c@138e0000 {
+			compatible = "samsung,exynos7870-i2c",
+				     "samsung,s3c2440-i2c";
+			reg = <0x138e0000 0x100>;
+			interrupts = <GIC_SPI 454 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c8_bus>;
+
+			clock-names = "i2c";
+			clocks = <&cmu_peri CLK_GOUT_PERI_I2C8_PCLK>;
+
+			status = "disabled";
+		};
+
+		hsi2c4: i2c@138f0000 {
+			compatible = "samsung,exynos7870-hsi2c",
+				     "samsung,exynos7-hsi2c";
+			reg = <0x138f0000 0x1000>;
+			interrupts = <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&hsi2c4_bus>;
+
+			clock-names = "hsi2c";
+			clocks = <&cmu_peri CLK_GOUT_PERI_HSI2C4_IPCLK>;
+
+			status = "disabled";
+		};
+
+		hsi2c5: i2c@13950000 {
+			compatible = "samsung,exynos7870-hsi2c",
+				     "samsung,exynos7-hsi2c";
+			reg = <0x13950000 0x1000>;
+			interrupts = <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&hsi2c5_bus>;
+
+			clock-names = "hsi2c";
+			clocks = <&cmu_peri CLK_GOUT_PERI_HSI2C5_IPCLK>;
+
+			status = "disabled";
+		};
+
+		hsi2c6: i2c@13960000 {
+			compatible = "samsung,exynos7870-hsi2c",
+				     "samsung,exynos7-hsi2c";
+			reg = <0x13960000 0x1000>;
+			interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&hsi2c6_bus>;
+
+			clock-names = "hsi2c";
+			clocks = <&cmu_peri CLK_GOUT_PERI_HSI2C6_IPCLK>;
+
+			status = "disabled";
+		};
+
+		pinctrl_top: pinctrl@139b0000 {
+			compatible = "samsung,exynos7870-pinctrl";
+			reg = <0x139b0000 0x1000>;
+			interrupts = <GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_nfc: pinctrl@139c0000 {
+			compatible = "samsung,exynos7870-pinctrl";
+			reg = <0x139c0000 0x1000>;
+			interrupts = <GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_touch: pinctrl@139d0000 {
+			compatible = "samsung,exynos7870-pinctrl";
+			reg = <0x139d0000 0x1000>;
+			interrupts = <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_ese: pinctrl@139e0000 {
+			compatible = "samsung,exynos7870-pinctrl";
+			reg = <0x139e0000 0x1000>;
+			interrupts = <GIC_SPI 441 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		cmu_isp: clock-controller@144d0000 {
+			compatible = "samsung,exynos7870-cmu-isp";
+			reg = <0x144d0000 0x1000>;
+			#clock-cells = <1>;
+
+			clock-names = "oscclk", "cam", "isp", "vra";
+			clocks = <&oscclk>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_ISP_CAM>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_ISP_ISP>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_ISP_VRA>;
+		};
+
+		pinctrl_dispaud: pinctrl@148c0000 {
+			compatible = "samsung,exynos7870-pinctrl";
+			reg = <0x148c0000 0x1000>;
+			interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		cmu_dispaud: clock-controller@148d0000 {
+			compatible = "samsung,exynos7870-cmu-dispaud";
+			reg = <0x148d0000 0x1000>;
+			#clock-cells = <1>;
+
+			clock-names = "oscclk", "bus", "decon_eclk", "decon_vclk";
+			clocks = <&oscclk>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_DISPAUD_BUS>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_DISPAUD_DECON_ECLK>,
+				 <&cmu_mif CLK_GOUT_MIF_CMU_DISPAUD_DECON_VCLK>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+
+		/*
+		 * Non-updatable, broken stock Samsung bootloader does not
+		 * configure CNTFRQ_EL0
+		 */
+		clock-frequency = <26000000>;
+	};
+};
+
+#include "exynos7870-pinctrl.dtsi"
+#include "arm/samsung/exynos-syscon-restart.dtsi"

-- 
2.48.1


