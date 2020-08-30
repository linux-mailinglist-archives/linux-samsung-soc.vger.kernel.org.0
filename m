Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99BF7256E30
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 30 Aug 2020 15:55:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728962AbgH3NzO (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 30 Aug 2020 09:55:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:55826 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728945AbgH3Nyy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 30 Aug 2020 09:54:54 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0845420EDD;
        Sun, 30 Aug 2020 13:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598795692;
        bh=bvy5JgfVStU+LmnfyJ6fxrqzEqJ3ekac2/7lOiEU4fI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=K7cJ3p82YVQ7DddJCjLDCPppLFVVAzWnWVCP5cq5ymEQYla3h2vqnYR11y1FPuGbi
         8I41zw4ehdUL+MEkERQimJNTE8kbGZCpPP46iARC04+WmwOL/mirG9SIqEvKXer4pk
         DCsnVNEbfdyZjZVJDMIz+abKYDiwL8le0mRlY1Ao=
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
Subject: [PATCH 19/33] ARM: dts: exynos: Add CPU cooling in Origen
Date:   Sun, 30 Aug 2020 15:51:46 +0200
Message-Id: <20200830135200.24304-19-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200830135200.24304-1-krzk@kernel.org>
References: <20200830135200.24304-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add missing cooling devices for CPU thermal zones in Exynos4210 Origen
board.  This allows to scale down CPU frequency (and voltage) in case of
thermal pressure.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Not tested on HW.
---
 arch/arm/boot/dts/exynos4210-origen.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index fcf45619a3e4..d6d8a8096eb4 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -129,6 +129,19 @@
 	cpu0-supply = <&buck1_reg>;
 };
 
+&cpu_thermal {
+	cooling-maps {
+		map0 {
+			/* Corresponds to 800MHz */
+			cooling-device = <&cpu0 2 2>;
+		};
+		map1 {
+			/* Corresponds to 200MHz */
+			cooling-device = <&cpu0 4 4>;
+		};
+	};
+};
+
 &exynos_usbphy {
 	status = "okay";
 };
-- 
2.17.1

