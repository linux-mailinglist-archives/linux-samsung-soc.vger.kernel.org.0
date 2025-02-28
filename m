Return-Path: <linux-samsung-soc+bounces-7137-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB43A49B4A
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 28 Feb 2025 15:07:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 380EC3AAA50
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 28 Feb 2025 14:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4D7E26E62D;
	Fri, 28 Feb 2025 14:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i03efqjn"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A868926B96A
	for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Feb 2025 14:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740751646; cv=none; b=s5LA+UZtmaXP/hoZWsojrVi6P1/oqGEuMyCTcQ2W2YWTa7yAjqnOHUIRftQnrXDcZTdv5lTDUHXDX9y4pEWNNMNtfVG3TnrOQbhFgwBMeqy+jO3m2mmwnJJwGpx/os68duGT0g00n7QIBXQf/BJrMZlR7ckp6AJwX8EqeHXpwW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740751646; c=relaxed/simple;
	bh=o6iUQpkX2kREXBtqHVFBYq4KM/Ol+6TBK8alsSBDLFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E3FN4smbJ/LYSRc18LvH4l9pAIGybVV92jEMiu787OE2FvYsGBk4xgr/CkPZjjBxtb4ITyluma+jY/eOCpU7q3CcvVANobk0Ci+SqNolnKfpG2DAnUYPOgoMk6haUx1DBVigjJLmgUGxU2+kaunwNaUwBWuxJYy1kUNrOAeqY0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i03efqjn; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-abb892fe379so301482966b.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Feb 2025 06:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751643; x=1741356443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PxV5ubkQILRDTTOOiWiVBaTKuCWcjZ1klG/odToLNLU=;
        b=i03efqjnlFkObHW1ztwNuqWMePtLs/sq4dmV85pqjRtrRv/6u5zjc3+7LF9N6rvm3D
         VgUAuMNZCVN2aFvXztpaWFFP6KTLbP292+FHSHhqP8+lbYjhzwIVbSTznR1jePgTeQf3
         Xxv3R/EoiFGazGdfUiQXPOq0KgQi7g6izTyHExGklTWZBRp2GjxYsuYqjKIVpz6KU0jg
         FAk+qFERo+crftlurfpxbBl/JRZqV5Uabocq71zI7Cb2v0M0bUQEHeDAXjmgW8h+/nNU
         m4kdI1wUlFu64hozU2n29hXURoDUgiVuiisr9Nnt5mdj7Et3JhuyXmsjFzFhCbDmcD1Y
         bsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751643; x=1741356443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PxV5ubkQILRDTTOOiWiVBaTKuCWcjZ1klG/odToLNLU=;
        b=WkxAmvE3jq+OBZN3dPNRVNhqXc7Obfg7Cgw0iV23Pdl93giI/T5sRfRHK9ainO3AsF
         JRmxxnVY4NdrZoQK7heKJoBEAT8KxkOCij76Nbq8EZ03ymH+7eIR+2MmKU+K9vGs7jqq
         gvKW7kGXtCAq52qjKaYFkxBDNFTf4vy4l+8LnJFTSZnPCrhYUkFwsQb/OtEvgAOMzHGC
         HMj9LdUgPb8t89HtOGpaC1o6gAcIlEd4RNv/7Q+VPANqrubjdZJPmBGWA1FZPLlmvZZ6
         EpzLlSVSn8ZY7WoLYSqWoHuY6SqXuR/Org7p0vnnOkjMEQz2rka8X0kdPPixL7CZtfQQ
         S52A==
X-Forwarded-Encrypted: i=1; AJvYcCWZFEv6RjuqZ/7khciQehPPhw3zZDltxFFDivX7GQ1FRzZSO+3JtzCppiZ3x7Pq+SnGOaxY6py4zH9jpyZ64liFdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJYzuteVFUXOBdJ+WecWSvDPWnNVtvlS0F5nkgfw+2RYSZmIeI
	4wpbQGQxlqe2fH/92+8+orgeWRfcK81A4Nfl9/JTEt9fqZ2I83nI2oEX/PrUSFA=
