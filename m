Return-Path: <linux-samsung-soc+bounces-9081-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31574AEF75A
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  1 Jul 2025 13:54:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 783B33A1806
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  1 Jul 2025 11:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9611274B21;
	Tue,  1 Jul 2025 11:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jy4WzMNb"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE0C274649
	for <linux-samsung-soc@vger.kernel.org>; Tue,  1 Jul 2025 11:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370593; cv=none; b=uhttKUEzecUHwzEGFMCjk2IGHTB16CQ9Nzn9w1Xp4zK4oHqumj6W22r3GvT5QLnNIjGhJaOyi7Hn/5503TPAOlUwtL8vhlVbGwZloHCR2pZskaj1/crReO7Lym5jI/ReQNSzxBjFV6uF3ar2gwLcJpMbRwIpdfmenDgpn2sYAH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370593; c=relaxed/simple;
	bh=xYU5I7Lu+Jn3hhEIVbzF6uUlBzDo+9kqpgQz2+1XBmk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JjEd+yZRFwd7X+aOuaoF5/TGsDCFrrqW1cwJPpeloLB/JJxaQKhpbic+s1ZlUypmXE1ZU7cjfXbsQE9S1K6VdaEpjGrObCfz4mQX7pi/v3wa3hpICBLu7NEgF3xWlEypNMcuAE6+GmrHCQ+EZkWfoJA+JRn1WhXlicVgP0Gw81c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jy4WzMNb; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45310223677so22646905e9.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 01 Jul 2025 04:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751370590; x=1751975390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dmlFoe2aym4eeL7Hz5sMKNcWh8dSGY8xkumy4xR8mSk=;
        b=jy4WzMNbJhNkD4RoTE1xOXU3scI1qSUdUSUWSW2Q++LTXpVWKP1D1ne5JsqbUyOzzq
         zTMxwU10OH8/s9+YREUo4b9GELH6G488und+roJPhFMoEc94m0/Z+KoA95dEmP0gzqGJ
         W4sKZ9kqbvlRKBBrJrBZnfGweCyNwxc++P+uRBACPcVgXNm1TJ0pfzATaWnzWsuWs+4O
         k5LCi1aJCYD1wLd5ZdAMltDuQrCm4IcMekjtJQ0BE7HSdvJd7teuXgdGBC0PTvMiMM6p
         rNGHZnUIckOAuB08mqaGS+mfARjprVTGtjQFBXVCIJPI0w4AZVmGOskH85lRgGYGkF9o
         HU2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370590; x=1751975390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dmlFoe2aym4eeL7Hz5sMKNcWh8dSGY8xkumy4xR8mSk=;
        b=DgozJb4bUYc3S4MKQa683t7lNp78Khm30J/rFMz7/BXoO94baIdGVFVXMrZgMCI4D9
         VWsYaiYNGZfLK6OSPwicfV3M4EI2W41OUVoca1lp22FGutWPum2L5XF1zniAR3Lu1Kkn
         ENbzh4hO4o/+CTugfSEuqKCabtdCW871gUOerDB+nABePWxHPUIvrcrApFRjTSIj1MBN
         9gyF5IMzkg2++d11u0xI3upQjoh1f/qZhTwldChn2zJYUria7NY3ZoMfepqMOqUwbqPE
         K3Lvsvnagzwlfv+1XR2j8IEoZ1a7Zqbnl5gJl6iOsf1jcB3b/6APVmrIHi3bTyIqdioD
         T5xw==
X-Forwarded-Encrypted: i=1; AJvYcCX9uJczOpFDS2HS9SJwoP2DNZsz6zWVmeK8j0bUjTBKKCi2fDW+Ki9zoFffugoXw1Pb8QBG3n0ydkFSMsA9wdlU8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTOqS1dVjq9N6wummi8ve2KHAIA7bT+8DxBR8kHuwRFToC6EDW
	T6EBU2MPf63QeiDnehGP0+qgLCAU+QNkVzcqWcJpjCKWjFIEjyPvOpsYiNiyCGi2vBI=
