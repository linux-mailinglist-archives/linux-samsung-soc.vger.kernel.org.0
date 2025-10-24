Return-Path: <linux-samsung-soc+bounces-11824-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98529C07977
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 24 Oct 2025 19:51:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 590FC19A564A
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 24 Oct 2025 17:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5546B346A04;
	Fri, 24 Oct 2025 17:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SJSAvB/C"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9C733FE26
	for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Oct 2025 17:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761328270; cv=none; b=RxfrdxnvWqYtmWpKEAyNZHyCrcA3yqkQHuSj8wAx7EAATd745RnPDaIe4BrNJib8tYeH7eMf382+BkH4z5MKZk0lxT0nZl/PpHwNsHm9SuTvjGpJFzZvbjDc71rhNZenMDRfSx194Pz0KpiyRgk68tZVUCdr7o8rk6hW37pS4zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761328270; c=relaxed/simple;
	bh=8OtrpREBtZB1x192nC3r4mm44r4aYjTnAu6oo/Ofj2g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S36zPRMi+W8My3gMFv/sa6FMcENVgAHvokp4SYmR8VShv3nqwPSVr58esqjeCTYawcjpH2fmwMR1J1NFtLfDrsbQDxWOXWTKlJSpERX7qAaeGXZaRYirr63/2O+kyZkbhBssy7+1c56Q2/SyYgqqFmXOdRY3Sf62NS8brYpVOU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SJSAvB/C; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3f99ac9acc4so2197352f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Oct 2025 10:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761328265; x=1761933065; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rOLCVk9/QiwKN1UsTQZ1CrvJYvRM1UlIJhn07XUe2KE=;
        b=SJSAvB/CsSjk1zmRm6AGqxMzCQmvBN1M/IavOPcRxaLjFoqt5Y1o+CAcM12XpvuqGH
         EVXxwVL7oYDEApUQa9zUB6w+WEBtLEa7/jw9kqwe4jzvQPFu2nyJStm+mg8T0FNZuX8S
         uZRc4j2y4c+NuWeB8YjWl7xAVPbTaFFKFWVnIw+VFKEvLagst1P4yTpfFAqQmnbmJjCn
         PWXxo0G8zSyPtIZIFIKDubBy0yfSa8if50eUsqNzoC43EU5T3oI/azVGS2MwKob8mmXv
         11iIc+lUUeaoTYpygZ3Aq1yGs11gUNSriH2QPSJKe7MyvEwa7CVgGJXvNIXj62lmcTIZ
         irtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761328265; x=1761933065;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rOLCVk9/QiwKN1UsTQZ1CrvJYvRM1UlIJhn07XUe2KE=;
        b=IPAYYvD7HD3p4tZ1dLf+I2bynccwlz+uTSyUYaAHWeObkZsWhOURpMtJqgijvQg4EU
         Zpb4UpKZG0NAasXRxWs9KySbAAByWQi5sj0ioZTEA4daztHkBBgjsHvcC+AkHU/TnznX
         g64KjQAOUyekbG4KOgjZ3BWtHQfNFIWkfv8ybCRxdtozgaCJmZhm55lxfR1hm5tkcjY7
         +2za9E8mjgbva7YwTFSKk7e2SM7PVeoxhDVTVsIXlQo7bZns2fja9+LMKS1XdRT41kmS
         XWOUxEBzFWQP5rg847AeOf4GRBE2sOMojEmJsUBF6Oho5gkfaoXs2PqJgaMhgjofy0z4
         nn7Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9n7T7KbpY/mIYWcuG/wQoBsiHfgIrHJJsOUq4z294XCMZiXd/NgFpbV/31NvVpaY19uRNf2zWnB/PHga/2EdQmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHv1w5hDxgXTn2sX+hCHSiYfqbKsrvWYWVf8TevrDaaxTC57Kb
	4MKFC8G5W4jToyAckshpISaMcx18RFDPTx0YAXOc8p8qEtvmxWIqV1MksqwffWGhm+KoII457q2
	tE+cd
