Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 616954AAFD4
	for <lists+linux-samsung-soc@lfdr.de>; Sun,  6 Feb 2022 15:04:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbiBFOEP (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 6 Feb 2022 09:04:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235128AbiBFOEO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 6 Feb 2022 09:04:14 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34B15C043182
        for <linux-samsung-soc@vger.kernel.org>; Sun,  6 Feb 2022 06:04:12 -0800 (PST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 079333FFD5
        for <linux-samsung-soc@vger.kernel.org>; Sun,  6 Feb 2022 13:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644155894;
        bh=LVkBfcJOPMoVnmBu9J91WfcjMU5SYQeGsSEAA+YrpAs=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=b7CMfLmUtPDpDL13/X1SyFAStIj5f3aS+wcEZ4ReR9qWWusiXLpW2T8ffPTMKqUR/
         0AbC7WfOM86zGKcaIzwq5fD5AehjScxw1lIjfoBAARUK2saUy2rGiQfXKJuuu5krN+
         qYYzfoooJng3Tn0IahQxMPTXOJPnyEc6ByDupcrKlEgVAonh+PIiV0IOJmm18ZKoP4
         UmaF9QSAZLHkCmOeknErr+8sFMDpnjBxMK4uprzzGTX8B8ZYMKTP51lgMNXbe7pife
         Vl7ji0JmOrZDI94IQ7VbClFYEyaRgQxRnHw8qBNhwOljLquRgoiKAhJBrGRC2d4Fi4
         S+vwYga19M5KA==
Received: by mail-wm1-f69.google.com with SMTP id m3-20020a7bcb83000000b0034f75d92f27so4242819wmi.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 06 Feb 2022 05:58:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LVkBfcJOPMoVnmBu9J91WfcjMU5SYQeGsSEAA+YrpAs=;
        b=qzuq73qf8st5pBM536yLCfSsCEn+CrqOBlGvnIb6QnGuoN4+OPCoofo3/mMi7K0ub4
         wdw4/ueBxCZi4oNoQnOxRXU+Tw77/wyhl+16cWTHGqpUDml0aTrrtQ6tP8Xxk+OcypXF
         88pprneP2CHoIdOItYGLV7+RdQUPHQG2Fika6j78dEgCIuO6IHxVhIzDVNhFwkTUlxEq
         8DYTCjSkbl0VEZq0Dfdsl2VpjL1LOpclZebHVS13EhphcMFSh1W4f24vjQqdz1E5COBG
         cURBqlrz134CLxILIYGQiHM02+A1buqHHD0accXzBk0LjJ7KLecXlhViDDiqv/SUGr8L
         cNkA==
X-Gm-Message-State: AOAM531F1IphM4XT6G9mQJZBS7h2U/5u/8f09SDlZimJF84HgJgVZThR
        PEF4970o6UFIw9Qm77ebjN1eNO25jtAPdo5VTGV2f1pnNm90nkmbc+FP/jYhBnTvgG5+06R2RBf
        Ryd67nIqiOOuNZfkreS16pklBrddfYVdQY7t7VDn0lEOF3Vdb
X-Received: by 2002:a05:600c:1f06:: with SMTP id bd6mr10672605wmb.117.1644155893034;
        Sun, 06 Feb 2022 05:58:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYAnQuw3LCcmq/e4CR+JXZGoGIgFwhwnXz5ZwEcWLTAFqDgscNcdXs2ZRPGLL13HutYDee4Q==
X-Received: by 2002:a05:600c:1f06:: with SMTP id bd6mr10672589wmb.117.1644155892812;
        Sun, 06 Feb 2022 05:58:12 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id e9sm8296888wrg.60.2022.02.06.05.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 05:58:12 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 1/8] dt-bindings: memory: lpddr2-timings: convert to dtschema
Date:   Sun,  6 Feb 2022 14:58:00 +0100
Message-Id: <20220206135807.211767-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220206135807.211767-1-krzysztof.kozlowski@canonical.com>
References: <20220206135807.211767-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Convert the LPDDR2 memory timings bindings to DT schema format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../ddr/jedec,lpddr2-timings.yaml             | 135 ++++++++++++++++++
 .../memory-controllers/ddr/jedec,lpddr2.yaml  |   6 +-
 .../memory-controllers/ddr/lpddr2-timings.txt |  52 -------
 3 files changed, 137 insertions(+), 56 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2-timings.yaml
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/ddr/lpddr2-timings.txt

diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2-timings.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2-timings.yaml
new file mode 100644
index 000000000000..f3e62ee07126
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2-timings.yaml
@@ -0,0 +1,135 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/ddr/jedec,lpddr2-timings.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LPDDR2 SDRAM AC timing parameters for a given speed-bin
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+properties:
+  compatible:
+    const: jedec,lpddr2-timings
+
+  max-freq:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Maximum DDR clock frequency for the speed-bin, in Hz.
+
+  min-freq:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Minimum DDR clock frequency for the speed-bin, in Hz.
+
+  tCKESR:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      CKE minimum pulse width during SELF REFRESH (low pulse width during
+      SELF REFRESH) in pico seconds.
+
+  tDQSCK-max:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      DQS output data access time from CK_t/CK_c in pico seconds.
+
+  tDQSCK-max-derated:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      DQS output data access time from CK_t/CK_c, temperature de-rated, in pico
+      seconds.
+
+  tFAW:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Four-bank activate window in pico seconds.
+
+  tRAS-max-ns:
+    description: |
+      Row active time in nano seconds.
+
+  tRAS-min:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Row active time in pico seconds.
+
+  tRCD:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      RAS-to-CAS delay in pico seconds.
+
+  tRPab:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Row precharge time (all banks) in pico seconds.
+
+  tRRD:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Active bank A to active bank B in pico seconds.
+
+  tRTP:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Internal READ to PRECHARGE command delay in pico seconds.
+
+  tWR:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      WRITE recovery time in pico seconds.
+
+  tWTR:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Internal WRITE-to-READ command delay in pico seconds.
+
+  tXP:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Exit power-down to next valid command delay in pico seconds.
+
+  tZQCL:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Long calibration time in pico seconds.
+
+  tZQCS:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Short calibration time in pico seconds.
+
+  tZQinit:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Initialization calibration time in pico seconds.
+
+required:
+  - compatible
+  - min-freq
+  - max-freq
+
+additionalProperties: false
+
+examples:
+  - |
+    timings {
+        compatible = "jedec,lpddr2-timings";
+        min-freq = <10000000>;
+        max-freq = <400000000>;
+        tCKESR = <15000>;
+        tDQSCK-max = <5500>;
+        tFAW = <50000>;
+        tRAS-max-ns = <70000>;
+        tRAS-min = <42000>;
+        tRPab = <21000>;
+        tRCD = <18000>;
+        tRRD = <10000>;
+        tRTP = <7500>;
+        tWR = <15000>;
+        tWTR = <7500>;
+        tXP = <7500>;
+        tZQCL = <360000>;
+        tZQCS = <90000>;
+        tZQinit = <1000000>;
+    };
diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
index 25ed0266f6dd..2d8a701e2a05 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
@@ -142,14 +142,12 @@ properties:
 
 patternProperties:
   "^lpddr2-timings":
-    type: object
+    $ref: jedec,lpddr2-timings.yaml
     description: |
       The lpddr2 node may have one or more child nodes of type "lpddr2-timings".
       "lpddr2-timings" provides AC timing parameters of the device for
       a given speed-bin. The user may provide the timings for as many
-      speed-bins as is required. Please see Documentation/devicetree/
-      bindings/memory-controllers/ddr/lpddr2-timings.txt for more information
-      on "lpddr2-timings".
+      speed-bins as is required.
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/lpddr2-timings.txt b/Documentation/devicetree/bindings/memory-controllers/ddr/lpddr2-timings.txt
deleted file mode 100644
index 9ceb19e0c7fd..000000000000
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/lpddr2-timings.txt
+++ /dev/null
@@ -1,52 +0,0 @@
-* AC timing parameters of LPDDR2(JESD209-2) memories for a given speed-bin
-
-Required properties:
-- compatible : Should be "jedec,lpddr2-timings"
-- min-freq : minimum DDR clock frequency for the speed-bin. Type is <u32>
-- max-freq : maximum DDR clock frequency for the speed-bin. Type is <u32>
-
-Optional properties:
-
-The following properties represent AC timing parameters from the memory
-data-sheet of the device for a given speed-bin. All these properties are
-of type <u32> and the default unit is ps (pico seconds). Parameters with
-a different unit have a suffix indicating the unit such as 'tRAS-max-ns'
-- tRCD
-- tWR
-- tRAS-min
-- tRRD
-- tWTR
-- tXP
-- tRTP
-- tDQSCK-max
-- tFAW
-- tZQCS
-- tZQinit
-- tRPab
-- tZQCL
-- tCKESR
-- tRAS-max-ns
-- tDQSCK-max-derated
-
-Example:
-
-timings_elpida_ECB240ABACN_400mhz: lpddr2-timings@0 {
-	compatible	= "jedec,lpddr2-timings";
-	min-freq	= <10000000>;
-	max-freq	= <400000000>;
-	tRPab		= <21000>;
-	tRCD		= <18000>;
-	tWR		= <15000>;
-	tRAS-min	= <42000>;
-	tRRD		= <10000>;
-	tWTR		= <7500>;
-	tXP		= <7500>;
-	tRTP		= <7500>;
-	tCKESR		= <15000>;
-	tDQSCK-max	= <5500>;
-	tFAW		= <50000>;
-	tZQCS		= <90000>;
-	tZQCL		= <360000>;
-	tZQinit		= <1000000>;
-	tRAS-max-ns	= <70000>;
-};
-- 
2.32.0

