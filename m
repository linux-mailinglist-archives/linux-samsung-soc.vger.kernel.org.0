Return-Path: <linux-samsung-soc+bounces-11853-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 89883C1A8D9
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 29 Oct 2025 14:12:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0F8A335957E
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 29 Oct 2025 13:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E6F82FB97A;
	Wed, 29 Oct 2025 13:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="gNlwAXO2"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFF21C5D46
	for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Oct 2025 13:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761743316; cv=none; b=WrzHohHccWdt9wPhdlbGGw8a3O4Sb8En5akVahKBks1LgmfpX0WieuzClqrghDfpExl9I1U5EJf/Re3z/KTijzcqKMO56XPeBsS9H66RiTwYdVUlFOsuup7KqgasBXF7WbDBG9UXgR9r553LLeUoV+HnUQlQrwAKD+WlchKOnhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761743316; c=relaxed/simple;
	bh=gr+fpJiLDxE+/ReEUWkadW30XLNdR5RRuXqDm5csD2Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:Content-Type:
	 References; b=nmu2n601w75UaYWWguMQaf9Udjuul8HFC7ne+qnMOklUIV0YNXOgz0WbpiRSyTepxNX5l9V34okKIPvtNO16bCLUySV2MFYaSYmnqxyzQLTH+Ml+EHP6cLh6/MkT9F6+lXELpQVklTl87fwIt93ocjnPMZyAwJADQXJytVIloP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=gNlwAXO2; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20251029130829epoutp0428a6038935012f560b2de7f25c6577ac~y_DStAgrn1424414244epoutp04T
	for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Oct 2025 13:08:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20251029130829epoutp0428a6038935012f560b2de7f25c6577ac~y_DStAgrn1424414244epoutp04T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761743309;
	bh=/Rg447nv4jG7ZTaZ3yR+37uySv7fYSYGLbahg4p5atw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gNlwAXO21Tv76nAJcEgkXtf4nxEmbl5bMfF8FVDBtF/IzE8WZzbH20lacfxINQFc0
	 OnfPufDhfV+YOVTD4nmQwW/h9qm6OSyFSJdlsjUq87SWC/HBW3FbsVOTsuULutz5MX
	 toIka3mX3mwQTFVvrGidJqSrKgG8MTVfs/QBw7hI=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20251029130828epcas5p3638987da72547fe4cb1540bbaa8f76a0~y_DR9iJwK3082630826epcas5p3b;
	Wed, 29 Oct 2025 13:08:28 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.93]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cxSGz4Vxjz3hhT7; Wed, 29 Oct
	2025 13:08:27 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20251029130826epcas5p180506ff38fb57ecca0e33b2f5c57ed6c~y_DQd1H1S2691926919epcas5p1H;
	Wed, 29 Oct 2025 13:08:26 +0000 (GMT)
