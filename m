Return-Path: <linux-samsung-soc+bounces-2817-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0448AF50E
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 23 Apr 2024 19:08:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41E0D283B2F
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 23 Apr 2024 17:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E94081411E0;
	Tue, 23 Apr 2024 17:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a2AwiqQp"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937E113E417
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2024 17:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713891991; cv=none; b=T3IAqIqwQLB7R9CjJ2V+spwAzAmRu5RqF8+MBCrlSeuQ1bt6Zf/4jmnS8qTUoVo8nNNDmZi+n25NKQoRKBzdtP5jN0qBXUs9PcQF71efpOe6klmUQbSjQnwpDYfgvALLHD1fBzMHQfSAiBJo9dQXNp1b/6+oz+ie+crnuMsq2YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713891991; c=relaxed/simple;
	bh=sIOXqiDrtk7tVpNIzIRp+8xksjez3NhoyVTs37tN5UU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DQcHLYSoRL8oPN8EDv4I38Wfz9LZqmCDXa9HkU7Uxbz/anvmUaeUB1T4RrC4NiKtkl5ERKmLGjPomvZ30UamwutFarYmfuUPs3WUamnUDM1j2Jl/KMKZv5g+Y+vRlmDHh42lyMtX8JezNaycId53BdexErodH4bYKzp9XXGEgSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a2AwiqQp; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5171a529224so7493727e87.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2024 10:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713891988; x=1714496788; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+vUhDKXPklUQaoMg57UftZpfsFphPLc1NzgX6Dyq6FE=;
        b=a2AwiqQpzn6OdcrD5e8vP5lXdNcda/0sBjh3qLshqiCsawPCRM7VoxZXfoWgdhh+hk
         z8nsy8fpG1veknYJ8ENz9F6SxJTMnhpX/I6KUcnYJXSZsZlBeBwl6KMblHiTbaSWpKot
         5WZWa7WN5hHnbVfdwJz/69JR/2D3FAjh67qhgbqKBSPWGao/CnsBX32jGN/FgmDneqrH
         2vM47ZXCHcQ1DrMnhB7fyeN3eFPeKfVg628VJNiKRtN0AThENwsf4gcWda7GQKcWzD/6
         4Uio+aNZfZeK6JY7XEK9LAeJU9MXO2CCCs1/b8SeG+Ph0opYsm7N/jBh8qNiTZiFICig
         5yBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713891988; x=1714496788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+vUhDKXPklUQaoMg57UftZpfsFphPLc1NzgX6Dyq6FE=;
        b=XwwmZg3cYQDnMmiXLog7TmWfFpD5I4vJuzEuX88rXKQa371aXgUPjFWy4W7M0hC8N3
         BFEbFpro93QnPsN73McSDTcBf6iIryrKA6bkNFDzIHEPdi7U4h11BRc/yl0G9uhuDibS
         xD3BWbg5A/Y3mpoWc3yuIesgvvsgYw+3QO4DNJHCmB5clF8L4+XdfNkWvD+zF3yak44P
         MUWfc7Awtv3irbtsRU1QzMwrrBadi5MAwqncdHK3b86D/JOdswTqZoiCYwPOy7FTmhcn
         7gDKS/9Tmz897ftVBxXWArjUTO8sq7VzcfykEXVqNWDaV5EZ2F4mhSrCCsEQkR1QVw8A
         FxIQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3mLSOkiXXejITEdcS5j80kTJb+bGay6fewcz/DBrUs26byow+uqDcy/Oeo4ARDtkbnBXKcmCJInZYyLLRdaaxP4ReN/XeGMuS3Anx03xpcbY=
X-Gm-Message-State: AOJu0Yz3gHJPySA+TlCKqvMvv4BqtG2JeD0iI/Yl06VTodRG3wNWs2zw
	8u1Tpr+lEIKbZkDcPYG8BJ+yWwmTvLTw280GCCjblmRlOdwzUH4Q06zpfXHemEQ=
X-Google-Smtp-Source: AGHT+IHQsxS6sDmYaEGjgGyclRauXytdCr8pKx+VVEIvbFcKa7wbKgsNsPSCkF/Ll6Uh5D6/ImEfyw==
X-Received: by 2002:a05:6512:1385:b0:51b:3572:a9a1 with SMTP id fc5-20020a056512138500b0051b3572a9a1mr158584lfb.5.1713891987251;
        Tue, 23 Apr 2024 10:06:27 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id t22-20020a1709063e5600b00a5209dc79c1sm7351624eji.146.2024.04.23.10.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 10:06:26 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 23 Apr 2024 18:06:07 +0100
