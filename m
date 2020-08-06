Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47EA423E0D4
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  6 Aug 2020 20:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728715AbgHFSin (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 6 Aug 2020 14:38:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729184AbgHFSeL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 6 Aug 2020 14:34:11 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19A78C0617A4
        for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Aug 2020 11:34:09 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id p20so10038021wrf.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Aug 2020 11:34:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:resent-from:resent-date:resent-message-id
         :resent-to:dkim-signature:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=jxe9g4568Iax5508wb//Kr95Z/pwkwVYLfxSD8VPeDc=;
        b=Al91B3sTgxhCw9q0dI+slYgQgTrdA5LfmfkmLyndy3OX3zEGXtw/hhlJXSGK2NE9fP
         zK0wZaxsBa1jAb2LVa5H0n3U16kBW7u+wlJapQekcDJO1S9NEONC4lAIRQeUDKuj2jou
         lKD/rQYofOV/Gw0AYRP+NdW8TmJicYaU8xYDOsBDiLGGdBqkVUS2fshyJPrgrg3z3ZzE
         uzc5eW7+M0PhvDm0/WyYrrQOHtZkWcxUXgnAn7IewbnVLal3I7k71bYD2BCIMRnU9d2R
         CwhhN39rmMiwz33j+PZM4Q16rf1xxlDip9CjK0qEMUuRKLpplf1KxFtYhFbI+idk3RaO
         z0Hw==
X-Gm-Message-State: AOAM530BWerP18vPG0l9gCfdAfoaoAtUJ2Iu/cEPYb1J4miNSecka1Wb
        NIB+4dBwPCstlrEd8yN9G/D7RBMtGwY=
X-Google-Smtp-Source: ABdhPJwoYy2EcF+ZorD90zXPflBEgd9voPxLszht7lBMPdmfpu/Po4BOw52mdvwdJfunZXhLYdAVwQ==
X-Received: by 2002:a5d:6541:: with SMTP id z1mr8144926wrv.320.1596738847161;
        Thu, 06 Aug 2020 11:34:07 -0700 (PDT)
Received: from kozik-lap ([194.230.155.117])
        by smtp.googlemail.com with ESMTPSA id b123sm7460861wme.20.2020.08.06.11.34.06
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 11:34:06 -0700 (PDT)
Received: by 2002:ab3:1105:0:0:0:0:0 with SMTP id j5csp1542477lta;
        Thu, 6 Aug 2020 11:24:43 -0700 (PDT)
X-Received: by 2002:a63:6fc3:: with SMTP id k186mr8738370pgc.109.1596738282856;
        Thu, 06 Aug 2020 11:24:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596738282; cv=none;
        d=google.com; s=arc-20160816;
        b=QgpRmmdj3E8Lf/vY6mi8t5j8BiYU2VlprQLmPsdM/M2FUhif/Vkv+yUC+AxmqR78Vt
         8m8I0jcZjDfFd7XdLeXjBVXbNalvebKdiNRp4MFuk9Ogi2gEiXSaEYMZRv4G5wXTfIN3
         n6UaiGBwEgXs5J4/4k1C+59iocOsxPeczOeRjFC1l82bPKZwIY62KaL9ae4NDRATfEOl
         2CXxoYSY88qoDjuKP9+9r+NF61WO01eG7UQdySIE0MI6KpauAgdOFUVVTU41soFr7v71
         2fGUgX0JJ6tjfZcxIQ/46k+tgSoXEWqaK5XEoU7mOhYkowTMPD+eULrReB87i2TPsfx8
         vtTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature:delivered-to;
        bh=jxe9g4568Iax5508wb//Kr95Z/pwkwVYLfxSD8VPeDc=;
        b=kP3L7UOKJyM93unmqQLVP0d9k7Gx2MJh2kbBnpBcU/sdQrJSq6GbEsSNsmZc2+lPe+
         k9j48c+hJmf/VNhcPNII5E26N6RAyfpUj5w4Ge3GkpmhckDPb1SwzpVCBHq5eCBYcNKO
         DxrsYsE40TF58Lh0EZ2oENSZ64jufWtBPVoi9RKMHbTEuyhIp/3JTK+dVSZbmyFXaQoP
         RIHee28y79WKl38RgDnLzXbuqrteFd0MbSgUHNwTCf9wtyMQiat6jonoAvUI5crZ9OYE
         BLeqAA7ZEpjNRJmjyr+pboneT5wvBNM6yY9XI7jfKhXjjXt+B3t1apeteOxHeHQBZUFI
         oYzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=default header.b=2agLhmWN;
       spf=pass (google.com: domain of krzk@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=krzk@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by mx.google.com with ESMTPS id h19si4099625plb.213.2020.08.06.11.24.42
        for <k.kozlowski.k+kernel@gmail.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Aug 2020 11:24:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of krzk@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: by mail.kernel.org (Postfix)
        id D41E923100; Thu,  6 Aug 2020 18:24:42 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1995322EBE;
        Thu,  6 Aug 2020 18:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596738282;
        bh=CmyXjXDSzWFOYfV+J6SRyGYZY72jRKENxVsUXecQgyE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=2agLhmWN2lHRhYkVP6j//+RDqkGBLxsHx+/M0CK1A7eaAtiMdYI+NAHK1fG4/zAJc
         xrb8XPMdp7uayBaPu3GJn91TnCAqpuKq30doKerAXIlkrLxzTD2bGSCBrb5qV+51Xu
         wtgU3m97AYl83aXNx/8uwX2doueLZimRSGlc+UZo=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Kukjin Kim <kgene@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 38/41] ARM: s3c24xx: stop including mach/hardware.h from mach/io.h
Date:   Thu,  6 Aug 2020 20:20:55 +0200
Message-Id: <20200806182059.2431-38-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806181932.2253-1-krzk@kernel.org>
References: <20200806181932.2253-1-krzk@kernel.org>
X-TUID: FjMPBkX91Rma
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

A number of other files rely on mach/map.h to be indirectly
included from mach/io.h through mach/hardware.h.

Reduce this to the minimal plat/map-base.h and add explicit
includes everywhere else.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/mach-s3c24xx/common.c                          | 1 +
 arch/arm/mach-s3c24xx/include/mach/gpio-samsung.h       | 2 ++
 arch/arm/mach-s3c24xx/include/mach/hardware.h           | 7 -------
 arch/arm/mach-s3c24xx/include/mach/io.h                 | 3 +--
 arch/arm/mach-s3c24xx/include/mach/regs-clock.h         | 2 ++
 arch/arm/mach-s3c24xx/include/mach/regs-gpio.h          | 2 ++
 arch/arm/mach-s3c24xx/include/mach/regs-irq.h           | 2 ++
 arch/arm/mach-s3c24xx/include/mach/regs-s3c2443-clock.h | 1 +
 arch/arm/mach-s3c24xx/include/mach/s3c2412.h            | 2 ++
 arch/arm/mach-s3c24xx/mach-h1940.c                      | 1 +
 arch/arm/mach-s3c24xx/mach-jive.c                       | 1 +
 arch/arm/mach-s3c24xx/mach-rx1950.c                     | 1 +
 arch/arm/mach-s3c24xx/pm-h1940.S                        | 1 -
 arch/arm/mach-s3c24xx/regs-mem.h                        | 2 ++
 arch/arm/mach-s3c24xx/s3c2410.c                         | 2 +-
 arch/arm/mach-s3c24xx/s3c2412.c                         | 2 +-
 arch/arm/mach-s3c24xx/s3c2416.c                         | 2 +-
 arch/arm/mach-s3c24xx/s3c2443.c                         | 2 +-
 arch/arm/mach-s3c24xx/s3c244x.c                         | 2 +-
 arch/arm/mach-s3c24xx/sleep-s3c2410.S                   | 1 -
 arch/arm/mach-s3c24xx/sleep-s3c2412.S                   | 1 -
 arch/arm/mach-s3c24xx/sleep.S                           | 1 -
 22 files changed, 23 insertions(+), 18 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/common.c b/arch/arm/mach-s3c24xx/common.c
index f987de1a61c2..30b0dcd20f17 100644
--- a/arch/arm/mach-s3c24xx/common.c
+++ b/arch/arm/mach-s3c24xx/common.c
@@ -23,6 +23,7 @@
 #include <linux/clk/samsung.h>
 
 #include <mach/hardware.h>
+#include <mach/map.h>
 #include <mach/regs-clock.h>
 #include <asm/irq.h>
 #include <asm/cacheflush.h>
diff --git a/arch/arm/mach-s3c24xx/include/mach/gpio-samsung.h b/arch/arm/mach-s3c24xx/include/mach/gpio-samsung.h
index 2ad22b2d459b..f8a114891f16 100644
--- a/arch/arm/mach-s3c24xx/include/mach/gpio-samsung.h
+++ b/arch/arm/mach-s3c24xx/include/mach/gpio-samsung.h
@@ -14,6 +14,8 @@
 #ifndef GPIO_SAMSUNG_S3C24XX_H
 #define GPIO_SAMSUNG_S3C24XX_H
 
+#include <mach/map.h>
+
 /*
  * GPIO sizes for various SoCs:
  *
diff --git a/arch/arm/mach-s3c24xx/include/mach/hardware.h b/arch/arm/mach-s3c24xx/include/mach/hardware.h
index f28ac6c78d82..c732ea54984c 100644
--- a/arch/arm/mach-s3c24xx/include/mach/hardware.h
+++ b/arch/arm/mach-s3c24xx/include/mach/hardware.h
@@ -9,13 +9,6 @@
 #ifndef __ASM_ARCH_HARDWARE_H
 #define __ASM_ARCH_HARDWARE_H
 
-#ifndef __ASSEMBLY__
-
 extern unsigned int s3c2410_modify_misccr(unsigned int clr, unsigned int chg);
 
-#endif /* __ASSEMBLY__ */
-
-#include <linux/sizes.h>
-#include <mach/map.h>
-
 #endif /* __ASM_ARCH_HARDWARE_H */
diff --git a/arch/arm/mach-s3c24xx/include/mach/io.h b/arch/arm/mach-s3c24xx/include/mach/io.h
index 3e8bff26cdd5..bcddf615adb6 100644
--- a/arch/arm/mach-s3c24xx/include/mach/io.h
+++ b/arch/arm/mach-s3c24xx/include/mach/io.h
@@ -10,8 +10,7 @@
 #ifndef __ASM_ARM_ARCH_IO_H
 #define __ASM_ARM_ARCH_IO_H
 
-#include <mach/hardware.h>
-
+#include <plat/map-base.h>
 
 /*
  * ISA style IO, for each machine to sort out mappings for,
diff --git a/arch/arm/mach-s3c24xx/include/mach/regs-clock.h b/arch/arm/mach-s3c24xx/include/mach/regs-clock.h
index 7ca3dd4f13c0..da4e7b3aeba6 100644
--- a/arch/arm/mach-s3c24xx/include/mach/regs-clock.h
+++ b/arch/arm/mach-s3c24xx/include/mach/regs-clock.h
@@ -9,6 +9,8 @@
 #ifndef __ASM_ARM_REGS_CLOCK
 #define __ASM_ARM_REGS_CLOCK
 
+#include <mach/map.h>
+
 #define S3C2410_CLKREG(x) ((x) + S3C24XX_VA_CLKPWR)
 
 #define S3C2410_PLLVAL(_m,_p,_s) ((_m) << 12 | ((_p) << 4) | ((_s)))
diff --git a/arch/arm/mach-s3c24xx/include/mach/regs-gpio.h b/arch/arm/mach-s3c24xx/include/mach/regs-gpio.h
index 594e967c0673..51827d5577b6 100644
--- a/arch/arm/mach-s3c24xx/include/mach/regs-gpio.h
+++ b/arch/arm/mach-s3c24xx/include/mach/regs-gpio.h
@@ -10,6 +10,8 @@
 #ifndef __ASM_ARCH_REGS_GPIO_H
 #define __ASM_ARCH_REGS_GPIO_H
 
+#include <plat/map-s3c.h>
+
 #define S3C24XX_MISCCR		S3C24XX_GPIOREG2(0x80)
 
 /* general configuration options */
diff --git a/arch/arm/mach-s3c24xx/include/mach/regs-irq.h b/arch/arm/mach-s3c24xx/include/mach/regs-irq.h
index 8d8e669e3903..2921b48c56b2 100644
--- a/arch/arm/mach-s3c24xx/include/mach/regs-irq.h
+++ b/arch/arm/mach-s3c24xx/include/mach/regs-irq.h
@@ -8,6 +8,8 @@
 #ifndef ___ASM_ARCH_REGS_IRQ_H
 #define ___ASM_ARCH_REGS_IRQ_H
 
+#include <plat/map-s3c.h>
+
 /* interrupt controller */
 
 #define S3C2410_IRQREG(x)   ((x) + S3C24XX_VA_IRQ)
diff --git a/arch/arm/mach-s3c24xx/include/mach/regs-s3c2443-clock.h b/arch/arm/mach-s3c24xx/include/mach/regs-s3c2443-clock.h
index 682759549e63..fefef7233f4b 100644
--- a/arch/arm/mach-s3c24xx/include/mach/regs-s3c2443-clock.h
+++ b/arch/arm/mach-s3c24xx/include/mach/regs-s3c2443-clock.h
@@ -11,6 +11,7 @@
 #define __ASM_ARM_REGS_S3C2443_CLOCK
 
 #include <linux/delay.h>
+#include <plat/map-s3c.h>
 
 #define S3C2443_CLKREG(x)		((x) + S3C24XX_VA_CLKPWR)
 
diff --git a/arch/arm/mach-s3c24xx/include/mach/s3c2412.h b/arch/arm/mach-s3c24xx/include/mach/s3c2412.h
index 4ff83f956cfb..1ae369c81beb 100644
--- a/arch/arm/mach-s3c24xx/include/mach/s3c2412.h
+++ b/arch/arm/mach-s3c24xx/include/mach/s3c2412.h
@@ -8,6 +8,8 @@
 #ifndef __ARCH_ARM_MACH_S3C24XX_S3C2412_H
 #define __ARCH_ARM_MACH_S3C24XX_S3C2412_H __FILE__
 
+#include <plat/map-s3c.h>
+
 #define S3C2412_MEMREG(x)		(S3C24XX_VA_MEMCTRL + (x))
 #define S3C2412_EBIREG(x)		(S3C2412_VA_EBI + (x))
 
diff --git a/arch/arm/mach-s3c24xx/mach-h1940.c b/arch/arm/mach-s3c24xx/mach-h1940.c
index d45825898835..3cb56fc9db5c 100644
--- a/arch/arm/mach-s3c24xx/mach-h1940.c
+++ b/arch/arm/mach-s3c24xx/mach-h1940.c
@@ -48,6 +48,7 @@
 #include <sound/uda1380.h>
 
 #include <linux/platform_data/fb-s3c2410.h>
+#include <mach/map.h>
 #include <mach/hardware.h>
 #include <mach/regs-clock.h>
 #include <mach/regs-gpio.h>
diff --git a/arch/arm/mach-s3c24xx/mach-jive.c b/arch/arm/mach-s3c24xx/mach-jive.c
index ec6c40ea8f86..9ef8733be3fd 100644
--- a/arch/arm/mach-s3c24xx/mach-jive.c
+++ b/arch/arm/mach-s3c24xx/mach-jive.c
@@ -31,6 +31,7 @@
 #include <linux/platform_data/mtd-nand-s3c2410.h>
 #include <linux/platform_data/i2c-s3c2410.h>
 
+#include <mach/hardware.h>
 #include <mach/regs-gpio.h>
 #include <linux/platform_data/fb-s3c2410.h>
 #include <mach/gpio-samsung.h>
diff --git a/arch/arm/mach-s3c24xx/mach-rx1950.c b/arch/arm/mach-s3c24xx/mach-rx1950.c
index 2513ce7fa026..af6300076b0a 100644
--- a/arch/arm/mach-s3c24xx/mach-rx1950.c
+++ b/arch/arm/mach-s3c24xx/mach-rx1950.c
@@ -46,6 +46,7 @@
 
 #include <sound/uda1380.h>
 
+#include <mach/hardware.h>
 #include <mach/regs-gpio.h>
 #include <mach/gpio-samsung.h>
 
diff --git a/arch/arm/mach-s3c24xx/pm-h1940.S b/arch/arm/mach-s3c24xx/pm-h1940.S
index a7bbe336ac6b..f9ee515e1cbe 100644
--- a/arch/arm/mach-s3c24xx/pm-h1940.S
+++ b/arch/arm/mach-s3c24xx/pm-h1940.S
@@ -7,7 +7,6 @@
 
 #include <linux/linkage.h>
 #include <asm/assembler.h>
-#include <mach/hardware.h>
 #include <mach/map.h>
 
 #include <mach/regs-gpio.h>
diff --git a/arch/arm/mach-s3c24xx/regs-mem.h b/arch/arm/mach-s3c24xx/regs-mem.h
index 2f3bc48b5890..5048ab8f06c2 100644
--- a/arch/arm/mach-s3c24xx/regs-mem.h
+++ b/arch/arm/mach-s3c24xx/regs-mem.h
@@ -9,6 +9,8 @@
 #ifndef __ARCH_ARM_MACH_S3C24XX_REGS_MEM_H
 #define __ARCH_ARM_MACH_S3C24XX_REGS_MEM_H __FILE__
 
+#include <plat/map-s3c.h>
+
 #define S3C2410_MEMREG(x)		(S3C24XX_VA_MEMCTRL + (x))
 
 #define S3C2410_BWSCON			S3C2410_MEMREG(0x00)
diff --git a/arch/arm/mach-s3c24xx/s3c2410.c b/arch/arm/mach-s3c24xx/s3c2410.c
index 8427c150dd22..44bf3e1e77f1 100644
--- a/arch/arm/mach-s3c24xx/s3c2410.c
+++ b/arch/arm/mach-s3c24xx/s3c2410.c
@@ -25,7 +25,7 @@
 #include <asm/mach/map.h>
 #include <asm/mach/irq.h>
 
-#include <mach/hardware.h>
+#include <mach/map.h>
 #include <mach/gpio-samsung.h>
 #include <asm/irq.h>
 #include <asm/system_misc.h>
diff --git a/arch/arm/mach-s3c24xx/s3c2412.c b/arch/arm/mach-s3c24xx/s3c2412.c
index 209f952a6c98..75648dcc2c1d 100644
--- a/arch/arm/mach-s3c24xx/s3c2412.c
+++ b/arch/arm/mach-s3c24xx/s3c2412.c
@@ -29,7 +29,7 @@
 #include <asm/irq.h>
 #include <asm/system_misc.h>
 
-#include <mach/hardware.h>
+#include <mach/map.h>
 #include <mach/regs-clock.h>
 #include <mach/regs-gpio.h>
 
diff --git a/arch/arm/mach-s3c24xx/s3c2416.c b/arch/arm/mach-s3c24xx/s3c2416.c
index 9514196cad8c..6576187b4638 100644
--- a/arch/arm/mach-s3c24xx/s3c2416.c
+++ b/arch/arm/mach-s3c24xx/s3c2416.c
@@ -26,7 +26,7 @@
 #include <asm/mach/map.h>
 #include <asm/mach/irq.h>
 
-#include <mach/hardware.h>
+#include <mach/map.h>
 #include <mach/gpio-samsung.h>
 #include <asm/proc-fns.h>
 #include <asm/irq.h>
diff --git a/arch/arm/mach-s3c24xx/s3c2443.c b/arch/arm/mach-s3c24xx/s3c2443.c
index 3c05d04bbbeb..74794a55b015 100644
--- a/arch/arm/mach-s3c24xx/s3c2443.c
+++ b/arch/arm/mach-s3c24xx/s3c2443.c
@@ -23,7 +23,7 @@
 #include <asm/mach/map.h>
 #include <asm/mach/irq.h>
 
-#include <mach/hardware.h>
+#include <mach/map.h>
 #include <mach/gpio-samsung.h>
 #include <mach/irqs.h>
 #include <asm/irq.h>
diff --git a/arch/arm/mach-s3c24xx/s3c244x.c b/arch/arm/mach-s3c24xx/s3c244x.c
index f5bd489bac85..0ca188d0ffe5 100644
--- a/arch/arm/mach-s3c24xx/s3c244x.c
+++ b/arch/arm/mach-s3c24xx/s3c244x.c
@@ -25,7 +25,7 @@
 #include <asm/mach/map.h>
 #include <asm/mach/irq.h>
 
-#include <mach/hardware.h>
+#include <mach/map.h>
 #include <asm/irq.h>
 
 #include <mach/regs-clock.h>
diff --git a/arch/arm/mach-s3c24xx/sleep-s3c2410.S b/arch/arm/mach-s3c24xx/sleep-s3c2410.S
index 659f9eff9de2..e4f6f64e7826 100644
--- a/arch/arm/mach-s3c24xx/sleep-s3c2410.S
+++ b/arch/arm/mach-s3c24xx/sleep-s3c2410.S
@@ -13,7 +13,6 @@
 #include <linux/linkage.h>
 #include <linux/serial_s3c.h>
 #include <asm/assembler.h>
-#include <mach/hardware.h>
 #include <mach/map.h>
 
 #include <mach/regs-gpio.h>
diff --git a/arch/arm/mach-s3c24xx/sleep-s3c2412.S b/arch/arm/mach-s3c24xx/sleep-s3c2412.S
index c373f1ca862b..434f5082b2ed 100644
--- a/arch/arm/mach-s3c24xx/sleep-s3c2412.S
+++ b/arch/arm/mach-s3c24xx/sleep-s3c2412.S
@@ -8,7 +8,6 @@
 
 #include <linux/linkage.h>
 #include <asm/assembler.h>
-#include <mach/hardware.h>
 #include <mach/map.h>
 
 #include <mach/regs-irq.h>
diff --git a/arch/arm/mach-s3c24xx/sleep.S b/arch/arm/mach-s3c24xx/sleep.S
index f0f11ad60c52..4bda4a413584 100644
--- a/arch/arm/mach-s3c24xx/sleep.S
+++ b/arch/arm/mach-s3c24xx/sleep.S
@@ -13,7 +13,6 @@
 #include <linux/linkage.h>
 #include <linux/serial_s3c.h>
 #include <asm/assembler.h>
-#include <mach/hardware.h>
 #include <mach/map.h>
 
 #include <mach/regs-gpio.h>
-- 
2.17.1

