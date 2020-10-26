Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D17C29A0FB
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 27 Oct 2020 01:47:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2443525AbgJ0AbH (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 26 Oct 2020 20:31:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:53254 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2409542AbgJZXvu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Oct 2020 19:51:50 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 617C6221FC;
        Mon, 26 Oct 2020 23:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603756310;
        bh=NNHRkHNwnAuoOXQ5XBDK/xGixqeP5LvrsDlGrNR8SLE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KYOJOpCYSkIB93SBNkuaH7h8aXlPvazRnB2MWE6EsvquXFWa4RxYjzBkalZZFeGBB
         OuZFoMlP6emT9RCClj3gT7jMtlyN9luGeCNybbAumGJjxg0+e/w6lOjVhV3bYNQ0eX
         wwxqOlTGCjah5kNbZUgzpBQNRc481+wmraryRFJY=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.9 134/147] ARM: dts: s5pv210: remove DMA controller bus node name to fix dtschema warnings
Date:   Mon, 26 Oct 2020 19:48:52 -0400
Message-Id: <20201026234905.1022767-134-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026234905.1022767-1-sashal@kernel.org>
References: <20201026234905.1022767-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Krzysztof Kozlowski <krzk@kernel.org>

[ Upstream commit ea4e792f3c8931fffec4d700cf6197d84e9f35a6 ]

There is no need to keep DMA controller nodes under AMBA bus node.
Remove the "amba" node to fix dtschema warnings like:

  amba: $nodename:0: 'amba' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Tested-by: Jonathan Bakker <xc-racer2@live.ca>
Link: https://lore.kernel.org/r/20200907161141.31034-6-krzk@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/s5pv210.dtsi | 49 +++++++++++++++-------------------
 1 file changed, 21 insertions(+), 28 deletions(-)

diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
index 1b0ee884e91db..84e4447931de5 100644
--- a/arch/arm/boot/dts/s5pv210.dtsi
+++ b/arch/arm/boot/dts/s5pv210.dtsi
@@ -128,35 +128,28 @@ wakeup-interrupt-controller {
 			};
 		};
 
-		amba {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "simple-bus";
-			ranges;
-
-			pdma0: dma@e0900000 {
-				compatible = "arm,pl330", "arm,primecell";
-				reg = <0xe0900000 0x1000>;
-				interrupt-parent = <&vic0>;
-				interrupts = <19>;
-				clocks = <&clocks CLK_PDMA0>;
-				clock-names = "apb_pclk";
-				#dma-cells = <1>;
-				#dma-channels = <8>;
-				#dma-requests = <32>;
-			};
+		pdma0: dma@e0900000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0xe0900000 0x1000>;
+			interrupt-parent = <&vic0>;
+			interrupts = <19>;
+			clocks = <&clocks CLK_PDMA0>;
+			clock-names = "apb_pclk";
+			#dma-cells = <1>;
+			#dma-channels = <8>;
+			#dma-requests = <32>;
+		};
 
-			pdma1: dma@e0a00000 {
-				compatible = "arm,pl330", "arm,primecell";
-				reg = <0xe0a00000 0x1000>;
-				interrupt-parent = <&vic0>;
-				interrupts = <20>;
-				clocks = <&clocks CLK_PDMA1>;
-				clock-names = "apb_pclk";
-				#dma-cells = <1>;
-				#dma-channels = <8>;
-				#dma-requests = <32>;
-			};
+		pdma1: dma@e0a00000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0xe0a00000 0x1000>;
+			interrupt-parent = <&vic0>;
+			interrupts = <20>;
+			clocks = <&clocks CLK_PDMA1>;
+			clock-names = "apb_pclk";
+			#dma-cells = <1>;
+			#dma-channels = <8>;
+			#dma-requests = <32>;
 		};
 
 		adc: adc@e1700000 {
-- 
2.25.1

