Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FAF7460219
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 27 Nov 2021 23:40:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233753AbhK0Wna (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 27 Nov 2021 17:43:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237316AbhK0Wla (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 27 Nov 2021 17:41:30 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 763D2C061785
        for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Nov 2021 14:33:04 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id q3so4442229wru.5
        for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Nov 2021 14:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Eab++JQKTWieWxUPdwWrny+Cg0zAmtZZr/nwpMif+DE=;
        b=yGZGSVVRzUf9cZUMw8LyTLxjkeRYtIq1AOYpIQsrkiIspRfifmI5NVRntzAvhde54n
         wbRB/vEE6ZL5dZbGsOAnkEdPfeUXxpJMfqcvNacAAHTdTwd+LjNTFIeYlpeMJshR1nmw
         7wU9TYiuZHjLjjeoQORW8NZZwUw/Ps5Jc3KHIuegAyA34sdEt8NCXxdede7AGKHGslrM
         3JkVu+2MMXQaFHERh1ZpvMbOSwjP/ySPIanXHOTF4yfFIBbLPLjfxBMcOwdOSd5srKGj
         DzMWqzb16oiZonh84HGyJxGrFRb+lGDprwd6q78YBK2vZDMTlKPBHcLXynr8ncjG2AvJ
         b9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Eab++JQKTWieWxUPdwWrny+Cg0zAmtZZr/nwpMif+DE=;
        b=C2WvKOrYm2x4eMlFgF5inV3J+hrIsDs3jBuJNwsd/aVQr+tghGOgBh4a9+Ksm5NzdQ
         Oh/jmPbhF3SNECO+sDd3jj0RpCn/9mE1t1o2dY1sqDFcrI5IX7E/0kR/yJFcFv4iBwzV
         czcrT607G4MAzELtJR0WmMwfCqwLyz0/cxkRP9JyaFaiFIwqOFWansbQbLjRf3AhrevH
         PyWpHotc2DpOCI3OcHWGZ3YGXjsCD4EDBbc4ZD5O4EJiapr8Y/8mq93kkcNalzpfg+5A
         Eplp84Y1rO4Im3YjAhv8xPLHDpM+qYhL/3uUjCRS+JEY5Oxzlh8B0m+AfljWC9weEZvh
         OGYA==
X-Gm-Message-State: AOAM533O7VoOmuQNq/avn8wBQLtKw6Hy4y66aTjlEJzFP6/Qn6JjlqFE
        04IgjqQDzzjPzzBM5xS09Dt8LA==
X-Google-Smtp-Source: ABdhPJyL2mAryHmmtJFRX/GY9sBnSIoMeA19jp4H2xYBLuhEL2xt3dkFWZiKKEuqSKk5dwOjaJLcmw==
X-Received: by 2002:adf:9d82:: with SMTP id p2mr22717648wre.414.1638052383014;
        Sat, 27 Nov 2021 14:33:03 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id i15sm17872965wmq.18.2021.11.27.14.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 14:33:02 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: [PATCH 5/8] tty: serial: samsung: Enable console as module
Date:   Sun, 28 Nov 2021 00:32:50 +0200
Message-Id: <20211127223253.19098-6-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211127223253.19098-1-semen.protsenko@linaro.org>
References: <20211127223253.19098-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Enable serial driver to be built as a module. To do so, init the console
support on driver/module load instead of using console_initcall().

This is needed for proper support of USIv2 driver (which can be built as
a module, which in turn makes SERIAL_SAMSUNG be a module too). It also
might be useful for Android GKI modularization efforts.

Inspired by commit 87a0b9f98ac5 ("tty: serial: meson: enable console as
module").

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/tty/serial/Kconfig       |  2 +-
 drivers/tty/serial/samsung_tty.c | 21 +++++++++++++++++++--
 2 files changed, 20 insertions(+), 3 deletions(-)

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
index f986a9253dc8..92a63e9392ed 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -1720,10 +1720,10 @@ static int __init s3c24xx_serial_console_init(void)
 	register_console(&s3c24xx_serial_console);
 	return 0;
 }
-console_initcall(s3c24xx_serial_console_init);
 
 #define S3C24XX_SERIAL_CONSOLE &s3c24xx_serial_console
 #else
+static inline int s3c24xx_serial_console_init(void) { return 0; }
 #define S3C24XX_SERIAL_CONSOLE NULL
 #endif
 
@@ -2898,7 +2898,24 @@ static struct platform_driver samsung_serial_driver = {
 	},
 };
 
-module_platform_driver(samsung_serial_driver);
+static int __init samsung_serial_init(void)
+{
+	int ret;
+
+	ret = s3c24xx_serial_console_init();
+	if (ret)
+		return ret;
+
+	return platform_driver_register(&samsung_serial_driver);
+}
+
+static void __exit samsung_serial_exit(void)
+{
+	platform_driver_unregister(&samsung_serial_driver);
+}
+
+module_init(samsung_serial_init);
+module_exit(samsung_serial_exit);
 
 #ifdef CONFIG_SERIAL_SAMSUNG_CONSOLE
 /*
-- 
2.30.2

