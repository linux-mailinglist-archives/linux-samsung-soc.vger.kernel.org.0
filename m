Return-Path: <linux-samsung-soc+bounces-390-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FF7804D89
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  5 Dec 2023 10:22:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45F2B1F21484
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  5 Dec 2023 09:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABD543C082;
	Tue,  5 Dec 2023 09:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eZpt49+l"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B974182
	for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Dec 2023 01:22:40 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40c08af319cso26747365e9.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Dec 2023 01:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701768158; x=1702372958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ObxMeQH5boMcLQ/g7RCJYr6nmE+CvqsmjJ2hJZYAzS4=;
        b=eZpt49+lJK7WIr/ZxSoLC+67hGDAvqT88ih2KPCBSsOtKU14vy+1LlW/d2j/YHStkw
         HYjXjb/X/iEMIH2IZP9JJl8xgkDFJBa8Rm+g0gLSo4C4PWxh5nXyFEJpI8N7fi1j3Dl+
         /jJ9d9dg6GY8sTVAEuzIhGI2/tHPhl6PDqX6q/pxab0m/jI5WwCxypt3gBabn79ZMdY9
         5aMuzEBvbzgQKwniMFdHxAcfR5hVoJ/OCFMV+LJM6GpFXwMPuy5bfe5m6XVEMrGTOb9+
         YeKb8p1ArqX5pMl7ClvMDFolsR+7rxz9aE4VctzomLgX0WLMuPXcC2zhP6v2Qn61xnX2
         IGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701768158; x=1702372958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ObxMeQH5boMcLQ/g7RCJYr6nmE+CvqsmjJ2hJZYAzS4=;
        b=RujjF/1S/B8PCI3EekGmXDdcIpprhXIsxLAMaPaKp29fY87WyE8ml0ZB774kbubStl
         uc08iA4j+UBsXQ4LGs2+NhPviNaqXMXihj4iVfJlZ2gzeczRjs8JURgfv2DiOHCWWzqd
         AKBsULbD1hDUqXgt+7opMsxdLQZcMdvN3hldmqY6pl8QVDlUMYsRVGurayqsn4IXo8TZ
         aNjTLXBcrnHy3bi/5qO7FPAEOEyKC9Jl1ytV1zhu2rEsNiu93QP+RXZdoi0CSgDufVY0
         UHhg/1MPc/ydn3bK/YR+3V2FNVEkJadmrjVQvnQSv6XRhwvCsn38WmdMcyuqZPO05c9T
         /uig==
X-Gm-Message-State: AOJu0Yz45UIkIvXGEw1WsQb+CUwJ3FP818YpgOMr7/f7Zlj1Fx47cGWm
	jBmeI80eL8CLc2cPLZbyLEDTTA==
X-Google-Smtp-Source: AGHT+IGx3W7fpSGh/VpzrYet5YuHsyAZROhAv05v+RTHYlVan5pyIZgU5eQBamgdMnQZcOBhzibgkA==
X-Received: by 2002:a05:600c:3093:b0:40b:5e59:ea06 with SMTP id g19-20020a05600c309300b0040b5e59ea06mr230527wmn.165.1701768158557;
        Tue, 05 Dec 2023 01:22:38 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id g10-20020a05600c4eca00b0040596352951sm21692287wmq.5.2023.12.05.01.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 01:22:38 -0800 (PST)
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
Subject: [PATCH 1/6] dt-bindings: i2c: exynos5: add specific compatible for Tesla FSD
Date: Tue,  5 Dec 2023 10:22:24 +0100
Message-Id: <20231205092229.19135-2-krzysztof.kozlowski@linaro.org>
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
 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
index c1f5d2cb7709..df9c57bca2a8 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
@@ -29,6 +29,7 @@ properties:
       - items:
           - enum:
               - samsung,exynos5433-hsi2c
+              - tesla,fsd-hsi2c
           - const: samsung,exynos7-hsi2c
       - items:
           - enum:
-- 
2.34.1


