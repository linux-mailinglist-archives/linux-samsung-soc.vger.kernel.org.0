Return-Path: <linux-samsung-soc+bounces-6632-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF86CA29CA8
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  5 Feb 2025 23:26:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E7AC167138
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  5 Feb 2025 22:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93ED0221D88;
	Wed,  5 Feb 2025 22:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TzF8hN4L"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47C92206AD;
	Wed,  5 Feb 2025 22:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738794344; cv=none; b=kIgsSEI35kTUQaXZja74uevvnFVKAxBZ94JqxIUFEcPnvdn0Fwbl9CH5aGPIqNeAjLipavcI0nfwM+p68GS5Ik0FdYCF/dAMfokgy2aJ1H1Z0wm2pRO4Sikw1ISJ2Jyv1cOYOHVZapgdlbnl6i7cEIvHFXIORXE8xlBxDS24y9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738794344; c=relaxed/simple;
	bh=YSMbjg8Jm/wgMYmLULZZ7MvqsPx11paoRAFYANZAeBU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cP+8b7bxsqmp5liCEZi1yrwnjltJO5WV9QbdiCLK4CRYyDCMs4BrnRH87vOFXPfTiVA5Azu7ZNUekJQ3+8/xdhrwZiAf5D/FR51BC0NB756mD71SD91lJMmpxAcnxVOmHdOsGagRRHhQmyEO3hsEJCpGVqNGbgS0/oKa5OC0caQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TzF8hN4L; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-85c436db302so151762241.0;
        Wed, 05 Feb 2025 14:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738794340; x=1739399140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f5vxVshxL+QJcnnvml+ele3UhXfF2Cm1K2Nc5CJEARA=;
        b=TzF8hN4Loh40Z0KurktvMO4lhPfcMqHhB3OpMzcp2Y6hsmFqKvQIoyBXl9tp07vpUv
         m4VCBBUQYU09xQZMlDxpRIaFRHTcQvMSk9VbCawgJnw0uBGEVQrXuWmivIR05zXy6lcP
         pUIAhHIB7mEgX3QArsRsBqLKRVe+v0WU28wmyMl9l6akhNGR/GIXsM9oF185XahbsqOy
         kPqOrJRE/z4d1vAVSg9IA710a3jaGORll5qyNAjeD3nQgu0Wqm5PxpmEFpPjOe05Nrxs
         ijNTQfbVTxRXU+bWx/EzNLEqGTwomez+VcEnBljfNFBUAZ81HBOHZf8lOzxmvBd8xkIe
         GIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738794340; x=1739399140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f5vxVshxL+QJcnnvml+ele3UhXfF2Cm1K2Nc5CJEARA=;
        b=poWId9s4nF+778/xcFAKf6du3/GFxctPNUw3r4hAnF2ynd1UShStpoVacAdMV0hDpr
         VkDGqyhkTln63Hcod90zbLZX3PAzKj2X5M32cbFgR7OPnDZCr1cwUb2HNr9QvozFW8U8
         izdRyh2oyb5EhfxsC+OBpWUzj1Ek00T+Otf3zZH/GCHIumixpnfX71OP+CKRBspZuw3K
         0ERx1vncfQiF5zvAAEy1mxzdb4A516sTUVij3Qa2o3jXjywWyBJ8PXvRsYXO8dVWHMIQ
         t5XgIFFO+8s6zByE2dWAwFCovFoInA2hZbRld4huZlSTb6AxPjpx8H9hjieroINpFf4y
         2Vzg==
X-Forwarded-Encrypted: i=1; AJvYcCVGnoL3tztTfqrdYXW8oy2y3w6V+ktpdZzu8TjlQAdm/YEcKdbxj0+O/tJGYeALgU7nDYJC8jAQFVieLGWmVMPOTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiaOw9o1x340iDrz8TLluNxxWP4O70OXhmd6IJHATUFcbOeswa
	RdK7j7urKJRLHQ8ONtr7eNHLyt5DPl+jHRj1UphITNAUVdncxPAG
