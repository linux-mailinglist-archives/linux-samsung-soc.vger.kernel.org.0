Return-Path: <linux-samsung-soc+bounces-7144-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAE1A49B64
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 28 Feb 2025 15:08:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F49C3BCA0E
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 28 Feb 2025 14:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D5026F47B;
	Fri, 28 Feb 2025 14:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z+VN4RK5"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9463126FA44
	for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Feb 2025 14:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740751651; cv=none; b=ma1BM/5NiagUILNg5OVzCoXOrDd7groJURNRN7tsqaoR+X8/0w57YoTHmDUMLNYe8+csceAiseSQ+czLFn7sUptA2P/4eVwWdt7+lj998cPcJeZ+3BNWg4OjNJyB1kyTl8Bbt8HJpR3hso6px0+8COP3kzemMgDwvsfhvNO/xGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740751651; c=relaxed/simple;
	bh=O7YHK/iXPLW7JvXPCw3QSGcpCg8mcQhvQ7AlODxEgPY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qj1a+GTIJFTzBoRnRLrf9a4tpztqKYKc6L7Hd/lZUAvxl9ul/Ug1Kg5Bgc20RA6JdCRy2Ezo5HjZmoFW1NaKpgs4WsgLlA3U86QeYPlkE7kI1b13/NKnRk6dusrNmHR8vHOpnG6sQjg0BPrLW1zXnRYxBUILu2FX1f882QCO4Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z+VN4RK5; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-abf3d64849dso62141066b.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Feb 2025 06:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751647; x=1741356447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GfBBNFFxoATgsY5PG9x5TDiO1XW3it+ha4dH0f4d6kY=;
        b=Z+VN4RK59krIT3waDSPSbEWZAyx6zqp3HUFfoSFdq6wjod9nTg12bk2ryRv2wO8j0f
         T7btJSJ5CiEdciiIjwWy/3LBBsMDXLGARfTGlzAKG0VNtH5VgtFcLdahGKvBc8WNyOwH
         irs4kAbonhFXXBe8haerPUztkXUOVo8Lo5ONClcEL0va9eTsPwKEinocHpzTT+Q08yhj
         6COI93jWuujaSskSsjI79il/hyDuqAWt8I++VcLKXQuJOHITPgKQYK/eZHPiprWWOf6Z
         ri96wOmlg90EIDCQpNfpe3CDl6JEcLYM4HR72lB8vgUyGv4i3/iBnZ5GcYz0gKKtneYH
         cAdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751647; x=1741356447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfBBNFFxoATgsY5PG9x5TDiO1XW3it+ha4dH0f4d6kY=;
        b=sCljDATbjIXk6C+1mDleuvLkkoO6B6gWKyPRDZm16u5dcHiPLkYSZHfhGudanwnRnm
         36h07Mp9q2IWO9xCDHgZLYA3i50TgD2xr8+rsIVQ4FdjU0WL0XWDQz3JrF39STfvHInV
         //EI7X9XKwUe6yWg36dPkQye43EU9FOYqkT91Sxk+SOvZXL5/e5T/5SkXHxigRq+Sk9A
         44a09d7i7ZcqXQ8stWAtfmWd4hdm/+piyaqh752uiODvwXYUisplclPV7Q5OOZx/NQwL
         y7nPjoEO+jit0cSRYgkjo2Vnk7FJOBFtj1WDYBbwv2ad04jhGvUMmZVw3xU9oPrMZSRe
         EJhA==
X-Forwarded-Encrypted: i=1; AJvYcCXi025j3mCbqS6AX/DPFpVHQV2U8ZTUzhspszOZ7lnz3Zryv8CqvOwOGa1XXWpgF3gKqydw3x+eeh8zqlH2FyxHGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yww6lS7J4aUkTHz4QAV0RXeffhzLIvsXcL0wzGO8Ys6yOpO05XJ
	7Mb7ZMhBRNUeIDJRMG+OeOiXWtm5FGor5xtC+Kqf/HrmYVJPIp+jfim2pmOZ6Z8=
