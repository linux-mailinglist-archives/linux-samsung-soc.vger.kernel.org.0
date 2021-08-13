Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA8E3EB5D2
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 13 Aug 2021 14:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240502AbhHMMz0 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 13 Aug 2021 08:55:26 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:33378
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240497AbhHMMz0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 13 Aug 2021 08:55:26 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id CF13341281
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Aug 2021 12:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628859298;
        bh=BIiDZIvIKhWZo8ChmOHD9cnqndoFwXV2somORXCN6EY=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=QI6yPWtg4HYDyP3tZuT/Vx4yk4Tvrwnd+A+uX+j5YAGVkW0yWhahXlOMsMqRq7N8O
         yGWMJOD86/KqWZopk6x42tA3Y5xrvkT1/s5s1lD2nFydiMcdjHydV5R9Qipj5Q4xdQ
         lCmHD1N3MvxKw4W5neLP7wgM2gIaPiL8GiMh5hm8/qc15Kf4xKDso3ROgJMtSOAQgd
         yfNwaFzhXfC+ROYSTWUgNdfW2ZIFVgdgpJxXRP96Aia03L751IdXbx1J0fVDt2pBqB
         5mUYhh7+F6sYyughfxPQKcWN/blw+1PnSslLQTzSlZ9D0qNOIb5Pz4IzKOZZqrfaHQ
         cLXKqXOfsH4lw==
Received: by mail-ed1-f71.google.com with SMTP id b16-20020a0564022790b02903be6352006cso4817129ede.15
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Aug 2021 05:54:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BIiDZIvIKhWZo8ChmOHD9cnqndoFwXV2somORXCN6EY=;
        b=UAIZEbSYVY6pnLzevCVwiWNtHw9B3bDt/TkqTlCBg+E0COy7bF5TKhcC+DWrb3p1oa
         J0zv+txwp55Z78O5crKkoVcacMfBiuwgwJ5ma6Qp6JqAYaACOhmdVdA7hrhfxeRTuYdM
         MhSUWnaegDyJ1Ie0iKyGmwzKrTKkzxiGsmICOUeOs0untsTHbJxqTupaNjRnUAuZNOkt
         omKZog3T37vNUTGRDsFlaRxio9K13xZY6MlkrihOEPNOzqj18cWM0GvBZgIDGWIGR6RA
         dLgX5RrSPwMst/2RPcJrZqGZHX70H3B74PVu9iLkC0ylotmEjTWfd7PhvGooJ4QGuwG7
         u47Q==
X-Gm-Message-State: AOAM532HY86c9yUhvcuqE+i9voDhXLcWE/Z0Pce3a3AAcLl8yEHKL7dF
        JKzhq4v+IUo+Mydj15Y5acgLH90Qrr550x18v51R8xymvJMK7JQwK2k9dcIkozEiX2PVQSRr9Su
        a6MWNuY1aZYmLh7gHikjoeC2kp0eEgwRYVir6Hiw3276QYSKM
X-Received: by 2002:aa7:c4d4:: with SMTP id p20mr2949919edr.382.1628859298080;
        Fri, 13 Aug 2021 05:54:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVlWeVKe50mKNtAwRRnujr59LFk6b9kiWigqOfEHvhKA9oq2QAmUrCktKZiswrFYf56kinjQ==
X-Received: by 2002:aa7:c4d4:: with SMTP id p20mr2949894edr.382.1628859297856;
        Fri, 13 Aug 2021 05:54:57 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id h8sm593264ejj.22.2021.08.13.05.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 05:54:57 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lukasz Luba <lukasz.luba@arm.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [PATCH] dt-bindings: memory: convert Samsung Exynos DMC to dtschema
Date:   Fri, 13 Aug 2021 14:54:14 +0200
Message-Id: <20210813125414.104467-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Convert Samsung Exynos5422 SoC frequency and voltage scaling for
Dynamic Memory Controller to DT schema format using json-schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../memory-controllers/exynos5422-dmc.txt     |  84 -----------
 .../samsung,exynos5422-dmc.yaml               | 137 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 3 files changed, 138 insertions(+), 85 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/exynos5422-dmc.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/samsung,exynos5422-dmc.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/exynos5422-dmc.txt b/Documentation/devicetree/bindings/memory-controllers/exynos5422-dmc.txt
