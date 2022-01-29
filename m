Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 444B44A31A2
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 29 Jan 2022 20:37:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353176AbiA2ThX (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 29 Jan 2022 14:37:23 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:60374
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1353144AbiA2ThS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 29 Jan 2022 14:37:18 -0500
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C9732407B2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 29 Jan 2022 19:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643485031;
        bh=v3MaE4YE81127QeF4TU2Qxtg0ok0vmr5F1s7ZnnGBgk=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=Mdcv8aHzmOU+HGPqXsl/p9v+P3RSOg8+ecPVqa1gYYsbC7pzlyaHBTjRI6QipRin/
         8L07fG2HyswAMXjSt99VtNqi/7gMpR21TTrVpjrRlTX3dFm0Bkly6pR59fYDQyo2Z9
         wWpLAwQp5dbQhkpEzlIw4u/ipyi0QygNMudb36HqhK56eNIGBWY6x4fjgRGE9UmS0x
         4oA75nxIALYRoCeT60o3Hfg+0QstJsefdJWN0uwxa/bnM9Eefe1I1xEzpqarblR4eC
         +oRhl+Y7pPLrXZEIT4jCW/UIrcsafkDJEJKs7s5eKQ5pwdU/BXpUr3qztEGbtEKdQ3
         Uwtt+qiXSW99w==
Received: by mail-ed1-f71.google.com with SMTP id o5-20020a50c905000000b00403bbdcef64so4303110edh.14
        for <linux-samsung-soc@vger.kernel.org>; Sat, 29 Jan 2022 11:37:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v3MaE4YE81127QeF4TU2Qxtg0ok0vmr5F1s7ZnnGBgk=;
        b=0pwfU6KL9olapOl2WEAXKWdV8j0lCbv4gE8JPFRR8gqvKiw+jU2wY0MA6w/AuZjC3U
         2ltvYjgJe1PmosyEH5xQG7d7ib0ikC6gFPHuG+2qAGtKNUNi/OVrbadF1DS2qZcS5P+V
         UAFc39Ksk8Z2ulIoiWF7yDd7d6X75si0nQbNLp7ub3kiF0tfOWzFOrUzJhK9bXMhzEPC
         j8rVEv6wFymmWTHovA4zUiq2nStyhg4QI5KOXtJl0t8ed3E1ByfEMzfek0xYbC2C+0/b
         2/3tXsPWzGUqHkjAyXtVj4lIS+IFwe9irCea4QR1j7KUwJ1XYmLVcXJ9BWdcLipbhLxJ
         Ep7w==
X-Gm-Message-State: AOAM53240mmzyNXVAK2ZGrzjSHoho1Bc0tBvvFPpzKdMZM4dvZSm2nT5
        Bn13eiud8B/GRQrTtNfoWgfnV3L9gAN43JRcrtpsHw4Vn8FdEq56gmaSTusBDhzfkJuIsjluqlL
        KqbHljI0m9NjPdTnw0REj4AOJP7f6e7VI991K2QFlHtF33HKE
X-Received: by 2002:aa7:d709:: with SMTP id t9mr13957573edq.216.1643485019380;
        Sat, 29 Jan 2022 11:36:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzxLkvcLW6BLxgIqLjTWWRLCLYPN6D4UhxKK1OqrkVsROsoJ44oBC30s8nc7egAVFljLNwTyw==
X-Received: by 2002:aa7:d709:: with SMTP id t9mr13957561edq.216.1643485019174;
        Sat, 29 Jan 2022 11:36:59 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id bf21sm14968026edb.2.2022.01.29.11.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 11:36:58 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 8/8] dt-bindings: phy: samsung,usb3-drd-phy: convert to dtschema
Date:   Sat, 29 Jan 2022 20:36:46 +0100
Message-Id: <20220129193646.372481-8-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220129193646.372481-1-krzysztof.kozlowski@canonical.com>
References: <20220129193646.372481-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Convert the Samsung Exynos USB 3.0 DRD PHY bindings to DT schema format.

Except the conversion, add also vbus-supply and vbus-boost-supply
properties which were already used by the driver and DTS.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/phy/samsung,usb3-drd-phy.yaml    | 126 ++++++++++++++++++
 .../devicetree/bindings/phy/samsung-phy.txt   |  53 --------
 2 files changed, 126 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/samsung-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
