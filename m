Return-Path: <linux-samsung-soc+bounces-4148-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE9794B8AC
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  8 Aug 2024 10:12:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F23C1C22D5C
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  8 Aug 2024 08:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9693D189910;
	Thu,  8 Aug 2024 08:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G1fCh3Rd"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFF1189535
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Aug 2024 08:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723104716; cv=none; b=NW7Dc3r/xPZdPzYkZv7fq238eUyQKHJUbbEERNnNhxVMTdYskBPpeOs6NrIwt48XsrNZnnGnJccfXgNogDhOZzjS/Y6pz1rI6dTOAUabNBVncW0DsYl9soDkCkXRbJULYXKr0NQ0cwfk7KqhNsX7SUuUKQCc5GOhkpx5V/jeHzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723104716; c=relaxed/simple;
	bh=C0WfsFjQ+8vm0W8joRCkaLKnopigm0TpDNtG9k6jpMU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y1NZXI5pUqbGsVkeWp6mpEydru8K7G35724g35yKWR6htbQCL1umjFouGne3lajIx4G3z+ZdolV5z1KE8gBFBCk6Nq7btBXgujfaZAiMCY9LMhVqXuygqs2luPciqoUQAyC5Ic5nl2/YlIyMdJa65RAR6dxLTY1WM/3n+UwLQ1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G1fCh3Rd; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5a79df5af51so2702645a12.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Aug 2024 01:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723104712; x=1723709512; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CMjvgficlM8E7OFHsCNQI4tsZ98VKn4/e3uEzM8rqJg=;
        b=G1fCh3RdZm+au19rlS8yf6Kk7fqIru6wnDccfP+sgc3f7gKqIP9sWtg+kCjukQcmpb
         f8EsTwzluwh5R5lvg6Rxk3in7Y868hOgC8joPDv5oQ5TWkl1a223LmBYXiInE4N3NdW2
         QE7+S5QPUSY9GUEpAMG3c7NnVjlk8v87rAWowpoPbn9Qr6KVlqHhe3GKX/S0SgwqkNbC
         B+hY7vjv8QbwLMPSl6RRDP8f9SPuwVcMrX1YXw4VDP4WDHdBL0kJ4WK3EMesaUt7WVDl
         9yZa7VYp75EVki16qx7jdhl+DCembCjpT6MF/B8X9+/Rnhyv8y4zL3+3wdI7fzKnDMZn
         VvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723104712; x=1723709512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CMjvgficlM8E7OFHsCNQI4tsZ98VKn4/e3uEzM8rqJg=;
        b=Qex6GxuAiYNPx92qBQeFnl6QPjFt5AUix/+63ateu+xgFDPV3Muy8KuqRV/mLCwoQn
         6hN9okwEDG9eL4ncbL5PNViah02iGAr2Pam50y2A5ItKlxAPeV71vecAyqEsnCKbK1Bq
         lxGRTyNoaZ4FCyxEMpXnO3SVf3uZ9JekTuNCSlixFPDRDKi+Qf80sLyPW/ihFfuh/qRn
         zLYVETZLBYl5ivMpNpzUK4mYYdP4aCBWNHLwxZ12kWJzxMR9f5tB1kRHtkZtWeUo4pbT
         2Yo9RKlrYq1GAZ95kUHWS2N7pSFrlyo6tnJFw0b1jxLjydYsEWXmpKCXoKOlCE/sZgZ6
         mLyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhCqBvCG1M8j0htro1abdJ16smA8ysdcLHo8gLLEis+6XqxdjZ7cAnMP/L1JR129lJeHbr5qAiezR+YCN5MHcEcazCN0hOS8mFB/74icTnNjY=
X-Gm-Message-State: AOJu0Yy9xB78N2lvW+aSKJ4U8x5Haf+64n/XEJu6mkP06nzT47/suqTs
	g7sTN8LObp+ERMBC8CsDMHKztWfjjT4HZ7ysS8VJr5+xRRm8whVKPrYPfMovK18=
