Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD33723BFCC
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  4 Aug 2020 21:27:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727911AbgHDT1s (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 4 Aug 2020 15:27:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:39980 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726027AbgHDT1q (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 4 Aug 2020 15:27:46 -0400
Received: from localhost.localdomain (unknown [194.230.155.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8754A22B42;
        Tue,  4 Aug 2020 19:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596569264;
        bh=Kj4TSO/LSs6bqyCELU5A9kw1plRi447WZDioJGJL4i8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=W2l1TNj8PsD2FUvMfptaSJ3c+nNtGGubqL8NTZs0hZ++lnlV7HKC4awxk8RRMT2yC
         7zoODlbYVJhUd9NgEWRXhp8Q/My21Q5CgrPnE6viEU7zPsx7m1s+PoPMeHzy2nQmyt
         vhzfZVjIS8Fudn1Et79ExHzxViJgdb7kSSO3Ji5s=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Russell King <linux@armlinux.org.uk>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        patches@opensource.cirrus.com, linux-clk@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Cc:     Sergio Prado <sergio.prado@e-labworks.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Cedric Roux <sed@free.fr>, Lihua Yao <ylhuajnu@outlook.com>
Subject: [PATCH v2 04/13] ARM: s3c: remove plat-samsung/.../samsung-time.h
Date:   Tue,  4 Aug 2020 21:26:45 +0200
Message-Id: <20200804192654.12783-5-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200804192654.12783-1-krzk@kernel.org>
References: <20200804192654.12783-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Remove the arch/arm/plat-samsung/include/plat/samsung-time.h header and
move the contents to common.h headers in mach-s3c24xx and mach-s3c64xx.
The definition of declared functions is already in common.c in mach
directories, so it is logically to put declaration next to them.

This is also one step further towards removal of plat-samsung directory
and it fixes W=1 build warnings:

    arch/arm/mach-s3c64xx/common.c:174:13: warning:
        no previous prototype for 'samsung_set_timer_source' [-Wmissing-prototypes]
      174 | void __init samsung_set_timer_source(unsigned int event, unsigned int source)

    arch/arm/mach-s3c64xx/common.c:180:13: warning:
        no previous prototype for 'samsung_timer_init' [-Wmissing-prototypes]
      180 | void __init samsung_timer_init(void)

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Tomasz Figa <tomasz.figa@gmail.com>

---

Changes since v1:
1. Add review tag.
---
 arch/arm/mach-s3c24xx/common.h                | 12 +++++++++
 arch/arm/mach-s3c24xx/mach-amlm5900.c         |  2 --
 arch/arm/mach-s3c24xx/mach-anubis.c           |  1 -
 arch/arm/mach-s3c24xx/mach-at2440evb.c        |  1 -
 arch/arm/mach-s3c24xx/mach-bast.c             |  1 -
 arch/arm/mach-s3c24xx/mach-gta02.c            |  1 -
 arch/arm/mach-s3c24xx/mach-h1940.c            |  1 -
 arch/arm/mach-s3c24xx/mach-jive.c             |  1 -
 arch/arm/mach-s3c24xx/mach-mini2440.c         |  1 -
 arch/arm/mach-s3c24xx/mach-n30.c              |  1 -
 arch/arm/mach-s3c24xx/mach-nexcoder.c         |  1 -
 arch/arm/mach-s3c24xx/mach-osiris.c           |  1 -
 arch/arm/mach-s3c24xx/mach-otom.c             |  1 -
 arch/arm/mach-s3c24xx/mach-qt2410.c           |  1 -
 arch/arm/mach-s3c24xx/mach-rx1950.c           |  1 -
 arch/arm/mach-s3c24xx/mach-rx3715.c           |  1 -
 arch/arm/mach-s3c24xx/mach-smdk2410.c         |  1 -
 arch/arm/mach-s3c24xx/mach-smdk2413.c         |  1 -
 arch/arm/mach-s3c24xx/mach-smdk2416.c         |  1 -
 arch/arm/mach-s3c24xx/mach-smdk2440.c         |  1 -
 arch/arm/mach-s3c24xx/mach-smdk2443.c         |  1 -
 arch/arm/mach-s3c24xx/mach-tct_hammer.c       |  1 -
 arch/arm/mach-s3c24xx/mach-vr1000.c           |  1 -
 arch/arm/mach-s3c24xx/mach-vstms.c            |  1 -
 arch/arm/mach-s3c64xx/common.h                | 13 ++++++++++
 arch/arm/mach-s3c64xx/mach-anw6410.c          |  1 -
 arch/arm/mach-s3c64xx/mach-crag6410.c         |  1 -
 arch/arm/mach-s3c64xx/mach-hmt.c              |  1 -
 arch/arm/mach-s3c64xx/mach-mini6410.c         |  1 -
 arch/arm/mach-s3c64xx/mach-ncp.c              |  1 -
 arch/arm/mach-s3c64xx/mach-real6410.c         |  1 -
 arch/arm/mach-s3c64xx/mach-smartq.c           |  1 -
 arch/arm/mach-s3c64xx/mach-smartq5.c          |  1 -
 arch/arm/mach-s3c64xx/mach-smartq7.c          |  1 -
 arch/arm/mach-s3c64xx/mach-smdk6400.c         |  1 -
 arch/arm/mach-s3c64xx/mach-smdk6410.c         |  1 -
 .../plat-samsung/include/plat/samsung-time.h  | 26 -------------------
 37 files changed, 25 insertions(+), 61 deletions(-)
 delete mode 100644 arch/arm/plat-samsung/include/plat/samsung-time.h

diff --git a/arch/arm/mach-s3c24xx/common.h b/arch/arm/mach-s3c24xx/common.h
index 12d2a112eec7..8d2e2c6ae7eb 100644
--- a/arch/arm/mach-s3c24xx/common.h
+++ b/arch/arm/mach-s3c24xx/common.h
@@ -108,4 +108,16 @@ extern struct platform_device s3c2443_device_dma;
 
 extern struct platform_device s3c2410_device_dclk;
 
+enum samsung_timer_mode {
+	SAMSUNG_PWM0,
+	SAMSUNG_PWM1,
+	SAMSUNG_PWM2,
+	SAMSUNG_PWM3,
+	SAMSUNG_PWM4,
+};
+
+extern void __init samsung_set_timer_source(enum samsung_timer_mode event,
+					    enum samsung_timer_mode source);
+extern void __init samsung_timer_init(void);
+
 #endif /* __ARCH_ARM_MACH_S3C24XX_COMMON_H */
diff --git a/arch/arm/mach-s3c24xx/mach-amlm5900.c b/arch/arm/mach-s3c24xx/mach-amlm5900.c
index 9a9daf526d0c..623c320f8253 100644
--- a/arch/arm/mach-s3c24xx/mach-amlm5900.c
+++ b/arch/arm/mach-s3c24xx/mach-amlm5900.c
@@ -45,8 +45,6 @@
 #include <linux/mtd/map.h>
 #include <linux/mtd/physmap.h>
 
-#include <plat/samsung-time.h>
-
 #include "common.h"
 
 static struct resource amlm5900_nor_resource =
diff --git a/arch/arm/mach-s3c24xx/mach-anubis.c b/arch/arm/mach-s3c24xx/mach-anubis.c
index 072966dcad78..44338dfb5470 100644
--- a/arch/arm/mach-s3c24xx/mach-anubis.c
+++ b/arch/arm/mach-s3c24xx/mach-anubis.c
@@ -44,7 +44,6 @@
 #include <plat/devs.h>
 #include <plat/cpu.h>
 #include <linux/platform_data/asoc-s3c24xx_simtec.h>
-#include <plat/samsung-time.h>
 
 #include "anubis.h"
 #include "common.h"
diff --git a/arch/arm/mach-s3c24xx/mach-at2440evb.c b/arch/arm/mach-s3c24xx/mach-at2440evb.c
index 58c5ef3cf1d7..02ac2e240bd7 100644
--- a/arch/arm/mach-s3c24xx/mach-at2440evb.c
+++ b/arch/arm/mach-s3c24xx/mach-at2440evb.c
@@ -43,7 +43,6 @@
 #include <plat/devs.h>
 #include <plat/cpu.h>
 #include <linux/platform_data/mmc-s3cmci.h>
-#include <plat/samsung-time.h>
 
 #include "common.h"
 
diff --git a/arch/arm/mach-s3c24xx/mach-bast.c b/arch/arm/mach-s3c24xx/mach-bast.c
index a7c3955ae8f6..cd67d00a46e4 100644
--- a/arch/arm/mach-s3c24xx/mach-bast.c
+++ b/arch/arm/mach-s3c24xx/mach-bast.c
@@ -50,7 +50,6 @@
 #include <plat/cpu-freq.h>
 #include <plat/devs.h>
 #include <plat/gpio-cfg.h>
-#include <plat/samsung-time.h>
 
 #include "bast.h"
 #include "common.h"
diff --git a/arch/arm/mach-s3c24xx/mach-gta02.c b/arch/arm/mach-s3c24xx/mach-gta02.c
index 594901f3b8e5..81d94a75d1c2 100644
--- a/arch/arm/mach-s3c24xx/mach-gta02.c
+++ b/arch/arm/mach-s3c24xx/mach-gta02.c
@@ -67,7 +67,6 @@
 #include <plat/devs.h>
 #include <plat/gpio-cfg.h>
 #include <plat/pm.h>
-#include <plat/samsung-time.h>
 
 #include "common.h"
 #include "gta02.h"
diff --git a/arch/arm/mach-s3c24xx/mach-h1940.c b/arch/arm/mach-s3c24xx/mach-h1940.c
index df652b332275..c09f61d35d57 100644
--- a/arch/arm/mach-s3c24xx/mach-h1940.c
+++ b/arch/arm/mach-s3c24xx/mach-h1940.c
@@ -58,7 +58,6 @@
 #include <plat/devs.h>
 #include <plat/gpio-cfg.h>
 #include <plat/pm.h>
-#include <plat/samsung-time.h>
 
 #include "common.h"
 #include "h1940.h"
diff --git a/arch/arm/mach-s3c24xx/mach-jive.c b/arch/arm/mach-s3c24xx/mach-jive.c
index 885e8f12e4b9..2c630ade08bb 100644
--- a/arch/arm/mach-s3c24xx/mach-jive.c
+++ b/arch/arm/mach-s3c24xx/mach-jive.c
@@ -48,7 +48,6 @@
 #include <plat/cpu.h>
 #include <plat/pm.h>
 #include <linux/platform_data/usb-s3c2410_udc.h>
-#include <plat/samsung-time.h>
 
 #include "common.h"
 #include "s3c2412-power.h"
diff --git a/arch/arm/mach-s3c24xx/mach-mini2440.c b/arch/arm/mach-s3c24xx/mach-mini2440.c
index 235749448311..936f7e3b7213 100644
--- a/arch/arm/mach-s3c24xx/mach-mini2440.c
+++ b/arch/arm/mach-s3c24xx/mach-mini2440.c
@@ -52,7 +52,6 @@
 #include <plat/gpio-cfg.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
-#include <plat/samsung-time.h>
 
 #include <sound/s3c24xx_uda134x.h>
 
diff --git a/arch/arm/mach-s3c24xx/mach-n30.c b/arch/arm/mach-s3c24xx/mach-n30.c
index 998ccff3c174..b9ceacfdd6ef 100644
--- a/arch/arm/mach-s3c24xx/mach-n30.c
+++ b/arch/arm/mach-s3c24xx/mach-n30.c
@@ -48,7 +48,6 @@
 #include <plat/gpio-cfg.h>
 #include <linux/platform_data/mmc-s3cmci.h>
 #include <linux/platform_data/usb-s3c2410_udc.h>
-#include <plat/samsung-time.h>
 
 #include "common.h"
 
diff --git a/arch/arm/mach-s3c24xx/mach-nexcoder.c b/arch/arm/mach-s3c24xx/mach-nexcoder.c
index c2f34758ccb6..92ecc15c4320 100644
--- a/arch/arm/mach-s3c24xx/mach-nexcoder.c
+++ b/arch/arm/mach-s3c24xx/mach-nexcoder.c
@@ -40,7 +40,6 @@
 #include <plat/gpio-cfg.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
-#include <plat/samsung-time.h>
 
 #include "common.h"
 
diff --git a/arch/arm/mach-s3c24xx/mach-osiris.c b/arch/arm/mach-s3c24xx/mach-osiris.c
index ee3630cb236a..ed03928dffe4 100644
--- a/arch/arm/mach-s3c24xx/mach-osiris.c
+++ b/arch/arm/mach-s3c24xx/mach-osiris.c
@@ -40,7 +40,6 @@
 #include <plat/cpu-freq.h>
 #include <plat/devs.h>
 #include <plat/gpio-cfg.h>
-#include <plat/samsung-time.h>
 
 #include <mach/hardware.h>
 #include <mach/regs-gpio.h>
diff --git a/arch/arm/mach-s3c24xx/mach-otom.c b/arch/arm/mach-s3c24xx/mach-otom.c
index 4e24d89e870b..d65c65ca1a38 100644
--- a/arch/arm/mach-s3c24xx/mach-otom.c
+++ b/arch/arm/mach-s3c24xx/mach-otom.c
@@ -27,7 +27,6 @@
 
 #include <plat/cpu.h>
 #include <plat/devs.h>
-#include <plat/samsung-time.h>
 
 #include "common.h"
 #include "otom.h"
diff --git a/arch/arm/mach-s3c24xx/mach-qt2410.c b/arch/arm/mach-s3c24xx/mach-qt2410.c
index ff9e3197309b..2f3c8b31a08a 100644
--- a/arch/arm/mach-s3c24xx/mach-qt2410.c
+++ b/arch/arm/mach-s3c24xx/mach-qt2410.c
@@ -44,7 +44,6 @@
 #include <plat/devs.h>
 #include <plat/cpu.h>
 #include <plat/pm.h>
-#include <plat/samsung-time.h>
 
 #include "common.h"
 #include "common-smdk.h"
diff --git a/arch/arm/mach-s3c24xx/mach-rx1950.c b/arch/arm/mach-s3c24xx/mach-rx1950.c
index fde98b175c75..c46fb6b9e11a 100644
--- a/arch/arm/mach-s3c24xx/mach-rx1950.c
+++ b/arch/arm/mach-s3c24xx/mach-rx1950.c
@@ -53,7 +53,6 @@
 #include <plat/cpu.h>
 #include <plat/devs.h>
 #include <plat/pm.h>
-#include <plat/samsung-time.h>
 #include <plat/gpio-cfg.h>
 
 #include "common.h"
diff --git a/arch/arm/mach-s3c24xx/mach-rx3715.c b/arch/arm/mach-s3c24xx/mach-rx3715.c
index 995f1ff34a1b..740865ef8e23 100644
--- a/arch/arm/mach-s3c24xx/mach-rx3715.c
+++ b/arch/arm/mach-s3c24xx/mach-rx3715.c
@@ -43,7 +43,6 @@
 #include <plat/cpu.h>
 #include <plat/devs.h>
 #include <plat/pm.h>
-#include <plat/samsung-time.h>
 
 #include "common.h"
 #include "h1940.h"
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2410.c b/arch/arm/mach-s3c24xx/mach-smdk2410.c
index 18dfef52c8bf..1c2f20ab0520 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2410.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2410.c
@@ -32,7 +32,6 @@
 
 #include <plat/devs.h>
 #include <plat/cpu.h>
-#include <plat/samsung-time.h>
 
 #include "common.h"
 #include "common-smdk.h"
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2413.c b/arch/arm/mach-s3c24xx/mach-smdk2413.c
index ca80167f268d..9782cc3e698c 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2413.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2413.c
@@ -40,7 +40,6 @@
 
 #include <plat/devs.h>
 #include <plat/cpu.h>
-#include <plat/samsung-time.h>
 
 #include "common.h"
 #include "common-smdk.h"
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2416.c b/arch/arm/mach-s3c24xx/mach-smdk2416.c
index 61c3e45898d3..f98feb45568d 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2416.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2416.c
@@ -44,7 +44,6 @@
 #include <plat/sdhci.h>
 #include <linux/platform_data/usb-s3c2410_udc.h>
 #include <linux/platform_data/s3c-hsudc.h>
-#include <plat/samsung-time.h>
 
 #include <plat/fb.h>
 
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2440.c b/arch/arm/mach-s3c24xx/mach-smdk2440.c
index 7bafcd8ea104..ebc184cd9aba 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2440.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2440.c
@@ -35,7 +35,6 @@
 
 #include <plat/devs.h>
 #include <plat/cpu.h>
-#include <plat/samsung-time.h>
 
 #include "common.h"
 #include "common-smdk.h"
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2443.c b/arch/arm/mach-s3c24xx/mach-smdk2443.c
index 2358ed5ed7be..dcc4e446938a 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2443.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2443.c
@@ -34,7 +34,6 @@
 
 #include <plat/devs.h>
 #include <plat/cpu.h>
-#include <plat/samsung-time.h>
 
 #include "common.h"
 #include "common-smdk.h"
diff --git a/arch/arm/mach-s3c24xx/mach-tct_hammer.c b/arch/arm/mach-s3c24xx/mach-tct_hammer.c
index 8d8ddd6ea305..e334ddf0832f 100644
--- a/arch/arm/mach-s3c24xx/mach-tct_hammer.c
+++ b/arch/arm/mach-s3c24xx/mach-tct_hammer.c
@@ -36,7 +36,6 @@
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/map.h>
 #include <linux/mtd/physmap.h>
-#include <plat/samsung-time.h>
 
 #include "common.h"
 
diff --git a/arch/arm/mach-s3c24xx/mach-vr1000.c b/arch/arm/mach-s3c24xx/mach-vr1000.c
index 6a3fb2becc7c..2f00217fa44e 100644
--- a/arch/arm/mach-s3c24xx/mach-vr1000.c
+++ b/arch/arm/mach-s3c24xx/mach-vr1000.c
@@ -42,7 +42,6 @@
 #include <plat/cpu.h>
 #include <plat/devs.h>
 #include <plat/gpio-cfg.h>
-#include <plat/samsung-time.h>
 
 #include "bast.h"
 #include "common.h"
diff --git a/arch/arm/mach-s3c24xx/mach-vstms.c b/arch/arm/mach-s3c24xx/mach-vstms.c
index d76b28b65e65..9f479e28b8fd 100644
--- a/arch/arm/mach-s3c24xx/mach-vstms.c
+++ b/arch/arm/mach-s3c24xx/mach-vstms.c
@@ -39,7 +39,6 @@
 
 #include <plat/devs.h>
 #include <plat/cpu.h>
-#include <plat/samsung-time.h>
 
 #include "common.h"
 
diff --git a/arch/arm/mach-s3c64xx/common.h b/arch/arm/mach-s3c64xx/common.h
index f4eca42cdc86..6fcfb0e0ffa5 100644
--- a/arch/arm/mach-s3c64xx/common.h
+++ b/arch/arm/mach-s3c64xx/common.h
@@ -52,4 +52,17 @@ extern struct pl08x_platform_data s3c64xx_dma0_plat_data;
 extern struct pl08x_platform_data s3c64xx_dma1_plat_data;
 #endif
 
+/* Samsung HR-Timer Clock mode */
+enum samsung_timer_mode {
+	SAMSUNG_PWM0,
+	SAMSUNG_PWM1,
+	SAMSUNG_PWM2,
+	SAMSUNG_PWM3,
+	SAMSUNG_PWM4,
+};
+
+extern void __init samsung_set_timer_source(enum samsung_timer_mode event,
+					    enum samsung_timer_mode source);
+extern void __init samsung_timer_init(void);
+
 #endif /* __ARCH_ARM_MACH_S3C64XX_COMMON_H */
diff --git a/arch/arm/mach-s3c64xx/mach-anw6410.c b/arch/arm/mach-s3c64xx/mach-anw6410.c
index 0d3d5befb806..495549573d36 100644
--- a/arch/arm/mach-s3c64xx/mach-anw6410.c
+++ b/arch/arm/mach-s3c64xx/mach-anw6410.c
@@ -44,7 +44,6 @@
 #include <mach/irqs.h>
 #include <mach/regs-gpio.h>
 #include <mach/gpio-samsung.h>
-#include <plat/samsung-time.h>
 
 #include "common.h"
 #include "regs-modem.h"
diff --git a/arch/arm/mach-s3c64xx/mach-crag6410.c b/arch/arm/mach-s3c64xx/mach-crag6410.c
index da9654255e3f..3cb43a33e3f8 100644
--- a/arch/arm/mach-s3c64xx/mach-crag6410.c
+++ b/arch/arm/mach-s3c64xx/mach-crag6410.c
@@ -61,7 +61,6 @@
 #include <plat/adc.h>
 #include <linux/platform_data/i2c-s3c2410.h>
 #include <plat/pm.h>
-#include <plat/samsung-time.h>
 
 #include "common.h"
 #include "crag6410.h"
diff --git a/arch/arm/mach-s3c64xx/mach-hmt.c b/arch/arm/mach-s3c64xx/mach-hmt.c
index e7080215c624..cadb63103517 100644
--- a/arch/arm/mach-s3c64xx/mach-hmt.c
+++ b/arch/arm/mach-s3c64xx/mach-hmt.c
@@ -39,7 +39,6 @@
 
 #include <plat/devs.h>
 #include <plat/cpu.h>
-#include <plat/samsung-time.h>
 
 #include "common.h"
 
diff --git a/arch/arm/mach-s3c64xx/mach-mini6410.c b/arch/arm/mach-s3c64xx/mach-mini6410.c
index 0dd36ae49e6a..77bad2891020 100644
--- a/arch/arm/mach-s3c64xx/mach-mini6410.c
+++ b/arch/arm/mach-s3c64xx/mach-mini6410.c
@@ -39,7 +39,6 @@
 
 #include <video/platform_lcd.h>
 #include <video/samsung_fimd.h>
-#include <plat/samsung-time.h>
 
 #include "common.h"
 #include "regs-modem.h"
diff --git a/arch/arm/mach-s3c64xx/mach-ncp.c b/arch/arm/mach-s3c64xx/mach-ncp.c
index 13fea5c86ca3..a7c328d32824 100644
--- a/arch/arm/mach-s3c64xx/mach-ncp.c
+++ b/arch/arm/mach-s3c64xx/mach-ncp.c
@@ -36,7 +36,6 @@
 
 #include <plat/devs.h>
 #include <plat/cpu.h>
-#include <plat/samsung-time.h>
 
 #include "common.h"
 
diff --git a/arch/arm/mach-s3c64xx/mach-real6410.c b/arch/arm/mach-s3c64xx/mach-real6410.c
index 0ff88b6859c4..993ce7bdd740 100644
--- a/arch/arm/mach-s3c64xx/mach-real6410.c
+++ b/arch/arm/mach-s3c64xx/mach-real6410.c
@@ -38,7 +38,6 @@
 
 #include <video/platform_lcd.h>
 #include <video/samsung_fimd.h>
-#include <plat/samsung-time.h>
 
 #include "common.h"
 #include "regs-modem.h"
diff --git a/arch/arm/mach-s3c64xx/mach-smartq.c b/arch/arm/mach-s3c64xx/mach-smartq.c
index 5025db607c0f..37d878909b17 100644
--- a/arch/arm/mach-s3c64xx/mach-smartq.c
+++ b/arch/arm/mach-s3c64xx/mach-smartq.c
@@ -32,7 +32,6 @@
 #include <linux/platform_data/touchscreen-s3c2410.h>
 
 #include <video/platform_lcd.h>
-#include <plat/samsung-time.h>
 
 #include "common.h"
 #include "mach-smartq.h"
diff --git a/arch/arm/mach-s3c64xx/mach-smartq5.c b/arch/arm/mach-s3c64xx/mach-smartq5.c
index 44e9edb144fa..c1d173a97f2a 100644
--- a/arch/arm/mach-s3c64xx/mach-smartq5.c
+++ b/arch/arm/mach-s3c64xx/mach-smartq5.c
@@ -23,7 +23,6 @@
 #include <plat/devs.h>
 #include <plat/fb.h>
 #include <plat/gpio-cfg.h>
-#include <plat/samsung-time.h>
 
 #include "common.h"
 #include "mach-smartq.h"
diff --git a/arch/arm/mach-s3c64xx/mach-smartq7.c b/arch/arm/mach-s3c64xx/mach-smartq7.c
index 815ee7d0b5e3..493fd8cd83eb 100644
--- a/arch/arm/mach-s3c64xx/mach-smartq7.c
+++ b/arch/arm/mach-s3c64xx/mach-smartq7.c
@@ -23,7 +23,6 @@
 #include <plat/devs.h>
 #include <plat/fb.h>
 #include <plat/gpio-cfg.h>
-#include <plat/samsung-time.h>
 
 #include "common.h"
 #include "mach-smartq.h"
diff --git a/arch/arm/mach-s3c64xx/mach-smdk6400.c b/arch/arm/mach-s3c64xx/mach-smdk6400.c
index cbd16843c7d1..76b676b6acbb 100644
--- a/arch/arm/mach-s3c64xx/mach-smdk6400.c
+++ b/arch/arm/mach-s3c64xx/mach-smdk6400.c
@@ -30,7 +30,6 @@
 #include <plat/cpu.h>
 #include <linux/platform_data/i2c-s3c2410.h>
 #include <mach/gpio-samsung.h>
-#include <plat/samsung-time.h>
 
 #include "common.h"
 
diff --git a/arch/arm/mach-s3c64xx/mach-smdk6410.c b/arch/arm/mach-s3c64xx/mach-smdk6410.c
index 56f406c0c3dd..3bd13701d01c 100644
--- a/arch/arm/mach-s3c64xx/mach-smdk6410.c
+++ b/arch/arm/mach-s3c64xx/mach-smdk6410.c
@@ -64,7 +64,6 @@
 #include <plat/adc.h>
 #include <linux/platform_data/touchscreen-s3c2410.h>
 #include <plat/keypad.h>
-#include <plat/samsung-time.h>
 
 #include "backlight.h"
 #include "common.h"
diff --git a/arch/arm/plat-samsung/include/plat/samsung-time.h b/arch/arm/plat-samsung/include/plat/samsung-time.h
deleted file mode 100644
index 32ab0860f631..000000000000
--- a/arch/arm/plat-samsung/include/plat/samsung-time.h
+++ /dev/null
@@ -1,26 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright 2011 Samsung Electronics Co., Ltd.
- *		http://www.samsung.com/
- *
- * Header file for samsung s3c and s5p time support
- */
-
-#ifndef __ASM_PLAT_SAMSUNG_TIME_H
-#define __ASM_PLAT_SAMSUNG_TIME_H __FILE__
-
-/* Samsung HR-Timer Clock mode */
-enum samsung_timer_mode {
-	SAMSUNG_PWM0,
-	SAMSUNG_PWM1,
-	SAMSUNG_PWM2,
-	SAMSUNG_PWM3,
-	SAMSUNG_PWM4,
-};
-
-extern void __init samsung_set_timer_source(enum samsung_timer_mode event,
-					enum samsung_timer_mode source);
-
-extern void __init samsung_timer_init(void);
-
-#endif /* __ASM_PLAT_SAMSUNG_TIME_H */
-- 
2.17.1

