Return-Path: <linux-samsung-soc+bounces-988-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BAB829778
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 10 Jan 2024 11:25:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D722B26EC8
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 10 Jan 2024 10:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FD6248798;
	Wed, 10 Jan 2024 10:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z3Sqwgxc"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA867482D2
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jan 2024 10:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40d87df95ddso41204685e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jan 2024 02:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704882081; x=1705486881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIejJEXeNUqkKRlWpyybjPC4hGJCbHArkKwU6CRLU6k=;
        b=Z3SqwgxcnFKlWFa8xWVshMiT/It8Qky4i5hZWPM0juCESNRhqlR5uOvGMW/QR33GOn
         5wVqTieLjrw9MHPdnAcPDSBVHY2qL4riUB8nnnZePRhGEEUNQ/EOISRNOMRfzcv5OpPe
         PXTjAj3ALhZITWOTD/mbIZ89XKw340RDc5/ofwMC6mQXv8f0EPRzH24GvaS9XQCofD52
         jXtGdI5hE64frL1E8NLh3DWihwcwmUZNP65CmXw7QNKr8KOmIrRs2nrMyQg9hwmgEHwA
         r/8WK6eIxJw0qlske6k7MTB2hb4wxsx0s7QUj+ufqgbAshBoOExBOckVT1RIywaX01NT
         /psQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704882081; x=1705486881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aIejJEXeNUqkKRlWpyybjPC4hGJCbHArkKwU6CRLU6k=;
        b=scGU0qqXbgkkWdqIk5q1hsMHYob0fRiwYj/0CvBaTxQNzhPL1HoFKrmSTwighv9k8B
         HGGbBVhYn9MKEIeT1b3k9e/H27Nl4yF6Wj1gsRGqKI0Iu+CDzY6pvKudmAqLRt8fQm5b
         kzB07ftPzrPcuWZxfgT06D5QxqsOT7GD6XNAh6Z70zTqXzeUQC19XAFTcbFkZEHyY0W9
         hF1lJHYANDA6d4V4iAg9U9BxqnbAUf4yBntMexhEBNAeSxRR6RiaOE9m3X3+ZQvenLXk
         MW/AkA1E9v63fF8vITIwtQo27LQ8+BPtQZtDvhPiTMXEDnUAaFrhCKJxleFvnGXSjefZ
         xUyw==
X-Gm-Message-State: AOJu0Yxep3rx8O0RFNbHUwEEmP+hsfjFZ5HK9Hi+Gwegm+4HUtg17QmW
	f22G8WQbNJcLkO6QgL1Zvfeh1CYHFrDQmw==
X-Google-Smtp-Source: AGHT+IFtDvi8wjZKg9pm0ERSI9OUVSk7oMwH+ipIk06V0XhYNU2+w7zsSgC+1btLE2dAAQHJq3B/vw==
X-Received: by 2002:a05:600c:1d97:b0:40e:567f:38d7 with SMTP id p23-20020a05600c1d9700b0040e567f38d7mr188898wms.225.1704882081232;
        Wed, 10 Jan 2024 02:21:21 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id j7-20020a05600c190700b0040e52cac976sm1625302wmq.29.2024.01.10.02.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 02:21:20 -0800 (PST)
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
Subject: [PATCH 17/18] tty: serial: samsung: shrink port feature flags to u8
Date: Wed, 10 Jan 2024 10:21:01 +0000
Message-ID: <20240110102102.61587-18-tudor.ambarus@linaro.org>
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

There's a single flag defined as of now. Shrink the feature flags to u8
and aim for a better memory footprint for ``struct s3c24xx_uart_info``.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/tty/serial/samsung_tty.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 5df2bcebf9fb..598d9fe7a492 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -90,7 +90,7 @@ struct s3c24xx_uart_info {
 
 	/* uart port features */
 
-	unsigned int		has_divslot:1;
+	u8			has_divslot:1;
 };
 
 struct s3c24xx_serial_drv_data {
-- 
2.43.0.472.g3155946c3a-goog


