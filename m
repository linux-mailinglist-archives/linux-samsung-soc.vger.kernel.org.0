Return-Path: <linux-samsung-soc+bounces-2831-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F27B98AF863
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 23 Apr 2024 22:52:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A87E8281EE8
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 23 Apr 2024 20:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C678C143860;
	Tue, 23 Apr 2024 20:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rV3tZUDe"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D47145321
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2024 20:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713905426; cv=none; b=OeXJ1wQhJyY56cBp6845eUdyGGAXSYXlYFD6p5Z9QqFB6zcARWOSduyiZkIu/ANXjodTt28vbmM0QzY9mdWaGfSjlAau83+jLGp+xZVgScg4egBVcJOkrJodgOcXpnLOJHLf4qVExxBBQ0H6DPU7DE6Mpjcdqh1dRqQQ5waFxDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713905426; c=relaxed/simple;
	bh=+RaAFBfD8JBvVGyPOAJvYEVcisOAJ3VwqXUMi6+CcIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T0hnaTVWEhZWtcnbt6HcSulp34hCc661FZfLFWEfYY+sPxYYsxqI6i6DvhMbzb8X/36oh7rRDwyrpoz6f3EaE+Cvd2pBR3CEPmNaCGg9omU7GekQ+/CJSHwbQDDWGVFF0zQiIWgwq5U66147JWVmqlD4+wZ4k+QXkCCP+lL0o8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rV3tZUDe; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4155819f710so51005185e9.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2024 13:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713905423; x=1714510223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZaHsEnykzbkaLyrdeRNzCHKySUXlEaH/7u1GIxPjlw=;
        b=rV3tZUDeRsZQLxa6/c4JJAy85SoaJt6O+z6M3tnVewuBEOPmTGi/PkmRdTiC+LGvgD
         3TkbT4fTxUbHlZm3TFYrcJEDeE4QWyJhA6TPsP6mhsf2MhO2D645RRKk2n03PLMVKypR
         RLd3fJPRIozLsWZBvchBqLykOySUfvtTihH+uimEJp4kpqOD7+246HEOMqQj+GXB16XQ
         auE5cNpD4MnGtepVqapdb3k0Uzvg90F0sayoDxWVB0xTWhQqoe1BtVggO9yjZj5Ll72S
         0t+TA//6WJMeCvVZHFXc8xcKUlxOyM0JgTKGmyfSusAYuh2RGyzRZFJyWdIUR8RRNxGU
         YjjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713905423; x=1714510223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AZaHsEnykzbkaLyrdeRNzCHKySUXlEaH/7u1GIxPjlw=;
        b=suUCeDdbqcNteaE5EgYcLa+iCSNtzMgjOngnqowmO2WI8VUJtfJNquKs2D8ZilFdvJ
         rCVwPHT5vWGD8HCasqcNJBiFTYRofqwMsLp+Sp0mu2DuP37/5vwXH9KlblwfmftqjYks
         5TR/ejx+ehlQgmbzb2ZWzvBlwE/+L4fbSKvRlPf0Yc+j9OF8/L3HTswqxVaMv/h2wLJt
         mYBh6XILVgzdsiPd6ayWDB23+3Uay83A4vZ1zHOvx+ZDj8Qa8Ly6BWXYyoCM9cpgOsym
         4GX04nqurMTOFxpWBP1jm5ivmCieNxsDYit2rYOLWwaNY9dNR0wuy9+u4SeWOUVxEJhM
         JPpA==
X-Forwarded-Encrypted: i=1; AJvYcCVx9ThZeRfk0DXfACGmP0lKG1BepKgvIQGH9T4apAG0MSIagsYoKzUrMOXxuJOZjlSeoCfCy9ggNbMDaqIjllTy4TJT8YuZlPsajQJTHI27xYM=
X-Gm-Message-State: AOJu0Yzn3DpeCoM7skNYLAO94HrhjrJVv1ED5eSv5RZX9YdPcF9tTKYO
	V18zXkNgGYq0R3eUvJ2aRviRXXG9s25dOOkrUTzyBuunbsJeELFjkUF3CuQ7nxk=
X-Google-Smtp-Source: AGHT+IFV4foP1YjTUjHVZLvlZh3ThdkL/KFKrbzjBs05jhoRtVosblg5RiTrD+m1RmUQ7V2qNroKQg==
X-Received: by 2002:a05:600c:4f49:b0:41a:ade4:4168 with SMTP id m9-20020a05600c4f4900b0041aade44168mr302091wmq.9.1713905423609;
        Tue, 23 Apr 2024 13:50:23 -0700 (PDT)
