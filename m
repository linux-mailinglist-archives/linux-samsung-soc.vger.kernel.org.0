Return-Path: <linux-samsung-soc+bounces-7248-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7F5A4E90F
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  4 Mar 2025 18:35:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FAB917603B
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  4 Mar 2025 17:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DAE728FFCA;
	Tue,  4 Mar 2025 17:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bgPOHsqR"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76E828D070
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Mar 2025 17:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107938; cv=none; b=F8Vv5JBSgWfyGFA0qZjb5JfNauQmi0Gi98UhZp2wC1IBiMEuMv+tR0p7p171J2OKjZIpDJA3QZQ7R537OFGVz0TjcLSR5NJHBvf6x/VoLAZ3ubt/IzhmLfTOhSabsSzWAhPDL7cWiQlCcR3PnMYd+i4yxAny3tjjdexfKjkBFFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107938; c=relaxed/simple;
	bh=ako7uKkoy0pcKOqw3JaomEgmXiZMMPwkguXI68dLj6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=piU4q9HhVuTUY/Cnmtu+ySsBNdFoRMq3lGalnIGn7HtA5ua4oWUSpV9Aotuwq9rITy8r4SOEHeLABfsG19zBKWus8ldgRv6/VZEQJ6wX9uZN7PojL3sV5sTSGJJGT5ijXMtdm+47yGfaABeg4z3x2USpStxniL63xCfJT+poRqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bgPOHsqR; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e0813bd105so9364090a12.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Mar 2025 09:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107934; x=1741712734; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PnUvUu9cMY/Mxw4Q1sllPthcln3NtgGY7cjKJANyPvk=;
        b=bgPOHsqRQxEF2wX44C1FeYmeboblVNTv4TRe0zTDsWDyWKxbYq4M0KU4YMxFBKkZvh
         AVpwTrTIA8prX++JKc1bK1LzaGP0VaiwOK41bYz5yYmUNxKMgfPkaVr6IiUW4qRrPzzm
         hRwtkBuQMPcWiTrRUD7x7Ov5vef6tyuGjTqSJQ7t0ofbReduJp0qJLEHjNrIkarf9QC+
         +xVaMmW53ODzxCKWIe+BaQL0B/191VL87RFNcUANzzpIsUn0w6BatW0ZWD5k81gMGfe1
         k7sws2WpIkGrenpZA0Ghaknwn2TYt7slPg7pKzUHMefnnXa1UIrnh+jAU4LGH9/WGYzh
         V8Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107934; x=1741712734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PnUvUu9cMY/Mxw4Q1sllPthcln3NtgGY7cjKJANyPvk=;
        b=KTLDmOmNSivjSYfSrLq2Ps/fXIwziuBQM8/Z1ySwoFaWsy2Q8iAO2y3JP9qYK3Nvri
         jlZ6TuXHzOLJP9cCISQElAF22nBHaJ+aRFju2cHkRbYkgd7gD3GSl2xaQj29OgY25LXq
         +hpsIDx93f7DgfA7ijTabYpo0uAcURxiDcnA8OQpi9IrRon/znZZ2EyLkZJH1McmHjGZ
         UbynzHalqLPcHEMtapFpTZcxCtgqYll01eEZvHjn6shqcgQJXC2MV5aNcleknOav8mia
         Uw9jOBCqTrDhicXLUSx+glBnzilBsE6zUM+VpZ3pdxHqkTJ4nCI9bpichJK9m+XdrHRr
         idFA==
X-Forwarded-Encrypted: i=1; AJvYcCURlnNCLMHX8Nd3kW0udJtzOJIBZ/6I6vDdCSgwyjnWidPQaRxUAYSjGz6b2u9GWpyrecnvlMcK4YxsJCQ/umDs9A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/1Jc2O/rkhVGHgy09EUOaipmk58l51l5W+H/YSSn4dvC4YPlF
	v+twabJYS4/Go5gFOF8+4E++J2p/+kEMHVb+bTwFPBgiVxLifGdn8G5eehctndv64sAJFPGGTeT
	xTZs=
