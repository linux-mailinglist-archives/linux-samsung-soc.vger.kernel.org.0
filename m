Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4468D2604A9
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  7 Sep 2020 20:34:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730119AbgIGSd7 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 7 Sep 2020 14:33:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:41586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730248AbgIGSd5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Sep 2020 14:33:57 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E4DCC20C09;
        Mon,  7 Sep 2020 18:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599503637;
        bh=VxTPRC2Ecn8ToUITeJ8A0G6gERdgh9kacdWNQsyLjew=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OyeyUV1S2wnWVYJpF22jPEjXh43I7GUu7rTEw0tS+jHbQeydIglu/Lf+/whNSFKVU
         OM8DbofbIF6vJXO9xc+kvTJWhDFxU58N2LTWwJvyjJ0oxMipld6ZCcTEX5yg93/phw
         hnWM1nKpHoIgtb+fc1LC22hR//zi7sgZVWsl4wCM=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lihua Yao <ylhuajnu@outlook.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH 11/11] ARM: dts: s3c24xx: move fixed clocks under root node in SMDK2416
Date:   Mon,  7 Sep 2020 20:33:13 +0200
Message-Id: <20200907183313.29234-12-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200907183313.29234-1-krzk@kernel.org>
References: <20200907183313.29234-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The fixed clocks are kept under dedicated 'clocks' node but this causes
multiple dtschema warnings:

  clocks: $nodename:0: 'clocks' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
  clocks: #size-cells:0:0: 0 is not one of [1, 2]
  clocks: xti@0:reg:0: [0] is too short
  clocks: 'ranges' is a required property
  xti@0: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/s3c2416-smdk2416.dts | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/s3c2416-smdk2416.dts b/arch/arm/boot/dts/s3c2416-smdk2416.dts
index 811bfdef4e9b..47626ede6fdd 100644
--- a/arch/arm/boot/dts/s3c2416-smdk2416.dts
+++ b/arch/arm/boot/dts/s3c2416-smdk2416.dts
@@ -17,18 +17,11 @@
 		reg =  <0x30000000 0x4000000>;
 	};
 
-	clocks {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		xti: xti@0 {
-			compatible = "fixed-clock";
-			reg = <0>;
-			clock-frequency = <12000000>;
-			clock-output-names = "xti";
-			#clock-cells = <0>;
-		};
+	xti: clock-0 {
+		compatible = "fixed-clock";
+		clock-frequency = <12000000>;
+		clock-output-names = "xti";
+		#clock-cells = <0>;
 	};
 };
 
-- 
2.17.1

