Return-Path: <linux-samsung-soc+bounces-1853-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9862A84E267
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  8 Feb 2024 14:52:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D51A28A6D3
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  8 Feb 2024 13:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A497C0A9;
	Thu,  8 Feb 2024 13:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZX6lfn6m"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DD179DBC
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Feb 2024 13:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707400262; cv=none; b=CrMijbYSahjS6OG8/oP5tqh0xKcQ2PYNWWlzT14yy+wJfIEvuw5ZxpWkoB21aR0OwTGStrqBMwahtup4pDk2WrsCVe1A/cth0O0r5vdiWGzytdMwgWKFedSSpzJobjFzWvSd2ROB9XXgjIYAupdBOQKvCfRTuxUW27VSkgAzfBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707400262; c=relaxed/simple;
	bh=rx5UcKRqmBa2xMJwQBoCtiPbpkdNk/dwmf6spW1NzkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sRySP8waVdUR2p1cev/CH0y9ioclqxZt7Wz+k2+4iM51V+j4Z4K0Y85U5tRQafMgfWIFOQqbm9jPW7ZtpT2h7ZijXxK/oy49wO9KXR9WGqsPMt2TbRX1cln5FLkl163fOja9yJ7xc0vyGSzEEHgkWBk0mQsT7R+ve/D2jdkYJmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZX6lfn6m; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40fb3b5893eso14622125e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Feb 2024 05:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707400258; x=1708005058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwyqOxCBKuWUKHqwJM3+S1e7+XETwlW6DJMJjNuYLS0=;
        b=ZX6lfn6mnbCPMiXFP9ExsIuLTo8xaJzQuJI9l78uI7GEXlpFHWUcg8zTCZBPPV1vMw
         nuH63iETM1RNEjGr2PYAikEUVYvr7Q228/NNDgo1ROCd8DOvFoNqK1+7WabLuxK3blwd
         FV5zCwYTosS9MHX0dzhR1rhc3g/jdYnhvYpPPFneBP5hQyz8wrIOuE6h/uzwyApKRxwR
         y1tRpxzMByoEXsvB/YkjsEwXv0+VgkiSnsqrr9kCIbg8aELWMmYVAnDmYZiY7lOByOV9
         Oqmp6mrfScGHKFHuAtCgjshr7RzrYLbEXJ/q2kDgyMZCdcEYzsD+3+N+o0lW5lc47jew
         zfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707400258; x=1708005058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwyqOxCBKuWUKHqwJM3+S1e7+XETwlW6DJMJjNuYLS0=;
        b=cYUc4PEpThCXIykcGg39XNTxRfXfP1MzG1PfaJfpnBXMwDbW818D0jFwlNTgcPYJyi
         OuykqL14NlbQ4CPDRh4Uvf1oZaxge+p0NP3zAHVPr0l09fKLYoSID4LechBSKtRjthdy
         QxWMU8M3vpXEDKqiy4qVbDkY4f9lt+dC/37RSfST46Z0OVwk0LsVEE5oOtDY6NLYER8X
         hyr8Odebvu0wZxYCcqlTDleLskhKYZu9v+cjKhiHZ9fd68eJ+cpGVah0WBeo+DQo/045
         ZyOaqzjLPjcDif9XTf4ulA4xsZMUB+DRr63h4Q2oo85RSEkdGY0LX37AuNayfrRO6WJ+
         naEA==
X-Gm-Message-State: AOJu0Yxih9xmBeT8X/+4sOnp0S0AA2NIxkVBoxSJNJgk2BQfkT0MVDAx
	thpVgXwg9MC+XjMjscNyGrzcq/cmjsZK2ETUggEmSzuSlaqQd5yFjFoeFiwkGP8=
