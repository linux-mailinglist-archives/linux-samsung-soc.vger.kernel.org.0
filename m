Return-Path: <linux-samsung-soc+bounces-4233-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEE594EE56
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 12 Aug 2024 15:35:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3748128224D
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 12 Aug 2024 13:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67B1E181B80;
	Mon, 12 Aug 2024 13:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T42yi9ZR"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1281817F4F2
	for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Aug 2024 13:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723469665; cv=none; b=Se5hDrQeca6qPk4n7uymrunq3xy5m14DHFTFd8lE6UsDFA+zyG2PGXGkv03Aj0leWyQreuvZnaH29y25HW30kg8Ci+oK5u/W4WQCorhBvnfzO14PWeuMscEAgTGKU8FerD5r/YuzYkMhzkW/6hS/7Q/+fCRsXuQpOOIranusUmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723469665; c=relaxed/simple;
	bh=xgfyKZmDDIbZTBcHgkC4HQRuoKCVphYVJo2Oqeoz2yg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m2nDqI5FpvLro2DiRn8LZE4cj0Bs/5ijvOjSv5c3zPI6t7lwsobiVvkfy32Isf/etDrcXHhzk93kIXCP4YMyXAGS5l5xQrSM6qqK1vT4qfoRh04Gugnrd646IqvuKMQ9ifMXGSvFa1OqHf0kMd9CRtCYGXc/+y8HgsRejsqW/Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T42yi9ZR; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f149845fbaso45830471fa.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Aug 2024 06:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723469661; x=1724074461; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uOJ0Ss5PZ4IloZXXvkJRBvwO+cKYa9b2eKV5tMzUF90=;
        b=T42yi9ZRQi7mcGBQuq95A4B9nSNoH6e+zy8IVONQZIDamNg1WFLsDZVrym/ZyuqxdN
         GXvByXue2HhXSiOvnL3pmqLNr6Ob85zhSLvhJyOPyIOZqkI5uvo9rtcPPpLxXWyqDlW7
         i7IK5xiEgie2TIt0fcHdYObLU8g6uONoO+ahPnGuRre8OvPhG+FY7ixt4JPZBdRbNSEf
         gT4ZbgPNm25HXGebuZp0lBMBvFEaBnscMmrPft2nuuO7fdfQZNQASuAeLp/wgaog+Fac
         V3hAbqdZNal56taQ3bMuZGYt7T7PdM8Gi9rYbOCDCex7iP0buZFe+iEyarsHCzpFPFFo
         oNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723469661; x=1724074461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uOJ0Ss5PZ4IloZXXvkJRBvwO+cKYa9b2eKV5tMzUF90=;
        b=oA69l4K0L4q8RCoorFaq99YuR8BxIAviHvy2RoUljGiAgF8kZe6UosK33Qj06ts389
         7gCeaINMZBS+pPtoElS2i147y6gd5ZFD6r15dKJtER0jqzfUmapzv33yYcdmGNn7Lhqp
         2aC/DsUi5hCqcP35O+9Rdwjwl+Ies/4+LoaWx+p5Ly633atHcl1UYKhZ+0Npm7LMxVvE
         8rU+O+8Xlt+06gBKmx+7xy21XDkmlIZ3ITOuY5CkNAYstF3av1wAWR1eSM0KIAzM5yLU
         0Owtviibi4HzLO0bfVHZLlE1OACqYvAJ3hgZaBa0uUbAxnbILHe9DBYNlMHUiDq2q2bJ
         oi2A==
X-Forwarded-Encrypted: i=1; AJvYcCVIxMrjNvag1LHKfE8wfvBPJDbW8jL9tLWma8Z9A/ZH8oOYKDxSlPE9AihCVZFviKPTLoC4ldtemtThf3q/tS0MoaUnKK6E312wg4P11aLvBnI=
X-Gm-Message-State: AOJu0YwoV9efimv1vosU31o4/0WzzTy1w4CGgrZzxkQh58s1NOFG+wC3
	0epaxZWmKICs4zysbEoIpmQTbyhDBIHIPPUkoXJjQYlI2rjGq6SwDGBiDTXvi8G2VP1Qzl61jBF
	J
X-Google-Smtp-Source: AGHT+IHQihxBmTwZO+gpopSrog1h4Zwo6nfMe5CMTYHEB+GBFOYD57QnlF7TYHYQZ5mGOjHQLKtWjw==
X-Received: by 2002:a2e:9985:0:b0:2f2:9c23:3412 with SMTP id 38308e7fff4ca-2f2b7156ee5mr2174791fa.23.1723469660887;
        Mon, 12 Aug 2024 06:34:20 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429c7737c64sm102733975e9.31.2024.08.12.06.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 06:34:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 12 Aug 2024 15:33:55 +0200
