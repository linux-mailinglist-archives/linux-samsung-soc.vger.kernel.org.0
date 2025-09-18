Return-Path: <linux-samsung-soc+bounces-10582-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E92B3CD71
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 30 Aug 2025 18:49:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C08D35E5D25
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 30 Aug 2025 16:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 888992D4801;
	Sat, 30 Aug 2025 16:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oNw4/1yr"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932312D3EDC
	for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 16:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756572532; cv=none; b=luqp2SJbRtZ5pNIS9aUSZrtTbN5FOOcOKZVLg5Dx0WB3HTwKwDCMwXdCsWpud6KTtuKCliWioIIR1XEt9mEaipiuiptq3XCpShxKKTsC1ptoPFqGnR6IMFIBq4Ab99c0C7MWaHOddND0rQlyaHdZQkAFnhEqAAHDOZBjbNeiTVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756572532; c=relaxed/simple;
	bh=M52Ix5e2ZfY480bhbf4Da85nfANVV5Q7GQgHm64bNig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PnfgSx4CHvl5xA5DYs9RA56Pta+aau/fQYgd5JJTgHyHKKDNDKqaDiNGw9WLqihSpFxxk24W/vwHyYnS91ZvhQnkNJYif0BkuFO1BfRpEgGy3in8qN85VwSc2ELl2R9S8W793+98JD071+eHaZPEJzu2et6s0r+6frIRwzTecwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oNw4/1yr; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3cd151c38ceso449067f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 09:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756572529; x=1757177329; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uGegaPWxGQTvhFdIvhwtl2HHlep4qKtefJBT6reESx0=;
        b=oNw4/1yrgC+H4hxF6bq8ekB3HHQBRX5KEKOPChF/jGjXghdRlsll5jFF2EBrQPrrMB
         5Nd9s6nVaJ7BH1q5zol39pNHiT1TgWnbmgvOOwy5lDdgnAbL/MIsO74gCJ5yiBehlWO3
         r9l3PAyTXH9Qd3EKoExWKx/CLpSSmBhTl4YVtSTZ3BQrLmestqQJ+r3PYBGuffaSSs9u
         uLHR8layFQg60YfaDNdeJoiFgoUXMk9YHozh5KuVXncJtnOuNOWAukeEYU053cIqjRP2
         jtImcUizqppPyo1cjIujUaMPmDHgv+hWVgzW4kzXCrydBHofEZvM+XHAN5wySRF1UA3Y
         2NWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756572529; x=1757177329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uGegaPWxGQTvhFdIvhwtl2HHlep4qKtefJBT6reESx0=;
        b=SiUQArkwRudSB2d5WqyGYJ46EGy7bLecmnblyDEwbWEnT70c3pPAxDZxR9iDqmPjBX
         u9tSlFzvmH1Vi6omLppl894cCHKuv2u/F6WTbvKI/VgrU3S/waEV8hh4Uc5adOkObiNr
         CDqPOpReND0Bk/WNNQzsiP0hWlp66cMughCqW0xTjel9bIvU7zFt88JZkZR9tykG3blm
         6wRZlA/E2bs+UpjRyRqX6YLhTye9hgd3RSX7JF8Lp+L/FnsbNFLCl9u5Y7v9Kvjt3kC7
         pyb04mmpC34YBktulicJms37LQNU+JdLVILrYxvkFtd+IXqjjeHLeKGzOgxZWIC+qtbn
         rl/A==
X-Forwarded-Encrypted: i=1; AJvYcCXUKtQ3nYyeQYP7WQfrk7bS+cZirEQJ3IfU584e85LzzSZPSxegupyTOd6fT1DNGdsdXpx/PRCXTjIlK2c6lvwUGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHYoM/UuBW2HVyDA+HvN89gQ7xG0qII4BkY2gEBOIRoMYIXqZX
	Uuwe55p7popnB6Bx6ohe8Fhdv1duo795eu4tNfSCvfdX9IUawjreDL4nTlRZ1i5+aqo=
X-Gm-Gg: ASbGncvKFUNMJcXb3dzPhrzCURUKrZZ8pYfKDCsYu7hUXfeQ6zGaQ4B7RG6MTfuxDt+
	tfwjYBuisGc2mkYe2+CnkC10qvI8ydGje+ZdDKPlRaxirB+7JOCS6vdAkpmqSFkvanniJdtrAP7
	MZ0CS4sFIgc4O6Ny2lsbnRFgPe1JEAv6uutSvE/gfwL1VZ/CHs6TVy9rpTiCITeyMyHDYpSEcIc
	gHo9Jnat+crwoyUbb9G6MCRk92wLACQA9giKDokNK1G48BPFj4L8mnH995nBSJdTsIeGqG5QEAL
	qJmji0mTgq3UBt/4wbGoKqhNZgFZsOhedklrJ5hanz66jdBp4qHKHUWJKmAexClCGqjr2kxacnY
	eKWhVsi4+yUp+8zYiadb8afSp9GBhMlfsX791Hf8=
