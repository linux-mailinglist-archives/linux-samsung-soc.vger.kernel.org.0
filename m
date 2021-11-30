Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45D2F462A6F
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 30 Nov 2021 03:27:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237508AbhK3CbE (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 29 Nov 2021 21:31:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237504AbhK3CbE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 29 Nov 2021 21:31:04 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BDECC061748
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Nov 2021 18:27:45 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id u3so49782122lfl.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Nov 2021 18:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DjrKmm2WgaX87gIsGbMuz72ppQb8wewAQBmcfjqw3Gs=;
        b=XGILT3CfcE4kMyANq7bSTdH0QFSDL/+tG5w+aovYWrSS4otjinc/EsS9TlLwk5cl+t
         VFnMbpdVAO7wD+86m/f1wYIvqsy/a8PECHUAdvUcDJ76oCA/ftNSF4DeRTTt0E3Jx9x9
         MRn8p/ZRLeeWMx6zmw8InMcAGJDDYrxoARd22ioEktvQIxrfOZP+qCE8DvOQjKpOO2X9
         JAIEzphDwYqvi8j1eRXAcUjGKGEOKmMwlF992uml4GC8bO1gLu0yMj6V4uXmg6+KEphl
         XB0AFHGTMLIGf4XwkEDY99GE3xyk6t+6/LWB3FVjVg+5og/6zgmuRdahlWqJP1tyMgKo
         guEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DjrKmm2WgaX87gIsGbMuz72ppQb8wewAQBmcfjqw3Gs=;
        b=4X8MxPLlq0j7lnR2nF8OgSSMq/9vVvhLcVq+EEAyxzXELms63sKl6Vaxn9IyQ0QSNe
         SxeTgege9QJwaEYqp/FETlvvbFI8l77cZIRALJcTVO+n6sHe4voJ7h5ODhOdqLx4F/Vk
         nhmAZPMI7IS5zCZzEzvbeEGTRb/8lCWmdBDng7uR5j9nGSVcRSu+NDRntJrGcfzdR97N
         ce/y94NSi7KAaSkbbeAomaJq+pFSCC5n+64O2vlzRkO8ZkllGeIKUbC8KUI9xzqGKJzw
         oKfkS3BBN4fffmMOuTYbufY5jqyS5Kq27I4eu0P4DkFD9S7qdb68nFOHaa2YGBkJNzS1
         4xPg==
X-Gm-Message-State: AOAM5305dyx2BtL0rNPQrxiWFf3vifeAGgrd2S0ZgiNdLLLL3J8hxtu1
        egXq1g4yxWfysI0ToDM9aqZjCQ==
X-Google-Smtp-Source: ABdhPJy9w4OSiM/X9hJPqQvt6CKdaqi12cJt/JRDPlUUHCZMcMVlsYVIHiyuZTcMJKqMeoqst+bNYg==
X-Received: by 2002:a05:6512:2350:: with SMTP id p16mr52129668lfu.117.1638239263333;
        Mon, 29 Nov 2021 18:27:43 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id i10sm1543136lfv.22.2021.11.29.18.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 18:27:42 -0800 (PST)
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
Subject: [PATCH v2 4/5] tty: serial: samsung: Enable console as module
Date:   Tue, 30 Nov 2021 04:27:39 +0200
Message-Id: <20211130022740.28784-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211130022740.28784-1-semen.protsenko@linaro.org>
References: <20211130022740.28784-1-semen.protsenko@linaro.org>
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

