Return-Path: <linux-samsung-soc+bounces-3676-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B299285B7
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  5 Jul 2024 11:53:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB3C21F2503A
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  5 Jul 2024 09:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0B891494CD;
	Fri,  5 Jul 2024 09:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WLZl4qvL"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B26149C59
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Jul 2024 09:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720173127; cv=none; b=GjrE5SSMg2cnShjropO/paf3dgUE/WlQL8aj7ZtHs0Xqz8B9buX62KHedB3TuL9WLZML/ooKC+/LjIszOTIxXQqsc6m7Cisq3cHk0T9emsZiv9DpfER7hRQpMyVFqufRuwq6CHnn3G7ONbneMSwlFwd1Ve+v0NmkD8S/0a2vzEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720173127; c=relaxed/simple;
	bh=0fSb5xqcGi4HKz3CDANpHnfXYtl8RCvr5qhaTQ5S2P0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=do5kazVBNPxeRZto6M12B8ReO9s+Rom4KkIgmEhX+JkiJADp6vJvXjEH9tZzITu9vR1cttTgPmRMStk6o5YWkrKWA5sCD2p5T5ZvzRojTHDgxrjWTbKo5nwNCyV+5OtFTADvLKv5HzZVPi7lyEmbBIVck7Qy/TblUt9ssum46Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WLZl4qvL; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42122ac2f38so9045765e9.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 05 Jul 2024 02:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173123; x=1720777923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GzjIIKaoQE5SHKk2q2uAy6nqX+WGU4NAuF2D0sAZ4sQ=;
        b=WLZl4qvLy90WwQXQ2yVLfo5/sJ73stG+g9o6/L5OT9SQlBZparNNH9opjJzaeVApoK
         KJN+mDT8JVjitS6CrmvenyHCl3M2qCPupVcujQtYZfp8xFIPs/2627e1yNK3ZwsmVJKS
         n9sdlgjILYpblWhDAOy6UqZeDX1vDI1wJwzrSTkYwDWwwnWiSV6Hj9StSgLtuS9CZQGG
         wt+NdKrT8VGtP5M1iA2/VPgwwoo5ADPnqg0KYh4SK+s9LaoplIcjmQeegUU266PsIe49
         s6d5o9sT5PhG3aqXzJB/5veqUJOEIDs8+D7F2Gja4y6TREmw0vJMONVuca86VihbfiW8
         UqeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173123; x=1720777923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GzjIIKaoQE5SHKk2q2uAy6nqX+WGU4NAuF2D0sAZ4sQ=;
        b=YP/+K3iKtowJF8e9O86WQCNuiog3PpNZXo1cAj9eb5Z1CFQnHGHUHt1o6CvLg995DC
         HP4ERCEDr9lyeujw6RYu6u3V0aluiN9+KuNbeu78h9gf9Rw9TNcQplh5C/l6A1fjK+/x
         zm6lK5bkXLlXZ9HkgS2lc75VUvh7Y1034i9MNvoNWLACN8Uup9JytonnEfDAFqUuxOwg
         bLKCzrV/BC7oYx4m9hoZrql0qk+l8ouwwlvF9wvvrvEeBQ9fOBgbPSUnmW5gdRTqBRBa
         1frkQ05UJw3FylmehkzEML9W3cLHj+8pjEZ/xFnfOtLXzEqdpKsGJ/ebkezdlv4Hx2tn
         rK2w==
X-Forwarded-Encrypted: i=1; AJvYcCUI9r+3VMUEoC+O8YK61ZjAsiLcaNsBAh6YBBWc9Whl/I3WdL9DtndaiJQmEch5Vk4PddzeHo7j9m2LpgPv/o0VtgHYrRPSvOftzyC2i36Qe2Y=
X-Gm-Message-State: AOJu0YyN5qIrHP5YIa+iX7Xe42MWeIIHjF9hB86IqykiJnGXc6RKfKVX
	LGKwtd/2RhdZiWjN5rX498CPZlaUu7ZyUNsWWuLN67pj4bdE1StMuSH0WsatVvs=
X-Google-Smtp-Source: AGHT+IEQcA20h38s2g6Ses3CSWYigWtghZ46X0AMmLlWuAFBEueee78GxaQQ7J8Wp1trOqfa0lXIHg==
X-Received: by 2002:a05:600c:2d16:b0:426:5b52:84fb with SMTP id 5b1f17b1804b1-4265b528599mr450995e9.7.1720173123637;
        Fri, 05 Jul 2024 02:52:03 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:52:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:24 +0200
Subject: [PATCH RESEND 05/22] dt-bindings: thermal: generic-adc: reference
 thermal-sensor schema
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-dt-bindings-thermal-allof-v1-5-554061b52fbc@linaro.org>
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
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1284;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=0fSb5xqcGi4HKz3CDANpHnfXYtl8RCvr5qhaTQ5S2P0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8Io7vHh9SbWP804f84WKaCS+gN67JOZDpJ41
 c7gdcSv29+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCKAAKCRDBN2bmhouD
 1+8WD/9874fMQJU7KMpw+RJkf1AXrSErvGZqp1YNJWcmDsOz+1Tp2k35XRBfCNDd4nDARTBW6JC
 /Xr357TKiY69Zpiz/6IcOBOXOrbsS+3sovbC8/+gW/BhEBaSTTXtHv6KmSkXSD/Nz0AlIYhZUQT
 AbIefNplxTDpH/VzarDlGXQfXRb43L6qdntvnUaECYnMZtahhPE2ejNg/PT7hEBY4GJZwwQQw2q
 uwXWuOGuU6JW/1Nrjk36mNrl0gb0RXhvPTfCp5uF9+iAwWKfwuIUN5WJUj0+jRNrJLwLjDBQ5EO
 U9xpRjZnhahvHyOAuFjy4loDCHA7X1galk/JwSl87mAZLVUaQo1uu7EfhC/8z/eyOtnDlPZePV5
 yf6clqtHUvhyzXnMnzqY4AegFT94QQ3x7RYMClqZGB6DzPFaDUqbuOtp9OUmhOyyNRfPnfG/lVH
 84Q01sbbgVEq7fUfcG7ckbBBr9FVxuTkSSLkdwiVjlzUcby0YT4gZ6ZEceVL6qEr4G2ft8xvnYS
 t1tyYn5KC0qS5ag4npu4NQUCZJ0fW4yol49RHj7Haxf5nrLnMcLD8KIwdGi16A74pjmP4JdmuPP
 fLFzRTf3fo6D6ftg7zQmYHZnAiuFZDmyEhvuBRZRo4qJTJ4bx8zqTE/LMpApxQJXMYaFm9iyj6j
 gteb/K4P/0ftdsw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml b/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml
index f1fc3b0d8608..12e6418dc24d 100644
--- a/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml
@@ -15,6 +15,8 @@ description:
   sensor resistor. The voltage read across the sensor is mapped to
   temperature using voltage-temperature lookup table.
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     const: generic-adc-thermal
@@ -44,11 +46,10 @@ properties:
 
 required:
   - compatible
-  - '#thermal-sensor-cells'
   - io-channels
   - io-channel-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