X-Gm-Gg: ASbGncslsuGdtXYoRHzl6Bsdq5ywNi+yiT130BnvSexRH6DE1Q4fiKcueir6GQNYpg5
	TqgLNU1A/ccpB6OGIlb/37KdLYSJtTtCwKGFnTA3YtDdavYHwvmYC2IIuN3q7rZxEnu8kG/dZbm
	yVURcYYt2oxdX141hNvtXx+BUxYdwLi1VAlIJ1b4RCQm9SctIBLOXOc4MqMWCrBKDh7oxJr4T3y
	d9fHTmMNc2jSfTOQwpboNG/9CkleDWRgLqU9rxKX42hmKSGh5pX8Z/yPWZP6kusoEXxfCXJusCj
	9FI/X19KXSZxufxJ8O8yX6Yfkxq1IN2qrnuePWKJRk1wIliCu0VhzxtRCp11m25q1X2IEOX8PRu
	BwA==
X-Google-Smtp-Source: AGHT+IFtH9HOARxnQefzm3RIupJ46GdZJabCLs7VgyFJPLtIb0Q+JDpiUpXQXiwr78wowR5ccujb5w==
X-Received: by 2002:a67:f847:0:b0:4b6:8bd1:6b5d with SMTP id ada2fe7eead31-4ba71f5968bmr657088137.1.1738794339372;
        Wed, 05 Feb 2025 14:25:39 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866941edbefsm2475354241.28.2025.02.05.14.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 14:25:38 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: krzk@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v1 9/9] arm64: dts: exynos990: define all PERIC USI nodes
Date: Wed,  5 Feb 2025 22:22:23 +0000
Message-Id: <20250205222223.613-10-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205222223.613-1-wachiturroxd150@gmail.com>
References: <20250205222223.613-1-wachiturroxd150@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Universal Serial Interface (USI) supports three types of serial interface
such as Universal Asynchronous Receiver and Transmitter (UART), Serial
Peripheral Interface (SPI), and Inter-Integrated Circuit (I2C).
Each protocols can be working independently and configured as one of
those using external configuration inputs.

Exynos990 SoC defines 18 USI nodes in PERIC0/1 blocks.
Nodes have different depths from 64-256 bytes.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos990.dtsi | 1711 +++++++++++++++++++++
 1 file changed, 1711 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
