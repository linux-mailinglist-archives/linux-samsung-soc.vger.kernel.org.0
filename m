Return-Path: <linux-samsung-soc+bounces-1175-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4244F8392F9
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 23 Jan 2024 16:36:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6937293F0B
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 23 Jan 2024 15:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E64CF60BAE;
	Tue, 23 Jan 2024 15:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DD3Epgh7"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283DB605D9
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jan 2024 15:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706024076; cv=none; b=OCcfbFD9BjD4lk7qMJ8EDczSLimWe2KMYzRxlWmmrVwdkhPA3MA+kkPKQ/Ne6tnpRuRl5H2S8UIWJDknoUUuiWGSc+tzcei7vt4RR074fBFDOlIb++lPYgoHbYPWZrf6wMItR4bLG/Z1KFHqSxiN+qP8GKXa9l1I8YIOmCUfqsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706024076; c=relaxed/simple;
	bh=QjcMm60EHmrrPnLyPrTWWmevfQdmeVmDZZx9RXXvrVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C5kolcbuKuuorHc2j1JUWvEYBVwRTPdH7e8dQLz52GpmnV+PQ8NbElZb5IBiY3NJsVkNe865UpLSonrsQCs+4byLm7WSTMH211+EkZOE1iOUNty/XtmqrFnEY64a7g7i5do9kNSc03nNe5Lyv9oVXyt7C67brBDHKg0Px34/xQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DD3Epgh7; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40e9101b5f9so49743665e9.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jan 2024 07:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706024072; x=1706628872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHAMCRAZbqujp5tmnqVlu3xbp4r52puiDbaaPDxhoS4=;
        b=DD3Epgh7opd+bJhGNw94Y4JVekJxZThMW/ROrirqEUd7XTr1bRcfptWq+zLsuOtRyt
         jMUuQuundcUB9sptCJRmoHl0tMIYjs4gcWRek7VjcyIBYLJv+tnrUSuL0q+eoHiHvJjI
         LxlT1KC2qva/WRhouSwScSrKoZoipMK9fqnhd8f4ihc0HWdfmhafDCb+PySFSkXXIbpx
         5/tM0BJS+tf66/DoVhfSDJDTweaBRuK2pbelPbFbHZ6cdnI1ivglN/0MQeNwW/7YG7nx
         Km8MslCYqVlqWj8hVTrcnHZa/ZuSQEz5nASOoLdOMEurVgPQaEbEZUgp8gttLe1EZ/cN
         qsNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706024072; x=1706628872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AHAMCRAZbqujp5tmnqVlu3xbp4r52puiDbaaPDxhoS4=;
        b=VN/ao2IlqrF3q5egEkNDNnimaeDheevCTHvdiR7A9SE0s29Nn98OPWfKObdPxD9XPq
         kZIG4k7PAHLlQJ9M//OiHFOMEscbcXCyIvTqzhfW/GVTjb8dteHVvFiELdg/2FPUR3Zr
         e+yRQtt6FoTGOJadEen16s7V7Y9hLqxMVRvHHIkGppamLm3P+nodcvRQh98aHV8LCImG
         03XKnyAJhYvN0m6iQ36iGaBMoZKoJxQenwKPCJgCXlM8HgM0vaDQtITbpp8obmrOUalP
         FWWTBp7UlHSmkovXgo3X1OywNTXronjj0BjY7hTRhMiO2FI3OEi+HccrbyYrnwqs9nWB
         OkqA==
X-Gm-Message-State: AOJu0YyCb6O0bGsmkjB6RsbVear9xF9gPS/zH04AWMms/EvszDqFbCF/
	vX3WtGCy6eJwIzXlHV435ZCxqxyFBqi6vfLRdHlpXPP73q+I3LSBVblEKYs9DhA=
X-Google-Smtp-Source: AGHT+IEawZ2QUjKQsybqiQMynrw5FMreS9VpG6oekTM7Bcb7Eww/T8JFnJKSGqnlZXecULPsUM+uMQ==
X-Received: by 2002:a05:600c:21d7:b0:40e:53f7:a254 with SMTP id x23-20020a05600c21d700b0040e53f7a254mr255145wmj.73.1706024072434;
        Tue, 23 Jan 2024 07:34:32 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id p21-20020a05600c359500b0040e3488f16dsm42457536wmq.12.2024.01.23.07.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 07:34:32 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: broonie@kernel.org,
	andi.shyti@kernel.org,
	arnd@arndb.de
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	linux-spi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arch@vger.kernel.org,
	andre.draszik@linaro.org,
	peter.griffin@linaro.org,
	semen.protsenko@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 08/21] spi: s3c64xx: move error check up to avoid rechecking
Date: Tue, 23 Jan 2024 15:34:07 +0000
Message-ID: <20240123153421.715951-9-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240123153421.715951-1-tudor.ambarus@linaro.org>
References: <20240123153421.715951-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check the return value of wait_for_completion_timeout() immediately
after the call so that we avoid checking the return value twice.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 16eea56892a2..128c3b8211ce 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -519,17 +519,17 @@ static int s3c64xx_wait_for_dma(struct s3c64xx_spi_driver_data *sdd,
 
 	val = msecs_to_jiffies(ms) + 10;
 	val = wait_for_completion_timeout(&sdd->xfer_completion, val);
-
+	if (!val)
+		return -EIO;
 	/*
-	 * If the previous xfer was completed within timeout, then
-	 * proceed further else return -EIO.
+	 * If the previous xfer was completed within timeout proceed further.
 	 * DmaTx returns after simply writing data in the FIFO,
 	 * w/o waiting for real transmission on the bus to finish.
 	 * DmaRx returns only after Dma read data from FIFO which
 	 * needs bus transmission to finish, so we don't worry if
 	 * Xfer involved Rx(with or without Tx).
 	 */
-	if (val && !xfer->rx_buf) {
+	if (!xfer->rx_buf) {
 		val = msecs_to_loops(10);
 		status = readl(regs + S3C64XX_SPI_STATUS);
 		while ((TX_FIFO_LVL(status, sdd)
@@ -538,13 +538,8 @@ static int s3c64xx_wait_for_dma(struct s3c64xx_spi_driver_data *sdd,
 			cpu_relax();
 			status = readl(regs + S3C64XX_SPI_STATUS);
 		}
-
 	}
 
-	/* If timed out while checking rx/tx status return error */
-	if (!val)
-		return -EIO;
-
 	return 0;
 }
 
-- 
2.43.0.429.g432eaa2c6b-goog


