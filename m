Return-Path: <linux-samsung-soc+bounces-6820-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F9BA36DE7
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 15 Feb 2025 12:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A7081892D93
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 15 Feb 2025 11:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 874F71C6FFE;
	Sat, 15 Feb 2025 11:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="URUiBvpW"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC20B191F75;
	Sat, 15 Feb 2025 11:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739620494; cv=none; b=rGo7iHZIJ9De1VoXI3WkM9bBmcCWqftFn3sOoo6xRuYxXPUh2226k3ef6DvrznO7YCRgyEDwt8aVxzORYdu2GVsl6VJQPAX2wzMOnE6GBwLMepu6Mky4/DXF7WWI/tB46xF+GDEfbcNbVnZWVcZl/cv0EFzhRiHmQtxyCqDkZuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739620494; c=relaxed/simple;
	bh=Rdl8bPWGkDegGOC6ff1c0+3HhZIg3s6F9MD0ixFXSz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MvOuHbJjL2lA3alXcs8skoVSqtjkI2u04JPBWwydUUiU4qQWYEOXYb689a0kUixxelxcdhOpON98jporZmGa9q/KZHOf1CdXBLvx3ex3YqwfmINaBf5bEBysyZuSWk6ftQcgF3zswjrNePhkVgK/GhDQS6aOjfUCPCZ68/Cp1Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=URUiBvpW; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso32196725e9.1;
        Sat, 15 Feb 2025 03:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739620490; x=1740225290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yrx3RUI98v7fWkxG8y13OO99ARnvNVlrwfMJ7iaFnHQ=;
        b=URUiBvpWJ+rrsXDZAO2hilpIiw2d+zSxVqp+Ikh69SGOqsv8hT0f8mOpcH1yKqu/70
         yDSIBqw3a03IG5x+AdBJmkiohaF7M8e3gUyC1zYEejJEaoDEd8/pJfut/SW48uTbdb36
         fBz1QGge7RfGflIQa6XTzwBiR8+7dq6TKsr7t/7G6nG3aDYpUVN++AU6BOZSVG+zBeuo
         Dg/M33bGIOZgbv76xgFiMtsHMa4w/MN5m/mI6RtSkTuB1XYuw5+AcJAiHSv6w/gUY8pp
         cu6k9K8Hc4YLr+UZlOsaQ9ijjv14KZ566ykN5CnEzQoELSFC9owaZEic/K6cXQhpoYdl
         A7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739620490; x=1740225290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yrx3RUI98v7fWkxG8y13OO99ARnvNVlrwfMJ7iaFnHQ=;
        b=hrHO3fqiE1UZUzkN/yPg3VRWjUTUOzWPNpk0jy16vC07z2PqNqtQxG33VpllmXuCa2
         TrkAedHUoG5FZhuWhDNefrNcx02rsfRJONpY5Q7/du4Jbmu+MZbjoKO+Uirs+jqpw1df
         zB8MscqTKaXejnn+GmVVu2nPVpclkUPgzodYGsf09gUPoa/n8Fpipok2MxfnOTAsxVcD
         wkNMZDxQlKphZ/PmnuXZNl7R+4pTl+8mhSDnr35XVpLEma2/3IxT1ULZJKRQUD84JLpr
         BFA+MJp4aS1HJyrJDV//w5r8Ft2LsGUXOVUg0dZpsU/9Olgv9oLCDnCrFvtrpixxG+FO
         Cp9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU4UWVHqOnGfTn/5lRzCVzImGqypU1z2tHd8k24AEmXoVKMwFnib4jqbmW966eUq/DIzJRJrvRL+EZi@vger.kernel.org, AJvYcCUHWBFSrCkzjVKCeM0FW8o1JJCJfavH+afJx6TuWiGZvxCElR0W5ts+J1M4q0AitGD1G5lC8CXWtPE5@vger.kernel.org, AJvYcCWpjhVN+KuCFoFFJruQEUH4872G4ybArZ1sWE/AXVQMTi691dL5PVwgOuv4OKzIjbgXcWiRF+DXsvowtN/t@vger.kernel.org, AJvYcCXknz1YCz4eLBoSRvmStC0RgaLCN2BtnLgA5HY4fTLN4pJAco3ejDOLMBYMGEMork7LV83EhpFy1Z14qdDeMy9pAcM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcxqW8j+4EFDF/Z2RBgvUecls8Gjlx66+cwfYSASfHydQRdEc9
	Z3Nv48PE37hfjA/44wEkF53wW56DDcXuyBpxByuANMriyEV1GaoO
X-Gm-Gg: ASbGncsOEAprQpuX4ji5mFuuc+82FxDb1Ktv0y78IxH0LK+Zz8eC64/nbghdZ3F7EEm
	ONV5BfcTxO/AUiw3H726WuUG+nmx86ZjZzdiPt9KltpAGL9JLC8Z5r35QhmnztdONe9GoUAH5yc
	HgQObvCB026D1ATGsbALty+TIO73OaycsVJ+OSDVLDeWzDGvbs7EXdidTbfDiqM573MeLqaf9XB
	yGrdmxazdpHduaGEs2rw2j6krRNU6ZHQubeCTJVhXKYe/mHgT7f2g3TeZ34WRrMcRDtpJc2REGB
	9ulK0SWczEs0/VdBth9n/dvcSOrbbPxmMe0zWWllFxOGMdtgAX+8yRoNa1gY1DUBfrY=
