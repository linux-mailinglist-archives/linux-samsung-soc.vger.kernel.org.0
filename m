Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBA58299F7D
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 27 Oct 2020 01:23:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410926AbgJZXzj (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 26 Oct 2020 19:55:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:60784 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2410548AbgJZXyo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Oct 2020 19:54:44 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9896A2151B;
        Mon, 26 Oct 2020 23:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603756483;
        bh=9vcJxKDKSIIXNlZHGSlERzqB8tCZJ91dI572Tp8NTgE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pjYTkIpYEuPE4LUkqQjjqZ672OPRItjt1k29bHGgKhGhaxLFshVyJ1kJxEhbo8ONF
         YjW7rHw0uJZfCj5QYRhxA9izpZd6SCWSgcyDgNRPbs+F0OaiEfcZi+ZKP1V8wIPcE3
         qU2snxBYN5+dG25wIGGTRZo4Y9L0Y6rhjuwgLwro=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 126/132] ARM: dts: s5pv210: remove dedicated 'audio-subsystem' node
Date:   Mon, 26 Oct 2020 19:51:58 -0400
Message-Id: <20201026235205.1023962-126-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026235205.1023962-1-sashal@kernel.org>
References: <20201026235205.1023962-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Krzysztof Kozlowski <krzk@kernel.org>

[ Upstream commit 6c17a2974abf68a58517f75741b15c4aba42b4b8 ]

The 'audio-subsystem' node is an artificial creation, not representing
real hardware.  The hardware is described by its nodes - AUDSS clock
controller and I2S0.

Remove the 'audio-subsystem' node along with its undocumented compatible
to fix dtbs_check warnings like:

  audio-subsystem: $nodename:0: 'audio-subsystem' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Tested-by: Jonathan Bakker <xc-racer2@live.ca>
Link: https://lore.kernel.org/r/20200907161141.31034-9-krzk@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/s5pv210.dtsi | 65 +++++++++++++++-------------------
 1 file changed, 29 insertions(+), 36 deletions(-)

diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
index 46221a5c8ce59..2871351ab9074 100644
--- a/arch/arm/boot/dts/s5pv210.dtsi
+++ b/arch/arm/boot/dts/s5pv210.dtsi
@@ -223,43 +223,36 @@ i2c2: i2c@e1a00000 {
 			status = "disabled";
 		};
 
-		audio-subsystem {
-			compatible = "samsung,s5pv210-audss", "simple-bus";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
-
-			clk_audss: clock-controller@eee10000 {
-				compatible = "samsung,s5pv210-audss-clock";
-				reg = <0xeee10000 0x1000>;
-				clock-names = "hclk", "xxti",
-						"fout_epll",
-						"sclk_audio0";
-				clocks = <&clocks DOUT_HCLKP>, <&xxti>,
-						<&clocks FOUT_EPLL>,
-						<&clocks SCLK_AUDIO0>;
-				#clock-cells = <1>;
-			};
+		clk_audss: clock-controller@eee10000 {
+			compatible = "samsung,s5pv210-audss-clock";
+			reg = <0xeee10000 0x1000>;
+			clock-names = "hclk", "xxti",
+				      "fout_epll",
+				      "sclk_audio0";
+			clocks = <&clocks DOUT_HCLKP>, <&xxti>,
+				 <&clocks FOUT_EPLL>,
+				 <&clocks SCLK_AUDIO0>;
+			#clock-cells = <1>;
+		};
 
-			i2s0: i2s@eee30000 {
-				compatible = "samsung,s5pv210-i2s";
-				reg = <0xeee30000 0x1000>;
-				interrupt-parent = <&vic2>;
-				interrupts = <16>;
-				dma-names = "rx", "tx", "tx-sec";
-				dmas = <&pdma1 9>, <&pdma1 10>, <&pdma1 11>;
-				clock-names = "iis",
-						"i2s_opclk0",
-						"i2s_opclk1";
-				clocks = <&clk_audss CLK_I2S>,
-						<&clk_audss CLK_I2S>,
-						<&clk_audss CLK_DOUT_AUD_BUS>;
-				samsung,idma-addr = <0xc0010000>;
-				pinctrl-names = "default";
-				pinctrl-0 = <&i2s0_bus>;
-				#sound-dai-cells = <0>;
-				status = "disabled";
-			};
+		i2s0: i2s@eee30000 {
+			compatible = "samsung,s5pv210-i2s";
+			reg = <0xeee30000 0x1000>;
+			interrupt-parent = <&vic2>;
+			interrupts = <16>;
+			dma-names = "rx", "tx", "tx-sec";
+			dmas = <&pdma1 9>, <&pdma1 10>, <&pdma1 11>;
+			clock-names = "iis",
+				      "i2s_opclk0",
+				      "i2s_opclk1";
+			clocks = <&clk_audss CLK_I2S>,
+				 <&clk_audss CLK_I2S>,
+				 <&clk_audss CLK_DOUT_AUD_BUS>;
+			samsung,idma-addr = <0xc0010000>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2s0_bus>;
+			#sound-dai-cells = <0>;
+			status = "disabled";
 		};
 
 		i2s1: i2s@e2100000 {
-- 
2.25.1

