Return-Path: <linux-samsung-soc+bounces-3338-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7909D908812
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 14 Jun 2024 11:47:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29A9E28923F
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 14 Jun 2024 09:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B9EF194AEA;
	Fri, 14 Jun 2024 09:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V95a36Pk"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F340D194A40
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Jun 2024 09:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718358397; cv=none; b=rKabhFXN1znjKwemwlQmvGROCUMI1UNxev8sEWwx7G0w0LUJYGhZJ9nQtzXafQHt6wWvIshslck8m6n4+NjBWvzfKnifZOiaEID9L5zStlHo7Tq8VSYeeyEi9ROni2AocjOFwEYhUHhtIp+OYHVliwd94hxbMrEqLHTQj+Ihf5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718358397; c=relaxed/simple;
	bh=o/ohlTOc9KfTRaCPoCM7PQRM1DXdEoNuRz6NEcHjNQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=csnytCdEwMJOaILEuOlgig1ZZX6cdB3Lp6mdSRZnF+dT764GRfrV+k5LRstkDdgebgLbS8QA6Y/54y87c3fYlN86HE+cz7w6a4lyWaLslSkPGerdCIA+h2gokKr0ssuNRDcePoJW4g0G0az4uSjpPF5Sonw5HoJTmuyMOLk0hpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V95a36Pk; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a6265d3ba8fso224040166b.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Jun 2024 02:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718358393; x=1718963193; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=avklu/LU82jj+cALxmDCOm5wOmtJui6AiuCC9bJewDI=;
        b=V95a36PksyilLGrrGvxgrlKHOvwPCxiQe4n3n/VJicoBKXYduJKSfNMJJAhEK2sKd+
         cJww+hpczivDcbvbsic1nntaKK1ISoueeC5S11apnqK5EyhBe0GX/cBGqnjWsOX78giI
         izd5bmeYwnTu2dIhqCPRYe8q49G4Tbaq3JhYXtAUuSZ5LyAWEcutrebQOGzin3/8o6XI
         qESvmQi17V5FYW3bvKCPq/klcW4V8E+o9XJgOAwDKfrrScuytk7HvQCvE+qQagMhWHLU
         MNizPwuWA0sK6l+Gp8wcegUnfcG+xMzc7gWh63+KdgYiWSZrr7XcxynOhgJDnDGGYEJo
         v2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358393; x=1718963193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=avklu/LU82jj+cALxmDCOm5wOmtJui6AiuCC9bJewDI=;
        b=Qg+fR5jd48VI9upIJYUBhwxdJ5aakwvRf7Fr6pnkoaBKiCl6YaxFVCXrZcfhL059p6
         6xiqK6YX1RUcVJEjBQ0NoHORrTVwQ8LZv2rDT3BaYe4hTPSXHn3HoEfZU5tDYuZRsbVG
         oPH+QA64u2COXs3lvG3pVSTAjtbmIR4hK0LkDNiSq66OyVGrKKgtkfOykLySYhhm+Pdc
         p9J//tDbRnp4h9ulOfIiE6YQn4MvkRbKZQmk31BQl/Q7Ppsevs33JoexHecIED3/RiMl
         PSHKN1Nvuzl0DhAbJKALB+VOY79a6lWpJHNoAC9A18+Sd6GFU6R9ROqusBZKuFEwrZNM
         e+lg==
X-Forwarded-Encrypted: i=1; AJvYcCUy8y5wSBBQQvu2PFeG6IJCKRxfEJTilNUJWm3T+CF5mbiR6s+v0SJXbD+M6aVWhkfExoDknHddtt/3oBHmw38sn+5sXkMEWueFGPpOr0pr0FI=
X-Gm-Message-State: AOJu0YxrEoDDH2langNIu7Cvk93AjmaKENWR9JbLOLuh/c9B2t+z7LyG
	hD7tSlAkltCM8726h7VgXxhJVEliC1Ywrv7/88OBxY1I9HP/Qp4Nwf3rdSQJSME=
X-Google-Smtp-Source: AGHT+IHc8zNmRNPYWsXhCA7MoKknrWARGiqEErjEA7EPJiugC3+uCcXA6vzUtvvo+0m41kAXSMLaxA==
X-Received: by 2002:a17:906:4f08:b0:a6e:2a67:7899 with SMTP id a640c23a62f3a-a6f60d40d5dmr130599966b.35.1718358393130;
        Fri, 14 Jun 2024 02:46:33 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:46:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:00 +0200
Subject: [PATCH 01/22] dt-bindings: thermal: samsung,exynos: specify cells
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-dt-bindings-thermal-allof-v1-1-30b25a6ae24e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=971;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=o/ohlTOc9KfTRaCPoCM7PQRM1DXdEoNuRz6NEcHjNQU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFgD+j2f0+0l+ZGzVoLt+GTSfmeFZ0/xFupz
 gM/exa+G2uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRYAAKCRDBN2bmhouD
 17UWD/9rPKTI+tMaPQFTlp5uhC2ZDUXtE+aHbXinp1xfhtKaGmRXZPjkC65fY77bv7i6yQRv6gt
 /fKHWgHUfbeZwaa8sLIoWVjNidarMXil19RyBVVS/TUZFDeMWnwjS+fm9iXKBUfRnpMOa62TU2L
 kkmSUExzh8qJR94p9QbOi9X7YjUrb+tLj9qSxHZCpOJ/Tdz9zxla8stRMJOk7zk3ngsxw0I54LY
 /kRWdB7QRmRL9feq2bORXU69Cx0/+IBI6OVYGgJgd47ZledM5Et8RdHsqpmRAGIdHsX56i6cvDj
 GvicuzQdYQdru//vJhKlbkaBs9r4hB2ytrjZlnPAupY4zBvVtemJlddl75Vp4oD9xZAWBk1UfuK
 03b3zwfPFtXs5BevCXwZbKrem/YxQ6hPUbqJK3mAjXEltK+Pewe41nrPZvc0H21JDLVZyAM5CJp
 cbmIwvpjsbfRK34Si4EHtZlToTQe9CrK/mWbJqZbSSes1wvnu61YYbpR11HXj4DweUK+XMhKcUk
 RITKeqd9PUnTBvThlRPuhVi60hSRoAhu7LuVwJGyP9P0c1Y1B4FTe3hJRjveJ+5JqrUpXFe9GRf
 BtwKCcHO6ds3Kt953XlQKlzs/QRPAPvl17NBePvebpKqc8Eg1YIbWfof/OGSbv5cAgmGm3xm2kD
 K+P00ork5CoDpvQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

All Samsung Exynos SoCs Thermal Management Units have only one sensor,
so make '#thermal-sensor-cells' fixed at 0.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml b/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml
index 1344df708e2d..29a08b0729ee 100644
--- a/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml
@@ -61,7 +61,8 @@ properties:
           TRIMINFO at 0x10068000 contains data for TMU channel 2
     minItems: 1
 
-  '#thermal-sensor-cells': true
+  '#thermal-sensor-cells':
+    const: 0
 
   vtmu-supply:
     description: The regulator node supplying voltage to TMU.

-- 
2.43.0


