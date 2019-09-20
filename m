Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9ADBB959D
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 20 Sep 2019 18:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392191AbfITQ0M (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 20 Sep 2019 12:26:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:43930 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388770AbfITQ0L (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Sep 2019 12:26:11 -0400
Received: from localhost.localdomain (unknown [194.230.155.145])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D97722086A;
        Fri, 20 Sep 2019 16:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568996771;
        bh=GUw8grGduxFbca/EbGXq/H60ev8333pzA+JdOdyVLFc=;
        h=From:To:Subject:Date:From;
        b=WHK6o1wY8neT06pAUK8D5i6Gxbw9dxeag4NyU4Z/XLdU5OGQ5vMibCqgWlIcujQen
         EcKxwjku+WFR4EUjlf+RpoDk57lMZ7Fhvo74GRTXPNV1m29MQzuwbzfmBvJ40AnlSC
         sSVBu0uo9ihraZB+y2ZY0UJmBsxLFEMZ+MQ+qIJo=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: arm: samsung: Convert Exynos System Registers bindings to json-schema
Date:   Fri, 20 Sep 2019 18:25:59 +0200
Message-Id: <20190920162600.7486-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Convert Samsung Exynos System Registers (SYSREG) bindings to DT schema
format using json-schema.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v2:
1. Use select to skip other syscon nodes,
2. Indent example with four spaces (more readable),
---
 .../bindings/arm/samsung/sysreg.txt           | 19 --------
 .../bindings/arm/samsung/sysreg.yaml          | 45 +++++++++++++++++++
 2 files changed, 45 insertions(+), 19 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/samsung/sysreg.txt
 create mode 100644 Documentation/devicetree/bindings/arm/samsung/sysreg.yaml

diff --git a/Documentation/devicetree/bindings/arm/samsung/sysreg.txt b/Documentation/devicetree/bindings/arm/samsung/sysreg.txt
deleted file mode 100644
index 4fced6e9d5e4..000000000000
--- a/Documentation/devicetree/bindings/arm/samsung/sysreg.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-SAMSUNG S5P/Exynos SoC series System Registers (SYSREG)
-
-Properties:
- - compatible : should contain two values. First value must be one from following list:
-		- "samsung,exynos4-sysreg" - for Exynos4 based SoCs,
-		- "samsung,exynos5-sysreg" - for Exynos5 based SoCs.
-		second value must be always "syscon".
- - reg : offset and length of the register set.
-
-Example:
-	syscon@10010000 {
-		compatible = "samsung,exynos4-sysreg", "syscon";
-		reg = <0x10010000 0x400>;
-	};
-
-	syscon@10050000 {
-		compatible = "samsung,exynos5-sysreg", "syscon";
-		reg = <0x10050000 0x5000>;
-	};
diff --git a/Documentation/devicetree/bindings/arm/samsung/sysreg.yaml b/Documentation/devicetree/bindings/arm/samsung/sysreg.yaml
new file mode 100644
index 000000000000..3b7811804cb4
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/samsung/sysreg.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/samsung/sysreg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5P/Exynos SoC series System Registers (SYSREG)
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+# Custom select to avoid matching all nodes with 'syscon'
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - samsung,exynos4-sysreg
+          - samsung,exynos5-sysreg
+  required:
+    - compatible
+
+properties:
+  compatible:
+    allOf:
+      - items:
+          - enum:
+              - samsung,exynos4-sysreg
+              - samsung,exynos5-sysreg
+          - const: syscon
+
+  reg:
+    maxItems: 1
+
+examples:
+  - |
+    syscon@10010000 {
+        compatible = "samsung,exynos4-sysreg", "syscon";
+        reg = <0x10010000 0x400>;
+    };
+
+    syscon@10050000 {
+        compatible = "samsung,exynos5-sysreg", "syscon";
+        reg = <0x10050000 0x5000>;
+    };
-- 
2.17.1

