Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7335A3522
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 30 Aug 2019 12:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726969AbfH3Kp0 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 30 Aug 2019 06:45:26 -0400
Received: from foss.arm.com ([217.140.110.172]:58034 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727751AbfH3Kp0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 30 Aug 2019 06:45:26 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3951344;
        Fri, 30 Aug 2019 03:45:25 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D384E3F718;
        Fri, 30 Aug 2019 03:45:24 -0700 (PDT)
From:   Guillaume Gardet <guillaume.gardet@arm.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Guillaume Gardet <guillaume.gardet@arm.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH V3 1/5] dt-bindings: gpu: mali-midgard: Add samsung exynos5250 compatible
Date:   Fri, 30 Aug 2019 12:44:58 +0200
Message-Id: <20190830104502.7128-2-guillaume.gardet@arm.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20190830104502.7128-1-guillaume.gardet@arm.com>
References: <20190725083433.6505-1-guillaume.gardet@arm.com>
 <20190830104502.7128-1-guillaume.gardet@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add "samsung,exynos5250-mali" binding.

Signed-off-by: Guillaume Gardet <guillaume.gardet@arm.com>

Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org
---
V3 changes:
  * add dt-bindings before node in device tree
V2 changes:
  * new file

 Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
index 9b298edec5b2..bdd1396d9cc3 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
@@ -17,6 +17,7 @@ Required properties:
   * which must be preceded by one of the following vendor specifics:
     + "allwinner,sun50i-h6-mali"
     + "amlogic,meson-gxm-mali"
+    + "samsung,exynos5250-mali"
     + "samsung,exynos5433-mali"
     + "rockchip,rk3288-mali"
     + "rockchip,rk3399-mali"
-- 
2.22.1