Subject: [PATCH 1/9] memory: atmel-ebi: use scoped device node handling to
 simplify error paths
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240812-cleanup-h-of-node-put-memory-v1-1-5065a8f361d2@linaro.org>
References: <20240812-cleanup-h-of-node-put-memory-v1-0-5065a8f361d2@linaro.org>
In-Reply-To: <20240812-cleanup-h-of-node-put-memory-v1-0-5065a8f361d2@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Lukasz Luba <lukasz.luba@arm.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2456;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=xgfyKZmDDIbZTBcHgkC4HQRuoKCVphYVJo2Oqeoz2yg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmug9RWiZUzjyUB45cY5GRGscQmhk2n/JWQ8eCU
 OV6qDjUvVSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZroPUQAKCRDBN2bmhouD
 1xyXD/4zIloc9i56JR/7avOvWMonHwPMgxrw6eW1Ql3uMGbouCHddr07MRZROHf7FHGtaDBNSzW
 mxhzYldkGPh7W1K5fj9UFeZ2zvkfrn+rQdUhG83d4r5ihSPYCQzBxKNTUvwKDDrn2jZ/DWAjmfh
 TxjAUuNnwbSkd43KLCkjRjmKHg1bCsuc/NromW6Jla20roeAfx6ousA8KIh8deLOJvUSd9IjoTP
 vhWCOrq414zR2AtAX4vd2IsPJM2zqwKIUt/ZXVvpV6IA6I5emax215uBPI/tq0XEaLTbW5dH/v8
 JpZBGwkHxrkWhFaXEUS01fvJMEE2G+rqeMxi9GJGQSITpOae42sKZXL7jCxwsDsQ5zgfRwWGvJ5
 veNYQdH4lAPRjl8MUL3h1K42k3GfVx4S1i+6PqIyC7vk7MOfuUV2WBitHAcxMyjcQMbj8XsjyvB
 iMMGFF8VDH2oE6eJ4aaUv+Co83vS2sYyoIH7BWNGxvSW2ajjcesSADyFhNMcoelmhpGZTckxESl
 82l1O1qvrtFb0986Is0vJ6OhgHDX/Eja/dCxlk9T+SvRzZha67Ecrv1oWVyttwKxwqIrlMjdM0L
 b7iludiktLPGaXEtTrzpL2Xl3GZiWkzR9es+685yu7ltUGzpJVSzqu8GN4yqwd4riFxIzLgCaj2
 TMtGaSenJiohE3g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Obtain the device node reference with scoped/cleanup.h to reduce error
handling and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/atmel-ebi.c | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/memory/atmel-ebi.c b/drivers/memory/atmel-ebi.c
index e8bb5f37f5cb..fcbfc2655d8d 100644
--- a/drivers/memory/atmel-ebi.c
+++ b/drivers/memory/atmel-ebi.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2013 Jean-Jacques Hiblot <jjhiblot@traphandler.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
@@ -517,7 +518,7 @@ static int atmel_ebi_dev_disable(struct atmel_ebi *ebi, struct device_node *np)
 static int atmel_ebi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *child, *np = dev->of_node, *smc_np;
+	struct device_node *child, *np = dev->of_node;
 	struct atmel_ebi *ebi;
 	int ret, reg_cells;
 	struct clk *clk;
@@ -541,30 +542,24 @@ static int atmel_ebi_probe(struct platform_device *pdev)
 
 	ebi->clk = clk;
 
-	smc_np = of_parse_phandle(dev->of_node, "atmel,smc", 0);
+	struct device_node *smc_np __free(device_node) = of_parse_phandle(dev->of_node,
+									  "atmel,smc", 0);
 
 	ebi->smc.regmap = syscon_node_to_regmap(smc_np);
-	if (IS_ERR(ebi->smc.regmap)) {
-		ret = PTR_ERR(ebi->smc.regmap);
-		goto put_node;
-	}
+	if (IS_ERR(ebi->smc.regmap))
+		return PTR_ERR(ebi->smc.regmap);
 
 	ebi->smc.layout = atmel_hsmc_get_reg_layout(smc_np);
-	if (IS_ERR(ebi->smc.layout)) {
-		ret = PTR_ERR(ebi->smc.layout);
-		goto put_node;
-	}
+	if (IS_ERR(ebi->smc.layout))
+		return PTR_ERR(ebi->smc.layout);
 
 	ebi->smc.clk = of_clk_get(smc_np, 0);
 	if (IS_ERR(ebi->smc.clk)) {
-		if (PTR_ERR(ebi->smc.clk) != -ENOENT) {
-			ret = PTR_ERR(ebi->smc.clk);
-			goto put_node;
-		}
+		if (PTR_ERR(ebi->smc.clk) != -ENOENT)
+			return PTR_ERR(ebi->smc.clk);
 
 		ebi->smc.clk = NULL;
 	}
-	of_node_put(smc_np);
 	ret = clk_prepare_enable(ebi->smc.clk);
 	if (ret)
 		return ret;
@@ -615,10 +610,6 @@ static int atmel_ebi_probe(struct platform_device *pdev)
 	}
 
 	return of_platform_populate(np, NULL, NULL, dev);
-
-put_node:
-	of_node_put(smc_np);
-	return ret;
 }
 
 static __maybe_unused int atmel_ebi_resume(struct device *dev)

-- 
2.43.0


