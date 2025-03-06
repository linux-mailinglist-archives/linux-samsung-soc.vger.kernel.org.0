Return-Path: <linux-samsung-soc+bounces-7340-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4524BA557A5
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  6 Mar 2025 21:43:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6805E7A7C78
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  6 Mar 2025 20:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42A2C278148;
	Thu,  6 Mar 2025 20:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mpNoVCcO"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0398526BD82
	for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Mar 2025 20:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741293791; cv=none; b=XkypJdgbQp0hzrDBF5QfdKI1Y+Y/gTqsb5ycJ/DkgrDIYeKfO8+6eeL/9anrOJMNaqCrmEHR0HzRVuHJwvi7EGS3SlZNQUSc0HEkEeLNECZCQUOJCQ0U0SUWtz67abl/AvjDdbzcfMIJn5nk1Yqum6KK+y21LgjwwQ61s3vu56c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741293791; c=relaxed/simple;
	bh=OOOqe0Ly4Iczxs4BjPyBWwEmra4AzhJ6AleNF6mmhiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lkXM0tLNrkYZdkXWE3xLGNH49pP4N3ZTez6sM9blju5zdgiNFOY6IsegPb5Z5wR1xZ90aH7zUmU4TsoBlUSZ69iB+vrtWBBcg5YaxsU8GppKGQIzbfiYqjAPF8udx18mdrmDuAjfJWEdfeA6MM+C6ea479OUSqhioEOQRCDOBak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mpNoVCcO; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43bc0b8520cso7307155e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Mar 2025 12:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741293787; x=1741898587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AxLdyU5xLA0l8ZLb1APWpUpQHCVn0xb1VkCSknV6KMc=;
        b=mpNoVCcOgRvM7AgK1IR+lPP74ias3vcMffFfyRqjslWZwh8iJDfLseL8paUzdZcjJD
         ZYByc5t/vumhnbi1kZCbhSvYGZjjjy3c0G4Ys4Ses4C9z6mz3R+hNkwaguSGa6U7dNur
         o2glC2OOoygAfw4oUJzouSBAEEjVdSH1aUVq9jsFY2QtqFxybJTMusvA8n3JrKNZVOse
         mgTLbiWH33rfAz4i2kp3TDwUiCRVVExeA3oWAfH4mw13txgk4x9zIoTHMfrwxyfwn9A7
         QyKzwXjtSknEY6e9t2+XkbD3Y+Cz2G3MvwU0kv7EZmpH53FPqSBm6/jkZ1y1yl//7Y4x
         DzGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741293787; x=1741898587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AxLdyU5xLA0l8ZLb1APWpUpQHCVn0xb1VkCSknV6KMc=;
        b=Vzwz1Bdk/7gzgVSZbqeVxQ++4x+IqTJgHzRlGETAHGcOkip3fhfB9kmHh2p9y8FHhp
         TlLxZ18X3JyRK2L2F1tjN3Hbw9VToVMGU1SqZsxY80qt6Fl3RbYEqKl4+eYC8l80VIaI
         cfBYclwi25AJqFhDGwyib3G9bfunB9pbyXPO00NItrfIjiNynnD+tUyRoabCL6I3QHv/
         UgL8QU/okMFnMa2EeH312jOTS0+tbApxE6GKXE/STCQi2uoOUvZGUGJCWKQs/oucE6mq
         14wt/C+z5VdIEIiU45I6RTg7DP1YMINz5Wz7JvcEx9WsFua6tDSy0sKK0+y8fD3kZ7TZ
         aL9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUzlbfb6Pki9ioHHVod9Z+W5i2yUmbEiMgLzpBGhgueEwiBLYUVwSw4B7YY4jl7RbTKP3TT70na/wAJruWE3IC2Mg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4UZo+QpBgvqoUShpizocg6bVuNLvzX2kBwe7E7B4W/u1ZRtwb
	GfuaWSBPWVcHGWgIICjga+rONllf2SmQ7jSunAOCl9+7gSyj/IcidxWwShWH4fs=
