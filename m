Return-Path: <linux-samsung-soc+bounces-4239-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5648794EE6E
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 12 Aug 2024 15:37:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EBB91C21F49
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 12 Aug 2024 13:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94BCA186E34;
	Mon, 12 Aug 2024 13:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x5/EoD3p"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89341850AF
	for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Aug 2024 13:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723469674; cv=none; b=h0ZSMOaMNw9SEBDpyAf5jwa8G2Wjlrae5m6moOq2OxO4AnR6cyMCTuxg2lqE5k+Q/Db3Amb7fhmRw2doqfor2X1WQcpPwZdhisXcGRieo7T73WATzfdZTfXKw0ZR/LN2+hTqnBuhbMz/Bi1Zj92rgCxYHxeXP4sOkrLH3iUJiiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723469674; c=relaxed/simple;
	bh=0agCSQdAmRYcJrMldLHC+cO/HYUzM/jNOwE7xvoTJWs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ryxRZ11/ZW+4kEB+kttjnECFSAmLgq6O6dG2iRWzl4EuGtyJUSqBMcoee9doGmvVV635DLXMmSHyjfA4GsK9EvLVBLzeGasSxkp2YS4Oq3484b0dMePZfoJXfpThXsjN5j834WwDvoXcZXk+nkJQdeLORduuIrCxk1VdG6ZfMXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x5/EoD3p; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-429d2d7be1eso3466405e9.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Aug 2024 06:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723469670; x=1724074470; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HsPnMwUlmEcWVK9mERUpPYYwG4/ZxKmrdaWPZk7BfDs=;
        b=x5/EoD3prrcyXNazsILQ2iNFnFIM2mAvbTgykwuwfMjS9RQ/MlZNJDUO4dgdOC1GDW
         EwaK91VugvWuHxLefXM5UY5M5sUqW+BrXSoC8yZAhrh3Cpv8rnB5cHxXDoQrTrOxDNQE
         lAoJpOgMxdBgPw3kkOCFHuiTTmnNVfAAQlSwJRIJdnAD5K5gMjHqCgEdpvaY+H+fp2fO
         Sr6lvH3oA4urFP/Lh9nHyFuPfE7cJo2bunQiVIzjD/DnFJjyr149E3BZ7O4gOD3KEh45
         HAjAkwZr57lgDEjUO0ydCw2M31dp3j8cOK5cFYmcMMxf1zuoyhtK058x3+jACGQnivzg
         ZjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723469670; x=1724074470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HsPnMwUlmEcWVK9mERUpPYYwG4/ZxKmrdaWPZk7BfDs=;
        b=UINi1nc9zLeTO/DCz25ZFtB1W1V/i0vnuC5ixdmDLqht8pb2xiUDwg+eyhTepy+jRA
         SPCsaC+V33S3I9ZU8kyZL7tdL4xA4mlOrKREIwRR4beTFpYvxlOdB2zqmzvSjAX8TniM
         RK8YlMb/O3ctY8X3k/J3nLInW6CxpZvG40aKxyIYvXJkYaOk2H0dcBeE1bTiAz/IX4d2
         ESDG5EtUZk1M1TOS7u+R5gSGBmMZMD449Du6sNJHF6u4Fxr1A8bhbh5LQ7speY0tL3TP
         M20JL3+SvUVB4vwDEBuF2JF2LzeoHN6QsoM3IQJumXmWifYxKZzLMLJ+ixi5sWd0dBvA
         5iRQ==
X-Forwarded-Encrypted: i=1; AJvYcCU60LHEvpKKzaRbzWF5uSPUfKwKzjIrwyFgjHo2NY/eIBJlovQzm6k0zTKYRp5ScsEQqOldRNJs+CVEjd4FFH4wRYnuC+Nz2XIKsAD5UrBc+ow=
X-Gm-Message-State: AOJu0Yzgku4qgiz8DF+xywA/m9dbczZcBWIG+cwmRCKQfQrJvFjYhwfW
	49TZV3BQqz0LMxyqT4s3wf07CocwG8T27MRc3IaXQsTDf+v9BWPvgzXt+tBGKFg=