X-Gm-Gg: ASbGncvryMIiqKLiWyfQbwOil+5WNfjpDO4+ILty5p8jdoCPRWvMHMIfobLQpZv5Rhv
	Z3FqR2rW3sE01Xqn/F6eSsWG/zCdzaXKPAGyaV1Uk9OvhJNbZo28tzEPBiLRNLn6al6qdlGcZ7L
	v4pN07r3Xp9srf6S5qPnuw8QTGTqY0VdbQtcDnW0CcIdXBl/db5qTUVd3lW6g21CONxeeDCdka6
	ilzy6McgzXLOvH/3bczGijiEqnkSIgzWwoijcbkwKLVlkecmvzfQ9rsXu1/k3MOdWSFmi1isaz+
	MnqN3dhR2geS9Zol3tQSij0mJQrs0eBFLot9jKhkFgmpmTZp18OHCw==
X-Google-Smtp-Source: AGHT+IGJrN6PNufVnPsz2OChBPF0nzndAxw1Vgqz8TrakhIeBN1I20xOkzC1J1aLNxuEe6wnZRadWA==
X-Received: by 2002:a05:600c:4e01:b0:453:6146:1172 with SMTP id 5b1f17b1804b1-4538ee4f7cfmr193139605e9.3.1751370589775;
        Tue, 01 Jul 2025 04:49:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a387:7a32:8457:f9b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c05csm193988925e9.5.2025.07.01.04.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:49:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 01 Jul 2025 13:49:37 +0200
Subject: [PATCH RFT v2 3/6] mfd: vexpress-sysreg: set-up software nodes for
 gpio-mmio
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-gpio-mmio-pdata-v2-3-ebf34d273497@linaro.org>
References: <20250701-gpio-mmio-pdata-v2-0-ebf34d273497@linaro.org>
In-Reply-To: <20250701-gpio-mmio-pdata-v2-0-ebf34d273497@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3488;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=T6LXibepSEWSVZc5pSawHsl5dJjLPLgQMdCiAMb4Z7Q=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoY8tX3EkD2/+Qls/ylxbJqZ8GBp5rTpjE9xcMl
 GxTjsfzP0OJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGPLVwAKCRARpy6gFHHX
 cpCvEADPfHzms9P3YOgQRuuTWhfoI9MXVAtI7MQBLr3MoBA4W0MBMbmvFXzZukdAnQlPygwowCT
 hKvSLzZzJtfL9kj2p3QlCJcsyrfKpnbFOcCODQ+ktHV9i36LEsZ1jS8SQTyY72JQbe6LYFAnmEQ
 eEZWT4f1VJbiryBn9b34dsURVsjgVR5A0lgizO/J3R2UyvESZJW1W3jEwCZ5uh3IjHqmCjKUkkh
 AMbPzmyUxq+jM6Irzj89JmFrg2kd8Au8qW6mp+UKJkVzzyvPdQuzc0PPWe0qvu83zbceJnBlGtx
 S6oila3incG4pqEoh3dlwnwArCKvEekCZZjiB2+SYsLkZwhYGYUi8n7kNJAYOZQ2swpVLm9Yt7X
 +39BMZvQTOP45spQWexcRbhFb0n1ehMOY0V5V79jpCE9RSD+Y1zNZZK5c22RNMrXXWIqDB7vQqK
 qq6k+/vydQKjL/gQSZ3CfGWshMzsNh6UHpLHJIPTo/RPcGmsoMcEZOOR/pCCDdUi6A2pCLU/XOY
 ojeStlRrT+kGuYekJyqr07U9tueX+1anJ4zBuI2z+By67Fb2ZRbe1pjMadGtU4BbyfVlw9RWUeS
 29fMfr/NEqeDo1yqwk1rrWwGJpxNX417UDjiPK7Q90BJOOgGiI4DLH8grbYUAazW61aap7lLE5d
 5fKD5bW1I1h8cqw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Replace struct bgpio_pdata - that we plan to remove - with software
nodes containing properties encoding the same values thatr can now be
parsed by gpio-mmio.

