Return-Path: <linux-samsung-soc+bounces-440-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B0A807B3C
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  6 Dec 2023 23:16:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB92AB20F47
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  6 Dec 2023 22:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D06D2563AB;
	Wed,  6 Dec 2023 22:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="G/N+Q7u5"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from aposti.net (aposti.net [89.234.176.197])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A44710CC;
	Wed,  6 Dec 2023 14:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1701900966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UUceoDo9Bg6SpGiZe2ZgCOMicnEPcUc9b/fwjUuivoY=;
	b=G/N+Q7u5a8AnNOuKK9v7ylF6N5PxskW1qBd6jHmgzsttUjRZ8Gq/NRnlyVX9Z170BM6CaI
	4c7xiMHZGdQcU2G23B1jPnkp8FxaH6Ce9enhdgbJjBy3pe374kuHp+ZnTfReFnBEHdetMp
	Cu0cJGd3vgTKER5bhQRTbOU3OqirSS4=
From: Paul Cercueil <paul@crapouillou.net>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/3] ARM: dts: samsung: exynos4210-i9100: Add node for touch keys
Date: Wed,  6 Dec 2023 23:15:55 +0100
Message-ID: <20231206221556.15348-3-paul@crapouillou.net>
In-Reply-To: <20231206221556.15348-1-paul@crapouillou.net>
References: <20231206221556.15348-1-paul@crapouillou.net>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes

Add a Device Tree node to support the LED-backed "menu" and "back" keys.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 .../arm/boot/dts/samsung/exynos4210-i9100.dts | 23 ++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
index a076a1dfe41f..f03b03dbe9f2 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
@@ -184,6 +184,28 @@ s5k5bafx_ep: endpoint {
 		};
 	};
 
+	i2c-gpio-2 {
+		compatible = "i2c-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sda-gpios = <&gpk1 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&gpk1 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		i2c-gpio,delay-us = <2>;
+
+		touchscreen@20 {
+			compatible = "cypress,aries-touchkey";
+			reg = <0x20>;
+
+			interrupt-parent = <&gpl0>;
+			interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
+
+			vdd-supply = <&vtouchled_reg>;
+			vcc-supply = <&vtouch_reg>;
+			linux,keycodes = <KEY_MENU>, <KEY_BACK>;
+		};
+	};
+
 	spi-3 {
 		compatible = "spi-gpio";
 		#address-cells = <1>;
@@ -513,7 +535,6 @@ vtouch_reg: LDO11 {
 				regulator-name = "TOUCH_2.8V";
 				regulator-min-microvolt = <2800000>;
 				regulator-max-microvolt = <2800000>;
-				regulator-always-on;
 			};
 
 			vpll_reg: LDO10 {
-- 
2.42.0


