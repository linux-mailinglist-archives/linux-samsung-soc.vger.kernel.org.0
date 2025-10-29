Return-Path: <linux-samsung-soc+bounces-11860-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6C8C1D731
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 29 Oct 2025 22:31:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8472C560847
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 29 Oct 2025 21:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0489F31BCAE;
	Wed, 29 Oct 2025 21:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l+Pthtql"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCE531A562
	for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Oct 2025 21:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761773446; cv=none; b=l3Z7W4bphvwdT65aw0pqgSzZiCNMcmo733yu1lrdXmjlLAHdnIZPmgij9eZJ/b2eUwdv7W3KGp82n09aUp/IqwMBbK/XA00umpq3VbmhFxQ3kUv/pnTuSZJbxPJiCWN5YcUMxgS7z/t8Kiu0lvhrHU5zPHL4c+9fbUtPGySPYdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761773446; c=relaxed/simple;
	bh=DcMgwdtlNx4iXbGSjggzVcfH3ttsuxhBdyE0TceJXBA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H5FjsyFUMrG3OQc7SZasV4ha8fWZiCPqhTn0NnS+5PawB/arjBrBHD/qbQUm/Eu0pzv1iM9yjtHcal4bD7oSs+0PA0tfI3Rc5g7dRZ2rkZ2JRKU826f6b2GAHJUP31nfbZEdk8PFzXivAamhDQUaD7edqAOeHrj59+ak5RtwNDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l+Pthtql; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-421851bcb25so182006f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Oct 2025 14:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761773442; x=1762378242; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YMTe84AVEZaeWkrSXEN52NZAjOn7AW+vqsEbtr2RVTU=;
        b=l+PthtqlnVebpz7g9rRK7SAcOP53ADEpjClBb5XaLvgNMk3yJBb+Y3dx9a9OaCg5bV
         sFvphV2P0p5nY2Rj4TfD6qDtz6cf0+QBXxYC/EyzJX2tldGJtdyZZwhSkUuthuzT0+Te
         nPhVgazGdpIj3thKOw9OhT9Nvioyj10bIYPPGCLf1Spc9MenjyE4zDOgMcOvsQMD8GhO
         SttIzkzh7WAHoVem5eHXvtQLzonIfrQmFaxZMCG0gWdjlth+YUYyJFOx/r9/XuqaRwx0
         jcZssQqiihkgxDYnscg5a7TzWQgDoPAMo1W+0We8Ta6P3iVAAdedI94xdOU0cKPh/Jg3
         hx2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761773442; x=1762378242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YMTe84AVEZaeWkrSXEN52NZAjOn7AW+vqsEbtr2RVTU=;
        b=XRoYta1o3lh4muRTfJtX0A66GYgj364WiN3GQvuR6cotoaUVbjUVJdFnPHJmcERmHi
         y6IYNmBhPvz0Yf9j4TsQsPgKRkwQIUsyGjKZORi80R9dJARo8ekBA5eLBHsB+Sz0VXf/
         XeWoXJ3yC3CJzcXpw9bQRlss4ZuL+Oq1a4GpS+7IjLp22wkHWLIYKBwjqoh/pYo/SDHT
         ze/0WelUZdbcRRo+r07BJ/VD4a1QQ8NZf44XFUzhantBXCClraG9TpAczSn4QUaxth4l
         UAuxMYrfmO0edMUjkizNAeiUZ2QpQN40pXSkrCf8wzJutm5EI4EmeaTmIDpN9BnPz/FT
         0e+w==
X-Forwarded-Encrypted: i=1; AJvYcCUzx/4+gAtvjTl5BSgBEGXg95bdhxb/kSpeieSQnvtIl4l6UwjefY2QqdWrEZdqDFG4vElDP8i66h1FVSK5AtJiFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwL78rQBfIH9yCTzfbhAD6zm1cAvshPwN+nX+SoHtizUAWoPPlp
	pcmdVrjOH44OO0DBHJlXITmkub0YufibE/f6MPLNcp9NsKajagDOsywrd/q3jO+QWF3yTq7X5oy
	4WjVnISE=
X-Gm-Gg: ASbGncsMyAsRQj1Vn1iidKwERX8dz+tyoKxZWNmj6GpLrVnVlJKptyPf7ob9Sd9K8qO
	vuHmT07uzoUsuNxAJfPEsMJvno0W1kHj/mhnTILnNmwQfnu/Bg/gNonyq8tnmurcN7zR39CJBnv
	hsMXdIGypaeCrPozykuOMbKJYKkL+fbhZ76XCMlIb9lbzb5CllyhmuPwgTc5Lxg8tWF7n5Akcsy
	K+QL+oLPCC2/RKCiHIJlW2cEeiIdqL132C1SgEA0ibUucdaj67vB8kab+ei9pM04vLQm9uZKRJ3
	lHEbKZL1rryWZsun4roLaINnASRmznde9ygjVaiJpfOObIZiYYwc1ZKOJ33n6q0dDHsIxnBnlMu
	V/KTQIamLpXscGJshtxZxhSbV/7sJMlgbyLUqA0/OdL4fr1/M9r/Kf2yCPAt1ncZhMgkPsVqHw/
	fdyNK9czI6nPwZO5XtXEO0gH4AWPTpkQ==
X-Google-Smtp-Source: AGHT+IF+4E8p8DXvoawxH420H+QbaJsOarXr6oYf1lOBl41PbdEDMo6Fsspr0Z+H9oLS8ioe5oYuJw==
X-Received: by 2002:a05:6000:2890:b0:427:7a5:a5c0 with SMTP id ffacd0b85a97d-429b4c874admr952820f8f.26.1761773441747;
        Wed, 29 Oct 2025 14:30:41 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.90.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7b43sm28573457f8f.6.2025.10.29.14.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 14:30:41 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 29 Oct 2025 21:29:24 +0000
