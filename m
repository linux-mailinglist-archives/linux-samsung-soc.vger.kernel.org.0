Return-Path: <linux-samsung-soc+bounces-3348-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FC890885D
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 14 Jun 2024 11:51:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48B001C20D07
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 14 Jun 2024 09:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E40AA19AD67;
	Fri, 14 Jun 2024 09:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="muuM3YKf"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9428C19B594
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Jun 2024 09:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718358422; cv=none; b=Jcm766+pzlofGeuxtnzlJSCPMeeNECesSRQa/DTjEWCuqFa+A9dkui42gwHjxpd1U0CEyskDfvRry0ISA04u0+kYeF9BrVLPwpC6SfdvZ3FJ7F/wFRhGHwEBG2XAZIF23MTHy30Ul6GXY4C6PlaQK5J5jScClUqYQgyhVPAPuVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718358422; c=relaxed/simple;
	bh=/6wWwz3JluzattdX99NimqBlUNVjWbka1UBxHUaruXM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fWSnqUR2DIpgtLw+ohuGT6aBztSlUJuA211l25klFJqkS/9XupmN01F0d+qX5t49Srx4V6lNAJQw7Z1unP1L7dJxeJ4w4W+B6Oz589aezNcXxPHp+KzBDQ5CxQgv9uI/e2Pwl04Pa6FOtaOvyUNqE7uH0nG2Qq8qfw2F0esdBjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=muuM3YKf; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a63359aaacaso290934466b.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Jun 2024 02:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718358417; x=1718963217; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lDonAMNFdjRidSbTzE2VeZbqHbNzDw2rLK+EzxgIQKQ=;
        b=muuM3YKf0zKSdDMfmqVvbi/G89ys9TawCRruU9m79uoFxSTJz68Ul+g7wIc7RrRZ0E
         Hv30gxcfFFA6DFefevITjg8HsL2X0vCDyNH8mmemV/kCxk0ssTjBWilopgQuw8DhQhzN
         VqAl2N8wRZ4ZQZF2DM0RVXK9bt1+kzK1x89EC3RGl98wU5Vy92OZcZpORg8UR0tyProD
         tlY9PFlfKvURfHL74PLGS41I2pZUW9RlDFWA0EKx1+VL/ez2Z9a824JICaYM/8aIBHvm
         Dme3P6rJKo5h5pUI3cDTLwmOuqNX+n6Jx2xJKjd8apb9UoAx+zrzPfyjP/zwnbTa/MwE
         sUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358417; x=1718963217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lDonAMNFdjRidSbTzE2VeZbqHbNzDw2rLK+EzxgIQKQ=;
        b=i0cVVGUP3+7cXEDx41KXmRSet7wh1dNl96LffSFvVxczUgTcOIEVo7sza6RoQbABGq
         Ur68LTvgHLt0qO7di5Wr4/1QC35Jt6LpcUEQ4v/uj6g54av6Z3zJsyuML16DDYNzUcQd
         VeQpi2GehHisy1Q8pQemqh8Hvk8mf7TAs9HYdkyQrQ/jN+mth66UWzpi+Gwv+8ojUKNL
         MBNLxvAYUZDzjFmg/p/ZHQtItXMGhJEC+cU1b5yNuOjCL9kF0Hjs00uFoakMvhwTbiIw
         yLziSsWfKy7H4lo8VJmZfiV+Cc2yP0SHuNabC4dQ0R+X3Nbe8F9ml0eNBjk85szOUwAc
         Ej6Q==
X-Forwarded-Encrypted: i=1; AJvYcCX7m9urPNcNAIRuL+T/nlMzC6PNAYVC3psShAcHjRityxCkK6rHH/Smw331iaTEfrIjubMw2zLaNUjyzwNgnqRU/YGa8czySf+zr+GeZ9DYAXE=
X-Gm-Message-State: AOJu0YwHk1JtECtFAG60nz80uVp64V6FyDWzyzgbILv739EWquda5qSu
	9Ua012fXlKtVYrjxF89pDJMATeoIGbmgku63A6ygNWJR6SS/WmPgEG1uYHs9XAA=
X-Google-Smtp-Source: AGHT+IHz28IjgUQ7U5ehLpzH5+jUV2U0S/83h2/duO4Fd6lcxl/CpvaW1wx2mz2dI1mqpyUm6hYWvA==
X-Received: by 2002:a17:906:7c9:b0:a68:a800:5f7e with SMTP id a640c23a62f3a-a6f60cefe50mr157252366b.10.1718358417082;
        Fri, 14 Jun 2024 02:46:57 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:46:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:10 +0200
Subject: [PATCH 11/22] dt-bindings: thermal: qcom-tsens: reference
 thermal-sensor schema
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-dt-bindings-thermal-allof-v1-11-30b25a6ae24e@linaro.org>
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Anson Huang <Anson.Huang@nxp.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Amit Kucheria <amitk@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Heiko Stuebner <heiko@sntech.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Pascal Paillet <p.paillet@foss.st.com>, Keerthy <j-keerthy@ti.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 zhanghongchen <zhanghongchen@loongson.cn>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1315;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=/6wWwz3JluzattdX99NimqBlUNVjWbka1UBxHUaruXM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFpP5m4FfwjNs38ZYbMHhqa8b7/avK0eZsSE
 kfrR5Jx48mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRaQAKCRDBN2bmhouD
 18dbD/4xycIH+gJM5EANhxts+rsYJ2zI9Q3VGEKKys+fsHsQHSeDcUq3BjYTf2RtbsGpAvzbLWT
 TgwweXyrov9nVOdYhqpXDijhLPu76W3YTMtfELYYg6LJasi++K7EKhU4hYoWRundI5xdgiFatip
 kED4QhpWKCeiRFkcuBHobLIk1Ej2UHChTV+GgNBG8SMpKieN6czbuPBegI2Z9q53dE7d+I3wInD
 U3y4coWbuqnG3y4fGCyDOxeuABd4r6SAu5xGmxtSdSuFWiwnQTJhJBzUfX1bx7Am2ffyv83isj7
 3FiGkRJcnQ37ef9wwXXi3vSOAFIfdnfBNF0gntZWLyCyYg9bCMqt4NNoIwrJwRG09AptKW0CwvT
 69dQ6XzmAjvsPf2mdotAoEq3PlcTzXNyeWNMAbesz/bQeH9gGijc1a3zJuVg1xRuWj4Kl8A2nqc
 1jeYNmpnE7k5tQPvsj/rxNuqKoTq3UvaYX4Zm1+oRDDENmjLqGZPXbySe8QUY0mSss8CfGujCjL
 ltRXaUg313i9ERx9JL3KLw4RtEsWz6iZneFYg8C8lESgto5sjqiMXnxS8xJhr3DsM1a5gXAgDqg
 TvUZT0ltvHuJRMm0DQQEpAD6P4pePJS8filu+B4c1mAoQWRid5Jbp+CIuFJSw9y/IUhxcxu7Hrw
 avotNFSDZ5f2ALQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 99d9c526c0b6..cce6624228c7 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -217,18 +217,16 @@ properties:
 
   "#thermal-sensor-cells":
     const: 1
-    description:
-      Number of cells required to uniquely identify the thermal sensors. Since
-      we have multiple sensors this is set to 1
 
 required:
   - compatible
   - interrupts
   - interrupt-names
-  - "#thermal-sensor-cells"
   - "#qcom,sensors"
 
 allOf:
+  - $ref: thermal-sensor.yaml#
+
   - if:
       properties:
         compatible:
@@ -292,7 +290,7 @@ allOf:
       required:
         - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


