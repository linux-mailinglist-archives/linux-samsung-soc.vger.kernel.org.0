Return-Path: <linux-samsung-soc+bounces-4313-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF38954714
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 16 Aug 2024 12:55:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF7D11C239DE
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 16 Aug 2024 10:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEFAD19DF4B;
	Fri, 16 Aug 2024 10:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Eo4o4BjZ"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEB9198E76
	for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Aug 2024 10:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723805691; cv=none; b=c68LtIrcqMpWyOarnQbz8x+mtPgZ6SRAOxH0HJl6uapeMWvLfUHe8bnB0J7AWGjyOhkoO43M3wFSGkngv5G/cgSOsUTm6TqwR7QW6wuMvyGNuxak1FEz5nbMe2YZtw5vIVZ17X3zeoEORDMEjGrTnlVrQuLwT8ExBD5uE5J+eqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723805691; c=relaxed/simple;
	bh=3WljQ4S40lAJKTSAlp1/rnFCza433JZA4ZcGKxWq3B8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k8Sm5bFsMf7zKku1iTqXGAPbsZdx4JExqXCpo8Jl3kH25IYp6y6UfWVc6wZeUbiYBrBPQ+nFKb3q3EJ6FJZX9tkuZuh1HSFGuoPKQUEjuAlLB5+gKnjGH0Vymro0sUhOTDwO2nxrqU1N3UHXAFOHzHUulJFYFy3EHAA6lWd9IDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Eo4o4BjZ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42808071810so13273015e9.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Aug 2024 03:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723805688; x=1724410488; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6k6SD0aSljrln4HTu6lTRnYpdZxqX1kReSkeJCWA8tI=;
        b=Eo4o4BjZs2ZZ7r9slgF2ye6g4uufTYUUmhW0f1tFC0Zh8+gtYc5GPGjzOelISA1a4f
         xpmX2j/sMyYWSaCG8zMQHzwURHGGyDPiEAeLk+rDXy/x6+qbMNQ0bDlM1PegyYAnrLjO
         omAsmS4n2IbtkcORmR6sNbeEHoGJsTPgWvBY6iHS9maCHLtc/51U6AujH57DK2yM34Vm
         dgPcttiKp35wsUp6Zrzq+wIkAK3KEpv6OWoUGfOYF+Q0KW0QQXgwH5BgHILSGJv/aKYP
         CPRBcBZTwXI+JB9UNPp7KY3rP6FRDZNJCelNeAILzJTZM3rZl7WgFDe0YoxE78gCoIZk
         ZG0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723805688; x=1724410488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6k6SD0aSljrln4HTu6lTRnYpdZxqX1kReSkeJCWA8tI=;
        b=r5iFFXsSnEQtjzTeIWUl4vgiM8X5gItdOY7FvnaQhh4rvowgHHtLCfnA2otYTokZIA
         n/wGk3Qn+2sXllrVTT2FLrTQpWNIbl5RrcuFAnHTwySIH3/FN0CuNZv/nHnfQnJCC1Im
         hjOpnUSj+DomP+gHOlmdiiifVTnipKiQWf1PRe/Q1noILyXtVsxCpiR0/EiDEr5ot3jb
         Kcm7NRzFQ6T5GWiEMA7y0DPoP4kx3jy9wVhWRDYYgC4CLgyb65S6VHgrISGOWm0ikERc
         SqaDx4vUtvLvkL8F+0lphbs41ekMOh83RCZ2R0laVPmB2Wfgs2hIfdtvJ1HFp1IIraN2
         qpew==
X-Forwarded-Encrypted: i=1; AJvYcCVOaWHWWVREb4/78nuXGh2aC/9EiBVnQYgOzKaOkbAXm0VlEk6mHYsQyXZeWcby4eMvJzo2Xil9idw2/LZ/z2axZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbZHw4zKiSVr5dqlIiN2gkIqmGZ4Jglh20/B+6EiCYtWC6/spq
	qbdbOJl+UjR6G2HAybwGvfkKNLzfchSNQzThH+ITg9w0dCU5bIK32DTjFL0Y7Ec=