Subject: [PATCH v2 3/4] clk: samsung: Implement automatic clock gating mode
 for CMUs
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-automatic-clocks-v2-3-f8edd3a2d82b@linaro.org>
References: <20251029-automatic-clocks-v2-0-f8edd3a2d82b@linaro.org>
In-Reply-To: <20251029-automatic-clocks-v2-0-f8edd3a2d82b@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=29176;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=DcMgwdtlNx4iXbGSjggzVcfH3ttsuxhBdyE0TceJXBA=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpAod3mwBLukPJWTun82I2UpqD9/bd7Xjgs4s9v
 XuAYHLZ0CWJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaQKHdwAKCRDO6LjWAjRy
 ugV0D/9/3sh0qdmN1fKgiFsXpQo4NEfugh2T5KBNfzrvcD52soNvtAeuAUK/6QPKxhP1BlVwRNT
 skn1HtzuJ+qn52TtO59ydNJFx43hEaFgUnC67RAgo0GrfI/3KIvY+5oASFashourx7wuXgSBRty
 GFGppXKGwZ0adcEH5qqDM7usECsZ/oLFprPEeMMG26mhF6uy5Ve+48UHoe37WTdR4HhvLhU5olc
 xA1K41n2GRqaa8crY8V2nI84jszorseDz5lytzMm85/MRB6RgUsRLTEgdSJ9QVykKs0mF8zZNqK
 q2fYFTGDWg7B5Y4Xue27AGMXWJMKWefqL3RmofDDwUXVBtZyUpIiO8f2cPohcDrIWVNXemkwZ6m
 RyRqMqflN0cGs6M+Mq2n7jNxmweRv4/9rhiZw2QnOY99/ekeelmbCOEl1dAlZ18tsqO23lasSAf
 PuQd2R+NFOkdojCayhH2aPg6kga4/3KbWoXnRxE4Oy7EiVGV8kLTn8l4K+d6QjKw3LfZAvXZ3Rs
 88DkDbcA6JhAMsN2HpfGXTw7/K4D64qjk6XXcHSA/snEGdjyi+BaqW7IF3z2YZaCFWN28qoq+ZR
 RVlGvfFI+DHpoVCBQb//R4tAvAkDllfpNeBxSBVYShBPtQOYz5StoZhIYohw72/ueKeCEm9wuep
 IveWXJQfBAv9GBQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Update exynos_arm64_init_clocks() so that it enables the automatic clock
mode bits in the CMU option register if the auto_clock_gate flag and
option_offset fields are set for the CMU. To ensure compatibility with
older DTs (that specified an incorrect CMU reg size), detect this and
fallback to manual clock gate mode as the auto clock mode feature depends
on registers in this area.

The CMU option register bits are global and effect every clock component in
the CMU, as such clearing the GATE_ENABLE_HWACG bit and setting GATE_MANUAL
bit on every gate register is only required if auto_clock_gate is false.

Additionally if auto_clock_gate is enabled the dynamic root clock gating
and memclk registers will be configured in the corresponding CMUs sysreg
bank. These registers are exposed via syscon, so the register
samsung_clk_save/restore paths are updated to also take a regmap.

As many gates for various Samsung SoCs are already exposed in the Samsung
clock drivers a new samsung_auto_clk_gate_ops is implemented. This uses
some CMU debug registers to report whether clocks are enabled or disabled
when operating in automatic mode. This allows
/sys/kernel/debug/clk/clk_summary to still dump the entire clock tree and
correctly report the status of each clock in the system.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v2
* Fallback to manual clock gate mode for old DTs with incorrect CMU size
(added samsung_is_auto_capable()) (Krzysztof)
* Rename OPT_UNKNOWN bit to OPT_EN_LAYER2_CTRL (Andre)
* Rename OPT_EN_MEM_PM_GATING to OPT_EN_MEM_PWR_GATING (Andre)
* Reverse Option bit definitions LSB -> MSB (Krzysztof)
* Update kerneldoc init_clk_regs comment (Andre)
* Fix space on various comments (Andre)
* Fix regmap typo on samsung_clk_save/restore calls (Andre)
* Include error code in pr_err message (Andre)
* Add macros for dcrg and memclk (Andre)
* Avoid confusing !IS_ERR_OR_NULL(ctx->sysreg) test (Krzysztof)
* Update kerneldoc to mention drcg_offset & memclk_offset are in sysreg (Andre)
* Fix intel 0 day randconfig warning
* Update clk-s5pv210 and clk-s3c64xx.c samsung_clk_sleep_init call sites (Peter)
---
 drivers/clk/samsung/clk-exynos-arm64.c   |  62 ++++++++--
 drivers/clk/samsung/clk-exynos4.c        |  12 +-
 drivers/clk/samsung/clk-exynos4412-isp.c |   4 +-
 drivers/clk/samsung/clk-exynos5250.c     |   2 +-
 drivers/clk/samsung/clk-exynos5420.c     |   4 +-
 drivers/clk/samsung/clk-s3c64xx.c        |   4 +-
 drivers/clk/samsung/clk-s5pv210.c        |   2 +-
 drivers/clk/samsung/clk.c                | 199 ++++++++++++++++++++++++++++---
 drivers/clk/samsung/clk.h                |  55 ++++++++-
 9 files changed, 301 insertions(+), 43 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos-arm64.c b/drivers/clk/samsung/clk-exynos-arm64.c