index 9d017dbed..adecad582 100644
--- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
@@ -201,12 +201,1723 @@ pinctrl_peric0: pinctrl@10430000 {
 			interrupts = <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_peric0: clock-controller@10400000 {
+			compatible = "samsung,exynos990-cmu-peric0";
+			reg = <0x10400000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC0_BUS>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC0_IP>;
+			clock-names = "oscclk", "bus", "ip";
+		};
+
+		sysreg_peric0: syscon@10420000 {
+			compatible = "samsung,exynos990-peric0-sysreg", "syscon";
+			reg = <0x10420000 0x10000>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_SYSREG_PCLK>;
+		};
+
+		usi_uart: usi@105400c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x105400c0 0x20>;
+			samsung,sysreg = <&sysreg_peric0 0x1000>;
+			samsung,mode = <USI_V2_UART>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_4>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_4>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			serial_0: serial@10540000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x10540000 0xc0>;
+				interrupts = <GIC_SPI 391 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&uart0_bus>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_4>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_4>;
+				clock-names = "uart", "clk_uart_baud0";
+				samsung,uart-fifosize = <256>;
+				status = "disabled";
+			};
+		};
+
+		usi0: usi@105500c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x105500c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_5>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_5>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x1004>;
+			status = "disabled";
+
+			hsi2c_0: i2c@10550000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10550000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_5>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_5>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c0_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			spi_0: spi@10550000 {
+				compatible = "samsung,exynos990-spi";
+				reg = <0x10550000 0x30>;
+				interrupts = <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi0_bus>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_5>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_5>;
+				clock-names = "spi", "spi_busclk0";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			serial_2: serial@10550000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x10550000 0xc0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_5>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_5>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart2_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_0: usi@105600c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x105600c0 0x20>;
+			samsung,sysreg = <&sysreg_peric0 0x1008>;
+			samsung,mode = <USI_V2_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_6>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_6>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_1: i2c@10560000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10560000 0xc0>;
+				interrupts = <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c1_bus>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_6>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_6>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi1: usi@105700c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x105700c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_7>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_7>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x100c>;
+			status = "disabled";
+
+			hsi2c_2: i2c@10570000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10570000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_7>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_7>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c2_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			spi_1: spi@10570000 {
+				compatible = "samsung,exynos990-spi";
+				reg = <0x10570000 0x30>;
+				interrupts = <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi1_bus>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_7>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_7>;
+				clock-names = "spi", "spi_busclk0";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			serial_3: serial@10570000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x10570000 0xc0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_7>,
+					<&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_7>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart3_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_1: usi@105800c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x105800c0 0x20>;
+			samsung,sysreg = <&sysreg_peric0 0x1010>;
+			samsung,mode = <USI_V2_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_8>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_8>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_3: i2c@10580000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10580000 0xc0>;
+				interrupts = <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c3_bus>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_8>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_8>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi2: usi@105900c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x105900c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_9>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_9>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x1014>;
+			status = "disabled";
+
+			hsi2c_4: i2c@10590000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10590000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_9>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_9>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c4_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			spi_2: spi@10590000 {
+				compatible = "samsung,exynos990-spi";
+				reg = <0x10590000 0x30>;
+				interrupts = <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi2_bus>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_9>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_9>;
+				clock-names = "spi", "spi_busclk0";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			serial_4: serial@10590000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x10590000 0xc0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_9>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_9>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart4_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_2: usi@105a00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x105a00c0 0x20>;
+			samsung,sysreg = <&sysreg_peric0 0x1018>;
+			samsung,mode = <USI_V2_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_10>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_10>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_5: i2c@105a0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x105a0000 0xc0>;
+				interrupts = <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c5_bus>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_10>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_10>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi3: usi@105b00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x105b00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_11>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_11>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x101c>;
+			status = "disabled";
+
+			hsi2c_6: i2c@105b0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x105b0000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_11>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_11>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c6_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			spi_3: spi@105b0000 {
+				compatible = "samsung,exynos990-spi";
+				reg = <0x105b0000 0x30>;
+				interrupts = <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi3_bus>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_11>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_11>;
+				clock-names = "spi", "spi_busclk0";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			serial_5: serial@105b0000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x105b0000 0xc0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_11>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_11>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart5_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_3: usi@105c00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x105c00c0 0x20>;
+			samsung,sysreg = <&sysreg_peric0 0x1020>;
+			samsung,mode = <USI_V2_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_12>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_12>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_7: i2c@105c0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x105c0000 0xc0>;
+				interrupts = <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c7_bus>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_12>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_12>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi4: usi@105d00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x105d00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_13>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_13>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x1024>;
+			status = "disabled";
+
+			hsi2c_8: i2c@105d0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x105d0000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_13>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_13>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c8_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			spi_4: spi@105d0000 {
+				compatible = "samsung,exynos990-spi";
+				reg = <0x105d0000 0x30>;
+				interrupts = <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi4_bus>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_13>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_13>;
+				clock-names = "spi", "spi_busclk0";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			serial_6: serial@105d0000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x105d0000 0xc0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_13>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_13>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart6_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_4: usi@105e00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x105e00c0 0x20>;
+			samsung,sysreg = <&sysreg_peric0 0x1028>;
+			samsung,mode = <USI_V2_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_14>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_14>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_9: i2c@105e0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x105e0000 0xc0>;
+				interrupts = <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c9_bus>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_14>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_14>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi5: usi@105f00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x105f00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_15>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_15>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x102c>;
+			status = "disabled";
+
+			hsi2c_10: i2c@105f0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x105f0000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_15>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_15>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c10_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			spi_5: spi@105f0000 {
+				compatible = "samsung,exynos990-spi";
+				reg = <0x105f0000 0x30>;
+				interrupts = <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>;
+				dma-names = "tx", "rx";
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi5_bus>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_15>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_15>;
+				clock-names = "spi", "spi_busclk0";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			serial_7: serial@105f0000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x105f0000 0xc0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_15>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_15>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart7_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_5: usi@106000c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x106000c0 0x20>;
+			samsung,sysreg = <&sysreg_peric0 0x1030>;
+			samsung,mode = <USI_V2_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_0>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_0>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_11: i2c@10600000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10600000 0xc0>;
+				interrupts = <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c11_bus>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_0>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_0>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi13: usi@106300c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x106300c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_3>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_3>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x103c>;
+			status = "disabled";
+
+			hsi2c_26: i2c@10630000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10630000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_3>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_3>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 411 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c26_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			spi_13: spi@10630000 {
+				compatible = "samsung,exynos990-spi";
+				reg = <0x10630000 0x30>;
+				interrupts = <GIC_SPI 411 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi13_bus>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_3>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_3>;
+				clock-names = "spi", "spi_busclk0";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			serial_15: serial@10630000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x10630000 0xc0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_3>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_3>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 411 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart15_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_13: usi@106400c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x106400c0 0x20>;
+			samsung,sysreg = <&sysreg_peric0 0x1040>;
+			samsung,mode = <USI_V2_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_4>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_4>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_27: i2c@10640000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10640000 0xc0>;
+				interrupts = <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c27_bus>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_4>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_4>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi14: usi@106500c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x106500c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_5>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_5>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x1044>;
+			status = "disabled";
+
+			hsi2c_28: i2c@10650000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10650000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_5>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_5>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 413 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c28_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			spi_14: spi@10650000 {
+				compatible = "samsung,exynos990-spi";
+				reg = <0x10650000 0x30>;
+				interrupts = <GIC_SPI 413 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi14_bus>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_5>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_5>;
+				clock-names = "spi", "spi_busclk0";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			serial_16: serial@10650000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x10650000 0xc0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_5>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_5>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 413 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart16_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_14: usi@106600c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x106600c0 0x20>;
+			samsung,sysreg = <&sysreg_peric0 0x1048>;
+			samsung,mode = <USI_V2_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_0>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_0>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_29: i2c@10660000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10660000 0xc0>;
+				interrupts = <GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c29_bus>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_6>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_6>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi15: usi@106700c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x106700c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_7>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_7>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x104c>;
+			status = "disabled";
+
+			hsi2c_30: i2c@10670000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10670000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_7>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_7>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c30_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			spi_15: spi@10650000 {
+				compatible = "samsung,exynos990-spi";
+				reg = <0x10670000 0x30>;
+				interrupts = <GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi15_bus>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_7>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_7>;
+				clock-names = "spi", "spi_busclk0";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			serial_17: serial@10670000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x10670000 0xc0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_7>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_7>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart17_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_15: usi@106800c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x106800c0 0x20>;
+			samsung,sysreg = <&sysreg_peric0 0x1050>;
+			samsung,mode = <USI_V2_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_8>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_8>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_31: i2c@10680000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10680000 0xc0>;
+				interrupts = <GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c31_bus>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_8>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_8>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
 		pinctrl_peric1: pinctrl@10730000 {
 			compatible = "samsung,exynos990-pinctrl";
 			reg = <0x10730000 0x1000>;
 			interrupts = <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_peric1: clock-controller@10700000 {
+			compatible = "samsung,exynos990-cmu-peric1";
+			reg = <0x10700000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_BUS>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_IP>;
+			clock-names = "oscclk", "bus", "ip";
+		};
+
+		sysreg_peric1: syscon@10720000 {
+			compatible = "samsung,exynos990-peric1-sysreg", "syscon";
+			reg = <0x10720000 0x10000>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_SYSREG_PCLK>;
+		};
+
+		usi_bt_uart: usi@108400c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x108400c0 0x20>;
+			samsung,sysreg = <&sysreg_peric1 0x1000>;
+			samsung,mode = <USI_V2_UART>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_4>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_4>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			serial_1: serial@10840000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x10840000 0xc0>;
+				interrupts = <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&uart1_bus_single>;
+				pinctrl-1 = <&uart1_bus_rts &uart1_bus_tx_con>;
+				pinctrl-2 = <&uart1_bus_tx_dat>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC0_TOP0_PCLK_4>,
+					 <&cmu_peric1 CLK_GOUT_PERIC0_TOP0_IPCLK_4>;
+				clock-names = "uart", "clk_uart_baud0";
+				samsung,uart-fifosize = <256>;
+				status = "disabled";
+			};
+		};
+
+		usi6: usi@108a00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x108a00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_10>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_10>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x1018>;
+			status = "disabled";
+
+			hsi2c_12: i2c@108a0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x108a0000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_10>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_10>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c12_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			spi_6: spi@108a0000 {
+				compatible = "samsung,exynos990-spi";
+				reg = <0x108a0000 0x30>;
+				interrupts = <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi6_bus>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_10>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_10>;
+				clock-names = "spi", "spi_busclk0";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			serial_8: serial@108a0000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x108a0000 0xc0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_10>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_10>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart8_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_6: usi@108b00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x108b00c0 0x20>;
+			samsung,sysreg = <&sysreg_peric1 0x101c>;
+			samsung,mode = <USI_V2_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_11>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_11>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_13: i2c@108b0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x108b0000 0xc0>;
+				interrupts = <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c13_bus>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_11>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_11>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi7: usi@108c00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x108c00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_12>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_12>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x1020>;
+			status = "disabled";
+
+			hsi2c_14: i2c@108c0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x108c0000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_12>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_12>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c14_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			spi_7: spi@108c0000 {
+				compatible = "samsung,exynos990-spi";
+				reg = <0x108c0000 0x30>;
+				interrupts = <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi7_bus>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_12>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_12>;
+				clock-names = "spi", "spi_busclk0";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			serial_9: serial@108c0000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x108c0000 0xc0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_12>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_12>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart9_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_7: usi@108d00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x108d00c0 0x20>;
+			samsung,sysreg = <&sysreg_peric1 0x1024>;
+			samsung,mode = <USI_V2_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_13>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_13>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_15: i2c@108d0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x108d0000 0xc0>;
+				interrupts = <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c15_bus>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_13>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_13>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi8: usi@108e00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x108e00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_14>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_14>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x1028>;
+			status = "disabled";
+
+			hsi2c_16: i2c@108e0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x108e0000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_14>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_14>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c16_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			spi_8: spi@108e0000 {
+				compatible = "samsung,exynos990-spi";
+				reg = <0x108e0000 0x30>;
+				interrupts = <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi8_bus>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_14>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_14>;
+				clock-names = "spi", "spi_busclk0";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				fifo-depth = <256>
+				status = "disabled";
+			};
+
+			serial_10: serial@108e0000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x108e0000 0xc0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_14>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_14>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart10_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <256>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_8: usi@108f00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x108f00c0 0x20>;
+			samsung,sysreg = <&sysreg_peric1 0x102c>;
+			samsung,mode = <USI_V2_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_15>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_15>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_17: i2c@108f0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x108f0000 0xc0>;
+				interrupts = <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c17_bus>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_15>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_15>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi9: usi@109000c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109000c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_0>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_0>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x1030>;
+			status = "disabled";
+
+			hsi2c_18: i2c@10900000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10900000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_0>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_0>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c18_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			spi_9: spi@10900000 {
+				compatible = "samsung,exynos990-spi";
+				reg = <0x10900000 0x30>;
+				interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi9_bus>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_0>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_0>;
+				clock-names = "spi", "spi_busclk0";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				fifo-depth = <256>
+				status = "disabled";
+			};
+
+			serial_11: serial@10900000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x10900000 0xc0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_0>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_0>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart11_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <256>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_9: usi@109100c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109100c0 0x20>;
+			samsung,sysreg = <&sysreg_peric1 0x1034>;
+			samsung,mode = <USI_V2_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_1>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_1>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_19: i2c@10910000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10910000 0xc0>;
+				interrupts = <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c19_bus>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_1>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_1>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi10: usi@109200c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109200c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_2>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_2>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x1038>;
+			status = "disabled";
+
+			hsi2c_20: i2c@10920000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10920000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_2>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_2>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c20_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			spi_10: spi@10920000 {
+				compatible = "samsung,exynos990-spi";
+				reg = <0x10920000 0x30>;
+				interrupts = <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi10_bus>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_2>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_2>;
+				clock-names = "spi", "spi_busclk0";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				fifo-depth = <256>
+				status = "disabled";
+			};
+
+			serial_12: serial@10920000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x10920000 0xc0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_2>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_2>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart12_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <256>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_10: usi@109300c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109300c0 0x20>;
+			samsung,sysreg = <&sysreg_peric1 0x103c>;
+			samsung,mode = <USI_V2_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_3>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_3>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_21: i2c@10930000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10930000 0xc0>;
+				interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c21_bus>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_3>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_3>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi11: usi@109400c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109400c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_4>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_4>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x1040>;
+			status = "disabled";
+
+			hsi2c_22: i2c@10940000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10940000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_4>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_4>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c22_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			spi_11: spi@10940000 {
+				compatible = "samsung,exynos990-spi";
+				reg = <0x10940000 0x30>;
+				interrupts = <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi11_bus>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_4>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_4>;
+				clock-names = "spi", "spi_busclk0";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			serial_13: serial@10940000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x10940000 0xc0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_4>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_4>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart13_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_11: usi@109500c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109500c0 0x20>;
+			samsung,sysreg = <&sysreg_peric1 0x1044>;
+			samsung,mode = <USI_V2_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_5>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_5>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_23: i2c@10950000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10950000 0xc0>;
+				interrupts = <GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c23_bus>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_5>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_5>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi12: usi@109c00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109c00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_12>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_12>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x2000>;
+			status = "disabled";
+
+			hsi2c_24: i2c@109c0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x109c0000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_12>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_12>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c24_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			spi_12: spi@109c0000 {
+				compatible = "samsung,exynos990-spi";
+				reg = <0x109c0000 0x30>;
+				interrupts = <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi12_bus>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_12>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_12>;
+				clock-names = "spi", "spi_busclk0";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			serial_14: serial@109c0000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x109c0000 0xc0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_12>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_12>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart14_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_12: usi@109d00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109d00c0 0x20>;
+			samsung,sysreg = <&sysreg_peric1 0x2004>;
+			samsung,mode = <USI_V2_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_13>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_13>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_25: i2c@109d0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x109d0000 0xc0>;
+				interrupts = <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c25_bus>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_13>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_13>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi16: usi@109600c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109600c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_6>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_6>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x1048>;
+			status = "disabled";
+
+			hsi2c_32: i2c@10960000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10960000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_6>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_6>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c32_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			spi_16: spi@10960000 {
+				compatible = "samsung,exynos990-spi";
+				reg = <0x10960000 0x30>;
+				interrupts = <GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi16_bus>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_6>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_6>;
+				clock-names = "spi", "spi_busclk0";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			serial_18: serial@10960000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x10960000 0xc0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_6>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_6>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart18_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_16: usi@109700c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109700c0 0x20>;
+			samsung,sysreg = <&sysreg_peric1 0x104c>;
+			samsung,mode = <USI_V2_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_7>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_7>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_33: i2c@10970000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10970000 0xc0>;
+				interrupts = <GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c33_bus>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_7>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_7>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi17: usi@109900c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109900c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_9>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_9>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x1050>;
+			status = "disabled";
+
+			hsi2c_34: i2c@10990000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10990000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_9>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_9>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 437 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c34_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			spi_17: spi@10990000 {
+				compatible = "samsung,exynos990-spi";
+				reg = <0x10990000 0x30>;
+				interrupts = <GIC_SPI 437 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi17_bus>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_9>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_9>;
+				clock-names = "spi", "spi_busclk0";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			serial_19: serial@10990000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x10990000 0xc0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_9>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_9>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 437 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart19_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_17: usi@109a00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109a00c0 0x20>;
+			samsung,sysreg = <&sysreg_peric1 0x1054>;
+			samsung,mode = <USI_V2_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_10>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_10>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_35: i2c@10990000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10990000 0xc0>;
+				interrupts = <GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c35_bus>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_10>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_10>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi18: usi@109e00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109e00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_14>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_14>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x2008>;
+			status = "disabled";
+
+			hsi2c_36: i2c@109e0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x109e0000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_14>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_14>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c36_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			spi_18: spi@109e0000 {
+				compatible = "samsung,exynos990-spi";
+				reg = <0x109e0000 0x30>;
+				interrupts = <GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi18_bus>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_14>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_14>;
+				clock-names = "spi", "spi_busclk0";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			serial_20: serial@109e0000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x109e0000 0xc0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_14>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_14>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart20_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_18: usi@109f00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109f00c0 0x20>;
+			samsung,sysreg = <&sysreg_peric1 0x200c>;
+			samsung,mode = <USI_V2_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_15>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_15>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_37: i2c@109f0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x109f0000 0xc0>;
+				interrupts = <GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c37_bus>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_15>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_15>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
 		cmu_hsi0: clock-controller@10a00000 {
 			compatible = "samsung,exynos990-cmu-hsi0";
 			reg = <0x10a00000 0x8000>;
-- 
2.47.1