Subject: [PATCH 5/7] phy: exynos5-usbdrd: uniform order of register bit
 macros
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240423-usb-phy-gs101-v1-5-ebdcb3ac174d@linaro.org>
References: <20240423-usb-phy-gs101-v1-0-ebdcb3ac174d@linaro.org>
In-Reply-To: <20240423-usb-phy-gs101-v1-0-ebdcb3ac174d@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.12.4

Most of the macros are ordered high -> low, but there are some
outliers.

Order them all uniformly from high to low. This will allow adding
additional register (field) definitions in a consistent way.

While at it, also remove some extra empty lines to group register bit
field definitions together with the relevant register. This makes the
registers easier to distinguish visually.

No functional change.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 44 +++++++++++---------------------
 1 file changed, 15 insertions(+), 29 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 0f9078689856..88b03bb67fff 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -35,13 +35,11 @@
 
 /* Exynos5: USB 3.0 DRD PHY registers */
 #define EXYNOS5_DRD_LINKSYSTEM			0x04
-
+#define LINKSYSTEM_XHCI_VERSION_CONTROL		BIT(27)
 #define LINKSYSTEM_FLADJ_MASK			(0x3f << 1)
 #define LINKSYSTEM_FLADJ(_x)			((_x) << 1)
-#define LINKSYSTEM_XHCI_VERSION_CONTROL		BIT(27)
 
 #define EXYNOS5_DRD_PHYUTMI			0x08
-
 #define PHYUTMI_OTGDISABLE			BIT(6)
 #define PHYUTMI_FORCESUSPEND			BIT(1)
 #define PHYUTMI_FORCESLEEP			BIT(0)
@@ -49,40 +47,31 @@
 #define EXYNOS5_DRD_PHYPIPE			0x0c
 
 #define EXYNOS5_DRD_PHYCLKRST			0x10
-
 #define PHYCLKRST_EN_UTMISUSPEND		BIT(31)
-
 #define PHYCLKRST_SSC_REFCLKSEL_MASK		(0xff << 23)
 #define PHYCLKRST_SSC_REFCLKSEL(_x)		((_x) << 23)
-
 #define PHYCLKRST_SSC_RANGE_MASK		(0x03 << 21)
 #define PHYCLKRST_SSC_RANGE(_x)			((_x) << 21)
-
 #define PHYCLKRST_SSC_EN			BIT(20)
 #define PHYCLKRST_REF_SSP_EN			BIT(19)
 #define PHYCLKRST_REF_CLKDIV2			BIT(18)
-
 #define PHYCLKRST_MPLL_MULTIPLIER_MASK		(0x7f << 11)
 #define PHYCLKRST_MPLL_MULTIPLIER_100MHZ_REF	(0x19 << 11)
 #define PHYCLKRST_MPLL_MULTIPLIER_50M_REF	(0x32 << 11)
 #define PHYCLKRST_MPLL_MULTIPLIER_24MHZ_REF	(0x68 << 11)
 #define PHYCLKRST_MPLL_MULTIPLIER_20MHZ_REF	(0x7d << 11)
 #define PHYCLKRST_MPLL_MULTIPLIER_19200KHZ_REF	(0x02 << 11)
-
-#define PHYCLKRST_FSEL_UTMI_MASK		(0x7 << 5)
 #define PHYCLKRST_FSEL_PIPE_MASK		(0x7 << 8)
+#define PHYCLKRST_FSEL_UTMI_MASK		(0x7 << 5)
 #define PHYCLKRST_FSEL(_x)			((_x) << 5)
 #define PHYCLKRST_FSEL_PAD_100MHZ		(0x27 << 5)
 #define PHYCLKRST_FSEL_PAD_24MHZ		(0x2a << 5)
 #define PHYCLKRST_FSEL_PAD_20MHZ		(0x31 << 5)
 #define PHYCLKRST_FSEL_PAD_19_2MHZ		(0x38 << 5)
-
 #define PHYCLKRST_RETENABLEN			BIT(4)
