Return-Path: <linux-samsung-soc+bounces-1186-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D80A8839335
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 23 Jan 2024 16:40:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0908A1C27462
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 23 Jan 2024 15:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C4686350A;
	Tue, 23 Jan 2024 15:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bUeanOUb"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C9563117
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jan 2024 15:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706024088; cv=none; b=gLooBrq+ief/k1c+EOmiu+2l4QbD748IhwnCY1lZPz1EIQ54WwH0zcTNHKn1T3D9vB6TzOd5RWXIQxy4QHj8C11fjPX48leDlsofHWgyg8Jeiphx4xMIupUUMdQ9UJS3dTF5bzorq2cGsHAAZWAXvavcVbHbZmi0poXuYErXBm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706024088; c=relaxed/simple;
	bh=zV6wQba5ZydC+3UAzivKAIaOOZg18PQ0Icl7PX8EE/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mD0Tc/FUejPZzz8tm3J3EXsNYIPqG64KliJKTm3/HfOzSq5XrP9nxRzNb/Ig81NEgl/OevIO08SowgMH8aW2ESQyrCd+B56pQuVVBPHohi/XNEHeV4ir4WNrplvqFeT+lo8J3ho/HAQQh2LhRXFeX+3biPu1zl+fJinthwxEWBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bUeanOUb; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40eb99a72dcso8388855e9.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jan 2024 07:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706024084; x=1706628884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spZW8S0GVeUeUaVNEXaPIDC8+SPXAmAjIvuVT5xHfKI=;
        b=bUeanOUbuRmqli7MubR8O0sqSQzpZfIC7uih+WZcdZXfmmKJkGi6uoN5/5/uxhbVo7
         zQk9CBlBmSaELa8QZWyRVuENX0j8hTfU839poCCzU3fFXkYHANV6j/TIBM/GwvhEPOk6
         o3xdxky/0xj9bW/C3TPxbrzO9E8WUPfyqafK0DeTYAhfXPnR1mUE02Y/8rZyu66aMLxo
         4ixEJi9dSToLu9I6zZKd/DXgjNW4SgLjZyrF4gEy8yqQuiSWI0rBlBxXIor0gXiaUubB
         H81K8iMjC5vIadcFx1+XYpr0o3pqET4yw/Q97Bs3OAShG4SAjwGutUJ2ObPsuJDscxhP
         60YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706024084; x=1706628884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=spZW8S0GVeUeUaVNEXaPIDC8+SPXAmAjIvuVT5xHfKI=;
        b=CRYJyK8I5NLTw+RNch0HAXtC7Its69vj0agMRo3xtEa2UFYmA1eu3shexLi9YCEmiu
         gGPh3ieaDLwlBFMwsI0Dli7AI0JTQt8BYtcsQbtIsqbzWLt4s2LRpaA2mjNBQ4IuHLmt
         BLRu6HyJggHpJ1FXNC+oH7OqcVHMITrkY9ZSoUoPc3U4Mrd8C2k7i+ioXZY4fb5xWAq8
         LqyrnUxFfu9h6HggVHEfHCSAFIXEHfA8+iW4UCo9n65yNIIUVWuYtfuOOhpk18U3reWW
         K4H5vYu1dj3P/ZcZzI1i5jrE2MXv9kWnbRHL5T3sZpYFQl+fZ6bpRhiNDVzpmEutmWaw
         Q/PQ==
X-Gm-Message-State: AOJu0Yyxti8+ph4eTxXu1C2X9VG+jSnVFRnw9jprAP4WgWr/cNwkRa2r
	slLW7JLiQfdHmwd47MTjDuOzQHfVYsSjS+oQXyAEkYaJPToI4Jisff/UoMpjbZRJ9gvKVWd1gYe
	HNAk=