Received: from Jaguar.samsungds.net (unknown [107.109.115.6]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251029130810epsmtip25debfffa4791be8b8177c983a8e6d90e~y_DBSwy0Q0628906289epsmtip2Y;
	Wed, 29 Oct 2025 13:08:10 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jesper.nilsson@axis.com, lars.persson@axis.com, mturquette@baylibre.com,
	sboyd@kernel.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com,
	cw00.choi@samsung.com
Cc: ravi.patel@samsung.com, ksk4725@coasia.com, smn1196@coasia.com,
	linux-arm-kernel@axis.com, krzk@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	pjsin865@coasia.com, gwk1013@coasia.com, bread@coasia.com,
	jspark@coasia.com, limjh0823@coasia.com, lightwise@coasia.com,
	hgkim05@coasia.com, mingyoungbo@coasia.com, shradha.t@samsung.com,
	swathi.ks@samsung.com, kenkim@coasia.com
Subject: [PATCH v3 1/4] dt-bindings: clock: Add ARTPEC-9 clock controller
Date: Wed, 29 Oct 2025 18:37:28 +0530
Message-Id: <20251029130731.51305-2-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251029130731.51305-1-ravi.patel@samsung.com>
X-CMS-MailID: 20251029130826epcas5p180506ff38fb57ecca0e33b2f5c57ed6c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251029130826epcas5p180506ff38fb57ecca0e33b2f5c57ed6c
References: <20251029130731.51305-1-ravi.patel@samsung.com>
	<CGME20251029130826epcas5p180506ff38fb57ecca0e33b2f5c57ed6c@epcas5p1.samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

From: GyoungBo Min <mingyoungbo@coasia.com>

Add dt-schema for Axis ARTPEC-9 SoC clock controller.

The Clock Management Unit (CMU) has a top-level block CMU_CMU
which generates clocks for other blocks.

Add device-tree binding definitions for following CMU blocks:
- CMU_CMU
- CMU_BUS
- CMU_CORE
- CMU_CPUCL
- CMU_FSYS0
- CMU_FSYS1
- CMU_IMEM
- CMU_PERI

Signed-off-by: GyoungBo Min <mingyoungbo@coasia.com>
Reviewed-by: Kyunghwan Kim <kenkim@coasia.com>
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/clock/axis,artpec9-clock.yaml    | 232 ++++++++++++++++++
 include/dt-bindings/clock/axis,artpec9-clk.h  | 195 +++++++++++++++
 2 files changed, 427 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/axis,artpec9-clock.yaml
 create mode 100644 include/dt-bindings/clock/axis,artpec9-clk.h

diff --git a/Documentation/devicetree/bindings/clock/axis,artpec9-clock.yaml b/Documentation/devicetree/bindings/clock/axis,artpec9-clock.yaml
new file mode 100644
index 000000000000..63442b91e7ac
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/axis,artpec9-clock.yaml
@@ -0,0 +1,232 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/axis,artpec9-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axis ARTPEC-9 SoC clock controller
+
+maintainers:
+  - Jesper Nilsson <jesper.nilsson@axis.com>
+
+description: |
+  ARTPEC-9 clock controller is comprised of several CMU (Clock Management Unit)
+  units, generating clocks for different domains. Those CMU units are modeled
+  as separate device tree nodes, and might depend on each other.
+  The root clock in that root tree is an external clock: OSCCLK (25 MHz).
+  This external clock must be defined as a fixed-rate clock in dts.
+
+  CMU_CMU is a top-level CMU, where all base clocks are prepared using PLLs and
+  dividers, all other clocks of function blocks (other CMUs) are usually
+  derived from CMU_CMU.
+
+  Each clock is assigned an identifier and client nodes can use this identifier
+  to specify the clock which they consume. All clocks available for usage
+  in clock consumer nodes are defined as preprocessor macros in
+  'include/dt-bindings/clock/axis,artpec9-clk.h' header.
+
+properties:
+  compatible:
+    enum:
+      - axis,artpec9-cmu-cmu
+      - axis,artpec9-cmu-bus
+      - axis,artpec9-cmu-core
+      - axis,artpec9-cmu-cpucl
+      - axis,artpec9-cmu-fsys0
+      - axis,artpec9-cmu-fsys1
+      - axis,artpec9-cmu-imem
+      - axis,artpec9-cmu-peri
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 5
+
+  clock-names:
+    minItems: 1
+    maxItems: 5
+
+  "#clock-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#clock-cells"
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: axis,artpec9-cmu-cmu
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (25 MHz)
+
+        clock-names:
+          items:
+            - const: fin_pll
+
+  - if:
+      properties:
+        compatible:
+          const: axis,artpec9-cmu-bus
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (25 MHz)
+            - description: CMU_BUS bus clock (from CMU_CMU)
+
+        clock-names:
+          items:
+            - const: fin_pll
+            - const: bus
+
+  - if:
+      properties:
+        compatible:
+          const: axis,artpec9-cmu-core
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (25 MHz)
+            - description: CMU_CORE main clock (from CMU_CMU)
+
+        clock-names:
+          items:
+            - const: fin_pll
+            - const: main
+
+  - if:
+      properties:
+        compatible:
+          const: axis,artpec9-cmu-cpucl
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (25 MHz)
+            - description: CMU_CPUCL switch clock (from CMU_CMU)
+
+        clock-names:
+          items:
+            - const: fin_pll
+            - const: switch
+
+  - if:
+      properties:
+        compatible:
+          const: axis,artpec9-cmu-fsys0
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (25 MHz)
+            - description: CMU_FSYS0 bus clock (from CMU_CMU)
+            - description: CMU_FSYS0 IP clock (from CMU_CMU)
+
+        clock-names:
+          items:
+            - const: fin_pll
+            - const: bus
+            - const: ip
+
+  - if:
+      properties:
+        compatible:
+          const: axis,artpec9-cmu-fsys1
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (25 MHz)
+            - description: CMU_FSYS1 scan0 clock (from CMU_CMU)
+            - description: CMU_FSYS1 scan1 clock (from CMU_CMU)
+            - description: CMU_FSYS1 bus clock (from CMU_CMU)
+
+        clock-names:
+          items:
+            - const: fin_pll
+            - const: scan0
+            - const: scan1
+            - const: bus
+
+  - if:
+      properties:
+        compatible:
+          const: axis,artpec9-cmu-imem
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (25 MHz)
+            - description: CMU_IMEM ACLK clock (from CMU_CMU)
+            - description: CMU_IMEM CA5 clock (from CMU_CMU)
+            - description: CMU_IMEM JPEG clock (from CMU_CMU)
+            - description: CMU_IMEM SSS clock (from CMU_CMU)
+
+        clock-names:
+          items:
+            - const: fin_pll
+            - const: aclk
+            - const: ca5
+            - const: jpeg
+            - const: sss
+
+  - if:
+      properties:
+        compatible:
+          const: axis,artpec9-cmu-peri
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (25 MHz)
+            - description: CMU_PERI IP clock (from CMU_CMU)
+            - description: CMU_PERI DISP clock (from CMU_CMU)
+
+        clock-names:
+          items:
+            - const: fin_pll
+            - const: ip
+            - const: disp
+
+additionalProperties: false
+
+examples:
+  # Clock controller node for CMU_FSYS1
+  - |
+    #include <dt-bindings/clock/axis,artpec9-clk.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        cmu_fsys1: clock-controller@14c10000 {
+            compatible = "axis,artpec9-cmu-fsys1";
+            reg = <0x0 0x14c10000 0x0 0x4000>;
+            #clock-cells = <1>;
+            clocks = <&fin_pll>,
+                     <&cmu_cmu CLK_DOUT_CMU_FSYS1_SCAN0>,
+                     <&cmu_cmu CLK_DOUT_CMU_FSYS1_SCAN1>,
+                     <&cmu_cmu CLK_DOUT_CMU_FSYS1_BUS>;
+            clock-names = "fin_pll", "scan0", "scan1", "bus";
+        };
+    };
+...
diff --git a/include/dt-bindings/clock/axis,artpec9-clk.h b/include/dt-bindings/clock/axis,artpec9-clk.h
new file mode 100644
index 000000000000..c6787be8d686
--- /dev/null
+++ b/include/dt-bindings/clock/axis,artpec9-clk.h
@@ -0,0 +1,195 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *             https://www.samsung.com
+ * Copyright (c) 2025  Axis Communications AB.
+ *             https://www.axis.com
+ *
+ * Device Tree binding constants for ARTPEC-9 clock controller.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_ARTPEC9_H
+#define _DT_BINDINGS_CLOCK_ARTPEC9_H
+
+/* CMU_CMU */
+#define CLK_FOUT_SHARED0_PLL						1
+#define CLK_DOUT_SHARED0_DIV2						2
+#define CLK_DOUT_SHARED0_DIV3						3
+#define CLK_DOUT_SHARED0_DIV4						4
+#define CLK_FOUT_SHARED1_PLL						5
+#define CLK_DOUT_SHARED1_DIV2						6
+#define CLK_DOUT_SHARED1_DIV3						7
+#define CLK_DOUT_SHARED1_DIV4						8
+#define CLK_FOUT_AUDIO_PLL						9
+#define CLK_DOUT_CMU_ADD						10
+#define CLK_DOUT_CMU_BUS						11
+#define CLK_DOUT_CMU_CDC_CORE						12
+#define CLK_DOUT_CMU_CORE_MAIN						13
+#define CLK_DOUT_CMU_CPUCL_SWITCH					14
+#define CLK_DOUT_CMU_DLP_CORE						15
+#define CLK_DOUT_CMU_FSYS0_BUS						16
+#define CLK_DOUT_CMU_FSYS0_IP						17
+#define CLK_DOUT_CMU_FSYS1_BUS						18
+#define CLK_DOUT_CMU_FSYS1_SCAN0					19
+#define CLK_DOUT_CMU_FSYS1_SCAN1					20
+#define CLK_DOUT_CMU_GPU_3D						21
+#define CLK_DOUT_CMU_GPU_2D						22
+#define CLK_DOUT_CMU_IMEM_ACLK						23
+#define CLK_DOUT_CMU_IMEM_CA5						24
+#define CLK_DOUT_CMU_IMEM_JPEG						25
+#define CLK_DOUT_CMU_IMEM_SSS						26
+#define CLK_DOUT_CMU_IPA_CORE						27
+#define CLK_DOUT_CMU_LCPU						28
+#define CLK_DOUT_CMU_MIF_SWITCH						29
+#define CLK_DOUT_CMU_MIF_BUSP						30
+#define CLK_DOUT_CMU_PERI_DISP						31
+#define CLK_DOUT_CMU_PERI_IP						32
+#define CLK_DOUT_CMU_RSP_CORE						33
+#define CLK_DOUT_CMU_TRFM						34
+#define CLK_DOUT_CMU_VIO_CORE_L						35
+#define CLK_DOUT_CMU_VIO_CORE						36
+#define CLK_DOUT_CMU_VIP0						37
+#define CLK_DOUT_CMU_VIP1						38
+#define CLK_DOUT_CMU_VPP_CORE						39
+#define CLK_DOUT_CMU_VIO_AUDIO						40
+
+/* CMU_BUS */
+#define CLK_MOUT_BUS_ACLK_USER						1
+
+/* CMU_CORE */
+#define CLK_MOUT_CORE_ACLK_USER						1
+
+/* CMU_CPUCL */
+#define CLK_FOUT_CPUCL_PLL0						1
+#define CLK_MOUT_CPUCL_PLL0						2
+#define CLK_FOUT_CPUCL_PLL1						3
+#define CLK_MOUT_CPUCL_PLL_SCU						4
+#define CLK_MOUT_CPUCL_SWITCH_SCU_USER					5
+#define CLK_MOUT_CPUCL_SWITCH_USER					6
+#define CLK_DOUT_CPUCL_CPU						7
+#define CLK_DOUT_CPUCL_CLUSTER_PERIPHCLK				8
+#define CLK_DOUT_CPUCL_CLUSTER_GICCLK					9
+#define CLK_DOUT_CPUCL_CLUSTER_PCLK					10
+#define CLK_DOUT_CPUCL_CMUREF						11
+#define CLK_DOUT_CPUCL_CLUSTER_ATCLK					12
+#define CLK_DOUT_CPUCL_CLUSTER_SCU					13
+#define CLK_DOUT_CPUCL_DBG						14
+#define CLK_GOUT_CPUCL_SHORTSTOP					15
+#define CLK_GOUT_CPUCL_CLUSTER_CPU					16
+#define CLK_GOUT_CPUCL_CSSYS_IPCLKPORT_ATCLK				17
+#define CLK_GOUT_CPUCL_CSSYS_IPCLKPORT_PCLKDBG				18
+
+/* CMU_FSYS0 */
+#define CLK_MOUT_FSYS0_BUS_USER						1
+#define CLK_MOUT_FSYS0_IP_USER						2
+#define CLK_MOUT_FSYS0_MAIN_USER					3
+#define CLK_DOUT_FSYS0_125						4
+#define CLK_DOUT_FSYS0_ADC						5
+#define CLK_DOUT_FSYS0_BUS_300						6
+#define CLK_DOUT_FSYS0_EQOS0						7
+#define CLK_DOUT_FSYS0_EQOS1						8
+#define CLK_DOUT_FSYS0_MMC_CARD0					9
+#define CLK_DOUT_FSYS0_MMC_CARD1					10
+#define CLK_DOUT_FSYS0_MMC_CARD2					11
+#define CLK_DOUT_FSYS0_QSPI						12
+#define CLK_DOUT_FSYS0_SFMC_NAND					13
+#define CLK_GOUT_FSYS0_EQOS_TOP0_IPCLKPORT_ACLK_I			14
+#define CLK_GOUT_FSYS0_EQOS_TOP0_IPCLKPORT_CLK_CSR_I			15
+#define CLK_GOUT_FSYS0_EQOS_TOP0_IPCLKPORT_I_RGMII_PHASE_CLK_250	16
+#define CLK_GOUT_FSYS0_EQOS_TOP0_IPCLKPORT_I_RGMII_TXCLK		17
+#define CLK_GOUT_FSYS0_EQOS_TOP1_IPCLKPORT_I_RGMII_PHASE_CLK_250	18
+#define CLK_GOUT_FSYS0_EQOS_TOP1_IPCLKPORT_I_RGMII_TXCLK		19
+#define CLK_GOUT_FSYS0_EQOS_TOP1_IPCLKPORT_ACLK_I			20
+#define CLK_GOUT_FSYS0_EQOS_TOP1_IPCLKPORT_CLK_CSR_I			21
+#define CLK_GOUT_FSYS0_I3C0_IPCLKPORT_I_APB_S_PCLK			22
+#define CLK_GOUT_FSYS0_I3C0_IPCLKPORT_I_CORE_CLK			23
+#define CLK_GOUT_FSYS0_I3C0_IPCLKPORT_I_DMA_CLK				24
+#define CLK_GOUT_FSYS0_I3C0_IPCLKPORT_I_HDR_TX_CLK			25
+#define CLK_GOUT_FSYS0_I3C1_IPCLKPORT_I_APB_S_PCLK			26
+#define CLK_GOUT_FSYS0_I3C1_IPCLKPORT_I_CORE_CLK			27
+#define CLK_GOUT_FSYS0_I3C1_IPCLKPORT_I_DMA_CLK				28
+#define CLK_GOUT_FSYS0_I3C1_IPCLKPORT_I_HDR_TX_CLK			29
+#define CLK_GOUT_FSYS0_MMC0_IPCLKPORT_SDCLKIN				30
+#define CLK_GOUT_FSYS0_MMC1_IPCLKPORT_SDCLKIN				31
+#define CLK_GOUT_FSYS0_MMC2_IPCLKPORT_SDCLKIN				32
+#define CLK_GOUT_FSYS0_QSPI_IPCLKPORT_HCLK				33
+#define CLK_GOUT_FSYS0_QSPI_IPCLKPORT_SSI_CLK				34
+#define CLK_GOUT_FSYS0_SFMC_IPCLKPORT_I_ACLK_NAND			35
+#define CLK_GOUT_FSYS0_I2C0_IPCLKPORT_I_PCLK				36
+#define CLK_GOUT_FSYS0_I2C1_IPCLKPORT_I_PCLK				37
+#define CLK_GOUT_FSYS0_MMC0_IPCLKPORT_I_ACLK				38
+#define CLK_GOUT_FSYS0_MMC1_IPCLKPORT_I_ACLK				39
+#define CLK_GOUT_FSYS0_MMC2_IPCLKPORT_I_ACLK				40
+#define CLK_GOUT_FSYS0_PWM_IPCLKPORT_I_PCLK_S0				41
+
+/* CMU_FSYS1 */
+#define CLK_FOUT_FSYS1_PLL						1
+#define CLK_MOUT_FSYS1_SCAN0_USER					2
+#define CLK_MOUT_FSYS1_SCAN1_USER					3
+#define CLK_MOUT_FSYS1_BUS_USER						4
+#define CLK_DOUT_FSYS1_200						5
+#define CLK_DOUT_FSYS1_BUS_300						6
+#define CLK_DOUT_FSYS1_OTP_MEM						7
+#define CLK_DOUT_FSYS1_PCIE_PHY_REFCLK_SYSPLL				8
+#define CLK_GOUT_FSYS1_IPCLKPORT_PCIE_PHY_APB2CR_PCLK_100		9
+#define CLK_GOUT_FSYS1_UART0_PCLK					10
+#define CLK_GOUT_FSYS1_UART0_SCLK_UART					11
+#define CLK_GOUT_FSYS1_IPCLKPORT_PCIE_PHY_APB2CR_PCLK_300		12
+#define CLK_GOUT_FSYS1_IPCLKPORT_PCIE_SUB_CON_X1_DBI_ACLK_SOC		13
+#define CLK_GOUT_FSYS1_IPCLKPORT_PCIE_SUB_CON_X1_MSTR_ACLK_SOC		14
+#define CLK_GOUT_FSYS1_IPCLKPORT_PCIE_SUB_CON_X1_SLV_ACLK_SOC		15
+#define CLK_GOUT_FSYS1_IPCLKPORT_PCIE_SUB_CON_X2_DBI_ACLK_SOC		16
+#define CLK_GOUT_FSYS1_IPCLKPORT_PCIE_SUB_CON_X2_MSTR_ACLK_SOC		17
+#define CLK_GOUT_FSYS1_IPCLKPORT_PCIE_SUB_CON_X2_SLV_ACLK_SOC		18
+#define CLK_GOUT_FSYS1_USB20DRD_IPCLKPORT_ACLK_PHYCTRL_20		19
+#define CLK_GOUT_FSYS1_USB20DRD_IPCLKPORT_BUS_CLK_EARLY			20
+#define CLK_GOUT_FSYS1_XHB_AHBBR_FSYS1_IPCLKPORT_CLK			21
+#define CLK_GOUT_FSYS1_XHB_USB_IPCLKPORT_CLK				22
+
+/* CMU_IMEM */
+#define CLK_MOUT_IMEM_ACLK_USER						1
+#define CLK_MOUT_IMEM_CA5_USER						2
+#define CLK_MOUT_IMEM_SSS_USER						3
+#define CLK_MOUT_IMEM_JPEG_USER						4
+#define CLK_DOUT_IMEM_PCLK						5
+#define CLK_GOUT_IMEM_CA5_0_IPCLKPORT_ATCLK				6
+#define CLK_GOUT_IMEM_CA5_0_IPCLKPORT_CLKIN				7
+#define CLK_GOUT_IMEM_CA5_0_IPCLKPORT_PCLK_DBG				8
+#define CLK_GOUT_IMEM_CA5_1_IPCLKPORT_ATCLK				9
+#define CLK_GOUT_IMEM_CA5_1_IPCLKPORT_CLKIN				10
+#define CLK_GOUT_IMEM_CA5_1_IPCLKPORT_PCLK_DBG				11
+#define CLK_GOUT_IMEM_MCT0_PCLK						12
+#define CLK_GOUT_IMEM_MCT1_PCLK						13
+#define CLK_GOUT_IMEM_MCT2_PCLK						14
+#define CLK_GOUT_IMEM_MCT3_PCLK						15
+#define CLK_GOUT_IMEM_PCLK_TMU0_APBIF					16
+
+/* CMU_PERI */
+#define CLK_MOUT_PERI_IP_USER						1
+#define CLK_MOUT_PERI_DISP_USER						2
+#define CLK_DOUT_PERI_125						3
+#define CLK_DOUT_PERI_PCLK						4
+#define CLK_DOUT_PERI_SPI						5
+#define CLK_DOUT_PERI_UART1						6
+#define CLK_DOUT_PERI_UART2						7
+#define CLK_GOUT_PERI_DMA4DSIM_IPCLKPORT_CLK_APB_CLK			8
+#define CLK_GOUT_PERI_DMA4DSIM_IPCLKPORT_CLK_AXI_CLK			9
+#define CLK_GOUT_PERI_I3C2_IPCLKPORT_I_APB_S_PCLK			10
+#define CLK_GOUT_PERI_I3C2_IPCLKPORT_I_CORE_CLK				11
+#define CLK_GOUT_PERI_I3C2_IPCLKPORT_I_DMA_CLK				12
+#define CLK_GOUT_PERI_I3C2_IPCLKPORT_I_HDR_TX_CLK			13
+#define CLK_GOUT_PERI_I3C3_IPCLKPORT_I_APB_S_PCLK			14
+#define CLK_GOUT_PERI_I3C3_IPCLKPORT_I_CORE_CLK				15
+#define CLK_GOUT_PERI_I3C3_IPCLKPORT_I_DMA_CLK				16
+#define CLK_GOUT_PERI_I3C3_IPCLKPORT_I_HDR_TX_CLK			17
+#define CLK_GOUT_PERI_APB_ASYNC_DSIM_IPCLKPORT_PCLKS			18
+#define CLK_GOUT_PERI_I2C2_IPCLKPORT_I_PCLK				19
+#define CLK_GOUT_PERI_I2C3_IPCLKPORT_I_PCLK				20
+#define CLK_GOUT_PERI_SPI0_PCLK						21
+#define CLK_GOUT_PERI_SPI0_SCLK_SPI					22
+#define CLK_GOUT_PERI_UART1_PCLK					23
+#define CLK_GOUT_PERI_UART1_SCLK_UART					24
+#define CLK_GOUT_PERI_UART2_PCLK					25
+#define CLK_GOUT_PERI_UART2_SCLK_UART					26
+
+#endif /* _DT_BINDINGS_CLOCK_ARTPEC9_H */
--
2.17.1


