Return-Path: <linux-samsung-soc+bounces-1785-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FE184C966
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  7 Feb 2024 12:16:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C86601C25642
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  7 Feb 2024 11:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 700A82555B;
	Wed,  7 Feb 2024 11:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ltc5FP+e"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985CF25567
	for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Feb 2024 11:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707304525; cv=none; b=GvHksqkck+foVPuJg36xETp8rxZ3ZT1nZCYr7QXWMQN23FoJ28nqLbZ8mCs0d23/eiWF+o+b9he0OektHWWYzAlYq4+AO+CNxlg0V2eHOsQ3i1ZkoNiRPIMtMo2R9tAc7Fun+NgbqfjCNAao0eiZ4lCvP+tr2l1Zb309Jjs4cZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707304525; c=relaxed/simple;
	bh=KCJu1OSZJfaNdmlYOfIpiQLu+o/4Z0AQSx7dLWp+QPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iuVAxNqvgs3ypuBYMD4jvTxdbTc5oTb4mlsxKfhKeQBQc7INr+SuHEiyy2tWdhwKLecJ/POMW8auq5tvrphIhQcQdp05qpQQcP2FdndkGyw/QFyjpyb0zpISUXYpDN0SHyGI0DQouhakxsuEHPlxWPZFuL7lk1/8V4ZQiZ2b12g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ltc5FP+e; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40fe79f1aaaso4153775e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Feb 2024 03:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707304520; x=1707909320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7t39Yf75iI8Zz7Da0gHWY0hS9D040rpkcEYE36N/CE8=;
        b=ltc5FP+e3a35xPn/yRH0cWT4kE2WH59/YrFgbPM4RPzXO/4EO5rEwt4Jrb2vCiZUFa
         u6XYcY5w4SWY0d7uAWhH4GiuJ9OHwS9TOBr4lY8FUzx0kmgU6AfbwQcPj83mnxKA+etp
         PPIuwSe7UdqOgihotQMAxtGVopscxs3m66WiE3A/O7XevntIyKgA3uUU4hj6rQY8xBFy
         rqyhX4CwKp+Y2A4184tumKBXoooVBS1niRjsLxWJBh737sIIRbjotVeod6bwKnSdnlBU
         Skxrlbjx4lgT6j3dCE8/Si94+FoMhqGg+LdnzeyDQzWMojx18exbXfKA/2m0exi9PSCG
         G4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707304520; x=1707909320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7t39Yf75iI8Zz7Da0gHWY0hS9D040rpkcEYE36N/CE8=;
        b=g3T/2VTm8Iduv/x0AMrdgj9BVnSS06q4HnYjjSafwtKq2gMY9x1lhWitOqwyAUWiif
         3FfPwX2IhLM63bjX1ZdRCiUO4+cqzT7pzq49801VEjy0OwV5LX4immgRl5gT4D1Ojg3E
         WM+UHN4U9v+qdk1qcml5HFs6YU+RalFP4e0Z8ym8wvKA8g2AMLidx8q0zimeg0nyhlaq
         oKyGMJGyiT0WrM5ud27X0AcuVsNdH7EkPkG901FconMO/G5F75nThj/0tnWEyzXy497p
         U9XKdRGYJxOSsEWB+lTAob7Ve4mTlMdwX64NZUuAXOhpoSXwlES8TFmUsCzw5+TZ1W/O
         5rbA==
X-Gm-Message-State: AOJu0YyNnsJpuV41XpiORcZdtCFQAlIYgJF4u/VpHVJGM1NO77jUm1QB
	GfbMrCugvbvv2NV6upGF2OT0pFOMhs8SM+DHUErRkO8qblTHGydTqPe2RRrn8z8=
