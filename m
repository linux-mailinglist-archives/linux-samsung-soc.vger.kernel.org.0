Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57B4112FB2A
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  3 Jan 2020 18:11:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728103AbgACRLx (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 3 Jan 2020 12:11:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:45580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727952AbgACRLx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Jan 2020 12:11:53 -0500
Received: from localhost.localdomain (unknown [194.230.155.149])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B4AE221734;
        Fri,  3 Jan 2020 17:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578071512;
        bh=Y7L88PCTUdeR29N/KZb0qXw8Sim4EahW7H2Nh1Q54qk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iZeIUaT8/xQU2d0uUGUBu2iGH9AcjfJAha7fGjPxqLBQ+zr2whmwWuLcYDTQaILan
         YfBfFExrfL3xLSbKqLfmd1uThiy8I+29HkzpjnNgfbA2yT3Lk1lLADPwqG4ygPTZM3
         xolYNeTJMTOxrctURT0LpgC7ShXcuCgMbprkXG3w=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 01/19] arm64: dts: exynos: Rename Samsung and Exynos to lowercase
Date:   Fri,  3 Jan 2020 18:11:13 +0100
Message-Id: <20200103171131.9900-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200103171131.9900-1-krzk@kernel.org>
References: <20200103171131.9900-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Fix up inconsistent usage of upper and lowercase letters in "Samsung"
and "Exynos" names.

"SAMSUNG" and "EXYNOS" are not abbreviations but regular trademarked
names.  Therefore they should be written with lowercase letters starting
with capital letter.

The lowercase "Exynos" name is promoted by its manufacturer Samsung
Electronics Co., Ltd., in advertisement materials and on website.

Although advertisement materials usually use uppercase "SAMSUNG", the
lowercase version is used in all legal aspects (e.g. on Wikipedia and in
privacy/legal statements on
https://www.samsung.com/semiconductor/privacy-global/).

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 2 +-
 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts         | 2 +-
 arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts        | 2 +-
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts       | 4 ++--
 arch/arm64/boot/dts/exynos/exynos7.dtsi               | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index 6f90b0e62cba..250fc01de78d 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * SAMSUNG Exynos5433 TM2 board device tree source
+ * Samsung Exynos5433 TM2 board device tree source
  *
  * Copyright (c) 2016 Samsung Electronics Co., Ltd.
  *
diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
index dda5d2746a74..fdd0796b29d4 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * SAMSUNG Exynos5433 TM2 board device tree source
+ * Samsung Exynos5433 TM2 board device tree source
  *
  * Copyright (c) 2016 Samsung Electronics Co., Ltd.
  *
diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts
index 1e207ce8b97b..089fc7a1af67 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * SAMSUNG Exynos5433 TM2E board device tree source
+ * Samsung Exynos5433 TM2E board device tree source
  *
  * Copyright (c) 2016 Samsung Electronics Co., Ltd.
  *
diff --git a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
index 080e0f56e108..7af288fa9475 100644
--- a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * SAMSUNG Exynos7 Espresso board device tree source
+ * Samsung Exynos7 Espresso board device tree source
  *
  * Copyright (c) 2014 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com
@@ -13,7 +13,7 @@
 #include <dt-bindings/gpio/gpio.h>
 
 / {
-	model = "Samsung Exynos7 Espresso board based on EXYNOS7";
+	model = "Samsung Exynos7 Espresso board based on Exynos7";
 	compatible = "samsung,exynos7-espresso", "samsung,exynos7";
 
 	aliases {
diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index 3a00ef0a17ff..5558045637ac 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * SAMSUNG EXYNOS7 SoC device tree source
+ * Samsung Exynos7 SoC device tree source
  *
  * Copyright (c) 2014 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com
-- 
2.17.1