X-Google-Smtp-Source: AGHT+IEwGHIZco2gJ7iHs+3ejOlkItskw5CNIOEGW9+nHZyAIdrwcgrVKi17dDetE+hV66X5PLQAKA==
X-Received: by 2002:a05:600c:a46:b0:40e:5598:a6f3 with SMTP id c6-20020a05600c0a4600b0040e5598a6f3mr258341wmq.124.1706024084020;
        Tue, 23 Jan 2024 07:34:44 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id p21-20020a05600c359500b0040e3488f16dsm42457536wmq.12.2024.01.23.07.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 07:34:42 -0800 (PST)
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
Subject: [PATCH 19/21] spi: s3c64xx: add support for google,gs101-spi
Date: Tue, 23 Jan 2024 15:34:18 +0000
Message-ID: <20240123153421.715951-20-tudor.ambarus@linaro.org>
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

Add support for GS101 SPI. All the SPI nodes on GS101 have 64 bytes
FIFOs, infer the FIFO size from the compatible. GS101 allows just 32bit
register accesses, otherwise a Serror Interrupt is raised. Do the write
reg accesses in 32 bits.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 50 +++++++++++++++++++++++++++++++++------
 1 file changed, 43 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 62671b2d594a..c4ddd2859ba4 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -20,6 +20,7 @@
 
 #define MAX_SPI_PORTS				12
 #define S3C64XX_SPI_QUIRK_CS_AUTO		BIT(1)
+#define S3C64XX_SPI_GS1O1_32BIT_REG_IO_WIDTH	BIT(2)
 #define AUTOSUSPEND_TIMEOUT			2000
 
 /* Registers and bit-fields */
