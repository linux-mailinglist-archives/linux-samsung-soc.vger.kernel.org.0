Return-Path: <linux-samsung-soc+bounces-1806-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D60184CA5C
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  7 Feb 2024 13:08:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7233D1C21163
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  7 Feb 2024 12:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1F005CDCF;
	Wed,  7 Feb 2024 12:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mT5v4Ocz"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD24D5C619
	for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Feb 2024 12:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707307499; cv=none; b=mLgtaMLN5AxehNDqT+Bt2C9kZVwHQTzBeiq4EhC7edUh9/wxwtTOeSx6jon5BGP5hvWIQq3YRukhnzr4g08ED2OnjAwy3R0l+9AiPCVeMTzxg3EZQlSUS9GsSuzmMYF4CRzAV1YFi5b6QaASItFZzUYtlCCEdNUttvQ4yrBgCaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707307499; c=relaxed/simple;
	bh=ckulXwazTQx7hzX1rzxZLEmGDEusbVQn7uqk6rAXD60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RB3y3rs88x6SOlMjAZqWat+2Vv66ZTk9bYLB1VyCQthRSTqAh7URc0xz/YtRsgy15XesQ1avqZfWyxVbxPwpCtugg/HBrOCP4YYYVkkk6B6oJuCSnwvxb1Phf7UPcGpS7g16IXEtKgHP5mQsXaO44XovzdqTu1PJ6om/tnjxetQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mT5v4Ocz; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33b0e5d1e89so484028f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Feb 2024 04:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707307495; x=1707912295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUmZIG7rbdoejZJeYccC+uC3nddcIt5ul4UQ/BCMGCc=;
        b=mT5v4Oczlh8E6ZPv+NMOSRtCA/6I+kf2+RHgdjQjupbQgqts1wH0FDeYHzzijk8abc
         FzZUBxoml8gMKq8041w0xGhasVn55I4SgVIPds8Vei/l8qEmw4x3v2YDV/rtjoXl+MZU
         DN2i4m36kCKnIHltCTyeC0+3KJNN+zKuh2adY5O9lwlTdXu/fFwTOuedcXGhNcqJd1HS
         5HYSOw5IQ7JQ7eWf1bBxUfm9iO5nYj6FffK8ycAk7/ySpS3O8P3Y6F4z7bmovOzTpy3Z
         Pfsy8KacguRNYy7hPqbpMAQPyFjen9JJ7yckwLWkhaadTGYEIY7mdzAvqSkXOa6y7YnN
         KEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707307495; x=1707912295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MUmZIG7rbdoejZJeYccC+uC3nddcIt5ul4UQ/BCMGCc=;
        b=ufWxUo1lByK0eIdjjPJ9+72sUAZMgWjDjMd9JIL6QEvOB2q4D+Vlw4hBfeCKS16pSk
         XER6Q7pgoM4+tVBBVKQ1cdKVX0M6q42Z28UlaW4LLvtQXgw7ke8Xcl5Ah3zAgg2FQbBp
         Uhdhq3wULEivJ40RDVl+KAC5l4XBVpOrD+lDJHJPGTLGJCSuP3NMEAZs4RUsgSMDYqW7
         CK1aaA+DfV6CaeSsobmZ2BG9oZ+tpoOMSL+/G+G5j0AIfwKtUVZz2RSkB12RGlmki1Gk
         6LX+k6gmU3uvkSONzuN8Nds5Xus/LVm6yLnZGKRMxffFqgKwQTwbB2sjMqGQUGWhslM+
         pB4w==
X-Forwarded-Encrypted: i=1; AJvYcCUqU3HY+VyA7Gpqxb4iu6pOeG4a8F4BXnfKY4/kfU5KCS/Xvg6R9QS5ckDaWve+ai23bX/TAIg3zhJkOWOv7DsAWSjAx4basuU9KwhS2kVN/jI=
X-Gm-Message-State: AOJu0YxpQzFGDp40EUW7UnhhlaXQ95rBn4VOOdamhnqPJYg3KSo/+KEU
	saqAJYi9uNXUz/jlglGLeOOVWSDvlYLQgIiLhfp4i4sAMZw9kVOBvxOFMXnm1Lc=
X-Google-Smtp-Source: AGHT+IFD11KuiTyToxxU7V5ynwF5qtWYXKNpZ+ojCpcavXuhHfNCiW/EREgR8+OsmdJvTBADWjVmyQ==
X-Received: by 2002:adf:ef04:0:b0:33a:ecd6:1c71 with SMTP id e4-20020adfef04000000b0033aecd61c71mr3025707wro.56.1707307495029;
        Wed, 07 Feb 2024 04:04:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVYQvziI5mjEusSUaPhP14qhlm9p6zZIwfAk9T60Ma8Qt9fo0WfkTkJE5aFzp5O0QnfJ9FsuPRg5L3EWDvoHxvS1u2LIHGmb9+GaXZGkalH96i1KuSzJ2PHrFzC1Z9ZSG7ULlemCcI4HWyUgGHyxfI3p31aAQqC4KUwNvA4YRmsxASse05A+LOIXIxFW4wCuE5svHwtKBbHzek3At+QYTTmMnk5w9CivZkq9eYHcGU6dz4YznaGGNPH2iqZUnhPV/9SUexh9ATwMobHeHQjWeF9zlVTKItiotmBwHDCmDLPO5JWYkbfXb3fBTuKNtqc+7cdVxKhtr7N3teqFKtgHMx3CGHIj9NE3WYL+3szXb0N16BXyfWYXWKfSOLdfklfCCoCvuHHNydQwU7AitaevZyAS6vS2Mi5M1rtscaMdFlZoFMcfQyBNq5YTx6/QNEqQ3EnUEkfNT8JRcSL6UZBlge+a104Zc/3rABjxGaZSyyqJ84lPqBhJRAU9D6BAA==
Received: from ta2.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id d15-20020a5d644f000000b0033b44a349e1sm1349967wrw.38.2024.02.07.04.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 04:04:54 -0800 (PST)
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
Subject: [PATCH v5 17/17] spi: s3c64xx: drop a superfluous bitwise NOT operation
Date: Wed,  7 Feb 2024 12:04:31 +0000
Message-ID: <20240207120431.2766269-18-tudor.ambarus@linaro.org>
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

val &= ~mask;
val |= mask;

is equivalent to:
val |= mask;

Drop the superfluous bitwise NOT operation.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index b618efba0509..6f29dca68491 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1129,7 +1129,6 @@ static void s3c64xx_spi_hwinit(struct s3c64xx_spi_driver_data *sdd)
 
 	val = readl(regs + S3C64XX_SPI_MODE_CFG);
 	val &= ~S3C64XX_SPI_MODE_4BURST;
-	val &= ~(S3C64XX_SPI_MAX_TRAILCNT << S3C64XX_SPI_TRAILCNT_OFF);
 	val |= (S3C64XX_SPI_MAX_TRAILCNT << S3C64XX_SPI_TRAILCNT_OFF);
 	writel(val, regs + S3C64XX_SPI_MODE_CFG);
 
-- 
2.43.0.687.g38aa6559b0-goog


