Return-Path: <linux-samsung-soc+bounces-1288-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3947283C5B5
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 25 Jan 2024 15:56:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD97129944D
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 25 Jan 2024 14:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74A3812A17E;
	Thu, 25 Jan 2024 14:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aSIWXzIi"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30882128383
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 14:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706194235; cv=none; b=XrwZXHO6/J41dOSmVbIvmYf5ljMhTdKMuQr5iT0E7d8N1ppPgWgiVQ0irBhp+FuDzp5blOeXNZkpGwiJZt8w+pAO3i47vcVVOuULNgw9nbQsdj6NiR1VbUAkD9gdkuCWd8Tuii0qITazLM8yqFXV4CbzA2WburelzMjV2QvA9uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706194235; c=relaxed/simple;
	bh=qxc7sbniUDyQV364D2RhlbEnDsCBptc6ZkMAL9cwgPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QF2185jHMs5zsp2QGs5sLQpjvyAkkSruIIgSFglOQBU+SKib9kQKZ6JaTp6oFsIbIjVv5pqfWUqi6dzILTfMp/tc/b2nPvdbhgdXKAkVXjzxJHuYQopkEK+rHfNrZSHDBvvEQ0A03baUSysd1ARMxYCuIBDeNPYDEm1haykSyKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aSIWXzIi; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40e913e3f03so85545725e9.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 06:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706194230; x=1706799030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JtNtOah4q0k+JGCPgSMuID7OmymIk1nPxql5oxULauE=;
        b=aSIWXzIi7O/UnNLSv4Rh5ATOd4wCcaWnjqDZBdTRxOlvWjxPvczxvBOLPFH5k0vxup
         pK2NE0/7bxvVBwiqSHG48/cFwVRwX4i4v375ZV1c+n9UYugs4WxalG9MRJJ4OEboZRRP
         XiumQUndHvjPv8UbnhbFBe5qO1ewhW5qfcZajqMKUiW5N4laYUkrEJ7xTdgeSOW2PLST
         q2p5nW++lIkfkvK9tQAh50b++1Q4q6hCHvf4MjQcxoYbLRjt8K0ShOL+behXHYbC7AVh
         8GSx1E1yOUT75VTtwu0DGJtrWJMqjOu7VAkkZ0O3+X830hGoDtRqzkxb5FYjGsKCGP+2
         RjSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706194230; x=1706799030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JtNtOah4q0k+JGCPgSMuID7OmymIk1nPxql5oxULauE=;
        b=fWyXDHXuLUj5/OG3CoXy3NvpLep02ncs9mNry6U3EdyHdJKqK6Lg/s8KVfRGE0cieM
         lvhjC2X68Bk+kNpvwoeJj/beip9UaEtqRXwl2tQAfrthkTCkT7RSuse3U0VHa2mFQIYv
         nhZl6236kQlRshpDBLJjyQPmSqyyDYQ5weql8ceIWVznUc4OS8f664tRF5+qSnIJt4JI
         +j3Iw3ScQ/oDTjoaTRX0NgfVPs97AgfkaNp8Wm5jfVJziUIlInWumSy22dNALqfwltYY
         QZbwusBYJgdL7vrLdU08qNlxIwkYeHR7eD6xGV1Rn3bTOV2jK2T7mBnNPEEIEua1o4Mg
         ir4A==
X-Gm-Message-State: AOJu0YwfJljL58n68fhtsO6PZjdCQl7Fh8TNSY083v11FCFYfbd3KtWp
	IUJ3Ux0nEj/DaTbl0A15WBrzlKvp+QM7ml7Uijgp40PqbjGC5Jjz016lCVKv5eA=
X-Google-Smtp-Source: AGHT+IHbggNgNKsbigSPf6qnK9OAL7RN+AXot/5cZEw4S6FkZlNDOIGl4jCVyK8EYQh9E6qMazSeuQ==
X-Received: by 2002:a05:600c:384e:b0:40e:c1a9:6829 with SMTP id s14-20020a05600c384e00b0040ec1a96829mr575554wmr.120.1706194230059;
        Thu, 25 Jan 2024 06:50:30 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id v17-20020a05600c471100b0040d91fa270fsm2875875wmo.36.2024.01.25.06.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 06:50:29 -0800 (PST)
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
Subject: [PATCH v2 22/28] spi: s3c64xx: drop dependency on of_alias where possible
Date: Thu, 25 Jan 2024 14:50:00 +0000
Message-ID: <20240125145007.748295-23-tudor.ambarus@linaro.org>
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

Remove the dependency on the OF alias for SoCs that use the same FIFO
size for all the instances of the SPI IP. The driver failed to probe if
an SPI alias was not provided, which is obviously wrong.

We now let the SPI core determine the SPI alias, either by getting the
alias ID, or by allocating a dynamic bus number when the alias is
absent.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 61 ++++++++++++++++++++++++---------------
 1 file changed, 38 insertions(+), 23 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index b86eb0a77b60..7a99f6b02319 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -107,10 +107,9 @@
 
 #define S3C64XX_SPI_FBCLK_MASK			GENMASK(1, 0)
 
