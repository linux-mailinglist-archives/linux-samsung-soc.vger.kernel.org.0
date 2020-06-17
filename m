Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 575AF1FD0EE
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 17 Jun 2020 17:28:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726879AbgFQP2M (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 17 Jun 2020 11:28:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:59838 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726758AbgFQP2M (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 17 Jun 2020 11:28:12 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.126])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 48AEE20897;
        Wed, 17 Jun 2020 15:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592407691;
        bh=8qW6KNlzlzC7EBTXdd61a2qk7lukXUvfzQKXOwpai5k=;
        h=From:To:Subject:Date:From;
        b=cpPPRT0I4JwwMQSQrkIWPxGIypkDjBCPgh7cU5OkQvEiAobZbQ9zH6Xs6zu1cwFNO
         mhjr5WQV2jfgiBoPD2smPD6r1uKCEbD+iwGe/PvWYiJ34+j5FCnvsx+/750Xdf3h4b
         QCKRsrBGy4xdPjHvjaAIbwsUODipILHWTs8ltnCE=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kamil Debski <kamil@wypas.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH RESEND v2] phy: exynos: Rename Exynos to lowercase
Date:   Wed, 17 Jun 2020 17:28:03 +0200
Message-Id: <20200617152803.17941-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Fix up inconsistent usage of upper and lowercase letters in "Exynos"
name.

"EXYNOS" is not an abbreviation but a regular trademarked name.
Therefore it should be written with lowercase letters starting with
capital letter.

The lowercase "Exynos" name is promoted by its manufacturer Samsung
Electronics Co., Ltd., in advertisement materials and on website.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Move bindings change to separate patch.
---
 drivers/phy/allwinner/phy-sun4i-usb.c       | 2 +-
 drivers/phy/samsung/Kconfig                 | 8 ++++----
 drivers/phy/samsung/phy-exynos-dp-video.c   | 4 ++--
 drivers/phy/samsung/phy-exynos-mipi-video.c | 4 ++--
 drivers/phy/samsung/phy-exynos-pcie.c       | 2 +-
 drivers/phy/samsung/phy-exynos5-usbdrd.c    | 6 +++---
 drivers/phy/samsung/phy-samsung-usb2.c      | 2 +-
 7 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index 856927382248..7e09ad6a0b42 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -7,7 +7,7 @@
  * Based on code from
  * Allwinner Technology Co., Ltd. <www.allwinnertech.com>
  *
- * Modelled after: Samsung S5P/EXYNOS SoC series MIPI CSIS/DSIM DPHY driver
+ * Modelled after: Samsung S5P/Exynos SoC series MIPI CSIS/DSIM DPHY driver
  * Copyright (C) 2013 Samsung Electronics Co., Ltd.
  * Author: Sylwester Nawrocki <s.nawrocki@samsung.com>
  */
diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
index 9e483d1fdaf2..19f2e3119343 100644
--- a/drivers/phy/samsung/Kconfig
+++ b/drivers/phy/samsung/Kconfig
@@ -3,23 +3,23 @@
 # Phy drivers for Samsung platforms
 #
 config PHY_EXYNOS_DP_VIDEO
-	tristate "EXYNOS SoC series Display Port PHY driver"
+	tristate "Exynos SoC series Display Port PHY driver"
 	depends on OF
 	depends on ARCH_EXYNOS || COMPILE_TEST
 	default ARCH_EXYNOS
 	select GENERIC_PHY
 	help
-	  Support for Display Port PHY found on Samsung EXYNOS SoCs.
+	  Support for Display Port PHY found on Samsung Exynos SoCs.
 
 config PHY_EXYNOS_MIPI_VIDEO
-	tristate "S5P/EXYNOS SoC series MIPI CSI-2/DSI PHY driver"
+	tristate "S5P/Exynos SoC series MIPI CSI-2/DSI PHY driver"
 	depends on HAS_IOMEM
 	depends on ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
 	select GENERIC_PHY
 	default y if ARCH_S5PV210 || ARCH_EXYNOS
 	help
 	  Support for MIPI CSI-2 and MIPI DSI DPHY found on Samsung S5P
-	  and EXYNOS SoCs.
+	  and Exynos SoCs.
 
 config PHY_EXYNOS_PCIE
 	bool "Exynos PCIe PHY driver"
diff --git a/drivers/phy/samsung/phy-exynos-dp-video.c b/drivers/phy/samsung/phy-exynos-dp-video.c
index 6c607df1dc9a..2b670ef91deb 100644
--- a/drivers/phy/samsung/phy-exynos-dp-video.c
+++ b/drivers/phy/samsung/phy-exynos-dp-video.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Samsung EXYNOS SoC series Display Port PHY driver
+ * Samsung Exynos SoC series Display Port PHY driver
  *
  * Copyright (C) 2013 Samsung Electronics Co., Ltd.
  * Author: Jingoo Han <jg1.han@samsung.com>