-
 #define PHYCLKRST_REFCLKSEL_MASK		(0x03 << 2)
 #define PHYCLKRST_REFCLKSEL_PAD_REFCLK		(0x2 << 2)
 #define PHYCLKRST_REFCLKSEL_EXT_REFCLK		(0x3 << 2)
-
 #define PHYCLKRST_PORTRESET			BIT(1)
 #define PHYCLKRST_COMMONONN			BIT(0)
 
@@ -100,30 +89,27 @@
 #define PHYREG1_CR_ACK				BIT(0)
 
 #define EXYNOS5_DRD_PHYPARAM0			0x1c
-
 #define PHYPARAM0_REF_USE_PAD			BIT(31)
 #define PHYPARAM0_REF_LOSLEVEL_MASK		(0x1f << 26)
 #define PHYPARAM0_REF_LOSLEVEL			(0x9 << 26)
 
 #define EXYNOS5_DRD_PHYPARAM1			0x20
-
 #define PHYPARAM1_PCS_TXDEEMPH_MASK		(0x1f << 0)
 #define PHYPARAM1_PCS_TXDEEMPH			(0x1c)
 
 #define EXYNOS5_DRD_PHYTERM			0x24
 
 #define EXYNOS5_DRD_PHYTEST			0x28
-
 #define PHYTEST_POWERDOWN_SSP			BIT(3)
 #define PHYTEST_POWERDOWN_HSP			BIT(2)
 
 #define EXYNOS5_DRD_PHYADP			0x2c
 
 #define EXYNOS5_DRD_PHYUTMICLKSEL		0x30
-
 #define PHYUTMICLKSEL_UTMI_CLKSEL		BIT(2)
 
 #define EXYNOS5_DRD_PHYRESUME			0x34
+
 #define EXYNOS5_DRD_LINKPORT			0x44
 
 /* USB 3.0 DRD PHY SS Function Control Reg; accessed by CR_PORT */
@@ -147,31 +133,31 @@
 
 /* Exynos850: USB DRD PHY registers */
 #define EXYNOS850_DRD_LINKCTRL			0x04
-#define LINKCTRL_BUS_FILTER_BYPASS(_x)		((_x) << 4)
 #define LINKCTRL_FORCE_QACT			BIT(8)
+#define LINKCTRL_BUS_FILTER_BYPASS(_x)		((_x) << 4)
 
 #define EXYNOS850_DRD_CLKRST			0x20
-#define CLKRST_LINK_SW_RST			BIT(0)
-#define CLKRST_PORT_RST				BIT(1)
 #define CLKRST_PHY_SW_RST			BIT(3)
+#define CLKRST_PORT_RST				BIT(1)
+#define CLKRST_LINK_SW_RST			BIT(0)
 
 #define EXYNOS850_DRD_SSPPLLCTL			0x30
 #define SSPPLLCTL_FSEL				GENMASK(2, 0)
 
 #define EXYNOS850_DRD_UTMI			0x50
-#define UTMI_FORCE_SLEEP			BIT(0)
-#define UTMI_FORCE_SUSPEND			BIT(1)
-#define UTMI_DM_PULLDOWN			BIT(2)
-#define UTMI_DP_PULLDOWN			BIT(3)
-#define UTMI_FORCE_BVALID			BIT(4)
 #define UTMI_FORCE_VBUSVALID			BIT(5)
+#define UTMI_FORCE_BVALID			BIT(4)
+#define UTMI_DP_PULLDOWN			BIT(3)
+#define UTMI_DM_PULLDOWN			BIT(2)
+#define UTMI_FORCE_SUSPEND			BIT(1)
+#define UTMI_FORCE_SLEEP			BIT(0)
 
 #define EXYNOS850_DRD_HSP			0x54
-#define HSP_COMMONONN				BIT(8)
-#define HSP_EN_UTMISUSPEND			BIT(9)
-#define HSP_VBUSVLDEXT				BIT(12)
-#define HSP_VBUSVLDEXTSEL			BIT(13)
 #define HSP_FSV_OUT_EN				BIT(24)
+#define HSP_VBUSVLDEXTSEL			BIT(13)
+#define HSP_VBUSVLDEXT				BIT(12)
+#define HSP_EN_UTMISUSPEND			BIT(9)
+#define HSP_COMMONONN				BIT(8)
 
 #define EXYNOS850_DRD_HSP_TEST			0x5c
 #define HSP_TEST_SIDDQ				BIT(24)

-- 
2.44.0.769.g3c40516874-goog


