Return-Path: <linux-samsung-soc+bounces-1077-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BE983288D
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 19 Jan 2024 12:13:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 930722882AD
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 19 Jan 2024 11:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C1404E1C7;
	Fri, 19 Jan 2024 11:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bsax9cj5"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D35B4D589
	for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Jan 2024 11:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705662718; cv=none; b=F/LuBAPgWO4iebQnnMseuFFjv1X3GyRCX8lR2/vCfMVqlwgw+bY1E8mF6TLoX6dT0O25IytO/LTxc3RQdEs0V+OG8Op3KBPKHeQ0Rn8zsMWOiJpGmIsyqfFQdqQuNPLKaXjgbKHj3po7tsd0rZV9htvIT0xmCBjj3Q17qkMtiRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705662718; c=relaxed/simple;
	bh=+Z9aKQjWJRg1t8puc2H7wIKhN59qiSCcrvi1W3ZMQJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C0KK0dMtbSBLZCOAcSbusXdmabfDZ54z97q7oHgiTcKjmlq6rRU6OnJlNsg4CftRKff+11Ht3bXLJxrd75P9zaIQib2mUaQssvNkcoTtKS8mzWLq9uDf0CAwRkEgQEPSAhp3LMrP5eLEsWHpPuE3sIyA9Owv2oniBlHyEHACQGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bsax9cj5; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-336c8ab0b20so568400f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Jan 2024 03:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705662714; x=1706267514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDx9IJeu4q4vg7sxnjP3+o90/kYREKpXEiMwOte9XSc=;
        b=Bsax9cj537jCBdindCqwlsLm7YKFMR4zjAMKweP53fOK10AajxYubcGUpIKgfakUsW
         3oE2LMTL8W0w96ZraPq9fw55ZIJFnK99LhUh1yX61yhbNXp/4b70E6rcFIESSLbG2Ezb
         +cz6U2goQ7pP7yC/FpT8/Lij826zogV+RxNX4G7I8XEZgXvFxzvdXnJmrqJAJPUIe1pp
         hqloRsJARVokBXzKv4FEfcwmBfvnFKb2gQJ9hJuYeM24oLN2Ui1ItZfXnJXrwQZHtJqQ
         sYOStcVQ6+tBVqF+RegH+HcgpqyMtug49BcXSfJPFC3TgGvpIBGdNUIYu/Icgg/UHE0J
         SNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705662714; x=1706267514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tDx9IJeu4q4vg7sxnjP3+o90/kYREKpXEiMwOte9XSc=;
        b=vTfHheGB1gCW+0S8cCtroZdOH4Mun86kPj+vtyuktLMCfWvF47EVBcg+MJyLg3Rd8E
         UHWDjoRikjZqU6MiIRNrKtr6meRp1iwrhjVcLQao+0PZM+ZKkWeIeem1F6wsIPbkaqZM
         7l7xMd7MFaVpdY0yWCZJNjLs3EFJv1UvfCh0AWaXihrEuK15bLaIMbXa9bJjynWtKGE7
         fV/Q15QI3JHDq/ERT/vBZPFxoTAdK3ifg17KRS/TormXwLkKk0elKYNx+5GKXPMd2xpb
         N42I56u/MWH04xEvb31isOrp/C8BgQYL0ZJ1gm5AovZVd3Qr7CYTLaiobThDMEWmwhdb
         kc3w==
X-Gm-Message-State: AOJu0Yz/KZcHJseJiLENmvUwOy0zmIG+BUWESpdA4/J7JA1KElHfjbT/
	LXSE1ySh4a5Hy/1yqwQ3pvIJv3WPdrkAALFjCHsHSBWnoakB2gupWzSaqHiijIQ=
X-Google-Smtp-Source: AGHT+IFa9EXNILXQkEvGWQUIOOA63etKevXkmw5q28slYY6iHwHtb/9wtgcuyorN42OKWTa9d7vFYg==
X-Received: by 2002:a05:6000:1010:b0:337:c642:7acf with SMTP id a16-20020a056000101000b00337c6427acfmr1422410wrx.108.1705662714705;
        Fri, 19 Jan 2024 03:11:54 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id o10-20020a5d62ca000000b00337d4ce6ab4sm3341868wrv.20.2024.01.19.03.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 03:11:53 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peter.griffin@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: andi.shyti@kernel.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	willmcvicker@google.com,
	kernel-team@android.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v4 6/8] arm64: dts: exynos: gs101: update USI UART to use peric0 clocks
Date: Fri, 19 Jan 2024 11:11:30 +0000
Message-ID: <20240119111132.1290455-7-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240119111132.1290455-1-tudor.ambarus@linaro.org>
References: <20240119111132.1290455-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Get rid of the dummy clock and start using the cmu_peric0 clocks
for the usi_uart and serial_0 nodes.

Tested the serial at 115200, 1000000 and 3000000 baudrates,
everthing went fine.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 2d1344a202a9..6aa25cc4676e 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -180,14 +180,6 @@ HERA_CPU_SLEEP: cpu-hera-sleep {
 		};
 	};
 
-	/* TODO replace with CCF clock */
-	dummy_clk: clock-3 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <12345>;
-		clock-output-names = "pclk";
-	};
-
 	/* ect node is required to be present by bootloader */
 	ect {
 	};
@@ -367,7 +359,8 @@ usi_uart: usi@10a000c0 {
 			ranges;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			clocks = <&dummy_clk>, <&dummy_clk>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_CLK_PERIC0_USI0_UART_CLK>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_0>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x1020>;
 			samsung,mode = <USI_V2_UART>;
@@ -378,7 +371,8 @@ serial_0: serial@10a00000 {
 				reg = <0x10a00000 0xc0>;
 				interrupts = <GIC_SPI 634
 					      IRQ_TYPE_LEVEL_HIGH 0>;
-				clocks = <&dummy_clk 0>, <&dummy_clk 0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_CLK_PERIC0_USI0_UART_CLK>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_0>;
 				clock-names = "uart", "clk_uart_baud0";
 				samsung,uart-fifosize = <256>;
 				status = "disabled";
-- 
2.43.0.429.g432eaa2c6b-goog