X-Google-Smtp-Source: AGHT+IFuRz74Ryr8iduYynCYe9ksrKO/vAlTWoyeYZHW6VuBAbeFgR68mUTKHEV5bPN3pi04p9bDuw==
X-Received: by 2002:a05:6000:d89:b0:33b:4d22:f51f with SMTP id dv9-20020a0560000d8900b0033b4d22f51fmr4487140wrb.46.1707400258526;
        Thu, 08 Feb 2024 05:50:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUaIaBS0uNSHVhRgT5IC0YQCnd7ra1haxgnYziBR5jP9PbBI/Dqihi7lOoWCxeYet8TA0vwuhmX/QAUaCL7EzYnpEgQQeBL3QCcJurC1Y6eN0aBVsVV4O3xLBhov5eD/JM0JGM4uXHxknpxZHnqdw1E2LCridEEplU+nGeRmW0XwY2xfmn44wEeVlMiuPj204DhKhNPN9e6fsgiorKGSqj/8KIQs8DYVKlafk8HlvXs4zcgQ8CRWXf6NOhrXk7PA4MzKSNhPHR5u9lbB9dkQRejMvKdf5iTh5/UycUr0vjm84T4/AnLUM74+1TfcSKRiAjV2KuERnEUTM1VGP1RSNAYSOGZ6hbnEf71ljUanbXwzFcm4oJV4KTmZw9Ty7rc3SYLjQHlwSBD9a+sHmNuEJLAX4apZac26t+BomjKF6lFUJ7heqiu5uFbxBfkO6lErkI1AjFJGqfPxLuk9yMgYwerqelelt40rJlFtVEJtaVUJLIAs3Ic76wdYluCH/nHWC9iu4lGdOqaMGTIDCSOuXu/434PiNXMfxpFMx5bhqDh+pf2qW0aZWJh6A8gzOEydJwtm0yzGG6Oo8jgaZWmsS0u2AjWs3H00OT5AZi2xA==
Received: from ta2.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id m20-20020a056000181400b0033b43a5f53csm3618820wrh.103.2024.02.08.05.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 05:50:57 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: broonie@kernel.org,
	robh@kernel.org,
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
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	arnd@arndb.de,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 06/12] spi: s3c64xx: allow FIFO depth to be determined from the compatible
Date: Thu,  8 Feb 2024 13:50:39 +0000
Message-ID: <20240208135045.3728927-7-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
In-Reply-To: <20240208135045.3728927-1-tudor.ambarus@linaro.org>
References: <20240208135045.3728927-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are SoCs that use the same FIFO depth for all the instances of the
SPI IP. See the fifo_lvl_mask defined for gs101 for example:
    .fifo_lvl_mask  = { 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f,
                        0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f},

Instead of specifying the FIFO depth with the same value for all 16
nodes in this case, allow such SoCs to infer the FIFO depth from the
compatible. There are other SoCs than can benefit of this, see:
{gs101, fsd, exynos850, s3c641, s3c2443}_spi_port_config.

The FIFO depth inferred from the compatible has a higher precedence than
the one that might be specified via device tree, the driver shall know
better.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index b1c63f75021d..68f95c04d092 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -137,6 +137,7 @@ struct s3c64xx_spi_dma_data {
  * struct s3c64xx_spi_port_config - SPI Controller hardware info
  * @fifo_lvl_mask: Bit-mask for {TX|RX}_FIFO_LVL bits in SPI_STATUS register.
  * @rx_lvl_offset: Bit offset of RX_FIFO_LVL bits in SPI_STATUS regiter.
+ * @fifo_depth: depth of the FIFO.
  * @rx_fifomask: SPI_STATUS.RX_FIFO_LVL mask. Shifted mask defining the field's
  *               length and position.
  * @tx_fifomask: SPI_STATUS.TX_FIFO_LVL mask. Shifted mask defining the field's
@@ -159,6 +160,7 @@ struct s3c64xx_spi_dma_data {
 struct s3c64xx_spi_port_config {
 	int	fifo_lvl_mask[MAX_SPI_PORTS];
 	int	rx_lvl_offset;
+	unsigned int fifo_depth;
 	u32	rx_fifomask;
 	u32	tx_fifomask;
 	int	tx_st_done;
@@ -1263,8 +1265,10 @@ static int s3c64xx_spi_probe(struct platform_device *pdev)
 		sdd->port_id = pdev->id;
 	}
 
-	if (of_property_read_u32(pdev->dev.of_node, "fifo-depth",
-				 &sdd->fifo_depth))
+	if (sdd->port_conf->fifo_depth)
+		sdd->fifo_depth = sdd->port_conf->fifo_depth;
+	else if (of_property_read_u32(pdev->dev.of_node, "fifo-depth",
+				      &sdd->fifo_depth))
 		sdd->fifo_depth = FIFO_DEPTH(sdd);
 
 	s3c64xx_spi_set_fifomask(sdd);
-- 
2.43.0.687.g38aa6559b0-goog