deleted file mode 100644
index 02e4a1f862f1..000000000000
--- a/Documentation/devicetree/bindings/memory-controllers/exynos5422-dmc.txt
+++ /dev/null
@@ -1,84 +0,0 @@
-* Exynos5422 frequency and voltage scaling for Dynamic Memory Controller device
-
-The Samsung Exynos5422 SoC has DMC (Dynamic Memory Controller) to which the DRAM
-memory chips are connected. The driver is to monitor the controller in runtime
-and switch frequency and voltage. To monitor the usage of the controller in
-runtime, the driver uses the PPMU (Platform Performance Monitoring Unit), which
-is able to measure the current load of the memory.
-When 'userspace' governor is used for the driver, an application is able to
-switch the DMC and memory frequency.
-
-Required properties for DMC device for Exynos5422:
-- compatible: Should be "samsung,exynos5422-dmc".
-- clocks : list of clock specifiers, must contain an entry for each
-  required entry in clock-names for CLK_FOUT_SPLL, CLK_MOUT_SCLK_SPLL,
-  CLK_FF_DOUT_SPLL2, CLK_FOUT_BPLL, CLK_MOUT_BPLL, CLK_SCLK_BPLL,
-  CLK_MOUT_MX_MSPLL_CCORE, CLK_MOUT_MX_MSPLL_CCORE_PHY, CLK_MOUT_MCLK_CDREX,
-- clock-names : should include "fout_spll", "mout_sclk_spll", "ff_dout_spll2",
-  "fout_bpll", "mout_bpll", "sclk_bpll", "mout_mx_mspll_ccore",
-  "mout_mclk_cdrex"  entries
-- devfreq-events : phandles for PPMU devices connected to this DMC.
-- vdd-supply : phandle for voltage regulator which is connected.
-- reg : registers of two CDREX controllers.
-- operating-points-v2 : phandle for OPPs described in v2 definition.
-- device-handle : phandle of the connected DRAM memory device. For more
-	information please refer to documentation file:
-	Documentation/devicetree/bindings/ddr/lpddr3.txt
-- devfreq-events : phandles of the PPMU events used by the controller.
-- samsung,syscon-clk : phandle of the clock register set used by the controller,
-	these registers are used for enabling a 'pause' feature and are not
-	exposed by clock framework but they must be used in a safe way.
-	The register offsets are in the driver code and specyfic for this SoC
-	type.
-
-Optional properties for DMC device for Exynos5422:
-- interrupt-parent : The parent interrupt controller.
-- interrupts : Contains the IRQ line numbers for the DMC internal performance
-  event counters in DREX0 and DREX1 channels. Align with specification of the
-  interrupt line(s) in the interrupt-parent controller.
-- interrupt-names : IRQ names "drex_0" and "drex_1", the order should be the
-  same as in the 'interrupts' list above.
-
-Example:
-
-	ppmu_dmc0_0: ppmu@10d00000 {
-		compatible = "samsung,exynos-ppmu";
-		reg = <0x10d00000 0x2000>;
-		clocks = <&clock CLK_PCLK_PPMU_DREX0_0>;
-		clock-names = "ppmu";
-		events {
-			ppmu_event_dmc0_0: ppmu-event3-dmc0_0 {
-				event-name = "ppmu-event3-dmc0_0";
-			};
-		};
-	};
-
-	dmc: memory-controller@10c20000 {
-		compatible = "samsung,exynos5422-dmc";
-		reg = <0x10c20000 0x10000>, <0x10c30000 0x10000>;
-		clocks = <&clock CLK_FOUT_SPLL>,
-			 <&clock CLK_MOUT_SCLK_SPLL>,
-			 <&clock CLK_FF_DOUT_SPLL2>,
-			 <&clock CLK_FOUT_BPLL>,
-			 <&clock CLK_MOUT_BPLL>,
-			 <&clock CLK_SCLK_BPLL>,
-			 <&clock CLK_MOUT_MX_MSPLL_CCORE>,
-			 <&clock CLK_MOUT_MCLK_CDREX>;
-		clock-names = "fout_spll",
-			      "mout_sclk_spll",
-			      "ff_dout_spll2",
-			      "fout_bpll",
-			      "mout_bpll",
-			      "sclk_bpll",
-			      "mout_mx_mspll_ccore",
-			      "mout_mclk_cdrex";
-		operating-points-v2 = <&dmc_opp_table>;
-		devfreq-events = <&ppmu_event3_dmc0_0>,	<&ppmu_event3_dmc0_1>,
-				 <&ppmu_event3_dmc1_0>, <&ppmu_event3_dmc1_1>;
-		device-handle = <&samsung_K3QF2F20DB>;
-		vdd-supply = <&buck1_reg>;
-		samsung,syscon-clk = <&clock>;
-		interrupt-parent = <&combiner>;
-		interrupts = <16 0>, <16 1>;
-		interrupt-names = "drex_0", "drex_1";
-	};
diff --git a/Documentation/devicetree/bindings/memory-controllers/samsung,exynos5422-dmc.yaml b/Documentation/devicetree/bindings/memory-controllers/samsung,exynos5422-dmc.yaml
new file mode 100644
index 000000000000..b168a9c8bfde
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/samsung,exynos5422-dmc.yaml
@@ -0,0 +1,137 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/samsung,exynos5422-dmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: |
+  Samsung Exynos5422 SoC frequency and voltage scaling for Dynamic Memory
+  Controller device
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Lukasz Luba <lukasz.luba@arm.com>
+
+description: |
+  The Samsung Exynos5422 SoC has DMC (Dynamic Memory Controller) to which the
+  DRAM memory chips are connected. The driver is to monitor the controller in
+  runtime and switch frequency and voltage. To monitor the usage of the
+  controller in runtime, the driver uses the PPMU (Platform Performance
+  Monitoring Unit), which is able to measure the current load of the memory.
+  When 'userspace' governor is used for the driver, an application is able to
+  switch the DMC and memory frequency.
+
+properties:
+  compatible:
+    items:
+      - const: samsung,exynos5422-dmc
+
+  clock-names:
+    items:
+      - const: fout_spll
+      - const: mout_sclk_spll
+      - const: ff_dout_spll2
+      - const: fout_bpll
+      - const: mout_bpll
+      - const: sclk_bpll
+      - const: mout_mx_mspll_ccore
+      - const: mout_mclk_cdrex
+
+  clocks:
+    minItems: 8
+    maxItems: 8
+
+  devfreq-events:
+    $ref: '/schemas/types.yaml#/definitions/phandle-array'
+    minItems: 1
+    maxItems: 16
+    description: phandles of the PPMU events used by the controller.
+
+  device-handle:
+    $ref: '/schemas/types.yaml#/definitions/phandle'
+    description: |
+      phandle of the connected DRAM memory device. For more information please
+      refer to documentation file: Documentation/devicetree/bindings/ddr/lpddr3.txt
+
+  operating-points-v2: true
+
+  interrupts:
+    items:
+      - description: DMC internal performance event counters in DREX0
+      - description: DMC internal performance event counters in DREX1
+
+  interrupt-names:
+    items:
+      - const: drex_0
+      - const: drex_1
+
+  reg:
+    items:
+      - description: registers of DREX0
+      - description: registers of DREX1
+
+  samsung,syscon-clk:
+    $ref: '/schemas/types.yaml#/definitions/phandle'
+    description: |
+      Phandle of the clock register set used by the controller, these registers
+      are used for enabling a 'pause' feature and are not exposed by clock
+      framework but they must be used in a safe way.  The register offsets are
+      in the driver code and specyfic for this SoC type.
+
+  vdd-supply: true
+
+required:
+  - compatible
+  - clock-names
+  - clocks
+  - devfreq-events
+  - device-handle
+  - reg
+  - samsung,syscon-clk
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/exynos5420.h>
+    ppmu_dmc0_0: ppmu@10d00000 {
+        compatible = "samsung,exynos-ppmu";
+        reg = <0x10d00000 0x2000>;
+        clocks = <&clock CLK_PCLK_PPMU_DREX0_0>;
+        clock-names = "ppmu";
+        events {
+            ppmu_event_dmc0_0: ppmu-event3-dmc0_0 {
+                event-name = "ppmu-event3-dmc0_0";
+            };
+        };
+    };
+
+    memory-controller@10c20000 {
+        compatible = "samsung,exynos5422-dmc";
+        reg = <0x10c20000 0x10000>, <0x10c30000 0x10000>;
+        clocks = <&clock CLK_FOUT_SPLL>,
+                 <&clock CLK_MOUT_SCLK_SPLL>,
+                 <&clock CLK_FF_DOUT_SPLL2>,
+                 <&clock CLK_FOUT_BPLL>,
+                 <&clock CLK_MOUT_BPLL>,
+                 <&clock CLK_SCLK_BPLL>,
+                 <&clock CLK_MOUT_MX_MSPLL_CCORE>,
+                 <&clock CLK_MOUT_MCLK_CDREX>;
+        clock-names = "fout_spll",
+                      "mout_sclk_spll",
+                      "ff_dout_spll2",
+                      "fout_bpll",
+                      "mout_bpll",
+                      "sclk_bpll",
+                      "mout_mx_mspll_ccore",
+                      "mout_mclk_cdrex";
+        operating-points-v2 = <&dmc_opp_table>;
+        devfreq-events = <&ppmu_event3_dmc0_0>,	<&ppmu_event3_dmc0_1>,
+                         <&ppmu_event3_dmc1_0>, <&ppmu_event3_dmc1_1>;
+        device-handle = <&samsung_K3QF2F20DB>;
+        vdd-supply = <&buck1_reg>;
+        samsung,syscon-clk = <&clock>;
+        interrupt-parent = <&combiner>;
+        interrupts = <16 0>, <16 1>;
+        interrupt-names = "drex_0", "drex_1";
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index ebdb07a49b02..eb4ada858826 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5570,7 +5570,7 @@ M:	Lukasz Luba <lukasz.luba@arm.com>
 L:	linux-pm@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/memory-controllers/exynos5422-dmc.txt
+F:	Documentation/devicetree/bindings/memory-controllers/samsung,exynos5422-dmc.yaml
 F:	drivers/memory/samsung/exynos5422-dmc.c
 
 DME1737 HARDWARE MONITOR DRIVER
-- 
2.30.2

