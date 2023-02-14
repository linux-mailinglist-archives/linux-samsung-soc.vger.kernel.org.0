Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C82BE69614D
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 14 Feb 2023 11:47:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232698AbjBNKrZ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 14 Feb 2023 05:47:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232624AbjBNKrW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 14 Feb 2023 05:47:22 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0985672BA
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Feb 2023 02:46:58 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id o15so11839562wrc.9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Feb 2023 02:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCo2DziRHqvL6Z7ah+Rl26+iD4J12UJugALebr5QXhQ=;
        b=YW0B2QmBi6IF1xn8LAx1zAOaBvC9pLzkgQGAS4oz3HP6Hih+8sT9wE4G/NliKSQgvQ
         CTuRDpI7F+tORRl38bDSCXjf3CmNJrS/sEy+prU7H04qHjINiFV8l/x+KdwEUF1dJaMa
         mLF7+t85klx4X8CnVQa38+uzbRN9yxNJyganRvponHGi+1AacuHoGfJFgHe0fL6IqpIo
         pWj7kEB5mY79gveIraJeeu3d1h5nZQzvAht4AU+CL8zoBTyDZHZCdpErUEgRKLZxsaPY
         c0K3IULZVv+0tTCYZOxfg07cruOKupt/B/UOP1zdyOu6PuVKpyMuPIjBgvglp1rRzYTR
         KAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GCo2DziRHqvL6Z7ah+Rl26+iD4J12UJugALebr5QXhQ=;
        b=Av1GHRihkOT7OgBHVz7sV8eXodwc9T0Wcmzg8TyJD3yLADdjH7lL7USnm5YOYr8DDw
         0BGzl2K4UQOYqcKAc5vIclupv2ZcbgGQzNrCL1l/nyH7Htd/cVwFBEonvIe9DyXdFgIP
         1ssebi6nVy1TspOz+xROyq0p7NN7D0LWTZOk4oHa+hReMfTr7eodKbxQYwFLxXJlyhr9
         pOQ8z9k7hZaDilQx9bmULyh3nm2G9wSrMWyz2qATGb6Baw4dh8f2uvTujw0MGApROB7G
         xnULPd825g7d+QEuHQ8hNI4346+Vq414EpiUm1YtVe0sUMJCqFyHABpKksnUGDCSQqvo
         Wjvg==
X-Gm-Message-State: AO0yUKXjnxWsk1E45PniHoLt8vhLJ6epjQ0+AwBbRKfHgugsaZ4xnCnO
        oDlE/Q1oAeVNgf3BCPpMBQ/MrA==
X-Google-Smtp-Source: AK7set/wyO4Bakvoyo6rJ+ZaDF8LsJzrWzYOpRlXYnsksFiY2pR0nSYWwD71U/NIT9r4DqoTUDN01g==
X-Received: by 2002:a5d:6b8e:0:b0:2c4:873:16b4 with SMTP id n14-20020a5d6b8e000000b002c4087316b4mr1666642wrx.16.1676371615335;
        Tue, 14 Feb 2023 02:46:55 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m20-20020a05600c4f5400b003e1f319b87bsm2623719wmq.24.2023.02.14.02.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 02:46:55 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 3/7] media: dt-bindings: samsung,exynos4210-csis: convert to dtschema
Date:   Tue, 14 Feb 2023 11:45:04 +0100
Message-Id: <20230214104508.51955-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230214104508.51955-1-krzysztof.kozlowski@linaro.org>
References: <20230214104508.51955-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Convert the Samsung S5P/Exynos SoC series MIPI CSI-2 receiver (MIPI
CSIS) bindings to DT schema.  Changes during conversion - adjust to
existing DTS and Linux driver:
1. Add phys and power-domains.
2. Move samsung,csis-wclk property to the endpoint node.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../media/samsung,exynos4210-csis.yaml        | 170 ++++++++++++++++++
 .../bindings/media/samsung-mipi-csis.txt      |  81 ---------
 MAINTAINERS                                   |   1 +
 3 files changed, 171 insertions(+), 81 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/samsung,exynos4210-csis.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/samsung-mipi-csis.txt

