Return-Path: <linux-samsung-soc+bounces-1065-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CC0832800
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 19 Jan 2024 11:48:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5C53284951
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 19 Jan 2024 10:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C1C4F896;
	Fri, 19 Jan 2024 10:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zgrsbOfY"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C054F20A
	for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Jan 2024 10:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705661145; cv=none; b=BmAZncZelGguEiCSpas47I5g4DKM50xnWqrsqu130Y5AbIPt32XJIB1pEWphuXLqpouAcxxiuQSaLsI9YehyayYNngI8MsTy23jMCIfEZYHpVQ7Fy6rlNxBHlZHAAMd5KzFzJvOUkW9a0oGPhpkzDbn7OcmClpJ/oaXMlteB/ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705661145; c=relaxed/simple;
	bh=PJRlGWR9ZTwdang5eUW69ySWLQO09PGgtwAiOHlslcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mQxZIHIN3wEHofwTvDgYOSkcXq8INMrFzEhzW3uj3T7fE5EWdBzfOYvLEAIWKqINTz8d4aS0bdAq/Tk52w4kI2Bf/yF9OljwFYBwV9uyIpB9DO6xm6unIRi+ZLS+iPR+eMU3efBc1U+vda2SK7ltoVXLSkI9DyyuW6rrTAFd2Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zgrsbOfY; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40e80046246so3595765e9.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Jan 2024 02:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705661142; x=1706265942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNVrIVfmeLqNWh0q32FnE3SCbDOH2rJsoikX7ZaHXN8=;
        b=zgrsbOfYBPrTGC3LDVa2Q18oTeIHW7uzteY10Xs/Ew2aA66P1Rabe8xBEFL5DC/vSs
         Lg1IKIXUU91TzOqtO36LN1w0CMOzff0hp6iUhYtaRAndGRZcrvupK+yktsKgqCLqjH4V
         tQlG5agQqS3j+WWP0WyOfNSEuYeEDiNNexGu+VrWV2fGz0BZqiV6V7JOCQjarYJr//PS
         acDovLMq7T4Cz4WE1ZrUFCPeZ/Xzb8KIIHs43HTp7hkMUL6E3CqNaqtJQ3KrIBf2D6Jn
         UH9SkwBU2kR74oG1IH0oTnZOrEHd/rpxmnshkA0HueiOqdYeP1HmkapIQ03YfeVXpVNZ
         j/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705661142; x=1706265942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aNVrIVfmeLqNWh0q32FnE3SCbDOH2rJsoikX7ZaHXN8=;
        b=W0seEQj13/oX5DcMsijvk3I/JV8l4pPDIie4eeigEICEegpDTlVq5T4q0KAyaS+JnY
         LuN6gJoMdRue9nO2+xS3zTN4Cgj7ETnYP4yE93uLZFNgznDtH67pxbk83pAETBSd4aNw
         lk6WglyBkUT253WTj41V+l1dp/vItWYc8Z5QTGXx3I+ZBuo43MePN/q4Ku4D2jK/XDt4
         y9QKRKj2+p/A8bmcYnv5pUBvOcNcyOXsyGZiDBa7ZVJlq8Gdico7xMXxriagRXTKwHQz
         iOvFWlUlsry/fHPnouQVK+gLR9AYWMtcjEe6YAqAMs19zfxUdwP+vIcNIg1CStN02zqd
         qaGA==
X-Gm-Message-State: AOJu0YypMjW3nlfmvUNd4mE33zi6epTwc/KzLVJX5rmd73e0lC2sdykp
	WsXc8UejZ3WstfQe8/TXCjztUDDaIti11Ko3DkEqUdL6IhHwt2iyg/+h7TfNWVk=
X-Google-Smtp-Source: AGHT+IG1Zs80+jewlD9VzzkTPw9eOk7A/qP/u9l55zJeijZCyenfdFg/MX5eIVS2ZxYAe9I/6F6bSg==
X-Received: by 2002:a05:600c:1392:b0:40e:360b:e3e1 with SMTP id u18-20020a05600c139200b0040e360be3e1mr497918wmf.13.1705661142682;
        Fri, 19 Jan 2024 02:45:42 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id fm16-20020a05600c0c1000b0040ea10178f3sm77470wmb.21.2024.01.19.02.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 02:45:41 -0800 (PST)
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
Subject: [PATCH v2 14/19] tty: serial: samsung: return bool for s3c24xx_serial_txempty_nofifo()
Date: Fri, 19 Jan 2024 10:45:21 +0000
Message-ID: <20240119104526.1221243-15-tudor.ambarus@linaro.org>
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

s3c24xx_serial_txempty_nofifo() returned either 0 or BIT(2), which is
counterintuitive. Make the method return bool, and return true when TX
is empty and false otherwise.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/tty/serial/samsung_tty.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 333ffa3a76a3..90d697def5c7 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -236,7 +236,7 @@ static inline const char *s3c24xx_serial_portname(const struct uart_port *port)
 	return to_platform_device(port->dev)->name;
 }
 
-static int s3c24xx_serial_txempty_nofifo(const struct uart_port *port)
+static bool s3c24xx_serial_txempty_nofifo(const struct uart_port *port)
 {
 	return rd_regl(port, S3C2410_UTRSTAT) & S3C2410_UTRSTAT_TXE;
 }
@@ -782,7 +782,7 @@ static void s3c24xx_serial_rx_drain_fifo(struct s3c24xx_uart_port *ourport)
 		ch = rd_reg(port, S3C2410_URXH);
 
 		if (port->flags & UPF_CONS_FLOW) {
-			int txe = s3c24xx_serial_txempty_nofifo(port);
+			bool txe = s3c24xx_serial_txempty_nofifo(port);
 
 			if (ourport->rx_enabled) {
 				if (!txe) {
-- 
2.43.0.429.g432eaa2c6b-goog


