Return-Path: <linux-samsung-soc+bounces-393-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D07EB804D9B
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  5 Dec 2023 10:23:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C216281635
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  5 Dec 2023 09:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EC023FB07;
	Tue,  5 Dec 2023 09:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tlTfOHi0"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 392D7138
	for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Dec 2023 01:22:44 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40859dee28cso53615235e9.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Dec 2023 01:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701768162; x=1702372962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJh8YfrYN4aMg7OwYeFzWAOVUVx0rMNzMAodPuvKkaY=;
        b=tlTfOHi0sv822V6yfJDh0mWZG5PQHDpLLhbcUjESBS1oIbaL/g3nDzmMqTCgmnc3v1
         QR4PFL89lG5IWJxLa0NOQ52jFgvS5UWGKlY0S0YYue1Zo823qOmN/4yCRuViGKbFDUVw
         7zrT0wmrfAwqUEbeaL/F8GMg020vFn7PtVyES4twas9J6w5FVQlxSiJ5tG7bAjtUICVU
         IYcSTIUq4tZQ71FS4Gh1V/WjQXerHZZDTiuWHpAuSiVn4vYkUCiIKFGy3qwm5ThAFL9y
         cA8M8NRAH/LMqO2l3PhylYo7dJepnprAoRjlrxP3waXf8I+U/rpNXrGJx7RT4GfISw24
         KnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701768162; x=1702372962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zJh8YfrYN4aMg7OwYeFzWAOVUVx0rMNzMAodPuvKkaY=;
        b=jY021G3etnlegzyQhmJ8PChwlwlWY2IEQT2+z1dzcV2a9uwc8oXVWpHdA48qMjhb+Z
         +GGHcm2lj266BkdQvnLp3AZhAt+eNXynjpfpEIAtGia5NzOMSLmajbJkgNFfWO9b5mGE
         ZHSgiLPCeJdGfrnunt46TLEPMGRbfev2r3rjzY3ZL1u25LUlAQMgOSo/p/LUSKKo/uHc
         /qIFQc4soMDsnFpXgxqmoGO1bOBLg6lCmSWEdanMUXGznZmRYEAmLCTWZq5NpEngLfnW
         vURa6xSJxguk4TGDnj7fumVQKn/E31QHsqDcgkKkKzRJhfcROAZy0N1DOWdZIR+8f9zC
         lEnA==
X-Gm-Message-State: AOJu0YylsPNafolbARUHASMYChdWakiNRYG6YiYRx7h8BRfNKkjH2X96
	ndnA4J0Ea2a0LPqJDP6VXLOJ9A==
X-Google-Smtp-Source: AGHT+IEQb3rHaV3TPRV3lXtPvhHPSOgrz+olhZYbewsa9RJkFJDQq9Qj+DmR1Dk9Y8Zn/uJ/on8Fug==
X-Received: by 2002:a05:600c:6026:b0:40c:87d:a27 with SMTP id az38-20020a05600c602600b0040c087d0a27mr2244281wmb.101.1701768162784;
        Tue, 05 Dec 2023 01:22:42 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id g10-20020a05600c4eca00b0040596352951sm21692287wmq.5.2023.12.05.01.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 01:22:42 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-fsd@tesla.com,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/6] dt-bindings: serial: samsung: add specific compatible for Tesla FSD
Date: Tue,  5 Dec 2023 10:22:26 +0100
Message-Id: <20231205092229.19135-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231205092229.19135-1-krzysztof.kozlowski@linaro.org>
References: <20231205092229.19135-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tesla FSD is a derivative of Samsung Exynos SoC, thus just like the
others it reuses several devices from older designs.  Historically we
kept the old (block's) compatible only.  This works fine and there is no
bug here, however guidelines expressed in
Documentation/devicetree/bindings/writing-bindings.rst state that:
1. Compatibles should be specific.
2. We should add new compatibles in case of bugs or features.

Add Tesla FSD compatible specific to be used with an existing fallback.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

I propose to take the patch through Samsung SoC (me). See cover letter
for explanation.
---
 Documentation/devicetree/bindings/serial/samsung_uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index e32c1b462836..4b6fc82c2edf 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -29,6 +29,7 @@ properties:
       - items:
           - enum:
               - samsung,exynos7-uart
+              - tesla,fsd-uart
           - const: samsung,exynos4210-uart
       - items:
           - enum:
-- 
2.34.1


