Return-Path: <linux-samsung-soc+bounces-1066-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AC1832803
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 19 Jan 2024 11:49:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C951284FF6
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 19 Jan 2024 10:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D498B50257;
	Fri, 19 Jan 2024 10:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vZ0v5my9"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE274F60F
	for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Jan 2024 10:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705661146; cv=none; b=hxfrlbpn1LjLrzlXPOFPfzsNNr17vs5POuVG0yyKwbctcDr60bFHuYvsyxMs12gsdNrRXp6+B8ibZzLPg6q9KzaRUgGxKrYyT7bLL/NYlsiiS+xHW+aoXPwDfUrqw73RjeAKDwJPzoL+LVHqW3ONq70TL42CutQdSfpmAD4LrZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705661146; c=relaxed/simple;
	bh=DbG5Dzt9yOAH99wR1SSFZ8H0AX8ETQYpfNiE1aMGRCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KKOKCToIrKAMIyiEcwBzDtmnzpHwVm3dn2sj7sAJqh1nnJzyClfa34AN3YqUWTdVTeNdwnHAoT1LakL08P+EvOMiSEC0q+zTzYdiQYT4vEQ7VcpJTTkWmO5h1K7wz+QRVsfwxU8K3OJA6ScY76UFKkDE1Qjc7blCKII0cS/lSUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vZ0v5my9; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40e60e137aaso6723885e9.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Jan 2024 02:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705661143; x=1706265943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xja7r4IqoFurQHPVGT/1DVUThNq/9DBjzzyZqX4X0B8=;
        b=vZ0v5my9c3i9KH2cXnZnD7wklTAQkcYI1JsLnETV0At/QE6usSoByXZWV+zInt6xtt
         T0OhsKmuVDgY8Re87xdGH8IQuIUSpSFot6KP6uWDAiePIzFkisjhFOc0z7ElXm/z4TVU
         bf5aYZhK7QiwgIHjOJNTPN/s0/mPspu6ebOm8hg787WrpjZi3wygWvEP7b77KDE2HIWi
         4QImxoGV0Wwrfy+vuMEm/QUbpSR73RjhnJ4yU5ZPZO6v9yAPVqmAhu9mBdYhPk/MrNas
         albTfQpX6OHlA3/fEfyqxQQFDTKfzjFSwuh6Ikrt99co2AmOeNIp7QsJMcWQqJ8kT1b/
         vxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705661143; x=1706265943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xja7r4IqoFurQHPVGT/1DVUThNq/9DBjzzyZqX4X0B8=;
        b=EZ2rX4dBpESUhkA+y6sXT0/OY96kAGsc9t636j+85eCsqHyJbukeH4Kut5XrBsPH5r
         e3vRPzCoGny/1j0Mx/UNRQxufrOvrpYoK/wrjUZYS/0RTWD+kIbgSlpTO2VogrGUSwk/
         vX+ox7w/Fx2XWJhrmZBoK5fW1GInz5EOhZSogNZA4Qbgzuax/RIfl1L/HpaF0hq4rQfa
         H5kSYg1E+SdE2WU19fY5eJ5deKXVHZ3bXXnnAr218w/oCn64rlJgTMCPSnS3ZTsxRdwy
         Md9a+nt44ugwruvNvFQChjjDErcZnjHSs4q1BtuOW9bxBQU/bo1fgwGG4WEohLM7g6kP
         JmJw==
X-Gm-Message-State: AOJu0YwvEGO1g+0swTse+T99OJFHrrBf0wHWTdmL2Yk3EnmtwdjRuKuU
	9hCY0tFrd+0TSyEoxMaqngK6eUYQLNJC8zHBdlFYxbR8uEudX4OsLHzqK8kqxQ8=
X-Google-Smtp-Source: AGHT+IH2PpdF1uUhaQRfj7t0SInB7+ZgNuwheiqs3dl7+iJuzGY08czS9RbIuf9b+VH9MlmAEuFIsA==
X-Received: by 2002:a05:600c:4ab0:b0:40e:37dc:2dd5 with SMTP id b48-20020a05600c4ab000b0040e37dc2dd5mr1306935wmp.135.1705661143501;
        Fri, 19 Jan 2024 02:45:43 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id fm16-20020a05600c0c1000b0040ea10178f3sm77470wmb.21.2024.01.19.02.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 02:45:42 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: alim.akhtar@samsung.com,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	peter.griffin@linaro.org,
	semen.protsenko@linaro.org,
	willmcvicker@google.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 15/19] tty: serial: samsung: return bool for s3c24xx_serial_console_txrdy()
Date: Fri, 19 Jan 2024 10:45:22 +0000
Message-ID: <20240119104526.1221243-16-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240119104526.1221243-1-tudor.ambarus@linaro.org>
References: <20240119104526.1221243-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

s3c24xx_serial_console_txrdy() returned just 0 or 1 to indicate whether
the TX is empty or not. Change its return type to bool.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/tty/serial/samsung_tty.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 90d697def5c7..bdc81ab4af91 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -2184,7 +2184,7 @@ static const struct dev_pm_ops s3c24xx_serial_pm_ops = {
 
 static struct uart_port *cons_uart;
 
-static int
+static bool
 s3c24xx_serial_console_txrdy(struct uart_port *port, u32 ufcon)
 {
 	const struct s3c24xx_uart_info *info = s3c24xx_port_to_info(port);
@@ -2194,13 +2194,13 @@ s3c24xx_serial_console_txrdy(struct uart_port *port, u32 ufcon)
 		/* fifo mode - check amount of data in fifo registers... */
 
 		ufstat = rd_regl(port, S3C2410_UFSTAT);
-		return (ufstat & info->tx_fifofull) ? 0 : 1;
+		return !(ufstat & info->tx_fifofull);
 	}
 
 	/* in non-fifo mode, we go and use the tx buffer empty */
 
 	utrstat = rd_regl(port, S3C2410_UTRSTAT);
-	return (utrstat & S3C2410_UTRSTAT_TXE) ? 1 : 0;
+	return utrstat & S3C2410_UTRSTAT_TXE;
 }
 
 static bool
-- 
2.43.0.429.g432eaa2c6b-goog


