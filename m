Return-Path: <linux-samsung-soc+bounces-7442-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27737A5E6EA
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 12 Mar 2025 23:00:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69A8C189C897
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 12 Mar 2025 22:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 930621F0E23;
	Wed, 12 Mar 2025 21:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jmtiDmSD"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DCF1F03C5
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Mar 2025 21:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741816776; cv=none; b=Kv/X7OyGtbdQFMY96bkauNw8kccTBS+J58lJahZ/NP4Edn0Z4TjQLOxWYXrdXOulZb3NItBBEvS915GO0nvLBPowKf3MboJhen+VSMwK4eHOJKbeyItw8X3Zdj401/fHtFlP0Z4TPSMdxz39EcHiJMGfCYddJThdG6tjRFAheWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741816776; c=relaxed/simple;
	bh=Ifk7YdZuIp5E4EKR7US35EuSCJAK0G+XzSgLezpskrU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gxZ6f3UMSb/dEoRJt8//t6GAtW6sCAs0kwzEh/2KLkbnKE/3AAJ7YpJP6wjrdshQQv9etEaXtC4dWnM5VktL4YztGrjFQaj44Paf+SQ5xkFy6jubdn/majmdI3hLjuh7g3lo9pokXlhwTz42SnE7V1pwkkn6SB5WfczdDQvXO50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jmtiDmSD; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf257158fso1622555e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Mar 2025 14:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741816772; x=1742421572; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+BPOcBuscqnakrAJecbgIerqvHQVWozMPF/kbWLGHz8=;
        b=jmtiDmSD9iwpdzKfETAlOzcq7afG51acG2A4SKp1oCd68AhpSZG7nas9VW5Mkib9+e
         wjlq1dQCwZOhmr3xHxhOat+mT6yoKFoNi64uwLz2OUyGzqUm8V15BfGurG408NxCpAJX
         iyHn/e1j7ablGE4oO4+HGHrh4nHUuKEO6jRugaMVMf6uafC7DI46MR5hMM6C2X8oaEo9
         PGyIb/uyhV/k/bo7gICrvnR+2X8IlMKK3dOKM6anEhdh6Rgd0zVTljipjNh+5E/vdrtr
         XHle3wvjxsfpZkbJjtbQI2DdKNcAMNeVD53e8s88wd8l8aiBG+FxhPa4JBc2yxFtg22p
         xoyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741816772; x=1742421572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+BPOcBuscqnakrAJecbgIerqvHQVWozMPF/kbWLGHz8=;
        b=PnULemnL2nO+ddYdVhcDpIIC4k+HIDxaYLBx6GfMa03yhKH9PdywqaU7n2yisO3FFO
         mdqLD5p8Rs9mf2ozW2dp0LP4w+LGHxjT6d7h7sCV/MW7vzzgkCWYTRmVFSVpoRFcRjB9
         t+Yp2a98uYiktsTA0iuVM0m15Xi4jHO7/etS6n87z+/56L4Ojo2LhVxSJBEliJFe2rQr
         GqAUnjtP3+oEavL1vgp073HQqgxbwkOzd+E19WHXv/c7koiU8sMvlo823kuw6O/Dsy6t
         jn86UAEMumGh25fE/3Kgyi+jvbI6KQrGVwHLcybglaHRpVn2hp6rMVQxwHXH/uRLyWY9
         p8YA==
X-Forwarded-Encrypted: i=1; AJvYcCVEJXVkljBImTerm+VTV3qYe/w4HUXikA0K8GeF213FUO3WlZsBPZ7qJHvNZu+Sx5n3QWnnyayMqKLUxPulumNufQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiCfSQnTHE0zTVCa1WzUFHRfZvYoiDFusdxdsL+SXJTtssD0y8
	O9bx1ZUrKYOTWZMti6ENq8UHdO82EyQjnWMLgRLUTPjcrjlhZ93ZDkAoyZ6HpBM=
