Return-Path: <linux-samsung-soc+bounces-3356-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB860908896
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 14 Jun 2024 11:54:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AF0828E0AA
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 14 Jun 2024 09:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CB891A2547;
	Fri, 14 Jun 2024 09:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nRNwoTBr"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2291A0AF6
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Jun 2024 09:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718358440; cv=none; b=tJ9QBqyr+gqR71N0/OIoOEZBW2n8lDGZfDYSvG/lb5H0SAtZCJAzxtOdLDqQKomwRzPZ3FVsFIASFGtxHvpZlQ4gQVrgl1V4dNrkJ98HNWtNBDWj+PeGmcqABiz8cZZBKKi07dplTxDxpI8Dt1IGizcpPyXRNdRc89WhUKmvT1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718358440; c=relaxed/simple;
	bh=K3V6Xak3YOQEHnMj7SlQYHGX0YMx6fkXwr1FCTF4hC8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KBg5DHmfEutKzOpB2IugRyNsLfuQOriTCsopZad6lX27qqH09akaM6m6kbUhHnNrHUICT1hJfN/8kkAKIxlEDPFRzw6MmVJDi1LBug9S/Gd/FyjLR+Y0Chd0dN37Io7zA9aZtjhbh1AxVl/WVaDM9zK/XeTTwLgp9rzpKGZhVr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nRNwoTBr; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-57cad452f8bso2096139a12.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Jun 2024 02:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718358436; x=1718963236; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HHopPI0nIM3Jed8hUXyS5ig9GDwCMsqicv3UZ9klXRA=;
        b=nRNwoTBrOsWQD9gwczHLMsUUiID8d/tQ+FjLuiZW1vBCk4TPYJOiyXfkwZ6SmOiqVC
         v28Hr7feemLV+UbZa5UJRMVn1X/IkB/2OkD7a4QLoitwME16MnpF72vUHtop5Z0aII1+
         0PHivIaHGpssU+nhWsTOIdZVUwQtkIp5wYVV3A3FX53nHUmeoJXKZve9wuVuToPJe7v6
         pQcaVJ6V6esL+piuM4PHzaXDvtSSZKZW2YMEyfV5kF5K+GEToyKJlU6riyxAwy9tIJtx
         ISNO5lLvpKTp27eygrkMjgHF5pL/Luxu4Rv/Lb1NQmUuI5PcFIkLhYLt7gi3Fxo858zv
         sgiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358436; x=1718963236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HHopPI0nIM3Jed8hUXyS5ig9GDwCMsqicv3UZ9klXRA=;
        b=kyVeXT4Nwgx977VXHoYZZq8jF+xXeh/VXRBkHl+PpjaMsKTUrxLqzqW3kx71yyMTX5
         noNU6DR0IwvTUnuB9pd9vT90+24uTG5Mai2kpxX86WyUigfQ2PV7gY+RWfje6z/kePVm
         OM/c4WqrZc2LYzaZ5pzFYcOV8O6Hx/71PcSeo47mDp3fZYIdJY+EZuu6BZ4fyrQJpipo
         +tMvLcb2swDv2OFQFunJPqssipXMuzDF2Z5u02G0ha6BNXf1n0zSfQz8K65sDdoA4eGN
         nXve0Xs+kxHlMQQiYW8WXMWrGULtyeeqROZjCr5r+P4D/Bpjg6nzVWR28wuLvaUOBOAw
         5l+A==
X-Forwarded-Encrypted: i=1; AJvYcCVSRgi0j7LeGPia6ip6QJKtrA53g2lwNxtUWVUYt24rJ2+mBI1/uzaXwL0uo7V/TLG3NnP1wnTaHgyb96/u5TEfk9m74LivssyZxbWfyzETp1k=
X-Gm-Message-State: AOJu0YzAvVk+DUnTY2pExuQW5Lv17W1W+mdCEZ/YMQKELQxlhLHvpcV2
	tlqEEbGNsW/t0DyW+VKs3vNSEDEl6aVLxX+r6/hwOknXsyZ0R+HvzSpXwH8NUm8=
X-Google-Smtp-Source: AGHT+IFYhCUuIW/shPa24Bm16cB64oTNa3LMl0BHr5SyTcIcKZ2BVmCvxjUSzjAK1w5nMGYHiOtHug==
X-Received: by 2002:a17:906:35da:b0:a6e:f6bd:edd9 with SMTP id a640c23a62f3a-a6f60dc51ddmr140028766b.59.1718358436151;
        Fri, 14 Jun 2024 02:47:16 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:47:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:18 +0200
Subject: [PATCH 19/22] dt-bindings: thermal: ti,am654: reference
 thermal-sensor schema
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-dt-bindings-thermal-allof-v1-19-30b25a6ae24e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1128;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=K3V6Xak3YOQEHnMj7SlQYHGX0YMx6fkXwr1FCTF4hC8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFwqmuRGwyBRQ3wR18ecSX6kfmBdIXE+Ent6
 hAKRj/Sko2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRcAAKCRDBN2bmhouD
 17hkD/9OxjeCJICdurLShHs5yp7HzuR740CrmJrC7McgPnyp8ztY0sSwbQvwGeRuMsaxGidE0J7
 xqY0L6Ioab0oY31XiF1QnateecuxDA9T1PBUpytt4fbqwY10Qo5yKBPBX4OBCNAvwl6BVE2Me5N
 4t7i4RblHCch1dz5REf2XLI28pklsg0B8zZIVH4GGYVP8w3Zb3cg2gpT8O2XBsi5teF4w2pPjYW
 E+yohdnJv/uikgyAzHZ7gYKicgkaA48sLZKA9i+UyrTEYxz3xdC+qIpl0SHa7U54fKUpvIuL5tA
 1ozQi0DgXwHEMJo7Zxpkx823UnjbRynt7urLGgk2Zr+mNj1itWuyxVMw9uku7tJrSwBAIPgSXnC
 1GWhPTu8jS10dmPcl8LxdQMZzbOSiV1hdWeDFvFxEXkY3DHy7EaGTkRMsSqo9jJzOpLq/OxqFSa
 1Bd+lZllAcbV4piQt3dFG2rqt2/HHqyRzp58F8D/YSexdS8VQ2cU9D+Ibljv/xuvluLhIfuoVzb
 T7/0Whyrz0JrF36X67nkYcnekOy+Htkzl3/sFJ1rj2eXxrAEZeGoootoY8/rwk/+eAUHpRhd1YM
 STNX8eI0cUshXtTfkxs52lVyh6zDP4i0jhk1mN87RJ2/sQgDita8xLImSYHC7tTKXeb/34qVmbe
 OF5UQMHSan3bk9w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/ti,am654-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/ti,am654-thermal.yaml b/Documentation/devicetree/bindings/thermal/ti,am654-thermal.yaml
index 7ed0abe9290f..16801aa78bc2 100644
--- a/Documentation/devicetree/bindings/thermal/ti,am654-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/ti,am654-thermal.yaml
@@ -9,6 +9,8 @@ title: Texas Instruments AM654 VTM (DTS)
 maintainers:
   - Keerthy <j-keerthy@ti.com>
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     const: ti,am654-vtm
@@ -26,9 +28,8 @@ required:
   - compatible
   - reg
   - power-domains
-  - "#thermal-sensor-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


