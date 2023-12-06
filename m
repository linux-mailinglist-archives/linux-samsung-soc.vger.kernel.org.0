Return-Path: <linux-samsung-soc+bounces-441-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF93807B40
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  6 Dec 2023 23:16:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F29CB1F21856
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  6 Dec 2023 22:16:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B711563AF;
	Wed,  6 Dec 2023 22:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="iSkBdKep"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from aposti.net (aposti.net [89.234.176.197])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17B8E10C0;
	Wed,  6 Dec 2023 14:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1701900967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J7Gat5xEw2YkABlBCPURNwKi3WZsiT+3bFDUKj6PsyA=;
	b=iSkBdKepSayqda5WA4rmrRSNcXfR8Toke+qdFKqwV62t8Go/PtqoAp+8OyDTKnBYR7XpzQ
	5eV3kNYrB5Aom1TNE4mz/Ss4He4KhcBV9qyTNAUb2wdVT55LNCp1KruxKW7Q3LWuQRcWZ/
	YIg/OQYmGUU3xcz+9aOj9L5woebj0n4=
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
Subject: [PATCH 3/3] ARM: dts: samsung: exynos4210-i9100: Add accelerometer node
Date: Wed,  6 Dec 2023 23:15:56 +0100
Message-ID: <20231206221556.15348-4-paul@crapouillou.net>
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

Add a Device Tree node for the ST Microelectronics "K3D" accelerometer
chip found in the Galaxy S2.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/arm/boot/dts/samsung/exynos4210-i9100.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
index f03b03dbe9f2..7e57fe033e2b 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
@@ -421,6 +421,23 @@ touchscreen@4a {
 	};
 };
 
+&i2c_1 {
+	status = "okay";
+
+	samsung,i2c-sda-delay = <100>;
+	samsung,i2c-slave-addr = <0x10>;
+	samsung,i2c-max-bus-freq = <100000>;
+
+	lis3dh: accelerometer@19 {
+		compatible = "st,lis3dh-accel";
+		reg = <0x19>;
+
+		mount-matrix = "0", "-1", "0",
+			       "1", "0", "0",
+			       "0", "0", "1";
+	};
+};
+
 &i2c_5 {
 	status = "okay";
 
-- 
2.42.0