X-Gm-Gg: ASbGnctqoVCYW9flfpWCucdnYwclQZEWGOtPUHtB86a8biIZbfqNTNgyIZvEDUKf5rG
	u1nsUBQBgNMLscfh5FSA56Y9TrlqqOwQ3oiGet71WH7LSO799pdwNyFyyCcUnuEgLOkqYglr72e
	NsZEymMT0jiqli7oiQ8eGX+SkObMs3LaL1URLBIL6v5Kf9AB+yCvumiaGp8h3/mHWJLKx8pY7gi
	rRD5BVP2L/Ad0PCDj1OK7+6tdLO/726u7NHKJm5wXx0R/HiBhWqC6cTy3Pd1OGiIZMnjor0RMgr
	ZWk650hYM9n9vJ3sYxxbypuIwoNDlj4hOmG6rKg2bMrSA6HUVJ6Fgj+adGr8x0fgnUqtvnbp/xA
	=
X-Google-Smtp-Source: AGHT+IH98Yy4XpGZ3iFL/yc88/Vd0u6qTJdcdq7H0Fudor0UsWPApYHhC7lFeOykmBLoYFNgZvM27Q==
X-Received: by 2002:a05:600c:198b:b0:439:b7e3:ce56 with SMTP id 5b1f17b1804b1-43c687027f5mr6517265e9.29.1741293787173;
        Thu, 06 Mar 2025 12:43:07 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.67.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd9470e2sm30081715e9.33.2025.03.06.12.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 12:43:06 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 06 Mar 2025 20:42:37 +0000
Subject: [PATCH v3 3/4] pinctrl: samsung: add gs101 specific eint
 suspend/resume callbacks
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-pinctrl-fltcon-suspend-v3-3-f9ab4ff6a24e@linaro.org>
References: <20250306-pinctrl-fltcon-suspend-v3-0-f9ab4ff6a24e@linaro.org>
In-Reply-To: <20250306-pinctrl-fltcon-suspend-v3-0-f9ab4ff6a24e@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, tudor.ambarus@linaro.org, willmcvicker@google.com, 
 semen.protsenko@linaro.org, kernel-team@android.com, 
 jaewon02.kim@samsung.com, Peter Griffin <peter.griffin@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7387;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=OOOqe0Ly4Iczxs4BjPyBWwEmra4AzhJ6AleNF6mmhiM=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBnygjSWndMrJynxLbm7vZqCmsxhBbi5E7irLMwQ
 Yj/4xbDU7+JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ8oI0gAKCRDO6LjWAjRy
 upeID/9Oxax6mOIhXOJZd9AnETnx6O5VKzbSrXK8a0U8K40Dw2PkkjMfcp2xA3WYl1VpeO7QJNl
 JwDYVSJ7t3UrBJJyYg8ArSW7AbLzAeB1TnNRLWfDwBdylbs+bHHQS2uFXkgYvULzQlAS761sv6c
 BDNy1Covy9gir5OL05aMdWO7W+xoP6nqRUZ0Fe90Iet1JNyMJtV7p5Tw1WsYdFWT88HvrcjF7/k
 EZgCrQUTRbgNHqnHyY+AW0/fHvlSE2xVVartpBpfO654K+FrMyplYods3q/S9tiilpm+VTCDK/r
 WOuWzTzUoReABOgNCLoDT3drairndt+0fwDfbzsNosI/Q2dlrJ2uc9UjFxmMPY2YHIPVuoXBKYb
 k/mwd8Fb4XuKgfH3vbDxYR0mL8fs9fzaw8vPL+Utvq3dxlCNcqlA1gij+BDVqD6fxm9mMtA2B6Y
 anIkouB1jkE8qn+R9yCZ2qSnJ7NNulReeD1gzlCZ+FHFYLavjZh+WvGCGb3EtzW+T+mRPsMyWE2
 4wWy/TyJ44g/VidSbp8P4hcDE796DGf9rJMydiCPaZrCw8tM/8+V5OE4DzBxjyfOBcAgIm1oyAN
 thM3CUzwgOA0GAfCckxiZN2WNgCiLMafiTVmM6oApSNWvK9Au7Tu6MaLpLRo6a3FtOK70Zmq/Yi
 i2r0SvaM3z56ycg==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

