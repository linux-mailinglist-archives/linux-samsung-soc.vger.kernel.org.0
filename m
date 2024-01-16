Return-Path: <linux-samsung-soc+bounces-1028-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C5082F5EB
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 16 Jan 2024 20:47:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD1B91C240AD
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 16 Jan 2024 19:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFC152231D;
	Tue, 16 Jan 2024 19:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EypzR3vg"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC9D2231B;
	Tue, 16 Jan 2024 19:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705434199; cv=none; b=k8nZ9i+8xInrtRxVKoUyDUYj5CwS7lbvqlV+CZJVf7BenZEHLXgQaTtsuKi/TdxeNWTC/vkXR/NZfIsslreparwOqh2XnMJzhcXScCgRaVPK3fjTH3wQlv39DOtmVvEoNvMsi0Nz82rC0oG3K0QZbvBvSsG3diIEWQcrn+lOthM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705434199; c=relaxed/simple;
	bh=sHhNFhqpZh+BbakbgsxrMWK/0jDfFM02+cTHaEb4zO8=;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-stable:
	 X-Patchwork-Hint:X-stable-base:Content-Transfer-Encoding; b=oPZn4E6MPxeBWDuknw0p4gRXgIOiKHC7EcMZlLIK/cUAdEl5TpjvwNj3we/r1NziUSf6bLTUuThmStsEYisO9fT2aDBjiX8NVkKeL1ym0Apo4rsCAgJkdz+MNfUP6KJ8e5dSSNiCBJ1sKXh1/kfgSwvpOxhG+ltiegIIP9Zsg/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EypzR3vg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 082A8C433C7;
	Tue, 16 Jan 2024 19:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705434199;
	bh=sHhNFhqpZh+BbakbgsxrMWK/0jDfFM02+cTHaEb4zO8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EypzR3vgNNBNXhFz9JGEuV4/DcdJ014gfG1FkKrKH1461MTtT8aliW0ziHiSHeQ8G
	 ONzGP0LmEAvqP0uwXcK8kN2AHI7E2qhi3bn1XDTkQxkEBPqt/2MrnjH8kKSd2qZq56
	 fszgxdSyhnu585fxUK2ZT6XGW7aVx+U/D4DWhQxj70pI3KvyBswp/WeZHdCor/RyFS
	 /Um/v6xGb8mj4dLAe5JK4BUeujmcqRXa4q0rLRPrwN8yGf/BWEld4X2YTseF/A3y2s
	 jv5yukC4NsTwRimCzHBWzXImx0/Z/Jgg43CH+dpRXtcR02J4Z/KNdKTIZEzfmQspzV
	 T730Bn47q1Ocw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.7 018/108] ARM: dts: samsung: s5pv210: fix camera unit addresses/ranges
Date: Tue, 16 Jan 2024 14:38:44 -0500
Message-ID: <20240116194225.250921-18-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240116194225.250921-1-sashal@kernel.org>
References: <20240116194225.250921-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7
Content-Transfer-Encoding: 8bit

From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

[ Upstream commit 07e6a553c2f1d385edfc9185081dee442a9dd38d ]

The camera node has both unit address and children within the same bus
mapping, thus needs proper ranges property to fix dtc W=1 warnings:

  Warning (unit_address_vs_reg): /soc/camera@fa600000: node has a unit name, but no reg or ranges property
  Warning (simple_bus_reg): /soc/camera@fa600000: missing or empty reg/ranges property

Subtract 0xfa600000 from all its children nodes.  No functional impact
expected.

Link: https://lore.kernel.org/r/20230722121719.150094-3-krzysztof.kozlowski@linaro.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/samsung/s5pv210.dtsi | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/s5pv210.dtsi b/arch/arm/boot/dts/samsung/s5pv210.dtsi
index f7de5b5f2f38..ed560c9a3aa1 100644
--- a/arch/arm/boot/dts/samsung/s5pv210.dtsi
+++ b/arch/arm/boot/dts/samsung/s5pv210.dtsi
@@ -549,17 +549,17 @@ i2c1: i2c@fab00000 {
 
 		camera: camera@fa600000 {
 			compatible = "samsung,fimc";
+			ranges = <0x0 0xfa600000 0xe01000>;
 			clocks = <&clocks SCLK_CAM0>, <&clocks SCLK_CAM1>;
 			clock-names = "sclk_cam0", "sclk_cam1";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			#clock-cells = <1>;
 			clock-output-names = "cam_a_clkout", "cam_b_clkout";
-			ranges;
 
-			csis0: csis@fa600000 {
+			csis0: csis@0 {
 				compatible = "samsung,s5pv210-csis";
-				reg = <0xfa600000 0x4000>;
+				reg = <0x00000000 0x4000>;
 				interrupt-parent = <&vic2>;
 				interrupts = <29>;
 				clocks = <&clocks CLK_CSIS>,
@@ -572,9 +572,9 @@ csis0: csis@fa600000 {
 				#size-cells = <0>;
 			};
 
-			fimc0: fimc@fb200000 {
+			fimc0: fimc@c00000 {
 				compatible = "samsung,s5pv210-fimc";
-				reg = <0xfb200000 0x1000>;
+				reg = <0x00c00000 0x1000>;
 				interrupts = <5>;
 				interrupt-parent = <&vic2>;
 				clocks = <&clocks CLK_FIMC0>,
@@ -586,9 +586,9 @@ fimc0: fimc@fb200000 {
 				samsung,cam-if;
 			};
 
-			fimc1: fimc@fb300000 {
+			fimc1: fimc@d00000 {
 				compatible = "samsung,s5pv210-fimc";
-				reg = <0xfb300000 0x1000>;
+				reg = <0x00d00000 0x1000>;
 				interrupt-parent = <&vic2>;
 				interrupts = <6>;
 				clocks = <&clocks CLK_FIMC1>,
@@ -602,9 +602,9 @@ fimc1: fimc@fb300000 {
 				samsung,lcd-wb;
 			};
 
-			fimc2: fimc@fb400000 {
+			fimc2: fimc@e00000 {
 				compatible = "samsung,s5pv210-fimc";
-				reg = <0xfb400000 0x1000>;
+				reg = <0x00e00000 0x1000>;
 				interrupt-parent = <&vic2>;
 				interrupts = <7>;
 				clocks = <&clocks CLK_FIMC2>,
-- 
2.43.0


