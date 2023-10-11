Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3889A7C5BAE
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 11 Oct 2023 20:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232906AbjJKStU (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 11 Oct 2023 14:49:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233113AbjJKStT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 11 Oct 2023 14:49:19 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 828D4E4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Oct 2023 11:49:16 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-405505b07dfso8641265e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Oct 2023 11:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697050154; x=1697654954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SoVOvO+HhSsoq19LsROPka7B36EoNgSJo0nrfJ5P9FA=;
        b=ICTeRfld0/4R+TGWHfUpxVyen/shAQYl+FTElbRm/0IH5tc9x/GxI+Ui6lrMKdwnWP
         C9lhlwUmHsBmrn5xGlAtFgNPZ/1hcsEoMwD1Gg8wNHiUYwlnMyrvaUOYW7O58WeKKtPr
         8bX+r3mBD/cdIeI4ESnUrPJFVAUnlXtnFpc92LO1XwW+JDUINKIksR96DRb5tVGJyAVN
         QOEk8W2kvWxcJZsq4Tfo5JAjwTCCxRSyfcPC+yu7iyVhChRvBqOtBgBh8gSlkqPND+7G
         yQRoMjDuJ4Ay0MIH3PO3rcLmaQDBEI8z9DaH/WQnDzk+p1+/RZWwAdPJ0We24QCf9KQD
         64Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697050154; x=1697654954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SoVOvO+HhSsoq19LsROPka7B36EoNgSJo0nrfJ5P9FA=;
        b=DX6u7LVjP/ShcrI5uUYfKWpGL1aVjzNSZIbaqfMc05JxVWC9ZWeXCTVvx3DjAAshSz
         QzYjzUMlHe4UKsPwkdfFvt5Ok7z5MHBo/YHaMRVI2avI0qskpVenbvn3FEyJ/2gVXqRb
         qgcMOe8QdE8uatRQH7muNbIp8iSyASSlJ+NFXEuZgfaq4BR0TgcdtmK9947eP10bFLwK
         WP4vtReWHfkR6nwfHXdGYL0ux9KyOQUIf7hybty2IjK2PWhRSww/5+9FXEiAJfZ2gXlL
         5bNJRRaUGYnzKj1YTPHmi7qFA+xgjbmxvR8hT2dWS/QPtOYhrDgFol4+iyaNDWOGh/aa
         +YOA==
X-Gm-Message-State: AOJu0Yym5wzQWDydrqqUHExF0dj8aJEr2NSuZTz4OgNL5ij2ADFLz3/J
        9ofS6RS8JotIfdvwx5bUPpshdg==
X-Google-Smtp-Source: AGHT+IFrnpRSngP1sOv1xKm4uNcemTLB1tpDSpobmKkrfH11DGTb18MuBv5/Skb5Fw8N0IkJ+W8XHw==
X-Received: by 2002:a5d:60cb:0:b0:32d:840f:dc2e with SMTP id x11-20020a5d60cb000000b0032d840fdc2emr2586533wrt.24.1697050154591;
        Wed, 11 Oct 2023 11:49:14 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id v6-20020adff686000000b0031980294e9fsm16003875wrp.116.2023.10.11.11.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 11:49:13 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: [PATCH v3 02/20] dt-bindings: clock: Add Google gs101 clock management unit bindings
Date:   Wed, 11 Oct 2023 19:48:05 +0100
Message-ID: <20231011184823.443959-3-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
In-Reply-To: <20231011184823.443959-1-peter.griffin@linaro.org>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Provide dt-schema documentation for Google gs101 SoC clock controller.
Currently this adds support for cmu_top, cmu_misc and cmu_apm.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../bindings/clock/google,gs101-clock.yaml    | 125 ++++++++++
 include/dt-bindings/clock/google,gs101.h      | 232 ++++++++++++++++++
 2 files changed, 357 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 create mode 100644 include/dt-bindings/clock/google,gs101.h

diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
new file mode 100644
index 000000000000..f74494594b3b
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
@@ -0,0 +1,125 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/google,gs101-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google GS101 SoC clock controller
+
+maintainers:
+  - Peter Griffin <peter.griffin@linaro.org>
+
+description: |
+  Google GS101 clock controller is comprised of several CMU units, generating
+  clocks for different domains. Those CMU units are modeled as separate device
+  tree nodes, and might depend on each other. The root clock in that clock tree
+  is OSCCLK (24.576 MHz). That external clock must be defined as a fixed-rate
+  clock in dts.
+
+  CMU_TOP is a top-level CMU, where all base clocks are prepared using PLLs and
+  dividers; all other leaf clocks (other CMUs) are usually derived from CMU_TOP.
+
+  Each clock is assigned an identifier and client nodes can use this identifier
+  to specify the clock which they consume. All clocks available for usage
+  in clock consumer nodes are defined as preprocessor macros in
+  'dt-bindings/clock/gs101.h' header.
+
+properties:
+  compatible:
+    enum:
+      - google,gs101-cmu-top
+      - google,gs101-cmu-apm
+      - google,gs101-cmu-misc
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
+
+  "#clock-cells":
+    const: 1
+
+  reg:
+    maxItems: 1
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101-cmu-top
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (24.576 MHz)
+
+        clock-names:
+          items:
+            - const: oscclk
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101-cmu-misc
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (24.576 MHz)
+            - description: Misc bus clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: dout_cmu_misc_bus
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101-cmu-apm
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (24.576 MHz)
+
+        clock-names:
+          items:
+            - const: oscclk
+
+required:
+  - compatible
+  - "#clock-cells"
+  - clocks
+  - clock-names
+  - reg
+
+additionalProperties: false
+
+examples:
+  # Clock controller node for CMU_TOP
+  - |
+    #include <dt-bindings/clock/google,gs101.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <1>;
+
+        cmu_top: clock-controller@1e080000 {
+            compatible = "google,gs101-cmu-top";
+            reg = <0x0 0x1e080000 0x8000>;
+            #clock-cells = <1>;
+            clocks = <&ext_24_5m>;
+            clock-names = "oscclk";
+        };
+    };
+
+...
diff --git a/include/dt-bindings/clock/google,gs101.h b/include/dt-bindings/clock/google,gs101.h
new file mode 100644
index 000000000000..7765ba68f734
--- /dev/null
+++ b/include/dt-bindings/clock/google,gs101.h
@@ -0,0 +1,232 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2023 Linaro Ltd.
+ * Author: Peter Griffin <peter.griffin@linaro.org>
+ *
+ * Device Tree binding constants for Google gs101 clock controller.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_GOOGLE_GS101_H
+#define _DT_BINDINGS_CLOCK_GOOGLE_GS101_H
+
+/* CMU_TOP PLL*/
+#define CLK_FOUT_SHARED0_PLL		1
+#define CLK_FOUT_SHARED1_PLL		2
+#define CLK_FOUT_SHARED2_PLL		3
+#define CLK_FOUT_SHARED3_PLL		4
+#define CLK_FOUT_SPARE_PLL		5
+
+/* CMU_TOP MUX*/
+#define CLK_MOUT_SHARED0_PLL		6
+#define CLK_MOUT_SHARED1_PLL		7
+#define CLK_MOUT_SHARED2_PLL		8
+#define CLK_MOUT_SHARED3_PLL		9
+#define CLK_MOUT_SPARE_PLL		10
+#define CLK_MOUT_BUS0_BUS		11
+#define CLK_MOUT_CMU_BOOST		12
+#define CLK_MOUT_BUS1_BUS		13
+#define CLK_MOUT_BUS2_BUS		14
+#define CLK_MOUT_CORE_BUS		15
+#define CLK_MOUT_EH_BUS			16
+#define CLK_MOUT_CPUCL2_SWITCH		17
+#define CLK_MOUT_CPUCL1_SWITCH		18
+#define CLK_MOUT_CPUCL0_SWITCH		19
+#define CLK_MOUT_CPUCL0_DBG		20
+#define CLK_MOUT_CMU_HPM		21
+#define CLK_MOUT_G3D_SWITCH		22
+#define CLK_MOUT_G3D_GLB		23
+#define CLK_MOUT_DPU_BUS		24
+#define CLK_MOUT_DISP_BUS		25
+#define CLK_MOUT_G2D_G2D		26
+#define CLK_MOUT_G2D_MSCL		27
+#define CLK_MOUT_HSI0_USB31DRD		28
+#define CLK_MOUT_HSI0_BUS		29
+#define CLK_MOUT_HSI0_DPGTC		30
+#define CLK_MOUT_HSI0_USBDPDGB		31
+#define CLK_MOUT_HSI1_BUS		32
+#define CLK_MOUT_HSI1_PCIE		33
+#define CLK_MOUT_HSI2_BUS		34
+#define CLK_MOUT_HSI2_PCIE		35
+#define CLK_MOUT_HSI2_UFS_EMBD		36
+#define CLK_MOUT_HSI2_MMC_CARD		37
+#define CLK_MOUT_CSIS			38
+#define CLK_MOUT_PDP_BUS		39
+#define CLK_MOUT_PDP_VRA		40
+#define CLK_MOUT_IPP_BUS		41
+#define CLK_MOUT_G3AA			42
+#define CLK_MOUT_ITP			43
+#define CLK_MOUT_DNS_BUS		44
+#define CLK_MOUT_TNR_BUS		45
+#define CLK_MOUT_MCSC_ITSC		46
+#define CLK_MOUT_MCSC_MCSC		47
+#define CLK_MOUT_GDC_SCSC		48
+#define CLK_MOUT_GDC_GDC0		49
+#define CLK_MOUT_GDC_GDC1		50
+#define CLK_MOUT_MFC_MFC		51
+#define CLK_MOUT_MIF_SWITCH		52
+#define CLK_MOUT_MIF_BUS		53
+#define CLK_MOUT_MISC_BUS		54
+#define CLK_MOUT_MISC_SSS		55
+#define CLK_MOUT_PERIC0_IP		56
+#define CLK_MOUT_PERIC0_BUS		57
+#define CLK_MOUT_PERIC1_IP		58
+#define CLK_MOUT_PERIC1_BUS		59
+#define CLK_MOUT_TPU_TPU		60
+#define CLK_MOUT_TPU_TPUCTL		61
+#define CLK_MOUT_TPU_BUS		62
+#define CLK_MOUT_TPU_UART		63
+#define CLK_MOUT_TPU_HPM		64
+#define CLK_MOUT_BO_BUS			65
+#define CLK_MOUT_G3D_BUSD		66
+
+/* CMU_TOP Dividers*/
+#define CLK_DOUT_SHARED0_DIV3		67
+#define CLK_DOUT_SHARED0_DIV2		68
+#define CLK_DOUT_SHARED0_DIV4		69
+#define CLK_DOUT_SHARED0_DIV5		70
+#define CLK_DOUT_SHARED1_DIV3		71
+#define CLK_DOUT_SHARED1_DIV2		72
+#define CLK_DOUT_SHARED1_DIV4		73
+#define CLK_DOUT_SHARED2_DIV2		74
+#define CLK_DOUT_SHARED3_DIV2		75
+#define CLK_DOUT_BUS0_BUS		76
+#define CLK_DOUT_CMU_BOOST		77
+#define CLK_DOUT_BUS1_BUS		78
+#define CLK_DOUT_BUS2_BUS		79
+#define CLK_DOUT_CORE_BUS		80
+#define CLK_DOUT_EH_BUS			81
+#define CLK_DOUT_CPUCL2_SWITCH		82
+#define CLK_DOUT_CPUCL1_SWITCH		83
+#define CLK_DOUT_CPUCL0_SWITCH		84
+#define CLK_DOUT_CPUCL0_DBG		85
+#define CLK_DOUT_CMU_HPM		86
+#define CLK_DOUT_G3D_SWITCH		87
+#define CLK_DOUT_G3D_GLB		88
+#define CLK_DOUT_DPU_BUS		89
+#define CLK_DOUT_DISP_BUS		90
+#define CLK_DOUT_G2D_G2D		91
+#define CLK_DOUT_G2D_MSCL		92
+#define CLK_DOUT_HSI0_USB31DRD		93
+#define CLK_DOUT_HSI0_BUS		94
+#define CLK_DOUT_HSI0_DPGTC		95
+#define CLK_DOUT_HSI0_USBDPDGB		96
+#define CLK_DOUT_HSI1_BUS		97
+#define CLK_DOUT_HSI1_PCIE		98
+#define CLK_DOUT_HSI2_BUS		100
+#define CLK_DOUT_HSI2_PCIE		101
+#define CLK_DOUT_HSI2_UFS_EMBD		102
+#define CLK_DOUT_HSI2_MMC_CARD		103
+#define CLK_DOUT_CSIS			104
+#define CLK_DOUT_PDP_BUS		105
+#define CLK_DOUT_PDP_VRA		106
+#define CLK_DOUT_IPP_BUS		107
+#define CLK_DOUT_G3AA			108
+#define CLK_DOUT_ITP			109
+#define CLK_DOUT_DNS_BUS		110
+#define CLK_DOUT_TNR_BUS		111
+#define CLK_DOUT_MCSC_ITSC		112
+#define CLK_DOUT_MCSC_MCSC		113
+#define CLK_DOUT_GDC_SCSC		114
+#define CLK_DOUT_GDC_GDC0		115
+#define CLK_DOUT_GDC_GDC1		116
+#define CLK_DOUT_MFC_MFC		117
+#define CLK_DOUT_MIF_BUS		118
+#define CLK_DOUT_MISC_BUS		119
+#define CLK_DOUT_MISC_SSS		120
+#define CLK_DOUT_PERIC0_BUS		121
+#define CLK_DOUT_PERIC0_IP		122
+#define CLK_DOUT_PERIC1_BUS		123
+#define CLK_DOUT_PERIC1_IP		124
+#define CLK_DOUT_TPU_TPU		125
+#define CLK_DOUT_TPU_TPUCTL		126
+#define CLK_DOUT_TPU_BUS		127
+#define CLK_DOUT_TPU_UART		128
+#define CLK_DOUT_TPU_HPM		129
+#define CLK_DOUT_BO_BUS			130
+
+/* CMU_TOP Gates*/
+#define CLK_GOUT_BUS0_BUS		131
+#define CLK_GOUT_BUS1_BUS		132
+#define CLK_GOUT_BUS2_BUS		133
+#define CLK_GOUT_CORE_BUS		134
+#define CLK_GOUT_EH_BUS			135
+#define CLK_GOUT_CPUCL2_SWITCH		136
+#define CLK_GOUT_CPUCL1_SWITCH		137
+#define CLK_GOUT_CPUCL0_SWITCH		138
+#define CLK_GOUT_CPUCL0_DBG		139
+#define CLK_GOUT_CMU_HPM		140
+#define CLK_GOUT_G3D_SWITCH		141
+#define CLK_GOUT_G3D_GLB		142
+#define CLK_GOUT_DPU_BUS		143
+#define CLK_GOUT_DISP_BUS		144
+#define CLK_GOUT_G2D_G2D		145
+#define CLK_GOUT_G2D_MSCL		146
+#define CLK_GOUT_HSI0_USB31DRD		147
+#define CLK_GOUT_HSI0_BUS		148
+#define CLK_GOUT_HSI0_DPGTC		149
+#define CLK_GOUT_HSI0_USBDPDGB		150
+#define CLK_GOUT_HSI1_BUS		151
+#define CLK_GOUT_HSI1_PCIE		152
+#define CLK_GOUT_HSI2_BUS		153
+#define CLK_GOUT_HSI2_PCIE		154
+#define CLK_GOUT_HSI2_UFS_EMBD		155
+#define CLK_GOUT_HSI2_MMC_CARD		156
+#define CLK_GOUT_CSIS			157
+#define CLK_GOUT_PDP_BUS		158
+#define CLK_GOUT_PDP_VRA		159
+#define CLK_GOUT_IPP_BUS		160
+#define CLK_GOUT_G3AA			161
+#define CLK_GOUT_ITP			162
+#define CLK_GOUT_DNS_BUS		163
+#define CLK_GOUT_TNR_BUS		164
+#define CLK_GOUT_MCSC_ITSC		165
+#define CLK_GOUT_MCSC_MCSC		166
+#define CLK_GOUT_GDC_SCSC		167
+#define CLK_GOUT_GDC_GDC0		168
+#define CLK_GOUT_GDC_GDC1		169
+#define CLK_GOUT_MFC_MFC		170
+#define CLK_GOUT_MIF_SWITCH		171
+#define CLK_GOUT_MIF_BUS		172
+#define CLK_GOUT_MISC_BUS		173
+#define CLK_GOUT_MISC_SSS		174
+#define CLK_GOUT_PERIC0_BUS		175
+#define CLK_GOUT_PERIC0_IP		176
+#define CLK_GOUT_PERIC1_BUS		177
+#define CLK_GOUT_PERIC1_IP		178
+#define CLK_GOUT_TPU_TPU		179
+#define CLK_GOUT_TPU_TPUCTL		180
+#define CLK_GOUT_TPU_BUS		181
+#define CLK_GOUT_TPU_UART		182
+#define CLK_GOUT_TPU_HPM		183
+#define CLK_GOUT_BO_BUS			184
+#define CLK_GOUT_CMU_BOOST		185
+
+/* CMU_APM */
+
+#define CLK_MOUT_APM_FUNC					1
+#define CLK_MOUT_APM_FUNCSRC					2
+#define CLK_DOUT_APM_BOOST					3
+#define CLK_DOUT_APM_USI0_UART					4
+#define CLK_DOUT_APM_USI0_USI					5
+#define CLK_DOUT_APM_USI1_UART					6
+#define CLK_GOUT_APM_FUNC					7
+#define CLK_GOUT_APM_UID_APBIF_GPIO_ALIVE_IPCLKPORT_PCLK	8
+#define CLK_GOUT_APM_UID_APBIF_GPIO_FAR_ALIVE_IPCLKPORT_PCLK	9
+#define CLK_GOUT_APM_UID_APBIF_PMU_ALIVE_IPCLKPORT_PCLK		10
+#define CLK_GOUT_APM_UID_SYSREG_APM_IPCLKPORT_PCLK		11
+#define CLK_APM_PLL_DIV2_APM					12
+#define CLK_APM_PLL_DIV4_APM					13
+#define CLK_APM_PLL_DIV16_APM					14
+
+/* CMU_MISC */
+
+#define CLK_MOUT_MISC_BUS_USER					1
+#define CLK_MOUT_MISC_SSS_USER					2
+#define CLK_DOUT_MISC_BUSP					3
+#define CLK_DOUT_MISC_GIC					4
+#define CLK_GOUT_MISC_PCLK					5
+#define CLK_GOUT_MISC_SYSREG_PCLK				6
+#define CLK_GOUT_MISC_WDT_CLUSTER0				7
+#define CLK_GOUT_MISC_WDT_CLUSTER1				8
+
+#endif /* _DT_BINDINGS_CLOCK_GOOGLE_GS101_H */
-- 
2.42.0.655.g421f12c284-goog