gs101 differs to other SoCs in that fltcon1 register doesn't
always exist. Additionally the offset of fltcon0 is not fixed
and needs to use the newly added eint_fltcon_offset variable.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Fixes: 4a8be01a1a7a ("pinctrl: samsung: Add gs101 SoC pinctrl configuration")
Cc: stable@vger.kernel.org
---
Changes since v2:
* make it clear exynos_set_wakeup(bank) is conditional on bank type (Andre)
* align style where the '+' is placed (Andre)
* remove unnecessary braces (Andre)
---
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 24 ++++-----
 drivers/pinctrl/samsung/pinctrl-exynos.c       | 70 ++++++++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos.h       |  2 +
 3 files changed, 84 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index 57c98d2451b54b00d50e0e948e272ed53d386c34..fca447ebc5f5956b7e8d2f2d08f23622095b1ee6 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -1455,15 +1455,15 @@ static const struct samsung_pin_ctrl gs101_pin_ctrl[] __initconst = {
 		.pin_banks	= gs101_pin_alive,
 		.nr_banks	= ARRAY_SIZE(gs101_pin_alive),
 		.eint_wkup_init = exynos_eint_wkup_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= gs101_pinctrl_suspend,
+		.resume		= gs101_pinctrl_resume,
 	}, {
 		/* pin banks of gs101 pin-controller (FAR_ALIVE) */
 		.pin_banks	= gs101_pin_far_alive,
 		.nr_banks	= ARRAY_SIZE(gs101_pin_far_alive),
 		.eint_wkup_init = exynos_eint_wkup_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= gs101_pinctrl_suspend,
+		.resume		= gs101_pinctrl_resume,
 	}, {
 		/* pin banks of gs101 pin-controller (GSACORE) */
 		.pin_banks	= gs101_pin_gsacore,
@@ -1477,29 +1477,29 @@ static const struct samsung_pin_ctrl gs101_pin_ctrl[] __initconst = {
 		.pin_banks	= gs101_pin_peric0,
 		.nr_banks	= ARRAY_SIZE(gs101_pin_peric0),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= gs101_pinctrl_suspend,
+		.resume		= gs101_pinctrl_resume,
 	}, {
 		/* pin banks of gs101 pin-controller (PERIC1) */
 		.pin_banks	= gs101_pin_peric1,
 		.nr_banks	= ARRAY_SIZE(gs101_pin_peric1),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume	= exynos_pinctrl_resume,
+		.suspend	= gs101_pinctrl_suspend,
+		.resume		= gs101_pinctrl_resume,
 	}, {
 		/* pin banks of gs101 pin-controller (HSI1) */
 		.pin_banks	= gs101_pin_hsi1,
 		.nr_banks	= ARRAY_SIZE(gs101_pin_hsi1),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= gs101_pinctrl_suspend,
+		.resume		= gs101_pinctrl_resume,
 	}, {
 		/* pin banks of gs101 pin-controller (HSI2) */
 		.pin_banks	= gs101_pin_hsi2,
 		.nr_banks	= ARRAY_SIZE(gs101_pin_hsi2),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= gs101_pinctrl_suspend,
+		.resume		= gs101_pinctrl_resume,
 	},
 };
 
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index f10ff09c1af01c11ff9229aaef77df32eb057b7b..9cffbe9ee64aa5236026978ac2466b709da5bffc 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -798,6 +798,40 @@ void exynos_pinctrl_suspend(struct samsung_pin_bank *bank)
 		exynos_set_wakeup(bank);
 }
 
