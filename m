Return-Path: <linux-samsung-soc+bounces-981-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC82382975E
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 10 Jan 2024 11:23:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FB5E1F281F0
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 10 Jan 2024 10:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B5664776A;
	Wed, 10 Jan 2024 10:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jQxehS3R"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5629244388
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jan 2024 10:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40d88fff7faso41078505e9.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jan 2024 02:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704882074; x=1705486874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XpLNRFI7Q+nWhYT1sc52rnbfGdxVUedlk9wvDQAxZZo=;
        b=jQxehS3RRNio84dia/qvQRDy5JrvR4eRjQKt6wOkk4cTI6ggjkRMh4X6cz8rZMxYeO
         muTCD/V+/qb5DmRYW76XLhZVPsezKMzziD4OP8tCoWlXtROL2YVi90JY2AnxrIDsrde+
         AGOWBYRfeo5jWmfDZ5nVespzCP08avUTgkixBXx8aS/vx4z1qvhpk/jVS/NTcSOkDffX
         aQJgRriBeMLo693a7UC9PzVrjKaw/bE4Cu9zh8V0xBSrssfeSKzmjXU2ZQrgJ2p/BF4H
         k+erZ9rBDwxXpWymcs2ug4E5nS3WQG/eOSl4fEdwTHEg7vKHxylpSSzY8o2m8GPPyAan
         nwOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704882074; x=1705486874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XpLNRFI7Q+nWhYT1sc52rnbfGdxVUedlk9wvDQAxZZo=;
        b=bpZWTgj6LDNCzdNcYEGrmbki8waShjIGv2bgPrLFvOwXcR7OVxYVK7ZCmI+9G9HocG
         glIqfWsRofc4SPg9JfGr8UneDUyy0UdUUXBVmSVp6mM5MDYX6vY9EvIrSZ250Tug+TbC
         7PtO9miRfN6L3BaoxeHiXgWfmx7xDt/OEdiNlyfiuRFTJk04XTgmAAfsHVxQhbC8Aa4O
         6rClFK2X5GGvPI/j4ZOhRz0EHZHIV/36u8Y35l2tDMLj2qQU5YzdsB81E6LNvoot0H2o
         v0VqGkyZZN6Kp8WBKlJ5xQOQUdWiG00pn8uA5an+dvqtgtJxWdttg75TocwngBlnuTzg
         HZxQ==
X-Gm-Message-State: AOJu0Yz4S8C7NthuyRIvWOhEcefj3EGNTGKRKjhIjNrJYwtidG/dcjtZ
	R/pcLrx+Xz5qTnOJEY8X+m/r+k9dd3Fn0Q==
X-Google-Smtp-Source: AGHT+IGUYbHFbchWngawNO9+st/Bnrd1dMjCfFRd06ZBdJ7tUXEyUMFqYOKHkId3ObbsvmgEoSrIWQ==
X-Received: by 2002:a05:600c:2195:b0:40e:42ce:1b67 with SMTP id e21-20020a05600c219500b0040e42ce1b67mr192335wme.246.1704882074792;
        Wed, 10 Jan 2024 02:21:14 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id j7-20020a05600c190700b0040e52cac976sm1625302wmq.29.2024.01.10.02.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 02:21:14 -0800 (PST)
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
Subject: [PATCH 09/18] tty: serial: samsung: drop superfluous comment
Date: Wed, 10 Jan 2024 10:20:53 +0000
Message-ID: <20240110102102.61587-10-tudor.ambarus@linaro.org>
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

The comment brings no benefit as we can already see from the method's
name, ``s3c24xx_serial_pm``, that it deals with power management.
Drop the superfluous comment.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/tty/serial/samsung_tty.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index b9d1ef67468c..90c49197efc7 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -1296,8 +1296,6 @@ static int apple_s5l_serial_startup(struct uart_port *port)
 	return ret;
 }
 
-/* power power management control */
-
 static void s3c24xx_serial_pm(struct uart_port *port, unsigned int level,
 			      unsigned int old)
 {
-- 
2.43.0.472.g3155946c3a-goog


