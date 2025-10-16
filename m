Return-Path: <linux-samsung-soc+bounces-11657-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BA5BE4697
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 16 Oct 2025 18:00:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ABE74508D5E
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 16 Oct 2025 15:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5464369997;
	Thu, 16 Oct 2025 15:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GNAkV3su"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6313570C4
	for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Oct 2025 15:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760630334; cv=none; b=Q1tLFMl0/G+0ktHurybzSw+W6fmFgE+HLoHXtPb4n+mYjOCjqxXnxTTzCWILkDBXqLPrZiyxR9VGlBT5Wre4/+HBeuiv+SgRz8H05asqDL76FH8VXUoAwhTz0NeEG0ElpThqv8dnHa07qjS3A0qledrsyt02lVrtES5D17RUxyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760630334; c=relaxed/simple;
	bh=nBudP7+99iBkFh3qe0ZdmQhnQbG9lraMj3SNNZddgS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RVxVYLJayLIJZ1xd0DPDAz3oyXHFlbUP6ziIwauIYBov8eU4m790PXVaiIKHZXFR7Koya4i456lvDX4V79eIwme7HA7f0cZZ3j3cPRAg+YZPnU3ajHm9IvIXRR0C5uumz6HGNpStmTcMDu8jS1vH/eOaDxORayYEbFcWJ6pX++w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GNAkV3su; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b3f5e0e2bf7so169373366b.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Oct 2025 08:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760630329; x=1761235129; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2sx/VxWL+zXIwDerOXQo/SlWkRBTA5eJCirxOIqSzME=;
        b=GNAkV3suTsDAN6ToKuVGw0fGPLQvnp18+ciT1jVT8f6FHuG8v9AUPgyMdO03ZfoF+X
         b5FFsOxSdh50k8VkA3JmZF7Ur9/aODklKIt4zTsdHfb/B6c52WAI1zlxAHLnGt8Uq+P3
         A2TP6YAtud+t6Nf6PlB+YgZ6G1lWiMa3hiN1OpHneSSnfe4XQoRU4s58owiVx5CRf7kK
         250IGDobAQfoF6RorYl8zku/qE+K2k9gE1KzQLhyIN+RlDYc8S5BauisCFWUMd3/rpy1
         jrtg9zqLIa1Hw0RyOht8nANbBAgZ7A7Pm3hbf+AO96gJmlK4gdWZfxCofNZBW1eoFmpw
         sx1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760630329; x=1761235129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2sx/VxWL+zXIwDerOXQo/SlWkRBTA5eJCirxOIqSzME=;
        b=NlFkFfg+5U0+NAREZTzQQunPFKAhEC1xNgirE83WbATDgVpGDkvyiqP6oa1um1KwAR
         sQSVWz8WMZWfvrtmsoP3qjGImRY2bRMJH0q6xcnp2SsoSAUZ0b7nK8yUdGJkOs3yobbv
         6iBv4faK9iS3VAXLOKWVimnlJfhRXUdxohSx1SqzrJcJCm6Dz8k7X4qG4itTk/z70MIG
         ttl9G97skTDeBIO7tdy6UxVzBJ4G1x2oGLMzcSjAoBC0qZm1ZTlADk5CQtGOpub/hFgi
         Djo2Sqo8WrherHk0Ny9fcqTQxWUpFtJvbjd9vOy3wCWvqykBbZBUUGXSN/xSVUMa8e5F
         rmIw==
X-Forwarded-Encrypted: i=1; AJvYcCXB1N50q+sUjPhrACy68TxfXnSY4ORCylSukvKj4ERTNSMaNaZXpL9BFzy1PtIA9tr2MHjivBV/uYmDmV/r5n01rw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyXuGNhyKnNoCuxPzvjJk2ovBUTcTpEMzOd+Q2dzsJrXwF9Djy
	PtBlIh0lZIJmCjJv0Iv1dXbZJeKPD5YKDncn56UjcWUrWuiAfO/sl6YH+tXJi5x10Vk=
X-Gm-Gg: ASbGncvSlXMGZZwnI9CypPt7mJ+GKmG3ikN9qek9ocD4Cb5a34ABaNRe/tOU+0IuuH0
	jxPod+a+PCeVL79NtLyGsLygTKAQQCB+4SGpxekJ7I1Tu5/yUD9ORBbi3/nlWMCGM2+sLJGhRx6
	CobC1GLyHzK5I5AsDWN6YrWrkr/Hyk8ImdYqjxABsWhZrDfQc4oPg8OV1eolyx6maesK58fsrhe
	CzNQoS6xr80yj/9a0pgl3vUfMjsgoimA/JXt0LAHMA/HLVIl6LNQOkrHD7G2xeNdeoSwQxz8HFy
	AFY6aTZsoOOCTlsZY/Jw/Fz8R3apWegzbb8SURwFlQpJxpRqtiCGoqZvPGVUo8cCDtSR2HSTdqn
	QMbXx5JBbDZflHfetbo3eb96DSmWhenc1JrcgAMPvi2+n7bpssQmMqbBEuLVc4NDCu+quIvTezw
	J2ataw0UBuhnwD5r9YbLA2XI3MOGUa+BjLB1/mRgfzmDas3AV4G+JfOrK+UttX
X-Google-Smtp-Source: AGHT+IGK8Ey29vlNo00zlc+GOkFyC2bjHLvIDXKhESpfZnJ6rq6388SEUQEklyoTNIyqpHblnkTV0Q==
X-Received: by 2002:a17:907:2d88:b0:b40:33ec:51de with SMTP id a640c23a62f3a-b6472b60651mr49198966b.8.1760630325841;
        Thu, 16 Oct 2025 08:58:45 -0700 (PDT)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccccb4811sm549021666b.56.2025.10.16.08.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 08:58:45 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 16 Oct 2025 16:58:38 +0100
