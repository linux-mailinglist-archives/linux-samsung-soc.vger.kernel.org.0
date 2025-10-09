Return-Path: <linux-samsung-soc+bounces-11470-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA42BC9C5A
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 09 Oct 2025 17:26:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 86DF44F480C
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  9 Oct 2025 15:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5981E7C38;
	Thu,  9 Oct 2025 15:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xnf+tP3/"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAB91FFC46
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Oct 2025 15:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760023517; cv=none; b=rLFWR3ZkU/iWZ7d5kA9xYwBiknHI6UTgOAMf5SLZAKtbvqO5pOAT8ou+AkNpbakXCKyIM2sIRRCkOWGmH+lSnNHKC78St0TtzFMdwGk+wBBP8C+D0sO461q3bcyrXlS6WDfBJeTf4CGdf9uTepPZIiw3NxqYTiay8krWgJ5m0hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760023517; c=relaxed/simple;
	bh=2ZJZLMl7zXjFcsdeUrNL+qecigOdDpc1M2N0TGNsV+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PgH+4+j8CKMPclQHE4zxBFvbZcx6RHL6rfFqI0y1EUQAotHh46yFgIeqaa5Gy3+7FH5nrgnk2JOP4pObrveK8+Lnl46KpRN4M+8310NDLrCEdbLuwOswMhL1YIp57v+IXsgAqdUNB+dKIOH3o2lvTQdsm4ELBIdK1y6+/6wBvFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xnf+tP3/; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b3d80891c6cso335802066b.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Oct 2025 08:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760023510; x=1760628310; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yVAeMZOZRjoK+GVtbAGxhgZ6PYOesgGPyy7xYiTvQkk=;
        b=Xnf+tP3/FqO3/8VmwayGTD/Qpnf90+qOeDdccac/LGFX+zb5E6dbQu58a4rC1EIRwx
         8A3wYpaGNMVyH56NQ5kToIv1WTBwBTmue10r7HPXIKnlKRIKJ4hEGRTwmHycnvDYmp76
         eok7bgE6S4qURL4gYwd7OLFQoFVbDE81UjjKEfhmAoVOsZqIzqoiMjnL+s+Mkeqqh8KC
         W8+gGuhnVRrBIQpFYJnQaTiRt313nzkmfAcx/HPd0HcA/DPebm4nJnnkJ6pC+lw5gC+g
         Ox7TZj/xO7TRqU+1UIWixtTgQ2+Ll0JSL1j6GojdmiHQtrdP1LlMphupnj9aYrOKP7n+
         DsHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760023510; x=1760628310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yVAeMZOZRjoK+GVtbAGxhgZ6PYOesgGPyy7xYiTvQkk=;
        b=fMwbNjDJHFfLCoi9dlRefz0MHiDNfXXqgkVvM4qLMt9mx5jOywxtahOPLY7e89OFzr
         T+0iLH7j5e4HhbQer7NGNT9Ej36jbEw7ZbYQMg5x3UXvGYDRmHzcizgnAMzzlPkhDvK8
         e30YjDyo9NHEDWMx+WfxKSCzmoGUWV9ntTA1xeA+B3sCZeLfPJyXG6MokM6V3+Zmx8jW
         hepd8lfeJiYR2aNXoNKr+uqRfARMZn+XqTS6pjPESJvyFgTB0aifgGtkOR1ED5faJd22
         sUpmT4Z5OF4uaHVmjWYqdhpn1OPQXYEwOpEn67vfo6xGUddG72rlaIrzTyF71Fu5a/Bv
         fbnA==
X-Forwarded-Encrypted: i=1; AJvYcCXW4EsTPyXwEVh3wlsSxvqgEFKaX6wYLGcwLx/aL66RG8jiAfrKn8unesUGNMCVL11lEvTnR1uKobr5pwif91WTUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpKidCcnyWpkQKjnd1c2basMtJndQJOHxBzLdKvfSot9V7uxzv
	kgAVT78fp0B+vJVwRUU4cUuhN4bgqFu763Osw4v2dSWyM1ecJpkNiYidulO8Jm+Cg6w=
X-Gm-Gg: ASbGncvCrJqY/K1m3muECd00E/gO1Lh5ixGs8Q1hxYVtNGnKxc26acbqcvl/4uTZIKk
	qBPS0UWVbwpONHNMEq3kSe7wMErx4bjstWlz7Qu84BhtmPtGs9HheGIlBOFUOItvVnSGoNuJctM
	TqN92njI0fA7SvJcH042AjFcIcaZotgPx6twaYDTAI6RcKQ67TqfmIdBk0so4OpXV60HJn//AHO
	LAqbbmkDwLv/uj5Jyvdq0y6JjANRISLU4/W5R/6srcUVLoD34siyGgdlqrNVwGvHQshs2ywZQ1w
	+tgGbk2S4dBKiE0BISg8aBC0+c4mCcHhjfjLEpOYFQn/SbMVW+rRs0EPv/vIe2vO/ClyHdlMEjd
	+yuZuJJOZrMLj0o/Ij147usBEVuYJgALo7ZTuKM9YfrK8Qn48zGLrPb7u6Iel2WyY5rW6tjuU0i
	9+VnuAlfLSmgARDl5+UPDAT2X0iz6BmgSx2CNY88Ip