+void gs101_pinctrl_suspend(struct samsung_pin_bank *bank)
+{
+	struct exynos_eint_gpio_save *save = bank->soc_priv;
+	const void __iomem *regs = bank->eint_base;
+
+	if (bank->eint_type == EINT_TYPE_GPIO) {
+		save->eint_con = readl(regs + EXYNOS_GPIO_ECON_OFFSET
+				       + bank->eint_offset);
+
+		save->eint_fltcon0 = readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
+					   + bank->eint_fltcon_offset);
+
+		/* fltcon1 register only exists for pins 4-7 */
+		if (bank->nr_pins > 4)
+			save->eint_fltcon1 = readl(regs +
+						EXYNOS_GPIO_EFLTCON_OFFSET
+						+ bank->eint_fltcon_offset + 4);
+
+		save->eint_mask = readl(regs + bank->irq_chip->eint_mask
+					+ bank->eint_offset);
+
+		pr_debug("%s: save     con %#010x\n",
+			 bank->name, save->eint_con);
+		pr_debug("%s: save fltcon0 %#010x\n",
+			 bank->name, save->eint_fltcon0);
+		if (bank->nr_pins > 4)
+			pr_debug("%s: save fltcon1 %#010x\n",
+				 bank->name, save->eint_fltcon1);
+		pr_debug("%s: save    mask %#010x\n",
+			 bank->name, save->eint_mask);
+	} else if (bank->eint_type == EINT_TYPE_WKUP)
+		exynos_set_wakeup(bank);
+}
+
 void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank)
 {
 	struct exynos_eint_gpio_save *save = bank->soc_priv;
@@ -816,6 +850,42 @@ void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank)
 		exynos_set_wakeup(bank);
 }
 
+void gs101_pinctrl_resume(struct samsung_pin_bank *bank)
+{
+	struct exynos_eint_gpio_save *save = bank->soc_priv;
+
+	void __iomem *regs = bank->eint_base;
+	void __iomem *eint_fltcfg0 = regs + EXYNOS_GPIO_EFLTCON_OFFSET
+		     + bank->eint_fltcon_offset;
+
+	if (bank->eint_type == EINT_TYPE_GPIO) {
+		pr_debug("%s:     con %#010x => %#010x\n", bank->name,
+			 readl(regs + EXYNOS_GPIO_ECON_OFFSET
+			       + bank->eint_offset), save->eint_con);
+
+		pr_debug("%s: fltcon0 %#010x => %#010x\n", bank->name,
+			 readl(eint_fltcfg0), save->eint_fltcon0);
+
+		/* fltcon1 register only exists for pins 4-7 */
+		if (bank->nr_pins > 4)
+			pr_debug("%s: fltcon1 %#010x => %#010x\n", bank->name,
+				 readl(eint_fltcfg0 + 4), save->eint_fltcon1);
+
+		pr_debug("%s:    mask %#010x => %#010x\n", bank->name,
+			 readl(regs + bank->irq_chip->eint_mask
+			       + bank->eint_offset), save->eint_mask);
+
+		writel(save->eint_con, regs + EXYNOS_GPIO_ECON_OFFSET
+		       + bank->eint_offset);
+		writel(save->eint_fltcon0, eint_fltcfg0);
+
+		if (bank->nr_pins > 4)
+			writel(save->eint_fltcon1, eint_fltcfg0 + 4);
+		writel(save->eint_mask, regs + bank->irq_chip->eint_mask
+		       + bank->eint_offset);
+	}
+}
+
 void exynos_pinctrl_resume(struct samsung_pin_bank *bank)
 {
 	struct exynos_eint_gpio_save *save = bank->soc_priv;
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index 35c2bc4ea488bda600ebfbda1492f5f49dbd9849..773f161a82a38cbaad05fcbc09a936300f5c7595 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -225,6 +225,8 @@ void exynosautov920_pinctrl_resume(struct samsung_pin_bank *bank);
 void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank);
 void exynos_pinctrl_suspend(struct samsung_pin_bank *bank);
 void exynos_pinctrl_resume(struct samsung_pin_bank *bank);
+void gs101_pinctrl_suspend(struct samsung_pin_bank *bank);
+void gs101_pinctrl_resume(struct samsung_pin_bank *bank);
 struct samsung_retention_ctrl *
 exynos_retention_init(struct samsung_pinctrl_drv_data *drvdata,
 		      const struct samsung_retention_data *data);

-- 
2.49.0.rc0.332.g42c0ae87b1-goog