new file mode 100644
index 000000000000..f83f0f8135b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/samsung,usb3-drd-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos SoC USB 3.0 DRD PHY USB 2.0 PHY
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Marek Szyprowski <m.szyprowski@samsung.com>
+  - Sylwester Nawrocki <s.nawrocki@samsung.com>
+
+description: |
+  For samsung,exynos5250-usbdrd-phy and samsung,exynos5420-usbdrd-phy
+  compatible PHYs, the second cell in the PHY specifier identifies the
+  PHY id, which is interpreted as follows::
+    0 - UTMI+ type phy,
+    1 - PIPE3 type phy.
+
+  For SoCs like Exynos5420 having multiple USB 3.0 DRD PHY controllers,
+  'usbdrd_phy' nodes should have numbered alias in the aliases node, in the
+  form of usbdrdphyN, N = 0, 1... (depending on number of controllers).
+
+properties:
+  compatible:
+    enum:
+      - samsung,exynos5250-usbdrd-phy
+      - samsung,exynos5420-usbdrd-phy
+      - samsung,exynos5433-usbdrd-phy
+      - samsung,exynos7-usbdrd-phy
+
+  clocks:
+    minItems: 2
+    maxItems: 5
+
+  clock-names:
+    minItems: 2
+    maxItems: 5
+    description: |
+      At least two clocks::
+        - Main PHY clock (same as USB DRD controller i.e. DWC3 IP clock), used
+          for register access.
+        - PHY reference clock (usually crystal clock), used for PHY operations,
+          associated by phy name. It is used to determine bit values for clock
+          settings register.  For Exynos5420 this is given as 'sclk_usbphy30'
+          in the CMU.
+
+  "#phy-cells":
+    const: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      Any connector to the data bus of this controller should be modelled using
+      the OF graph bindings specified.
+
+  reg:
+    maxItems: 1
+
+  samsung,pmu-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to PMU system controller interface.
+
+  vbus-supply:
+    description:
+      VBUS power source.
+
+  vbus-boost-supply:
+    description:
+      VBUS Boost 5V power source.
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - "#phy-cells"
+  - reg
+  - samsung,pmu-syscon
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos5433-usbdrd-phy
+              - samsung,exynos7-usbdrd-phy
+    then:
+      properties:
+        clocks:
+          minItems: 5
+          maxItems: 5
+        clock-names:
+          items:
+            - const: phy
+            - const: ref
+            - const: phy_utmi
+            - const: phy_pipe
+            - const: itp
+    else:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          items:
+            - const: phy
+            - const: ref
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/exynos5420.h>
+
+    phy@12100000 {
+        compatible = "samsung,exynos5420-usbdrd-phy";
+        reg = <0x12100000 0x100>;
+        #phy-cells = <1>;
+        clocks = <&clock CLK_USBD300>, <&clock CLK_SCLK_USBPHY300>;
+        clock-names = "phy", "ref";
+        samsung,pmu-syscon = <&pmu_system_controller>;
+        vbus-supply = <&usb300_vbus_reg>;
+    };
diff --git a/Documentation/devicetree/bindings/phy/samsung-phy.txt b/Documentation/devicetree/bindings/phy/samsung-phy.txt
deleted file mode 100644
index b0abeb4ac0a2..000000000000
--- a/Documentation/devicetree/bindings/phy/samsung-phy.txt
+++ /dev/null
@@ -1,53 +0,0 @@
-Samsung Exynos5 SoC series USB DRD PHY controller
---------------------------------------------------
-
-Required properties:
-- compatible : Should be set to one of the following supported values:
-	- "samsung,exynos5250-usbdrd-phy" - for exynos5250 SoC,
-	- "samsung,exynos5420-usbdrd-phy" - for exynos5420 SoC.
-	- "samsung,exynos5433-usbdrd-phy" - for exynos5433 SoC.
-	- "samsung,exynos7-usbdrd-phy" - for exynos7 SoC.
-- reg : Register offset and length of USB DRD PHY register set;
-- clocks: Clock IDs array as required by the controller
-- clock-names: names of clocks correseponding to IDs in the clock property;
-	       Required clocks:
-	- phy: main PHY clock (same as USB DRD controller i.e. DWC3 IP clock),
-	       used for register access.
-	- ref: PHY's reference clock (usually crystal clock), used for
-	       PHY operations, associated by phy name. It is used to
-	       determine bit values for clock settings register.
-	       For Exynos5420 this is given as 'sclk_usbphy30' in CMU.
-	- optional clocks: Exynos5433 & Exynos7 SoC has now following additional
-			   gate clocks available:
-			   - phy_pipe: for PIPE3 phy
-			   - phy_utmi: for UTMI+ phy
-			   - itp: for ITP generation
-- samsung,pmu-syscon: phandle for PMU system controller interface, used to
-		      control pmu registers for power isolation.
-- #phy-cells : from the generic PHY bindings, must be 1;
-
-For "samsung,exynos5250-usbdrd-phy" and "samsung,exynos5420-usbdrd-phy"
-compatible PHYs, the second cell in the PHY specifier identifies the
-PHY id, which is interpreted as follows:
-  0 - UTMI+ type phy,
-  1 - PIPE3 type phy,
-
-Example:
-	usbdrd_phy: usbphy@12100000 {
-		compatible = "samsung,exynos5250-usbdrd-phy";
-		reg = <0x12100000 0x100>;
-		clocks = <&clock 286>, <&clock 1>;
-		clock-names = "phy", "ref";
-		samsung,pmu-syscon = <&pmu_system_controller>;
-		#phy-cells = <1>;
-	};
-
-- aliases: For SoCs like Exynos5420 having multiple USB 3.0 DRD PHY controllers,
-	   'usbdrd_phy' nodes should have numbered alias in the aliases node,
-	   in the form of usbdrdphyN, N = 0, 1... (depending on number of
-	   controllers).
-Example:
-	aliases {
-		usbdrdphy0 = &usb3_phy0;
-		usbdrdphy1 = &usb3_phy1;
-	};
-- 
2.32.0

