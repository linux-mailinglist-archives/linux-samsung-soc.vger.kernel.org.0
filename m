Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 539EFE1F7A
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 23 Oct 2019 17:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406768AbfJWPig (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 23 Oct 2019 11:38:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:36666 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406692AbfJWPif (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 23 Oct 2019 11:38:35 -0400
Received: from localhost.localdomain (unknown [194.230.155.217])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 58C302064A;
        Wed, 23 Oct 2019 15:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571845115;
        bh=eE8y1vH8jBO0acryf9BCwImwIuhGJ07TIWhlosnHoNA=;
        h=From:To:Cc:Subject:Date:From;
        b=gu6Ab9QAgNfM7NGUJR3zkec5u+/CuBA16gfkL/0IFK2M8wzH4uDyT/qkxGVnmgoSO
         QFQW79CTNSghX8IzQpE927M+HA3Ir9B1LwqlFj18bzKf6MouKcw0GZ8VWmBjkz/agk
         2Xk2jUDyZRjUxTGfmT7NQTGHvpiBetl6kAXZnSVE=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 1/2] ARM: s3c: Rename s3c64xx_spi_setname() function
Date:   Wed, 23 Oct 2019 17:38:23 +0200
Message-Id: <20191023153824.6085-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The name s3c64xx_spi_setname() suggests it is shared with S3C64xx
platform, but except of contents it is not.  It is called only by
S3C24xx code, so make it clear in the name.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/mach-s3c24xx/s3c2416.c  | 2 +-
 arch/arm/mach-s3c24xx/s3c2443.c  | 2 +-
 arch/arm/mach-s3c24xx/spi-core.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/s3c2416.c b/arch/arm/mach-s3c24xx/s3c2416.c
index 1cdb7bd3e713..9514196cad8c 100644
--- a/arch/arm/mach-s3c24xx/s3c2416.c
+++ b/arch/arm/mach-s3c24xx/s3c2416.c
@@ -113,7 +113,7 @@ void __init s3c2416_map_io(void)
 	/* initialize device information early */
 	s3c2416_default_sdhci0();
 	s3c2416_default_sdhci1();
-	s3c64xx_spi_setname("s3c2443-spi");
+	s3c24xx_spi_setname("s3c2443-spi");
 
 	iotable_init(s3c2416_iodesc, ARRAY_SIZE(s3c2416_iodesc));
 }
diff --git a/arch/arm/mach-s3c24xx/s3c2443.c b/arch/arm/mach-s3c24xx/s3c2443.c
index 313e369c3ddd..4cbeb74cf3d6 100644
--- a/arch/arm/mach-s3c24xx/s3c2443.c
+++ b/arch/arm/mach-s3c24xx/s3c2443.c
@@ -91,7 +91,7 @@ void __init s3c2443_map_io(void)
 	s3c24xx_gpiocfg_default.get_pull = s3c2443_gpio_getpull;
 
 	/* initialize device information early */
-	s3c64xx_spi_setname("s3c2443-spi");
+	s3c24xx_spi_setname("s3c2443-spi");
 
 	iotable_init(s3c2443_iodesc, ARRAY_SIZE(s3c2443_iodesc));
 }
diff --git a/arch/arm/mach-s3c24xx/spi-core.h b/arch/arm/mach-s3c24xx/spi-core.h
index bb555ccbe057..1048fac629a2 100644
--- a/arch/arm/mach-s3c24xx/spi-core.h
+++ b/arch/arm/mach-s3c24xx/spi-core.h
@@ -11,7 +11,7 @@
  */
 
 /* re-define device name depending on support. */
-static inline void s3c64xx_spi_setname(char *name)
+static inline void s3c24xx_spi_setname(char *name)
 {
 #ifdef CONFIG_S3C64XX_DEV_SPI0
 	s3c64xx_device_spi0.name = name;
-- 
2.17.1