Received: from gpeter-l.lan ([2a0d:3344:2e8:8510:4269:2542:5a09:9ca1])
        by smtp.gmail.com with ESMTPSA id bg5-20020a05600c3c8500b00419f419236fsm13065443wmb.41.2024.04.23.13.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 13:50:23 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org,
	alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	James.Bottomley@HansenPartnership.com,
	ebiggers@kernel.org
Cc: linux-scsi@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 06/14] arm64: dts: exynos: gs101: Add ufs, ufs-phy and ufs regulator dt nodes
Date: Tue, 23 Apr 2024 21:49:58 +0100
Message-ID: <20240423205006.1785138-7-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
In-Reply-To: <20240423205006.1785138-1-peter.griffin@linaro.org>
References: <20240423205006.1785138-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the ufs controller, ufs phy and ufs regulator in device tree.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../boot/dts/exynos/google/gs101-oriole.dts   | 18 ++++++++++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi  | 36 +++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index 6be15e990b65..fb32f6ce2a4d 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -53,6 +53,15 @@ button-power {
 			wakeup-source;
 		};
 	};
+
+	/* TODO: Remove this once S2MPG11 slave PMIC is implemented  */
+	ufs_0_fixed_vcc_reg: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "ufs-vcc";
+		gpio = <&gpp0 1 GPIO_ACTIVE_HIGH>;
+		regulator-boot-on;
+		enable-active-high;
+	};
 };
 
 &ext_24_5m {
@@ -106,6 +115,15 @@ &serial_0 {
 	status = "okay";
 };
 
+&ufs_0 {
+	status = "okay";
+	vcc-supply = <&ufs_0_fixed_vcc_reg>;
+};
+
+&ufs_0_phy {
+	status = "okay";
+};
+
 &usi_uart {
 	samsung,clkreq-on; /* needed for UART mode */
 	status = "okay";
diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 09044deede63..baf630b13154 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1277,6 +1277,42 @@ pinctrl_hsi2: pinctrl@14440000 {
 			interrupts = <GIC_SPI 503 IRQ_TYPE_LEVEL_HIGH 0>;
 		};
 
+		ufs_0_phy: phy@17e04000 {
+			compatible = "google,gs101-ufs-phy";
+			reg = <0x14704000 0x3000>;
+			reg-names = "phy-pma";
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			#phy-cells = <0>;
+			clocks = <&ext_24_5m>;
+			clock-names = "ref_clk";
+			status = "disabled";
+		};
+
+		ufs_0: ufs@14700000 {
+			compatible = "google,gs101-ufs";
+			reg = <0x14700000 0x200>,
+			      <0x14701100 0x200>,
+			      <0x14780000 0xa000>,
+			      <0x14600000 0x100>;
+			reg-names = "hci", "vs_hci", "unipro", "ufsp";
+			interrupts = <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&cmu_hsi2 CLK_GOUT_HSI2_UFS_EMBD_I_ACLK>,
+				 <&cmu_hsi2 CLK_GOUT_HSI2_UFS_EMBD_I_CLK_UNIPRO>,
+				 <&cmu_hsi2 CLK_GOUT_HSI2_UFS_EMBD_I_FMP_CLK>,
+				 <&cmu_hsi2 CLK_GOUT_HSI2_QE_UFS_EMBD_HSI2_ACLK>,
+				 <&cmu_hsi2 CLK_GOUT_HSI2_QE_UFS_EMBD_HSI2_PCLK>,
+				 <&cmu_hsi2 CLK_GOUT_HSI2_SYSREG_HSI2_PCLK>;
+			clock-names = "core_clk", "sclk_unipro_main", "fmp",
+				      "ufs_aclk", "ufs_pclk", "sysreg";
+			freq-table-hz = <0 0>, <0 0>, <0 0>, <0 0>, <0 0>, <0 0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&ufs_rst_n &ufs_refclk_out>;
+			phys = <&ufs_0_phy>;
+			phy-names = "ufs-phy";
+			samsung,sysreg = <&sysreg_hsi2 0x710>;
+			status = "disabled";
+		};
+
 		cmu_apm: clock-controller@17400000 {
 			compatible = "google,gs101-cmu-apm";
 			reg = <0x17400000 0x8000>;
-- 
2.44.0.769.g3c40516874-goog


