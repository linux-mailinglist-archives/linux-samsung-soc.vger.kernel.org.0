Return-Path: <linux-samsung-soc+bounces-989-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E22E829779
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 10 Jan 2024 11:25:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB71728EB77
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 10 Jan 2024 10:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3CFB487A9;
	Wed, 10 Jan 2024 10:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RX++FVM3"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163E2481C8
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jan 2024 10:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-33761e291c1so2303071f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jan 2024 02:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704882080; x=1705486880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L7ZrSjFHYr2/iB6uZVD8VtG9hhedczp9x5lal7G3QGg=;
        b=RX++FVM3TPvSqfAFPcnH9anQ4ZygBa2SwrSA3Jc20pJwnCqGb5tyxCbCAScDaeBCMx
         ZgSfBsbLT7QUiXoB1O1tyRUfeEYypTLmbFjAGq7T+YP0WN+ihrKNBZ2gvi412AufnmAM
         7mMC67yFTdwhm/Lea6YDsDDDwSI1+8gEOAyjFbpYUtMplS0ogLN7UAbuh+3dMObF3JRw
         5ru34ufkeC/Yd2LrpfJ2h+quO6zP2PoBSy/9FJ8Dc0bSB/OM69rbBwtF1baZlee99Hof
         RTYv0IMMm+MM6X9Xci+IYxDdBF6subxKq89AFtpdo8GNorfPng2K+zI74kC9/KczqRMi
         z2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704882080; x=1705486880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L7ZrSjFHYr2/iB6uZVD8VtG9hhedczp9x5lal7G3QGg=;
        b=IFQGzCHhOb8+Z3RcjEl4SYl7pnuaOmlIh0+pShY5Rf5vcLzVpQl/gPOF0u0HUpu/lT
         2WJdt0J3xOyCoOGdiPAKswDHJMbgWtJhihniSoys9JnRJZGmyr6RuJgykI4UB1aKs99F
         KUcuuPHvQWSXpNGUIA4UY6oqqkMsJEr4rtQk9Mgs9y+CXFPTBL7GCCTBi7IcaGNB4CDx
         Vq4FI1GwDUvdTSYwxSkPpMqt5xQDC21ElSUqFVPQmOQHCpv8QO9fD8KL/RWSMLOTT8ho
         CxQ2qw8IGx9Wa+XpRUtJ9lFAzAnBqmMfjt0wTABbza+8fQ8IRvP6U9u3T/6269ensOvV
         9c6A==
X-Gm-Message-State: AOJu0YwrZ4nvGvPSolmCOeP3q6tarujRK1QjZTox+QpPkL85bMHGUm67
	iUOfSEuLMpCsnfnESR155V5VIuHSKl4czdtcP68gJ4R0Pa/U5A==
X-Google-Smtp-Source: AGHT+IHoYzn6WU3WEl02h7AGFS46UkkaeF7/tdZLhTAKWS8rP6lbLfNioU95JNHcQz4U24VBuNGvkg==
X-Received: by 2002:a05:600c:4e91:b0:40e:49af:264c with SMTP id f17-20020a05600c4e9100b0040e49af264cmr482213wmq.62.1704882080468;
        Wed, 10 Jan 2024 02:21:20 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id j7-20020a05600c190700b0040e52cac976sm1625302wmq.29.2024.01.10.02.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 02:21:19 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: krzysztof.kozlowski@linaro.org,
	alim.akhtar@samsung.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	andre.draszik@linaro.org,
	peter.griffin@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 16/18] tty: serial: samsung: shrink the clock selection to 8 clocks
Date: Wed, 10 Jan 2024 10:21:00 +0000
Message-ID: <20240110102102.61587-17-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20240110102102.61587-1-tudor.ambarus@linaro.org>
References: <20240110102102.61587-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

