Return-Path: <linux-samsung-soc+bounces-4237-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3218F94EE66
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 12 Aug 2024 15:36:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8F981F221D0
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 12 Aug 2024 13:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E799F184534;
	Mon, 12 Aug 2024 13:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yusXiwtA"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14910183CCC
	for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Aug 2024 13:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723469670; cv=none; b=Bc2KjvCWQWpekjc1YEorN6PT8dfJrWU9lcucr2Fr3+zN79c8iwTR9MH2B+zKDyjM/9+weiTkn9cPuCPZGbFO/d+KWQo6tWuxfnhXkEynXm3/auHcHvtnW8iaEV/gvB76xZumfzpgPPko7a0KbKZ9ay53ya10ykUkPsOLb5u8ntw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723469670; c=relaxed/simple;
	bh=VUl2omx8TySNDGhRBBGJcq4Ai4teD6LWmoYd+wA7nBQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bbCrrFBsiNmVxoZ7nJDazQqiFIvi8QxBHmgWn1xFd799ZWlDOkgdb4Z+lh7p8kqT8MSSvetrZbETCG5f4gaHuv4rWvI1AJ5VhRFCVqOpy3tUUU9kU/hLtR+nCeOHZNhEVWv91ESsIkDkEleICaSUVHs1okAFFSCzZbDCQajMvIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yusXiwtA; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-428085a3ad1so34225315e9.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Aug 2024 06:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723469667; x=1724074467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iYu90t8uzYSzwZwxstiM099mVmkqpDjtdWc2Qi9XDBQ=;
        b=yusXiwtAYUSY/HwztYJo1NrXlymMg3bx7C0/zXknRwnTWSVVmr5VMLgUIhuotOXqCi
         Tsq1NoNwtNi72zJFIDhOugRosndeeKgFyqqCpzWiVkOzI54eHlq690QwSyx1oZdfc+nw
         j9CxVAQsLLTZQVhx8VWbksVYx4PLMo9552bnrVz8MCM0XFdLitCB7XTKNbzZV66Oeraq
         gjsixjwtC5BKVTLicTzdlxuETQfYKoG21DhcGfE6lKjzU1hnxfbzKyGpYxBnpLzbayAC
         aJwePxF/Vorg9pvj+BkEtCwb6sQ1PtAlzV93CRc3rF/kh4VuXJxwmUQjUKftG2M5J+sA
         0A6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723469667; x=1724074467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iYu90t8uzYSzwZwxstiM099mVmkqpDjtdWc2Qi9XDBQ=;
        b=VEqt9q39obR6s2rV7J4NzA0zYTyoHAQecAOzwlnMdFy0G7whr3KFMHwR7p0i13Idna
         2cgoEQl96ELms9XLUaiaQUruXbV29x2Ug+Aows7/fIPuId3towzibM73xq1oZ4wEYver
         ieIvEAzCXKCefHpmUOySKMC5destpvApbqU32VCLE8oTkWiK1tShybbKAMwGcbdRNehg
         CnLyNNpr3K/KlUGD4nV15MPDCnO7MMSy57YgN1qQ/UE0GDVrfyoKK5ULmUVB1/Whkt2H
         0URFrmzsKtfY2kDdS6zPFvkPJnCr25rbsAc8l1Y5bygIpdggKDFpVO6PeWmTiRV9fnaZ
         YYrQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1DYbBelDUTzXz458aG7pupsTl26G1RAmGTC8Zm29RFi2ocDLg1IYynPQI8Rxven2nNbaQ0pjeMbVkxtTO5fqGhIbNnASvP1CTDyLAEDDRj/Y=
X-Gm-Message-State: AOJu0Yyh5chxTf/Ht7xOWcFzaASRZjp2LVrl/q8n2bXDt507lxpYAr8f
	qMrtsoOTVtkxItCP3e/zO+3svapu14BRwzSbLUC8jY2Dju8ev2CLO7TFYZBAA3Q=
