Return-Path: <linux-samsung-soc+bounces-1281-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 177F983C592
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 25 Jan 2024 15:54:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C44B8299234
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 25 Jan 2024 14:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45F3E86AC7;
	Thu, 25 Jan 2024 14:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xq00kVaa"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95D781AD5
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 14:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706194228; cv=none; b=XLookv+c5Jz2Dft91m/STHI6ZTCkRIWPnfJsRUvOUy4ENdFE8BbEG3FU6aIZmBDbmDNkSdpKuXGoBJ9/5TYsS55eZGqrd9bKT+JnzKDgq++TaXmfl6abeKU49ETeYALLGLQ1o5b0bzuu4Qimv/Ey7N+8ZLbE+ZYkxLHMnXhJNoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706194228; c=relaxed/simple;
	bh=BMnHD2dtw0Q+/VBvgqPiw6zeufZq9wG7qlcCmbu3aCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rCZn3GP8Lq7WheqQ17zVia7mHu/bZe/cFYItY+3/ScART1MBkVjVR6hY42Rfihw8gNHzd4SnYl9QpF7Za7FSGoAbHN/XkZAEYyaPA1HpNWJgZTSLmDyKdFaFuy3GyaZkOAQLytCjLvKOSM2BqoQ0O1gvTEIVvvoqvJ/Veb2PM0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xq00kVaa; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40e8d3b29f2so80031725e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 06:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706194224; x=1706799024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+YODKSwwosS+Boh3Md8IudPiFt2ZVlyI0co3V0SoeDA=;
        b=Xq00kVaaLgJocw69dajORWZrvF+jg106QL8zKSK1pE4yZgFFl/8JVExa3PbN0oezme
         0oJvTkVdH7VOx/i63chNWnZ2UZe83zryqZr3TqFLkXaLRHekP7bpZfEyXWHAKBY+dbL2
         gQuRqkWqnaTxJe1qo8resDhFcuW1h6SAqWI+qcH8/v6lrdMpYgDoiaF1f2QtsUugoGlC
         QBsTpWgsIaysBUWMIggNh+eo6Fpq86E3+bKTroSDA84cYoYFvKpfNzfSRApQ9e9R6vur
         vijPxe3guc/gX5ECGeufRmtDCnQMvNU7tT9llhGPZ9rM68VzQC2a0VEQsHkqCWVlmhIx
         MgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706194224; x=1706799024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+YODKSwwosS+Boh3Md8IudPiFt2ZVlyI0co3V0SoeDA=;
        b=eC8PCeE9k5A1/x9h0BWIe7Dq1XfihfJp2w9fXMecuAxjATMlG8B8OYBCNUNrFbLAP5
         TyEvIoPWhGQq61hp8AVQQmVGxZFzRq5eizG49dQPh9cSOrjTfU0ohunxkjMF7ZEfiHUu
         aMgzKDCBvZPzoHd/X2MiIzrH81wgasm/eq4WhbYcTNX3n7Ebk0R51cYcyZMb5cjJYa7Z
         fk5WK2TY2ag2T73XKeGc4YLvR5x9Yixqviou97OAfciiPIe0qLoQEyc3EWlmUpvXyPGO
         ewDMrcO91qB9nSofV52npl5CbcXV5YvyBaLcgtzliKS9nVdLcA70W/FFJReHLSXRikGG
         Pi5w==
X-Gm-Message-State: AOJu0Yy5kpAohY3pzqG4sThvAeQZXqUi5i5HoiFtYkyNhppWhtAe6c8K
	WHZhJLSwAWICt/wnd1N+oXVVpSnIrmvsYKOnY393kA7u5pv4ht6GheHLsr7l0Es=
X-Google-Smtp-Source: AGHT+IHQibS5o6WlTuiDCwT7ZjkLtBnPKNQkGAG1I79CB9wOZ7GILO1eVGmHw8GQaGabYq+jMXwkKQ==
X-Received: by 2002:a05:600c:6b03:b0:40e:6f03:45b5 with SMTP id jn3-20020a05600c6b0300b0040e6f0345b5mr390308wmb.261.1706194224044;
        Thu, 25 Jan 2024 06:50:24 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id v17-20020a05600c471100b0040d91fa270fsm2875875wmo.36.2024.01.25.06.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 06:50:23 -0800 (PST)
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
Subject: [PATCH v2 15/28] spi: s3c64xx: return ETIMEDOUT for wait_for_completion_timeout()
Date: Thu, 25 Jan 2024 14:49:53 +0000
Message-ID: <20240125145007.748295-16-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240125145007.748295-1-tudor.ambarus@linaro.org>
References: <20240125145007.748295-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ETIMEDOUT is more specific than EIO, use it for
wait_for_completion_timeout().

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 447320788697..d2dd28ff00c6 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -523,7 +523,7 @@ static int s3c64xx_wait_for_dma(struct s3c64xx_spi_driver_data *sdd,
 
 	/*
 	 * If the previous xfer was completed within timeout, then
-	 * proceed further else return -EIO.
+	 * proceed further else return -ETIMEDOUT.
 	 * DmaTx returns after simply writing data in the FIFO,
 	 * w/o waiting for real transmission on the bus to finish.
 	 * DmaRx returns only after Dma read data from FIFO which
@@ -544,7 +544,7 @@ static int s3c64xx_wait_for_dma(struct s3c64xx_spi_driver_data *sdd,
 
 	/* If timed out while checking rx/tx status return error */
 	if (!val)
-		return -EIO;
+		return -ETIMEDOUT;
 
 	return 0;
 }
@@ -574,7 +574,7 @@ static int s3c64xx_wait_for_pio(struct s3c64xx_spi_driver_data *sdd,
 	if (use_irq) {
 		val = msecs_to_jiffies(ms);
 		if (!wait_for_completion_timeout(&sdd->xfer_completion, val))
-			return -EIO;
+			return -ETIMEDOUT;
 	}
 
 	val = msecs_to_loops(ms);
-- 
2.43.0.429.g432eaa2c6b-goog


