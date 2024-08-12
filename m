Return-Path: <linux-samsung-soc+bounces-4240-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8325594EE73
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 12 Aug 2024 15:37:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C11B0B20C75
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 12 Aug 2024 13:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCAD6186E58;
	Mon, 12 Aug 2024 13:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bGSAJ33P"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6D51862B9
	for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Aug 2024 13:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723469675; cv=none; b=s5UPf7sdKIWNRSBDfnvFE8Z/hMTRqOzF5RItd9EiuvN0EEoAjUuwakkqrctf/aVcFgFAH0SseTtmc0S8vvC7PFLzm4T3vf2GN4KoA1EU8HPed8H94zGJd5fl1BlCbVJ2i9IJ7QPq62shY7Ao52r+t45XctZ/SxoQznOiqqSWxNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723469675; c=relaxed/simple;
	bh=Qm8I2XYrN4e568eaRkgeUjoCW+fRdkjecwXHEHRljxk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aYCfDx4bQddLvVQ+89Xmwp2rLy9k4Wq9W0jSbD0/8LH1MO4bsnNkzVL4QMHNrPn2uXb3zuamlqPnNgQ/397mdSATD9c5s+ZfKL+/z1JaY7mtVV8BqDSKSfB9waSVxzasmtyQYlL7s5gE/LTcBZmNsuvtRaFoNsN5uTyHgzGY4Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bGSAJ33P; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ef2c56d9dcso49656891fa.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Aug 2024 06:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723469672; x=1724074472; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oAYRAyLvoG4oyvTDF3Z4505Z3pwRnY5SCeviwv8U1gY=;
        b=bGSAJ33PZw/ZPt8758fYkBFxGpXdxlWUS9X5ZyXHp0/htCwjHbV7+viaKHAUAjteVX
         NjWt3BVVAUXk0Am6YtXSRRjPEeWy/remdNj+iVO1iMa7oKbH+b2iVtTxqjucZIkeaHXD
         Oy3iDwLHj7wBLcd4CmjDQH081gNV2vR7lWc8kiL6AVyMk/mxHZ9Mv6dLJD2kOOGn+wCR
         mTV/xW0/MYkU27UpKdcvwcCQN2rSkVOQv8gCWbu4uPVUTiXpS9IoPzm1vbFSTiuB00nH
         wqXeVLfzJlAhsMpS7n6no6Yh/x2BJ7rWtjZ+5u0kOpRZ7s7+dz5rscbX73wrAEm7T+7b
         C8kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723469672; x=1724074472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oAYRAyLvoG4oyvTDF3Z4505Z3pwRnY5SCeviwv8U1gY=;
        b=P+j60b67byFhfxOFYKwlDRd543o3smzQIZTclAEc5O4GAnntGb4xjwJXzln2ZqIRsl
         zMuZIeSAoNXQ7RYkX1oRj9QnAU5miiSdfQZjPoN/fcfnGVHMbkDFJ7o4JapZHJnPtD1c
         HU8KptT00skIyUu76QDfeYRQREDezIFBeVvRYvyZcPf4gHhpJP5y8yM6yILdje7N8mhF
         e0Q+HB2ihMyGjBndKFTUFVHpTVdnJCPC2GDqOEj7miapa8uITN46WjsdTY/dXaQTJn7f
         q14Q8IYf4NRTrOST5Tr37cSbhETkk4VGw2sKFUdyfOqYMjIahdUrM8zmm3bYZFi0GifZ
         rjsg==
X-Forwarded-Encrypted: i=1; AJvYcCVcxFTDpV//gQEtZdTiokYE/blCDyMXMZkYekatKj+zAVMYRXtX5OouLqsmbjS+qGjknDsidQbG4cLDKYv0xmAp6qsh6PM+WDmgJLDXAMp5Ps4=
X-Gm-Message-State: AOJu0YwCKT2Un1n2/ptoalh5D/bhPY046cbVInP11VYnr1+2hT0cTXMc
	pEKlWgNcgXchH95nmK92WBVKwjMN5J/1/iAITTGWhykxhsQnHXOQAk6pGjqjufI=
