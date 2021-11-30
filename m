Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C8634631F8
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 30 Nov 2021 12:13:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238190AbhK3LRI (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 30 Nov 2021 06:17:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237918AbhK3LQ5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 30 Nov 2021 06:16:57 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBF3DC06175F
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Nov 2021 03:13:36 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id t26so52760707lfk.9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Nov 2021 03:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Sw2B10ZabkZdmPrt9wGzMiX2Z/pOJb9hGFk18ZvN3TQ=;
        b=KyQMaENJy/y9ufWjeUtozEDTjYQDfgjJ/84QCGlkPy8EDG1tSFROm5+nnIOverfwwl
         DdldrQB6r+hLkqulPqffzTt8mYrayukNi+gOo86hTUg61GGbRlXMqpPLP18kgVr4B6qC
         se5EYcpoF8AzAFKlmtXyELufXHGw8wgTD6wi7ral3bOxLBgOell2JWUM3VzvcqTgLY2Z
         6aD2R4UYc6HlD+ga4w6EVkGxIhYKK5ujr5sRlvNq+CUGEBDpAEC0SUvfhzGAIKpoQgMV
         D9xRZZPmYXsr/ACwNDo+QT52Esxr54rY3wI1EFpifeGU3VIL4uqDic7t5q4k73lQg7pg
         SPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Sw2B10ZabkZdmPrt9wGzMiX2Z/pOJb9hGFk18ZvN3TQ=;
        b=GIZ6jPEutDF0SuzDCj5XlIVWlF8HTha7KB7y3yZQlkcUz7wSUUfjvgSk8BoyBcOLkW
         tEOa2fKvae0T27zfqbXOxNIWA6UiHQ4wO2jy92Q7xt9bIuQhhWIJx3wZCy1p9hDaz8G3
         x0FIC+OviwLqViLhMmE26TwaVLnPCVxh318P4PFHiUrUEOvTQEz//9RO0Ty6Lg6ZzaSS
         cd1eOu1xJJ39tdwYFFoQmrnfdt3UbIR7CANsoNJQDcMneiQxHPCSGEEHpljkbESEpUXF
         L6xTkpJmXxCUm8bQG3b9WHfj82beodVSJlV9TILQPmyg2tCnalgqUeZkkmdb8ro3RdkX
         goVw==
X-Gm-Message-State: AOAM530W93/B9Xo7LOqIvzPal+mZp5TQZBPuBniiftCKlyLiq6z7iLY1
        yFKiWav9rHmuDmh15AHsBFiiuQ==
X-Google-Smtp-Source: ABdhPJwSJTHwzr6Ih07eZr4IZE7hEJcEmFr6lYjOOM69O7BbJUiCHOOLbYNE1SiwRIixP/tjCrzb5Q==
X-Received: by 2002:a05:6512:310e:: with SMTP id n14mr55417635lfb.475.1638270815283;
        Tue, 30 Nov 2021 03:13:35 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id m24sm1678428lfc.208.2021.11.30.03.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 03:13:34 -0800 (PST)
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
Subject: [PATCH v2 RESEND 5/5] tty: serial: samsung: Fix console registration from module
Date:   Tue, 30 Nov 2021 13:13:25 +0200
Message-Id: <20211130111325.29328-6-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211130111325.29328-1-semen.protsenko@linaro.org>
References: <20211130111325.29328-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On modern Exynos SoCs (like Exynos850) the UART can be implemented as a
part of USI IP-core. In such case, USI driver is used to initialize USI
registers, and it also calls of_platform_populate() to instantiate all
sub-nodes (e.g. serial node) of USI node. When serial driver is
built-in, but USI driver is a module, and CONFIG_SERIAL_SAMSUNG_CONSOLE
is enabled, next call chain will happen when loading USI module from
user space:

    usi_init
      v
    usi_probe
      v
    of_platform_populate
      v
    s3c24xx_serial_probe
      v
    uart_add_one_port
      v
    uart_configure_port
      v
    register_console
      v
    try_enable_new_console
      v
    s3c24xx_serial_console_setup

But because the serial driver is built-in, and
s3c24xx_serial_console_setup() is marked with __init keyword, that
symbol will discarded and long gone by that time already, causing failed
paging request.

That happens during the next config combination:

    EXYNOS_USI=m
    SERIAL_SAMSUNG=y
    SERIAL_SAMSUNG_CONSOLE=y

That config should be completely possible, so rather than limiting
SERIAL_SAMSUNG choice to "m" only when USI=m, remove __init keyword for
all affected functions.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - This patch is added in v2

 drivers/tty/serial/samsung_tty.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 61ccb359620a..d002a4e48ed9 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -2500,7 +2500,8 @@ s3c24xx_serial_console_write(struct console *co, const char *s,
 	uart_console_write(cons_uart, s, count, s3c24xx_serial_console_putchar);
 }
 
-static void __init
+/* Shouldn't be __init, as it can be instantiated from other module */
+static void
 s3c24xx_serial_get_options(struct uart_port *port, int *baud,
 			   int *parity, int *bits)
 {
@@ -2563,7 +2564,8 @@ s3c24xx_serial_get_options(struct uart_port *port, int *baud,
 	}
 }
 
-static int __init
+/* Shouldn't be __init, as it can be instantiated from other module */
+static int
 s3c24xx_serial_console_setup(struct console *co, char *options)
 {
 	struct uart_port *port;
-- 
2.30.2