-#define FIFO_LVL_MASK(i) ((i)->port_conf->fifo_lvl_mask[i->port_id])
 #define S3C64XX_SPI_ST_TX_DONE(v, i) (((v) & \
 				(1 << (i)->port_conf->tx_st_done)) ? 1 : 0)
-#define FIFO_DEPTH(i) ((FIFO_LVL_MASK(i) >> 1) + 1)
+#define FIFO_DEPTH(x) (((x) >> 1) + 1)
 
 #define S3C64XX_SPI_POLLING_SIZE	32
 
@@ -197,7 +196,6 @@ struct s3c64xx_spi_driver_data {
 	struct s3c64xx_spi_dma_data	rx_dma;
 	struct s3c64xx_spi_dma_data	tx_dma;
 	const struct s3c64xx_spi_port_config	*port_conf;
-	unsigned int			port_id;
 	unsigned int			fifosize;
 };
 
@@ -1110,6 +1108,37 @@ static inline const struct s3c64xx_spi_port_config *s3c64xx_spi_get_port_config(
 	return (const struct s3c64xx_spi_port_config *)platform_get_device_id(pdev)->driver_data;
 }
 
+static int s3c64xx_spi_get_fifosize(const struct platform_device *pdev,
+				    struct s3c64xx_spi_driver_data *sdd)
+{
+	const struct s3c64xx_spi_port_config *port = sdd->port_conf;
+	const int *fifo_lvl_mask = port->fifo_lvl_mask;
+	struct device_node *np = pdev->dev.of_node;
+	int id;
+
+	if (!np) {
+		if (pdev->id < 0)
+			return dev_err_probe(&pdev->dev, -EINVAL,
+					     "Negative platform ID is not allowed\n");
+		id = pdev->id;
+		sdd->fifosize = FIFO_DEPTH(fifo_lvl_mask[id]);
+		return 0;
+	}
+
+	if (port->fifosize) {
+		sdd->fifosize = port->fifosize;
+		return 0;
+	}
+
+	id = of_alias_get_id(np, "spi");
+	if (id < 0)
+		return dev_err_probe(&pdev->dev, id,
+				     "Failed to get alias id\n");
+	sdd->fifosize = FIFO_DEPTH(fifo_lvl_mask[id]);
+
+	return 0;
+}
+
 static int s3c64xx_spi_probe(struct platform_device *pdev)
 {
 	struct resource	*mem_res;
@@ -1142,34 +1171,20 @@ static int s3c64xx_spi_probe(struct platform_device *pdev)
 
 	sdd = spi_controller_get_devdata(host);
 	sdd->port_conf = s3c64xx_spi_get_port_config(pdev);
+	ret = s3c64xx_spi_get_fifosize(pdev, sdd);
+	if (ret)
+		return ret;
+
 	sdd->host = host;
 	sdd->cntrlr_info = sci;
 	sdd->pdev = pdev;
-	if (pdev->dev.of_node) {
-		ret = of_alias_get_id(pdev->dev.of_node, "spi");
-		if (ret < 0)
-			return dev_err_probe(&pdev->dev, ret,
-					     "Failed to get alias id\n");
-		sdd->port_id = ret;
-	} else {
-		if (pdev->id < 0)
-			return dev_err_probe(&pdev->dev, -EINVAL,
-					     "Negative platform ID is not allowed\n");
-		sdd->port_id = pdev->id;
-	}
-
-	if (sdd->port_conf->fifosize)
-		sdd->fifosize = sdd->port_conf->fifosize;
-	else
-		sdd->fifosize = FIFO_DEPTH(sdd);
-
 	sdd->cur_bpw = 8;
 
 	sdd->tx_dma.direction = DMA_MEM_TO_DEV;
 	sdd->rx_dma.direction = DMA_DEV_TO_MEM;
 
 	host->dev.of_node = pdev->dev.of_node;
-	host->bus_num = sdd->port_id;
+	host->bus_num = -1;
 	host->setup = s3c64xx_spi_setup;
 	host->cleanup = s3c64xx_spi_cleanup;
 	host->prepare_transfer_hardware = s3c64xx_spi_prepare_transfer;
@@ -1250,7 +1265,7 @@ static int s3c64xx_spi_probe(struct platform_device *pdev)
 	}
 
 	dev_dbg(&pdev->dev, "Samsung SoC SPI Driver loaded for Bus SPI-%d with %d Targets attached\n",
-					sdd->port_id, host->num_chipselect);
+		host->bus_num, host->num_chipselect);
 	dev_dbg(&pdev->dev, "\tIOmem=[%pR]\tFIFO %dbytes\n",
 		mem_res, sdd->fifosize);
 
-- 
2.43.0.429.g432eaa2c6b-goog


