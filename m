Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC34256E4A
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 30 Aug 2020 16:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726503AbgH3OCQ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 30 Aug 2020 10:02:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:56828 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728972AbgH3NzZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 30 Aug 2020 09:55:25 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 16D5221527;
        Sun, 30 Aug 2020 13:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598795725;
        bh=d+payrNDUljAt/FZ1UI0yKfpcaTabtKwEuWurVJMuPs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=G96usUA1PN8PO5pfeD+4ZXDevuAWUMiwN1qb9rceGkXtI8KhzRToFSsP3qhFvEeIv
         0OZjAdvW0BaT/j/IdUzfYuGnRjse9Tm+ygZ1xY330Byize9pBnL4o2cx/4D70xTib+
         CxjPOI356+7hKLTPaKvi0s/WEoPPcL1Cn8lajDuw=
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
Subject: [PATCH 30/33] ARM: dts: exynos: Add CPU cooling in Tiny4412
Date:   Sun, 30 Aug 2020 15:51:57 +0200
Message-Id: <20200830135200.24304-30-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200830135200.24304-1-krzk@kernel.org>
References: <20200830135200.24304-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add missing cooling devices for CPU thermal zones in Exynos4412 Tiny4412
board.  This allows to scale down CPU frequency (and voltage) in case of
thermal pressure.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos4412-tiny4412.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-tiny4412.dts b/arch/arm/boot/dts/exynos4412-tiny4412.dts
index 3a91de8a8082..7512c86e634e 100644
--- a/arch/arm/boot/dts/exynos4412-tiny4412.dts
+++ b/arch/arm/boot/dts/exynos4412-tiny4412.dts
@@ -78,6 +78,21 @@
 	};
 };
 
+&cpu_thermal {
+	cooling-maps {
+		cooling_map0: map0 {
+			/* Corresponds to 800MHz at freq_table */
+			cooling-device = <&cpu0 7 7>, <&cpu1 7 7>,
+					 <&cpu2 7 7>, <&cpu3 7 7>;
+		};
+		cooling_map1: map1 {
+			/* Corresponds to 200MHz at freq_table */
+			cooling-device = <&cpu0 13 13>, <&cpu1 13 13>,
+					 <&cpu2 13 13>, <&cpu3 13 13>;
+		};
+	};
+};
+
 &fimd {
 	pinctrl-0 = <&lcd_clk>, <&lcd_data24>;
 	pinctrl-names = "default";
-- 
2.17.1

