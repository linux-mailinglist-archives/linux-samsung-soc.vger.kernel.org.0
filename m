Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E2A54631F3
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 30 Nov 2021 12:13:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238026AbhK3LQ6 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 30 Nov 2021 06:16:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237756AbhK3LQz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 30 Nov 2021 06:16:55 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F7BFC061574
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Nov 2021 03:13:35 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id v15so40506979ljc.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Nov 2021 03:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DjrKmm2WgaX87gIsGbMuz72ppQb8wewAQBmcfjqw3Gs=;
        b=VYYZ9M8DIi9wzC6KEpcXHN2kT/9Fkb/lAXo+ByBsrmxDnoeCG8q/7XN6OaSxo6T2y2
         HERQ2rLrfqkHw846RM4pfX8YAgR/6Od0x3Q+rqf8yhzR2o8E3XHHVbyL8yz3S9X52Gdy
         F9MvuoGN+ZiLuxDGhgp1HPkvVbEdzsBv45lkwUd0UlWR+Q7o2jQ9DHy+VmEeCHqPamcY
         TmyCjWYShOiqMTmAFOnbzjmJlUTY4UhPXaDFxxWrGawt2GK7znW0KocWfMAqDqcnEqBE
         kWJDOrhSrDkUZspKZ6oA9xyOJBaq5vmnA/5k8U1ifEKsdT6ZTCfgDUg67ZIN81BsBwXO
         LZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DjrKmm2WgaX87gIsGbMuz72ppQb8wewAQBmcfjqw3Gs=;
        b=nwN7WjRqZsyyy88QNDHxRH+buWzmjO3Dqs2/oMq1WA2URgTrVkQrpSxVTnkcb8fUry
         Sxk7floahJP8RO/i1ZO7hDUhbLCxbJjKXwnEWIPb2aQKltmSIreuhbuM/vpL5YZkyW8Z
         3iGPObU51e1vtpZR4i1mJUExp2inaXxAxTYjKxRxYmUAjSIipqCBWWkJUi5Yqep8eMLu
         wdCdfQx+BUomCCv5wY0Hia2gL37TiGMCoK3QUPgaPIACn8tAA9OH+VHiyB3rTF9EbYj/
         q8RqCmbalCeZW/FdFTjOo6/9MGPTMRsI5SccrX9pYc6Q2Gq2FUl01oMcNwTV37kEaPjw
         xlBA==
X-Gm-Message-State: AOAM532lT0tPiEBqw7damRX0e6n//FqNhRoeAVKHepMUSP69PMsYSrOx
        XqMbnBIyh/dgovlzPaKJvzRSMg==
X-Google-Smtp-Source: ABdhPJyYyF/8V+rEAq5KS0E49woMPilIZ1j13Zp/4TTUwP69AJDDsWXvXEmZd/NOlDWL4F9ol3Sopw==
X-Received: by 2002:a2e:8515:: with SMTP id j21mr51890869lji.531.1638270813698;
        Tue, 30 Nov 2021 03:13:33 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id m18sm1679456lfu.71.2021.11.30.03.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 03:13:33 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jiri Slaby <jirislaby@kernel.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 RESEND 4/5] tty: serial: samsung: Enable console as module
Date:   Tue, 30 Nov 2021 13:13:24 +0200
Message-Id: <20211130111325.29328-5-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211130111325.29328-1-semen.protsenko@linaro.org>
References: <20211130111325.29328-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Enable serial driver to be built as a module. To do so, init the console
support on driver/module load instead of using console_initcall().

This is needed for proper support of USI driver (which can be built as
a module, which in turn makes SERIAL_SAMSUNG be a module too). It also
might be useful for Android GKI modularization efforts.

Inspired by commit 87a0b9f98ac5 ("tty: serial: meson: enable console as
module").

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - Added error path handling in samsung_serial_init()
  - Added console unregister in samsung_serial_exit()

 drivers/tty/serial/Kconfig       |  2 +-
 drivers/tty/serial/samsung_tty.c | 36 ++++++++++++++++++++++++++++----
 2 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index fc543ac97c13..0e5ccb25bdb1 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -263,7 +263,7 @@ config SERIAL_SAMSUNG_UARTS
 
 config SERIAL_SAMSUNG_CONSOLE
 	bool "Support for console on Samsung SoC serial port"
-	depends on SERIAL_SAMSUNG=y
+	depends on SERIAL_SAMSUNG
 	select SERIAL_CORE_CONSOLE
 	select SERIAL_EARLYCON
 	help
diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index f986a9253dc8..61ccb359620a 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -1715,15 +1715,21 @@ s3c24xx_serial_verify_port(struct uart_port *port, struct serial_struct *ser)
 
 static struct console s3c24xx_serial_console;
 
-static int __init s3c24xx_serial_console_init(void)
+static void __init s3c24xx_serial_register_console(void)
 {
 	register_console(&s3c24xx_serial_console);
-	return 0;
 }
-console_initcall(s3c24xx_serial_console_init);
+
+static void s3c24xx_serial_unregister_console(void)
+{
+	if (s3c24xx_serial_console.flags & CON_ENABLED)
+		unregister_console(&s3c24xx_serial_console);
+}
 
 #define S3C24XX_SERIAL_CONSOLE &s3c24xx_serial_console
 #else
+static inline void s3c24xx_serial_register_console(void) { }
+static inline void s3c24xx_serial_unregister_console(void) { }
 #define S3C24XX_SERIAL_CONSOLE NULL
 #endif
 
@@ -2898,7 +2904,29 @@ static struct platform_driver samsung_serial_driver = {
 	},
 };
 
-module_platform_driver(samsung_serial_driver);
+static int __init samsung_serial_init(void)
+{
+	int ret;
+
+	s3c24xx_serial_register_console();
+
+	ret = platform_driver_register(&samsung_serial_driver);
+	if (ret) {
+		s3c24xx_serial_unregister_console();
+		return ret;
+	}
+
+	return 0;
+}
+
+static void __exit samsung_serial_exit(void)
+{
+	platform_driver_unregister(&samsung_serial_driver);
+	s3c24xx_serial_unregister_console();
+}
+
+module_init(samsung_serial_init);
+module_exit(samsung_serial_exit);
 
 #ifdef CONFIG_SERIAL_SAMSUNG_CONSOLE
 /*
-- 
2.30.2