X-Google-Smtp-Source: AGHT+IGySjZh+j8sC30c+hTT7NjTBz/cevAJKuIL9WcydZdhm3gwMTKibEaXN40CzJLmokWv8APCXw==
X-Received: by 2002:a05:600c:3114:b0:428:ec2a:8c94 with SMTP id 5b1f17b1804b1-429ed79b8d5mr18949045e9.10.1723805688147;
        Fri, 16 Aug 2024 03:54:48 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed7945cesm19461935e9.40.2024.08.16.03.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 03:54:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 12:54:26 +0200
Subject: [PATCH v2 02/13] memory: atmel-ebi: simplify with scoped for each
 OF child loop
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-cleanup-h-of-node-put-memory-v2-2-9eed0ee16b78@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1411;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=3WljQ4S40lAJKTSAlp1/rnFCza433JZA4ZcGKxWq3B8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvy/o4IJ9C/1vwBLKqlCDJibipxPCOssPkOBVA
 lUD/dSK0cOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr8v6AAKCRDBN2bmhouD
 13bzD/90oli7rKlPTyFDijLjZXCBlyAd+gOeBxMucElPf9bjthSj/d0Egf3LFElhNSpgHbcUgmF
 IYrSj6gTIQEcTMdT7fImXfCY+JHRweAnbhPn1YLAAUiXVWbrQEVN/q9CP6dRReBP6TDqUq78YMo
 jtmFQTQZXuvbzlg3k+Xe/nBuLdBAK6cAX33qOqh3z8rXzViLT8utrBWPjDGCjisjUQPv9O9NP9d
 RYwrjNXGpSSrRkYZalG9QgCTN05F1So4ML8XYR8qMqvSSv9qxFbuUPVESf/UClUPyjU/TwN6Ee9
 /joZRI/TiIXgYhGD/+yYi0snpZTHJ6SWPVTGfvZESeRS0sAWQNWsw+MuNAi0QobBWrX8RQ4R0/c
 etqFzpwVoq7jRthBRauZO7cun5gyO35V9OpT0VkPs6q8rZFjnfXgsAoS3ReKiSMG6pawA0KsAxd
 hKkmg3DXaQ5pFlR+KODklIz2EvAMcUxcSE6vdOGhm43uJYUCwPzHhiM0xYYw8mhMY7h2RP04s8L
 aKJt4lBa1kyw3xqW52DwKB+NY3AqxMaZvoVTpVOgY3nlZG+hncKHA45VECUGTQxFlXhHhBYFO9S
 Osh3WKboPcOZp5GVEmVYHFJi80NbYJXdmSgTh/5mjqJEa8/ne4JuKAzX+TpRgQD7+pWdP13nzeI
 7bcaQ2/6/4azprQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/atmel-ebi.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/memory/atmel-ebi.c b/drivers/memory/atmel-ebi.c
index 8f5b3302ee30..8db970da9af9 100644
--- a/drivers/memory/atmel-ebi.c
+++ b/drivers/memory/atmel-ebi.c
@@ -518,7 +518,7 @@ static int atmel_ebi_dev_disable(struct atmel_ebi *ebi, struct device_node *np)
 static int atmel_ebi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *child, *np = dev->of_node;
+	struct device_node *np = dev->of_node;
 	struct atmel_ebi *ebi;
 	int ret, reg_cells;
 	struct clk *clk;
@@ -592,7 +592,7 @@ static int atmel_ebi_probe(struct platform_device *pdev)
 
 	reg_cells += val;
 
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		if (!of_property_present(child, "reg"))
 			continue;
 
@@ -602,10 +602,8 @@ static int atmel_ebi_probe(struct platform_device *pdev)
 				child);
 
 			ret = atmel_ebi_dev_disable(ebi, child);
-			if (ret) {
-				of_node_put(child);
+			if (ret)
 				return ret;
-			}
 		}
 	}
 

-- 
2.43.0