X-Google-Smtp-Source: AGHT+IHxrXhZlNTMIIJPOxx6V7zsDeYQLi73ku9I8k+av+uI2vlNv3QhAJimVls2O27d7buIW13qzg==
X-Received: by 2002:a05:600c:3b8c:b0:431:5c3d:1700 with SMTP id 5b1f17b1804b1-4396e716f3dmr27717835e9.21.1739620489836;
        Sat, 15 Feb 2025 03:54:49 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439617de5b6sm70029875e9.1.2025.02.15.03.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 03:54:49 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] dt-bindings: clock: add Exynos2200 SoC
Date: Sat, 15 Feb 2025 13:54:31 +0200
Message-ID: <20250215115433.161091-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250215115433.161091-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250215115433.161091-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide dt-schema documentation for Exynos2200 SoC clock controller.
Add device tree clock binding definitions for the following CMU blocks:
- CMU_ALIVE
- CMU_CMGP
- CMU_HSI0
- CMU_PERIC0/1/2
- CMU_PERIS
- CMU_TOP
- CMU_UFS
- CMU_VTS

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../clock/samsung,exynos2200-clock.yaml       | 247 ++++++++++
 .../dt-bindings/clock/samsung,exynos2200.h    | 431 ++++++++++++++++++
 2 files changed, 678 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos2200-clock.yaml
 create mode 100644 include/dt-bindings/clock/samsung,exynos2200.h

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos2200-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos2200-clock.yaml
new file mode 100644
index 000000000..53630beb7
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos2200-clock.yaml
@@ -0,0 +1,247 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/samsung,exynos2200-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos2200 SoC clock controller
+
+maintainers:
+  - Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+  - Chanwoo Choi <cw00.choi@samsung.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+description: |
+  Exynos2200 clock controller is comprised of several CMU units, generating
+  clocks for different domains. Those CMU units are modeled as separate device
+  tree nodes, and might depend on each other. The root clocks in that root tree
+  are two external clocks: XTCXO (76.8 MHz) and RTCCLK (32768 Hz). XTCXO must be
+  defined as a fixed-rate clock in dts, whereas RTCCLK originates from PMIC.
+
+  CMU_TOP is a top-level CMU, where all base clocks are prepared using PLLs and
+  dividers; all other clocks of function blocks (other CMUs) are usually
+  derived from CMU_TOP.
+
+  Each clock is assigned an identifier and client nodes can use this identifier
+  to specify the clock which they consume. All clocks available for usage
+  in clock consumer nodes are defined as preprocessor macros in
+  'include/dt-bindings/clock/samsung,exynos2200.h' header.
+
+properties:
+  compatible:
+    enum:
+      - samsung,exynos2200-cmu-alive
+      - samsung,exynos2200-cmu-cmgp
+      - samsung,exynos2200-cmu-hsi0
+      - samsung,exynos2200-cmu-peric0
+      - samsung,exynos2200-cmu-peric1
+      - samsung,exynos2200-cmu-peric2
+      - samsung,exynos2200-cmu-peris
+      - samsung,exynos2200-cmu-top
+      - samsung,exynos2200-cmu-ufs
+      - samsung,exynos2200-cmu-vts
+
+  clocks:
+    minItems: 1
+    maxItems: 6
+
+  clock-names:
+    minItems: 1
+    maxItems: 6
+
+  "#clock-cells":
+    const: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - reg
+  - "#clock-cells"
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos2200-cmu-alive
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_ALIVE NOC clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: noc
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos2200-cmu-cmgp
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_CMGP NOC clock (from CMU_TOP)
+            - description: CMU_CMGP PERI clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: noc
+            - const: peri
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos2200-cmu-hsi0
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: External RTC clock (32768 Hz)
+            - description: CMU_HSI0 NOC clock (from CMU_TOP)
+            - description: CMU_HSI0 DPGTC clock (from CMU_TOP)
+            - description: CMU_HSI0 DPOSC clock (from CMU_TOP)
+            - description: CMU_HSI0 USB32DRD clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: rtcclk
+            - const: noc
+            - const: dpgtc
+            - const: dposc
+            - const: usb
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos2200-cmu-peric0
+              - samsung,exynos2200-cmu-peric1
+              - samsung,exynos2200-cmu-peric2
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_PERICn NOC clock (from CMU_TOP)
+            - description: CMU_PERICn IP0 clock (from CMU_TOP)
+            - description: CMU_PERICn IP1 clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: noc
+            - const: ip0
+            - const: ip1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos2200-cmu-peris
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (25.6 MHz)
+            - description: CMU_PERIS NOC clock (from CMU_TOP)
+            - description: CMU_PERIS GIC clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: tcxo_div3
+            - const: noc
+            - const: gic
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos2200-cmu-top
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+
+        clock-names:
+          items:
+            - const: oscclk
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos2200-cmu-ufs
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_UFS NOC clock (from CMU_TOP)
+            - description: CMU_UFS MMC clock (from CMU_TOP)
+            - description: CMU_UFS UFS clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: noc
+            - const: mmc
+            - const: ufs
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos2200-cmu-vts
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_VTS DMIC clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: dmic
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/samsung,exynos2200.h>
+
+    cmu_vts: clock-controller@15300000 {
+        compatible = "samsung,exynos2200-cmu-vts";
+        reg = <0x15300000 0x8000>;
+        #clock-cells = <1>;
+
+        clocks = <&oscclk>,
+                 <&cmu_top CLK_DOUT_CMU_VTS_DMIC>;
+        clock-names = "oscclk", "dmic";
+    };
+
+...
diff --git a/include/dt-bindings/clock/samsung,exynos2200.h b/include/dt-bindings/clock/samsung,exynos2200.h
new file mode 100644
index 000000000..310552be0
--- /dev/null
+++ b/include/dt-bindings/clock/samsung,exynos2200.h
@@ -0,0 +1,431 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2025 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+ * Author: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+ *
+ * Device Tree binding constants for Exynos2200 clock controller.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_EXYNOS2200_H
+#define _DT_BINDINGS_CLOCK_EXYNOS2200_H
+
+/* CMU_TOP */
+#define CLK_FOUT_SHARED0_PLL			1
+#define CLK_FOUT_SHARED1_PLL			2
+#define CLK_FOUT_SHARED2_PLL			3
+#define CLK_FOUT_SHARED3_PLL			4
+#define CLK_FOUT_SHARED4_PLL			5
+#define CLK_FOUT_MMC_PLL			6
+#define CLK_FOUT_SHARED_MIF_PLL			7
+
+#define CLK_MOUT_CMU_CP_MPLL_CLK_D2_USER	8
+#define CLK_MOUT_CMU_CP_MPLL_CLK_USER		9
+#define CLK_MOUT_CMU_AUD_AUDIF0			10
+#define CLK_MOUT_CMU_AUD_AUDIF1			11
+#define CLK_MOUT_CMU_AUD_CPU			12
+#define CLK_MOUT_CMU_CPUCL0_DBG_NOC		13
+#define CLK_MOUT_CMU_CPUCL0_SWITCH		14
+#define CLK_MOUT_CMU_CPUCL1_SWITCH		15
+#define CLK_MOUT_CMU_CPUCL2_SWITCH		16
+#define CLK_MOUT_CMU_DNC_NOC			17
+#define CLK_MOUT_CMU_DPUB_NOC			18
+#define CLK_MOUT_CMU_DPUF_NOC			19
+#define CLK_MOUT_CMU_DSP_NOC			20
+#define CLK_MOUT_CMU_DSU_SWITCH			21
+#define CLK_MOUT_CMU_G3D_SWITCH			22
+#define CLK_MOUT_CMU_GNPU_NOC			23
+#define CLK_MOUT_CMU_UFS_MMC_CARD		24
+#define CLK_MOUT_CMU_M2M_NOC			25
+#define CLK_MOUT_CMU_NOCL0_NOC			26
+#define CLK_MOUT_CMU_NOCL1A_NOC			27
+#define CLK_MOUT_CMU_NOCL1B_NOC0		28
+#define CLK_MOUT_CMU_NOCL1C_NOC			29
+#define CLK_MOUT_CMU_SDMA_NOC			30
+#define CLK_MOUT_CMU_CP_HISPEEDY_CLK		31
+#define CLK_MOUT_CMU_CP_SHARED0_CLK		32
+#define CLK_MOUT_CMU_CP_SHARED2_CLK		33
+#define CLK_MOUT_CMU_MUX_ALIVE_NOC		34
+#define CLK_MOUT_CMU_MUX_AUD_AUDIF0		35
+#define CLK_MOUT_CMU_MUX_AUD_AUDIF1		36
+#define CLK_MOUT_CMU_MUX_AUD_CPU		37
+#define CLK_MOUT_CMU_MUX_AUD_NOC		38
+#define CLK_MOUT_CMU_MUX_BRP_NOC		39
+#define CLK_MOUT_CMU_MUX_CIS_CLK0		40
+#define CLK_MOUT_CMU_MUX_CIS_CLK1		41
+#define CLK_MOUT_CMU_MUX_CIS_CLK2		42
+#define CLK_MOUT_CMU_MUX_CIS_CLK3		43
+#define CLK_MOUT_CMU_MUX_CIS_CLK4		44
+#define CLK_MOUT_CMU_MUX_CIS_CLK5		45
+#define CLK_MOUT_CMU_MUX_CIS_CLK6		46
+#define CLK_MOUT_CMU_MUX_CIS_CLK7		47
+#define CLK_MOUT_CMU_MUX_CMU_BOOST		48
+#define CLK_MOUT_CMU_MUX_CMU_BOOST_CAM		49
+#define CLK_MOUT_CMU_MUX_CMU_BOOST_CPU		50
+#define CLK_MOUT_CMU_MUX_CMU_BOOST_MIF		51
+#define CLK_MOUT_CMU_MUX_CPUCL0_DBG_NOC		52
+#define CLK_MOUT_CMU_MUX_CPUCL0_NOCP		53
+#define CLK_MOUT_CMU_MUX_CPUCL0_SWITCH		54
+#define CLK_MOUT_CMU_MUX_CPUCL1_SWITCH		55
+#define CLK_MOUT_CMU_MUX_CPUCL2_SWITCH		56
+#define CLK_MOUT_CMU_MUX_CSIS_DCPHY		57
+#define CLK_MOUT_CMU_MUX_CSIS_NOC		58
+#define CLK_MOUT_CMU_MUX_CSIS_OIS_MCU		59
+#define CLK_MOUT_CMU_MUX_CSTAT_NOC		60
+#define CLK_MOUT_CMU_MUX_DNC_NOC		61
+#define CLK_MOUT_CMU_MUX_DPUB			62
+#define CLK_MOUT_CMU_MUX_DPUB_ALT		63
+#define CLK_MOUT_CMU_MUX_DPUB_DSIM		64
+#define CLK_MOUT_CMU_MUX_DPUF			65
+#define CLK_MOUT_CMU_MUX_DPUF_ALT		66
+#define CLK_MOUT_CMU_MUX_DSP_NOC		67
+#define CLK_MOUT_CMU_MUX_DSU_SWITCH		68
+#define CLK_MOUT_CMU_MUX_G3D_NOCP		69
+#define CLK_MOUT_CMU_MUX_G3D_SWITCH		70
+#define CLK_MOUT_CMU_MUX_GNPU_NOC		71
+#define CLK_MOUT_CMU_MUX_HSI0_DPGTC		72
+#define CLK_MOUT_CMU_MUX_HSI0_DPOSC		73
+#define CLK_MOUT_CMU_MUX_HSI0_NOC		74
+#define CLK_MOUT_CMU_MUX_HSI0_USB32DRD		75
+#define CLK_MOUT_CMU_MUX_UFS_MMC_CARD		76
+#define CLK_MOUT_CMU_MUX_HSI1_NOC		77
+#define CLK_MOUT_CMU_MUX_HSI1_PCIE		78
+#define CLK_MOUT_CMU_MUX_UFS_UFS_EMBD		79
+#define CLK_MOUT_CMU_MUX_LME_LME		80
+#define CLK_MOUT_CMU_MUX_LME_NOC		81
+#define CLK_MOUT_CMU_MUX_M2M_NOC		82
+#define CLK_MOUT_CMU_MUX_MCSC_MCSC		83
+#define CLK_MOUT_CMU_MUX_MCSC_NOC		84
+#define CLK_MOUT_CMU_MUX_MFC0_MFC0		85
+#define CLK_MOUT_CMU_MUX_MFC0_WFD		86
+#define CLK_MOUT_CMU_MUX_MFC1_MFC1		87
+#define CLK_MOUT_CMU_MUX_MIF_NOCP		88
+#define CLK_MOUT_CMU_MUX_MIF_SWITCH		89
+#define CLK_MOUT_CMU_MUX_NOCL0_NOC		90
+#define CLK_MOUT_CMU_MUX_NOCL1A_NOC		91
+#define CLK_MOUT_CMU_MUX_NOCL1B_NOC0		92
+#define CLK_MOUT_CMU_MUX_NOCL1B_NOC1		93
+#define CLK_MOUT_CMU_MUX_NOCL1C_NOC		94
+#define CLK_MOUT_CMU_MUX_PERIC0_IP0		95
+#define CLK_MOUT_CMU_MUX_PERIC0_IP1		96
+#define CLK_MOUT_CMU_MUX_PERIC0_NOC		97
+#define CLK_MOUT_CMU_MUX_PERIC1_IP0		98
+#define CLK_MOUT_CMU_MUX_PERIC1_IP1		99
+#define CLK_MOUT_CMU_MUX_PERIC1_NOC		100
+#define CLK_MOUT_CMU_MUX_PERIC2_IP0		101
+#define CLK_MOUT_CMU_MUX_PERIC2_IP1		102
+#define CLK_MOUT_CMU_MUX_PERIC2_NOC		103
+#define CLK_MOUT_CMU_MUX_PERIS_GIC		104
+#define CLK_MOUT_CMU_MUX_PERIS_NOC		105
+#define CLK_MOUT_CMU_MUX_SDMA_NOC		106
+#define CLK_MOUT_CMU_MUX_SSP_NOC		107
+#define CLK_MOUT_CMU_MUX_VTS_DMIC		108
+#define CLK_MOUT_CMU_MUX_YUVP_NOC		109
+#define CLK_MOUT_CMU_MUX_CMU_CMUREF		110
+#define CLK_MOUT_CMU_MUX_CP_HISPEEDY_CLK	111
+#define CLK_MOUT_CMU_MUX_CP_SHARED0_CLK		112
+#define CLK_MOUT_CMU_MUX_CP_SHARED1_CLK		113
+#define CLK_MOUT_CMU_MUX_CP_SHARED2_CLK		114
+#define CLK_MOUT_CMU_M2M_FRC			115
+#define CLK_MOUT_CMU_MCSC_MCSC			116
+#define CLK_MOUT_CMU_MCSC_NOC			117
+#define CLK_MOUT_CMU_MUX_M2M_FRC		118
+#define CLK_MOUT_CMU_MUX_UFS_NOC		119
+
+#define CLK_DOUT_CMU_ALIVE_NOC			120
+#define CLK_DOUT_CMU_AUD_NOC			121
+#define CLK_DOUT_CMU_BRP_NOC			122
+#define CLK_DOUT_CMU_CMU_BOOST			123
+#define CLK_DOUT_CMU_CMU_BOOST_CAM		124
+#define CLK_DOUT_CMU_CMU_BOOST_CPU		125
+#define CLK_DOUT_CMU_CMU_BOOST_MIF		126
+#define CLK_DOUT_CMU_CPUCL0_NOCP		127
+#define CLK_DOUT_CMU_CSIS_DCPHY			128
+#define CLK_DOUT_CMU_CSIS_NOC			129
+#define CLK_DOUT_CMU_CSIS_OIS_MCU		130
+#define CLK_DOUT_CMU_CSTAT_NOC			131
+#define CLK_DOUT_CMU_DPUB_DSIM			132
+#define CLK_DOUT_CMU_LME_LME			133
+#define CLK_DOUT_CMU_G3D_NOCP			134
+#define CLK_DOUT_CMU_HSI0_DPGTC			135
+#define CLK_DOUT_CMU_HSI0_DPOSC			136
+#define CLK_DOUT_CMU_HSI0_NOC			137
+#define CLK_DOUT_CMU_HSI0_USB32DRD		138
+#define CLK_DOUT_CMU_HSI1_NOC			139
+#define CLK_DOUT_CMU_HSI1_PCIE			140
+#define CLK_DOUT_CMU_UFS_UFS_EMBD		141
+#define CLK_DOUT_CMU_LME_NOC			142
+#define CLK_DOUT_CMU_MFC0_MFC0			143
+#define CLK_DOUT_CMU_MFC0_WFD			144
+#define CLK_DOUT_CMU_MFC1_MFC1			145
+#define CLK_DOUT_CMU_MIF_NOCP			146
+#define CLK_DOUT_CMU_NOCL1B_NOC1		147
+#define CLK_DOUT_CMU_PERIC0_IP0			148
+#define CLK_DOUT_CMU_PERIC0_IP1			149
+#define CLK_DOUT_CMU_PERIC0_NOC			150
+#define CLK_DOUT_CMU_PERIC1_IP0			151
+#define CLK_DOUT_CMU_PERIC1_IP1			152
+#define CLK_DOUT_CMU_PERIC1_NOC			153
+#define CLK_DOUT_CMU_PERIC2_IP0			154
+#define CLK_DOUT_CMU_PERIC2_IP1			155
+#define CLK_DOUT_CMU_PERIC2_NOC			156
+#define CLK_DOUT_CMU_PERIS_GIC			157
+#define CLK_DOUT_CMU_PERIS_NOC			158
+#define CLK_DOUT_CMU_SSP_NOC			159
+#define CLK_DOUT_CMU_VTS_DMIC			160
+#define CLK_DOUT_CMU_YUVP_NOC			161
+#define CLK_DOUT_CMU_CP_SHARED1_CLK		162
+#define CLK_DOUT_CMU_DIV_AUD_AUDIF0		163
+#define CLK_DOUT_CMU_DIV_AUD_AUDIF0_SM		164
+#define CLK_DOUT_CMU_DIV_AUD_AUDIF1		165
+#define CLK_DOUT_CMU_DIV_AUD_AUDIF1_SM		166
+#define CLK_DOUT_CMU_DIV_AUD_CPU		167
+#define CLK_DOUT_CMU_DIV_AUD_CPU_SM		168
+#define CLK_DOUT_CMU_DIV_CIS_CLK0		169
+#define CLK_DOUT_CMU_DIV_CIS_CLK1		170
+#define CLK_DOUT_CMU_DIV_CIS_CLK2		171
+#define CLK_DOUT_CMU_DIV_CIS_CLK3		172
+#define CLK_DOUT_CMU_DIV_CIS_CLK4		173
+#define CLK_DOUT_CMU_DIV_CIS_CLK5		174
+#define CLK_DOUT_CMU_DIV_CIS_CLK6		175
+#define CLK_DOUT_CMU_DIV_CIS_CLK7		176
+#define CLK_DOUT_CMU_DIV_CPUCL0_DBG_NOC		177
+#define CLK_DOUT_CMU_DIV_CPUCL0_DBG_NOC_SM	178
+#define CLK_DOUT_CMU_DIV_CPUCL0_SWITCH		179
+#define CLK_DOUT_CMU_DIV_CPUCL0_SWITCH_SM	180
+#define CLK_DOUT_CMU_DIV_CPUCL1_SWITCH		181
+#define CLK_DOUT_CMU_DIV_CPUCL1_SWITCH_SM	182
+#define CLK_DOUT_CMU_DIV_CPUCL2_SWITCH		183
+#define CLK_DOUT_CMU_DIV_CPUCL2_SWITCH_SM	184
+#define CLK_DOUT_CMU_DIV_DNC_NOC		185
+#define CLK_DOUT_CMU_DIV_DNC_NOC_SM		186
+#define CLK_DOUT_CMU_DIV_DPUB			187
+#define CLK_DOUT_CMU_DIV_DPUB_ALT		188
+#define CLK_DOUT_CMU_DIV_DPUF			189
+#define CLK_DOUT_CMU_DIV_DPUF_ALT		190
+#define CLK_DOUT_CMU_DIV_DSP_NOC		191
+#define CLK_DOUT_CMU_DIV_DSP_NOC_SM		192
+#define CLK_DOUT_CMU_DIV_DSU_SWITCH		193
+#define CLK_DOUT_CMU_DIV_DSU_SWITCH_SM		194
+#define CLK_DOUT_CMU_DIV_G3D_SWITCH		195
+#define CLK_DOUT_CMU_DIV_G3D_SWITCH_SM		196
+#define CLK_DOUT_CMU_DIV_GNPU_NOC		197
+#define CLK_DOUT_CMU_DIV_GNPU_NOC_SM		198
+#define CLK_DOUT_CMU_DIV_UFS_MMC_CARD		199
+#define CLK_DOUT_CMU_DIV_UFS_MMC_CARD_SM	200
+#define CLK_DOUT_CMU_DIV_M2M_NOC		201
+#define CLK_DOUT_CMU_DIV_M2M_NOC_SM		202
+#define CLK_DOUT_CMU_DIV_NOCL0_NOC		203
+#define CLK_DOUT_CMU_DIV_NOCL0_NOC_SM		204
+#define CLK_DOUT_CMU_DIV_NOCL1A_NOC		205
+#define CLK_DOUT_CMU_DIV_NOCL1A_NOC_SM		206
+#define CLK_DOUT_CMU_DIV_NOCL1B_NOC0		207
+#define CLK_DOUT_CMU_DIV_NOCL1B_NOC0_SM		208
+#define CLK_DOUT_CMU_DIV_NOCL1C_NOC		209
+#define CLK_DOUT_CMU_DIV_NOCL1C_NOC_SM		210
+#define CLK_DOUT_CMU_DIV_SDMA_NOC		211
+#define CLK_DOUT_CMU_DIV_SDMA_NOC_SM		212
+#define CLK_DOUT_CMU_DIV_CP_HISPEEDY_CLK	213
+#define CLK_DOUT_CMU_DIV_CP_HISPEEDY_CLK_SM	214
+#define CLK_DOUT_CMU_DIV_CP_SHARED0_CLK		215
+#define CLK_DOUT_CMU_DIV_CP_SHARED0_CLK_SM	216
+#define CLK_DOUT_CMU_DIV_CP_SHARED2_CLK		217
+#define CLK_DOUT_CMU_DIV_CP_SHARED2_CLK_SM	218
+#define CLK_DOUT_CMU_UFS_NOC		219
+#define CLK_DOUT_CMU_DIV_M2M_FRC		220
+#define CLK_DOUT_CMU_DIV_M2M_FRC_SM		221
+#define CLK_DOUT_CMU_DIV_MCSC_MCSC		222
+#define CLK_DOUT_CMU_DIV_MCSC_MCSC_SM		223
+#define CLK_DOUT_CMU_DIV_MCSC_NOC		224
+#define CLK_DOUT_CMU_DIV_MCSC_NOC_SM		225
+#define CLK_DOUT_SHARED0_DIV1			226
+#define CLK_DOUT_SHARED0_DIV2			227
+#define CLK_DOUT_SHARED0_DIV4			228
+#define CLK_DOUT_SHARED1_DIV1			229
+#define CLK_DOUT_SHARED1_DIV2			230
+#define CLK_DOUT_SHARED1_DIV4			231
+#define CLK_DOUT_SHARED2_DIV1			232
+#define CLK_DOUT_SHARED2_DIV2			233
+#define CLK_DOUT_SHARED2_DIV4			234
+#define CLK_DOUT_SHARED3_DIV1			235
+#define CLK_DOUT_SHARED3_DIV2			236
+#define CLK_DOUT_SHARED3_DIV4			237
+#define CLK_DOUT_SHARED4_DIV1			238
+#define CLK_DOUT_SHARED4_DIV2			239
+#define CLK_DOUT_SHARED4_DIV4			240
+#define CLK_DOUT_SHARED_MIF_DIV1		241
+#define CLK_DOUT_SHARED_MIF_DIV2		242
+#define CLK_DOUT_SHARED_MIF_DIV4		243
+#define CLK_DOUT_TCXO_DIV3			244
+#define CLK_DOUT_TCXO_DIV4			245
+
+/* CMU_ALIVE */
+#define CLK_MOUT_ALIVE_NOC_USER			1
+#define CLK_MOUT_ALIVE_RCO_SPMI_USER		2
+#define CLK_MOUT_RCO_ALIVE_USER			3
+#define CLK_MOUT_ALIVE_CHUB_PERI		4
+#define CLK_MOUT_ALIVE_CMGP_NOC			5
+#define CLK_MOUT_ALIVE_CMGP_PERI		6
+#define CLK_MOUT_ALIVE_DBGCORE_NOC		7
+#define CLK_MOUT_ALIVE_DNC_NOC			8
+#define CLK_MOUT_ALIVE_CHUBVTS_NOC		9
+#define CLK_MOUT_ALIVE_GNPU_NOC			10
+#define CLK_MOUT_ALIVE_GNSS_NOC			11
+#define CLK_MOUT_ALIVE_SDMA_NOC			12
+#define CLK_MOUT_ALIVE_UFD_NOC			13
+#define CLK_MOUT_ALIVE_DBGCORE_UART		14
+#define CLK_MOUT_ALIVE_NOC			15
+#define CLK_MOUT_ALIVE_PMU_SUB			16
+#define CLK_MOUT_ALIVE_SPMI			17
+#define CLK_MOUT_ALIVE_TIMER			18
+#define CLK_MOUT_ALIVE_CSIS_NOC			19
+#define CLK_MOUT_ALIVE_DSP_NOC			20
+
+#define CLK_DOUT_ALIVE_CHUB_PERI		21
+#define CLK_DOUT_ALIVE_CMGP_NOC			22
+#define CLK_DOUT_ALIVE_CMGP_PERI		23
+#define CLK_DOUT_ALIVE_DBGCORE_NOC		24
+#define CLK_DOUT_ALIVE_DNC_NOC			25
+#define CLK_DOUT_ALIVE_CHUBVTS_NOC		26
+#define CLK_DOUT_ALIVE_GNPU_NOC			27
+#define CLK_DOUT_ALIVE_SDMA_NOC			28
+#define CLK_DOUT_ALIVE_UFD_NOC			29
+#define CLK_DOUT_ALIVE_DBGCORE_UART		30
+#define CLK_DOUT_ALIVE_NOC			31
+#define CLK_DOUT_ALIVE_PMU_SUB			32
+#define CLK_DOUT_ALIVE_SPMI			33
+#define CLK_DOUT_ALIVE_CSIS_NOC			34
+#define CLK_DOUT_ALIVE_DSP_NOC			35
+
+/* CMU_PERIS */
+#define CLK_MOUT_PERIS_GIC_USER			1
+#define CLK_MOUT_PERIS_NOC_USER			2
+#define CLK_MOUT_PERIS_GIC			3
+
+#define CLK_DOUT_PERIS_OTP			4
+#define CLK_DOUT_PERIS_DDD_CTRL			5
+
+/* CMU_CMGP */
+#define CLK_MOUT_CMGP_CLKALIVE_NOC_USER		1
+#define CLK_MOUT_CMGP_CLKALIVE_PERI_USER	2
+#define CLK_MOUT_CMGP_I2C			3
+#define CLK_MOUT_CMGP_SPI_I2C0			4
+#define CLK_MOUT_CMGP_SPI_I2C1			5
+#define CLK_MOUT_CMGP_SPI_MS_CTRL		6
+#define CLK_MOUT_CMGP_USI0			7
+#define CLK_MOUT_CMGP_USI1			8
+#define CLK_MOUT_CMGP_USI2			9
+#define CLK_MOUT_CMGP_USI3			10
+#define CLK_MOUT_CMGP_USI4			11
+#define CLK_MOUT_CMGP_USI5			12
+#define CLK_MOUT_CMGP_USI6			13
+
+#define CLK_DOUT_CMGP_I2C			14
+#define CLK_DOUT_CMGP_SPI_I2C0			15
+#define CLK_DOUT_CMGP_SPI_I2C1			16
+#define CLK_DOUT_CMGP_SPI_MS_CTRL		17
+#define CLK_DOUT_CMGP_USI0			18
+#define CLK_DOUT_CMGP_USI1			19
+#define CLK_DOUT_CMGP_USI2			20
+#define CLK_DOUT_CMGP_USI3			21
+#define CLK_DOUT_CMGP_USI4			22
+#define CLK_DOUT_CMGP_USI5			23
+#define CLK_DOUT_CMGP_USI6			24
+
+/* CMU_HSI0 */
+#define CLK_MOUT_CLKCMU_HSI0_DPGTC_USER		1
+#define CLK_MOUT_CLKCMU_HSI0_DPOSC_USER		2
+#define CLK_MOUT_CLKCMU_HSI0_NOC_USER		3
+#define CLK_MOUT_CLKCMU_HSI0_USB32DRD_USER	4
+#define CLK_MOUT_HSI0_NOC			5
+#define CLK_MOUT_HSI0_RTCCLK			6
+#define CLK_MOUT_HSI0_USB32DRD			7
+
+#define CLK_DOUT_DIV_CLK_HSI0_EUSB		8
+
+/* CMU_PERIC0 */
+#define CLK_MOUT_PERIC0_IP0_USER		1
+#define CLK_MOUT_PERIC0_IP1_USER		2
+#define CLK_MOUT_PERIC0_NOC_USER		3
+#define CLK_MOUT_PERIC0_I2C			4
+#define CLK_MOUT_PERIC0_USI04			5
+
+#define CLK_DOUT_PERIC0_I2C			6
+#define CLK_DOUT_PERIC0_USI04			7
+
+/* CMU_PERIC1 */
+#define CLK_MOUT_PERIC1_IP0_USER		1
+#define CLK_MOUT_PERIC1_IP1_USER		2
+#define CLK_MOUT_PERIC1_NOC_USER		3
+#define CLK_MOUT_PERIC1_I2C			4
+#define CLK_MOUT_PERIC1_SPI_MS_CTRL		5
+#define CLK_MOUT_PERIC1_UART_BT			6
+#define CLK_MOUT_PERIC1_USI07			7
+#define CLK_MOUT_PERIC1_USI07_SPI_I2C		8
+#define CLK_MOUT_PERIC1_USI08			9
+#define CLK_MOUT_PERIC1_USI08_SPI_I2C		10
+#define CLK_MOUT_PERIC1_USI09			11
+#define CLK_MOUT_PERIC1_USI10			12
+
+#define CLK_DOUT_PERIC1_I2C			13
+#define CLK_DOUT_PERIC1_SPI_MS_CTRL		14
+#define CLK_DOUT_PERIC1_UART_BT			15
+#define CLK_DOUT_PERIC1_USI07			16
+#define CLK_DOUT_PERIC1_USI07_SPI_I2C		17
+#define CLK_DOUT_PERIC1_USI08			18
+#define CLK_DOUT_PERIC1_USI08_SPI_I2C		19
+#define CLK_DOUT_PERIC1_USI09			20
+#define CLK_DOUT_PERIC1_USI10			21
+
+/* CMU_PERIC2 */
+#define CLK_MOUT_PERIC2_IP0_USER		1
+#define CLK_MOUT_PERIC2_IP1_USER		2
+#define CLK_MOUT_PERIC2_NOC_USER		3
+#define CLK_MOUT_PERIC2_I2C			4
+#define CLK_MOUT_PERIC2_SPI_MS_CTRL		5
+#define CLK_MOUT_PERIC2_UART_DBG		6
+#define CLK_MOUT_PERIC2_USI00			7
+#define CLK_MOUT_PERIC2_USI00_SPI_I2C		8
+#define CLK_MOUT_PERIC2_USI01			9
+#define CLK_MOUT_PERIC2_USI01_SPI_I2C		10
+#define CLK_MOUT_PERIC2_USI02			11
+#define CLK_MOUT_PERIC2_USI03			12
+#define CLK_MOUT_PERIC2_USI05			13
+#define CLK_MOUT_PERIC2_USI06			14
+#define CLK_MOUT_PERIC2_USI11			15
+
+#define CLK_DOUT_PERIC2_I2C			16
+#define CLK_DOUT_PERIC2_SPI_MS_CTRL		17
+#define CLK_DOUT_PERIC2_UART_DBG		18
+#define CLK_DOUT_PERIC2_USI00			19
+#define CLK_DOUT_PERIC2_USI00_SPI_I2C		20
+#define CLK_DOUT_PERIC2_USI01			21
+#define CLK_DOUT_PERIC2_USI01_SPI_I2C		22
+#define CLK_DOUT_PERIC2_USI02			23
+#define CLK_DOUT_PERIC2_USI03			24
+#define CLK_DOUT_PERIC2_USI05			25
+#define CLK_DOUT_PERIC2_USI06			26
+#define CLK_DOUT_PERIC2_USI11			27
+
+/* CMU_UFS */
+#define CLK_MOUT_UFS_MMC_CARD_USER		1
+#define CLK_MOUT_UFS_NOC_USER			2
+#define CLK_MOUT_UFS_UFS_EMBD_USER		3
+
+/* CMU_VTS */
+#define CLK_MOUT_CLKALIVE_VTS_NOC_USER		1
+#define CLK_MOUT_CLKALIVE_VTS_RCO_USER		2
+#define CLK_MOUT_CLKCMU_VTS_DMIC_USER		3
+#define CLK_MOUT_CLKVTS_AUD_DMIC1		4
+#define CLK_MOUT_CLKVTS_NOC			5
+#define CLK_MOUT_CLKVTS_DMIC_PAD		6
+
+#define CLK_DOUT_CLKVTS_AUD_DMIC0		7
+#define CLK_DOUT_CLKVTS_AUD_DMIC1		8
+#define CLK_DOUT_CLKVTS_CPU			9
+#define CLK_DOUT_CLKVTS_DMIC_IF			10
+#define CLK_DOUT_CLKVTS_DMIC_IF_DIV2		11
+#define CLK_DOUT_CLKVTS_NOC			12
+#define CLK_DOUT_CLKVTS_SERIAL_LIF		13
+#define CLK_DOUT_CLKVTS_SERIAL_LIF_CORE		14
+
+#endif
-- 
2.43.0


