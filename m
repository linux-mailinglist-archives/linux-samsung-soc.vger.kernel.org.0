Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DA97468759
	for <lists+linux-samsung-soc@lfdr.de>; Sat,  4 Dec 2021 20:58:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352265AbhLDUBl (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 4 Dec 2021 15:01:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355285AbhLDUBb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 4 Dec 2021 15:01:31 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AD6BC0613F8
        for <linux-samsung-soc@vger.kernel.org>; Sat,  4 Dec 2021 11:58:05 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id v11so13281549wrw.10
        for <linux-samsung-soc@vger.kernel.org>; Sat, 04 Dec 2021 11:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E7NC5rxk5DlOvx/zxP8o5vuakyOw7kVWIeMVbE81m5w=;
        b=G+/MPNAhAVSeXtvf1yjcsCIDcAKBLuH4j0/54WPvVanXFw5dnz8eP4eOjrxNg88Obd
         2iPassLr0nW073SvV+Z4Y22USC7pYEoJe60vQxvUO7IY22OfdFOuOmggOsdS4QoXB6GA
         pAQPimys0iFxVuZBpc4iSaa4ujkcDGTmVax6FT9xWhAWtOaBZu0HNymjGM8odiDhcRbg
         Lj/UFO7nORUqPmjpvcSsclApb5lf6hJbtMBPSr9tGu1JVwPjhmGGWEA7kjFLxKnf1fq6
         dLh+RPi383qLXryShJmcylWb2tL+l1ZwxGDGrucFZHLBGZ2CGtjH4E9eODfXn0JnBCqn
         Hhzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E7NC5rxk5DlOvx/zxP8o5vuakyOw7kVWIeMVbE81m5w=;
        b=JdOjHuvUPeeedEcfkT7VW0JnBbYtLZN63o04TbMZM9T4IEiuQ1tVgPt72E5y/rR/nQ
         QEOr5P0/rg2GpgAGlYGH92tYblwWolUVvLdW/rP1xX592USntpdvbj3U8XeGMI6s15nz
         1/Pp7U2c/r1JVz4s9+Tc+erhgFCs0z6Y8NqXbnReBAurGaM39Uu4NMDZEobUEuygXJ5o
         rYDjX4Ph3PP7W/l408qzaa8iBfOzzoo22+VsgjHOQU0coVtHN9X5SObsbFPG0pHuC0xW
         JGDRUuRC8Y7j7fN9iCK9dnH0QzCnVUfaKMpfWY9I/DmAVyr6OVyLBCLEZ7esQn50Yanv
         kF6Q==
X-Gm-Message-State: AOAM530LF409+h8mAZB0xjQpzJpmt93LPiFhw1zwjFMrlCk86FhAjAa8
        9S7lMnFC+GVya9mZHGNnI51r+A==
X-Google-Smtp-Source: ABdhPJya5K8Zgr3TUaXpVf2rPWA4ORLjqmYrdOMIL4M+NBSyiJn+kuCh/bjCmjp0n75ylo11psr+pg==
X-Received: by 2002:a5d:456e:: with SMTP id a14mr30352834wrc.256.1638647883782;
        Sat, 04 Dec 2021 11:58:03 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id u15sm5741150wmq.13.2021.12.04.11.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Dec 2021 11:58:03 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 3/5] tty: serial: samsung: Remove USI initialization
Date:   Sat,  4 Dec 2021 21:57:55 +0200
Message-Id: <20211204195757.8600-4-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211204195757.8600-1-semen.protsenko@linaro.org>
References: <20211204195757.8600-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

USI control is now extracted to the dedicated USI driver. Remove USI
related code from serial driver to avoid conflicts and code duplication.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v3:
  - Spell check fixes in commit message