X-Gm-Gg: ASbGncsnZNkHenGIspRFNtOrPfWt3Rm7+KGKBTpgUMNXONwflLuWyDXszI+ftSKxFkT
	bgNNTApA4Zg100pxY9dOgQ2yUmr0ndFkf4W40jAaA317mYC1j+eFOLi/whAPp1iXawpRITQZ/jf
	9WlhAryRwuQL+7ckD90Ihyu9PcmfPoUTpc3oSAO2LbkQ+6vUegbtAxgIlKOOkA/BJpJrtxmEDKU
	JX5ZjkVEjDjGejlYAFx4KB9aCL45vEFxeZ65ooKjdaLBGSE+rod//5iPy65Y38C/VLI67+UhgIp
	q8jAJ0SCBS1u003aN9W6qq1eBs7fXRBV3AOuQ/efxeqB0L8P1Z+04HrNNZbnlzJhl11LXdmfhD7
	VEo/sLoi5wIDGcXH1Osv3/x26DpeI
X-Google-Smtp-Source: AGHT+IH7IWkH6sGgCqXOqo1X+qUMKDFtMNOejwKoQaGxlKvxwXw1Icl3WBZaF1ebexseFdyLVEv5Qg==
X-Received: by 2002:a05:6402:847:b0:5e4:cd5c:50f6 with SMTP id 4fb4d7f45d1cf-5e4d6afaf1dmr21403911a12.18.1741107933866;
        Tue, 04 Mar 2025 09:05:33 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:33 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:32 +0000
Subject: [PATCH v2 04/16] rtc: ds2404: drop needless struct ds2404::rtc
 member
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-4-d4689a71668c@linaro.org>
References: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
In-Reply-To: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
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
 Dianlong Li <long17.cool@163.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The memory pointed to by the ::rtc member is managed via devres, and
no code in this driver uses it past _probe().

We can drop it from the structure and just use a local temporary
variable, reducing runtime memory consumption by a few bytes.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-ds2404.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-ds2404.c b/drivers/rtc/rtc-ds2404.c
index 3231fd9f61da49bdaf00e46486fc34836094ee78..217694eca36c3432a8db3b874374e347eeb802d9 100644
--- a/drivers/rtc/rtc-ds2404.c
+++ b/drivers/rtc/rtc-ds2404.c
@@ -31,7 +31,6 @@ struct ds2404 {
 	struct gpio_desc *rst_gpiod;
 	struct gpio_desc *clk_gpiod;
 	struct gpio_desc *dq_gpiod;
-	struct rtc_device *rtc;
 };
 
 static int ds2404_gpio_map(struct ds2404 *chip, struct platform_device *pdev)
@@ -182,6 +181,7 @@ static const struct rtc_class_ops ds2404_rtc_ops = {
 static int rtc_probe(struct platform_device *pdev)
 {
 	struct ds2404 *chip;
+	struct rtc_device *rtc;
 	int retval = -EBUSY;
 
 	chip = devm_kzalloc(&pdev->dev, sizeof(struct ds2404), GFP_KERNEL);
@@ -190,9 +190,9 @@ static int rtc_probe(struct platform_device *pdev)
 
 	chip->dev = &pdev->dev;
 
-	chip->rtc = devm_rtc_allocate_device(&pdev->dev);
-	if (IS_ERR(chip->rtc))
-		return PTR_ERR(chip->rtc);
+	rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
 
 	retval = ds2404_gpio_map(chip, pdev);
 	if (retval)
@@ -200,10 +200,10 @@ static int rtc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, chip);
 
-	chip->rtc->ops = &ds2404_rtc_ops;
-	chip->rtc->range_max = U32_MAX;
+	rtc->ops = &ds2404_rtc_ops;
+	rtc->range_max = U32_MAX;
 
-	retval = devm_rtc_register_device(chip->rtc);
+	retval = devm_rtc_register_device(rtc);
 	if (retval)
 		return retval;
 

-- 
2.48.1.711.g2feabab25a-goog