X-Gm-Gg: ASbGncvOb/YLrxkkp+yO7SJK242XRjROmdX4aGNRy7j2rK0D812OFXeykjH1YIejUpT
	9/ZAY1NLIZuvhfppPAKoWwssXWzauhxpWblIh2EnZC7k3D/cqODzItZZURCR//rOTINNmJoTtgZ
	uLEhcVhYzFfX4itjitLs2QO/HnCI/3V+u88BDW2KVGUfqh9rE+e1I8UJnmzZ37BErmH9Ya4pCNf
	Kd6mhdUBT9iaQ5Mc9Ux4wJeppYV/kGgE/PQhwTpIqnVyqyrKReOYt+sKH/sXMDMZ2c6shM0/4CO
	2QOLVMuTer1Xbr7HtjLk34oyHAQlrLQ3vrdB0o5c9292esoEjjI70lTwfk9oUF0pce61zzmoPU/
	MxhdZFsV0uQ==
X-Google-Smtp-Source: AGHT+IFUL7DUuq/VqTU9dmynPShF+8aK2RXF+k+UR0pl4bWqZxWvS8VoSsjq66EWlcydyD7uTG7tww==
X-Received: by 2002:a05:6402:1d4d:b0:5dc:796f:fc86 with SMTP id 4fb4d7f45d1cf-5e4d6af436amr7325207a12.16.1740751642551;
        Fri, 28 Feb 2025 06:07:22 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:21 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:14 +0000
Subject: [PATCH 01/18] rtc: max77686: drop needless struct
 max77686_rtc_info::rtc member
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-1-b44cec078481@linaro.org>
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

When this driver was converted to using the devres managed i2c device
in commit 59a7f24fceb3 ("rtc: max77686: convert to
devm_i2c_new_dummy_device()"), struct max77686_rtc_info::rtc became
essentially unused.

We can drop it from the structure and just use a local temporary
variable, reducing runtime memory consumption by a few bytes.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-max77686.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
index 7bb044d2ac25aeaaf2404b47b7e7bd485ae3d39e..6b0d02b44c8097453f704cbec9f02580fb869ca3 100644
--- a/drivers/rtc/rtc-max77686.c
+++ b/drivers/rtc/rtc-max77686.c
@@ -85,7 +85,6 @@ struct max77686_rtc_driver_data {
 
 struct max77686_rtc_info {
 	struct device		*dev;
-	struct i2c_client	*rtc;
 	struct rtc_device	*rtc_dev;
 	struct mutex		lock;
 
@@ -691,6 +690,7 @@ static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
 {
 	struct device *parent = info->dev->parent;
 	struct i2c_client *parent_i2c = to_i2c_client(parent);
+	struct i2c_client *client;
 	int ret;
 
 	if (info->drv_data->rtc_irq_from_platform) {
@@ -714,14 +714,14 @@ static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
 		goto add_rtc_irq;
 	}
 
-	info->rtc = devm_i2c_new_dummy_device(info->dev, parent_i2c->adapter,
-					      info->drv_data->rtc_i2c_addr);
-	if (IS_ERR(info->rtc)) {
+	client = devm_i2c_new_dummy_device(info->dev, parent_i2c->adapter,
+					   info->drv_data->rtc_i2c_addr);
+	if (IS_ERR(client)) {
 		dev_err(info->dev, "Failed to allocate I2C device for RTC\n");
-		return PTR_ERR(info->rtc);
+		return PTR_ERR(client);
 	}
 
-	info->rtc_regmap = devm_regmap_init_i2c(info->rtc,
+	info->rtc_regmap = devm_regmap_init_i2c(client,
 						info->drv_data->regmap_config);
 	if (IS_ERR(info->rtc_regmap)) {
 		ret = PTR_ERR(info->rtc_regmap);

-- 
2.48.1.711.g2feabab25a-goog


