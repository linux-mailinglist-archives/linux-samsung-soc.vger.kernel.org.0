Return-Path: <linux-samsung-soc+bounces-10941-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DE5B56875
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 14 Sep 2025 14:21:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 540663B6190
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 14 Sep 2025 12:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B0626561D;
	Sun, 14 Sep 2025 12:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XBoz+LlO"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43180231827
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 12:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757852486; cv=none; b=L8X6dg4iF0ByTTFQIdkPmdjtijTKsAxUGqYGCP+Xv3uqB7LLcDm8CrDTHCcwaItAeTeeYSPF2B4vNSX7BvJeV/SxM6OgtvCEAcc98z/0BrlwfWxonYSVivqeXMkNHp4kkA/jnXmjAdpdSW8v6ypACqyrNrbzG4mBkfzABAkm3eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757852486; c=relaxed/simple;
	bh=OV5y/G8xIGlEV/xOZs1fFlRfDWg2HVZ1hfEvQI7coNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JqYYo+UtxD3jCwrjrc7X2KE5tY9O8i8PGVwb2ZoY/QfLyyVYt1UKhqtgIlzy1BCxHPOIISxlo0XVLZjY602yqbMtOUKaPrVf/wBE5AU3uJMlYjyYBtT03j5P460SoskTVK1O7/aC7Ab6cfIgUPURq9uMl63VzSB2H6ejYGwv1A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XBoz+LlO; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45dec026c78so33026205e9.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 05:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757852481; x=1758457281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rw1RXz5k+b6wCmqOEgstV94i8rz1Nekrr/VwBotdGCw=;
        b=XBoz+LlO8sVlllNZVT8Etg/+lJ/FT1SQrFRjcg46Lyqpjo5LPYZZKexpEzasJbDZYQ
         MDGbjg9xWmoTP9NhPWHKPpQXbz8uGIyatVBXVHTcMM8sBM8w7QSMkV3zDv3LnYieF7J+
         QCjMqqlMRKnUML3/zeZbpOGYlvaXhGowrCjQWYjYvrTp/cQY6L+UPVPcGsO07GKVcPrE
         49IYa/f2ka2o1FmYTUSEZybgYbcf63JYcv8Nrx0guDlmjtDbhaOB8DqYa4ALNlz2ZHHz
         nDz/xF7P6ErIyHdpGTKPdo/GlxznkwT6FpZ+oflWl7F+0lx41wqa+UoaziTqlaSIfJsA
         dRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757852481; x=1758457281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rw1RXz5k+b6wCmqOEgstV94i8rz1Nekrr/VwBotdGCw=;
        b=WM+IWTr07eYBI0x8DyyDi33D7l0NVDen+nDl9+ULLeRni5EIJzqXzxcPjpoj+MX9Di
         pTKEs4Hde5YKErw8r4woWws47FlXpDcP1oSXr6E1PAL2s/ZUafhNkrSeoxfc93oqSbKE
         MW1BEanMxnfhJncSbVDtzevzi2YECWJfrbxmWt23ifmfrD8Q4PhDgZA7C2jKVVdF3h3M
         +TkceHV0xv+zECBkPSSJ48jQH9thhb8WKw4Xll1eeTAGxgcOvEUIo7PB8xxErQszYYJP
         8S1kU9aFcAx015q5c5sdxe3Cwbb7PKUuEWDjlx8JO7tJjTguGdXz7avp+l83L3ms/7h2
         G48A==
X-Gm-Message-State: AOJu0YwBiXiEe+Uly+oFGdbBhdD+WV4LZ8rslzth5HaYCZq+1fOtO+RD
	VPH2jcXAvaNATxAyrJijIoYG7HOSHZKoddzlXaUEPYSR6v3/Ok5xEkzF
X-Gm-Gg: ASbGncup7R/eChXXkEIphWx16APbXe90zGrgJGyPrKzKIAwwykVLV0s5mJm6a8JTY+o
	CzfLiAV2sG3RdpW6Zt+encYl8rYUm2hrFzW0oNm1Ln3wPfbDDh1r8VQjyoQPNXOAq1pR2oF/Q63
	FEy7J4946Zk1Fb023ux+zGkTzBNG/NYlkbz3x16Zg5LHbu+lMY6/qc6Xik78yT2IQKyNGMZdrlb
	rqXAdDdfkJ55z6UYRUEpa/ZOYaq/FeeG0tCs6HmQV0yrfQ2IOMoLN0YhYVdakZdJUPcA8Gx3pzZ
	HTAUfFqnWUjT1W6nzAO2YUwRb8FH/AyYTUeG2UldgfPv2qNFsqUDFFykLPxJaR//Yw8ptE6Qede
	CuGA6OU9vLVLDaKkNX+lfC0tLIX2lAN2u19KQmSrx/s/am1Gj6YSjQNBbyrg4fHxbus9JU9lCew
	xSYqlgd6zPbpeZc1V9IiE=
X-Google-Smtp-Source: AGHT+IFushK6hv+S3FGrZDut+9XkZiw1Ig81Nni9N2iDt1oAh841A5wTzQQXza0KtQeFnpyE+EJiAA==
X-Received: by 2002:a05:600c:1c22:b0:45f:28cd:e033 with SMTP id 5b1f17b1804b1-45f28cde101mr41302125e9.10.1757852480302;
        Sun, 14 Sep 2025 05:21:20 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017b4222sm136476615e9.20.2025.09.14.05.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 05:21:19 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/5] dt-bindings: clock: add exynos8890 SoC
