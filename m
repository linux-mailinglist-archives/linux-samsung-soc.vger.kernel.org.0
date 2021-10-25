Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C93AB43990E
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 25 Oct 2021 16:48:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233386AbhJYOuV (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 25 Oct 2021 10:50:21 -0400
Received: from marcansoft.com ([212.63.210.85]:38514 "EHLO mail.marcansoft.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233367AbhJYOuO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 25 Oct 2021 10:50:14 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: hector@marcansoft.com)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 67C3C419B4;
        Mon, 25 Oct 2021 14:47:39 +0000 (UTC)
From:   Hector Martin <marcan@marcan.st>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Hector Martin <marcan@marcan.st>, Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Johan Hovold <johan@kernel.org>, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        Mark Kettenis <kettenis@openbsd.org>
Subject: [PATCH v2 3/8] dt-bindings: power: Add apple,pmgr-pwrstate binding
Date:   Mon, 25 Oct 2021 23:47:13 +0900
Message-Id: <20211025144718.157794-4-marcan@marcan.st>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211025144718.157794-1-marcan@marcan.st>
References: <20211025144718.157794-1-marcan@marcan.st>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This syscon child node represents a single SoC device controlled by the
PMGR block. This layout allows us to declare all device power state
controls (power/clock gating and reset) in the device tree, including
dependencies, instead of hardcoding it into the driver. The register
layout is uniform.

Each pmgr-pwrstate node provides genpd and reset features, to be
consumed by downstream device nodes.

Future SoCs are expected to use backwards compatible registers, and the
"apple,pmgr-pwrstate" represents any such interfaces (possibly with
additional features gated by the more specific compatible), allowing
them to be bound without driver updates. If a backwards incompatible
change is introduced in future SoCs, it will require a new compatible,
such as "apple,pmgr-pwrstate-v2".

Reviewed-by: Mark Kettenis <kettenis@openbsd.org>
Signed-off-by: Hector Martin <marcan@marcan.st>
---
 .../bindings/power/apple,pmgr-pwrstate.yaml   | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml

diff --git a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
new file mode 100644
index 000000000000..010f8b641304
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple SoC PMGR Power States
+
+maintainers:
+  - Hector Martin <marcan@marcan.st>
+
+allOf:
+  - $ref: "power-domain.yaml#"
+
+description: |
+  Apple SoCs include a PMGR block responsible for power management,
+  which can control various clocks, resets, power states, and
+  performance features. This binding describes the device power
+  state registers, which control power states and resets.
+
+  Each instance of a power controller within the PMGR syscon node
+  represents a generic power domain provider, as documented in
+  Documentation/devicetree/bindings/power/power-domain.yaml.
+  The provider controls a single SoC block. The power hierarchy is
+  represented via power-domains relationships between these nodes.
+
+  See Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
+  for the top-level PMGR node documentation.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - apple,t8103-pmgr-pwrstate
+      - const: apple,pmgr-pwrstate
+
+  reg:
+    maxItems: 1
+
+  "#power-domain-cells":
+    const: 0
+
+  "#reset-cells":
+    const: 0
+
+  power-domains:
+    description:
+      Reference to parent power domains. A domain may have multiple parents,
+      and all will be powered up when it is powered.
+    minItems: 1
+
+  label:
+    description: |
+      Specifies the name of the SoC domain being controlled. This is used to
+      name the power/reset domains.
+
+  apple,always-on:
+    description: |
+      Forces this power domain to always be powered up.
+    type: boolean
+
+required:
+  - compatible
+  - reg
+  - "#power-domain-cells"
+  - "#reset-cells"
+  - label
+
+additionalProperties: false
-- 
2.33.0

