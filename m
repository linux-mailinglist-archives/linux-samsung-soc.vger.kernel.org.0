Return-Path: <linux-samsung-soc+bounces-1238-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC85083B6AB
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 25 Jan 2024 02:37:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 627A62818BF
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 25 Jan 2024 01:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72F2710A01;
	Thu, 25 Jan 2024 01:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XqAL1TUh"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA4EDDB9
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 01:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706146548; cv=none; b=PR7zv39O8qYm8xzWFqagLQsNdxC49RmaLJQmkSeRHS1AW9CmI4G2hb0p0sC3QQ65+bEmrnj+TV6uITIKRZhNMbuw71gTwgk/wxGz8x4BOz/kOhCdr/NbG3VCh1kHYAvp8HGciXPgCWWcB1rHgTeCdT8NllxhMih8sPAdwfJUP1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706146548; c=relaxed/simple;
	bh=1F1Aj5cUnjbKZW0MFBSCuoAq2nQMH9+wqAVLv2/faSE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FjjcMqBPLcL9S+orcnBXUqmFM4vunsRwwNV0z6N0rhDDauLDAocrbVf7SQFedELkhDaGw8VZG28fMuuOWBM3xSy8JWHOuOlgebm6OluHVXyoBIcCrHJihtC+4I+EfeayqXoamJi6uiz9MFMgHDK8SZhsFieREwVX9j+ntmjnBWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XqAL1TUh; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3bba0ac2e88so155319b6e.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Jan 2024 17:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706146546; x=1706751346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjuRSpcIWXYqOZvjAWqHzFzzwLvT3n28RLPhePkG0iw=;
        b=XqAL1TUh/Hj2SWsT/wrAGfwLjM3wFoOIQJcB2Lz3/AvntXclQN1vLys4EPn5GxhRp9
         gu22v4OIP3BIYB7rlqHatR63ourz23I6ePwj1+id42/RY/x9ZYxVR3qLx9EIxX54By6O
         89P3KrQB8u8k6hh84NB1GdZmbwcHMLFOtDbiT7TdNvqu+mhoq27aLAzO353OXY1slM4M
         Hu59AFOfobG/vATfkf5gWEoQaPfv+PwC7A3iBVl2lFAb0XEhM9AatBraBmzUzGUEy0h0
         vwlU7e3VQ0NenPFsYnO68uC/BqqwFSDgYeikjP3pziolZ6jQ1DvKA3P4oK03oS41uDO8
         biAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706146546; x=1706751346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mjuRSpcIWXYqOZvjAWqHzFzzwLvT3n28RLPhePkG0iw=;
        b=PShww3iLtD49E5iAQQHjcFAoQ2chagkytDBjHm6H3GbJT6Qn+mqxl3tKpGcv18nLee
         YFm/NZWVaIIx5V8ksJV2oNvCPxCRyRVvtJSt7tqDOsZMiLQUlvBiU7XTcBZtPKw/qhh7
         6WuwJpH7hhoix3jV99h6DkN1FM65/TN68GIhXY7SRhjvEmkOERcoqK/4wLd0drjFmN7q
         Umc9WJgcgcNJmHBBzM7sks4THVKcaEdnayNYay7Z28EgRL5OleyE0hgVOtEQr1atCPB+
         NhVPfGXqVA2VgLZ4jNxuZ+WYUVZEsgolbkgX8WQ/HjSKx0rhBR8coWOsLMhJe+F2xLIh
         67HQ==
X-Gm-Message-State: AOJu0YwUsym3wVcpVelOxlnv8NR5C8ZU1iRbkoeal+FPBA+1P4BBBFb9
	7Cw9pV197oEZKs8Fff4HBj9CBd6ctM2vh1JnMk1r9jairAWHWWqdw+D+tmkACwcR3yGhcUq4/Sb
	d
X-Google-Smtp-Source: AGHT+IF1NjOAcZlzFenDqy/+nk1Kq9lvw6v6ZRFazJxCZbfcK9ZwgvkBymMMDhSaM/QVllJw7mJRjQ==
X-Received: by 2002:a05:6808:309c:b0:3bd:cd84:d119 with SMTP id bl28-20020a056808309c00b003bdcd84d119mr231759oib.5.1706146545915;
        Wed, 24 Jan 2024 17:35:45 -0800 (PST)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id k10-20020a056808068a00b003bda3125e3csm2446127oig.48.2024.01.24.17.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 17:35:45 -0800 (PST)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/2] spi: s3c64xx: Add Exynos850 support
Date: Wed, 24 Jan 2024 19:35:43 -0600
Message-Id: <20240125013543.31067-3-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240125013543.31067-1-semen.protsenko@linaro.org>
References: <20240125013543.31067-1-semen.protsenko@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SPI port configuration for Exynos850 SoC. It has 3 USI blocks which
can be configured in SPI mode:

  * spi_0: BLK_PERI_SPI_0 (0x13940000)
  * spi_1: BLK_ALIVE_USI_CMGP00 (0x11d00000)
  * spi_2: BLK_ALIVE_USI_CMGP01 (0x11d20000)

SPI FIFO depth is 64 bytes for all those SPI blocks, so the
.fifo_lvl_mask value is set to 0x7f. All blocks have DIV_4 as the
default internal clock divider, and an internal loopback mode to run
a loopback test.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Changes in v2:
  - Collected R-b tags

 drivers/spi/spi-s3c64xx.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 432ec60d3568..7f7eb8f742e4 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1460,6 +1460,17 @@ static const struct s3c64xx_spi_port_config exynos5433_spi_port_config = {
 	.quirks		= S3C64XX_SPI_QUIRK_CS_AUTO,
 };
 
+static const struct s3c64xx_spi_port_config exynos850_spi_port_config = {
+	.fifo_lvl_mask	= { 0x7f, 0x7f, 0x7f },
+	.rx_lvl_offset	= 15,
+	.tx_st_done	= 25,
+	.clk_div	= 4,
+	.high_speed	= true,
+	.clk_from_cmu	= true,
+	.has_loopback	= true,
+	.quirks		= S3C64XX_SPI_QUIRK_CS_AUTO,
+};
+
 static const struct s3c64xx_spi_port_config exynosautov9_spi_port_config = {
 	.fifo_lvl_mask	= { 0x1ff, 0x1ff, 0x7f, 0x7f, 0x7f, 0x7f, 0x1ff, 0x7f,
 			    0x7f, 0x7f, 0x7f, 0x7f},
@@ -1514,6 +1525,9 @@ static const struct of_device_id s3c64xx_spi_dt_match[] = {
 	{ .compatible = "samsung,exynos5433-spi",
 			.data = (void *)&exynos5433_spi_port_config,
 	},
+	{ .compatible = "samsung,exynos850-spi",
+			.data = (void *)&exynos850_spi_port_config,
+	},
 	{ .compatible = "samsung,exynosautov9-spi",
 			.data = (void *)&exynosautov9_spi_port_config,
 	},
-- 
2.39.2