<linux/serial_s3c.h> provides a clock selection pool of maximum 4 clocks.
Update the driver to consider a pool selection of maximum 8 clocks. The
final scope is to reduce the memory footprint of
``struct s3c24xx_uart_info``.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/tty/serial/samsung_tty.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 436739cf9225..5df2bcebf9fb 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -81,11 +81,11 @@ struct s3c24xx_uart_info {
 	unsigned long		tx_fifomask;
 	unsigned long		tx_fifoshift;
 	unsigned long		tx_fifofull;
-	unsigned int		def_clk_sel;
-	unsigned long		num_clks;
 	unsigned long		clksel_mask;
 	unsigned long		clksel_shift;
 	unsigned long		ucon_mask;
+	u8			def_clk_sel;
+	u8			num_clks;
 	u8			iotype;
 
 	/* uart port features */
@@ -1339,7 +1339,7 @@ static void s3c24xx_serial_pm(struct uart_port *port, unsigned int level,
 
 #define MAX_CLK_NAME_LENGTH 15
 
-static inline int s3c24xx_serial_getsource(struct uart_port *port)
+static inline u8 s3c24xx_serial_getsource(struct uart_port *port)
 {
 	const struct s3c24xx_uart_info *info = s3c24xx_port_to_info(port);
 	u32 ucon;
@@ -1352,8 +1352,7 @@ static inline int s3c24xx_serial_getsource(struct uart_port *port)
 	return ucon >> info->clksel_shift;
 }
 
-static void s3c24xx_serial_setsource(struct uart_port *port,
-			unsigned int clk_sel)
+static void s3c24xx_serial_setsource(struct uart_port *port, u8 clk_sel)
 {
 	const struct s3c24xx_uart_info *info = s3c24xx_port_to_info(port);
 	u32 ucon;
@@ -1372,14 +1371,15 @@ static void s3c24xx_serial_setsource(struct uart_port *port,
 
 static unsigned int s3c24xx_serial_getclk(struct s3c24xx_uart_port *ourport,
 			unsigned int req_baud, struct clk **best_clk,
-			unsigned int *clk_num)
+			u8 *clk_num)
 {
 	const struct s3c24xx_uart_info *info = ourport->info;
 	struct clk *clk;
 	unsigned long rate;
-	unsigned int cnt, baud, quot, best_quot = 0;
+	unsigned int baud, quot, best_quot = 0;
 	char clkname[MAX_CLK_NAME_LENGTH];
 	int calc_deviation, deviation = (1 << 30) - 1;
+	u8 cnt;
 
 	for (cnt = 0; cnt < info->num_clks; cnt++) {
 		/* Keep selected clock if provided */
@@ -1472,9 +1472,10 @@ static void s3c24xx_serial_set_termios(struct uart_port *port,
 	struct s3c24xx_uart_port *ourport = to_ourport(port);
 	struct clk *clk = ERR_PTR(-EINVAL);
 	unsigned long flags;
-	unsigned int baud, quot, clk_sel = 0;
+	unsigned int baud, quot;
 	unsigned int udivslot = 0;
 	u32 ulcon, umcon;
+	u8 clk_sel = 0;
 
 	/*
 	 * We don't support modem control lines.
@@ -1775,10 +1776,9 @@ static int s3c24xx_serial_enable_baudclk(struct s3c24xx_uart_port *ourport)
 	struct device *dev = ourport->port.dev;
 	const struct s3c24xx_uart_info *info = ourport->info;
 	char clk_name[MAX_CLK_NAME_LENGTH];
-	unsigned int clk_sel;
 	struct clk *clk;
-	int clk_num;
 	int ret;
+	u8 clk_sel, clk_num;
 
 	clk_sel = ourport->cfg->clk_sel ? : info->def_clk_sel;
 	for (clk_num = 0; clk_num < info->num_clks; clk_num++) {
@@ -2286,9 +2286,9 @@ s3c24xx_serial_get_options(struct uart_port *port, int *baud,
 {
 	struct clk *clk;
 	unsigned long rate;
-	unsigned int clk_sel;
 	u32 ulcon, ucon, ubrdiv;
 	char clk_name[MAX_CLK_NAME_LENGTH];
+	u8 clk_sel;
 
 	ulcon  = rd_regl(port, S3C2410_ULCON);
 	ucon   = rd_regl(port, S3C2410_UCON);
-- 
2.43.0.472.g3155946c3a-goog


