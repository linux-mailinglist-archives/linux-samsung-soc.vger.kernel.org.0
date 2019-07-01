Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B06F4AAA5
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 18 Jun 2019 21:05:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730503AbfFRTFu (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 18 Jun 2019 15:05:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:40582 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730196AbfFRTFu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 15:05:50 -0400
Received: from localhost.localdomain (unknown [194.230.155.186])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6D84F21530;
        Tue, 18 Jun 2019 19:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560884749;
        bh=BvA/9DF1WByazKjkGl4tvLr+zpiufLyyUe+O5JplvCg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LyfwHlcxCBc3ms/kUd8Tw2+f+1Fe1vVA+hpUQYSD0AUGW94f1PXLud4tgspSo49op
         dLx48kyh+AjY1of6Sb9Qz196Bhsr9V9W8BqjVph+o/W5MvPpWmaLlYKMRl54OqbTUx
         +F1eDDmt5xil1fyM1R92vxlvoo2DwhSW7SU6tw0o=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kukjin Kim <kgene@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Olof Johansson <olof@lixom.net>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     Joseph Kogut <joseph.kogut@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RFT 01/10] dt-bindings: gpu: mali: Add Samsung compatibles for Midgard and Utgard
Date:   Tue, 18 Jun 2019 21:05:25 +0200
Message-Id: <20190618190534.4951-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190618190534.4951-1-krzk@kernel.org>
References: <20190618190534.4951-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add vendor compatibles for specific implementation of Mali Utgard
(Exynos3250, Exynos4-family) and Midgard (Exynos5433, Exynos7).

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt | 1 +
 Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
index e5ad3b2afe17..9b298edec5b2 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
@@ -17,6 +17,7 @@ Required properties:
   * which must be preceded by one of the following vendor specifics:
     + "allwinner,sun50i-h6-mali"
     + "amlogic,meson-gxm-mali"
+    + "samsung,exynos5433-mali"
     + "rockchip,rk3288-mali"
     + "rockchip,rk3399-mali"
 
diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
index ae63f09fda7d..519018cb860b 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
@@ -17,6 +17,7 @@ Required properties:
       + amlogic,meson8b-mali
       + amlogic,meson-gxbb-mali
       + amlogic,meson-gxl-mali
+      + samsung,exynos3250-mali
       + rockchip,rk3036-mali
       + rockchip,rk3066-mali
       + rockchip,rk3188-mali
-- 
2.17.1