diff --git a/Documentation/devicetree/bindings/media/samsung,exynos4210-csis.yaml b/Documentation/devicetree/bindings/media/samsung,exynos4210-csis.yaml
new file mode 100644
index 000000000000..6e3f730f97ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/samsung,exynos4210-csis.yaml
@@ -0,0 +1,170 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/samsung,exynos4210-csis.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5P/Exynos SoC series MIPI CSI-2 receiver (MIPI CSIS)
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+  - Sylwester Nawrocki <s.nawrocki@samsung.com>
+
+properties:
+  compatible:
+    enum:
+      - samsung,s5pv210-csis
+      - samsung,exynos4210-csis
+      - samsung,exynos4212-csis
+      - samsung,exynos5250-csis
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  bus-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [2, 4]
+    description:
+      Number of data lines supported.
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: csis
+      - const: sclk_csis
+
+  clock-frequency:
+    default: 166000000
+    description:
+      The IP's main (system bus) clock frequency in Hz.
+
+  interrupts:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    items:
+      - const: csis
+
+  power-domains:
+    maxItems: 1
+
+  '#size-cells':
+    const: 0
+
+  vddio-supply:
+    description: MIPI CSIS I/O and PLL voltage supply (e.g. 1.8V).
+
+  vddcore-supply:
+    description: MIPI CSIS Core voltage supply (e.g. 1.1V).
+
+patternProperties:
+  "^port@[34]$":
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+    description:
+      Camera input port.
+
+    properties:
+      reg:
+        enum: [3, 4]
+
+      endpoint:
+        $ref: video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            minItems: 1
+            maxItems: 4
+
+          samsung,csis-hs-settle:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: Differential receiver (HS-RX) settle time.
+
+          samsung,csis-wclk:
+            type: boolean
+            description:
+              CSI-2 wrapper clock selection. If this property is present external clock
+              from CMU will be used, or the bus clock if it's not specified.
+
+        required:
+          - data-lanes
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - bus-width
+  - clocks
+  - clock-names
+  - interrupts
+  - vddio-supply
+  - vddcore-supply
+
+anyOf:
+  - required:
+      - port@3
+  - required:
+      - port@4
+
+allOf:
+  - if:
+      required:
+        - samsung,isp-wb
+    then:
+      required:
+        - samsung,sysreg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/exynos4.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    csis@11890000 {
+        compatible = "samsung,exynos4210-csis";
+        reg = <0x11890000 0x4000>;
+        clocks = <&clock CLK_CSIS1>,
+                 <&clock CLK_SCLK_CSIS1>;
+        clock-names = "csis", "sclk_csis";
+        assigned-clocks = <&clock CLK_MOUT_CSIS1>,
+                          <&clock CLK_SCLK_CSIS1>;
+        assigned-clock-parents = <&clock CLK_MOUT_MPLL_USER_T>;
+        assigned-clock-rates = <0>, <176000000>;
+
+        interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+
+        bus-width = <2>;
+        power-domains = <&pd_cam>;
+        phys = <&mipi_phy 2>;
+        phy-names = "csis";
+
+        vddcore-supply = <&ldo8_reg>;
+        vddio-supply = <&ldo10_reg>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        /* Camera D (4) MIPI CSI-2 (CSIS1) */
+        port@4 {
+            reg = <4>;
+
+            endpoint {
+                remote-endpoint = <&is_s5k6a3_ep>;
+                data-lanes = <1>;
+                samsung,csis-hs-settle = <18>;
+                samsung,csis-wclk;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/media/samsung-mipi-csis.txt b/Documentation/devicetree/bindings/media/samsung-mipi-csis.txt
deleted file mode 100644
index a4149c9434ea..000000000000
--- a/Documentation/devicetree/bindings/media/samsung-mipi-csis.txt
+++ /dev/null
@@ -1,81 +0,0 @@
-Samsung S5P/Exynos SoC series MIPI CSI-2 receiver (MIPI CSIS)
--------------------------------------------------------------
-
-Required properties:
-
-- compatible	  : "samsung,s5pv210-csis" for S5PV210 (S5PC110),
-		    "samsung,exynos4210-csis" for Exynos4210 (S5PC210),
-		    "samsung,exynos4212-csis" for Exynos4212/Exynos4412,
-		    "samsung,exynos5250-csis" for Exynos5250;
-- reg		  : offset and length of the register set for the device;
-- interrupts      : should contain MIPI CSIS interrupt; the format of the
-		    interrupt specifier depends on the interrupt controller;
-- bus-width	  : maximum number of data lanes supported (SoC specific);
-- vddio-supply    : MIPI CSIS I/O and PLL voltage supply (e.g. 1.8V);
-- vddcore-supply  : MIPI CSIS Core voltage supply (e.g. 1.1V);
-- clocks	  : list of clock specifiers, corresponding to entries in
-		    clock-names property;
-- clock-names	  : must contain "csis", "sclk_csis" entries, matching entries
-		    in the clocks property.
-
-Optional properties:
-
-- clock-frequency : The IP's main (system bus) clock frequency in Hz, default
-		    value when this property is not specified is 166 MHz;
-- samsung,csis-wclk : CSI-2 wrapper clock selection. If this property is present
-		    external clock from CMU will be used, or the bus clock if
-		    if it's not specified.
-
-The device node should contain one 'port' child node with one child 'endpoint'
-node, according to the bindings defined in Documentation/devicetree/bindings/
-media/video-interfaces.txt. The following are properties specific to those nodes.
-
-port node
----------
-
-- reg		  : (required) must be 3 for camera C input (CSIS0) or 4 for
-		    camera D input (CSIS1);
-
-endpoint node
--------------
-
-- data-lanes	  : (required) an array specifying active physical MIPI-CSI2
-		    data input lanes and their mapping to logical lanes; the
-		    array's content is unused, only its length is meaningful;
-
-- samsung,csis-hs-settle : (optional) differential receiver (HS-RX) settle time;
-
-
-Example:
-
-	reg0: regulator@0 {
-	};
-
-	reg1: regulator@1 {
-	};
-
-/* SoC properties */
-
-	csis_0: csis@11880000 {
-		compatible = "samsung,exynos4210-csis";
-		reg = <0x11880000 0x1000>;
-		interrupts = <0 78 0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-	};
-
-/* Board properties */
-
-	csis_0: csis@11880000 {
-		clock-frequency = <166000000>;
-		vddio-supply = <&reg0>;
-		vddcore-supply = <&reg1>;
-		port {
-			reg = <3>; /* 3 - CSIS0, 4 - CSIS1 */
-			csis0_ep: endpoint {
-				remote-endpoint = <...>;
-				data-lanes = <1>, <2>;
-				samsung,csis-hs-settle = <12>;
-			};
-		};
-	};
diff --git a/MAINTAINERS b/MAINTAINERS
index 57d1d6ecb33d..0882e304c8f9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18465,6 +18465,7 @@ M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 L:	linux-media@vger.kernel.org
 S:	Supported
 Q:	https://patchwork.linuxtv.org/project/linux-media/list/
+F:	Documentation/devicetree/bindings/media/samsung,exynos4210-csis.yaml
 F:	drivers/media/platform/samsung/exynos4-is/
 
 SAMSUNG SOC CLOCK DRIVERS
-- 
2.34.1

