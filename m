Return-Path: <linux-samsung-soc+bounces-2812-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3A78AF4FE
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 23 Apr 2024 19:07:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 829DF1C22E8C
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 23 Apr 2024 17:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 121E913E3F5;
	Tue, 23 Apr 2024 17:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZCriZWAv"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1424F13DDDB
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2024 17:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713891988; cv=none; b=W90RanJ/McuAigKe9OI77m8tYiCcaRN2YT7utiXA2YZlBOjc9hTAr+5TMyAZEkuCVgBFXD5aKhmirWuZop8Oknf+Q2WuvuYms2Qjm3KNWqSU/bASk2bk8QSQ3xRnwuM7JFZruBD5VYTmEZNXfVAA/4XV6tN36AmcI8Lzl3cpcXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713891988; c=relaxed/simple;
	bh=+/8QLPiW/Kn3ZLyskL8ldNzf7tquoUxKp1/ZVi+DCsc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fdO3UbzuB9QvL2vksmkgiMw4pt6oQ91RmGXHDp5K3q+t8Iqb9KXS7AedPh+rWZU6nb9PvBT8im3qs/5X88u4VNW55Vi8eXJJ5smS+5WcsV4kJixKEVUeBji1OL0SVsV/k3ppNZ5CiFFKt+u9TvAkkMtAFA4C9QKGk79YH1x/OmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZCriZWAv; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a5200202c1bso706177066b.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2024 10:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713891985; x=1714496785; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AmVOMAacL5XFgxZMBxM5qRIgA9vpdjsgMSXx5Z5N0AI=;
        b=ZCriZWAvTZPhbh/7kg7KWJ7J8qyqaSjbzZ1NK5nAWorVk4TRMPQaLTTqNsHFBPW9qQ
         A2nrGI7+JnK0Z31EyPDts7Zb63NomtauuN2HaZRgMt5eL7RT/sLnbDDzT+0zY2qR3mcz
         hM0ITMUS4qTBsguzjnDxm6d7OmbiHKTd+DtTM0B/8C5hx8C5cfZGJfojEbD3NVjQu+Mt
         BCrMtexuhlUAX5qDSEy36wU77pxsCJQSF6tN9epP+b6yXk+xaSsw5RdSkyRhl9Ljw1w2
         akCVRwKMcl/kbhCwsOTgnIOR5hMrv9eGWjNxI978enilHjaIEMjFANOTIhCKes+cx96a
         LUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713891985; x=1714496785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AmVOMAacL5XFgxZMBxM5qRIgA9vpdjsgMSXx5Z5N0AI=;
        b=M3NDDwWo1qshXU+k2QlEqMY2wkRZTizEO93VNvNxjWlKyV/If+NY0MHeOMnWPFOFUV
         mwo9j1PHpXM2m1QIQk0cIUyim7sQLvR3ZZT6BmIjzR+CahPEVX+qVFUfvCOf/fgqjqy3
         E0xwOoEHgxLm7w8QdMTnY6YxxkIVd6O+4CDv6aq48d1+hJV5WHPcg3SApXzETSqtqqH/
         uW4sfzwLAVfA6hG5hdFAgJVOePomaNe5jyX0wyeGQPlD3kUA1ZvpRHKZsTGlp65oK6nI
         0QxAjnCRUy2HAz2oXPxb+MlB77VW/s4CujRymVXARkdEFYdTeTcQIZ1qVd6/XO2yVtis
         cbQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUC+zzMKGDrB6Ky1avNmKafIXWjEHzWg1+Wxsocq0X/t4Eq9X6uq1+0Dwt0qyeA/pnFzNFer1gu217DdHGuPWjhOUNNEf16Hv4pMT0pYWh0Pm0=
X-Gm-Message-State: AOJu0YwIBIPwWo+pl+LuZbzaaITrxCHif3UTtnA+9M5YyjQUeYgFaip9
	mbeArm8oz3BdmD09iUTtUFOeV0hq+vRUSzbXinOPLHPXaz0ZASf99mernSj28bw=