X-Gm-Gg: ASbGncvC4YzAGPdbnD6wlog0raNHrE1Ko9t7MQku5AmmaVpwJItncZMDLZEuqMZRsLi
	J8pl+en0rIuMOte1hiFMYESMKQWQkoc0aasjMYqIlx9InTpPjr0kaChBgZ1s40B7rTF6VB7pC9G
	apaFamGK61sVaqohwNBpgkazaRCIGkC3pp5cBR6NIsY7a44Fuy+K4R8iIPVYIllIHpEwrAEqnWY
	AAZSVgKTmwZdp2YuKuiVuf+wiS2zgdI1t5MBJlhYlcBqGwBuz2qFwKhSiBw0BohSSs7V1U6YFWj
	l0/VagXQmnKOAVMklArITZ8+BkRqppBRrvCw0uKcup1fCeYzO/Pfggn1mDjm2bD5T7daPJMbcRz
	lARH6R2JIIw==
X-Google-Smtp-Source: AGHT+IELhJPOd4W0qPAgNgABcD5moXsKlcKW8ZKlMd0/6RuVXfSWqRkHz67gqaNmak1AZcnDjWmnpg==
X-Received: by 2002:a05:6402:50d0:b0:5e0:818a:5f4d with SMTP id 4fb4d7f45d1cf-5e4d6b628aamr8322653a12.28.1740751646827;
        Fri, 28 Feb 2025 06:07:26 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:26 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:21 +0000
Subject: [PATCH 08/18] rtc: meson: drop needless struct meson_rtc::rtc
 member
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-8-b44cec078481@linaro.org>
References: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org>
In-Reply-To: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>, 
 Dianlong Li <long17.cool@163.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The memory pointed to by the ::rtc member is managed via devres, and
no code in this driver uses it past _probe().

We can drop it from the structure and just use a local temporary
variable, reducing runtime memory consumption by a few bytes.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-meson.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-meson.c b/drivers/rtc/rtc-meson.c
index db1d626edca5fbb590f26c1cdd0774d350244a99..47e9ebf58ffc2f2b6c65932f8ec3773a213a62ef 100644
--- a/drivers/rtc/rtc-meson.c
+++ b/drivers/rtc/rtc-meson.c
@@ -59,7 +59,6 @@
 #define MESON_STATIC_DEFAULT    (MESON_STATIC_BIAS_CUR | MESON_STATIC_VOLTAGE)
 
 struct meson_rtc {
-	struct rtc_device	*rtc;		/* rtc device we created */
 	struct device		*dev;		/* device we bound from */
 	struct reset_control	*reset;		/* reset source */
 	struct regulator	*vdd;		/* voltage input */
@@ -292,6 +291,7 @@ static int meson_rtc_probe(struct platform_device *pdev)
 	};
 	struct device *dev = &pdev->dev;
 	struct meson_rtc *rtc;
+	struct rtc_device *rtc_dev;
 	void __iomem *base;
 	int ret;
 	u32 tm;
@@ -300,16 +300,16 @@ static int meson_rtc_probe(struct platform_device *pdev)
 	if (!rtc)
 		return -ENOMEM;
 
-	rtc->rtc = devm_rtc_allocate_device(dev);
-	if (IS_ERR(rtc->rtc))
-		return PTR_ERR(rtc->rtc);
+	rtc_dev = devm_rtc_allocate_device(dev);
+	if (IS_ERR(rtc_dev))
+		return PTR_ERR(rtc_dev);
 
 	platform_set_drvdata(pdev, rtc);
 
 	rtc->dev = dev;
 
-	rtc->rtc->ops = &meson_rtc_ops;
-	rtc->rtc->range_max = U32_MAX;
+	rtc_dev->ops = &meson_rtc_ops;
+	rtc_dev->range_max = U32_MAX;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
@@ -365,11 +365,11 @@ static int meson_rtc_probe(struct platform_device *pdev)
 	}
 
 	meson_rtc_nvmem_config.priv = rtc;
-	ret = devm_rtc_nvmem_register(rtc->rtc, &meson_rtc_nvmem_config);
+	ret = devm_rtc_nvmem_register(rtc_dev, &meson_rtc_nvmem_config);
 	if (ret)
 		goto out_disable_vdd;
 
-	ret = devm_rtc_register_device(rtc->rtc);
+	ret = devm_rtc_register_device(rtc_dev);
 	if (ret)
 		goto out_disable_vdd;
 

-- 
2.48.1.711.g2feabab25a-goog


