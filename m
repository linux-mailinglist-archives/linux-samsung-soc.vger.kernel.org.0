Return-Path: <linux-samsung-soc+bounces-5695-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE539E74A8
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  6 Dec 2024 16:43:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA0AA163BC8
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  6 Dec 2024 15:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D2A020E009;
	Fri,  6 Dec 2024 15:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="kinDeRL8"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from out-03.smtp.spacemail.com (out-03.smtp.spacemail.com [63.250.43.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A4B20B219;
	Fri,  6 Dec 2024 15:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733499738; cv=none; b=sQO33y0IW4U697m1ZwnDOjzPS8c3iwQpXg8ETePH0zBLlk1+ssbx+8Xt/zWb8mU+NaYxF/cf4gEzTOOVwgekZt9f1Zeq7+PUjBqfNIcgA0VOES/uKsUFWvmv0MFJzyrhI65kCOCLbsbSKEyLyKLnvUmwp+wG0bxPZAScAakBMtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733499738; c=relaxed/simple;
	bh=I5rwc22XhHRrVS/E0oCuQftbLgpv946zwdd+raigOWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d5bCEe89gPenyHrnTcuCbfATiRq7Q0e/ILV13/heyEYhu+bT7Nf2SE4RO+dNIdV6R0waoj1jWP4edwMYEyEEBGk1B7MY+0l28waB+Td7FR9UNFbQwDsxztzffSX0w7SySRIDq2AYNuz2rG3UYYStqIiCblfXpRUrqLDWuduRX/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=kinDeRL8; arc=none smtp.client-ip=63.250.43.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y4b9M3ZSdzGpQW;
	Fri, 06 Dec 2024 15:42:15 +0000 (UTC)
Received: from umer-b550pro4.lan (host-213-78-252-153.as13285.net [213.78.252.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y4b9C24g6z2x9S;
	Fri,  6 Dec 2024 15:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733499730;
	bh=I5rwc22XhHRrVS/E0oCuQftbLgpv946zwdd+raigOWE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kinDeRL8NiStWWuMDgQOZnEMkprkHGFTmJhW42Ohsx3F1Ta5+ty4IwdwU5+zJNrJI
	 q4O5KYqbvxOK6nJHhdCP5vFrqCkzmkdGXFVgDdrvWWL5WHh1yBElSTxxPfYzdheJx8
	 n/KMMMf8++MJijiueBncRaqSxK2SNEEbUEVa4Lrusf8YkxB/dobVw92wP6yFbD3go6
	 JX7X0gRCuIWrMJECBQB0mm+EZE09xnIColj2YWPvcAXEwKFOwozfUe9PERMW2Da2mj
	 4ZAKAa6OkR1TZHAYay1jhSMSUVMzSMmVe1aiK66qJQkOXUfFkdINQ+LN81DJAeO63O
	 gQdkfCr23jyyw==
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	igor.belwon@mentallysanemainliners.org
Subject: [PATCH v5 3/4] arm64: dts: exynos: Add initial support for Samsung Galaxy S20 5G (x1s)
Date: Fri,  6 Dec 2024 15:41:48 +0000
Message-ID: <20241206154149.4271-4-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241206154149.4271-1-umer.uddin@mentallysanemainliners.org>
References: <20241206154149.4271-1-umer.uddin@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial support for the Samsung Galaxy S20 5G (x1s/SM-G981B)
phone. It was launched in 2020, and it's based on the Exynos 990 SoC. It
has only one configuration with 12GB of RAM and 128GB of UFS 3.0 storage.

This device tree adds support for the following:

- SimpleFB
- 12GB RAM
- Buttons

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 arch/arm64/boot/dts/exynos/Makefile          |  1 +
 arch/arm64/boot/dts/exynos/exynos990-x1s.dts | 28 ++++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1s.dts

diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index 948a2c6cb..7dbecd367 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -10,5 +10,6 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
 	exynos8895-dreamlte.dtb		\
 	exynos990-c1s.dtb		\
 	exynos990-r8s.dtb               \
+        exynos990-x1s.dtb               \
 	exynosautov9-sadk.dtb		\
 	exynosautov920-sadk.dtb
diff --git a/arch/arm64/boot/dts/exynos/exynos990-x1s.dts b/arch/arm64/boot/dts/exynos/exynos990-x1s.dts
new file mode 100644
index 000000000..1ae881015
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos990-x1s.dts
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Samsung Galaxy S20 5G (x1s/SM-G981B) device tree source
+ *
+ * Copyright (c) 2024, Umer Uddin <umer.uddin@mentallysanemainliners.org>
+ */
+
+/dts-v1/;
+#include "exynos990-x1s-common.dtsi"
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	model = "Samsung Galaxy S20 5G";
+	compatible = "samsung,x1s", "samsung,exynos990";
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x3ab00000>,
+		      /* Memory hole */
+		      <0x0 0xc1200000 0x0 0x1ee00000>,
+		      /* Memory hole */
+		      <0x0 0xe1900000 0x0 0x1e700000>,
+		      /* Memory hole */
+		      <0x8 0x80000000 0x2 0x7e800000>;
+	};
+};
-- 
2.47.1