X-Gm-Gg: ASbGncsll3kNnvhrjzAMh9GRfcdZa27C2kNOuU0aoGxKaK1SWeS2F6YelJJEbz2psTF
	dPxBya7go3eQwn6u8RHdZE5SZKUKrkJxeLPuQoRp/X1hWdhCQakYNatrqfivzXlglbET060m1AO
	ZwdRkWwPY9I3C3m+DNhcgEttXGOr7ISE02Q5SrCsbfV3x9v7fBCGvf6H5uSk4TcA6BNir591Kcr
	aWDwO9xLrDqDJaZ3OnCkLH0QespFVTHzWxvE6t3SpqCQj2jAdQ/K0P973THKsMGsZARxvs3nfpd
	s9TuTfIuQxXBt+vFGzkbkqfS2t9nyAKaE8cTyGM8t0mYEzYnU0NvzOgFLTKlhIGXtgFApe3TiLd
	S
X-Google-Smtp-Source: AGHT+IGandCyInoBlFimfik1nhqFVeJ+aHeTPEW1Yga14N2YX7AZdDUpjp9raK86xmISAiOp0my9LA==
X-Received: by 2002:a05:600c:19cc:b0:43d:4e9:27ff with SMTP id 5b1f17b1804b1-43d04e92a66mr74714305e9.7.1741816771779;
        Wed, 12 Mar 2025 14:59:31 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([209.198.129.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d188bb34asm110175e9.18.2025.03.12.14.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 14:59:31 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 12 Mar 2025 21:58:59 +0000
Subject: [PATCH v5 2/5] pinctrl: samsung: refactor drvdata suspend & resume
 callbacks
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-pinctrl-fltcon-suspend-v5-2-d98d5b271242@linaro.org>
References: <20250312-pinctrl-fltcon-suspend-v5-0-d98d5b271242@linaro.org>
In-Reply-To: <20250312-pinctrl-fltcon-suspend-v5-0-d98d5b271242@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, tudor.ambarus@linaro.org, willmcvicker@google.com, 
 semen.protsenko@linaro.org, kernel-team@android.com, 
 jaewon02.kim@samsung.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10132;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=Ifk7YdZuIp5E4EKR7US35EuSCJAK0G+XzSgLezpskrU=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBn0gO9EUm+cy/E4CFUezGpu0cs+NdsD3ticaqG3
 isl43NpBKmJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ9IDvQAKCRDO6LjWAjRy
 uj4MD/wJvkj0lvrcAv+/wdy9wwAtx/OJH4DsdIWDVijRM1qHHSwlLZleTfcc7eN2+R88e/6fQie
 D1CyTPSHD3iGYIEBgXPXcRFnCIk8DM1YJzzvwgD7aZo/fBnXNVIfX18Hrdu8knxyUWLuQMbEp8f
 SFTzOuKN2YoX44s7zqKWCO3oLLueaeMlvCsKqAHIqFpxFoLZPerRFPGzSDbqC76n5TZuLLyb1iM
 5Wqv+vts2FWdu+4o8asyHrgIpj7thvT8W+98UNs3uSOQMm/e+lYryK+x1YiUhmBrMlrof5dayRF
 OfukLikY5QRvGeZe2TBW2zLqnfOHsRQugLIp0vSSilYt2I8cAlGN9eLS3U+cSu6FyD8VVjitf4e
 egRKCYYDZFtLm5kqwjGhZ49vPF3H0Vtfv9Gv3iAO7PULcfiOkUC2rQfkVU/+moB8d1s+xoUfmXT
 M+kUBMgDk/LPUsvMocSyK+zhIpkSO+G27Et5bXDC3D2vVRvgCYZteTersX8VW+zBAmA79vxJkKp
 3s0+Z63/Avtd45tw+7L5i7U3qYlBK3yVnZDnKgGmobNE9jRvLo6T4vXZ76h01xhoZKbPh42tZ+S
 NS5u+aFa+hUgPH1FK715EoUjJRZzWRI2Pfl0A+iZz5jTFNTgUeNXTao3sZsA48huCNY2Pr0m8XH
 Uck+BXNrEf1ApQA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Move the call of drvdata->suspend()/resume into the loop which is
iterating drvdata for each bank.

This allows the clk_enable() and clk_disable() logic to be removed
from each callback, and also avoids iterating the same loop again
in the next function.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/pinctrl/samsung/pinctrl-exynos.c  | 89 ++++++++-----------------------
 drivers/pinctrl/samsung/pinctrl-exynos.h  |  4 +-
 drivers/pinctrl/samsung/pinctrl-samsung.c | 11 ++--
 drivers/pinctrl/samsung/pinctrl-samsung.h |  8 +--
 4 files changed, 33 insertions(+), 79 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index ac6dc22b37c98ed5b7fca3335764f19abb2f71cc..62c8d8d907545119c49a89d79b5dae63282467d5 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -761,19 +761,11 @@ __init int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 	return 0;
 }
 
-static void exynos_pinctrl_suspend_bank(
-				struct samsung_pinctrl_drv_data *drvdata,
-				struct samsung_pin_bank *bank)
+static void exynos_pinctrl_suspend_bank(struct samsung_pin_bank *bank)
 {
 	struct exynos_eint_gpio_save *save = bank->soc_priv;
 	const void __iomem *regs = bank->eint_base;
 
-	if (clk_enable(bank->drvdata->pclk)) {
-		dev_err(bank->gpio_chip.parent,
-			"unable to enable clock for saving state\n");
-		return;
-	}
-
 	save->eint_con = readl(regs + EXYNOS_GPIO_ECON_OFFSET
 						+ bank->eint_offset);
 	save->eint_fltcon0 = readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
@@ -783,71 +775,46 @@ static void exynos_pinctrl_suspend_bank(
 	save->eint_mask = readl(regs + bank->irq_chip->eint_mask
 						+ bank->eint_offset);
 
-	clk_disable(bank->drvdata->pclk);
-
 	pr_debug("%s: save     con %#010x\n", bank->name, save->eint_con);
 	pr_debug("%s: save fltcon0 %#010x\n", bank->name, save->eint_fltcon0);
 	pr_debug("%s: save fltcon1 %#010x\n", bank->name, save->eint_fltcon1);
 	pr_debug("%s: save    mask %#010x\n", bank->name, save->eint_mask);
 }
 
-static void exynosauto_pinctrl_suspend_bank(struct samsung_pinctrl_drv_data *drvdata,
-					    struct samsung_pin_bank *bank)
+static void exynosauto_pinctrl_suspend_bank(struct samsung_pin_bank *bank)
 {
 	struct exynos_eint_gpio_save *save = bank->soc_priv;
 	const void __iomem *regs = bank->eint_base;
 
-	if (clk_enable(bank->drvdata->pclk)) {
-		dev_err(bank->gpio_chip.parent,
-			"unable to enable clock for saving state\n");
-		return;
-	}
-
 	save->eint_con = readl(regs + bank->pctl_offset + bank->eint_con_offset);
 	save->eint_mask = readl(regs + bank->pctl_offset + bank->eint_mask_offset);
 
-	clk_disable(bank->drvdata->pclk);
-
 	pr_debug("%s: save     con %#010x\n", bank->name, save->eint_con);
 	pr_debug("%s: save    mask %#010x\n", bank->name, save->eint_mask);
 }
 
-void exynos_pinctrl_suspend(struct samsung_pinctrl_drv_data *drvdata)
+void exynos_pinctrl_suspend(struct samsung_pin_bank *bank)
 {
-	struct samsung_pin_bank *bank = drvdata->pin_banks;
 	struct exynos_irq_chip *irq_chip = NULL;
-	int i;
 
-	for (i = 0; i < drvdata->nr_banks; ++i, ++bank) {
-		if (bank->eint_type == EINT_TYPE_GPIO) {
-			if (bank->eint_con_offset)
-				exynosauto_pinctrl_suspend_bank(drvdata, bank);
-			else
-				exynos_pinctrl_suspend_bank(drvdata, bank);
-		}
-		else if (bank->eint_type == EINT_TYPE_WKUP) {
-			if (!irq_chip) {
-				irq_chip = bank->irq_chip;
-				irq_chip->set_eint_wakeup_mask(drvdata,
-							       irq_chip);
-			}
+	if (bank->eint_type == EINT_TYPE_GPIO) {
+		if (bank->eint_con_offset)
+			exynosauto_pinctrl_suspend_bank(bank);
+		else
+			exynos_pinctrl_suspend_bank(bank);
+	} else if (bank->eint_type == EINT_TYPE_WKUP) {
+		if (!irq_chip) {
+			irq_chip = bank->irq_chip;
+			irq_chip->set_eint_wakeup_mask(bank->drvdata, irq_chip);
 		}
 	}
 }
 
-static void exynos_pinctrl_resume_bank(
-				struct samsung_pinctrl_drv_data *drvdata,
-				struct samsung_pin_bank *bank)
+static void exynos_pinctrl_resume_bank(struct samsung_pin_bank *bank)
 {
 	struct exynos_eint_gpio_save *save = bank->soc_priv;
 	void __iomem *regs = bank->eint_base;
 
-	if (clk_enable(bank->drvdata->pclk)) {
-		dev_err(bank->gpio_chip.parent,
-			"unable to enable clock for restoring state\n");
-		return;
-	}
-
 	pr_debug("%s:     con %#010x => %#010x\n", bank->name,
 			readl(regs + EXYNOS_GPIO_ECON_OFFSET
 			+ bank->eint_offset), save->eint_con);
@@ -869,22 +836,13 @@ static void exynos_pinctrl_resume_bank(
 						+ 2 * bank->eint_offset + 4);
 	writel(save->eint_mask, regs + bank->irq_chip->eint_mask
 						+ bank->eint_offset);
-
-	clk_disable(bank->drvdata->pclk);
 }
 
-static void exynosauto_pinctrl_resume_bank(struct samsung_pinctrl_drv_data *drvdata,
-					   struct samsung_pin_bank *bank)
+static void exynosauto_pinctrl_resume_bank(struct samsung_pin_bank *bank)
 {
 	struct exynos_eint_gpio_save *save = bank->soc_priv;
 	void __iomem *regs = bank->eint_base;
 
-	if (clk_enable(bank->drvdata->pclk)) {
-		dev_err(bank->gpio_chip.parent,
-			"unable to enable clock for restoring state\n");
-		return;
-	}
-
 	pr_debug("%s:     con %#010x => %#010x\n", bank->name,
 		 readl(regs + bank->pctl_offset + bank->eint_con_offset), save->eint_con);
 	pr_debug("%s:    mask %#010x => %#010x\n", bank->name,
@@ -893,21 +851,16 @@ static void exynosauto_pinctrl_resume_bank(struct samsung_pinctrl_drv_data *drvd
 	writel(save->eint_con, regs + bank->pctl_offset + bank->eint_con_offset);
 	writel(save->eint_mask, regs + bank->pctl_offset + bank->eint_mask_offset);
 
-	clk_disable(bank->drvdata->pclk);
 }
 
-void exynos_pinctrl_resume(struct samsung_pinctrl_drv_data *drvdata)
+void exynos_pinctrl_resume(struct samsung_pin_bank *bank)
 {
-	struct samsung_pin_bank *bank = drvdata->pin_banks;
-	int i;
-
-	for (i = 0; i < drvdata->nr_banks; ++i, ++bank)
-		if (bank->eint_type == EINT_TYPE_GPIO) {
-			if (bank->eint_con_offset)
-				exynosauto_pinctrl_resume_bank(drvdata, bank);
-			else
-				exynos_pinctrl_resume_bank(drvdata, bank);
-		}
+	if (bank->eint_type == EINT_TYPE_GPIO) {
+		if (bank->eint_con_offset)
+			exynosauto_pinctrl_resume_bank(bank);
+		else
+			exynos_pinctrl_resume_bank(bank);
+	}
 }
 
 static void exynos_retention_enable(struct samsung_pinctrl_drv_data *drvdata)
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index 33df21d5c9d61e852834031570d4a0ac0e51f6a4..69be0746e29d9714a33f4aa49df0e8d7257b4220 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -221,8 +221,8 @@ struct exynos_muxed_weint_data {
 
 int exynos_eint_gpio_init(struct samsung_pinctrl_drv_data *d);
 int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d);
-void exynos_pinctrl_suspend(struct samsung_pinctrl_drv_data *drvdata);
-void exynos_pinctrl_resume(struct samsung_pinctrl_drv_data *drvdata);
+void exynos_pinctrl_suspend(struct samsung_pin_bank *bank);
+void exynos_pinctrl_resume(struct samsung_pin_bank *bank);
 struct samsung_retention_ctrl *
 exynos_retention_init(struct samsung_pinctrl_drv_data *drvdata,
 		      const struct samsung_retention_data *data);
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 963060920301ec90affb2ee6d758d3d602ffb4a9..375634d8cc79d6533603e3eed562452181e2ee25 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1349,6 +1349,9 @@ static int __maybe_unused samsung_pinctrl_suspend(struct device *dev)
 		const u8 *widths = bank->type->fld_width;
 		enum pincfg_type type;
 
+		if (drvdata->suspend)
+			drvdata->suspend(bank);
+
 		/* Registers without a powerdown config aren't lost */
 		if (!widths[PINCFG_TYPE_CON_PDN])
 			continue;
@@ -1373,8 +1376,6 @@ static int __maybe_unused samsung_pinctrl_suspend(struct device *dev)
 
 	clk_disable(drvdata->pclk);
 
-	if (drvdata->suspend)
-		drvdata->suspend(drvdata);
 	if (drvdata->retention_ctrl && drvdata->retention_ctrl->enable)
 		drvdata->retention_ctrl->enable(drvdata);
 
@@ -1406,9 +1407,6 @@ static int __maybe_unused samsung_pinctrl_resume(struct device *dev)
 		return ret;
 	}
 
-	if (drvdata->resume)
-		drvdata->resume(drvdata);
-
 	for (i = 0; i < drvdata->nr_banks; i++) {
 		struct samsung_pin_bank *bank = &drvdata->pin_banks[i];
 		void __iomem *reg = bank->pctl_base + bank->pctl_offset;
@@ -1416,6 +1414,9 @@ static int __maybe_unused samsung_pinctrl_resume(struct device *dev)
 		const u8 *widths = bank->type->fld_width;
 		enum pincfg_type type;
 
+		if (drvdata->resume)
+			drvdata->resume(bank);
+
 		/* Registers without a powerdown config aren't lost */
 		if (!widths[PINCFG_TYPE_CON_PDN])
 			continue;
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index 371e4f02bbfb375964b7833beb9bbc098a51f4a3..e939e5bb0347458ae4a9014fd9657fc59c5c3994 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -285,8 +285,8 @@ struct samsung_pin_ctrl {
 	int		(*eint_gpio_init)(struct samsung_pinctrl_drv_data *);
 	int		(*eint_wkup_init)(struct samsung_pinctrl_drv_data *);
 	void		(*pud_value_init)(struct samsung_pinctrl_drv_data *drvdata);
-	void		(*suspend)(struct samsung_pinctrl_drv_data *);
-	void		(*resume)(struct samsung_pinctrl_drv_data *);
+	void		(*suspend)(struct samsung_pin_bank *bank);
+	void		(*resume)(struct samsung_pin_bank *bank);
 };
 
 /**
@@ -335,8 +335,8 @@ struct samsung_pinctrl_drv_data {
 
 	struct samsung_retention_ctrl	*retention_ctrl;
 
-	void (*suspend)(struct samsung_pinctrl_drv_data *);
-	void (*resume)(struct samsung_pinctrl_drv_data *);
+	void (*suspend)(struct samsung_pin_bank *bank);
+	void (*resume)(struct samsung_pin_bank *bank);
 };
 
 /**

-- 
2.49.0.rc1.451.g8f38331e32-goog