X-Google-Smtp-Source: AGHT+IGo+bwIOsZ7HKzwRQ/L9wxhGpzJ+9d90EvUl3/LSZZSk74iCon02t3qgWPnZGmK+APviAH8lQ==
X-Received: by 2002:a05:600c:35cb:b0:429:cc03:6450 with SMTP id 5b1f17b1804b1-429d47f3d65mr3847725e9.7.1723469667400;
        Mon, 12 Aug 2024 06:34:27 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429c7737c64sm102733975e9.31.2024.08.12.06.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 06:34:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 12 Aug 2024 15:33:59 +0200
Subject: [PATCH 5/9] memory: tegra-mc: simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240812-cleanup-h-of-node-put-memory-v1-5-5065a8f361d2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1844;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=VUl2omx8TySNDGhRBBGJcq4Ai4teD6LWmoYd+wA7nBQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmug9VH3wPyjxN/t/zzCvyjeYSsYVX7Jz1ga252
 UjCTUHqiJ2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZroPVQAKCRDBN2bmhouD
 18dmD/0ewHA0UK0In5nae64KOCy+CAeX+7EsnZCjszXwHpXtbtbje2b7d8Br0Rj7OsxqkLkswiK
 0TtfIJ7JhGZMAjZ++tIyxg3wlqEt35RQt4H+PQvHeDLM2XZ+z9CKTc05uuZqynh/PpvkoXHheOr
 lO8TR4iguvJTFmKmbSieHEgcEQvDqZL+SnWoADGWfaRqTpuCvzgMMuf+2qPqqnDNfcregG9QgKO
 +w60nKgkB4CLB6FMMlzAscW23AprITn6TCuZEBd9s9Ml4+hp/NX2QJa/E79ozdZpjz/6nT+JZi2
 7QUvHO4EcccyTIqhqcC1Ggezg1vmaglKJdKUI980UDR6GarxWnvJwrNaTIjoOvUnidQNMAbw1E8
 Brc88ThoerIMUAaRW36EdH2jze/ynNoiK+qJUZnNdlK9k2d+ApRPCR0llnQTKj7OKVxe92jKUT3
 GEYOBQ1Vf6C2aD2syu/gERy554GaWVbVPHBmvlGYFw8VyyirnITcYyw2ElKoHJGTTySSedZp2Uh
 TUCYUuos2eEzx/EOV9E7LDPfrFWARV8lZefX+nMIUZnYSj1WdfPfKnxWM7S48WuUkXVDaHSNIyz
 hYY0EVe5bcenb3qyxNONkHg0IKjxWPKwtIzWFh31VxXLQoZ9VXrteRJhyEqthWTt9f6GZALFo9O
 hWEevbAzA1E3pYQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_child_of_node_scoped() when iterating over device
nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/tegra/mc.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 224b488794e5..bd5b58f1fd42 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -450,7 +450,6 @@ static int load_one_timing(struct tegra_mc *mc,
 
 static int load_timings(struct tegra_mc *mc, struct device_node *node)
 {
-	struct device_node *child;
 	struct tegra_mc_timing *timing;
 	int child_count = of_get_child_count(node);
 	int i = 0, err;
@@ -462,14 +461,12 @@ static int load_timings(struct tegra_mc *mc, struct device_node *node)
 
 	mc->num_timings = child_count;
 
-	for_each_child_of_node(node, child) {
+	for_each_child_of_node_scoped(node, child) {
 		timing = &mc->timings[i++];
 
 		err = load_one_timing(mc, timing, child);
-		if (err) {
-			of_node_put(child);
+		if (err)
 			return err;
-		}
 	}
 
 	return 0;
@@ -477,7 +474,6 @@ static int load_timings(struct tegra_mc *mc, struct device_node *node)
 
 static int tegra_mc_setup_timings(struct tegra_mc *mc)
 {
-	struct device_node *node;
 	u32 ram_code, node_ram_code;
 	int err;
 
@@ -485,14 +481,13 @@ static int tegra_mc_setup_timings(struct tegra_mc *mc)
 
 	mc->num_timings = 0;
 
-	for_each_child_of_node(mc->dev->of_node, node) {
+	for_each_child_of_node_scoped(mc->dev->of_node, node) {
 		err = of_property_read_u32(node, "nvidia,ram-code",
 					   &node_ram_code);
 		if (err || (node_ram_code != ram_code))
 			continue;
 
 		err = load_timings(mc, node);
-		of_node_put(node);
 		if (err)
 			return err;
 		break;

-- 
2.43.0


