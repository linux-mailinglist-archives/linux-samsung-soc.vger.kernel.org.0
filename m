Return-Path: <linux-samsung-soc+bounces-1801-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC1084CA47
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  7 Feb 2024 13:06:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C7911F2996A
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  7 Feb 2024 12:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04DD75BAC8;
	Wed,  7 Feb 2024 12:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LgyQfNoE"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7B35A0FB
	for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Feb 2024 12:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707307494; cv=none; b=LFzCBxxasBWte/OCwAfeSyhgtuPhnKw4AJQxWsCJ3edJUamcoOEzFlJqNouAih9iPRb+d+agTf7fL72D/yAOrdkVTC7gWyGeJdLmfP64WbS/ODnaFZc87+SHvxHYSkPo6lwfcpurVTZlzkYu8iQrMN+wJPFvOilFT5aglkaGNXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707307494; c=relaxed/simple;
	bh=hUdT3mG5LBvT4BVl+800NzK/cEAylaH8t6mVOewWosU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Of5+AB6+efXzTwbhWwZ1RkCs8G/OniPsZsOt6pIwxNGYs/jjYwTGW0yaej1WVsP+HBs4D8hHPxgtNitk/3KVCl+EMr54BOoK0wUXGqQYH1HwhXGLY5tvUszP0JWMHVRdMIB3JMDXoFBbFtwH39ZP+J735GI8GiC6Te4j52sbcAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LgyQfNoE; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40fdc63f4feso4725935e9.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Feb 2024 04:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707307486; x=1707912286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AmZwPJi4/crk/e7JVHaewrMAfpkKxE489+JbcSaSVHE=;
        b=LgyQfNoEUilZXMMU2w7WAb4M5/buGcOTBHmu4MM3u15A0HtIbKUOeWJAplYQ6rj3Ky
         edGkNVyj00dfgTCwK2052Q5ApFwRaFWRBYNnxGgQHbRXuYSkeL1AJ8cqZaNyP/e/cw+C
         o56iDa9X0YoFfx3lcsJARsyULvKITkp0ajvcXs/g1arFfJjIBKq9L/dB7c8eoOkqAG0R
         pZO3FAy2iCUruHHYmnjlOjh/+Ug2tfqRiLb8+mwq3rN5XFsEouQ3BgeZoZ8wO2DlvT8T
         JScWtzfxMiHFtc9sZEDkeA364I3u/XKYb2cLMwNrtDOgtjniy1CdTLMGq0uNvyYqZ6Hl
         Gbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707307486; x=1707912286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AmZwPJi4/crk/e7JVHaewrMAfpkKxE489+JbcSaSVHE=;
        b=ZMpFUnlA+S8uf+Rpv3+baZUggDdSqm2j0Q/gOyF8/HDoPYSYAvLoE17IPxOhWgmU65
         +KDMndw+1eOO0NbEO+EH/bnWHE201QB4TzVqOgf+oB2vj6NQEvv9oei93zGwUIT401GN
         NvANPBnnPCvTDhkJm2UljW+OGIQTvTlsPBg901gHbno8FNL3YJr7JVDAK5aQi/fgF2L1
         YFuM0A1nHs7wD0ioq4FQtkPJoHqhdjiLjE8EDZ64sL+AgbtId6lCL6aT//KlCZF1Fgbc
         jIGicLLWyaP/aNraq2BJmz6Hkeg6oBFHZ+DA8xMdJXLEYjmQWMoI4utpyE8CuJ4S5o8V
         CPSA==
X-Gm-Message-State: AOJu0YxQ7/Ujj+h2cpi5N0XUmxlHCdU18uqgkZgYPw8vvsFqtKU5DNzU
	sGb8woIclTqno8MZpDMSRvOZ2qKm35G1wgJah868f0riWlehbeoMLToAo9iNCdI=
X-Google-Smtp-Source: AGHT+IHmmMpg7y1ljPpAMnyZ14o8FS7S/PH5KbVyCVDh5pUlgHetiQ6wRGO7fPXOnM8iUIbbDdGRFw==
X-Received: by 2002:a5d:42cc:0:b0:33b:2fba:1ea8 with SMTP id t12-20020a5d42cc000000b0033b2fba1ea8mr3192011wrr.52.1707307486148;
        Wed, 07 Feb 2024 04:04:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVK4JPDc4iDMmGLIARBd4DhgeTGua/l6VbPFhSXw0UCakv/hGsahC4rjyeLrlUE1mLdXcbtM/+chMVezRIIXgxMl62fbmh9orhyACFJvEW25SZwyXuWDqbAmCNhAX2748XWiAkaVvdhH9DaHXDNvgG3ik6hEhlohBdQPJrCGmtC8pnEpH9AnH/b8ZgXhQjk41sThzoiUnjHEaPJA1pkh8/XGlJ7R3wWyfvugWeCgsA/rC9VONkWqcSEE/2C2HcBFfF/xRDy8P4pWXppH1pZ8GGKWPWpwM9trNTw/NGY6mHDFRaK4ne2a4F9b51Tj3FR88dYbmwVsu7x4QToJrKl+vGfsNK+zj9EgF9yjgIH/CH/SMz9IsqdUOpjQjD17fHWJpFkxlL24fj6RNpcaNc732qYzK0TPYGcCMMSdDDW5y9N9C9SQgNmyTuKH6sF8khgyB0xhKDi17at+bga1nNJ+Gg2vIT2fEUhO7og7b9BAT79VWcUfrGP2A7ezidzzQ==
Received: from ta2.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id d15-20020a5d644f000000b0033b44a349e1sm1349967wrw.38.2024.02.07.04.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 04:04:45 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: broonie@kernel.org,
	andi.shyti@kernel.org,
	semen.protsenko@linaro.org
Cc: krzysztof.kozlowski@linaro.org,
	alim.akhtar@samsung.com,
	linux-spi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org,
	peter.griffin@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v5 09/17] spi: s3c64xx: move common code outside if else
Date: Wed,  7 Feb 2024 12:04:23 +0000
Message-ID: <20240207120431.2766269-10-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
In-Reply-To: <20240207120431.2766269-1-tudor.ambarus@linaro.org>
References: <20240207120431.2766269-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move common code outside if else to avoid code duplication.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 0b42d28d2019..4ce6cb3b43f6 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -294,20 +294,18 @@ static int prepare_dma(struct s3c64xx_spi_dma_data *dma,
 	if (dma->direction == DMA_DEV_TO_MEM) {
 		sdd = container_of((void *)dma,
 			struct s3c64xx_spi_driver_data, rx_dma);
-		config.direction = dma->direction;
 		config.src_addr = sdd->sfr_start + S3C64XX_SPI_RX_DATA;
 		config.src_addr_width = sdd->cur_bpw / 8;
 		config.src_maxburst = 1;
-		dmaengine_slave_config(dma->ch, &config);
 	} else {
 		sdd = container_of((void *)dma,
 			struct s3c64xx_spi_driver_data, tx_dma);
-		config.direction = dma->direction;
 		config.dst_addr = sdd->sfr_start + S3C64XX_SPI_TX_DATA;
 		config.dst_addr_width = sdd->cur_bpw / 8;
 		config.dst_maxburst = 1;
-		dmaengine_slave_config(dma->ch, &config);
 	}
+	config.direction = dma->direction;
+	dmaengine_slave_config(dma->ch, &config);
 
 	desc = dmaengine_prep_slave_sg(dma->ch, sgt->sgl, sgt->nents,
 				       dma->direction, DMA_PREP_INTERRUPT);
-- 
2.43.0.687.g38aa6559b0-goog