X-Google-Smtp-Source: AGHT+IHvAN2LW4qtSL8E+o3i2POjFFbt9vh5tmGZpdfqBeC6vAEw3I415//fMzQ/3R97wixlqTimVA==
X-Received: by 2002:a05:600c:3d9a:b0:40f:c5df:7e5c with SMTP id bi26-20020a05600c3d9a00b0040fc5df7e5cmr4251545wmb.34.1707304520651;
        Wed, 07 Feb 2024 03:15:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVa6m/5UU4O3g2wSaheso82eopRSx0SOovklPjqwHn1OclD1i4QeUHsvCEcCbasWkfbomqzX7gfE33GvIZdrLomXmgrtJ5O3vmzareY8CuRNEl9z4yrGKCtxYbNfhR+LsA3Ku3BzSJPSRvGa1NBSc2WP0rb1dU1Zm3NM4FPlzyvVw5c0Q924iQdidfcx7y1fNHUXqO6lYhVXczjSj/PqmSdsacFr1a8qj0oDNgXNa4T4v5dB6VMq7n0HqhNA89YNY+V2F0EGsMBF7sUl8cL8191xOvla8mRkrRik74VCYxDAThrMN15IDZpIdCcqhsKS9dEZXVg+F2nrJF41oljl383p3/Lumncw7gOmKDN3Y9CqV1fndYVdqHryCEdmwyx34ZIxigyG/8zZckGCFuwSo931BOoaJWWkh/I9TVxUC4xu/BUzbqlr0YVsXtU8Sdd6Q0wE/iK4Ok0TsHF4qIoMHYQVeb69+3CdIyAhRTvE2fEPPpdqSoGmt+txY6LLUWlnGThSgVa00zL1SMOXtC1xrI96XUzyu3l+6hKC3LtSN6euSuiUn/gctCJ4hXQN/EZIh/aw6nx4W8eojEKW/aJHKLSrw==
Received: from ta2.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id l14-20020a05600c4f0e00b0040ec8330c8asm4983260wmq.39.2024.02.07.03.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 03:15:20 -0800 (PST)
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
	robh+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 2/4] spi: s3c64xx: prepare for a different flavor of iowrite rep
Date: Wed,  7 Feb 2024 11:15:14 +0000
Message-ID: <20240207111516.2563218-3-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
In-Reply-To: <20240207111516.2563218-1-tudor.ambarus@linaro.org>
References: <20240207111516.2563218-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are SoCs (gs101) that allow only 32 bit register accesses. As the
requirement is rare enough, for those SoCs we'll open code in the driver
some s3c64xx_iowrite{8,16}_32_rep() accessors. Prepare for such addition.

Suggested-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 7f7eb8f742e4..eb79c6e4f509 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -414,6 +414,26 @@ static bool s3c64xx_spi_can_dma(struct spi_controller *host,
 
 }
 
+static void s3c64xx_iowrite_rep(const struct s3c64xx_spi_driver_data *sdd,
+				struct spi_transfer *xfer)
+{
+	void __iomem *addr = sdd->regs + S3C64XX_SPI_TX_DATA;
+	const void *buf = xfer->tx_buf;
+	unsigned int len = xfer->len;
+
+	switch (sdd->cur_bpw) {
+	case 32:
+		iowrite32_rep(addr, buf, len / 4);
+		break;
+	case 16:
+		iowrite16_rep(addr, buf, len / 2);
+		break;
+	default:
+		iowrite8_rep(addr, buf, len);
+		break;
+	}
+}
+
 static int s3c64xx_enable_datapath(struct s3c64xx_spi_driver_data *sdd,
 				    struct spi_transfer *xfer, int dma_mode)
 {
@@ -447,20 +467,7 @@ static int s3c64xx_enable_datapath(struct s3c64xx_spi_driver_data *sdd,
 			modecfg |= S3C64XX_SPI_MODE_TXDMA_ON;
 			ret = prepare_dma(&sdd->tx_dma, &xfer->tx_sg);
 		} else {
-			switch (sdd->cur_bpw) {
-			case 32:
-				iowrite32_rep(regs + S3C64XX_SPI_TX_DATA,
-					xfer->tx_buf, xfer->len / 4);
-				break;
-			case 16:
-				iowrite16_rep(regs + S3C64XX_SPI_TX_DATA,
-					xfer->tx_buf, xfer->len / 2);
-				break;
-			default:
-				iowrite8_rep(regs + S3C64XX_SPI_TX_DATA,
-					xfer->tx_buf, xfer->len);
-				break;
-			}
+			s3c64xx_iowrite_rep(sdd, xfer);
 		}
 	}
 
-- 
2.43.0.687.g38aa6559b0-goog