Changes in v2:
  - (none)

 drivers/tty/serial/samsung_tty.c | 36 ++++----------------------------
 include/linux/serial_s3c.h       |  9 --------
 2 files changed, 4 insertions(+), 41 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index ca084c10d0bb..f986a9253dc8 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -65,7 +65,6 @@ enum s3c24xx_port_type {
 struct s3c24xx_uart_info {
 	char			*name;
 	enum s3c24xx_port_type	type;
-	bool			has_usi;
 	unsigned int		port_type;
 	unsigned int		fifosize;
 	unsigned long		rx_fifomask;
@@ -1357,28 +1356,6 @@ static int apple_s5l_serial_startup(struct uart_port *port)
 	return ret;
 }
 
-static void exynos_usi_init(struct uart_port *port)
-{
-	struct s3c24xx_uart_port *ourport = to_ourport(port);
-	struct s3c24xx_uart_info *info = ourport->info;
-	unsigned int val;
-
-	if (!info->has_usi)
-		return;
-
-	/* Clear the software reset of USI block (it's set at startup) */
-	val = rd_regl(port, USI_CON);
-	val &= ~USI_CON_RESET_MASK;
-	wr_regl(port, USI_CON, val);
-	udelay(1);
-
-	/* Continuously provide the clock to USI IP w/o gating (for Rx mode) */
-	val = rd_regl(port, USI_OPTION);
-	val &= ~USI_OPTION_HWACG_MASK;
-	val |= USI_OPTION_HWACG_CLKREQ_ON;
-	wr_regl(port, USI_OPTION, val);
-}
-
 /* power power management control */
 
 static void s3c24xx_serial_pm(struct uart_port *port, unsigned int level,
@@ -1405,8 +1382,6 @@ static void s3c24xx_serial_pm(struct uart_port *port, unsigned int level,
 
 		if (!IS_ERR(ourport->baudclk))
 			clk_prepare_enable(ourport->baudclk);
-
-		exynos_usi_init(port);
 		break;
 	default:
 		dev_err(port->dev, "s3c24xx_serial: unknown pm %d\n", level);
@@ -2130,8 +2105,6 @@ static int s3c24xx_serial_init_port(struct s3c24xx_uart_port *ourport,
 	if (ret)
 		pr_warn("uart: failed to enable baudclk\n");
 
-	exynos_usi_init(port);
-
 	/* Keep all interrupts masked and cleared */
 	switch (ourport->info->type) {
 	case TYPE_S3C6400:
@@ -2780,11 +2753,10 @@ static struct s3c24xx_serial_drv_data s5pv210_serial_drv_data = {
 #endif
 
 #if defined(CONFIG_ARCH_EXYNOS)
-#define EXYNOS_COMMON_SERIAL_DRV_DATA(_has_usi)			\
+#define EXYNOS_COMMON_SERIAL_DRV_DATA()				\
 	.info = &(struct s3c24xx_uart_info) {			\
 		.name		= "Samsung Exynos UART",	\
 		.type		= TYPE_S3C6400,			\
-		.has_usi	= _has_usi,			\
 		.port_type	= PORT_S3C6400,			\
 		.has_divslot	= 1,				\
 		.rx_fifomask	= S5PV210_UFSTAT_RXMASK,	\
@@ -2805,17 +2777,17 @@ static struct s3c24xx_serial_drv_data s5pv210_serial_drv_data = {
 	}							\
 
 static struct s3c24xx_serial_drv_data exynos4210_serial_drv_data = {
-	EXYNOS_COMMON_SERIAL_DRV_DATA(false),
+	EXYNOS_COMMON_SERIAL_DRV_DATA(),
 	.fifosize = { 256, 64, 16, 16 },
 };
 
 static struct s3c24xx_serial_drv_data exynos5433_serial_drv_data = {
-	EXYNOS_COMMON_SERIAL_DRV_DATA(false),
+	EXYNOS_COMMON_SERIAL_DRV_DATA(),
 	.fifosize = { 64, 256, 16, 256 },
 };
 
 static struct s3c24xx_serial_drv_data exynos850_serial_drv_data = {
-	EXYNOS_COMMON_SERIAL_DRV_DATA(true),
+	EXYNOS_COMMON_SERIAL_DRV_DATA(),
 	.fifosize = { 256, 64, 64, 64 },
 };
 
diff --git a/include/linux/serial_s3c.h b/include/linux/serial_s3c.h
index cf0de4a86640..f6c3323fc4c5 100644
--- a/include/linux/serial_s3c.h
+++ b/include/linux/serial_s3c.h
@@ -27,15 +27,6 @@
 #define S3C2410_UERSTAT	  (0x14)
 #define S3C2410_UFSTAT	  (0x18)
 #define S3C2410_UMSTAT	  (0x1C)
-#define USI_CON		  (0xC4)
-#define USI_OPTION	  (0xC8)
-
-#define USI_CON_RESET			(1<<0)
-#define USI_CON_RESET_MASK		(1<<0)
-
-#define USI_OPTION_HWACG_CLKREQ_ON	(1<<1)
-#define USI_OPTION_HWACG_CLKSTOP_ON	(1<<2)
-#define USI_OPTION_HWACG_MASK		(3<<1)
 
 #define S3C2410_LCON_CFGMASK	  ((0xF<<3)|(0x3))
 
-- 
2.30.2

