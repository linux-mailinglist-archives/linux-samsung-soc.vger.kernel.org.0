Return-Path: <linux-samsung-soc+bounces-3947-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E489F93FA57
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 29 Jul 2024 18:12:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D233283AB6
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 29 Jul 2024 16:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 729A415A86D;
	Mon, 29 Jul 2024 16:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="rNm9SlNT"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E985158DA7
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jul 2024 16:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722269525; cv=none; b=k6P877nD1gj1ZaDnS6LhZucG+DTN2iT7ycVfKZEGquH7lcbx0rxTSj6hJdv+lzEL+B7bmjPoTke5RtVQUusZ6j41d3H+76VcuJ71yRzP3fIYtW+M828bHIxH7QZXWdpDe6u9myWxfr4Gu1TBNwRsCGoHIZPujICnPJyxF+WrhAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722269525; c=relaxed/simple;
	bh=NaY+2CkI6SOg52Efr47A/pv+X9x7twLt8m/g6af3SAc=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:References; b=nzfl3pooG7d2Jjk3ZKrD5VmI4HGKjhWqo3zdw09/QO0nqXENSNIhabFOXpNx3Oj1QYl1hZkpMDH+MqcIpSNHddA1nNYZrn6qIiALej/LkYI/fb+dG3b2quVB+xnn00NyGb/cLy3VoQS6xERv4KA2ASkChDxxQcx2h5awI41nfO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=rNm9SlNT; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20240729161159epoutp02403f099c26cbd90c7c38e30b0a983a1f~muwDKopdV1988719887epoutp02H
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jul 2024 16:11:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20240729161159epoutp02403f099c26cbd90c7c38e30b0a983a1f~muwDKopdV1988719887epoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1722269519;
	bh=9L/goxeiyr+ov9kjUZNbh1NnOXc0mWNWTmljliLuAjQ=;
	h=From:To:Cc:Subject:Date:References:From;
	b=rNm9SlNTUPtOIvYsXAxJ4dp3AnMDcUAkj7aDbW2sGOa1bDyd//lylGv2v70oREJ9Z
	 btkikaQ2LJ5d1+PlpeZ3qC962iPcUAAGxFJAppkxGyz9p2paZ8vuC9yLAVY1KFaWVc
	 yiAAo9p2Dnr5iYoULwfOlyflJldv7ZWKNqosZo+s=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20240729161158epcas5p1986600c359db7c9b891ce886706c5427~muwCKVrds1255512555epcas5p1D;
	Mon, 29 Jul 2024 16:11:58 +0000 (GMT)