index bf7de21f329ec89069dcf817ca578fcf9b2d9809..11e4d49f2390ba714eff5a329bb1f427cd6437b9 100644
--- a/drivers/clk/samsung/clk-exynos-arm64.c
+++ b/drivers/clk/samsung/clk-exynos-arm64.c
@@ -24,6 +24,16 @@
 #define GATE_MANUAL		BIT(20)
 #define GATE_ENABLE_HWACG	BIT(28)
 
+/* Option register bits */
+#define OPT_EN_MEM_PWR_GATING		BIT(24)
+#define OPT_EN_AUTO_GATING		BIT(28)
+#define OPT_EN_PWR_MANAGEMENT		BIT(29)
+#define OPT_EN_LAYER2_CTRL		BIT(30)
+#define OPT_EN_DBG			BIT(31)
+
+#define CMU_OPT_GLOBAL_EN_AUTO_GATING	(OPT_EN_DBG | OPT_EN_LAYER2_CTRL | \
+	OPT_EN_PWR_MANAGEMENT | OPT_EN_AUTO_GATING | OPT_EN_MEM_PWR_GATING)
+
 /* PLL_CONx_PLL register offsets range */
 #define PLL_CON_OFF_START	0x100
 #define PLL_CON_OFF_END		0x600
@@ -37,6 +47,8 @@ struct exynos_arm64_cmu_data {
 	unsigned int nr_clk_save;
 	const struct samsung_clk_reg_dump *clk_suspend;
 	unsigned int nr_clk_suspend;
+	struct samsung_clk_reg_dump *clk_sysreg_save;
+	unsigned int nr_clk_sysreg;
 
 	struct clk *clk;
 	struct clk **pclks;
@@ -76,19 +88,41 @@ static void __init exynos_arm64_init_clocks(struct device_node *np,
 	const unsigned long *reg_offs = cmu->clk_regs;
 	size_t reg_offs_len = cmu->nr_clk_regs;
 	void __iomem *reg_base;
+	bool init_auto;
 	size_t i;
 
 	reg_base = of_iomap(np, 0);
 	if (!reg_base)
 		panic("%s: failed to map registers\n", __func__);
 
+	/* ensure compatibility with older DTs */
+	if (cmu->auto_clock_gate && samsung_is_auto_capable(np))
+		init_auto = true;
+	else
+		init_auto = false;
+
+	if (cmu->option_offset && init_auto) {
+		/*
+		 * Enable the global automatic mode for the entire CMU.
+		 * This overrides the individual HWACG bits in each of the
+		 * individual gate, mux and qch registers.
+		 */
+		writel(CMU_OPT_GLOBAL_EN_AUTO_GATING,
+		       reg_base + cmu->option_offset);
+	}
+
 	for (i = 0; i < reg_offs_len; ++i) {
 		void __iomem *reg = reg_base + reg_offs[i];
 		u32 val;
 
 		if (cmu->manual_plls && is_pll_con1_reg(reg_offs[i])) {
 			writel(PLL_CON1_MANUAL, reg);
-		} else if (is_gate_reg(reg_offs[i])) {
+		} else if (is_gate_reg(reg_offs[i]) && !init_auto) {
+			/*
+			 * Setting GATE_MANUAL bit (which is described in TRM as
+			 * reserved!) overrides the global CMU automatic mode
+			 * option.
+			 */
 			val = readl(reg);
 			val |= GATE_MANUAL;
 			val &= ~GATE_ENABLE_HWACG;
@@ -210,8 +244,8 @@ void __init exynos_arm64_register_cmu(struct device *dev,
 /**
  * exynos_arm64_register_cmu_pm - Register Exynos CMU domain with PM support
  *
- * @pdev:	Platform device object
- * @set_manual:	If true, set gate clocks to manual mode
+ * @pdev:		Platform device object
+ * @init_clk_regs:	If true, initialize CMU registers
  *
  * It's a version of exynos_arm64_register_cmu() with PM support. Should be
  * called from probe function of platform driver.
@@ -219,7 +253,7 @@ void __init exynos_arm64_register_cmu(struct device *dev,
  * Return: 0 on success, or negative error code on error.
  */
 int __init exynos_arm64_register_cmu_pm(struct platform_device *pdev,
-					bool set_manual)
+					bool init_clk_regs)
 {
 	const struct samsung_cmu_info *cmu;
 	struct device *dev = &pdev->dev;
@@ -249,7 +283,7 @@ int __init exynos_arm64_register_cmu_pm(struct platform_device *pdev,
 		dev_err(dev, "%s: could not enable bus clock %s; err = %d\n",
 		       __func__, cmu->clk_name, ret);
 
-	if (set_manual)
+	if (init_clk_regs)
 		exynos_arm64_init_clocks(np, cmu);
 
 	reg_base = devm_platform_ioremap_resource(pdev, 0);
@@ -268,8 +302,10 @@ int __init exynos_arm64_register_cmu_pm(struct platform_device *pdev,
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 
-	samsung_cmu_register_clocks(data->ctx, cmu);
+	samsung_cmu_register_clocks(data->ctx, cmu, np);
 	samsung_clk_of_add_provider(dev->of_node, data->ctx);
+	/* sysreg DT nodes reference a clock in this CMU */
+	samsung_en_dyn_root_clk_gating(np, data->ctx, cmu);
 	pm_runtime_put_sync(dev);
 
 	return 0;
@@ -280,14 +316,17 @@ int exynos_arm64_cmu_suspend(struct device *dev)
 	struct exynos_arm64_cmu_data *data = dev_get_drvdata(dev);
 	int i;
 
-	samsung_clk_save(data->ctx->reg_base, data->clk_save,
+	samsung_clk_save(data->ctx->reg_base, NULL, data->clk_save,
 			 data->nr_clk_save);
 
+	samsung_clk_save(NULL, data->ctx->sysreg, data->clk_sysreg_save,
+			 data->nr_clk_sysreg);
+
 	for (i = 0; i < data->nr_pclks; i++)
 		clk_prepare_enable(data->pclks[i]);
 
 	/* For suspend some registers have to be set to certain values */
-	samsung_clk_restore(data->ctx->reg_base, data->clk_suspend,
+	samsung_clk_restore(data->ctx->reg_base, NULL, data->clk_suspend,
 			    data->nr_clk_suspend);
 
 	for (i = 0; i < data->nr_pclks; i++)
@@ -308,9 +347,14 @@ int exynos_arm64_cmu_resume(struct device *dev)
 	for (i = 0; i < data->nr_pclks; i++)
 		clk_prepare_enable(data->pclks[i]);
 
-	samsung_clk_restore(data->ctx->reg_base, data->clk_save,
+	samsung_clk_restore(data->ctx->reg_base, NULL, data->clk_save,
 			    data->nr_clk_save);
 
+	if (data->ctx->sysreg)
+		samsung_clk_restore(NULL, data->ctx->sysreg,
+				    data->clk_sysreg_save,
+				    data->nr_clk_sysreg);
+
 	for (i = 0; i < data->nr_pclks; i++)
 		clk_disable_unprepare(data->pclks[i]);
 
diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index cc5c1644c41c08b27bc48d809a08cd8a006cbe8f..246bd28bac2d577a58a7b9e0e93b700548370a36 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -1361,12 +1361,12 @@ static void __init exynos4_clk_init(struct device_node *np,
 					ARRAY_SIZE(exynos4x12_plls));
 	}
 
-	samsung_cmu_register_clocks(ctx, &cmu_info_exynos4);
+	samsung_cmu_register_clocks(ctx, &cmu_info_exynos4, np);
 
 	if (exynos4_soc == EXYNOS4210) {
-		samsung_cmu_register_clocks(ctx, &cmu_info_exynos4210);
+		samsung_cmu_register_clocks(ctx, &cmu_info_exynos4210, np);
 	} else {
-		samsung_cmu_register_clocks(ctx, &cmu_info_exynos4x12);
+		samsung_cmu_register_clocks(ctx, &cmu_info_exynos4x12, np);
 		if (soc == EXYNOS4412)
 			samsung_clk_register_cpu(ctx, exynos4412_cpu_clks,
 					ARRAY_SIZE(exynos4412_cpu_clks));
@@ -1378,15 +1378,15 @@ static void __init exynos4_clk_init(struct device_node *np,
 	if (soc == EXYNOS4212 || soc == EXYNOS4412)
 		exynos4x12_core_down_clock();
 
-	samsung_clk_extended_sleep_init(reg_base,
+	samsung_clk_extended_sleep_init(reg_base, NULL,
 			exynos4_clk_regs, ARRAY_SIZE(exynos4_clk_regs),
 			src_mask_suspend, ARRAY_SIZE(src_mask_suspend));
 	if (exynos4_soc == EXYNOS4210)
-		samsung_clk_extended_sleep_init(reg_base,
+		samsung_clk_extended_sleep_init(reg_base, NULL,
 		    exynos4210_clk_save, ARRAY_SIZE(exynos4210_clk_save),
 		    src_mask_suspend_e4210, ARRAY_SIZE(src_mask_suspend_e4210));
 	else
-		samsung_clk_sleep_init(reg_base, exynos4x12_clk_save,
+		samsung_clk_sleep_init(reg_base, NULL, exynos4x12_clk_save,
 				       ARRAY_SIZE(exynos4x12_clk_save));
 
 	samsung_clk_of_add_provider(np, ctx);
diff --git a/drivers/clk/samsung/clk-exynos4412-isp.c b/drivers/clk/samsung/clk-exynos4412-isp.c
index fa915057e109e0008ebe0b1b5d1652fd5804e82b..772bc18a1e686f23b11bf160b803becff6279637 100644
--- a/drivers/clk/samsung/clk-exynos4412-isp.c
+++ b/drivers/clk/samsung/clk-exynos4412-isp.c
@@ -94,7 +94,7 @@ static int __maybe_unused exynos4x12_isp_clk_suspend(struct device *dev)
 {
 	struct samsung_clk_provider *ctx = dev_get_drvdata(dev);
 
-	samsung_clk_save(ctx->reg_base, exynos4x12_save_isp,
+	samsung_clk_save(ctx->reg_base, NULL, exynos4x12_save_isp,
 			 ARRAY_SIZE(exynos4x12_clk_isp_save));
 	return 0;
 }
@@ -103,7 +103,7 @@ static int __maybe_unused exynos4x12_isp_clk_resume(struct device *dev)
 {
 	struct samsung_clk_provider *ctx = dev_get_drvdata(dev);
 
-	samsung_clk_restore(ctx->reg_base, exynos4x12_save_isp,
+	samsung_clk_restore(ctx->reg_base, NULL, exynos4x12_save_isp,
 			    ARRAY_SIZE(exynos4x12_clk_isp_save));
 	return 0;
 }
diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index e90d3a0848cbc24b2709c10795f6affcda404567..f97f30b29be7317db8186bac39cf52e1893eb106 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -854,7 +854,7 @@ static void __init exynos5250_clk_init(struct device_node *np)
 		PWR_CTRL2_CORE2_UP_RATIO | PWR_CTRL2_CORE1_UP_RATIO);
 	__raw_writel(tmp, reg_base + PWR_CTRL2);
 
-	samsung_clk_sleep_init(reg_base, exynos5250_clk_regs,
+	samsung_clk_sleep_init(reg_base, NULL, exynos5250_clk_regs,
 			       ARRAY_SIZE(exynos5250_clk_regs));
 	exynos5_subcmus_init(ctx, ARRAY_SIZE(exynos5250_subcmus),
 			     exynos5250_subcmus);
diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index a9df4e6db82fa7831d4e5c7210b0163d7d301ec1..1982e0751ceec7e57f9e82d96dcbadce1f691092 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -1649,12 +1649,12 @@ static void __init exynos5x_clk_init(struct device_node *np,
 				ARRAY_SIZE(exynos5800_cpu_clks));
 	}
 
-	samsung_clk_extended_sleep_init(reg_base,
+	samsung_clk_extended_sleep_init(reg_base, NULL,
 		exynos5x_clk_regs, ARRAY_SIZE(exynos5x_clk_regs),
 		exynos5420_set_clksrc, ARRAY_SIZE(exynos5420_set_clksrc));
 
 	if (soc == EXYNOS5800) {
-		samsung_clk_sleep_init(reg_base, exynos5800_clk_regs,
+		samsung_clk_sleep_init(reg_base, NULL, exynos5800_clk_regs,
 				       ARRAY_SIZE(exynos5800_clk_regs));
 
 		exynos5_subcmus_init(ctx, ARRAY_SIZE(exynos5800_subcmus),
diff --git a/drivers/clk/samsung/clk-s3c64xx.c b/drivers/clk/samsung/clk-s3c64xx.c
index 397a057af5d1e704e7ead7ba04b477fdc28c45bf..5a2d5a5703ffc5ed48b9a18a20c39be2de827920 100644
--- a/drivers/clk/samsung/clk-s3c64xx.c
+++ b/drivers/clk/samsung/clk-s3c64xx.c
@@ -449,10 +449,10 @@ void __init s3c64xx_clk_init(struct device_node *np, unsigned long xtal_f,
 	samsung_clk_register_alias(ctx, s3c64xx_clock_aliases,
 					ARRAY_SIZE(s3c64xx_clock_aliases));
 
-	samsung_clk_sleep_init(reg_base, s3c64xx_clk_regs,
+	samsung_clk_sleep_init(reg_base, NULL, s3c64xx_clk_regs,
 			       ARRAY_SIZE(s3c64xx_clk_regs));
 	if (!is_s3c6400)
-		samsung_clk_sleep_init(reg_base, s3c6410_clk_regs,
+		samsung_clk_sleep_init(reg_base, NULL, s3c6410_clk_regs,
 				       ARRAY_SIZE(s3c6410_clk_regs));
 
 	samsung_clk_of_add_provider(np, ctx);
diff --git a/drivers/clk/samsung/clk-s5pv210.c b/drivers/clk/samsung/clk-s5pv210.c
index 9a4217cc1908aa60ebbe51b2b5c841138cc46ef3..4ee4f2b5efbc1d4770fefff22de21f7d4e5e9506 100644
--- a/drivers/clk/samsung/clk-s5pv210.c
+++ b/drivers/clk/samsung/clk-s5pv210.c
@@ -782,7 +782,7 @@ static void __init __s5pv210_clk_init(struct device_node *np,
 	samsung_clk_register_alias(ctx, s5pv210_aliases,
 						ARRAY_SIZE(s5pv210_aliases));
 
-	samsung_clk_sleep_init(reg_base, s5pv210_clk_regs,
+	samsung_clk_sleep_init(reg_base, NULL, s5pv210_clk_regs,
 			       ARRAY_SIZE(s5pv210_clk_regs));
 
 	samsung_clk_of_add_provider(np, ctx);
diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index dbc9925ca8f46e951dfb5d391c0e744ca370abcc..6554ea02e29c495da83bfffe1a9d3f523fe8c73e 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -12,8 +12,10 @@
 #include <linux/clkdev.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
+#include <linux/mfd/syscon.h>
 #include <linux/mod_devicetable.h>
 #include <linux/of_address.h>
+#include <linux/regmap.h>
 #include <linux/syscore_ops.h>
 
 #include "clk.h"
@@ -21,19 +23,29 @@
 static LIST_HEAD(clock_reg_cache_list);
 
 void samsung_clk_save(void __iomem *base,
+				    struct regmap *regmap,
 				    struct samsung_clk_reg_dump *rd,
 				    unsigned int num_regs)
 {
-	for (; num_regs > 0; --num_regs, ++rd)
-		rd->value = readl(base + rd->offset);
+	for (; num_regs > 0; --num_regs, ++rd) {
+		if (base)
+			rd->value = readl(base + rd->offset);
+		else if (regmap)
+			regmap_read(regmap, rd->offset, &rd->value);
+	}
 }
 
 void samsung_clk_restore(void __iomem *base,
+				      struct regmap *regmap,
 				      const struct samsung_clk_reg_dump *rd,
 				      unsigned int num_regs)
 {
-	for (; num_regs > 0; --num_regs, ++rd)
-		writel(rd->value, base + rd->offset);
+	for (; num_regs > 0; --num_regs, ++rd) {
+		if (base)
+			writel(rd->value, base + rd->offset);
+		else if (regmap)
+			regmap_write(regmap, rd->offset, rd->value);
+	}
 }
 
 struct samsung_clk_reg_dump *samsung_clk_alloc_reg_dump(
@@ -227,6 +239,103 @@ void __init samsung_clk_register_div(struct samsung_clk_provider *ctx,
 	}
 }
 
+/*
+ * Some older DT's have an incorrect CMU resource size which is incompatible
+ * with the auto clock mode feature. In such cases we switch back to manual
+ * clock gating mode.
+ */
+bool samsung_is_auto_capable(struct device_node *np)
+{
+	struct resource res;
+	resource_size_t size;
+
+	if (of_address_to_resource(np, 0, &res))
+		return false;
+
+	size = resource_size(&res);
+	if (size != 0x10000) {
+		pr_warn("%pOF: incorrect res size for automatic clocks\n", np);
+		return false;
+	}
+	return true;
+}
+
+#define ACG_MSK GENMASK(6, 4)
+#define CLK_IDLE GENMASK(5, 4)
+static int samsung_auto_clk_gate_is_en(struct clk_hw *hw)
+{
+	u32 reg;
+	struct clk_gate *gate = to_clk_gate(hw);
+
+	reg = readl(gate->reg);
+	return ((reg & ACG_MSK) == CLK_IDLE) ? 0 : 1;
+}
+
+/* enable and disable are nops in automatic clock mode */
+static int samsung_auto_clk_gate_en(struct clk_hw *hw)
+{
+	return 0;
+}
+
+static void samsung_auto_clk_gate_dis(struct clk_hw *hw)
+{
+}
+
+static const struct clk_ops samsung_auto_clk_gate_ops = {
+	.enable = samsung_auto_clk_gate_en,
+	.disable = samsung_auto_clk_gate_dis,
+	.is_enabled = samsung_auto_clk_gate_is_en,
+};
+
+struct clk_hw *samsung_register_auto_gate(struct device *dev,
+		struct device_node *np, const char *name,
+		const char *parent_name, const struct clk_hw *parent_hw,
+		const struct clk_parent_data *parent_data,
+		unsigned long flags,
+		void __iomem *reg, u8 bit_idx,
+		u8 clk_gate_flags, spinlock_t *lock)
+{
+	struct clk_gate *gate;
+	struct clk_hw *hw;
+	struct clk_init_data init = {};
+	int ret = -EINVAL;
+
+	/* allocate the gate */
+	gate = kzalloc(sizeof(*gate), GFP_KERNEL);
+	if (!gate)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.ops = &samsung_auto_clk_gate_ops;
+	init.flags = flags;
+	init.parent_names = parent_name ? &parent_name : NULL;
+	init.parent_hws = parent_hw ? &parent_hw : NULL;
+	init.parent_data = parent_data;
+	if (parent_name || parent_hw || parent_data)
+		init.num_parents = 1;
+	else
+		init.num_parents = 0;
+
+	/* struct clk_gate assignments */
+	gate->reg = reg;
+	gate->bit_idx = bit_idx;
+	gate->flags = clk_gate_flags;
+	gate->lock = lock;
+	gate->hw.init = &init;
+
+	hw = &gate->hw;
+	if (dev || !np)
+		ret = clk_hw_register(dev, hw);
+	else if (np)
+		ret = of_clk_hw_register(np, hw);
+	if (ret) {
+		kfree(gate);
+		hw = ERR_PTR(ret);
+	}
+
+	return hw;
+}
+
 /* register a list of gate clocks */
 void __init samsung_clk_register_gate(struct samsung_clk_provider *ctx,
 				const struct samsung_gate_clock *list,
@@ -234,14 +343,24 @@ void __init samsung_clk_register_gate(struct samsung_clk_provider *ctx,
 {
 	struct clk_hw *clk_hw;
 	unsigned int idx;
+	void __iomem *reg_offs;
 
 	for (idx = 0; idx < nr_clk; idx++, list++) {
-		clk_hw = clk_hw_register_gate(ctx->dev, list->name, list->parent_name,
-				list->flags, ctx->reg_base + list->offset,
+		reg_offs = ctx->reg_base + list->offset;
+
+		if (ctx->auto_clock_gate && ctx->gate_dbg_offset)
+			clk_hw = samsung_register_auto_gate(ctx->dev, NULL,
+				list->name, list->parent_name, NULL, NULL,
+				list->flags, reg_offs + ctx->gate_dbg_offset,
 				list->bit_idx, list->gate_flags, &ctx->lock);
+		else
+			clk_hw = clk_hw_register_gate(ctx->dev, list->name,
+				list->parent_name, list->flags,
+				ctx->reg_base + list->offset, list->bit_idx,
+				list->gate_flags, &ctx->lock);
 		if (IS_ERR(clk_hw)) {
-			pr_err("%s: failed to register clock %s\n", __func__,
-				list->name);
+			pr_err("%s: failed to register clock %s: %ld\n", __func__,
+				list->name, PTR_ERR(clk_hw));
 			continue;
 		}
 
@@ -276,10 +395,11 @@ static int samsung_clk_suspend(void)
 	struct samsung_clock_reg_cache *reg_cache;
 
 	list_for_each_entry(reg_cache, &clock_reg_cache_list, node) {
-		samsung_clk_save(reg_cache->reg_base, reg_cache->rdump,
-				reg_cache->rd_num);
-		samsung_clk_restore(reg_cache->reg_base, reg_cache->rsuspend,
-				reg_cache->rsuspend_num);
+		samsung_clk_save(reg_cache->reg_base, reg_cache->sysreg,
+				 reg_cache->rdump, reg_cache->rd_num);
+		samsung_clk_restore(reg_cache->reg_base, reg_cache->sysreg,
+				    reg_cache->rsuspend,
+				    reg_cache->rsuspend_num);
 	}
 	return 0;
 }
@@ -289,8 +409,8 @@ static void samsung_clk_resume(void)
 	struct samsung_clock_reg_cache *reg_cache;
 
 	list_for_each_entry(reg_cache, &clock_reg_cache_list, node)
-		samsung_clk_restore(reg_cache->reg_base, reg_cache->rdump,
-				reg_cache->rd_num);
+		samsung_clk_restore(reg_cache->reg_base, reg_cache->sysreg,
+				    reg_cache->rdump, reg_cache->rd_num);
 }
 
 static struct syscore_ops samsung_clk_syscore_ops = {
@@ -299,6 +419,7 @@ static struct syscore_ops samsung_clk_syscore_ops = {
 };
 
 void samsung_clk_extended_sleep_init(void __iomem *reg_base,
+			struct regmap *sysreg,
 			const unsigned long *rdump,
 			unsigned long nr_rdump,
 			const struct samsung_clk_reg_dump *rsuspend,
@@ -319,6 +440,7 @@ void samsung_clk_extended_sleep_init(void __iomem *reg_base,
 		register_syscore_ops(&samsung_clk_syscore_ops);
 
 	reg_cache->reg_base = reg_base;
+	reg_cache->sysreg = sysreg;
 	reg_cache->rd_num = nr_rdump;
 	reg_cache->rsuspend = rsuspend;
 	reg_cache->rsuspend_num = nr_rsuspend;
@@ -332,8 +454,17 @@ void samsung_clk_extended_sleep_init(void __iomem *reg_base,
  * @cmu: CMU object with clocks to register
  */
 void __init samsung_cmu_register_clocks(struct samsung_clk_provider *ctx,
-					const struct samsung_cmu_info *cmu)
+					const struct samsung_cmu_info *cmu,
+					struct device_node *np)
 {
+	if (samsung_is_auto_capable(np) && cmu->auto_clock_gate)
+		ctx->auto_clock_gate = cmu->auto_clock_gate;
+
+	ctx->gate_dbg_offset = cmu->gate_dbg_offset;
+	ctx->option_offset = cmu->option_offset;
+	ctx->drcg_offset = cmu->drcg_offset;
+	ctx->memclk_offset = cmu->memclk_offset;
+
 	if (cmu->pll_clks)
 		samsung_clk_register_pll(ctx, cmu->pll_clks, cmu->nr_pll_clks);
 	if (cmu->mux_clks)
@@ -353,6 +484,37 @@ void __init samsung_cmu_register_clocks(struct samsung_clk_provider *ctx,
 		samsung_clk_register_cpu(ctx, cmu->cpu_clks, cmu->nr_cpu_clks);
 }
 
+/* Each bit enable/disables DRCG of a bus component */
+#define DRCG_EN_MSK	GENMASK(31, 0)
+#define MEMCLK_EN	BIT(0)
+
+/* Enable Dynamic Root Clock Gating (DRCG) of bus components */
+void samsung_en_dyn_root_clk_gating(struct device_node *np,
+				    struct samsung_clk_provider *ctx,
+				    const struct samsung_cmu_info *cmu)
+{
+	if (!ctx->auto_clock_gate)
+		return;
+
+	ctx->sysreg = syscon_regmap_lookup_by_phandle(np, "samsung,sysreg");
+	if (IS_ERR(ctx->sysreg)) {
+		pr_warn("%pOF: Unable to get CMU sysreg\n", np);
+		ctx->sysreg = NULL;
+	} else {
+		/* Enable DRCG for all bus components */
+		regmap_write(ctx->sysreg, ctx->drcg_offset, DRCG_EN_MSK);
+		/* Enable memclk gate (not present on all sysreg) */
+		if (ctx->memclk_offset)
+			regmap_write_bits(ctx->sysreg, ctx->memclk_offset,
+					  MEMCLK_EN, 0x0);
+
+		samsung_clk_extended_sleep_init(NULL, ctx->sysreg,
+						cmu->sysreg_clk_regs,
+						cmu->nr_sysreg_clk_regs,
+						NULL, 0);
+	}
+}
+
 /*
  * Common function which registers plls, muxes, dividers and gates
  * for each CMU. It also add CMU register list to register cache.
@@ -371,14 +533,17 @@ struct samsung_clk_provider * __init samsung_cmu_register_one(
 	}
 
 	ctx = samsung_clk_init(NULL, reg_base, cmu->nr_clk_ids);
-	samsung_cmu_register_clocks(ctx, cmu);
+	samsung_cmu_register_clocks(ctx, cmu, np);
 
 	if (cmu->clk_regs)
-		samsung_clk_extended_sleep_init(reg_base,
+		samsung_clk_extended_sleep_init(reg_base, NULL,
 			cmu->clk_regs, cmu->nr_clk_regs,
 			cmu->suspend_regs, cmu->nr_suspend_regs);
 
 	samsung_clk_of_add_provider(np, ctx);
 
+	/* sysreg DT nodes reference a clock in this CMU */
+	samsung_en_dyn_root_clk_gating(np, ctx, cmu);
+
 	return ctx;
 }
diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index 18660c1ac6f0106b17b9efc9c6b3cd62d46f7b82..a56aa3be54d817cd24bf2bc29427e783a1a9a859 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -12,6 +12,7 @@
 
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
+#include <linux/regmap.h>
 #include "clk-pll.h"
 #include "clk-cpu.h"
 
@@ -19,13 +20,25 @@
  * struct samsung_clk_provider - information about clock provider
  * @reg_base: virtual address for the register base
  * @dev: clock provider device needed for runtime PM
+ * @sysreg: syscon regmap for clock-provider sysreg controller
  * @lock: maintains exclusion between callbacks for a given clock-provider
+ * @auto_clock_gate: enable auto clk mode for all clocks in clock-provider
+ * @gate_dbg_offset: gate debug reg offset. Used for all gates in auto clk mode
+ * @option_offset: option reg offset. Enables auto mode for clock-provider
+ * @drcg_offset: dynamic root clk gate enable register offset in sysreg
+ * @memclk_offset: memclk enable register offset in sysreg
  * @clk_data: holds clock related data like clk_hw* and number of clocks
  */
 struct samsung_clk_provider {
 	void __iomem *reg_base;
 	struct device *dev;
+	struct regmap *sysreg;
 	spinlock_t lock;
+	bool auto_clock_gate;
+	u32 gate_dbg_offset;
+	u32 option_offset;
+	u32 drcg_offset;
+	u32 memclk_offset;
 	/* clk_data must be the last entry due to variable length 'hws' array */
 	struct clk_hw_onecell_data clk_data;
 };
@@ -310,6 +323,7 @@ struct samsung_cpu_clock {
 struct samsung_clock_reg_cache {
 	struct list_head node;
 	void __iomem *reg_base;
+	struct regmap *sysreg;
 	struct samsung_clk_reg_dump *rdump;
 	unsigned int rd_num;
 	const struct samsung_clk_reg_dump *rsuspend;
@@ -338,7 +352,14 @@ struct samsung_clock_reg_cache {
  * @suspend_regs: list of clock registers to set before suspend
  * @nr_suspend_regs: count of clock registers in @suspend_regs
  * @clk_name: name of the parent clock needed for CMU register access
+ * @sysreg_clk_regs: list of sysreg clock registers
+ * @nr_sysreg_clk_regs: count of clock registers in @sysreg_clk_regs
  * @manual_plls: Enable manual control for PLL clocks
+ * @auto_clock_gate: enable auto clock mode for all components in CMU
+ * @gate_dbg_offset: gate debug reg offset. Used by all gates in auto clk mode
+ * @option_offset: option reg offset. Enables auto clk mode for entire CMU
+ * @drcg_offset: dynamic root clk gate enable register offset in sysreg
+ * @memclk_offset: memclk enable register offset in sysreg
  */
 struct samsung_cmu_info {
 	const struct samsung_pll_clock *pll_clks;
@@ -364,8 +385,16 @@ struct samsung_cmu_info {
 	unsigned int nr_suspend_regs;
 	const char *clk_name;
 
+	const unsigned long *sysreg_clk_regs;
+	unsigned int nr_sysreg_clk_regs;
+
 	/* ARM64 Exynos CMUs */
 	bool manual_plls;
+	bool auto_clock_gate;
+	u32 gate_dbg_offset;
+	u32 option_offset;
+	u32 drcg_offset;
+	u32 memclk_offset;
 };
 
 struct samsung_clk_provider *samsung_clk_init(struct device *dev,
@@ -408,35 +437,55 @@ void samsung_clk_register_cpu(struct samsung_clk_provider *ctx,
 		const struct samsung_cpu_clock *list, unsigned int nr_clk);
 
 void samsung_cmu_register_clocks(struct samsung_clk_provider *ctx,
-				 const struct samsung_cmu_info *cmu);
+				 const struct samsung_cmu_info *cmu,
+				 struct device_node *np);
 struct samsung_clk_provider *samsung_cmu_register_one(
 			struct device_node *,
 			const struct samsung_cmu_info *);
 
 #ifdef CONFIG_PM_SLEEP
 void samsung_clk_extended_sleep_init(void __iomem *reg_base,
+			struct regmap *sysreg,
 			const unsigned long *rdump,
 			unsigned long nr_rdump,
 			const struct samsung_clk_reg_dump *rsuspend,
 			unsigned long nr_rsuspend);
 #else
 static inline void samsung_clk_extended_sleep_init(void __iomem *reg_base,
+			struct regmap *sysreg,
 			const unsigned long *rdump,
 			unsigned long nr_rdump,
 			const struct samsung_clk_reg_dump *rsuspend,
 			unsigned long nr_rsuspend) {}
 #endif
-#define samsung_clk_sleep_init(reg_base, rdump, nr_rdump) \
-	samsung_clk_extended_sleep_init(reg_base, rdump, nr_rdump, NULL, 0)
+#define samsung_clk_sleep_init(reg_base, sysreg, rdump, nr_rdump)	   \
+	samsung_clk_extended_sleep_init(reg_base, sysreg, rdump, nr_rdump, \
+					NULL, 0)
 
 void samsung_clk_save(void __iomem *base,
+			struct regmap *regmap,
 			struct samsung_clk_reg_dump *rd,
 			unsigned int num_regs);
 void samsung_clk_restore(void __iomem *base,
+			struct regmap *regmap,
 			const struct samsung_clk_reg_dump *rd,
 			unsigned int num_regs);
 struct samsung_clk_reg_dump *samsung_clk_alloc_reg_dump(
 			const unsigned long *rdump,
 			unsigned long nr_rdump);
 
+void samsung_en_dyn_root_clk_gating(struct device_node *np,
+				struct samsung_clk_provider *ctx,
+				const struct samsung_cmu_info *cmu);
+
+struct clk_hw *samsung_register_auto_gate(struct device *dev,
+		struct device_node *np, const char *name,
+		const char *parent_name, const struct clk_hw *parent_hw,
+		const struct clk_parent_data *parent_data,
+		unsigned long flags,
+		void __iomem *reg, u8 bit_idx,
+		u8 clk_gate_flags, spinlock_t *lock);
+
+bool samsung_is_auto_capable(struct device_node *np);
+
 #endif /* __SAMSUNG_CLK_H */

-- 
2.51.1.851.g4ebd6896fd-goog