X-Google-Smtp-Source: AGHT+IHQigChCGbyX9QcN71UtfHBK/a2r2hCK545ETZ555mAVRYH/JS8za+ESngSjBgkhY0CJel3UQ==
X-Received: by 2002:a17:907:8991:b0:b33:821f:156e with SMTP id a640c23a62f3a-b4f4116a352mr1495403166b.12.1760023510322;
        Thu, 09 Oct 2025 08:25:10 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b36fsm1908967566b.62.2025.10.09.08.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 08:25:09 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 09 Oct 2025 16:25:11 +0100
Subject: [PATCH v2 09/10] pmdomain: samsung: add support for
 google,gs101-pd
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251009-gs101-pd-v2-9-3f4a6db2af39@linaro.org>
References: <20251009-gs101-pd-v2-0-3f4a6db2af39@linaro.org>
In-Reply-To: <20251009-gs101-pd-v2-0-3f4a6db2af39@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

On Google gs101, direct mmio register access to the PMU registers
doesn't work and access must happen via a (syscon) regmap created by
the PMU driver instead.

Try to obtain this regmap using the parent node in DT in case this PD
is a child of the PMU and fall back to the traditional direct mmio
regmap otherwise.

Additionally, the status is just one bit on gs101.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 65 +++++++++++++++++++---------
 1 file changed, 45 insertions(+), 20 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 15a1582aa92103a07335eb681600d9415369fefd..a7e55624728a62545eac049c9a51012a229f44c2 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -12,6 +12,7 @@
 #include <linux/err.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/mfd/syscon.h>
 #include <linux/pm_domain.h>
 #include <linux/of.h>
 #include <linux/pm_runtime.h>
@@ -78,8 +79,15 @@ static const struct exynos_pm_domain_config exynos5433_cfg = {
 	.need_early_sync_state	= true,
 };
 
+static const struct exynos_pm_domain_config gs101_cfg = {
+	.local_pwr_cfg		= BIT(0),
+};
+
 static const struct of_device_id exynos_pm_domain_of_match[] = {
 	{
+		.compatible = "google,gs101-pd",
+		.data = &gs101_cfg,
+	}, {
 		.compatible = "samsung,exynos4210-pd",
 		.data = &exynos4210_cfg,
 	}, {
@@ -107,17 +115,9 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	struct of_phandle_args child, parent;
 	struct exynos_pm_domain *pd;
 	struct resource *res;
-	void __iomem *base;
 	unsigned int val;
 	int on, ret;
 
-	struct regmap_config reg_config = {
-		.reg_bits = 32,
-		.val_bits = 32,
-		.reg_stride = 4,
-		.use_relaxed_mmio = true,
-	};
-
 	pm_domain_cfg = of_device_get_match_data(dev);
 	pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
 	if (!pd)
@@ -128,25 +128,50 @@ static int exynos_pd_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	/*
-	 * The resource typically points into the address space of the PMU.
+	 * The resource typically points into the address space of the PMU and
+	 * we have to consider two cases:
+	 *   1) some implementations require a custom syscon regmap
+	 *   2) this driver might map the same addresses as the PMU driver
 	 * Therefore, avoid using devm_platform_get_and_ioremap_resource() and
-	 * instead use platform_get_resource() and devm_ioremap() to avoid
+	 * instead use platform_get_resource() here, and below for case 1) use
+	 * syscon_node_to_regmap() while for case 2) use devm_ioremap() to avoid
 	 * conflicts due to address space overlap.
 	 */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res)
 		return dev_err_probe(dev, -ENXIO, "missing IO resources");
 
-	base = devm_ioremap(dev, res->start, resource_size(res));
-	if (!base)
-		return dev_err_probe(dev, -ENOMEM,
-				     "failed to ioremap PMU registers");
-
-	reg_config.max_register = resource_size(res) - reg_config.reg_stride;
-	pd->regmap = devm_regmap_init_mmio(dev, base, &reg_config);
-	if (IS_ERR(pd->regmap))
-		return dev_err_probe(dev, PTR_ERR(base),
-				     "failed to init regmap");
+	if (dev->parent &&
+	    of_device_is_compatible(dev->parent->of_node, "syscon")) {
+		pd->regmap = syscon_node_to_regmap(dev->parent->of_node);
+		if (IS_ERR(pd->regmap))
+			return dev_err_probe(dev, PTR_ERR(pd->regmap),
+					     "failed to acquire PMU regmap");
+
+		pd->configuration_reg = res->start;
+		pd->status_reg = res->start;
+	} else {
+		void __iomem *base;
+
+		const struct regmap_config reg_config = {
+			.reg_bits = 32,
+			.val_bits = 32,
+			.reg_stride = 4,
+			.use_relaxed_mmio = true,
+			.max_register = (resource_size(res)
+					 - reg_config.reg_stride),
+		};
+
+		base = devm_ioremap(dev, res->start, resource_size(res));
+		if (!base)
+			return dev_err_probe(dev, -ENOMEM,
+					     "failed to ioremap PMU registers");
+
+		pd->regmap = devm_regmap_init_mmio(dev, base, &reg_config);
+		if (IS_ERR(pd->regmap))
+			return dev_err_probe(dev, PTR_ERR(base),
+					     "failed to init regmap");
+	}
 
 	pd->pd.power_off = exynos_pd_power_off;
 	pd->pd.power_on = exynos_pd_power_on;

-- 
2.51.0.710.ga91ca5db03-goog


