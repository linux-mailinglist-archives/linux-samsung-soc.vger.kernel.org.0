Return-Path: <linux-samsung-soc+bounces-3684-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8559285F0
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  5 Jul 2024 11:55:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51FFF1C20E16
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  5 Jul 2024 09:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC26C158A02;
	Fri,  5 Jul 2024 09:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="npITUVfc"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850E8156899
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Jul 2024 09:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720173141; cv=none; b=OvEgf1N+W26X/Jk/+B9rJRXKD0nFZdr6nslKkSEQZTkhWGJuh4tEyqUb7G27gDZ+YXWvnUU/zKcfTd6Uy9+ZgsLmL1+2HZIKnznmI9XfNSZx5I1sTvPNKKYPWgkxn4EYfSKyR6NLpX0PBFgaDQgJbC8fxzKLmrYDAl18WJsxrdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720173141; c=relaxed/simple;
	bh=TI55Go07WmwiV/8/mxI1MAibWeb5pb00J67OAZMLAWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tmy3bcxDs061aGBqVWEU9GOgCBe1LqxQM5ubj4vFC4fjIqykbNx08t+Wskrt9mXi00JRhVs68EMAIVDaVGM4IZyc62BJ6CRzPpA92TKLD9B3DewXfWGqF0xdT7CIhljHxFRVi2/PWSApPN01uk3ifeUz+Ycdeww8+MAxM5egnOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=npITUVfc; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42565670e20so15711385e9.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 05 Jul 2024 02:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173138; x=1720777938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vLdo5ZNT2z5DP6YaYiw/31TFoY7FNKHY9Kz30lffVbQ=;
        b=npITUVfcJ9d6/UAgfo3bOC3bygf0NlpDz267oLl9Iik9aoWQ1xMCvuVbive2kkABf4
         lL3CYyuPbV+84qJo449LLscwLcOq2vUwig+GkYfoqjYvYNI8kWS0n0cN9dQNARUFjct5
         tl5XQOIzPKSCIlcIOXWOQcqsWRmJpEymf1aYT+bXTMhMfHKGbI2QJU8YO/IG2367Xa+v
         xRZiTGHAw8VRU2imqoCF9SIv/tZi6VQPP9jbMdb08+6vcS3bMtsHUpzKvrXPCFgTLXF7
         4rxaZcUqPW5Y7El7fwQM/uFpByzSt04cX/jXOLVNOkohCq0i5ijAdgVbd+ZbpBeEBL6q
         dGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173138; x=1720777938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vLdo5ZNT2z5DP6YaYiw/31TFoY7FNKHY9Kz30lffVbQ=;
        b=FLjL1Q89pCWd7uHQ5IUooDRe6FI+ra7BH/VIzhwo6SOJrPe/IBWPuLqegsoMFfGM9g
         1fG6vYf3yJY0Zx7am1J3JTplTwlLw5z01DLYAUmPJLNvVov7iOtrdl8amYvBdPkTKemH
         zPXyqF0lTeKDYJTD1Rgee2kk5GJZ/efdc0hJuRFUR8sTsa0VAuacAXso3yUF07F8QziN
         UcCyKHXx96t/Uk0J6orPhRS5TyUK05njWkL06wEUuiWqJDHpLLlgSBp+7exVd3q0LoOv
         z8ZzXtQdOley3JeS0/62g3rmy2AdJXjmVpFFtBiXH/HtjuG3Gvb15IM6xBB/COb2cKMe
         R5LQ==
X-Forwarded-Encrypted: i=1; AJvYcCWE0RcZDXFpl9f77lgZl8c32LPg0len59IlsL9polUutp7UQCpW5KLL/q0qsfeGqU2GQGmJIUqsPxTounQ1LnWyXIFl7dC+FRDbyzckTtgHCxg=
X-Gm-Message-State: AOJu0YzPiaoGKC4YvrBHExLRDAt04sONHLhY99nWm9IJ8BWBK70ak9IW
	htuItYLK8wRwiwXXM2iGUu6fPCtZk2Yss8Q7asmd1ToJWmx4Wc0jP0yrcd2+93o=
X-Google-Smtp-Source: AGHT+IHWM39hkrT3BCL3vfzjlAmuka/milJOhLsZ9b2jVVuI/YsPmNdIWSCcp8XEI2B47DXGA4PYGQ==
X-Received: by 2002:a05:600c:6b17:b0:425:8cb6:5613 with SMTP id 5b1f17b1804b1-4264b131627mr39440625e9.9.1720173138065;
        Fri, 05 Jul 2024 02:52:18 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:52:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:32 +0200
Subject: [PATCH RESEND 13/22] dt-bindings: thermal: rcar-gen3: reference
 thermal-sensor schema
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240705-dt-bindings-thermal-allof-v1-13-554061b52fbc@linaro.org>
References: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
In-Reply-To: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1327;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=TI55Go07WmwiV/8/mxI1MAibWeb5pb00J67OAZMLAWU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8IvuqTqmG0TjJXqzakOUBfK+8z1WVpU62RhN
 HP4ZVcil2aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCLwAKCRDBN2bmhouD
 12L/D/4y67ykiZYFPvIg14LqdydRnQLMNtimrHyOjmnNi6ZkyZiXpMFSLaXCQlRWbqdUt47gam/
 4IjATok/3/SvLkbo2IV0QYXPlGhU1Zp5w/Up82uz74ydZ/Ckw5UK3r7ibxFd6hgrhlGdRtC60vi
 zrTtVOd2njeN40jqyTrNk7hNpBrkllmAX5HdnlDzw2ltUDqIdTSVqMP7KZ7nOcnQ1r70BtEDDCK
 WT9bD9DDbW7kI3Tn0/6r3i9hKfvijriVO0pIWZss/FVZ2zGLp0Qol6i1Ice+xhjO1RlphzZweMS
 qBshFHGYvCQ0nWrECvcUyeIo6lQuaYEZ+pyGu9Z9VRUhsD9TiqUJ4t/0Z269NCKgCvPKB7aZbU0
 TuWY9t8ySj2PLQAtEGegmVToTgHipxADRTx58p2172TdOUAPnPmm3j6lcYmRj5lTZ+lBWkLyL1l
 GEwqIjG0SWSB2TNm8rhntdoW2Imt3Xf2svnNtsCJn2r9w87cP9sdIsO1MXlq0ICfZ0NfznqHkMH
 TP+Nt3lzLEX0KNhP+Xw0Ulr+J7Nz6f7gOL8jbQJfxO5g21KrBeBqPpwhZMjPGWiVXaNi2g0lKu6
 8wTibgLtmpGTEd5TJE+oJlglalDSoEYDgOF/403ECyk+0A5xuSGZtG+9AtTUrJ0v4dodsULFoU3
 Mn5RhWP5AGLuDsg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml b/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml
index 6a81cb6e11bc..d92e882c9e8d 100644
--- a/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml
@@ -15,6 +15,8 @@ description:
 maintainers:
   - Niklas Söderlund <niklas.soderlund@ragnatech.se>
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     enum:
@@ -57,7 +59,6 @@ required:
   - clocks
   - power-domains
   - resets
-  - "#thermal-sensor-cells"
 
 if:
   properties:
@@ -96,7 +97,7 @@ else:
     required:
       - interrupts
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