X-Gm-Gg: ASbGncuc8NgfHEJJyEKM8ZaBN88aMkHYpflnLbps9NwAr4kIThr3Urw2HUdPTw8JeUv
	cJkNCXjYZz5htcNq1k4MiwSYM0PPttEdCf3cXzRc9tvpYecrOJRAHoOcWeCRsHztommfSTWTFZh
	yktLxtg25dboMlOLdmr97wuAs9vuC+r4GOTwVGqykyq0dR/yE3XvJWcKvXckul0vyEjBGCBJUmA
	D1ovt3BAjOMUpKNJeZ2eibHhUItSj0TLzSF+rwvYgQg+r3EUi/pVqm/KIH1vSkrdMllF2EO5qJh
	RwwVVKLMEz78G3qYFcZJXygA1uVQFdweLuqHPFRvR6odjvxNf6G8rdj3yQHEuOXh5mX8jUL5AaO
	JmJEhw8qjVWRFAzm5k3ypE1EhYB7OBS7KyBBAW9upNFtNfx+j3oENr8O+3kdhx+5qJwO0Pb8gAl
	QewG3CxdtsoNs1j5yMUVNtnrx4JZt/cJJcydwc3T6As0R7l+zC8/fZY5t3k4/+vgHLETu+F4E8N
	Q==
X-Google-Smtp-Source: AGHT+IGYnylqqVKrCTZY94vqPvipylQ/dkxetbC2sOasmr565marnizJOrsOZZOI5A86DycSGu2Bsg==
X-Received: by 2002:a05:6000:4715:b0:427:5ed:2d95 with SMTP id ffacd0b85a97d-42705ed2dbdmr18159704f8f.17.1761328264940;
        Fri, 24 Oct 2025 10:51:04 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429897e7622sm10321900f8f.8.2025.10.24.10.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 10:51:04 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 24 Oct 2025 17:51:00 +0000
Subject: [PATCH v2 1/2] dt-bindings: rng: add google,gs101-trng compatible
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-gs101-trng-v2-1-c2bb81322da4@linaro.org>
References: <20251024-gs101-trng-v2-0-c2bb81322da4@linaro.org>
In-Reply-To: <20251024-gs101-trng-v2-0-c2bb81322da4@linaro.org>
To: =?utf-8?q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>, 
 Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 linux-samsung-soc@vger.kernel.org, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761328263; l=1419;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=8OtrpREBtZB1x192nC3r4mm44r4aYjTnAu6oo/Ofj2g=;
 b=EQv43Oor9EYwbIg+bkdEWKveNwuPK3fDoxFXHSnLdCDKDEvkdprIIYFqEghv/+a5an6lUJ7j5
 LF59aorIIHyBSZYPZRgaBHpL21gSRPECTAlmuIjbb2IRfV9mNHr9bOf
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add support for the TRNG found on GS101. It works well with the current
exynos850 TRNG support.

The TRNG controller can be part of a power domain, allow the relevant
property 'power-domains'.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/rng/samsung,exynos5250-trng.yaml    | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.yaml b/Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.yaml
index 1a71935d8a1906591439c03b7678538e656324b6..b85edb47036ae745b863bd8ded500891ea28c723 100644
--- a/Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.yaml
+++ b/Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.yaml
@@ -12,9 +12,13 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - samsung,exynos5250-trng
-      - samsung,exynos850-trng
+    oneOf:
+      - enum:
+          - samsung,exynos5250-trng
+          - samsung,exynos850-trng
+      - items:
+          - const: google,gs101-trng
+          - const: samsung,exynos850-trng
 
   clocks:
     minItems: 1
@@ -27,6 +31,9 @@ properties:
   reg:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - clocks

-- 
2.51.1.851.g4ebd6896fd-goog