Subject: [PATCH v3 05/10] pmdomain: samsung: convert to using regmap
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251016-gs101-pd-v3-5-7b30797396e7@linaro.org>
References: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
In-Reply-To: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
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

On platforms such as Google gs101, direct mmio register access to the
PMU registers doesn't necessarily work and access must happen via a
(syscon) regmap created by the PMU driver instead.

In preparation for supporting such SoCs convert the existing mmio
accesses to using a regmap wrapper.

With this change in place, a follow-up patch can update the driver to
optionally acquire the PMU-created regmap without having to change the
rest of the code.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
There is one checkpatch warning, relating to the non-const
regmap_config. It can not easily be made const at this stage, but a
follow-up patch allows us to make it const and the warning will go away
anyway.
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 78 ++++++++++++++++++++--------
 1 file changed, 57 insertions(+), 21 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index f53e1bd2479807988f969774b4b7b4c5739c1aba..383126245811cb8e4dbae3b99ced3f06d3093f35 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -9,15 +9,14 @@
 // conjunction with runtime-pm. Support for both device-tree and non-device-tree
 // based power domain support is included.
 
-#include <linux/io.h>
 #include <linux/err.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/pm_domain.h>
 #include <linux/delay.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 
 struct exynos_pm_domain_config {
 	/* Value for LOCAL_PWR_CFG and STATUS fields for each domain */
@@ -28,7 +27,7 @@ struct exynos_pm_domain_config {
  * Exynos specific wrapper around the generic power domain
  */
 struct exynos_pm_domain {
-	void __iomem *base;
+	struct regmap *regmap;
 	struct generic_pm_domain pd;
 	u32 local_pwr_cfg;
 };
@@ -36,31 +35,37 @@ struct exynos_pm_domain {
 static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 {
 	struct exynos_pm_domain *pd;
-	void __iomem *base;
 	u32 timeout, pwr;
-	char *op;
+	int err;
 
 	pd = container_of(domain, struct exynos_pm_domain, pd);
-	base = pd->base;
 
 	pwr = power_on ? pd->local_pwr_cfg : 0;
-	writel_relaxed(pwr, base);
+	err = regmap_write(pd->regmap, 0, pwr);
+	if (err)
+		return err;
 
 	/* Wait max 1ms */
 	timeout = 10;
-
-	while ((readl_relaxed(base + 0x4) & pd->local_pwr_cfg) != pwr) {
-		if (!timeout) {
-			op = (power_on) ? "enable" : "disable";
-			pr_err("Power domain %s %s failed\n", domain->name, op);
-			return -ETIMEDOUT;
+	while (timeout-- > 0) {
+		unsigned int val;
+
+		err = regmap_read(pd->regmap, 0x4, &val);
+		if (err || ((val & pd->local_pwr_cfg) != pwr)) {
+			cpu_relax();
+			usleep_range(80, 100);
+			continue;
 		}
-		timeout--;
-		cpu_relax();
-		usleep_range(80, 100);
+
+		return 0;
 	}
 
-	return 0;
+	if (!err)
+		err = -ETIMEDOUT;
+	pr_err("Power domain %s %sable failed: %d\n", domain->name,
+	       power_on ? "en" : "dis", err);
+
+	return err;
 }
 
 static int exynos_pd_power_on(struct generic_pm_domain *domain)
@@ -109,8 +114,18 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	struct of_phandle_args child, parent;
 	struct exynos_pm_domain *pd;
+	struct resource *res;
+	void __iomem *base;
+	unsigned int val;
 	int on, ret;
 
+	struct regmap_config reg_config = {
+		.reg_bits = 32,
+		.val_bits = 32,
+		.reg_stride = 4,
+		.use_relaxed_mmio = true,
+	};
+
 	pm_domain_cfg = of_device_get_match_data(dev);
 	pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
 	if (!pd)
@@ -120,15 +135,36 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	if (!pd->pd.name)
 		return -ENOMEM;
 
-	pd->base = of_iomap(np, 0);
-	if (!pd->base)
-		return -ENODEV;
+	/*
+	 * The resource typically points into the address space of the PMU.
+	 * Therefore, avoid using devm_platform_get_and_ioremap_resource() and
+	 * instead use platform_get_resource() and devm_ioremap() to avoid
+	 * conflicts due to address space overlap.
+	 */
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return dev_err_probe(dev, -ENXIO, "missing IO resources");
+
+	base = devm_ioremap(dev, res->start, resource_size(res));
+	if (!base)
+		return dev_err_probe(dev, -ENOMEM,
+				     "failed to ioremap PMU registers");
+
+	reg_config.max_register = resource_size(res) - reg_config.reg_stride;
+	pd->regmap = devm_regmap_init_mmio(dev, base, &reg_config);
+	if (IS_ERR(pd->regmap))
+		return dev_err_probe(dev, PTR_ERR(base),
+				     "failed to init regmap");
 
 	pd->pd.power_off = exynos_pd_power_off;
 	pd->pd.power_on = exynos_pd_power_on;
 	pd->local_pwr_cfg = pm_domain_cfg->local_pwr_cfg;
 
-	on = readl_relaxed(pd->base + 0x4) & pd->local_pwr_cfg;
+	ret = regmap_read(pd->regmap, 0x4, &val);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to read status");
+
+	on = val & pd->local_pwr_cfg;
 
 	pm_genpd_init(&pd->pd, NULL, !on);
 	ret = of_genpd_add_provider_simple(np, &pd->pd);

-- 
2.51.0.788.g6d19910ace-goog


