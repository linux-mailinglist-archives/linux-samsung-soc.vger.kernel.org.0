Return-Path: <linux-samsung-soc+bounces-4316-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A35F95471F
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 16 Aug 2024 12:55:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C03781C21E2D
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 16 Aug 2024 10:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03EE21AE044;
	Fri, 16 Aug 2024 10:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="niBTVg22"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5A01ABEA9
	for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Aug 2024 10:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723805696; cv=none; b=JNKuxECYV8yV3bn9wJZiocDmkaWsMvhTIcR+AmwzjL4yCAez7G8PfIk6WbRgCwczxZzoCnUMFFvySKrt5acb+U/3bCGKfN6ifEp/0TnubVJhJVCsoFKtvRNSgT2u0SptGhP8M2qUUPDU+tcq59zmuQJw+HyXJ0Vup2hulB1Q0y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723805696; c=relaxed/simple;
	bh=G2yPrpxBXb4PKw54ECzRtlVki76Ov9GcRLuKMdvmvH8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uxUX7fRLnlRJfO0TBD7CtpDbebaZJs+1iTlMjUSXNHL6TbMY2a0jNLIDr20YrQEv3zk2Dh7JEq54vvLHudxfxvEoKgxJBkj/p7AcNImiP9ERHS0ACLadZ/SZoxfhh0iNjgadmBdfFOkHOs0l/2ZyQYRyZxWNySy277bWfhdmo30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=niBTVg22; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42803bbf842so18562735e9.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Aug 2024 03:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723805693; x=1724410493; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7xWelpTr/XRUqKFM91cNQuNNebnp+T2/XDk25EhyUnU=;
        b=niBTVg22lY9aUZImJgPjv0lk/YKpJ/RapBh9iJBWUSJuPRH7c3nZ47x7DT5wUuEKfj
         w2VezXX+hT9SPd263L+DOJ8UGRmkVNj8gNpZxDVli4msOgavqZeC1hfSaZAlfWDIH2iC
         hjl66DusiZAg32ssKROwmmVEvHKPOeBa+gRznn3jmdMn7n6IUW6yl7GyXfg29vFYd8CO
         50hSbg5vvnN9939P2l7DfIUVA9+iej1uKXSakGaN3Cm97yjTxMn+No843+A79Dvs8w60
         4LG54cHEFeJHM969yJhJ1LacGZhvfYNJpjYLfUQ32O+Ernj93fKi2kHRmY6hyDSfn7LZ
         QLVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723805693; x=1724410493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7xWelpTr/XRUqKFM91cNQuNNebnp+T2/XDk25EhyUnU=;
        b=PxK3XvSus4bNGlAqJdH4V8HtDXaHeM+9kkJj7llvhYkQ5OeV6MVSySLh4N8fkX9ABx
         I1L3ZAaTPT8a6PcWVfHxgbmbJZtuviN4DB3iUl9E42wdnKaro17XxgZRGmGpCXqLakL7
         g+2vkZtQD323ST5tD5zyW7wlsB5yZTIr6ew670rGjiBA/KsN6qxwWTYLa6u6ZxOK6yZg
         TrVnvXxX8mSrxikL7WJatcpO80ADlBsHp7fORm+mO6N1Oc53V5ANm2vYDkDvcz/rnFGU
         qZ4FnyG25DU3AFuREPL/C7Di/gtteqKhqUuxzh340DD0wCeUnpMzaU/pVHFseTwx2mGH
         6rnw==
X-Forwarded-Encrypted: i=1; AJvYcCURzFcVMLK9vxPxARmCpZw1HVBRezjuPM/bV8sfRitlQXtZ5t2dJv8w+xamaZTiOvAbqWhD5zrC22wdsqBhvbqw2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZy0jlRogP9w2qgPonC2ucY1/63TZD0DaTpuOaqvzUKUXmU2qA
	MYNF1+hqa6+hAra2rp63WLUAG7IdSaTWEYDpI4ZhZ6RZZDL5L0dmWFapVqFZkIU=
X-Google-Smtp-Source: AGHT+IHD6wj7Dw8hXlamLzfXLE0YX9yxmT0kZMl6frJAfF1JNE4GaKBDulB0vb8SdWVJZ+hZ4bUsCA==
X-Received: by 2002:a05:6000:1368:b0:368:6f64:307c with SMTP id ffacd0b85a97d-371943285e6mr2028271f8f.15.1723805693032;
        Fri, 16 Aug 2024 03:54:53 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed7945cesm19461935e9.40.2024.08.16.03.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 03:54:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 12:54:29 +0200
