Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA01F256E2E
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 30 Aug 2020 15:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728958AbgH3NzI (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 30 Aug 2020 09:55:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:55896 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728941AbgH3Nyu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 30 Aug 2020 09:54:50 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D8D042137B;
        Sun, 30 Aug 2020 13:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598795689;
        bh=TTjHKAyk9At+IUU5vNSawItxwFQVyBHFrL+xnjQf8yc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HE1fjI0+fT5mhm0IWRVSB7I06QSINTSR0V5aBMsNguT9M5iJZKkYsoSJvROOzdgk8
         XSScjZst+pwzZQ+JktPxpCVIY1QNE3dNvYCzQ97dmOMjvkO2GSdGid5ONn7k5xHZ3J
         UhWZEYTRw23KCqvC29pTvhHyvW85FwqI0SsVWTEI=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Denis GNUtoo Carikli" <GNUtoo@cyberdimension.org>,
        Simon Shields <simon@lineageos.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH 18/33] ARM: dts: exynos: Override thermal by label in Trats
Date:   Sun, 30 Aug 2020 15:51:45 +0200
Message-Id: <20200830135200.24304-18-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200830135200.24304-1-krzk@kernel.org>
References: <20200830135200.24304-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Using full paths to extend or override a device tree node is error prone
since if there was a typo error, a new node will be created instead of
extending the node as it was desired.  This will lead to run-time errors
that could be hard to detect.

A mistyped label on the other hand, will cause a dtc compile error
(during build time).

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos4210-trats.dts | 29 ++++++++++++--------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index 33b40f619dea..75483e08b4b4 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -140,22 +140,6 @@
 			clock-frequency = <32768>;
 		};
 	};
-
-	thermal-zones {
-		cpu_thermal: cpu-thermal {
-			cooling-maps {
-				map0 {
-				     /* Corresponds to 800MHz at freq_table */
-				     cooling-device = <&cpu0 2 2>, <&cpu1 2 2>;
-				};
-				map1 {
-				     /* Corresponds to 200MHz at freq_table */
-				     cooling-device = <&cpu0 4 4>, <&cpu1 4 4>;
-			       };
-		       };
-		};
-	};
-
 };
 
 &camera {
@@ -166,6 +150,19 @@
 	cpu0-supply = <&varm_breg>;
 };
 
+&cpu_thermal {
+	cooling-maps {
+		map0 {
+			/* Corresponds to 800MHz at freq_table */
+			cooling-device = <&cpu0 2 2>, <&cpu1 2 2>;
+		};
+		map1 {
+			/* Corresponds to 200MHz at freq_table */
+			cooling-device = <&cpu0 4 4>, <&cpu1 4 4>;
+		};
+	};
+};
+
 &dsi_0 {
 	vddcore-supply = <&vusb_reg>;
 	vddio-supply = <&vmipi_reg>;
-- 
2.17.1