X-Google-Smtp-Source: AGHT+IF4Zea8h7AbclFyhVQtS9eZT2Tc6EMfJdGvwHFdzc3KpbF32S6sd5GGemZ+KlUJ1S/LzaVfaw==
X-Received: by 2002:a05:651c:b29:b0:2ef:2281:2158 with SMTP id 38308e7fff4ca-2f2b7132d7dmr2306451fa.1.1723469671912;
        Mon, 12 Aug 2024 06:34:31 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429c7737c64sm102733975e9.31.2024.08.12.06.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 06:34:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 12 Aug 2024 15:34:02 +0200
Subject: [PATCH 8/9] memory: tegra30-emc: simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240812-cleanup-h-of-node-put-memory-v1-8-5065a8f361d2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1224;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Qm8I2XYrN4e568eaRkgeUjoCW+fRdkjecwXHEHRljxk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmug9X8NotaoXkCeoFvECQEThprz5ONHsMuzD7b
 NbNcj+DjQaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZroPVwAKCRDBN2bmhouD
 19OvD/94A99rooiagSr1yUUB3q7Tj/0CpbQTlx8GEwagkJMZgezQJ8fSt8lsJRwMBXaisbT1RUu
 /ugtoQOyBWqkLkCZWhr/dt2MLe/xTHkqATxxMe/q3D+SgaGpBqnpb8s3OCcUoLRH2zLUgkSNI/B
 uuVVzd55ascHajpNWi6sBkx/4Ze24W/M4Kzrur9iytpTE0r8vhXx66INDaF8DWK1OKaSFR5C+87
 Xi3jQE9JUlz3sNAXyieSjga2IaM8ORwSZu5uDrQ9H5dih3U5zFbTcVXbvZgWBaehrOS6NJfiCd8
 SzqME8XywWSTxtLCXarn4TdGn3FqnR/O4walESXFoC2LygReE3WiwB/R+ZBHx3iQ7m+4NGDKZK6
 VBpdwrbh0T3/x+HpB1Q1KJZvfqxuUUEOFea5K/1geiiMiFJCWOk3r7PxgZgoHWn4SwuTSHrvFYI
 +219oxZut/xhcq+BqRzL/oR4EZ9TyOFAxpt7eqTU670YOGIom6tb2FG/KaN0L2UuCqlodmYVNsY
 iJbDxcpq4gIrMimT2QT6S+AsS5JZAIV6l0Rg+otm9KBlrSMLK0JFVzGsM/vcvY9suDvqXV0rtwP
 LNsXWOvL2mgzo2mkBI5TGQ0g7g9fhaRALj9GU1rbiyjbDY3dZneug64Vgj4jUmWBINShFwvH3ag
 Y/cmVhGViQKghBw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_child_of_node_scoped() when iterating over device
nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/tegra/tegra30-emc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index d7b0a23c2d7d..921dce1b8bc6 100644
--- a/drivers/memory/tegra/tegra30-emc.c
+++ b/drivers/memory/tegra/tegra30-emc.c
@@ -979,7 +979,6 @@ static int emc_check_mc_timings(struct tegra_emc *emc)
 static int emc_load_timings_from_dt(struct tegra_emc *emc,
 				    struct device_node *node)
 {
-	struct device_node *child;
 	struct emc_timing *timing;
 	int child_count;
 	int err;
@@ -998,12 +997,10 @@ static int emc_load_timings_from_dt(struct tegra_emc *emc,
 	emc->num_timings = child_count;
 	timing = emc->timings;
 
-	for_each_child_of_node(node, child) {
+	for_each_child_of_node_scoped(node, child) {
 		err = load_one_timing_from_dt(emc, timing++, child);
-		if (err) {
-			of_node_put(child);
+		if (err)
 			return err;
-		}
 	}
 
 	sort(emc->timings, emc->num_timings, sizeof(*timing), cmp_timings,

-- 
2.43.0