@@ -115,5 +115,5 @@ static struct platform_driver exynos_dp_video_phy_driver = {
 module_platform_driver(exynos_dp_video_phy_driver);
 
 MODULE_AUTHOR("Jingoo Han <jg1.han@samsung.com>");
-MODULE_DESCRIPTION("Samsung EXYNOS SoC DP PHY driver");
+MODULE_DESCRIPTION("Samsung Exynos SoC DP PHY driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/phy/samsung/phy-exynos-mipi-video.c b/drivers/phy/samsung/phy-exynos-mipi-video.c
index bb51195f189f..c1df1ef3ee3c 100644
--- a/drivers/phy/samsung/phy-exynos-mipi-video.c
+++ b/drivers/phy/samsung/phy-exynos-mipi-video.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Samsung S5P/EXYNOS SoC series MIPI CSIS/DSIM DPHY driver
+ * Samsung S5P/Exynos SoC series MIPI CSIS/DSIM DPHY driver
  *
  * Copyright (C) 2013,2016 Samsung Electronics Co., Ltd.
  * Author: Sylwester Nawrocki <s.nawrocki@samsung.com>
@@ -364,6 +364,6 @@ static struct platform_driver exynos_mipi_video_phy_driver = {
 };
 module_platform_driver(exynos_mipi_video_phy_driver);
 
-MODULE_DESCRIPTION("Samsung S5P/EXYNOS SoC MIPI CSI-2/DSI PHY driver");
+MODULE_DESCRIPTION("Samsung S5P/Exynos SoC MIPI CSI-2/DSI PHY driver");
 MODULE_AUTHOR("Sylwester Nawrocki <s.nawrocki@samsung.com>");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/phy/samsung/phy-exynos-pcie.c b/drivers/phy/samsung/phy-exynos-pcie.c
index 659e7ae0a6cf..7e28b1aea0d1 100644
--- a/drivers/phy/samsung/phy-exynos-pcie.c
+++ b/drivers/phy/samsung/phy-exynos-pcie.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Samsung EXYNOS SoC series PCIe PHY driver
+ * Samsung Exynos SoC series PCIe PHY driver
  *
  * Phy provider for PCIe controller on Exynos SoC series
  *
diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index e510732afb8b..eb06ce9f748f 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Samsung EXYNOS5 SoC series USB DRD PHY driver
+ * Samsung Exynos5 SoC series USB DRD PHY driver
  *
  * Phy provider for USB 3.0 DRD controller on Exynos5 SoC series
  *
@@ -33,7 +33,7 @@
 #define EXYNOS5_FSEL_24MHZ		0x5
 #define EXYNOS5_FSEL_50MHZ		0x7
 
-/* EXYNOS5: USB 3.0 DRD PHY registers */
+/* Exynos5: USB 3.0 DRD PHY registers */
 #define EXYNOS5_DRD_LINKSYSTEM			0x04
 
 #define LINKSYSTEM_FLADJ_MASK			(0x3f << 1)
@@ -958,7 +958,7 @@ static struct platform_driver exynos5_usb3drd_phy = {
 };
 
 module_platform_driver(exynos5_usb3drd_phy);
-MODULE_DESCRIPTION("Samsung EXYNOS5 SoCs USB 3.0 DRD controller PHY driver");
+MODULE_DESCRIPTION("Samsung Exynos5 SoCs USB 3.0 DRD controller PHY driver");
 MODULE_AUTHOR("Vivek Gautam <gautam.vivek@samsung.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:exynos5_usb3drd_phy");
diff --git a/drivers/phy/samsung/phy-samsung-usb2.c b/drivers/phy/samsung/phy-samsung-usb2.c
index 090aa02e02de..a3ed3ff04690 100644
--- a/drivers/phy/samsung/phy-samsung-usb2.c
+++ b/drivers/phy/samsung/phy-samsung-usb2.c
@@ -255,7 +255,7 @@ static struct platform_driver samsung_usb2_phy_driver = {
 };
 
 module_platform_driver(samsung_usb2_phy_driver);
-MODULE_DESCRIPTION("Samsung S5P/EXYNOS SoC USB PHY driver");
+MODULE_DESCRIPTION("Samsung S5P/Exynos SoC USB PHY driver");
 MODULE_AUTHOR("Kamil Debski <k.debski@samsung.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:samsung-usb2-phy");
-- 
2.17.1