X-Google-Smtp-Source: AGHT+IHFr6sGyLI+yphYekoqsdNMAx6XjzCJoHMxUHv0NqmcqlAxDCxNlJfyBgFU/lBIG84EZQBqaw==
X-Received: by 2002:a17:906:fad4:b0:a52:3492:d168 with SMTP id lu20-20020a170906fad400b00a523492d168mr11332528ejb.50.1713891985270;
        Tue, 23 Apr 2024 10:06:25 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id t22-20020a1709063e5600b00a5209dc79c1sm7351624eji.146.2024.04.23.10.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 10:06:24 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 23 Apr 2024 18:06:03 +0100
Subject: [PATCH 1/7] dt-bindings: phy: samsung,usb3-drd-phy: add gs101
 compatible
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240423-usb-phy-gs101-v1-1-ebdcb3ac174d@linaro.org>
References: <20240423-usb-phy-gs101-v1-0-ebdcb3ac174d@linaro.org>
In-Reply-To: <20240423-usb-phy-gs101-v1-0-ebdcb3ac174d@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.12.4

Add a dedicated google,gs101-usb31drd-phy compatible for Google Tensor
gs101 SoC.

It needs additional clocks enabled for register access, and additional
memory regions (PCS & PMA) are required for successful configuration.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../bindings/phy/samsung,usb3-drd-phy.yaml         | 78 +++++++++++++++++-----
 1 file changed, 61 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index 452e584d9812..db1dc4c60b72 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -25,6 +25,7 @@ description: |
 properties:
   compatible:
     enum:
+      - google,gs101-usb31drd-phy
       - samsung,exynos5250-usbdrd-phy
       - samsung,exynos5420-usbdrd-phy
       - samsung,exynos5433-usbdrd-phy
@@ -57,7 +58,18 @@ properties:
       the OF graph bindings specified.
 
   reg:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: PHY register base address.
+      - description: PCS register base address.
+      - description: PMA register base address.
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: phy
+      - const: pcs
+      - const: pma
 
   samsung,pmu-syscon:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -85,30 +97,62 @@ allOf:
       properties:
         compatible:
           contains:
-            enum:
-              - samsung,exynos5433-usbdrd-phy
-              - samsung,exynos7-usbdrd-phy
+            const: google,gs101-usb31drd-phy
     then:
       properties:
         clocks:
-          minItems: 5
-          maxItems: 5
-        clock-names:
           items:
-            - const: phy
-            - const: ref
-            - const: phy_utmi
-            - const: phy_pipe
-            - const: itp
-    else:
-      properties:
-        clocks:
-          minItems: 2
-          maxItems: 2
+            - description: Gate of main PHY clock
+            - description: Gate of PHY reference clock
+            - description: Gate of control interface AXI clock
+            - description: Gate of control interface APB clock
+            - description: Gate of SCL APB clock
         clock-names:
           items:
             - const: phy
             - const: ref
+            - const: ctrl_aclk
+            - const: ctrl_pclk
+            - const: scl_pclk
+        reg:
+          minItems: 3
+        reg-names:
+          minItems: 3
+      required:
+        - reg-names
+    else:
+      if:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - samsung,exynos5433-usbdrd-phy
+                - samsung,exynos7-usbdrd-phy
+      then:
+        properties:
+          clocks:
+            minItems: 5
+            maxItems: 5
+          clock-names:
+            items:
+              - const: phy
+              - const: ref
+              - const: phy_utmi
+              - const: phy_pipe
+              - const: itp
+          reg:
+            maxItems: 1
+      else:
+        properties:
+          clocks:
+            minItems: 2
+            maxItems: 2
+          clock-names:
+            items:
+              - const: phy
+              - const: ref
+          reg:
+            maxItems: 1
 
 additionalProperties: false
 

-- 
2.44.0.769.g3c40516874-goog