X-Google-Smtp-Source: AGHT+IGNiDAP0NpC4elbocTXmRTxZwypqEwP2T7NoNQBek7gp6Czs1sj30tLHKhrLESNRMviHtEwcw==
X-Received: by 2002:a05:600c:350a:b0:424:a401:f012 with SMTP id 5b1f17b1804b1-429d4ce06abmr1140655e9.3.1723469670362;
        Mon, 12 Aug 2024 06:34:30 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429c7737c64sm102733975e9.31.2024.08.12.06.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 06:34:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 12 Aug 2024 15:34:01 +0200
Subject: [PATCH 7/9] memory: tegra20-emc: simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240812-cleanup-h-of-node-put-memory-v1-7-5065a8f361d2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1217;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=0agCSQdAmRYcJrMldLHC+cO/HYUzM/jNOwE7xvoTJWs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmug9WsUwse3YgLVrnCc6/fae3A3AcursWIyaSR
 hcKG6MOheaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZroPVgAKCRDBN2bmhouD
 17skD/4mk0mqH2rEuc6Lpcv9Fk9Z9Ofg651HdFCPIT9SXWaxdSmtuzFF10HgMdna2jAU8gVSx5a
 teBho/PIDCcTaBnRl2nfMGaohe9F6FvBXUBt3gyoUK8ws7VHkvJDSa/KJPlwupUztYS3WvUSHFJ
 /EKc9LxNYJ8WOl4h+a0KHjCPQTOMJphsYrmP5wO1v5mHNoWuBnbxURpMSzEe0EXtHGKbL7ftoyN
 V/BvKwz/AlFcGp4vn7CRcjByp042rkUjWrM5C4QOffDdnaEVCsGlTdPd+Q9j/oGG1oPiwjNj9Rk
 EJXOpzGg5QR2OlVBAR/BiPH/O17Zo3xLAKEYGwnEv+9n5xQfoRhFkU8txLoW6kUVxO5EHRHQ9Iq
 VYYUKRr3n4cNsQXegkWk0h9MKqG2jWOe/sLHWWTNQTxBLqOo0PtVSqPwNVK0Yo4xadzdNZ4B/xJ
 DVjB1RIhzwfhUHHCqwIVYmOMmTnMUTTJZz3r3S0skj4aAHPWpyPj+S23pPD8bzAWFXDWETY+Vsy
 Qk3XC066YomliavGy2tfSIyRH61lPSAHFkN3db4nQcAqKVS8DlXh1sFwiBMUK1q1oAPQGu22y9J
 QwLihlnuAYhwjSTYotz/5tGVxKjNaIefeTjk+X+fU46eFbpPJpU7TYmqN7iQqDK38/OJ8k+YGO5
 /7zMI7a8ZaQdSXQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_child_of_node_scoped() when iterating over device
nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/tegra/tegra20-emc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 97cf59523b0b..7193f848d17e 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -410,7 +410,6 @@ static int cmp_timings(const void *_a, const void *_b)
 static int tegra_emc_load_timings_from_dt(struct tegra_emc *emc,
 					  struct device_node *node)
 {
-	struct device_node *child;
 	struct emc_timing *timing;
 	int child_count;
 	int err;
@@ -428,15 +427,13 @@ static int tegra_emc_load_timings_from_dt(struct tegra_emc *emc,
 
 	timing = emc->timings;
 
-	for_each_child_of_node(node, child) {
+	for_each_child_of_node_scoped(node, child) {
 		if (of_node_name_eq(child, "lpddr2"))
 			continue;
 
 		err = load_one_timing_from_dt(emc, timing++, child);
-		if (err) {
-			of_node_put(child);
+		if (err)
 			return err;
-		}
 
 		emc->num_timings++;
 	}

-- 
2.43.0


