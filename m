Return-Path: <linux-samsung-soc+bounces-1183-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC4A839325
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 23 Jan 2024 16:39:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 307161F23D1F
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 23 Jan 2024 15:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D487E62A18;
	Tue, 23 Jan 2024 15:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cowR9q1N"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F087F61693
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jan 2024 15:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706024084; cv=none; b=irluiQ4+JOQI26nO+t6Dk9C7rva9Wz1HYe+Uy76NxOT/p41gfTbrWHQPkcp3hLMFhwJxeuGKs0ASbqnve9o0MyYq9CDLiYtXYzaNU8ro6kEKq+5ahbnG+BPgZ3oGMZysyMSG9xEeikSfgUEwxVX5mcZ6fHPnvMjdENtVj7v/w2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706024084; c=relaxed/simple;
	bh=11eqkgJUjNPy5+qS5uzzo4B6y2Q0KQYSVIT5ixBCL68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qzNj9J4ex2IsrTppT1U8rv/Q1qNHPB2R6Ew+FzIze8/X/amJwbRseRvPN3trZ0dos3t0bhzXIC/RDc/+JwAJwk1l7l4QxSiI6wm56x5fD0wCNdf7Y6jDho5nfutAHdU5FJGsgeJfk6FlQywDOsvPblNrx/xl9BrvyBwfzKWhPzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cowR9q1N; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40e8fec0968so57577555e9.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jan 2024 07:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706024080; x=1706628880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ut/OStyJerEIXwncXZj/mTgjprtvHDvTLoi9wIIiA8=;
        b=cowR9q1N5OOb/8+IF+LIstEKqYRcfVHg78yhtiu0hKtUqRL8sQfv1AoVZObXOXlKQ2
         RvPFYrHyQenWZfr0jxv/AyEYTiGXdzMrpa+PvVB4sGdEDi29AQGaUDw6kShcCqGbMqLm
         p6ddUcRtUPK9g+ILTY0nb+C5BR3GUmBfMxKF2r1w2ZaNT36edvNaSP8mfpxv0Rl/bTvI
         ybq0biSfkhq0oMW/eYFzDI8jjH+/smOGNJc1uCIBZqKHMOOpSAFmgr/vucQxTFvnKSo0
         RgI2jSit5PjXoLhiUaoRidnQbAheLM2FgHYWdo0HsWuqz3cb1kJxtMO2J2Lr5Qpn3J83
         rssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706024080; x=1706628880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ut/OStyJerEIXwncXZj/mTgjprtvHDvTLoi9wIIiA8=;
        b=Ppv4MJrMIeRWFSlrV4raYc//LvYcKYRK6LKQqW/WDlU1kWHlonRO0tRvRHBgr/G1wS
         EdCQQwLEgN9kE824CvtYpfPTGOpDD4bdlifOIjFSQYpGOY7zkz+hG9H5yzMeQUGOyZ/2
         A3SkUL5ad0v9knQsfC8yzWWaCKjIlP0NNLA8WuYaxJAKR3mezUKpD8etvOHrRkIIoijc
         2EJNmMWVuJQzhCseYW4w5uElcX2egKDTokTMl/uLxuyY6MiKyWyL5uSHBQTosAkytMpq
         F/OUBb8B6DjeLfHIslPp/TRVCqU8rRXbzGV2udUYuhhMyJm8ST02GvPMmv89nzRz4LTw
         V84Q==
X-Gm-Message-State: AOJu0Yzi3fJ3WzzB/oRgF97r2U+wJ+b6Ti2AkEO/zqbhxcAEC4qv/2Yv
	8rrPHP3ZPftDEsjJwEbc6M2Sig6G6PwQ2qyrLz2Q+Ypzu5XGN3OAFHSImqGA+Lg=
X-Google-Smtp-Source: AGHT+IFy5hVqPrTc2wq6yQNAZyI/n9eio2xmFflp5WDTVB2OCH4vhagDSKA9/oRlBzXDGVqen8YdpQ==
X-Received: by 2002:a05:600c:3f97:b0:40e:5263:28a3 with SMTP id fs23-20020a05600c3f9700b0040e526328a3mr258912wmb.52.1706024080218;
        Tue, 23 Jan 2024 07:34:40 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id p21-20020a05600c359500b0040e3488f16dsm42457536wmq.12.2024.01.23.07.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 07:34:39 -0800 (PST)
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
Subject: [PATCH 16/21] spi: s3c64xx: add missing blank line after declaration
Date: Tue, 23 Jan 2024 15:34:15 +0000
Message-ID: <20240123153421.715951-17-tudor.ambarus@linaro.org>
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

Add missing blank line after declaration. Move initialization in the
body of the function.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index f5474f3b3920..2abf5994080a 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1273,8 +1273,9 @@ static int s3c64xx_spi_suspend(struct device *dev)
 {
 	struct spi_controller *host = dev_get_drvdata(dev);
 	struct s3c64xx_spi_driver_data *sdd = spi_controller_get_devdata(host);
+	int ret;
 
-	int ret = spi_controller_suspend(host);
+	ret = spi_controller_suspend(host);
 	if (ret)
 		return ret;
 
-- 
2.43.0.429.g432eaa2c6b-goog


