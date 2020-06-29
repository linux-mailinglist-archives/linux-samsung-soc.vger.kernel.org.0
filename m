Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56A0020E16C
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 29 Jun 2020 23:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389938AbgF2Uzj (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 29 Jun 2020 16:55:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:50118 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389934AbgF2Uzi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 29 Jun 2020 16:55:38 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E33F620724;
        Mon, 29 Jun 2020 20:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593464137;
        bh=6TzfPG6/JhbJpdcOiggDSlhUQkyBO/NzUgyZFsRDviQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=awcDL7j2D/PkNVfDVrqUvResC1tuxwhQATNIYF4DWVvwVuC+ou6pvY7/3/aiU3olU
         SciYYM4eyv85YCvnEqwz5ZLaCtQCVF7i2DOSdpZdUZWUaMsmTmnq5jfd5E7uNvZXEK
         VhNSAe277kFLyskc1rSykp6PgK1WFyFlfNL+O2iY=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH 3/4] arm64: dts: exynos: Align DMA controller bus node name with dtschema
Date:   Mon, 29 Jun 2020 22:44:41 +0200
Message-Id: <20200629204442.17336-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200629204442.17336-1-krzk@kernel.org>
References: <20200629204442.17336-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

AMBA is a bus so name the node with DMA controllers just as "bus" to fix
dtschema warnings like:

    amba: $nodename:0: 'amba' does not match '^(bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Not tested although no effect expected.
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 2 +-
 arch/arm64/boot/dts/exynos/exynos7.dtsi    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 57b433a1c900..98e907115599 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -1756,7 +1756,7 @@
 			status = "disabled";
 		};
 
-		amba {
+		bus {
 			compatible = "simple-bus";
 			#address-cells = <1>;
 			#size-cells = <1>;
diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index 96ed93a21e40..1e0acf6e17e2 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -105,7 +105,7 @@
 				<0x11006000 0x2000>;
 		};
 
-		amba {
+		bus {
 			compatible = "simple-bus";
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.17.1