X-Google-Smtp-Source: AGHT+IH7Z/kvyvopM2ZnHxAu+WCRchp8R1OWKLCzlB4yVnosvVIsNOGkgCloMAkokNIzpMGMhjhXuw==
X-Received: by 2002:a05:600c:5287:b0:456:2137:5662 with SMTP id 5b1f17b1804b1-45b81f120bamr22809295e9.7.1756572528946;
        Sat, 30 Aug 2025 09:48:48 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf274dde69sm7818129f8f.14.2025.08.30.09.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 09:48:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Aug 2025 18:48:34 +0200
Subject: [PATCH v2 5/5] dt-bindings: iio: adc: samsung,exynos: Drop
 touchscreen support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-s3c-cleanup-adc-v2-5-4f8299343d32@linaro.org>
References: <20250830-s3c-cleanup-adc-v2-0-4f8299343d32@linaro.org>
In-Reply-To: <20250830-s3c-cleanup-adc-v2-0-4f8299343d32@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1987;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=M52Ix5e2ZfY480bhbf4Da85nfANVV5Q7GQgHm64bNig=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBosytm4JHyzH+AmZV5ywRHpisz2B5V10Ey2ZqXi
 ZkjUY5CvsOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLMrZgAKCRDBN2bmhouD
 1zmzD/4ppk5vO9b3vahpeArWbxkYzHayHXHpMN8v8pvD3pzMJ029qz5Zkv3REblrgn8HRmobbak
 5rGSq5Yrfo6/aF7cfHFUfpBOoUBRjNGyRyaMK/e4gESo+l0qJrrSHhWMQzuT/kezBuT9VNs6gox
 sfhS1/Y/RvAckDeLV46jXtRNAcIEE1xbnxezlRkemJPd9GHz/5FikDKOTLuTR03020aLhGpJlgD
 6gb5/yQguf2lK1zBQ2OynKcpzAaRFpF5HNmFAgx0CvbqAtqhSOBl34MR3rzjzfMC1BaEQv7qjNK
 pt1o9mgMZiMNfTf3WQkR8aJ5YIPwWJUKICCwTIzdndDc8FI2kk2q0llE1BnBamT/n0AqppNc8wU
 rCfdwcv1zx6irWkafqebcuyOGlqMNCHCUPl07bGU+Dw/qBL/AAoX/7Hg9POwHjgpn0wAvCvUShJ
 A2K1Sr4WRuJ2kJoXHev458ou4bcsPRW4Fsdy5M9lvaTEbVKpSp6ot8//nWkoCv7VdUX0InOIMwU
 ej/oLXtYnCSDLITwtiVt/RwMxMN7bghJdgW6DmFJ6RYayGLrWLQhSi9vL5Vox7a1j1S+2Vb8s3/
 HCZROQXDgwxx4e87GeXNVc+mqmZgdcnEab1k+5uxz9eZSUgsgrR5RpkRtvRYfRq31MeZXcGiDoX
 MgEQgosc2lfW7qA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

With last user of touchscreen via ADC (S3C24xx SoC) gone, drop the
unused has-touchscreen property and optional touchscreen interrupt for
samsung,s3c6410-adc.  The samsung,s5pv210-adc is the only platform
having two interrupts, so add a constrain for that.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Fix S5Pv210 interrupts
---
 .../bindings/iio/adc/samsung,exynos-adc.yaml       | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
index 73d7ba0fda1def433a97d10bce21e762a307e36c..def879f6ed20a3ad40baebed6557082a358cae2e 100644
--- a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
@@ -42,8 +42,6 @@ properties:
     maxItems: 2
 
   interrupts:
-    description:
-      ADC interrupt followed by optional touchscreen interrupt.
     minItems: 1
     maxItems: 2
 
@@ -58,11 +56,6 @@ properties:
       Phandle to the PMU system controller node (to access the ADC_PHY
       register on Exynos3250/4x12/5250/5420/5800).
 
-  has-touchscreen:
-    description:
-      If present, indicates that a touchscreen is connected and usable.
-    type: boolean
-
 required:
   - compatible
   - reg
@@ -114,13 +107,20 @@ allOf:
             - const: adc
 
   - if:
-      required:
-        - has-touchscreen
+      properties:
+        compatible:
+          contains:
+            const: samsung,s5pv210-adc
     then:
       properties:
         interrupts:
-          minItems: 2
-          maxItems: 2
+          items:
+            - description: main (ADC)
+            - description: pending (PENDN)
+    else:
+      properties:
+        interrupts:
+          maxItems: 1
 
 examples:
   - |

-- 
2.48.1