Date: Sun, 14 Sep 2025 15:21:12 +0300
Message-ID: <20250914122116.2616801-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914122116.2616801-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914122116.2616801-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide dt-schema documentation for exynos8890 SoC clock controller.
Add device tree clock binding definitions for the following CMU blocks:
- CMU_APOLLO
- CMU_AUD
- CMU_BUS0/1
- CMU_CCORE
- CMU_DISP0/1
- CMU_FSYS0/1
- CMU_G3D
- CMU_MIF0/1/2/3
- CMU_MNGS
- CMU_PERIC0/1
- CMU_PERIS
- CMU_TOP

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../clock/samsung,exynos8890-cmu.yaml         |  477 ++++++
 .../clock/samsung,exynos8890-cmu.h            | 1279 +++++++++++++++++
 2 files changed, 1756 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos8890-cmu.yaml
 create mode 100644 include/dt-bindings/clock/samsung,exynos8890-cmu.h

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos8890-cmu.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos8890-cmu.yaml
new file mode 100644
index 000000000..1346b3b9c
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos8890-cmu.yaml
@@ -0,0 +1,477 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/samsung,exynos8890-cmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos8890 SoC clock controller
+
+maintainers:
+  - Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+  - Chanwoo Choi <cw00.choi@samsung.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+description: |
+  Exynos8890 clock controller is comprised of several CMU units, generating
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
+  'include/dt-bindings/clock/samsung,exynos8890-cmu.h' header.
+
+properties:
+  compatible:
+    enum:
+      - samsung,exynos8890-cmu-apollo
+      - samsung,exynos8890-cmu-aud
+      - samsung,exynos8890-cmu-bus0
+      - samsung,exynos8890-cmu-bus1
+      - samsung,exynos8890-cmu-ccore
+      - samsung,exynos8890-cmu-disp0
+      - samsung,exynos8890-cmu-disp1
+      - samsung,exynos8890-cmu-fsys0
+      - samsung,exynos8890-cmu-fsys1
+      - samsung,exynos8890-cmu-g3d
+      - samsung,exynos8890-cmu-mif0
+      - samsung,exynos8890-cmu-mif1
+      - samsung,exynos8890-cmu-mif2
+      - samsung,exynos8890-cmu-mif3
+      - samsung,exynos8890-cmu-mngs
+      - samsung,exynos8890-cmu-peric0
+      - samsung,exynos8890-cmu-peric1
+      - samsung,exynos8890-cmu-peris
+      - samsung,exynos8890-cmu-top
+
+  clocks:
+    minItems: 1
+    maxItems: 15
+
+  clock-names:
+    minItems: 1
+    maxItems: 15
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
+            const: samsung,exynos8890-cmu-apollo
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_APOLLO BUS_PLL clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: bus
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos8890-cmu-aud
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_AUD PLL clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: pll
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos8890-cmu-bus0
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_BUS0 ACLK 528MHz clock (from CMU_TOP)
+            - description: CMU_BUS0 ACLK 200MHz clock (from CMU_TOP)
+            - description: CMU_BUS0 PCLK 132MHz clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: "528"
+            - const: "200"
+            - const: "132"
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos8890-cmu-bus1
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_BUS1 ACLK 528MHz clock (from CMU_BUS0)
+            - description: CMU_BUS1 PCLK 132MHz clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: "528"
+            - const: "132"
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos8890-cmu-ccore
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_CCORE ACLK 800MHz clock (from CMU_TOP)
+            - description: CMU_CCORE ACLK 264MHz clock (from CMU_TOP)
+            - description: CMU_CCORE ACLK G3D 800MHz clock (from CMU_TOP)
+            - description: CMU_CCORE ACLK 528MHz clock (from CMU_TOP)
+            - description: CMU_CCORE ACLK 132MHz clock (from CMU_TOP)
+            - description: CMU_CCORE PCLK 66MHz clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: "800"
+            - const: "264"
+            - const: g3d
+            - const: "528"
+            - const: "132"
+            - const: "66"
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos8890-cmu-disp0
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_DISP0 ACLK 0 400MHz clock (from CMU_TOP)
+            - description: CMU_DISP0 ACLK 1 400MHz clock (from CMU_TOP)
+            - description: CMU_DISP0 DECON0 ECLK0 clock (from CMU_TOP)
+            - description: CMU_DISP0 DECON0 VCLK0 clock (from CMU_TOP)
+            - description: CMU_DISP0 DECON0 VCLK1 clock (from CMU_TOP)
+            - description: CMU_DISP0 HDMI audio clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: "0_400"
+            - const: "1_400"
+            - const: eclk0
+            - const: vclk0
+            - const: vclk1
+            - const: audio
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos8890-cmu-disp1
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_DISP1 ACLK 0 400MHz clock (from CMU_TOP)
+            - description: CMU_DISP1 ACLK 1 400MHz clock (from CMU_TOP)
+            - description: CMU_DISP1 DECON1 ECLK0 clock (from CMU_TOP)
+            - description: CMU_DISP1 DECON1 ECLK1 clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: "0_400"
+            - const: "1_400"
+            - const: eclk0
+            - const: eclk01
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos8890-cmu-fsys0
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_FSYS0 ACLK 200MHz clock (from CMU_TOP)
+            - description: CMU_FSYS0 USB30DRD clock (from CMU_TOP)
+            - description: CMU_FSYS0 MMC0 clock (from CMU_TOP)
+            - description: CMU_FSYS0 UFS UNIPRO20 clock (from CMU_TOP)
+            - description: CMU_FSYS0 PHY 24MHz clock (from CMU_TOP)
+            - description: CMU_FSYS0 UFS UNIPRO config clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: "200"
+            - const: usb
+            - const: mmc
+            - const: unipro20
+            - const: 24m
+            - const: unipro_cfg
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos8890-cmu-fsys1
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_FSYS1 ACLK 200MHz clock (from CMU_TOP)
+            - description: CMU_FSYS1 MMC2 clock (from CMU_TOP)
+            - description: CMU_FSYS1 UFS UNIPRO20 clock (from CMU_TOP)
+            - description: CMU_FSYS1 UFS UNIPRO config clock (from CMU_TOP)
+            - description: CMU_FSYS1 PCIe PHY clock (from CMU_TOP)
+            - description: CMU_FSYS1 PCIe PLL clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: "200"
+            - const: mmc2
+            - const: unipro20
+            - const: unipro_cfg
+            - const: pcie_phy
+            - const: pcie_pll
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos8890-cmu-g3d
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_G3D PLL clock (from CMU_TOP)
+            - description: CMU_G3D BUS_PLL clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: pll
+            - const: bus
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos8890-cmu-mif0
+              - samsung,exynos8890-cmu-mif1
+              - samsung,exynos8890-cmu-mif2
+              - samsung,exynos8890-cmu-mif3
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_MIFx BUS_PLL clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: bus
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos8890-cmu-mngs
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_MNGS BUS_PLL clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: bus
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos8890-cmu-peric0
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_PERIC0 ACLK 66MHz clock (from CMU_TOP)
+            - description: CMU_PERIC0 UART0 clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: "66"
+            - const: uart0
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos8890-cmu-peric1
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_PERIC1 ACLK 66MHz clock (from CMU_TOP)
+            - description: CMU_PERIC1 SPI0 clock (from CMU_TOP)
+            - description: CMU_PERIC1 SPI1 clock (from CMU_TOP)
+            - description: CMU_PERIC1 SPI2 clock (from CMU_TOP)
+            - description: CMU_PERIC1 SPI3 clock (from CMU_TOP)
+            - description: CMU_PERIC1 SPI4 clock (from CMU_TOP)
+            - description: CMU_PERIC1 SPI5 clock (from CMU_TOP)
+            - description: CMU_PERIC1 SPI6 clock (from CMU_TOP)
+            - description: CMU_PERIC1 SPI7 clock (from CMU_TOP)
+            - description: CMU_PERIC1 UART1 clock (from CMU_TOP)
+            - description: CMU_PERIC1 UART2 clock (from CMU_TOP)
+            - description: CMU_PERIC1 UART3 clock (from CMU_TOP)
+            - description: CMU_PERIC1 UART4 clock (from CMU_TOP)
+            - description: CMU_PERIC1 UART5 clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: "66"
+            - const: spi0
+            - const: spi1
+            - const: spi2
+            - const: spi3
+            - const: spi4
+            - const: spi5
+            - const: spi6
+            - const: spi7
+            - const: uart1
+            - const: uart2
+            - const: uart3
+            - const: uart4
+            - const: uart5
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos8890-cmu-peris
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_PERIS ACLK 66MHz clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: peris
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos8890-cmu-top
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
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/samsung,exynos8890-cmu.h>
+
+    cmu_peric1: clock-controller@14c80000 {
+        compatible = "samsung,exynos8890-cmu-peric1";
+        reg = <0x14c80000 0x8000>;
+        #clock-cells = <1>;
+        clocks = <&oscclk>,
+                 <&cmu_top CLK_GOUT_TOP_ACLK_PERIC1_66>,
+                 <&cmu_top CLK_GOUT_TOP_SCLK_PERIC1_SPI0>,
+                 <&cmu_top CLK_GOUT_TOP_SCLK_PERIC1_SPI1>,
+                 <&cmu_top CLK_GOUT_TOP_SCLK_PERIC1_SPI2>,
+                 <&cmu_top CLK_GOUT_TOP_SCLK_PERIC1_SPI3>,
+                 <&cmu_top CLK_GOUT_TOP_SCLK_PERIC1_SPI4>,
+                 <&cmu_top CLK_GOUT_TOP_SCLK_PERIC1_SPI5>,
+                 <&cmu_top CLK_GOUT_TOP_SCLK_PERIC1_SPI6>,
+                 <&cmu_top CLK_GOUT_TOP_SCLK_PERIC1_SPI7>,
+                 <&cmu_top CLK_GOUT_TOP_SCLK_PERIC1_UART1>,
+                 <&cmu_top CLK_GOUT_TOP_SCLK_PERIC1_UART2>,
+                 <&cmu_top CLK_GOUT_TOP_SCLK_PERIC1_UART3>,
+                 <&cmu_top CLK_GOUT_TOP_SCLK_PERIC1_UART4>,
+                 <&cmu_top CLK_GOUT_TOP_SCLK_PERIC1_UART5>;
+        clock-names = "oscclk", "66", "spi0", "spi1", "spi2", "spi3",
+                      "spi4", "spi5", "spi6", "spi7", "uart1", "uart2",
+                      "uart3", "uart4", "uart5";
+    };
+
+...
diff --git a/include/dt-bindings/clock/samsung,exynos8890-cmu.h b/include/dt-bindings/clock/samsung,exynos8890-cmu.h
new file mode 100644
index 000000000..7fb96ba27
--- /dev/null
+++ b/include/dt-bindings/clock/samsung,exynos8890-cmu.h
@@ -0,0 +1,1279 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2025 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+ * Author: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+ *
+ * Device Tree binding constants for Exynos8890 clock controller.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_EXYNOS8890_H
+#define _DT_BINDINGS_CLOCK_EXYNOS8890_H
+
+/* top clocks */
+#define CLK_FOUT_G3D_PLL			1
+#define CLK_FOUT_BUS0_PLL			2
+#define CLK_FOUT_BUS1_PLL			3
+#define CLK_FOUT_BUS2_PLL			4
+#define CLK_FOUT_BUS3_PLL			5
+#define CLK_FOUT_MFC_PLL			6
+#define CLK_FOUT_ISP_PLL			7
+#define CLK_FOUT_AUD_PLL			8
+#define CLK_I_CP2AP_MIF_CLK			9
+#define CLK_MOUT_TOP_BUS0_PLL			10
+#define CLK_MOUT_TOP_BUS1_PLL			11
+#define CLK_MOUT_TOP_BUS2_PLL			12
+#define CLK_MOUT_TOP_BUS3_PLL			13
+#define CLK_MOUT_TOP_MFC_PLL			14
+#define CLK_MOUT_TOP_ISP_PLL			15
+#define CLK_MOUT_TOP_AUD_PLL			16
+#define CLK_MOUT_TOP_G3D_PLL			17
+#define CLK_MOUT_TOP_SCLK_BUS0_PLL		18
+#define CLK_MOUT_TOP_SCLK_BUS1_PLL		19
+#define CLK_MOUT_TOP_SCLK_BUS2_PLL		20
+#define CLK_MOUT_TOP_SCLK_BUS3_PLL		21
+#define CLK_MOUT_TOP_SCLK_MFC_PLL		22
+#define CLK_MOUT_TOP_SCLK_ISP_PLL		23
+#define CLK_MOUT_TOP_ACLK_CCORE_800		24
+#define CLK_MOUT_TOP_ACLK_CCORE_264		25
+#define CLK_MOUT_TOP_ACLK_CCORE_G3D_800		26
+#define CLK_MOUT_TOP_ACLK_CCORE_528		27
+#define CLK_MOUT_TOP_ACLK_CCORE_132		28
+#define CLK_MOUT_TOP_PCLK_CCORE_66		29
+#define CLK_MOUT_TOP_ACLK_BUS0_528		30
+#define CLK_MOUT_TOP_ACLK_BUS0_200		31
+#define CLK_MOUT_TOP_PCLK_BUS0_132		32
+#define CLK_MOUT_TOP_ACLK_BUS1_528		33
+#define CLK_MOUT_TOP_PCLK_BUS1_132		34
+#define CLK_MOUT_TOP_ACLK_DISP0_0_400		35
+#define CLK_MOUT_TOP_ACLK_DISP0_1_400		36
+#define CLK_MOUT_TOP_ACLK_DISP1_0_400		37
+#define CLK_MOUT_TOP_ACLK_DISP1_1_400		38
+#define CLK_MOUT_TOP_ACLK_MFC_600		39
+#define CLK_MOUT_TOP_ACLK_MSCL0_528		40
+#define CLK_MOUT_TOP_ACLK_MSCL1_528		41
+#define CLK_MOUT_TOP_ACLK_IMEM_266		42
+#define CLK_MOUT_TOP_ACLK_IMEM_200		43
+#define CLK_MOUT_TOP_ACLK_IMEM_100		44
+#define CLK_MOUT_TOP_ACLK_FSYS0_200		45
+#define CLK_MOUT_TOP_ACLK_FSYS1_200		46
+#define CLK_MOUT_TOP_ACLK_PERIS_66		47
+#define CLK_MOUT_TOP_ACLK_PERIC0_66		48
+#define CLK_MOUT_TOP_ACLK_PERIC1_66		49
+#define CLK_MOUT_TOP_ACLK_ISP0_ISP0_528		50
+#define CLK_MOUT_TOP_ACLK_ISP0_TPU_400		51
+#define CLK_MOUT_TOP_ACLK_ISP0_TREX_528		52
+#define CLK_MOUT_TOP_ACLK_ISP0_PXL_ASBS_IS_C_FROM_IS_D	53
+#define CLK_MOUT_TOP_ACLK_ISP1_ISP1_468		54
+#define CLK_MOUT_TOP_ACLK_CAM0_CSIS0_414	55
+#define CLK_MOUT_TOP_ACLK_CAM0_CSIS1_168	56
+#define CLK_MOUT_TOP_ACLK_CAM0_CSIS2_234	57
+#define CLK_MOUT_TOP_ACLK_CAM0_3AA0_414		58
+#define CLK_MOUT_TOP_ACLK_CAM0_3AA1_414		59
+#define CLK_MOUT_TOP_ACLK_CAM0_CSIS3_132	60
+#define CLK_MOUT_TOP_ACLK_CAM0_TREX_528		61
+#define CLK_MOUT_TOP_ACLK_CAM1_ARM_672		62
+#define CLK_MOUT_TOP_ACLK_CAM1_TREX_VRA_528	63
+#define CLK_MOUT_TOP_ACLK_CAM1_TREX_B_528	64
+#define CLK_MOUT_TOP_ACLK_CAM1_BUS_264		65
+#define CLK_MOUT_TOP_ACLK_CAM1_PERI_84		66
+#define CLK_MOUT_TOP_ACLK_CAM1_CSIS2_414	67
+#define CLK_MOUT_TOP_ACLK_CAM1_CSIS3_132	68
+#define CLK_MOUT_TOP_ACLK_CAM1_SCL_566		69
+#define CLK_MOUT_TOP_SCLK_DISP0_DECON0_ECLK0	70
+#define CLK_MOUT_TOP_SCLK_DISP0_DECON0_VCLK0	71
+#define CLK_MOUT_TOP_SCLK_DISP0_DECON0_VCLK1	72
+#define CLK_MOUT_TOP_SCLK_DISP0_HDMI_AUDIO	73
+#define CLK_MOUT_TOP_SCLK_DISP1_DECON1_ECLK0	74
+#define CLK_MOUT_TOP_SCLK_DISP1_DECON1_ECLK1	75
+#define CLK_MOUT_TOP_SCLK_FSYS0_USBDRD30	76
+#define CLK_MOUT_TOP_SCLK_FSYS0_MMC0		77
+#define CLK_MOUT_TOP_SCLK_FSYS0_UFSUNIPRO20	78
+#define CLK_MOUT_TOP_SCLK_FSYS0_PHY_24M		79
+#define CLK_MOUT_TOP_SCLK_FSYS0_UFSUNIPRO_CFG	80
+#define CLK_MOUT_TOP_SCLK_FSYS1_MMC2		81
+#define CLK_MOUT_TOP_SCLK_FSYS1_UFSUNIPRO20	82
+#define CLK_MOUT_TOP_SCLK_FSYS1_PCIE_PHY	83
+#define CLK_MOUT_TOP_SCLK_FSYS1_UFSUNIPRO_CFG	84
+#define CLK_MOUT_TOP_SCLK_PERIC0_UART0		85
+#define CLK_MOUT_TOP_SCLK_PERIC1_SPI0		86
+#define CLK_MOUT_TOP_SCLK_PERIC1_SPI1		87
+#define CLK_MOUT_TOP_SCLK_PERIC1_SPI2		88
+#define CLK_MOUT_TOP_SCLK_PERIC1_SPI3		89
+#define CLK_MOUT_TOP_SCLK_PERIC1_SPI4		90
+#define CLK_MOUT_TOP_SCLK_PERIC1_SPI5		91
+#define CLK_MOUT_TOP_SCLK_PERIC1_SPI6		92
+#define CLK_MOUT_TOP_SCLK_PERIC1_SPI7		93
+#define CLK_MOUT_TOP_SCLK_PERIC1_UART1		94
+#define CLK_MOUT_TOP_SCLK_PERIC1_UART2		95
+#define CLK_MOUT_TOP_SCLK_PERIC1_UART3		96
+#define CLK_MOUT_TOP_SCLK_PERIC1_UART4		97
+#define CLK_MOUT_TOP_SCLK_PERIC1_UART5		98
+#define CLK_MOUT_TOP_SCLK_CAM1_ISP_SPI0		99
+#define CLK_MOUT_TOP_SCLK_CAM1_ISP_SPI1		100
+#define CLK_MOUT_TOP_SCLK_CAM1_ISP_UART		101
+#define CLK_MOUT_TOP_SCLK_AP2CP_MIF_PLL_OUT	102
+#define CLK_MOUT_TOP_ACLK_PSCDC_400		103
+#define CLK_MOUT_TOP_SCLK_BUS_PLL_MNGS		104
+#define CLK_MOUT_TOP_SCLK_BUS_PLL_APOLLO	105
+#define CLK_MOUT_TOP_SCLK_BUS_PLL_MIF		106
+#define CLK_MOUT_TOP_SCLK_BUS_PLL_G3D		107
+#define CLK_MOUT_TOP_SCLK_ISP_SENSOR0		108
+#define CLK_MOUT_TOP_SCLK_ISP_SENSOR1		109
+#define CLK_MOUT_TOP_SCLK_ISP_SENSOR2		110
+#define CLK_MOUT_TOP_SCLK_ISP_SENSOR3		111
+#define CLK_MOUT_TOP_SCLK_PROMISE_INT		112
+#define CLK_MOUT_TOP_SCLK_PROMISE_DISP		113
+#define CLK_MOUT_TOP_CP2AP_MIF_CLK_USER		114
+#define CLK_MOUT_TOP_MIF_PLL			115
+#define CLK_MOUT_TOP_BUS_PLL_MIF		116
+#define CLK_MOUT_TOP_ACLK_MIF_PLL		117
+#define CLK_DOUT_TOP_ACLK_CCORE_800		118
+#define CLK_DOUT_TOP_ACLK_CCORE_264		119
+#define CLK_DOUT_TOP_ACLK_CCORE_G3D_800		120
+#define CLK_DOUT_TOP_ACLK_CCORE_528		121
+#define CLK_DOUT_TOP_ACLK_CCORE_132		122
+#define CLK_DOUT_TOP_PCLK_CCORE_66		123
+#define CLK_DOUT_TOP_ACLK_BUS0_528		124
+#define CLK_DOUT_TOP_ACLK_BUS0_200		125
+#define CLK_DOUT_TOP_PCLK_BUS0_132		126
+#define CLK_DOUT_TOP_ACLK_BUS1_528		127
+#define CLK_DOUT_TOP_PCLK_BUS1_132		128
+#define CLK_DOUT_TOP_ACLK_DISP0_0_400		129
+#define CLK_DOUT_TOP_ACLK_DISP0_1_400		130
+#define CLK_DOUT_TOP_ACLK_DISP1_0_400		131
+#define CLK_DOUT_TOP_ACLK_DISP1_1_400		132
+#define CLK_DOUT_TOP_ACLK_MFC_600		133
+#define CLK_DOUT_TOP_ACLK_MSCL0_528		134
+#define CLK_DOUT_TOP_ACLK_MSCL1_528		135
+#define CLK_DOUT_TOP_ACLK_IMEM_266		136
+#define CLK_DOUT_TOP_ACLK_IMEM_200		137
+#define CLK_DOUT_TOP_ACLK_IMEM_100		138
+#define CLK_DOUT_TOP_ACLK_FSYS0_200		139
+#define CLK_DOUT_TOP_ACLK_FSYS1_200		140
+#define CLK_DOUT_TOP_ACLK_PERIS_66		141
+#define CLK_DOUT_TOP_ACLK_PERIC0_66		142
+#define CLK_DOUT_TOP_ACLK_PERIC1_66		143
+#define CLK_DOUT_TOP_ACLK_ISP0_ISP0_528		144
+#define CLK_DOUT_TOP_ACLK_ISP0_TPU_400		145
+#define CLK_DOUT_TOP_ACLK_ISP0_TREX_528		146
+#define CLK_DOUT_TOP_ACLK_ISP0_PXL_ASBS_IS_C_FROM_IS_D	147
+#define CLK_DOUT_TOP_ACLK_ISP1_ISP1_468		148
+#define CLK_DOUT_TOP_ACLK_CAM0_CSIS0_414	149
+#define CLK_DOUT_TOP_ACLK_CAM0_CSIS1_168	150
+#define CLK_DOUT_TOP_ACLK_CAM0_CSIS2_234	151
+#define CLK_DOUT_TOP_ACLK_CAM0_3AA0_414		152
+#define CLK_DOUT_TOP_ACLK_CAM0_3AA1_414		153
+#define CLK_DOUT_TOP_ACLK_CAM0_CSIS3_132	154
+#define CLK_DOUT_TOP_ACLK_CAM0_TREX_528		155
+#define CLK_DOUT_TOP_ACLK_CAM1_ARM_672		156
+#define CLK_DOUT_TOP_ACLK_CAM1_TREX_VRA_528	157
+#define CLK_DOUT_TOP_ACLK_CAM1_TREX_B_528	158
+#define CLK_DOUT_TOP_ACLK_CAM1_BUS_264		159
+#define CLK_DOUT_TOP_ACLK_CAM1_PERI_84		160
+#define CLK_DOUT_TOP_ACLK_CAM1_CSIS2_414	161
+#define CLK_DOUT_TOP_ACLK_CAM1_CSIS3_132	162
+#define CLK_DOUT_TOP_ACLK_CAM1_SCL_566		163
+#define CLK_DOUT_TOP_SCLK_DISP0_DECON0_ECLK0	164
+#define CLK_DOUT_TOP_SCLK_DISP0_DECON0_VCLK0	165
+#define CLK_DOUT_TOP_SCLK_DISP0_DECON0_VCLK1	166
+#define CLK_DOUT_TOP_SCLK_DISP0_HDMI_AUDIO	167
+#define CLK_DOUT_TOP_SCLK_DISP1_DECON1_ECLK0	168
+#define CLK_DOUT_TOP_SCLK_DISP1_DECON1_ECLK1	169
+#define CLK_DOUT_TOP_SCLK_FSYS0_USBDRD30	170
+#define CLK_DOUT_TOP_SCLK_FSYS0_MMC0		171
+#define CLK_DOUT_TOP_SCLK_FSYS0_UFSUNIPRO20	172
+#define CLK_DOUT_TOP_SCLK_FSYS0_PHY_24M		173
+#define CLK_DOUT_TOP_SCLK_FSYS0_UFSUNIPRO_CFG	174
+#define CLK_DOUT_TOP_SCLK_FSYS1_MMC2		175
+#define CLK_DOUT_TOP_SCLK_FSYS1_UFSUNIPRO20	176
+#define CLK_DOUT_TOP_SCLK_FSYS1_PCIE_PHY	177
+#define CLK_DOUT_TOP_SCLK_FSYS1_UFSUNIPRO_CFG	178
+#define CLK_DOUT_TOP_SCLK_PERIC0_UART0		179
+#define CLK_DOUT_TOP_SCLK_PERIC1_SPI0		180
+#define CLK_DOUT_TOP_SCLK_PERIC1_SPI1		181
+#define CLK_DOUT_TOP_SCLK_PERIC1_SPI2		182
+#define CLK_DOUT_TOP_SCLK_PERIC1_SPI3		183
+#define CLK_DOUT_TOP_SCLK_PERIC1_SPI4		184
+#define CLK_DOUT_TOP_SCLK_PERIC1_SPI5		185
+#define CLK_DOUT_TOP_SCLK_PERIC1_SPI6		186
+#define CLK_DOUT_TOP_SCLK_PERIC1_SPI7		187
+#define CLK_DOUT_TOP_SCLK_PERIC1_UART1		188
+#define CLK_DOUT_TOP_SCLK_PERIC1_UART2		189
+#define CLK_DOUT_TOP_SCLK_PERIC1_UART3		190
+#define CLK_DOUT_TOP_SCLK_PERIC1_UART4		191
+#define CLK_DOUT_TOP_SCLK_PERIC1_UART5		192
+#define CLK_DOUT_TOP_SCLK_CAM1_ISP_SPI0		193
+#define CLK_DOUT_TOP_SCLK_CAM1_ISP_SPI1		194
+#define CLK_DOUT_TOP_SCLK_CAM1_ISP_UART		195
+#define CLK_DOUT_TOP_SCLK_AP2CP_MIF_PLL_OUT	196
+#define CLK_DOUT_TOP_ACLK_PSCDC_400		197
+#define CLK_DOUT_TOP_SCLK_BUS_PLL_MNGS		198
+#define CLK_DOUT_TOP_SCLK_BUS_PLL_APOLLO	199
+#define CLK_DOUT_TOP_SCLK_BUS_PLL_MIF		200
+#define CLK_DOUT_TOP_SCLK_BUS_PLL_G3D		201
+#define CLK_DOUT_TOP_SCLK_ISP_SENSOR0		202
+#define CLK_DOUT_TOP_SCLK_ISP_SENSOR1		203
+#define CLK_DOUT_TOP_SCLK_ISP_SENSOR2		204
+#define CLK_DOUT_TOP_SCLK_ISP_SENSOR3		205
+#define CLK_DOUT_TOP_SCLK_PROMISE_INT		206
+#define CLK_DOUT_TOP_SCLK_PROMISE_DISP		207
+#define CLK_TOP_FF_BUS0_PLL_DIV2		208
+#define CLK_TOP_FF_BUS1_PLL_DIV2		209
+#define CLK_TOP_FF_BUS2_PLL_DIV2		210
+#define CLK_TOP_FF_BUS3_PLL_DIV2		211
+#define CLK_TOP_FF_BUS3_PLL_DIV4		212
+#define CLK_TOP_FF_MFC_PLL_DIV2			213
+#define CLK_TOP_FF_ISP_PLL_DIV2			214
+#define CLK_UMOUT_TOP_BUS0_PLL			215
+#define CLK_UMOUT_TOP_BUS1_PLL			216
+#define CLK_UMOUT_TOP_BUS2_PLL			217
+#define CLK_UMOUT_TOP_BUS3_PLL			218
+#define CLK_UMOUT_TOP_MFC_PLL			219
+#define CLK_UMOUT_TOP_ISP_PLL			220
+#define CLK_UMOUT_TOP_AUD_PLL			221
+#define CLK_UMOUT_TOP_G3D_PLL			222
+#define CLK_UMOUT_TOP_SCLK_BUS0_PLL		223
+#define CLK_UMOUT_TOP_SCLK_BUS1_PLL		224
+#define CLK_UMOUT_TOP_SCLK_BUS2_PLL		225
+#define CLK_UMOUT_TOP_SCLK_BUS3_PLL		226
+#define CLK_UMOUT_TOP_SCLK_MFC_PLL		227
+#define CLK_UMOUT_TOP_SCLK_ISP_PLL		228
+#define CLK_UMOUT_TOP_ACLK_CCORE_800		229
+#define CLK_UMOUT_TOP_ACLK_CCORE_264		230
+#define CLK_UMOUT_TOP_ACLK_CCORE_G3D_800	231
+#define CLK_UMOUT_TOP_ACLK_CCORE_528		232
+#define CLK_UMOUT_TOP_ACLK_CCORE_132		233
+#define CLK_UMOUT_TOP_PCLK_CCORE_66		234
+#define CLK_UMOUT_TOP_ACLK_BUS0_528		235
+#define CLK_UMOUT_TOP_ACLK_BUS0_200		236
+#define CLK_UMOUT_TOP_PCLK_BUS0_132		237
+#define CLK_UMOUT_TOP_ACLK_BUS1_528		238
+#define CLK_UMOUT_TOP_PCLK_BUS1_132		239
+#define CLK_UMOUT_TOP_ACLK_DISP0_0_400		240
+#define CLK_UMOUT_TOP_ACLK_DISP0_1_400		241
+#define CLK_UMOUT_TOP_ACLK_DISP1_0_400		242
+#define CLK_UMOUT_TOP_ACLK_DISP1_1_400		243
+#define CLK_UMOUT_TOP_ACLK_MFC_600		244
+#define CLK_UMOUT_TOP_ACLK_MSCL0_528		245
+#define CLK_UMOUT_TOP_ACLK_MSCL1_528		246
+#define CLK_UMOUT_TOP_ACLK_IMEM_266		247
+#define CLK_UMOUT_TOP_ACLK_IMEM_200		248
+#define CLK_UMOUT_TOP_ACLK_IMEM_100		249
+#define CLK_UMOUT_TOP_ACLK_FSYS0_200		250
+#define CLK_UMOUT_TOP_ACLK_FSYS1_200		251
+#define CLK_UMOUT_TOP_ACLK_PERIS_66		252
+#define CLK_UMOUT_TOP_ACLK_PERIC0_66		253
+#define CLK_UMOUT_TOP_ACLK_PERIC1_66		254
+#define CLK_UMOUT_TOP_ACLK_ISP0_ISP0_528	255
+#define CLK_UMOUT_TOP_ACLK_ISP0_TPU_400		256
+#define CLK_UMOUT_TOP_ACLK_ISP0_TREX_528	257
+#define CLK_UMOUT_TOP_ACLK_ISP0_PXL_ASBS_IS_C_FROM_IS_D	258
+#define CLK_UMOUT_TOP_ACLK_ISP1_ISP1_468	259
+#define CLK_UMOUT_TOP_ACLK_CAM0_CSIS0_414	260
+#define CLK_UMOUT_TOP_ACLK_CAM0_CSIS1_168	261
+#define CLK_UMOUT_TOP_ACLK_CAM0_CSIS2_234	262
+#define CLK_UMOUT_TOP_ACLK_CAM0_3AA0_414	263
+#define CLK_UMOUT_TOP_ACLK_CAM0_3AA1_414	264
+#define CLK_UMOUT_TOP_ACLK_CAM0_CSIS3_132	265
+#define CLK_UMOUT_TOP_ACLK_CAM0_TREX_528	266
+#define CLK_UMOUT_TOP_ACLK_CAM1_ARM_672		267
+#define CLK_UMOUT_TOP_ACLK_CAM1_TREX_VRA_528	268
+#define CLK_UMOUT_TOP_ACLK_CAM1_TREX_B_528	269
+#define CLK_UMOUT_TOP_ACLK_CAM1_BUS_264		270
+#define CLK_UMOUT_TOP_ACLK_CAM1_PERI_84		271
+#define CLK_UMOUT_TOP_ACLK_CAM1_CSIS2_414	272
+#define CLK_UMOUT_TOP_ACLK_CAM1_CSIS3_132	273
+#define CLK_UMOUT_TOP_ACLK_CAM1_SCL_566		274
+#define CLK_UMOUT_TOP_SCLK_DISP0_DECON0_ECLK0	275
+#define CLK_UMOUT_TOP_SCLK_DISP0_DECON0_VCLK0	276
+#define CLK_UMOUT_TOP_SCLK_DISP0_DECON0_VCLK1	277
+#define CLK_UMOUT_TOP_SCLK_DISP0_HDMI_AUDIO	278
+#define CLK_UMOUT_TOP_SCLK_DISP1_DECON1_ECLK0	279
+#define CLK_UMOUT_TOP_SCLK_DISP1_DECON1_ECLK1	280
+#define CLK_UMOUT_TOP_SCLK_FSYS0_USBDRD30	281
+#define CLK_UMOUT_TOP_SCLK_FSYS0_MMC0		282
+#define CLK_UMOUT_TOP_SCLK_FSYS0_UFSUNIPRO20	283
+#define CLK_UMOUT_TOP_SCLK_FSYS0_PHY_24M	284
+#define CLK_UMOUT_TOP_SCLK_FSYS0_UFSUNIPRO_CFG	285
+#define CLK_UMOUT_TOP_SCLK_FSYS1_MMC2		286
+#define CLK_UMOUT_TOP_SCLK_FSYS1_UFSUNIPRO20	287
+#define CLK_UMOUT_TOP_SCLK_FSYS1_PCIE_PHY	288
+#define CLK_UMOUT_TOP_SCLK_FSYS1_UFSUNIPRO_CFG	289
+#define CLK_UMOUT_TOP_SCLK_PERIC0_UART0		290
+#define CLK_UMOUT_TOP_SCLK_PERIC1_SPI0		291
+#define CLK_UMOUT_TOP_SCLK_PERIC1_SPI1		292
+#define CLK_UMOUT_TOP_SCLK_PERIC1_SPI2		293
+#define CLK_UMOUT_TOP_SCLK_PERIC1_SPI3		294
+#define CLK_UMOUT_TOP_SCLK_PERIC1_SPI4		295
+#define CLK_UMOUT_TOP_SCLK_PERIC1_SPI5		296
+#define CLK_UMOUT_TOP_SCLK_PERIC1_SPI6		297
+#define CLK_UMOUT_TOP_SCLK_PERIC1_SPI7		298
+#define CLK_UMOUT_TOP_SCLK_PERIC1_UART1		299
+#define CLK_UMOUT_TOP_SCLK_PERIC1_UART2		300
+#define CLK_UMOUT_TOP_SCLK_PERIC1_UART3		301
+#define CLK_UMOUT_TOP_SCLK_PERIC1_UART4		302
+#define CLK_UMOUT_TOP_SCLK_PERIC1_UART5		303
+#define CLK_UMOUT_TOP_SCLK_CAM1_ISP_SPI0	304
+#define CLK_UMOUT_TOP_SCLK_CAM1_ISP_SPI1	305
+#define CLK_UMOUT_TOP_SCLK_CAM1_ISP_UART	306
+#define CLK_UMOUT_TOP_SCLK_AP2CP_MIF_PLL_OUT	307
+#define CLK_UMOUT_TOP_ACLK_PSCDC_400		308
+#define CLK_UMOUT_TOP_SCLK_BUS_PLL_MNGS		309
+#define CLK_UMOUT_TOP_SCLK_BUS_PLL_APOLLO	310
+#define CLK_UMOUT_TOP_SCLK_BUS_PLL_MIF		311
+#define CLK_UMOUT_TOP_SCLK_BUS_PLL_G3D		312
+#define CLK_UMOUT_TOP_SCLK_ISP_SENSOR0		313
+#define CLK_UMOUT_TOP_SCLK_ISP_SENSOR1		314
+#define CLK_UMOUT_TOP_SCLK_ISP_SENSOR2		315
+#define CLK_UMOUT_TOP_SCLK_ISP_SENSOR3		316
+#define CLK_UMOUT_TOP_SCLK_PROMISE_INT		317
+#define CLK_UMOUT_TOP_SCLK_PROMISE_DISP		318
+#define CLK_UMOUT_TOP_CP2AP_MIF_CLK_USER	319
+#define CLK_GOUT_TOP_ACLK_CCORE_800		320
+#define CLK_GOUT_TOP_ACLK_CCORE_264		321
+#define CLK_GOUT_TOP_ACLK_CCORE_G3D_800		322
+#define CLK_GOUT_TOP_ACLK_CCORE_528		323
+#define CLK_GOUT_TOP_ACLK_CCORE_132		324
+#define CLK_GOUT_TOP_PCLK_CCORE_66		325
+#define CLK_GOUT_TOP_ACLK_BUS0_528		326
+#define CLK_GOUT_TOP_ACLK_BUS0_200		327
+#define CLK_GOUT_TOP_PCLK_BUS0_132		328
+#define CLK_GOUT_TOP_ACLK_BUS1_528		329
+#define CLK_GOUT_TOP_PCLK_BUS1_132		330
+#define CLK_GOUT_TOP_ACLK_DISP0_0_400		331
+#define CLK_GOUT_TOP_ACLK_DISP0_1_400		332
+#define CLK_GOUT_TOP_ACLK_DISP1_0_400		333
+#define CLK_GOUT_TOP_ACLK_DISP1_1_400		334
+#define CLK_GOUT_TOP_ACLK_MFC_600		335
+#define CLK_GOUT_TOP_ACLK_MSCL0_528		336
+#define CLK_GOUT_TOP_ACLK_MSCL1_528		337
+#define CLK_GOUT_TOP_ACLK_IMEM_266		338
+#define CLK_GOUT_TOP_ACLK_IMEM_200		339
+#define CLK_GOUT_TOP_ACLK_IMEM_100		340
+#define CLK_GOUT_TOP_ACLK_FSYS0_200		341
+#define CLK_GOUT_TOP_ACLK_FSYS1_200		342
+#define CLK_GOUT_TOP_ACLK_PERIS_66		343
+#define CLK_GOUT_TOP_ACLK_PERIC0_66		344
+#define CLK_GOUT_TOP_ACLK_PERIC1_66		345
+#define CLK_GOUT_TOP_ACLK_ISP0_ISP0_528		346
+#define CLK_GOUT_TOP_ACLK_ISP0_TPU_400		347
+#define CLK_GOUT_TOP_ACLK_ISP0_TREX_528		348
+#define CLK_GOUT_TOP_ACLK_ISP0_PXL_ASBS_IS_C_FROM_IS_D	349
+#define CLK_GOUT_TOP_ACLK_ISP1_ISP1_468		350
+#define CLK_GOUT_TOP_ACLK_CAM0_CSIS0_414	351
+#define CLK_GOUT_TOP_ACLK_CAM0_CSIS1_168	352
+#define CLK_GOUT_TOP_ACLK_CAM0_CSIS2_234	353
+#define CLK_GOUT_TOP_ACLK_CAM0_3AA0_414		354
+#define CLK_GOUT_TOP_ACLK_CAM0_3AA1_414		355
+#define CLK_GOUT_TOP_ACLK_CAM0_CSIS3_132	356
+#define CLK_GOUT_TOP_ACLK_CAM0_TREX_528		357
+#define CLK_GOUT_TOP_ACLK_CAM1_ARM_672		358
+#define CLK_GOUT_TOP_ACLK_CAM1_TREX_VRA_528	359
+#define CLK_GOUT_TOP_ACLK_CAM1_TREX_B_528	360
+#define CLK_GOUT_TOP_ACLK_CAM1_BUS_264		361
+#define CLK_GOUT_TOP_ACLK_CAM1_PERI_84		362
+#define CLK_GOUT_TOP_ACLK_CAM1_CSIS2_414	363
+#define CLK_GOUT_TOP_ACLK_CAM1_CSIS3_132	364
+#define CLK_GOUT_TOP_ACLK_CAM1_SCL_566		365
+#define CLK_GOUT_TOP_SCLK_DISP0_DECON0_ECLK0	366
+#define CLK_GOUT_TOP_SCLK_DISP0_DECON0_VCLK0	367
+#define CLK_GOUT_TOP_SCLK_DISP0_DECON0_VCLK1	368
+#define CLK_GOUT_TOP_SCLK_DISP0_HDMI_AUDIO	369
+#define CLK_GOUT_TOP_SCLK_DISP1_DECON1_ECLK0	370
+#define CLK_GOUT_TOP_SCLK_DISP1_DECON1_ECLK1	371
+#define CLK_GOUT_TOP_SCLK_FSYS0_USBDRD30	372
+#define CLK_GOUT_TOP_SCLK_FSYS0_MMC0		373
+#define CLK_GOUT_TOP_SCLK_FSYS0_UFSUNIPRO20	374
+#define CLK_GOUT_TOP_SCLK_FSYS0_PHY_24M		375
+#define CLK_GOUT_TOP_SCLK_FSYS0_UFSUNIPRO_CFG	376
+#define CLK_GOUT_TOP_SCLK_FSYS1_MMC2		377
+#define CLK_GOUT_TOP_SCLK_FSYS1_UFSUNIPRO20	378
+#define CLK_GOUT_TOP_SCLK_FSYS1_PCIE_PHY	379
+#define CLK_GOUT_TOP_SCLK_FSYS1_UFSUNIPRO_CFG	380
+#define CLK_GOUT_TOP_SCLK_PERIC0_UART0		381
+#define CLK_GOUT_TOP_SCLK_PERIC1_SPI0		382
+#define CLK_GOUT_TOP_SCLK_PERIC1_SPI1		383
+#define CLK_GOUT_TOP_SCLK_PERIC1_SPI2		384
+#define CLK_GOUT_TOP_SCLK_PERIC1_SPI3		385
+#define CLK_GOUT_TOP_SCLK_PERIC1_SPI4		386
+#define CLK_GOUT_TOP_SCLK_PERIC1_SPI5		387
+#define CLK_GOUT_TOP_SCLK_PERIC1_SPI6		388
+#define CLK_GOUT_TOP_SCLK_PERIC1_SPI7		389
+#define CLK_GOUT_TOP_SCLK_PERIC1_UART1		390
+#define CLK_GOUT_TOP_SCLK_PERIC1_UART2		391
+#define CLK_GOUT_TOP_SCLK_PERIC1_UART3		392
+#define CLK_GOUT_TOP_SCLK_PERIC1_UART4		393
+#define CLK_GOUT_TOP_SCLK_PERIC1_UART5		394
+#define CLK_GOUT_TOP_SCLK_CAM1_ISP_SPI0		395
+#define CLK_GOUT_TOP_SCLK_CAM1_ISP_SPI1		396
+#define CLK_GOUT_TOP_SCLK_CAM1_ISP_UART		397
+#define CLK_GOUT_TOP_SCLK_AP2CP_MIF_PLL_OUT	398
+#define CLK_GOUT_TOP_ACLK_PSCDC_400		399
+#define CLK_GOUT_TOP_SCLK_BUS_PLL_MNGS		400
+#define CLK_GOUT_TOP_SCLK_BUS_PLL_APOLLO	401
+#define CLK_GOUT_TOP_SCLK_BUS_PLL_MIF		402
+#define CLK_GOUT_TOP_SCLK_BUS_PLL_G3D		403
+#define CLK_GOUT_TOP_SCLK_ISP_SENSOR0		404
+#define CLK_GOUT_TOP_SCLK_ISP_SENSOR1		405
+#define CLK_GOUT_TOP_SCLK_ISP_SENSOR2		406
+#define CLK_GOUT_TOP_SCLK_ISP_SENSOR3		407
+#define CLK_GOUT_TOP_SCLK_PROMISE_INT		408
+#define CLK_GOUT_TOP_SCLK_PROMISE_DISP		409
+
+/* peris clocks */
+#define CLK_MOUT_PERIS_ACLK_PERIS_66_USER	1
+#define CLK_GOUT_PERIS_PCLK_SFR_APBIF_HDMI_CEC	2
+#define CLK_GOUT_PERIS_PCLK_SFR_APBIF_TMU	3
+#define CLK_GOUT_PERIS_PCLK_RTC_APBIF	4
+#define CLK_GOUT_PERIS_PCLK_MONOCNT_APBIF	5
+#define CLK_GOUT_PERIS_PCLK_WDT_APOLLO	6
+#define CLK_GOUT_PERIS_PCLK_WDT_MNGS	7
+#define CLK_GOUT_PERIS_PCLK_MCT		8
+#define CLK_GOUT_PERIS_PCLK_SYSREG_PERIS	9
+#define CLK_GOUT_PERIS_PCLK_PMU_PERIS	10
+#define CLK_GOUT_PERIS_PCLK_CMU_PERIS	11
+#define CLK_GOUT_PERIS_ACLK_AXI2APB_PERIS1	12
+#define CLK_GOUT_PERIS_ACLK_AXI2APB_PERIS0	13
+#define CLK_GOUT_PERIS_ACLK_XIU_PERIS	14
+#define CLK_GOUT_PERIS_ACLK_AXI_LH_ASYNC	15
+#define CLK_GOUT_PERIS_PCLK_HPM_APBIF_PERIS	16
+#define CLK_GOUT_PERIS_PCLK_TZPC_15	17
+#define CLK_GOUT_PERIS_PCLK_TZPC_14	18
+#define CLK_GOUT_PERIS_PCLK_TZPC_13	19
+#define CLK_GOUT_PERIS_PCLK_TZPC_12	20
+#define CLK_GOUT_PERIS_PCLK_TZPC_11	21
+#define CLK_GOUT_PERIS_PCLK_TZPC_10	22
+#define CLK_GOUT_PERIS_PCLK_TZPC_9	23
+#define CLK_GOUT_PERIS_PCLK_TZPC_8	24
+#define CLK_GOUT_PERIS_PCLK_TZPC_7	25
+#define CLK_GOUT_PERIS_PCLK_TZPC_6	26
+#define CLK_GOUT_PERIS_PCLK_TZPC_5	27
+#define CLK_GOUT_PERIS_PCLK_TZPC_4	28
+#define CLK_GOUT_PERIS_PCLK_TZPC_3	29
+#define CLK_GOUT_PERIS_PCLK_TZPC_2	30
+#define CLK_GOUT_PERIS_PCLK_TZPC_1	31
+#define CLK_GOUT_PERIS_PCLK_TZPC_0	32
+#define CLK_GOUT_PERIS_PCLK_TOP_RTC	33
+#define CLK_GOUT_PERIS_PCLK_SFR_APBIF_CHIPID	34
+#define CLK_GOUT_PERIS_SCLK_CHIPID	35
+#define CLK_GOUT_PERIS_SCLK_TMU		36
+#define CLK_GOUT_PERIS_SCLK_PROMISE_PERIS	37
+
+/* apollo clocks */
+#define CLK_FOUT_APOLLO_PLL			1
+#define CLK_MOUT_APOLLO_APOLLO_PLL		2
+#define CLK_MOUT_APOLLO_BUS_PLL_APOLLO_USER	3
+#define CLK_MOUT_APOLLO_APOLLO			4
+#define CLK_DOUT_APOLLO_APOLLO			5
+#define CLK_DOUT_APOLLO_ACLK_APOLLO		6
+#define CLK_DOUT_APOLLO_ATCLK_APOLLO		7
+#define CLK_DOUT_APOLLO_PCLK_DBG_APOLLO		8
+#define CLK_DOUT_APOLLO_PCLK_APOLLO		9
+#define CLK_DOUT_APOLLO_CNTCLK_APOLLO		10
+#define CLK_DOUT_APOLLO_APOLLO_RUN_MONITOR	11
+#define CLK_DOUT_APOLLO_SCLK_PROMISE_APOLLO	12
+#define CLK_DOUT_APOLLO_APOLLO_PLL		13
+#define CLK_GOUT_APOLLO_ACLK_ASYNCACES_APOLLO_CCI	14
+#define CLK_GOUT_APOLLO_ACLK_ASATBSLV_APOLLO3_CSSYS	15
+#define CLK_GOUT_APOLLO_ACLK_ASATBSLV_APOLLO2_CSSYS	16
+#define CLK_GOUT_APOLLO_ACLK_ASATBSLV_APOLLO1_CSSYS	17
+#define CLK_GOUT_APOLLO_ACLK_ASATBSLV_APOLLO0_CSSYS	18
+#define CLK_GOUT_APOLLO_PCLKDBG_DUMP_PC_APOLLO	19
+#define CLK_GOUT_APOLLO_PCLKDBG_ASAPBMST_CSSYS_APOLLO	20
+#define CLK_GOUT_APOLLO_PCLK_SYSREG_APOLLO	21
+#define CLK_GOUT_APOLLO_PCLK_PMU_APOLLO		22
+#define CLK_GOUT_APOLLO_PCLK_AXI2APB_APOLLO_ACLK	23
+#define CLK_GOUT_APOLLO_PCLK_XIU_PERI_APOLLO_ACLK	24
+#define CLK_GOUT_APOLLO_PCLK_HPM_APOLLO		25
+#define CLK_GOUT_APOLLO_SCLK_APOLLO		26
+#define CLK_GOUT_APOLLO_SCLK_PROMISE_APOLLO	27
+
+/* aud clocks */
+#define CLK_MOUT_AUD_AUD_PLL_USER	1
+#define CLK_MOUT_AUD_SCLK_I2S		2
+#define CLK_MOUT_AUD_SCLK_PCM		3
+#define CLK_MOUT_AUD_CP2AP_AUD_CLK_USER	4
+#define CLK_MOUT_AUD_ACLK_CA5		5
+#define CLK_MOUT_AUD_CDCLK_AUD		6
+#define CLK_DOUT_AUD_AUD_CA5		7
+#define CLK_DOUT_AUD_ACLK_AUD		8
+#define CLK_DOUT_AUD_PCLK_DBG		9
+#define CLK_DOUT_AUD_ATCLK_AUD		10
+#define CLK_DOUT_AUD_AUD_CDCLK		11
+#define CLK_DOUT_AUD_SCLK_I2S		12
+#define CLK_DOUT_AUD_SCLK_PCM		13
+#define CLK_DOUT_AUD_SCLK_SLIMBUS	14
+#define CLK_DOUT_AUD_SCLK_CP_I2S	15
+#define CLK_DOUT_AUD_SCLK_ASRC		16
+#define CLK_DOUT_AUD_CP_CA5		17
+#define CLK_DOUT_AUD_CP_CDCLK		18
+#define CLK_SCLK_CP2AP_AUD_CLK		19
+#define CLK_IOCLK_AUDIOCDCLK0		20
+#define CLK_IOCLK_SLIMBUS_CLK		21
+#define CLK_IOCLK_I2S_BCLK		22
+#define CLK_GOUT_AUD_SCLK_CA5		23
+#define CLK_GOUT_AUD_PCLK_PPMU_AUD	24
+#define CLK_GOUT_AUD_PCLK_CP_I2S	25
+#define CLK_GOUT_AUD_PCLK_SYSREG_AUD	26
+#define CLK_GOUT_AUD_PCLK_GPIO_AUD	27
+#define CLK_GOUT_AUD_PCLK_PMU_AUD	28
+#define CLK_GOUT_AUD_PCLK_SLIMBUS	29
+#define CLK_GOUT_AUD_PCLK_PCM		30
+#define CLK_GOUT_AUD_PCLK_I2S		31
+#define CLK_GOUT_AUD_PCLK_TIMER		32
+#define CLK_GOUT_AUD_PCLK_SFR1		33
+#define CLK_GOUT_AUD_PCLK_SFR0		34
+#define CLK_GOUT_AUD_PCLK_SMMU		35
+#define CLK_GOUT_AUD_ACLK_PPMU_AUD	36
+#define CLK_GOUT_AUD_ACLK_INTR		37
+#define CLK_GOUT_AUD_ACLK_XIU_LPASSX	38
+#define CLK_GOUT_AUD_ACLK_SMMU		39
+#define CLK_GOUT_AUD_ACLK_AXI_LH_ASYNC_SI_TOP	40
+#define CLK_GOUT_AUD_ACLK_AXI_LH_ASYNC_MI_TOP	41
+#define CLK_GOUT_AUD_ACLK_AXI_US_32TO64	42
+#define CLK_GOUT_AUD_ACLK_SRAMC		43
+#define CLK_GOUT_AUD_ACLK_DMAC		44
+#define CLK_GOUT_AUD_PCLK_DBG		45
+#define CLK_GOUT_AUD_ACLK_ATCLK_AUD	46
+#define CLK_GOUT_AUD_SCLK_I2S		47
+#define CLK_GOUT_AUD_SCLK_PCM		48
+#define CLK_GOUT_AUD_SCLK_SLIMBUS	49
+#define CLK_GOUT_AUD_SCLK_CP_I2S	50
+#define CLK_GOUT_AUD_SCLK_ASRC		51
+#define CLK_GOUT_AUD_SCLK_SLIMBUS_CLKIN	52
+#define CLK_GOUT_AUD_SCLK_I2S_BCLK	53
+
+/* bus0 clocks */
+#define CLK_MOUT_BUS0_ACLK_BUS0_528_USER	1
+#define CLK_MOUT_BUS0_ACLK_BUS0_200_USER	2
+#define CLK_MOUT_BUS0_PCLK_BUS0_132_USER	3
+#define CLK_GOUT_BUS0_ACLK_ACE_FSYS1	4
+#define CLK_GOUT_BUS0_ACLK_LH_ISP0	5
+#define CLK_GOUT_BUS0_ACLK_LH_DISP11	6
+#define CLK_GOUT_BUS0_ACLK_LH_DISP10	7
+#define CLK_GOUT_BUS0_ACLK_LH_DISP01	8
+#define CLK_GOUT_BUS0_ACLK_LH_DISP00	9
+#define CLK_GOUT_BUS0_ACLK_LH_CAM1	10
+#define CLK_GOUT_BUS0_ACLK_LH_CAM0	11
+#define CLK_GOUT_BUS0_ACLK_TREX_BUS0	12
+#define CLK_GOUT_BUS0_ACLK_LH_FSYS1	13
+#define CLK_GOUT_BUS0_PCLK_CMU_BUS0	14
+#define CLK_GOUT_BUS0_PCLK_TREX_BUS0	15
+#define CLK_GOUT_BUS0_PCLK_PMU_BUS0	16
+#define CLK_GOUT_BUS0_PCLK_SYSREG_BUS0	17
+#define CLK_GOUT_BUS0_PCLK_LH_FSYS1SFRX	18
+#define CLK_GOUT_BUS0_PCLK_LH_PERIC1P	19
+#define CLK_GOUT_BUS0_PCLK_LH_PERIC0P	20
+#define CLK_GOUT_BUS0_PCLK_LH_PERISFRX	21
+#define CLK_GOUT_BUS0_PCLK_LH_DISP1SFRX	22
+#define CLK_GOUT_BUS0_PCLK_LH_DISP0SFRX	23
+#define CLK_GOUT_BUS0_PCLK_LH_ISPHX	24
+#define CLK_GOUT_BUS0_PCLK_LH_IS0X	25
+#define CLK_GOUT_BUS0_PCLK_AXI2APB_2MB_BUS0_TP	26
+#define CLK_GOUT_BUS0_PCLK_AHB2APB_BUS0P	27
+#define CLK_GOUT_BUS0_PCLK_AXI2APB_2MB_BUS0_TD	28
+#define CLK_GOUT_BUS0_PCLK_TREX_P_BUS0	29
+#define CLK_GOUT_BUS0_ACLK_TREX_P_BUS0	30
+
+/* bus1 clocks */
+#define CLK_MOUT_BUS1_ACLK_BUS1_528_USER	1
+#define CLK_MOUT_BUS1_PCLK_BUS1_132_USER	2
+#define CLK_GOUT_BUS1_ACLK_LH_MSCL1	3
+#define CLK_GOUT_BUS1_ACLK_LH_MSCL0	4
+#define CLK_GOUT_BUS1_ACLK_LH_MFC1	5
+#define CLK_GOUT_BUS1_ACLK_LH_MFC0	6
+#define CLK_GOUT_BUS1_ACLK_LH_FSYS0	7
+#define CLK_GOUT_BUS1_ACLK_TREX_BUS1	8
+#define CLK_GOUT_BUS1_PCLK_CMU_BUS1	9
+#define CLK_GOUT_BUS1_PCLK_TREX_BUS1	10
+#define CLK_GOUT_BUS1_PCLK_SYSREG_BUS1	11
+#define CLK_GOUT_BUS1_PCLK_PMU_BUS1	12
+#define CLK_GOUT_BUS1_PCLK_LH_MSCLSFRX	13
+#define CLK_GOUT_BUS1_PCLK_LH_MFCP	14
+#define CLK_GOUT_BUS1_PCLK_LH_FSYS0SFRX	15
+#define CLK_GOUT_BUS1_PCLK_AHB2APB_BUS1P	16
+#define CLK_GOUT_BUS1_PCLK_AXI2APB_2MB_BUS1_TP	17
+#define CLK_GOUT_BUS1_PCLK_AXI2APB_2MB_BUS1_TD	18
+#define CLK_GOUT_BUS1_PCLK_TREX_P_BUS1	19
+#define CLK_GOUT_BUS1_ACLK_TREX_P_BUS1	20
+
+/* ccore clocks */
+#define CLK_MOUT_CCORE_ACLK_CCORE_800_USER	1
+#define CLK_MOUT_CCORE_ACLK_CCORE_264_USER	2
+#define CLK_MOUT_CCORE_ACLK_CCORE_G3D_800_USER	3
+#define CLK_MOUT_CCORE_ACLK_CCORE_528_USER	4
+#define CLK_MOUT_CCORE_ACLK_CCORE_132_USER	5
+#define CLK_MOUT_CCORE_PCLK_CCORE_66_USER	6
+#define CLK_DOUT_CCORE_SCLK_HPM_CCORE		7
+#define CLK_GOUT_CCORE_ACLK_AXI_AS_SI_IRPM	8
+#define CLK_GOUT_CCORE_ACLK_MPACEBRIDGE		9
+#define CLK_GOUT_CCORE_ACLK_PULSE2HS		10
+#define CLK_GOUT_CCORE_ACLK_DBG_LH_MI_MIF_CCORE	11
+#define CLK_GOUT_CCORE_ACLK_SCI_PPC_WRAPPER	12
+#define CLK_GOUT_CCORE_ACLK_ACE_AS_MI_APL_CCORE	13
+#define CLK_GOUT_CCORE_ACLK_MPACE_SI		14
+#define CLK_GOUT_CCORE_ACLK_CPACE_MI		15
+#define CLK_GOUT_CCORE_ACLK_ATB_SI_CCOREBDU_MNGSCS	16
+#define CLK_GOUT_CCORE_ACLK_BDU			17
+#define CLK_GOUT_CCORE_ACLK_TREX_CCORE_SCI	18
+#define CLK_GOUT_CCORE_ACLK_SCI			19
+#define CLK_GOUT_CCORE_ACLK_CLEANY_CPPERI	20
+#define CLK_GOUT_CCORE_ACLK_AXI_US_CPPERI	21
+#define CLK_GOUT_CCORE_ACLK_AXI_LH_MI_CPPERI_CCORE	22
+#define CLK_GOUT_CCORE_ACLK_AXI_LH_SI_CCORESFRX_IMEMX	23
+#define CLK_GOUT_CCORE_ACLK_AXI_LH_MI_G3DXIRAM_CCORESFR	24
+#define CLK_GOUT_CCORE_ACLK_AXI_DS_IRPM		25
+#define CLK_GOUT_CCORE_ACLK_XIU_CCORESFRX	26
+#define CLK_GOUT_CCORE_ACLK_TREX_P_CCORE_BUS	27
+#define CLK_GOUT_CCORE_ACLK_TREX_CCORE_PERI	28
+#define CLK_GOUT_CCORE_ACLK_AXI_AS_MI_IRPM	29
+#define CLK_GOUT_CCORE_ACLK_TREX_CCORE_G3D	30
+#define CLK_GOUT_CCORE_ACLK_ACEL_LH_MI_G3DX1_CCORETD	31
+#define CLK_GOUT_CCORE_ACLK_ACEL_LH_MI_G3DX0_CCORETD	32
+#define CLK_GOUT_CCORE_ACLK_ATB_APL_MNGS	33
+#define CLK_GOUT_CCORE_ACLK_XIU_CPX		34
+#define CLK_GOUT_CCORE_ACLK_CLEANY_CPDATA	35
+#define CLK_GOUT_CCORE_ACLK_AXI_LH_MI_CPDATA_CCORE	36
+#define CLK_GOUT_CCORE_ACLK_AXI_LH_MI_IMEMX_CCORETD	37
+#define CLK_GOUT_CCORE_ACLK_AXI_LH_MI_AUDX_CCORETD	38
+#define CLK_GOUT_CCORE_ACLK_AXI_AS_MI_MNGSCS_CCORETD	39
+#define CLK_GOUT_CCORE_ACLK_TREX_CCORE		40
+#define CLK_GOUT_CCORE_PCLK_CMU			41
+#define CLK_GOUT_CCORE_PCLK_HPM_APBIF		42
+#define CLK_GOUT_CCORE_PCLK_SCI			43
+#define CLK_GOUT_CCORE_PCLK_GPIO_CCORE		44
+#define CLK_GOUT_CCORE_PCLK_S_MAILBOX		45
+#define CLK_GOUT_CCORE_PCLK_MAILBOX		46
+#define CLK_GOUT_CCORE_PCLK_SYSREG_CCORE	47
+#define CLK_GOUT_CCORE_PCLK_GPIO_APBIF_ALIVE	48
+#define CLK_GOUT_CCORE_PCLK_SCI_PPC_WRAPPER	49
+#define CLK_GOUT_CCORE_PCLK_VT_MON_APB		50
+#define CLK_GOUT_CCORE_PCLK_PMU_CCORE		51
+#define CLK_GOUT_CCORE_PCLK_PMU_APBIF		52
+#define CLK_GOUT_CCORE_PCLK_CMU_TOPC_APBIF	53
+#define CLK_GOUT_CCORE_PCLK_AXI2APB_CORESIGHT	54
+#define CLK_GOUT_CCORE_PCLK_AXI2APB_TREX_P_CCORE	55
+#define CLK_GOUT_CCORE_PCLK_AXI2APB_TREX_CCORE	56
+#define CLK_GOUT_CCORE_PCLK_AXI2APB_CCORE	57
+#define CLK_GOUT_CCORE_PCLK_TREX_P_CCORE	58
+#define CLK_GOUT_CCORE_PCLK_TREX_CCORE		59
+#define CLK_GOUT_CCORE_PCLK_BDU			60
+#define CLK_GOUT_CCORE_ACLK_AXI_LH_SI_CCORETP_MIF3P	61
+#define CLK_GOUT_CCORE_ACLK_AXI_LH_SI_CCORETP_MIF2P	62
+#define CLK_GOUT_CCORE_ACLK_AXI_LH_SI_CCORETP_MIF1P	63
+#define CLK_GOUT_CCORE_ACLK_AXI_LH_SI_CCORETP_MIF0P	64
+#define CLK_GOUT_CCORE_ACLK_AXI_LH_SI_CCORETP_G3DP	65
+#define CLK_GOUT_CCORE_ACLK_AXI_LH_SI_CCORETP_AUDX	66
+#define CLK_GOUT_CCORE_ACLK_AXI_AS_SI_CCORETP_APL	67
+#define CLK_GOUT_CCORE_ACLK_AXI_AS_SI_CCORETP_MNGS	68
+#define CLK_GOUT_CCORE_ACLK_APB_AS_MI_CCORETP_MNGSCS	69
+#define CLK_GOUT_CCORE_ACLK_APB_AS_MI_MNGSCS_CCOREBDU	70
+#define CLK_GOUT_CCORE_ACLK_TREX_P_CCORE	71
+#define CLK_GOUT_CCORE_PCLK_APBASYNC_BAT_AP	72
+#define CLK_GOUT_CCORE_PCLK_APBASYNC_BAT_CP	73
+#define CLK_GOUT_CCORE_PCLK_HSI2C_BAT_AP	74
+#define CLK_GOUT_CCORE_PCLK_HSI2C		75
+#define CLK_GOUT_CCORE_PCLK_HSI2C_BAT_CP	76
+#define CLK_GOUT_CCORE_PCLK_HSI2C_CP		77
+#define CLK_GOUT_CCORE_SCLK_PROMISE		78
+
+/* disp0 clocks */
+#define CLK_FOUT_DISP_PLL			1
+#define CLK_PHYCLK_MIPIDPHY0_BITCLKDIV2_PHY	2
+#define CLK_PHYCLK_MIPIDPHY1_BITCLKDIV2_PHY	3
+#define CLK_PHYCLK_MIPIDPHY2_BITCLKDIV2_PHY	4
+#define CLK_PHYCLK_HDMIPHY_PIXEL_CLKO_PHY	5
+#define CLK_PHYCLK_HDMIPHY_TMDS_CLKO_PHY	6
+#define CLK_PHYCLK_MIPIDPHY0_RXCLKESC0_PHY	7
+#define CLK_PHYCLK_MIPIDPHY0_BITCLKDIV8_PHY	8
+#define CLK_PHYCLK_MIPIDPHY1_RXCLKESC0_PHY	9
+#define CLK_PHYCLK_MIPIDPHY1_BITCLKDIV8_PHY	10
+#define CLK_PHYCLK_MIPIDPHY2_RXCLKESC0_PHY	11
+#define CLK_PHYCLK_MIPIDPHY2_BITCLKDIV8_PHY	12
+#define CLK_PHYCLK_DPPHY_CH0_TXD_CLK_PHY	13
+#define CLK_PHYCLK_DPPHY_CH1_TXD_CLK_PHY	14
+#define CLK_PHYCLK_DPPHY_CH2_TXD_CLK_PHY	15
+#define CLK_PHYCLK_DPPHY_CH3_TXD_CLK_PHY	16
+#define CLK_MOUT_DISP0_DISP_PLL			17
+#define CLK_MOUT_DISP0_ACLK_DISP0_0_400_USER	18
+#define CLK_MOUT_DISP0_ACLK_DISP0_1_400_USER	19
+#define CLK_MOUT_DISP0_SCLK_DISP0_DECON0_ECLK0_USER	20
+#define CLK_MOUT_DISP0_SCLK_DISP0_DECON0_VCLK0_USER	21
+#define CLK_MOUT_DISP0_SCLK_DISP0_DECON0_VCLK1_USER	22
+#define CLK_MOUT_DISP0_SCLK_DISP0_HDMI_AUDIO_USER	23
+#define CLK_MOUT_DISP0_PHYCLK_HDMIPHY_PIXEL_CLKO_USER	24
+#define CLK_MOUT_DISP0_PHYCLK_HDMIPHY_TMDS_CLKO_USER	25
+#define CLK_MOUT_DISP0_PHYCLK_MIPIDPHY0_RXCLKESC0_USER	26
+#define CLK_MOUT_DISP0_PHYCLK_MIPIDPHY0_BITCLKDIV2_USER	27
+#define CLK_MOUT_DISP0_PHYCLK_MIPIDPHY0_BITCLKDIV8_USER	28
+#define CLK_MOUT_DISP0_PHYCLK_MIPIDPHY1_RXCLKESC0_USER	29
+#define CLK_MOUT_DISP0_PHYCLK_MIPIDPHY1_BITCLKDIV2_USER	30
+#define CLK_MOUT_DISP0_PHYCLK_MIPIDPHY1_BITCLKDIV8_USER	31
+#define CLK_MOUT_DISP0_PHYCLK_MIPIDPHY2_RXCLKESC0_USER	32
+#define CLK_MOUT_DISP0_PHYCLK_MIPIDPHY2_BITCLKDIV2_USER	33
+#define CLK_MOUT_DISP0_PHYCLK_MIPIDPHY2_BITCLKDIV8_USER	34
+#define CLK_MOUT_DISP0_PHYCLK_DPPHY_CH0_TXD_CLK_USER	35
+#define CLK_MOUT_DISP0_PHYCLK_DPPHY_CH1_TXD_CLK_USER	36
+#define CLK_MOUT_DISP0_PHYCLK_DPPHY_CH2_TXD_CLK_USER	37
+#define CLK_MOUT_DISP0_PHYCLK_DPPHY_CH3_TXD_CLK_USER	38
+#define CLK_MOUT_DISP0_ACLK_DISP0_1_400		39
+#define CLK_MOUT_DISP0_SCLK_DISP0_DECON0_ECLK0	40
+#define CLK_MOUT_DISP0_SCLK_DISP0_DECON0_VCLK0	41
+#define CLK_MOUT_DISP0_SCLK_DISP0_DECON0_VCLK1	42
+#define CLK_MOUT_DISP0_SCLK_DISP0_HDMI_AUDIO	43
+#define CLK_DOUT_DISP0_PCLK_DISP0_0_133		44
+#define CLK_DOUT_DISP0_SCLK_DECON0_ECLK0	45
+#define CLK_DOUT_DISP0_SCLK_DECON0_VCLK0	46
+#define CLK_DOUT_DISP0_SCLK_DECON0_VCLK1	47
+#define CLK_DOUT_DISP0_PHYCLK_HDMIPHY_PIXEL_CLKO	48
+#define CLK_DOUT_DISP0_PHYCLK_HDMIPHY_TMDS_20B_CLKO	49
+#define CLK_GOUT_DISP0_ACLK_PPMU_DISP0_0	50
+#define CLK_GOUT_DISP0_ACLK_SMMU_DISP0_0	51
+#define CLK_GOUT_DISP0_ACLK_XIU_DISP0_0		52
+#define CLK_GOUT_DISP0_ACLK_LH_ASYNC_SI_R_TOP_DISP	53
+#define CLK_GOUT_DISP0_ACLK_VPP0_ACLK_0		54
+#define CLK_GOUT_DISP0_ACLK_PPMU_DISP0_1	55
+#define CLK_GOUT_DISP0_ACLK_SMMU_DISP0_1	56
+#define CLK_GOUT_DISP0_ACLK_XIU_DISP0_1		57
+#define CLK_GOUT_DISP0_ACLK_LH_ASYNC_SI_TOP_DISP	58
+#define CLK_GOUT_DISP0_ACLK_VPP0_ACLK_1		59
+#define CLK_GOUT_DISP0_ACLK_SFW_DISP0_0		60
+#define CLK_GOUT_DISP0_ACLK_SFW_DISP0_1		61
+#define CLK_GOUT_DISP0_PCLK_VPP0_1		62
+#define CLK_GOUT_DISP0_PCLK_SMMU_DISP0_1	63
+#define CLK_GOUT_DISP0_PCLK_SMMU_DISP0_0	64
+#define CLK_GOUT_DISP0_PCLK_PPMU_DISP0_1	65
+#define CLK_GOUT_DISP0_PCLK_PPMU_DISP0_0	66
+#define CLK_GOUT_DISP0_PCLK_HDMI_PHY		67
+#define CLK_GOUT_DISP0_PCLK_DISP0_MUX		68
+#define CLK_GOUT_DISP0_PCLK_DP			69
+#define CLK_GOUT_DISP0_PCLK_HDMI_AUDIO		70
+#define CLK_GOUT_DISP0_PCLK_HDMI		71
+#define CLK_GOUT_DISP0_PCLK_DSIM2		72
+#define CLK_GOUT_DISP0_PCLK_DSIM1		73
+#define CLK_GOUT_DISP0_PCLK_DSIM0		74
+#define CLK_GOUT_DISP0_PCLK_SYSREG_DISP0	75
+#define CLK_GOUT_DISP0_PCLK_PMU_DISP0		76
+#define CLK_GOUT_DISP0_PCLK_CMU_DISP0		77
+#define CLK_GOUT_DISP0_ACLK_XIU_DISP0SFRX	78
+#define CLK_GOUT_DISP0_ACLK_AXI2APB_DISP0_1P	79
+#define CLK_GOUT_DISP0_ACLK_AXI2APB_DISP0_0P	80
+#define CLK_GOUT_DISP0_ACLK_AXI_LH_ASYNC_MI_DISP0SFR	81
+#define CLK_GOUT_DISP0_PCLK_HPM_APBIF_DISP0	82
+#define CLK_GOUT_DISP0_PCLK_DECON0		83
+#define CLK_GOUT_DISP0_PCLK_VPP0_0		84
+#define CLK_GOUT_DISP0_PCLK_SFW_DISP0_0		85
+#define CLK_GOUT_DISP0_PCLK_SFW_DISP0_1		86
+#define CLK_GOUT_DISP0_SCLK_DISP1_400		87
+#define CLK_GOUT_DISP0_SCLK_DECON0_ECLK0	88
+#define CLK_GOUT_DISP0_SCLK_DECON0_VCLK0	89
+#define CLK_GOUT_DISP0_SCLK_DECON0_VCLK1	90
+#define CLK_GOUT_DISP0_SCLK_HDMI_AUDIO		91
+#define CLK_GOUT_DISP0_SCLK_PROMISE_DISP0	92
+#define CLK_GOUT_DISP0_PHYCLK_HDMIPHY_TMDS_20B_CLKO	93
+#define CLK_GOUT_DISP0_PHYCLK_HDMIPHY_TMDS_10B_CLKO	94
+#define CLK_GOUT_DISP0_PHYCLK_HDMIPHY_PIXEL_CLKO	95
+#define CLK_GOUT_DISP0_PHYCLK_MIPIDPHY0_BITCLKDIV8	96
+#define CLK_GOUT_DISP0_PHYCLK_MIPIDPHY0_RXCLKESC0	97
+#define CLK_GOUT_DISP0_PHYCLK_MIPIDPHY1_BITCLKDIV8	98
+#define CLK_GOUT_DISP0_PHYCLK_MIPIDPHY1_RXCLKESC0	99
+#define CLK_GOUT_DISP0_PHYCLK_MIPIDPHY2_BITCLKDIV8	100
+#define CLK_GOUT_DISP0_PHYCLK_MIPIDPHY2_RXCLKESC0	101
+#define CLK_GOUT_DISP0_PHYCLK_DPPHY_CH3_TXD_CLK	102
+#define CLK_GOUT_DISP0_PHYCLK_DPPHY_CH2_TXD_CLK	103
+#define CLK_GOUT_DISP0_PHYCLK_DPPHY_CH1_TXD_CLK	104
+#define CLK_GOUT_DISP0_PHYCLK_DPPHY_CH0_TXD_CLK	105
+#define CLK_GOUT_DISP0_OSCCLK_I_MIPI_DPHY_M4S4_M_XI	106
+#define CLK_GOUT_DISP0_OSCCLK_I_MIPI_DPHY_M4S0_M_XI	107
+#define CLK_GOUT_DISP0_OSCCLK_I_MIPI_DPHY_M1S0_M_XI	108
+#define CLK_GOUT_DISP0_OSCCLK_I_DPTX_PHY_I_REF_CLK_24M	109
+#define CLK_GOUT_DISP0_OSCCLK_DP_I_CLK_24M	110
+
+/* disp1 clocks */
+#define CLK_PHYCLK_DISP1_HDMIPHY_PIXEL_CLKO_PHY		1
+#define CLK_MOUT_DISP1_ACLK_DISP1_0_400_USER		2
+#define CLK_MOUT_DISP1_ACLK_DISP1_1_400_USER		3
+#define CLK_MOUT_DISP1_SCLK_DISP1_DECON1_ECLK0_USER	4
+#define CLK_MOUT_DISP1_SCLK_DISP1_DECON1_ECLK1_USER	5
+#define CLK_MOUT_DISP1_SCLK_DISP1_600_USER		6
+#define CLK_MOUT_DISP1_PHYCLK_MIPIDPHY0_BITCLKDIV2_USER	7
+#define CLK_MOUT_DISP1_PHYCLK_MIPIDPHY1_BITCLKDIV2_USER	8
+#define CLK_MOUT_DISP1_PHYCLK_MIPIDPHY2_BITCLKDIV2_USER	9
+#define CLK_MOUT_DISP1_PHYCLK_DISP1_HDMIPHY_PIXEL_CLKO_USER	10
+#define CLK_MOUT_DISP1_ACLK_DISP1_1_400			11
+#define CLK_MOUT_DISP1_SCLK_DISP1_DECON1_ECLK0		12
+#define CLK_MOUT_DISP1_SCLK_DISP1_DECON1_ECLK1		13
+#define CLK_MOUT_DISP1_SCLK_DECON1_ECLK1		14
+#define CLK_DOUT_DISP1_PCLK_DISP1_0_133			15
+#define CLK_DOUT_DISP1_SCLK_DECON1_ECLK0		16
+#define CLK_DOUT_DISP1_SCLK_DECON1_ECLK1		17
+#define CLK_GOUT_DISP1_ACLK_XIU_DISP1X0			18
+#define CLK_GOUT_DISP1_ACLK_AXI_LH_ASYNC_SI_DISP1_0	19
+#define CLK_GOUT_DISP1_ACLK_PPMU_DISP1_0		20
+#define CLK_GOUT_DISP1_ACLK_SMMU_DISP1_0		21
+#define CLK_GOUT_DISP1_ACLK_VPP1_0			22
+#define CLK_GOUT_DISP1_ACLK_XIU_DISP1X1			23
+#define CLK_GOUT_DISP1_ACLK_AXI_LH_ASYNC_SI_DISP1_1	24
+#define CLK_GOUT_DISP1_ACLK_QE_DISP1_WDMA		25
+#define CLK_GOUT_DISP1_ACLK_PPMU_DISP1_1		26
+#define CLK_GOUT_DISP1_ACLK_SMMU_DISP1_1		27
+#define CLK_GOUT_DISP1_ACLK_VPP1_1			28
+#define CLK_GOUT_DISP1_ACLK_SFW_DISP1_0			29
+#define CLK_GOUT_DISP1_ACLK_SFW_DISP1_1			30
+#define CLK_GOUT_DISP1_PCLK_VPP1_1			31
+#define CLK_GOUT_DISP1_PCLK_DECON1_1			32
+#define CLK_GOUT_DISP1_PCLK_DECON1_0			33
+#define CLK_GOUT_DISP1_PCLK_QE_DISP1_WDMA		34
+#define CLK_GOUT_DISP1_PCLK_PPMU_DISP1_1		35
+#define CLK_GOUT_DISP1_PCLK_PPMU_DISP1_0		36
+#define CLK_GOUT_DISP1_PCLK_SMMU_DISP1_1		37
+#define CLK_GOUT_DISP1_PCLK_SMMU_DISP1_0		38
+#define CLK_GOUT_DISP1_PCLK_SYSREG_DISP1		39
+#define CLK_GOUT_DISP1_PCLK_PMU_DISP1			40
+#define CLK_GOUT_DISP1_PCLK_CMU_DISP1			41
+#define CLK_GOUT_DISP1_PCLK_VPP1_0			42
+#define CLK_GOUT_DISP1_ACLK_AXI2APB_DISP1_1X		43
+#define CLK_GOUT_DISP1_ACLK_AXI2APB_DISP1_0X		44
+#define CLK_GOUT_DISP1_ACLK_XIU_DISP1SFRX		45
+#define CLK_GOUT_DISP1_ACLK_AXI_LH_ASYNC_MI_DISP1SFR	46
+#define CLK_GOUT_DISP1_PCLK_HPM_APBIF_DISP1		47
+#define CLK_GOUT_DISP1_PCLK_SFW_DISP1_0			48
+#define CLK_GOUT_DISP1_PCLK_SFW_DISP1_1			49
+#define CLK_GOUT_DISP1_SCLK_DECON1_ECLK_0		50
+#define CLK_GOUT_DISP1_SCLK_DECON1_ECLK_1		51
+#define CLK_GOUT_DISP1_SCLK_PROMISE_DISP1		52
+
+/* fsys0 clocks */
+#define CLK_PHYCLK_USB30_12MOHCI			1
+#define CLK_PHYCLK_USBDRD30_UDRD30_PHYCLOCK_PHY		2
+#define CLK_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK_PHY	3
+#define CLK_PHYCLK_UFS_TX0_SYMBOL_PHY			4
+#define CLK_PHYCLK_UFS_RX0_SYMBOL_PHY			5
+#define CLK_PHYCLK_USBHOST20_PHYCLOCK_PHY		6
+#define CLK_MOUT_FSYS0_ACLK_FSYS0_200_USER		7
+#define CLK_MOUT_FSYS0_SCLK_FSYS0_USBDRD30_USER		8
+#define CLK_MOUT_FSYS0_SCLK_FSYS0_MMC0_USER		9
+#define CLK_MOUT_FSYS0_SCLK_FSYS0_UFSUNIPRO_EMBEDDED_USER	10
+#define CLK_MOUT_FSYS0_SCLK_FSYS0_24M_USER		11
+#define CLK_MOUT_FSYS0_SCLK_FSYS0_UFSUNIPRO_EMBEDDED_CFG_USER	12
+#define CLK_MOUT_FSYS0_PHYCLK_USBDRD30_UDRD30_PHYCLOCK_USER	13
+#define CLK_MOUT_FSYS0_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK_USER	14
+#define CLK_MOUT_FSYS0_PHYCLK_UFS_TX0_SYMBOL_USER	15
+#define CLK_MOUT_FSYS0_PHYCLK_UFS_RX0_SYMBOL_USER	16
+#define CLK_MOUT_FSYS0_PHYCLK_USBHOST20_PHYCLOCK_USER	17
+#define CLK_MOUT_FSYS0_PHYCLK_USBHOST20PHY_REF_CLK	18
+#define CLK_GOUT_FSYS0_ACLK_AXI2ACEL_FSYS0X		19
+#define CLK_GOUT_FSYS0_PCLK_CMU_FSYS0			20
+#define CLK_GOUT_FSYS0_PCLK_GPIO_FSYS0			21
+#define CLK_GOUT_FSYS0_PCLK_SYSREG_FSYS0		22
+#define CLK_GOUT_FSYS0_PCLK_PPMU_FSYS0			23
+#define CLK_GOUT_FSYS0_PCLK_PMU_FSYS0			24
+#define CLK_GOUT_FSYS0_PCLK_ETR_USB_FSYS0		25
+#define CLK_GOUT_FSYS0_HCLK_USBHOST20			26
+#define CLK_GOUT_FSYS0_ACLK_AXI_US_USBHS_FSYS0X		27
+#define CLK_GOUT_FSYS0_ACLK_ETR_USB_FSYS0		28
+#define CLK_GOUT_FSYS0_ACLK_UFS_LINK_EMBEDDED		29
+#define CLK_GOUT_FSYS0_ACLK_USBDRD30			30
+#define CLK_GOUT_FSYS0_ACLK_MMC0			31
+#define CLK_GOUT_FSYS0_ACLK_PDMAS			32
+#define CLK_GOUT_FSYS0_ACLK_PDMA0			33
+#define CLK_GOUT_FSYS0_ACLK_PPMU_FSYS0			34
+#define CLK_GOUT_FSYS0_ACLK_XIU_FSYS0SFRX		35
+#define CLK_GOUT_FSYS0_ACLK_AXI_US_USBDRD30X_FSYS0X	36
+#define CLK_GOUT_FSYS0_ACLK_AXI_US_PDMAX_FSYS0X		37
+#define CLK_GOUT_FSYS0_ACLK_AXI2AHB_FSYS0H		38
+#define CLK_GOUT_FSYS0_ACLK_AXI2AHB_USBDRD30H		39
+#define CLK_GOUT_FSYS0_ACLK_AXI_LH_ASYNC_MI_ETR_USB_FSYS0	40
+#define CLK_GOUT_FSYS0_ACLK_XIU_PDMAX			41
+#define CLK_GOUT_FSYS0_ACLK_XIU_USBX			42
+#define CLK_GOUT_FSYS0_ACLK_XIU_EMBEDDEDX		43
+#define CLK_GOUT_FSYS0_ACLK_XIU_FSYS0X			44
+#define CLK_GOUT_FSYS0_ACLK_AXI2APB_FSYS0P		45
+#define CLK_GOUT_FSYS0_ACLK_AHB_BRIDGE_FSYS0H		46
+#define CLK_GOUT_FSYS0_ACLK_AXI_LH_ASYNC_MI_TOP_FSYS0	47
+#define CLK_GOUT_FSYS0_ACLK_ACEL_LH_ASYNC_SI_TOP_FSYS0	48
+#define CLK_GOUT_FSYS0_PCLK_HPM_APBIF_FSYS0		49
+#define CLK_GOUT_FSYS0_SCLK_USBDRD30_SUSPEND_CLK	50
+#define CLK_GOUT_FSYS0_SCLK_MMC0			51
+#define CLK_GOUT_FSYS0_SCLK_UFSUNIPRO_EMBEDDED		52
+#define CLK_GOUT_FSYS0_SCLK_USBDRD30_REF_CLK		53
+#define CLK_GOUT_FSYS0_PHYCLK_USBDRD30_UDRD30_PHYCLOCK	54
+#define CLK_GOUT_FSYS0_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK	55
+#define CLK_GOUT_FSYS0_PHYCLK_UFS_TX0_SYMBOL		56
+#define CLK_GOUT_FSYS0_PHYCLK_UFS_RX0_SYMBOL		57
+#define CLK_GOUT_FSYS0_PHYCLK_USBHOST20_PHYCLOCK	58
+#define CLK_GOUT_FSYS0_SCLK_PROMISE_FSYS0		59
+#define CLK_GOUT_FSYS0_SCLK_USBHOST20PHY_REF_CLK	60
+#define CLK_GOUT_FSYS0_SCLK_UFSUNIPRO_EMBEDDED_CFG	61
+#define CLK_GOUT_FSYS0_SCLK_USBHOST20_REF_CLK		62
+
+/* fsys1 clocks */
+#define CLK_FOUT_PCIE_PLL				1
+#define CLK_PHYCLK_UFS_LINK_SDCARD_TX0_SYMBOL_PHY	2
+#define CLK_PHYCLK_UFS_LINK_SDCARD_RX0_SYMBOL_PHY	3
+#define CLK_PHYCLK_PCIE_WIFI0_TX0_PHY			4
+#define CLK_PHYCLK_PCIE_WIFI0_RX0_PHY			5
+#define CLK_PHYCLK_PCIE_WIFI1_TX0_PHY			6
+#define CLK_PHYCLK_PCIE_WIFI1_RX0_PHY			7
+#define CLK_PHYCLK_PCIE_WIFI0_DIG_REFCLK_PHY		8
+#define CLK_PHYCLK_PCIE_WIFI1_DIG_REFCLK_PHY		9
+#define CLK_MOUT_FSYS1_ACLK_FSYS1_200_USER		10
+#define CLK_MOUT_FSYS1_SCLK_FSYS1_MMC2_USER		11
+#define CLK_MOUT_FSYS1_SCLK_FSYS1_UFSUNIPRO_SDCARD_USER	12
+#define CLK_MOUT_FSYS1_SCLK_FSYS1_UFSUNIPRO_SDCARD_CFG_USER	13
+#define CLK_MOUT_FSYS1_SCLK_FSYS1_PCIE_PHY_USER		14
+#define CLK_MOUT_FSYS1_PCIE_PLL				15
+#define CLK_MOUT_FSYS1_PHYCLK_UFS_LINK_SDCARD_TX0_SYMBOL_USER	16
+#define CLK_MOUT_FSYS1_PHYCLK_UFS_LINK_SDCARD_RX0_SYMBOL_USER	17
+#define CLK_MOUT_FSYS1_PHYCLK_PCIE_WIFI0_TX0_USER	18
+#define CLK_MOUT_FSYS1_PHYCLK_PCIE_WIFI0_RX0_USER	19
+#define CLK_MOUT_FSYS1_PHYCLK_PCIE_WIFI1_TX0_USER	20
+#define CLK_MOUT_FSYS1_PHYCLK_PCIE_WIFI1_RX0_USER	21
+#define CLK_MOUT_FSYS1_PHYCLK_PCIE_WIFI0_DIG_REFCLK_USER	22
+#define CLK_MOUT_FSYS1_PHYCLK_PCIE_WIFI1_DIG_REFCLK_USER	23
+#define CLK_DOUT_FSYS1_PCLK_COMBO_PHY_WIFI		24
+#define CLK_GOUT_FSYS1_ACLK_AXI2ACEL_FSYS1X		25
+#define CLK_GOUT_FSYS1_PCLK_CMU_FSYS1			26
+#define CLK_GOUT_FSYS1_ACLK_COMBO_PHY_PCS_PCLK_WIFI1	27
+#define CLK_GOUT_FSYS1_ACLK_COMBO_PHY_PCS_PCLK_WIFI0	28
+#define CLK_GOUT_FSYS1_PCLK_PMU_FSYS1			29
+#define CLK_GOUT_FSYS1_PCLK_PPMU_FSYS1			30
+#define CLK_GOUT_FSYS1_PCLK_GPIO_FSYS1			31
+#define CLK_GOUT_FSYS1_PCLK_SYSREG_FSYS1		32
+#define CLK_GOUT_FSYS1_ACLK_SROMC_FSYS1			33
+#define CLK_GOUT_FSYS1_PCLK_PCIE_WIFI1			34
+#define CLK_GOUT_FSYS1_ACLK_PCIE_WIFI1_DBI		35
+#define CLK_GOUT_FSYS1_ACLK_PCIE_WIFI1_SLV		36
+#define CLK_GOUT_FSYS1_ACLK_PCIE_WIFI1_MSTR		37
+#define CLK_GOUT_FSYS1_ACLK_AHB2AXI_PCIE_WIFI1		38
+#define CLK_GOUT_FSYS1_PCLK_PCIE_WIFI0			39
+#define CLK_GOUT_FSYS1_ACLK_PCIE_WIFI0_DBI		40
+#define CLK_GOUT_FSYS1_ACLK_PCIE_WIFI0_SLV		41
+#define CLK_GOUT_FSYS1_ACLK_PCIE_WIFI0_MSTR		42
+#define CLK_GOUT_FSYS1_ACLK_AHB2AXI_PCIE_WIFI0		43
+#define CLK_GOUT_FSYS1_ACLK_PPMU_FSYS1			44
+#define CLK_GOUT_FSYS1_ACLK_AHB_BRIDGE_FSYS1_S4		45
+#define CLK_GOUT_FSYS1_ACLK_AXI2AHB_FSYS1_S4		46
+#define CLK_GOUT_FSYS1_ACLK_AXI2APB_FSYS1_S1		47
+#define CLK_GOUT_FSYS1_ACLK_AXI2AHB_FSYS1_S0		48
+#define CLK_GOUT_FSYS1_ACLK_XIU_FSYS1SFRX		49
+#define CLK_GOUT_FSYS1_ACLK_XIU_SDCARDX			50
+#define CLK_GOUT_FSYS1_ACLK_XIU_FSYS1X			51
+#define CLK_GOUT_FSYS1_ACLK_AXI_LH_ASYNC_MI_TOP_FSYS1	52
+#define CLK_GOUT_FSYS1_ACLK_ACEL_LH_ASYNC_SI_TOP_FSYS1	53
+#define CLK_GOUT_FSYS1_ACLK_UFS_LINK_SDCARD		54
+#define CLK_GOUT_FSYS1_ACLK_MMC2			55
+#define CLK_GOUT_FSYS1_PCLK_HPM_APBIF_FSYS1		56
+#define CLK_GOUT_FSYS1_PCLK_COMBO_PHY_WIFI1		57
+#define CLK_GOUT_FSYS1_PCLK_COMBO_PHY_WIFI0		58
+#define CLK_GOUT_FSYS1_SCLK_MMC2			59
+#define CLK_GOUT_FSYS1_SCLK_UFSUNIPRO_SDCARD		60
+#define CLK_GOUT_FSYS1_SCLK_UFSUNIPRO_SDCARD_CFG	61
+#define CLK_GOUT_FSYS1_PHYCLK_UFS_LINK_SDCARD_TX0_SYMBOL	62
+#define CLK_GOUT_FSYS1_PHYCLK_UFS_LINK_SDCARD_RX0_SYMBOL	63
+#define CLK_GOUT_FSYS1_PHYCLK_PCIE_WIFI0_TX0		64
+#define CLK_GOUT_FSYS1_PHYCLK_PCIE_WIFI0_RX0		65
+#define CLK_GOUT_FSYS1_PHYCLK_PCIE_WIFI1_TX0		66
+#define CLK_GOUT_FSYS1_PHYCLK_PCIE_WIFI1_RX0		67
+#define CLK_GOUT_FSYS1_PHYCLK_PCIE_WIFI0_DIG_REFCLK	68
+#define CLK_GOUT_FSYS1_PHYCLK_PCIE_WIFI1_DIG_REFCLK	69
+#define CLK_GOUT_FSYS1_SCLK_PROMISE_FSYS1		70
+
+/* g3d clocks */
+#define CLK_MOUT_G3D_G3D_PLL_USER		1
+#define CLK_MOUT_G3D_BUS_PLL_USER		2
+#define CLK_MOUT_G3D_G3D			3
+#define CLK_DOUT_G3D_ACLK_G3D			4
+#define CLK_DOUT_G3D_PCLK_G3D			5
+#define CLK_DOUT_G3D_SCLK_HPM_G3D		6
+#define CLK_DOUT_G3D_SCLK_ATE_G3D		7
+#define CLK_GOUT_G3D_ACLK_G3D			8
+#define CLK_GOUT_G3D_ACLK_GRAY_DEC		9
+#define CLK_GOUT_G3D_ACLK_SFW100_ACEL_G3D1	10
+#define CLK_GOUT_G3D_ACLK_SFW100_ACEL_G3D0	11
+#define CLK_GOUT_G3D_ACLK_XIU_G3D		12
+#define CLK_GOUT_G3D_ACLK_PPMU_G3D1		13
+#define CLK_GOUT_G3D_ACLK_PPMU_G3D0		14
+#define CLK_GOUT_G3D_ACLK_ASYNCAPBM_G3D		15
+#define CLK_GOUT_G3D_ACLK_ASYNCAXI_G3D		16
+#define CLK_GOUT_G3D_ACLK_AXI_DS_G3D		17
+#define CLK_GOUT_G3D_ACLK_ACEL_LH_ASYNC_SI_G3D1	18
+#define CLK_GOUT_G3D_ACLK_ACEL_LH_ASYNC_SI_G3D0	19
+#define CLK_GOUT_G3D_PCLK_SFW100_ACEL_G3D1	20
+#define CLK_GOUT_G3D_PCLK_SFW100_ACEL_G3D0	21
+#define CLK_GOUT_G3D_PCLK_HPM_G3D		22
+#define CLK_GOUT_G3D_PCLK_PPMU_G3D1		23
+#define CLK_GOUT_G3D_PCLK_PPMU_G3D0		24
+#define CLK_GOUT_G3D_PCLK_PMU_G3D		25
+#define CLK_GOUT_G3D_ACLK_ASYNCAPBS_G3D		26
+#define CLK_GOUT_G3D_PCLK_SYSREG_G3D		27
+#define CLK_GOUT_G3D_ACLK_AXI2APB_G3DP		28
+#define CLK_GOUT_G3D_ACLK_AXI_LH_ASYNC_MI_G3DP	29
+#define CLK_GOUT_G3D_SCLK_HPM2_G3D		30
+#define CLK_GOUT_G3D_SCLK_HPM1_G3D		31
+#define CLK_GOUT_G3D_SCLK_HPM0_G3D		32
+#define CLK_GOUT_G3D_SCLK_AXI_LH_ASYNC_SI_G3DIRAM	33
+#define CLK_GOUT_G3D_SCLK_ASYNCAXI_G3D		34
+
+/* mif0 clocks */
+#define CLK_FOUT_MIF0_PLL	1
+#define CLK_MOUT_MIF0_MIF_PLL	2
+#define CLK_MOUT_MIF0_BUS_PLL_USER	3
+#define CLK_MOUT_MIF0_ACLK_MIF_PLL	4
+#define CLK_MOUT_MIF0_PCLK_MIF	5
+#define CLK_MOUT_MIF0_SCLK_HPM_MIF	6
+#define CLK_MOUT_MIF0_PCLK_SMC	7
+#define CLK_DOUT_MIF0_PCLK_MIF	8
+#define CLK_DOUT_MIF0_SCLK_HPM_MIF	9
+#define CLK_DOUT_MIF0_PCLK_SMC	10
+#define CLK_MIF0_FF_ACLK_MIF_PLL_DIV2	11
+#define CLK_MIF0_FF_ACLK_MIF_PLL_DIV4	12
+#define CLK_U_DFI_CLK_GEN_MIF0	13
+#define CLK_GOUT_MIF0_PCLK_SMC1	14
+#define CLK_GOUT_MIF0_PCLK_DMC_MISC	15
+#define CLK_GOUT_MIF0_PCLK_PPC_DEBUG	16
+#define CLK_GOUT_MIF0_PCLK_PPC_DVFS	17
+#define CLK_GOUT_MIF0_PCLK_SYSREG_MIF	18
+#define CLK_GOUT_MIF0_PCLK_HPM	19
+#define CLK_GOUT_MIF0_ACLK_AXI_ASYNC	20
+#define CLK_GOUT_MIF0_PCLK_MIFP	21
+#define CLK_GOUT_MIF0_PCLK_PMU_MIF	22
+#define CLK_GOUT_MIF0_PCLK_LPDDR4PHY	23
+#define CLK_GOUT_MIF0_SCLK_PROMISE	24
+#define CLK_GOUT_MIF0_RCLK_DREX	25
+
+/* mif1 clocks */
+#define CLK_FOUT_MIF1_PLL	1
+#define CLK_MOUT_MIF1_MIF_PLL	2
+#define CLK_MOUT_MIF1_BUS_PLL_USER	3
+#define CLK_MOUT_MIF1_ACLK_MIF_PLL	4
+#define CLK_MOUT_MIF1_PCLK_MIF	5
+#define CLK_MOUT_MIF1_SCLK_HPM_MIF	6
+#define CLK_MOUT_MIF1_PCLK_SMC	7
+#define CLK_DOUT_MIF1_PCLK_MIF	8
+#define CLK_DOUT_MIF1_SCLK_HPM_MIF	9
+#define CLK_DOUT_MIF1_PCLK_SMC	10
+#define CLK_MIF1_FF_ACLK_MIF_PLL_DIV2	11
+#define CLK_MIF1_FF_ACLK_MIF_PLL_DIV4	12
+#define CLK_U_DFI_CLK_GEN_MIF1	13
+#define CLK_GOUT_MIF1_PCLK_SMC1	14
+#define CLK_GOUT_MIF1_PCLK_DMC_MISC	15
+#define CLK_GOUT_MIF1_PCLK_PPC_DEBUG	16
+#define CLK_GOUT_MIF1_PCLK_PPC_DVFS	17
+#define CLK_GOUT_MIF1_PCLK_SYSREG_MIF	18
+#define CLK_GOUT_MIF1_PCLK_HPM	19
+#define CLK_GOUT_MIF1_ACLK_AXI_ASYNC	20
+#define CLK_GOUT_MIF1_PCLK_MIFP	21
+#define CLK_GOUT_MIF1_PCLK_PMU_MIF	22
+#define CLK_GOUT_MIF1_PCLK_LPDDR4PHY	23
+#define CLK_GOUT_MIF1_SCLK_PROMISE	24
+#define CLK_GOUT_MIF1_RCLK_DREX	25
+
+/* mif2 clocks */
+#define CLK_FOUT_MIF2_PLL	1
+#define CLK_MOUT_MIF2_MIF_PLL	2
+#define CLK_MOUT_MIF2_BUS_PLL_USER	3
+#define CLK_MOUT_MIF2_ACLK_MIF_PLL	4
+#define CLK_MOUT_MIF2_PCLK_MIF	5
+#define CLK_MOUT_MIF2_SCLK_HPM_MIF	6
+#define CLK_MOUT_MIF2_PCLK_SMC	7
+#define CLK_DOUT_MIF2_PCLK_MIF	8
+#define CLK_DOUT_MIF2_SCLK_HPM_MIF	9
+#define CLK_DOUT_MIF2_PCLK_SMC	10
+#define CLK_MIF2_FF_ACLK_MIF_PLL_DIV2	11
+#define CLK_MIF2_FF_ACLK_MIF_PLL_DIV4	12
+#define CLK_U_DFI_CLK_GEN_MIF2	13
+#define CLK_GOUT_MIF2_PCLK_SMC1	14
+#define CLK_GOUT_MIF2_PCLK_DMC_MISC	15
+#define CLK_GOUT_MIF2_PCLK_PPC_DEBUG	16
+#define CLK_GOUT_MIF2_PCLK_PPC_DVFS	17
+#define CLK_GOUT_MIF2_PCLK_SYSREG_MIF	18
+#define CLK_GOUT_MIF2_PCLK_HPM	19
+#define CLK_GOUT_MIF2_ACLK_AXI_ASYNC	20
+#define CLK_GOUT_MIF2_PCLK_MIFP	21
+#define CLK_GOUT_MIF2_PCLK_PMU_MIF	22
+#define CLK_GOUT_MIF2_PCLK_LPDDR4PHY	23
+#define CLK_GOUT_MIF2_SCLK_PROMISE	24
+#define CLK_GOUT_MIF2_RCLK_DREX	25
+
+/* mif3 clocks */
+#define CLK_FOUT_MIF3_PLL	1
+#define CLK_MOUT_MIF3_MIF_PLL	2
+#define CLK_MOUT_MIF3_BUS_PLL_USER	3
+#define CLK_MOUT_MIF3_ACLK_MIF_PLL	4
+#define CLK_MOUT_MIF3_PCLK_MIF	5
+#define CLK_MOUT_MIF3_SCLK_HPM_MIF	6
+#define CLK_MOUT_MIF3_PCLK_SMC	7
+#define CLK_DOUT_MIF3_PCLK_MIF	8
+#define CLK_DOUT_MIF3_SCLK_HPM_MIF	9
+#define CLK_DOUT_MIF3_PCLK_SMC	10
+#define CLK_MIF3_FF_ACLK_MIF_PLL_DIV2	11
+#define CLK_MIF3_FF_ACLK_MIF_PLL_DIV4	12
+#define CLK_U_DFI_CLK_GEN_MIF3	13
+#define CLK_GOUT_MIF3_PCLK_SMC1	14
+#define CLK_GOUT_MIF3_PCLK_DMC_MISC	15
+#define CLK_GOUT_MIF3_PCLK_PPC_DEBUG	16
+#define CLK_GOUT_MIF3_PCLK_PPC_DVFS	17
+#define CLK_GOUT_MIF3_PCLK_SYSREG_MIF	18
+#define CLK_GOUT_MIF3_PCLK_HPM	19
+#define CLK_GOUT_MIF3_ACLK_AXI_ASYNC	20
+#define CLK_GOUT_MIF3_PCLK_MIFP	21
+#define CLK_GOUT_MIF3_PCLK_PMU_MIF	22
+#define CLK_GOUT_MIF3_PCLK_LPDDR4PHY	23
+#define CLK_GOUT_MIF3_SCLK_PROMISE	24
+#define CLK_GOUT_MIF3_RCLK_DREX	25
+
+/* mngs clocks */
+#define CLK_FOUT_MNGS_PLL			1
+#define CLK_MOUT_MNGS_MNGS_PLL			2
+#define CLK_MOUT_MNGS_BUS_PLL_MNGS_USER		3
+#define CLK_MOUT_MNGS_MNGS			4
+#define CLK_DOUT_MNGS_MNGS			5
+#define CLK_DOUT_MNGS_ACLK_MNGS			6
+#define CLK_DOUT_MNGS_ATCLK_MNGS_CORE		7
+#define CLK_DOUT_MNGS_ATCLK_MNGS_SOC		8
+#define CLK_DOUT_MNGS_ATCLK_MNGS_CSSYS_TRACECLK	9
+#define CLK_DOUT_MNGS_ATCLK_MNGS_ASYNCATB_CAM1	10
+#define CLK_DOUT_MNGS_ATCLK_MNGS_ASYNCATB_AUD	11
+#define CLK_DOUT_MNGS_PCLK_DBG_MNGS		12
+#define CLK_DOUT_MNGS_PCLK_RUN_MONITOR		13
+#define CLK_DOUT_MNGS_PCLK_MNGS			14
+#define CLK_DOUT_MNGS_CNTCLK_MNGS		15
+#define CLK_DOUT_MNGS_MNGS_RUN_MONITOR		16
+#define CLK_DOUT_MNGS_SCLK_PROMISE_MNGS		17
+#define CLK_DOUT_MNGS_MNGS_PLL			18
+#define CLK_GOUT_MNGS_ACLK_ASYNCPACES_MNGS_SCI	19
+#define CLK_GOUT_MNGS_ATCLKS_ATB_MNGS3_CSSYS	20
+#define CLK_GOUT_MNGS_ATCLKS_ATB_MNGS2_CSSYS	21
+#define CLK_GOUT_MNGS_ATCLKS_ATB_MNGS1_CSSYS	22
+#define CLK_GOUT_MNGS_ATCLKS_ATB_MNGS0_CSSYS	23
+#define CLK_GOUT_MNGS_ATCLK_XIU_MNGSX_2X1	24
+#define CLK_GOUT_MNGS_ATCLK_STM_TXACTOR		25
+#define CLK_GOUT_MNGS_ATCLK_ATB_BDU_CSSYS	26
+#define CLK_GOUT_MNGS_ATCLK_ATB_AUD_CSSYS	27
+#define CLK_GOUT_MNGS_ATCLK_ATB_CAM1_CSSYS	28
+#define CLK_GOUT_MNGS_ATCLK_ATB_APOLLO3_CSSYS	29
+#define CLK_GOUT_MNGS_ATCLK_ATB_APOLLO2_CSSYS	30
+#define CLK_GOUT_MNGS_ATCLK_ATB_APOLLO1_CSSYS	31
+#define CLK_GOUT_MNGS_ATCLK_ATB_APOLLO0_CSSYS	32
+#define CLK_GOUT_MNGS_ATCLKM_ATB_MNGS3_CSSYS	33
+#define CLK_GOUT_MNGS_ATCLKM_ATB_MNGS2_CSSYS	34
+#define CLK_GOUT_MNGS_ATCLKM_ATB_MNGS1_CSSYS	35
+#define CLK_GOUT_MNGS_ATCLKM_ATB_MNGS0_CSSYS	36
+#define CLK_GOUT_MNGS_ATCLK_ASYNCAHB_CSSYS_SSS_ACLK	37
+#define CLK_GOUT_MNGS_ATCLK_ASYNCLHAXI_CSSYS_ETR_ACLK	38
+#define CLK_GOUT_MNGS_ATCLK_CSSYS_HCLK		39
+#define CLK_GOUT_MNGS_ATCLK_CSSYS		40
+#define CLK_GOUT_MNGS_ATCLK_CSSYS_TRACECLK	41
+#define CLK_GOUT_MNGS_ATCLK_ASYNCATB_CAM1	42
+#define CLK_GOUT_MNGS_ATCLK_ASYNCATB_AUD	43
+#define CLK_GOUT_MNGS_PCLKDBG_ASAPBMST_CCORE_CSSYS	44
+#define CLK_GOUT_MNGS_PCLKDBG_ASAPBSLV_CSSYS_BDU	45
+#define CLK_GOUT_MNGS_PCLKDBG_ASAPBSLV_CSSYS_CAM1	46
+#define CLK_GOUT_MNGS_PCLKDBG_ASAPBSLV_CSSYS_AUD	47
+#define CLK_GOUT_MNGS_PCLKDBG_ASAPBSLV_CSSYS_APOLLO	48
+#define CLK_GOUT_MNGS_PCLKDBG_DUMP_PC_MNGS	49
+#define CLK_GOUT_MNGS_PCLKDBG_SECJTAG		50
+#define CLK_GOUT_MNGS_PCLKDBG_AXIAP		51
+#define CLK_GOUT_MNGS_PCLKDBG_CSSYS_CTMCLK	52
+#define CLK_GOUT_MNGS_PCLKDBG_CSSYS		53
+#define CLK_GOUT_MNGS_PCLKDBG_MNGS		54
+#define CLK_GOUT_MNGS_PCLKDBG_ASYNCDAPSLV	55
+#define CLK_GOUT_MNGS_PCLK_SYSREG_MNGS		56
+#define CLK_GOUT_MNGS_PCLK_STM_TXACTOR		57
+#define CLK_GOUT_MNGS_PCLK_XIU_PERI_MNGS_ACLK	58
+#define CLK_GOUT_MNGS_PCLK_PMU_MNGS		59
+#define CLK_GOUT_MNGS_PCLK_XIU_MNGSSFRX_1X2	60
+#define CLK_GOUT_MNGS_PCLK_AXI2APB_MNGS_ACLK	61
+#define CLK_GOUT_MNGS_PCLK_HPM_MNGS		62
+#define CLK_GOUT_MNGS_SCLK_MNGS			63
+#define CLK_GOUT_MNGS_SCLK_PROMISE2_MNGS	64
+#define CLK_GOUT_MNGS_SCLK_PROMISE1_MNGS	65
+#define CLK_GOUT_MNGS_SCLK_PROMISE0_MNGS	66
+
+/* peric0 clocks */
+#define CLK_MOUT_PERIC0_ACLK_PERIC0_66_USER	1
+#define CLK_MOUT_PERIC0_SCLK_UART0_USER	2
+#define CLK_GOUT_PERIC0_PCLK_HSI2C11	3
+#define CLK_GOUT_PERIC0_PCLK_HSI2C10	4
+#define CLK_GOUT_PERIC0_PCLK_HSI2C9	5
+#define CLK_GOUT_PERIC0_PCLK_HSI2C5	6
+#define CLK_GOUT_PERIC0_PCLK_HSI2C4	7
+#define CLK_GOUT_PERIC0_PCLK_HSI2C1	8
+#define CLK_GOUT_PERIC0_PCLK_HSI2C0	9
+#define CLK_GOUT_PERIC0_PCLK_PWM	10
+#define CLK_GOUT_PERIC0_PCLK_ADCIF	11
+#define CLK_GOUT_PERIC0_PCLK_UART0	12
+#define CLK_GOUT_PERIC0_PCLK_GPIO_BUS0	13
+#define CLK_GOUT_PERIC0_PCLK_SYSREG_PERIC0	14
+#define CLK_GOUT_PERIC0_PCLK_PMU_PERIC0	15
+#define CLK_GOUT_PERIC0_PCLK_CMU_PERIC0	16
+#define CLK_GOUT_PERIC0_ACLK_AXI2APB_PERIC0P	17
+#define CLK_GOUT_PERIC0_ACLK_AXILHASYNCM_PERIC0	18
+#define CLK_GOUT_PERIC0_SCLK_UART0	19
+#define CLK_GOUT_PERIC0_SCLK_PWM	20
+
+/* peric1 clocks */
+#define CLK_MOUT_PERIC1_ACLK_PERIC1_66_USER	1
+#define CLK_MOUT_PERIC1_SCLK_SPI0_USER	2
+#define CLK_MOUT_PERIC1_SCLK_SPI1_USER	3
+#define CLK_MOUT_PERIC1_SCLK_SPI2_USER	4
+#define CLK_MOUT_PERIC1_SCLK_SPI3_USER	5
+#define CLK_MOUT_PERIC1_SCLK_SPI4_USER	6
+#define CLK_MOUT_PERIC1_SCLK_SPI5_USER	7
+#define CLK_MOUT_PERIC1_SCLK_SPI6_USER	8
+#define CLK_MOUT_PERIC1_SCLK_SPI7_USER	9
+#define CLK_MOUT_PERIC1_SCLK_UART1_USER	10
+#define CLK_MOUT_PERIC1_SCLK_UART2_USER	11
+#define CLK_MOUT_PERIC1_SCLK_UART3_USER	12
+#define CLK_MOUT_PERIC1_SCLK_UART4_USER	13
+#define CLK_MOUT_PERIC1_SCLK_UART5_USER	14
+#define CLK_GOUT_PERIC1_PCLK_SPI7	15
+#define CLK_GOUT_PERIC1_PCLK_SPI6	16
+#define CLK_GOUT_PERIC1_PCLK_SPI5	17
+#define CLK_GOUT_PERIC1_PCLK_SPI4	18
+#define CLK_GOUT_PERIC1_PCLK_SPI3	19
+#define CLK_GOUT_PERIC1_PCLK_SPI2	20
+#define CLK_GOUT_PERIC1_PCLK_SPI1	21
+#define CLK_GOUT_PERIC1_PCLK_SPI0	22
+#define CLK_GOUT_PERIC1_PCLK_UART5	23
+#define CLK_GOUT_PERIC1_PCLK_UART4	24
+#define CLK_GOUT_PERIC1_PCLK_UART3	25
+#define CLK_GOUT_PERIC1_PCLK_UART2	26
+#define CLK_GOUT_PERIC1_PCLK_UART1	27
+#define CLK_GOUT_PERIC1_PCLK_GPIO_ESE	28
+#define CLK_GOUT_PERIC1_PCLK_GPIO_FF	29
+#define CLK_GOUT_PERIC1_PCLK_GPIO_TOUCH	30
+#define CLK_GOUT_PERIC1_PCLK_GPIO_NFC	31
+#define CLK_GOUT_PERIC1_PCLK_GPIO_PERIC1	32
+#define CLK_GOUT_PERIC1_PCLK_SYSREG_PERIC1	33
+#define CLK_GOUT_PERIC1_PCLK_PMU_PERIC1	34
+#define CLK_GOUT_PERIC1_PCLK_CMU_PERIC1	35
+#define CLK_GOUT_PERIC1_ACLK_AXI2APB_PERIC1_2P	36
+#define CLK_GOUT_PERIC1_ACLK_AXI2APB_PERIC1_1P	37
+#define CLK_GOUT_PERIC1_ACLK_AXI2APB_PERIC1_0P	38
+#define CLK_GOUT_PERIC1_ACLK_XIU_PERIC1SFRX	39
+#define CLK_GOUT_PERIC1_ACLK_AXILHASYNCM_PERIC1	40
+#define CLK_GOUT_PERIC1_PCLK_HSI2C14	41
+#define CLK_GOUT_PERIC1_PCLK_HSI2C13	42
+#define CLK_GOUT_PERIC1_PCLK_HSI2C12	43
+#define CLK_GOUT_PERIC1_PCLK_HSI2C8	44
+#define CLK_GOUT_PERIC1_PCLK_HSI2C7	45
+#define CLK_GOUT_PERIC1_PCLK_HSI2C6	46
+#define CLK_GOUT_PERIC1_PCLK_HSI2C3	47
+#define CLK_GOUT_PERIC1_PCLK_HSI2C2	48
+#define CLK_GOUT_PERIC1_SCLK_SPI0	49
+#define CLK_GOUT_PERIC1_SCLK_SPI1	50
+#define CLK_GOUT_PERIC1_SCLK_SPI2	51
+#define CLK_GOUT_PERIC1_SCLK_SPI3	52
+#define CLK_GOUT_PERIC1_SCLK_SPI4	53
+#define CLK_GOUT_PERIC1_SCLK_SPI5	54
+#define CLK_GOUT_PERIC1_SCLK_SPI6	55
+#define CLK_GOUT_PERIC1_SCLK_SPI7	56
+#define CLK_GOUT_PERIC1_SCLK_UART1	57
+#define CLK_GOUT_PERIC1_SCLK_UART2	58
+#define CLK_GOUT_PERIC1_SCLK_UART3	59
+#define CLK_GOUT_PERIC1_SCLK_UART4	60
+#define CLK_GOUT_PERIC1_SCLK_UART5	61
+
+#endif /* _DT_BINDINGS_CLOCK_EXYNOS8890_H */
-- 
2.43.0