Subject: [PATCH v2 05/13] memory: stm32-fmc2-ebi: simplify with scoped for
 each OF child loop
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-cleanup-h-of-node-put-memory-v2-5-9eed0ee16b78@linaro.org>
References: <20240816-cleanup-h-of-node-put-memory-v2-0-9eed0ee16b78@linaro.org>
In-Reply-To: <20240816-cleanup-h-of-node-put-memory-v2-0-9eed0ee16b78@linaro.org>
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
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1947;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=G2yPrpxBXb4PKw54ECzRtlVki76Ov9GcRLuKMdvmvH8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvy/rb4znf7Gc13+IjmByAMk6RS/9zPzPfxYqw
 7Z6nvJ1sLGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr8v6wAKCRDBN2bmhouD
 18MYD/oCLaJmWOWxy5n36CttxJFqbO51zWjtlcst6hRwuUgHToAatzCC4rqdYj6BqW6udSiOq2x
 MaCjbbXPxz3iOpxzfwcKWbg19No+lmlb1qk/33S3x0U9G2QJPvwticKeSkQ8rVKoCQ0axG/Jk64
 d59f87Oj+o4vvSe7bsarfpHSoxwEgjUVHG5/GvzVue/zwwfqsjCGsyd4eXS+7TCNWhyCIn5arMy
 d8Na9fDtC0X96Vjb5Pz/N289yVyYzZMtPrRDhdCQf0mxVKutUKhovg+VIGQwfBYJn8zh/ZGk66X
 DnuFEXvtDvlbr3h9lprlTzxCx/NRlVE/inFAV0lmj0GkErB0jire5a0G8+2/TMBDPuOTQu67sWA
 AZbrnvBUiv4vNpo9dtFviLw8KmYvUiZQ9VJCtwrVDwAYjtaKvWwu5pUiODcp98nbefbrm3pI2Rd
 THvcNlzPdoge696l78CgQUFoI5nxUVT8pPm4jjf82IsTJTWP2SWRg6NIldGL9doI71w+PQe6u+I
 dn4MAXawWNYuqEYgnvKY6sKASV82gYBZRe+W8jWBdobXx46WliBPxQqeY5WU5WaZe8OQpG7haL8
 DtnPg9H5b0Fdv+igpVtGJ1c7G6tDzTSUiatX/wgxRi1EO61LToCYLGG6PmXswqAUADLuNbXmpWd
 5flfqJkZrR5Iblg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/stm32-fmc2-ebi.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/memory/stm32-fmc2-ebi.c b/drivers/memory/stm32-fmc2-ebi.c
index 1c63eeacd071..7167e1da56d3 100644
--- a/drivers/memory/stm32-fmc2-ebi.c
+++ b/drivers/memory/stm32-fmc2-ebi.c
@@ -1573,29 +1573,25 @@ static int stm32_fmc2_ebi_setup_cs(struct stm32_fmc2_ebi *ebi,
 static int stm32_fmc2_ebi_parse_dt(struct stm32_fmc2_ebi *ebi)
 {
 	struct device *dev = ebi->dev;
-	struct device_node *child;
 	bool child_found = false;
 	u32 bank;
 	int ret;
 
-	for_each_available_child_of_node(dev->of_node, child) {
+	for_each_available_child_of_node_scoped(dev->of_node, child) {
 		ret = of_property_read_u32(child, "reg", &bank);
 		if (ret) {
 			dev_err(dev, "could not retrieve reg property: %d\n",
 				ret);
-			of_node_put(child);
 			return ret;
 		}
 
 		if (bank >= FMC2_MAX_BANKS) {
 			dev_err(dev, "invalid reg value: %d\n", bank);
-			of_node_put(child);
 			return -EINVAL;
 		}
 
 		if (ebi->bank_assigned & BIT(bank)) {
 			dev_err(dev, "bank already assigned: %d\n", bank);
-			of_node_put(child);
 			return -EINVAL;
 		}
 
@@ -1603,7 +1599,6 @@ static int stm32_fmc2_ebi_parse_dt(struct stm32_fmc2_ebi *ebi)
 			ret = ebi->data->check_rif(ebi, bank + 1);
 			if (ret) {
 				dev_err(dev, "bank access failed: %d\n", bank);
-				of_node_put(child);
 				return ret;
 			}
 		}
@@ -1613,7 +1608,6 @@ static int stm32_fmc2_ebi_parse_dt(struct stm32_fmc2_ebi *ebi)
 			if (ret) {
 				dev_err(dev, "setup chip select %d failed: %d\n",
 					bank, ret);
-				of_node_put(child);
 				return ret;
 			}
 		}

-- 
2.43.0


