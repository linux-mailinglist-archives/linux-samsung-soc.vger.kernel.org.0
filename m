Return-Path: <linux-samsung-soc+bounces-985-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB8082976C
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 10 Jan 2024 11:24:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9012B1F2825C
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 10 Jan 2024 10:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48BE9481AA;
	Wed, 10 Jan 2024 10:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yYSveuyM"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9164247A5B
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jan 2024 10:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40d87df95ddso41204185e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jan 2024 02:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704882078; x=1705486878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUZkD3RxZyomRUtnLq1bNhUO9I/uygo4/DAHV/FeOS0=;
        b=yYSveuyMs5dIyP/53U1mj1nZF+w3Z5vq/5XOV2by6TdQiU6pvh/hhKxfWqAylgUOMm
         KF/NC+SVesNplooqw5r8RnYkIwQOwpvzmU+cI4vl83fGKi4YqgZ8GYaLUm382PqJT05Z
         G+FWWGFcl4Wg2qcNVYqFaF5UCAwQnbl579KGCTQpuuBVBGq52zqIHiudcZ71xW5atKqO
         1xiZelrkBcF2JjUrjgRYHXcm/hOqWyzVT1afhB92FgZYuyL4IKuWI9w8+enrNqyfLG3C
         uziI49QNg7DgrKIsi7zNem1j6k8iEvYoMJTzFTvrjjSfMNJGum73aytwRGZtWE7ATzS6
         S3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704882078; x=1705486878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zUZkD3RxZyomRUtnLq1bNhUO9I/uygo4/DAHV/FeOS0=;
        b=N6YTuggmy0boaycFWAqIdbC7aNAartYBiyf0lwO0ZTcKE+RMmJPHrpBsaufDehcajy
         Dl8PKF4+O9cLq/AS6fHaXJPCrCCdCzuMj5up0FXhNqw3JPlXKPXYXL1qAMxBMQ1C08fu
         K3jGafQ1a3Nr0vG3qlnwuOLmhiZZRGEHHJ6OrI+bBZP+Cak3QbCsIN/No/bGbh2NpBTU
         mncOeFI3q3dgRsvHVcLOIZCSx+k80axnHJrX2nH9X6iH1f3kB4xV4rdf5un7oEeAp2kB
         YIV929FrBBoW70/B6lzJCBDxqupeLB4uxbZxbEKGGOq1jhKQ1Ne4SHziv+VnyhDzrfWe
         E+Vw==
X-Gm-Message-State: AOJu0YyJvxcOY6YXwokbwZGS9o7Jw3bP3C+mKLpqkIwwmiCLkVF5yzP7
	Qki8s+9IngmKjUOFeJRR7KYNh1lTvU4LiQ==
X-Google-Smtp-Source: AGHT+IGYLsOFrNdKSYUGQJjzwSLK/RYL6+X1/WFxwE+OfMrXS+TWExfIax6TS45wnteKjsb5eI8ulg==
X-Received: by 2002:a05:600c:45d2:b0:40d:7c1a:cce4 with SMTP id s18-20020a05600c45d200b0040d7c1acce4mr208326wmo.213.1704882078025;
        Wed, 10 Jan 2024 02:21:18 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id j7-20020a05600c190700b0040e52cac976sm1625302wmq.29.2024.01.10.02.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 02:21:17 -0800 (PST)
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
Subject: [PATCH 13/18] tty: serial: samsung: return bool for s3c24xx_serial_txempty_nofifo()
Date: Wed, 10 Jan 2024 10:20:57 +0000
Message-ID: <20240110102102.61587-14-tudor.ambarus@linaro.org>
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

s3c24xx_serial_txempty_nofifo() returned either 0 or BIT(2), which is
counterintuitive. Make the method return bool, and return true when TX
is empty and false otherwise.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/tty/serial/samsung_tty.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 46fba70f3d77..63e993bed296 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -236,9 +236,9 @@ static inline const char *s3c24xx_serial_portname(const struct uart_port *port)
 	return to_platform_device(port->dev)->name;
 }
 
-static int s3c24xx_serial_txempty_nofifo(const struct uart_port *port)
+static bool s3c24xx_serial_txempty_nofifo(const struct uart_port *port)
 {
-	return rd_regl(port, S3C2410_UTRSTAT) & S3C2410_UTRSTAT_TXE;
+	return !!(rd_regl(port, S3C2410_UTRSTAT) & S3C2410_UTRSTAT_TXE);
 }
 
 static void s3c24xx_serial_rx_enable(struct uart_port *port)
@@ -782,7 +782,7 @@ static void s3c24xx_serial_rx_drain_fifo(struct s3c24xx_uart_port *ourport)
 		ch = rd_reg(port, S3C2410_URXH);
 
 		if (port->flags & UPF_CONS_FLOW) {
-			int txe = s3c24xx_serial_txempty_nofifo(port);
+			bool txe = s3c24xx_serial_txempty_nofifo(port);
 
 			if (ourport->rx_enabled) {
 				if (!txe) {
-- 
2.43.0.472.g3155946c3a-goog


