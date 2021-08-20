Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A07223F2E7F
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 20 Aug 2021 17:04:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240951AbhHTPFY (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 20 Aug 2021 11:05:24 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:60600
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240953AbhHTPFY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Aug 2021 11:05:24 -0400
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3BBA240202
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Aug 2021 15:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629471885;
        bh=Q4bywyC7UewzTV+MQFN+uCdHpvQHcyElXiuKGQcww6Q=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=pRSSgpsE+YAHgJ2wzKudMlU0ELeMaaIWdyua0cwIdMqIywmHj5QhMS8bIoojiJiQj
         f2FP4+dOAjc3XM9SvrKAETg8KNd1ollPu5+c3UmuH2u80vbJpOjeU0CtFog4EmNMGj
         v0X8wOLcq28HtHyQwrnamZJ7glxr5t3L3bA7wTBlWIFy1S6UcP2xzTfm0DTd8OUdtN
         dnZi0IEgqmOE4l7DGasHIAdsiLUT9d0FN7a9CYpTifYOxqb4v5gKh7cpe+6Xmx/VDX
         u9hFE2v8wfWtLa7vrgli5O3jsKNJLhEVsSwAP4/a9B20kaMzXsN4cWPX+5f1cJZUAJ
         xROzaMiONA9zQ==
Received: by mail-ed1-f70.google.com with SMTP id k13-20020aa7c04d000000b003bf04c03fc4so4697992edo.22
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Aug 2021 08:04:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q4bywyC7UewzTV+MQFN+uCdHpvQHcyElXiuKGQcww6Q=;
        b=nsRUgFLxmJXTlXQb32faSZrp0iTyuXiH4NQaoObUG1AbhVTy6eDDfUcCxhoAC08tms
         6uXPec+Aujn/2u7d42mbtcCjhQBMZt5O+4SLx4IXAMV7N4CfNDP4c3gZlolW18qGisqB
         ei35JX3NkzU1B1NBeoA0hQzhegBNK9De81mU8bkWy5TTPr7bIjSkInOSzpLd2CQlrhcZ
         LN4vC8peBESRtiHE1Y2yeVqMDUEqLt0vjeFSFtLi7ryNL4BlwHq4iwwoB52FYPNGSdno
         kBIN7trEEh0NtiSsmQ1bTF3SpMzLEQO77Z1ByRPpLWvmtCBrd19HhvgbrMH57Ti3kPjy
         YX8A==
X-Gm-Message-State: AOAM530JykFWSRCSSspIxlto5SuswRx3AM/zAWCJken+uBCbdwxzFc+H
        RIztMH1pC+49AMs+pbjtZb6mHudnx1ufpPdu59SxRWqD2myvVtb++N8tZY7oNbkkYtRR9WlJ1jD
        jxzIduPaWYn6TYpSHLzbfh50ayGMD0GTH0CrerR4qLsE+9IZK
X-Received: by 2002:a05:6402:4cb:: with SMTP id n11mr22599469edw.292.1629471884979;
        Fri, 20 Aug 2021 08:04:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8+g4RTCfx6bbgnVK47oGQHaFdzl3eiT1whUbYdVBDa+CRr+lDNwbM7mge/61Vwch8hFXB5Q==
X-Received: by 2002:a05:6402:4cb:: with SMTP id n11mr22599453edw.292.1629471884755;
        Fri, 20 Aug 2021 08:04:44 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id ck17sm3690735edb.88.2021.08.20.08.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 08:04:44 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: devfreq: event: convert Samsung Exynos NoCP to dtschema
Date:   Fri, 20 Aug 2021 17:03:50 +0200
Message-Id: <20210820150353.161161-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Convert Samsung Exynos NoC Probe bindings to DT schema format using
json-schema.

New bindings contain copied description from previous bindings document,
therefore the license is set as GPL-2.0-only.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Changes since v1:
1. New patch
---
 .../bindings/devfreq/event/exynos-nocp.txt    | 26 ----------
 .../devfreq/event/samsung,exynos-nocp.yaml    | 48 +++++++++++++++++++
 2 files changed, 48 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/devfreq/event/exynos-nocp.txt
 create mode 100644 Documentation/devicetree/bindings/devfreq/event/samsung,exynos-nocp.yaml

diff --git a/Documentation/devicetree/bindings/devfreq/event/exynos-nocp.txt b/Documentation/devicetree/bindings/devfreq/event/exynos-nocp.txt
deleted file mode 100644
index aeaebd425d1f..000000000000
--- a/Documentation/devicetree/bindings/devfreq/event/exynos-nocp.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-
-* Samsung Exynos NoC (Network on Chip) Probe device
-
-The Samsung Exynos542x SoC has NoC (Network on Chip) Probe for NoC bus.
-NoC provides the primitive values to get the performance data. The packets
-that the Network on Chip (NoC) probes detects are transported over
-the network infrastructure to observer units. You can configure probes to
-capture packets with header or data on the data request response network,
-or as traffic debug or statistic collectors. Exynos542x bus has multiple
-NoC probes to provide bandwidth information about behavior of the SoC
-that you can use while analyzing system performance.
-
-Required properties:
-- compatible: Should be "samsung,exynos5420-nocp"
-- reg: physical base address of each NoC Probe and length of memory mapped region.
-
-Optional properties:
-- clock-names : the name of clock used by the NoC Probe, "nocp"
-- clocks : phandles for clock specified in "clock-names" property
-
-Example : NoC Probe nodes in Device Tree are listed below.
-
-	nocp_mem0_0: nocp@10ca1000 {
-		compatible = "samsung,exynos5420-nocp";
-		reg = <0x10CA1000 0x200>;
-	};
diff --git a/Documentation/devicetree/bindings/devfreq/event/samsung,exynos-nocp.yaml b/Documentation/devicetree/bindings/devfreq/event/samsung,exynos-nocp.yaml
new file mode 100644
index 000000000000..d318fccf78f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/devfreq/event/samsung,exynos-nocp.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/devfreq/event/samsung,exynos-nocp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos NoC (Network on Chip) Probe
+
+maintainers:
+  - Chanwoo Choi <cw00.choi@samsung.com>
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+description: |
+  The Samsung Exynos542x SoC has a NoC (Network on Chip) Probe for NoC bus.
+  NoC provides the primitive values to get the performance data. The packets
+  that the Network on Chip (NoC) probes detects are transported over the
+  network infrastructure to observer units. You can configure probes to capture
+  packets with header or data on the data request response network, or as
+  traffic debug or statistic collectors. Exynos542x bus has multiple NoC probes
+  to provide bandwidth information about behavior of the SoC that you can use
+  while analyzing system performance.
+
+properties:
+  compatible:
+    const: samsung,exynos5420-nocp
+
+  clock-names:
+    items:
+      - const: nocp
+
+  clocks:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    nocp_mem0_0: nocp@10ca1000 {
+        compatible = "samsung,exynos5420-nocp";
+        reg = <0x10ca1000 0x200>;
+    };
-- 
2.30.2

