Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A022B25B117
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  2 Sep 2020 18:15:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728777AbgIBQPJ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 2 Sep 2020 12:15:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:56196 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728520AbgIBQPC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Sep 2020 12:15:02 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C8C6720773;
        Wed,  2 Sep 2020 16:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599063301;
        bh=AfC+dDZiLSfEyl6HycsEi1rPUkqynAMNsLbkWlBMMVc=;
        h=From:To:Cc:Subject:Date:From;
        b=ehu7HsrTSGFvAUU54dTrSErczt0YAuUVJadFDnT/Ka/y4mW+Xlu54EsS/+TicyxgJ
         ijtEr2y2x1LiJaUJdSLJA7g/XGqgK7VQj28SVhd5vte1+Zym+dkKQYXByMpqIhtfqh
         F2Vkol8rfcESuTo9z88fbJDsyOD18rdTr3YT6Hd8=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 1/2] dt-bindings: mfd: syscon: Merge Samsung Exynos Sysreg bindings
Date:   Wed,  2 Sep 2020 18:14:51 +0200
Message-Id: <20200902161452.28832-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The Samsung Exynos System Registers (Sysreg) bindings are quite simple -
just additional compatible to the syscon.  They do not have any value so
merge them into generic MFD syscon bindings.

Suggested-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. New patch
---
 .../bindings/arm/samsung/sysreg.yaml          | 45 -------------------
 .../devicetree/bindings/mfd/syscon.yaml       |  2 +
 2 files changed, 2 insertions(+), 45 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/samsung/sysreg.yaml

diff --git a/Documentation/devicetree/bindings/arm/samsung/sysreg.yaml b/Documentation/devicetree/bindings/arm/samsung/sysreg.yaml
deleted file mode 100644
index 3b7811804cb4..000000000000
--- a/Documentation/devicetree/bindings/arm/samsung/sysreg.yaml
+++ /dev/null
@@ -1,45 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/arm/samsung/sysreg.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Samsung S5P/Exynos SoC series System Registers (SYSREG)
-
-maintainers:
-  - Krzysztof Kozlowski <krzk@kernel.org>
-
-# Custom select to avoid matching all nodes with 'syscon'
-select:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - samsung,exynos4-sysreg
-          - samsung,exynos5-sysreg
-  required:
-    - compatible
-
-properties:
-  compatible:
-    allOf:
-      - items:
-          - enum:
-              - samsung,exynos4-sysreg
-              - samsung,exynos5-sysreg
-          - const: syscon
-
-  reg:
-    maxItems: 1
-
-examples:
-  - |
-    syscon@10010000 {
-        compatible = "samsung,exynos4-sysreg", "syscon";
-        reg = <0x10010000 0x400>;
-    };
-
-    syscon@10050000 {
-        compatible = "samsung,exynos5-sysreg", "syscon";
-        reg = <0x10050000 0x5000>;
-    };
diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 049ec2ffc7f9..a34c9e2ab1ca 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -40,6 +40,8 @@ properties:
               - allwinner,sun50i-a64-system-controller
               - microchip,sparx5-cpu-syscon
               - mstar,msc313-pmsleep
+              - samsung,exynos4-sysreg
+              - samsung,exynos5-sysreg
 
           - const: syscon
 
-- 
2.17.1