Received: from epsmgec5p1-new.samsung.com (unknown [182.195.38.180]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4WXjzc6ZDCz4x9Pp; Mon, 29 Jul
	2024 16:11:56 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmgec5p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	0C.25.19863.C4FB7A66; Tue, 30 Jul 2024 01:11:56 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20240729154736epcas5p111a53e297c7f8c3122bf491cabaf74b8~muawmDE0Q3250532505epcas5p1P;
	Mon, 29 Jul 2024 15:47:36 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240729154736epsmtrp28471d52e7a82b16720048d80053df401~muawlaJOf0726007260epsmtrp2Z;
	Mon, 29 Jul 2024 15:47:36 +0000 (GMT)
X-AuditID: b6c32a50-ef5fe70000004d97-56-66a7bf4ce896
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	C0.FE.19367.899B7A66; Tue, 30 Jul 2024 00:47:36 +0900 (KST)
Received: from cheetah.sa.corp.samsungelectronics.net (unknown
	[107.109.115.53]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240729154734epsmtip1c8e462bd54e09b35ed685921f00a7b82~muau8TE9J2717127171epsmtip1c;
	Mon, 29 Jul 2024 15:47:34 +0000 (GMT)
From: Vishnu Reddy <vishnu.reddy@samsung.com>
To: krzysztof.kozlowski@linaro.org, s.nawrocki@samsung.com,
	alim.akhtar@samsung.com, linus.walleij@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	pankaj.dubey@samsung.com, ravi.patel@samsung.com, gost.dev@samsung.com
Subject: [PATCH v4] pinctrl: samsung: Add support for pull-up and pull-down
Date: Mon, 29 Jul 2024 21:06:31 +0530
Message-Id: <20240729153631.24536-1-vishnu.reddy@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAKsWRmVeSWpSXmKPExsWy7bCmpq7P/uVpBns26ls8mLeNzeLmgZ1M
	Fntfb2W3mPJnOZPFpsfXWC02z//DaHF51xw2ixnn9zFZLNr6hd3i4Yc97BaH37SzOnB73Lm2
	h81j85J6j74tqxg9Pm+SC2CJyrbJSE1MSS1SSM1Lzk/JzEu3VfIOjneONzUzMNQ1tLQwV1LI
	S8xNtVVy8QnQdcvMATpKSaEsMacUKBSQWFyspG9nU5RfWpKqkJFfXGKrlFqQklNgUqBXnJhb
	XJqXrpeXWmJlaGBgZApUmJCd8e/AUuaC/Q4V1468YGtgXG/WxcjJISFgIrF4xhHWLkYuDiGB
	PYwSm278YYdwPjFKTJt/hBGkCsyZNUEPpuPys8lQRTsZJTa3b2SFKGplkvg0txTEZhPQlfi8
	5CwLiC0ikC+x8sI/JpAGZoGLjBL/tuwHaxAW8JaYd3QWG4jNIqAqseT/WyYQm1fAVuLzs6Ns
	ENvkJVZvOMAM0iwhsI9dYtLb1cwQCReJDy9+QRUJS7w6voUdwpaS+PxuL1Q8WWL971NAcQ4g
	O0eiZ5oCRNhe4sCVOSwgYWYBTYn1u/QhwrISU0+tAzuBWYBPovf3EyaIOK/EjnkwtprEsUnT
	WSFsGYnOFTcYIWwPiVM3X7GCjBQSiJXoPGI/gVF2FsKCBYyMqxilUguKc9NTk00LDHXzUsvh
	8ZScn7uJEZzUtAJ2MK7e8FfvECMTB+MhRgkOZiUR3vgrS9OEeFMSK6tSi/Lji0pzUosPMZoC
	g2wis5Rocj4wreaVxBuaWBqYmJmZmVgamxkqifO+bp2bIiSQnliSmp2aWpBaBNPHxMEp1cDU
	2vMkKJHzzf1DK9Ryy86bOHyfOfUNk/nNB7vfVlssN7pZX1zOOEG+5uKvZX5rr0meX75X5cCD
	/BkW3TyzJq/rZm/+s76r0fn+7/iPYluXxSx3mxm/juGZyNRF8qd6zf/9Fiqb8P6MiWjKCa15
	by7ZRXyVs+vtKO9unrVoIdfL/XXnQuzrml4/O9fJ/f3Arjx1c9aylZ0n5V4I7ErpZP/65+u8
	6wanWW+d0l/7sPjfLUsr2a+5a4y53q1+pV5SteDCsX2Hvp7maNxhkLBhgqjacY6Ib9ItzuKb
	mc2q53gJnL3Lf4T1XXIG64NieZUSdd95XNmvOZl77JyU2LZ96nZviHzfX/El3f/Zypa5so9O
	KrEUZyQaajEXFScCAErpZkLzAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkluLIzCtJLcpLzFFi42LZdlhJTnfGzuVpBj9+iVo8mLeNzeLmgZ1M
	Fntfb2W3mPJnOZPFpsfXWC02z//DaHF51xw2ixnn9zFZLNr6hd3i4Yc97BaH37SzOnB73Lm2
	h81j85J6j74tqxg9Pm+SC2CJ4rJJSc3JLEst0rdL4Mr4d2Apc8F+h4prR16wNTCuN+ti5OSQ
	EDCRuPxsMjuILSSwnVHiXLMDRFxG4sOdLcwQtrDEyn/PgWq4gGqamSQaVn9iAUmwCehKfF5y
	FswWESiWuPJ6HxNIEbPATUaJvq1fwBLCAt4S847OYgOxWQRUJZb8f8sEYvMK2Ep8fnaUDWKD
	vMTqDQeYJzDyLGBkWMUomlpQnJuem1xgqFecmFtcmpeul5yfu4kRHFpaQTsYl63/q3eIkYmD
	8RCjBAezkghv/JWlaUK8KYmVValF+fFFpTmpxYcYpTlYlMR5lXM6U4QE0hNLUrNTUwtSi2Cy
	TBycUg1M7Zs0s259Vzl5IqRm2rdp8m3/zyzxuvTjAedPid1PCxxWzTt6VyblbXZIqFY584LE
	ihdeMc35reW67fJZLyVcmW41xX2JXub3NuW6wjutxT9eHtkrb3OqqETD6ntes5FUq59SsZwz
	j94Zw7Aji+dnXGY2c77pvmPj9Rdtv7T2itgudTJYUSP2TT6cX2rTVZGVN7uXyYlkhd/avf3Z
	zcWd119fafi69fIuVb77Fyp1t3wIXDCp9dS8BzKcG29dZTsqYyu3ximmMlBjy8Ub7VlmdhfE
	/wal6hkZm8acn2d2yPB6lV2ouZ6CBsdM3uCOT/m1n6dH3HZYaJRaeci+89bU70/DDwduYlrZ
	bXSS4WGAEktxRqKhFnNRcSIA9pwtXZwCAAA=
X-CMS-MailID: 20240729154736epcas5p111a53e297c7f8c3122bf491cabaf74b8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240729154736epcas5p111a53e297c7f8c3122bf491cabaf74b8
References: <CGME20240729154736epcas5p111a53e297c7f8c3122bf491cabaf74b8@epcas5p1.samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

Gpiolib framework has the implementation of setting up the
PUD configuration for GPIO pins but there is no driver support.

Add support to handle the PUD configuration request from the
userspace in samsung pinctrl driver.

Signed-off-by: Vishnu Reddy <vishnu.reddy@samsung.com>
---
 drivers/pinctrl/samsung/pinctrl-exynos-arm.c | 14 ++++
 drivers/pinctrl/samsung/pinctrl-s3c64xx.c    | 14 ++++
 drivers/pinctrl/samsung/pinctrl-samsung.c    | 77 ++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.h    | 21 ++++++
 4 files changed, 126 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm.c
index 85ddf49a5188..d3d8672f74dc 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm.c
@@ -40,6 +40,19 @@ static const struct samsung_pin_bank_type bank_type_alive = {
 #define S5P_OTHERS_RET_MMC		(1 << 29)
 #define S5P_OTHERS_RET_UART		(1 << 28)
 
+#define S5P_PIN_PULL_DISABLE		0
+#define S5P_PIN_PULL_DOWN		1
+#define S5P_PIN_PULL_UP			2
+
+static void s5pv210_pud_value_init(struct samsung_pinctrl_drv_data *drvdata)
+{
+	unsigned int  *pud_val = drvdata->pud_val;
+
+	pud_val[PUD_PULL_DISABLE] = S5P_PIN_PULL_DISABLE;
+	pud_val[PUD_PULL_DOWN] = S5P_PIN_PULL_DOWN;
+	pud_val[PUD_PULL_UP] = S5P_PIN_PULL_UP;
+}
+
 static void s5pv210_retention_disable(struct samsung_pinctrl_drv_data *drvdata)
 {
 	void __iomem *clk_base = (void __iomem *)drvdata->retention_ctrl->priv;
@@ -133,6 +146,7 @@ static const struct samsung_pin_ctrl s5pv210_pin_ctrl[] __initconst = {
 		.nr_banks	= ARRAY_SIZE(s5pv210_pin_bank),
 		.eint_gpio_init = exynos_eint_gpio_init,
 		.eint_wkup_init = exynos_eint_wkup_init,
+		.pud_value_init	= s5pv210_pud_value_init,
 		.suspend	= exynos_pinctrl_suspend,
 		.resume		= exynos_pinctrl_resume,
 		.retention_data	= &s5pv210_retention_data,
diff --git a/drivers/pinctrl/samsung/pinctrl-s3c64xx.c b/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
index c5d92db4fdb1..68715c09baa9 100644
--- a/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
+++ b/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
@@ -63,6 +63,10 @@
 #define EINT_CON_MASK		0xF
 #define EINT_CON_LEN		4
 
+#define S3C_PIN_PULL_DISABLE	0
+#define S3C_PIN_PULL_DOWN	1
+#define S3C_PIN_PULL_UP		2
+
 static const struct samsung_pin_bank_type bank_type_4bit_off = {
 	.fld_width = { 4, 1, 2, 0, 2, 2, },
 	.reg_offset = { 0x00, 0x04, 0x08, 0, 0x0c, 0x10, },
@@ -255,6 +259,15 @@ static int s3c64xx_irq_get_trigger(unsigned int type)
 	return trigger;
 }
 
+static void s3c64xx_pud_value_init(struct samsung_pinctrl_drv_data *drvdata)
+{
+	unsigned int  *pud_val = drvdata->pud_val;
+
+	pud_val[PUD_PULL_DISABLE] = S3C_PIN_PULL_DISABLE;
+	pud_val[PUD_PULL_DOWN] = S3C_PIN_PULL_DOWN;
+	pud_val[PUD_PULL_UP] = S3C_PIN_PULL_UP;
+}
+
 static void s3c64xx_irq_set_handler(struct irq_data *d, unsigned int type)
 {
 	/* Edge- and level-triggered interrupts need different handlers */
@@ -797,6 +810,7 @@ static const struct samsung_pin_ctrl s3c64xx_pin_ctrl[] __initconst = {
 		.nr_banks	= ARRAY_SIZE(s3c64xx_pin_banks0),
 		.eint_gpio_init = s3c64xx_eint_gpio_init,
 		.eint_wkup_init = s3c64xx_eint_eint0_init,
+		.pud_value_init	= s3c64xx_pud_value_init,
 	},
 };
 
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 623df65a5d6f..15aa1b71c025 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -997,6 +997,77 @@ static int samsung_pinctrl_unregister(struct platform_device *pdev,
 	return 0;
 }
 
+static void samsung_pud_value_init(struct samsung_pinctrl_drv_data *drvdata)
+{
+	unsigned int  *pud_val = drvdata->pud_val;
+
+	pud_val[PUD_PULL_DISABLE] = EXYNOS_PIN_PUD_PULL_DISABLE;
+	pud_val[PUD_PULL_DOWN] = EXYNOS_PIN_PID_PULL_DOWN;
+	pud_val[PUD_PULL_UP] = EXYNOS_PIN_PID_PULL_UP;
+}
+
+/*
+ * Enable or Disable the pull-down and pull-up for the gpio pins in the
+ * PUD register.
+ */
+static void samsung_gpio_set_pud(struct gpio_chip *gc, unsigned int offset,
+				 unsigned int value)
+{
+	struct samsung_pin_bank *bank = gpiochip_get_data(gc);
+	const struct samsung_pin_bank_type *type = bank->type;
+	void __iomem *reg;
+	unsigned int data, mask;
+
+	reg = bank->pctl_base + bank->pctl_offset;
+	data = readl(reg + type->reg_offset[PINCFG_TYPE_PUD]);
+	mask = (1 << type->fld_width[PINCFG_TYPE_PUD]) - 1;
+	data &= ~(mask << (offset * type->fld_width[PINCFG_TYPE_PUD]));
+	data |= value << (offset * type->fld_width[PINCFG_TYPE_PUD]);
+	writel(data, reg + type->reg_offset[PINCFG_TYPE_PUD]);
+}
+
+/*
+ * Identify the type of PUD config based on the gpiolib request to enable
+ * or disable the PUD config.
+ */
+static int samsung_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
+				   unsigned long config)
+{
+	struct samsung_pin_bank *bank = gpiochip_get_data(gc);
+	struct samsung_pinctrl_drv_data *drvdata = bank->drvdata;
+	unsigned int value;
+	int ret = 0;
+	unsigned long flags;
+
+	switch (pinconf_to_config_param(config)) {
+	case PIN_CONFIG_BIAS_DISABLE:
+		value = drvdata->pud_val[PUD_PULL_DISABLE];
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		value = drvdata->pud_val[PUD_PULL_DOWN];
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		value = drvdata->pud_val[PUD_PULL_UP];
+		break;
+	default:
+		return -ENOTSUPP;
+	}
+
+	ret = clk_enable(drvdata->pclk);
+	if (ret) {
+		dev_err(drvdata->dev, "failed to enable clock\n");
+		return ret;
+	}
+
+	raw_spin_lock_irqsave(&bank->slock, flags);
+	samsung_gpio_set_pud(gc, offset, value);
+	raw_spin_unlock_irqrestore(&bank->slock, flags);
+
+	clk_disable(drvdata->pclk);
+
+	return ret;
+}
+
 static const struct gpio_chip samsung_gpiolib_chip = {
 	.request = gpiochip_generic_request,
 	.free = gpiochip_generic_free,
@@ -1006,6 +1077,7 @@ static const struct gpio_chip samsung_gpiolib_chip = {
 	.direction_output = samsung_gpio_direction_output,
 	.to_irq = samsung_gpio_to_irq,
 	.add_pin_ranges = samsung_add_pin_ranges,
+	.set_config = samsung_gpio_set_config,
 	.owner = THIS_MODULE,
 };
 
@@ -1237,6 +1309,11 @@ static int samsung_pinctrl_probe(struct platform_device *pdev)
 	if (ctrl->eint_wkup_init)
 		ctrl->eint_wkup_init(drvdata);
 
+	if (ctrl->pud_value_init)
+		ctrl->pud_value_init(drvdata);
+	else
+		samsung_pud_value_init(drvdata);
+
 	ret = samsung_gpiolib_register(pdev, drvdata);
 	if (ret)
 		goto err_unregister;
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index d50ba6f07d5d..a1e7377bd890 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -61,6 +61,25 @@ enum pincfg_type {
 #define PIN_CON_FUNC_INPUT		0x0
 #define PIN_CON_FUNC_OUTPUT		0x1
 
+/* Values for the pin PUD register */
+#define EXYNOS_PIN_PUD_PULL_DISABLE	0x0
+#define EXYNOS_PIN_PID_PULL_DOWN	0x1
+#define EXYNOS_PIN_PID_PULL_UP		0x3
+
+/*
+ * enum pud_index - Possible index values to access the pud_val array.
+ * @PUD_PULL_DISABLE: Index for the value of pud disable
+ * @PUD_PULL_DOWN: Index for the value of pull down enable
+ * @PUD_PULL_UP: Index for the value of pull up enable
+ * @PUD_MAX: Maximum value of the index
+ */
+enum pud_index {
+	PUD_PULL_DISABLE,
+	PUD_PULL_DOWN,
+	PUD_PULL_UP,
+	PUD_MAX,
+};
+
 /**
  * enum eint_type - possible external interrupt types.
  * @EINT_TYPE_NONE: bank does not support external interrupts
@@ -261,6 +280,7 @@ struct samsung_pin_ctrl {
 
 	int		(*eint_gpio_init)(struct samsung_pinctrl_drv_data *);
 	int		(*eint_wkup_init)(struct samsung_pinctrl_drv_data *);
+	void		(*pud_value_init)(struct samsung_pinctrl_drv_data *drvdata);
 	void		(*suspend)(struct samsung_pinctrl_drv_data *);
 	void		(*resume)(struct samsung_pinctrl_drv_data *);
 };
@@ -307,6 +327,7 @@ struct samsung_pinctrl_drv_data {
 	struct samsung_pin_bank		*pin_banks;
 	unsigned int			nr_banks;
 	unsigned int			nr_pins;
+	unsigned int			pud_val[PUD_MAX];
 
 	struct samsung_retention_ctrl	*retention_ctrl;
 
-- 
2.17.1