@@ -131,6 +132,7 @@ struct s3c64xx_spi_dma_data {
  * @rx_lvl_offset: Bit offset of RX_FIFO_LVL bits in SPI_STATUS regiter.
  * @tx_st_done: Bit offset of TX_DONE bit in SPI_STATUS regiter.
  * @clk_div: Internal clock divider
+ * @fifosize: size of the FIFO
  * @quirks: Bitmask of known quirks
  * @high_speed: True, if the controller supports HIGH_SPEED_EN bit.
  * @clk_from_cmu: True, if the controller does not include a clock mux and
@@ -149,6 +151,7 @@ struct s3c64xx_spi_port_config {
 	int	tx_st_done;
 	int	quirks;
 	int	clk_div;
+	unsigned int fifosize;
 	bool	high_speed;
 	bool	clk_from_cmu;
 	bool	clk_ioclk;
@@ -175,6 +178,7 @@ struct s3c64xx_spi_port_config {
  * @tx_dma: Local transmit DMA data (e.g. chan and direction)
  * @port_conf: Local SPI port configuartion data
  * @port_id: Port identification number
+ * @fifosize: size of the FIFO for this port
  */
 struct s3c64xx_spi_driver_data {
 	void __iomem                    *regs;
@@ -194,6 +198,7 @@ struct s3c64xx_spi_driver_data {
 	struct s3c64xx_spi_dma_data	tx_dma;
 	const struct s3c64xx_spi_port_config	*port_conf;
 	unsigned int			port_id;
+	unsigned int			fifosize;
 };
 
 static void s3c64xx_flush_fifo(struct s3c64xx_spi_driver_data *sdd)
@@ -403,7 +408,7 @@ static bool s3c64xx_spi_can_dma(struct spi_controller *host,
 	struct s3c64xx_spi_driver_data *sdd = spi_controller_get_devdata(host);
 
 	if (sdd->rx_dma.ch && sdd->tx_dma.ch)
-		return xfer->len > FIFO_DEPTH(sdd);
+		return xfer->len > sdd->fifosize;
 
 	return false;
 }
@@ -447,12 +452,22 @@ static int s3c64xx_enable_datapath(struct s3c64xx_spi_driver_data *sdd,
 					xfer->tx_buf, xfer->len / 4);
 				break;
 			case 16:
-				iowrite16_rep(regs + S3C64XX_SPI_TX_DATA,
-					xfer->tx_buf, xfer->len / 2);
+				if (sdd->port_conf->quirks &
+				    S3C64XX_SPI_GS1O1_32BIT_REG_IO_WIDTH)
+					iowrite16_32_rep(regs + S3C64XX_SPI_TX_DATA,
+							 xfer->tx_buf, xfer->len / 2);
+				else
+					iowrite16_rep(regs + S3C64XX_SPI_TX_DATA,
+						      xfer->tx_buf, xfer->len / 2);
 				break;
 			default:
-				iowrite8_rep(regs + S3C64XX_SPI_TX_DATA,
-					xfer->tx_buf, xfer->len);
+				if (sdd->port_conf->quirks &
+				    S3C64XX_SPI_GS1O1_32BIT_REG_IO_WIDTH)
+					iowrite8_32_rep(regs + S3C64XX_SPI_TX_DATA,
+							xfer->tx_buf, xfer->len);
+				else
+					iowrite8_rep(regs + S3C64XX_SPI_TX_DATA,
+						     xfer->tx_buf, xfer->len);
 				break;
 			}
 		}
@@ -696,7 +711,7 @@ static int s3c64xx_spi_transfer_one(struct spi_controller *host,
 				    struct spi_transfer *xfer)
 {
 	struct s3c64xx_spi_driver_data *sdd = spi_controller_get_devdata(host);
-	const unsigned int fifo_len = FIFO_DEPTH(sdd);
+	const unsigned int fifo_len = sdd->fifosize;
 	const void *tx_buf = NULL;
 	void *rx_buf = NULL;
 	int target_len = 0, origin_len = 0;
@@ -1145,6 +1160,11 @@ static int s3c64xx_spi_probe(struct platform_device *pdev)
 		sdd->port_id = pdev->id;
 	}
 
+	if (sdd->port_conf->fifosize)
+		sdd->fifosize = sdd->port_conf->fifosize;
+	else
+		sdd->fifosize = FIFO_DEPTH(sdd);
+
 	sdd->cur_bpw = 8;
 
 	sdd->tx_dma.direction = DMA_MEM_TO_DEV;
@@ -1234,7 +1254,7 @@ static int s3c64xx_spi_probe(struct platform_device *pdev)
 	dev_dbg(&pdev->dev, "Samsung SoC SPI Driver loaded for Bus SPI-%d with %d Targets attached\n",
 					sdd->port_id, host->num_chipselect);
 	dev_dbg(&pdev->dev, "\tIOmem=[%pR]\tFIFO %dbytes\n",
-					mem_res, FIFO_DEPTH(sdd));
+					mem_res, sdd->fifosize);
 
 	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
@@ -1362,6 +1382,18 @@ static const struct dev_pm_ops s3c64xx_spi_pm = {
 			   s3c64xx_spi_runtime_resume, NULL)
 };
 
+static const struct s3c64xx_spi_port_config gs101_spi_port_config = {
+	.fifosize	= 64,
+	.rx_lvl_offset  = 15,
+	.tx_st_done     = 25,
+	.clk_div        = 4,
+	.high_speed	= true,
+	.clk_from_cmu	= true,
+	.has_loopback	= true,
+	.quirks		= S3C64XX_SPI_QUIRK_CS_AUTO |
+			  S3C64XX_SPI_GS1O1_32BIT_REG_IO_WIDTH,
+};
+
 static const struct s3c64xx_spi_port_config s3c2443_spi_port_config = {
 	.fifo_lvl_mask	= { 0x7f },
 	.rx_lvl_offset	= 13,
@@ -1452,6 +1484,10 @@ static const struct platform_device_id s3c64xx_spi_driver_ids[] = {
 };
 
 static const struct of_device_id s3c64xx_spi_dt_match[] = {
+	{
+		.compatible = "google,gs101-spi",
+		.data = &gs101_spi_port_config,
+	},
 	{
 		.compatible = "samsung,s3c2443-spi",
 		.data = &s3c2443_spi_port_config,
-- 
2.43.0.429.g432eaa2c6b-goog


