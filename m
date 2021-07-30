Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19C583DBB33
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 30 Jul 2021 16:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239532AbhG3Ot5 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 30 Jul 2021 10:49:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239531AbhG3Otp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 30 Jul 2021 10:49:45 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B417C061388
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Jul 2021 07:49:34 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id h8so13546464ede.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Jul 2021 07:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/WRgr1XFp9FdAsbKP4Xd28JEjGpJQHHB0Nsl4r99ndU=;
        b=Ttd3PD4SOkqmgJ56xmVxk5y/kZqfeZKwZjt5/WRIFeZZ2Yp0sjaFyhcBKhWKm4vcZx
         JUFlWZh/n8JDtgEBEz/uJasK+IBWtqo8cGLyO3/QdS+pkzySyL7TOlJIwtw+5NftG3iw
         9VAbPtSsUQBwtr2vnpoF4MQ5KDtlc/U0udCEOdKRQmgT8AJwnwo6lfCcfpwjFsNdSU5Q
         vs20Ud3GX02VX6orIcQfu507dW+vwZ1xodAQySsSlVgXDioYkSfqV65APAW/wm0TSCM4
         Sz+Bh4gLoAS9RmHv/IiNmQrOX3vw5D0UkHMisMzjRgYavzMewUkoFT33Wi/IifsWIi8z
         lyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/WRgr1XFp9FdAsbKP4Xd28JEjGpJQHHB0Nsl4r99ndU=;
        b=fnX3htUxGsNRB3TIBHm61TbAyYNNaR3b7LSg1Tm4itDJKlD8exTzAovh6HzgDrNR2J
         Xm4NzyfHr+E6KnVvLQ+WyworhHIXzUiQ4Tpa7evfX9ln6aqycDIjyHaofNCGrp616hBS
         6G9Hu+ubg0yn+dtT29O/fjArFhbxAnbHFEA1oNRujzACl0e87MrVvGcDL4P62WNj1X1e
         twD70VMMl2+2Wr5DOuX6SH4xg+eKnrsM3eiZgB7MT063+D6P1DLqKe6KsIuxzeMYIhfs
         TPg8BBYcteZgc2CSWyNArdzc/bPyQv4eo3KTx+yVE0aDjV3uifhjNLL7FrGkTaQKwDoP
         llLQ==
X-Gm-Message-State: AOAM532YTHdwKEij7GjF/q2Jlj5xj/XUNoyXZRfeP9q/YDOsJCv5Q8US
        dap/lYVz0ykxzAqAsoc2/rMoWw==
X-Google-Smtp-Source: ABdhPJzBSmfdN5A0qvfcANUH9LVf5OKoEj7QlJx+dWqloqv6bPK9IUvS+zWPucHVRgKRKYsQvYUV0w==
X-Received: by 2002:a05:6402:49a:: with SMTP id k26mr3292136edv.279.1627656573161;
        Fri, 30 Jul 2021 07:49:33 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id i10sm784560edf.12.2021.07.30.07.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 07:49:32 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: [PATCH 06/12] tty: serial: samsung: Add Exynos850 SoC data
Date:   Fri, 30 Jul 2021 17:49:16 +0300
Message-Id: <20210730144922.29111-7-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210730144922.29111-1-semen.protsenko@linaro.org>
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add serial driver data for Exynos850 SoC. This driver data is basically
reusing EXYNOS_COMMON_SERIAL_DRV_DATA, which is common for all Exynos
chips, but also enables USI init, which was added in previous commit:
"tty: serial: samsung: Init USI to keep clocks running".

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/tty/serial/samsung_tty.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 75ccbb08df4a..d059b516a0f4 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -2814,11 +2814,19 @@ static struct s3c24xx_serial_drv_data exynos5433_serial_drv_data = {
 	.fifosize = { 64, 256, 16, 256 },
 };
 
+static struct s3c24xx_serial_drv_data exynos850_serial_drv_data = {
+	EXYNOS_COMMON_SERIAL_DRV_DATA_USI(1),
+	.fifosize = { 0, },
+};
+
 #define EXYNOS4210_SERIAL_DRV_DATA ((kernel_ulong_t)&exynos4210_serial_drv_data)
 #define EXYNOS5433_SERIAL_DRV_DATA ((kernel_ulong_t)&exynos5433_serial_drv_data)
+#define EXYNOS850_SERIAL_DRV_DATA ((kernel_ulong_t)&exynos850_serial_drv_data)
+
 #else
 #define EXYNOS4210_SERIAL_DRV_DATA ((kernel_ulong_t)NULL)
 #define EXYNOS5433_SERIAL_DRV_DATA ((kernel_ulong_t)NULL)
+#define EXYNOS850_SERIAL_DRV_DATA ((kernel_ulong_t)NULL)
 #endif
 
 #ifdef CONFIG_ARCH_APPLE
@@ -2874,6 +2882,9 @@ static const struct platform_device_id s3c24xx_serial_driver_ids[] = {
 	}, {
 		.name		= "s5l-uart",
 		.driver_data	= S5L_SERIAL_DRV_DATA,
+	}, {
+		.name		= "exynos850-uart",
+		.driver_data	= EXYNOS850_SERIAL_DRV_DATA,
 	},
 	{ },
 };
@@ -2897,6 +2908,8 @@ static const struct of_device_id s3c24xx_uart_dt_match[] = {
 		.data = (void *)EXYNOS5433_SERIAL_DRV_DATA },
 	{ .compatible = "apple,s5l-uart",
 		.data = (void *)S5L_SERIAL_DRV_DATA },
+	{ .compatible = "samsung,exynos850-uart",
+		.data = (void *)EXYNOS850_SERIAL_DRV_DATA },
 	{},
 };
 MODULE_DEVICE_TABLE(of, s3c24xx_uart_dt_match);
-- 
2.30.2