X-Google-Smtp-Source: AGHT+IEKF5uMso0H1TX1U0r7MN8eita6rME/UxaedoMjy3NSMf4N+HXWEdwe1FGXYuPeFzG2L0FbWA==
X-Received: by 2002:a17:907:368c:b0:a7a:8dcd:ffb4 with SMTP id a640c23a62f3a-a8091f1998dmr72261166b.17.1723104712315;
        Thu, 08 Aug 2024 01:11:52 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9c0c578sm716931166b.73.2024.08.08.01.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 01:11:51 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 09:11:51 +0100
Subject: [PATCH v3 1/2] tty: serial: samsung_tty: drop unused argument to
 irq handlers
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-samsung-tty-cleanup-v3-1-494412f49f4b@linaro.org>
References: <20240808-samsung-tty-cleanup-v3-0-494412f49f4b@linaro.org>
In-Reply-To: <20240808-samsung-tty-cleanup-v3-0-494412f49f4b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

The 'irq' argument is not used in any of the callees, we can just drop
it and simplify the code.

No functional changes.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/tty/serial/samsung_tty.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index dc35eb77d2ef..1c6d0ffe5649 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -855,7 +855,7 @@ static irqreturn_t s3c24xx_serial_rx_chars_pio(void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static irqreturn_t s3c24xx_serial_rx_irq(int irq, void *dev_id)
+static irqreturn_t s3c24xx_serial_rx_irq(void *dev_id)
 {
 	struct s3c24xx_uart_port *ourport = dev_id;
 
@@ -928,7 +928,7 @@ static void s3c24xx_serial_tx_chars(struct s3c24xx_uart_port *ourport)
 		s3c24xx_serial_stop_tx(port);
 }
 
-static irqreturn_t s3c24xx_serial_tx_irq(int irq, void *id)
+static irqreturn_t s3c24xx_serial_tx_irq(void *id)
 {
 	struct s3c24xx_uart_port *ourport = id;
 	struct uart_port *port = &ourport->port;
@@ -950,11 +950,11 @@ static irqreturn_t s3c64xx_serial_handle_irq(int irq, void *id)
 	irqreturn_t ret = IRQ_HANDLED;
 
 	if (pend & S3C64XX_UINTM_RXD_MSK) {
-		ret = s3c24xx_serial_rx_irq(irq, id);
+		ret = s3c24xx_serial_rx_irq(id);
 		wr_regl(port, S3C64XX_UINTP, S3C64XX_UINTM_RXD_MSK);
 	}
 	if (pend & S3C64XX_UINTM_TXD_MSK) {
-		ret = s3c24xx_serial_tx_irq(irq, id);
+		ret = s3c24xx_serial_tx_irq(id);
 		wr_regl(port, S3C64XX_UINTP, S3C64XX_UINTM_TXD_MSK);
 	}
 	return ret;
@@ -971,11 +971,11 @@ static irqreturn_t apple_serial_handle_irq(int irq, void *id)
 	if (pend & (APPLE_S5L_UTRSTAT_RXTHRESH | APPLE_S5L_UTRSTAT_RXTO)) {
 		wr_regl(port, S3C2410_UTRSTAT,
 			APPLE_S5L_UTRSTAT_RXTHRESH | APPLE_S5L_UTRSTAT_RXTO);
-		ret = s3c24xx_serial_rx_irq(irq, id);
+		ret = s3c24xx_serial_rx_irq(id);
 	}
 	if (pend & APPLE_S5L_UTRSTAT_TXTHRESH) {
 		wr_regl(port, S3C2410_UTRSTAT, APPLE_S5L_UTRSTAT_TXTHRESH);
-		ret = s3c24xx_serial_tx_irq(irq, id);
+		ret = s3c24xx_serial_tx_irq(id);
 	}
 
 	return ret;

-- 
2.46.0.rc2.264.g509ed76dc8-goog