Acked-by: Lee Jones <lee@kernel.org>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/mfd/vexpress-sysreg.c | 46 ++++++++++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 18 deletions(-)

diff --git a/drivers/mfd/vexpress-sysreg.c b/drivers/mfd/vexpress-sysreg.c
index ef03d6cec9ff6927668d051ca459eb1d8ff7269e..fc2daffc4352cca763cefbf6e17bdd5242290198 100644
--- a/drivers/mfd/vexpress-sysreg.c
+++ b/drivers/mfd/vexpress-sysreg.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/stat.h>
 
@@ -37,22 +38,34 @@
 
 /* The sysreg block is just a random collection of various functions... */
 
-static struct bgpio_pdata vexpress_sysreg_sys_led_pdata = {
-	.label = "sys_led",
-	.base = -1,
-	.ngpio = 8,
+static const struct property_entry vexpress_sysreg_sys_led_props[] = {
+	PROPERTY_ENTRY_STRING("label", "sys_led"),
+	PROPERTY_ENTRY_U32("ngpios", 8),
+	{ }
 };
 
-static struct bgpio_pdata vexpress_sysreg_sys_mci_pdata = {
-	.label = "sys_mci",
-	.base = -1,
-	.ngpio = 2,
+static const struct software_node vexpress_sysreg_sys_led_swnode = {
+	.properties = vexpress_sysreg_sys_led_props,
 };
 
-static struct bgpio_pdata vexpress_sysreg_sys_flash_pdata = {
-	.label = "sys_flash",
-	.base = -1,
-	.ngpio = 1,
+static const struct property_entry vexpress_sysreg_sys_mci_props[] = {
+	PROPERTY_ENTRY_STRING("label", "sys_mci"),
+	PROPERTY_ENTRY_U32("ngpios", 2),
+	{ }
+};
+
+static const struct software_node vexpress_sysreg_sys_mci_swnode = {
+	.properties = vexpress_sysreg_sys_mci_props,
+};
+
+static const struct property_entry vexpress_sysreg_sys_flash_props[] = {
+	PROPERTY_ENTRY_STRING("label", "sys_flash"),
+	PROPERTY_ENTRY_U32("ngpios", 1),
+	{ }
+};
+
+static const struct software_node vexpress_sysreg_sys_flash_swnode = {
+	.properties = vexpress_sysreg_sys_flash_props,
 };
 
 static struct mfd_cell vexpress_sysreg_cells[] = {
@@ -61,22 +74,19 @@ static struct mfd_cell vexpress_sysreg_cells[] = {
 		.of_compatible = "arm,vexpress-sysreg,sys_led",
 		.num_resources = 1,
 		.resources = &DEFINE_RES_MEM_NAMED(SYS_LED, 0x4, "dat"),
-		.platform_data = &vexpress_sysreg_sys_led_pdata,
-		.pdata_size = sizeof(vexpress_sysreg_sys_led_pdata),
+		.swnode = &vexpress_sysreg_sys_led_swnode,
 	}, {
 		.name = "basic-mmio-gpio",
 		.of_compatible = "arm,vexpress-sysreg,sys_mci",
 		.num_resources = 1,
 		.resources = &DEFINE_RES_MEM_NAMED(SYS_MCI, 0x4, "dat"),
-		.platform_data = &vexpress_sysreg_sys_mci_pdata,
-		.pdata_size = sizeof(vexpress_sysreg_sys_mci_pdata),
+		.swnode = &vexpress_sysreg_sys_mci_swnode,
 	}, {
 		.name = "basic-mmio-gpio",
 		.of_compatible = "arm,vexpress-sysreg,sys_flash",
 		.num_resources = 1,
 		.resources = &DEFINE_RES_MEM_NAMED(SYS_FLASH, 0x4, "dat"),
-		.platform_data = &vexpress_sysreg_sys_flash_pdata,
-		.pdata_size = sizeof(vexpress_sysreg_sys_flash_pdata),
+		.swnode = &vexpress_sysreg_sys_flash_swnode,
 	}, {
 		.name = "vexpress-syscfg",
 		.num_resources = 1,

-- 
2.48.1


