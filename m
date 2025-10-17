Return-Path: <linux-samsung-soc+bounces-11672-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B333CBEAAEF
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 17 Oct 2025 18:27:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3616E7C6CDC
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 17 Oct 2025 16:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7061C29D29B;
	Fri, 17 Oct 2025 16:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eYC3eoo9"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62DF28BA83
	for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Oct 2025 16:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760717681; cv=none; b=kJ5amvPp+klSOJtKmLMvdCf/7pb36Wnc1hlp41mlDDfoyXzlqi4N49k0TFFRmAKGVz/gaipNDZ4LL3zlu9yCW46iDvyxsGjHOKW363UV8EOU9/6o//YUJE57xtCd0sO3Fgf6vC4OpvCcP5RO6xV3TVfLcvxeEU/GEKm/ghv13s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760717681; c=relaxed/simple;
	bh=5/qHH/qJPeo52eR4nh9RGKCb80hizVm4y8byN88yTVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BsqAAh+0MvwzjqG4hdWKtiJZXieccEBss3y2rk18CJebBTQoZqzo2CSMJguIBaToD6Eh0tZyxWT04PBLC5eDs8G7Tl3rZcqdyu80ZngwtcTZngKqVLubj3Yn6ORnDshrOIMOpa59xx/eYQ8oaZxJoa5+Dz4wVNtTsu8VRSG6ogg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eYC3eoo9; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so371472566b.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Oct 2025 09:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760717663; x=1761322463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4AVQkVWkSpv+c29B8Ps5AAe0PdN8tLvW+micY1ygqzY=;
        b=eYC3eoo97Bzzc0pSuUeWNRsNtpEde67pVCLqsKeAiCe5/8ZsxmK4EgfMrmfu2jzf8s
         5zEgGBCs3RSwy8rwluijJLoKnUTOyDRwhT5uRRsIOf7G39KXFHLoFCZAIamofukpvMam
         vyrMEdbSHcH0TqPmQeBWGAmH0BQMVOR5l6NBSNIdD/lXP0Fia9/sC7GfQp4idL7wHudP
         l9k+Ka6z+5k7oy495VxbnaM0B1Lo830Du5YwfNycVkPJhD+k6Bu0BKi8aWZ4VncTU5OF
         F4d3Wx5CmfRWNfayGiOI9wT2lOrDE0av4RmozZ7JyBGmDKs9Dd2fOz/Xr5qxLM9tHMt5
         S/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760717663; x=1761322463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4AVQkVWkSpv+c29B8Ps5AAe0PdN8tLvW+micY1ygqzY=;
        b=MvFuBsW9E+E+in+FRgqemyTc1vna6qk+XGIRjP1BpoLI4+M9tZWMhqNKE85uIsJU4A
         XG4Y8bPgPNgD26WHvmvfY5wtSB70ipiKhLGMoIzW5NI/rYGtuFWFyEYRAqm1uYA9q57K
         pPS+ah0w5mRpvgjp2bjN6e489e1yB7cPeFopxhjlXjCNnWDzop/1sRgmjwB+2iDIHtge
         HLqz6V0P/vtA37NBD51kHFsVcSpY0ZagpQCwUDU9s38Y3pcCcB4V+k2jALuLD/bYGI1W
         if6YfG/3rt7dLglY587a7taPcYHBEGqIcGmz+VMcsRrWb9DuvEKZYLhPPwm5jq5yGVpd
         258A==
X-Forwarded-Encrypted: i=1; AJvYcCW45ou93S4rVs1Ukc6hc10mQL3ofxI78KXB/FErjw16qcZHHRwOHD2yiQwmaZMVzInhf2fifgAKBzHvh3YNMf+FeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwySaJ+xeTwzOtr2pVWBb1H41ouTkYWDMPfiHYUtbmDxXWJeMuX
	cI7iuDi4UKuPbupT0j4Fx5fbjF8qxyGtPRaj5hUhIL+lFvERTwVVexW+
X-Gm-Gg: ASbGncujSrZBY6hjSXm9iSGDYkTbDbnFD8Kj9SZvqdyfThD/LSg5vlZjHZc8O4csUNh
	ajyp77shl/deNvgfckPx+Kkg2Azjv+T6RZdt8uAk/cV1b/v6p/4PKEUIBkCGe4MnTJ9BGMAob9D
	9x84XwsNnO1H5kQya4DDZpZum3oKBAojCaNQBXmeHgFsDc8w3sEnYtLW8+qnXChXWVfA1DnMwFR
	eZizx4NjOtqPGojyYyOByCCDCxrSG09tAY0jGoCN/zGHOyF9OseVpAsvzOE/+N4CHZe9BA8tkkj
	hNd9vh+6M4JFoKK+HYVh/337QemeH7t2peAF9lF4Vre12lSUTe61aNFnh4aIxq52j9ptlMwnH1U
	RDONWH4tveUpm4T1g3kHzMNuP0Ld5j8YNLYSFL59cYKyr/I7lxLyFqmgsJcDuxHDf9GsXSvwpZl
	Zrn6e5C4aliTZE5/HbmBCf3R1wfuwO2OI7kVP/7oR60zzVExAnAQ2AZht9R9Yj+A==
X-Google-Smtp-Source: AGHT+IEbXCZjxOakbZj5fR8zQg/0+/GsOT3c2+EShjF4kzURpmuBt+TMKbS+7CHCgsV0G9iCi3jrKw==
X-Received: by 2002:a17:907:3ccb:b0:aff:fe6:78f0 with SMTP id a640c23a62f3a-b64764e4b6bmr523782666b.54.1760717662232;
        Fri, 17 Oct 2025 09:14:22 -0700 (PDT)
Received: from ivaylo-T580.. (79-100-18-255.ip.btc-net.bg. [79.100.18.255])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036706sm9606466b.41.2025.10.17.09.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 09:14:21 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] clk: samsung: introduce exynos8890 clock driver
Date: Fri, 17 Oct 2025 19:13:33 +0300
Message-ID: <20251017161334.1295955-6-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017161334.1295955-1-ivo.ivanov.ivanov1@gmail.com>
References: <20251017161334.1295955-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a clocks management driver for exynos8890, providing clocks
for the peripherals of that SoC.

As exynos8890 is the first exynos SoC to feature Hardware Auto Clock
Gating (HWACG), it differs from newer SoCs. Q-channel and Q-state bits
are separate registers, unlike the CLK_CON_GAT_* ones that feature HWACG
bits in the same register that controls manual gating. Hence, don't use
the clk-exynos-arm64 helper, but implement logic that enforces manual
gating.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
Changes from V2:
- include bitfield.h to ease the kernel test robot's pain
- add a comment that specifies we're disabling hwacg and change
the commit description as per Peng Fan's suggestion
---
 drivers/clk/samsung/Makefile         |    1 +
 drivers/clk/samsung/clk-exynos8890.c | 8697 ++++++++++++++++++++++++++
 2 files changed, 8698 insertions(+)
 create mode 100644 drivers/clk/samsung/clk-exynos8890.c

diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
index ef464f434..4fb55d078 100644
--- a/drivers/clk/samsung/Makefile
+++ b/drivers/clk/samsung/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos7.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos7870.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos7885.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos850.o
+obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos8890.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos8895.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos990.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynosautov9.o
diff --git a/drivers/clk/samsung/clk-exynos8890.c b/drivers/clk/samsung/clk-exynos8890.c
new file mode 100644
index 000000000..16c4b74e0
--- /dev/null
+++ b/drivers/clk/samsung/clk-exynos8890.c
@@ -0,0 +1,8697 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+ * Author: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+ *
+ * Common Clock Framework support for Exynos8890 SoC.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/of_address.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#include <dt-bindings/clock/samsung,exynos8890-cmu.h>
+
+#include "clk.h"
+
+/* NOTE: Must be equal to the last clock ID increased by one */
+#define TOP_NR_CLK	(CLK_GOUT_TOP_SCLK_PROMISE_DISP + 1)
+#define PERIS_NR_CLK	(CLK_GOUT_PERIS_SCLK_PROMISE_PERIS + 1)
+#define APOLLO_NR_CLK	(CLK_GOUT_APOLLO_SCLK_PROMISE_APOLLO + 1)
+#define AUD_NR_CLK	(CLK_GOUT_AUD_SCLK_I2S_BCLK + 1)
+#define BUS0_NR_CLK	(CLK_GOUT_BUS0_ACLK_TREX_P_BUS0 + 1)
+#define BUS1_NR_CLK	(CLK_GOUT_BUS1_ACLK_TREX_P_BUS1 + 1)
+#define CCORE_NR_CLK	(CLK_GOUT_CCORE_SCLK_PROMISE + 1)
+#define DISP0_NR_CLK	(CLK_GOUT_DISP0_OSCCLK_DP_I_CLK_24M + 1)
+#define DISP1_NR_CLK	(CLK_GOUT_DISP1_SCLK_PROMISE_DISP1 + 1)
+#define FSYS0_NR_CLK	(CLK_GOUT_FSYS0_SCLK_USBHOST20_REF_CLK + 1)
+#define FSYS1_NR_CLK	(CLK_GOUT_FSYS1_SCLK_PROMISE_FSYS1 + 1)
+#define G3D_NR_CLK	(CLK_GOUT_G3D_SCLK_ASYNCAXI_G3D + 1)
+#define MIF0_NR_CLK	(CLK_GOUT_MIF0_RCLK_DREX + 1)
+#define MIF1_NR_CLK	(CLK_GOUT_MIF1_RCLK_DREX + 1)
+#define MIF2_NR_CLK	(CLK_GOUT_MIF2_RCLK_DREX + 1)
+#define MIF3_NR_CLK	(CLK_GOUT_MIF3_RCLK_DREX + 1)
+#define MNGS_NR_CLK	(CLK_GOUT_MNGS_SCLK_PROMISE0_MNGS + 1)
+#define PERIC0_NR_CLK	(CLK_GOUT_PERIC0_SCLK_PWM + 1)
+#define PERIC1_NR_CLK	(CLK_GOUT_PERIC1_SCLK_UART5 + 1)
+
+/*
+ * As exynos8890 first introduced hwacg, cmu registers are mapped similarly
+ * to exynos7, with the exception of the new q-state and q-ch registers that
+ * can set the behavior of automatic gates.
+ */
+
+/* decoded magic number from downstream */
+#define QCH_EN_MASK		BIT(0)
+#define QCH_MASK		(GENMASK(19, 16) | BIT(12))
+#define QCH_DIS			(QCH_MASK | FIELD_PREP(QCH_EN_MASK, 0))
+
+/* q-channel registers offsets range */
+#define QCH_OFF_START		0x2000
+#define QCH_OFF_END		0x23ff
+
+/* q-state registers offsets range */
+#define QSTATE_OFF_START	0x2400
+#define QSTATE_OFF_END		0x2fff
+
+/* check if the register offset is a QCH register */
+static bool is_qch_reg(unsigned long off)
+{
+	return off >= QCH_OFF_START && off <= QCH_OFF_END;
+}
+
+/* check if the register offset is a QSTATE register */
+static bool is_qstate_reg(unsigned long off)
+{
+	return off >= QSTATE_OFF_START && off <= QSTATE_OFF_END;
+}
+
+static void __init exynos8890_init_clocks(struct device_node *np,
+					  const struct samsung_cmu_info *cmu)
+{
+	const unsigned long *reg_offs = cmu->clk_regs;
+	size_t reg_offs_len = cmu->nr_clk_regs;
+	void __iomem *reg_base;
+	size_t i;
+
+	reg_base = of_iomap(np, 0);
+	if (!reg_base)
+		panic("%s: failed to map registers\n", __func__);
+
+	for (i = 0; i < reg_offs_len; ++i) {
+		void __iomem *reg = reg_base + reg_offs[i];
+		u32 val;
+
+		/* let the driver control gating by disabling qch and qstate */
+		if (is_qch_reg(reg_offs[i])) {
+			val = QCH_DIS;
+			writel(val, reg);
+		} else if (is_qstate_reg(reg_offs[i])) {
+			val = 0;
+			writel(val, reg);
+		}
+	}
+
+	iounmap(reg_base);
+}
+
+/* ---- CMU_TOP ------------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_TOP (0x10570000) */
+#define BUS0_PLL_LOCK						0x0000
+#define BUS1_PLL_LOCK						0x0020
+#define BUS2_PLL_LOCK						0x0040
+#define BUS3_PLL_LOCK						0x0060
+#define MFC_PLL_LOCK						0x0080
+#define ISP_PLL_LOCK						0x00A0
+#define AUD_PLL_LOCK						0x00C0
+#define G3D_PLL_LOCK						0x00E0
+#define BUS0_PLL_CON0						0x0100
+#define BUS0_PLL_CON1						0x0104
+#define BUS0_PLL_FREQ_DET					0x010C
+#define BUS1_PLL_CON0						0x0120
+#define BUS1_PLL_CON1						0x0124
+#define BUS1_PLL_FREQ_DET					0x012C
+#define BUS2_PLL_CON0						0x0140
+#define BUS2_PLL_CON1						0x0144
+#define BUS2_PLL_FREQ_DET					0x014C
+#define BUS3_PLL_CON0						0x0160
+#define BUS3_PLL_CON1						0x0164
+#define BUS3_PLL_FREQ_DET					0x016C
+#define MFC_PLL_CON0						0x0180
+#define MFC_PLL_CON1						0x0184
+#define MFC_PLL_FREQ_DET					0x018C
+#define ISP_PLL_CON0						0x01A0
+#define ISP_PLL_CON1						0x01A4
+#define ISP_PLL_FREQ_DET					0x01AC
+#define AUD_PLL_CON0						0x01C0
+#define AUD_PLL_CON1						0x01C4
+#define AUD_PLL_CON2						0x01C8
+#define AUD_PLL_FREQ_DET					0x01D0
+#define G3D_PLL_CON0						0x01E0
+#define G3D_PLL_CON1						0x01E4
+#define G3D_PLL_FREQ_DET					0x01EC
+#define CLK_CON_MUX_BUS0_PLL					0x0200
+#define CLK_CON_MUX_BUS1_PLL					0x0204
+#define CLK_CON_MUX_BUS2_PLL					0x0208
+#define CLK_CON_MUX_BUS3_PLL					0x020C
+#define CLK_CON_MUX_MFC_PLL					0x0210
+#define CLK_CON_MUX_ISP_PLL					0x0214
+#define CLK_CON_MUX_AUD_PLL					0x0218
+#define CLK_CON_MUX_G3D_PLL					0x021C
+#define CLK_CON_MUX_SCLK_BUS0_PLL				0x0220
+#define CLK_CON_MUX_SCLK_BUS1_PLL				0x0224
+#define CLK_CON_MUX_SCLK_BUS2_PLL				0x0228
+#define CLK_CON_MUX_SCLK_BUS3_PLL				0x022C
+#define CLK_CON_MUX_SCLK_MFC_PLL				0x0230
+#define CLK_CON_MUX_SCLK_ISP_PLL				0x0234
+#define CLK_CON_MUX_ACLK_CCORE_800				0x0240
+#define CLK_CON_MUX_ACLK_CCORE_264				0x0244
+#define CLK_CON_MUX_ACLK_CCORE_G3D_800				0x0248
+#define CLK_CON_MUX_ACLK_CCORE_528				0x024C
+#define CLK_CON_MUX_ACLK_CCORE_132				0x0250
+#define CLK_CON_MUX_PCLK_CCORE_66				0x0254
+#define CLK_CON_MUX_ACLK_BUS0_528				0x0258
+#define CLK_CON_MUX_ACLK_BUS0_200				0x025C
+#define CLK_CON_MUX_PCLK_BUS0_132				0x0260
+#define CLK_CON_MUX_ACLK_BUS1_528				0x0264
+#define CLK_CON_MUX_PCLK_BUS1_132				0x0268
+#define CLK_CON_MUX_ACLK_DISP0_0_400				0x026C
+#define CLK_CON_MUX_ACLK_DISP0_1_400_TOP			0x0270
+#define CLK_CON_MUX_ACLK_DISP1_0_400				0x0274
+#define CLK_CON_MUX_ACLK_DISP1_1_400_TOP			0x0278
+#define CLK_CON_MUX_ACLK_MFC_600				0x027C
+#define CLK_CON_MUX_ACLK_MSCL0_528				0x0280
+#define CLK_CON_MUX_ACLK_MSCL1_528_TOP				0x0284
+#define CLK_CON_MUX_ACLK_IMEM_266				0x0288
+#define CLK_CON_MUX_ACLK_IMEM_200				0x028C
+#define CLK_CON_MUX_ACLK_IMEM_100				0x0290
+#define CLK_CON_MUX_ACLK_FSYS0_200				0x0294
+#define CLK_CON_MUX_ACLK_FSYS1_200				0x0298
+#define CLK_CON_MUX_ACLK_PERIS_66				0x029C
+#define CLK_CON_MUX_ACLK_PERIC0_66				0x02A0
+#define CLK_CON_MUX_ACLK_PERIC1_66				0x02A4
+#define CLK_CON_MUX_ACLK_ISP0_ISP0_528				0x02A8
+#define CLK_CON_MUX_ACLK_ISP0_TPU_400				0x02AC
+#define CLK_CON_MUX_ACLK_ISP0_TREX_528				0x02B0
+#define CLK_CON_MUX_ACLK_ISP1_ISP1_468				0x02B4
+#define CLK_CON_MUX_ACLK_CAM0_CSIS0_414				0x02B8
+#define CLK_CON_MUX_ACLK_CAM0_CSIS1_168				0x02BC
+#define CLK_CON_MUX_ACLK_CAM0_CSIS2_234				0x02C0
+#define CLK_CON_MUX_ACLK_CAM0_3AA0_414				0x02C4
+#define CLK_CON_MUX_ACLK_CAM0_3AA1_414				0x02C8
+#define CLK_CON_MUX_ACLK_CAM0_CSIS3_132				0x02CC
+#define CLK_CON_MUX_ACLK_CAM0_TREX_528				0x02D0
+#define CLK_CON_MUX_ACLK_CAM1_ARM_672				0x02D4
+#define CLK_CON_MUX_ACLK_CAM1_TREX_VRA_528			0x02D8
+#define CLK_CON_MUX_ACLK_CAM1_TREX_B_528			0x02DC
+#define CLK_CON_MUX_ACLK_CAM1_BUS_264				0x02E0
+#define CLK_CON_MUX_ACLK_CAM1_PERI_84				0x02E4
+#define CLK_CON_MUX_ACLK_CAM1_CSIS2_414				0x02E8
+#define CLK_CON_MUX_ACLK_CAM1_CSIS3_132				0x02EC
+#define CLK_CON_MUX_ACLK_CAM1_SCL_566				0x02F0
+#define CLK_CON_MUX_SCLK_DISP0_DECON0_ECLK0_TOP			0x02F4
+#define CLK_CON_MUX_SCLK_DISP0_DECON0_VCLK0_TOP			0x02F8
+#define CLK_CON_MUX_SCLK_DISP0_DECON0_VCLK1_TOP			0x02FC
+#define CLK_CON_MUX_SCLK_DISP0_HDMI_AUDIO_TOP			0x0300
+#define CLK_CON_MUX_SCLK_DISP1_DECON1_ECLK0_TOP			0x0304
+#define CLK_CON_MUX_SCLK_DISP1_DECON1_ECLK1_TOP			0x0308
+#define CLK_CON_MUX_SCLK_FSYS0_USBDRD30				0x030C
+#define CLK_CON_MUX_SCLK_FSYS0_MMC0				0x0310
+#define CLK_CON_MUX_SCLK_FSYS0_UFSUNIPRO20			0x0314
+#define CLK_CON_MUX_SCLK_FSYS0_PHY_24M				0x0318
+#define CLK_CON_MUX_SCLK_FSYS0_UFSUNIPRO_CFG			0x031C
+#define CLK_CON_MUX_SCLK_FSYS1_MMC2				0x0320
+#define CLK_CON_MUX_SCLK_FSYS1_UFSUNIPRO20			0x0324
+#define CLK_CON_MUX_SCLK_FSYS1_PCIE_PHY				0x0328
+#define CLK_CON_MUX_SCLK_FSYS1_UFSUNIPRO_CFG			0x032C
+#define CLK_CON_MUX_SCLK_PERIC0_UART0				0x0330
+#define CLK_CON_MUX_SCLK_PERIC1_SPI0				0x0334
+#define CLK_CON_MUX_SCLK_PERIC1_SPI1				0x0338
+#define CLK_CON_MUX_SCLK_PERIC1_SPI2				0x033C
+#define CLK_CON_MUX_SCLK_PERIC1_SPI3				0x0340
+#define CLK_CON_MUX_SCLK_PERIC1_SPI4				0x0344
+#define CLK_CON_MUX_SCLK_PERIC1_SPI5				0x0348
+#define CLK_CON_MUX_SCLK_PERIC1_SPI6				0x034C
+#define CLK_CON_MUX_SCLK_PERIC1_SPI7				0x0350
+#define CLK_CON_MUX_SCLK_PERIC1_UART1				0x0354
+#define CLK_CON_MUX_SCLK_PERIC1_UART2				0x0358
+#define CLK_CON_MUX_SCLK_PERIC1_UART3				0x035C
+#define CLK_CON_MUX_SCLK_PERIC1_UART4				0x0360
+#define CLK_CON_MUX_SCLK_PERIC1_UART5				0x0364
+#define CLK_CON_MUX_SCLK_CAM1_ISP_SPI0				0x0368
+#define CLK_CON_MUX_SCLK_CAM1_ISP_SPI1				0x036C
+#define CLK_CON_MUX_SCLK_CAM1_ISP_UART				0x0370
+#define CLK_CON_MUX_SCLK_AP2CP_MIF_PLL_OUT			0x0374
+#define CLK_CON_MUX_ACLK_PSCDC_400				0x0378
+#define CLK_CON_MUX_SCLK_BUS_PLL_MNGS				0x0380
+#define CLK_CON_MUX_SCLK_BUS_PLL_APOLLO				0x0384
+#define CLK_CON_MUX_SCLK_BUS_PLL_MIF				0x0388
+#define CLK_CON_MUX_SCLK_BUS_PLL_G3D				0x038C
+#define CLK_CON_MUX_ACLK_ISP0_PXL_ASBS_IS_C_FROM_IS_D_TOP	0x0390
+#define CLK_CON_DIV_ACLK_CCORE_800				0x03A0
+#define CLK_CON_DIV_ACLK_CCORE_264				0x03A4
+#define CLK_CON_DIV_ACLK_CCORE_G3D_800				0x03A8
+#define CLK_CON_DIV_ACLK_CCORE_528				0x03AC
+#define CLK_CON_DIV_ACLK_CCORE_132				0x03B0
+#define CLK_CON_DIV_PCLK_CCORE_66				0x03B4
+#define CLK_CON_DIV_ACLK_BUS0_528				0x03B8
+#define CLK_CON_DIV_ACLK_BUS0_200				0x03BC
+#define CLK_CON_DIV_PCLK_BUS0_132				0x03C0
+#define CLK_CON_DIV_ACLK_BUS1_528				0x03C4
+#define CLK_CON_DIV_PCLK_BUS1_132				0x03C8
+#define CLK_CON_DIV_ACLK_DISP0_0_400				0x03CC
+#define CLK_CON_DIV_ACLK_DISP0_1_400				0x03D0
+#define CLK_CON_DIV_ACLK_DISP1_0_400				0x03D4
+#define CLK_CON_DIV_ACLK_DISP1_1_400				0x03D8
+#define CLK_CON_DIV_ACLK_MFC_600				0x03DC
+#define CLK_CON_DIV_ACLK_MSCL0_528				0x03E0
+#define CLK_CON_DIV_ACLK_MSCL1_528				0x03E4
+#define CLK_CON_DIV_ACLK_IMEM_266				0x03E8
+#define CLK_CON_DIV_ACLK_IMEM_200				0x03EC
+#define CLK_CON_DIV_ACLK_IMEM_100				0x03F0
+#define CLK_CON_DIV_ACLK_FSYS0_200				0x03F4
+#define CLK_CON_DIV_ACLK_FSYS1_200				0x03F8
+#define CLK_CON_DIV_ACLK_PERIS_66				0x03FC
+#define CLK_CON_DIV_ACLK_PERIC0_66				0x0400
+#define CLK_CON_DIV_ACLK_PERIC1_66				0x0404
+#define CLK_CON_DIV_ACLK_ISP0_ISP0_528				0x0408
+#define CLK_CON_DIV_ACLK_ISP0_TPU_400				0x040C
+#define CLK_CON_DIV_ACLK_ISP0_TREX_528				0x0410
+#define CLK_CON_DIV_ACLK_ISP1_ISP1_468				0x0414
+#define CLK_CON_DIV_ACLK_CAM0_CSIS0_414				0x0418
+#define CLK_CON_DIV_ACLK_CAM0_CSIS1_168				0x041C
+#define CLK_CON_DIV_ACLK_CAM0_CSIS2_234				0x0420
+#define CLK_CON_DIV_ACLK_CAM0_3AA0_414				0x0424
+#define CLK_CON_DIV_ACLK_CAM0_3AA1_414				0x0428
+#define CLK_CON_DIV_ACLK_CAM0_CSIS3_132				0x042C
+#define CLK_CON_DIV_ACLK_CAM0_TREX_528				0x0430
+#define CLK_CON_DIV_ACLK_CAM1_ARM_672				0x0434
+#define CLK_CON_DIV_ACLK_CAM1_TREX_VRA_528			0x0438
+#define CLK_CON_DIV_ACLK_CAM1_TREX_B_528			0x043C
+#define CLK_CON_DIV_ACLK_CAM1_BUS_264				0x0440
+#define CLK_CON_DIV_ACLK_CAM1_PERI_84				0x0444
+#define CLK_CON_DIV_ACLK_CAM1_CSIS2_414				0x0448
+#define CLK_CON_DIV_ACLK_CAM1_CSIS3_132				0x044C
+#define CLK_CON_DIV_ACLK_CAM1_SCL_566				0x0450
+#define CLK_CON_DIV_SCLK_DISP0_DECON0_ECLK0			0x0454
+#define CLK_CON_DIV_SCLK_DISP0_DECON0_VCLK0			0x0458
+#define CLK_CON_DIV_SCLK_DISP0_DECON0_VCLK1			0x045C
+#define CLK_CON_DIV_SCLK_DISP0_HDMI_AUDIO			0x0460
+#define CLK_CON_DIV_SCLK_DISP1_DECON1_ECLK0			0x0464
+#define CLK_CON_DIV_SCLK_DISP1_DECON1_ECLK1			0x0468
+#define CLK_CON_DIV_SCLK_FSYS0_USBDRD30				0x046C
+#define CLK_CON_DIV_SCLK_FSYS0_MMC0				0x0470
+#define CLK_CON_DIV_SCLK_FSYS0_UFSUNIPRO20			0x0474
+#define CLK_CON_DIV_SCLK_FSYS0_PHY_24M				0x0478
+#define CLK_CON_DIV_SCLK_FSYS0_UFSUNIPRO_CFG			0x047C
+#define CLK_CON_DIV_SCLK_FSYS1_MMC2				0x0480
+#define CLK_CON_DIV_SCLK_FSYS1_UFSUNIPRO20			0x0484
+#define CLK_CON_DIV_SCLK_FSYS1_PCIE_PHY				0x0488
+#define CLK_CON_DIV_SCLK_FSYS1_UFSUNIPRO_CFG			0x048C
+#define CLK_CON_DIV_SCLK_PERIC0_UART0				0x0490
+#define CLK_CON_DIV_SCLK_PERIC1_SPI0				0x0494
+#define CLK_CON_DIV_SCLK_PERIC1_SPI1				0x0498
+#define CLK_CON_DIV_SCLK_PERIC1_SPI2				0x049C
+#define CLK_CON_DIV_SCLK_PERIC1_SPI3				0x04A0
+#define CLK_CON_DIV_SCLK_PERIC1_SPI4				0x04A4
+#define CLK_CON_DIV_SCLK_PERIC1_SPI5				0x04A8
+#define CLK_CON_DIV_SCLK_PERIC1_SPI6				0x04AC
+#define CLK_CON_DIV_SCLK_PERIC1_SPI7				0x04B0
+#define CLK_CON_DIV_SCLK_PERIC1_UART1				0x04B4
+#define CLK_CON_DIV_SCLK_PERIC1_UART2				0x04B8
+#define CLK_CON_DIV_SCLK_PERIC1_UART3				0x04BC
+#define CLK_CON_DIV_SCLK_PERIC1_UART4				0x04C0
+#define CLK_CON_DIV_SCLK_PERIC1_UART5				0x04C4
+#define CLK_CON_DIV_SCLK_CAM1_ISP_SPI0				0x04C8
+#define CLK_CON_DIV_SCLK_CAM1_ISP_SPI1				0x04CC
+#define CLK_CON_DIV_SCLK_CAM1_ISP_UART				0x04D0
+#define CLK_CON_DIV_SCLK_AP2CP_MIF_PLL_OUT			0x04D4
+#define CLK_CON_DIV_ACLK_PSCDC_400				0x04D8
+#define CLK_CON_DIV_ACLK_ISP0_PXL_ASBS_IS_C_FROM_IS_D_TOP	0x04DC
+#define CLK_CON_DIV_SCLK_BUS_PLL_MNGS				0x04F0
+#define CLK_CON_DIV_SCLK_BUS_PLL_APOLLO				0x04F4
+#define CLK_CON_DIV_SCLK_BUS_PLL_MIF				0x04F8
+#define CLK_CON_DIV_SCLK_BUS_PLL_G3D				0x04FC
+#define CLK_STAT_MUX_BUS0_PLL					0x0500
+#define CLK_STAT_MUX_BUS1_PLL					0x0504
+#define CLK_STAT_MUX_BUS2_PLL					0x0508
+#define CLK_STAT_MUX_BUS3_PLL					0x050C
+#define CLK_STAT_MUX_MFC_PLL					0x0510
+#define CLK_STAT_MUX_ISP_PLL					0x0514
+#define CLK_STAT_MUX_AUD_PLL					0x0518
+#define CLK_STAT_MUX_G3D_PLL					0x051C
+#define CLK_STAT_MUX_SCLK_BUS0_PLL				0x0520
+#define CLK_STAT_MUX_SCLK_BUS1_PLL				0x0524
+#define CLK_STAT_MUX_SCLK_BUS2_PLL				0x0528
+#define CLK_STAT_MUX_SCLK_BUS3_PLL				0x052C
+#define CLK_STAT_MUX_SCLK_MFC_PLL				0x0530
+#define CLK_STAT_MUX_SCLK_ISP_PLL				0x0534
+#define CLK_STAT_MUX_ACLK_CCORE_800				0x0540
+#define CLK_STAT_MUX_ACLK_CCORE_264				0x0544
+#define CLK_STAT_MUX_ACLK_CCORE_G3D_800				0x0548
+#define CLK_STAT_MUX_ACLK_CCORE_528				0x054C
+#define CLK_STAT_MUX_ACLK_CCORE_132				0x0550
+#define CLK_STAT_MUX_PCLK_CCORE_66				0x0554
+#define CLK_STAT_MUX_ACLK_BUS0_528				0x0558
+#define CLK_STAT_MUX_ACLK_BUS0_200				0x055C
+#define CLK_STAT_MUX_PCLK_BUS0_132				0x0560
+#define CLK_STAT_MUX_ACLK_BUS1_528				0x0564
+#define CLK_STAT_MUX_PCLK_BUS1_132				0x0568
+#define CLK_STAT_MUX_ACLK_DISP0_0_400				0x056C
+#define CLK_STAT_MUX_ACLK_DISP0_1_400_TOP			0x0570
+#define CLK_STAT_MUX_ACLK_DISP1_0_400				0x0574
+#define CLK_STAT_MUX_ACLK_DISP1_1_400_TOP			0x0578
+#define CLK_STAT_MUX_ACLK_MFC_600				0x057C
+#define CLK_STAT_MUX_ACLK_MSCL0_528				0x0580
+#define CLK_STAT_MUX_ACLK_MSCL1_528_TOP				0x0584
+#define CLK_STAT_MUX_ACLK_IMEM_266				0x0588
+#define CLK_STAT_MUX_ACLK_IMEM_200				0x058C
+#define CLK_STAT_MUX_ACLK_IMEM_100				0x0590
+#define CLK_STAT_MUX_ACLK_FSYS0_200				0x0594
+#define CLK_STAT_MUX_ACLK_FSYS1_200				0x0598
+#define CLK_STAT_MUX_ACLK_PERIS_66				0x059C
+#define CLK_STAT_MUX_ACLK_PERIC0_66				0x05A0
+#define CLK_STAT_MUX_ACLK_PERIC1_66				0x05A4
+#define CLK_STAT_MUX_ACLK_ISP0_ISP0_528				0x05A8
+#define CLK_STAT_MUX_ACLK_ISP0_TPU_400				0x05AC
+#define CLK_STAT_MUX_ACLK_ISP0_TREX_528				0x05B0
+#define CLK_STAT_MUX_ACLK_ISP1_ISP1_468				0x05B4
+#define CLK_STAT_MUX_ACLK_CAM0_CSIS0_414			0x05B8
+#define CLK_STAT_MUX_ACLK_CAM0_CSIS1_168			0x05BC
+#define CLK_STAT_MUX_ACLK_CAM0_CSIS2_234			0x05C0
+#define CLK_STAT_MUX_ACLK_CAM0_3AA0_414				0x05C4
+#define CLK_STAT_MUX_ACLK_CAM0_3AA1_414				0x05C8
+#define CLK_STAT_MUX_ACLK_CAM0_CSIS3_132			0x05CC
+#define CLK_STAT_MUX_ACLK_CAM0_TREX_528				0x05D0
+#define CLK_STAT_MUX_ACLK_CAM1_ARM_672				0x05D4
+#define CLK_STAT_MUX_ACLK_CAM1_TREX_VRA_528			0x05D8
+#define CLK_STAT_MUX_ACLK_CAM1_TREX_B_528			0x05DC
+#define CLK_STAT_MUX_ACLK_CAM1_BUS_264				0x05E0
+#define CLK_STAT_MUX_ACLK_CAM1_PERI_84				0x05E4
+#define CLK_STAT_MUX_ACLK_CAM1_CSIS2_414			0x05E8
+#define CLK_STAT_MUX_ACLK_CAM1_CSIS3_132			0x05EC
+#define CLK_STAT_MUX_ACLK_CAM1_SCL_566				0x05F0
+#define CLK_STAT_MUX_SCLK_DISP0_DECON0_ECLK0_TOP		0x05F4
+#define CLK_STAT_MUX_SCLK_DISP0_DECON0_VCLK0_TOP		0x05F8
+#define CLK_STAT_MUX_SCLK_DISP0_DECON0_VCLK1_TOP		0x05FC
+#define CLK_STAT_MUX_SCLK_DISP0_HDMI_AUDIO_TOP			0x0600
+#define CLK_STAT_MUX_SCLK_DISP1_DECON1_ECLK0_TOP		0x0604
+#define CLK_STAT_MUX_SCLK_DISP1_DECON1_ECLK1_TOP		0x0608
+#define CLK_STAT_MUX_SCLK_FSYS0_USBDRD30			0x060C
+#define CLK_STAT_MUX_SCLK_FSYS0_MMC0				0x0610
+#define CLK_STAT_MUX_SCLK_FSYS0_UFSUNIPRO20			0x0614
+#define CLK_STAT_MUX_SCLK_FSYS0_PHY_24M				0x0618
+#define CLK_STAT_MUX_SCLK_FSYS0_UFSUNIPRO_CFG			0x061C
+#define CLK_STAT_MUX_SCLK_FSYS1_MMC2				0x0620
+#define CLK_STAT_MUX_SCLK_FSYS1_UFSUNIPRO20			0x0624
+#define CLK_STAT_MUX_SCLK_FSYS1_PCIE_PHY			0x0628
+#define CLK_STAT_MUX_SCLK_FSYS1_UFSUNIPRO_CFG			0x062C
+#define CLK_STAT_MUX_SCLK_PERIC0_UART0				0x0630
+#define CLK_STAT_MUX_SCLK_PERIC1_SPI0				0x0634
+#define CLK_STAT_MUX_SCLK_PERIC1_SPI1				0x0638
+#define CLK_STAT_MUX_SCLK_PERIC1_SPI2				0x063C
+#define CLK_STAT_MUX_SCLK_PERIC1_SPI3				0x0640
+#define CLK_STAT_MUX_SCLK_PERIC1_SPI4				0x0644
+#define CLK_STAT_MUX_SCLK_PERIC1_SPI5				0x0648
+#define CLK_STAT_MUX_SCLK_PERIC1_SPI6				0x064C
+#define CLK_STAT_MUX_SCLK_PERIC1_SPI7				0x0650
+#define CLK_STAT_MUX_SCLK_PERIC1_UART1				0x0654
+#define CLK_STAT_MUX_SCLK_PERIC1_UART2				0x0658
+#define CLK_STAT_MUX_SCLK_PERIC1_UART3				0x065C
+#define CLK_STAT_MUX_SCLK_PERIC1_UART4				0x0660
+#define CLK_STAT_MUX_SCLK_PERIC1_UART5				0x0664
+#define CLK_STAT_MUX_SCLK_CAM1_ISP_SPI0				0x0668
+#define CLK_STAT_MUX_SCLK_CAM1_ISP_SPI1				0x066C
+#define CLK_STAT_MUX_SCLK_CAM1_ISP_UART				0x0670
+#define CLK_STAT_MUX_SCLK_AP2CP_MIF_PLL_OUT			0x0674
+#define CLK_STAT_MUX_ACLK_PSCDC_400				0x0678
+#define CLK_STAT_MUX_SCLK_BUS_PLL_MNGS				0x0680
+#define CLK_STAT_MUX_SCLK_BUS_PLL_APOLLO			0x0684
+#define CLK_STAT_MUX_SCLK_BUS_PLL_MIF				0x0688
+#define CLK_STAT_MUX_SCLK_BUS_PLL_G3D				0x068C
+#define CLK_STAT_MUX_ACLK_ISP0_PXL_ASBS_IS_C_FROM_IS_D_TOP	0x0690
+#define CLK_ENABLE_ACLK_CCORE_800				0x0800
+#define CLK_ENABLE_ACLK_CCORE_264				0x0804
+#define CLK_ENABLE_ACLK_CCORE_G3D_800				0x0808
+#define CLK_ENABLE_ACLK_CCORE_528				0x080C
+#define CLK_ENABLE_ACLK_CCORE_132				0x0810
+#define CLK_ENABLE_PCLK_CCORE_66				0x0814
+#define CLK_ENABLE_ACLK_BUS0_528_TOP				0x0818
+#define CLK_ENABLE_ACLK_BUS0_200_TOP				0x081C
+#define CLK_ENABLE_PCLK_BUS0_132_TOP				0x0820
+#define CLK_ENABLE_ACLK_BUS1_528_TOP				0x0824
+#define CLK_ENABLE_PCLK_BUS1_132_TOP				0x0828
+#define CLK_ENABLE_ACLK_DISP0_0_400				0x082C
+#define CLK_ENABLE_ACLK_DISP0_1_400				0x0830
+#define CLK_ENABLE_ACLK_DISP1_0_400				0x0834
+#define CLK_ENABLE_ACLK_DISP1_1_400				0x0838
+#define CLK_ENABLE_ACLK_MFC_600					0x083C
+#define CLK_ENABLE_ACLK_MSCL0_528				0x0840
+#define CLK_ENABLE_ACLK_MSCL1_528				0x0844
+#define CLK_ENABLE_ACLK_IMEM_266				0x0848
+#define CLK_ENABLE_ACLK_IMEM_200				0x084C
+#define CLK_ENABLE_ACLK_IMEM_100				0x0850
+#define CLK_ENABLE_ACLK_FSYS0_200				0x0854
+#define CLK_ENABLE_ACLK_FSYS1_200				0x0858
+#define CLK_ENABLE_ACLK_PERIS_66				0x085C
+#define CLK_ENABLE_ACLK_PERIC0_66				0x0860
+#define CLK_ENABLE_ACLK_PERIC1_66				0x0864
+#define CLK_ENABLE_ACLK_ISP0_ISP0_528				0x0868
+#define CLK_ENABLE_ACLK_ISP0_TPU_400				0x086C
+#define CLK_ENABLE_ACLK_ISP0_TREX_528				0x0870
+#define CLK_ENABLE_ACLK_ISP1_ISP1_468				0x0874
+#define CLK_ENABLE_ACLK_CAM0_CSIS1_414				0x0878
+#define CLK_ENABLE_ACLK_CAM0_CSIS1_168_TOP			0x087C
+#define CLK_ENABLE_ACLK_CAM0_CSIS2_234_TOP			0x0880
+#define CLK_ENABLE_ACLK_CAM0_3AA0_414_TOP			0x0884
+#define CLK_ENABLE_ACLK_CAM0_3AA1_414_TOP			0x0888
+#define CLK_ENABLE_ACLK_CAM0_CSIS3_132_TOP			0x088C
+#define CLK_ENABLE_ACLK_CAM0_TREX_528_TOP			0x0890
+#define CLK_ENABLE_ACLK_CAM1_ARM_672_TOP			0x0894
+#define CLK_ENABLE_ACLK_CAM1_TREX_VRA_528_TOP			0x0898
+#define CLK_ENABLE_ACLK_CAM1_TREX_B_528_TOP			0x089C
+#define CLK_ENABLE_ACLK_CAM1_BUS_264_TOP			0x08A0
+#define CLK_ENABLE_ACLK_CAM1_PERI_84				0x08A4
+#define CLK_ENABLE_ACLK_CAM1_CSIS2_414_TOP			0x08A8
+#define CLK_ENABLE_ACLK_CAM1_CSIS3_132_TOP			0x08AC
+#define CLK_ENABLE_ACLK_CAM1_SCL_566_TOP			0x08B0
+#define CLK_ENABLE_SCLK_DISP0_DECON0_ECLK0			0x0900
+#define CLK_ENABLE_SCLK_DISP0_DECON0_VCLK0			0x0904
+#define CLK_ENABLE_SCLK_DISP0_DECON0_VCLK1			0x0908
+#define CLK_ENABLE_SCLK_DISP0_HDMI_ADUIO			0x090C
+#define CLK_ENABLE_SCLK_DISP1_DECON1_ECLK0			0x0910
+#define CLK_ENABLE_SCLK_DISP1_DECON1_ECLK1			0x0914
+#define CLK_ENABLE_SCLK_FSYS0_USBDRD30				0x0918
+#define CLK_ENABLE_SCLK_FSYS0_MMC0				0x091C
+#define CLK_ENABLE_SCLK_FSYS0_UFSUNIPRO20			0x0920
+#define CLK_ENABLE_SCLK_FSYS0_PHY_24M				0x0924
+#define CLK_ENABLE_SCLK_FSYS0_UFSUNIPRO_CFG			0x0928
+#define CLK_ENABLE_SCLK_FSYS1_MMC2				0x092C
+#define CLK_ENABLE_SCLK_FSYS1_UFSUNIPRO20			0x0930
+#define CLK_ENABLE_SCLK_FSYS1_PCIE_PHY				0x0934
+#define CLK_ENABLE_SCLK_FSYS1_UFSUNIPRO_CFG			0x0938
+#define CLK_ENABLE_SCLK_PERIC0_UART0				0x093C
+#define CLK_ENABLE_SCLK_PERIC1_SPI0				0x0940
+#define CLK_ENABLE_SCLK_PERIC1_SPI1				0x0944
+#define CLK_ENABLE_SCLK_PERIC1_SPI2				0x0948
+#define CLK_ENABLE_SCLK_PERIC1_SPI3				0x094C
+#define CLK_ENABLE_SCLK_PERIC1_SPI4				0x0950
+#define CLK_ENABLE_SCLK_PERIC1_SPI5				0x0954
+#define CLK_ENABLE_SCLK_PERIC1_SPI6				0x0958
+#define CLK_ENABLE_SCLK_PERIC1_SPI7				0x095C
+#define CLK_ENABLE_SCLK_PERIC1_UART1				0x0960
+#define CLK_ENABLE_SCLK_PERIC1_UART2				0x0964
+#define CLK_ENABLE_SCLK_PERIC1_UART3				0x0968
+#define CLK_ENABLE_SCLK_PERIC1_UART4				0x096C
+#define CLK_ENABLE_SCLK_PERIC1_UART5				0x0970
+#define CLK_ENABLE_SCLK_CAM1_ISP_SPI0_TOP			0x0974
+#define CLK_ENABLE_SCLK_CAM1_ISP_SPI1_TOP			0x0978
+#define CLK_ENABLE_SCLK_CAM1_ISP_UART_TOP			0x097C
+#define CLK_ENABLE_SCLK_AP2CP_MIF_PLL_OUT			0x0980
+#define CLK_ENABLE_ACLK_PSCDC_400				0x0984
+#define CLK_ENABLE_SCLK_BUS_PLL_MNGS				0x0990
+#define CLK_ENABLE_SCLK_BUS_PLL_APOLLO				0x0994
+#define CLK_ENABLE_SCLK_BUS_PLL_MIF				0x0998
+#define CLK_ENABLE_SCLK_BUS_PLL_G3D				0x099C
+#define CLK_ENABLE_ACLK_ISP0_PXL_ASBS_IS_C_FROM_IS_D_TOP	0x09A0
+#define CLK_CON_MUX_SCLK_ISP_SENSOR0				0x0B00
+#define CLK_CON_DIV_SCLK_ISP_SENSOR0				0x0B04
+#define CLK_STAT_MUX_SCLK_ISP_SENSOR0				0x0B08
+#define CLK_ENABLE_SCLK_ISP_SENSOR0				0x0B0C
+#define CLK_CON_MUX_SCLK_ISP_SENSOR1				0x0B10
+#define CLK_CON_DIV_SCLK_ISP_SENSOR1				0x0B14
+#define CLK_STAT_MUX_SCLK_ISP_SENSOR1				0x0B18
+#define CLK_ENABLE_SCLK_ISP_SENSOR1				0x0B1C
+#define CLK_CON_MUX_SCLK_ISP_SENSOR2				0x0B20
+#define CLK_CON_DIV_SCLK_ISP_SENSOR2				0x0B24
+#define CLK_STAT_MUX_SCLK_ISP_SENSOR2				0x0B28
+#define CLK_ENABLE_SCLK_ISP_SENSOR2				0x0B2C
+#define CLK_CON_MUX_SCLK_ISP_SENSOR3				0x0B30
+#define CLK_CON_DIV_SCLK_ISP_SENSOR3				0x0B34
+#define CLK_STAT_MUX_SCLK_ISP_SENSOR3				0x0B38
+#define CLK_ENABLE_SCLK_ISP_SENSOR3				0x0B3C
+#define CLK_CON_MUX_SCLK_PROMISE_INT				0x0B40
+#define CLK_CON_DIV_SCLK_PROMISE_INT				0x0B44
+#define CLK_STAT_MUX_SCLK_PROMISE_INT				0x0B48
+#define CLK_ENABLE_SCLK_PROMISE_INT				0x0B4C
+#define CLK_CON_MUX_SCLK_PROMISE_DISP				0x0B50
+#define CLK_CON_DIV_SCLK_PROMISE_DISP				0x0B54
+#define CLK_STAT_MUX_SCLK_PROMISE_DISP				0x0B58
+#define CLK_ENABLE_SCLK_PROMISE_DISP				0x0B5C
+#define CLKOUT_CMU_TOP0						0x0C00
+#define CLKOUT_CMU_TOP0_DIV_STAT				0x0C04
+#define CLKOUT_CMU_TOP1						0x0C10
+#define CLKOUT_CMU_TOP1_DIV_STAT				0x0C14
+#define CLKOUT_CMU_TOP2						0x0C20
+#define CLKOUT_CMU_TOP2_DIV_STAT				0x0C24
+#define CMU_TOP__CLKOUT0					0x0C30
+#define CMU_TOP__CLKOUT1					0x0C34
+#define CMU_TOP__CLKOUT2					0x0C38
+#define CMU_TOP__CLKOUT3					0x0C3C
+#define CLK_CON_MUX_CP2AP_MIF_CLK_USER				0x0D00
+#define CLK_STAT_MUX_CP2AP_MIF_CLK_USER				0x0D0C
+#define AP2CP_CLK_CTRL						0x0D10
+#define CLK_ENABLE_PDN_TOP					0x0E00
+#define TOP_ROOTCLKEN						0x0F04
+#define TOP0_ROOTCLKEN_ON_GATE					0x0F10
+#define TOP1_ROOTCLKEN_ON_GATE					0x0F14
+#define TOP2_ROOTCLKEN_ON_GATE					0x0F18
+#define TOP3_ROOTCLKEN_ON_GATE					0x0F1C
+#define TOP0_ROOTCLKEN_ON_MUX					0x0F20
+#define TOP1_ROOTCLKEN_ON_MUX					0x0F24
+#define TOP2_ROOTCLKEN_ON_MUX					0x0F28
+#define TOP3_ROOTCLKEN_ON_MUX					0x0F2C
+#define TOP_ROOTCLKEN_AFTER_PLL_MUX				0x0F30
+#define TOP0_ROOTCLKEN_ON_GATE_STATUS				0x0F40
+#define TOP1_ROOTCLKEN_ON_GATE_STATUS				0x0F44
+#define TOP2_ROOTCLKEN_ON_GATE_STATUS				0x0F48
+#define TOP3_ROOTCLKEN_ON_GATE_STATUS				0x0F4C
+#define TOP0_ROOTCLKEN_ON_MUX_STATUS				0x0F50
+#define TOP1_ROOTCLKEN_ON_MUX_STATUS				0x0F54
+#define TOP2_ROOTCLKEN_ON_MUX_STATUS				0x0F58
+#define TOP3_ROOTCLKEN_ON_MUX_STATUS				0x0F5C
+#define TOP_ROOTCLKEN_AFTER_PLL_MUX_STATUS			0x0F60
+#define TOP_SFR_IGNORE_REQ_SYSCLK				0x0F80
+#define PSCDC_CTRL0						0x1000
+#define PSCDC_CTRL1						0x1004
+#define PSCDC_CTRL2						0x1008
+#define PSCDC_CTRL3						0x100C
+#define PSCDC_SCI_FIFO_CLK_CON0					0x1010
+#define PSCDC_SCI_FIFO_CLK_CON1					0x1014
+#define PSCDC_SCI_FIFO_CLK_CON2					0x1018
+#define PSCDC_SCI_FIFO_CLK_CON3					0x101C
+#define PSCDC_SMC_FIFO_CLK_CON0					0x1020
+#define PSCDC_SMC_FIFO_CLK_CON1					0x1024
+#define PSCDC_SMC_FIFO_CLK_CON2					0x1028
+#define PSCDC_SMC_FIFO_CLK_CON3					0x102C
+#define PSCDC_SMC_FIFO_CLK_CON4					0x1030
+#define PSCDC_SMC_FIFO_CLK_CON5					0x1034
+#define CCORE_CLK_CTRL0						0x1060
+#define MIF_CLK_CTRL0						0x1080
+#define MIF_CLK_CTRL1						0x1084
+#define MIF_CLK_CTRL2						0x1088
+#define MIF_CLK_CTRL3						0x108C
+#define MIF_CLK_CTRL4						0x1090
+#define ACD_PSCDC_CTRL_0					0x1094
+#define ACD_PSCDC_CTRL_1					0x1098
+#define ACD_PSCDC_STAT						0x109C
+#define CMU_TOP_SPARE0						0x1100
+#define CMU_TOP_SPARE1						0x1104
+#define CMU_TOP_SPARE2						0x1108
+#define CMU_TOP_SPARE3						0x110C
+
+static const unsigned long top_clk_regs[] __initconst = {
+	BUS0_PLL_LOCK,
+	BUS1_PLL_LOCK,
+	BUS2_PLL_LOCK,
+	BUS3_PLL_LOCK,
+	MFC_PLL_LOCK,
+	ISP_PLL_LOCK,
+	AUD_PLL_LOCK,
+	G3D_PLL_LOCK,
+	BUS0_PLL_CON0,
+	BUS0_PLL_CON1,
+	BUS0_PLL_FREQ_DET,
+	BUS1_PLL_CON0,
+	BUS1_PLL_CON1,
+	BUS1_PLL_FREQ_DET,
+	BUS2_PLL_CON0,
+	BUS2_PLL_CON1,
+	BUS2_PLL_FREQ_DET,
+	BUS3_PLL_CON0,
+	BUS3_PLL_CON1,
+	BUS3_PLL_FREQ_DET,
+	MFC_PLL_CON0,
+	MFC_PLL_CON1,
+	MFC_PLL_FREQ_DET,
+	ISP_PLL_CON0,
+	ISP_PLL_CON1,
+	ISP_PLL_FREQ_DET,
+	AUD_PLL_CON0,
+	AUD_PLL_CON1,
+	AUD_PLL_CON2,
+	AUD_PLL_FREQ_DET,
+	G3D_PLL_CON0,
+	G3D_PLL_CON1,
+	G3D_PLL_FREQ_DET,
+	CLK_CON_MUX_BUS0_PLL,
+	CLK_CON_MUX_BUS1_PLL,
+	CLK_CON_MUX_BUS2_PLL,
+	CLK_CON_MUX_BUS3_PLL,
+	CLK_CON_MUX_MFC_PLL,
+	CLK_CON_MUX_ISP_PLL,
+	CLK_CON_MUX_AUD_PLL,
+	CLK_CON_MUX_G3D_PLL,
+	CLK_CON_MUX_SCLK_BUS0_PLL,
+	CLK_CON_MUX_SCLK_BUS1_PLL,
+	CLK_CON_MUX_SCLK_BUS2_PLL,
+	CLK_CON_MUX_SCLK_BUS3_PLL,
+	CLK_CON_MUX_SCLK_MFC_PLL,
+	CLK_CON_MUX_SCLK_ISP_PLL,
+	CLK_CON_MUX_ACLK_CCORE_800,
+	CLK_CON_MUX_ACLK_CCORE_264,
+	CLK_CON_MUX_ACLK_CCORE_G3D_800,
+	CLK_CON_MUX_ACLK_CCORE_528,
+	CLK_CON_MUX_ACLK_CCORE_132,
+	CLK_CON_MUX_PCLK_CCORE_66,
+	CLK_CON_MUX_ACLK_BUS0_528,
+	CLK_CON_MUX_ACLK_BUS0_200,
+	CLK_CON_MUX_PCLK_BUS0_132,
+	CLK_CON_MUX_ACLK_BUS1_528,
+	CLK_CON_MUX_PCLK_BUS1_132,
+	CLK_CON_MUX_ACLK_DISP0_0_400,
+	CLK_CON_MUX_ACLK_DISP0_1_400_TOP,
+	CLK_CON_MUX_ACLK_DISP1_0_400,
+	CLK_CON_MUX_ACLK_DISP1_1_400_TOP,
+	CLK_CON_MUX_ACLK_MFC_600,
+	CLK_CON_MUX_ACLK_MSCL0_528,
+	CLK_CON_MUX_ACLK_MSCL1_528_TOP,
+	CLK_CON_MUX_ACLK_IMEM_266,
+	CLK_CON_MUX_ACLK_IMEM_200,
+	CLK_CON_MUX_ACLK_IMEM_100,
+	CLK_CON_MUX_ACLK_FSYS0_200,
+	CLK_CON_MUX_ACLK_FSYS1_200,
+	CLK_CON_MUX_ACLK_PERIS_66,
+	CLK_CON_MUX_ACLK_PERIC0_66,
+	CLK_CON_MUX_ACLK_PERIC1_66,
+	CLK_CON_MUX_ACLK_ISP0_ISP0_528,
+	CLK_CON_MUX_ACLK_ISP0_TPU_400,
+	CLK_CON_MUX_ACLK_ISP0_TREX_528,
+	CLK_CON_MUX_ACLK_ISP1_ISP1_468,
+	CLK_CON_MUX_ACLK_CAM0_CSIS0_414,
+	CLK_CON_MUX_ACLK_CAM0_CSIS1_168,
+	CLK_CON_MUX_ACLK_CAM0_CSIS2_234,
+	CLK_CON_MUX_ACLK_CAM0_3AA0_414,
+	CLK_CON_MUX_ACLK_CAM0_3AA1_414,
+	CLK_CON_MUX_ACLK_CAM0_CSIS3_132,
+	CLK_CON_MUX_ACLK_CAM0_TREX_528,
+	CLK_CON_MUX_ACLK_CAM1_ARM_672,
+	CLK_CON_MUX_ACLK_CAM1_TREX_VRA_528,
+	CLK_CON_MUX_ACLK_CAM1_TREX_B_528,
+	CLK_CON_MUX_ACLK_CAM1_BUS_264,
+	CLK_CON_MUX_ACLK_CAM1_PERI_84,
+	CLK_CON_MUX_ACLK_CAM1_CSIS2_414,
+	CLK_CON_MUX_ACLK_CAM1_CSIS3_132,
+	CLK_CON_MUX_ACLK_CAM1_SCL_566,
+	CLK_CON_MUX_SCLK_DISP0_DECON0_ECLK0_TOP,
+	CLK_CON_MUX_SCLK_DISP0_DECON0_VCLK0_TOP,
+	CLK_CON_MUX_SCLK_DISP0_DECON0_VCLK1_TOP,
+	CLK_CON_MUX_SCLK_DISP0_HDMI_AUDIO_TOP,
+	CLK_CON_MUX_SCLK_DISP1_DECON1_ECLK0_TOP,
+	CLK_CON_MUX_SCLK_DISP1_DECON1_ECLK1_TOP,
+	CLK_CON_MUX_SCLK_FSYS0_USBDRD30,
+	CLK_CON_MUX_SCLK_FSYS0_MMC0,
+	CLK_CON_MUX_SCLK_FSYS0_UFSUNIPRO20,
+	CLK_CON_MUX_SCLK_FSYS0_PHY_24M,
+	CLK_CON_MUX_SCLK_FSYS0_UFSUNIPRO_CFG,
+	CLK_CON_MUX_SCLK_FSYS1_MMC2,
+	CLK_CON_MUX_SCLK_FSYS1_UFSUNIPRO20,
+	CLK_CON_MUX_SCLK_FSYS1_PCIE_PHY,
+	CLK_CON_MUX_SCLK_FSYS1_UFSUNIPRO_CFG,
+	CLK_CON_MUX_SCLK_PERIC0_UART0,
+	CLK_CON_MUX_SCLK_PERIC1_SPI0,
+	CLK_CON_MUX_SCLK_PERIC1_SPI1,
+	CLK_CON_MUX_SCLK_PERIC1_SPI2,
+	CLK_CON_MUX_SCLK_PERIC1_SPI3,
+	CLK_CON_MUX_SCLK_PERIC1_SPI4,
+	CLK_CON_MUX_SCLK_PERIC1_SPI5,
+	CLK_CON_MUX_SCLK_PERIC1_SPI6,
+	CLK_CON_MUX_SCLK_PERIC1_SPI7,
+	CLK_CON_MUX_SCLK_PERIC1_UART1,
+	CLK_CON_MUX_SCLK_PERIC1_UART2,
+	CLK_CON_MUX_SCLK_PERIC1_UART3,
+	CLK_CON_MUX_SCLK_PERIC1_UART4,
+	CLK_CON_MUX_SCLK_PERIC1_UART5,
+	CLK_CON_MUX_SCLK_CAM1_ISP_SPI0,
+	CLK_CON_MUX_SCLK_CAM1_ISP_SPI1,
+	CLK_CON_MUX_SCLK_CAM1_ISP_UART,
+	CLK_CON_MUX_SCLK_AP2CP_MIF_PLL_OUT,
+	CLK_CON_MUX_ACLK_PSCDC_400,
+	CLK_CON_MUX_SCLK_BUS_PLL_MNGS,
+	CLK_CON_MUX_SCLK_BUS_PLL_APOLLO,
+	CLK_CON_MUX_SCLK_BUS_PLL_MIF,
+	CLK_CON_MUX_SCLK_BUS_PLL_G3D,
+	CLK_CON_MUX_ACLK_ISP0_PXL_ASBS_IS_C_FROM_IS_D_TOP,
+	CLK_CON_DIV_ACLK_CCORE_800,
+	CLK_CON_DIV_ACLK_CCORE_264,
+	CLK_CON_DIV_ACLK_CCORE_G3D_800,
+	CLK_CON_DIV_ACLK_CCORE_528,
+	CLK_CON_DIV_ACLK_CCORE_132,
+	CLK_CON_DIV_PCLK_CCORE_66,
+	CLK_CON_DIV_ACLK_BUS0_528,
+	CLK_CON_DIV_ACLK_BUS0_200,
+	CLK_CON_DIV_PCLK_BUS0_132,
+	CLK_CON_DIV_ACLK_BUS1_528,
+	CLK_CON_DIV_PCLK_BUS1_132,
+	CLK_CON_DIV_ACLK_DISP0_0_400,
+	CLK_CON_DIV_ACLK_DISP0_1_400,
+	CLK_CON_DIV_ACLK_DISP1_0_400,
+	CLK_CON_DIV_ACLK_DISP1_1_400,
+	CLK_CON_DIV_ACLK_MFC_600,
+	CLK_CON_DIV_ACLK_MSCL0_528,
+	CLK_CON_DIV_ACLK_MSCL1_528,
+	CLK_CON_DIV_ACLK_IMEM_266,
+	CLK_CON_DIV_ACLK_IMEM_200,
+	CLK_CON_DIV_ACLK_IMEM_100,
+	CLK_CON_DIV_ACLK_FSYS0_200,
+	CLK_CON_DIV_ACLK_FSYS1_200,
+	CLK_CON_DIV_ACLK_PERIS_66,
+	CLK_CON_DIV_ACLK_PERIC0_66,
+	CLK_CON_DIV_ACLK_PERIC1_66,
+	CLK_CON_DIV_ACLK_ISP0_ISP0_528,
+	CLK_CON_DIV_ACLK_ISP0_TPU_400,
+	CLK_CON_DIV_ACLK_ISP0_TREX_528,
+	CLK_CON_DIV_ACLK_ISP1_ISP1_468,
+	CLK_CON_DIV_ACLK_CAM0_CSIS0_414,
+	CLK_CON_DIV_ACLK_CAM0_CSIS1_168,
+	CLK_CON_DIV_ACLK_CAM0_CSIS2_234,
+	CLK_CON_DIV_ACLK_CAM0_3AA0_414,
+	CLK_CON_DIV_ACLK_CAM0_3AA1_414,
+	CLK_CON_DIV_ACLK_CAM0_CSIS3_132,
+	CLK_CON_DIV_ACLK_CAM0_TREX_528,
+	CLK_CON_DIV_ACLK_CAM1_ARM_672,
+	CLK_CON_DIV_ACLK_CAM1_TREX_VRA_528,
+	CLK_CON_DIV_ACLK_CAM1_TREX_B_528,
+	CLK_CON_DIV_ACLK_CAM1_BUS_264,
+	CLK_CON_DIV_ACLK_CAM1_PERI_84,
+	CLK_CON_DIV_ACLK_CAM1_CSIS2_414,
+	CLK_CON_DIV_ACLK_CAM1_CSIS3_132,
+	CLK_CON_DIV_ACLK_CAM1_SCL_566,
+	CLK_CON_DIV_SCLK_DISP0_DECON0_ECLK0,
+	CLK_CON_DIV_SCLK_DISP0_DECON0_VCLK0,
+	CLK_CON_DIV_SCLK_DISP0_DECON0_VCLK1,
+	CLK_CON_DIV_SCLK_DISP0_HDMI_AUDIO,
+	CLK_CON_DIV_SCLK_DISP1_DECON1_ECLK0,
+	CLK_CON_DIV_SCLK_DISP1_DECON1_ECLK1,
+	CLK_CON_DIV_SCLK_FSYS0_USBDRD30,
+	CLK_CON_DIV_SCLK_FSYS0_MMC0,
+	CLK_CON_DIV_SCLK_FSYS0_UFSUNIPRO20,
+	CLK_CON_DIV_SCLK_FSYS0_PHY_24M,
+	CLK_CON_DIV_SCLK_FSYS0_UFSUNIPRO_CFG,
+	CLK_CON_DIV_SCLK_FSYS1_MMC2,
+	CLK_CON_DIV_SCLK_FSYS1_UFSUNIPRO20,
+	CLK_CON_DIV_SCLK_FSYS1_PCIE_PHY,
+	CLK_CON_DIV_SCLK_FSYS1_UFSUNIPRO_CFG,
+	CLK_CON_DIV_SCLK_PERIC0_UART0,
+	CLK_CON_DIV_SCLK_PERIC1_SPI0,
+	CLK_CON_DIV_SCLK_PERIC1_SPI1,
+	CLK_CON_DIV_SCLK_PERIC1_SPI2,
+	CLK_CON_DIV_SCLK_PERIC1_SPI3,
+	CLK_CON_DIV_SCLK_PERIC1_SPI4,
+	CLK_CON_DIV_SCLK_PERIC1_SPI5,
+	CLK_CON_DIV_SCLK_PERIC1_SPI6,
+	CLK_CON_DIV_SCLK_PERIC1_SPI7,
+	CLK_CON_DIV_SCLK_PERIC1_UART1,
+	CLK_CON_DIV_SCLK_PERIC1_UART2,
+	CLK_CON_DIV_SCLK_PERIC1_UART3,
+	CLK_CON_DIV_SCLK_PERIC1_UART4,
+	CLK_CON_DIV_SCLK_PERIC1_UART5,
+	CLK_CON_DIV_SCLK_CAM1_ISP_SPI0,
+	CLK_CON_DIV_SCLK_CAM1_ISP_SPI1,
+	CLK_CON_DIV_SCLK_CAM1_ISP_UART,
+	CLK_CON_DIV_SCLK_AP2CP_MIF_PLL_OUT,
+	CLK_CON_DIV_ACLK_PSCDC_400,
+	CLK_CON_DIV_ACLK_ISP0_PXL_ASBS_IS_C_FROM_IS_D_TOP,
+	CLK_CON_DIV_SCLK_BUS_PLL_MNGS,
+	CLK_CON_DIV_SCLK_BUS_PLL_APOLLO,
+	CLK_CON_DIV_SCLK_BUS_PLL_MIF,
+	CLK_CON_DIV_SCLK_BUS_PLL_G3D,
+	CLK_STAT_MUX_BUS0_PLL,
+	CLK_STAT_MUX_BUS1_PLL,
+	CLK_STAT_MUX_BUS2_PLL,
+	CLK_STAT_MUX_BUS3_PLL,
+	CLK_STAT_MUX_MFC_PLL,
+	CLK_STAT_MUX_ISP_PLL,
+	CLK_STAT_MUX_AUD_PLL,
+	CLK_STAT_MUX_G3D_PLL,
+	CLK_STAT_MUX_SCLK_BUS0_PLL,
+	CLK_STAT_MUX_SCLK_BUS1_PLL,
+	CLK_STAT_MUX_SCLK_BUS2_PLL,
+	CLK_STAT_MUX_SCLK_BUS3_PLL,
+	CLK_STAT_MUX_SCLK_MFC_PLL,
+	CLK_STAT_MUX_SCLK_ISP_PLL,
+	CLK_STAT_MUX_ACLK_CCORE_800,
+	CLK_STAT_MUX_ACLK_CCORE_264,
+	CLK_STAT_MUX_ACLK_CCORE_G3D_800,
+	CLK_STAT_MUX_ACLK_CCORE_528,
+	CLK_STAT_MUX_ACLK_CCORE_132,
+	CLK_STAT_MUX_PCLK_CCORE_66,
+	CLK_STAT_MUX_ACLK_BUS0_528,
+	CLK_STAT_MUX_ACLK_BUS0_200,
+	CLK_STAT_MUX_PCLK_BUS0_132,
+	CLK_STAT_MUX_ACLK_BUS1_528,
+	CLK_STAT_MUX_PCLK_BUS1_132,
+	CLK_STAT_MUX_ACLK_DISP0_0_400,
+	CLK_STAT_MUX_ACLK_DISP0_1_400_TOP,
+	CLK_STAT_MUX_ACLK_DISP1_0_400,
+	CLK_STAT_MUX_ACLK_DISP1_1_400_TOP,
+	CLK_STAT_MUX_ACLK_MFC_600,
+	CLK_STAT_MUX_ACLK_MSCL0_528,
+	CLK_STAT_MUX_ACLK_MSCL1_528_TOP,
+	CLK_STAT_MUX_ACLK_IMEM_266,
+	CLK_STAT_MUX_ACLK_IMEM_200,
+	CLK_STAT_MUX_ACLK_IMEM_100,
+	CLK_STAT_MUX_ACLK_FSYS0_200,
+	CLK_STAT_MUX_ACLK_FSYS1_200,
+	CLK_STAT_MUX_ACLK_PERIS_66,
+	CLK_STAT_MUX_ACLK_PERIC0_66,
+	CLK_STAT_MUX_ACLK_PERIC1_66,
+	CLK_STAT_MUX_ACLK_ISP0_ISP0_528,
+	CLK_STAT_MUX_ACLK_ISP0_TPU_400,
+	CLK_STAT_MUX_ACLK_ISP0_TREX_528,
+	CLK_STAT_MUX_ACLK_ISP1_ISP1_468,
+	CLK_STAT_MUX_ACLK_CAM0_CSIS0_414,
+	CLK_STAT_MUX_ACLK_CAM0_CSIS1_168,
+	CLK_STAT_MUX_ACLK_CAM0_CSIS2_234,
+	CLK_STAT_MUX_ACLK_CAM0_3AA0_414,
+	CLK_STAT_MUX_ACLK_CAM0_3AA1_414,
+	CLK_STAT_MUX_ACLK_CAM0_CSIS3_132,
+	CLK_STAT_MUX_ACLK_CAM0_TREX_528,
+	CLK_STAT_MUX_ACLK_CAM1_ARM_672,
+	CLK_STAT_MUX_ACLK_CAM1_TREX_VRA_528,
+	CLK_STAT_MUX_ACLK_CAM1_TREX_B_528,
+	CLK_STAT_MUX_ACLK_CAM1_BUS_264,
+	CLK_STAT_MUX_ACLK_CAM1_PERI_84,
+	CLK_STAT_MUX_ACLK_CAM1_CSIS2_414,
+	CLK_STAT_MUX_ACLK_CAM1_CSIS3_132,
+	CLK_STAT_MUX_ACLK_CAM1_SCL_566,
+	CLK_STAT_MUX_SCLK_DISP0_DECON0_ECLK0_TOP,
+	CLK_STAT_MUX_SCLK_DISP0_DECON0_VCLK0_TOP,
+	CLK_STAT_MUX_SCLK_DISP0_DECON0_VCLK1_TOP,
+	CLK_STAT_MUX_SCLK_DISP0_HDMI_AUDIO_TOP,
+	CLK_STAT_MUX_SCLK_DISP1_DECON1_ECLK0_TOP,
+	CLK_STAT_MUX_SCLK_DISP1_DECON1_ECLK1_TOP,
+	CLK_STAT_MUX_SCLK_FSYS0_USBDRD30,
+	CLK_STAT_MUX_SCLK_FSYS0_MMC0,
+	CLK_STAT_MUX_SCLK_FSYS0_UFSUNIPRO20,
+	CLK_STAT_MUX_SCLK_FSYS0_PHY_24M,
+	CLK_STAT_MUX_SCLK_FSYS0_UFSUNIPRO_CFG,
+	CLK_STAT_MUX_SCLK_FSYS1_MMC2,
+	CLK_STAT_MUX_SCLK_FSYS1_UFSUNIPRO20,
+	CLK_STAT_MUX_SCLK_FSYS1_PCIE_PHY,
+	CLK_STAT_MUX_SCLK_FSYS1_UFSUNIPRO_CFG,
+	CLK_STAT_MUX_SCLK_PERIC0_UART0,
+	CLK_STAT_MUX_SCLK_PERIC1_SPI0,
+	CLK_STAT_MUX_SCLK_PERIC1_SPI1,
+	CLK_STAT_MUX_SCLK_PERIC1_SPI2,
+	CLK_STAT_MUX_SCLK_PERIC1_SPI3,
+	CLK_STAT_MUX_SCLK_PERIC1_SPI4,
+	CLK_STAT_MUX_SCLK_PERIC1_SPI5,
+	CLK_STAT_MUX_SCLK_PERIC1_SPI6,
+	CLK_STAT_MUX_SCLK_PERIC1_SPI7,
+	CLK_STAT_MUX_SCLK_PERIC1_UART1,
+	CLK_STAT_MUX_SCLK_PERIC1_UART2,
+	CLK_STAT_MUX_SCLK_PERIC1_UART3,
+	CLK_STAT_MUX_SCLK_PERIC1_UART4,
+	CLK_STAT_MUX_SCLK_PERIC1_UART5,
+	CLK_STAT_MUX_SCLK_CAM1_ISP_SPI0,
+	CLK_STAT_MUX_SCLK_CAM1_ISP_SPI1,
+	CLK_STAT_MUX_SCLK_CAM1_ISP_UART,
+	CLK_STAT_MUX_SCLK_AP2CP_MIF_PLL_OUT,
+	CLK_STAT_MUX_ACLK_PSCDC_400,
+	CLK_STAT_MUX_SCLK_BUS_PLL_MNGS,
+	CLK_STAT_MUX_SCLK_BUS_PLL_APOLLO,
+	CLK_STAT_MUX_SCLK_BUS_PLL_MIF,
+	CLK_STAT_MUX_SCLK_BUS_PLL_G3D,
+	CLK_STAT_MUX_ACLK_ISP0_PXL_ASBS_IS_C_FROM_IS_D_TOP,
+	CLK_ENABLE_ACLK_CCORE_800,
+	CLK_ENABLE_ACLK_CCORE_264,
+	CLK_ENABLE_ACLK_CCORE_G3D_800,
+	CLK_ENABLE_ACLK_CCORE_528,
+	CLK_ENABLE_ACLK_CCORE_132,
+	CLK_ENABLE_PCLK_CCORE_66,
+	CLK_ENABLE_ACLK_BUS0_528_TOP,
+	CLK_ENABLE_ACLK_BUS0_200_TOP,
+	CLK_ENABLE_PCLK_BUS0_132_TOP,
+	CLK_ENABLE_ACLK_BUS1_528_TOP,
+	CLK_ENABLE_PCLK_BUS1_132_TOP,
+	CLK_ENABLE_ACLK_DISP0_0_400,
+	CLK_ENABLE_ACLK_DISP0_1_400,
+	CLK_ENABLE_ACLK_DISP1_0_400,
+	CLK_ENABLE_ACLK_DISP1_1_400,
+	CLK_ENABLE_ACLK_MFC_600,
+	CLK_ENABLE_ACLK_MSCL0_528,
+	CLK_ENABLE_ACLK_MSCL1_528,
+	CLK_ENABLE_ACLK_IMEM_266,
+	CLK_ENABLE_ACLK_IMEM_200,
+	CLK_ENABLE_ACLK_IMEM_100,
+	CLK_ENABLE_ACLK_FSYS0_200,
+	CLK_ENABLE_ACLK_FSYS1_200,
+	CLK_ENABLE_ACLK_PERIS_66,
+	CLK_ENABLE_ACLK_PERIC0_66,
+	CLK_ENABLE_ACLK_PERIC1_66,
+	CLK_ENABLE_ACLK_ISP0_ISP0_528,
+	CLK_ENABLE_ACLK_ISP0_TPU_400,
+	CLK_ENABLE_ACLK_ISP0_TREX_528,
+	CLK_ENABLE_ACLK_ISP1_ISP1_468,
+	CLK_ENABLE_ACLK_CAM0_CSIS1_414,
+	CLK_ENABLE_ACLK_CAM0_CSIS1_168_TOP,
+	CLK_ENABLE_ACLK_CAM0_CSIS2_234_TOP,
+	CLK_ENABLE_ACLK_CAM0_3AA0_414_TOP,
+	CLK_ENABLE_ACLK_CAM0_3AA1_414_TOP,
+	CLK_ENABLE_ACLK_CAM0_CSIS3_132_TOP,
+	CLK_ENABLE_ACLK_CAM0_TREX_528_TOP,
+	CLK_ENABLE_ACLK_CAM1_ARM_672_TOP,
+	CLK_ENABLE_ACLK_CAM1_TREX_VRA_528_TOP,
+	CLK_ENABLE_ACLK_CAM1_TREX_B_528_TOP,
+	CLK_ENABLE_ACLK_CAM1_BUS_264_TOP,
+	CLK_ENABLE_ACLK_CAM1_PERI_84,
+	CLK_ENABLE_ACLK_CAM1_CSIS2_414_TOP,
+	CLK_ENABLE_ACLK_CAM1_CSIS3_132_TOP,
+	CLK_ENABLE_ACLK_CAM1_SCL_566_TOP,
+	CLK_ENABLE_SCLK_DISP0_DECON0_ECLK0,
+	CLK_ENABLE_SCLK_DISP0_DECON0_VCLK0,
+	CLK_ENABLE_SCLK_DISP0_DECON0_VCLK1,
+	CLK_ENABLE_SCLK_DISP0_HDMI_ADUIO,
+	CLK_ENABLE_SCLK_DISP1_DECON1_ECLK0,
+	CLK_ENABLE_SCLK_DISP1_DECON1_ECLK1,
+	CLK_ENABLE_SCLK_FSYS0_USBDRD30,
+	CLK_ENABLE_SCLK_FSYS0_MMC0,
+	CLK_ENABLE_SCLK_FSYS0_UFSUNIPRO20,
+	CLK_ENABLE_SCLK_FSYS0_PHY_24M,
+	CLK_ENABLE_SCLK_FSYS0_UFSUNIPRO_CFG,
+	CLK_ENABLE_SCLK_FSYS1_MMC2,
+	CLK_ENABLE_SCLK_FSYS1_UFSUNIPRO20,
+	CLK_ENABLE_SCLK_FSYS1_PCIE_PHY,
+	CLK_ENABLE_SCLK_FSYS1_UFSUNIPRO_CFG,
+	CLK_ENABLE_SCLK_PERIC0_UART0,
+	CLK_ENABLE_SCLK_PERIC1_SPI0,
+	CLK_ENABLE_SCLK_PERIC1_SPI1,
+	CLK_ENABLE_SCLK_PERIC1_SPI2,
+	CLK_ENABLE_SCLK_PERIC1_SPI3,
+	CLK_ENABLE_SCLK_PERIC1_SPI4,
+	CLK_ENABLE_SCLK_PERIC1_SPI5,
+	CLK_ENABLE_SCLK_PERIC1_SPI6,
+	CLK_ENABLE_SCLK_PERIC1_SPI7,
+	CLK_ENABLE_SCLK_PERIC1_UART1,
+	CLK_ENABLE_SCLK_PERIC1_UART2,
+	CLK_ENABLE_SCLK_PERIC1_UART3,
+	CLK_ENABLE_SCLK_PERIC1_UART4,
+	CLK_ENABLE_SCLK_PERIC1_UART5,
+	CLK_ENABLE_SCLK_CAM1_ISP_SPI0_TOP,
+	CLK_ENABLE_SCLK_CAM1_ISP_SPI1_TOP,
+	CLK_ENABLE_SCLK_CAM1_ISP_UART_TOP,
+	CLK_ENABLE_SCLK_AP2CP_MIF_PLL_OUT,
+	CLK_ENABLE_ACLK_PSCDC_400,
+	CLK_ENABLE_SCLK_BUS_PLL_MNGS,
+	CLK_ENABLE_SCLK_BUS_PLL_APOLLO,
+	CLK_ENABLE_SCLK_BUS_PLL_MIF,
+	CLK_ENABLE_SCLK_BUS_PLL_G3D,
+	CLK_ENABLE_ACLK_ISP0_PXL_ASBS_IS_C_FROM_IS_D_TOP,
+	CLK_CON_MUX_SCLK_ISP_SENSOR0,
+	CLK_CON_DIV_SCLK_ISP_SENSOR0,
+	CLK_STAT_MUX_SCLK_ISP_SENSOR0,
+	CLK_ENABLE_SCLK_ISP_SENSOR0,
+	CLK_CON_MUX_SCLK_ISP_SENSOR1,
+	CLK_CON_DIV_SCLK_ISP_SENSOR1,
+	CLK_STAT_MUX_SCLK_ISP_SENSOR1,
+	CLK_ENABLE_SCLK_ISP_SENSOR1,
+	CLK_CON_MUX_SCLK_ISP_SENSOR2,
+	CLK_CON_DIV_SCLK_ISP_SENSOR2,
+	CLK_STAT_MUX_SCLK_ISP_SENSOR2,
+	CLK_ENABLE_SCLK_ISP_SENSOR2,
+	CLK_CON_MUX_SCLK_ISP_SENSOR3,
+	CLK_CON_DIV_SCLK_ISP_SENSOR3,
+	CLK_STAT_MUX_SCLK_ISP_SENSOR3,
+	CLK_ENABLE_SCLK_ISP_SENSOR3,
+	CLK_CON_MUX_SCLK_PROMISE_INT,
+	CLK_CON_DIV_SCLK_PROMISE_INT,
+	CLK_STAT_MUX_SCLK_PROMISE_INT,
+	CLK_ENABLE_SCLK_PROMISE_INT,
+	CLK_CON_MUX_SCLK_PROMISE_DISP,
+	CLK_CON_DIV_SCLK_PROMISE_DISP,
+	CLK_STAT_MUX_SCLK_PROMISE_DISP,
+	CLK_ENABLE_SCLK_PROMISE_DISP,
+	CLKOUT_CMU_TOP0,
+	CLKOUT_CMU_TOP0_DIV_STAT,
+	CLKOUT_CMU_TOP1,
+	CLKOUT_CMU_TOP1_DIV_STAT,
+	CLKOUT_CMU_TOP2,
+	CLKOUT_CMU_TOP2_DIV_STAT,
+	CMU_TOP__CLKOUT0,
+	CMU_TOP__CLKOUT1,
+	CMU_TOP__CLKOUT2,
+	CMU_TOP__CLKOUT3,
+	CLK_CON_MUX_CP2AP_MIF_CLK_USER,
+	CLK_STAT_MUX_CP2AP_MIF_CLK_USER,
+	AP2CP_CLK_CTRL,
+	CLK_ENABLE_PDN_TOP,
+	TOP_ROOTCLKEN,
+	TOP0_ROOTCLKEN_ON_GATE,
+	TOP1_ROOTCLKEN_ON_GATE,
+	TOP2_ROOTCLKEN_ON_GATE,
+	TOP3_ROOTCLKEN_ON_GATE,
+	TOP0_ROOTCLKEN_ON_MUX,
+	TOP1_ROOTCLKEN_ON_MUX,
+	TOP2_ROOTCLKEN_ON_MUX,
+	TOP3_ROOTCLKEN_ON_MUX,
+	TOP_ROOTCLKEN_AFTER_PLL_MUX,
+	TOP0_ROOTCLKEN_ON_GATE_STATUS,
+	TOP1_ROOTCLKEN_ON_GATE_STATUS,
+	TOP2_ROOTCLKEN_ON_GATE_STATUS,
+	TOP3_ROOTCLKEN_ON_GATE_STATUS,
+	TOP0_ROOTCLKEN_ON_MUX_STATUS,
+	TOP1_ROOTCLKEN_ON_MUX_STATUS,
+	TOP2_ROOTCLKEN_ON_MUX_STATUS,
+	TOP3_ROOTCLKEN_ON_MUX_STATUS,
+	TOP_ROOTCLKEN_AFTER_PLL_MUX_STATUS,
+	TOP_SFR_IGNORE_REQ_SYSCLK,
+	PSCDC_CTRL0,
+	PSCDC_CTRL1,
+	PSCDC_CTRL2,
+	PSCDC_CTRL3,
+	PSCDC_SCI_FIFO_CLK_CON0,
+	PSCDC_SCI_FIFO_CLK_CON1,
+	PSCDC_SCI_FIFO_CLK_CON2,
+	PSCDC_SCI_FIFO_CLK_CON3,
+	PSCDC_SMC_FIFO_CLK_CON0,
+	PSCDC_SMC_FIFO_CLK_CON1,
+	PSCDC_SMC_FIFO_CLK_CON2,
+	PSCDC_SMC_FIFO_CLK_CON3,
+	PSCDC_SMC_FIFO_CLK_CON4,
+	PSCDC_SMC_FIFO_CLK_CON5,
+	CCORE_CLK_CTRL0,
+	MIF_CLK_CTRL0,
+	MIF_CLK_CTRL1,
+	MIF_CLK_CTRL2,
+	MIF_CLK_CTRL3,
+	MIF_CLK_CTRL4,
+	ACD_PSCDC_CTRL_0,
+	ACD_PSCDC_CTRL_1,
+	ACD_PSCDC_STAT,
+	CMU_TOP_SPARE0,
+	CMU_TOP_SPARE1,
+	CMU_TOP_SPARE2,
+	CMU_TOP_SPARE3,
+};
+
+PNAME(top_mux_bus0_pll_p)				= { "oscclk",
+							    "fout_bus0_pll" };
+PNAME(top_mux_bus1_pll_p)				= { "oscclk",
+							    "fout_bus1_pll" };
+PNAME(top_mux_bus2_pll_p)				= { "oscclk",
+							    "fout_bus2_pll" };
+PNAME(top_mux_bus3_pll_p)				= { "oscclk",
+							    "fout_bus3_pll" };
+PNAME(top_mux_mfc_pll_p)				= { "oscclk",
+							    "fout_mfc_pll" };
+PNAME(top_mux_isp_pll_p)				= { "oscclk",
+							    "fout_isp_pll" };
+PNAME(top_mux_aud_pll_p)				= { "oscclk",
+							    "fout_aud_pll" };
+PNAME(top_mux_g3d_pll_p)				= { "oscclk",
+							    "fout_g3d_pll" };
+PNAME(top_mux_sclk_bus0_pll_p)				= { "mout_top_bus0_pll",
+							    "top_ff_bus0_pll_div2" };
+PNAME(top_mux_sclk_bus1_pll_p)				= { "mout_top_bus1_pll",
+							    "top_ff_bus1_pll_div2" };
+PNAME(top_mux_sclk_bus2_pll_p)				= { "mout_top_bus2_pll",
+							    "top_ff_bus2_pll_div2" };
+PNAME(top_mux_sclk_bus3_pll_p)				= { "mout_top_bus3_pll",
+							    "top_ff_bus3_pll_div2",
+							    "top_ff_bus3_pll_div4" };
+PNAME(top_mux_sclk_mfc_pll_p)				= { "mout_top_mfc_pll",
+							    "top_ff_mfc_pll_div2" };
+PNAME(top_mux_sclk_isp_pll_p)				= { "mout_top_isp_pll",
+							    "top_ff_isp_pll_div2" };
+PNAME(top_mux_aclk_ccore_800_p)				= { "mout_top_sclk_bus0_pll",
+							    "mout_top_bus1_pll",
+							    "mout_top_bus2_pll",
+							    "mout_top_sclk_bus3_pll",
+							    "top_ff_bus3_pll_div2",
+							    "mout_top_sclk_mfc_pll",
+							    "mout_top_isp_pll",
+							    "mout_top_cp2ap_mif_clk_user" };
+PNAME(top_mux_aclk_ccore_264_p)				= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "oscclk",
+							    "mout_top_cp2ap_mif_clk_user" };
+PNAME(top_mux_aclk_ccore_g3d_800_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_bus1_pll",
+							    "mout_top_bus2_pll",
+							    "mout_top_sclk_bus3_pll",
+							    "top_ff_bus3_pll_div2",
+							    "mout_top_sclk_mfc_pll",
+							    "mout_top_isp_pll",
+							    "mout_top_cp2ap_mif_clk_user" };
+PNAME(top_mux_aclk_ccore_528_p)				= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "mout_top_sclk_bus2_pll",
+							    "mout_top_sclk_bus3_pll",
+							    "mout_top_cp2ap_mif_clk_user" };
+PNAME(top_mux_aclk_ccore_132_p)				= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "oscclk",
+							    "mout_top_cp2ap_mif_clk_user" };
+PNAME(top_mux_pclk_ccore_66_p)				= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "oscclk",
+							    "mout_top_cp2ap_mif_clk_user" };
+PNAME(top_mux_aclk_bus0_528_p)				= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "mout_top_sclk_bus2_pll",
+							    "mout_top_sclk_bus3_pll" };
+PNAME(top_mux_aclk_bus0_200_p)				= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "oscclk" };
+PNAME(top_mux_pclk_bus0_132_p)				= { "mout_top_sclk_bus0_pll",
+							    "oscclk" };
+PNAME(top_mux_aclk_bus1_528_p)				= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "mout_top_sclk_bus2_pll",
+							    "mout_top_sclk_bus3_pll" };
+PNAME(top_mux_pclk_bus1_132_p)				= { "mout_top_sclk_bus0_pll",
+							    "oscclk" };
+PNAME(top_mux_aclk_disp0_0_400_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "mout_top_sclk_bus2_pll",
+							    "mout_top_sclk_bus3_pll" };
+PNAME(top_mux_aclk_disp0_1_400_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "mout_top_sclk_bus2_pll",
+							    "mout_top_sclk_bus3_pll" };
+PNAME(top_mux_aclk_disp1_0_400_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "mout_top_sclk_bus2_pll",
+							    "mout_top_sclk_bus3_pll" };
+PNAME(top_mux_aclk_disp1_1_400_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "mout_top_sclk_bus2_pll",
+							    "mout_top_sclk_bus3_pll" };
+PNAME(top_mux_aclk_mfc_600_p)				= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "mout_top_sclk_bus2_pll",
+							    "mout_top_sclk_bus3_pll",
+							    "mout_top_sclk_mfc_pll" };
+PNAME(top_mux_aclk_mscl0_528_p)				= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "mout_top_sclk_bus2_pll",
+							    "mout_top_sclk_bus3_pll" };
+PNAME(top_mux_aclk_mscl1_528_p)				= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "mout_top_sclk_bus2_pll",
+							    "mout_top_sclk_bus3_pll" };
+PNAME(top_mux_aclk_imem_266_p)				= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "oscclk" };
+PNAME(top_mux_aclk_imem_200_p)				= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "oscclk" };
+PNAME(top_mux_aclk_imem_100_p)				= { "mout_top_sclk_bus0_pll",
+							    "oscclk" };
+PNAME(top_mux_aclk_fsys0_200_p)				= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "oscclk" };
+PNAME(top_mux_aclk_fsys1_200_p)				= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "oscclk" };
+PNAME(top_mux_aclk_peris_66_p)				= { "mout_top_sclk_bus0_pll",
+							    "oscclk" };
+PNAME(top_mux_aclk_peric0_66_p)				= { "mout_top_sclk_bus0_pll",
+							    "oscclk" };
+PNAME(top_mux_aclk_peric1_66_p)				= { "mout_top_sclk_bus0_pll",
+							    "oscclk" };
+PNAME(top_mux_aclk_isp0_isp0_528_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "mout_top_sclk_bus2_pll",
+							    "mout_top_sclk_bus3_pll",
+							    "mout_top_sclk_isp_pll",
+							    "mout_top_sclk_mfc_pll" };
+PNAME(top_mux_aclk_isp0_tpu_400_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "mout_top_sclk_bus2_pll",
+							    "mout_top_sclk_bus3_pll",
+							    "mout_top_sclk_isp_pll",
+							    "mout_top_sclk_mfc_pll" };
+PNAME(top_mux_aclk_isp0_trex_528_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "mout_top_sclk_bus2_pll",
+							    "mout_top_sclk_bus3_pll",
+							    "mout_top_sclk_isp_pll",
+							    "mout_top_sclk_mfc_pll" };
+PNAME(top_mux_aclk_isp0_pxl_asbs_is_c_from_is_d_p)	= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "mout_top_sclk_bus2_pll",
+							    "mout_top_sclk_bus3_pll",
+							    "mout_top_sclk_isp_pll",
+							    "mout_top_sclk_mfc_pll" };
+PNAME(top_mux_aclk_isp1_isp1_468_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "mout_top_sclk_bus2_pll",
+							    "mout_top_sclk_bus3_pll",
+							    "mout_top_sclk_isp_pll",
+							    "mout_top_sclk_mfc_pll" };
+PNAME(top_mux_aclk_cam0_csis0_414_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "mout_top_sclk_bus2_pll",
+							    "mout_top_sclk_bus3_pll",
+							    "mout_top_sclk_isp_pll",
+							    "mout_top_sclk_mfc_pll" };
+PNAME(top_mux_aclk_cam0_csis1_168_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus2_pll" };
+PNAME(top_mux_aclk_cam0_csis2_234_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "mout_top_sclk_bus2_pll",
+							    "mout_top_sclk_bus3_pll",
+							    "mout_top_sclk_isp_pll",
+							    "mout_top_sclk_mfc_pll" };
+PNAME(top_mux_aclk_cam0_3aa0_414_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "mout_top_sclk_bus2_pll",
+							    "mout_top_sclk_bus3_pll",
+							    "mout_top_sclk_isp_pll",
+							    "mout_top_sclk_mfc_pll" };
+PNAME(top_mux_aclk_cam0_3aa1_414_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "mout_top_sclk_bus2_pll",
+							    "mout_top_sclk_bus3_pll",
+							    "mout_top_sclk_isp_pll",
+							    "mout_top_sclk_mfc_pll" };
+PNAME(top_mux_aclk_cam0_csis3_132_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll" };
+PNAME(top_mux_aclk_cam0_trex_528_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "mout_top_sclk_bus2_pll",
+							    "mout_top_sclk_bus3_pll",
+							    "mout_top_sclk_isp_pll",
+							    "mout_top_sclk_mfc_pll" };
+PNAME(top_mux_aclk_cam1_arm_672_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "mout_top_sclk_bus2_pll",
+							    "mout_top_sclk_bus3_pll",
+							    "mout_top_sclk_isp_pll",
+							    "mout_top_sclk_mfc_pll",
+							    "mout_top_bus2_pll" };
+PNAME(top_mux_aclk_cam1_trex_vra_528_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "mout_top_sclk_bus2_pll",
+							    "mout_top_sclk_bus3_pll",
+							    "mout_top_sclk_isp_pll",
+							    "mout_top_sclk_mfc_pll" };
+PNAME(top_mux_aclk_cam1_trex_b_528_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "mout_top_sclk_bus2_pll",
+							    "mout_top_sclk_bus3_pll",
+							    "mout_top_sclk_isp_pll",
+							    "mout_top_sclk_mfc_pll" };
+PNAME(top_mux_aclk_cam1_bus_264_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "mout_top_sclk_bus2_pll",
+							    "mout_top_sclk_bus3_pll",
+							    "mout_top_sclk_isp_pll",
+							    "mout_top_sclk_mfc_pll" };
+PNAME(top_mux_aclk_cam1_peri_84_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus2_pll" };
+PNAME(top_mux_aclk_cam1_csis2_414_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "mout_top_sclk_bus2_pll",
+							    "mout_top_sclk_bus3_pll",
+							    "mout_top_sclk_isp_pll",
+							    "mout_top_sclk_mfc_pll" };
+PNAME(top_mux_aclk_cam1_csis3_132_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll" };
+PNAME(top_mux_aclk_cam1_scl_566_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "mout_top_sclk_bus2_pll",
+							    "mout_top_sclk_bus3_pll",
+							    "mout_top_sclk_isp_pll",
+							    "mout_top_sclk_mfc_pll" };
+PNAME(top_mux_sclk_disp0_decon0_eclk0_p)		= { "mout_top_sclk_bus0_pll",
+							    "oscclk",
+							    "mout_top_bus2_pll" };
+PNAME(top_mux_sclk_disp0_decon0_vclk0_p)		= { "mout_top_sclk_bus0_pll",
+							    "oscclk",
+							    "mout_top_bus2_pll" };
+PNAME(top_mux_sclk_disp0_decon0_vclk1_p)		= { "mout_top_sclk_bus0_pll",
+							    "oscclk",
+							    "mout_top_bus2_pll" };
+PNAME(top_mux_sclk_disp0_hdmi_audio_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_aud_pll" };
+PNAME(top_mux_sclk_disp1_decon1_eclk0_p)		= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "mout_top_bus2_pll" };
+PNAME(top_mux_sclk_disp1_decon1_eclk1_p)		= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "mout_top_bus2_pll" };
+PNAME(top_mux_sclk_fsys0_usbdrd30_p)			= { "mout_top_sclk_bus0_pll",
+							    "oscclk" };
+PNAME(top_mux_sclk_fsys0_mmc0_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_bus1_pll",
+							    "mout_top_sclk_bus2_pll",
+							    "top_ff_bus3_pll_div2" };
+PNAME(top_mux_sclk_fsys0_ufsunipro20_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "mout_top_sclk_bus2_pll" };
+PNAME(top_mux_sclk_fsys0_phy_24m_p)			= { "mout_top_sclk_bus0_pll",
+							    "oscclk" };
+PNAME(top_mux_sclk_fsys0_ufsunipro_cfg_p)		= { "mout_top_sclk_bus0_pll",
+							    "oscclk",
+							    "mout_top_sclk_bus2_pll" };
+PNAME(top_mux_sclk_fsys1_mmc2_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_bus1_pll",
+							    "mout_top_sclk_bus2_pll",
+							    "top_ff_bus3_pll_div2" };
+PNAME(top_mux_sclk_fsys1_ufsunipro20_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "mout_top_sclk_bus2_pll" };
+PNAME(top_mux_sclk_fsys1_pcie_phy_p)			= { "mout_top_sclk_bus1_pll",
+							    "oscclk" };
+PNAME(top_mux_sclk_fsys1_ufsunipro_cfg_p)		= { "mout_top_sclk_bus0_pll",
+							    "oscclk",
+							    "mout_top_sclk_bus2_pll" };
+PNAME(top_mux_sclk_peric0_uart0_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "oscclk" };
+PNAME(top_mux_sclk_peric1_spi0_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "oscclk" };
+PNAME(top_mux_sclk_peric1_spi1_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "oscclk" };
+PNAME(top_mux_sclk_peric1_spi2_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "oscclk" };
+PNAME(top_mux_sclk_peric1_spi3_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "oscclk" };
+PNAME(top_mux_sclk_peric1_spi4_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "oscclk" };
+PNAME(top_mux_sclk_peric1_spi5_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "oscclk" };
+PNAME(top_mux_sclk_peric1_spi6_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "oscclk" };
+PNAME(top_mux_sclk_peric1_spi7_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "oscclk" };
+PNAME(top_mux_sclk_peric1_uart1_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "oscclk" };
+PNAME(top_mux_sclk_peric1_uart2_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "oscclk" };
+PNAME(top_mux_sclk_peric1_uart3_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "oscclk" };
+PNAME(top_mux_sclk_peric1_uart4_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "oscclk" };
+PNAME(top_mux_sclk_peric1_uart5_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "oscclk" };
+PNAME(top_mux_sclk_cam1_isp_spi0_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "oscclk" };
+PNAME(top_mux_sclk_cam1_isp_spi1_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "oscclk" };
+PNAME(top_mux_sclk_cam1_isp_uart_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll" };
+PNAME(top_mux_sclk_ap2cp_mif_pll_out_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "mout_top_sclk_bus2_pll",
+							    "mout_top_sclk_bus3_pll" };
+PNAME(top_mux_aclk_pscdc_400_p)				= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "mout_top_sclk_bus3_pll",
+							    "mout_top_cp2ap_mif_clk_user" };
+PNAME(top_mux_sclk_bus_pll_mngs_p)			= { "mout_top_bus0_pll",
+							    "mout_top_bus1_pll",
+							    "mout_top_bus2_pll",
+							    "top_ff_bus3_pll_div2" };
+PNAME(top_mux_sclk_bus_pll_apollo_p)			= { "mout_top_bus0_pll",
+							    "mout_top_bus1_pll",
+							    "mout_top_bus2_pll",
+							    "top_ff_bus3_pll_div2" };
+PNAME(top_mux_sclk_bus_pll_mif_p)			= { "mout_top_bus0_pll",
+							    "mout_top_bus1_pll",
+							    "mout_top_bus2_pll",
+							    "mout_top_bus3_pll",
+							    "top_ff_bus3_pll_div2",
+							    "mout_top_cp2ap_mif_clk_user" };
+PNAME(top_mux_sclk_bus_pll_g3d_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_bus1_pll",
+							    "mout_top_bus2_pll",
+							    "top_ff_bus3_pll_div2",
+							    "mout_top_g3d_pll" };
+PNAME(top_mux_sclk_isp_sensor0_p)			= { "oscclk" };
+PNAME(top_mux_sclk_isp_sensor1_p)			= { "oscclk" };
+PNAME(top_mux_sclk_isp_sensor2_p)			= { "oscclk" };
+PNAME(top_mux_sclk_isp_sensor3_p)			= { "oscclk" };
+PNAME(top_mux_sclk_promise_int_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "mout_top_sclk_bus2_pll" };
+PNAME(top_mux_sclk_promise_disp_p)			= { "mout_top_sclk_bus0_pll",
+							    "mout_top_sclk_bus1_pll",
+							    "mout_top_sclk_bus2_pll" };
+PNAME(top_mux_cp2ap_mif_clk_user_p)			= { "oscclk",
+							    "i_cp2ap_mif_clk" };
+PNAME(top_mux_mif_pll_p)				= { "oscclk",
+							    "fout_mif0_pll",
+							    "fout_mif1_pll",
+							    "fout_mif2_pll",
+							    "fout_mif3_pll" };
+PNAME(top_mux_bus_pll_mif_p)				= { "oscclk",
+							    "mout_top_sclk_bus1_pll" };
+PNAME(top_mux_aclk_mif_pll_p)				= { "mout_top_mif_pll",
+							    "mout_top_bus_pll_mif" };
+
+static const struct samsung_pll_rate_table g3d_pll_rates[] __initconst = {
+	PLL_35XX_RATE(26 * MHZ, 806000000U, 124, 4, 0),
+	PLL_35XX_RATE(26 * MHZ, 764400000U, 147, 5, 0),
+	PLL_35XX_RATE(26 * MHZ, 754000000U, 116, 4, 0),
+	PLL_35XX_RATE(26 * MHZ, 728000000U, 112, 4, 0),
+	PLL_35XX_RATE(26 * MHZ, 702000000U, 108, 4, 0),
+	PLL_35XX_RATE(26 * MHZ, 682500000U, 105, 4, 0),
+	PLL_35XX_RATE(26 * MHZ, 650000000U, 100, 4, 0),
+	PLL_35XX_RATE(26 * MHZ, 600166666U, 277, 6, 1),
+	PLL_35XX_RATE(26 * MHZ, 572000000U, 176, 4, 1),
+	PLL_35XX_RATE(26 * MHZ, 546000000U, 168, 4, 1),
+	PLL_35XX_RATE(26 * MHZ, 455000000U, 140, 4, 1),
+	PLL_35XX_RATE(26 * MHZ, 419250000U, 129, 4, 1),
+	PLL_35XX_RATE(26 * MHZ, 338000000U, 104, 4, 1),
+	PLL_35XX_RATE(26 * MHZ, 260000000U, 160, 4, 2),
+	PLL_35XX_RATE(26 * MHZ, 169000000U, 104, 4, 2),
+	PLL_35XX_RATE(26 * MHZ, 112125000U, 138, 4, 3),
+};
+
+static const struct samsung_pll_rate_table bus0_pll_rates[] __initconst = {
+	PLL_35XX_RATE(26 * MHZ, 1056000000U, 528, 13, 0),
+};
+
+static const struct samsung_pll_rate_table bus1_pll_rates[] __initconst = {
+	PLL_35XX_RATE(26 * MHZ, 800000000U, 400, 13, 0),
+};
+
+static const struct samsung_pll_rate_table bus2_pll_rates[] __initconst = {
+	PLL_35XX_RATE(26 * MHZ, 672000000U, 336, 13, 0),
+};
+
+static const struct samsung_pll_rate_table bus3_pll_rates[] __initconst = {
+	PLL_35XX_RATE(26 * MHZ, 1872000000U, 288, 4, 0),
+	PLL_35XX_RATE(26 * MHZ, 1352000000U, 156, 3, 0),
+	PLL_35XX_RATE(26 * MHZ, 1092000000U, 126, 3, 0),
+	PLL_35XX_RATE(26 * MHZ, 841750000U, 259, 4, 1),
+	PLL_35XX_RATE(26 * MHZ, 572000000U, 132, 3, 1),
+	PLL_35XX_RATE(26 * MHZ, 416000000U, 192, 3, 2),
+};
+
+static const struct samsung_pll_rate_table mfc_pll_rates[] __initconst = {
+	PLL_35XX_RATE(26 * MHZ, 598000000U, 184, 4, 1),
+};
+
+static const struct samsung_pll_rate_table isp_pll_rates[] __initconst = {
+	PLL_35XX_RATE(26 * MHZ, 425750000U, 131, 4, 1),
+	PLL_35XX_RATE(26 * MHZ, 409500000U, 126, 4, 1),
+};
+
+static const struct samsung_pll_rate_table aud_pll_rates[] __initconst = {
+	PLL_36XX_RATE(26 * MHZ, 592000076U, 46, 1, 1, -30247),
+	PLL_36XX_RATE(26 * MHZ, 589824020U, 45, 1, 1, 24319),
+	PLL_36XX_RATE(26 * MHZ, 492000091U, 38, 1, 1, -10082),
+	PLL_36XX_RATE(26 * MHZ, 491520050U, 38, 1, 1, -12502),
+	PLL_36XX_RATE(26 * MHZ, 410000473U, 32, 1, 1, -30245),
+	PLL_36XX_RATE(26 * MHZ, 294912010U, 45, 1, 2, 24319),
+	PLL_36XX_RATE(26 * MHZ, 196608039U, 30, 1, 2, 16213),
+	PLL_36XX_RATE(26 * MHZ, 135475200U, 42, 1, 3, -20665),
+};
+
+static const struct samsung_pll_clock top_pll_clks[] __initconst = {
+	PLL(pll_141xx, CLK_FOUT_G3D_PLL, "fout_g3d_pll", "oscclk", G3D_PLL_LOCK,
+	    G3D_PLL_CON0, g3d_pll_rates),
+	PLL(pll_141xx, CLK_FOUT_BUS0_PLL, "fout_bus0_pll", "oscclk",
+	    BUS0_PLL_LOCK, BUS0_PLL_CON0, bus0_pll_rates),
+	PLL(pll_141xx, CLK_FOUT_BUS1_PLL, "fout_bus1_pll", "oscclk",
+	    BUS1_PLL_LOCK, BUS1_PLL_CON0, bus1_pll_rates),
+	PLL(pll_141xx, CLK_FOUT_BUS2_PLL, "fout_bus2_pll", "oscclk",
+	    BUS2_PLL_LOCK, BUS2_PLL_CON0, bus2_pll_rates),
+	PLL(pll_141xx, CLK_FOUT_BUS3_PLL, "fout_bus3_pll", "oscclk",
+	    BUS3_PLL_LOCK, BUS3_PLL_CON0, bus3_pll_rates),
+	PLL(pll_141xx, CLK_FOUT_MFC_PLL, "fout_mfc_pll", "oscclk", MFC_PLL_LOCK,
+	    MFC_PLL_CON0, mfc_pll_rates),
+	PLL(pll_141xx, CLK_FOUT_ISP_PLL, "fout_isp_pll", "oscclk", ISP_PLL_LOCK,
+	    ISP_PLL_CON0, isp_pll_rates),
+	PLL(pll_1431x, CLK_FOUT_AUD_PLL, "fout_aud_pll", "oscclk", AUD_PLL_LOCK,
+	    AUD_PLL_CON0, aud_pll_rates),
+};
+
+static const struct samsung_fixed_rate_clock top_fixed_clks[] __initconst = {
+	FRATE(CLK_I_CP2AP_MIF_CLK, "i_cp2ap_mif_clk", NULL, 0, 400000000),
+};
+
+static const struct samsung_mux_clock top_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_TOP_BUS0_PLL, "mout_top_bus0_pll", top_mux_bus0_pll_p,
+	    CLK_CON_MUX_BUS0_PLL, 12, 1),
+	MUX(CLK_MOUT_TOP_BUS1_PLL, "mout_top_bus1_pll", top_mux_bus1_pll_p,
+	    CLK_CON_MUX_BUS1_PLL, 12, 1),
+	MUX(CLK_MOUT_TOP_BUS2_PLL, "mout_top_bus2_pll", top_mux_bus2_pll_p,
+	    CLK_CON_MUX_BUS2_PLL, 12, 1),
+	MUX(CLK_MOUT_TOP_BUS3_PLL, "mout_top_bus3_pll", top_mux_bus3_pll_p,
+	    CLK_CON_MUX_BUS3_PLL, 12, 1),
+	MUX(CLK_MOUT_TOP_MFC_PLL, "mout_top_mfc_pll", top_mux_mfc_pll_p,
+	    CLK_CON_MUX_MFC_PLL, 12, 1),
+	MUX(CLK_MOUT_TOP_ISP_PLL, "mout_top_isp_pll", top_mux_isp_pll_p,
+	    CLK_CON_MUX_ISP_PLL, 12, 1),
+	MUX(CLK_MOUT_TOP_AUD_PLL, "mout_top_aud_pll", top_mux_aud_pll_p,
+	    CLK_CON_MUX_AUD_PLL, 12, 1),
+	MUX(CLK_MOUT_TOP_G3D_PLL, "mout_top_g3d_pll", top_mux_g3d_pll_p,
+	    CLK_CON_MUX_G3D_PLL, 12, 1),
+	MUX(CLK_MOUT_TOP_SCLK_BUS0_PLL, "mout_top_sclk_bus0_pll",
+	    top_mux_sclk_bus0_pll_p, CLK_CON_MUX_SCLK_BUS0_PLL, 12, 1),
+	MUX(CLK_MOUT_TOP_SCLK_BUS1_PLL, "mout_top_sclk_bus1_pll",
+	    top_mux_sclk_bus1_pll_p, CLK_CON_MUX_SCLK_BUS1_PLL, 12, 1),
+	MUX(CLK_MOUT_TOP_SCLK_BUS2_PLL, "mout_top_sclk_bus2_pll",
+	    top_mux_sclk_bus2_pll_p, CLK_CON_MUX_SCLK_BUS2_PLL, 12, 1),
+	MUX(CLK_MOUT_TOP_SCLK_BUS3_PLL, "mout_top_sclk_bus3_pll",
+	    top_mux_sclk_bus3_pll_p, CLK_CON_MUX_SCLK_BUS3_PLL, 12, 2),
+	MUX(CLK_MOUT_TOP_SCLK_MFC_PLL, "mout_top_sclk_mfc_pll",
+	    top_mux_sclk_mfc_pll_p, CLK_CON_MUX_SCLK_MFC_PLL, 12, 1),
+	MUX(CLK_MOUT_TOP_SCLK_ISP_PLL, "mout_top_sclk_isp_pll",
+	    top_mux_sclk_isp_pll_p, CLK_CON_MUX_SCLK_ISP_PLL, 12, 1),
+	MUX(CLK_MOUT_TOP_ACLK_CCORE_800, "mout_top_aclk_ccore_800",
+	    top_mux_aclk_ccore_800_p, CLK_CON_MUX_ACLK_CCORE_800, 12, 3),
+	MUX(CLK_MOUT_TOP_ACLK_CCORE_264, "mout_top_aclk_ccore_264",
+	    top_mux_aclk_ccore_264_p, CLK_CON_MUX_ACLK_CCORE_264, 12, 2),
+	MUX(CLK_MOUT_TOP_ACLK_CCORE_G3D_800, "mout_top_aclk_ccore_g3d_800",
+	    top_mux_aclk_ccore_g3d_800_p, CLK_CON_MUX_ACLK_CCORE_G3D_800, 12,
+	    3),
+	MUX(CLK_MOUT_TOP_ACLK_CCORE_528, "mout_top_aclk_ccore_528",
+	    top_mux_aclk_ccore_528_p, CLK_CON_MUX_ACLK_CCORE_528, 12, 3),
+	MUX(CLK_MOUT_TOP_ACLK_CCORE_132, "mout_top_aclk_ccore_132",
+	    top_mux_aclk_ccore_132_p, CLK_CON_MUX_ACLK_CCORE_132, 12, 2),
+	MUX(CLK_MOUT_TOP_PCLK_CCORE_66, "mout_top_pclk_ccore_66",
+	    top_mux_pclk_ccore_66_p, CLK_CON_MUX_PCLK_CCORE_66, 12, 2),
+	MUX(CLK_MOUT_TOP_ACLK_BUS0_528, "mout_top_aclk_bus0_528",
+	    top_mux_aclk_bus0_528_p, CLK_CON_MUX_ACLK_BUS0_528, 12, 2),
+	MUX(CLK_MOUT_TOP_ACLK_BUS0_200, "mout_top_aclk_bus0_200",
+	    top_mux_aclk_bus0_200_p, CLK_CON_MUX_ACLK_BUS0_200, 12, 2),
+	MUX(CLK_MOUT_TOP_PCLK_BUS0_132, "mout_top_pclk_bus0_132",
+	    top_mux_pclk_bus0_132_p, CLK_CON_MUX_PCLK_BUS0_132, 12, 2),
+	MUX(CLK_MOUT_TOP_ACLK_BUS1_528, "mout_top_aclk_bus1_528",
+	    top_mux_aclk_bus1_528_p, CLK_CON_MUX_ACLK_BUS1_528, 12, 2),
+	MUX(CLK_MOUT_TOP_PCLK_BUS1_132, "mout_top_pclk_bus1_132",
+	    top_mux_pclk_bus1_132_p, CLK_CON_MUX_PCLK_BUS1_132, 12, 2),
+	MUX(CLK_MOUT_TOP_ACLK_DISP0_0_400, "mout_top_aclk_disp0_0_400",
+	    top_mux_aclk_disp0_0_400_p, CLK_CON_MUX_ACLK_DISP0_0_400, 12, 2),
+	MUX(CLK_MOUT_TOP_ACLK_DISP0_1_400, "mout_top_aclk_disp0_1_400",
+	    top_mux_aclk_disp0_1_400_p, CLK_CON_MUX_ACLK_DISP0_1_400_TOP, 12,
+	    2),
+	MUX(CLK_MOUT_TOP_ACLK_DISP1_0_400, "mout_top_aclk_disp1_0_400",
+	    top_mux_aclk_disp1_0_400_p, CLK_CON_MUX_ACLK_DISP1_0_400, 12, 2),
+	MUX(CLK_MOUT_TOP_ACLK_DISP1_1_400, "mout_top_aclk_disp1_1_400",
+	    top_mux_aclk_disp1_1_400_p, CLK_CON_MUX_ACLK_DISP1_1_400_TOP, 12,
+	    2),
+	MUX(CLK_MOUT_TOP_ACLK_MFC_600, "mout_top_aclk_mfc_600",
+	    top_mux_aclk_mfc_600_p, CLK_CON_MUX_ACLK_MFC_600, 12, 3),
+	MUX(CLK_MOUT_TOP_ACLK_MSCL0_528, "mout_top_aclk_mscl0_528",
+	    top_mux_aclk_mscl0_528_p, CLK_CON_MUX_ACLK_MSCL0_528, 12, 2),
+	MUX(CLK_MOUT_TOP_ACLK_MSCL1_528, "mout_top_aclk_mscl1_528",
+	    top_mux_aclk_mscl1_528_p, CLK_CON_MUX_ACLK_MSCL1_528_TOP, 12, 2),
+	MUX(CLK_MOUT_TOP_ACLK_IMEM_266, "mout_top_aclk_imem_266",
+	    top_mux_aclk_imem_266_p, CLK_CON_MUX_ACLK_IMEM_266, 12, 2),
+	MUX(CLK_MOUT_TOP_ACLK_IMEM_200, "mout_top_aclk_imem_200",
+	    top_mux_aclk_imem_200_p, CLK_CON_MUX_ACLK_IMEM_200, 12, 2),
+	MUX(CLK_MOUT_TOP_ACLK_IMEM_100, "mout_top_aclk_imem_100",
+	    top_mux_aclk_imem_100_p, CLK_CON_MUX_ACLK_IMEM_100, 12, 2),
+	MUX(CLK_MOUT_TOP_ACLK_FSYS0_200, "mout_top_aclk_fsys0_200",
+	    top_mux_aclk_fsys0_200_p, CLK_CON_MUX_ACLK_FSYS0_200, 12, 2),
+	MUX(CLK_MOUT_TOP_ACLK_FSYS1_200, "mout_top_aclk_fsys1_200",
+	    top_mux_aclk_fsys1_200_p, CLK_CON_MUX_ACLK_FSYS1_200, 12, 2),
+	MUX(CLK_MOUT_TOP_ACLK_PERIS_66, "mout_top_aclk_peris_66",
+	    top_mux_aclk_peris_66_p, CLK_CON_MUX_ACLK_PERIS_66, 12, 2),
+	MUX(CLK_MOUT_TOP_ACLK_PERIC0_66, "mout_top_aclk_peric0_66",
+	    top_mux_aclk_peric0_66_p, CLK_CON_MUX_ACLK_PERIC0_66, 12, 2),
+	MUX(CLK_MOUT_TOP_ACLK_PERIC1_66, "mout_top_aclk_peric1_66",
+	    top_mux_aclk_peric1_66_p, CLK_CON_MUX_ACLK_PERIC1_66, 12, 2),
+	MUX(CLK_MOUT_TOP_ACLK_ISP0_ISP0_528, "mout_top_aclk_isp0_isp0_528",
+	    top_mux_aclk_isp0_isp0_528_p, CLK_CON_MUX_ACLK_ISP0_ISP0_528, 12,
+	    3),
+	MUX(CLK_MOUT_TOP_ACLK_ISP0_TPU_400, "mout_top_aclk_isp0_tpu_400",
+	    top_mux_aclk_isp0_tpu_400_p, CLK_CON_MUX_ACLK_ISP0_TPU_400, 12, 3),
+	MUX(CLK_MOUT_TOP_ACLK_ISP0_TREX_528, "mout_top_aclk_isp0_trex_528",
+	    top_mux_aclk_isp0_trex_528_p, CLK_CON_MUX_ACLK_ISP0_TREX_528, 12,
+	    3),
+	MUX(CLK_MOUT_TOP_ACLK_ISP0_PXL_ASBS_IS_C_FROM_IS_D,
+	    "mout_top_aclk_isp0_pxl_asbs_is_c_from_is_d",
+	    top_mux_aclk_isp0_pxl_asbs_is_c_from_is_d_p,
+	    CLK_CON_MUX_ACLK_ISP0_PXL_ASBS_IS_C_FROM_IS_D_TOP, 12, 3),
+	MUX(CLK_MOUT_TOP_ACLK_ISP1_ISP1_468, "mout_top_aclk_isp1_isp1_468",
+	    top_mux_aclk_isp1_isp1_468_p, CLK_CON_MUX_ACLK_ISP1_ISP1_468, 12,
+	    3),
+	MUX(CLK_MOUT_TOP_ACLK_CAM0_CSIS0_414, "mout_top_aclk_cam0_csis0_414",
+	    top_mux_aclk_cam0_csis0_414_p, CLK_CON_MUX_ACLK_CAM0_CSIS0_414, 12,
+	    3),
+	MUX(CLK_MOUT_TOP_ACLK_CAM0_CSIS1_168, "mout_top_aclk_cam0_csis1_168",
+	    top_mux_aclk_cam0_csis1_168_p, CLK_CON_MUX_ACLK_CAM0_CSIS1_168, 12,
+	    1),
+	MUX(CLK_MOUT_TOP_ACLK_CAM0_CSIS2_234, "mout_top_aclk_cam0_csis2_234",
+	    top_mux_aclk_cam0_csis2_234_p, CLK_CON_MUX_ACLK_CAM0_CSIS2_234, 12,
+	    3),
+	MUX(CLK_MOUT_TOP_ACLK_CAM0_3AA0_414, "mout_top_aclk_cam0_3aa0_414",
+	    top_mux_aclk_cam0_3aa0_414_p, CLK_CON_MUX_ACLK_CAM0_3AA0_414, 12,
+	    3),
+	MUX(CLK_MOUT_TOP_ACLK_CAM0_3AA1_414, "mout_top_aclk_cam0_3aa1_414",
+	    top_mux_aclk_cam0_3aa1_414_p, CLK_CON_MUX_ACLK_CAM0_3AA1_414, 12,
+	    3),
+	MUX(CLK_MOUT_TOP_ACLK_CAM0_CSIS3_132, "mout_top_aclk_cam0_csis3_132",
+	    top_mux_aclk_cam0_csis3_132_p, CLK_CON_MUX_ACLK_CAM0_CSIS3_132, 12,
+	    1),
+	MUX(CLK_MOUT_TOP_ACLK_CAM0_TREX_528, "mout_top_aclk_cam0_trex_528",
+	    top_mux_aclk_cam0_trex_528_p, CLK_CON_MUX_ACLK_CAM0_TREX_528, 12,
+	    3),
+	MUX(CLK_MOUT_TOP_ACLK_CAM1_ARM_672, "mout_top_aclk_cam1_arm_672",
+	    top_mux_aclk_cam1_arm_672_p, CLK_CON_MUX_ACLK_CAM1_ARM_672, 12, 3),
+	MUX(CLK_MOUT_TOP_ACLK_CAM1_TREX_VRA_528,
+	    "mout_top_aclk_cam1_trex_vra_528", top_mux_aclk_cam1_trex_vra_528_p,
+	    CLK_CON_MUX_ACLK_CAM1_TREX_VRA_528, 12, 3),
+	MUX(CLK_MOUT_TOP_ACLK_CAM1_TREX_B_528, "mout_top_aclk_cam1_trex_b_528",
+	    top_mux_aclk_cam1_trex_b_528_p, CLK_CON_MUX_ACLK_CAM1_TREX_B_528,
+	    12, 3),
+	MUX(CLK_MOUT_TOP_ACLK_CAM1_BUS_264, "mout_top_aclk_cam1_bus_264",
+	    top_mux_aclk_cam1_bus_264_p, CLK_CON_MUX_ACLK_CAM1_BUS_264, 12, 3),
+	MUX(CLK_MOUT_TOP_ACLK_CAM1_PERI_84, "mout_top_aclk_cam1_peri_84",
+	    top_mux_aclk_cam1_peri_84_p, CLK_CON_MUX_ACLK_CAM1_PERI_84, 12, 1),
+	MUX(CLK_MOUT_TOP_ACLK_CAM1_CSIS2_414, "mout_top_aclk_cam1_csis2_414",
+	    top_mux_aclk_cam1_csis2_414_p, CLK_CON_MUX_ACLK_CAM1_CSIS2_414, 12,
+	    3),
+	MUX(CLK_MOUT_TOP_ACLK_CAM1_CSIS3_132, "mout_top_aclk_cam1_csis3_132",
+	    top_mux_aclk_cam1_csis3_132_p, CLK_CON_MUX_ACLK_CAM1_CSIS3_132, 12,
+	    1),
+	MUX(CLK_MOUT_TOP_ACLK_CAM1_SCL_566, "mout_top_aclk_cam1_scl_566",
+	    top_mux_aclk_cam1_scl_566_p, CLK_CON_MUX_ACLK_CAM1_SCL_566, 12, 3),
+	MUX(CLK_MOUT_TOP_SCLK_DISP0_DECON0_ECLK0,
+	    "mout_top_sclk_disp0_decon0_eclk0",
+	    top_mux_sclk_disp0_decon0_eclk0_p,
+	    CLK_CON_MUX_SCLK_DISP0_DECON0_ECLK0_TOP, 12, 2),
+	MUX(CLK_MOUT_TOP_SCLK_DISP0_DECON0_VCLK0,
+	    "mout_top_sclk_disp0_decon0_vclk0",
+	    top_mux_sclk_disp0_decon0_vclk0_p,
+	    CLK_CON_MUX_SCLK_DISP0_DECON0_VCLK0_TOP, 12, 2),
+	MUX(CLK_MOUT_TOP_SCLK_DISP0_DECON0_VCLK1,
+	    "mout_top_sclk_disp0_decon0_vclk1",
+	    top_mux_sclk_disp0_decon0_vclk1_p,
+	    CLK_CON_MUX_SCLK_DISP0_DECON0_VCLK1_TOP, 12, 2),
+	MUX(CLK_MOUT_TOP_SCLK_DISP0_HDMI_AUDIO,
+	    "mout_top_sclk_disp0_hdmi_audio", top_mux_sclk_disp0_hdmi_audio_p,
+	    CLK_CON_MUX_SCLK_DISP0_HDMI_AUDIO_TOP, 12, 1),
+	MUX(CLK_MOUT_TOP_SCLK_DISP1_DECON1_ECLK0,
+	    "mout_top_sclk_disp1_decon1_eclk0",
+	    top_mux_sclk_disp1_decon1_eclk0_p,
+	    CLK_CON_MUX_SCLK_DISP1_DECON1_ECLK0_TOP, 12, 2),
+	MUX(CLK_MOUT_TOP_SCLK_DISP1_DECON1_ECLK1,
+	    "mout_top_sclk_disp1_decon1_eclk1",
+	    top_mux_sclk_disp1_decon1_eclk1_p,
+	    CLK_CON_MUX_SCLK_DISP1_DECON1_ECLK1_TOP, 12, 2),
+	MUX(CLK_MOUT_TOP_SCLK_FSYS0_USBDRD30, "mout_top_sclk_fsys0_usbdrd30",
+	    top_mux_sclk_fsys0_usbdrd30_p, CLK_CON_MUX_SCLK_FSYS0_USBDRD30, 12,
+	    2),
+	MUX(CLK_MOUT_TOP_SCLK_FSYS0_MMC0, "mout_top_sclk_fsys0_mmc0",
+	    top_mux_sclk_fsys0_mmc0_p, CLK_CON_MUX_SCLK_FSYS0_MMC0, 12, 2),
+	MUX(CLK_MOUT_TOP_SCLK_FSYS0_UFSUNIPRO20,
+	    "mout_top_sclk_fsys0_ufsunipro20", top_mux_sclk_fsys0_ufsunipro20_p,
+	    CLK_CON_MUX_SCLK_FSYS0_UFSUNIPRO20, 12, 2),
+	MUX(CLK_MOUT_TOP_SCLK_FSYS0_PHY_24M, "mout_top_sclk_fsys0_phy_24m",
+	    top_mux_sclk_fsys0_phy_24m_p, CLK_CON_MUX_SCLK_FSYS0_PHY_24M, 12,
+	    1),
+	MUX(CLK_MOUT_TOP_SCLK_FSYS0_UFSUNIPRO_CFG,
+	    "mout_top_sclk_fsys0_ufsunipro_cfg",
+	    top_mux_sclk_fsys0_ufsunipro_cfg_p,
+	    CLK_CON_MUX_SCLK_FSYS0_UFSUNIPRO_CFG, 12, 2),
+	MUX(CLK_MOUT_TOP_SCLK_FSYS1_MMC2, "mout_top_sclk_fsys1_mmc2",
+	    top_mux_sclk_fsys1_mmc2_p, CLK_CON_MUX_SCLK_FSYS1_MMC2, 12, 2),
+	MUX(CLK_MOUT_TOP_SCLK_FSYS1_UFSUNIPRO20,
+	    "mout_top_sclk_fsys1_ufsunipro20", top_mux_sclk_fsys1_ufsunipro20_p,
+	    CLK_CON_MUX_SCLK_FSYS1_UFSUNIPRO20, 12, 2),
+	MUX(CLK_MOUT_TOP_SCLK_FSYS1_PCIE_PHY, "mout_top_sclk_fsys1_pcie_phy",
+	    top_mux_sclk_fsys1_pcie_phy_p, CLK_CON_MUX_SCLK_FSYS1_PCIE_PHY, 12,
+	    1),
+	MUX(CLK_MOUT_TOP_SCLK_FSYS1_UFSUNIPRO_CFG,
+	    "mout_top_sclk_fsys1_ufsunipro_cfg",
+	    top_mux_sclk_fsys1_ufsunipro_cfg_p,
+	    CLK_CON_MUX_SCLK_FSYS1_UFSUNIPRO_CFG, 12, 2),
+	MUX(CLK_MOUT_TOP_SCLK_PERIC0_UART0, "mout_top_sclk_peric0_uart0",
+	    top_mux_sclk_peric0_uart0_p, CLK_CON_MUX_SCLK_PERIC0_UART0, 12, 2),
+	MUX(CLK_MOUT_TOP_SCLK_PERIC1_SPI0, "mout_top_sclk_peric1_spi0",
+	    top_mux_sclk_peric1_spi0_p, CLK_CON_MUX_SCLK_PERIC1_SPI0, 12, 2),
+	MUX(CLK_MOUT_TOP_SCLK_PERIC1_SPI1, "mout_top_sclk_peric1_spi1",
+	    top_mux_sclk_peric1_spi1_p, CLK_CON_MUX_SCLK_PERIC1_SPI1, 12, 2),
+	MUX(CLK_MOUT_TOP_SCLK_PERIC1_SPI2, "mout_top_sclk_peric1_spi2",
+	    top_mux_sclk_peric1_spi2_p, CLK_CON_MUX_SCLK_PERIC1_SPI2, 12, 2),
+	MUX(CLK_MOUT_TOP_SCLK_PERIC1_SPI3, "mout_top_sclk_peric1_spi3",
+	    top_mux_sclk_peric1_spi3_p, CLK_CON_MUX_SCLK_PERIC1_SPI3, 12, 2),
+	MUX(CLK_MOUT_TOP_SCLK_PERIC1_SPI4, "mout_top_sclk_peric1_spi4",
+	    top_mux_sclk_peric1_spi4_p, CLK_CON_MUX_SCLK_PERIC1_SPI4, 12, 2),
+	MUX(CLK_MOUT_TOP_SCLK_PERIC1_SPI5, "mout_top_sclk_peric1_spi5",
+	    top_mux_sclk_peric1_spi5_p, CLK_CON_MUX_SCLK_PERIC1_SPI5, 12, 2),
+	MUX(CLK_MOUT_TOP_SCLK_PERIC1_SPI6, "mout_top_sclk_peric1_spi6",
+	    top_mux_sclk_peric1_spi6_p, CLK_CON_MUX_SCLK_PERIC1_SPI6, 12, 2),
+	MUX(CLK_MOUT_TOP_SCLK_PERIC1_SPI7, "mout_top_sclk_peric1_spi7",
+	    top_mux_sclk_peric1_spi7_p, CLK_CON_MUX_SCLK_PERIC1_SPI7, 12, 2),
+	MUX(CLK_MOUT_TOP_SCLK_PERIC1_UART1, "mout_top_sclk_peric1_uart1",
+	    top_mux_sclk_peric1_uart1_p, CLK_CON_MUX_SCLK_PERIC1_UART1, 12, 2),
+	MUX(CLK_MOUT_TOP_SCLK_PERIC1_UART2, "mout_top_sclk_peric1_uart2",
+	    top_mux_sclk_peric1_uart2_p, CLK_CON_MUX_SCLK_PERIC1_UART2, 12, 2),
+	MUX(CLK_MOUT_TOP_SCLK_PERIC1_UART3, "mout_top_sclk_peric1_uart3",
+	    top_mux_sclk_peric1_uart3_p, CLK_CON_MUX_SCLK_PERIC1_UART3, 12, 2),
+	MUX(CLK_MOUT_TOP_SCLK_PERIC1_UART4, "mout_top_sclk_peric1_uart4",
+	    top_mux_sclk_peric1_uart4_p, CLK_CON_MUX_SCLK_PERIC1_UART4, 12, 2),
+	MUX(CLK_MOUT_TOP_SCLK_PERIC1_UART5, "mout_top_sclk_peric1_uart5",
+	    top_mux_sclk_peric1_uart5_p, CLK_CON_MUX_SCLK_PERIC1_UART5, 12, 2),
+	MUX(CLK_MOUT_TOP_SCLK_CAM1_ISP_SPI0, "mout_top_sclk_cam1_isp_spi0",
+	    top_mux_sclk_cam1_isp_spi0_p, CLK_CON_MUX_SCLK_CAM1_ISP_SPI0, 12,
+	    2),
+	MUX(CLK_MOUT_TOP_SCLK_CAM1_ISP_SPI1, "mout_top_sclk_cam1_isp_spi1",
+	    top_mux_sclk_cam1_isp_spi1_p, CLK_CON_MUX_SCLK_CAM1_ISP_SPI1, 12,
+	    2),
+	MUX(CLK_MOUT_TOP_SCLK_CAM1_ISP_UART, "mout_top_sclk_cam1_isp_uart",
+	    top_mux_sclk_cam1_isp_uart_p, CLK_CON_MUX_SCLK_CAM1_ISP_UART, 12,
+	    1),
+	MUX(CLK_MOUT_TOP_SCLK_AP2CP_MIF_PLL_OUT,
+	    "mout_top_sclk_ap2cp_mif_pll_out", top_mux_sclk_ap2cp_mif_pll_out_p,
+	    CLK_CON_MUX_SCLK_AP2CP_MIF_PLL_OUT, 12, 2),
+	MUX(CLK_MOUT_TOP_ACLK_PSCDC_400, "mout_top_aclk_pscdc_400",
+	    top_mux_aclk_pscdc_400_p, CLK_CON_MUX_ACLK_PSCDC_400, 12, 2),
+	MUX(CLK_MOUT_TOP_SCLK_BUS_PLL_MNGS, "mout_top_sclk_bus_pll_mngs",
+	    top_mux_sclk_bus_pll_mngs_p, CLK_CON_MUX_SCLK_BUS_PLL_MNGS, 12, 2),
+	MUX(CLK_MOUT_TOP_SCLK_BUS_PLL_APOLLO, "mout_top_sclk_bus_pll_apollo",
+	    top_mux_sclk_bus_pll_apollo_p, CLK_CON_MUX_SCLK_BUS_PLL_APOLLO, 12,
+	    2),
+	MUX(CLK_MOUT_TOP_SCLK_BUS_PLL_MIF, "mout_top_sclk_bus_pll_mif",
+	    top_mux_sclk_bus_pll_mif_p, CLK_CON_MUX_SCLK_BUS_PLL_MIF, 12, 3),
+	MUX(CLK_MOUT_TOP_SCLK_BUS_PLL_G3D, "mout_top_sclk_bus_pll_g3d",
+	    top_mux_sclk_bus_pll_g3d_p, CLK_CON_MUX_SCLK_BUS_PLL_G3D, 12, 3),
+	MUX(CLK_MOUT_TOP_SCLK_ISP_SENSOR0, "mout_top_sclk_isp_sensor0",
+	    top_mux_sclk_isp_sensor0_p, CLK_CON_MUX_SCLK_ISP_SENSOR0, 12, 3),
+	MUX(CLK_MOUT_TOP_SCLK_ISP_SENSOR1, "mout_top_sclk_isp_sensor1",
+	    top_mux_sclk_isp_sensor1_p, CLK_CON_MUX_SCLK_ISP_SENSOR1, 12, 3),
+	MUX(CLK_MOUT_TOP_SCLK_ISP_SENSOR2, "mout_top_sclk_isp_sensor2",
+	    top_mux_sclk_isp_sensor2_p, CLK_CON_MUX_SCLK_ISP_SENSOR2, 12, 3),
+	MUX(CLK_MOUT_TOP_SCLK_ISP_SENSOR3, "mout_top_sclk_isp_sensor3",
+	    top_mux_sclk_isp_sensor3_p, CLK_CON_MUX_SCLK_ISP_SENSOR3, 12, 3),
+	MUX(CLK_MOUT_TOP_SCLK_PROMISE_INT, "mout_top_sclk_promise_int",
+	    top_mux_sclk_promise_int_p, CLK_CON_MUX_SCLK_PROMISE_INT, 12, 2),
+	MUX(CLK_MOUT_TOP_SCLK_PROMISE_DISP, "mout_top_sclk_promise_disp",
+	    top_mux_sclk_promise_disp_p, CLK_CON_MUX_SCLK_PROMISE_DISP, 12, 2),
+	MUX(CLK_MOUT_TOP_CP2AP_MIF_CLK_USER, "mout_top_cp2ap_mif_clk_user",
+	    top_mux_cp2ap_mif_clk_user_p, CLK_CON_MUX_CP2AP_MIF_CLK_USER, 12,
+	    1),
+	MUX(CLK_MOUT_TOP_MIF_PLL, "mout_top_mif_pll", top_mux_mif_pll_p,
+	    MIF_CLK_CTRL2, 12, 1),
+	MUX(CLK_MOUT_TOP_BUS_PLL_MIF, "mout_top_bus_pll_mif",
+	    top_mux_bus_pll_mif_p, MIF_CLK_CTRL3, 12, 1),
+	MUX(CLK_MOUT_TOP_ACLK_MIF_PLL, "mout_top_aclk_mif_pll",
+	    top_mux_aclk_mif_pll_p, MIF_CLK_CTRL4, 12, 1),
+};
+
+static const struct samsung_div_clock top_div_clks[] __initconst = {
+	DIV(CLK_DOUT_TOP_ACLK_CCORE_800, "dout_top_aclk_ccore_800",
+	    "umout_top_aclk_ccore_800", CLK_CON_DIV_ACLK_CCORE_800, 0, 4),
+	DIV(CLK_DOUT_TOP_ACLK_CCORE_264, "dout_top_aclk_ccore_264",
+	    "umout_top_aclk_ccore_264", CLK_CON_DIV_ACLK_CCORE_264, 0, 4),
+	DIV(CLK_DOUT_TOP_ACLK_CCORE_G3D_800, "dout_top_aclk_ccore_g3d_800",
+	    "umout_top_aclk_ccore_g3d_800", CLK_CON_DIV_ACLK_CCORE_G3D_800, 0,
+	    4),
+	DIV(CLK_DOUT_TOP_ACLK_CCORE_528, "dout_top_aclk_ccore_528",
+	    "umout_top_aclk_ccore_528", CLK_CON_DIV_ACLK_CCORE_528, 0, 4),
+	DIV(CLK_DOUT_TOP_ACLK_CCORE_132, "dout_top_aclk_ccore_132",
+	    "umout_top_aclk_ccore_132", CLK_CON_DIV_ACLK_CCORE_132, 0, 4),
+	DIV(CLK_DOUT_TOP_PCLK_CCORE_66, "dout_top_pclk_ccore_66",
+	    "umout_top_pclk_ccore_66", CLK_CON_DIV_PCLK_CCORE_66, 0, 4),
+	DIV(CLK_DOUT_TOP_ACLK_BUS0_528, "dout_top_aclk_bus0_528",
+	    "umout_top_aclk_bus0_528", CLK_CON_DIV_ACLK_BUS0_528, 0, 4),
+	DIV(CLK_DOUT_TOP_ACLK_BUS0_200, "dout_top_aclk_bus0_200",
+	    "umout_top_aclk_bus0_200", CLK_CON_DIV_ACLK_BUS0_200, 0, 4),
+	DIV(CLK_DOUT_TOP_PCLK_BUS0_132, "dout_top_pclk_bus0_132",
+	    "umout_top_pclk_bus0_132", CLK_CON_DIV_PCLK_BUS0_132, 0, 4),
+	DIV(CLK_DOUT_TOP_ACLK_BUS1_528, "dout_top_aclk_bus1_528",
+	    "umout_top_aclk_bus1_528", CLK_CON_DIV_ACLK_BUS1_528, 0, 4),
+	DIV(CLK_DOUT_TOP_PCLK_BUS1_132, "dout_top_pclk_bus1_132",
+	    "umout_top_pclk_bus1_132", CLK_CON_DIV_PCLK_BUS1_132, 0, 4),
+	DIV(CLK_DOUT_TOP_ACLK_DISP0_0_400, "dout_top_aclk_disp0_0_400",
+	    "umout_top_aclk_disp0_0_400", CLK_CON_DIV_ACLK_DISP0_0_400, 0, 4),
+	DIV(CLK_DOUT_TOP_ACLK_DISP0_1_400, "dout_top_aclk_disp0_1_400",
+	    "umout_top_aclk_disp0_1_400", CLK_CON_DIV_ACLK_DISP0_1_400, 0, 4),
+	DIV(CLK_DOUT_TOP_ACLK_DISP1_0_400, "dout_top_aclk_disp1_0_400",
+	    "umout_top_aclk_disp1_0_400", CLK_CON_DIV_ACLK_DISP1_0_400, 0, 4),
+	DIV(CLK_DOUT_TOP_ACLK_DISP1_1_400, "dout_top_aclk_disp1_1_400",
+	    "umout_top_aclk_disp1_1_400", CLK_CON_DIV_ACLK_DISP1_1_400, 0, 4),
+	DIV(CLK_DOUT_TOP_ACLK_MFC_600, "dout_top_aclk_mfc_600",
+	    "umout_top_aclk_mfc_600", CLK_CON_DIV_ACLK_MFC_600, 0, 4),
+	DIV(CLK_DOUT_TOP_ACLK_MSCL0_528, "dout_top_aclk_mscl0_528",
+	    "umout_top_aclk_mscl0_528", CLK_CON_DIV_ACLK_MSCL0_528, 0, 4),
+	DIV(CLK_DOUT_TOP_ACLK_MSCL1_528, "dout_top_aclk_mscl1_528",
+	    "umout_top_aclk_mscl1_528", CLK_CON_DIV_ACLK_MSCL1_528, 0, 4),
+	DIV(CLK_DOUT_TOP_ACLK_IMEM_266, "dout_top_aclk_imem_266",
+	    "umout_top_aclk_imem_266", CLK_CON_DIV_ACLK_IMEM_266, 0, 4),
+	DIV(CLK_DOUT_TOP_ACLK_IMEM_200, "dout_top_aclk_imem_200",
+	    "umout_top_aclk_imem_200", CLK_CON_DIV_ACLK_IMEM_200, 0, 4),
+	DIV(CLK_DOUT_TOP_ACLK_IMEM_100, "dout_top_aclk_imem_100",
+	    "umout_top_aclk_imem_100", CLK_CON_DIV_ACLK_IMEM_100, 0, 4),
+	DIV(CLK_DOUT_TOP_ACLK_FSYS0_200, "dout_top_aclk_fsys0_200",
+	    "umout_top_aclk_fsys0_200", CLK_CON_DIV_ACLK_FSYS0_200, 0, 4),
+	DIV(CLK_DOUT_TOP_ACLK_FSYS1_200, "dout_top_aclk_fsys1_200",
+	    "umout_top_aclk_fsys1_200", CLK_CON_DIV_ACLK_FSYS1_200, 0, 4),
+	DIV(CLK_DOUT_TOP_ACLK_PERIS_66, "dout_top_aclk_peris_66",
+	    "umout_top_aclk_peris_66", CLK_CON_DIV_ACLK_PERIS_66, 0, 4),
+	DIV(CLK_DOUT_TOP_ACLK_PERIC0_66, "dout_top_aclk_peric0_66",
+	    "umout_top_aclk_peric0_66", CLK_CON_DIV_ACLK_PERIC0_66, 0, 4),
+	DIV(CLK_DOUT_TOP_ACLK_PERIC1_66, "dout_top_aclk_peric1_66",
+	    "umout_top_aclk_peric1_66", CLK_CON_DIV_ACLK_PERIC1_66, 0, 4),
+	DIV(CLK_DOUT_TOP_ACLK_ISP0_ISP0_528, "dout_top_aclk_isp0_isp0_528",
+	    "umout_top_aclk_isp0_isp0_528", CLK_CON_DIV_ACLK_ISP0_ISP0_528, 0,
+	    4),
+	DIV(CLK_DOUT_TOP_ACLK_ISP0_TPU_400, "dout_top_aclk_isp0_tpu_400",
+	    "umout_top_aclk_isp0_tpu_400", CLK_CON_DIV_ACLK_ISP0_TPU_400, 0, 4),
+	DIV(CLK_DOUT_TOP_ACLK_ISP0_TREX_528, "dout_top_aclk_isp0_trex_528",
+	    "umout_top_aclk_isp0_trex_528", CLK_CON_DIV_ACLK_ISP0_TREX_528, 0,
+	    4),
+	DIV(CLK_DOUT_TOP_ACLK_ISP0_PXL_ASBS_IS_C_FROM_IS_D,
+	    "dout_top_aclk_isp0_pxl_asbs_is_c_from_is_d",
+	    "umout_top_aclk_isp0_pxl_asbs_is_c_from_is_d",
+	    CLK_CON_DIV_ACLK_ISP0_PXL_ASBS_IS_C_FROM_IS_D_TOP, 0, 4),
+	DIV(CLK_DOUT_TOP_ACLK_ISP1_ISP1_468, "dout_top_aclk_isp1_isp1_468",
+	    "umout_top_aclk_isp1_isp1_468", CLK_CON_DIV_ACLK_ISP1_ISP1_468, 0,
+	    4),
+	DIV(CLK_DOUT_TOP_ACLK_CAM0_CSIS0_414, "dout_top_aclk_cam0_csis0_414",
+	    "umout_top_aclk_cam0_csis0_414", CLK_CON_DIV_ACLK_CAM0_CSIS0_414, 0,
+	    4),
+	DIV(CLK_DOUT_TOP_ACLK_CAM0_CSIS1_168, "dout_top_aclk_cam0_csis1_168",
+	    "umout_top_aclk_cam0_csis1_168", CLK_CON_DIV_ACLK_CAM0_CSIS1_168, 0,
+	    4),
+	DIV(CLK_DOUT_TOP_ACLK_CAM0_CSIS2_234, "dout_top_aclk_cam0_csis2_234",
+	    "umout_top_aclk_cam0_csis2_234", CLK_CON_DIV_ACLK_CAM0_CSIS2_234, 0,
+	    4),
+	DIV(CLK_DOUT_TOP_ACLK_CAM0_3AA0_414, "dout_top_aclk_cam0_3aa0_414",
+	    "umout_top_aclk_cam0_3aa0_414", CLK_CON_DIV_ACLK_CAM0_3AA0_414, 0,
+	    4),
+	DIV(CLK_DOUT_TOP_ACLK_CAM0_3AA1_414, "dout_top_aclk_cam0_3aa1_414",
+	    "umout_top_aclk_cam0_3aa1_414", CLK_CON_DIV_ACLK_CAM0_3AA1_414, 0,
+	    4),
+	DIV(CLK_DOUT_TOP_ACLK_CAM0_CSIS3_132, "dout_top_aclk_cam0_csis3_132",
+	    "umout_top_aclk_cam0_csis3_132", CLK_CON_DIV_ACLK_CAM0_CSIS3_132, 0,
+	    4),
+	DIV(CLK_DOUT_TOP_ACLK_CAM0_TREX_528, "dout_top_aclk_cam0_trex_528",
+	    "umout_top_aclk_cam0_trex_528", CLK_CON_DIV_ACLK_CAM0_TREX_528, 0,
+	    4),
+	DIV(CLK_DOUT_TOP_ACLK_CAM1_ARM_672, "dout_top_aclk_cam1_arm_672",
+	    "umout_top_aclk_cam1_arm_672", CLK_CON_DIV_ACLK_CAM1_ARM_672, 0, 4),
+	DIV(CLK_DOUT_TOP_ACLK_CAM1_TREX_VRA_528,
+	    "dout_top_aclk_cam1_trex_vra_528",
+	    "umout_top_aclk_cam1_trex_vra_528",
+	    CLK_CON_DIV_ACLK_CAM1_TREX_VRA_528, 0, 4),
+	DIV(CLK_DOUT_TOP_ACLK_CAM1_TREX_B_528, "dout_top_aclk_cam1_trex_b_528",
+	    "umout_top_aclk_cam1_trex_b_528", CLK_CON_DIV_ACLK_CAM1_TREX_B_528,
+	    0, 4),
+	DIV(CLK_DOUT_TOP_ACLK_CAM1_BUS_264, "dout_top_aclk_cam1_bus_264",
+	    "umout_top_aclk_cam1_bus_264", CLK_CON_DIV_ACLK_CAM1_BUS_264, 0, 4),
+	DIV(CLK_DOUT_TOP_ACLK_CAM1_PERI_84, "dout_top_aclk_cam1_peri_84",
+	    "umout_top_aclk_cam1_peri_84", CLK_CON_DIV_ACLK_CAM1_PERI_84, 0, 4),
+	DIV(CLK_DOUT_TOP_ACLK_CAM1_CSIS2_414, "dout_top_aclk_cam1_csis2_414",
+	    "umout_top_aclk_cam1_csis2_414", CLK_CON_DIV_ACLK_CAM1_CSIS2_414, 0,
+	    8),
+	DIV(CLK_DOUT_TOP_ACLK_CAM1_CSIS3_132, "dout_top_aclk_cam1_csis3_132",
+	    "umout_top_aclk_cam1_csis3_132", CLK_CON_DIV_ACLK_CAM1_CSIS3_132, 0,
+	    4),
+	DIV(CLK_DOUT_TOP_ACLK_CAM1_SCL_566, "dout_top_aclk_cam1_scl_566",
+	    "umout_top_aclk_cam1_scl_566", CLK_CON_DIV_ACLK_CAM1_SCL_566, 0, 4),
+	DIV(CLK_DOUT_TOP_SCLK_DISP0_DECON0_ECLK0,
+	    "dout_top_sclk_disp0_decon0_eclk0",
+	    "umout_top_sclk_disp0_decon0_eclk0",
+	    CLK_CON_DIV_SCLK_DISP0_DECON0_ECLK0, 0, 4),
+	DIV(CLK_DOUT_TOP_SCLK_DISP0_DECON0_VCLK0,
+	    "dout_top_sclk_disp0_decon0_vclk0",
+	    "umout_top_sclk_disp0_decon0_vclk0",
+	    CLK_CON_DIV_SCLK_DISP0_DECON0_VCLK0, 0, 4),
+	DIV(CLK_DOUT_TOP_SCLK_DISP0_DECON0_VCLK1,
+	    "dout_top_sclk_disp0_decon0_vclk1",
+	    "umout_top_sclk_disp0_decon0_vclk1",
+	    CLK_CON_DIV_SCLK_DISP0_DECON0_VCLK1, 0, 4),
+	DIV(CLK_DOUT_TOP_SCLK_DISP0_HDMI_AUDIO,
+	    "dout_top_sclk_disp0_hdmi_audio", "umout_top_sclk_disp0_hdmi_audio",
+	    CLK_CON_DIV_SCLK_DISP0_HDMI_AUDIO, 0, 4),
+	DIV(CLK_DOUT_TOP_SCLK_DISP1_DECON1_ECLK0,
+	    "dout_top_sclk_disp1_decon1_eclk0",
+	    "umout_top_sclk_disp1_decon1_eclk0",
+	    CLK_CON_DIV_SCLK_DISP1_DECON1_ECLK0, 0, 4),
+	DIV(CLK_DOUT_TOP_SCLK_DISP1_DECON1_ECLK1,
+	    "dout_top_sclk_disp1_decon1_eclk1",
+	    "umout_top_sclk_disp1_decon1_eclk1",
+	    CLK_CON_DIV_SCLK_DISP1_DECON1_ECLK1, 0, 4),
+	DIV(CLK_DOUT_TOP_SCLK_FSYS0_USBDRD30, "dout_top_sclk_fsys0_usbdrd30",
+	    "umout_top_sclk_fsys0_usbdrd30", CLK_CON_DIV_SCLK_FSYS0_USBDRD30, 0,
+	    4),
+	DIV(CLK_DOUT_TOP_SCLK_FSYS0_MMC0, "dout_top_sclk_fsys0_mmc0",
+	    "umout_top_sclk_fsys0_mmc0", CLK_CON_DIV_SCLK_FSYS0_MMC0, 0, 10),
+	DIV(CLK_DOUT_TOP_SCLK_FSYS0_UFSUNIPRO20,
+	    "dout_top_sclk_fsys0_ufsunipro20",
+	    "umout_top_sclk_fsys0_ufsunipro20",
+	    CLK_CON_DIV_SCLK_FSYS0_UFSUNIPRO20, 0, 6),
+	DIV(CLK_DOUT_TOP_SCLK_FSYS0_PHY_24M, "dout_top_sclk_fsys0_phy_24m",
+	    "umout_top_sclk_fsys0_phy_24m", CLK_CON_DIV_SCLK_FSYS0_PHY_24M, 0,
+	    6),
+	DIV(CLK_DOUT_TOP_SCLK_FSYS0_UFSUNIPRO_CFG,
+	    "dout_top_sclk_fsys0_ufsunipro_cfg",
+	    "umout_top_sclk_fsys0_ufsunipro_cfg",
+	    CLK_CON_DIV_SCLK_FSYS0_UFSUNIPRO_CFG, 0, 4),
+	DIV(CLK_DOUT_TOP_SCLK_FSYS1_MMC2, "dout_top_sclk_fsys1_mmc2",
+	    "umout_top_sclk_fsys1_mmc2", CLK_CON_DIV_SCLK_FSYS1_MMC2, 0, 10),
+	DIV(CLK_DOUT_TOP_SCLK_FSYS1_UFSUNIPRO20,
+	    "dout_top_sclk_fsys1_ufsunipro20",
+	    "umout_top_sclk_fsys1_ufsunipro20",
+	    CLK_CON_DIV_SCLK_FSYS1_UFSUNIPRO20, 0, 6),
+	DIV(CLK_DOUT_TOP_SCLK_FSYS1_PCIE_PHY, "dout_top_sclk_fsys1_pcie_phy",
+	    "umout_top_sclk_fsys1_pcie_phy", CLK_CON_DIV_SCLK_FSYS1_PCIE_PHY, 0,
+	    6),
+	DIV(CLK_DOUT_TOP_SCLK_FSYS1_UFSUNIPRO_CFG,
+	    "dout_top_sclk_fsys1_ufsunipro_cfg",
+	    "umout_top_sclk_fsys1_ufsunipro_cfg",
+	    CLK_CON_DIV_SCLK_FSYS1_UFSUNIPRO_CFG, 0, 4),
+	DIV(CLK_DOUT_TOP_SCLK_PERIC0_UART0, "dout_top_sclk_peric0_uart0",
+	    "umout_top_sclk_peric0_uart0", CLK_CON_DIV_SCLK_PERIC0_UART0, 0, 4),
+	DIV(CLK_DOUT_TOP_SCLK_PERIC1_SPI0, "dout_top_sclk_peric1_spi0",
+	    "umout_top_sclk_peric1_spi0", CLK_CON_DIV_SCLK_PERIC1_SPI0, 0, 4),
+	DIV(CLK_DOUT_TOP_SCLK_PERIC1_SPI1, "dout_top_sclk_peric1_spi1",
+	    "umout_top_sclk_peric1_spi1", CLK_CON_DIV_SCLK_PERIC1_SPI1, 0, 4),
+	DIV(CLK_DOUT_TOP_SCLK_PERIC1_SPI2, "dout_top_sclk_peric1_spi2",
+	    "umout_top_sclk_peric1_spi2", CLK_CON_DIV_SCLK_PERIC1_SPI2, 0, 4),
+	DIV(CLK_DOUT_TOP_SCLK_PERIC1_SPI3, "dout_top_sclk_peric1_spi3",
+	    "umout_top_sclk_peric1_spi3", CLK_CON_DIV_SCLK_PERIC1_SPI3, 0, 4),
+	DIV(CLK_DOUT_TOP_SCLK_PERIC1_SPI4, "dout_top_sclk_peric1_spi4",
+	    "umout_top_sclk_peric1_spi4", CLK_CON_DIV_SCLK_PERIC1_SPI4, 0, 4),
+	DIV(CLK_DOUT_TOP_SCLK_PERIC1_SPI5, "dout_top_sclk_peric1_spi5",
+	    "umout_top_sclk_peric1_spi5", CLK_CON_DIV_SCLK_PERIC1_SPI5, 0, 4),
+	DIV(CLK_DOUT_TOP_SCLK_PERIC1_SPI6, "dout_top_sclk_peric1_spi6",
+	    "umout_top_sclk_peric1_spi6", CLK_CON_DIV_SCLK_PERIC1_SPI6, 0, 4),
+	DIV(CLK_DOUT_TOP_SCLK_PERIC1_SPI7, "dout_top_sclk_peric1_spi7",
+	    "umout_top_sclk_peric1_spi7", CLK_CON_DIV_SCLK_PERIC1_SPI7, 0, 4),
+	DIV(CLK_DOUT_TOP_SCLK_PERIC1_UART1, "dout_top_sclk_peric1_uart1",
+	    "umout_top_sclk_peric1_uart1", CLK_CON_DIV_SCLK_PERIC1_UART1, 0, 4),
+	DIV(CLK_DOUT_TOP_SCLK_PERIC1_UART2, "dout_top_sclk_peric1_uart2",
+	    "umout_top_sclk_peric1_uart2", CLK_CON_DIV_SCLK_PERIC1_UART2, 0, 4),
+	DIV(CLK_DOUT_TOP_SCLK_PERIC1_UART3, "dout_top_sclk_peric1_uart3",
+	    "umout_top_sclk_peric1_uart3", CLK_CON_DIV_SCLK_PERIC1_UART3, 0, 4),
+	DIV(CLK_DOUT_TOP_SCLK_PERIC1_UART4, "dout_top_sclk_peric1_uart4",
+	    "umout_top_sclk_peric1_uart4", CLK_CON_DIV_SCLK_PERIC1_UART4, 0, 4),
+	DIV(CLK_DOUT_TOP_SCLK_PERIC1_UART5, "dout_top_sclk_peric1_uart5",
+	    "umout_top_sclk_peric1_uart5", CLK_CON_DIV_SCLK_PERIC1_UART5, 0, 4),
+	DIV(CLK_DOUT_TOP_SCLK_CAM1_ISP_SPI0, "dout_top_sclk_cam1_isp_spi0",
+	    "umout_top_sclk_cam1_isp_spi0", CLK_CON_DIV_SCLK_CAM1_ISP_SPI0, 0,
+	    4),
+	DIV(CLK_DOUT_TOP_SCLK_CAM1_ISP_SPI1, "dout_top_sclk_cam1_isp_spi1",
+	    "umout_top_sclk_cam1_isp_spi1", CLK_CON_DIV_SCLK_CAM1_ISP_SPI1, 0,
+	    4),
+	DIV(CLK_DOUT_TOP_SCLK_CAM1_ISP_UART, "dout_top_sclk_cam1_isp_uart",
+	    "umout_top_sclk_cam1_isp_uart", CLK_CON_DIV_SCLK_CAM1_ISP_UART, 0,
+	    4),
+	DIV(CLK_DOUT_TOP_SCLK_AP2CP_MIF_PLL_OUT,
+	    "dout_top_sclk_ap2cp_mif_pll_out",
+	    "umout_top_sclk_ap2cp_mif_pll_out",
+	    CLK_CON_DIV_SCLK_AP2CP_MIF_PLL_OUT, 0, 4),
+	DIV(CLK_DOUT_TOP_ACLK_PSCDC_400, "dout_top_aclk_pscdc_400",
+	    "umout_top_aclk_pscdc_400", CLK_CON_DIV_ACLK_PSCDC_400, 0, 4),
+	DIV(CLK_DOUT_TOP_SCLK_BUS_PLL_MNGS, "dout_top_sclk_bus_pll_mngs",
+	    "umout_top_sclk_bus_pll_mngs", CLK_CON_DIV_SCLK_BUS_PLL_MNGS, 0, 4),
+	DIV(CLK_DOUT_TOP_SCLK_BUS_PLL_APOLLO, "dout_top_sclk_bus_pll_apollo",
+	    "umout_top_sclk_bus_pll_apollo", CLK_CON_DIV_SCLK_BUS_PLL_APOLLO, 0,
+	    4),
+	DIV(CLK_DOUT_TOP_SCLK_BUS_PLL_MIF, "dout_top_sclk_bus_pll_mif",
+	    "umout_top_sclk_bus_pll_mif", CLK_CON_DIV_SCLK_BUS_PLL_MIF, 0, 4),
+	DIV(CLK_DOUT_TOP_SCLK_BUS_PLL_G3D, "dout_top_sclk_bus_pll_g3d",
+	    "umout_top_sclk_bus_pll_g3d", CLK_CON_DIV_SCLK_BUS_PLL_G3D, 0, 4),
+	DIV(CLK_DOUT_TOP_SCLK_ISP_SENSOR0, "dout_top_sclk_isp_sensor0",
+	    "umout_top_sclk_isp_sensor0", CLK_CON_DIV_SCLK_ISP_SENSOR0, 0, 8),
+	DIV(CLK_DOUT_TOP_SCLK_ISP_SENSOR1, "dout_top_sclk_isp_sensor1",
+	    "umout_top_sclk_isp_sensor1", CLK_CON_DIV_SCLK_ISP_SENSOR1, 0, 8),
+	DIV(CLK_DOUT_TOP_SCLK_ISP_SENSOR2, "dout_top_sclk_isp_sensor2",
+	    "umout_top_sclk_isp_sensor2", CLK_CON_DIV_SCLK_ISP_SENSOR2, 0, 8),
+	DIV(CLK_DOUT_TOP_SCLK_ISP_SENSOR3, "dout_top_sclk_isp_sensor3",
+	    "umout_top_sclk_isp_sensor3", CLK_CON_DIV_SCLK_ISP_SENSOR3, 0, 8),
+	DIV(CLK_DOUT_TOP_SCLK_PROMISE_INT, "dout_top_sclk_promise_int",
+	    "umout_top_sclk_promise_int", CLK_CON_DIV_SCLK_PROMISE_INT, 0, 4),
+	DIV(CLK_DOUT_TOP_SCLK_PROMISE_DISP, "dout_top_sclk_promise_disp",
+	    "umout_top_sclk_promise_disp", CLK_CON_DIV_SCLK_PROMISE_DISP, 0, 4),
+};
+
+static const
+struct samsung_fixed_factor_clock top_fixed_factor_clks[] __initconst = {
+	FFACTOR(CLK_TOP_FF_BUS0_PLL_DIV2, "top_ff_bus0_pll_div2",
+		"mout_top_bus0_pll", 1, 2, 0),
+	FFACTOR(CLK_TOP_FF_BUS1_PLL_DIV2, "top_ff_bus1_pll_div2",
+		"mout_top_bus1_pll", 1, 2, 0),
+	FFACTOR(CLK_TOP_FF_BUS2_PLL_DIV2, "top_ff_bus2_pll_div2",
+		"mout_top_bus2_pll", 1, 2, 0),
+	FFACTOR(CLK_TOP_FF_BUS3_PLL_DIV2, "top_ff_bus3_pll_div2",
+		"mout_top_bus3_pll", 1, 2, 0),
+	FFACTOR(CLK_TOP_FF_BUS3_PLL_DIV4, "top_ff_bus3_pll_div4",
+		"mout_top_bus3_pll", 1, 4, 0),
+	FFACTOR(CLK_TOP_FF_MFC_PLL_DIV2, "top_ff_mfc_pll_div2",
+		"mout_top_mfc_pll", 1, 2, 0),
+	FFACTOR(CLK_TOP_FF_ISP_PLL_DIV2, "top_ff_isp_pll_div2",
+		"mout_top_isp_pll", 1, 2, 0),
+};
+
+static const struct samsung_gate_clock top_gate_clks[] __initconst = {
+	/* these gates are very sensitive, so keep them open  */
+	GATE(CLK_UMOUT_TOP_BUS0_PLL, "umout_top_bus0_pll", "mout_top_bus0_pll",
+	     CLK_CON_MUX_BUS0_PLL, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_BUS1_PLL, "umout_top_bus1_pll", "mout_top_bus1_pll",
+	     CLK_CON_MUX_BUS1_PLL, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_BUS2_PLL, "umout_top_bus2_pll", "mout_top_bus2_pll",
+	     CLK_CON_MUX_BUS2_PLL, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_BUS3_PLL, "umout_top_bus3_pll", "mout_top_bus3_pll",
+	     CLK_CON_MUX_BUS3_PLL, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_MFC_PLL, "umout_top_mfc_pll", "mout_top_mfc_pll",
+	     CLK_CON_MUX_MFC_PLL, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ISP_PLL, "umout_top_isp_pll", "mout_top_isp_pll",
+	     CLK_CON_MUX_ISP_PLL, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_AUD_PLL, "umout_top_aud_pll", "mout_top_aud_pll",
+	     CLK_CON_MUX_AUD_PLL, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_G3D_PLL, "umout_top_g3d_pll", "mout_top_g3d_pll",
+	     CLK_CON_MUX_G3D_PLL, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_BUS0_PLL, "umout_top_sclk_bus0_pll",
+	     "mout_top_sclk_bus0_pll", CLK_CON_MUX_SCLK_BUS0_PLL, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_BUS1_PLL, "umout_top_sclk_bus1_pll",
+	     "mout_top_sclk_bus1_pll", CLK_CON_MUX_SCLK_BUS1_PLL, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_BUS2_PLL, "umout_top_sclk_bus2_pll",
+	     "mout_top_sclk_bus2_pll", CLK_CON_MUX_SCLK_BUS2_PLL, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_BUS3_PLL, "umout_top_sclk_bus3_pll",
+	     "mout_top_sclk_bus3_pll", CLK_CON_MUX_SCLK_BUS3_PLL, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_MFC_PLL, "umout_top_sclk_mfc_pll",
+	     "mout_top_sclk_mfc_pll", CLK_CON_MUX_SCLK_MFC_PLL, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_ISP_PLL, "umout_top_sclk_isp_pll",
+	     "mout_top_sclk_isp_pll", CLK_CON_MUX_SCLK_ISP_PLL, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_CCORE_800, "umout_top_aclk_ccore_800",
+	     "mout_top_aclk_ccore_800", CLK_CON_MUX_ACLK_CCORE_800, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_CCORE_264, "umout_top_aclk_ccore_264",
+	     "mout_top_aclk_ccore_264", CLK_CON_MUX_ACLK_CCORE_264, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_CCORE_G3D_800, "umout_top_aclk_ccore_g3d_800",
+	     "mout_top_aclk_ccore_g3d_800", CLK_CON_MUX_ACLK_CCORE_G3D_800, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_CCORE_528, "umout_top_aclk_ccore_528",
+	     "mout_top_aclk_ccore_528", CLK_CON_MUX_ACLK_CCORE_528, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_CCORE_132, "umout_top_aclk_ccore_132",
+	     "mout_top_aclk_ccore_132", CLK_CON_MUX_ACLK_CCORE_132, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_PCLK_CCORE_66, "umout_top_pclk_ccore_66",
+	     "mout_top_pclk_ccore_66", CLK_CON_MUX_PCLK_CCORE_66, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_BUS0_528, "umout_top_aclk_bus0_528",
+	     "mout_top_aclk_bus0_528", CLK_CON_MUX_ACLK_BUS0_528, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_BUS0_200, "umout_top_aclk_bus0_200",
+	     "mout_top_aclk_bus0_200", CLK_CON_MUX_ACLK_BUS0_200, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_PCLK_BUS0_132, "umout_top_pclk_bus0_132",
+	     "mout_top_pclk_bus0_132", CLK_CON_MUX_PCLK_BUS0_132, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_BUS1_528, "umout_top_aclk_bus1_528",
+	     "mout_top_aclk_bus1_528", CLK_CON_MUX_ACLK_BUS1_528, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_PCLK_BUS1_132, "umout_top_pclk_bus1_132",
+	     "mout_top_pclk_bus1_132", CLK_CON_MUX_PCLK_BUS1_132, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_DISP0_0_400, "umout_top_aclk_disp0_0_400",
+	     "mout_top_aclk_disp0_0_400", CLK_CON_MUX_ACLK_DISP0_0_400, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_DISP0_1_400, "umout_top_aclk_disp0_1_400",
+	     "mout_top_aclk_disp0_1_400", CLK_CON_MUX_ACLK_DISP0_1_400_TOP, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_DISP1_0_400, "umout_top_aclk_disp1_0_400",
+	     "mout_top_aclk_disp1_0_400", CLK_CON_MUX_ACLK_DISP1_0_400, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_DISP1_1_400, "umout_top_aclk_disp1_1_400",
+	     "mout_top_aclk_disp1_1_400", CLK_CON_MUX_ACLK_DISP1_1_400_TOP, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_MFC_600, "umout_top_aclk_mfc_600",
+	     "mout_top_aclk_mfc_600", CLK_CON_MUX_ACLK_MFC_600, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_MSCL0_528, "umout_top_aclk_mscl0_528",
+	     "mout_top_aclk_mscl0_528", CLK_CON_MUX_ACLK_MSCL0_528, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_MSCL1_528, "umout_top_aclk_mscl1_528",
+	     "mout_top_aclk_mscl1_528", CLK_CON_MUX_ACLK_MSCL1_528_TOP, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_IMEM_266, "umout_top_aclk_imem_266",
+	     "mout_top_aclk_imem_266", CLK_CON_MUX_ACLK_IMEM_266, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_IMEM_200, "umout_top_aclk_imem_200",
+	     "mout_top_aclk_imem_200", CLK_CON_MUX_ACLK_IMEM_200, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_IMEM_100, "umout_top_aclk_imem_100",
+	     "mout_top_aclk_imem_100", CLK_CON_MUX_ACLK_IMEM_100, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_FSYS0_200, "umout_top_aclk_fsys0_200",
+	     "mout_top_aclk_fsys0_200", CLK_CON_MUX_ACLK_FSYS0_200, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_FSYS1_200, "umout_top_aclk_fsys1_200",
+	     "mout_top_aclk_fsys1_200", CLK_CON_MUX_ACLK_FSYS1_200, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_PERIS_66, "umout_top_aclk_peris_66",
+	     "mout_top_aclk_peris_66", CLK_CON_MUX_ACLK_PERIS_66, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_PERIC0_66, "umout_top_aclk_peric0_66",
+	     "mout_top_aclk_peric0_66", CLK_CON_MUX_ACLK_PERIC0_66, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_PERIC1_66, "umout_top_aclk_peric1_66",
+	     "mout_top_aclk_peric1_66", CLK_CON_MUX_ACLK_PERIC1_66, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_ISP0_ISP0_528, "umout_top_aclk_isp0_isp0_528",
+	     "mout_top_aclk_isp0_isp0_528", CLK_CON_MUX_ACLK_ISP0_ISP0_528, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_ISP0_TPU_400, "umout_top_aclk_isp0_tpu_400",
+	     "mout_top_aclk_isp0_tpu_400", CLK_CON_MUX_ACLK_ISP0_TPU_400, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_ISP0_TREX_528, "umout_top_aclk_isp0_trex_528",
+	     "mout_top_aclk_isp0_trex_528", CLK_CON_MUX_ACLK_ISP0_TREX_528, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_ISP0_PXL_ASBS_IS_C_FROM_IS_D,
+	     "umout_top_aclk_isp0_pxl_asbs_is_c_from_is_d",
+	     "mout_top_aclk_isp0_pxl_asbs_is_c_from_is_d",
+	     CLK_CON_MUX_ACLK_ISP0_PXL_ASBS_IS_C_FROM_IS_D_TOP, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_ISP1_ISP1_468, "umout_top_aclk_isp1_isp1_468",
+	     "mout_top_aclk_isp1_isp1_468", CLK_CON_MUX_ACLK_ISP1_ISP1_468, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_CAM0_CSIS0_414, "umout_top_aclk_cam0_csis0_414",
+	     "mout_top_aclk_cam0_csis0_414", CLK_CON_MUX_ACLK_CAM0_CSIS0_414,
+	     21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_CAM0_CSIS1_168, "umout_top_aclk_cam0_csis1_168",
+	     "mout_top_aclk_cam0_csis1_168", CLK_CON_MUX_ACLK_CAM0_CSIS1_168,
+	     21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_CAM0_CSIS2_234, "umout_top_aclk_cam0_csis2_234",
+	     "mout_top_aclk_cam0_csis2_234", CLK_CON_MUX_ACLK_CAM0_CSIS2_234,
+	     21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_CAM0_3AA0_414, "umout_top_aclk_cam0_3aa0_414",
+	     "mout_top_aclk_cam0_3aa0_414", CLK_CON_MUX_ACLK_CAM0_3AA0_414, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_CAM0_3AA1_414, "umout_top_aclk_cam0_3aa1_414",
+	     "mout_top_aclk_cam0_3aa1_414", CLK_CON_MUX_ACLK_CAM0_3AA1_414, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_CAM0_CSIS3_132, "umout_top_aclk_cam0_csis3_132",
+	     "mout_top_aclk_cam0_csis3_132", CLK_CON_MUX_ACLK_CAM0_CSIS3_132,
+	     21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_CAM0_TREX_528, "umout_top_aclk_cam0_trex_528",
+	     "mout_top_aclk_cam0_trex_528", CLK_CON_MUX_ACLK_CAM0_TREX_528, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_CAM1_ARM_672, "umout_top_aclk_cam1_arm_672",
+	     "mout_top_aclk_cam1_arm_672", CLK_CON_MUX_ACLK_CAM1_ARM_672, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_CAM1_TREX_VRA_528,
+	     "umout_top_aclk_cam1_trex_vra_528",
+	     "mout_top_aclk_cam1_trex_vra_528",
+	     CLK_CON_MUX_ACLK_CAM1_TREX_VRA_528, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_CAM1_TREX_B_528,
+	     "umout_top_aclk_cam1_trex_b_528", "mout_top_aclk_cam1_trex_b_528",
+	     CLK_CON_MUX_ACLK_CAM1_TREX_B_528, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_CAM1_BUS_264, "umout_top_aclk_cam1_bus_264",
+	     "mout_top_aclk_cam1_bus_264", CLK_CON_MUX_ACLK_CAM1_BUS_264, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_CAM1_PERI_84, "umout_top_aclk_cam1_peri_84",
+	     "mout_top_aclk_cam1_peri_84", CLK_CON_MUX_ACLK_CAM1_PERI_84, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_CAM1_CSIS2_414, "umout_top_aclk_cam1_csis2_414",
+	     "mout_top_aclk_cam1_csis2_414", CLK_CON_MUX_ACLK_CAM1_CSIS2_414,
+	     21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_CAM1_CSIS3_132, "umout_top_aclk_cam1_csis3_132",
+	     "mout_top_aclk_cam1_csis3_132", CLK_CON_MUX_ACLK_CAM1_CSIS3_132,
+	     21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_CAM1_SCL_566, "umout_top_aclk_cam1_scl_566",
+	     "mout_top_aclk_cam1_scl_566", CLK_CON_MUX_ACLK_CAM1_SCL_566, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_DISP0_DECON0_ECLK0,
+	     "umout_top_sclk_disp0_decon0_eclk0",
+	     "mout_top_sclk_disp0_decon0_eclk0",
+	     CLK_CON_MUX_SCLK_DISP0_DECON0_ECLK0_TOP, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_DISP0_DECON0_VCLK0,
+	     "umout_top_sclk_disp0_decon0_vclk0",
+	     "mout_top_sclk_disp0_decon0_vclk0",
+	     CLK_CON_MUX_SCLK_DISP0_DECON0_VCLK0_TOP, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_DISP0_DECON0_VCLK1,
+	     "umout_top_sclk_disp0_decon0_vclk1",
+	     "mout_top_sclk_disp0_decon0_vclk1",
+	     CLK_CON_MUX_SCLK_DISP0_DECON0_VCLK1_TOP, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_DISP0_HDMI_AUDIO,
+	     "umout_top_sclk_disp0_hdmi_audio",
+	     "mout_top_sclk_disp0_hdmi_audio",
+	     CLK_CON_MUX_SCLK_DISP0_HDMI_AUDIO_TOP, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_DISP1_DECON1_ECLK0,
+	     "umout_top_sclk_disp1_decon1_eclk0",
+	     "mout_top_sclk_disp1_decon1_eclk0",
+	     CLK_CON_MUX_SCLK_DISP1_DECON1_ECLK0_TOP, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_DISP1_DECON1_ECLK1,
+	     "umout_top_sclk_disp1_decon1_eclk1",
+	     "mout_top_sclk_disp1_decon1_eclk1",
+	     CLK_CON_MUX_SCLK_DISP1_DECON1_ECLK1_TOP, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_FSYS0_USBDRD30, "umout_top_sclk_fsys0_usbdrd30",
+	     "mout_top_sclk_fsys0_usbdrd30", CLK_CON_MUX_SCLK_FSYS0_USBDRD30,
+	     21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_FSYS0_MMC0, "umout_top_sclk_fsys0_mmc0",
+	     "mout_top_sclk_fsys0_mmc0", CLK_CON_MUX_SCLK_FSYS0_MMC0, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_FSYS0_UFSUNIPRO20,
+	     "umout_top_sclk_fsys0_ufsunipro20",
+	     "mout_top_sclk_fsys0_ufsunipro20",
+	     CLK_CON_MUX_SCLK_FSYS0_UFSUNIPRO20, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_FSYS0_PHY_24M, "umout_top_sclk_fsys0_phy_24m",
+	     "mout_top_sclk_fsys0_phy_24m", CLK_CON_MUX_SCLK_FSYS0_PHY_24M, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_FSYS0_UFSUNIPRO_CFG,
+	     "umout_top_sclk_fsys0_ufsunipro_cfg",
+	     "mout_top_sclk_fsys0_ufsunipro_cfg",
+	     CLK_CON_MUX_SCLK_FSYS0_UFSUNIPRO_CFG, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_FSYS1_MMC2, "umout_top_sclk_fsys1_mmc2",
+	     "mout_top_sclk_fsys1_mmc2", CLK_CON_MUX_SCLK_FSYS1_MMC2, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_FSYS1_UFSUNIPRO20,
+	     "umout_top_sclk_fsys1_ufsunipro20",
+	     "mout_top_sclk_fsys1_ufsunipro20",
+	     CLK_CON_MUX_SCLK_FSYS1_UFSUNIPRO20, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_FSYS1_PCIE_PHY, "umout_top_sclk_fsys1_pcie_phy",
+	     "mout_top_sclk_fsys1_pcie_phy", CLK_CON_MUX_SCLK_FSYS1_PCIE_PHY,
+	     21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_FSYS1_UFSUNIPRO_CFG,
+	     "umout_top_sclk_fsys1_ufsunipro_cfg",
+	     "mout_top_sclk_fsys1_ufsunipro_cfg",
+	     CLK_CON_MUX_SCLK_FSYS1_UFSUNIPRO_CFG, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_PERIC0_UART0, "umout_top_sclk_peric0_uart0",
+	     "mout_top_sclk_peric0_uart0", CLK_CON_MUX_SCLK_PERIC0_UART0, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_PERIC1_SPI0, "umout_top_sclk_peric1_spi0",
+	     "mout_top_sclk_peric1_spi0", CLK_CON_MUX_SCLK_PERIC1_SPI0, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_PERIC1_SPI1, "umout_top_sclk_peric1_spi1",
+	     "mout_top_sclk_peric1_spi1", CLK_CON_MUX_SCLK_PERIC1_SPI1, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_PERIC1_SPI2, "umout_top_sclk_peric1_spi2",
+	     "mout_top_sclk_peric1_spi2", CLK_CON_MUX_SCLK_PERIC1_SPI2, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_PERIC1_SPI3, "umout_top_sclk_peric1_spi3",
+	     "mout_top_sclk_peric1_spi3", CLK_CON_MUX_SCLK_PERIC1_SPI3, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_PERIC1_SPI4, "umout_top_sclk_peric1_spi4",
+	     "mout_top_sclk_peric1_spi4", CLK_CON_MUX_SCLK_PERIC1_SPI4, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_PERIC1_SPI5, "umout_top_sclk_peric1_spi5",
+	     "mout_top_sclk_peric1_spi5", CLK_CON_MUX_SCLK_PERIC1_SPI5, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_PERIC1_SPI6, "umout_top_sclk_peric1_spi6",
+	     "mout_top_sclk_peric1_spi6", CLK_CON_MUX_SCLK_PERIC1_SPI6, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_PERIC1_SPI7, "umout_top_sclk_peric1_spi7",
+	     "mout_top_sclk_peric1_spi7", CLK_CON_MUX_SCLK_PERIC1_SPI7, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_PERIC1_UART1, "umout_top_sclk_peric1_uart1",
+	     "mout_top_sclk_peric1_uart1", CLK_CON_MUX_SCLK_PERIC1_UART1, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_PERIC1_UART2, "umout_top_sclk_peric1_uart2",
+	     "mout_top_sclk_peric1_uart2", CLK_CON_MUX_SCLK_PERIC1_UART2, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_PERIC1_UART3, "umout_top_sclk_peric1_uart3",
+	     "mout_top_sclk_peric1_uart3", CLK_CON_MUX_SCLK_PERIC1_UART3, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_PERIC1_UART4, "umout_top_sclk_peric1_uart4",
+	     "mout_top_sclk_peric1_uart4", CLK_CON_MUX_SCLK_PERIC1_UART4, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_PERIC1_UART5, "umout_top_sclk_peric1_uart5",
+	     "mout_top_sclk_peric1_uart5", CLK_CON_MUX_SCLK_PERIC1_UART5, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_CAM1_ISP_SPI0, "umout_top_sclk_cam1_isp_spi0",
+	     "mout_top_sclk_cam1_isp_spi0", CLK_CON_MUX_SCLK_CAM1_ISP_SPI0, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_CAM1_ISP_SPI1, "umout_top_sclk_cam1_isp_spi1",
+	     "mout_top_sclk_cam1_isp_spi1", CLK_CON_MUX_SCLK_CAM1_ISP_SPI1, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_CAM1_ISP_UART, "umout_top_sclk_cam1_isp_uart",
+	     "mout_top_sclk_cam1_isp_uart", CLK_CON_MUX_SCLK_CAM1_ISP_UART, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_AP2CP_MIF_PLL_OUT,
+	     "umout_top_sclk_ap2cp_mif_pll_out",
+	     "mout_top_sclk_ap2cp_mif_pll_out",
+	     CLK_CON_MUX_SCLK_AP2CP_MIF_PLL_OUT, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_ACLK_PSCDC_400, "umout_top_aclk_pscdc_400",
+	     "mout_top_aclk_pscdc_400", CLK_CON_MUX_ACLK_PSCDC_400, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_BUS_PLL_MNGS, "umout_top_sclk_bus_pll_mngs",
+	     "mout_top_sclk_bus_pll_mngs", CLK_CON_MUX_SCLK_BUS_PLL_MNGS, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_BUS_PLL_APOLLO, "umout_top_sclk_bus_pll_apollo",
+	     "mout_top_sclk_bus_pll_apollo", CLK_CON_MUX_SCLK_BUS_PLL_APOLLO,
+	     21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_BUS_PLL_MIF, "umout_top_sclk_bus_pll_mif",
+	     "mout_top_sclk_bus_pll_mif", CLK_CON_MUX_SCLK_BUS_PLL_MIF, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_BUS_PLL_G3D, "umout_top_sclk_bus_pll_g3d",
+	     "mout_top_sclk_bus_pll_g3d", CLK_CON_MUX_SCLK_BUS_PLL_G3D, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_ISP_SENSOR0, "umout_top_sclk_isp_sensor0",
+	     "mout_top_sclk_isp_sensor0", CLK_CON_MUX_SCLK_ISP_SENSOR0, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_ISP_SENSOR1, "umout_top_sclk_isp_sensor1",
+	     "mout_top_sclk_isp_sensor1", CLK_CON_MUX_SCLK_ISP_SENSOR1, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_ISP_SENSOR2, "umout_top_sclk_isp_sensor2",
+	     "mout_top_sclk_isp_sensor2", CLK_CON_MUX_SCLK_ISP_SENSOR2, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_ISP_SENSOR3, "umout_top_sclk_isp_sensor3",
+	     "mout_top_sclk_isp_sensor3", CLK_CON_MUX_SCLK_ISP_SENSOR3, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_PROMISE_INT, "umout_top_sclk_promise_int",
+	     "mout_top_sclk_promise_int", CLK_CON_MUX_SCLK_PROMISE_INT, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_SCLK_PROMISE_DISP, "umout_top_sclk_promise_disp",
+	     "mout_top_sclk_promise_disp", CLK_CON_MUX_SCLK_PROMISE_DISP, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_UMOUT_TOP_CP2AP_MIF_CLK_USER, "umout_top_cp2ap_mif_clk_user",
+	     "mout_top_cp2ap_mif_clk_user", CLK_CON_MUX_CP2AP_MIF_CLK_USER, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_CCORE_800, "gout_top_aclk_ccore_800",
+	     "dout_top_aclk_ccore_800", CLK_ENABLE_ACLK_CCORE_800, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_CCORE_264, "gout_top_aclk_ccore_264",
+	     "dout_top_aclk_ccore_264", CLK_ENABLE_ACLK_CCORE_264, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_CCORE_G3D_800, "gout_top_aclk_ccore_g3d_800",
+	     "dout_top_aclk_ccore_g3d_800", CLK_ENABLE_ACLK_CCORE_G3D_800, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_CCORE_528, "gout_top_aclk_ccore_528",
+	     "dout_top_aclk_ccore_528", CLK_ENABLE_ACLK_CCORE_528, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_CCORE_132, "gout_top_aclk_ccore_132",
+	     "dout_top_aclk_ccore_132", CLK_ENABLE_ACLK_CCORE_132, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_PCLK_CCORE_66, "gout_top_pclk_ccore_66",
+	     "dout_top_pclk_ccore_66", CLK_ENABLE_PCLK_CCORE_66, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_BUS0_528, "gout_top_aclk_bus0_528",
+	     "dout_top_aclk_bus0_528", CLK_ENABLE_ACLK_BUS0_528_TOP, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_BUS0_200, "gout_top_aclk_bus0_200",
+	     "dout_top_aclk_bus0_200", CLK_ENABLE_ACLK_BUS0_200_TOP, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_PCLK_BUS0_132, "gout_top_pclk_bus0_132",
+	     "dout_top_pclk_bus0_132", CLK_ENABLE_PCLK_BUS0_132_TOP, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_BUS1_528, "gout_top_aclk_bus1_528",
+	     "dout_top_aclk_bus1_528", CLK_ENABLE_ACLK_BUS1_528_TOP, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_PCLK_BUS1_132, "gout_top_pclk_bus1_132",
+	     "dout_top_pclk_bus1_132", CLK_ENABLE_PCLK_BUS1_132_TOP, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_DISP0_0_400, "gout_top_aclk_disp0_0_400",
+	     "dout_top_aclk_disp0_0_400", CLK_ENABLE_ACLK_DISP0_0_400, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_DISP0_1_400, "gout_top_aclk_disp0_1_400",
+	     "dout_top_aclk_disp0_1_400", CLK_ENABLE_ACLK_DISP0_1_400, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_DISP1_0_400, "gout_top_aclk_disp1_0_400",
+	     "dout_top_aclk_disp1_0_400", CLK_ENABLE_ACLK_DISP1_0_400, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_DISP1_1_400, "gout_top_aclk_disp1_1_400",
+	     "dout_top_aclk_disp1_1_400", CLK_ENABLE_ACLK_DISP1_1_400, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_MFC_600, "gout_top_aclk_mfc_600",
+	     "dout_top_aclk_mfc_600", CLK_ENABLE_ACLK_MFC_600, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_MSCL0_528, "gout_top_aclk_mscl0_528",
+	     "dout_top_aclk_mscl0_528", CLK_ENABLE_ACLK_MSCL0_528, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_MSCL1_528, "gout_top_aclk_mscl1_528",
+	     "dout_top_aclk_mscl1_528", CLK_ENABLE_ACLK_MSCL1_528, 1,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_IMEM_266, "gout_top_aclk_imem_266",
+	     "dout_top_aclk_imem_266", CLK_ENABLE_ACLK_IMEM_266, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_IMEM_200, "gout_top_aclk_imem_200",
+	     "dout_top_aclk_imem_200", CLK_ENABLE_ACLK_IMEM_200, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_IMEM_100, "gout_top_aclk_imem_100",
+	     "dout_top_aclk_imem_100", CLK_ENABLE_ACLK_IMEM_100, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_FSYS0_200, "gout_top_aclk_fsys0_200",
+	     "dout_top_aclk_fsys0_200", CLK_ENABLE_ACLK_FSYS0_200, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_FSYS1_200, "gout_top_aclk_fsys1_200",
+	     "dout_top_aclk_fsys1_200", CLK_ENABLE_ACLK_FSYS1_200, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_PERIS_66, "gout_top_aclk_peris_66",
+	     "dout_top_aclk_peris_66", CLK_ENABLE_ACLK_PERIS_66, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_PERIC0_66, "gout_top_aclk_peric0_66",
+	     "dout_top_aclk_peric0_66", CLK_ENABLE_ACLK_PERIC0_66, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_PERIC1_66, "gout_top_aclk_peric1_66",
+	     "dout_top_aclk_peric1_66", CLK_ENABLE_ACLK_PERIC1_66, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_ISP0_ISP0_528, "gout_top_aclk_isp0_isp0_528",
+	     "dout_top_aclk_isp0_isp0_528", CLK_ENABLE_ACLK_ISP0_ISP0_528, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_ISP0_TPU_400, "gout_top_aclk_isp0_tpu_400",
+	     "dout_top_aclk_isp0_tpu_400", CLK_ENABLE_ACLK_ISP0_TPU_400, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_ISP0_TREX_528, "gout_top_aclk_isp0_trex_528",
+	     "dout_top_aclk_isp0_trex_528", CLK_ENABLE_ACLK_ISP0_TREX_528, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_ISP0_PXL_ASBS_IS_C_FROM_IS_D,
+	     "gout_top_aclk_isp0_pxl_asbs_is_c_from_is_d",
+	     "dout_top_aclk_isp0_pxl_asbs_is_c_from_is_d",
+	     CLK_ENABLE_ACLK_ISP0_PXL_ASBS_IS_C_FROM_IS_D_TOP, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_ISP1_ISP1_468, "gout_top_aclk_isp1_isp1_468",
+	     "dout_top_aclk_isp1_isp1_468", CLK_ENABLE_ACLK_ISP1_ISP1_468, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_CAM0_CSIS0_414, "gout_top_aclk_cam0_csis0_414",
+	     "dout_top_aclk_cam0_csis0_414", CLK_ENABLE_ACLK_CAM0_CSIS1_414, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_CAM0_CSIS1_168, "gout_top_aclk_cam0_csis1_168",
+	     "dout_top_aclk_cam0_csis1_168", CLK_ENABLE_ACLK_CAM0_CSIS1_168_TOP,
+	     0, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_CAM0_CSIS2_234, "gout_top_aclk_cam0_csis2_234",
+	     "dout_top_aclk_cam0_csis2_234", CLK_ENABLE_ACLK_CAM0_CSIS2_234_TOP,
+	     0, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_CAM0_3AA0_414, "gout_top_aclk_cam0_3aa0_414",
+	     "dout_top_aclk_cam0_3aa0_414", CLK_ENABLE_ACLK_CAM0_3AA0_414_TOP,
+	     0, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_CAM0_3AA1_414, "gout_top_aclk_cam0_3aa1_414",
+	     "dout_top_aclk_cam0_3aa1_414", CLK_ENABLE_ACLK_CAM0_3AA1_414_TOP,
+	     0, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_CAM0_CSIS3_132, "gout_top_aclk_cam0_csis3_132",
+	     "dout_top_aclk_cam0_csis3_132", CLK_ENABLE_ACLK_CAM0_CSIS3_132_TOP,
+	     0, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_CAM0_TREX_528, "gout_top_aclk_cam0_trex_528",
+	     "dout_top_aclk_cam0_trex_528", CLK_ENABLE_ACLK_CAM0_TREX_528_TOP,
+	     0, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_CAM1_ARM_672, "gout_top_aclk_cam1_arm_672",
+	     "dout_top_aclk_cam1_arm_672", CLK_ENABLE_ACLK_CAM1_ARM_672_TOP, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_CAM1_TREX_VRA_528,
+	     "gout_top_aclk_cam1_trex_vra_528",
+	     "dout_top_aclk_cam1_trex_vra_528",
+	     CLK_ENABLE_ACLK_CAM1_TREX_VRA_528_TOP, 0, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_CAM1_TREX_B_528, "gout_top_aclk_cam1_trex_b_528",
+	     "dout_top_aclk_cam1_trex_b_528",
+	     CLK_ENABLE_ACLK_CAM1_TREX_B_528_TOP, 0, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_CAM1_BUS_264, "gout_top_aclk_cam1_bus_264",
+	     "dout_top_aclk_cam1_bus_264", CLK_ENABLE_ACLK_CAM1_BUS_264_TOP, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_CAM1_PERI_84, "gout_top_aclk_cam1_peri_84",
+	     "dout_top_aclk_cam1_peri_84", CLK_ENABLE_ACLK_CAM1_PERI_84, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_CAM1_CSIS2_414, "gout_top_aclk_cam1_csis2_414",
+	     "dout_top_aclk_cam1_csis2_414", CLK_ENABLE_ACLK_CAM1_CSIS2_414_TOP,
+	     0, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_CAM1_CSIS3_132, "gout_top_aclk_cam1_csis3_132",
+	     "dout_top_aclk_cam1_csis3_132", CLK_ENABLE_ACLK_CAM1_CSIS3_132_TOP,
+	     0, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_CAM1_SCL_566, "gout_top_aclk_cam1_scl_566",
+	     "dout_top_aclk_cam1_scl_566", CLK_ENABLE_ACLK_CAM1_SCL_566_TOP, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_DISP0_DECON0_ECLK0,
+	     "gout_top_sclk_disp0_decon0_eclk0",
+	     "dout_top_sclk_disp0_decon0_eclk0",
+	     CLK_ENABLE_SCLK_DISP0_DECON0_ECLK0, 0, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_DISP0_DECON0_VCLK0,
+	     "gout_top_sclk_disp0_decon0_vclk0",
+	     "dout_top_sclk_disp0_decon0_vclk0",
+	     CLK_ENABLE_SCLK_DISP0_DECON0_VCLK0, 0, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_DISP0_DECON0_VCLK1,
+	     "gout_top_sclk_disp0_decon0_vclk1",
+	     "dout_top_sclk_disp0_decon0_vclk1",
+	     CLK_ENABLE_SCLK_DISP0_DECON0_VCLK1, 0, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_DISP0_HDMI_AUDIO,
+	     "gout_top_sclk_disp0_hdmi_audio", "dout_top_sclk_disp0_hdmi_audio",
+	     CLK_ENABLE_SCLK_DISP0_HDMI_ADUIO, 0, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_DISP1_DECON1_ECLK0,
+	     "gout_top_sclk_disp1_decon1_eclk0",
+	     "dout_top_sclk_disp1_decon1_eclk0",
+	     CLK_ENABLE_SCLK_DISP1_DECON1_ECLK0, 0, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_DISP1_DECON1_ECLK1,
+	     "gout_top_sclk_disp1_decon1_eclk1",
+	     "dout_top_sclk_disp1_decon1_eclk1",
+	     CLK_ENABLE_SCLK_DISP1_DECON1_ECLK1, 0, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_FSYS0_USBDRD30, "gout_top_sclk_fsys0_usbdrd30",
+	     "dout_top_sclk_fsys0_usbdrd30", CLK_ENABLE_SCLK_FSYS0_USBDRD30, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_FSYS0_MMC0, "gout_top_sclk_fsys0_mmc0",
+	     "dout_top_sclk_fsys0_mmc0", CLK_ENABLE_SCLK_FSYS0_MMC0, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_FSYS0_UFSUNIPRO20,
+	     "gout_top_sclk_fsys0_ufsunipro20",
+	     "dout_top_sclk_fsys0_ufsunipro20",
+	     CLK_ENABLE_SCLK_FSYS0_UFSUNIPRO20, 0, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_FSYS0_PHY_24M, "gout_top_sclk_fsys0_phy_24m",
+	     "dout_top_sclk_fsys0_phy_24m", CLK_ENABLE_SCLK_FSYS0_PHY_24M, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_FSYS0_UFSUNIPRO_CFG,
+	     "gout_top_sclk_fsys0_ufsunipro_cfg",
+	     "dout_top_sclk_fsys0_ufsunipro_cfg",
+	     CLK_ENABLE_SCLK_FSYS0_UFSUNIPRO_CFG, 0, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_FSYS1_MMC2, "gout_top_sclk_fsys1_mmc2",
+	     "dout_top_sclk_fsys1_mmc2", CLK_ENABLE_SCLK_FSYS1_MMC2, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_FSYS1_UFSUNIPRO20,
+	     "gout_top_sclk_fsys1_ufsunipro20",
+	     "dout_top_sclk_fsys1_ufsunipro20",
+	     CLK_ENABLE_SCLK_FSYS1_UFSUNIPRO20, 0, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_FSYS1_PCIE_PHY, "gout_top_sclk_fsys1_pcie_phy",
+	     "dout_top_sclk_fsys1_pcie_phy", CLK_ENABLE_SCLK_FSYS1_PCIE_PHY, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_FSYS1_UFSUNIPRO_CFG,
+	     "gout_top_sclk_fsys1_ufsunipro_cfg",
+	     "dout_top_sclk_fsys1_ufsunipro_cfg",
+	     CLK_ENABLE_SCLK_FSYS1_UFSUNIPRO_CFG, 0, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_PERIC0_UART0, "gout_top_sclk_peric0_uart0",
+	     "dout_top_sclk_peric0_uart0", CLK_ENABLE_SCLK_PERIC0_UART0, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_PERIC1_SPI0, "gout_top_sclk_peric1_spi0",
+	     "dout_top_sclk_peric1_spi0", CLK_ENABLE_SCLK_PERIC1_SPI0, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_PERIC1_SPI1, "gout_top_sclk_peric1_spi1",
+	     "dout_top_sclk_peric1_spi1", CLK_ENABLE_SCLK_PERIC1_SPI1, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_PERIC1_SPI2, "gout_top_sclk_peric1_spi2",
+	     "dout_top_sclk_peric1_spi2", CLK_ENABLE_SCLK_PERIC1_SPI2, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_PERIC1_SPI3, "gout_top_sclk_peric1_spi3",
+	     "dout_top_sclk_peric1_spi3", CLK_ENABLE_SCLK_PERIC1_SPI3, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_PERIC1_SPI4, "gout_top_sclk_peric1_spi4",
+	     "dout_top_sclk_peric1_spi4", CLK_ENABLE_SCLK_PERIC1_SPI4, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_PERIC1_SPI5, "gout_top_sclk_peric1_spi5",
+	     "dout_top_sclk_peric1_spi5", CLK_ENABLE_SCLK_PERIC1_SPI5, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_PERIC1_SPI6, "gout_top_sclk_peric1_spi6",
+	     "dout_top_sclk_peric1_spi6", CLK_ENABLE_SCLK_PERIC1_SPI6, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_PERIC1_SPI7, "gout_top_sclk_peric1_spi7",
+	     "dout_top_sclk_peric1_spi7", CLK_ENABLE_SCLK_PERIC1_SPI7, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_PERIC1_UART1, "gout_top_sclk_peric1_uart1",
+	     "dout_top_sclk_peric1_uart1", CLK_ENABLE_SCLK_PERIC1_UART1, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_PERIC1_UART2, "gout_top_sclk_peric1_uart2",
+	     "dout_top_sclk_peric1_uart2", CLK_ENABLE_SCLK_PERIC1_UART2, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_PERIC1_UART3, "gout_top_sclk_peric1_uart3",
+	     "dout_top_sclk_peric1_uart3", CLK_ENABLE_SCLK_PERIC1_UART3, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_PERIC1_UART4, "gout_top_sclk_peric1_uart4",
+	     "dout_top_sclk_peric1_uart4", CLK_ENABLE_SCLK_PERIC1_UART4, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_PERIC1_UART5, "gout_top_sclk_peric1_uart5",
+	     "dout_top_sclk_peric1_uart5", CLK_ENABLE_SCLK_PERIC1_UART5, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_CAM1_ISP_SPI0, "gout_top_sclk_cam1_isp_spi0",
+	     "dout_top_sclk_cam1_isp_spi0", CLK_ENABLE_SCLK_CAM1_ISP_SPI0_TOP,
+	     0, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_CAM1_ISP_SPI1, "gout_top_sclk_cam1_isp_spi1",
+	     "dout_top_sclk_cam1_isp_spi1", CLK_ENABLE_SCLK_CAM1_ISP_SPI1_TOP,
+	     0, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_CAM1_ISP_UART, "gout_top_sclk_cam1_isp_uart",
+	     "dout_top_sclk_cam1_isp_uart", CLK_ENABLE_SCLK_CAM1_ISP_UART_TOP,
+	     0, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_AP2CP_MIF_PLL_OUT,
+	     "gout_top_sclk_ap2cp_mif_pll_out",
+	     "dout_top_sclk_ap2cp_mif_pll_out",
+	     CLK_ENABLE_SCLK_AP2CP_MIF_PLL_OUT, 0, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_ACLK_PSCDC_400, "gout_top_aclk_pscdc_400",
+	     "dout_top_aclk_pscdc_400", CLK_ENABLE_ACLK_PSCDC_400, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_BUS_PLL_MNGS, "gout_top_sclk_bus_pll_mngs",
+	     "dout_top_sclk_bus_pll_mngs", CLK_ENABLE_SCLK_BUS_PLL_MNGS, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_BUS_PLL_APOLLO, "gout_top_sclk_bus_pll_apollo",
+	     "dout_top_sclk_bus_pll_apollo", CLK_ENABLE_SCLK_BUS_PLL_APOLLO, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_BUS_PLL_MIF, "gout_top_sclk_bus_pll_mif",
+	     "mout_top_sclk_bus_pll_mif", CLK_ENABLE_SCLK_BUS_PLL_MIF, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_BUS_PLL_G3D, "gout_top_sclk_bus_pll_g3d",
+	     "dout_top_sclk_bus_pll_g3d", CLK_ENABLE_SCLK_BUS_PLL_G3D, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_ISP_SENSOR0, "gout_top_sclk_isp_sensor0",
+	     "dout_top_sclk_isp_sensor0", CLK_ENABLE_SCLK_ISP_SENSOR0, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_ISP_SENSOR1, "gout_top_sclk_isp_sensor1",
+	     "dout_top_sclk_isp_sensor1", CLK_ENABLE_SCLK_ISP_SENSOR1, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_ISP_SENSOR2, "gout_top_sclk_isp_sensor2",
+	     "dout_top_sclk_isp_sensor2", CLK_ENABLE_SCLK_ISP_SENSOR2, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_ISP_SENSOR3, "gout_top_sclk_isp_sensor3",
+	     "dout_top_sclk_isp_sensor3", CLK_ENABLE_SCLK_ISP_SENSOR3, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_PROMISE_INT, "gout_top_sclk_promise_int",
+	     "dout_top_sclk_promise_int", CLK_ENABLE_SCLK_PROMISE_INT, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_TOP_SCLK_PROMISE_DISP, "gout_top_sclk_promise_disp",
+	     "dout_top_sclk_promise_disp", CLK_ENABLE_SCLK_PROMISE_DISP, 0,
+	     CLK_IGNORE_UNUSED, 0),
+};
+
+static const struct samsung_cmu_info top_cmu_info __initconst = {
+	.pll_clks		= top_pll_clks,
+	.nr_pll_clks		= ARRAY_SIZE(top_pll_clks),
+	.mux_clks		= top_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(top_mux_clks),
+	.div_clks		= top_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(top_div_clks),
+	.gate_clks		= top_gate_clks,
+	.fixed_clks		= top_fixed_clks,
+	.nr_fixed_clks		= ARRAY_SIZE(top_fixed_clks),
+	.fixed_factor_clks	= top_fixed_factor_clks,
+	.nr_fixed_factor_clks	= ARRAY_SIZE(top_fixed_factor_clks),
+	.nr_gate_clks		= ARRAY_SIZE(top_gate_clks),
+	.nr_clk_ids		= TOP_NR_CLK,
+	.clk_regs		= top_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(top_clk_regs),
+};
+
+static void __init exynos8890_cmu_top_init(struct device_node *np)
+{
+	exynos8890_init_clocks(np, &top_cmu_info);
+	samsung_cmu_register_one(np, &top_cmu_info);
+}
+
+/* Register CMU_TOP early, as it's a dependency for other early domains */
+CLK_OF_DECLARE(exynos8890_cmu_top, "samsung,exynos8890-cmu-top",
+	       exynos8890_cmu_top_init);
+
+/* ---- CMU_PERIS ---------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_PERIS (0x10040000) */
+#define CLK_CON_MUX_ACLK_PERIS_66_USER		0x0200
+#define CLK_STAT_MUX_ACLK_PERIS_66_USER		0x0600
+#define CG_CTRL_VAL_ACLK_PERIS			0x0800
+#define CG_CTRL_VAL_ACLK_PERIS_HPM_APBIF_PERIS	0x0804
+#define CG_CTRL_VAL_ACLK_PERIS_SECURE_TZPC	0x0808
+#define CG_CTRL_VAL_ACLK_PERIS_SECURE_RTC	0x080C
+#define CG_CTRL_VAL_ACLK_PERIS_SECURE_OTP	0x0810
+#define CG_CTRL_VAL_ACLK_PERIS_SECURE_CHIPID	0x0814
+#define CG_CTRL_VAL_SCLK_PERIS_SECURE_OTP	0x0844
+#define CG_CTRL_VAL_SCLK_PERIS_SECURE_CHIPID	0x0848
+#define CG_CTRL_VAL_SCLK_PERIS			0x084C
+#define CG_CTRL_VAL_SCLK_PERIS_PROMISE		0x0850
+#define CLKOUT_CMU_PERIS			0x0C00
+#define CLKOUT_CMU_PERIS_DIV_STAT		0x0C04
+#define PERIS_SFR_IGNORE_REQ_SYSCLK		0x0D04
+#define CMU_PERIS_SPARE0			0x0D08
+#define CMU_PERIS_SPARE1			0x0D0C
+#define CG_CTRL_MAN_ACLK_PERIS			0x1800
+#define CG_CTRL_MAN_ACLK_PERIS_HPM_APBIF_PERIS	0x1804
+#define CG_CTRL_MAN_ACLK_PERIS_SECURE_TZPC	0x1808
+#define CG_CTRL_MAN_ACLK_PERIS_SECURE_RTC	0x180C
+#define CG_CTRL_MAN_ACLK_PERIS_SECURE_OTP	0x1810
+#define CG_CTRL_MAN_ACLK_PERIS_SECURE_CHIPID	0x1814
+#define CG_CTRL_MAN_SCLK_PERIS_SECURE_OTP	0x1844
+#define CG_CTRL_MAN_SCLK_PERIS_SECURE_CHIPID	0x1848
+#define CG_CTRL_MAN_SCLK_PERIS			0x184C
+#define CG_CTRL_MAN_SCLK_PERIS_PROMISE		0x1850
+#define CG_CTRL_STAT_ACLK_PERIS_0		0x1C00
+#define CG_CTRL_STAT_ACLK_PERIS_1		0x1C04
+#define CG_CTRL_STAT_ACLK_PERIS_HPM_APBIF_PERIS	0x1C08
+#define CG_CTRL_STAT_ACLK_PERIS_SECURE_TZPC_0	0x1C0C
+#define CG_CTRL_STAT_ACLK_PERIS_SECURE_TZPC_1	0x1C10
+#define CG_CTRL_STAT_ACLK_PERIS_SECURE_RTC	0x1C14
+#define CG_CTRL_STAT_ACLK_PERIS_SECURE_OTP	0x1C18
+#define CG_CTRL_STAT_ACLK_PERIS_SECURE_CHIPID	0x1C1C
+#define CG_CTRL_STAT_SCLK_PERIS_SECURE_OTP	0x1C44
+#define CG_CTRL_STAT_SCLK_PERIS_SECURE_CHIPID	0x1C48
+#define CG_CTRL_STAT_SCLK_PERIS			0x1C4C
+#define CG_CTRL_STAT_SCLK_PERIS_PROMISE		0x1C50
+#define QCH_CTRL_AXILHASYNCM_PERIS		0x2000
+#define QCH_CTRL_CMU_PERIS			0x2004
+#define QCH_CTRL_PMU_PERIS			0x2008
+#define QCH_CTRL_SYSREG_PERIS			0x200C
+#define QCH_CTRL_MONOCNT_APBIF			0x2010
+#define QSTATE_CTRL_MCT				0x240C
+#define QSTATE_CTRL_WDT_MNGS			0x2410
+#define QSTATE_CTRL_WDT_APOLLO			0x2414
+#define QSTATE_CTRL_RTC_APBIF			0x2418
+#define QSTATE_CTRL_SFR_APBIF_TMU		0x241C
+#define QSTATE_CTRL_SFR_APBIF_HDMI_CEC		0x2420
+#define QSTATE_CTRL_HPM_APBIF_PERIS		0x2424
+#define QSTATE_CTRL_TZPC_0			0x2428
+#define QSTATE_CTRL_TZPC_1			0x242C
+#define QSTATE_CTRL_TZPC_2			0x2430
+#define QSTATE_CTRL_TZPC_3			0x2434
+#define QSTATE_CTRL_TZPC_4			0x2438
+#define QSTATE_CTRL_TZPC_5			0x243C
+#define QSTATE_CTRL_TZPC_6			0x2440
+#define QSTATE_CTRL_TZPC_7			0x2444
+#define QSTATE_CTRL_TZPC_8			0x2448
+#define QSTATE_CTRL_TZPC_9			0x244C
+#define QSTATE_CTRL_TZPC_10			0x2450
+#define QSTATE_CTRL_TZPC_11			0x2454
+#define QSTATE_CTRL_TZPC_12			0x2458
+#define QSTATE_CTRL_TZPC_13			0x245C
+#define QSTATE_CTRL_TZPC_14			0x2460
+#define QSTATE_CTRL_TZPC_15			0x2464
+#define QSTATE_CTRL_TOP_RTC			0x2468
+#define QSTATE_CTRL_OTP_CON_TOP			0x246C
+#define QSTATE_CTRL_SFR_APBIF_CHIPID		0x2470
+#define QSTATE_CTRL_TMU				0x2474
+#define QSTATE_CTRL_CHIPID			0x2484
+#define QSTATE_CTRL_PROMISE_PERIS		0x2488
+
+static const unsigned long peris_clk_regs[] __initconst = {
+	CLK_CON_MUX_ACLK_PERIS_66_USER,
+	CLK_STAT_MUX_ACLK_PERIS_66_USER,
+	CG_CTRL_VAL_ACLK_PERIS,
+	CG_CTRL_VAL_ACLK_PERIS_HPM_APBIF_PERIS,
+	CG_CTRL_VAL_ACLK_PERIS_SECURE_TZPC,
+	CG_CTRL_VAL_ACLK_PERIS_SECURE_RTC,
+	CG_CTRL_VAL_ACLK_PERIS_SECURE_OTP,
+	CG_CTRL_VAL_ACLK_PERIS_SECURE_CHIPID,
+	CG_CTRL_VAL_SCLK_PERIS_SECURE_OTP,
+	CG_CTRL_VAL_SCLK_PERIS_SECURE_CHIPID,
+	CG_CTRL_VAL_SCLK_PERIS,
+	CG_CTRL_VAL_SCLK_PERIS_PROMISE,
+	CLKOUT_CMU_PERIS,
+	CLKOUT_CMU_PERIS_DIV_STAT,
+	PERIS_SFR_IGNORE_REQ_SYSCLK,
+	CMU_PERIS_SPARE0,
+	CMU_PERIS_SPARE1,
+	CG_CTRL_MAN_ACLK_PERIS,
+	CG_CTRL_MAN_ACLK_PERIS_HPM_APBIF_PERIS,
+	CG_CTRL_MAN_ACLK_PERIS_SECURE_TZPC,
+	CG_CTRL_MAN_ACLK_PERIS_SECURE_RTC,
+	CG_CTRL_MAN_ACLK_PERIS_SECURE_OTP,
+	CG_CTRL_MAN_ACLK_PERIS_SECURE_CHIPID,
+	CG_CTRL_MAN_SCLK_PERIS_SECURE_OTP,
+	CG_CTRL_MAN_SCLK_PERIS_SECURE_CHIPID,
+	CG_CTRL_MAN_SCLK_PERIS,
+	CG_CTRL_MAN_SCLK_PERIS_PROMISE,
+	CG_CTRL_STAT_ACLK_PERIS_0,
+	CG_CTRL_STAT_ACLK_PERIS_1,
+	CG_CTRL_STAT_ACLK_PERIS_HPM_APBIF_PERIS,
+	CG_CTRL_STAT_ACLK_PERIS_SECURE_TZPC_0,
+	CG_CTRL_STAT_ACLK_PERIS_SECURE_TZPC_1,
+	CG_CTRL_STAT_ACLK_PERIS_SECURE_RTC,
+	CG_CTRL_STAT_ACLK_PERIS_SECURE_OTP,
+	CG_CTRL_STAT_ACLK_PERIS_SECURE_CHIPID,
+	CG_CTRL_STAT_SCLK_PERIS_SECURE_OTP,
+	CG_CTRL_STAT_SCLK_PERIS_SECURE_CHIPID,
+	CG_CTRL_STAT_SCLK_PERIS,
+	CG_CTRL_STAT_SCLK_PERIS_PROMISE,
+	QCH_CTRL_AXILHASYNCM_PERIS,
+	QCH_CTRL_CMU_PERIS,
+	QCH_CTRL_PMU_PERIS,
+	QCH_CTRL_SYSREG_PERIS,
+	QCH_CTRL_MONOCNT_APBIF,
+	QSTATE_CTRL_MCT,
+	QSTATE_CTRL_WDT_MNGS,
+	QSTATE_CTRL_WDT_APOLLO,
+	QSTATE_CTRL_RTC_APBIF,
+	QSTATE_CTRL_SFR_APBIF_TMU,
+	QSTATE_CTRL_SFR_APBIF_HDMI_CEC,
+	QSTATE_CTRL_HPM_APBIF_PERIS,
+	QSTATE_CTRL_TZPC_0,
+	QSTATE_CTRL_TZPC_1,
+	QSTATE_CTRL_TZPC_2,
+	QSTATE_CTRL_TZPC_3,
+	QSTATE_CTRL_TZPC_4,
+	QSTATE_CTRL_TZPC_5,
+	QSTATE_CTRL_TZPC_6,
+	QSTATE_CTRL_TZPC_7,
+	QSTATE_CTRL_TZPC_8,
+	QSTATE_CTRL_TZPC_9,
+	QSTATE_CTRL_TZPC_10,
+	QSTATE_CTRL_TZPC_11,
+	QSTATE_CTRL_TZPC_12,
+	QSTATE_CTRL_TZPC_13,
+	QSTATE_CTRL_TZPC_14,
+	QSTATE_CTRL_TZPC_15,
+	QSTATE_CTRL_TOP_RTC,
+	QSTATE_CTRL_OTP_CON_TOP,
+	QSTATE_CTRL_SFR_APBIF_CHIPID,
+	QSTATE_CTRL_TMU,
+	QSTATE_CTRL_CHIPID,
+	QSTATE_CTRL_PROMISE_PERIS,
+};
+
+PNAME(peris_mux_aclk_peris_66_user_p)	= { "oscclk",
+					    "gout_top_aclk_peris_66" };
+
+static const struct samsung_mux_clock peris_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_PERIS_ACLK_PERIS_66_USER, "mout_peris_aclk_peris_66_user",
+	    peris_mux_aclk_peris_66_user_p, CLK_CON_MUX_ACLK_PERIS_66_USER, 12,
+	    1),
+};
+
+static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
+	GATE(CLK_GOUT_PERIS_PCLK_SFR_APBIF_HDMI_CEC,
+	     "gout_peris_pclk_sfr_apbif_hdmi_cec",
+	     "mout_peris_aclk_peris_66_user", CG_CTRL_VAL_ACLK_PERIS, 13,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_PERIS_PCLK_SFR_APBIF_TMU, "gout_peris_pclk_sfr_apbif_tmu",
+	     "mout_peris_aclk_peris_66_user", CG_CTRL_VAL_ACLK_PERIS, 12,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_PERIS_PCLK_RTC_APBIF, "gout_peris_pclk_rtc_apbif",
+	     "mout_peris_aclk_peris_66_user", CG_CTRL_VAL_ACLK_PERIS, 11,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_PERIS_PCLK_MONOCNT_APBIF, "gout_peris_pclk_monocnt_apbif",
+	     "mout_peris_aclk_peris_66_user", CG_CTRL_VAL_ACLK_PERIS, 10,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_PERIS_PCLK_WDT_APOLLO, "gout_peris_pclk_wdt_apollo",
+	     "mout_peris_aclk_peris_66_user", CG_CTRL_VAL_ACLK_PERIS, 9, 0, 0),
+	GATE(CLK_GOUT_PERIS_PCLK_WDT_MNGS, "gout_peris_pclk_wdt_mngs",
+	     "mout_peris_aclk_peris_66_user", CG_CTRL_VAL_ACLK_PERIS, 8, 0, 0),
+	GATE(CLK_GOUT_PERIS_PCLK_MCT, "gout_peris_pclk_mct",
+	     "mout_peris_aclk_peris_66_user", CG_CTRL_VAL_ACLK_PERIS, 7, 0, 0),
+	GATE(CLK_GOUT_PERIS_PCLK_SYSREG_PERIS, "gout_peris_pclk_sysreg_peris",
+	     "mout_peris_aclk_peris_66_user", CG_CTRL_VAL_ACLK_PERIS, 6, 0, 0),
+	GATE(CLK_GOUT_PERIS_PCLK_PMU_PERIS, "gout_peris_pclk_pmu_peris",
+	     "mout_peris_aclk_peris_66_user", CG_CTRL_VAL_ACLK_PERIS, 5,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_PERIS_PCLK_CMU_PERIS, "gout_peris_pclk_cmu_peris",
+	     "mout_peris_aclk_peris_66_user", CG_CTRL_VAL_ACLK_PERIS, 4,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_PERIS_ACLK_AXI2APB_PERIS1,
+	     "gout_peris_aclk_axi2apb_peris1", "mout_peris_aclk_peris_66_user",
+	     CG_CTRL_VAL_ACLK_PERIS, 3, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_PERIS_ACLK_AXI2APB_PERIS0,
+	     "gout_peris_aclk_axi2apb_peris0", "mout_peris_aclk_peris_66_user",
+	     CG_CTRL_VAL_ACLK_PERIS, 2, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_PERIS_ACLK_XIU_PERIS, "gout_peris_aclk_xiu_peris",
+	     "mout_peris_aclk_peris_66_user", CG_CTRL_VAL_ACLK_PERIS, 1,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_PERIS_ACLK_AXI_LH_ASYNC, "gout_peris_aclk_axi_lh_async",
+	     "mout_peris_aclk_peris_66_user", CG_CTRL_VAL_ACLK_PERIS, 0,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_PERIS_PCLK_HPM_APBIF_PERIS,
+	     "gout_peris_pclk_hpm_apbif_peris", "mout_peris_aclk_peris_66_user",
+	     CG_CTRL_VAL_ACLK_PERIS_HPM_APBIF_PERIS, 0, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_PERIS_PCLK_TZPC_15, "gout_peris_pclk_tzpc_15",
+	     "mout_peris_aclk_peris_66_user",
+	     CG_CTRL_VAL_ACLK_PERIS_SECURE_TZPC, 15, 0, 0),
+	GATE(CLK_GOUT_PERIS_PCLK_TZPC_14, "gout_peris_pclk_tzpc_14",
+	     "mout_peris_aclk_peris_66_user",
+	     CG_CTRL_VAL_ACLK_PERIS_SECURE_TZPC, 14, 0, 0),
+	GATE(CLK_GOUT_PERIS_PCLK_TZPC_13, "gout_peris_pclk_tzpc_13",
+	     "mout_peris_aclk_peris_66_user",
+	     CG_CTRL_VAL_ACLK_PERIS_SECURE_TZPC, 13, 0, 0),
+	GATE(CLK_GOUT_PERIS_PCLK_TZPC_12, "gout_peris_pclk_tzpc_12",
+	     "mout_peris_aclk_peris_66_user",
+	     CG_CTRL_VAL_ACLK_PERIS_SECURE_TZPC, 12, 0, 0),
+	GATE(CLK_GOUT_PERIS_PCLK_TZPC_11, "gout_peris_pclk_tzpc_11",
+	     "mout_peris_aclk_peris_66_user",
+	     CG_CTRL_VAL_ACLK_PERIS_SECURE_TZPC, 11, 0, 0),
+	GATE(CLK_GOUT_PERIS_PCLK_TZPC_10, "gout_peris_pclk_tzpc_10",
+	     "mout_peris_aclk_peris_66_user",
+	     CG_CTRL_VAL_ACLK_PERIS_SECURE_TZPC, 10, 0, 0),
+	GATE(CLK_GOUT_PERIS_PCLK_TZPC_9, "gout_peris_pclk_tzpc_9",
+	     "mout_peris_aclk_peris_66_user",
+	     CG_CTRL_VAL_ACLK_PERIS_SECURE_TZPC, 9, 0, 0),
+	GATE(CLK_GOUT_PERIS_PCLK_TZPC_8, "gout_peris_pclk_tzpc_8",
+	     "mout_peris_aclk_peris_66_user",
+	     CG_CTRL_VAL_ACLK_PERIS_SECURE_TZPC, 8, 0, 0),
+	GATE(CLK_GOUT_PERIS_PCLK_TZPC_7, "gout_peris_pclk_tzpc_7",
+	     "mout_peris_aclk_peris_66_user",
+	     CG_CTRL_VAL_ACLK_PERIS_SECURE_TZPC, 7, 0, 0),
+	GATE(CLK_GOUT_PERIS_PCLK_TZPC_6, "gout_peris_pclk_tzpc_6",
+	     "mout_peris_aclk_peris_66_user",
+	     CG_CTRL_VAL_ACLK_PERIS_SECURE_TZPC, 6, 0, 0),
+	GATE(CLK_GOUT_PERIS_PCLK_TZPC_5, "gout_peris_pclk_tzpc_5",
+	     "mout_peris_aclk_peris_66_user",
+	     CG_CTRL_VAL_ACLK_PERIS_SECURE_TZPC, 5, 0, 0),
+	GATE(CLK_GOUT_PERIS_PCLK_TZPC_4, "gout_peris_pclk_tzpc_4",
+	     "mout_peris_aclk_peris_66_user",
+	     CG_CTRL_VAL_ACLK_PERIS_SECURE_TZPC, 4, 0, 0),
+	GATE(CLK_GOUT_PERIS_PCLK_TZPC_3, "gout_peris_pclk_tzpc_3",
+	     "mout_peris_aclk_peris_66_user",
+	     CG_CTRL_VAL_ACLK_PERIS_SECURE_TZPC, 3, 0, 0),
+	GATE(CLK_GOUT_PERIS_PCLK_TZPC_2, "gout_peris_pclk_tzpc_2",
+	     "mout_peris_aclk_peris_66_user",
+	     CG_CTRL_VAL_ACLK_PERIS_SECURE_TZPC, 2, 0, 0),
+	GATE(CLK_GOUT_PERIS_PCLK_TZPC_1, "gout_peris_pclk_tzpc_1",
+	     "mout_peris_aclk_peris_66_user",
+	     CG_CTRL_VAL_ACLK_PERIS_SECURE_TZPC, 1, 0, 0),
+	GATE(CLK_GOUT_PERIS_PCLK_TZPC_0, "gout_peris_pclk_tzpc_0",
+	     "mout_peris_aclk_peris_66_user",
+	     CG_CTRL_VAL_ACLK_PERIS_SECURE_TZPC, 0, 0, 0),
+	GATE(CLK_GOUT_PERIS_PCLK_TOP_RTC, "gout_peris_pclk_top_rtc",
+	     "mout_peris_aclk_peris_66_user", CG_CTRL_VAL_ACLK_PERIS_SECURE_RTC,
+	     0, 0, 0),
+	GATE(CLK_GOUT_PERIS_PCLK_SFR_APBIF_CHIPID,
+	     "gout_peris_pclk_sfr_apbif_chipid",
+	     "mout_peris_aclk_peris_66_user",
+	     CG_CTRL_VAL_ACLK_PERIS_SECURE_CHIPID, 0, CLK_IGNORE_UNUSED, 0),
+	/* reading CG_CTRL_VAL_SCLK_PERIS_SECURE_OTP causes an abort */
+	GATE(CLK_GOUT_PERIS_SCLK_CHIPID, "gout_peris_sclk_chipid", "oscclk",
+	     CG_CTRL_VAL_SCLK_PERIS_SECURE_CHIPID, 0, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_PERIS_SCLK_TMU, "gout_peris_sclk_tmu", "oscclk",
+	     CG_CTRL_VAL_SCLK_PERIS, 0, 0, 0),
+	GATE(CLK_GOUT_PERIS_SCLK_PROMISE_PERIS, "gout_peris_sclk_promise_peris",
+	     "gout_top_sclk_promise_int", CG_CTRL_VAL_SCLK_PERIS_PROMISE, 0,
+	     CLK_IGNORE_UNUSED, 0),
+};
+
+static const struct samsung_cmu_info peris_cmu_info __initconst = {
+	.mux_clks		= peris_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(peris_mux_clks),
+	.gate_clks		= peris_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(peris_gate_clks),
+	.nr_clk_ids		= PERIS_NR_CLK,
+	.clk_regs		= peris_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(peris_clk_regs),
+};
+
+static void __init exynos8890_cmu_peris_init(struct device_node *np)
+{
+	exynos8890_init_clocks(np, &peris_cmu_info);
+	samsung_cmu_register_one(np, &peris_cmu_info);
+}
+
+/* Register CMU_PERIS early, as it's needed for MCT timer */
+CLK_OF_DECLARE(exynos8890_cmu_peris, "samsung,exynos8890-cmu-peris",
+	       exynos8890_cmu_peris_init);
+
+/* ---- CMU_APOLLO --------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_APOLLO (0x11900000) */
+#define APOLLO_PLL_LOCK				0x0000
+#define APOLLO_PLL_CON0				0x0100
+#define APOLLO_PLL_CON1				0x0104
+#define APOLLO_PLL_FREQ_DET			0x010C
+#define CLK_CON_MUX_APOLLO_PLL			0x0200
+#define CLK_CON_MUX_BUS_PLL_APOLLO_USER		0x0204
+#define CLK_CON_MUX_APOLLO			0x0208
+#define CLK_CON_DIV_APOLLO			0x0400
+#define CLK_CON_DIV_ACLK_APOLLO			0x0404
+#define CLK_CON_DIV_ATCLK_APOLLO		0x0408
+#define CLK_CON_DIV_PCLK_DBG_APOLLO		0x040C
+#define CLK_CON_DIV_PCLK_APOLLO			0x0410
+#define CLK_CON_DIV_CNTCLK_APOLLO		0x0414
+#define CLK_CON_DIV_APOLLO_RUN_MONITOR		0x0418
+#define CLK_CON_DIV_SCLK_PROMISE_APOLLO		0x041C
+#define CLK_CON_DIV_APOLLO_PLL			0x0420
+#define CLK_STAT_MUX_APOLLO_PLL			0x0600
+#define CLK_STAT_MUX_BUS_PLL_APOLLO_USER	0x0604
+#define CLK_STAT_MUX_APOLLO			0x0608
+#define CLK_ENABLE_ACLK_APOLLO			0x0800
+#define CLK_ENABLE_ATCLK_APOLLO			0x0804
+#define CLK_ENABLE_PCLK_DBG_APOLLO		0x0900
+#define CLK_ENABLE_PCLK_APOLLO			0x0904
+#define CLK_ENABLE_PCLK_HPM_APOLLO		0x0908
+#define CLK_ENABLE_SCLK_APOLLO			0x0A00
+#define CLK_ENABLE_SCLK_PROMISE_APOLLO		0x0A04
+#define CLKOUT_CMU_APOLLO			0x0C00
+#define CLKOUT_CMU_APOLLO_DIV_STAT		0x0C04
+#define CLK_ENABLE_PDN_APOLLO			0x0D00
+#define APOLLO_SFR_IGNORE_REQ_SYSCLK		0x0D04
+#define CMU_APOLLO_SPARE0			0x0D08
+#define CMU_APOLLO_SPARE1			0x0D0C
+#define ARMCLK_STOPCTRL_APOLLO			0x1000
+#define PWR_CTRL_APOLLO				0x1020
+#define PWR_CTRL2_APOLLO			0x1024
+#define PWR_CTRL3_APOLLO			0x1028
+#define PWR_CTRL4_APOLLO			0x102C
+#define INTR_SPREAD_ENABLE_APOLLO		0x1080
+#define INTR_SPREAD_USE_STANDBYWFI_APOLLO	0x1084
+#define INTR_SPREAD_BLOCKING_DURATION_APOLLO	0x1088
+
+static const unsigned long apollo_clk_regs[] __initconst = {
+	APOLLO_PLL_LOCK,
+	APOLLO_PLL_CON0,
+	APOLLO_PLL_CON1,
+	APOLLO_PLL_FREQ_DET,
+	CLK_CON_MUX_APOLLO_PLL,
+	CLK_CON_MUX_BUS_PLL_APOLLO_USER,
+	CLK_CON_MUX_APOLLO,
+	CLK_CON_DIV_APOLLO,
+	CLK_CON_DIV_ACLK_APOLLO,
+	CLK_CON_DIV_ATCLK_APOLLO,
+	CLK_CON_DIV_PCLK_DBG_APOLLO,
+	CLK_CON_DIV_PCLK_APOLLO,
+	CLK_CON_DIV_CNTCLK_APOLLO,
+	CLK_CON_DIV_APOLLO_RUN_MONITOR,
+	CLK_CON_DIV_SCLK_PROMISE_APOLLO,
+	CLK_CON_DIV_APOLLO_PLL,
+	CLK_STAT_MUX_APOLLO_PLL,
+	CLK_STAT_MUX_BUS_PLL_APOLLO_USER,
+	CLK_STAT_MUX_APOLLO,
+	CLK_ENABLE_ACLK_APOLLO,
+	CLK_ENABLE_ATCLK_APOLLO,
+	CLK_ENABLE_PCLK_DBG_APOLLO,
+	CLK_ENABLE_PCLK_APOLLO,
+	CLK_ENABLE_PCLK_HPM_APOLLO,
+	CLK_ENABLE_SCLK_APOLLO,
+	CLK_ENABLE_SCLK_PROMISE_APOLLO,
+	CLKOUT_CMU_APOLLO,
+	CLKOUT_CMU_APOLLO_DIV_STAT,
+	CLK_ENABLE_PDN_APOLLO,
+	APOLLO_SFR_IGNORE_REQ_SYSCLK,
+	CMU_APOLLO_SPARE0,
+	CMU_APOLLO_SPARE1,
+	ARMCLK_STOPCTRL_APOLLO,
+	PWR_CTRL_APOLLO,
+	PWR_CTRL2_APOLLO,
+	PWR_CTRL3_APOLLO,
+	PWR_CTRL4_APOLLO,
+	INTR_SPREAD_ENABLE_APOLLO,
+	INTR_SPREAD_USE_STANDBYWFI_APOLLO,
+	INTR_SPREAD_BLOCKING_DURATION_APOLLO,
+};
+
+static const struct samsung_pll_rate_table apollo_pll_rates[] __initconst = {
+	PLL_35XX_RATE(26 * MHZ, 1976000000U, 228, 3, 0),
+	PLL_35XX_RATE(26 * MHZ, 1898000000U, 219, 3, 0),
+	PLL_35XX_RATE(26 * MHZ, 1794000000U, 207, 3, 0),
+	PLL_35XX_RATE(26 * MHZ, 1690000000U, 195, 3, 0),
+	PLL_35XX_RATE(26 * MHZ, 1586000000U, 183, 3, 0),
+	PLL_35XX_RATE(26 * MHZ, 1482000000U, 171, 3, 0),
+	PLL_35XX_RATE(26 * MHZ, 1378000000U, 159, 3, 0),
+	PLL_35XX_RATE(26 * MHZ, 1274000000U, 147, 3, 0),
+	PLL_35XX_RATE(26 * MHZ, 1170000000U, 135, 3, 0),
+	PLL_35XX_RATE(26 * MHZ, 1066000000U, 123, 3, 0),
+	PLL_35XX_RATE(26 * MHZ, 962000000U, 222, 3, 1),
+	PLL_35XX_RATE(26 * MHZ, 858000000U, 198, 3, 1),
+	PLL_35XX_RATE(26 * MHZ, 754000000U, 174, 3, 1),
+	PLL_35XX_RATE(26 * MHZ, 650000000U, 150, 3, 1),
+	PLL_35XX_RATE(26 * MHZ, 546000000U, 126, 3, 1),
+	PLL_35XX_RATE(26 * MHZ, 442000000U, 204, 3, 2),
+	PLL_35XX_RATE(26 * MHZ, 338000000U, 156, 3, 2),
+	PLL_35XX_RATE(26 * MHZ, 234000000U, 216, 3, 3),
+	PLL_35XX_RATE(26 * MHZ, 130000000U, 120, 3, 3),
+};
+
+static const struct samsung_pll_clock apollo_pll_clks[] __initconst = {
+	PLL(pll_141xx, CLK_FOUT_APOLLO_PLL, "fout_apollo_pll", "oscclk", APOLLO_PLL_LOCK,
+	    APOLLO_PLL_CON0, apollo_pll_rates),
+};
+
+/* List of parent clocks for Muxes in CMU_APOLLO*/
+PNAME(apollo_mux_apollo_pll_p)		= { "oscclk", "fout_apollo_pll" };
+PNAME(apollo_mux_bus_pll_apollo_user_p)	= { "oscclk",
+					    "gout_top_sclk_bus_pll_apollo" };
+PNAME(apollo_mux_apollo_p)		= { "mout_apollo_apollo_pll",
+					    "mout_apollo_bus_pll_apollo_user" };
+
+static const struct samsung_mux_clock apollo_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_APOLLO_APOLLO_PLL, "mout_apollo_apollo_pll",
+	    apollo_mux_apollo_pll_p, CLK_CON_MUX_APOLLO_PLL, 12, 1),
+	MUX(CLK_MOUT_APOLLO_BUS_PLL_APOLLO_USER,
+	    "mout_apollo_bus_pll_apollo_user", apollo_mux_bus_pll_apollo_user_p,
+	    CLK_CON_MUX_BUS_PLL_APOLLO_USER, 12, 1),
+	MUX(CLK_MOUT_APOLLO_APOLLO, "mout_apollo_apollo", apollo_mux_apollo_p,
+	    CLK_CON_MUX_APOLLO, 12, 1),
+};
+
+static const struct samsung_div_clock apollo_div_clks[] __initconst = {
+	DIV(CLK_DOUT_APOLLO_APOLLO, "dout_apollo_apollo", "mout_apollo_apollo",
+	    CLK_CON_DIV_APOLLO, 0, 6),
+	DIV(CLK_DOUT_APOLLO_ACLK_APOLLO, "dout_apollo_aclk_apollo",
+	    "dout_apollo_apollo", CLK_CON_DIV_ACLK_APOLLO, 0, 3),
+	DIV(CLK_DOUT_APOLLO_ATCLK_APOLLO, "dout_apollo_atclk_apollo",
+	    "dout_apollo_apollo", CLK_CON_DIV_ATCLK_APOLLO, 0, 4),
+	DIV(CLK_DOUT_APOLLO_PCLK_DBG_APOLLO, "dout_apollo_pclk_dbg_apollo",
+	    "dout_apollo_apollo", CLK_CON_DIV_PCLK_DBG_APOLLO, 0, 4),
+	DIV(CLK_DOUT_APOLLO_PCLK_APOLLO, "dout_apollo_pclk_apollo",
+	    "dout_apollo_apollo", CLK_CON_DIV_PCLK_APOLLO, 0, 4),
+	DIV(CLK_DOUT_APOLLO_CNTCLK_APOLLO, "dout_apollo_cntclk_apollo",
+	    "dout_apollo_apollo", CLK_CON_DIV_CNTCLK_APOLLO, 0, 4),
+	DIV(CLK_DOUT_APOLLO_APOLLO_RUN_MONITOR,
+	    "dout_apollo_apollo_run_monitor", "dout_apollo_apollo",
+	    CLK_CON_DIV_APOLLO_RUN_MONITOR, 0, 3),
+	DIV(CLK_DOUT_APOLLO_SCLK_PROMISE_APOLLO,
+	    "dout_apollo_sclk_promise_apollo", "mout_apollo_apollo",
+	    CLK_CON_DIV_SCLK_PROMISE_APOLLO, 0, 3),
+	DIV(CLK_DOUT_APOLLO_APOLLO_PLL, "dout_apollo_apollo_pll",
+	    "mout_apollo_apollo", CLK_CON_DIV_APOLLO_PLL, 0, 3),
+};
+
+static const struct samsung_gate_clock apollo_gate_clks[] __initconst = {
+	GATE(CLK_GOUT_APOLLO_ACLK_ASYNCACES_APOLLO_CCI,
+	     "gout_apollo_aclk_asyncaces_apollo_cci", "dout_apollo_aclk_apollo",
+	     CLK_ENABLE_ACLK_APOLLO, 0, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_APOLLO_ACLK_ASATBSLV_APOLLO3_CSSYS,
+	     "gout_apollo_aclk_asatbslv_apollo3_cssys",
+	     "dout_apollo_atclk_apollo", CLK_ENABLE_ATCLK_APOLLO, 3,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_APOLLO_ACLK_ASATBSLV_APOLLO2_CSSYS,
+	     "gout_apollo_aclk_asatbslv_apollo2_cssys",
+	     "dout_apollo_atclk_apollo", CLK_ENABLE_ATCLK_APOLLO, 2,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_APOLLO_ACLK_ASATBSLV_APOLLO1_CSSYS,
+	     "gout_apollo_aclk_asatbslv_apollo1_cssys",
+	     "dout_apollo_atclk_apollo", CLK_ENABLE_ATCLK_APOLLO, 1,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_APOLLO_ACLK_ASATBSLV_APOLLO0_CSSYS,
+	     "gout_apollo_aclk_asatbslv_apollo0_cssys",
+	     "dout_apollo_atclk_apollo", CLK_ENABLE_ATCLK_APOLLO, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_APOLLO_PCLKDBG_DUMP_PC_APOLLO,
+	     "gout_apollo_pclkdbg_dump_pc_apollo",
+	     "dout_apollo_pclk_dbg_apollo", CLK_ENABLE_PCLK_DBG_APOLLO, 1,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_APOLLO_PCLKDBG_ASAPBMST_CSSYS_APOLLO,
+	     "gout_apollo_pclkdbg_asapbmst_cssys_apollo",
+	     "dout_apollo_pclk_dbg_apollo", CLK_ENABLE_PCLK_DBG_APOLLO, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_APOLLO_PCLK_SYSREG_APOLLO,
+	     "gout_apollo_pclk_sysreg_apollo", "dout_apollo_pclk_apollo",
+	     CLK_ENABLE_PCLK_APOLLO, 3, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_APOLLO_PCLK_PMU_APOLLO, "gout_apollo_pclk_pmu_apollo",
+	     "dout_apollo_pclk_apollo", CLK_ENABLE_PCLK_APOLLO, 2,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_APOLLO_PCLK_AXI2APB_APOLLO_ACLK,
+	     "gout_apollo_pclk_axi2apb_apollo_aclk", "dout_apollo_pclk_apollo",
+	     CLK_ENABLE_PCLK_APOLLO, 1, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_APOLLO_PCLK_XIU_PERI_APOLLO_ACLK,
+	     "gout_apollo_pclk_xiu_peri_apollo_aclk", "dout_apollo_pclk_apollo",
+	     CLK_ENABLE_PCLK_APOLLO, 0, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_APOLLO_PCLK_HPM_APOLLO, "gout_apollo_pclk_hpm_apollo",
+	     "dout_apollo_pclk_apollo", CLK_ENABLE_PCLK_HPM_APOLLO, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_APOLLO_SCLK_APOLLO, "gout_apollo_sclk_apollo",
+	     "dout_apollo_apollo", CLK_ENABLE_SCLK_APOLLO, 0, CLK_IGNORE_UNUSED,
+	     0),
+	GATE(CLK_GOUT_APOLLO_SCLK_PROMISE_APOLLO,
+	     "gout_apollo_sclk_promise_apollo",
+	     "dout_apollo_sclk_promise_apollo", CLK_ENABLE_SCLK_PROMISE_APOLLO,
+	     0, CLK_IGNORE_UNUSED, 0),
+};
+
+static const struct samsung_cmu_info apollo_cmu_info __initconst = {
+	.pll_clks		= apollo_pll_clks,
+	.nr_pll_clks		= ARRAY_SIZE(apollo_pll_clks),
+	.mux_clks		= apollo_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(apollo_mux_clks),
+	.div_clks		= apollo_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(apollo_div_clks),
+	.gate_clks		= apollo_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(apollo_gate_clks),
+	.nr_clk_ids		= APOLLO_NR_CLK,
+	.clk_regs		= apollo_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(apollo_clk_regs),
+};
+
+/* ---- CMU_AUD ------------------------------------------------------------ */
+
+/* Register Offset definitions for CMU_AUD (0x114C0000) */
+#define CLK_CON_MUX_AUD_PLL_USER	0x0200
+#define CLK_CON_MUX_SCLK_I2S		0x0204
+#define CLK_CON_MUX_SCLK_PCM		0x0208
+#define CLK_CON_MUX_CP2AP_AUD_CLK_USER	0x020C
+#define CLK_CON_MUX_ACLK_CA5		0x0210
+#define CLK_CON_MUX_CDCLK_AUD		0x0214
+#define CLK_CON_DIV_AUD_CA5		0x0400
+#define CLK_CON_DIV_ACLK_AUD		0x0404
+#define CLK_CON_DIV_PCLK_DBG		0x0408
+#define CLK_CON_DIV_ATCLK_AUD		0x040C
+#define CLK_CON_DIV_AUD_CDCLK		0x0410
+#define CLK_CON_DIV_SCLK_I2S		0x0414
+#define CLK_CON_DIV_SCLK_PCM		0x0418
+#define CLK_CON_DIV_SCLK_SLIMBUS	0x041C
+#define CLK_CON_DIV_SCLK_CP_I2S		0x0424
+#define CLK_CON_DIV_SCLK_ASRC		0x0428
+#define CLK_CON_DIV_CP_CA5		0x042C
+#define CLK_CON_DIV_CP_CDCLK		0x0430
+#define CLK_STAT_MUX_AUD_PLL_USER	0x0600
+#define CLK_STAT_MUX_CP2AP_AUD_CLK_USER	0x060C
+#define CLK_STAT_MUX_ACLK_CA5		0x0610
+#define CLK_STAT_MUX_CDCLK_AUD		0x0614
+#define CLK_ENABLE_SCLK_CA5		0x0800
+#define CLK_ENABLE_ACLK_AUD		0x0804
+#define CLK_ENABLE_PCLK_AUD		0x0808
+#define CLK_ENABLE_ACLK_ATCLK_AUD	0x080C
+#define CLK_ENABLE_SCLK_I2S		0x0810
+#define CLK_ENABLE_SCLK_PCM		0x0814
+#define CLK_ENABLE_SCLK_SLIMBUS		0x0818
+#define CLK_ENABLE_SCLK_CP_I2S		0x081C
+#define CLK_ENABLE_SCLK_ASRC		0x0820
+#define CLK_ENABLE_SCLK_SLIMBUS_CLKIN	0x0824
+#define CLK_ENABLE_SCLK_I2S_BCLK	0x0828
+#define CLKOUT_CMU_AUD			0x0D00
+#define CLKOUT_CMU_AUD_DIV_STAT		0x0D04
+#define CMU_AUD_SPARE0			0x0D08
+#define CMU_AUD_SPARE1			0x0D0C
+#define CLK_ENABLE_PDN_AUD		0x0E00
+#define AUD_SFR_IGNORE_REQ_SYSCLK	0x0F28
+
+static const unsigned long aud_clk_regs[] __initconst = {
+	CLK_CON_MUX_AUD_PLL_USER,
+	CLK_CON_MUX_SCLK_I2S,
+	CLK_CON_MUX_SCLK_PCM,
+	CLK_CON_MUX_CP2AP_AUD_CLK_USER,
+	CLK_CON_MUX_ACLK_CA5,
+	CLK_CON_MUX_CDCLK_AUD,
+	CLK_CON_DIV_AUD_CA5,
+	CLK_CON_DIV_ACLK_AUD,
+	CLK_CON_DIV_PCLK_DBG,
+	CLK_CON_DIV_ATCLK_AUD,
+	CLK_CON_DIV_AUD_CDCLK,
+	CLK_CON_DIV_SCLK_I2S,
+	CLK_CON_DIV_SCLK_PCM,
+	CLK_CON_DIV_SCLK_SLIMBUS,
+	CLK_CON_DIV_SCLK_CP_I2S,
+	CLK_CON_DIV_SCLK_ASRC,
+	CLK_CON_DIV_CP_CA5,
+	CLK_CON_DIV_CP_CDCLK,
+	CLK_STAT_MUX_AUD_PLL_USER,
+	CLK_STAT_MUX_CP2AP_AUD_CLK_USER,
+	CLK_STAT_MUX_ACLK_CA5,
+	CLK_STAT_MUX_CDCLK_AUD,
+	CLK_ENABLE_SCLK_CA5,
+	CLK_ENABLE_ACLK_AUD,
+	CLK_ENABLE_PCLK_AUD,
+	CLK_ENABLE_ACLK_ATCLK_AUD,
+	CLK_ENABLE_SCLK_I2S,
+	CLK_ENABLE_SCLK_PCM,
+	CLK_ENABLE_SCLK_SLIMBUS,
+	CLK_ENABLE_SCLK_CP_I2S,
+	CLK_ENABLE_SCLK_ASRC,
+	CLK_ENABLE_SCLK_SLIMBUS_CLKIN,
+	CLK_ENABLE_SCLK_I2S_BCLK,
+	CLKOUT_CMU_AUD,
+	CLKOUT_CMU_AUD_DIV_STAT,
+	CMU_AUD_SPARE0,
+	CMU_AUD_SPARE1,
+	CLK_ENABLE_PDN_AUD,
+	AUD_SFR_IGNORE_REQ_SYSCLK,
+};
+
+PNAME(aud_mux_aud_pll_user_p)		= { "oscclk", "fout_aud_pll" };
+PNAME(aud_mux_sclk_i2s_p)		= { "mout_aud_cdclk_aud",
+					    "ioclk_audiocdclk0" };
+PNAME(aud_mux_sclk_pcm_p)		= { "mout_aud_cdclk_aud",
+					    "ioclk_audiocdclk0" };
+PNAME(aud_mux_cp2ap_aud_clk_user_p)	= { "oscclk",
+					    "sclk_cp2ap_aud_clk" };
+PNAME(aud_mux_aclk_ca5_p)		= { "dout_aud_aud_ca5",
+					    "dout_aud_cp_ca5" };
+PNAME(aud_mux_cdclk_aud_p)		= { "dout_aud_aud_cdclk",
+					    "dout_aud_cp_cdclk" };
+
+static const struct samsung_mux_clock aud_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_AUD_AUD_PLL_USER, "mout_aud_aud_pll_user",
+	    aud_mux_aud_pll_user_p, CLK_CON_MUX_AUD_PLL_USER, 12, 1),
+	MUX(CLK_MOUT_AUD_SCLK_I2S, "mout_aud_sclk_i2s", aud_mux_sclk_i2s_p,
+	    CLK_CON_MUX_SCLK_I2S, 12, 1),
+	MUX(CLK_MOUT_AUD_SCLK_PCM, "mout_aud_sclk_pcm", aud_mux_sclk_pcm_p,
+	    CLK_CON_MUX_SCLK_PCM, 12, 1),
+	MUX(CLK_MOUT_AUD_CP2AP_AUD_CLK_USER, "mout_aud_cp2ap_aud_clk_user",
+	    aud_mux_cp2ap_aud_clk_user_p, CLK_CON_MUX_CP2AP_AUD_CLK_USER, 12,
+	    1),
+	MUX(CLK_MOUT_AUD_ACLK_CA5, "mout_aud_aclk_ca5", aud_mux_aclk_ca5_p,
+	    CLK_CON_MUX_ACLK_CA5, 12, 1),
+	MUX(CLK_MOUT_AUD_CDCLK_AUD, "mout_aud_cdclk_aud", aud_mux_cdclk_aud_p,
+	    CLK_CON_MUX_CDCLK_AUD, 12, 1),
+};
+
+static const struct samsung_div_clock aud_div_clks[] __initconst = {
+	DIV(CLK_DOUT_AUD_AUD_CA5, "dout_aud_aud_ca5", "mout_aud_aud_pll_user",
+	    CLK_CON_DIV_AUD_CA5, 0, 4),
+	DIV(CLK_DOUT_AUD_ACLK_AUD, "dout_aud_aclk_aud", "mout_aud_aclk_ca5",
+	    CLK_CON_DIV_ACLK_AUD, 0, 4),
+	DIV(CLK_DOUT_AUD_PCLK_DBG, "dout_aud_pclk_dbg", "mout_aud_aclk_ca5",
+	    CLK_CON_DIV_PCLK_DBG, 0, 4),
+	DIV(CLK_DOUT_AUD_ATCLK_AUD, "dout_aud_atclk_aud", "mout_aud_aclk_ca5",
+	    CLK_CON_DIV_ATCLK_AUD, 0, 4),
+	DIV(CLK_DOUT_AUD_AUD_CDCLK, "dout_aud_aud_cdclk",
+	    "mout_aud_aud_pll_user", CLK_CON_DIV_AUD_CDCLK, 0, 4),
+	DIV(CLK_DOUT_AUD_SCLK_I2S, "dout_aud_sclk_i2s", "mout_aud_sclk_i2s",
+	    CLK_CON_DIV_SCLK_I2S, 0, 4),
+	DIV(CLK_DOUT_AUD_SCLK_PCM, "dout_aud_sclk_pcm", "mout_aud_sclk_pcm",
+	    CLK_CON_DIV_SCLK_PCM, 0, 8),
+	DIV(CLK_DOUT_AUD_SCLK_SLIMBUS, "dout_aud_sclk_slimbus",
+	    "mout_aud_cdclk_aud", CLK_CON_DIV_SCLK_SLIMBUS, 0, 5),
+	DIV(CLK_DOUT_AUD_SCLK_CP_I2S, "dout_aud_sclk_cp_i2s",
+	    "mout_aud_cdclk_aud", CLK_CON_DIV_SCLK_CP_I2S, 0, 6),
+	DIV(CLK_DOUT_AUD_SCLK_ASRC, "dout_aud_sclk_asrc", "mout_aud_cdclk_aud",
+	    CLK_CON_DIV_SCLK_ASRC, 0, 5),
+	DIV(CLK_DOUT_AUD_CP_CA5, "dout_aud_cp_ca5",
+	    "mout_aud_cp2ap_aud_clk_user", CLK_CON_DIV_CP_CA5, 0, 5),
+	DIV(CLK_DOUT_AUD_CP_CDCLK, "dout_aud_cp_cdclk",
+	    "mout_aud_cp2ap_aud_clk_user", CLK_CON_DIV_CP_CDCLK, 0, 5),
+};
+
+static const struct samsung_fixed_rate_clock aud_fixed_clks[] __initconst = {
+	FRATE(CLK_SCLK_CP2AP_AUD_CLK, "sclk_cp2ap_aud_clk", NULL, 0, 30000000),
+	FRATE(CLK_IOCLK_AUDIOCDCLK0, "ioclk_audiocdclk0", NULL, 0, 30000000),
+	FRATE(CLK_IOCLK_SLIMBUS_CLK, "ioclk_slimbus_clk", NULL, 0, 30000000),
+	FRATE(CLK_IOCLK_I2S_BCLK, "ioclk_i2s_bclk", NULL, 0, 30000000),
+};
+
+static const struct samsung_gate_clock aud_gate_clks[] __initconst = {
+	GATE(CLK_GOUT_AUD_SCLK_CA5, "gout_aud_sclk_ca5", "mout_aud_aclk_ca5",
+	     CLK_ENABLE_SCLK_CA5, 0, 0, 0),
+	GATE(CLK_GOUT_AUD_PCLK_PPMU_AUD, "gout_aud_pclk_ppmu_aud",
+	     "dout_aud_aclk_aud", CLK_ENABLE_ACLK_AUD, 20, 0, 0),
+	GATE(CLK_GOUT_AUD_PCLK_CP_I2S, "gout_aud_pclk_cp_i2s",
+	     "dout_aud_aclk_aud", CLK_ENABLE_ACLK_AUD, 19, 0, 0),
+	GATE(CLK_GOUT_AUD_PCLK_SYSREG_AUD, "gout_aud_pclk_sysreg_aud",
+	     "dout_aud_aclk_aud", CLK_ENABLE_ACLK_AUD, 18, 0, 0),
+	GATE(CLK_GOUT_AUD_PCLK_GPIO_AUD, "gout_aud_pclk_gpio_aud",
+	     "dout_aud_aclk_aud", CLK_ENABLE_ACLK_AUD, 17, 0, 0),
+	GATE(CLK_GOUT_AUD_PCLK_PMU_AUD, "gout_aud_pclk_pmu_aud",
+	     "dout_aud_aclk_aud", CLK_ENABLE_ACLK_AUD, 16, 0, 0),
+	GATE(CLK_GOUT_AUD_PCLK_SLIMBUS, "gout_aud_pclk_slimbus",
+	     "dout_aud_aclk_aud", CLK_ENABLE_ACLK_AUD, 15, 0, 0),
+	GATE(CLK_GOUT_AUD_PCLK_PCM, "gout_aud_pclk_pcm", "dout_aud_aclk_aud",
+	     CLK_ENABLE_ACLK_AUD, 14, 0, 0),
+	GATE(CLK_GOUT_AUD_PCLK_I2S, "gout_aud_pclk_i2s", "dout_aud_aclk_aud",
+	     CLK_ENABLE_ACLK_AUD, 13, 0, 0),
+	GATE(CLK_GOUT_AUD_PCLK_TIMER, "gout_aud_pclk_timer",
+	     "dout_aud_aclk_aud", CLK_ENABLE_ACLK_AUD, 12, 0, 0),
+	GATE(CLK_GOUT_AUD_PCLK_SFR1, "gout_aud_pclk_sfr1", "dout_aud_aclk_aud",
+	     CLK_ENABLE_ACLK_AUD, 11, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_AUD_PCLK_SFR0, "gout_aud_pclk_sfr0", "dout_aud_aclk_aud",
+	     CLK_ENABLE_ACLK_AUD, 10, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_AUD_PCLK_SMMU, "gout_aud_pclk_smmu", "dout_aud_aclk_aud",
+	     CLK_ENABLE_ACLK_AUD, 9, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_AUD_ACLK_PPMU_AUD, "gout_aud_aclk_ppmu_aud",
+	     "dout_aud_aclk_aud", CLK_ENABLE_ACLK_AUD, 8, 0, 0),
+	GATE(CLK_GOUT_AUD_ACLK_INTR, "gout_aud_aclk_intr", "dout_aud_aclk_aud",
+	     CLK_ENABLE_ACLK_AUD, 7, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_AUD_ACLK_XIU_LPASSX, "gout_aud_aclk_xiu_lpassx",
+	     "dout_aud_aclk_aud", CLK_ENABLE_ACLK_AUD, 6, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_AUD_ACLK_SMMU, "gout_aud_aclk_smmu", "dout_aud_aclk_aud",
+	     CLK_ENABLE_ACLK_AUD, 5, 0, 0),
+	GATE(CLK_GOUT_AUD_ACLK_AXI_LH_ASYNC_SI_TOP,
+	     "gout_aud_aclk_axi_lh_async_si_top", "dout_aud_aclk_aud",
+	     CLK_ENABLE_ACLK_AUD, 4, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_AUD_ACLK_AXI_LH_ASYNC_MI_TOP,
+	     "gout_aud_aclk_axi_lh_async_mi_top", "dout_aud_aclk_aud",
+	     CLK_ENABLE_ACLK_AUD, 3, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_AUD_ACLK_AXI_US_32TO64, "gout_aud_aclk_axi_us_32to64",
+	     "dout_aud_aclk_aud", CLK_ENABLE_ACLK_AUD, 2, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_AUD_ACLK_SRAMC, "gout_aud_aclk_sramc",
+	     "dout_aud_aclk_aud", CLK_ENABLE_ACLK_AUD, 1, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_AUD_ACLK_DMAC, "gout_aud_aclk_dmac", "dout_aud_aclk_aud",
+	     CLK_ENABLE_ACLK_AUD, 0, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_AUD_PCLK_DBG, "gout_aud_pclk_dbg", "dout_aud_pclk_dbg",
+	     CLK_ENABLE_PCLK_AUD, 0, 0, 0),
+	GATE(CLK_GOUT_AUD_ACLK_ATCLK_AUD, "gout_aud_aclk_atclk_aud",
+	     "dout_aud_atclk_aud", CLK_ENABLE_ACLK_ATCLK_AUD, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_AUD_SCLK_I2S, "gout_aud_sclk_i2s", "dout_aud_sclk_i2s",
+	     CLK_ENABLE_SCLK_I2S, 0, 0, 0),
+	GATE(CLK_GOUT_AUD_SCLK_PCM, "gout_aud_sclk_pcm", "dout_aud_sclk_pcm",
+	     CLK_ENABLE_SCLK_PCM, 0, 0, 0),
+	GATE(CLK_GOUT_AUD_SCLK_SLIMBUS, "gout_aud_sclk_slimbus",
+	     "dout_aud_sclk_slimbus", CLK_ENABLE_SCLK_SLIMBUS, 0, 0, 0),
+	GATE(CLK_GOUT_AUD_SCLK_CP_I2S, "gout_aud_sclk_cp_i2s",
+	     "dout_aud_sclk_cp_i2s", CLK_ENABLE_SCLK_CP_I2S, 0, 0, 0),
+	GATE(CLK_GOUT_AUD_SCLK_ASRC, "gout_aud_sclk_asrc", "dout_aud_sclk_asrc",
+	     CLK_ENABLE_SCLK_ASRC, 0, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_AUD_SCLK_SLIMBUS_CLKIN, "gout_aud_sclk_slimbus_clkin",
+	     "ioclk_slimbus_clk", CLK_ENABLE_SCLK_SLIMBUS_CLKIN, 0, 0, 0),
+	GATE(CLK_GOUT_AUD_SCLK_I2S_BCLK, "gout_aud_sclk_i2s_bclk",
+	     "ioclk_i2s_bclk", CLK_ENABLE_SCLK_I2S_BCLK, 0, 0, 0),
+};
+
+static const struct samsung_cmu_info aud_cmu_info __initconst = {
+	.mux_clks		= aud_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(aud_mux_clks),
+	.div_clks		= aud_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(aud_div_clks),
+	.gate_clks		= aud_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(aud_gate_clks),
+	.fixed_clks		= aud_fixed_clks,
+	.nr_fixed_clks		= ARRAY_SIZE(aud_fixed_clks),
+	.nr_clk_ids		= AUD_NR_CLK,
+	.clk_regs		= aud_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(aud_clk_regs),
+};
+
+/* ---- CMU_BUS0 ----------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_BUS0 (0x13400000) */
+#define CLK_CON_MUX_ACLK_BUS0_528_USER	0x0200
+#define CLK_CON_MUX_ACLK_BUS0_200_USER	0x0204
+#define CLK_CON_MUX_PCLK_BUS0_132_USER	0x0208
+#define CLK_STAT_MUX_ACLK_BUS0_528_USER	0x0600
+#define CLK_STAT_MUX_ACLK_BUS0_200_USER	0x0604
+#define CLK_STAT_MUX_PCLK_BUS0_132_USER	0x0608
+#define CLK_ENABLE_ACLK_BUS0_528_BUS0	0x0800
+#define CLK_ENABLE_ACLK_BUS0_200_BUS0	0x0804
+#define CLK_ENABLE_PCLK_BUS0_132_BUS0	0x0900
+#define CG_CTRL_VAL_ACLK_BUS0_528_BUS0	0x0800
+#define CG_CTRL_VAL_ACLK_BUS0_200_BUS0	0x0804
+#define CG_CTRL_VAL_PCLK_BUS0_132_BUS0	0x0900
+#define CLKOUT_CMU_BUS0			0x0D00
+#define CLKOUT_CMU_BUS0_DIV_STAT	0x0D04
+#define CMU_BUS0_SPARE0			0x0D08
+#define CMU_BUS0_SPARE1			0x0D0C
+#define CLK_ENABLE_PDN_BUS0		0x0E00
+#define BUS0_SFR_IGNORE_REQ_SYSCLK	0x0F28
+#define CG_CTRL_MAN_ACLK_BUS0_528	0x1800
+#define CG_CTRL_MAN_ACLK_BUS0_200	0x1804
+#define CG_CTRL_MAN_PCLK_BUS0_132	0x1900
+#define CG_CTRL_STAT_ACLK_BUS0_528_0	0x1C00
+#define CG_CTRL_STAT_ACLK_BUS0_528_1	0x1C04
+#define CG_CTRL_STAT_ACLK_BUS0_200	0x1C08
+#define CG_CTRL_STAT_PCLK_BUS0_132_0	0x1D00
+#define CG_CTRL_STAT_PCLK_BUS0_132_1	0x1D04
+#define CG_CTRL_STAT_PCLK_BUS0_132_2	0x1D08
+#define QCH_CTRL_TREX_D_BUS0		0x2000
+#define QCH_CTRL_CAM0_D			0x2004
+#define QCH_CTRL_CAM1_D			0x2008
+#define QCH_CTRL_DISP00_D		0x200C
+#define QCH_CTRL_DISP01_D		0x2010
+#define QCH_CTRL_DISP10_D		0x2014
+#define QCH_CTRL_DISP11_D		0x201C
+#define QCH_CTRL_ISP0_D			0x2020
+#define QCH_CTRL_FSYS1_D		0x2024
+#define QCH_CTRL_TREX_P_BUS0		0x2100
+#define QCH_CTRL_ISP0_SFR		0x2104
+#define QCH_CTRL_ISP1_SFR		0x2108
+#define QCH_CTRL_DISP0_SFR		0x210C
+#define QCH_CTRL_DISP1_SFR		0x2110
+#define QCH_CTRL_PERIS_SFR		0x2114
+#define QCH_CTRL_PERIC0_SFR		0x2118
+#define QCH_CTRL_PERIC1_SFR		0x211C
+#define QCH_CTRL_FSYS1_SFR		0x2120
+#define QCH_CTRL_SYSREG_BUS0		0x2124
+#define QCH_CTRL_PMU_BUS0		0x2128
+#define QCH_CTRL_CMU_BUS0		0x212C
+
+static const unsigned long bus0_clk_regs[] __initconst = {
+	CLK_CON_MUX_ACLK_BUS0_528_USER,
+	CLK_CON_MUX_ACLK_BUS0_200_USER,
+	CLK_CON_MUX_PCLK_BUS0_132_USER,
+	CLK_STAT_MUX_ACLK_BUS0_528_USER,
+	CLK_STAT_MUX_ACLK_BUS0_200_USER,
+	CLK_STAT_MUX_PCLK_BUS0_132_USER,
+	CLK_ENABLE_ACLK_BUS0_528_BUS0,
+	CLK_ENABLE_ACLK_BUS0_200_BUS0,
+	CLK_ENABLE_PCLK_BUS0_132_BUS0,
+	CG_CTRL_VAL_ACLK_BUS0_528_BUS0,
+	CG_CTRL_VAL_ACLK_BUS0_200_BUS0,
+	CG_CTRL_VAL_PCLK_BUS0_132_BUS0,
+	CLKOUT_CMU_BUS0,
+	CLKOUT_CMU_BUS0_DIV_STAT,
+	CMU_BUS0_SPARE0,
+	CMU_BUS0_SPARE1,
+	CLK_ENABLE_PDN_BUS0,
+	BUS0_SFR_IGNORE_REQ_SYSCLK,
+	CG_CTRL_MAN_ACLK_BUS0_528,
+	CG_CTRL_MAN_ACLK_BUS0_200,
+	CG_CTRL_MAN_PCLK_BUS0_132,
+	CG_CTRL_STAT_ACLK_BUS0_528_0,
+	CG_CTRL_STAT_ACLK_BUS0_528_1,
+	CG_CTRL_STAT_ACLK_BUS0_200,
+	CG_CTRL_STAT_PCLK_BUS0_132_0,
+	CG_CTRL_STAT_PCLK_BUS0_132_1,
+	CG_CTRL_STAT_PCLK_BUS0_132_2,
+	QCH_CTRL_TREX_D_BUS0,
+	QCH_CTRL_CAM0_D,
+	QCH_CTRL_CAM1_D,
+	QCH_CTRL_DISP00_D,
+	QCH_CTRL_DISP01_D,
+	QCH_CTRL_DISP10_D,
+	QCH_CTRL_DISP11_D,
+	QCH_CTRL_ISP0_D,
+	QCH_CTRL_FSYS1_D,
+	QCH_CTRL_TREX_P_BUS0,
+	QCH_CTRL_ISP0_SFR,
+	QCH_CTRL_ISP1_SFR,
+	QCH_CTRL_DISP0_SFR,
+	QCH_CTRL_DISP1_SFR,
+	QCH_CTRL_PERIS_SFR,
+	QCH_CTRL_PERIC0_SFR,
+	QCH_CTRL_PERIC1_SFR,
+	QCH_CTRL_FSYS1_SFR,
+	QCH_CTRL_SYSREG_BUS0,
+	QCH_CTRL_PMU_BUS0,
+	QCH_CTRL_CMU_BUS0,
+};
+
+PNAME(bus0_mux_aclk_bus0_528_user_p)	= { "oscclk",
+					    "gout_top_aclk_bus0_528" };
+PNAME(bus0_mux_aclk_bus0_200_user_p)	= { "oscclk",
+					    "gout_top_aclk_bus0_200" };
+PNAME(bus0_mux_pclk_bus0_132_user_p)	= { "oscclk",
+					    "gout_top_pclk_bus0_132" };
+
+static const struct samsung_mux_clock bus0_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_BUS0_ACLK_BUS0_528_USER, "mout_bus0_aclk_bus0_528_user",
+	    bus0_mux_aclk_bus0_528_user_p, CLK_CON_MUX_ACLK_BUS0_528_USER, 12,
+	    1),
+	MUX(CLK_MOUT_BUS0_ACLK_BUS0_200_USER, "mout_bus0_aclk_bus0_200_user",
+	    bus0_mux_aclk_bus0_200_user_p, CLK_CON_MUX_ACLK_BUS0_200_USER, 12,
+	    1),
+	MUX(CLK_MOUT_BUS0_PCLK_BUS0_132_USER, "mout_bus0_pclk_bus0_132_user",
+	    bus0_mux_pclk_bus0_132_user_p, CLK_CON_MUX_PCLK_BUS0_132_USER, 12,
+	    1),
+};
+
+static const struct samsung_gate_clock bus0_gate_clks[] __initconst = {
+	GATE(CLK_GOUT_BUS0_ACLK_ACE_FSYS1, "gout_bus0_aclk_ace_fsys1",
+	     "mout_bus0_aclk_bus0_528_user", CG_CTRL_VAL_ACLK_BUS0_528_BUS0, 8,
+	     0, 0),
+	GATE(CLK_GOUT_BUS0_ACLK_LH_ISP0, "gout_bus0_aclk_lh_isp0",
+	     "mout_bus0_aclk_bus0_528_user", CG_CTRL_VAL_ACLK_BUS0_528_BUS0, 7,
+	     0, 0),
+	GATE(CLK_GOUT_BUS0_ACLK_LH_DISP11, "gout_bus0_aclk_lh_disp11",
+	     "mout_bus0_aclk_bus0_528_user", CG_CTRL_VAL_ACLK_BUS0_528_BUS0, 6,
+	     0, 0),
+	GATE(CLK_GOUT_BUS0_ACLK_LH_DISP10, "gout_bus0_aclk_lh_disp10",
+	     "mout_bus0_aclk_bus0_528_user", CG_CTRL_VAL_ACLK_BUS0_528_BUS0, 5,
+	     0, 0),
+	GATE(CLK_GOUT_BUS0_ACLK_LH_DISP01, "gout_bus0_aclk_lh_disp01",
+	     "mout_bus0_aclk_bus0_528_user", CG_CTRL_VAL_ACLK_BUS0_528_BUS0, 4,
+	     0, 0),
+	GATE(CLK_GOUT_BUS0_ACLK_LH_DISP00, "gout_bus0_aclk_lh_disp00",
+	     "mout_bus0_aclk_bus0_528_user", CG_CTRL_VAL_ACLK_BUS0_528_BUS0, 3,
+	     0, 0),
+	GATE(CLK_GOUT_BUS0_ACLK_LH_CAM1, "gout_bus0_aclk_lh_cam1",
+	     "mout_bus0_aclk_bus0_528_user", CG_CTRL_VAL_ACLK_BUS0_528_BUS0, 2,
+	     0, 0),
+	GATE(CLK_GOUT_BUS0_ACLK_LH_CAM0, "gout_bus0_aclk_lh_cam0",
+	     "mout_bus0_aclk_bus0_528_user", CG_CTRL_VAL_ACLK_BUS0_528_BUS0, 1,
+	     0, 0),
+	GATE(CLK_GOUT_BUS0_ACLK_TREX_BUS0, "gout_bus0_aclk_trex_bus0",
+	     "mout_bus0_aclk_bus0_528_user", CG_CTRL_VAL_ACLK_BUS0_528_BUS0, 0,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_BUS0_ACLK_LH_FSYS1, "gout_bus0_aclk_lh_fsys1",
+	     "mout_bus0_aclk_bus0_200_user", CG_CTRL_VAL_ACLK_BUS0_200_BUS0, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_BUS0_PCLK_CMU_BUS0, "gout_bus0_pclk_cmu_bus0",
+	     "mout_bus0_pclk_bus0_132_user", CG_CTRL_VAL_PCLK_BUS0_132_BUS0, 16,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_BUS0_PCLK_TREX_BUS0, "gout_bus0_pclk_trex_bus0",
+	     "mout_bus0_pclk_bus0_132_user", CG_CTRL_VAL_PCLK_BUS0_132_BUS0, 15,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_BUS0_PCLK_PMU_BUS0, "gout_bus0_pclk_pmu_bus0",
+	     "mout_bus0_pclk_bus0_132_user", CG_CTRL_VAL_PCLK_BUS0_132_BUS0, 14,
+	     0, 0),
+	GATE(CLK_GOUT_BUS0_PCLK_SYSREG_BUS0, "gout_bus0_pclk_sysreg_bus0",
+	     "mout_bus0_pclk_bus0_132_user", CG_CTRL_VAL_PCLK_BUS0_132_BUS0, 13,
+	     0, 0),
+	GATE(CLK_GOUT_BUS0_PCLK_LH_FSYS1SFRX, "gout_bus0_pclk_lh_fsys1sfrx",
+	     "mout_bus0_pclk_bus0_132_user", CG_CTRL_VAL_PCLK_BUS0_132_BUS0, 12,
+	     0, 0),
+	GATE(CLK_GOUT_BUS0_PCLK_LH_PERIC1P, "gout_bus0_pclk_lh_peric1p",
+	     "mout_bus0_pclk_bus0_132_user", CG_CTRL_VAL_PCLK_BUS0_132_BUS0, 11,
+	     0, 0),
+	GATE(CLK_GOUT_BUS0_PCLK_LH_PERIC0P, "gout_bus0_pclk_lh_peric0p",
+	     "mout_bus0_pclk_bus0_132_user", CG_CTRL_VAL_PCLK_BUS0_132_BUS0, 10,
+	     0, 0),
+	GATE(CLK_GOUT_BUS0_PCLK_LH_PERISFRX, "gout_bus0_pclk_lh_perisfrx",
+	     "mout_bus0_pclk_bus0_132_user", CG_CTRL_VAL_PCLK_BUS0_132_BUS0, 9,
+	     0, 0),
+	GATE(CLK_GOUT_BUS0_PCLK_LH_DISP1SFRX, "gout_bus0_pclk_lh_disp1sfrx",
+	     "mout_bus0_pclk_bus0_132_user", CG_CTRL_VAL_PCLK_BUS0_132_BUS0, 8,
+	     0, 0),
+	GATE(CLK_GOUT_BUS0_PCLK_LH_DISP0SFRX, "gout_bus0_pclk_lh_disp0sfrx",
+	     "mout_bus0_pclk_bus0_132_user", CG_CTRL_VAL_PCLK_BUS0_132_BUS0, 7,
+	     0, 0),
+	GATE(CLK_GOUT_BUS0_PCLK_LH_ISPHX, "gout_bus0_pclk_lh_isphx",
+	     "mout_bus0_pclk_bus0_132_user", CG_CTRL_VAL_PCLK_BUS0_132_BUS0, 6,
+	     0, 0),
+	GATE(CLK_GOUT_BUS0_PCLK_LH_IS0X, "gout_bus0_pclk_lh_is0x",
+	     "mout_bus0_pclk_bus0_132_user", CG_CTRL_VAL_PCLK_BUS0_132_BUS0, 5,
+	     0, 0),
+	GATE(CLK_GOUT_BUS0_PCLK_AXI2APB_2MB_BUS0_TP,
+	     "gout_bus0_pclk_axi2apb_2mb_bus0_tp",
+	     "mout_bus0_pclk_bus0_132_user", CG_CTRL_VAL_PCLK_BUS0_132_BUS0, 4,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_BUS0_PCLK_AHB2APB_BUS0P, "gout_bus0_pclk_ahb2apb_bus0p",
+	     "mout_bus0_pclk_bus0_132_user", CG_CTRL_VAL_PCLK_BUS0_132_BUS0, 3,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_BUS0_PCLK_AXI2APB_2MB_BUS0_TD,
+	     "gout_bus0_pclk_axi2apb_2mb_bus0_td",
+	     "mout_bus0_pclk_bus0_132_user", CG_CTRL_VAL_PCLK_BUS0_132_BUS0, 2,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_BUS0_PCLK_TREX_P_BUS0, "gout_bus0_pclk_trex_p_bus0",
+	     "mout_bus0_pclk_bus0_132_user", CG_CTRL_VAL_PCLK_BUS0_132_BUS0, 1,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_BUS0_ACLK_TREX_P_BUS0, "gout_bus0_aclk_trex_p_bus0",
+	     "mout_bus0_pclk_bus0_132_user", CG_CTRL_VAL_PCLK_BUS0_132_BUS0, 0,
+	     CLK_IS_CRITICAL, 0),
+};
+
+static const struct samsung_cmu_info bus0_cmu_info __initconst = {
+	.mux_clks		= bus0_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(bus0_mux_clks),
+	.gate_clks		= bus0_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(bus0_gate_clks),
+	.nr_clk_ids		= BUS0_NR_CLK,
+	.clk_regs		= bus0_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(bus0_clk_regs),
+};
+
+/* ---- CMU_BUS1----------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_BUS1 (0x14800000) */
+#define CLK_CON_MUX_ACLK_BUS1_528_USER	0x0200
+#define CLK_CON_MUX_PCLK_BUS1_132_USER	0x0204
+#define CLK_STAT_MUX_ACLK_BUS1_528_USER	0x0600
+#define CLK_STAT_MUX_PCLK_BUS1_132_USER	0x0604
+#define CLK_ENABLE_ACLK_BUS1_528_BUS1	0x0800
+#define CLK_ENABLE_PCLK_BUS1_132_BUS1	0x0900
+#define CG_CTRL_VAL_ACLK_BUS1_528_BUS1	0x0800
+#define CG_CTRL_VAL_PCLK_BUS1_132_BUS1	0x0900
+#define CLKOUT_CMU_BUS1			0x0D00
+#define CLKOUT_CMU_BUS1_DIV_STAT	0x0D04
+#define CMU_BUS1_SPARE0			0x0D08
+#define CMU_BUS1_SPARE1			0x0D0C
+#define CLK_ENABLE_PDN_BUS1		0x0E00
+#define BUS1_SFR_IGNORE_REQ_SYSCLK	0x0F28
+#define CG_CTRL_MAN_ACLK_BUS1_528	0x1800
+#define CG_CTRL_MAN_PCLK_BUS1_132	0x1900
+#define CG_CTRL_STAT_ACLK_BUS1_528	0x1C00
+#define CG_CTRL_STAT_PCLK_BUS1_132_0	0x1D00
+#define CG_CTRL_STAT_PCLK_BUS1_132_1	0x1D04
+#define QCH_CTRL_TREX_D_BUS1		0x2000
+#define QCH_CTRL_FSYS0_D		0x2004
+#define QCH_CTRL_MFC0_D			0x2008
+#define QCH_CTRL_MFC1_D			0x200C
+#define QCH_CTRL_MSCL0_D		0x2010
+#define QCH_CTRL_MSCL1_D		0x2014
+#define QCH_CTRL_TREX_P_BUS1		0x2018
+#define QCH_CTRL_FSYS0_SFR		0x201C
+#define QCH_CTRL_MFC_SFR		0x2020
+#define QCH_CTRL_MSCL_SFR		0x2024
+#define QCH_CTRL_PMU_BUS1		0x2028
+#define QCH_CTRL_SYSREG_BUS1		0x202C
+#define QCH_CTRL_CMU_BUS1		0x2030
+
+static const unsigned long bus1_clk_regs[] __initconst = {
+	CLK_CON_MUX_ACLK_BUS1_528_USER,
+	CLK_CON_MUX_PCLK_BUS1_132_USER,
+	CLK_STAT_MUX_ACLK_BUS1_528_USER,
+	CLK_STAT_MUX_PCLK_BUS1_132_USER,
+	CLK_ENABLE_ACLK_BUS1_528_BUS1,
+	CLK_ENABLE_PCLK_BUS1_132_BUS1,
+	CG_CTRL_VAL_ACLK_BUS1_528_BUS1,
+	CG_CTRL_VAL_PCLK_BUS1_132_BUS1,
+	CLKOUT_CMU_BUS1,
+	CLKOUT_CMU_BUS1_DIV_STAT,
+	CMU_BUS1_SPARE0,
+	CMU_BUS1_SPARE1,
+	CLK_ENABLE_PDN_BUS1,
+	BUS1_SFR_IGNORE_REQ_SYSCLK,
+	CG_CTRL_MAN_ACLK_BUS1_528,
+	CG_CTRL_MAN_PCLK_BUS1_132,
+	CG_CTRL_STAT_ACLK_BUS1_528,
+	CG_CTRL_STAT_PCLK_BUS1_132_0,
+	CG_CTRL_STAT_PCLK_BUS1_132_1,
+	QCH_CTRL_TREX_D_BUS1,
+	QCH_CTRL_FSYS0_D,
+	QCH_CTRL_MFC0_D,
+	QCH_CTRL_MFC1_D,
+	QCH_CTRL_MSCL0_D,
+	QCH_CTRL_MSCL1_D,
+	QCH_CTRL_TREX_P_BUS1,
+	QCH_CTRL_FSYS0_SFR,
+	QCH_CTRL_MFC_SFR,
+	QCH_CTRL_MSCL_SFR,
+	QCH_CTRL_PMU_BUS1,
+	QCH_CTRL_SYSREG_BUS1,
+	QCH_CTRL_CMU_BUS1,
+};
+
+PNAME(bus1_mux_aclk_bus1_528_user_p)	= { "oscclk",
+					    "gout_top_aclk_bus1_528" };
+PNAME(bus1_mux_pclk_bus1_132_user_p)	= { "oscclk",
+					    "gout_top_pclk_bus1_132" };
+
+static const struct samsung_mux_clock bus1_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_BUS1_ACLK_BUS1_528_USER, "mout_bus1_aclk_bus1_528_user",
+	    bus1_mux_aclk_bus1_528_user_p, CLK_CON_MUX_ACLK_BUS1_528_USER, 12,
+	    1),
+	MUX(CLK_MOUT_BUS1_PCLK_BUS1_132_USER, "mout_bus1_pclk_bus1_132_user",
+	    bus1_mux_pclk_bus1_132_user_p, CLK_CON_MUX_PCLK_BUS1_132_USER, 12,
+	    1),
+};
+
+static const struct samsung_gate_clock bus1_gate_clks[] __initconst = {
+	GATE(CLK_GOUT_BUS1_ACLK_LH_MSCL1, "gout_bus1_aclk_lh_mscl1",
+	     "mout_bus1_aclk_bus1_528_user", CG_CTRL_VAL_ACLK_BUS1_528_BUS1, 5,
+	     0, 0),
+	GATE(CLK_GOUT_BUS1_ACLK_LH_MSCL0, "gout_bus1_aclk_lh_mscl0",
+	     "mout_bus1_aclk_bus1_528_user", CG_CTRL_VAL_ACLK_BUS1_528_BUS1, 4,
+	     0, 0),
+	GATE(CLK_GOUT_BUS1_ACLK_LH_MFC1, "gout_bus1_aclk_lh_mfc1",
+	     "mout_bus1_aclk_bus1_528_user", CG_CTRL_VAL_ACLK_BUS1_528_BUS1, 3,
+	     0, 0),
+	GATE(CLK_GOUT_BUS1_ACLK_LH_MFC0, "gout_bus1_aclk_lh_mfc0",
+	     "mout_bus1_aclk_bus1_528_user", CG_CTRL_VAL_ACLK_BUS1_528_BUS1, 2,
+	     0, 0),
+	GATE(CLK_GOUT_BUS1_ACLK_LH_FSYS0, "gout_bus1_aclk_lh_fsys0",
+	     "mout_bus1_aclk_bus1_528_user", CG_CTRL_VAL_ACLK_BUS1_528_BUS1, 1,
+	     0, 0),
+	GATE(CLK_GOUT_BUS1_ACLK_TREX_BUS1, "gout_bus1_aclk_trex_bus1",
+	     "mout_bus1_aclk_bus1_528_user", CG_CTRL_VAL_ACLK_BUS1_528_BUS1, 0,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_BUS1_PCLK_CMU_BUS1, "gout_bus1_pclk_cmu_bus1",
+	     "mout_bus1_pclk_bus1_132_user", CG_CTRL_VAL_PCLK_BUS1_132_BUS1, 11,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_BUS1_PCLK_TREX_BUS1, "gout_bus1_pclk_trex_bus1",
+	     "mout_bus1_pclk_bus1_132_user", CG_CTRL_VAL_PCLK_BUS1_132_BUS1, 10,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_BUS1_PCLK_SYSREG_BUS1, "gout_bus1_pclk_sysreg_bus1",
+	     "mout_bus1_pclk_bus1_132_user", CG_CTRL_VAL_PCLK_BUS1_132_BUS1, 9,
+	     0, 0),
+	GATE(CLK_GOUT_BUS1_PCLK_PMU_BUS1, "gout_bus1_pclk_pmu_bus1",
+	     "mout_bus1_pclk_bus1_132_user", CG_CTRL_VAL_PCLK_BUS1_132_BUS1, 8,
+	     0, 0),
+	GATE(CLK_GOUT_BUS1_PCLK_LH_MSCLSFRX, "gout_bus1_pclk_lh_msclsfrx",
+	     "mout_bus1_pclk_bus1_132_user", CG_CTRL_VAL_PCLK_BUS1_132_BUS1, 7,
+	     0, 0),
+	GATE(CLK_GOUT_BUS1_PCLK_LH_MFCP, "gout_bus1_pclk_lh_mfcp",
+	     "mout_bus1_pclk_bus1_132_user", CG_CTRL_VAL_PCLK_BUS1_132_BUS1, 6,
+	     0, 0),
+	GATE(CLK_GOUT_BUS1_PCLK_LH_FSYS0SFRX, "gout_bus1_pclk_lh_fsys0sfrx",
+	     "mout_bus1_pclk_bus1_132_user", CG_CTRL_VAL_PCLK_BUS1_132_BUS1, 5,
+	     0, 0),
+	GATE(CLK_GOUT_BUS1_PCLK_AHB2APB_BUS1P, "gout_bus1_pclk_ahb2apb_bus1p",
+	     "mout_bus1_pclk_bus1_132_user", CG_CTRL_VAL_PCLK_BUS1_132_BUS1, 4,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_BUS1_PCLK_AXI2APB_2MB_BUS1_TP,
+	     "gout_bus1_pclk_axi2apb_2mb_bus1_tp",
+	     "mout_bus1_pclk_bus1_132_user", CG_CTRL_VAL_PCLK_BUS1_132_BUS1, 3,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_BUS1_PCLK_AXI2APB_2MB_BUS1_TD,
+	     "gout_bus1_pclk_axi2apb_2mb_bus1_td",
+	     "mout_bus1_pclk_bus1_132_user", CG_CTRL_VAL_PCLK_BUS1_132_BUS1, 2,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_BUS1_PCLK_TREX_P_BUS1, "gout_bus1_pclk_trex_p_bus1",
+	     "mout_bus1_pclk_bus1_132_user", CG_CTRL_VAL_PCLK_BUS1_132_BUS1, 1,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_BUS1_ACLK_TREX_P_BUS1, "gout_bus1_aclk_trex_p_bus1",
+	     "mout_bus1_pclk_bus1_132_user", CG_CTRL_VAL_PCLK_BUS1_132_BUS1, 0,
+	     CLK_IS_CRITICAL, 0),
+};
+
+static const struct samsung_cmu_info bus1_cmu_info __initconst = {
+	.mux_clks		= bus1_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(bus1_mux_clks),
+	.gate_clks		= bus1_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(bus1_gate_clks),
+	.nr_clk_ids		= BUS1_NR_CLK,
+	.clk_regs		= bus1_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(bus1_clk_regs),
+};
+
+/* ---- CMU_CCORE ---------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_CCORE (0x105B0000) */
+#define CLK_CON_MUX_ACLK_CCORE_800_USER		0x0200
+#define CLK_CON_MUX_ACLK_CCORE_264_USER		0x0204
+#define CLK_CON_MUX_ACLK_CCORE_G3D_800_USER	0x0208
+#define CLK_CON_MUX_ACLK_CCORE_528_USER		0x020C
+#define CLK_CON_MUX_ACLK_CCORE_132_USER		0x0210
+#define CLK_CON_MUX_PCLK_CCORE_66_USER		0x0214
+#define CLK_CON_DIV_SCLK_HPM_CCORE		0x0400
+#define CLK_STAT_MUX_ACLK_CCORE_800_USER	0x0500
+#define CLK_STAT_MUX_ACLK_CCORE_264_USER	0x0504
+#define CLK_STAT_MUX_ACLK_CCORE_G3D_800_USER	0x0508
+#define CLK_STAT_MUX_ACLK_CCORE_528_USER	0x050C
+#define CLK_STAT_MUX_ACLK_CCORE_132_USER	0x0510
+#define CLK_STAT_MUX_PCLK_CCORE_66_USER		0x0514
+#define CLK_ENABLE_ACLK_CCORE0			0x0800
+#define CLK_ENABLE_ACLK_CCORE1			0x0804
+#define CLK_ENABLE_ACLK_CCORE2			0x0808
+#define CLK_ENABLE_ACLK_CCORE3			0x080C
+#define CLK_ENABLE_ACLK_CCORE4			0x0810
+#define CLK_ENABLE_ACLK_CCORE_AP		0x0814
+#define CLK_ENABLE_ACLK_CCORE_CP		0x0818
+#define CLK_ENABLE_PCLK_CCORE_AP		0x0900
+#define CLK_ENABLE_PCLK_CCORE_CP		0x0904
+#define CLK_ENABLE_SCLK_HPM_CCORE		0x0A00
+#define CG_CTRL_VAL_ACLK_CCORE0			0x0800
+#define CG_CTRL_VAL_ACLK_CCORE1			0x0804
+#define CG_CTRL_VAL_ACLK_CCORE2			0x0808
+#define CG_CTRL_VAL_ACLK_CCORE3			0x080C
+#define CG_CTRL_VAL_ACLK_CCORE4			0x0810
+#define CG_CTRL_VAL_ACLK_CCORE_AP		0x0814
+#define CG_CTRL_VAL_ACLK_CCORE_CP		0x0818
+#define CG_CTRL_VAL_PCLK_CCORE_AP		0x0900
+#define CG_CTRL_VAL_PCLK_CCORE_CP		0x0904
+#define CG_CTRL_VAL_SCLK_HPM_CCORE		0x0A00
+#define CLKOUT_CMU_CCORE			0x0C00
+#define CLKOUT_CMU_CCORE_DIV_STAT		0x0C04
+#define CLK_ENABLE_PDN_CCORE			0x0E00
+#define CCORE_SFR_IGNORE_REQ_SYSCLK		0x0F28
+#define PSCDC_CTRL_CCORE			0x1000
+#define CLK_STOPCTRL_CCORE			0x1004
+#define CG_CTRL_MAN_ACLK_CCORE0			0x1800
+#define CG_CTRL_MAN_ACLK_CCORE1			0x1804
+#define CG_CTRL_MAN_ACLK_CCORE2			0x1808
+#define CG_CTRL_MAN_ACLK_CCORE3			0x180C
+#define CG_CTRL_MAN_ACLK_CCORE4			0x1810
+#define CG_CTRL_MAN_ACLK_CCORE_AP		0x1814
+#define CG_CTRL_MAN_ACLK_CCORE_CP		0x1818
+#define CG_CTRL_MAN_PCLK_CCORE_AP		0x1900
+#define CG_CTRL_MAN_PCLK_CCORE_CP		0x1904
+#define CG_CTRL_MAN_SCLK_HPM_CCORE		0x1A00
+#define CG_CTRL_STAT_ACLK_CCORE0_0		0x1C00
+#define CG_CTRL_STAT_ACLK_CCORE0_1		0x1C04
+#define CG_CTRL_STAT_ACLK_CCORE1_0		0x1C08
+#define CG_CTRL_STAT_ACLK_CCORE1_1		0x1C0C
+#define CG_CTRL_STAT_ACLK_CCORE2		0x1C10
+#define CG_CTRL_STAT_ACLK_CCORE3		0x1C14
+#define CG_CTRL_STAT_ACLK_CCORE4_0		0x1C18
+#define CG_CTRL_STAT_ACLK_CCORE4_1		0x1C1C
+#define CG_CTRL_STAT_ACLK_CCORE4_2		0x1C20
+#define CG_CTRL_STAT_ACLK_CCORE4_3		0x1C24
+#define CG_CTRL_STAT_ACLK_CCORE_AP		0x1C28
+#define CG_CTRL_STAT_ACLK_CCORE_CP		0x1C2C
+#define CG_CTRL_STAT_PCLK_CCORE_AP		0x1D00
+#define CG_CTRL_STAT_PCLK_CCORE_CP		0x1D04
+#define CG_CTRL_STAT_SCLK_HPM_CCORE		0x1E00
+#define CMU_CCORE_SPARE0			0x1100
+#define CMU_CCORE_SPARE1			0x1104
+#define QCH_CTRL_TREX_CCORE			0x2000
+#define QCH_CTRL_TREX_P_CCORE			0x2004
+#define QCH_CTRL_LH_G3DIRAM			0x2008
+#define QCH_CTRL_LH_CCORESFRX			0x200C
+#define QCH_CTRL_LH_CPPERI			0x2010
+#define QCH_CTRL_LH_G3D0			0x2014
+#define QCH_CTRL_LH_G3D1			0x2018
+#define QCH_CTRL_LH_AUD				0x201C
+#define QCH_CTRL_LH_IMEM			0x2020
+#define QCH_CTRL_LH_CPDATA			0x2024
+#define QCH_CTRL_LH_AUDP			0x2028
+#define QCH_CTRL_LH_G3DP			0x202C
+#define QCH_CTRL_LH_MIF0P			0x2030
+#define QCH_CTRL_LH_MIF1P			0x2034
+#define QCH_CTRL_LH_MIF2P			0x2038
+#define QCH_CTRL_LH_MIF3P			0x203C
+#define QCH_CTRL_PMU_CCORE			0x2040
+#define QCH_CTRL_SYSREG_CCORE			0x2044
+#define QCH_CTRL_CMU_CCORE			0x2048
+#define QSTATE_CTRL_AXI_AS_MI_MNGSCS_CCORETD	0x2400
+#define QSTATE_CTRL_ATB_APL_MNGS		0x2404
+#define QSTATE_CTRL_APB_AS_MI_MNGSCS_CCOREBDU	0x2408
+#define QSTATE_CTRL_APB_PDU			0x240C
+#define QSTATE_CTRL_HSI2C			0x2410
+#define QSTATE_CTRL_HSI2C_BAT_AP		0x2414
+#define QSTATE_CTRL_HSI2C_BAT_CP		0x2418
+#define QSTATE_CTRL_PROMISE			0x241C
+#define QSTATE_CTRL_AXI_AS_SI_CCORETP_MNGS	0x2420
+#define QSTATE_CTRL_AXI_AS_SI_CCORETP_APL	0x2424
+
+static const unsigned long ccore_clk_regs[] __initconst = {
+	CLK_CON_MUX_ACLK_CCORE_800_USER,
+	CLK_CON_MUX_ACLK_CCORE_264_USER,
+	CLK_CON_MUX_ACLK_CCORE_G3D_800_USER,
+	CLK_CON_MUX_ACLK_CCORE_528_USER,
+	CLK_CON_MUX_ACLK_CCORE_132_USER,
+	CLK_CON_MUX_PCLK_CCORE_66_USER,
+	CLK_CON_DIV_SCLK_HPM_CCORE,
+	CLK_STAT_MUX_ACLK_CCORE_800_USER,
+	CLK_STAT_MUX_ACLK_CCORE_264_USER,
+	CLK_STAT_MUX_ACLK_CCORE_G3D_800_USER,
+	CLK_STAT_MUX_ACLK_CCORE_528_USER,
+	CLK_STAT_MUX_ACLK_CCORE_132_USER,
+	CLK_STAT_MUX_PCLK_CCORE_66_USER,
+	CLK_ENABLE_ACLK_CCORE0,
+	CLK_ENABLE_ACLK_CCORE1,
+	CLK_ENABLE_ACLK_CCORE2,
+	CLK_ENABLE_ACLK_CCORE3,
+	CLK_ENABLE_ACLK_CCORE4,
+	CLK_ENABLE_ACLK_CCORE_AP,
+	CLK_ENABLE_ACLK_CCORE_CP,
+	CLK_ENABLE_PCLK_CCORE_AP,
+	CLK_ENABLE_PCLK_CCORE_CP,
+	CLK_ENABLE_SCLK_HPM_CCORE,
+	CG_CTRL_VAL_ACLK_CCORE0,
+	CG_CTRL_VAL_ACLK_CCORE1,
+	CG_CTRL_VAL_ACLK_CCORE2,
+	CG_CTRL_VAL_ACLK_CCORE3,
+	CG_CTRL_VAL_ACLK_CCORE4,
+	CG_CTRL_VAL_ACLK_CCORE_AP,
+	CG_CTRL_VAL_ACLK_CCORE_CP,
+	CG_CTRL_VAL_PCLK_CCORE_AP,
+	CG_CTRL_VAL_PCLK_CCORE_CP,
+	CG_CTRL_VAL_SCLK_HPM_CCORE,
+	CLKOUT_CMU_CCORE,
+	CLKOUT_CMU_CCORE_DIV_STAT,
+	CLK_ENABLE_PDN_CCORE,
+	CCORE_SFR_IGNORE_REQ_SYSCLK,
+	PSCDC_CTRL_CCORE,
+	CLK_STOPCTRL_CCORE,
+	CG_CTRL_MAN_ACLK_CCORE0,
+	CG_CTRL_MAN_ACLK_CCORE1,
+	CG_CTRL_MAN_ACLK_CCORE2,
+	CG_CTRL_MAN_ACLK_CCORE3,
+	CG_CTRL_MAN_ACLK_CCORE4,
+	CG_CTRL_MAN_ACLK_CCORE_AP,
+	CG_CTRL_MAN_ACLK_CCORE_CP,
+	CG_CTRL_MAN_PCLK_CCORE_AP,
+	CG_CTRL_MAN_PCLK_CCORE_CP,
+	CG_CTRL_MAN_SCLK_HPM_CCORE,
+	CG_CTRL_STAT_ACLK_CCORE0_0,
+	CG_CTRL_STAT_ACLK_CCORE0_1,
+	CG_CTRL_STAT_ACLK_CCORE1_0,
+	CG_CTRL_STAT_ACLK_CCORE1_1,
+	CG_CTRL_STAT_ACLK_CCORE2,
+	CG_CTRL_STAT_ACLK_CCORE3,
+	CG_CTRL_STAT_ACLK_CCORE4_0,
+	CG_CTRL_STAT_ACLK_CCORE4_1,
+	CG_CTRL_STAT_ACLK_CCORE4_2,
+	CG_CTRL_STAT_ACLK_CCORE4_3,
+	CG_CTRL_STAT_ACLK_CCORE_AP,
+	CG_CTRL_STAT_ACLK_CCORE_CP,
+	CG_CTRL_STAT_PCLK_CCORE_AP,
+	CG_CTRL_STAT_PCLK_CCORE_CP,
+	CG_CTRL_STAT_SCLK_HPM_CCORE,
+	CMU_CCORE_SPARE0,
+	CMU_CCORE_SPARE1,
+	QCH_CTRL_TREX_CCORE,
+	QCH_CTRL_TREX_P_CCORE,
+	QCH_CTRL_LH_G3DIRAM,
+	QCH_CTRL_LH_CCORESFRX,
+	QCH_CTRL_LH_CPPERI,
+	QCH_CTRL_LH_G3D0,
+	QCH_CTRL_LH_G3D1,
+	QCH_CTRL_LH_AUD,
+	QCH_CTRL_LH_IMEM,
+	QCH_CTRL_LH_CPDATA,
+	QCH_CTRL_LH_AUDP,
+	QCH_CTRL_LH_G3DP,
+	QCH_CTRL_LH_MIF0P,
+	QCH_CTRL_LH_MIF1P,
+	QCH_CTRL_LH_MIF2P,
+	QCH_CTRL_LH_MIF3P,
+	QCH_CTRL_PMU_CCORE,
+	QCH_CTRL_SYSREG_CCORE,
+	QCH_CTRL_CMU_CCORE,
+	QSTATE_CTRL_AXI_AS_MI_MNGSCS_CCORETD,
+	QSTATE_CTRL_ATB_APL_MNGS,
+	QSTATE_CTRL_APB_AS_MI_MNGSCS_CCOREBDU,
+	QSTATE_CTRL_APB_PDU,
+	QSTATE_CTRL_HSI2C,
+	QSTATE_CTRL_HSI2C_BAT_AP,
+	QSTATE_CTRL_HSI2C_BAT_CP,
+	QSTATE_CTRL_PROMISE,
+	QSTATE_CTRL_AXI_AS_SI_CCORETP_MNGS,
+	QSTATE_CTRL_AXI_AS_SI_CCORETP_APL,
+};
+
+PNAME(ccore_mux_aclk_ccore_800_user_p)		= { "oscclk",
+						    "gout_top_aclk_ccore_800" };
+PNAME(ccore_mux_aclk_ccore_264_user_p)		= { "oscclk",
+						    "gout_top_aclk_ccore_264" };
+PNAME(ccore_mux_aclk_ccore_g3d_800_user_p)	= { "oscclk",
+						    "gout_top_aclk_ccore_g3d_800" };
+PNAME(ccore_mux_aclk_ccore_528_user_p)		= { "oscclk",
+						    "gout_top_aclk_ccore_528" };
+PNAME(ccore_mux_aclk_ccore_132_user_p)		= { "oscclk",
+						    "gout_top_aclk_ccore_132" };
+PNAME(ccore_mux_pclk_ccore_66_user_p)		= { "oscclk",
+						    "gout_top_pclk_ccore_66" };
+
+static const struct samsung_mux_clock ccore_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_CCORE_ACLK_CCORE_800_USER,
+	    "mout_ccore_aclk_ccore_800_user", ccore_mux_aclk_ccore_800_user_p,
+	    CLK_CON_MUX_ACLK_CCORE_800_USER, 12, 1),
+	MUX(CLK_MOUT_CCORE_ACLK_CCORE_264_USER,
+	    "mout_ccore_aclk_ccore_264_user", ccore_mux_aclk_ccore_264_user_p,
+	    CLK_CON_MUX_ACLK_CCORE_264_USER, 12, 1),
+	MUX(CLK_MOUT_CCORE_ACLK_CCORE_G3D_800_USER,
+	    "mout_ccore_aclk_ccore_g3d_800_user",
+	    ccore_mux_aclk_ccore_g3d_800_user_p,
+	    CLK_CON_MUX_ACLK_CCORE_G3D_800_USER, 12, 1),
+	MUX(CLK_MOUT_CCORE_ACLK_CCORE_528_USER,
+	    "mout_ccore_aclk_ccore_528_user", ccore_mux_aclk_ccore_528_user_p,
+	    CLK_CON_MUX_ACLK_CCORE_528_USER, 12, 1),
+	MUX(CLK_MOUT_CCORE_ACLK_CCORE_132_USER,
+	    "mout_ccore_aclk_ccore_132_user", ccore_mux_aclk_ccore_132_user_p,
+	    CLK_CON_MUX_ACLK_CCORE_132_USER, 12, 1),
+	MUX(CLK_MOUT_CCORE_PCLK_CCORE_66_USER, "mout_ccore_pclk_ccore_66_user",
+	    ccore_mux_pclk_ccore_66_user_p, CLK_CON_MUX_PCLK_CCORE_66_USER,
+	    12, 1),
+};
+
+static const struct samsung_div_clock ccore_div_clks[] __initconst = {
+	DIV(CLK_DOUT_CCORE_SCLK_HPM_CCORE, "dout_ccore_sclk_hpm_ccore",
+	    "mout_ccore_aclk_ccore_800_user", CLK_CON_DIV_SCLK_HPM_CCORE, 0, 4),
+};
+
+static const struct samsung_gate_clock ccore_gate_clks[] __initconst = {
+	GATE(CLK_GOUT_CCORE_ACLK_AXI_AS_SI_IRPM,
+	     "gout_ccore_aclk_axi_as_si_irpm", "mout_ccore_aclk_ccore_800_user",
+	     CG_CTRL_VAL_ACLK_CCORE0, 11, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_CCORE_ACLK_MPACEBRIDGE, "gout_ccore_aclk_mpacebridge",
+	     "mout_ccore_aclk_ccore_800_user", CG_CTRL_VAL_ACLK_CCORE0, 10, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_ACLK_PULSE2HS, "gout_ccore_aclk_pulse2hs",
+	     "mout_ccore_aclk_ccore_800_user", CG_CTRL_VAL_ACLK_CCORE0, 9, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_ACLK_DBG_LH_MI_MIF_CCORE,
+	     "gout_ccore_aclk_dbg_lh_mi_mif_ccore",
+	     "mout_ccore_aclk_ccore_800_user", CG_CTRL_VAL_ACLK_CCORE0, 8,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_CCORE_ACLK_SCI_PPC_WRAPPER,
+	     "gout_ccore_aclk_sci_ppc_wrapper",
+	     "mout_ccore_aclk_ccore_800_user", CG_CTRL_VAL_ACLK_CCORE0, 7, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_ACLK_ACE_AS_MI_APL_CCORE,
+	     "gout_ccore_aclk_ace_as_mi_apl_ccore",
+	     "mout_ccore_aclk_ccore_800_user", CG_CTRL_VAL_ACLK_CCORE0, 6, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_ACLK_MPACE_SI, "gout_ccore_aclk_mpace_si",
+	     "mout_ccore_aclk_ccore_800_user", CG_CTRL_VAL_ACLK_CCORE0, 5, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_ACLK_CPACE_MI, "gout_ccore_aclk_cpace_mi",
+	     "mout_ccore_aclk_ccore_800_user", CG_CTRL_VAL_ACLK_CCORE0, 4, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_ACLK_ATB_SI_CCOREBDU_MNGSCS,
+	     "gout_ccore_aclk_atb_si_ccorebdu_mngscs",
+	     "mout_ccore_aclk_ccore_800_user", CG_CTRL_VAL_ACLK_CCORE0, 3, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_ACLK_BDU, "gout_ccore_aclk_bdu",
+	     "mout_ccore_aclk_ccore_800_user", CG_CTRL_VAL_ACLK_CCORE0, 2, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_ACLK_TREX_CCORE_SCI,
+	     "gout_ccore_aclk_trex_ccore_sci", "mout_ccore_aclk_ccore_800_user",
+	     CG_CTRL_VAL_ACLK_CCORE0, 1, 0, 0),
+	GATE(CLK_GOUT_CCORE_ACLK_SCI, "gout_ccore_aclk_sci",
+	     "mout_ccore_aclk_ccore_800_user", CG_CTRL_VAL_ACLK_CCORE0, 0, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_ACLK_CLEANY_CPPERI, "gout_ccore_aclk_cleany_cpperi",
+	     "mout_ccore_aclk_ccore_264_user", CG_CTRL_VAL_ACLK_CCORE1, 9, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_ACLK_AXI_US_CPPERI, "gout_ccore_aclk_axi_us_cpperi",
+	     "mout_ccore_aclk_ccore_264_user", CG_CTRL_VAL_ACLK_CCORE1, 8,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_CCORE_ACLK_AXI_LH_MI_CPPERI_CCORE,
+	     "gout_ccore_aclk_axi_lh_mi_cpperi_ccore",
+	     "mout_ccore_aclk_ccore_264_user", CG_CTRL_VAL_ACLK_CCORE1, 7,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_CCORE_ACLK_AXI_LH_SI_CCORESFRX_IMEMX,
+	     "gout_ccore_aclk_axi_lh_si_ccoresfrx_imemx",
+	     "mout_ccore_aclk_ccore_264_user", CG_CTRL_VAL_ACLK_CCORE1, 6,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_CCORE_ACLK_AXI_LH_MI_G3DXIRAM_CCORESFR,
+	     "gout_ccore_aclk_axi_lh_mi_g3dxiram_ccoresfr",
+	     "mout_ccore_aclk_ccore_264_user", CG_CTRL_VAL_ACLK_CCORE1, 5,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_CCORE_ACLK_AXI_DS_IRPM, "gout_ccore_aclk_axi_ds_irpm",
+	     "mout_ccore_aclk_ccore_264_user", CG_CTRL_VAL_ACLK_CCORE1, 4,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_CCORE_ACLK_XIU_CCORESFRX, "gout_ccore_aclk_xiu_ccoresfrx",
+	     "mout_ccore_aclk_ccore_264_user", CG_CTRL_VAL_ACLK_CCORE1, 3,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_CCORE_ACLK_TREX_P_CCORE_BUS,
+	     "gout_ccore_aclk_trex_p_ccore_bus",
+	     "mout_ccore_aclk_ccore_264_user", CG_CTRL_VAL_ACLK_CCORE1, 2, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_ACLK_TREX_CCORE_PERI,
+	     "gout_ccore_aclk_trex_ccore_peri",
+	     "mout_ccore_aclk_ccore_264_user", CG_CTRL_VAL_ACLK_CCORE1, 1, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_ACLK_AXI_AS_MI_IRPM,
+	     "gout_ccore_aclk_axi_as_mi_irpm", "mout_ccore_aclk_ccore_264_user",
+	     CG_CTRL_VAL_ACLK_CCORE1, 0, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_CCORE_ACLK_TREX_CCORE_G3D,
+	     "gout_ccore_aclk_trex_ccore_g3d",
+	     "mout_ccore_aclk_ccore_g3d_800_user", CG_CTRL_VAL_ACLK_CCORE2, 2,
+	     0, 0),
+	GATE(CLK_GOUT_CCORE_ACLK_ACEL_LH_MI_G3DX1_CCORETD,
+	     "gout_ccore_aclk_acel_lh_mi_g3dx1_ccoretd",
+	     "mout_ccore_aclk_ccore_g3d_800_user", CG_CTRL_VAL_ACLK_CCORE2, 1,
+	     0, 0),
+	GATE(CLK_GOUT_CCORE_ACLK_ACEL_LH_MI_G3DX0_CCORETD,
+	     "gout_ccore_aclk_acel_lh_mi_g3dx0_ccoretd",
+	     "mout_ccore_aclk_ccore_g3d_800_user", CG_CTRL_VAL_ACLK_CCORE2, 0,
+	     0, 0),
+	GATE(CLK_GOUT_CCORE_ACLK_ATB_APL_MNGS, "gout_ccore_aclk_atb_apl_mngs",
+	     "mout_ccore_aclk_ccore_528_user", CG_CTRL_VAL_ACLK_CCORE3, 7, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_ACLK_XIU_CPX, "gout_ccore_aclk_xiu_cpx",
+	     "mout_ccore_aclk_ccore_528_user", CG_CTRL_VAL_ACLK_CCORE3, 6, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_ACLK_CLEANY_CPDATA, "gout_ccore_aclk_cleany_cpdata",
+	     "mout_ccore_aclk_ccore_528_user", CG_CTRL_VAL_ACLK_CCORE3, 5, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_ACLK_AXI_LH_MI_CPDATA_CCORE,
+	     "gout_ccore_aclk_axi_lh_mi_cpdata_ccore",
+	     "mout_ccore_aclk_ccore_528_user", CG_CTRL_VAL_ACLK_CCORE3, 4,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_CCORE_ACLK_AXI_LH_MI_IMEMX_CCORETD,
+	     "gout_ccore_aclk_axi_lh_mi_imemx_ccoretd",
+	     "mout_ccore_aclk_ccore_528_user", CG_CTRL_VAL_ACLK_CCORE3, 3,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_CCORE_ACLK_AXI_LH_MI_AUDX_CCORETD,
+	     "gout_ccore_aclk_axi_lh_mi_audx_ccoretd",
+	     "mout_ccore_aclk_ccore_528_user", CG_CTRL_VAL_ACLK_CCORE3, 2,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_CCORE_ACLK_AXI_AS_MI_MNGSCS_CCORETD,
+	     "gout_ccore_aclk_axi_as_mi_mngscs_ccoretd",
+	     "mout_ccore_aclk_ccore_528_user", CG_CTRL_VAL_ACLK_CCORE3, 1,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_CCORE_ACLK_TREX_CCORE, "gout_ccore_aclk_trex_ccore",
+	     "mout_ccore_aclk_ccore_528_user", CG_CTRL_VAL_ACLK_CCORE3, 0, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_PCLK_CMU, "gout_ccore_pclk_cmu",
+	     "mout_ccore_aclk_ccore_132_user", CG_CTRL_VAL_ACLK_CCORE4, 30,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_CCORE_PCLK_HPM_APBIF, "gout_ccore_pclk_hpm_apbif",
+	     "mout_ccore_aclk_ccore_132_user", CG_CTRL_VAL_ACLK_CCORE4, 29,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_CCORE_PCLK_SCI, "gout_ccore_pclk_sci",
+	     "mout_ccore_aclk_ccore_132_user", CG_CTRL_VAL_ACLK_CCORE4, 28, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_PCLK_GPIO_CCORE, "gout_ccore_pclk_gpio_ccore",
+	     "mout_ccore_aclk_ccore_132_user", CG_CTRL_VAL_ACLK_CCORE4, 27, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_PCLK_S_MAILBOX, "gout_ccore_pclk_s_mailbox",
+	     "mout_ccore_aclk_ccore_132_user", CG_CTRL_VAL_ACLK_CCORE4, 26, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_PCLK_MAILBOX, "gout_ccore_pclk_mailbox",
+	     "mout_ccore_aclk_ccore_132_user", CG_CTRL_VAL_ACLK_CCORE4, 25, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_PCLK_SYSREG_CCORE, "gout_ccore_pclk_sysreg_ccore",
+	     "mout_ccore_aclk_ccore_132_user", CG_CTRL_VAL_ACLK_CCORE4, 24, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_PCLK_GPIO_APBIF_ALIVE,
+	     "gout_ccore_pclk_gpio_apbif_alive",
+	     "mout_ccore_aclk_ccore_132_user", CG_CTRL_VAL_ACLK_CCORE4, 23,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_CCORE_PCLK_SCI_PPC_WRAPPER,
+	     "gout_ccore_pclk_sci_ppc_wrapper",
+	     "mout_ccore_aclk_ccore_132_user", CG_CTRL_VAL_ACLK_CCORE4, 22, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_PCLK_VT_MON_APB, "gout_ccore_pclk_vt_mon_apb",
+	     "mout_ccore_aclk_ccore_132_user", CG_CTRL_VAL_ACLK_CCORE4, 21, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_PCLK_PMU_CCORE, "gout_ccore_pclk_pmu_ccore",
+	     "mout_ccore_aclk_ccore_132_user", CG_CTRL_VAL_ACLK_CCORE4, 20, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_PCLK_PMU_APBIF, "gout_ccore_pclk_pmu_apbif",
+	     "mout_ccore_aclk_ccore_132_user", CG_CTRL_VAL_ACLK_CCORE4, 19,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_CCORE_PCLK_CMU_TOPC_APBIF,
+	     "gout_ccore_pclk_cmu_topc_apbif", "mout_ccore_aclk_ccore_132_user",
+	     CG_CTRL_VAL_ACLK_CCORE4, 18, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_CCORE_PCLK_AXI2APB_CORESIGHT,
+	     "gout_ccore_pclk_axi2apb_coresight",
+	     "mout_ccore_aclk_ccore_132_user", CG_CTRL_VAL_ACLK_CCORE4, 17,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_CCORE_PCLK_AXI2APB_TREX_P_CCORE,
+	     "gout_ccore_pclk_axi2apb_trex_p_ccore",
+	     "mout_ccore_aclk_ccore_132_user", CG_CTRL_VAL_ACLK_CCORE4, 16,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_CCORE_PCLK_AXI2APB_TREX_CCORE,
+	     "gout_ccore_pclk_axi2apb_trex_ccore",
+	     "mout_ccore_aclk_ccore_132_user", CG_CTRL_VAL_ACLK_CCORE4, 15,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_CCORE_PCLK_AXI2APB_CCORE, "gout_ccore_pclk_axi2apb_ccore",
+	     "mout_ccore_aclk_ccore_132_user", CG_CTRL_VAL_ACLK_CCORE4, 14,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_CCORE_PCLK_TREX_P_CCORE, "gout_ccore_pclk_trex_p_ccore",
+	     "mout_ccore_aclk_ccore_132_user", CG_CTRL_VAL_ACLK_CCORE4, 13, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_PCLK_TREX_CCORE, "gout_ccore_pclk_trex_ccore",
+	     "mout_ccore_aclk_ccore_132_user", CG_CTRL_VAL_ACLK_CCORE4, 12, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_PCLK_BDU, "gout_ccore_pclk_bdu",
+	     "mout_ccore_aclk_ccore_132_user", CG_CTRL_VAL_ACLK_CCORE4, 11, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_ACLK_AXI_LH_SI_CCORETP_MIF3P,
+	     "gout_ccore_aclk_axi_lh_si_ccoretp_mif3p",
+	     "mout_ccore_aclk_ccore_132_user", CG_CTRL_VAL_ACLK_CCORE4, 10, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_ACLK_AXI_LH_SI_CCORETP_MIF2P,
+	     "gout_ccore_aclk_axi_lh_si_ccoretp_mif2p",
+	     "mout_ccore_aclk_ccore_132_user", CG_CTRL_VAL_ACLK_CCORE4, 9, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_ACLK_AXI_LH_SI_CCORETP_MIF1P,
+	     "gout_ccore_aclk_axi_lh_si_ccoretp_mif1p",
+	     "mout_ccore_aclk_ccore_132_user", CG_CTRL_VAL_ACLK_CCORE4, 8, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_ACLK_AXI_LH_SI_CCORETP_MIF0P,
+	     "gout_ccore_aclk_axi_lh_si_ccoretp_mif0p",
+	     "mout_ccore_aclk_ccore_132_user", CG_CTRL_VAL_ACLK_CCORE4, 7, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_ACLK_AXI_LH_SI_CCORETP_G3DP,
+	     "gout_ccore_aclk_axi_lh_si_ccoretp_g3dp",
+	     "mout_ccore_aclk_ccore_132_user", CG_CTRL_VAL_ACLK_CCORE4, 6, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_ACLK_AXI_LH_SI_CCORETP_AUDX,
+	     "gout_ccore_aclk_axi_lh_si_ccoretp_audx",
+	     "mout_ccore_aclk_ccore_132_user", CG_CTRL_VAL_ACLK_CCORE4, 5, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_ACLK_AXI_AS_SI_CCORETP_APL,
+	     "gout_ccore_aclk_axi_as_si_ccoretp_apl",
+	     "mout_ccore_aclk_ccore_132_user", CG_CTRL_VAL_ACLK_CCORE4, 4, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_ACLK_AXI_AS_SI_CCORETP_MNGS,
+	     "gout_ccore_aclk_axi_as_si_ccoretp_mngs",
+	     "mout_ccore_aclk_ccore_132_user", CG_CTRL_VAL_ACLK_CCORE4, 3, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_ACLK_APB_AS_MI_CCORETP_MNGSCS,
+	     "gout_ccore_aclk_apb_as_mi_ccoretp_mngscs",
+	     "mout_ccore_aclk_ccore_132_user", CG_CTRL_VAL_ACLK_CCORE4, 2, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_ACLK_APB_AS_MI_MNGSCS_CCOREBDU,
+	     "gout_ccore_aclk_apb_as_mi_mngscs_ccorebdu",
+	     "mout_ccore_aclk_ccore_132_user", CG_CTRL_VAL_ACLK_CCORE4, 1, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_ACLK_TREX_P_CCORE, "gout_ccore_aclk_trex_p_ccore",
+	     "mout_ccore_aclk_ccore_132_user", CG_CTRL_VAL_ACLK_CCORE4, 0, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_PCLK_APBASYNC_BAT_AP,
+	     "gout_ccore_pclk_apbasync_bat_ap",
+	     "mout_ccore_aclk_ccore_132_user", CG_CTRL_VAL_ACLK_CCORE_AP, 0, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_PCLK_APBASYNC_BAT_CP,
+	     "gout_ccore_pclk_apbasync_bat_cp",
+	     "mout_ccore_aclk_ccore_132_user", CG_CTRL_VAL_ACLK_CCORE_CP, 0, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_PCLK_HSI2C_BAT_AP, "gout_ccore_pclk_hsi2c_bat_ap",
+	     "mout_ccore_pclk_ccore_66_user", CG_CTRL_VAL_PCLK_CCORE_AP, 1, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_PCLK_HSI2C, "gout_ccore_pclk_hsi2c",
+	     "mout_ccore_pclk_ccore_66_user", CG_CTRL_VAL_PCLK_CCORE_AP, 0, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_PCLK_HSI2C_BAT_CP, "gout_ccore_pclk_hsi2c_bat_cp",
+	     "mout_ccore_pclk_ccore_66_user", CG_CTRL_VAL_PCLK_CCORE_CP, 1, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_PCLK_HSI2C_CP, "gout_ccore_pclk_hsi2c_cp",
+	     "mout_ccore_pclk_ccore_66_user", CG_CTRL_VAL_PCLK_CCORE_CP, 0, 0,
+	     0),
+	GATE(CLK_GOUT_CCORE_SCLK_PROMISE, "gout_ccore_sclk_promise",
+	     "dout_ccore_sclk_hpm_ccore", CG_CTRL_VAL_SCLK_HPM_CCORE, 0,
+	     CLK_IGNORE_UNUSED, 0),
+};
+
+static const struct samsung_cmu_info ccore_cmu_info __initconst = {
+	.mux_clks		= ccore_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(ccore_mux_clks),
+	.div_clks		= ccore_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(ccore_div_clks),
+	.gate_clks		= ccore_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(ccore_gate_clks),
+	.nr_clk_ids		= CCORE_NR_CLK,
+	.clk_regs		= ccore_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(ccore_clk_regs),
+};
+
+/* ---- CMU_DISP0 ---------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_DISP0 (0x13AD0000) */
+#define DISP_PLL_LOCK						0x0000
+#define DISP_PLL_CON0						0x0100
+#define DISP_PLL_CON1						0x0104
+#define DISP_PLL_FREQ_DET					0x010C
+#define CLK_CON_MUX_DISP_PLL					0x0200
+#define CLK_CON_MUX_ACLK_DISP0_0_400_USER			0x0204
+#define CLK_CON_MUX_ACLK_DISP0_1_400_USER			0x0208
+#define CLK_CON_MUX_SCLK_DISP0_DECON0_ECLK0_USER		0x020C
+#define CLK_CON_MUX_SCLK_DISP0_DECON0_VCLK0_USER		0x0210
+#define CLK_CON_MUX_SCLK_DISP0_DECON0_VCLK1_USER		0x0214
+#define CLK_CON_MUX_SCLK_DISP0_HDMI_AUDIO_USER			0x0218
+#define CLK_CON_MUX_PHYCLK_HDMIPHY_PIXEL_CLKO_USER		0x021C
+#define CLK_CON_MUX_PHYCLK_HDMIPHY_TMDS_CLKO_USER		0x0220
+#define CLK_CON_MUX_PHYCLK_MIPIDPHY0_RXCLKESC0_USER		0x0224
+#define CLK_CON_MUX_PHYCLK_MIPIDPHY0_BITCLKDIV2_USER_DISP0	0x0228
+#define CLK_CON_MUX_PHYCLK_MIPIDPHY0_BITCLKDIV8_USER		0x022C
+#define CLK_CON_MUX_PHYCLK_MIPIDPHY1_RXCLKESC0_USER		0x0230
+#define CLK_CON_MUX_PHYCLK_MIPIDPHY1_BITCLKDIV2_USER_DISP0	0x0234
+#define CLK_CON_MUX_PHYCLK_MIPIDPHY1_BITCLKDIV8_USER		0x0238
+#define CLK_CON_MUX_PHYCLK_MIPIDPHY2_RXCLKESC0_USER		0x023C
+#define CLK_CON_MUX_PHYCLK_MIPIDPHY2_BITCLKDIV2_USER_DISP0	0x0240
+#define CLK_CON_MUX_PHYCLK_MIPIDPHY2_BITCLKDIV8_USER		0x0244
+#define CLK_CON_MUX_PHYCLK_DPPHY_CH0_TXD_CLK_USER		0x0248
+#define CLK_CON_MUX_PHYCLK_DPPHY_CH1_TXD_CLK_USER		0x024C
+#define CLK_CON_MUX_PHYCLK_DPPHY_CH2_TXD_CLK_USER		0x0250
+#define CLK_CON_MUX_PHYCLK_DPPHY_CH3_TXD_CLK_USER		0x0254
+#define CLK_CON_MUX_ACLK_DISP0_1_400_DISP0			0x0258
+#define CLK_CON_MUX_SCLK_DISP0_DECON0_ECLK0_DISP0		0x025C
+#define CLK_CON_MUX_SCLK_DISP0_DECON0_VCLK0_DISP0		0x0260
+#define CLK_CON_MUX_SCLK_DISP0_DECON0_VCLK1_DISP0		0x0264
+#define CLK_CON_MUX_SCLK_DISP0_HDMI_AUDIO_DISP0			0x0268
+#define CLK_CON_DIV_PCLK_DISP0_0_133				0x0400
+#define CLK_CON_DIV_SCLK_DECON0_ECLK0				0x0404
+#define CLK_CON_DIV_SCLK_DECON0_VCLK0				0x0408
+#define CLK_CON_DIV_SCLK_DECON0_VCLK1				0x040C
+#define CLK_CON_DIV_PHYCLK_HDMIPHY_PIXEL_CLKO			0x0410
+#define CLK_CON_DIV_PHYCLK_HDMIPHY_TMDS_20B_CLKO		0x0414
+#define CLK_CON_DSM_DIV_M_SCLK_HDMI_AUDIO			0x0500
+#define CLK_CON_DSM_DIV_N_SCLK_HDMI_AUDIO			0x0504
+#define CLK_STAT_MUX_DISP_PLL					0x0600
+#define CLK_STAT_MUX_ACLK_DISP0_0_400_USER			0x0604
+#define CLK_STAT_MUX_ACLK_DISP0_1_400_USER			0x0608
+#define CLK_STAT_MUX_SCLK_DISP0_HDMI_AUDIO_USER			0x060C
+#define CLK_STAT_MUX_SCLK_DISP0_DECON0_ECLK0_USER		0x0610
+#define CLK_STAT_MUX_SCLK_DISP0_DECON0_VCLK0_USER		0x0614
+#define CLK_STAT_MUX_SCLK_DISP0_DECON0_VCLK1_USER		0x0618
+#define CLK_STAT_MUX_PHYCLK_HDMIPHY_PIXEL_CLKO_USER		0x061C
+#define CLK_STAT_MUX_PHYCLK_HDMIPHY_TMDS_CLKO_USER		0x0620
+#define CLK_STAT_MUX_PHYCLK_MIPIDPHY0_RXCLKESC0_USER		0x0624
+#define CLK_STAT_MUX_PHYCLK_MIPIDPHY0_BITCLKDIV2_USER_DISP0	0x0628
+#define CLK_STAT_MUX_PHYCLK_MIPIDPHY0_BITCLKDIV8_USER		0x062C
+#define CLK_STAT_MUX_PHYCLK_MIPIDPHY1_RXCLKESC0_USER		0x0630
+#define CLK_STAT_MUX_PHYCLK_MIPIDPHY1_BITCLKDIV2_USER_DISP0	0x0634
+#define CLK_STAT_MUX_PHYCLK_MIPIDPHY1_BITCLKDIV8_USER		0x0638
+#define CLK_STAT_MUX_PHYCLK_MIPIDPHY2_RXCLKESC0_USER		0x063C
+#define CLK_STAT_MUX_PHYCLK_MIPIDPHY2_BITCLKDIV2_USER_DISP0	0x0640
+#define CLK_STAT_MUX_PHYCLK_MIPIDPHY2_BITCLKDIV8_USER		0x0644
+#define CLK_STAT_MUX_PHYCLK_DPPHY_CH0_TXD_CLK_USER		0x0648
+#define CLK_STAT_MUX_PHYCLK_DPPHY_CH1_TXD_CLK_USER		0x064C
+#define CLK_STAT_MUX_PHYCLK_DPPHY_CH2_TXD_CLK_USER		0x0650
+#define CLK_STAT_MUX_PHYCLK_DPPHY_CH3_TXD_CLK_USER		0x0654
+#define CLK_STAT_MUX_ACLK_DISP0_1_400_DISP0			0x0658
+#define CLK_STAT_MUX_SCLK_DISP0_DECON0_ECLK0_DISP0		0x065C
+#define CLK_STAT_MUX_SCLK_DISP0_DECON0_VCLK0_DISP0		0x0660
+#define CLK_STAT_MUX_SCLK_DISP0_DECON0_VCLK1_DISP0		0x0664
+#define CLK_STAT_MUX_SCLK_DISP0_HDMI_AUDIO_DISP0		0x0668
+#define CG_CTRL_VAL_ACLK_DISP0_0_400				0x0800
+#define CG_CTRL_VAL_ACLK_DISP0_1_400				0x0804
+#define CG_CTRL_VAL_ACLK_DISP0_0_400_SECURE_SFW_DISP0_0		0x0808
+#define CG_CTRL_VAL_ACLK_DISP0_1_400_SECURE_SFW_DISP0_1		0x080C
+#define CG_CTRL_VAL_PCLK_DISP0_0_133				0x0820
+#define CG_CTRL_VAL_PCLK_DISP0_0_133_HPM_APBIF_DISP0		0x0824
+#define CG_CTRL_VAL_PCLK_DISP0_0_133_SECURE_DECON0		0x0828
+#define CG_CTRL_VAL_PCLK_DISP0_0_133_SECURE_VPP0		0x082C
+#define CG_CTRL_VAL_PCLK_DISP0_0_133_SECURE_SFW_DISP0_0		0x0830
+#define CG_CTRL_VAL_PCLK_DISP0_0_133_SECURE_SFW_DISP0_1		0x0834
+#define CG_CTRL_VAL_SCLK_DISP1_400				0x0840
+#define CG_CTRL_VAL_SCLK_DECON0_ECLK0				0x0844
+#define CG_CTRL_VAL_SCLK_DECON0_VCLK0				0x0848
+#define CG_CTRL_VAL_SCLK_DECON0_VCLK1				0x084C
+#define CG_CTRL_VAL_SCLK_HDMI_AUDIO				0x0850
+#define CG_CTRL_VAL_SCLK_DISP0_PROMISE				0x0854
+#define CG_CTRL_VAL_PHYCLK_HDMIPHY				0x0858
+#define CG_CTRL_VAL_PHYCLK_MIPIDPHY0				0x085C
+#define CG_CTRL_VAL_PHYCLK_MIPIDPHY1				0x0860
+#define CG_CTRL_VAL_PHYCLK_MIPIDPHY2				0x0864
+#define CG_CTRL_VAL_PHYCLK_DPPHY				0x0868
+#define CG_CTRL_VAL_OSCCLK					0x086C
+#define CLKOUT_CMU_DISP0					0x0C00
+#define CLKOUT_CMU_DISP0_DIV_STAT				0x0C04
+#define DISP0_SFR_IGNORE_REQ_SYSCLK				0x0D04
+#define CMU_DISP0_SPARE0					0x0D08
+#define CMU_DISP0_SPARE1					0x0D0C
+#define CG_CTRL_MAN_ACLK_DISP0_0_400				0x1800
+#define CG_CTRL_MAN_ACLK_DISP0_1_400				0x1804
+#define CG_CTRL_MAN_ACLK_DISP0_0_400_SECURE_SFW_DISP0_0		0x1808
+#define CG_CTRL_MAN_ACLK_DISP0_1_400_SECURE_SFW_DISP0_1		0x180C
+#define CG_CTRL_MAN_PCLK_DISP0_0_133				0x1820
+#define CG_CTRL_MAN_PCLK_DISP0_0_133_HPM_APBIF_DISP0		0x1824
+#define CG_CTRL_MAN_PCLK_DISP0_0_133_SECURE_DECON0		0x1828
+#define CG_CTRL_MAN_PCLK_DISP0_0_133_SECURE_VPP0		0x182C
+#define CG_CTRL_MAN_PCLK_DISP0_0_133_SECURE_SFW_DISP0_0		0x1830
+#define CG_CTRL_MAN_PCLK_DISP0_0_133_SECURE_SFW_DISP0_1		0x1834
+#define CG_CTRL_MAN_SCLK_DISP1_400				0x1840
+#define CG_CTRL_MAN_SCLK_DECON0_ECLK0				0x1844
+#define CG_CTRL_MAN_SCLK_DECON0_VCLK0				0x1848
+#define CG_CTRL_MAN_SCLK_DECON0_VCLK1				0x184C
+#define CG_CTRL_MAN_SCLK_HDMI_AUDIO				0x1850
+#define CG_CTRL_MAN_SCLK_DISP0_PROMISE				0x1854
+#define CG_CTRL_MAN_PHYCLK_HDMIPHY				0x1858
+#define CG_CTRL_MAN_PHYCLK_MIPIDPHY0				0x185C
+#define CG_CTRL_MAN_PHYCLK_MIPIDPHY1				0x1860
+#define CG_CTRL_MAN_PHYCLK_MIPIDPHY2				0x1864
+#define CG_CTRL_MAN_PHYCLK_DPPHY				0x1868
+#define CG_CTRL_MAN_OSCCLK					0x186C
+#define CG_CTRL_STAT_ACLK_DISP0_0_400				0x1C00
+#define CG_CTRL_STAT_ACLK_DISP0_1_400				0x1C04
+#define CG_CTRL_STAT_ACLK_DISP0_0_400_SECURE_SFW_DISP0_0	0x1C08
+#define CG_CTRL_STAT_ACLK_DISP0_1_400_SECURE_SFW_DISP0_1	0x1C0C
+#define CG_CTRL_STAT_PCLK_DISP0_0_133_0				0x1C20
+#define CG_CTRL_STAT_PCLK_DISP0_0_133_1				0x1C24
+#define CG_CTRL_STAT_PCLK_DISP0_0_133_2				0x1C28
+#define CG_CTRL_STAT_PCLK_DISP0_0_133_HPM_APBIF_DISP0		0x1C2C
+#define CG_CTRL_STAT_PCLK_DISP0_0_133_SECURE_DECON0		0x1C30
+#define CG_CTRL_STAT_PCLK_DISP0_0_133_SECURE_VPP0		0x1C34
+#define CG_CTRL_STAT_PCLK_DISP0_0_133_SECURE_SFW_DISP0_0	0x1C38
+#define CG_CTRL_STAT_PCLK_DISP0_0_133_SECURE_SFW_DISP0_1	0x1C3C
+#define CG_CTRL_STAT_SCLK_DISP1_400				0x1C40
+#define CG_CTRL_STAT_SCLK_DECON0_ECLK0				0x1C44
+#define CG_CTRL_STAT_SCLK_DECON0_VCLK0				0x1C48
+#define CG_CTRL_STAT_SCLK_DECON0_VCLK1				0x1C4C
+#define CG_CTRL_STAT_SCLK_HDMI_AUDIO				0x1C50
+#define CG_CTRL_STAT_SCLK_DISP0_PROMISE				0x1C54
+#define CG_CTRL_STAT_PHYCLK_HDMIPHY				0x1C58
+#define CG_CTRL_STAT_PHYCLK_MIPIDPHY0				0x1C5C
+#define CG_CTRL_STAT_PHYCLK_MIPIDPHY1				0x1C60
+#define CG_CTRL_STAT_PHYCLK_MIPIDPHY2				0x1C64
+#define CG_CTRL_STAT_PHYCLK_DPPHY				0x1C68
+#define CG_CTRL_STAT_OSCCLK					0x1C6C
+#define QCH_CTRL_AXI_LH_ASYNC_MI_DISP0SFR			0x2000
+#define QCH_CTRL_CMU_DISP0					0x2004
+#define QCH_CTRL_PMU_DISP0					0x2008
+#define QCH_CTRL_SYSREG_DISP0					0x200C
+#define QCH_CTRL_DECON0						0x2010
+#define QCH_CTRL_VPP0						0x2014
+#define QCH_CTRL_VPP0_G0					0x2014
+#define QCH_CTRL_VPP0_G1					0x2018
+#define QCH_CTRL_DSIM0						0x2020
+#define QCH_CTRL_DSIM1						0x2024
+#define QCH_CTRL_DSIM2						0x2028
+#define QCH_CTRL_HDMI						0x202C
+#define QCH_CTRL_DP						0x2030
+#define QCH_CTRL_PPMU_DISP0_0					0x2034
+#define QCH_CTRL_PPMU_DISP0_1					0x203C
+#define QCH_CTRL_SMMU_DISP0_0					0x2040
+#define QCH_CTRL_SMMU_DISP0_1					0x2044
+#define QCH_CTRL_SFW_DISP0_0					0x2048
+#define QCH_CTRL_SFW_DISP0_1					0x204C
+#define QCH_CTRL_LH_ASYNC_SI_R_TOP_DISP				0x2050
+#define QCH_CTRL_LH_ASYNC_SI_TOP_DISP				0x2054
+#define QSTATE_CTRL_DSIM0					0x240C
+#define QSTATE_CTRL_DSIM1					0x2410
+#define QSTATE_CTRL_DSIM2					0x2414
+#define QSTATE_CTRL_HDMI					0x2418
+#define QSTATE_CTRL_HDMI_AUDIO					0x241C
+#define QSTATE_CTRL_DP						0x2420
+#define QSTATE_CTRL_DISP0_MUX					0x2424
+#define QSTATE_CTRL_HDMI_PHY					0x2428
+#define QSTATE_CTRL_DISP1_400					0x2434
+#define QSTATE_CTRL_DECON0					0x2438
+#define QSTATE_CTRL_HPM_APBIF_DISP0				0x2444
+#define QSTATE_CTRL_PROMISE_DISP0				0x2448
+#define QSTATE_CTRL_DPTX_PHY					0x2484
+#define QSTATE_CTRL_MIPI_DPHY_M1S0				0x2488
+#define QSTATE_CTRL_MIPI_DPHY_M4S0				0x248C
+#define QSTATE_CTRL_MIPI_DPHY_M4S4				0x2490
+
+static const unsigned long disp0_clk_regs[] __initconst = {
+	DISP_PLL_LOCK,
+	DISP_PLL_CON0,
+	DISP_PLL_CON1,
+	DISP_PLL_FREQ_DET,
+	CLK_CON_MUX_DISP_PLL,
+	CLK_CON_MUX_ACLK_DISP0_0_400_USER,
+	CLK_CON_MUX_ACLK_DISP0_1_400_USER,
+	CLK_CON_MUX_SCLK_DISP0_DECON0_ECLK0_USER,
+	CLK_CON_MUX_SCLK_DISP0_DECON0_VCLK0_USER,
+	CLK_CON_MUX_SCLK_DISP0_DECON0_VCLK1_USER,
+	CLK_CON_MUX_SCLK_DISP0_HDMI_AUDIO_USER,
+	CLK_CON_MUX_PHYCLK_HDMIPHY_PIXEL_CLKO_USER,
+	CLK_CON_MUX_PHYCLK_HDMIPHY_TMDS_CLKO_USER,
+	CLK_CON_MUX_PHYCLK_MIPIDPHY0_RXCLKESC0_USER,
+	CLK_CON_MUX_PHYCLK_MIPIDPHY0_BITCLKDIV2_USER_DISP0,
+	CLK_CON_MUX_PHYCLK_MIPIDPHY0_BITCLKDIV8_USER,
+	CLK_CON_MUX_PHYCLK_MIPIDPHY1_RXCLKESC0_USER,
+	CLK_CON_MUX_PHYCLK_MIPIDPHY1_BITCLKDIV2_USER_DISP0,
+	CLK_CON_MUX_PHYCLK_MIPIDPHY1_BITCLKDIV8_USER,
+	CLK_CON_MUX_PHYCLK_MIPIDPHY2_RXCLKESC0_USER,
+	CLK_CON_MUX_PHYCLK_MIPIDPHY2_BITCLKDIV2_USER_DISP0,
+	CLK_CON_MUX_PHYCLK_MIPIDPHY2_BITCLKDIV8_USER,
+	CLK_CON_MUX_PHYCLK_DPPHY_CH0_TXD_CLK_USER,
+	CLK_CON_MUX_PHYCLK_DPPHY_CH1_TXD_CLK_USER,
+	CLK_CON_MUX_PHYCLK_DPPHY_CH2_TXD_CLK_USER,
+	CLK_CON_MUX_PHYCLK_DPPHY_CH3_TXD_CLK_USER,
+	CLK_CON_MUX_ACLK_DISP0_1_400_DISP0,
+	CLK_CON_MUX_SCLK_DISP0_DECON0_ECLK0_DISP0,
+	CLK_CON_MUX_SCLK_DISP0_DECON0_VCLK0_DISP0,
+	CLK_CON_MUX_SCLK_DISP0_DECON0_VCLK1_DISP0,
+	CLK_CON_MUX_SCLK_DISP0_HDMI_AUDIO_DISP0,
+	CLK_CON_DIV_PCLK_DISP0_0_133,
+	CLK_CON_DIV_SCLK_DECON0_ECLK0,
+	CLK_CON_DIV_SCLK_DECON0_VCLK0,
+	CLK_CON_DIV_SCLK_DECON0_VCLK1,
+	CLK_CON_DIV_PHYCLK_HDMIPHY_PIXEL_CLKO,
+	CLK_CON_DIV_PHYCLK_HDMIPHY_TMDS_20B_CLKO,
+	CLK_CON_DSM_DIV_M_SCLK_HDMI_AUDIO,
+	CLK_CON_DSM_DIV_N_SCLK_HDMI_AUDIO,
+	CLK_STAT_MUX_DISP_PLL,
+	CLK_STAT_MUX_ACLK_DISP0_0_400_USER,
+	CLK_STAT_MUX_ACLK_DISP0_1_400_USER,
+	CLK_STAT_MUX_SCLK_DISP0_HDMI_AUDIO_USER,
+	CLK_STAT_MUX_SCLK_DISP0_DECON0_ECLK0_USER,
+	CLK_STAT_MUX_SCLK_DISP0_DECON0_VCLK0_USER,
+	CLK_STAT_MUX_SCLK_DISP0_DECON0_VCLK1_USER,
+	CLK_STAT_MUX_PHYCLK_HDMIPHY_PIXEL_CLKO_USER,
+	CLK_STAT_MUX_PHYCLK_HDMIPHY_TMDS_CLKO_USER,
+	CLK_STAT_MUX_PHYCLK_MIPIDPHY0_RXCLKESC0_USER,
+	CLK_STAT_MUX_PHYCLK_MIPIDPHY0_BITCLKDIV2_USER_DISP0,
+	CLK_STAT_MUX_PHYCLK_MIPIDPHY0_BITCLKDIV8_USER,
+	CLK_STAT_MUX_PHYCLK_MIPIDPHY1_RXCLKESC0_USER,
+	CLK_STAT_MUX_PHYCLK_MIPIDPHY1_BITCLKDIV2_USER_DISP0,
+	CLK_STAT_MUX_PHYCLK_MIPIDPHY1_BITCLKDIV8_USER,
+	CLK_STAT_MUX_PHYCLK_MIPIDPHY2_RXCLKESC0_USER,
+	CLK_STAT_MUX_PHYCLK_MIPIDPHY2_BITCLKDIV2_USER_DISP0,
+	CLK_STAT_MUX_PHYCLK_MIPIDPHY2_BITCLKDIV8_USER,
+	CLK_STAT_MUX_PHYCLK_DPPHY_CH0_TXD_CLK_USER,
+	CLK_STAT_MUX_PHYCLK_DPPHY_CH1_TXD_CLK_USER,
+	CLK_STAT_MUX_PHYCLK_DPPHY_CH2_TXD_CLK_USER,
+	CLK_STAT_MUX_PHYCLK_DPPHY_CH3_TXD_CLK_USER,
+	CLK_STAT_MUX_ACLK_DISP0_1_400_DISP0,
+	CLK_STAT_MUX_SCLK_DISP0_DECON0_ECLK0_DISP0,
+	CLK_STAT_MUX_SCLK_DISP0_DECON0_VCLK0_DISP0,
+	CLK_STAT_MUX_SCLK_DISP0_DECON0_VCLK1_DISP0,
+	CLK_STAT_MUX_SCLK_DISP0_HDMI_AUDIO_DISP0,
+	CG_CTRL_VAL_ACLK_DISP0_0_400,
+	CG_CTRL_VAL_ACLK_DISP0_1_400,
+	CG_CTRL_VAL_ACLK_DISP0_0_400_SECURE_SFW_DISP0_0,
+	CG_CTRL_VAL_ACLK_DISP0_1_400_SECURE_SFW_DISP0_1,
+	CG_CTRL_VAL_PCLK_DISP0_0_133,
+	CG_CTRL_VAL_PCLK_DISP0_0_133_HPM_APBIF_DISP0,
+	CG_CTRL_VAL_PCLK_DISP0_0_133_SECURE_DECON0,
+	CG_CTRL_VAL_PCLK_DISP0_0_133_SECURE_VPP0,
+	CG_CTRL_VAL_PCLK_DISP0_0_133_SECURE_SFW_DISP0_0,
+	CG_CTRL_VAL_PCLK_DISP0_0_133_SECURE_SFW_DISP0_1,
+	CG_CTRL_VAL_SCLK_DISP1_400,
+	CG_CTRL_VAL_SCLK_DECON0_ECLK0,
+	CG_CTRL_VAL_SCLK_DECON0_VCLK0,
+	CG_CTRL_VAL_SCLK_DECON0_VCLK1,
+	CG_CTRL_VAL_SCLK_HDMI_AUDIO,
+	CG_CTRL_VAL_SCLK_DISP0_PROMISE,
+	CG_CTRL_VAL_PHYCLK_HDMIPHY,
+	CG_CTRL_VAL_PHYCLK_MIPIDPHY0,
+	CG_CTRL_VAL_PHYCLK_MIPIDPHY1,
+	CG_CTRL_VAL_PHYCLK_MIPIDPHY2,
+	CG_CTRL_VAL_PHYCLK_DPPHY,
+	CG_CTRL_VAL_OSCCLK,
+	CLKOUT_CMU_DISP0,
+	CLKOUT_CMU_DISP0_DIV_STAT,
+	DISP0_SFR_IGNORE_REQ_SYSCLK,
+	CMU_DISP0_SPARE0,
+	CMU_DISP0_SPARE1,
+	CG_CTRL_MAN_ACLK_DISP0_0_400,
+	CG_CTRL_MAN_ACLK_DISP0_1_400,
+	CG_CTRL_MAN_ACLK_DISP0_0_400_SECURE_SFW_DISP0_0,
+	CG_CTRL_MAN_ACLK_DISP0_1_400_SECURE_SFW_DISP0_1,
+	CG_CTRL_MAN_PCLK_DISP0_0_133,
+	CG_CTRL_MAN_PCLK_DISP0_0_133_HPM_APBIF_DISP0,
+	CG_CTRL_MAN_PCLK_DISP0_0_133_SECURE_DECON0,
+	CG_CTRL_MAN_PCLK_DISP0_0_133_SECURE_VPP0,
+	CG_CTRL_MAN_PCLK_DISP0_0_133_SECURE_SFW_DISP0_0,
+	CG_CTRL_MAN_PCLK_DISP0_0_133_SECURE_SFW_DISP0_1,
+	CG_CTRL_MAN_SCLK_DISP1_400,
+	CG_CTRL_MAN_SCLK_DECON0_ECLK0,
+	CG_CTRL_MAN_SCLK_DECON0_VCLK0,
+	CG_CTRL_MAN_SCLK_DECON0_VCLK1,
+	CG_CTRL_MAN_SCLK_HDMI_AUDIO,
+	CG_CTRL_MAN_SCLK_DISP0_PROMISE,
+	CG_CTRL_MAN_PHYCLK_HDMIPHY,
+	CG_CTRL_MAN_PHYCLK_MIPIDPHY0,
+	CG_CTRL_MAN_PHYCLK_MIPIDPHY1,
+	CG_CTRL_MAN_PHYCLK_MIPIDPHY2,
+	CG_CTRL_MAN_PHYCLK_DPPHY,
+	CG_CTRL_MAN_OSCCLK,
+	CG_CTRL_STAT_ACLK_DISP0_0_400,
+	CG_CTRL_STAT_ACLK_DISP0_1_400,
+	CG_CTRL_STAT_ACLK_DISP0_0_400_SECURE_SFW_DISP0_0,
+	CG_CTRL_STAT_ACLK_DISP0_1_400_SECURE_SFW_DISP0_1,
+	CG_CTRL_STAT_PCLK_DISP0_0_133_0,
+	CG_CTRL_STAT_PCLK_DISP0_0_133_1,
+	CG_CTRL_STAT_PCLK_DISP0_0_133_2,
+	CG_CTRL_STAT_PCLK_DISP0_0_133_HPM_APBIF_DISP0,
+	CG_CTRL_STAT_PCLK_DISP0_0_133_SECURE_DECON0,
+	CG_CTRL_STAT_PCLK_DISP0_0_133_SECURE_VPP0,
+	CG_CTRL_STAT_PCLK_DISP0_0_133_SECURE_SFW_DISP0_0,
+	CG_CTRL_STAT_PCLK_DISP0_0_133_SECURE_SFW_DISP0_1,
+	CG_CTRL_STAT_SCLK_DISP1_400,
+	CG_CTRL_STAT_SCLK_DECON0_ECLK0,
+	CG_CTRL_STAT_SCLK_DECON0_VCLK0,
+	CG_CTRL_STAT_SCLK_DECON0_VCLK1,
+	CG_CTRL_STAT_SCLK_HDMI_AUDIO,
+	CG_CTRL_STAT_SCLK_DISP0_PROMISE,
+	CG_CTRL_STAT_PHYCLK_HDMIPHY,
+	CG_CTRL_STAT_PHYCLK_MIPIDPHY0,
+	CG_CTRL_STAT_PHYCLK_MIPIDPHY1,
+	CG_CTRL_STAT_PHYCLK_MIPIDPHY2,
+	CG_CTRL_STAT_PHYCLK_DPPHY,
+	CG_CTRL_STAT_OSCCLK,
+	QCH_CTRL_AXI_LH_ASYNC_MI_DISP0SFR,
+	QCH_CTRL_CMU_DISP0,
+	QCH_CTRL_PMU_DISP0,
+	QCH_CTRL_SYSREG_DISP0,
+	QCH_CTRL_DECON0,
+	QCH_CTRL_VPP0,
+	QCH_CTRL_VPP0_G0,
+	QCH_CTRL_VPP0_G1,
+	QCH_CTRL_DSIM0,
+	QCH_CTRL_DSIM1,
+	QCH_CTRL_DSIM2,
+	QCH_CTRL_HDMI,
+	QCH_CTRL_DP,
+	QCH_CTRL_PPMU_DISP0_0,
+	QCH_CTRL_PPMU_DISP0_1,
+	QCH_CTRL_SMMU_DISP0_0,
+	QCH_CTRL_SMMU_DISP0_1,
+	QCH_CTRL_SFW_DISP0_0,
+	QCH_CTRL_SFW_DISP0_1,
+	QCH_CTRL_LH_ASYNC_SI_R_TOP_DISP,
+	QCH_CTRL_LH_ASYNC_SI_TOP_DISP,
+	QSTATE_CTRL_DSIM0,
+	QSTATE_CTRL_DSIM1,
+	QSTATE_CTRL_DSIM2,
+	QSTATE_CTRL_HDMI,
+	QSTATE_CTRL_HDMI_AUDIO,
+	QSTATE_CTRL_DP,
+	QSTATE_CTRL_DISP0_MUX,
+	QSTATE_CTRL_HDMI_PHY,
+	QSTATE_CTRL_DISP1_400,
+	QSTATE_CTRL_DECON0,
+	QSTATE_CTRL_HPM_APBIF_DISP0,
+	QSTATE_CTRL_PROMISE_DISP0,
+	QSTATE_CTRL_DPTX_PHY,
+	QSTATE_CTRL_MIPI_DPHY_M1S0,
+	QSTATE_CTRL_MIPI_DPHY_M4S0,
+	QSTATE_CTRL_MIPI_DPHY_M4S4,
+};
+
+static const struct samsung_pll_rate_table disp0_pll_rates[] __initconst = {
+	PLL_35XX_RATE(26 * MHZ, 134333333U, 248, 6, 3),
+	PLL_35XX_RATE(26 * MHZ, 126000000U, 504, 13, 3),
+	PLL_35XX_RATE(26 * MHZ, 71000000U, 568, 13, 4),
+	PLL_35XX_RATE(26 * MHZ, 63000000U, 504, 13, 4),
+	PLL_35XX_RATE(26 * MHZ, 62500000U, 500, 13, 4),
+	PLL_35XX_RATE(26 * MHZ, 50000000U, 400, 13, 4),
+	PLL_35XX_RATE(26 * MHZ, 42000000U, 336, 13, 4),
+};
+
+static const struct samsung_pll_clock disp0_pll_clks[] __initconst = {
+	PLL(pll_141xx, CLK_FOUT_DISP_PLL, "fout_disp_pll", "oscclk", DISP_PLL_LOCK, DISP_PLL_CON0,
+	    disp0_pll_rates),
+};
+
+PNAME(disp0_mux_disp_pll_p)				= { "oscclk",
+							    "fout_disp_pll" };
+PNAME(disp0_mux_aclk_disp0_0_400_user_p)		= { "oscclk",
+							    "gout_top_aclk_disp0_0_400" };
+PNAME(disp0_mux_aclk_disp0_1_400_user_p)		= { "oscclk",
+							    "gout_top_aclk_disp0_1_400" };
+PNAME(disp0_mux_sclk_disp0_decon0_eclk0_user_p)		= { "oscclk",
+							    "gout_top_sclk_disp0_decon0_eclk0" };
+PNAME(disp0_mux_sclk_disp0_decon0_vclk0_user_p)		= { "oscclk",
+							    "gout_top_sclk_disp0_decon0_vclk0" };
+PNAME(disp0_mux_sclk_disp0_decon0_vclk1_user_p)		= { "oscclk",
+							    "gout_top_sclk_disp0_decon0_vclk1" };
+PNAME(disp0_mux_sclk_disp0_hdmi_audio_user_p)		= { "oscclk",
+							    "gout_top_sclk_disp0_hdmi_audio" };
+PNAME(disp0_mux_phyclk_hdmiphy_pixel_clko_user_p)	= { "oscclk",
+							    "phyclk_hdmiphy_pixel_clko_phy" };
+PNAME(disp0_mux_phyclk_hdmiphy_tmds_clko_user_p)	= { "oscclk",
+							    "phyclk_hdmiphy_tmds_clko_phy" };
+PNAME(disp0_mux_phyclk_mipidphy0_rxclkesc0_user_p)	= { "oscclk",
+							    "phyclk_mipidphy0_rxclkesc0_phy" };
+PNAME(disp0_mux_phyclk_mipidphy0_bitclkdiv2_user_p)	= { "oscclk",
+							    "phyclk_mipidphy0_bitclkdiv2_phy" };
+PNAME(disp0_mux_phyclk_mipidphy0_bitclkdiv8_user_p)	= { "oscclk",
+							    "phyclk_mipidphy0_bitclkdiv8_phy" };
+PNAME(disp0_mux_phyclk_mipidphy1_rxclkesc0_user_p)	= { "oscclk",
+							    "phyclk_mipidphy1_rxclkesc0_phy" };
+PNAME(disp0_mux_phyclk_mipidphy1_bitclkdiv2_user_p)	= { "oscclk",
+							    "phyclk_mipidphy1_bitclkdiv2_phy" };
+PNAME(disp0_mux_phyclk_mipidphy1_bitclkdiv8_user_p)	= { "oscclk",
+							    "phyclk_mipidphy1_bitclkdiv8_phy" };
+PNAME(disp0_mux_phyclk_mipidphy2_rxclkesc0_user_p)	= { "oscclk",
+							    "phyclk_mipidphy2_rxclkesc0_phy" };
+PNAME(disp0_mux_phyclk_mipidphy2_bitclkdiv2_user_p)	= { "oscclk",
+							    "phyclk_mipidphy2_bitclkdiv2_phy" };
+PNAME(disp0_mux_phyclk_mipidphy2_bitclkdiv8_user_p)	= { "oscclk",
+							    "phyclk_mipidphy2_bitclkdiv8_phy" };
+PNAME(disp0_mux_phyclk_dpphy_ch0_txd_clk_user_p)	= { "oscclk",
+							    "phyclk_dpphy_ch0_txd_clk_phy" };
+PNAME(disp0_mux_phyclk_dpphy_ch1_txd_clk_user_p)	= { "oscclk",
+							    "phyclk_dpphy_ch1_txd_clk_phy" };
+PNAME(disp0_mux_phyclk_dpphy_ch2_txd_clk_user_p)	= { "oscclk",
+							    "phyclk_dpphy_ch2_txd_clk_phy" };
+PNAME(disp0_mux_phyclk_dpphy_ch3_txd_clk_user_p)	= { "oscclk",
+							    "phyclk_dpphy_ch3_txd_clk_phy" };
+PNAME(disp0_mux_aclk_disp0_1_400_p)			= { "mout_disp0_aclk_disp0_0_400_user",
+							    "mout_disp0_aclk_disp0_1_400_user" };
+PNAME(disp0_mux_sclk_disp0_decon0_eclk0_p)		= {
+	"mout_disp0_sclk_disp0_decon0_eclk0_user",
+	"mout_disp0_disp_pll",
+	"mout_disp0_phyclk_mipidphy0_bitclkdiv2_user",
+	"mout_disp0_phyclk_mipidphy1_bitclkdiv2_user",
+	"mout_disp0_phyclk_mipidphy2_bitclkdiv2_user" };
+PNAME(disp0_mux_sclk_disp0_decon0_vclk0_p)		= {
+	"mout_disp0_sclk_disp0_decon0_vclk0_user",
+	"mout_disp0_disp_pll",
+	"mout_disp0_phyclk_mipidphy0_bitclkdiv2_user",
+	"mout_disp0_phyclk_mipidphy1_bitclkdiv2_user",
+	"mout_disp0_phyclk_mipidphy2_bitclkdiv2_user" };
+PNAME(disp0_mux_sclk_disp0_decon0_vclk1_p)		= {
+	"mout_disp0_sclk_disp0_decon0_vclk1_user",
+	"mout_disp0_disp_pll",
+	"mout_disp0_phyclk_mipidphy0_bitclkdiv2_user",
+	"mout_disp0_phyclk_mipidphy1_bitclkdiv2_user",
+	"mout_disp0_phyclk_mipidphy2_bitclkdiv2_user" };
+PNAME(disp0_mux_sclk_disp0_hdmi_audio_p)		= {
+	"mout_disp0_phyclk_hdmiphy_tmds_clko_user",
+	"mout_disp0_sclk_disp0_hdmi_audio_user" };
+
+static const struct samsung_fixed_rate_clock disp0_fixed_clks[] __initconst = {
+	FRATE(CLK_PHYCLK_MIPIDPHY0_BITCLKDIV2_PHY,
+	      "phyclk_mipidphy0_bitclkdiv2_phy", NULL, 0, 30000000),
+	FRATE(CLK_PHYCLK_MIPIDPHY1_BITCLKDIV2_PHY,
+	      "phyclk_mipidphy1_bitclkdiv2_phy", NULL, 0, 30000000),
+	FRATE(CLK_PHYCLK_MIPIDPHY2_BITCLKDIV2_PHY,
+	      "phyclk_mipidphy2_bitclkdiv2_phy", NULL, 0, 30000000),
+	FRATE(CLK_PHYCLK_HDMIPHY_PIXEL_CLKO_PHY,
+	      "phyclk_hdmiphy_pixel_clko_phy", NULL, 0, 300000000),
+	FRATE(CLK_PHYCLK_HDMIPHY_TMDS_CLKO_PHY, "phyclk_hdmiphy_tmds_clko_phy",
+	      NULL, 0, 300000000),
+	FRATE(CLK_PHYCLK_MIPIDPHY0_RXCLKESC0_PHY,
+	      "phyclk_mipidphy0_rxclkesc0_phy", NULL, 0, 20000000),
+	FRATE(CLK_PHYCLK_MIPIDPHY0_BITCLKDIV8_PHY,
+	      "phyclk_mipidphy0_bitclkdiv8_phy", NULL, 0, 187500000),
+	FRATE(CLK_PHYCLK_MIPIDPHY1_RXCLKESC0_PHY,
+	      "phyclk_mipidphy1_rxclkesc0_phy", NULL, 0, 20000000),
+	FRATE(CLK_PHYCLK_MIPIDPHY1_BITCLKDIV8_PHY,
+	      "phyclk_mipidphy1_bitclkdiv8_phy", NULL, 0, 187500000),
+	FRATE(CLK_PHYCLK_MIPIDPHY2_RXCLKESC0_PHY,
+	      "phyclk_mipidphy2_rxclkesc0_phy", NULL, 0, 20000000),
+	FRATE(CLK_PHYCLK_MIPIDPHY2_BITCLKDIV8_PHY,
+	      "phyclk_mipidphy2_bitclkdiv8_phy", NULL, 0, 187500000),
+	FRATE(CLK_PHYCLK_DPPHY_CH0_TXD_CLK_PHY, "phyclk_dpphy_ch0_txd_clk_phy",
+	      NULL, 0, 270000000),
+	FRATE(CLK_PHYCLK_DPPHY_CH1_TXD_CLK_PHY, "phyclk_dpphy_ch1_txd_clk_phy",
+	      NULL, 0, 270000000),
+	FRATE(CLK_PHYCLK_DPPHY_CH2_TXD_CLK_PHY, "phyclk_dpphy_ch2_txd_clk_phy",
+	      NULL, 0, 270000000),
+	FRATE(CLK_PHYCLK_DPPHY_CH3_TXD_CLK_PHY, "phyclk_dpphy_ch3_txd_clk_phy",
+	      NULL, 0, 270000000),
+};
+
+static const struct samsung_mux_clock disp0_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_DISP0_DISP_PLL, "mout_disp0_disp_pll",
+	    disp0_mux_disp_pll_p, CLK_CON_MUX_DISP_PLL, 12, 1),
+	MUX(CLK_MOUT_DISP0_ACLK_DISP0_0_400_USER,
+	    "mout_disp0_aclk_disp0_0_400_user",
+	    disp0_mux_aclk_disp0_0_400_user_p,
+	    CLK_CON_MUX_ACLK_DISP0_0_400_USER, 12, 1),
+	MUX(CLK_MOUT_DISP0_ACLK_DISP0_1_400_USER,
+	    "mout_disp0_aclk_disp0_1_400_user",
+	    disp0_mux_aclk_disp0_1_400_user_p,
+	    CLK_CON_MUX_ACLK_DISP0_1_400_USER, 12, 1),
+	MUX(CLK_MOUT_DISP0_SCLK_DISP0_DECON0_ECLK0_USER,
+	    "mout_disp0_sclk_disp0_decon0_eclk0_user",
+	    disp0_mux_sclk_disp0_decon0_eclk0_user_p,
+	    CLK_CON_MUX_SCLK_DISP0_DECON0_ECLK0_USER, 12, 1),
+	MUX(CLK_MOUT_DISP0_SCLK_DISP0_DECON0_VCLK0_USER,
+	    "mout_disp0_sclk_disp0_decon0_vclk0_user",
+	    disp0_mux_sclk_disp0_decon0_vclk0_user_p,
+	    CLK_CON_MUX_SCLK_DISP0_DECON0_VCLK0_USER, 12, 1),
+	MUX(CLK_MOUT_DISP0_SCLK_DISP0_DECON0_VCLK1_USER,
+	    "mout_disp0_sclk_disp0_decon0_vclk1_user",
+	    disp0_mux_sclk_disp0_decon0_vclk1_user_p,
+	    CLK_CON_MUX_SCLK_DISP0_DECON0_VCLK1_USER, 12, 1),
+	MUX(CLK_MOUT_DISP0_SCLK_DISP0_HDMI_AUDIO_USER,
+	    "mout_disp0_sclk_disp0_hdmi_audio_user",
+	    disp0_mux_sclk_disp0_hdmi_audio_user_p,
+	    CLK_CON_MUX_SCLK_DISP0_HDMI_AUDIO_USER, 12, 1),
+	MUX(CLK_MOUT_DISP0_PHYCLK_HDMIPHY_PIXEL_CLKO_USER,
+	    "mout_disp0_phyclk_hdmiphy_pixel_clko_user",
+	    disp0_mux_phyclk_hdmiphy_pixel_clko_user_p,
+	    CLK_CON_MUX_PHYCLK_HDMIPHY_PIXEL_CLKO_USER, 12, 1),
+	MUX(CLK_MOUT_DISP0_PHYCLK_HDMIPHY_TMDS_CLKO_USER,
+	    "mout_disp0_phyclk_hdmiphy_tmds_clko_user",
+	    disp0_mux_phyclk_hdmiphy_tmds_clko_user_p,
+	    CLK_CON_MUX_PHYCLK_HDMIPHY_TMDS_CLKO_USER, 12, 1),
+	MUX(CLK_MOUT_DISP0_PHYCLK_MIPIDPHY0_RXCLKESC0_USER,
+	    "mout_disp0_phyclk_mipidphy0_rxclkesc0_user",
+	    disp0_mux_phyclk_mipidphy0_rxclkesc0_user_p,
+	    CLK_CON_MUX_PHYCLK_MIPIDPHY0_RXCLKESC0_USER, 12, 1),
+	MUX(CLK_MOUT_DISP0_PHYCLK_MIPIDPHY0_BITCLKDIV2_USER,
+	    "mout_disp0_phyclk_mipidphy0_bitclkdiv2_user",
+	    disp0_mux_phyclk_mipidphy0_bitclkdiv2_user_p,
+	    CLK_CON_MUX_PHYCLK_MIPIDPHY0_BITCLKDIV2_USER_DISP0, 12, 1),
+	MUX(CLK_MOUT_DISP0_PHYCLK_MIPIDPHY0_BITCLKDIV8_USER,
+	    "mout_disp0_phyclk_mipidphy0_bitclkdiv8_user",
+	    disp0_mux_phyclk_mipidphy0_bitclkdiv8_user_p,
+	    CLK_CON_MUX_PHYCLK_MIPIDPHY0_BITCLKDIV8_USER, 12, 1),
+	MUX(CLK_MOUT_DISP0_PHYCLK_MIPIDPHY1_RXCLKESC0_USER,
+	    "mout_disp0_phyclk_mipidphy1_rxclkesc0_user",
+	    disp0_mux_phyclk_mipidphy1_rxclkesc0_user_p,
+	    CLK_CON_MUX_PHYCLK_MIPIDPHY1_RXCLKESC0_USER, 12, 1),
+	MUX(CLK_MOUT_DISP0_PHYCLK_MIPIDPHY1_BITCLKDIV2_USER,
+	    "mout_disp0_phyclk_mipidphy1_bitclkdiv2_user",
+	    disp0_mux_phyclk_mipidphy1_bitclkdiv2_user_p,
+	    CLK_CON_MUX_PHYCLK_MIPIDPHY1_BITCLKDIV2_USER_DISP0, 12, 1),
+	MUX(CLK_MOUT_DISP0_PHYCLK_MIPIDPHY1_BITCLKDIV8_USER,
+	    "mout_disp0_phyclk_mipidphy1_bitclkdiv8_user",
+	    disp0_mux_phyclk_mipidphy1_bitclkdiv8_user_p,
+	    CLK_CON_MUX_PHYCLK_MIPIDPHY1_BITCLKDIV8_USER, 12, 1),
+	MUX(CLK_MOUT_DISP0_PHYCLK_MIPIDPHY2_RXCLKESC0_USER,
+	    "mout_disp0_phyclk_mipidphy2_rxclkesc0_user",
+	    disp0_mux_phyclk_mipidphy2_rxclkesc0_user_p,
+	    CLK_CON_MUX_PHYCLK_MIPIDPHY2_RXCLKESC0_USER, 12, 1),
+	MUX(CLK_MOUT_DISP0_PHYCLK_MIPIDPHY2_BITCLKDIV2_USER,
+	    "mout_disp0_phyclk_mipidphy2_bitclkdiv2_user",
+	    disp0_mux_phyclk_mipidphy2_bitclkdiv2_user_p,
+	    CLK_CON_MUX_PHYCLK_MIPIDPHY2_BITCLKDIV2_USER_DISP0, 12, 1),
+	MUX(CLK_MOUT_DISP0_PHYCLK_MIPIDPHY2_BITCLKDIV8_USER,
+	    "mout_disp0_phyclk_mipidphy2_bitclkdiv8_user",
+	    disp0_mux_phyclk_mipidphy2_bitclkdiv8_user_p,
+	    CLK_CON_MUX_PHYCLK_MIPIDPHY2_BITCLKDIV8_USER, 12, 1),
+	MUX(CLK_MOUT_DISP0_PHYCLK_DPPHY_CH0_TXD_CLK_USER,
+	    "mout_disp0_phyclk_dpphy_ch0_txd_clk_user",
+	    disp0_mux_phyclk_dpphy_ch0_txd_clk_user_p,
+	    CLK_CON_MUX_PHYCLK_DPPHY_CH0_TXD_CLK_USER, 12, 1),
+	MUX(CLK_MOUT_DISP0_PHYCLK_DPPHY_CH1_TXD_CLK_USER,
+	    "mout_disp0_phyclk_dpphy_ch1_txd_clk_user",
+	    disp0_mux_phyclk_dpphy_ch1_txd_clk_user_p,
+	    CLK_CON_MUX_PHYCLK_DPPHY_CH1_TXD_CLK_USER, 12, 1),
+	MUX(CLK_MOUT_DISP0_PHYCLK_DPPHY_CH2_TXD_CLK_USER,
+	    "mout_disp0_phyclk_dpphy_ch2_txd_clk_user",
+	    disp0_mux_phyclk_dpphy_ch2_txd_clk_user_p,
+	    CLK_CON_MUX_PHYCLK_DPPHY_CH2_TXD_CLK_USER, 12, 1),
+	MUX(CLK_MOUT_DISP0_PHYCLK_DPPHY_CH3_TXD_CLK_USER,
+	    "mout_disp0_phyclk_dpphy_ch3_txd_clk_user",
+	    disp0_mux_phyclk_dpphy_ch3_txd_clk_user_p,
+	    CLK_CON_MUX_PHYCLK_DPPHY_CH3_TXD_CLK_USER, 12, 1),
+	MUX(CLK_MOUT_DISP0_ACLK_DISP0_1_400, "mout_disp0_aclk_disp0_1_400",
+	    disp0_mux_aclk_disp0_1_400_p, CLK_CON_MUX_ACLK_DISP0_1_400_DISP0,
+	    12, 1),
+	MUX(CLK_MOUT_DISP0_SCLK_DISP0_DECON0_ECLK0,
+	    "mout_disp0_sclk_disp0_decon0_eclk0",
+	    disp0_mux_sclk_disp0_decon0_eclk0_p,
+	    CLK_CON_MUX_SCLK_DISP0_DECON0_ECLK0_DISP0, 12, 3),
+	MUX(CLK_MOUT_DISP0_SCLK_DISP0_DECON0_VCLK0,
+	    "mout_disp0_sclk_disp0_decon0_vclk0",
+	    disp0_mux_sclk_disp0_decon0_vclk0_p,
+	    CLK_CON_MUX_SCLK_DISP0_DECON0_VCLK0_DISP0, 12, 3),
+	MUX(CLK_MOUT_DISP0_SCLK_DISP0_DECON0_VCLK1,
+	    "mout_disp0_sclk_disp0_decon0_vclk1",
+	    disp0_mux_sclk_disp0_decon0_vclk1_p,
+	    CLK_CON_MUX_SCLK_DISP0_DECON0_VCLK1_DISP0, 12, 3),
+	MUX(CLK_MOUT_DISP0_SCLK_DISP0_HDMI_AUDIO,
+	    "mout_disp0_sclk_disp0_hdmi_audio",
+	    disp0_mux_sclk_disp0_hdmi_audio_p,
+	    CLK_CON_MUX_SCLK_DISP0_HDMI_AUDIO_DISP0, 12, 1),
+};
+
+static const struct samsung_div_clock disp0_div_clks[] __initconst = {
+	DIV(CLK_DOUT_DISP0_PCLK_DISP0_0_133, "dout_disp0_pclk_disp0_0_133",
+	    "mout_disp0_aclk_disp0_0_400_user", CLK_CON_DIV_PCLK_DISP0_0_133, 0,
+	    3),
+	DIV(CLK_DOUT_DISP0_SCLK_DECON0_ECLK0, "dout_disp0_sclk_decon0_eclk0",
+	    "mout_disp0_sclk_disp0_decon0_eclk0", CLK_CON_DIV_SCLK_DECON0_ECLK0,
+	    0, 3),
+	DIV(CLK_DOUT_DISP0_SCLK_DECON0_VCLK0, "dout_disp0_sclk_decon0_vclk0",
+	    "mout_disp0_sclk_disp0_decon0_vclk0", CLK_CON_DIV_SCLK_DECON0_VCLK0,
+	    0, 3),
+	DIV(CLK_DOUT_DISP0_SCLK_DECON0_VCLK1, "dout_disp0_sclk_decon0_vclk1",
+	    "mout_disp0_sclk_disp0_decon0_vclk1", CLK_CON_DIV_SCLK_DECON0_VCLK1,
+	    0, 3),
+	DIV(CLK_DOUT_DISP0_PHYCLK_HDMIPHY_PIXEL_CLKO,
+	    "dout_disp0_phyclk_hdmiphy_pixel_clko",
+	    "mout_disp0_phyclk_hdmiphy_pixel_clko_user",
+	    CLK_CON_DIV_PHYCLK_HDMIPHY_PIXEL_CLKO, 0, 1),
+	DIV(CLK_DOUT_DISP0_PHYCLK_HDMIPHY_TMDS_20B_CLKO,
+	    "dout_disp0_phyclk_hdmiphy_tmds_20b_clko",
+	    "mout_disp0_phyclk_hdmiphy_tmds_clko_user",
+	    CLK_CON_DIV_PHYCLK_HDMIPHY_TMDS_20B_CLKO, 0, 1),
+};
+
+static const struct samsung_gate_clock disp0_gate_clks[] __initconst = {
+	GATE(CLK_GOUT_DISP0_ACLK_PPMU_DISP0_0, "gout_disp0_aclk_ppmu_disp0_0",
+	     "mout_disp0_aclk_disp0_0_400_user", CG_CTRL_VAL_ACLK_DISP0_0_400,
+	     5, 0, 0),
+	GATE(CLK_GOUT_DISP0_ACLK_SMMU_DISP0_0, "gout_disp0_aclk_smmu_disp0_0",
+	     "mout_disp0_aclk_disp0_0_400_user", CG_CTRL_VAL_ACLK_DISP0_0_400,
+	     3, 0, 0),
+	GATE(CLK_GOUT_DISP0_ACLK_XIU_DISP0_0, "gout_disp0_aclk_xiu_disp0_0",
+	     "mout_disp0_aclk_disp0_0_400_user", CG_CTRL_VAL_ACLK_DISP0_0_400,
+	     2, 0, 0),
+	GATE(CLK_GOUT_DISP0_ACLK_LH_ASYNC_SI_R_TOP_DISP,
+	     "gout_disp0_aclk_lh_async_si_r_top_disp",
+	     "mout_disp0_aclk_disp0_0_400_user", CG_CTRL_VAL_ACLK_DISP0_0_400,
+	     1, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_DISP0_ACLK_VPP0_ACLK_0, "gout_disp0_aclk_vpp0_aclk_0",
+	     "mout_disp0_aclk_disp0_0_400_user", CG_CTRL_VAL_ACLK_DISP0_0_400,
+	     0, 0, 0),
+	GATE(CLK_GOUT_DISP0_ACLK_PPMU_DISP0_1, "gout_disp0_aclk_ppmu_disp0_1",
+	     "mout_disp0_aclk_disp0_1_400", CG_CTRL_VAL_ACLK_DISP0_1_400, 5, 0,
+	     0),
+	GATE(CLK_GOUT_DISP0_ACLK_SMMU_DISP0_1, "gout_disp0_aclk_smmu_disp0_1",
+	     "mout_disp0_aclk_disp0_1_400", CG_CTRL_VAL_ACLK_DISP0_1_400, 3, 0,
+	     0),
+	GATE(CLK_GOUT_DISP0_ACLK_XIU_DISP0_1, "gout_disp0_aclk_xiu_disp0_1",
+	     "mout_disp0_aclk_disp0_1_400", CG_CTRL_VAL_ACLK_DISP0_1_400, 2, 0,
+	     0),
+	GATE(CLK_GOUT_DISP0_ACLK_LH_ASYNC_SI_TOP_DISP,
+	     "gout_disp0_aclk_lh_async_si_top_disp",
+	     "mout_disp0_aclk_disp0_1_400", CG_CTRL_VAL_ACLK_DISP0_1_400, 1,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_DISP0_ACLK_VPP0_ACLK_1, "gout_disp0_aclk_vpp0_aclk_1",
+	     "mout_disp0_aclk_disp0_1_400", CG_CTRL_VAL_ACLK_DISP0_1_400, 0, 0,
+	     0),
+	GATE(CLK_GOUT_DISP0_ACLK_SFW_DISP0_0, "gout_disp0_aclk_sfw_disp0_0",
+	     "mout_disp0_aclk_disp0_0_400_user",
+	     CG_CTRL_VAL_ACLK_DISP0_0_400_SECURE_SFW_DISP0_0, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_DISP0_ACLK_SFW_DISP0_1, "gout_disp0_aclk_sfw_disp0_1",
+	     "mout_disp0_aclk_disp0_1_400",
+	     CG_CTRL_VAL_ACLK_DISP0_1_400_SECURE_SFW_DISP0_1, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_DISP0_PCLK_VPP0_1, "gout_disp0_pclk_vpp0_1",
+	     "dout_disp0_pclk_disp0_0_133", CG_CTRL_VAL_PCLK_DISP0_0_133, 19, 0,
+	     0),
+	GATE(CLK_GOUT_DISP0_PCLK_SMMU_DISP0_1, "gout_disp0_pclk_smmu_disp0_1",
+	     "dout_disp0_pclk_disp0_0_133", CG_CTRL_VAL_PCLK_DISP0_0_133, 18, 0,
+	     0),
+	GATE(CLK_GOUT_DISP0_PCLK_SMMU_DISP0_0, "gout_disp0_pclk_smmu_disp0_0",
+	     "dout_disp0_pclk_disp0_0_133", CG_CTRL_VAL_PCLK_DISP0_0_133, 17, 0,
+	     0),
+	GATE(CLK_GOUT_DISP0_PCLK_PPMU_DISP0_1, "gout_disp0_pclk_ppmu_disp0_1",
+	     "dout_disp0_pclk_disp0_0_133", CG_CTRL_VAL_PCLK_DISP0_0_133, 16, 0,
+	     0),
+	GATE(CLK_GOUT_DISP0_PCLK_PPMU_DISP0_0, "gout_disp0_pclk_ppmu_disp0_0",
+	     "dout_disp0_pclk_disp0_0_133", CG_CTRL_VAL_PCLK_DISP0_0_133, 15, 0,
+	     0),
+	GATE(CLK_GOUT_DISP0_PCLK_HDMI_PHY, "gout_disp0_pclk_hdmi_phy",
+	     "dout_disp0_pclk_disp0_0_133", CG_CTRL_VAL_PCLK_DISP0_0_133, 14, 0,
+	     0),
+	GATE(CLK_GOUT_DISP0_PCLK_DISP0_MUX, "gout_disp0_pclk_disp0_mux",
+	     "dout_disp0_pclk_disp0_0_133", CG_CTRL_VAL_PCLK_DISP0_0_133, 13, 0,
+	     0),
+	GATE(CLK_GOUT_DISP0_PCLK_DP, "gout_disp0_pclk_dp",
+	     "dout_disp0_pclk_disp0_0_133", CG_CTRL_VAL_PCLK_DISP0_0_133, 12, 0,
+	     0),
+	GATE(CLK_GOUT_DISP0_PCLK_HDMI_AUDIO, "gout_disp0_pclk_hdmi_audio",
+	     "dout_disp0_pclk_disp0_0_133", CG_CTRL_VAL_PCLK_DISP0_0_133, 11, 0,
+	     0),
+	GATE(CLK_GOUT_DISP0_PCLK_HDMI, "gout_disp0_pclk_hdmi",
+	     "dout_disp0_pclk_disp0_0_133", CG_CTRL_VAL_PCLK_DISP0_0_133, 10, 0,
+	     0),
+	GATE(CLK_GOUT_DISP0_PCLK_DSIM2, "gout_disp0_pclk_dsim2",
+	     "dout_disp0_pclk_disp0_0_133", CG_CTRL_VAL_PCLK_DISP0_0_133, 9, 0,
+	     0),
+	GATE(CLK_GOUT_DISP0_PCLK_DSIM1, "gout_disp0_pclk_dsim1",
+	     "dout_disp0_pclk_disp0_0_133", CG_CTRL_VAL_PCLK_DISP0_0_133, 8, 0,
+	     0),
+	GATE(CLK_GOUT_DISP0_PCLK_DSIM0, "gout_disp0_pclk_dsim0",
+	     "dout_disp0_pclk_disp0_0_133", CG_CTRL_VAL_PCLK_DISP0_0_133, 7, 0,
+	     0),
+	GATE(CLK_GOUT_DISP0_PCLK_SYSREG_DISP0, "gout_disp0_pclk_sysreg_disp0",
+	     "dout_disp0_pclk_disp0_0_133", CG_CTRL_VAL_PCLK_DISP0_0_133, 6, 0,
+	     0),
+	GATE(CLK_GOUT_DISP0_PCLK_PMU_DISP0, "gout_disp0_pclk_pmu_disp0",
+	     "dout_disp0_pclk_disp0_0_133", CG_CTRL_VAL_PCLK_DISP0_0_133, 5,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_DISP0_PCLK_CMU_DISP0, "gout_disp0_pclk_cmu_disp0",
+	     "dout_disp0_pclk_disp0_0_133", CG_CTRL_VAL_PCLK_DISP0_0_133, 4,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_DISP0_ACLK_XIU_DISP0SFRX, "gout_disp0_aclk_xiu_disp0sfrx",
+	     "dout_disp0_pclk_disp0_0_133", CG_CTRL_VAL_PCLK_DISP0_0_133, 3,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_DISP0_ACLK_AXI2APB_DISP0_1P,
+	     "gout_disp0_aclk_axi2apb_disp0_1p", "dout_disp0_pclk_disp0_0_133",
+	     CG_CTRL_VAL_PCLK_DISP0_0_133, 2, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_DISP0_ACLK_AXI2APB_DISP0_0P,
+	     "gout_disp0_aclk_axi2apb_disp0_0p", "dout_disp0_pclk_disp0_0_133",
+	     CG_CTRL_VAL_PCLK_DISP0_0_133, 1, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_DISP0_ACLK_AXI_LH_ASYNC_MI_DISP0SFR,
+	     "gout_disp0_aclk_axi_lh_async_mi_disp0sfr",
+	     "dout_disp0_pclk_disp0_0_133", CG_CTRL_VAL_PCLK_DISP0_0_133, 0, 0,
+	     0),
+	GATE(CLK_GOUT_DISP0_PCLK_HPM_APBIF_DISP0,
+	     "gout_disp0_pclk_hpm_apbif_disp0", "dout_disp0_pclk_disp0_0_133",
+	     CG_CTRL_VAL_PCLK_DISP0_0_133_HPM_APBIF_DISP0, 0, CLK_IGNORE_UNUSED,
+	     0),
+	GATE(CLK_GOUT_DISP0_PCLK_DECON0, "gout_disp0_pclk_decon0",
+	     "dout_disp0_pclk_disp0_0_133",
+	     CG_CTRL_VAL_PCLK_DISP0_0_133_SECURE_DECON0, 0, 0, 0),
+	GATE(CLK_GOUT_DISP0_PCLK_VPP0_0, "gout_disp0_pclk_vpp0_0",
+	     "dout_disp0_pclk_disp0_0_133",
+	     CG_CTRL_VAL_PCLK_DISP0_0_133_SECURE_VPP0, 0, 0, 0),
+	GATE(CLK_GOUT_DISP0_PCLK_SFW_DISP0_0, "gout_disp0_pclk_sfw_disp0_0",
+	     "dout_disp0_pclk_disp0_0_133",
+	     CG_CTRL_VAL_PCLK_DISP0_0_133_SECURE_SFW_DISP0_0, 0,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_DISP0_PCLK_SFW_DISP0_1, "gout_disp0_pclk_sfw_disp0_1",
+	     "dout_disp0_pclk_disp0_0_133",
+	     CG_CTRL_VAL_PCLK_DISP0_0_133_SECURE_SFW_DISP0_1, 0,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_DISP0_SCLK_DISP1_400, "gout_disp0_sclk_disp1_400",
+	     "mout_disp0_disp_pll", CG_CTRL_VAL_SCLK_DISP1_400, 0, 0, 0),
+	GATE(CLK_GOUT_DISP0_SCLK_DECON0_ECLK0, "gout_disp0_sclk_decon0_eclk0",
+	     "dout_disp0_sclk_decon0_eclk0", CG_CTRL_VAL_SCLK_DECON0_ECLK0, 0,
+	     0, 0),
+	GATE(CLK_GOUT_DISP0_SCLK_DECON0_VCLK0, "gout_disp0_sclk_decon0_vclk0",
+	     "dout_disp0_sclk_decon0_vclk0", CG_CTRL_VAL_SCLK_DECON0_VCLK0, 0,
+	     0, 0),
+	GATE(CLK_GOUT_DISP0_SCLK_DECON0_VCLK1, "gout_disp0_sclk_decon0_vclk1",
+	     "dout_disp0_sclk_decon0_vclk1", CG_CTRL_VAL_SCLK_DECON0_VCLK1, 0,
+	     0, 0),
+	GATE(CLK_GOUT_DISP0_SCLK_HDMI_AUDIO, "gout_disp0_sclk_hdmi_audio",
+	     "mout_disp0_sclk_disp0_hdmi_audio", CG_CTRL_VAL_SCLK_HDMI_AUDIO, 0,
+	     0, 0),
+	GATE(CLK_GOUT_DISP0_SCLK_PROMISE_DISP0, "gout_disp0_sclk_promise_disp0",
+	     "gout_top_sclk_promise_disp", CG_CTRL_VAL_SCLK_DISP0_PROMISE, 0, 0,
+	     0),
+	GATE(CLK_GOUT_DISP0_PHYCLK_HDMIPHY_TMDS_20B_CLKO,
+	     "gout_disp0_phyclk_hdmiphy_tmds_20b_clko",
+	     "dout_disp0_phyclk_hdmiphy_tmds_20b_clko",
+	     CG_CTRL_VAL_PHYCLK_HDMIPHY, 2, 0, 0),
+	GATE(CLK_GOUT_DISP0_PHYCLK_HDMIPHY_TMDS_10B_CLKO,
+	     "gout_disp0_phyclk_hdmiphy_tmds_10b_clko",
+	     "mout_disp0_phyclk_hdmiphy_tmds_clko_user",
+	     CG_CTRL_VAL_PHYCLK_HDMIPHY, 1, 0, 0),
+	GATE(CLK_GOUT_DISP0_PHYCLK_HDMIPHY_PIXEL_CLKO,
+	     "gout_disp0_phyclk_hdmiphy_pixel_clko",
+	     "dout_disp0_phyclk_hdmiphy_pixel_clko", CG_CTRL_VAL_PHYCLK_HDMIPHY,
+	     0, 0, 0),
+	GATE(CLK_GOUT_DISP0_PHYCLK_MIPIDPHY0_BITCLKDIV8,
+	     "gout_disp0_phyclk_mipidphy0_bitclkdiv8",
+	     "mout_disp0_phyclk_mipidphy0_bitclkdiv8_user",
+	     CG_CTRL_VAL_PHYCLK_MIPIDPHY0, 1, 0, 0),
+	GATE(CLK_GOUT_DISP0_PHYCLK_MIPIDPHY0_RXCLKESC0,
+	     "gout_disp0_phyclk_mipidphy0_rxclkesc0",
+	     "mout_disp0_phyclk_mipidphy0_rxclkesc0_user",
+	     CG_CTRL_VAL_PHYCLK_MIPIDPHY0, 0, 0, 0),
+	GATE(CLK_GOUT_DISP0_PHYCLK_MIPIDPHY1_BITCLKDIV8,
+	     "gout_disp0_phyclk_mipidphy1_bitclkdiv8",
+	     "mout_disp0_phyclk_mipidphy1_bitclkdiv8_user",
+	     CG_CTRL_VAL_PHYCLK_MIPIDPHY1, 1, 0, 0),
+	GATE(CLK_GOUT_DISP0_PHYCLK_MIPIDPHY1_RXCLKESC0,
+	     "gout_disp0_phyclk_mipidphy1_rxclkesc0",
+	     "mout_disp0_phyclk_mipidphy1_rxclkesc0_user",
+	     CG_CTRL_VAL_PHYCLK_MIPIDPHY1, 0, 0, 0),
+	GATE(CLK_GOUT_DISP0_PHYCLK_MIPIDPHY2_BITCLKDIV8,
+	     "gout_disp0_phyclk_mipidphy2_bitclkdiv8",
+	     "mout_disp0_phyclk_mipidphy2_bitclkdiv8_user",
+	     CG_CTRL_VAL_PHYCLK_MIPIDPHY2, 1, 0, 0),
+	GATE(CLK_GOUT_DISP0_PHYCLK_MIPIDPHY2_RXCLKESC0,
+	     "gout_disp0_phyclk_mipidphy2_rxclkesc0",
+	     "mout_disp0_phyclk_mipidphy2_rxclkesc0_user",
+	     CG_CTRL_VAL_PHYCLK_MIPIDPHY2, 0, 0, 0),
+	GATE(CLK_GOUT_DISP0_PHYCLK_DPPHY_CH3_TXD_CLK,
+	     "gout_disp0_phyclk_dpphy_ch3_txd_clk",
+	     "mout_disp0_phyclk_dpphy_ch3_txd_clk_user",
+	     CG_CTRL_VAL_PHYCLK_DPPHY, 3, 0, 0),
+	GATE(CLK_GOUT_DISP0_PHYCLK_DPPHY_CH2_TXD_CLK,
+	     "gout_disp0_phyclk_dpphy_ch2_txd_clk",
+	     "mout_disp0_phyclk_dpphy_ch2_txd_clk_user",
+	     CG_CTRL_VAL_PHYCLK_DPPHY, 2, 0, 0),
+	GATE(CLK_GOUT_DISP0_PHYCLK_DPPHY_CH1_TXD_CLK,
+	     "gout_disp0_phyclk_dpphy_ch1_txd_clk",
+	     "mout_disp0_phyclk_dpphy_ch1_txd_clk_user",
+	     CG_CTRL_VAL_PHYCLK_DPPHY, 1, 0, 0),
+	GATE(CLK_GOUT_DISP0_PHYCLK_DPPHY_CH0_TXD_CLK,
+	     "gout_disp0_phyclk_dpphy_ch0_txd_clk",
+	     "mout_disp0_phyclk_dpphy_ch0_txd_clk_user",
+	     CG_CTRL_VAL_PHYCLK_DPPHY, 0, 0, 0),
+	GATE(CLK_GOUT_DISP0_OSCCLK_I_MIPI_DPHY_M4S4_M_XI,
+	     "gout_disp0_oscclk_i_mipi_dphy_m4s4_m_xi", "oscclk",
+	     CG_CTRL_VAL_OSCCLK, 4, 0, 0),
+	GATE(CLK_GOUT_DISP0_OSCCLK_I_MIPI_DPHY_M4S0_M_XI,
+	     "gout_disp0_oscclk_i_mipi_dphy_m4s0_m_xi", "oscclk",
+	     CG_CTRL_VAL_OSCCLK, 3, 0, 0),
+	GATE(CLK_GOUT_DISP0_OSCCLK_I_MIPI_DPHY_M1S0_M_XI,
+	     "gout_disp0_oscclk_i_mipi_dphy_m1s0_m_xi", "oscclk",
+	     CG_CTRL_VAL_OSCCLK, 2, 0, 0),
+	GATE(CLK_GOUT_DISP0_OSCCLK_I_DPTX_PHY_I_REF_CLK_24M,
+	     "gout_disp0_oscclk_i_dptx_phy_i_ref_clk_24m", "oscclk",
+	     CG_CTRL_VAL_OSCCLK, 1, 0, 0),
+	GATE(CLK_GOUT_DISP0_OSCCLK_DP_I_CLK_24M,
+	     "gout_disp0_oscclk_dp_i_clk_24m", "oscclk", CG_CTRL_VAL_OSCCLK, 0,
+	     0, 0),
+};
+
+static const struct samsung_cmu_info disp0_cmu_info __initconst = {
+	.pll_clks		= disp0_pll_clks,
+	.nr_pll_clks		= ARRAY_SIZE(disp0_pll_clks),
+	.mux_clks		= disp0_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(disp0_mux_clks),
+	.div_clks		= disp0_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(disp0_div_clks),
+	.gate_clks		= disp0_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(disp0_gate_clks),
+	.fixed_clks		= disp0_fixed_clks,
+	.nr_fixed_clks		= ARRAY_SIZE(disp0_fixed_clks),
+	.nr_clk_ids		= DISP0_NR_CLK,
+	.clk_regs		= disp0_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(disp0_clk_regs),
+};
+
+/* ---- CMU_DISP1 ---------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_DISP1 (0x13F00000) */
+#define CLK_CON_MUX_ACLK_DISP1_0_400_USER			0x0200
+#define CLK_CON_MUX_ACLK_DISP1_1_400_USER			0x0204
+#define CLK_CON_MUX_SCLK_DISP1_DECON1_ECLK0_USER		0x0208
+#define CLK_CON_MUX_SCLK_DISP1_DECON1_ECLK1_USER		0x020C
+#define CLK_CON_MUX_SCLK_DISP1_600_USER				0x0210
+#define CLK_CON_MUX_PHYCLK_MIPIDPHY0_BITCLKDIV2_USER_DISP1	0x0214
+#define CLK_CON_MUX_PHYCLK_MIPIDPHY1_BITCLKDIV2_USER_DISP1	0x0218
+#define CLK_CON_MUX_PHYCLK_MIPIDPHY2_BITCLKDIV2_USER_DISP1	0x021C
+#define CLK_CON_MUX_PHYCLK_DISP1_HDMIPHY_PIXEL_CLKO_USER	0x0220
+#define CLK_CON_MUX_ACLK_DISP1_1_400_DISP1			0x0224
+#define CLK_CON_MUX_SCLK_DISP1_DECON1_ECLK0_DISP1		0x0228
+#define CLK_CON_MUX_SCLK_DISP1_DECON1_ECLK1_DISP1		0x022C
+#define CLK_CON_MUX_SCLK_DECON1_ECLK1				0x0230
+#define CLK_CON_DIV_PCLK_DISP1_0_133				0x0400
+#define CLK_CON_DIV_SCLK_DECON1_ECLK0				0x0404
+#define CLK_CON_DIV_SCLK_DECON1_ECLK1				0x0408
+#define CLK_STAT_MUX_ACLK_DISP1_0_400_USER			0x0600
+#define CLK_STAT_MUX_ACLK_DISP1_1_400_USER			0x0604
+#define CLK_STAT_MUX_SCLK_DISP1_DECON1_ECLK0_USER		0x0608
+#define CLK_STAT_MUX_SCLK_DISP1_DECON1_ECLK1_USER		0x060C
+#define CLK_STAT_MUX_PHYCLK_MIPIDPHY0_BITCLKDIV2_USER_DISP1	0x0610
+#define CLK_STAT_MUX_PHYCLK_MIPIDPHY1_BITCLKDIV2_USER_DISP1	0x0614
+#define CLK_STAT_MUX_PHYCLK_MIPIDPHY2_BITCLKDIV2_USER_DISP1	0x0618
+#define CLK_STAT_MUX_PHYCLK_DISP1_HDMIPHY_PIXEL_CLKO_USER	0x061C
+#define CLK_STAT_MUX_SCLK_DISP1_600_USER			0x0620
+#define CLK_STAT_MUX_ACLK_DISP1_1_400_DISP1			0x0624
+#define CLK_STAT_MUX_SCLK_DISP1_DECON1_ECLK0_DISP1		0x0628
+#define CLK_STAT_MUX_SCLK_DISP1_DECON1_ECLK1_DISP1		0x062C
+#define CLK_STAT_MUX_SCLK_DECON1_ECLK1				0x0630
+#define CG_CTRL_VAL_ACLK_DISP1_0_400				0x0800
+#define CG_CTRL_VAL_ACLK_DISP1_1_400				0x0804
+#define CG_CTRL_VAL_ACLK_DISP1_0_400_SECURE_SFW_DISP1_0		0x0808
+#define CG_CTRL_VAL_ACLK_DISP1_1_400_SECURE_SFW_DISP1_1		0x080C
+#define CG_CTRL_VAL_PCLK_DISP1_0_133				0x0820
+#define CG_CTRL_VAL_PCLK_DISP1_0_133_HPM_APBIF_DISP1		0x0824
+#define CG_CTRL_VAL_PCLK_DISP1_0_133_SECURE_SFW_DISP1_0		0x0828
+#define CG_CTRL_VAL_PCLK_DISP1_0_133_SECURE_SFW_DISP1_1		0x082C
+#define CG_CTRL_VAL_SCLK_DECON1_ECLK_0				0x0840
+#define CG_CTRL_VAL_SCLK_DECON1_ECLK_1				0x0844
+#define CG_CTRL_VAL_SCLK_DISP1_PROMISE				0x0848
+#define CLKOUT_CMU_DISP1					0x0C00
+#define CLKOUT_CMU_DISP1_DIV_STAT				0x0C04
+#define DISP1_SFR_IGNORE_REQ_SYSCLK				0x0D04
+#define CMU_DISP1_SPARE0					0x0D08
+#define CMU_DISP1_SPARE1					0x0D0C
+#define CG_CTRL_MAN_ACLK_DISP1_0_400				0x1800
+#define CG_CTRL_MAN_ACLK_DISP1_1_400				0x1804
+#define CG_CTRL_MAN_ACLK_DISP1_0_400_SECURE_SFW_DISP1_0		0x1808
+#define CG_CTRL_MAN_ACLK_DISP1_1_400_SECURE_SFW_DISP1_1		0x180C
+#define CG_CTRL_MAN_PCLK_DISP1_0_133				0x1820
+#define CG_CTRL_MAN_PCLK_DISP1_0_133_HPM_APBIF_DISP1		0x1824
+#define CG_CTRL_MAN_PCLK_DISP1_0_133_SECURE_SFW_DISP1_0		0x1828
+#define CG_CTRL_MAN_PCLK_DISP1_0_133_SECURE_SFW_DISP1_1		0x182C
+#define CG_CTRL_MAN_SCLK_DECON1_ECLK_0				0x1840
+#define CG_CTRL_MAN_SCLK_DECON1_ECLK_1				0x1844
+#define CG_CTRL_MAN_SCLK_DISP1_PROMISE				0x1848
+#define CG_CTRL_STAT_ACLK_DISP1_0_400				0x1C00
+#define CG_CTRL_STAT_ACLK_DISP1_1_400				0x1C04
+#define CG_CTRL_STAT_ACLK_DISP1_0_400_SECURE_SFW_DISP1_0	0x1C08
+#define CG_CTRL_STAT_ACLK_DISP1_1_400_SECURE_SFW_DISP1_1	0x1C0C
+#define CG_CTRL_STAT_PCLK_DISP1_0_133_0				0x1C20
+#define CG_CTRL_STAT_PCLK_DISP1_0_133_1				0x1C24
+#define CG_CTRL_STAT_PCLK_DISP1_0_133_2				0x1C28
+#define CG_CTRL_STAT_PCLK_DISP1_0_133_HPM_APBIF_DISP1		0x1C2C
+#define CG_CTRL_STAT_PCLK_DISP1_0_133_SECURE_SFW_DISP1_0	0x1C30
+#define CG_CTRL_STAT_PCLK_DISP1_0_133_SECURE_SFW_DISP1_1	0x1C34
+#define CG_CTRL_STAT_SCLK_DECON1_ECLK_0				0x1C40
+#define CG_CTRL_STAT_SCLK_DECON1_ECLK_1				0x1C44
+#define CG_CTRL_STAT_SCLK_DISP1_PROMISE				0x1C48
+#define QCH_CTRL_AXI_LH_ASYNC_MI_DISP1SFR			0x2000
+#define QCH_CTRL_CMU_DISP1					0x2004
+#define QCH_CTRL_PMU_DISP1					0x2008
+#define QCH_CTRL_SYSREG_DISP1					0x200C
+#define QCH_CTRL_VPP1						0x2010
+#define QCH_CTRL_VPP1_G2					0x2010
+#define QCH_CTRL_VPP1_G3					0x2014
+#define QCH_CTRL_DECON1_PCLK_0					0x201C
+#define QCH_CTRL_DECON1_PCLK_1					0x2020
+#define QCH_CTRL_PPMU_DISP1_0					0x2028
+#define QCH_CTRL_PPMU_DISP1_1					0x202C
+#define QCH_CTRL_SMMU_DISP1_0					0x2030
+#define QCH_CTRL_SMMU_DISP1_1					0x2034
+#define QCH_CTRL_SFW_DISP1_0					0x2038
+#define QCH_CTRL_SFW_DISP1_1					0x203C
+#define QCH_CTRL_AXI_LH_ASYNC_SI_DISP1_0			0x2040
+#define QCH_CTRL_AXI_LH_ASYNC_SI_DISP1_1			0x2044
+#define QSTATE_CTRL_DECON1_ECLK_0				0x240C
+#define QSTATE_CTRL_DECON1_ECLK_1				0x2410
+#define QSTATE_CTRL_HPM_APBIF_DISP1				0x241C
+#define QSTATE_CTRL_PROMISE_DISP1				0x2420
+
+static const unsigned long disp1_clk_regs[] __initconst = {
+	CLK_CON_MUX_ACLK_DISP1_0_400_USER,
+	CLK_CON_MUX_ACLK_DISP1_1_400_USER,
+	CLK_CON_MUX_SCLK_DISP1_DECON1_ECLK0_USER,
+	CLK_CON_MUX_SCLK_DISP1_DECON1_ECLK1_USER,
+	CLK_CON_MUX_SCLK_DISP1_600_USER,
+	CLK_CON_MUX_PHYCLK_MIPIDPHY0_BITCLKDIV2_USER_DISP1,
+	CLK_CON_MUX_PHYCLK_MIPIDPHY1_BITCLKDIV2_USER_DISP1,
+	CLK_CON_MUX_PHYCLK_MIPIDPHY2_BITCLKDIV2_USER_DISP1,
+	CLK_CON_MUX_PHYCLK_DISP1_HDMIPHY_PIXEL_CLKO_USER,
+	CLK_CON_MUX_ACLK_DISP1_1_400_DISP1,
+	CLK_CON_MUX_SCLK_DISP1_DECON1_ECLK0_DISP1,
+	CLK_CON_MUX_SCLK_DISP1_DECON1_ECLK1_DISP1,
+	CLK_CON_MUX_SCLK_DECON1_ECLK1,
+	CLK_CON_DIV_PCLK_DISP1_0_133,
+	CLK_CON_DIV_SCLK_DECON1_ECLK0,
+	CLK_CON_DIV_SCLK_DECON1_ECLK1,
+	CLK_STAT_MUX_ACLK_DISP1_0_400_USER,
+	CLK_STAT_MUX_ACLK_DISP1_1_400_USER,
+	CLK_STAT_MUX_SCLK_DISP1_DECON1_ECLK0_USER,
+	CLK_STAT_MUX_SCLK_DISP1_DECON1_ECLK1_USER,
+	CLK_STAT_MUX_PHYCLK_MIPIDPHY0_BITCLKDIV2_USER_DISP1,
+	CLK_STAT_MUX_PHYCLK_MIPIDPHY1_BITCLKDIV2_USER_DISP1,
+	CLK_STAT_MUX_PHYCLK_MIPIDPHY2_BITCLKDIV2_USER_DISP1,
+	CLK_STAT_MUX_PHYCLK_DISP1_HDMIPHY_PIXEL_CLKO_USER,
+	CLK_STAT_MUX_SCLK_DISP1_600_USER,
+	CLK_STAT_MUX_ACLK_DISP1_1_400_DISP1,
+	CLK_STAT_MUX_SCLK_DISP1_DECON1_ECLK0_DISP1,
+	CLK_STAT_MUX_SCLK_DISP1_DECON1_ECLK1_DISP1,
+	CLK_STAT_MUX_SCLK_DECON1_ECLK1,
+	CG_CTRL_VAL_ACLK_DISP1_0_400,
+	CG_CTRL_VAL_ACLK_DISP1_1_400,
+	CG_CTRL_VAL_ACLK_DISP1_0_400_SECURE_SFW_DISP1_0,
+	CG_CTRL_VAL_ACLK_DISP1_1_400_SECURE_SFW_DISP1_1,
+	CG_CTRL_VAL_PCLK_DISP1_0_133,
+	CG_CTRL_VAL_PCLK_DISP1_0_133_HPM_APBIF_DISP1,
+	CG_CTRL_VAL_PCLK_DISP1_0_133_SECURE_SFW_DISP1_0,
+	CG_CTRL_VAL_PCLK_DISP1_0_133_SECURE_SFW_DISP1_1,
+	CG_CTRL_VAL_SCLK_DECON1_ECLK_0,
+	CG_CTRL_VAL_SCLK_DECON1_ECLK_1,
+	CG_CTRL_VAL_SCLK_DISP1_PROMISE,
+	CLKOUT_CMU_DISP1,
+	CLKOUT_CMU_DISP1_DIV_STAT,
+	DISP1_SFR_IGNORE_REQ_SYSCLK,
+	CMU_DISP1_SPARE0,
+	CMU_DISP1_SPARE1,
+	CG_CTRL_MAN_ACLK_DISP1_0_400,
+	CG_CTRL_MAN_ACLK_DISP1_1_400,
+	CG_CTRL_MAN_ACLK_DISP1_0_400_SECURE_SFW_DISP1_0,
+	CG_CTRL_MAN_ACLK_DISP1_1_400_SECURE_SFW_DISP1_1,
+	CG_CTRL_MAN_PCLK_DISP1_0_133,
+	CG_CTRL_MAN_PCLK_DISP1_0_133_HPM_APBIF_DISP1,
+	CG_CTRL_MAN_PCLK_DISP1_0_133_SECURE_SFW_DISP1_0,
+	CG_CTRL_MAN_PCLK_DISP1_0_133_SECURE_SFW_DISP1_1,
+	CG_CTRL_MAN_SCLK_DECON1_ECLK_0,
+	CG_CTRL_MAN_SCLK_DECON1_ECLK_1,
+	CG_CTRL_MAN_SCLK_DISP1_PROMISE,
+	CG_CTRL_STAT_ACLK_DISP1_0_400,
+	CG_CTRL_STAT_ACLK_DISP1_1_400,
+	CG_CTRL_STAT_ACLK_DISP1_0_400_SECURE_SFW_DISP1_0,
+	CG_CTRL_STAT_ACLK_DISP1_1_400_SECURE_SFW_DISP1_1,
+	CG_CTRL_STAT_PCLK_DISP1_0_133_0,
+	CG_CTRL_STAT_PCLK_DISP1_0_133_1,
+	CG_CTRL_STAT_PCLK_DISP1_0_133_2,
+	CG_CTRL_STAT_PCLK_DISP1_0_133_HPM_APBIF_DISP1,
+	CG_CTRL_STAT_PCLK_DISP1_0_133_SECURE_SFW_DISP1_0,
+	CG_CTRL_STAT_PCLK_DISP1_0_133_SECURE_SFW_DISP1_1,
+	CG_CTRL_STAT_SCLK_DECON1_ECLK_0,
+	CG_CTRL_STAT_SCLK_DECON1_ECLK_1,
+	CG_CTRL_STAT_SCLK_DISP1_PROMISE,
+	QCH_CTRL_AXI_LH_ASYNC_MI_DISP1SFR,
+	QCH_CTRL_CMU_DISP1,
+	QCH_CTRL_PMU_DISP1,
+	QCH_CTRL_SYSREG_DISP1,
+	QCH_CTRL_VPP1,
+	QCH_CTRL_VPP1_G2,
+	QCH_CTRL_VPP1_G3,
+	QCH_CTRL_DECON1_PCLK_0,
+	QCH_CTRL_DECON1_PCLK_1,
+	QCH_CTRL_PPMU_DISP1_0,
+	QCH_CTRL_PPMU_DISP1_1,
+	QCH_CTRL_SMMU_DISP1_0,
+	QCH_CTRL_SMMU_DISP1_1,
+	QCH_CTRL_SFW_DISP1_0,
+	QCH_CTRL_SFW_DISP1_1,
+	QCH_CTRL_AXI_LH_ASYNC_SI_DISP1_0,
+	QCH_CTRL_AXI_LH_ASYNC_SI_DISP1_1,
+	QSTATE_CTRL_DECON1_ECLK_0,
+	QSTATE_CTRL_DECON1_ECLK_1,
+	QSTATE_CTRL_HPM_APBIF_DISP1,
+	QSTATE_CTRL_PROMISE_DISP1,
+};
+
+PNAME(disp1_mux_aclk_disp1_0_400_user_p)		= { "oscclk",
+							    "gout_top_aclk_disp1_0_400" };
+PNAME(disp1_mux_aclk_disp1_1_400_user_p)		= { "oscclk",
+							    "gout_top_aclk_disp1_1_400" };
+PNAME(disp1_mux_sclk_disp1_decon1_eclk0_user_p)		= { "oscclk",
+							    "gout_top_sclk_disp1_decon1_eclk0" };
+PNAME(disp1_mux_sclk_disp1_decon1_eclk1_user_p)		= { "oscclk",
+							    "gout_top_sclk_disp1_decon1_eclk1" };
+PNAME(disp1_mux_sclk_disp1_600_user_p)			= { "oscclk",
+							    "gout_disp0_sclk_disp1_400" };
+PNAME(disp1_mux_phyclk_mipidphy0_bitclkdiv2_user_p)	= { "oscclk",
+							    "phyclk_mipidphy0_bitclkdiv2_phy" };
+PNAME(disp1_mux_phyclk_mipidphy1_bitclkdiv2_user_p)	= { "oscclk",
+							    "phyclk_mipidphy1_bitclkdiv2_phy" };
+PNAME(disp1_mux_phyclk_mipidphy2_bitclkdiv2_user_p)	= { "oscclk",
+							    "phyclk_mipidphy2_bitclkdiv2_phy" };
+PNAME(disp1_mux_phyclk_disp1_hdmiphy_pixel_clko_user_p)	= {
+	"oscclk",
+	"phyclk_disp1_hdmiphy_pixel_clko_phy" };
+PNAME(disp1_mux_aclk_disp1_1_400_p)			= { "mout_disp1_aclk_disp1_0_400_user",
+							    "mout_disp1_aclk_disp1_1_400_user" };
+PNAME(disp1_mux_sclk_disp1_decon1_eclk0_p)		= {
+	"mout_disp1_sclk_disp1_decon1_eclk0_user",
+	"oscclk",
+	"mout_disp1_sclk_disp1_600_user",
+	"mout_disp1_phyclk_mipidphy0_bitclkdiv2_user",
+	"mout_disp1_phyclk_mipidphy1_bitclkdiv2_user",
+	"mout_disp1_phyclk_mipidphy2_bitclkdiv2_user" };
+PNAME(disp1_mux_sclk_disp1_decon1_eclk1_p)		= {
+	"mout_disp1_sclk_disp1_decon1_eclk1_user",
+	"oscclk",
+	"mout_disp1_sclk_disp1_600_user" };
+PNAME(disp1_mux_sclk_decon1_eclk1_p)			= {
+	"dout_disp1_sclk_decon1_eclk1",
+	"mout_disp1_phyclk_disp1_hdmiphy_pixel_clko_user" };
+
+static const struct samsung_fixed_rate_clock disp1_fixed_clks[] __initconst = {
+	FRATE(CLK_PHYCLK_DISP1_HDMIPHY_PIXEL_CLKO_PHY,
+	      "phyclk_disp1_hdmiphy_pixel_clko_phy", NULL, 0, 0),
+};
+
+static const struct samsung_mux_clock disp1_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_DISP1_ACLK_DISP1_0_400_USER,
+	    "mout_disp1_aclk_disp1_0_400_user",
+	    disp1_mux_aclk_disp1_0_400_user_p,
+	    CLK_CON_MUX_ACLK_DISP1_0_400_USER, 12, 1),
+	MUX(CLK_MOUT_DISP1_ACLK_DISP1_1_400_USER,
+	    "mout_disp1_aclk_disp1_1_400_user",
+	    disp1_mux_aclk_disp1_1_400_user_p,
+	    CLK_CON_MUX_ACLK_DISP1_1_400_USER, 12, 1),
+	MUX(CLK_MOUT_DISP1_SCLK_DISP1_DECON1_ECLK0_USER,
+	    "mout_disp1_sclk_disp1_decon1_eclk0_user",
+	    disp1_mux_sclk_disp1_decon1_eclk0_user_p,
+	    CLK_CON_MUX_SCLK_DISP1_DECON1_ECLK0_USER, 12, 1),
+	MUX(CLK_MOUT_DISP1_SCLK_DISP1_DECON1_ECLK1_USER,
+	    "mout_disp1_sclk_disp1_decon1_eclk1_user",
+	    disp1_mux_sclk_disp1_decon1_eclk1_user_p,
+	    CLK_CON_MUX_SCLK_DISP1_DECON1_ECLK1_USER, 12, 1),
+	MUX(CLK_MOUT_DISP1_SCLK_DISP1_600_USER,
+	    "mout_disp1_sclk_disp1_600_user", disp1_mux_sclk_disp1_600_user_p,
+	    CLK_CON_MUX_SCLK_DISP1_600_USER, 12, 1),
+	MUX(CLK_MOUT_DISP1_PHYCLK_MIPIDPHY0_BITCLKDIV2_USER,
+	    "mout_disp1_phyclk_mipidphy0_bitclkdiv2_user",
+	    disp1_mux_phyclk_mipidphy0_bitclkdiv2_user_p,
+	    CLK_CON_MUX_PHYCLK_MIPIDPHY0_BITCLKDIV2_USER_DISP1, 12, 1),
+	MUX(CLK_MOUT_DISP1_PHYCLK_MIPIDPHY1_BITCLKDIV2_USER,
+	    "mout_disp1_phyclk_mipidphy1_bitclkdiv2_user",
+	    disp1_mux_phyclk_mipidphy1_bitclkdiv2_user_p,
+	    CLK_CON_MUX_PHYCLK_MIPIDPHY1_BITCLKDIV2_USER_DISP1, 12, 1),
+	MUX(CLK_MOUT_DISP1_PHYCLK_MIPIDPHY2_BITCLKDIV2_USER,
+	    "mout_disp1_phyclk_mipidphy2_bitclkdiv2_user",
+	    disp1_mux_phyclk_mipidphy2_bitclkdiv2_user_p,
+	    CLK_CON_MUX_PHYCLK_MIPIDPHY2_BITCLKDIV2_USER_DISP1, 12, 1),
+	MUX(CLK_MOUT_DISP1_PHYCLK_DISP1_HDMIPHY_PIXEL_CLKO_USER,
+	    "mout_disp1_phyclk_disp1_hdmiphy_pixel_clko_user",
+	    disp1_mux_phyclk_disp1_hdmiphy_pixel_clko_user_p,
+	    CLK_CON_MUX_PHYCLK_DISP1_HDMIPHY_PIXEL_CLKO_USER, 12, 1),
+	MUX(CLK_MOUT_DISP1_ACLK_DISP1_1_400, "mout_disp1_aclk_disp1_1_400",
+	    disp1_mux_aclk_disp1_1_400_p, CLK_CON_MUX_ACLK_DISP1_1_400_DISP1,
+	    12, 1),
+	MUX(CLK_MOUT_DISP1_SCLK_DISP1_DECON1_ECLK0,
+	    "mout_disp1_sclk_disp1_decon1_eclk0",
+	    disp1_mux_sclk_disp1_decon1_eclk0_p,
+	    CLK_CON_MUX_SCLK_DISP1_DECON1_ECLK0_DISP1, 12, 3),
+	MUX(CLK_MOUT_DISP1_SCLK_DISP1_DECON1_ECLK1,
+	    "mout_disp1_sclk_disp1_decon1_eclk1",
+	    disp1_mux_sclk_disp1_decon1_eclk1_p,
+	    CLK_CON_MUX_SCLK_DISP1_DECON1_ECLK1_DISP1, 12, 2),
+	MUX(CLK_MOUT_DISP1_SCLK_DECON1_ECLK1, "mout_disp1_sclk_decon1_eclk1",
+	    disp1_mux_sclk_decon1_eclk1_p, CLK_CON_MUX_SCLK_DECON1_ECLK1, 12,
+	    1),
+};
+
+static const struct samsung_div_clock disp1_div_clks[] __initconst = {
+	DIV(CLK_DOUT_DISP1_PCLK_DISP1_0_133, "dout_disp1_pclk_disp1_0_133",
+	    "mout_disp1_aclk_disp1_0_400_user", CLK_CON_DIV_PCLK_DISP1_0_133, 0,
+	    3),
+	DIV(CLK_DOUT_DISP1_SCLK_DECON1_ECLK0, "dout_disp1_sclk_decon1_eclk0",
+	    "mout_disp1_sclk_disp1_decon1_eclk0", CLK_CON_DIV_SCLK_DECON1_ECLK0,
+	    0, 3),
+	DIV(CLK_DOUT_DISP1_SCLK_DECON1_ECLK1, "dout_disp1_sclk_decon1_eclk1",
+	    "mout_disp1_sclk_disp1_decon1_eclk1", CLK_CON_DIV_SCLK_DECON1_ECLK1,
+	    0, 3),
+};
+
+static const struct samsung_gate_clock disp1_gate_clks[] __initconst = {
+	GATE(CLK_GOUT_DISP1_ACLK_XIU_DISP1X0, "gout_disp1_aclk_xiu_disp1x0",
+	     "mout_disp1_aclk_disp1_0_400_user", CG_CTRL_VAL_ACLK_DISP1_0_400,
+	     5, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_DISP1_ACLK_AXI_LH_ASYNC_SI_DISP1_0,
+	     "gout_disp1_aclk_axi_lh_async_si_disp1_0",
+	     "mout_disp1_aclk_disp1_0_400_user", CG_CTRL_VAL_ACLK_DISP1_0_400,
+	     4, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_DISP1_ACLK_PPMU_DISP1_0, "gout_disp1_aclk_ppmu_disp1_0",
+	     "mout_disp1_aclk_disp1_0_400_user", CG_CTRL_VAL_ACLK_DISP1_0_400,
+	     3, 0, 0),
+	GATE(CLK_GOUT_DISP1_ACLK_SMMU_DISP1_0, "gout_disp1_aclk_smmu_disp1_0",
+	     "mout_disp1_aclk_disp1_0_400_user", CG_CTRL_VAL_ACLK_DISP1_0_400,
+	     1, 0, 0),
+	GATE(CLK_GOUT_DISP1_ACLK_VPP1_0, "gout_disp1_aclk_vpp1_0",
+	     "mout_disp1_aclk_disp1_0_400_user", CG_CTRL_VAL_ACLK_DISP1_0_400,
+	     0, 0, 0),
+	GATE(CLK_GOUT_DISP1_ACLK_XIU_DISP1X1, "gout_disp1_aclk_xiu_disp1x1",
+	     "mout_disp1_aclk_disp1_1_400", CG_CTRL_VAL_ACLK_DISP1_1_400, 6, 0,
+	     0),
+	GATE(CLK_GOUT_DISP1_ACLK_AXI_LH_ASYNC_SI_DISP1_1,
+	     "gout_disp1_aclk_axi_lh_async_si_disp1_1",
+	     "mout_disp1_aclk_disp1_1_400", CG_CTRL_VAL_ACLK_DISP1_1_400, 5, 0,
+	     0),
+	GATE(CLK_GOUT_DISP1_ACLK_QE_DISP1_WDMA, "gout_disp1_aclk_qe_disp1_wdma",
+	     "mout_disp1_aclk_disp1_1_400", CG_CTRL_VAL_ACLK_DISP1_1_400, 4, 0,
+	     0),
+	GATE(CLK_GOUT_DISP1_ACLK_PPMU_DISP1_1, "gout_disp1_aclk_ppmu_disp1_1",
+	     "mout_disp1_aclk_disp1_1_400", CG_CTRL_VAL_ACLK_DISP1_1_400, 3, 0,
+	     0),
+	GATE(CLK_GOUT_DISP1_ACLK_SMMU_DISP1_1, "gout_disp1_aclk_smmu_disp1_1",
+	     "mout_disp1_aclk_disp1_1_400", CG_CTRL_VAL_ACLK_DISP1_1_400, 1, 0,
+	     0),
+	GATE(CLK_GOUT_DISP1_ACLK_VPP1_1, "gout_disp1_aclk_vpp1_1",
+	     "mout_disp1_aclk_disp1_1_400", CG_CTRL_VAL_ACLK_DISP1_1_400, 0, 0,
+	     0),
+	GATE(CLK_GOUT_DISP1_ACLK_SFW_DISP1_0, "gout_disp1_aclk_sfw_disp1_0",
+	     "mout_disp1_aclk_disp1_0_400_user",
+	     CG_CTRL_VAL_ACLK_DISP1_0_400_SECURE_SFW_DISP1_0, 0,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_DISP1_ACLK_SFW_DISP1_1, "gout_disp1_aclk_sfw_disp1_1",
+	     "mout_disp1_aclk_disp1_1_400",
+	     CG_CTRL_VAL_ACLK_DISP1_1_400_SECURE_SFW_DISP1_1, 0,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_DISP1_PCLK_VPP1_1, "gout_disp1_pclk_vpp1_1",
+	     "dout_disp1_pclk_disp1_0_133", CG_CTRL_VAL_PCLK_DISP1_0_133, 15, 0,
+	     0),
+	GATE(CLK_GOUT_DISP1_PCLK_DECON1_1, "gout_disp1_pclk_decon1_1",
+	     "dout_disp1_pclk_disp1_0_133", CG_CTRL_VAL_PCLK_DISP1_0_133, 14, 0,
+	     0),
+	GATE(CLK_GOUT_DISP1_PCLK_DECON1_0, "gout_disp1_pclk_decon1_0",
+	     "dout_disp1_pclk_disp1_0_133", CG_CTRL_VAL_PCLK_DISP1_0_133, 13, 0,
+	     0),
+	GATE(CLK_GOUT_DISP1_PCLK_QE_DISP1_WDMA, "gout_disp1_pclk_qe_disp1_wdma",
+	     "dout_disp1_pclk_disp1_0_133", CG_CTRL_VAL_PCLK_DISP1_0_133, 12, 0,
+	     0),
+	GATE(CLK_GOUT_DISP1_PCLK_PPMU_DISP1_1, "gout_disp1_pclk_ppmu_disp1_1",
+	     "dout_disp1_pclk_disp1_0_133", CG_CTRL_VAL_PCLK_DISP1_0_133, 11, 0,
+	     0),
+	GATE(CLK_GOUT_DISP1_PCLK_PPMU_DISP1_0, "gout_disp1_pclk_ppmu_disp1_0",
+	     "dout_disp1_pclk_disp1_0_133", CG_CTRL_VAL_PCLK_DISP1_0_133, 10, 0,
+	     0),
+	GATE(CLK_GOUT_DISP1_PCLK_SMMU_DISP1_1, "gout_disp1_pclk_smmu_disp1_1",
+	     "dout_disp1_pclk_disp1_0_133", CG_CTRL_VAL_PCLK_DISP1_0_133, 9, 0,
+	     0),
+	GATE(CLK_GOUT_DISP1_PCLK_SMMU_DISP1_0, "gout_disp1_pclk_smmu_disp1_0",
+	     "dout_disp1_pclk_disp1_0_133", CG_CTRL_VAL_PCLK_DISP1_0_133, 8, 0,
+	     0),
+	GATE(CLK_GOUT_DISP1_PCLK_SYSREG_DISP1, "gout_disp1_pclk_sysreg_disp1",
+	     "dout_disp1_pclk_disp1_0_133", CG_CTRL_VAL_PCLK_DISP1_0_133, 7, 0,
+	     0),
+	GATE(CLK_GOUT_DISP1_PCLK_PMU_DISP1, "gout_disp1_pclk_pmu_disp1",
+	     "dout_disp1_pclk_disp1_0_133", CG_CTRL_VAL_PCLK_DISP1_0_133, 6,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_DISP1_PCLK_CMU_DISP1, "gout_disp1_pclk_cmu_disp1",
+	     "dout_disp1_pclk_disp1_0_133", CG_CTRL_VAL_PCLK_DISP1_0_133, 5,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_DISP1_PCLK_VPP1_0, "gout_disp1_pclk_vpp1_0",
+	     "dout_disp1_pclk_disp1_0_133", CG_CTRL_VAL_PCLK_DISP1_0_133, 4, 0,
+	     0),
+	GATE(CLK_GOUT_DISP1_ACLK_AXI2APB_DISP1_1X,
+	     "gout_disp1_aclk_axi2apb_disp1_1x", "dout_disp1_pclk_disp1_0_133",
+	     CG_CTRL_VAL_PCLK_DISP1_0_133, 3, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_DISP1_ACLK_AXI2APB_DISP1_0X,
+	     "gout_disp1_aclk_axi2apb_disp1_0x", "dout_disp1_pclk_disp1_0_133",
+	     CG_CTRL_VAL_PCLK_DISP1_0_133, 2, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_DISP1_ACLK_XIU_DISP1SFRX, "gout_disp1_aclk_xiu_disp1sfrx",
+	     "dout_disp1_pclk_disp1_0_133", CG_CTRL_VAL_PCLK_DISP1_0_133, 1, 0,
+	     0),
+	GATE(CLK_GOUT_DISP1_ACLK_AXI_LH_ASYNC_MI_DISP1SFR,
+	     "gout_disp1_aclk_axi_lh_async_mi_disp1sfr",
+	     "dout_disp1_pclk_disp1_0_133", CG_CTRL_VAL_PCLK_DISP1_0_133, 0, 0,
+	     0),
+	GATE(CLK_GOUT_DISP1_PCLK_HPM_APBIF_DISP1,
+	     "gout_disp1_pclk_hpm_apbif_disp1", "dout_disp1_pclk_disp1_0_133",
+	     CG_CTRL_VAL_PCLK_DISP1_0_133_HPM_APBIF_DISP1, 0, CLK_IGNORE_UNUSED,
+	     0),
+	GATE(CLK_GOUT_DISP1_PCLK_SFW_DISP1_0, "gout_disp1_pclk_sfw_disp1_0",
+	     "dout_disp1_pclk_disp1_0_133",
+	     CG_CTRL_VAL_PCLK_DISP1_0_133_SECURE_SFW_DISP1_0, 10,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_DISP1_PCLK_SFW_DISP1_1, "gout_disp1_pclk_sfw_disp1_1",
+	     "dout_disp1_pclk_disp1_0_133",
+	     CG_CTRL_VAL_PCLK_DISP1_0_133_SECURE_SFW_DISP1_1, 11,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_DISP1_SCLK_DECON1_ECLK_0, "gout_disp1_sclk_decon1_eclk_0",
+	     "dout_disp1_sclk_decon1_eclk0", CG_CTRL_VAL_SCLK_DECON1_ECLK_0, 0,
+	     0, 0),
+	GATE(CLK_GOUT_DISP1_SCLK_DECON1_ECLK_1, "gout_disp1_sclk_decon1_eclk_1",
+	     "dout_disp1_sclk_decon1_eclk1", CG_CTRL_VAL_SCLK_DECON1_ECLK_1, 0,
+	     0, 0),
+	GATE(CLK_GOUT_DISP1_SCLK_PROMISE_DISP1, "gout_disp1_sclk_promise_disp1",
+	     "gout_top_sclk_promise_disp", CG_CTRL_VAL_SCLK_DISP1_PROMISE, 0, 0,
+	     0),
+};
+
+static const struct samsung_cmu_info disp1_cmu_info __initconst = {
+	.mux_clks		= disp1_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(disp1_mux_clks),
+	.div_clks		= disp1_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(disp1_div_clks),
+	.gate_clks		= disp1_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(disp1_gate_clks),
+	.fixed_clks		= disp1_fixed_clks,
+	.nr_fixed_clks		= ARRAY_SIZE(disp1_fixed_clks),
+	.nr_clk_ids		= DISP1_NR_CLK,
+	.clk_regs		= disp1_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(disp1_clk_regs),
+};
+
+/* ---- CMU_FSYS0 ---------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_FSYS0 (0x10E90000) */
+#define CLK_CON_MUX_ACLK_FSYS0_200_USER				0x0200
+#define CLK_CON_MUX_SCLK_FSYS0_USBDRD30_USER			0x0204
+#define CLK_CON_MUX_SCLK_FSYS0_MMC0_USER			0x0208
+#define CLK_CON_MUX_SCLK_FSYS0_UFSUNIPRO_EMBEDDED_USER		0x020C
+#define CLK_CON_MUX_SCLK_FSYS0_24M_USER				0x0210
+#define CLK_CON_MUX_SCLK_FSYS0_UFSUNIPRO_EMBEDDED_CFG_USER	0x0214
+#define CLK_CON_MUX_PHYCLK_USBDRD30_UDRD30_PHYCLOCK_USER	0x0218
+#define CLK_CON_MUX_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK_USER	0x021C
+#define CLK_CON_MUX_PHYCLK_UFS_TX0_SYMBOL_USER			0x0220
+#define CLK_CON_MUX_PHYCLK_UFS_RX0_SYMBOL_USER			0x0224
+#define CLK_CON_MUX_PHYCLK_USBHOST20_PHYCLOCK_USER		0x0228
+#define CLK_CON_MUX_PHYCLK_USBHOST20_FREECLK_USER		0x022C
+#define CLK_CON_MUX_PHYCLK_USBHOST20_CLK48MOHCI_USER		0x0230
+#define CLK_CON_MUX_PHYCLK_USBHOST20PHY_REF_CLK			0x0234
+#define CLK_CON_MUX_PHYCLK_UFS_RX_PWM_CLK_USER			0x0238
+#define CLK_CON_MUX_PHYCLK_UFS_TX_PWM_CLK_USER			0x023C
+#define CLK_CON_MUX_PHYCLK_UFS_REFCLK_OUT_SOC_USER		0x0240
+#define CLK_STAT_MUX_ACLK_FSYS0_200_USER			0x0600
+#define CLK_STAT_MUX_SCLK_FSYS0_USBDRD30_USER			0x0604
+#define CLK_STAT_MUX_SCLK_FSYS0_MMC0_USER			0x0608
+#define CLK_STAT_MUX_SCLK_FSYS0_UFSUNIPRO_EMBEDDED_USER		0x060C
+#define CLK_STAT_MUX_SCLK_FSYS0_24M_USER			0x0610
+#define CLK_STAT_MUX_SCLK_FSYS0_UFSUNIPRO_EMBEDDED_CFG_USER	0x0614
+#define CLK_STAT_MUX_PHYCLK_USBDRD30_UDRD30_PHYCLOCK_USER	0x0618
+#define CLK_STAT_MUX_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK_USER	0x061C
+#define CLK_STAT_MUX_PHYCLK_UFS_TX0_SYMBOL_USER			0x0620
+#define CLK_STAT_MUX_PHYCLK_UFS_RX0_SYMBOL_USER			0x0624
+#define CLK_STAT_MUX_PHYCLK_USBHOST20_PHYCLOCK_USER		0x0628
+#define CLK_STAT_MUX_PHYCLK_USBHOST20_FREECLK_USER		0x062C
+#define CLK_STAT_MUX_PHYCLK_USBHOST20_CLK48MOHCI_USER		0x0630
+#define CLK_STAT_MUX_PHYCLK_USBHOST20PHY_REF_CLK		0x0634
+#define CLK_STAT_MUX_PHYCLK_UFS_RX_PWM_CLK_USER			0x0638
+#define CLK_STAT_MUX_PHYCLK_UFS_TX_PWM_CLK_USER			0x063C
+#define CLK_STAT_MUX_PHYCLK_UFS_REFCLK_OUT_SOC_USER		0x0640
+#define CG_CTRL_VAL_ACLK_FSYS0_200				0x0800
+#define CG_CTRL_VAL_PCLK_HPM_APBIF_FSYS0			0x0820
+#define CG_CTRL_VAL_SCLK_USBDRD30_SUSPEND_CLK			0x0840
+#define CG_CTRL_VAL_SCLK_MMC0					0x0844
+#define CG_CTRL_VAL_SCLK_UFSUNIPRO_EMBEDDED			0x0848
+#define CG_CTRL_VAL_SCLK_USBDRD30_REF_CLK			0x084C
+#define CG_CTRL_VAL_PHYCLK_USBDRD30_UDRD30_PHYCLOCK		0x0850
+#define CG_CTRL_VAL_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK		0x0854
+#define CG_CTRL_VAL_PHYCLK_UFS_TX0_SYMBOL			0x0858
+#define CG_CTRL_VAL_PHYCLK_UFS_RX0_SYMBOL			0x085C
+#define CG_CTRL_VAL_PHYCLK_USBHOST20_PHYCLOCK			0x0860
+#define CG_CTRL_VAL_SCLK_USBHOST20_REF_CLK			0x0864
+#define CG_CTRL_VAL_PHYCLK_USBHOST20_FREECLK			0x0864
+#define CG_CTRL_VAL_PHYCLK_USBHOST20_CLK48MOHCI			0x0868
+#define CG_CTRL_VAL_PHYCLK_UFS_RX_PWM_CLK			0x086C
+#define CG_CTRL_VAL_PHYCLK_UFS_TX_PWM_CLK			0x0870
+#define CG_CTRL_VAL_PHYCLK_UFS_REFCLK_OUT_SOC			0x0874
+#define CG_CTRL_VAL_SCLK_PROMISE_FSYS0				0x0878
+#define CG_CTRL_VAL_SCLK_USBHOST20PHY_REF_CLK			0x087C
+#define CG_CTRL_VAL_SCLK_UFSUNIPRO_EMBEDDED_CFG			0x0880
+#define CLKOUT_CMU_FSYS0					0x0C00
+#define CLKOUT_CMU_FSYS0_DIV_STAT				0x0C04
+#define FSYS0_SFR_IGNORE_REQ_SYSCLK				0x0D04
+#define CMU_FSYS0_SPARE0					0x0D08
+#define CMU_FSYS0_SPARE1					0x0D0C
+#define CG_CTRL_MAN_ACLK_FSYS0_200				0x1800
+#define CG_CTRL_MAN_PCLK_HPM_APBIF_FSYS0			0x1820
+#define CG_CTRL_MAN_SCLK_USBDRD30_SUSPEND_CLK			0x1840
+#define CG_CTRL_MAN_SCLK_MMC0					0x1844
+#define CG_CTRL_MAN_SCLK_UFSUNIPRO_EMBEDDED			0x1848
+#define CG_CTRL_MAN_SCLK_USBDRD30_REF_CLK			0x184C
+#define CG_CTRL_MAN_PHYCLK_USBDRD30_UDRD30_PHYCLOCK		0x1850
+#define CG_CTRL_MAN_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK		0x1854
+#define CG_CTRL_MAN_PHYCLK_UFS_TX0_SYMBOL			0x1858
+#define CG_CTRL_MAN_PHYCLK_UFS_RX0_SYMBOL			0x185C
+#define CG_CTRL_MAN_PHYCLK_USBHOST20_PHYCLOCK			0x1860
+#define CG_CTRL_MAN_PHYCLK_USBHOST20_FREECLK			0x1864
+#define CG_CTRL_MAN_PHYCLK_USBHOST20_CLK48MOHCI			0x1868
+#define CG_CTRL_MAN_PHYCLK_UFS_RX_PWM_CLK			0x186C
+#define CG_CTRL_MAN_PHYCLK_UFS_TX_PWM_CLK			0x1870
+#define CG_CTRL_MAN_PHYCLK_UFS_REFCLK_OUT_SOC			0x1874
+#define CG_CTRL_MAN_SCLK_USBHOST20_REF_CLK			0x1864
+#define CG_CTRL_MAN_SCLK_PROMISE_FSYS0				0x1878
+#define CG_CTRL_MAN_SCLK_USBHOST20PHY_REF_CLK			0x187C
+#define CG_CTRL_MAN_SCLK_UFSUNIPRO_EMBEDDED_CFG			0x1880
+#define CG_CTRL_STAT_ACLK_FSYS0_200_0				0x1C00
+#define CG_CTRL_STAT_ACLK_FSYS0_200_1				0x1C04
+#define CG_CTRL_STAT_ACLK_FSYS0_200_2				0x1C08
+#define CG_CTRL_STAT_ACLK_FSYS0_200_3				0x1C0C
+#define CG_CTRL_STAT_ACLK_FSYS0_200_4				0x1C10
+#define CG_CTRL_STAT_PCLK_HPM_APBIF_FSYS0			0x1C20
+#define CG_CTRL_STAT_SCLK_USBDRD30_SUSPEND_CLK			0x1C40
+#define CG_CTRL_STAT_SCLK_MMC0					0x1C44
+#define CG_CTRL_STAT_SCLK_UFSUNIPRO_EMBEDDED			0x1C48
+#define CG_CTRL_STAT_SCLK_USBDRD30_REF_CLK			0x1C4C
+#define CG_CTRL_STAT_PHYCLK_USBDRD30_UDRD30_PHYCLOCK		0x1C50
+#define CG_CTRL_STAT_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK		0x1C54
+#define CG_CTRL_STAT_PHYCLK_UFS_TX0_SYMBOL			0x1C58
+#define CG_CTRL_STAT_PHYCLK_UFS_RX0_SYMBOL			0x1C5C
+#define CG_CTRL_STAT_PHYCLK_USBHOST20_PHYCLOCK			0x1C60
+#define CG_CTRL_STAT_PHYCLK_USBHOST20_FREECLK			0x1C64
+#define CG_CTRL_STAT_PHYCLK_USBHOST20_CLK48MOHCI		0x1C68
+#define CG_CTRL_STAT_PHYCLK_UFS_RX_PWM_CLK			0x1C6C
+#define CG_CTRL_STAT_PHYCLK_UFS_TX_PWM_CLK			0x1C70
+#define CG_CTRL_STAT_PHYCLK_UFS_REFCLK_OUT_SOC			0x1C74
+#define CG_CTRL_STAT_SCLK_PROMISE_FSYS0				0x1C78
+#define CG_CTRL_STAT_SCLK_USBHOST20PHY_REF_CLK			0x1C7C
+#define CG_CTRL_STAT_SCLK_UFSUNIPRO_EMBEDDED_CFG		0x1C80
+#define QCH_CTRL_AXI_LH_ASYNC_MI_TOP_FSYS0			0x2000
+#define QCH_CTRL_AXI_LH_ASYNC_MI_ETR_USB_FSYS0			0x2004
+#define QCH_CTRL_ETR_USB_FSYS0_ACLK				0x2008
+#define QCH_CTRL_ETR_USB_FSYS0_PCLK				0x200C
+#define QCH_CTRL_CMU_FSYS0					0x2010
+#define QCH_CTRL_PMU_FSYS0					0x2014
+#define QCH_CTRL_SYSREG_FSYS0					0x2018
+#define QCH_CTRL_USBDRD30					0x201C
+#define QCH_CTRL_MMC0						0x2020
+#define QCH_CTRL_UFS_LINK_EMBEDDED				0x2024
+#define QCH_CTRL_USBHOST20					0x2028
+#define QCH_CTRL_PDMA0						0x202C
+#define QCH_CTRL_PDMAS						0x2034
+#define QCH_CTRL_PPMU_FSYS0					0x2038
+#define QCH_CTRL_ACEL_LH_ASYNC_SI_TOP_FSYS0			0x203C
+#define QCH_CTRL_USBDRD30_PHYCTRL				0x2040
+#define QCH_CTRL_USBHOST20_PHYCTRL				0x2044
+#define QSTATE_CTRL_USBDRD30					0x2400
+#define QSTATE_CTRL_UFS_LINK_EMBEDDED				0x2404
+#define QSTATE_CTRL_USBHOST20					0x2408
+#define QSTATE_CTRL_USBHOST20_PHY				0x240C
+#define QSTATE_CTRL_GPIO_FSYS0					0x2410
+#define QSTATE_CTRL_HPM_APBIF_FSYS0				0x2414
+#define QSTATE_CTRL_PROMISE_FSYS0				0x2418
+
+static const unsigned long fsys0_clk_regs[] __initconst = {
+	CLK_CON_MUX_ACLK_FSYS0_200_USER,
+	CLK_CON_MUX_SCLK_FSYS0_USBDRD30_USER,
+	CLK_CON_MUX_SCLK_FSYS0_MMC0_USER,
+	CLK_CON_MUX_SCLK_FSYS0_UFSUNIPRO_EMBEDDED_USER,
+	CLK_CON_MUX_SCLK_FSYS0_24M_USER,
+	CLK_CON_MUX_SCLK_FSYS0_UFSUNIPRO_EMBEDDED_CFG_USER,
+	CLK_CON_MUX_PHYCLK_USBDRD30_UDRD30_PHYCLOCK_USER,
+	CLK_CON_MUX_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK_USER,
+	CLK_CON_MUX_PHYCLK_UFS_TX0_SYMBOL_USER,
+	CLK_CON_MUX_PHYCLK_UFS_RX0_SYMBOL_USER,
+	CLK_CON_MUX_PHYCLK_USBHOST20_PHYCLOCK_USER,
+	CLK_CON_MUX_PHYCLK_USBHOST20_FREECLK_USER,
+	CLK_CON_MUX_PHYCLK_USBHOST20_CLK48MOHCI_USER,
+	CLK_CON_MUX_PHYCLK_USBHOST20PHY_REF_CLK,
+	CLK_CON_MUX_PHYCLK_UFS_RX_PWM_CLK_USER,
+	CLK_CON_MUX_PHYCLK_UFS_TX_PWM_CLK_USER,
+	CLK_CON_MUX_PHYCLK_UFS_REFCLK_OUT_SOC_USER,
+	CLK_STAT_MUX_ACLK_FSYS0_200_USER,
+	CLK_STAT_MUX_SCLK_FSYS0_USBDRD30_USER,
+	CLK_STAT_MUX_SCLK_FSYS0_MMC0_USER,
+	CLK_STAT_MUX_SCLK_FSYS0_UFSUNIPRO_EMBEDDED_USER,
+	CLK_STAT_MUX_SCLK_FSYS0_24M_USER,
+	CLK_STAT_MUX_SCLK_FSYS0_UFSUNIPRO_EMBEDDED_CFG_USER,
+	CLK_STAT_MUX_PHYCLK_USBDRD30_UDRD30_PHYCLOCK_USER,
+	CLK_STAT_MUX_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK_USER,
+	CLK_STAT_MUX_PHYCLK_UFS_TX0_SYMBOL_USER,
+	CLK_STAT_MUX_PHYCLK_UFS_RX0_SYMBOL_USER,
+	CLK_STAT_MUX_PHYCLK_USBHOST20_PHYCLOCK_USER,
+	CLK_STAT_MUX_PHYCLK_USBHOST20_FREECLK_USER,
+	CLK_STAT_MUX_PHYCLK_USBHOST20_CLK48MOHCI_USER,
+	CLK_STAT_MUX_PHYCLK_USBHOST20PHY_REF_CLK,
+	CLK_STAT_MUX_PHYCLK_UFS_RX_PWM_CLK_USER,
+	CLK_STAT_MUX_PHYCLK_UFS_TX_PWM_CLK_USER,
+	CLK_STAT_MUX_PHYCLK_UFS_REFCLK_OUT_SOC_USER,
+	CG_CTRL_VAL_ACLK_FSYS0_200,
+	CG_CTRL_VAL_PCLK_HPM_APBIF_FSYS0,
+	CG_CTRL_VAL_SCLK_USBDRD30_SUSPEND_CLK,
+	CG_CTRL_VAL_SCLK_MMC0,
+	CG_CTRL_VAL_SCLK_UFSUNIPRO_EMBEDDED,
+	CG_CTRL_VAL_SCLK_USBDRD30_REF_CLK,
+	CG_CTRL_VAL_PHYCLK_USBDRD30_UDRD30_PHYCLOCK,
+	CG_CTRL_VAL_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK,
+	CG_CTRL_VAL_PHYCLK_UFS_TX0_SYMBOL,
+	CG_CTRL_VAL_PHYCLK_UFS_RX0_SYMBOL,
+	CG_CTRL_VAL_PHYCLK_USBHOST20_PHYCLOCK,
+	CG_CTRL_VAL_SCLK_USBHOST20_REF_CLK,
+	CG_CTRL_VAL_PHYCLK_USBHOST20_FREECLK,
+	CG_CTRL_VAL_PHYCLK_USBHOST20_CLK48MOHCI,
+	CG_CTRL_VAL_PHYCLK_UFS_RX_PWM_CLK,
+	CG_CTRL_VAL_PHYCLK_UFS_TX_PWM_CLK,
+	CG_CTRL_VAL_PHYCLK_UFS_REFCLK_OUT_SOC,
+	CG_CTRL_VAL_SCLK_PROMISE_FSYS0,
+	CG_CTRL_VAL_SCLK_USBHOST20PHY_REF_CLK,
+	CG_CTRL_VAL_SCLK_UFSUNIPRO_EMBEDDED_CFG,
+	CLKOUT_CMU_FSYS0,
+	CLKOUT_CMU_FSYS0_DIV_STAT,
+	FSYS0_SFR_IGNORE_REQ_SYSCLK,
+	CMU_FSYS0_SPARE0,
+	CMU_FSYS0_SPARE1,
+	CG_CTRL_MAN_ACLK_FSYS0_200,
+	CG_CTRL_MAN_PCLK_HPM_APBIF_FSYS0,
+	CG_CTRL_MAN_SCLK_USBDRD30_SUSPEND_CLK,
+	CG_CTRL_MAN_SCLK_MMC0,
+	CG_CTRL_MAN_SCLK_UFSUNIPRO_EMBEDDED,
+	CG_CTRL_MAN_SCLK_USBDRD30_REF_CLK,
+	CG_CTRL_MAN_PHYCLK_USBDRD30_UDRD30_PHYCLOCK,
+	CG_CTRL_MAN_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK,
+	CG_CTRL_MAN_PHYCLK_UFS_TX0_SYMBOL,
+	CG_CTRL_MAN_PHYCLK_UFS_RX0_SYMBOL,
+	CG_CTRL_MAN_PHYCLK_USBHOST20_PHYCLOCK,
+	CG_CTRL_MAN_PHYCLK_USBHOST20_FREECLK,
+	CG_CTRL_MAN_PHYCLK_USBHOST20_CLK48MOHCI,
+	CG_CTRL_MAN_PHYCLK_UFS_RX_PWM_CLK,
+	CG_CTRL_MAN_PHYCLK_UFS_TX_PWM_CLK,
+	CG_CTRL_MAN_PHYCLK_UFS_REFCLK_OUT_SOC,
+	CG_CTRL_MAN_SCLK_USBHOST20_REF_CLK,
+	CG_CTRL_MAN_SCLK_PROMISE_FSYS0,
+	CG_CTRL_MAN_SCLK_USBHOST20PHY_REF_CLK,
+	CG_CTRL_MAN_SCLK_UFSUNIPRO_EMBEDDED_CFG,
+	CG_CTRL_STAT_ACLK_FSYS0_200_0,
+	CG_CTRL_STAT_ACLK_FSYS0_200_1,
+	CG_CTRL_STAT_ACLK_FSYS0_200_2,
+	CG_CTRL_STAT_ACLK_FSYS0_200_3,
+	CG_CTRL_STAT_ACLK_FSYS0_200_4,
+	CG_CTRL_STAT_PCLK_HPM_APBIF_FSYS0,
+	CG_CTRL_STAT_SCLK_USBDRD30_SUSPEND_CLK,
+	CG_CTRL_STAT_SCLK_MMC0,
+	CG_CTRL_STAT_SCLK_UFSUNIPRO_EMBEDDED,
+	CG_CTRL_STAT_SCLK_USBDRD30_REF_CLK,
+	CG_CTRL_STAT_PHYCLK_USBDRD30_UDRD30_PHYCLOCK,
+	CG_CTRL_STAT_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK,
+	CG_CTRL_STAT_PHYCLK_UFS_TX0_SYMBOL,
+	CG_CTRL_STAT_PHYCLK_UFS_RX0_SYMBOL,
+	CG_CTRL_STAT_PHYCLK_USBHOST20_PHYCLOCK,
+	CG_CTRL_STAT_PHYCLK_USBHOST20_FREECLK,
+	CG_CTRL_STAT_PHYCLK_USBHOST20_CLK48MOHCI,
+	CG_CTRL_STAT_PHYCLK_UFS_RX_PWM_CLK,
+	CG_CTRL_STAT_PHYCLK_UFS_TX_PWM_CLK,
+	CG_CTRL_STAT_PHYCLK_UFS_REFCLK_OUT_SOC,
+	CG_CTRL_STAT_SCLK_PROMISE_FSYS0,
+	CG_CTRL_STAT_SCLK_USBHOST20PHY_REF_CLK,
+	CG_CTRL_STAT_SCLK_UFSUNIPRO_EMBEDDED_CFG,
+	QCH_CTRL_AXI_LH_ASYNC_MI_TOP_FSYS0,
+	QCH_CTRL_AXI_LH_ASYNC_MI_ETR_USB_FSYS0,
+	QCH_CTRL_ETR_USB_FSYS0_ACLK,
+	QCH_CTRL_ETR_USB_FSYS0_PCLK,
+	QCH_CTRL_CMU_FSYS0,
+	QCH_CTRL_PMU_FSYS0,
+	QCH_CTRL_SYSREG_FSYS0,
+	QCH_CTRL_USBDRD30,
+	QCH_CTRL_MMC0,
+	QCH_CTRL_UFS_LINK_EMBEDDED,
+	QCH_CTRL_USBHOST20,
+	QCH_CTRL_PDMA0,
+	QCH_CTRL_PDMAS,
+	QCH_CTRL_PPMU_FSYS0,
+	QCH_CTRL_ACEL_LH_ASYNC_SI_TOP_FSYS0,
+	QCH_CTRL_USBDRD30_PHYCTRL,
+	QCH_CTRL_USBHOST20_PHYCTRL,
+	QSTATE_CTRL_USBDRD30,
+	QSTATE_CTRL_UFS_LINK_EMBEDDED,
+	QSTATE_CTRL_USBHOST20,
+	QSTATE_CTRL_USBHOST20_PHY,
+	QSTATE_CTRL_GPIO_FSYS0,
+	QSTATE_CTRL_HPM_APBIF_FSYS0,
+	QSTATE_CTRL_PROMISE_FSYS0,
+};
+
+PNAME(fsys0_mux_aclk_fsys0_200_user_p)				= { "oscclk",
+								    "gout_top_aclk_fsys0_200" };
+PNAME(fsys0_mux_sclk_fsys0_usbdrd30_user_p)			= {
+	"oscclk",
+	"gout_top_sclk_fsys0_usbdrd30" };
+PNAME(fsys0_mux_sclk_fsys0_mmc0_user_p)				= { "oscclk",
+								    "gout_top_sclk_fsys0_mmc0" };
+PNAME(fsys0_mux_sclk_fsys0_ufsunipro_embedded_user_p)		= {
+	"oscclk",
+	"gout_top_sclk_fsys0_ufsunipro20" };
+PNAME(fsys0_mux_sclk_fsys0_24m_user_p)				= {
+	"oscclk",
+	"gout_top_sclk_fsys0_phy_24m" };
+PNAME(fsys0_mux_sclk_fsys0_ufsunipro_embedded_cfg_user_p)	= {
+	"oscclk",
+	"gout_top_sclk_fsys0_ufsunipro_cfg" };
+PNAME(fsys0_mux_phyclk_usbdrd30_udrd30_phyclock_user_p)		= {
+	"oscclk",
+	"phyclk_usbdrd30_udrd30_phyclock_phy" };
+PNAME(fsys0_mux_phyclk_usbdrd30_udrd30_pipe_pclk_user_p)	= {
+	"oscclk",
+	"phyclk_usbdrd30_udrd30_pipe_pclk_phy" };
+PNAME(fsys0_mux_phyclk_ufs_tx0_symbol_user_p)			= { "oscclk",
+								    "phyclk_ufs_tx0_symbol_phy" };
+PNAME(fsys0_mux_phyclk_ufs_rx0_symbol_user_p)			= { "oscclk",
+								    "phyclk_ufs_rx0_symbol_phy" };
+PNAME(fsys0_mux_phyclk_usbhost20_phyclock_user_p)		= {
+	"oscclk",
+	"phyclk_usbhost20_phyclock_phy" };
+PNAME(fsys0_mux_phyclk_usbhost20phy_ref_clk_p)			= {
+	"mout_fsys0_sclk_fsys0_24m_user",
+	"phyclk_usb30_12mohci" };
+
+static const struct samsung_fixed_rate_clock fsys0_fixed_clks[] __initconst = {
+	FRATE(CLK_PHYCLK_USB30_12MOHCI, "phyclk_usb30_12mohci", NULL, 0,
+	      30000000),
+	FRATE(CLK_PHYCLK_USBDRD30_UDRD30_PHYCLOCK_PHY,
+	      "phyclk_usbdrd30_udrd30_phyclock_phy", NULL, 0, 60000000),
+	FRATE(CLK_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK_PHY,
+	      "phyclk_usbdrd30_udrd30_pipe_pclk_phy", NULL, 0, 125000000),
+	FRATE(CLK_PHYCLK_UFS_TX0_SYMBOL_PHY, "phyclk_ufs_tx0_symbol_phy", NULL,
+	      0, 300000000),
+	FRATE(CLK_PHYCLK_UFS_RX0_SYMBOL_PHY, "phyclk_ufs_rx0_symbol_phy", NULL,
+	      0, 300000000),
+	FRATE(CLK_PHYCLK_USBHOST20_PHYCLOCK_PHY,
+	      "phyclk_usbhost20_phyclock_phy", NULL, 0, 30000000),
+};
+
+static const struct samsung_mux_clock fsys0_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_FSYS0_ACLK_FSYS0_200_USER,
+	    "mout_fsys0_aclk_fsys0_200_user", fsys0_mux_aclk_fsys0_200_user_p,
+	    CLK_CON_MUX_ACLK_FSYS0_200_USER, 12, 1),
+	MUX(CLK_MOUT_FSYS0_SCLK_FSYS0_USBDRD30_USER,
+	    "mout_fsys0_sclk_fsys0_usbdrd30_user",
+	    fsys0_mux_sclk_fsys0_usbdrd30_user_p,
+	    CLK_CON_MUX_SCLK_FSYS0_USBDRD30_USER, 12, 1),
+	MUX(CLK_MOUT_FSYS0_SCLK_FSYS0_MMC0_USER,
+	    "mout_fsys0_sclk_fsys0_mmc0_user", fsys0_mux_sclk_fsys0_mmc0_user_p,
+	    CLK_CON_MUX_SCLK_FSYS0_MMC0_USER, 12, 1),
+	MUX(CLK_MOUT_FSYS0_SCLK_FSYS0_UFSUNIPRO_EMBEDDED_USER,
+	    "mout_fsys0_sclk_fsys0_ufsunipro_embedded_user",
+	    fsys0_mux_sclk_fsys0_ufsunipro_embedded_user_p,
+	    CLK_CON_MUX_SCLK_FSYS0_UFSUNIPRO_EMBEDDED_USER, 12, 1),
+	MUX(CLK_MOUT_FSYS0_SCLK_FSYS0_24M_USER,
+	    "mout_fsys0_sclk_fsys0_24m_user", fsys0_mux_sclk_fsys0_24m_user_p,
+	    CLK_CON_MUX_SCLK_FSYS0_24M_USER, 12, 1),
+	MUX(CLK_MOUT_FSYS0_SCLK_FSYS0_UFSUNIPRO_EMBEDDED_CFG_USER,
+	    "mout_fsys0_sclk_fsys0_ufsunipro_embedded_cfg_user",
+	    fsys0_mux_sclk_fsys0_ufsunipro_embedded_cfg_user_p,
+	    CLK_CON_MUX_SCLK_FSYS0_UFSUNIPRO_EMBEDDED_CFG_USER, 12, 1),
+	MUX(CLK_MOUT_FSYS0_PHYCLK_USBDRD30_UDRD30_PHYCLOCK_USER,
+	    "mout_fsys0_phyclk_usbdrd30_udrd30_phyclock_user",
+	    fsys0_mux_phyclk_usbdrd30_udrd30_phyclock_user_p,
+	    CLK_CON_MUX_PHYCLK_USBDRD30_UDRD30_PHYCLOCK_USER, 12, 1),
+	MUX(CLK_MOUT_FSYS0_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK_USER,
+	    "mout_fsys0_phyclk_usbdrd30_udrd30_pipe_pclk_user",
+	    fsys0_mux_phyclk_usbdrd30_udrd30_pipe_pclk_user_p,
+	    CLK_CON_MUX_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK_USER, 12, 1),
+	MUX(CLK_MOUT_FSYS0_PHYCLK_UFS_TX0_SYMBOL_USER,
+	    "mout_fsys0_phyclk_ufs_tx0_symbol_user",
+	    fsys0_mux_phyclk_ufs_tx0_symbol_user_p,
+	    CLK_CON_MUX_PHYCLK_UFS_TX0_SYMBOL_USER, 12, 1),
+	MUX(CLK_MOUT_FSYS0_PHYCLK_UFS_RX0_SYMBOL_USER,
+	    "mout_fsys0_phyclk_ufs_rx0_symbol_user",
+	    fsys0_mux_phyclk_ufs_rx0_symbol_user_p,
+	    CLK_CON_MUX_PHYCLK_UFS_RX0_SYMBOL_USER, 12, 1),
+	MUX(CLK_MOUT_FSYS0_PHYCLK_USBHOST20_PHYCLOCK_USER,
+	    "mout_fsys0_phyclk_usbhost20_phyclock_user",
+	    fsys0_mux_phyclk_usbhost20_phyclock_user_p,
+	    CLK_CON_MUX_PHYCLK_USBHOST20_PHYCLOCK_USER, 12, 1),
+	MUX(CLK_MOUT_FSYS0_PHYCLK_USBHOST20PHY_REF_CLK,
+	    "mout_fsys0_phyclk_usbhost20phy_ref_clk",
+	    fsys0_mux_phyclk_usbhost20phy_ref_clk_p,
+	    CLK_CON_MUX_PHYCLK_USBHOST20PHY_REF_CLK, 12, 1),
+};
+
+static const struct samsung_gate_clock fsys0_gate_clks[] __initconst = {
+	GATE(CLK_GOUT_FSYS0_ACLK_AXI2ACEL_FSYS0X,
+	     "gout_fsys0_aclk_axi2acel_fsys0x",
+	     "mout_fsys0_aclk_fsys0_200_user", CG_CTRL_VAL_ACLK_FSYS0_200, 31,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_FSYS0_PCLK_CMU_FSYS0, "gout_fsys0_pclk_cmu_fsys0",
+	     "mout_fsys0_aclk_fsys0_200_user", CG_CTRL_VAL_ACLK_FSYS0_200, 30,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_FSYS0_PCLK_GPIO_FSYS0, "gout_fsys0_pclk_gpio_fsys0",
+	     "mout_fsys0_aclk_fsys0_200_user", CG_CTRL_VAL_ACLK_FSYS0_200, 29,
+	     0, 0),
+	GATE(CLK_GOUT_FSYS0_PCLK_SYSREG_FSYS0, "gout_fsys0_pclk_sysreg_fsys0",
+	     "mout_fsys0_aclk_fsys0_200_user", CG_CTRL_VAL_ACLK_FSYS0_200, 28,
+	     0, 0),
+	GATE(CLK_GOUT_FSYS0_PCLK_PPMU_FSYS0, "gout_fsys0_pclk_ppmu_fsys0",
+	     "mout_fsys0_aclk_fsys0_200_user", CG_CTRL_VAL_ACLK_FSYS0_200, 27,
+	     0, 0),
+	GATE(CLK_GOUT_FSYS0_PCLK_PMU_FSYS0, "gout_fsys0_pclk_pmu_fsys0",
+	     "mout_fsys0_aclk_fsys0_200_user", CG_CTRL_VAL_ACLK_FSYS0_200, 26,
+	     0, 0),
+	GATE(CLK_GOUT_FSYS0_PCLK_ETR_USB_FSYS0, "gout_fsys0_pclk_etr_usb_fsys0",
+	     "mout_fsys0_aclk_fsys0_200_user", CG_CTRL_VAL_ACLK_FSYS0_200, 25,
+	     0, 0),
+	GATE(CLK_GOUT_FSYS0_HCLK_USBHOST20, "gout_fsys0_hclk_usbhost20",
+	     "mout_fsys0_aclk_fsys0_200_user", CG_CTRL_VAL_ACLK_FSYS0_200, 24,
+	     0, 0),
+	GATE(CLK_GOUT_FSYS0_ACLK_AXI_US_USBHS_FSYS0X,
+	     "gout_fsys0_aclk_axi_us_usbhs_fsys0x",
+	     "mout_fsys0_aclk_fsys0_200_user", CG_CTRL_VAL_ACLK_FSYS0_200, 21,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_FSYS0_ACLK_ETR_USB_FSYS0, "gout_fsys0_aclk_etr_usb_fsys0",
+	     "mout_fsys0_aclk_fsys0_200_user", CG_CTRL_VAL_ACLK_FSYS0_200, 20,
+	     0, 0),
+	GATE(CLK_GOUT_FSYS0_ACLK_UFS_LINK_EMBEDDED,
+	     "gout_fsys0_aclk_ufs_link_embedded",
+	     "mout_fsys0_aclk_fsys0_200_user", CG_CTRL_VAL_ACLK_FSYS0_200, 19,
+	     0, 0),
+	GATE(CLK_GOUT_FSYS0_ACLK_USBDRD30, "gout_fsys0_aclk_usbdrd30",
+	     "mout_fsys0_aclk_fsys0_200_user", CG_CTRL_VAL_ACLK_FSYS0_200, 18,
+	     0, 0),
+	GATE(CLK_GOUT_FSYS0_ACLK_MMC0, "gout_fsys0_aclk_mmc0",
+	     "mout_fsys0_aclk_fsys0_200_user", CG_CTRL_VAL_ACLK_FSYS0_200, 17,
+	     0, 0),
+	GATE(CLK_GOUT_FSYS0_ACLK_PDMAS, "gout_fsys0_aclk_pdmas",
+	     "mout_fsys0_aclk_fsys0_200_user", CG_CTRL_VAL_ACLK_FSYS0_200, 16,
+	     0, 0),
+	GATE(CLK_GOUT_FSYS0_ACLK_PDMA0, "gout_fsys0_aclk_pdma0",
+	     "mout_fsys0_aclk_fsys0_200_user", CG_CTRL_VAL_ACLK_FSYS0_200, 15,
+	     0, 0),
+	GATE(CLK_GOUT_FSYS0_ACLK_PPMU_FSYS0, "gout_fsys0_aclk_ppmu_fsys0",
+	     "mout_fsys0_aclk_fsys0_200_user", CG_CTRL_VAL_ACLK_FSYS0_200, 14,
+	     0, 0),
+	GATE(CLK_GOUT_FSYS0_ACLK_XIU_FSYS0SFRX, "gout_fsys0_aclk_xiu_fsys0sfrx",
+	     "mout_fsys0_aclk_fsys0_200_user", CG_CTRL_VAL_ACLK_FSYS0_200, 13,
+	     0, 0),
+	GATE(CLK_GOUT_FSYS0_ACLK_AXI_US_USBDRD30X_FSYS0X,
+	     "gout_fsys0_aclk_axi_us_usbdrd30x_fsys0x",
+	     "mout_fsys0_aclk_fsys0_200_user", CG_CTRL_VAL_ACLK_FSYS0_200, 12,
+	     0, 0),
+	GATE(CLK_GOUT_FSYS0_ACLK_AXI_US_PDMAX_FSYS0X,
+	     "gout_fsys0_aclk_axi_us_pdmax_fsys0x",
+	     "mout_fsys0_aclk_fsys0_200_user", CG_CTRL_VAL_ACLK_FSYS0_200, 11,
+	     0, 0),
+	GATE(CLK_GOUT_FSYS0_ACLK_AXI2AHB_FSYS0H,
+	     "gout_fsys0_aclk_axi2ahb_fsys0h", "mout_fsys0_aclk_fsys0_200_user",
+	     CG_CTRL_VAL_ACLK_FSYS0_200, 10, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_FSYS0_ACLK_AXI2AHB_USBDRD30H,
+	     "gout_fsys0_aclk_axi2ahb_usbdrd30h",
+	     "mout_fsys0_aclk_fsys0_200_user", CG_CTRL_VAL_ACLK_FSYS0_200, 9,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_FSYS0_ACLK_AXI_LH_ASYNC_MI_ETR_USB_FSYS0,
+	     "gout_fsys0_aclk_axi_lh_async_mi_etr_usb_fsys0",
+	     "mout_fsys0_aclk_fsys0_200_user", CG_CTRL_VAL_ACLK_FSYS0_200, 8, 0,
+	     0),
+	GATE(CLK_GOUT_FSYS0_ACLK_XIU_PDMAX, "gout_fsys0_aclk_xiu_pdmax",
+	     "mout_fsys0_aclk_fsys0_200_user", CG_CTRL_VAL_ACLK_FSYS0_200, 7, 0,
+	     0),
+	GATE(CLK_GOUT_FSYS0_ACLK_XIU_USBX, "gout_fsys0_aclk_xiu_usbx",
+	     "mout_fsys0_aclk_fsys0_200_user", CG_CTRL_VAL_ACLK_FSYS0_200, 6, 0,
+	     0),
+	GATE(CLK_GOUT_FSYS0_ACLK_XIU_EMBEDDEDX, "gout_fsys0_aclk_xiu_embeddedx",
+	     "mout_fsys0_aclk_fsys0_200_user", CG_CTRL_VAL_ACLK_FSYS0_200, 5, 0,
+	     0),
+	GATE(CLK_GOUT_FSYS0_ACLK_XIU_FSYS0X, "gout_fsys0_aclk_xiu_fsys0x",
+	     "mout_fsys0_aclk_fsys0_200_user", CG_CTRL_VAL_ACLK_FSYS0_200, 4, 0,
+	     0),
+	GATE(CLK_GOUT_FSYS0_ACLK_AXI2APB_FSYS0P,
+	     "gout_fsys0_aclk_axi2apb_fsys0p", "mout_fsys0_aclk_fsys0_200_user",
+	     CG_CTRL_VAL_ACLK_FSYS0_200, 3, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_FSYS0_ACLK_AHB_BRIDGE_FSYS0H,
+	     "gout_fsys0_aclk_ahb_bridge_fsys0h",
+	     "mout_fsys0_aclk_fsys0_200_user", CG_CTRL_VAL_ACLK_FSYS0_200, 2,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_FSYS0_ACLK_AXI_LH_ASYNC_MI_TOP_FSYS0,
+	     "gout_fsys0_aclk_axi_lh_async_mi_top_fsys0",
+	     "mout_fsys0_aclk_fsys0_200_user", CG_CTRL_VAL_ACLK_FSYS0_200, 1,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_FSYS0_ACLK_ACEL_LH_ASYNC_SI_TOP_FSYS0,
+	     "gout_fsys0_aclk_acel_lh_async_si_top_fsys0",
+	     "mout_fsys0_aclk_fsys0_200_user", CG_CTRL_VAL_ACLK_FSYS0_200, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_FSYS0_PCLK_HPM_APBIF_FSYS0,
+	     "gout_fsys0_pclk_hpm_apbif_fsys0",
+	     "mout_fsys0_aclk_fsys0_200_user", CG_CTRL_VAL_PCLK_HPM_APBIF_FSYS0,
+	     0, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_FSYS0_SCLK_USBDRD30_SUSPEND_CLK,
+	     "gout_fsys0_sclk_usbdrd30_suspend_clk",
+	     "mout_fsys0_sclk_fsys0_usbdrd30_user",
+	     CG_CTRL_VAL_SCLK_USBDRD30_SUSPEND_CLK, 0, 0, 0),
+	GATE(CLK_GOUT_FSYS0_SCLK_MMC0, "gout_fsys0_sclk_mmc0",
+	     "mout_fsys0_sclk_fsys0_mmc0_user", CG_CTRL_VAL_SCLK_MMC0, 0,
+	     CLK_SET_RATE_PARENT, 0),
+	GATE(CLK_GOUT_FSYS0_SCLK_UFSUNIPRO_EMBEDDED,
+	     "gout_fsys0_sclk_ufsunipro_embedded",
+	     "mout_fsys0_sclk_fsys0_ufsunipro_embedded_user",
+	     CG_CTRL_VAL_SCLK_UFSUNIPRO_EMBEDDED, 0, 0, 0),
+	GATE(CLK_GOUT_FSYS0_SCLK_USBDRD30_REF_CLK,
+	     "gout_fsys0_sclk_usbdrd30_ref_clk",
+	     "mout_fsys0_sclk_fsys0_usbdrd30_user",
+	     CG_CTRL_VAL_SCLK_USBDRD30_REF_CLK, 0, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PHYCLK_USBDRD30_UDRD30_PHYCLOCK,
+	     "gout_fsys0_phyclk_usbdrd30_udrd30_phyclock",
+	     "mout_fsys0_phyclk_usbdrd30_udrd30_phyclock_user",
+	     CG_CTRL_VAL_PHYCLK_USBDRD30_UDRD30_PHYCLOCK, 0, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK,
+	     "gout_fsys0_phyclk_usbdrd30_udrd30_pipe_pclk",
+	     "mout_fsys0_phyclk_usbdrd30_udrd30_pipe_pclk_user",
+	     CG_CTRL_VAL_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK, 0, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PHYCLK_UFS_TX0_SYMBOL,
+	     "gout_fsys0_phyclk_ufs_tx0_symbol",
+	     "mout_fsys0_phyclk_ufs_tx0_symbol_user",
+	     CG_CTRL_VAL_PHYCLK_UFS_TX0_SYMBOL, 0, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PHYCLK_UFS_RX0_SYMBOL,
+	     "gout_fsys0_phyclk_ufs_rx0_symbol",
+	     "mout_fsys0_phyclk_ufs_rx0_symbol_user",
+	     CG_CTRL_VAL_PHYCLK_UFS_RX0_SYMBOL, 0, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PHYCLK_USBHOST20_PHYCLOCK,
+	     "gout_fsys0_phyclk_usbhost20_phyclock",
+	     "mout_fsys0_phyclk_usbhost20_phyclock_user",
+	     CG_CTRL_VAL_PHYCLK_USBHOST20_PHYCLOCK, 0, 0, 0),
+	GATE(CLK_GOUT_FSYS0_SCLK_PROMISE_FSYS0, "gout_fsys0_sclk_promise_fsys0",
+	     "gout_top_sclk_promise_int", CG_CTRL_VAL_SCLK_PROMISE_FSYS0, 0, 0,
+	     0),
+	GATE(CLK_GOUT_FSYS0_SCLK_USBHOST20PHY_REF_CLK,
+	     "gout_fsys0_sclk_usbhost20phy_ref_clk",
+	     "mout_fsys0_phyclk_usbhost20phy_ref_clk",
+	     CG_CTRL_VAL_SCLK_USBHOST20PHY_REF_CLK, 0, 0, 0),
+	GATE(CLK_GOUT_FSYS0_SCLK_UFSUNIPRO_EMBEDDED_CFG,
+	     "gout_fsys0_sclk_ufsunipro_embedded_cfg",
+	     "mout_fsys0_sclk_fsys0_ufsunipro_embedded_cfg_user",
+	     CG_CTRL_VAL_SCLK_UFSUNIPRO_EMBEDDED_CFG, 0, 0, 0),
+	GATE(CLK_GOUT_FSYS0_SCLK_USBHOST20_REF_CLK,
+	     "gout_fsys0_sclk_usbhost20_ref_clk",
+	     "mout_fsys0_sclk_fsys0_usbdrd30_user",
+	     CG_CTRL_VAL_SCLK_USBHOST20_REF_CLK, 0, 0, 0),
+};
+
+static const struct samsung_cmu_info fsys0_cmu_info __initconst = {
+	.mux_clks		= fsys0_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(fsys0_mux_clks),
+	.gate_clks		= fsys0_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(fsys0_gate_clks),
+	.fixed_clks		= fsys0_fixed_clks,
+	.nr_fixed_clks		= ARRAY_SIZE(fsys0_fixed_clks),
+	.nr_clk_ids		= FSYS0_NR_CLK,
+	.clk_regs		= fsys0_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(fsys0_clk_regs),
+};
+
+/* ---- CMU_FSYS1 ---------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_FSYS1 (0x156E0000) */
+#define PCIE_PLL_LOCK						0x0000
+#define PCIE_PLL_CON0						0x0100
+#define PCIE_PLL_CON1						0x0104
+#define CLK_CON_MUX_ACLK_FSYS1_200_USER				0x0200
+#define CLK_CON_MUX_SCLK_FSYS1_MMC2_USER			0x0204
+#define CLK_CON_MUX_SCLK_FSYS1_UFSUNIPRO_SDCARD_USER		0x020C
+#define CLK_CON_MUX_SCLK_FSYS1_UFSUNIPRO_SDCARD_CFG_USER	0x0210
+#define CLK_CON_MUX_SCLK_FSYS1_PCIE_PHY_USER			0x0214
+#define CLK_CON_MUX_PCIE_PLL					0x0218
+#define CLK_CON_MUX_PHYCLK_UFS_LINK_SDCARD_TX0_SYMBOL_USER	0x0220
+#define CLK_CON_MUX_PHYCLK_UFS_LINK_SDCARD_RX0_SYMBOL_USER	0x0224
+#define CLK_CON_MUX_PHYCLK_PCIE_WIFI0_TX0_USER			0x0230
+#define CLK_CON_MUX_PHYCLK_PCIE_WIFI0_RX0_USER			0x0234
+#define CLK_CON_MUX_PHYCLK_PCIE_WIFI1_TX0_USER			0x0238
+#define CLK_CON_MUX_PHYCLK_PCIE_WIFI1_RX0_USER			0x023C
+#define CLK_CON_MUX_PHYCLK_PCIE_WIFI0_DIG_REFCLK_USER		0x0240
+#define CLK_CON_MUX_PHYCLK_PCIE_WIFI1_DIG_REFCLK_USER		0x0244
+#define CLK_CON_MUX_PHYCLK_UFS_LINK_SDCARD_RX_PWM_CLK_USER	0x0248
+#define CLK_CON_MUX_PHYCLK_UFS_LINK_SDCARD_TX_PWM_CLK_USER	0x024C
+#define CLK_CON_MUX_PHYCLK_UFS_LINK_SDCARD_REFCLK_OUT_SOC_USER	0x0250
+#define CLK_CON_DIV_PCLK_COMBO_PHY_WIFI				0x0400
+#define CLK_STAT_MUX_ACLK_FSYS1_200_USER			0x0600
+#define CLK_STAT_MUX_SCLK_FSYS1_MMC2_USER			0x0604
+#define CLK_STAT_MUX_SCLK_FSYS1_UFSUNIPRO_SDCARD_USER		0x060C
+#define CLK_STAT_MUX_SCLK_FSYS1_UFSUNIPRO_SDCARD_CFG_USER	0x0610
+#define CLK_STAT_MUX_SCLK_FSYS1_PCIE_PHY_USER			0x0614
+#define CLK_STAT_MUX_PCIE_PLL					0x0618
+#define CLK_STAT_MUX_PHYCLK_UFS_LINK_SDCARD_TX0_SYMBOL_USER	0x0620
+#define CLK_STAT_MUX_PHYCLK_UFS_LINK_SDCARD_RX0_SYMBOL_USER	0x0624
+#define CLK_STAT_MUX_PHYCLK_PCIE_WIFI0_TX0_USER			0x0630
+#define CLK_STAT_MUX_PHYCLK_PCIE_WIFI0_RX0_USER			0x0634
+#define CLK_STAT_MUX_PHYCLK_PCIE_WIFI1_TX0_USER			0x0638
+#define CLK_STAT_MUX_PHYCLK_PCIE_WIFI1_RX0_USER			0x063C
+#define CLK_STAT_MUX_PHYCLK_PCIE_WIFI0_DIG_REFCLK_USER		0x0640
+#define CLK_STAT_MUX_PHYCLK_PCIE_WIFI1_DIG_REFCLK_USER		0x0644
+#define CLK_STAT_MUX_PHYCLK_UFS_LINK_SDCARD_RX_PWM_CLK_USER	0x0648
+#define CLK_STAT_MUX_PHYCLK_UFS_LINK_SDCARD_TX_PWM_CLK_USER	0x064C
+#define CLK_STAT_MUX_PHYCLK_UFS_LINK_SDCARD_REFCLK_OUT_SOC_USER	0x0650
+#define CG_CTRL_VAL_ACLK_FSYS1_200				0x0800
+#define CG_CTRL_VAL_PCLK_HPM_APBIF_FSYS1			0x0820
+#define CG_CTRL_VAL_PCLK_COMBO_PHY_WIFI				0x0824
+#define CG_CTRL_VAL_SCLK_MMC2					0x0840
+#define CG_CTRL_VAL_SCLK_UFSUNIPRO_SDCARD			0x0844
+#define CG_CTRL_VAL_SCLK_UFSUNIPRO_SDCARD_CFG			0x0848
+#define CG_CTRL_VAL_SCLK_FSYS1_PCIE0_PHY			0x084C
+#define CG_CTRL_VAL_SCLK_FSYS1_PCIE1_PHY			0x0850
+#define CG_CTRL_VAL_SCLK_PCIE_LINK_WIFI0			0x0854
+#define CG_CTRL_VAL_SCLK_PCIE_LINK_WIFI1			0x0858
+#define CG_CTRL_VAL_PHYCLK_UFS_LINK_SDCARD_TX0_SYMBOL		0x085C
+#define CG_CTRL_VAL_PHYCLK_UFS_LINK_SDCARD_RX0_SYMBOL		0x0860
+#define CG_CTRL_VAL_PHYCLK_PCIE_WIFI0_TX0			0x086C
+#define CG_CTRL_VAL_PHYCLK_PCIE_WIFI0_RX0			0x0870
+#define CG_CTRL_VAL_PHYCLK_PCIE_WIFI1_TX0			0x0874
+#define CG_CTRL_VAL_PHYCLK_PCIE_WIFI1_RX0			0x0878
+#define CG_CTRL_VAL_PHYCLK_PCIE_WIFI0_DIG_REFCLK		0x087C
+#define CG_CTRL_VAL_PHYCLK_PCIE_WIFI1_DIG_REFCLK		0x0880
+#define CG_CTRL_VAL_PHYCLK_UFS_LINK_SDCARD_RX_PWM_CLK		0x0884
+#define CG_CTRL_VAL_PHYCLK_UFS_LINK_SDCARD_TX_PWM_CLK		0x0888
+#define CG_CTRL_VAL_PHYCLK_UFS_LINK_SDCARD_REFCLK_OUT_SOC	0x088C
+#define CG_CTRL_VAL_SCLK_PROMISE_FSYS1				0x0890
+#define CLKOUT_CMU_FSYS1					0x0C00
+#define CLKOUT_CMU_FSYS1_DIV_STAT				0x0C04
+#define FSYS1_SFR_IGNORE_REQ_SYSCLK				0x0D04
+#define CMU_FSYS1_SPARE0					0x0D08
+#define CMU_FSYS1_SPARE1					0x0D0C
+#define CG_CTRL_MAN_ACLK_FSYS1_200				0x1800
+#define CG_CTRL_MAN_PCLK_HPM_APBIF_FSYS1			0x1820
+#define CG_CTRL_MAN_PCLK_COMBO_PHY_WIFI				0x1824
+#define CG_CTRL_MAN_SCLK_MMC2					0x1840
+#define CG_CTRL_MAN_SCLK_UFSUNIPRO_SDCARD			0x1844
+#define CG_CTRL_MAN_SCLK_UFSUNIPRO_SDCARD_CFG			0x1848
+#define CG_CTRL_MAN_SCLK_FSYS1_PCIE0_PHY			0x184C
+#define CG_CTRL_MAN_SCLK_FSYS1_PCIE1_PHY			0x1850
+#define CG_CTRL_MAN_SCLK_PCIE_LINK_WIFI0			0x1854
+#define CG_CTRL_MAN_SCLK_PCIE_LINK_WIFI1			0x1858
+#define CG_CTRL_MAN_PHYCLK_UFS_LINK_SDCARD_TX0_SYMBOL		0x185C
+#define CG_CTRL_MAN_PHYCLK_UFS_LINK_SDCARD_RX0_SYMBOL		0x1860
+#define CG_CTRL_MAN_PHYCLK_PCIE_WIFI0_TX0			0x186C
+#define CG_CTRL_MAN_PHYCLK_PCIE_WIFI0_RX0			0x1870
+#define CG_CTRL_MAN_PHYCLK_PCIE_WIFI1_TX0			0x1874
+#define CG_CTRL_MAN_PHYCLK_PCIE_WIFI1_RX0			0x1878
+#define CG_CTRL_MAN_PHYCLK_PCIE_WIFI0_DIG_REFCLK		0x187C
+#define CG_CTRL_MAN_PHYCLK_PCIE_WIFI1_DIG_REFCLK		0x1880
+#define CG_CTRL_MAN_PHYCLK_UFS_LINK_SDCARD_RX_PWM_CLK		0x1884
+#define CG_CTRL_MAN_PHYCLK_UFS_LINK_SDCARD_TX_PWM_CLK		0x1888
+#define CG_CTRL_MAN_PHYCLK_UFS_LINK_SDCARD_REFCLK_OUT_SOC	0x188C
+#define CG_CTRL_MAN_SCLK_PROMISE_FSYS1				0x1890
+#define CG_CTRL_STAT_ACLK_FSYS1_200_0				0x1C00
+#define CG_CTRL_STAT_ACLK_FSYS1_200_1				0x1C04
+#define CG_CTRL_STAT_ACLK_FSYS1_200_2				0x1C08
+#define CG_CTRL_STAT_ACLK_FSYS1_200_3				0x1C0C
+#define CG_CTRL_STAT_ACLK_FSYS1_200_4				0x1C10
+#define CG_CTRL_STAT_PCLK_HPM_APBIF_FSYS1			0x1C20
+#define CG_CTRL_STAT_PCLK_COMBO_PHY_WIFI			0x1C24
+#define CG_CTRL_STAT_SCLK_MMC2					0x1C40
+#define CG_CTRL_STAT_SCLK_UFSUNIPRO_SDCARD			0x1C44
+#define CG_CTRL_STAT_SCLK_UFSUNIPRO_SDCARD_CFG			0x1C48
+#define CG_CTRL_STAT_SCLK_FSYS1_PCIE0_PHY			0x1C4C
+#define CG_CTRL_STAT_SCLK_FSYS1_PCIE1_PHY			0x1C50
+#define CG_CTRL_STAT_SCLK_PCIE_LINK_WIFI0			0x1C54
+#define CG_CTRL_STAT_SCLK_PCIE_LINK_WIFI1			0x1C58
+#define CG_CTRL_STAT_PHYCLK_UFS_LINK_SDCARD_TX0_SYMBOL		0x1C5C
+#define CG_CTRL_STAT_PHYCLK_UFS_LINK_SDCARD_RX0_SYMBOL		0x1C60
+#define CG_CTRL_STAT_PHYCLK_PCIE_WIFI0_TX0			0x1C6C
+#define CG_CTRL_STAT_PHYCLK_PCIE_WIFI0_RX0			0x1C70
+#define CG_CTRL_STAT_PHYCLK_PCIE_WIFI1_TX0			0x1C74
+#define CG_CTRL_STAT_PHYCLK_PCIE_WIFI1_RX0			0x1C78
+#define CG_CTRL_STAT_PHYCLK_PCIE_WIFI0_DIG_REFCLK		0x1C7C
+#define CG_CTRL_STAT_PHYCLK_PCIE_WIFI1_DIG_REFCLK		0x1C80
+#define CG_CTRL_STAT_PHYCLK_UFS_LINK_SDCARD_RX_PWM_CLK		0x1C84
+#define CG_CTRL_STAT_PHYCLK_UFS_LINK_SDCARD_TX_PWM_CLK		0x1C88
+#define CG_CTRL_STAT_PHYCLK_UFS_LINK_SDCARD_REFCLK_OUT_SOC	0x1C8C
+#define CG_CTRL_STAT_SCLK_PROMISE_FSYS1				0x1C90
+#define QCH_CTRL_AXI_LH_ASYNC_MI_TOP_FSYS1			0x2000
+#define QCH_CTRL_CMU_FSYS1					0x2004
+#define QCH_CTRL_PMU_FSYS1					0x2008
+#define QCH_CTRL_SYSREG_FSYS1					0x200C
+#define QCH_CTRL_MMC2						0x2010
+#define QCH_CTRL_UFS_LINK_SDCARD				0x2014
+#define QCH_CTRL_PPMU_FSYS1					0x2018
+#define QCH_CTRL_ACEL_LH_ASYNC_SI_TOP_FSYS1			0x201C
+#define QCH_CTRL_PCIE_RC_LINK_WIFI0_SLV				0x2020
+#define QCH_CTRL_PCIE_RC_LINK_WIFI0_DBI				0x2024
+#define QCH_CTRL_PCIE_RC_LINK_WIFI1_SLV				0x2028
+#define QCH_CTRL_PCIE_RC_LINK_WIFI1_DBI				0x202C
+#define QSTATE_CTRL_SROMC_FSYS1					0x241C
+#define QSTATE_CTRL_GPIO_FSYS1					0x2420
+#define QSTATE_CTRL_HPM_APBIF_FSYS1				0x2424
+#define QSTATE_CTRL_PROMISE_FSYS1				0x2428
+#define QSTATE_CTRL_PCIE_RC_LINK_WIFI0				0x242C
+#define QSTATE_CTRL_PCIE_RC_LINK_WIFI1				0x2430
+#define QSTATE_CTRL_PCIE_PCS_WIFI0				0x2434
+#define QSTATE_CTRL_PCIE_PCS_WIFI1				0x2438
+#define QSTATE_CTRL_PCIE_PHY_FSYS1_WIFI0			0x243C
+#define QSTATE_CTRL_PCIE_PHY_FSYS1_WIFI1			0x2440
+#define QSTATE_CTRL_UFS_LINK_SDCARD				0x2444
+
+static const unsigned long fsys1_clk_regs[] __initconst = {
+	PCIE_PLL_LOCK,
+	PCIE_PLL_CON0,
+	PCIE_PLL_CON1,
+	CLK_CON_MUX_ACLK_FSYS1_200_USER,
+	CLK_CON_MUX_SCLK_FSYS1_MMC2_USER,
+	CLK_CON_MUX_SCLK_FSYS1_UFSUNIPRO_SDCARD_USER,
+	CLK_CON_MUX_SCLK_FSYS1_UFSUNIPRO_SDCARD_CFG_USER,
+	CLK_CON_MUX_SCLK_FSYS1_PCIE_PHY_USER,
+	CLK_CON_MUX_PCIE_PLL,
+	CLK_CON_MUX_PHYCLK_UFS_LINK_SDCARD_TX0_SYMBOL_USER,
+	CLK_CON_MUX_PHYCLK_UFS_LINK_SDCARD_RX0_SYMBOL_USER,
+	CLK_CON_MUX_PHYCLK_PCIE_WIFI0_TX0_USER,
+	CLK_CON_MUX_PHYCLK_PCIE_WIFI0_RX0_USER,
+	CLK_CON_MUX_PHYCLK_PCIE_WIFI1_TX0_USER,
+	CLK_CON_MUX_PHYCLK_PCIE_WIFI1_RX0_USER,
+	CLK_CON_MUX_PHYCLK_PCIE_WIFI0_DIG_REFCLK_USER,
+	CLK_CON_MUX_PHYCLK_PCIE_WIFI1_DIG_REFCLK_USER,
+	CLK_CON_MUX_PHYCLK_UFS_LINK_SDCARD_RX_PWM_CLK_USER,
+	CLK_CON_MUX_PHYCLK_UFS_LINK_SDCARD_TX_PWM_CLK_USER,
+	CLK_CON_MUX_PHYCLK_UFS_LINK_SDCARD_REFCLK_OUT_SOC_USER,
+	CLK_CON_DIV_PCLK_COMBO_PHY_WIFI,
+	CLK_STAT_MUX_ACLK_FSYS1_200_USER,
+	CLK_STAT_MUX_SCLK_FSYS1_MMC2_USER,
+	CLK_STAT_MUX_SCLK_FSYS1_UFSUNIPRO_SDCARD_USER,
+	CLK_STAT_MUX_SCLK_FSYS1_UFSUNIPRO_SDCARD_CFG_USER,
+	CLK_STAT_MUX_SCLK_FSYS1_PCIE_PHY_USER,
+	CLK_STAT_MUX_PCIE_PLL,
+	CLK_STAT_MUX_PHYCLK_UFS_LINK_SDCARD_TX0_SYMBOL_USER,
+	CLK_STAT_MUX_PHYCLK_UFS_LINK_SDCARD_RX0_SYMBOL_USER,
+	CLK_STAT_MUX_PHYCLK_PCIE_WIFI0_TX0_USER,
+	CLK_STAT_MUX_PHYCLK_PCIE_WIFI0_RX0_USER,
+	CLK_STAT_MUX_PHYCLK_PCIE_WIFI1_TX0_USER,
+	CLK_STAT_MUX_PHYCLK_PCIE_WIFI1_RX0_USER,
+	CLK_STAT_MUX_PHYCLK_PCIE_WIFI0_DIG_REFCLK_USER,
+	CLK_STAT_MUX_PHYCLK_PCIE_WIFI1_DIG_REFCLK_USER,
+	CLK_STAT_MUX_PHYCLK_UFS_LINK_SDCARD_RX_PWM_CLK_USER,
+	CLK_STAT_MUX_PHYCLK_UFS_LINK_SDCARD_TX_PWM_CLK_USER,
+	CLK_STAT_MUX_PHYCLK_UFS_LINK_SDCARD_REFCLK_OUT_SOC_USER,
+	CG_CTRL_VAL_ACLK_FSYS1_200,
+	CG_CTRL_VAL_PCLK_HPM_APBIF_FSYS1,
+	CG_CTRL_VAL_PCLK_COMBO_PHY_WIFI,
+	CG_CTRL_VAL_SCLK_MMC2,
+	CG_CTRL_VAL_SCLK_UFSUNIPRO_SDCARD,
+	CG_CTRL_VAL_SCLK_UFSUNIPRO_SDCARD_CFG,
+	CG_CTRL_VAL_SCLK_FSYS1_PCIE0_PHY,
+	CG_CTRL_VAL_SCLK_FSYS1_PCIE1_PHY,
+	CG_CTRL_VAL_SCLK_PCIE_LINK_WIFI0,
+	CG_CTRL_VAL_SCLK_PCIE_LINK_WIFI1,
+	CG_CTRL_VAL_PHYCLK_UFS_LINK_SDCARD_TX0_SYMBOL,
+	CG_CTRL_VAL_PHYCLK_UFS_LINK_SDCARD_RX0_SYMBOL,
+	CG_CTRL_VAL_PHYCLK_PCIE_WIFI0_TX0,
+	CG_CTRL_VAL_PHYCLK_PCIE_WIFI0_RX0,
+	CG_CTRL_VAL_PHYCLK_PCIE_WIFI1_TX0,
+	CG_CTRL_VAL_PHYCLK_PCIE_WIFI1_RX0,
+	CG_CTRL_VAL_PHYCLK_PCIE_WIFI0_DIG_REFCLK,
+	CG_CTRL_VAL_PHYCLK_PCIE_WIFI1_DIG_REFCLK,
+	CG_CTRL_VAL_PHYCLK_UFS_LINK_SDCARD_RX_PWM_CLK,
+	CG_CTRL_VAL_PHYCLK_UFS_LINK_SDCARD_TX_PWM_CLK,
+	CG_CTRL_VAL_PHYCLK_UFS_LINK_SDCARD_REFCLK_OUT_SOC,
+	CG_CTRL_VAL_SCLK_PROMISE_FSYS1,
+	CLKOUT_CMU_FSYS1,
+	CLKOUT_CMU_FSYS1_DIV_STAT,
+	FSYS1_SFR_IGNORE_REQ_SYSCLK,
+	CMU_FSYS1_SPARE0,
+	CMU_FSYS1_SPARE1,
+	CG_CTRL_MAN_ACLK_FSYS1_200,
+	CG_CTRL_MAN_PCLK_HPM_APBIF_FSYS1,
+	CG_CTRL_MAN_PCLK_COMBO_PHY_WIFI,
+	CG_CTRL_MAN_SCLK_MMC2,
+	CG_CTRL_MAN_SCLK_UFSUNIPRO_SDCARD,
+	CG_CTRL_MAN_SCLK_UFSUNIPRO_SDCARD_CFG,
+	CG_CTRL_MAN_SCLK_FSYS1_PCIE0_PHY,
+	CG_CTRL_MAN_SCLK_FSYS1_PCIE1_PHY,
+	CG_CTRL_MAN_SCLK_PCIE_LINK_WIFI0,
+	CG_CTRL_MAN_SCLK_PCIE_LINK_WIFI1,
+	CG_CTRL_MAN_PHYCLK_UFS_LINK_SDCARD_TX0_SYMBOL,
+	CG_CTRL_MAN_PHYCLK_UFS_LINK_SDCARD_RX0_SYMBOL,
+	CG_CTRL_MAN_PHYCLK_PCIE_WIFI0_TX0,
+	CG_CTRL_MAN_PHYCLK_PCIE_WIFI0_RX0,
+	CG_CTRL_MAN_PHYCLK_PCIE_WIFI1_TX0,
+	CG_CTRL_MAN_PHYCLK_PCIE_WIFI1_RX0,
+	CG_CTRL_MAN_PHYCLK_PCIE_WIFI0_DIG_REFCLK,
+	CG_CTRL_MAN_PHYCLK_PCIE_WIFI1_DIG_REFCLK,
+	CG_CTRL_MAN_PHYCLK_UFS_LINK_SDCARD_RX_PWM_CLK,
+	CG_CTRL_MAN_PHYCLK_UFS_LINK_SDCARD_TX_PWM_CLK,
+	CG_CTRL_MAN_PHYCLK_UFS_LINK_SDCARD_REFCLK_OUT_SOC,
+	CG_CTRL_MAN_SCLK_PROMISE_FSYS1,
+	CG_CTRL_STAT_ACLK_FSYS1_200_0,
+	CG_CTRL_STAT_ACLK_FSYS1_200_1,
+	CG_CTRL_STAT_ACLK_FSYS1_200_2,
+	CG_CTRL_STAT_ACLK_FSYS1_200_3,
+	CG_CTRL_STAT_ACLK_FSYS1_200_4,
+	CG_CTRL_STAT_PCLK_HPM_APBIF_FSYS1,
+	CG_CTRL_STAT_PCLK_COMBO_PHY_WIFI,
+	CG_CTRL_STAT_SCLK_MMC2,
+	CG_CTRL_STAT_SCLK_UFSUNIPRO_SDCARD,
+	CG_CTRL_STAT_SCLK_UFSUNIPRO_SDCARD_CFG,
+	CG_CTRL_STAT_SCLK_FSYS1_PCIE0_PHY,
+	CG_CTRL_STAT_SCLK_FSYS1_PCIE1_PHY,
+	CG_CTRL_STAT_SCLK_PCIE_LINK_WIFI0,
+	CG_CTRL_STAT_SCLK_PCIE_LINK_WIFI1,
+	CG_CTRL_STAT_PHYCLK_UFS_LINK_SDCARD_TX0_SYMBOL,
+	CG_CTRL_STAT_PHYCLK_UFS_LINK_SDCARD_RX0_SYMBOL,
+	CG_CTRL_STAT_PHYCLK_PCIE_WIFI0_TX0,
+	CG_CTRL_STAT_PHYCLK_PCIE_WIFI0_RX0,
+	CG_CTRL_STAT_PHYCLK_PCIE_WIFI1_TX0,
+	CG_CTRL_STAT_PHYCLK_PCIE_WIFI1_RX0,
+	CG_CTRL_STAT_PHYCLK_PCIE_WIFI0_DIG_REFCLK,
+	CG_CTRL_STAT_PHYCLK_PCIE_WIFI1_DIG_REFCLK,
+	CG_CTRL_STAT_PHYCLK_UFS_LINK_SDCARD_RX_PWM_CLK,
+	CG_CTRL_STAT_PHYCLK_UFS_LINK_SDCARD_TX_PWM_CLK,
+	CG_CTRL_STAT_PHYCLK_UFS_LINK_SDCARD_REFCLK_OUT_SOC,
+	CG_CTRL_STAT_SCLK_PROMISE_FSYS1,
+	QCH_CTRL_AXI_LH_ASYNC_MI_TOP_FSYS1,
+	QCH_CTRL_CMU_FSYS1,
+	QCH_CTRL_PMU_FSYS1,
+	QCH_CTRL_SYSREG_FSYS1,
+	QCH_CTRL_MMC2,
+	QCH_CTRL_UFS_LINK_SDCARD,
+	QCH_CTRL_PPMU_FSYS1,
+	QCH_CTRL_ACEL_LH_ASYNC_SI_TOP_FSYS1,
+	QCH_CTRL_PCIE_RC_LINK_WIFI0_SLV,
+	QCH_CTRL_PCIE_RC_LINK_WIFI0_DBI,
+	QCH_CTRL_PCIE_RC_LINK_WIFI1_SLV,
+	QCH_CTRL_PCIE_RC_LINK_WIFI1_DBI,
+	QSTATE_CTRL_SROMC_FSYS1,
+	QSTATE_CTRL_GPIO_FSYS1,
+	QSTATE_CTRL_HPM_APBIF_FSYS1,
+	QSTATE_CTRL_PROMISE_FSYS1,
+	QSTATE_CTRL_PCIE_RC_LINK_WIFI0,
+	QSTATE_CTRL_PCIE_RC_LINK_WIFI1,
+	QSTATE_CTRL_PCIE_PCS_WIFI0,
+	QSTATE_CTRL_PCIE_PCS_WIFI1,
+	QSTATE_CTRL_PCIE_PHY_FSYS1_WIFI0,
+	QSTATE_CTRL_PCIE_PHY_FSYS1_WIFI1,
+	QSTATE_CTRL_UFS_LINK_SDCARD,
+};
+
+static const struct samsung_pll_rate_table pcie_pll_rates[] __initconst = {
+	PLL_36XX_RATE(26 * MHZ, 100000000U, 800, 13, 4, 0),
+};
+
+static const struct samsung_pll_clock fsys1_pll_clks[] __initconst = {
+	PLL(pll_1431x, CLK_FOUT_PCIE_PLL, "fout_pcie_pll", "oscclk",
+	    PCIE_PLL_LOCK, PCIE_PLL_CON0, pcie_pll_rates),
+};
+
+PNAME(fsys1_mux_aclk_fsys1_200_user_p)				= { "oscclk",
+								    "gout_top_aclk_fsys1_200" };
+PNAME(fsys1_mux_sclk_fsys1_mmc2_user_p)				= { "oscclk",
+								    "gout_top_sclk_fsys1_mmc2" };
+PNAME(fsys1_mux_sclk_fsys1_ufsunipro_sdcard_user_p)		= {
+	"oscclk",
+	"gout_top_sclk_fsys1_ufsunipro20" };
+PNAME(fsys1_mux_sclk_fsys1_ufsunipro_sdcard_cfg_user_p)		= {
+	"oscclk",
+	"gout_top_sclk_fsys1_ufsunipro_cfg" };
+PNAME(fsys1_mux_sclk_fsys1_pcie_phy_user_p)			= {
+	"oscclk",
+	"gout_top_sclk_fsys1_pcie_phy" };
+PNAME(fsys1_mux_pcie_pll_p)					= { "oscclk",
+								    "fout_pcie_pll" };
+PNAME(fsys1_mux_phyclk_ufs_link_sdcard_tx0_symbol_user_p)	= {
+	"oscclk",
+	"phyclk_ufs_link_sdcard_tx0_symbol_phy" };
+PNAME(fsys1_mux_phyclk_ufs_link_sdcard_rx0_symbol_user_p)	= {
+	"oscclk",
+	"phyclk_ufs_link_sdcard_rx0_symbol_phy" };
+PNAME(fsys1_mux_phyclk_pcie_wifi0_tx0_user_p)			= { "oscclk",
+								    "phyclk_pcie_wifi0_tx0_phy" };
+PNAME(fsys1_mux_phyclk_pcie_wifi0_rx0_user_p)			= { "oscclk",
+								    "phyclk_pcie_wifi0_rx0_phy" };
+PNAME(fsys1_mux_phyclk_pcie_wifi1_tx0_user_p)			= { "oscclk",
+								    "phyclk_pcie_wifi1_tx0_phy" };
+PNAME(fsys1_mux_phyclk_pcie_wifi1_rx0_user_p)			= { "oscclk",
+								    "phyclk_pcie_wifi1_rx0_phy" };
+PNAME(fsys1_mux_phyclk_pcie_wifi0_dig_refclk_user_p)		= {
+	"oscclk",
+	"phyclk_pcie_wifi0_dig_refclk_phy" };
+PNAME(fsys1_mux_phyclk_pcie_wifi1_dig_refclk_user_p)		= {
+	"oscclk",
+	"phyclk_pcie_wifi1_dig_refclk_phy" };
+
+static const struct samsung_fixed_rate_clock fsys1_fixed_clks[] __initconst = {
+	FRATE(CLK_PHYCLK_UFS_LINK_SDCARD_TX0_SYMBOL_PHY,
+	      "phyclk_ufs_link_sdcard_tx0_symbol_phy", NULL, 0, 30000000),
+	FRATE(CLK_PHYCLK_UFS_LINK_SDCARD_RX0_SYMBOL_PHY,
+	      "phyclk_ufs_link_sdcard_rx0_symbol_phy", NULL, 0, 30000000),
+	FRATE(CLK_PHYCLK_PCIE_WIFI0_TX0_PHY, "phyclk_pcie_wifi0_tx0_phy", NULL,
+	      0, 30000000),
+	FRATE(CLK_PHYCLK_PCIE_WIFI0_RX0_PHY, "phyclk_pcie_wifi0_rx0_phy", NULL,
+	      0, 30000000),
+	FRATE(CLK_PHYCLK_PCIE_WIFI1_TX0_PHY, "phyclk_pcie_wifi1_tx0_phy", NULL,
+	      0, 250000000),
+	FRATE(CLK_PHYCLK_PCIE_WIFI1_RX0_PHY, "phyclk_pcie_wifi1_rx0_phy", NULL,
+	      0, 250000000),
+	FRATE(CLK_PHYCLK_PCIE_WIFI0_DIG_REFCLK_PHY,
+	      "phyclk_pcie_wifi0_dig_refclk_phy", NULL, 0, 30000000),
+	FRATE(CLK_PHYCLK_PCIE_WIFI1_DIG_REFCLK_PHY,
+	      "phyclk_pcie_wifi1_dig_refclk_phy", NULL, 0, 30000000),
+};
+
+static const struct samsung_mux_clock fsys1_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_FSYS1_ACLK_FSYS1_200_USER,
+	    "mout_fsys1_aclk_fsys1_200_user", fsys1_mux_aclk_fsys1_200_user_p,
+	    CLK_CON_MUX_ACLK_FSYS1_200_USER, 12, 1),
+	MUX(CLK_MOUT_FSYS1_SCLK_FSYS1_MMC2_USER,
+	    "mout_fsys1_sclk_fsys1_mmc2_user", fsys1_mux_sclk_fsys1_mmc2_user_p,
+	    CLK_CON_MUX_SCLK_FSYS1_MMC2_USER, 12, 1),
+	MUX(CLK_MOUT_FSYS1_SCLK_FSYS1_UFSUNIPRO_SDCARD_USER,
+	    "mout_fsys1_sclk_fsys1_ufsunipro_sdcard_user",
+	    fsys1_mux_sclk_fsys1_ufsunipro_sdcard_user_p,
+	    CLK_CON_MUX_SCLK_FSYS1_UFSUNIPRO_SDCARD_USER, 12, 1),
+	MUX(CLK_MOUT_FSYS1_SCLK_FSYS1_UFSUNIPRO_SDCARD_CFG_USER,
+	    "mout_fsys1_sclk_fsys1_ufsunipro_sdcard_cfg_user",
+	    fsys1_mux_sclk_fsys1_ufsunipro_sdcard_cfg_user_p,
+	    CLK_CON_MUX_SCLK_FSYS1_UFSUNIPRO_SDCARD_CFG_USER, 12, 1),
+	MUX(CLK_MOUT_FSYS1_SCLK_FSYS1_PCIE_PHY_USER,
+	    "mout_fsys1_sclk_fsys1_pcie_phy_user",
+	    fsys1_mux_sclk_fsys1_pcie_phy_user_p,
+	    CLK_CON_MUX_SCLK_FSYS1_PCIE_PHY_USER, 12, 1),
+	MUX(CLK_MOUT_FSYS1_PCIE_PLL, "mout_fsys1_pcie_pll",
+	    fsys1_mux_pcie_pll_p, CLK_CON_MUX_PCIE_PLL, 12, 1),
+	MUX(CLK_MOUT_FSYS1_PHYCLK_UFS_LINK_SDCARD_TX0_SYMBOL_USER,
+	    "mout_fsys1_phyclk_ufs_link_sdcard_tx0_symbol_user",
+	    fsys1_mux_phyclk_ufs_link_sdcard_tx0_symbol_user_p,
+	    CLK_CON_MUX_PHYCLK_UFS_LINK_SDCARD_TX0_SYMBOL_USER, 12, 1),
+	MUX(CLK_MOUT_FSYS1_PHYCLK_UFS_LINK_SDCARD_RX0_SYMBOL_USER,
+	    "mout_fsys1_phyclk_ufs_link_sdcard_rx0_symbol_user",
+	    fsys1_mux_phyclk_ufs_link_sdcard_rx0_symbol_user_p,
+	    CLK_CON_MUX_PHYCLK_UFS_LINK_SDCARD_RX0_SYMBOL_USER, 12, 1),
+	MUX(CLK_MOUT_FSYS1_PHYCLK_PCIE_WIFI0_TX0_USER,
+	    "mout_fsys1_phyclk_pcie_wifi0_tx0_user",
+	    fsys1_mux_phyclk_pcie_wifi0_tx0_user_p,
+	    CLK_CON_MUX_PHYCLK_PCIE_WIFI0_TX0_USER, 12, 1),
+	MUX(CLK_MOUT_FSYS1_PHYCLK_PCIE_WIFI0_RX0_USER,
+	    "mout_fsys1_phyclk_pcie_wifi0_rx0_user",
+	    fsys1_mux_phyclk_pcie_wifi0_rx0_user_p,
+	    CLK_CON_MUX_PHYCLK_PCIE_WIFI0_RX0_USER, 12, 1),
+	MUX(CLK_MOUT_FSYS1_PHYCLK_PCIE_WIFI1_TX0_USER,
+	    "mout_fsys1_phyclk_pcie_wifi1_tx0_user",
+	    fsys1_mux_phyclk_pcie_wifi1_tx0_user_p,
+	    CLK_CON_MUX_PHYCLK_PCIE_WIFI1_TX0_USER, 12, 1),
+	MUX(CLK_MOUT_FSYS1_PHYCLK_PCIE_WIFI1_RX0_USER,
+	    "mout_fsys1_phyclk_pcie_wifi1_rx0_user",
+	    fsys1_mux_phyclk_pcie_wifi1_rx0_user_p,
+	    CLK_CON_MUX_PHYCLK_PCIE_WIFI1_RX0_USER, 12, 1),
+	MUX(CLK_MOUT_FSYS1_PHYCLK_PCIE_WIFI0_DIG_REFCLK_USER,
+	    "mout_fsys1_phyclk_pcie_wifi0_dig_refclk_user",
+	    fsys1_mux_phyclk_pcie_wifi0_dig_refclk_user_p,
+	    CLK_CON_MUX_PHYCLK_PCIE_WIFI0_DIG_REFCLK_USER, 12, 1),
+	MUX(CLK_MOUT_FSYS1_PHYCLK_PCIE_WIFI1_DIG_REFCLK_USER,
+	    "mout_fsys1_phyclk_pcie_wifi1_dig_refclk_user",
+	    fsys1_mux_phyclk_pcie_wifi1_dig_refclk_user_p,
+	    CLK_CON_MUX_PHYCLK_PCIE_WIFI1_DIG_REFCLK_USER, 12, 1),
+};
+
+static const struct samsung_div_clock fsys1_div_clks[] __initconst = {
+	DIV(CLK_DOUT_FSYS1_PCLK_COMBO_PHY_WIFI,
+	    "dout_fsys1_pclk_combo_phy_wifi", "mout_fsys1_aclk_fsys1_200_user",
+	    CLK_CON_DIV_PCLK_COMBO_PHY_WIFI, 0, 2),
+};
+
+static const struct samsung_gate_clock fsys1_gate_clks[] __initconst = {
+	GATE(CLK_GOUT_FSYS1_ACLK_AXI2ACEL_FSYS1X,
+	     "gout_fsys1_aclk_axi2acel_fsys1x",
+	     "mout_fsys1_aclk_fsys1_200_user", CG_CTRL_VAL_ACLK_FSYS1_200, 31,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_FSYS1_PCLK_CMU_FSYS1, "gout_fsys1_pclk_cmu_fsys1",
+	     "mout_fsys1_aclk_fsys1_200_user", CG_CTRL_VAL_ACLK_FSYS1_200, 30,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_FSYS1_ACLK_COMBO_PHY_PCS_PCLK_WIFI1,
+	     "gout_fsys1_aclk_combo_phy_pcs_pclk_wifi1",
+	     "mout_fsys1_aclk_fsys1_200_user", CG_CTRL_VAL_ACLK_FSYS1_200, 29,
+	     0, 0),
+	GATE(CLK_GOUT_FSYS1_ACLK_COMBO_PHY_PCS_PCLK_WIFI0,
+	     "gout_fsys1_aclk_combo_phy_pcs_pclk_wifi0",
+	     "mout_fsys1_aclk_fsys1_200_user", CG_CTRL_VAL_ACLK_FSYS1_200, 28,
+	     0, 0),
+	GATE(CLK_GOUT_FSYS1_PCLK_PMU_FSYS1, "gout_fsys1_pclk_pmu_fsys1",
+	     "mout_fsys1_aclk_fsys1_200_user", CG_CTRL_VAL_ACLK_FSYS1_200, 26,
+	     0, 0),
+	GATE(CLK_GOUT_FSYS1_PCLK_PPMU_FSYS1, "gout_fsys1_pclk_ppmu_fsys1",
+	     "mout_fsys1_aclk_fsys1_200_user", CG_CTRL_VAL_ACLK_FSYS1_200, 25,
+	     0, 0),
+	GATE(CLK_GOUT_FSYS1_PCLK_GPIO_FSYS1, "gout_fsys1_pclk_gpio_fsys1",
+	     "mout_fsys1_aclk_fsys1_200_user", CG_CTRL_VAL_ACLK_FSYS1_200, 24,
+	     0, 0),
+	GATE(CLK_GOUT_FSYS1_PCLK_SYSREG_FSYS1, "gout_fsys1_pclk_sysreg_fsys1",
+	     "mout_fsys1_aclk_fsys1_200_user", CG_CTRL_VAL_ACLK_FSYS1_200, 23,
+	     0, 0),
+	GATE(CLK_GOUT_FSYS1_ACLK_SROMC_FSYS1, "gout_fsys1_aclk_sromc_fsys1",
+	     "mout_fsys1_aclk_fsys1_200_user", CG_CTRL_VAL_ACLK_FSYS1_200, 22,
+	     0, 0),
+	GATE(CLK_GOUT_FSYS1_PCLK_PCIE_WIFI1, "gout_fsys1_pclk_pcie_wifi1",
+	     "mout_fsys1_aclk_fsys1_200_user", CG_CTRL_VAL_ACLK_FSYS1_200, 21,
+	     0, 0),
+	GATE(CLK_GOUT_FSYS1_ACLK_PCIE_WIFI1_DBI,
+	     "gout_fsys1_aclk_pcie_wifi1_dbi", "mout_fsys1_aclk_fsys1_200_user",
+	     CG_CTRL_VAL_ACLK_FSYS1_200, 20, 0, 0),
+	GATE(CLK_GOUT_FSYS1_ACLK_PCIE_WIFI1_SLV,
+	     "gout_fsys1_aclk_pcie_wifi1_slv", "mout_fsys1_aclk_fsys1_200_user",
+	     CG_CTRL_VAL_ACLK_FSYS1_200, 19, 0, 0),
+	GATE(CLK_GOUT_FSYS1_ACLK_PCIE_WIFI1_MSTR,
+	     "gout_fsys1_aclk_pcie_wifi1_mstr",
+	     "mout_fsys1_aclk_fsys1_200_user", CG_CTRL_VAL_ACLK_FSYS1_200, 18,
+	     0, 0),
+	GATE(CLK_GOUT_FSYS1_ACLK_AHB2AXI_PCIE_WIFI1,
+	     "gout_fsys1_aclk_ahb2axi_pcie_wifi1",
+	     "mout_fsys1_aclk_fsys1_200_user", CG_CTRL_VAL_ACLK_FSYS1_200, 17,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_FSYS1_PCLK_PCIE_WIFI0, "gout_fsys1_pclk_pcie_wifi0",
+	     "mout_fsys1_aclk_fsys1_200_user", CG_CTRL_VAL_ACLK_FSYS1_200, 16,
+	     0, 0),
+	GATE(CLK_GOUT_FSYS1_ACLK_PCIE_WIFI0_DBI,
+	     "gout_fsys1_aclk_pcie_wifi0_dbi", "mout_fsys1_aclk_fsys1_200_user",
+	     CG_CTRL_VAL_ACLK_FSYS1_200, 15, 0, 0),
+	GATE(CLK_GOUT_FSYS1_ACLK_PCIE_WIFI0_SLV,
+	     "gout_fsys1_aclk_pcie_wifi0_slv", "mout_fsys1_aclk_fsys1_200_user",
+	     CG_CTRL_VAL_ACLK_FSYS1_200, 14, 0, 0),
+	GATE(CLK_GOUT_FSYS1_ACLK_PCIE_WIFI0_MSTR,
+	     "gout_fsys1_aclk_pcie_wifi0_mstr",
+	     "mout_fsys1_aclk_fsys1_200_user", CG_CTRL_VAL_ACLK_FSYS1_200, 13,
+	     0, 0),
+	GATE(CLK_GOUT_FSYS1_ACLK_AHB2AXI_PCIE_WIFI0,
+	     "gout_fsys1_aclk_ahb2axi_pcie_wifi0",
+	     "mout_fsys1_aclk_fsys1_200_user", CG_CTRL_VAL_ACLK_FSYS1_200, 12,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_FSYS1_ACLK_PPMU_FSYS1, "gout_fsys1_aclk_ppmu_fsys1",
+	     "mout_fsys1_aclk_fsys1_200_user", CG_CTRL_VAL_ACLK_FSYS1_200, 11,
+	     0, 0),
+	GATE(CLK_GOUT_FSYS1_ACLK_AHB_BRIDGE_FSYS1_S4,
+	     "gout_fsys1_aclk_ahb_bridge_fsys1_s4",
+	     "mout_fsys1_aclk_fsys1_200_user", CG_CTRL_VAL_ACLK_FSYS1_200, 10,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_FSYS1_ACLK_AXI2AHB_FSYS1_S4,
+	     "gout_fsys1_aclk_axi2ahb_fsys1_s4",
+	     "mout_fsys1_aclk_fsys1_200_user", CG_CTRL_VAL_ACLK_FSYS1_200, 9,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_FSYS1_ACLK_AXI2APB_FSYS1_S1,
+	     "gout_fsys1_aclk_axi2apb_fsys1_s1",
+	     "mout_fsys1_aclk_fsys1_200_user", CG_CTRL_VAL_ACLK_FSYS1_200, 8,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_FSYS1_ACLK_AXI2AHB_FSYS1_S0,
+	     "gout_fsys1_aclk_axi2ahb_fsys1_s0",
+	     "mout_fsys1_aclk_fsys1_200_user", CG_CTRL_VAL_ACLK_FSYS1_200, 7,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_FSYS1_ACLK_XIU_FSYS1SFRX, "gout_fsys1_aclk_xiu_fsys1sfrx",
+	     "mout_fsys1_aclk_fsys1_200_user", CG_CTRL_VAL_ACLK_FSYS1_200, 6, 0,
+	     0),
+	GATE(CLK_GOUT_FSYS1_ACLK_XIU_SDCARDX, "gout_fsys1_aclk_xiu_sdcardx",
+	     "mout_fsys1_aclk_fsys1_200_user", CG_CTRL_VAL_ACLK_FSYS1_200, 5, 0,
+	     0),
+	GATE(CLK_GOUT_FSYS1_ACLK_XIU_FSYS1X, "gout_fsys1_aclk_xiu_fsys1x",
+	     "mout_fsys1_aclk_fsys1_200_user", CG_CTRL_VAL_ACLK_FSYS1_200, 4, 0,
+	     0),
+	GATE(CLK_GOUT_FSYS1_ACLK_AXI_LH_ASYNC_MI_TOP_FSYS1,
+	     "gout_fsys1_aclk_axi_lh_async_mi_top_fsys1",
+	     "mout_fsys1_aclk_fsys1_200_user", CG_CTRL_VAL_ACLK_FSYS1_200, 3, 0,
+	     0),
+	GATE(CLK_GOUT_FSYS1_ACLK_ACEL_LH_ASYNC_SI_TOP_FSYS1,
+	     "gout_fsys1_aclk_acel_lh_async_si_top_fsys1",
+	     "mout_fsys1_aclk_fsys1_200_user", CG_CTRL_VAL_ACLK_FSYS1_200, 2, 0,
+	     0),
+	GATE(CLK_GOUT_FSYS1_ACLK_UFS_LINK_SDCARD,
+	     "gout_fsys1_aclk_ufs_link_sdcard",
+	     "mout_fsys1_aclk_fsys1_200_user", CG_CTRL_VAL_ACLK_FSYS1_200, 1, 0,
+	     0),
+	GATE(CLK_GOUT_FSYS1_ACLK_MMC2, "gout_fsys1_aclk_mmc2",
+	     "mout_fsys1_aclk_fsys1_200_user", CG_CTRL_VAL_ACLK_FSYS1_200, 0, 0,
+	     0),
+	GATE(CLK_GOUT_FSYS1_PCLK_HPM_APBIF_FSYS1,
+	     "gout_fsys1_pclk_hpm_apbif_fsys1",
+	     "mout_fsys1_aclk_fsys1_200_user", CG_CTRL_VAL_PCLK_HPM_APBIF_FSYS1,
+	     0, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_FSYS1_PCLK_COMBO_PHY_WIFI1,
+	     "gout_fsys1_pclk_combo_phy_wifi1",
+	     "dout_fsys1_pclk_combo_phy_wifi", CG_CTRL_VAL_PCLK_COMBO_PHY_WIFI,
+	     1, 0, 0),
+	GATE(CLK_GOUT_FSYS1_PCLK_COMBO_PHY_WIFI0,
+	     "gout_fsys1_pclk_combo_phy_wifi0",
+	     "dout_fsys1_pclk_combo_phy_wifi", CG_CTRL_VAL_PCLK_COMBO_PHY_WIFI,
+	     0, 0, 0),
+	GATE(CLK_GOUT_FSYS1_SCLK_MMC2, "gout_fsys1_sclk_mmc2",
+	     "mout_fsys1_sclk_fsys1_mmc2_user", CG_CTRL_VAL_SCLK_MMC2, 0,
+	     CLK_SET_RATE_PARENT, 0),
+	GATE(CLK_GOUT_FSYS1_SCLK_UFSUNIPRO_SDCARD,
+	     "gout_fsys1_sclk_ufsunipro_sdcard",
+	     "mout_fsys1_sclk_fsys1_ufsunipro_sdcard_user",
+	     CG_CTRL_VAL_SCLK_UFSUNIPRO_SDCARD, 0, 0, 0),
+	GATE(CLK_GOUT_FSYS1_SCLK_UFSUNIPRO_SDCARD_CFG,
+	     "gout_fsys1_sclk_ufsunipro_sdcard_cfg",
+	     "mout_fsys1_sclk_fsys1_ufsunipro_sdcard_cfg_user",
+	     CG_CTRL_VAL_SCLK_UFSUNIPRO_SDCARD_CFG, 0, 0, 0),
+	/* reading CG_CTRL_VAL_SCLK_PCIE_LINK_WIFI{0,1} causes an abort */
+	GATE(CLK_GOUT_FSYS1_PHYCLK_UFS_LINK_SDCARD_TX0_SYMBOL,
+	     "gout_fsys1_phyclk_ufs_link_sdcard_tx0_symbol",
+	     "mout_fsys1_phyclk_ufs_link_sdcard_tx0_symbol_user",
+	     CG_CTRL_VAL_PHYCLK_UFS_LINK_SDCARD_TX0_SYMBOL, 0, 0, 0),
+	GATE(CLK_GOUT_FSYS1_PHYCLK_UFS_LINK_SDCARD_RX0_SYMBOL,
+	     "gout_fsys1_phyclk_ufs_link_sdcard_rx0_symbol",
+	     "mout_fsys1_phyclk_ufs_link_sdcard_rx0_symbol_user",
+	     CG_CTRL_VAL_PHYCLK_UFS_LINK_SDCARD_RX0_SYMBOL, 0, 0, 0),
+	GATE(CLK_GOUT_FSYS1_PHYCLK_PCIE_WIFI0_TX0,
+	     "gout_fsys1_phyclk_pcie_wifi0_tx0",
+	     "mout_fsys1_phyclk_pcie_wifi0_tx0_user",
+	     CG_CTRL_VAL_PHYCLK_PCIE_WIFI0_TX0, 0, 0, 0),
+	GATE(CLK_GOUT_FSYS1_PHYCLK_PCIE_WIFI0_RX0,
+	     "gout_fsys1_phyclk_pcie_wifi0_rx0",
+	     "mout_fsys1_phyclk_pcie_wifi0_rx0_user",
+	     CG_CTRL_VAL_PHYCLK_PCIE_WIFI0_RX0, 0, 0, 0),
+	GATE(CLK_GOUT_FSYS1_PHYCLK_PCIE_WIFI1_TX0,
+	     "gout_fsys1_phyclk_pcie_wifi1_tx0",
+	     "mout_fsys1_phyclk_pcie_wifi1_tx0_user",
+	     CG_CTRL_VAL_PHYCLK_PCIE_WIFI1_TX0, 0, 0, 0),
+	GATE(CLK_GOUT_FSYS1_PHYCLK_PCIE_WIFI1_RX0,
+	     "gout_fsys1_phyclk_pcie_wifi1_rx0",
+	     "mout_fsys1_phyclk_pcie_wifi1_rx0_user",
+	     CG_CTRL_VAL_PHYCLK_PCIE_WIFI1_RX0, 0, 0, 0),
+	GATE(CLK_GOUT_FSYS1_PHYCLK_PCIE_WIFI0_DIG_REFCLK,
+	     "gout_fsys1_phyclk_pcie_wifi0_dig_refclk",
+	     "mout_fsys1_phyclk_pcie_wifi0_dig_refclk_user",
+	     CG_CTRL_VAL_PHYCLK_PCIE_WIFI0_DIG_REFCLK, 0, 0, 0),
+	GATE(CLK_GOUT_FSYS1_PHYCLK_PCIE_WIFI1_DIG_REFCLK,
+	     "gout_fsys1_phyclk_pcie_wifi1_dig_refclk",
+	     "mout_fsys1_phyclk_pcie_wifi1_dig_refclk_user",
+	     CG_CTRL_VAL_PHYCLK_PCIE_WIFI1_DIG_REFCLK, 0, 0, 0),
+	GATE(CLK_GOUT_FSYS1_SCLK_PROMISE_FSYS1, "gout_fsys1_sclk_promise_fsys1",
+	     "gout_top_sclk_promise_int", CG_CTRL_VAL_SCLK_PROMISE_FSYS1, 0, 0,
+	     0),
+};
+
+static const struct samsung_cmu_info fsys1_cmu_info __initconst = {
+	.pll_clks		= fsys1_pll_clks,
+	.nr_pll_clks		= ARRAY_SIZE(fsys1_pll_clks),
+	.mux_clks		= fsys1_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(fsys1_mux_clks),
+	.div_clks		= fsys1_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(fsys1_div_clks),
+	.gate_clks		= fsys1_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(fsys1_gate_clks),
+	.fixed_clks		= fsys1_fixed_clks,
+	.nr_fixed_clks		= ARRAY_SIZE(fsys1_fixed_clks),
+	.nr_clk_ids		= FSYS1_NR_CLK,
+	.clk_regs		= fsys1_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(fsys1_clk_regs),
+};
+
+/* ---- CMU_G3D ------------------------------------------------------------ */
+
+/* Register Offset definitions for CMU_G3D (0x14AA0000) */
+#define CLK_CON_MUX_G3D_PLL_USER	0x0200
+#define CLK_CON_MUX_BUS_PLL_USER_G3D	0x0204
+#define CLK_CON_MUX_G3D			0x020C
+#define CLK_CON_MUX_ACLK_G3D		0x0210
+#define CLK_CON_MUX_PCLK_G3D		0x0214
+#define CLK_CON_DIV_ACLK_G3D		0x0400
+#define CLK_CON_DIV_PCLK_G3D		0x0404
+#define CLK_CON_DIV_SCLK_HPM_G3D	0x0408
+#define CLK_CON_DIV_SCLK_ATE_G3D	0x040C
+#define CLK_STAT_MUX_G3D_PLL_USER	0x0600
+#define CLK_STAT_MUX_BUS_PLL_USER_G3D	0x0604
+#define CLK_STAT_MUX_G3D		0x060C
+#define CLK_STAT_MUX_ACLK_G3D		0x0610
+#define CLK_STAT_MUX_PCLK_G3D		0x0614
+#define CLK_ENABLE_ACLK_G3D		0x0800
+#define CLK_ENABLE_ACLK_G3D_BUS		0x0804
+#define CLK_ENABLE_PCLK_G3D		0x0900
+#define CLK_ENABLE_SCLK_HPM_G3D		0x0A00
+#define CLK_ENABLE_SCLK_ATE_G3D		0x0A04
+#define CLKOUT_CMU_G3D			0x0C00
+#define CLKOUT_CMU_G3D_DIV_STAT		0x0C04
+#define CLK_ENABLE_PDN_G3D		0x0E00
+#define G3D_SFR_IGNORE_REQ_SYSCLK	0x0F28
+#define CLK_STOPCTRL_G3D		0x1000
+#define CMU_G3D_SPARE0			0x1100
+#define CMU_G3D_SPARE1			0x1104
+
+static const unsigned long g3d_clk_regs[] __initconst = {
+	CLK_CON_MUX_G3D_PLL_USER,
+	CLK_CON_MUX_BUS_PLL_USER_G3D,
+	CLK_CON_MUX_G3D,
+	CLK_CON_MUX_ACLK_G3D,
+	CLK_CON_MUX_PCLK_G3D,
+	CLK_CON_DIV_ACLK_G3D,
+	CLK_CON_DIV_PCLK_G3D,
+	CLK_CON_DIV_SCLK_HPM_G3D,
+	CLK_CON_DIV_SCLK_ATE_G3D,
+	CLK_STAT_MUX_G3D_PLL_USER,
+	CLK_STAT_MUX_BUS_PLL_USER_G3D,
+	CLK_STAT_MUX_G3D,
+	CLK_STAT_MUX_ACLK_G3D,
+	CLK_STAT_MUX_PCLK_G3D,
+	CLK_ENABLE_ACLK_G3D,
+	CLK_ENABLE_ACLK_G3D_BUS,
+	CLK_ENABLE_PCLK_G3D,
+	CLK_ENABLE_SCLK_HPM_G3D,
+	CLK_ENABLE_SCLK_ATE_G3D,
+	CLKOUT_CMU_G3D,
+	CLKOUT_CMU_G3D_DIV_STAT,
+	CLK_ENABLE_PDN_G3D,
+	G3D_SFR_IGNORE_REQ_SYSCLK,
+	CLK_STOPCTRL_G3D,
+	CMU_G3D_SPARE0,
+	CMU_G3D_SPARE1,
+};
+
+PNAME(g3d_mux_g3d_pll_user_p)	= { "oscclk", "fout_g3d_pll" };
+PNAME(g3d_mux_bus_pll_user_p)	= { "oscclk", "gout_top_sclk_bus_pll_g3d" };
+PNAME(g3d_mux_g3d_p)		= { "mout_g3d_g3d_pll_user",
+				    "mout_g3d_bus_pll_user" };
+
+static const struct samsung_mux_clock g3d_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_G3D_G3D_PLL_USER, "mout_g3d_g3d_pll_user",
+	    g3d_mux_g3d_pll_user_p, CLK_CON_MUX_G3D_PLL_USER, 12, 1),
+	MUX(CLK_MOUT_G3D_BUS_PLL_USER, "mout_g3d_bus_pll_user",
+	    g3d_mux_bus_pll_user_p, CLK_CON_MUX_BUS_PLL_USER_G3D, 12, 1),
+	MUX(CLK_MOUT_G3D_G3D, "mout_g3d_g3d", g3d_mux_g3d_p, CLK_CON_MUX_G3D,
+	    12, 1),
+};
+
+static const struct samsung_div_clock g3d_div_clks[] __initconst = {
+	DIV(CLK_DOUT_G3D_ACLK_G3D, "dout_g3d_aclk_g3d", "mout_g3d_g3d",
+	    CLK_CON_DIV_ACLK_G3D, 0, 3),
+	DIV(CLK_DOUT_G3D_PCLK_G3D, "dout_g3d_pclk_g3d", "dout_g3d_aclk_g3d",
+	    CLK_CON_DIV_PCLK_G3D, 0, 3),
+	DIV(CLK_DOUT_G3D_SCLK_HPM_G3D, "dout_g3d_sclk_hpm_g3d", "mout_g3d_g3d",
+	    CLK_CON_DIV_SCLK_HPM_G3D, 0, 2),
+	DIV(CLK_DOUT_G3D_SCLK_ATE_G3D, "dout_g3d_sclk_ate_g3d", "mout_g3d_g3d",
+	    CLK_CON_DIV_SCLK_ATE_G3D, 0, 4),
+};
+
+static const struct samsung_gate_clock g3d_gate_clks[] __initconst = {
+	GATE(CLK_GOUT_G3D_ACLK_G3D, "gout_g3d_aclk_g3d", "dout_g3d_aclk_g3d",
+	     CLK_ENABLE_ACLK_G3D, 0, 0, 0),
+	GATE(CLK_GOUT_G3D_ACLK_GRAY_DEC, "gout_g3d_aclk_gray_dec",
+	     "dout_g3d_aclk_g3d", CLK_ENABLE_ACLK_G3D_BUS, 10,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_G3D_ACLK_SFW100_ACEL_G3D1,
+	     "gout_g3d_aclk_sfw100_acel_g3d1", "dout_g3d_aclk_g3d",
+	     CLK_ENABLE_ACLK_G3D_BUS, 9, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_G3D_ACLK_SFW100_ACEL_G3D0,
+	     "gout_g3d_aclk_sfw100_acel_g3d0", "dout_g3d_aclk_g3d",
+	     CLK_ENABLE_ACLK_G3D_BUS, 8, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_G3D_ACLK_XIU_G3D, "gout_g3d_aclk_xiu_g3d",
+	     "dout_g3d_aclk_g3d", CLK_ENABLE_ACLK_G3D_BUS, 7, CLK_IS_CRITICAL,
+	     0),
+	GATE(CLK_GOUT_G3D_ACLK_PPMU_G3D1, "gout_g3d_aclk_ppmu_g3d1",
+	     "dout_g3d_aclk_g3d", CLK_ENABLE_ACLK_G3D_BUS, 6,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_G3D_ACLK_PPMU_G3D0, "gout_g3d_aclk_ppmu_g3d0",
+	     "dout_g3d_aclk_g3d", CLK_ENABLE_ACLK_G3D_BUS, 5,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_G3D_ACLK_ASYNCAPBM_G3D, "gout_g3d_aclk_asyncapbm_g3d",
+	     "dout_g3d_aclk_g3d", CLK_ENABLE_ACLK_G3D_BUS, 4, CLK_IS_CRITICAL,
+	     0),
+	GATE(CLK_GOUT_G3D_ACLK_ASYNCAXI_G3D, "gout_g3d_aclk_asyncaxi_g3d",
+	     "dout_g3d_aclk_g3d", CLK_ENABLE_ACLK_G3D_BUS, 3, CLK_IS_CRITICAL,
+	     0),
+	GATE(CLK_GOUT_G3D_ACLK_AXI_DS_G3D, "gout_g3d_aclk_axi_ds_g3d",
+	     "dout_g3d_aclk_g3d", CLK_ENABLE_ACLK_G3D_BUS, 2, CLK_IS_CRITICAL,
+	     0),
+	GATE(CLK_GOUT_G3D_ACLK_ACEL_LH_ASYNC_SI_G3D1,
+	     "gout_g3d_aclk_acel_lh_async_si_g3d1", "dout_g3d_aclk_g3d",
+	     CLK_ENABLE_ACLK_G3D_BUS, 1, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_G3D_ACLK_ACEL_LH_ASYNC_SI_G3D0,
+	     "gout_g3d_aclk_acel_lh_async_si_g3d0", "dout_g3d_aclk_g3d",
+	     CLK_ENABLE_ACLK_G3D_BUS, 0, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_G3D_PCLK_SFW100_ACEL_G3D1,
+	     "gout_g3d_pclk_sfw100_acel_g3d1", "dout_g3d_pclk_g3d",
+	     CLK_ENABLE_PCLK_G3D, 9, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_G3D_PCLK_SFW100_ACEL_G3D0,
+	     "gout_g3d_pclk_sfw100_acel_g3d0", "dout_g3d_pclk_g3d",
+	     CLK_ENABLE_PCLK_G3D, 8, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_G3D_PCLK_HPM_G3D, "gout_g3d_pclk_hpm_g3d",
+	     "dout_g3d_pclk_g3d", CLK_ENABLE_PCLK_G3D, 7,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_G3D_PCLK_PPMU_G3D1, "gout_g3d_pclk_ppmu_g3d1",
+	     "dout_g3d_pclk_g3d", CLK_ENABLE_PCLK_G3D, 6,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_G3D_PCLK_PPMU_G3D0, "gout_g3d_pclk_ppmu_g3d0",
+	     "dout_g3d_pclk_g3d", CLK_ENABLE_PCLK_G3D, 5,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_G3D_PCLK_PMU_G3D, "gout_g3d_pclk_pmu_g3d",
+	     "dout_g3d_pclk_g3d", CLK_ENABLE_PCLK_G3D, 4,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_G3D_ACLK_ASYNCAPBS_G3D, "gout_g3d_aclk_asyncapbs_g3d",
+	     "dout_g3d_pclk_g3d", CLK_ENABLE_PCLK_G3D, 3, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_G3D_PCLK_SYSREG_G3D, "gout_g3d_pclk_sysreg_g3d",
+	     "dout_g3d_pclk_g3d", CLK_ENABLE_PCLK_G3D, 2, 0, 0),
+	GATE(CLK_GOUT_G3D_ACLK_AXI2APB_G3DP, "gout_g3d_aclk_axi2apb_g3dp",
+	     "dout_g3d_pclk_g3d", CLK_ENABLE_PCLK_G3D, 1, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_G3D_ACLK_AXI_LH_ASYNC_MI_G3DP,
+	     "gout_g3d_aclk_axi_lh_async_mi_g3dp", "dout_g3d_pclk_g3d",
+	     CLK_ENABLE_PCLK_G3D, 0, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_G3D_SCLK_HPM2_G3D, "gout_g3d_sclk_hpm2_g3d",
+	     "dout_g3d_sclk_hpm_g3d", CLK_ENABLE_SCLK_HPM_G3D, 2,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_G3D_SCLK_HPM1_G3D, "gout_g3d_sclk_hpm1_g3d",
+	     "dout_g3d_sclk_hpm_g3d", CLK_ENABLE_SCLK_HPM_G3D, 1,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_G3D_SCLK_HPM0_G3D, "gout_g3d_sclk_hpm0_g3d",
+	     "dout_g3d_sclk_hpm_g3d", CLK_ENABLE_SCLK_HPM_G3D, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_G3D_SCLK_AXI_LH_ASYNC_SI_G3DIRAM,
+	     "gout_g3d_sclk_axi_lh_async_si_g3diram", "dout_g3d_sclk_ate_g3d",
+	     CLK_ENABLE_SCLK_ATE_G3D, 1, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_G3D_SCLK_ASYNCAXI_G3D, "gout_g3d_sclk_asyncaxi_g3d",
+	     "dout_g3d_sclk_ate_g3d", CLK_ENABLE_SCLK_ATE_G3D, 0,
+	     CLK_IS_CRITICAL, 0),
+};
+
+static const struct samsung_cmu_info g3d_cmu_info __initconst = {
+	.mux_clks		= g3d_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(g3d_mux_clks),
+	.div_clks		= g3d_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(g3d_div_clks),
+	.gate_clks		= g3d_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(g3d_gate_clks),
+	.nr_clk_ids		= G3D_NR_CLK,
+	.clk_regs		= g3d_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(g3d_clk_regs),
+};
+
+/* ---- CMU_MIF0 ----------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_MIF0 (0x10850000) */
+#define MIF0_PLL_LOCK				0x0000
+#define MIF0_PLL_CON0				0x0100
+#define MIF0_PLL_CON1				0x0104
+#define MIF0_PLL_FREQ_DET			0x010C
+#define CLK_CON_MUX_MIF0_PLL			0x0200
+#define CLK_CON_MUX_BUS_PLL_USER_MIF0		0x0204
+#define CLK_CON_MUX_ACLK_MIF0_PLL		0x0208
+#define CLK_CON_MUX_PCLK_MIF0			0x0210
+#define CLK_CON_MUX_SCLK_HPM_MIF0		0x0214
+#define CLK_CON_MUX_PCLK_SMC_MIF0		0x0218
+#define CLK_CON_DIV_PCLK_MIF0			0x0400
+#define CLK_CON_DIV_PCLK_SMC_MIF0		0x0404
+#define CLK_CON_DIV_SCLK_HPM_MIF0		0x0408
+#define CLK_STAT_MUX_MIF0_PLL			0x0600
+#define CLK_STAT_MUX_BUS_PLL_USER_MIF0		0x0604
+#define CLK_STAT_MUX_ACLK_MIF0_PLL		0x0608
+#define CLK_STAT_MUX_PCLK_MIF0			0x0610
+#define CLK_STAT_MUX_SCLK_HPM_MIF0		0x0614
+#define CLK_STAT_MUX_PCLK_SMC_MIF0		0x0618
+#define CLK_ENABLE_ACLK_MIF0			0x0800
+#define CLK_ENABLE_PCLK_MIF0			0x0900
+#define CLK_ENABLE_ACLK_MIF0_SECURE_DREX_TZ	0x0904
+#define CLK_ENABLE_SCLK_HPM_MIF0		0x0A00
+#define CLK_ENABLE_SCLK_RCLK_DREX_MIF0		0x0A04
+#define CG_CTRL_VAL_PCLK_MIF0			0x0900
+#define CG_CTRL_VAL_SCLK_HPM_MIF0		0x0A00
+#define CG_CTRL_VAL_SCLK_RCLK_DREX0		0x0A04
+#define CG_CTRL_VAL_DDRPHY0			0x0A08
+#define CLKOUT_CMU_MIF0				0x0C00
+#define CLKOUT_CMU_MIF0_DIV_STAT		0x0C04
+#define CLK_ENABLE_PDN_MIF0			0x0E00
+#define MIF0_SFR_IGNORE_REQ_SYSCLK		0x0F28
+#define PSCDC_CTRL_MIF0				0x1000
+#define CLK_STOPCTRL_MIF0			0x1004
+#define CMU_MIF0_SPARE0				0x1100
+#define CMU_MIF0_SPARE1				0x1104
+#define CG_CTRL_MAN_PCLK_MIF0			0x1900
+#define CG_CTRL_MAN_SCLK_HPM_MIF0		0x1A00
+#define CG_CTRL_MAN_SCLK_RCLK_DREX0		0x1A04
+#define CG_CTRL_MAN_DDRPHY0			0x1A08
+#define CG_CTRL_STAT_PCLK_MIF0_0		0x1D00
+#define CG_CTRL_STAT_PCLK_MIF0_1		0x1D04
+#define CG_CTRL_STAT_SCLK_HPM_MIF0		0x1E00
+#define CG_CTRL_STAT_SCLK_RCLK_DREX0		0x1E04
+#define CG_CTRL_STAT_DDRPHY0			0x1E08
+#define QCH_CTRL_LH_AXI_P_MIF0			0x2000
+#define QCH_CTRL_PMU_MIF0			0x2004
+#define QCH_CTRL_SYSREG_MIF0			0x2008
+#define QCH_CTRL_CMU_MIF0			0x200C
+#define QCH_CTRL_SMC_MIF0			0x2010
+#define QSTATE_CTRL_PROMISE_MIF0		0x2400
+#define QSTATE_CTRL_RCLK_DREX0			0x2404
+
+static const unsigned long mif0_clk_regs[] __initconst = {
+	MIF0_PLL_LOCK,
+	MIF0_PLL_CON0,
+	MIF0_PLL_CON1,
+	MIF0_PLL_FREQ_DET,
+	CLK_CON_MUX_MIF0_PLL,
+	CLK_CON_MUX_BUS_PLL_USER_MIF0,
+	CLK_CON_MUX_ACLK_MIF0_PLL,
+	CLK_CON_MUX_PCLK_MIF0,
+	CLK_CON_MUX_SCLK_HPM_MIF0,
+	CLK_CON_MUX_PCLK_SMC_MIF0,
+	CLK_CON_DIV_PCLK_MIF0,
+	CLK_CON_DIV_PCLK_SMC_MIF0,
+	CLK_CON_DIV_SCLK_HPM_MIF0,
+	CLK_STAT_MUX_MIF0_PLL,
+	CLK_STAT_MUX_BUS_PLL_USER_MIF0,
+	CLK_STAT_MUX_ACLK_MIF0_PLL,
+	CLK_STAT_MUX_PCLK_MIF0,
+	CLK_STAT_MUX_SCLK_HPM_MIF0,
+	CLK_STAT_MUX_PCLK_SMC_MIF0,
+	CLK_ENABLE_ACLK_MIF0,
+	CLK_ENABLE_PCLK_MIF0,
+	CLK_ENABLE_ACLK_MIF0_SECURE_DREX_TZ,
+	CLK_ENABLE_SCLK_HPM_MIF0,
+	CLK_ENABLE_SCLK_RCLK_DREX_MIF0,
+	CG_CTRL_VAL_PCLK_MIF0,
+	CG_CTRL_VAL_SCLK_HPM_MIF0,
+	CG_CTRL_VAL_SCLK_RCLK_DREX0,
+	CG_CTRL_VAL_DDRPHY0,
+	CLKOUT_CMU_MIF0,
+	CLKOUT_CMU_MIF0_DIV_STAT,
+	CLK_ENABLE_PDN_MIF0,
+	MIF0_SFR_IGNORE_REQ_SYSCLK,
+	PSCDC_CTRL_MIF0,
+	CLK_STOPCTRL_MIF0,
+	CMU_MIF0_SPARE0,
+	CMU_MIF0_SPARE1,
+	CG_CTRL_MAN_PCLK_MIF0,
+	CG_CTRL_MAN_SCLK_HPM_MIF0,
+	CG_CTRL_MAN_SCLK_RCLK_DREX0,
+	CG_CTRL_MAN_DDRPHY0,
+	CG_CTRL_STAT_PCLK_MIF0_0,
+	CG_CTRL_STAT_PCLK_MIF0_1,
+	CG_CTRL_STAT_SCLK_HPM_MIF0,
+	CG_CTRL_STAT_SCLK_RCLK_DREX0,
+	CG_CTRL_STAT_DDRPHY0,
+	QCH_CTRL_LH_AXI_P_MIF0,
+	QCH_CTRL_PMU_MIF0,
+	QCH_CTRL_SYSREG_MIF0,
+	QCH_CTRL_CMU_MIF0,
+	QCH_CTRL_SMC_MIF0,
+	QSTATE_CTRL_PROMISE_MIF0,
+	QSTATE_CTRL_RCLK_DREX0,
+};
+
+static const struct samsung_pll_rate_table mif_pll_rates[] __initconst = {
+	PLL_1419X_RATE(26 * MHZ, 3588000000U, 207, 3, 0),
+	PLL_1419X_RATE(26 * MHZ, 3432000000U, 198, 3, 0),
+	PLL_1419X_RATE(26 * MHZ, 3078400000U, 296, 5, 0),
+	PLL_1419X_RATE(26 * MHZ, 2704000000U, 156, 3, 0),
+	PLL_1419X_RATE(26 * MHZ, 2288000000U, 132, 3, 0),
+	PLL_1419X_RATE(26 * MHZ, 2028000000U, 117, 3, 0),
+	PLL_1419X_RATE(26 * MHZ, 1690000000U, 195, 3, 1),
+	PLL_1419X_RATE(26 * MHZ, 1352000000U, 156, 3, 1),
+	PLL_1419X_RATE(26 * MHZ, 1092000000U, 126, 3, 1),
+	PLL_1419X_RATE(26 * MHZ, 841750000U, 259, 4, 2),
+	PLL_1419X_RATE(26 * MHZ, 572000000U, 132, 3, 2),
+	PLL_1419X_RATE(26 * MHZ, 416000000U, 192, 3, 3),
+};
+
+static const struct samsung_pll_clock mif0_pll_clks[] __initconst = {
+	PLL(pll_1419x, CLK_FOUT_MIF0_PLL, "fout_mif0_pll", "oscclk",
+	    MIF0_PLL_LOCK, MIF0_PLL_CON0, mif_pll_rates),
+};
+
+PNAME(mif0_mux_mif_pll_p)	= { "oscclk", "fout_mif0_pll" };
+PNAME(mif0_mux_bus_pll_user_p)	= { "oscclk", "gout_top_sclk_bus_pll_mif" };
+PNAME(mif0_mux_aclk_mif_pll_p)	= { "mout_mif0_mif_pll",
+				    "mout_mif0_bus_pll_user" };
+PNAME(mif0_mux_pclk_mif_p)	= { "mout_mif0_aclk_mif_pll",
+				    "mif0_ff_aclk_mif_pll_div2",
+				    "mif0_ff_aclk_mif_pll_div4" };
+PNAME(mif0_mux_sclk_hpm_mif_p)	= { "mout_mif0_aclk_mif_pll",
+				    "mif0_ff_aclk_mif_pll_div2",
+				    "mif0_ff_aclk_mif_pll_div4" };
+PNAME(mif0_mux_pclk_smc_p)	= { "mout_mif0_aclk_mif_pll",
+				    "mif0_ff_aclk_mif_pll_div2",
+				    "mif0_ff_aclk_mif_pll_div4",
+				    "u_dfi_clk_gen_mif0" };
+
+static const struct samsung_mux_clock mif0_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_MIF0_MIF_PLL, "mout_mif0_mif_pll", mif0_mux_mif_pll_p,
+	    CLK_CON_MUX_MIF0_PLL, 12, 1),
+	MUX(CLK_MOUT_MIF0_BUS_PLL_USER, "mout_mif0_bus_pll_user",
+	    mif0_mux_bus_pll_user_p, CLK_CON_MUX_BUS_PLL_USER_MIF0, 12, 1),
+	MUX(CLK_MOUT_MIF0_ACLK_MIF_PLL, "mout_mif0_aclk_mif_pll",
+	    mif0_mux_aclk_mif_pll_p, CLK_CON_MUX_ACLK_MIF0_PLL, 12, 1),
+	MUX(CLK_MOUT_MIF0_PCLK_MIF, "mout_mif0_pclk_mif", mif0_mux_pclk_mif_p,
+	    CLK_CON_MUX_PCLK_MIF0, 12, 2),
+	MUX(CLK_MOUT_MIF0_SCLK_HPM_MIF, "mout_mif0_sclk_hpm_mif",
+	    mif0_mux_sclk_hpm_mif_p, CLK_CON_MUX_SCLK_HPM_MIF0, 12, 2),
+	MUX(CLK_MOUT_MIF0_PCLK_SMC, "mout_mif0_pclk_smc", mif0_mux_pclk_smc_p,
+	    CLK_CON_MUX_PCLK_SMC_MIF0, 12, 2),
+};
+
+static const struct samsung_div_clock mif0_div_clks[] __initconst = {
+	DIV(CLK_DOUT_MIF0_PCLK_MIF, "dout_mif0_pclk_mif", "mout_mif0_pclk_mif",
+	    CLK_CON_DIV_PCLK_MIF0, 0, 3),
+	DIV(CLK_DOUT_MIF0_SCLK_HPM_MIF, "dout_mif0_sclk_hpm_mif",
+	    "mout_mif0_sclk_hpm_mif", CLK_CON_DIV_SCLK_HPM_MIF0, 0, 2),
+	DIV(CLK_DOUT_MIF0_PCLK_SMC, "dout_mif0_pclk_smc", "mout_mif0_pclk_smc",
+	    CLK_CON_DIV_PCLK_SMC_MIF0, 0, 3),
+};
+
+static const
+struct samsung_fixed_factor_clock mif0_fixed_factor_clks[] __initconst = {
+	FFACTOR(CLK_MIF0_FF_ACLK_MIF_PLL_DIV2,
+		"mif0_ff_aclk_mif_pll_div2", "mout_mif0_aclk_mif_pll",
+		1, 2, 0),
+	FFACTOR(CLK_MIF0_FF_ACLK_MIF_PLL_DIV4,
+		"mif0_ff_aclk_mif_pll_div4", "mout_mif0_aclk_mif_pll",
+		1, 4, 0),
+	FFACTOR(CLK_U_DFI_CLK_GEN_MIF0, "u_dfi_clk_gen_mif0",
+		"mout_mif0_aclk_mif_pll", 1, 4, 0),
+};
+
+static const struct samsung_gate_clock mif0_gate_clks[] __initconst = {
+	/* reading CLK_ENABLE_ACLK_MIF0 causes an abort */
+	GATE(CLK_GOUT_MIF0_PCLK_SMC1, "gout_mif0_pclk_smc1",
+	     "dout_mif0_pclk_mif", CLK_ENABLE_PCLK_MIF0, 9, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_MIF0_PCLK_DMC_MISC, "gout_mif0_pclk_dmc_misc",
+	     "dout_mif0_pclk_mif", CLK_ENABLE_PCLK_MIF0, 8, 0, 0),
+	GATE(CLK_GOUT_MIF0_PCLK_PPC_DEBUG, "gout_mif0_pclk_ppc_debug",
+	     "dout_mif0_pclk_mif", CLK_ENABLE_PCLK_MIF0, 7, 0, 0),
+	GATE(CLK_GOUT_MIF0_PCLK_PPC_DVFS, "gout_mif0_pclk_ppc_dvfs",
+	     "dout_mif0_pclk_mif", CLK_ENABLE_PCLK_MIF0, 6, 0, 0),
+	GATE(CLK_GOUT_MIF0_PCLK_SYSREG_MIF, "gout_mif0_pclk_sysreg_mif",
+	     "dout_mif0_pclk_mif", CLK_ENABLE_PCLK_MIF0, 5, 0, 0),
+	GATE(CLK_GOUT_MIF0_PCLK_HPM, "gout_mif0_pclk_hpm", "dout_mif0_pclk_mif",
+	     CLK_ENABLE_PCLK_MIF0, 4, 0, 0),
+	GATE(CLK_GOUT_MIF0_ACLK_AXI_ASYNC, "gout_mif0_aclk_axi_async",
+	     "dout_mif0_pclk_mif", CLK_ENABLE_PCLK_MIF0, 3, 0, 0),
+	GATE(CLK_GOUT_MIF0_PCLK_MIFP, "gout_mif0_pclk_mifp",
+	     "dout_mif0_pclk_mif", CLK_ENABLE_PCLK_MIF0, 2, 0, 0),
+	GATE(CLK_GOUT_MIF0_PCLK_PMU_MIF, "gout_mif0_pclk_pmu_mif",
+	     "dout_mif0_pclk_mif", CLK_ENABLE_PCLK_MIF0, 1, 0, 0),
+	GATE(CLK_GOUT_MIF0_PCLK_LPDDR4PHY, "gout_mif0_pclk_lpddr4phy",
+	     "dout_mif0_pclk_mif", CLK_ENABLE_PCLK_MIF0, 0, CLK_IS_CRITICAL, 0),
+	/* reading CLK_ENABLE_ACLK_MIF0_SECURE_DREX_TZ causes an abort */
+	GATE(CLK_GOUT_MIF0_SCLK_PROMISE, "gout_mif0_sclk_promise",
+	     "dout_mif0_sclk_hpm_mif", CLK_ENABLE_SCLK_HPM_MIF0, 0, 0, 0),
+	GATE(CLK_GOUT_MIF0_RCLK_DREX, "gout_mif0_rclk_drex", "oscclk",
+	     CLK_ENABLE_SCLK_RCLK_DREX_MIF0, 0, 0, 0),
+};
+
+static const struct samsung_cmu_info mif0_cmu_info __initconst = {
+	.pll_clks		= mif0_pll_clks,
+	.nr_pll_clks		= ARRAY_SIZE(mif0_pll_clks),
+	.mux_clks		= mif0_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(mif0_mux_clks),
+	.div_clks		= mif0_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(mif0_div_clks),
+	.gate_clks		= mif0_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(mif0_gate_clks),
+	.fixed_factor_clks	= mif0_fixed_factor_clks,
+	.nr_fixed_factor_clks	= ARRAY_SIZE(mif0_fixed_factor_clks),
+	.nr_clk_ids		= MIF0_NR_CLK,
+	.clk_regs		= mif0_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(mif0_clk_regs),
+};
+
+/* ---- CMU_MIF1 ----------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_MIF1 (0x10950000) */
+#define MIF1_PLL_LOCK				0x0000
+#define MIF1_PLL_CON0				0x0100
+#define MIF1_PLL_CON1				0x0104
+#define MIF1_PLL_FREQ_DET			0x010C
+#define CLK_CON_MUX_MIF1_PLL			0x0200
+#define CLK_CON_MUX_BUS_PLL_USER_MIF1		0x0204
+#define CLK_CON_MUX_ACLK_MIF1_PLL		0x0208
+#define CLK_CON_MUX_PCLK_MIF1			0x0210
+#define CLK_CON_MUX_SCLK_HPM_MIF1		0x0214
+#define CLK_CON_MUX_PCLK_SMC_MIF1		0x0218
+#define CLK_CON_DIV_PCLK_MIF1			0x0400
+#define CLK_CON_DIV_PCLK_SMC_MIF1		0x0404
+#define CLK_CON_DIV_SCLK_HPM_MIF1		0x0408
+#define CLK_STAT_MUX_MIF1_PLL			0x0600
+#define CLK_STAT_MUX_BUS_PLL_USER_MIF1		0x0604
+#define CLK_STAT_MUX_ACLK_MIF1_PLL		0x0608
+#define CLK_STAT_MUX_PCLK_MIF1			0x0610
+#define CLK_STAT_MUX_SCLK_HPM_MIF1		0x0614
+#define CLK_STAT_MUX_PCLK_SMC_MIF1		0x0618
+#define CLK_ENABLE_ACLK_MIF1			0x0800
+#define CLK_ENABLE_PCLK_MIF1			0x0900
+#define CLK_ENABLE_ACLK_MIF1_SECURE_DREX_TZ	0x0904
+#define CLK_ENABLE_SCLK_HPM_MIF1		0x0A00
+#define CLK_ENABLE_SCLK_RCLK_DREX_MIF1		0x0A04
+#define CG_CTRL_VAL_PCLK_MIF1			0x0900
+#define CG_CTRL_VAL_SCLK_HPM_MIF1		0x0A00
+#define CG_CTRL_VAL_SCLK_RCLK_DREX1		0x0A04
+#define CG_CTRL_VAL_DDRPHY1			0x0A08
+#define CLKOUT_CMU_MIF1				0x0C00
+#define CLKOUT_CMU_MIF1_DIV_STAT		0x0C04
+#define CLK_ENABLE_PDN_MIF1			0x0E00
+#define MIF1_SFR_IGNORE_REQ_SYSCLK		0x0F28
+#define PSCDC_CTRL_MIF1				0x1000
+#define CLK_STOPCTRL_MIF1			0x1004
+#define CMU_MIF1_SPARE0				0x1100
+#define CMU_MIF1_SPARE1				0x1104
+#define CG_CTRL_MAN_PCLK_MIF1			0x1900
+#define CG_CTRL_MAN_SCLK_HPM_MIF1		0x1A00
+#define CG_CTRL_MAN_SCLK_RCLK_DREX1		0x1A04
+#define CG_CTRL_MAN_DDRPHY1			0x1A08
+#define CG_CTRL_STAT_PCLK_MIF1_0		0x1D00
+#define CG_CTRL_STAT_PCLK_MIF1_1		0x1D04
+#define CG_CTRL_STAT_SCLK_HPM_MIF1		0x1E00
+#define CG_CTRL_STAT_SCLK_RCLK_DREX1		0x1E04
+#define CG_CTRL_STAT_DDRPHY1			0x1E08
+#define QCH_CTRL_LH_AXI_P_MIF1			0x2000
+#define QCH_CTRL_PMU_MIF1			0x2004
+#define QCH_CTRL_SYSREG_MIF1			0x2008
+#define QCH_CTRL_CMU_MIF1			0x200C
+#define QCH_CTRL_SMC_MIF1			0x2010
+#define QSTATE_CTRL_PROMISE_MIF1		0x2400
+#define QSTATE_CTRL_RCLK_DREX1			0x2404
+
+static const unsigned long mif1_clk_regs[] __initconst = {
+	MIF1_PLL_LOCK,
+	MIF1_PLL_CON0,
+	MIF1_PLL_CON1,
+	MIF1_PLL_FREQ_DET,
+	CLK_CON_MUX_MIF1_PLL,
+	CLK_CON_MUX_BUS_PLL_USER_MIF1,
+	CLK_CON_MUX_ACLK_MIF1_PLL,
+	CLK_CON_MUX_PCLK_MIF1,
+	CLK_CON_MUX_SCLK_HPM_MIF1,
+	CLK_CON_MUX_PCLK_SMC_MIF1,
+	CLK_CON_DIV_PCLK_MIF1,
+	CLK_CON_DIV_PCLK_SMC_MIF1,
+	CLK_CON_DIV_SCLK_HPM_MIF1,
+	CLK_STAT_MUX_MIF1_PLL,
+	CLK_STAT_MUX_BUS_PLL_USER_MIF1,
+	CLK_STAT_MUX_ACLK_MIF1_PLL,
+	CLK_STAT_MUX_PCLK_MIF1,
+	CLK_STAT_MUX_SCLK_HPM_MIF1,
+	CLK_STAT_MUX_PCLK_SMC_MIF1,
+	CLK_ENABLE_ACLK_MIF1,
+	CLK_ENABLE_PCLK_MIF1,
+	CLK_ENABLE_ACLK_MIF1_SECURE_DREX_TZ,
+	CLK_ENABLE_SCLK_HPM_MIF1,
+	CLK_ENABLE_SCLK_RCLK_DREX_MIF1,
+	CG_CTRL_VAL_PCLK_MIF1,
+	CG_CTRL_VAL_SCLK_HPM_MIF1,
+	CG_CTRL_VAL_SCLK_RCLK_DREX1,
+	CG_CTRL_VAL_DDRPHY1,
+	CLKOUT_CMU_MIF1,
+	CLKOUT_CMU_MIF1_DIV_STAT,
+	CLK_ENABLE_PDN_MIF1,
+	MIF1_SFR_IGNORE_REQ_SYSCLK,
+	PSCDC_CTRL_MIF1,
+	CLK_STOPCTRL_MIF1,
+	CMU_MIF1_SPARE0,
+	CMU_MIF1_SPARE1,
+	CG_CTRL_MAN_PCLK_MIF1,
+	CG_CTRL_MAN_SCLK_HPM_MIF1,
+	CG_CTRL_MAN_SCLK_RCLK_DREX1,
+	CG_CTRL_MAN_DDRPHY1,
+	CG_CTRL_STAT_PCLK_MIF1_0,
+	CG_CTRL_STAT_PCLK_MIF1_1,
+	CG_CTRL_STAT_SCLK_HPM_MIF1,
+	CG_CTRL_STAT_SCLK_RCLK_DREX1,
+	CG_CTRL_STAT_DDRPHY1,
+	QCH_CTRL_LH_AXI_P_MIF1,
+	QCH_CTRL_PMU_MIF1,
+	QCH_CTRL_SYSREG_MIF1,
+	QCH_CTRL_CMU_MIF1,
+	QCH_CTRL_SMC_MIF1,
+	QSTATE_CTRL_PROMISE_MIF1,
+	QSTATE_CTRL_RCLK_DREX1,
+};
+
+static const struct samsung_pll_clock mif1_pll_clks[] __initconst = {
+	PLL(pll_1419x, CLK_FOUT_MIF1_PLL, "fout_mif1_pll", "oscclk",
+	    MIF1_PLL_LOCK, MIF1_PLL_CON0, mif_pll_rates),
+};
+
+PNAME(mif1_mux_mif_pll_p)	= { "oscclk", "fout_mif1_pll" };
+PNAME(mif1_mux_bus_pll_user_p)	= { "oscclk", "gout_top_sclk_bus_pll_mif" };
+PNAME(mif1_mux_aclk_mif_pll_p)	= { "mout_mif1_mif_pll",
+				    "mout_mif1_bus_pll_user" };
+PNAME(mif1_mux_pclk_mif_p)	= { "mout_mif1_aclk_mif_pll",
+				    "mif1_ff_aclk_mif_pll_div2",
+				    "mif1_ff_aclk_mif_pll_div4" };
+PNAME(mif1_mux_sclk_hpm_mif_p)	= { "mout_mif1_aclk_mif_pll",
+				    "mif1_ff_aclk_mif_pll_div2",
+				    "mif1_ff_aclk_mif_pll_div4" };
+PNAME(mif1_mux_pclk_smc_p)	= { "mout_mif1_aclk_mif_pll",
+				    "mif1_ff_aclk_mif_pll_div2",
+				    "mif1_ff_aclk_mif_pll_div4",
+				    "u_dfi_clk_gen_mif1" };
+
+static const struct samsung_mux_clock mif1_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_MIF1_MIF_PLL, "mout_mif1_mif_pll", mif1_mux_mif_pll_p,
+	    CLK_CON_MUX_MIF1_PLL, 12, 1),
+	MUX(CLK_MOUT_MIF1_BUS_PLL_USER, "mout_mif1_bus_pll_user",
+	    mif1_mux_bus_pll_user_p, CLK_CON_MUX_BUS_PLL_USER_MIF1, 12, 1),
+	MUX(CLK_MOUT_MIF1_ACLK_MIF_PLL, "mout_mif1_aclk_mif_pll",
+	    mif1_mux_aclk_mif_pll_p, CLK_CON_MUX_ACLK_MIF1_PLL, 12, 1),
+	MUX(CLK_MOUT_MIF1_PCLK_MIF, "mout_mif1_pclk_mif", mif1_mux_pclk_mif_p,
+	    CLK_CON_MUX_PCLK_MIF1, 12, 2),
+	MUX(CLK_MOUT_MIF1_SCLK_HPM_MIF, "mout_mif1_sclk_hpm_mif",
+	    mif1_mux_sclk_hpm_mif_p, CLK_CON_MUX_SCLK_HPM_MIF1, 12, 2),
+	MUX(CLK_MOUT_MIF1_PCLK_SMC, "mout_mif1_pclk_smc", mif1_mux_pclk_smc_p,
+	    CLK_CON_MUX_PCLK_SMC_MIF1, 12, 2),
+};
+
+static const struct samsung_div_clock mif1_div_clks[] __initconst = {
+	DIV(CLK_DOUT_MIF1_PCLK_MIF, "dout_mif1_pclk_mif", "mout_mif1_pclk_mif",
+	    CLK_CON_DIV_PCLK_MIF1, 0, 3),
+	DIV(CLK_DOUT_MIF1_SCLK_HPM_MIF, "dout_mif1_sclk_hpm_mif",
+	    "mout_mif1_sclk_hpm_mif", CLK_CON_DIV_SCLK_HPM_MIF1, 0, 2),
+	DIV(CLK_DOUT_MIF1_PCLK_SMC, "dout_mif1_pclk_smc", "mout_mif1_pclk_smc",
+	    CLK_CON_DIV_PCLK_SMC_MIF1, 0, 3),
+};
+
+static const
+struct samsung_fixed_factor_clock mif1_fixed_factor_clks[] __initconst = {
+	FFACTOR(CLK_MIF1_FF_ACLK_MIF_PLL_DIV2,
+		"mif1_ff_aclk_mif_pll_div2", "mout_mif1_aclk_mif_pll",
+		1, 2, 0),
+	FFACTOR(CLK_MIF1_FF_ACLK_MIF_PLL_DIV4,
+		"mif1_ff_aclk_mif_pll_div4", "mout_mif1_aclk_mif_pll",
+		1, 4, 0),
+	FFACTOR(CLK_U_DFI_CLK_GEN_MIF1, "u_dfi_clk_gen_mif1",
+		"mout_mif1_aclk_mif_pll", 1, 4, 0),
+};
+
+static const struct samsung_gate_clock mif1_gate_clks[] __initconst = {
+	/* reading CLK_ENABLE_ACLK_MIF1 causes an abort */
+	GATE(CLK_GOUT_MIF1_PCLK_SMC1, "gout_mif1_pclk_smc1",
+	     "dout_mif1_pclk_mif", CLK_ENABLE_PCLK_MIF1, 9, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_MIF1_PCLK_DMC_MISC, "gout_mif1_pclk_dmc_misc",
+	     "dout_mif1_pclk_mif", CLK_ENABLE_PCLK_MIF1, 8, 0, 0),
+	GATE(CLK_GOUT_MIF1_PCLK_PPC_DEBUG, "gout_mif1_pclk_ppc_debug",
+	     "dout_mif1_pclk_mif", CLK_ENABLE_PCLK_MIF1, 7, 0, 0),
+	GATE(CLK_GOUT_MIF1_PCLK_PPC_DVFS, "gout_mif1_pclk_ppc_dvfs",
+	     "dout_mif1_pclk_mif", CLK_ENABLE_PCLK_MIF1, 6, 0, 0),
+	GATE(CLK_GOUT_MIF1_PCLK_SYSREG_MIF, "gout_mif1_pclk_sysreg_mif",
+	     "dout_mif1_pclk_mif", CLK_ENABLE_PCLK_MIF1, 5, 0, 0),
+	GATE(CLK_GOUT_MIF1_PCLK_HPM, "gout_mif1_pclk_hpm", "dout_mif1_pclk_mif",
+	     CLK_ENABLE_PCLK_MIF1, 4, 0, 0),
+	GATE(CLK_GOUT_MIF1_ACLK_AXI_ASYNC, "gout_mif1_aclk_axi_async",
+	     "dout_mif1_pclk_mif", CLK_ENABLE_PCLK_MIF1, 3, 0, 0),
+	GATE(CLK_GOUT_MIF1_PCLK_MIFP, "gout_mif1_pclk_mifp",
+	     "dout_mif1_pclk_mif", CLK_ENABLE_PCLK_MIF1, 2, 0, 0),
+	GATE(CLK_GOUT_MIF1_PCLK_PMU_MIF, "gout_mif1_pclk_pmu_mif",
+	     "dout_mif1_pclk_mif", CLK_ENABLE_PCLK_MIF1, 1, 0, 0),
+	GATE(CLK_GOUT_MIF1_PCLK_LPDDR4PHY, "gout_mif1_pclk_lpddr4phy",
+	     "dout_mif1_pclk_mif", CLK_ENABLE_PCLK_MIF1, 0, CLK_IS_CRITICAL, 0),
+	/* reading CLK_ENABLE_ACLK_MIF1_SECURE_DREX_TZ causes an abort */
+	GATE(CLK_GOUT_MIF1_SCLK_PROMISE, "gout_mif1_sclk_promise",
+	     "dout_mif1_sclk_hpm_mif", CLK_ENABLE_SCLK_HPM_MIF1, 0, 0, 0),
+	GATE(CLK_GOUT_MIF1_RCLK_DREX, "gout_mif1_rclk_drex", "oscclk",
+	     CLK_ENABLE_SCLK_RCLK_DREX_MIF1, 0, 0, 0),
+};
+
+static const struct samsung_cmu_info mif1_cmu_info __initconst = {
+	.pll_clks		= mif1_pll_clks,
+	.nr_pll_clks		= ARRAY_SIZE(mif1_pll_clks),
+	.mux_clks		= mif1_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(mif1_mux_clks),
+	.div_clks		= mif1_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(mif1_div_clks),
+	.gate_clks		= mif1_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(mif1_gate_clks),
+	.fixed_factor_clks	= mif1_fixed_factor_clks,
+	.nr_fixed_factor_clks	= ARRAY_SIZE(mif1_fixed_factor_clks),
+	.nr_clk_ids		= MIF1_NR_CLK,
+	.clk_regs		= mif1_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(mif1_clk_regs),
+};
+
+/* ---- CMU_MIF2 ----------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_MIF2 (0x10A50000) */
+#define MIF2_PLL_LOCK				0x0000
+#define MIF2_PLL_CON0				0x0100
+#define MIF2_PLL_CON1				0x0104
+#define MIF2_PLL_FREQ_DET			0x010C
+#define CLK_CON_MUX_MIF2_PLL			0x0200
+#define CLK_CON_MUX_BUS_PLL_USER_MIF2		0x0204
+#define CLK_CON_MUX_ACLK_MIF2_PLL		0x0208
+#define CLK_CON_MUX_PCLK_MIF2			0x0210
+#define CLK_CON_MUX_SCLK_HPM_MIF2		0x0214
+#define CLK_CON_MUX_PCLK_SMC_MIF2		0x0218
+#define CLK_CON_DIV_PCLK_MIF2			0x0400
+#define CLK_CON_DIV_PCLK_SMC_MIF2		0x0404
+#define CLK_CON_DIV_SCLK_HPM_MIF2		0x0408
+#define CLK_STAT_MUX_MIF2_PLL			0x0600
+#define CLK_STAT_MUX_BUS_PLL_USER_MIF2		0x0604
+#define CLK_STAT_MUX_ACLK_MIF2_PLL		0x0608
+#define CLK_STAT_MUX_PCLK_MIF2			0x0610
+#define CLK_STAT_MUX_SCLK_HPM_MIF2		0x0614
+#define CLK_STAT_MUX_PCLK_SMC_MIF2		0x0618
+#define CLK_ENABLE_ACLK_MIF2			0x0800
+#define CLK_ENABLE_PCLK_MIF2			0x0900
+#define CLK_ENABLE_ACLK_MIF2_SECURE_DREX_TZ	0x0904
+#define CLK_ENABLE_SCLK_HPM_MIF2		0x0A00
+#define CLK_ENABLE_SCLK_RCLK_DREX_MIF2		0x0A04
+#define CG_CTRL_VAL_PCLK_MIF2			0x0900
+#define CG_CTRL_VAL_SCLK_HPM_MIF2		0x0A00
+#define CG_CTRL_VAL_SCLK_RCLK_DREX2		0x0A04
+#define CG_CTRL_VAL_DDRPHY2			0x0A08
+#define CLKOUT_CMU_MIF2				0x0C00
+#define CLKOUT_CMU_MIF2_DIV_STAT		0x0C04
+#define CLK_ENABLE_PDN_MIF2			0x0E00
+#define MIF2_SFR_IGNORE_REQ_SYSCLK		0x0F28
+#define PSCDC_CTRL_MIF2				0x1000
+#define CLK_STOPCTRL_MIF2			0x1004
+#define CMU_MIF2_SPARE0				0x1100
+#define CMU_MIF2_SPARE1				0x1104
+#define CG_CTRL_MAN_PCLK_MIF2			0x1900
+#define CG_CTRL_MAN_SCLK_HPM_MIF2		0x1A00
+#define CG_CTRL_MAN_SCLK_RCLK_DREX2		0x1A04
+#define CG_CTRL_MAN_DDRPHY2			0x1A08
+#define CG_CTRL_STAT_PCLK_MIF2_0		0x1D00
+#define CG_CTRL_STAT_PCLK_MIF2_1		0x1D04
+#define CG_CTRL_STAT_SCLK_HPM_MIF2		0x1E00
+#define CG_CTRL_STAT_SCLK_RCLK_DREX2		0x1E04
+#define CG_CTRL_STAT_DDRPHY2			0x1E08
+#define QCH_CTRL_LH_AXI_P_MIF2			0x2000
+#define QCH_CTRL_PMU_MIF2			0x2004
+#define QCH_CTRL_SYSREG_MIF2			0x2008
+#define QCH_CTRL_CMU_MIF2			0x200C
+#define QCH_CTRL_SMC_MIF2			0x2010
+#define QSTATE_CTRL_PROMISE_MIF2		0x2400
+#define QSTATE_CTRL_RCLK_DREX2			0x2404
+
+static const unsigned long mif2_clk_regs[] __initconst = {
+	MIF2_PLL_LOCK,
+	MIF2_PLL_CON0,
+	MIF2_PLL_CON1,
+	MIF2_PLL_FREQ_DET,
+	CLK_CON_MUX_MIF2_PLL,
+	CLK_CON_MUX_BUS_PLL_USER_MIF2,
+	CLK_CON_MUX_ACLK_MIF2_PLL,
+	CLK_CON_MUX_PCLK_MIF2,
+	CLK_CON_MUX_SCLK_HPM_MIF2,
+	CLK_CON_MUX_PCLK_SMC_MIF2,
+	CLK_CON_DIV_PCLK_MIF2,
+	CLK_CON_DIV_PCLK_SMC_MIF2,
+	CLK_CON_DIV_SCLK_HPM_MIF2,
+	CLK_STAT_MUX_MIF2_PLL,
+	CLK_STAT_MUX_BUS_PLL_USER_MIF2,
+	CLK_STAT_MUX_ACLK_MIF2_PLL,
+	CLK_STAT_MUX_PCLK_MIF2,
+	CLK_STAT_MUX_SCLK_HPM_MIF2,
+	CLK_STAT_MUX_PCLK_SMC_MIF2,
+	CLK_ENABLE_ACLK_MIF2,
+	CLK_ENABLE_PCLK_MIF2,
+	CLK_ENABLE_ACLK_MIF2_SECURE_DREX_TZ,
+	CLK_ENABLE_SCLK_HPM_MIF2,
+	CLK_ENABLE_SCLK_RCLK_DREX_MIF2,
+	CG_CTRL_VAL_PCLK_MIF2,
+	CG_CTRL_VAL_SCLK_HPM_MIF2,
+	CG_CTRL_VAL_SCLK_RCLK_DREX2,
+	CG_CTRL_VAL_DDRPHY2,
+	CLKOUT_CMU_MIF2,
+	CLKOUT_CMU_MIF2_DIV_STAT,
+	CLK_ENABLE_PDN_MIF2,
+	MIF2_SFR_IGNORE_REQ_SYSCLK,
+	PSCDC_CTRL_MIF2,
+	CLK_STOPCTRL_MIF2,
+	CMU_MIF2_SPARE0,
+	CMU_MIF2_SPARE1,
+	CG_CTRL_MAN_PCLK_MIF2,
+	CG_CTRL_MAN_SCLK_HPM_MIF2,
+	CG_CTRL_MAN_SCLK_RCLK_DREX2,
+	CG_CTRL_MAN_DDRPHY2,
+	CG_CTRL_STAT_PCLK_MIF2_0,
+	CG_CTRL_STAT_PCLK_MIF2_1,
+	CG_CTRL_STAT_SCLK_HPM_MIF2,
+	CG_CTRL_STAT_SCLK_RCLK_DREX2,
+	CG_CTRL_STAT_DDRPHY2,
+	QCH_CTRL_LH_AXI_P_MIF2,
+	QCH_CTRL_PMU_MIF2,
+	QCH_CTRL_SYSREG_MIF2,
+	QCH_CTRL_CMU_MIF2,
+	QCH_CTRL_SMC_MIF2,
+	QSTATE_CTRL_PROMISE_MIF2,
+	QSTATE_CTRL_RCLK_DREX2,
+};
+
+static const struct samsung_pll_clock mif2_pll_clks[] __initconst = {
+	PLL(pll_1419x, CLK_FOUT_MIF2_PLL, "fout_mif2_pll", "oscclk",
+	    MIF2_PLL_LOCK, MIF2_PLL_CON0, mif_pll_rates),
+};
+
+PNAME(mif2_mux_mif_pll_p)	= { "oscclk", "fout_mif2_pll" };
+PNAME(mif2_mux_bus_pll_user_p)	= { "oscclk", "gout_top_sclk_bus_pll_mif" };
+PNAME(mif2_mux_aclk_mif_pll_p)	= { "mout_mif2_mif_pll",
+				    "mout_mif2_bus_pll_user" };
+PNAME(mif2_mux_pclk_mif_p)	= { "mout_mif2_aclk_mif_pll",
+				    "mif2_ff_aclk_mif_pll_div2",
+				    "mif2_ff_aclk_mif_pll_div4" };
+PNAME(mif2_mux_sclk_hpm_mif_p)	= { "mout_mif2_aclk_mif_pll",
+				    "mif2_ff_aclk_mif_pll_div2",
+				    "mif2_ff_aclk_mif_pll_div4" };
+PNAME(mif2_mux_pclk_smc_p)	= { "mout_mif2_aclk_mif_pll",
+				    "mif2_ff_aclk_mif_pll_div2",
+				    "mif2_ff_aclk_mif_pll_div4",
+				    "u_dfi_clk_gen_mif2" };
+
+static const struct samsung_mux_clock mif2_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_MIF2_MIF_PLL, "mout_mif2_mif_pll", mif2_mux_mif_pll_p,
+	    CLK_CON_MUX_MIF2_PLL, 12, 1),
+	MUX(CLK_MOUT_MIF2_BUS_PLL_USER, "mout_mif2_bus_pll_user",
+	    mif2_mux_bus_pll_user_p, CLK_CON_MUX_BUS_PLL_USER_MIF2, 12, 1),
+	MUX(CLK_MOUT_MIF2_ACLK_MIF_PLL, "mout_mif2_aclk_mif_pll",
+	    mif2_mux_aclk_mif_pll_p, CLK_CON_MUX_ACLK_MIF2_PLL, 12, 1),
+	MUX(CLK_MOUT_MIF2_PCLK_MIF, "mout_mif2_pclk_mif", mif2_mux_pclk_mif_p,
+	    CLK_CON_MUX_PCLK_MIF2, 12, 2),
+	MUX(CLK_MOUT_MIF2_SCLK_HPM_MIF, "mout_mif2_sclk_hpm_mif",
+	    mif2_mux_sclk_hpm_mif_p, CLK_CON_MUX_SCLK_HPM_MIF2, 12, 2),
+	MUX(CLK_MOUT_MIF2_PCLK_SMC, "mout_mif2_pclk_smc", mif2_mux_pclk_smc_p,
+	    CLK_CON_MUX_PCLK_SMC_MIF2, 12, 2),
+};
+
+static const struct samsung_div_clock mif2_div_clks[] __initconst = {
+	DIV(CLK_DOUT_MIF2_PCLK_MIF, "dout_mif2_pclk_mif", "mout_mif2_pclk_mif",
+	    CLK_CON_DIV_PCLK_MIF2, 0, 3),
+	DIV(CLK_DOUT_MIF2_SCLK_HPM_MIF, "dout_mif2_sclk_hpm_mif",
+	    "mout_mif2_sclk_hpm_mif", CLK_CON_DIV_SCLK_HPM_MIF2, 0, 2),
+	DIV(CLK_DOUT_MIF2_PCLK_SMC, "dout_mif2_pclk_smc", "mout_mif2_pclk_smc",
+	    CLK_CON_DIV_PCLK_SMC_MIF2, 0, 3),
+};
+
+static const
+struct samsung_fixed_factor_clock mif2_fixed_factor_clks[] __initconst = {
+	FFACTOR(CLK_MIF2_FF_ACLK_MIF_PLL_DIV2,
+		"mif2_ff_aclk_mif_pll_div2", "mout_mif2_aclk_mif_pll",
+		1, 2, 0),
+	FFACTOR(CLK_MIF2_FF_ACLK_MIF_PLL_DIV4,
+		"mif2_ff_aclk_mif_pll_div4", "mout_mif2_aclk_mif_pll",
+		1, 4, 0),
+	FFACTOR(CLK_U_DFI_CLK_GEN_MIF2, "u_dfi_clk_gen_mif2",
+		"mout_mif2_aclk_mif_pll", 1, 4, 0),
+};
+
+static const struct samsung_gate_clock mif2_gate_clks[] __initconst = {
+	/* reading CLK_ENABLE_ACLK_MIF2 causes an abort */
+	GATE(CLK_GOUT_MIF2_PCLK_SMC1, "gout_mif2_pclk_smc1",
+	     "dout_mif2_pclk_mif", CLK_ENABLE_PCLK_MIF2, 9, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_MIF2_PCLK_DMC_MISC, "gout_mif2_pclk_dmc_misc",
+	     "dout_mif2_pclk_mif", CLK_ENABLE_PCLK_MIF2, 8, 0, 0),
+	GATE(CLK_GOUT_MIF2_PCLK_PPC_DEBUG, "gout_mif2_pclk_ppc_debug",
+	     "dout_mif2_pclk_mif", CLK_ENABLE_PCLK_MIF2, 7, 0, 0),
+	GATE(CLK_GOUT_MIF2_PCLK_PPC_DVFS, "gout_mif2_pclk_ppc_dvfs",
+	     "dout_mif2_pclk_mif", CLK_ENABLE_PCLK_MIF2, 6, 0, 0),
+	GATE(CLK_GOUT_MIF2_PCLK_SYSREG_MIF, "gout_mif2_pclk_sysreg_mif",
+	     "dout_mif2_pclk_mif", CLK_ENABLE_PCLK_MIF2, 5, 0, 0),
+	GATE(CLK_GOUT_MIF2_PCLK_HPM, "gout_mif2_pclk_hpm", "dout_mif2_pclk_mif",
+	     CLK_ENABLE_PCLK_MIF2, 4, 0, 0),
+	GATE(CLK_GOUT_MIF2_ACLK_AXI_ASYNC, "gout_mif2_aclk_axi_async",
+	     "dout_mif2_pclk_mif", CLK_ENABLE_PCLK_MIF2, 3, 0, 0),
+	GATE(CLK_GOUT_MIF2_PCLK_MIFP, "gout_mif2_pclk_mifp",
+	     "dout_mif2_pclk_mif", CLK_ENABLE_PCLK_MIF2, 2, 0, 0),
+	GATE(CLK_GOUT_MIF2_PCLK_PMU_MIF, "gout_mif2_pclk_pmu_mif",
+	     "dout_mif2_pclk_mif", CLK_ENABLE_PCLK_MIF2, 1, 0, 0),
+	GATE(CLK_GOUT_MIF2_PCLK_LPDDR4PHY, "gout_mif2_pclk_lpddr4phy",
+	     "dout_mif2_pclk_mif", CLK_ENABLE_PCLK_MIF2, 0, CLK_IS_CRITICAL, 0),
+	/* reading CLK_ENABLE_ACLK_MIF2_SECURE_DREX_TZ causes an abort */
+	GATE(CLK_GOUT_MIF2_SCLK_PROMISE, "gout_mif2_sclk_promise",
+	     "dout_mif2_sclk_hpm_mif", CLK_ENABLE_SCLK_HPM_MIF2, 0, 0, 0),
+	GATE(CLK_GOUT_MIF2_RCLK_DREX, "gout_mif2_rclk_drex", "oscclk",
+	     CLK_ENABLE_SCLK_RCLK_DREX_MIF2, 0, 0, 0),
+};
+
+static const struct samsung_cmu_info mif2_cmu_info __initconst = {
+	.pll_clks		= mif2_pll_clks,
+	.nr_pll_clks		= ARRAY_SIZE(mif2_pll_clks),
+	.mux_clks		= mif2_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(mif2_mux_clks),
+	.div_clks		= mif2_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(mif2_div_clks),
+	.gate_clks		= mif2_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(mif2_gate_clks),
+	.fixed_factor_clks	= mif2_fixed_factor_clks,
+	.nr_fixed_factor_clks	= ARRAY_SIZE(mif2_fixed_factor_clks),
+	.nr_clk_ids		= MIF2_NR_CLK,
+	.clk_regs		= mif2_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(mif2_clk_regs),
+};
+
+/* ---- CMU_MIF3 ----------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_MIF3 (0x10B50000) */
+#define MIF3_PLL_LOCK				0x0000
+#define MIF3_PLL_CON0				0x0100
+#define MIF3_PLL_CON1				0x0104
+#define MIF3_PLL_FREQ_DET			0x010C
+#define CLK_CON_MUX_MIF3_PLL			0x0200
+#define CLK_CON_MUX_BUS_PLL_USER_MIF3		0x0204
+#define CLK_CON_MUX_ACLK_MIF3_PLL		0x0208
+#define CLK_CON_MUX_PCLK_MIF3			0x0210
+#define CLK_CON_MUX_SCLK_HPM_MIF3		0x0214
+#define CLK_CON_MUX_PCLK_SMC_MIF3		0x0218
+#define CLK_CON_DIV_PCLK_MIF3			0x0400
+#define CLK_CON_DIV_PCLK_SMC_MIF3		0x0404
+#define CLK_CON_DIV_SCLK_HPM_MIF3		0x0408
+#define CLK_STAT_MUX_MIF3_PLL			0x0600
+#define CLK_STAT_MUX_BUS_PLL_USER_MIF3		0x0604
+#define CLK_STAT_MUX_ACLK_MIF3_PLL		0x0608
+#define CLK_STAT_MUX_PCLK_MIF3			0x0610
+#define CLK_STAT_MUX_SCLK_HPM_MIF3		0x0614
+#define CLK_STAT_MUX_PCLK_SMC_MIF3		0x0618
+#define CLK_ENABLE_ACLK_MIF3			0x0800
+#define CLK_ENABLE_PCLK_MIF3			0x0900
+#define CLK_ENABLE_ACLK_MIF3_SECURE_DREX_TZ	0x0904
+#define CLK_ENABLE_SCLK_HPM_MIF3		0x0A00
+#define CLK_ENABLE_SCLK_RCLK_DREX_MIF3		0x0A04
+#define CG_CTRL_VAL_PCLK_MIF3			0x0900
+#define CG_CTRL_VAL_SCLK_HPM_MIF3		0x0A00
+#define CG_CTRL_VAL_SCLK_RCLK_DREX3		0x0A04
+#define CG_CTRL_VAL_DDRPHY3			0x0A08
+#define CLKOUT_CMU_MIF3				0x0C00
+#define CLKOUT_CMU_MIF3_DIV_STAT		0x0C04
+#define CLK_ENABLE_PDN_MIF3			0x0E00
+#define MIF3_SFR_IGNORE_REQ_SYSCLK		0x0F28
+#define PSCDC_CTRL_MIF3				0x1000
+#define CLK_STOPCTRL_MIF3			0x1004
+#define CMU_MIF3_SPARE0				0x1100
+#define CMU_MIF3_SPARE1				0x1104
+#define CG_CTRL_MAN_PCLK_MIF3			0x1900
+#define CG_CTRL_MAN_SCLK_HPM_MIF3		0x1A00
+#define CG_CTRL_MAN_SCLK_RCLK_DREX3		0x1A04
+#define CG_CTRL_MAN_DDRPHY3			0x1A08
+#define CG_CTRL_STAT_PCLK_MIF3_0		0x1D00
+#define CG_CTRL_STAT_PCLK_MIF3_1		0x1D04
+#define CG_CTRL_STAT_SCLK_HPM_MIF3		0x1E00
+#define CG_CTRL_STAT_SCLK_RCLK_DREX3		0x1E04
+#define CG_CTRL_STAT_DDRPHY3			0x1E08
+#define QCH_CTRL_LH_AXI_P_MIF3			0x2000
+#define QCH_CTRL_PMU_MIF3			0x2004
+#define QCH_CTRL_SYSREG_MIF3			0x2008
+#define QCH_CTRL_CMU_MIF3			0x200C
+#define QCH_CTRL_SMC_MIF3			0x2010
+#define QSTATE_CTRL_PROMISE_MIF3		0x2400
+#define QSTATE_CTRL_RCLK_DREX3			0x2404
+
+static const unsigned long mif3_clk_regs[] __initconst = {
+	MIF3_PLL_LOCK,
+	MIF3_PLL_CON0,
+	MIF3_PLL_CON1,
+	MIF3_PLL_FREQ_DET,
+	CLK_CON_MUX_MIF3_PLL,
+	CLK_CON_MUX_BUS_PLL_USER_MIF3,
+	CLK_CON_MUX_ACLK_MIF3_PLL,
+	CLK_CON_MUX_PCLK_MIF3,
+	CLK_CON_MUX_SCLK_HPM_MIF3,
+	CLK_CON_MUX_PCLK_SMC_MIF3,
+	CLK_CON_DIV_PCLK_MIF3,
+	CLK_CON_DIV_PCLK_SMC_MIF3,
+	CLK_CON_DIV_SCLK_HPM_MIF3,
+	CLK_STAT_MUX_MIF3_PLL,
+	CLK_STAT_MUX_BUS_PLL_USER_MIF3,
+	CLK_STAT_MUX_ACLK_MIF3_PLL,
+	CLK_STAT_MUX_PCLK_MIF3,
+	CLK_STAT_MUX_SCLK_HPM_MIF3,
+	CLK_STAT_MUX_PCLK_SMC_MIF3,
+	CLK_ENABLE_ACLK_MIF3,
+	CLK_ENABLE_PCLK_MIF3,
+	CLK_ENABLE_ACLK_MIF3_SECURE_DREX_TZ,
+	CLK_ENABLE_SCLK_HPM_MIF3,
+	CLK_ENABLE_SCLK_RCLK_DREX_MIF3,
+	CG_CTRL_VAL_PCLK_MIF3,
+	CG_CTRL_VAL_SCLK_HPM_MIF3,
+	CG_CTRL_VAL_SCLK_RCLK_DREX3,
+	CG_CTRL_VAL_DDRPHY3,
+	CLKOUT_CMU_MIF3,
+	CLKOUT_CMU_MIF3_DIV_STAT,
+	CLK_ENABLE_PDN_MIF3,
+	MIF3_SFR_IGNORE_REQ_SYSCLK,
+	PSCDC_CTRL_MIF3,
+	CLK_STOPCTRL_MIF3,
+	CMU_MIF3_SPARE0,
+	CMU_MIF3_SPARE1,
+	CG_CTRL_MAN_PCLK_MIF3,
+	CG_CTRL_MAN_SCLK_HPM_MIF3,
+	CG_CTRL_MAN_SCLK_RCLK_DREX3,
+	CG_CTRL_MAN_DDRPHY3,
+	CG_CTRL_STAT_PCLK_MIF3_0,
+	CG_CTRL_STAT_PCLK_MIF3_1,
+	CG_CTRL_STAT_SCLK_HPM_MIF3,
+	CG_CTRL_STAT_SCLK_RCLK_DREX3,
+	CG_CTRL_STAT_DDRPHY3,
+	QCH_CTRL_LH_AXI_P_MIF3,
+	QCH_CTRL_PMU_MIF3,
+	QCH_CTRL_SYSREG_MIF3,
+	QCH_CTRL_CMU_MIF3,
+	QCH_CTRL_SMC_MIF3,
+	QSTATE_CTRL_PROMISE_MIF3,
+	QSTATE_CTRL_RCLK_DREX3,
+};
+
+static const struct samsung_pll_clock mif3_pll_clks[] __initconst = {
+	PLL(pll_1419x, CLK_FOUT_MIF3_PLL, "fout_mif3_pll", "oscclk",
+	    MIF3_PLL_LOCK, MIF3_PLL_CON0, mif_pll_rates),
+};
+
+PNAME(mif3_mux_mif_pll_p)	= { "oscclk", "fout_mif3_pll" };
+PNAME(mif3_mux_bus_pll_user_p)	= { "oscclk", "gout_top_sclk_bus_pll_mif" };
+PNAME(mif3_mux_aclk_mif_pll_p)	= { "mout_mif3_mif_pll",
+				    "mout_mif3_bus_pll_user" };
+PNAME(mif3_mux_pclk_mif_p)	= { "mout_mif3_aclk_mif_pll",
+				    "mif3_ff_aclk_mif_pll_div2",
+				    "mif3_ff_aclk_mif_pll_div4" };
+PNAME(mif3_mux_sclk_hpm_mif_p)	= { "mout_mif3_aclk_mif_pll",
+				    "mif3_ff_aclk_mif_pll_div2",
+				    "mif3_ff_aclk_mif_pll_div4" };
+PNAME(mif3_mux_pclk_smc_p)	= { "mout_mif3_aclk_mif_pll",
+				    "mif3_ff_aclk_mif_pll_div2",
+				    "mif3_ff_aclk_mif_pll_div4",
+				    "u_dfi_clk_gen_mif3" };
+
+static const struct samsung_mux_clock mif3_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_MIF3_MIF_PLL, "mout_mif3_mif_pll", mif3_mux_mif_pll_p,
+	    CLK_CON_MUX_MIF3_PLL, 12, 1),
+	MUX(CLK_MOUT_MIF3_BUS_PLL_USER, "mout_mif3_bus_pll_user",
+	    mif3_mux_bus_pll_user_p, CLK_CON_MUX_BUS_PLL_USER_MIF3, 12, 1),
+	MUX(CLK_MOUT_MIF3_ACLK_MIF_PLL, "mout_mif3_aclk_mif_pll",
+	    mif3_mux_aclk_mif_pll_p, CLK_CON_MUX_ACLK_MIF3_PLL, 12, 1),
+	MUX(CLK_MOUT_MIF3_PCLK_MIF, "mout_mif3_pclk_mif", mif3_mux_pclk_mif_p,
+	    CLK_CON_MUX_PCLK_MIF3, 12, 2),
+	MUX(CLK_MOUT_MIF3_SCLK_HPM_MIF, "mout_mif3_sclk_hpm_mif",
+	    mif3_mux_sclk_hpm_mif_p, CLK_CON_MUX_SCLK_HPM_MIF3, 12, 2),
+	MUX(CLK_MOUT_MIF3_PCLK_SMC, "mout_mif3_pclk_smc", mif3_mux_pclk_smc_p,
+	    CLK_CON_MUX_PCLK_SMC_MIF3, 12, 2),
+};
+
+static const struct samsung_div_clock mif3_div_clks[] __initconst = {
+	DIV(CLK_DOUT_MIF3_PCLK_MIF, "dout_mif3_pclk_mif", "mout_mif3_pclk_mif",
+	    CLK_CON_DIV_PCLK_MIF3, 0, 3),
+	DIV(CLK_DOUT_MIF3_SCLK_HPM_MIF, "dout_mif3_sclk_hpm_mif",
+	    "mout_mif3_sclk_hpm_mif", CLK_CON_DIV_SCLK_HPM_MIF3, 0, 2),
+	DIV(CLK_DOUT_MIF3_PCLK_SMC, "dout_mif3_pclk_smc", "mout_mif3_pclk_smc",
+	    CLK_CON_DIV_PCLK_SMC_MIF3, 0, 3),
+};
+
+static const
+struct samsung_fixed_factor_clock mif3_fixed_factor_clks[] __initconst = {
+	FFACTOR(CLK_MIF3_FF_ACLK_MIF_PLL_DIV2,
+		"mif3_ff_aclk_mif_pll_div2", "mout_mif3_aclk_mif_pll",
+		1, 2, 0),
+	FFACTOR(CLK_MIF3_FF_ACLK_MIF_PLL_DIV4,
+		"mif3_ff_aclk_mif_pll_div4", "mout_mif3_aclk_mif_pll",
+		1, 4, 0),
+	FFACTOR(CLK_U_DFI_CLK_GEN_MIF3, "u_dfi_clk_gen_mif3",
+		"mout_mif3_aclk_mif_pll", 1, 4, 0),
+};
+
+static const struct samsung_gate_clock mif3_gate_clks[] __initconst = {
+	/* reading CLK_ENABLE_ACLK_MIF3 causes an abort */
+	GATE(CLK_GOUT_MIF3_PCLK_SMC1, "gout_mif3_pclk_smc1",
+	     "dout_mif3_pclk_mif", CLK_ENABLE_PCLK_MIF3, 9, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_MIF3_PCLK_DMC_MISC, "gout_mif3_pclk_dmc_misc",
+	     "dout_mif3_pclk_mif", CLK_ENABLE_PCLK_MIF3, 8, 0, 0),
+	GATE(CLK_GOUT_MIF3_PCLK_PPC_DEBUG, "gout_mif3_pclk_ppc_debug",
+	     "dout_mif3_pclk_mif", CLK_ENABLE_PCLK_MIF3, 7, 0, 0),
+	GATE(CLK_GOUT_MIF3_PCLK_PPC_DVFS, "gout_mif3_pclk_ppc_dvfs",
+	     "dout_mif3_pclk_mif", CLK_ENABLE_PCLK_MIF3, 6, 0, 0),
+	GATE(CLK_GOUT_MIF3_PCLK_SYSREG_MIF, "gout_mif3_pclk_sysreg_mif",
+	     "dout_mif3_pclk_mif", CLK_ENABLE_PCLK_MIF3, 5, 0, 0),
+	GATE(CLK_GOUT_MIF3_PCLK_HPM, "gout_mif3_pclk_hpm", "dout_mif3_pclk_mif",
+	     CLK_ENABLE_PCLK_MIF3, 4, 0, 0),
+	GATE(CLK_GOUT_MIF3_ACLK_AXI_ASYNC, "gout_mif3_aclk_axi_async",
+	     "dout_mif3_pclk_mif", CLK_ENABLE_PCLK_MIF3, 3, 0, 0),
+	GATE(CLK_GOUT_MIF3_PCLK_MIFP, "gout_mif3_pclk_mifp",
+	     "dout_mif3_pclk_mif", CLK_ENABLE_PCLK_MIF3, 2, 0, 0),
+	GATE(CLK_GOUT_MIF3_PCLK_PMU_MIF, "gout_mif3_pclk_pmu_mif",
+	     "dout_mif3_pclk_mif", CLK_ENABLE_PCLK_MIF3, 1, 0, 0),
+	GATE(CLK_GOUT_MIF3_PCLK_LPDDR4PHY, "gout_mif3_pclk_lpddr4phy",
+	     "dout_mif3_pclk_mif", CLK_ENABLE_PCLK_MIF3, 0, CLK_IS_CRITICAL, 0),
+	/* reading CLK_ENABLE_ACLK_MIF3_SECURE_DREX_TZ causes an abort */
+	GATE(CLK_GOUT_MIF3_SCLK_PROMISE, "gout_mif3_sclk_promise",
+	     "dout_mif3_sclk_hpm_mif", CLK_ENABLE_SCLK_HPM_MIF3, 0, 0, 0),
+	GATE(CLK_GOUT_MIF3_RCLK_DREX, "gout_mif3_rclk_drex", "oscclk",
+	     CLK_ENABLE_SCLK_RCLK_DREX_MIF3, 0, 0, 0),
+};
+
+static const struct samsung_cmu_info mif3_cmu_info __initconst = {
+	.pll_clks		= mif3_pll_clks,
+	.nr_pll_clks		= ARRAY_SIZE(mif3_pll_clks),
+	.mux_clks		= mif3_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(mif3_mux_clks),
+	.div_clks		= mif3_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(mif3_div_clks),
+	.gate_clks		= mif3_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(mif3_gate_clks),
+	.fixed_factor_clks	= mif3_fixed_factor_clks,
+	.nr_fixed_factor_clks	= ARRAY_SIZE(mif3_fixed_factor_clks),
+	.nr_clk_ids		= MIF3_NR_CLK,
+	.clk_regs		= mif3_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(mif3_clk_regs),
+};
+
+/* ---- CMU_MNGS ----------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_MNGS (0x11800000) */
+#define MNGS_PLL_LOCK				0x0000
+#define MNGS_PLL_CON0				0x0100
+#define MNGS_PLL_CON1				0x0104
+#define MNGS_PLL_FREQ_DET			0x010C
+#define CLK_CON_MUX_MNGS_PLL			0x0200
+#define CLK_CON_MUX_BUS_PLL_MNGS_USER		0x0204
+#define CLK_CON_MUX_MNGS			0x0208
+#define CLK_CON_DIV_MNGS			0x0400
+#define CLK_CON_DIV_ACLK_MNGS			0x0404
+#define CLK_CON_DIV_ATCLK_MNGS_CORE		0x0408
+#define CLK_CON_DIV_ATCLK_MNGS_SOC		0x040C
+#define CLK_CON_DIV_ATCLK_MNGS_CSSYS_TRACECLK	0x0410
+#define CLK_CON_DIV_ATCLK_MNGS_ASYNCATB_CAM1	0x0414
+#define CLK_CON_DIV_ATCLK_MNGS_ASYNCATB_AUD	0x0418
+#define CLK_CON_DIV_PCLK_DBG_MNGS		0x041C
+#define CLK_CON_DIV_PCLK_RUN_MONITOR		0x0420
+#define CLK_CON_DIV_PCLK_MNGS			0x0424
+#define CLK_CON_DIV_CNTCLK_MNGS			0x0428
+#define CLK_CON_DIV_MNGS_RUN_MONITOR		0x042C
+#define CLK_CON_DIV_SCLK_PROMISE_MNGS		0x0430
+#define CLK_CON_DIV_MNGS_PLL			0x0434
+#define CLK_STAT_MUX_MNGS_PLL			0x0600
+#define CLK_STAT_MUX_BUS_PLL_MNGS_USER		0x0604
+#define CLK_STAT_MUX_MNGS			0x0608
+#define CLK_ENABLE_ACLK_MNGS			0x0800
+#define CLK_ENABLE_ATCLK_MNGS_CORE		0x0804
+#define CLK_ENABLE_ATCLK_MNGS_SOC		0x0808
+#define CLK_ENABLE_ATCLK_MNGS_CSSYS_TRACECLK	0x080C
+#define CLK_ENABLE_ATCLK_MNGS_ASYNCATB_CAM1	0x0810
+#define CLK_ENABLE_ATCLK_MNGS_ASYNCATB_AUD	0x0814
+#define CLK_ENABLE_PCLK_DBG_MNGS		0x0900
+#define CLK_ENABLE_PCLK_MNGS			0x0904
+#define CLK_ENABLE_PCLK_HPM_MNGS		0x0908
+#define CLK_ENABLE_SCLK_MNGS			0x0A00
+#define CLK_ENABLE_SCLK_PROMISE_MNGS		0x0A04
+#define CLKOUT_CMU_MNGS				0x0C00
+#define CLKOUT_CMU_MNGS_DIV_STAT		0x0C04
+#define CLK_ENABLE_PDN_MNGS			0x0D00
+#define MNGS_SFR_IGNORE_REQ_SYSCLK		0x0D04
+#define CMU_MNGS_SPARE0				0x0D08
+#define CMU_MNGS_SPARE1				0x0D0C
+#define ARMCLK_STOPCTRL_MNGS			0x1000
+#define PWR_CTRL_MNGS				0x1020
+#define PWR_CTRL2_MNGS				0x1024
+#define PWR_CTRL3_MNGS				0x1028
+#define PWR_CTRL4_MNGS				0x102C
+#define INTR_SPREAD_ENABLE_MNGS			0x1080
+#define INTR_SPREAD_USE_STANDBYWFI_MNGS		0x1084
+#define INTR_SPREAD_BLOCKING_DURATION_MNGS	0x1088
+
+static const unsigned long mngs_clk_regs[] __initconst = {
+	MNGS_PLL_LOCK,
+	MNGS_PLL_CON0,
+	MNGS_PLL_CON1,
+	MNGS_PLL_FREQ_DET,
+	CLK_CON_MUX_MNGS_PLL,
+	CLK_CON_MUX_BUS_PLL_MNGS_USER,
+	CLK_CON_MUX_MNGS,
+	CLK_CON_DIV_MNGS,
+	CLK_CON_DIV_ACLK_MNGS,
+	CLK_CON_DIV_ATCLK_MNGS_CORE,
+	CLK_CON_DIV_ATCLK_MNGS_SOC,
+	CLK_CON_DIV_ATCLK_MNGS_CSSYS_TRACECLK,
+	CLK_CON_DIV_ATCLK_MNGS_ASYNCATB_CAM1,
+	CLK_CON_DIV_ATCLK_MNGS_ASYNCATB_AUD,
+	CLK_CON_DIV_PCLK_DBG_MNGS,
+	CLK_CON_DIV_PCLK_RUN_MONITOR,
+	CLK_CON_DIV_PCLK_MNGS,
+	CLK_CON_DIV_CNTCLK_MNGS,
+	CLK_CON_DIV_MNGS_RUN_MONITOR,
+	CLK_CON_DIV_SCLK_PROMISE_MNGS,
+	CLK_CON_DIV_MNGS_PLL,
+	CLK_STAT_MUX_MNGS_PLL,
+	CLK_STAT_MUX_BUS_PLL_MNGS_USER,
+	CLK_STAT_MUX_MNGS,
+	CLK_ENABLE_ACLK_MNGS,
+	CLK_ENABLE_ATCLK_MNGS_CORE,
+	CLK_ENABLE_ATCLK_MNGS_SOC,
+	CLK_ENABLE_ATCLK_MNGS_CSSYS_TRACECLK,
+	CLK_ENABLE_ATCLK_MNGS_ASYNCATB_CAM1,
+	CLK_ENABLE_ATCLK_MNGS_ASYNCATB_AUD,
+	CLK_ENABLE_PCLK_DBG_MNGS,
+	CLK_ENABLE_PCLK_MNGS,
+	CLK_ENABLE_PCLK_HPM_MNGS,
+	CLK_ENABLE_SCLK_MNGS,
+	CLK_ENABLE_SCLK_PROMISE_MNGS,
+	CLKOUT_CMU_MNGS,
+	CLKOUT_CMU_MNGS_DIV_STAT,
+	CLK_ENABLE_PDN_MNGS,
+	MNGS_SFR_IGNORE_REQ_SYSCLK,
+	CMU_MNGS_SPARE0,
+	CMU_MNGS_SPARE1,
+	ARMCLK_STOPCTRL_MNGS,
+	PWR_CTRL_MNGS,
+	PWR_CTRL2_MNGS,
+	PWR_CTRL3_MNGS,
+	PWR_CTRL4_MNGS,
+	INTR_SPREAD_ENABLE_MNGS,
+	INTR_SPREAD_USE_STANDBYWFI_MNGS,
+	INTR_SPREAD_BLOCKING_DURATION_MNGS,
+};
+
+static const struct samsung_pll_rate_table mngs_pll_rates[] __initconst = {
+	PLL_35XX_RATE(26 * MHZ, 3016000000U, 348, 3, 0),
+	PLL_35XX_RATE(26 * MHZ, 2912000000U, 336, 3, 0),
+	PLL_35XX_RATE(26 * MHZ, 2808000000U, 324, 3, 0),
+	PLL_35XX_RATE(26 * MHZ, 2704000000U, 312, 3, 0),
+	PLL_35XX_RATE(26 * MHZ, 2600000000U, 300, 3, 0),
+	PLL_35XX_RATE(26 * MHZ, 2496000000U, 288, 3, 0),
+	PLL_35XX_RATE(26 * MHZ, 2392000000U, 276, 3, 0),
+	PLL_35XX_RATE(26 * MHZ, 2288000000U, 264, 3, 0),
+	PLL_35XX_RATE(26 * MHZ, 2184000000U, 252, 3, 0),
+	PLL_35XX_RATE(26 * MHZ, 2080000000U, 240, 3, 0),
+	PLL_35XX_RATE(26 * MHZ, 1976000000U, 228, 3, 0),
+	PLL_35XX_RATE(26 * MHZ, 1872000000U, 216, 3, 0),
+	PLL_35XX_RATE(26 * MHZ, 1768000000U, 204, 3, 0),
+	PLL_35XX_RATE(26 * MHZ, 1664000000U, 192, 3, 0),
+	PLL_35XX_RATE(26 * MHZ, 1560000000U, 360, 3, 1),
+	PLL_35XX_RATE(26 * MHZ, 1456000000U, 336, 3, 1),
+	PLL_35XX_RATE(26 * MHZ, 1352000000U, 312, 3, 1),
+	PLL_35XX_RATE(26 * MHZ, 1248000000U, 288, 3, 1),
+	PLL_35XX_RATE(26 * MHZ, 1144000000U, 264, 3, 1),
+	PLL_35XX_RATE(26 * MHZ, 1040000000U, 240, 3, 1),
+	PLL_35XX_RATE(26 * MHZ, 936000000U, 216, 3, 1),
+	PLL_35XX_RATE(26 * MHZ, 832000000U, 192, 3, 1),
+	PLL_35XX_RATE(26 * MHZ, 728000000U, 336, 3, 2),
+	PLL_35XX_RATE(26 * MHZ, 624000000U, 288, 3, 2),
+	PLL_35XX_RATE(26 * MHZ, 520000000U, 240, 3, 2),
+	PLL_35XX_RATE(26 * MHZ, 416000000U, 192, 3, 2),
+	PLL_35XX_RATE(26 * MHZ, 312000000U, 288, 3, 3),
+	PLL_35XX_RATE(26 * MHZ, 208000000U, 192, 3, 3),
+};
+
+static const struct samsung_pll_clock mngs_pll_clks[] __initconst = {
+	PLL(pll_141xx, CLK_FOUT_MNGS_PLL, "fout_mngs_pll", "oscclk",
+	    MNGS_PLL_LOCK, MNGS_PLL_CON0, mngs_pll_rates),
+};
+
+PNAME(mngs_mux_mngs_pll_p)		= { "oscclk", "fout_mngs_pll" };
+PNAME(mngs_mux_bus_pll_mngs_user_p)	= { "oscclk",
+					    "gout_top_sclk_bus_pll_mngs" };
+PNAME(mngs_mux_mngs_p)			= { "mout_mngs_mngs_pll",
+					    "mout_mngs_bus_pll_mngs_user" };
+
+static const struct samsung_mux_clock mngs_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_MNGS_MNGS_PLL, "mout_mngs_mngs_pll", mngs_mux_mngs_pll_p,
+	    CLK_CON_MUX_MNGS_PLL, 12, 1),
+	MUX(CLK_MOUT_MNGS_BUS_PLL_MNGS_USER, "mout_mngs_bus_pll_mngs_user",
+	    mngs_mux_bus_pll_mngs_user_p, CLK_CON_MUX_BUS_PLL_MNGS_USER, 12, 1),
+	MUX(CLK_MOUT_MNGS_MNGS, "mout_mngs_mngs", mngs_mux_mngs_p,
+	    CLK_CON_MUX_MNGS, 12, 1),
+};
+
+static const struct samsung_div_clock mngs_div_clks[] __initconst = {
+	DIV(CLK_DOUT_MNGS_MNGS, "dout_mngs_mngs", "mout_mngs_mngs",
+	    CLK_CON_DIV_MNGS, 0, 6),
+	DIV(CLK_DOUT_MNGS_ACLK_MNGS, "dout_mngs_aclk_mngs", "dout_mngs_mngs",
+	    CLK_CON_DIV_ACLK_MNGS, 0, 4),
+	DIV(CLK_DOUT_MNGS_ATCLK_MNGS_CORE, "dout_mngs_atclk_mngs_core",
+	    "dout_mngs_mngs", CLK_CON_DIV_ATCLK_MNGS_CORE, 0, 4),
+	DIV(CLK_DOUT_MNGS_ATCLK_MNGS_SOC, "dout_mngs_atclk_mngs_soc",
+	    "dout_mngs_mngs", CLK_CON_DIV_ATCLK_MNGS_SOC, 0, 6),
+	DIV(CLK_DOUT_MNGS_ATCLK_MNGS_CSSYS_TRACECLK,
+	    "dout_mngs_atclk_mngs_cssys_traceclk", "dout_mngs_atclk_mngs_soc",
+	    CLK_CON_DIV_ATCLK_MNGS_CSSYS_TRACECLK, 0, 4),
+	DIV(CLK_DOUT_MNGS_ATCLK_MNGS_ASYNCATB_CAM1,
+	    "dout_mngs_atclk_mngs_asyncatb_cam1", "dout_mngs_atclk_mngs_soc",
+	    CLK_CON_DIV_ATCLK_MNGS_ASYNCATB_CAM1, 0, 4),
+	DIV(CLK_DOUT_MNGS_ATCLK_MNGS_ASYNCATB_AUD,
+	    "dout_mngs_atclk_mngs_asyncatb_aud", "dout_mngs_atclk_mngs_soc",
+	    CLK_CON_DIV_ATCLK_MNGS_ASYNCATB_AUD, 0, 4),
+	DIV(CLK_DOUT_MNGS_PCLK_DBG_MNGS, "dout_mngs_pclk_dbg_mngs",
+	    "dout_mngs_mngs", CLK_CON_DIV_PCLK_DBG_MNGS, 0, 6),
+	DIV(CLK_DOUT_MNGS_PCLK_RUN_MONITOR, "dout_mngs_pclk_run_monitor",
+	    "dout_mngs_pclk_dbg_mngs", CLK_CON_DIV_PCLK_RUN_MONITOR, 0, 3),
+	DIV(CLK_DOUT_MNGS_PCLK_MNGS, "dout_mngs_pclk_mngs", "dout_mngs_mngs",
+	    CLK_CON_DIV_PCLK_MNGS, 0, 6),
+	DIV(CLK_DOUT_MNGS_CNTCLK_MNGS, "dout_mngs_cntclk_mngs",
+	    "dout_mngs_mngs", CLK_CON_DIV_CNTCLK_MNGS, 0, 4),
+	DIV(CLK_DOUT_MNGS_MNGS_RUN_MONITOR, "dout_mngs_mngs_run_monitor",
+	    "dout_mngs_mngs", CLK_CON_DIV_MNGS_RUN_MONITOR, 0, 3),
+	DIV(CLK_DOUT_MNGS_SCLK_PROMISE_MNGS, "dout_mngs_sclk_promise_mngs",
+	    "mout_mngs_mngs", CLK_CON_DIV_SCLK_PROMISE_MNGS, 0, 3),
+	DIV(CLK_DOUT_MNGS_MNGS_PLL, "dout_mngs_mngs_pll", "mout_mngs_mngs",
+	    CLK_CON_DIV_MNGS_PLL, 0, 3),
+};
+
+static const struct samsung_gate_clock mngs_gate_clks[] __initconst = {
+	GATE(CLK_GOUT_MNGS_ACLK_ASYNCPACES_MNGS_SCI,
+	     "gout_mngs_aclk_asyncpaces_mngs_sci", "dout_mngs_aclk_mngs",
+	     CLK_ENABLE_ACLK_MNGS, 0, 0, 0),
+	GATE(CLK_GOUT_MNGS_ATCLKS_ATB_MNGS3_CSSYS,
+	     "gout_mngs_atclks_atb_mngs3_cssys", "dout_mngs_atclk_mngs_core",
+	     CLK_ENABLE_ATCLK_MNGS_CORE, 3, 0, 0),
+	GATE(CLK_GOUT_MNGS_ATCLKS_ATB_MNGS2_CSSYS,
+	     "gout_mngs_atclks_atb_mngs2_cssys", "dout_mngs_atclk_mngs_core",
+	     CLK_ENABLE_ATCLK_MNGS_CORE, 2, 0, 0),
+	GATE(CLK_GOUT_MNGS_ATCLKS_ATB_MNGS1_CSSYS,
+	     "gout_mngs_atclks_atb_mngs1_cssys", "dout_mngs_atclk_mngs_core",
+	     CLK_ENABLE_ATCLK_MNGS_CORE, 1, 0, 0),
+	GATE(CLK_GOUT_MNGS_ATCLKS_ATB_MNGS0_CSSYS,
+	     "gout_mngs_atclks_atb_mngs0_cssys", "dout_mngs_atclk_mngs_core",
+	     CLK_ENABLE_ATCLK_MNGS_CORE, 0, 0, 0),
+	GATE(CLK_GOUT_MNGS_ATCLK_XIU_MNGSX_2X1, "gout_mngs_atclk_xiu_mngsx_2x1",
+	     "dout_mngs_atclk_mngs_soc", CLK_ENABLE_ATCLK_MNGS_SOC, 16, 0, 0),
+	GATE(CLK_GOUT_MNGS_ATCLK_STM_TXACTOR, "gout_mngs_atclk_stm_txactor",
+	     "dout_mngs_atclk_mngs_soc", CLK_ENABLE_ATCLK_MNGS_SOC, 15, 0, 0),
+	GATE(CLK_GOUT_MNGS_ATCLK_ATB_BDU_CSSYS, "gout_mngs_atclk_atb_bdu_cssys",
+	     "dout_mngs_atclk_mngs_soc", CLK_ENABLE_ATCLK_MNGS_SOC, 14, 0, 0),
+	GATE(CLK_GOUT_MNGS_ATCLK_ATB_AUD_CSSYS, "gout_mngs_atclk_atb_aud_cssys",
+	     "dout_mngs_atclk_mngs_soc", CLK_ENABLE_ATCLK_MNGS_SOC, 13, 0, 0),
+	GATE(CLK_GOUT_MNGS_ATCLK_ATB_CAM1_CSSYS,
+	     "gout_mngs_atclk_atb_cam1_cssys", "dout_mngs_atclk_mngs_soc",
+	     CLK_ENABLE_ATCLK_MNGS_SOC, 12, 0, 0),
+	GATE(CLK_GOUT_MNGS_ATCLK_ATB_APOLLO3_CSSYS,
+	     "gout_mngs_atclk_atb_apollo3_cssys", "dout_mngs_atclk_mngs_soc",
+	     CLK_ENABLE_ATCLK_MNGS_SOC, 11, 0, 0),
+	GATE(CLK_GOUT_MNGS_ATCLK_ATB_APOLLO2_CSSYS,
+	     "gout_mngs_atclk_atb_apollo2_cssys", "dout_mngs_atclk_mngs_soc",
+	     CLK_ENABLE_ATCLK_MNGS_SOC, 10, 0, 0),
+	GATE(CLK_GOUT_MNGS_ATCLK_ATB_APOLLO1_CSSYS,
+	     "gout_mngs_atclk_atb_apollo1_cssys", "dout_mngs_atclk_mngs_soc",
+	     CLK_ENABLE_ATCLK_MNGS_SOC, 9, 0, 0),
+	GATE(CLK_GOUT_MNGS_ATCLK_ATB_APOLLO0_CSSYS,
+	     "gout_mngs_atclk_atb_apollo0_cssys", "dout_mngs_atclk_mngs_soc",
+	     CLK_ENABLE_ATCLK_MNGS_SOC, 8, 0, 0),
+	GATE(CLK_GOUT_MNGS_ATCLKM_ATB_MNGS3_CSSYS,
+	     "gout_mngs_atclkm_atb_mngs3_cssys", "dout_mngs_atclk_mngs_soc",
+	     CLK_ENABLE_ATCLK_MNGS_SOC, 7, 0, 0),
+	GATE(CLK_GOUT_MNGS_ATCLKM_ATB_MNGS2_CSSYS,
+	     "gout_mngs_atclkm_atb_mngs2_cssys", "dout_mngs_atclk_mngs_soc",
+	     CLK_ENABLE_ATCLK_MNGS_SOC, 6, 0, 0),
+	GATE(CLK_GOUT_MNGS_ATCLKM_ATB_MNGS1_CSSYS,
+	     "gout_mngs_atclkm_atb_mngs1_cssys", "dout_mngs_atclk_mngs_soc",
+	     CLK_ENABLE_ATCLK_MNGS_SOC, 5, 0, 0),
+	GATE(CLK_GOUT_MNGS_ATCLKM_ATB_MNGS0_CSSYS,
+	     "gout_mngs_atclkm_atb_mngs0_cssys", "dout_mngs_atclk_mngs_soc",
+	     CLK_ENABLE_ATCLK_MNGS_SOC, 4, 0, 0),
+	GATE(CLK_GOUT_MNGS_ATCLK_ASYNCAHB_CSSYS_SSS_ACLK,
+	     "gout_mngs_atclk_asyncahb_cssys_sss_aclk",
+	     "dout_mngs_atclk_mngs_soc", CLK_ENABLE_ATCLK_MNGS_SOC, 3, 0, 0),
+	GATE(CLK_GOUT_MNGS_ATCLK_ASYNCLHAXI_CSSYS_ETR_ACLK,
+	     "gout_mngs_atclk_asynclhaxi_cssys_etr_aclk",
+	     "dout_mngs_atclk_mngs_soc", CLK_ENABLE_ATCLK_MNGS_SOC, 2, 0, 0),
+	GATE(CLK_GOUT_MNGS_ATCLK_CSSYS_HCLK, "gout_mngs_atclk_cssys_hclk",
+	     "dout_mngs_atclk_mngs_soc", CLK_ENABLE_ATCLK_MNGS_SOC, 1, 0, 0),
+	GATE(CLK_GOUT_MNGS_ATCLK_CSSYS, "gout_mngs_atclk_cssys",
+	     "dout_mngs_atclk_mngs_soc", CLK_ENABLE_ATCLK_MNGS_SOC, 0, 0, 0),
+	GATE(CLK_GOUT_MNGS_ATCLK_CSSYS_TRACECLK,
+	     "gout_mngs_atclk_cssys_traceclk",
+	     "dout_mngs_atclk_mngs_cssys_traceclk",
+	     CLK_ENABLE_ATCLK_MNGS_CSSYS_TRACECLK, 0, 0, 0),
+	GATE(CLK_GOUT_MNGS_ATCLK_ASYNCATB_CAM1, "gout_mngs_atclk_asyncatb_cam1",
+	     "dout_mngs_atclk_mngs_asyncatb_cam1",
+	     CLK_ENABLE_ATCLK_MNGS_ASYNCATB_CAM1, 0, 0, 0),
+	GATE(CLK_GOUT_MNGS_ATCLK_ASYNCATB_AUD, "gout_mngs_atclk_asyncatb_aud",
+	     "dout_mngs_atclk_mngs_asyncatb_aud",
+	     CLK_ENABLE_ATCLK_MNGS_ASYNCATB_AUD, 0, 0, 0),
+	GATE(CLK_GOUT_MNGS_PCLKDBG_ASAPBMST_CCORE_CSSYS,
+	     "gout_mngs_pclkdbg_asapbmst_ccore_cssys",
+	     "dout_mngs_pclk_dbg_mngs", CLK_ENABLE_PCLK_DBG_MNGS, 11, 0, 0),
+	GATE(CLK_GOUT_MNGS_PCLKDBG_ASAPBSLV_CSSYS_BDU,
+	     "gout_mngs_pclkdbg_asapbslv_cssys_bdu", "dout_mngs_pclk_dbg_mngs",
+	     CLK_ENABLE_PCLK_DBG_MNGS, 10, 0, 0),
+	GATE(CLK_GOUT_MNGS_PCLKDBG_ASAPBSLV_CSSYS_CAM1,
+	     "gout_mngs_pclkdbg_asapbslv_cssys_cam1", "dout_mngs_pclk_dbg_mngs",
+	     CLK_ENABLE_PCLK_DBG_MNGS, 9, 0, 0),
+	GATE(CLK_GOUT_MNGS_PCLKDBG_ASAPBSLV_CSSYS_AUD,
+	     "gout_mngs_pclkdbg_asapbslv_cssys_aud", "dout_mngs_pclk_dbg_mngs",
+	     CLK_ENABLE_PCLK_DBG_MNGS, 8, 0, 0),
+	GATE(CLK_GOUT_MNGS_PCLKDBG_ASAPBSLV_CSSYS_APOLLO,
+	     "gout_mngs_pclkdbg_asapbslv_cssys_apollo",
+	     "dout_mngs_pclk_dbg_mngs", CLK_ENABLE_PCLK_DBG_MNGS, 7, 0, 0),
+	GATE(CLK_GOUT_MNGS_PCLKDBG_DUMP_PC_MNGS,
+	     "gout_mngs_pclkdbg_dump_pc_mngs", "dout_mngs_pclk_dbg_mngs",
+	     CLK_ENABLE_PCLK_DBG_MNGS, 6, 0, 0),
+	GATE(CLK_GOUT_MNGS_PCLKDBG_SECJTAG, "gout_mngs_pclkdbg_secjtag",
+	     "dout_mngs_pclk_dbg_mngs", CLK_ENABLE_PCLK_DBG_MNGS, 5, 0, 0),
+	GATE(CLK_GOUT_MNGS_PCLKDBG_AXIAP, "gout_mngs_pclkdbg_axiap",
+	     "dout_mngs_pclk_dbg_mngs", CLK_ENABLE_PCLK_DBG_MNGS, 4, 0, 0),
+	GATE(CLK_GOUT_MNGS_PCLKDBG_CSSYS_CTMCLK,
+	     "gout_mngs_pclkdbg_cssys_ctmclk", "dout_mngs_pclk_dbg_mngs",
+	     CLK_ENABLE_PCLK_DBG_MNGS, 3, 0, 0),
+	GATE(CLK_GOUT_MNGS_PCLKDBG_CSSYS, "gout_mngs_pclkdbg_cssys",
+	     "dout_mngs_pclk_dbg_mngs", CLK_ENABLE_PCLK_DBG_MNGS, 2, 0, 0),
+	GATE(CLK_GOUT_MNGS_PCLKDBG_MNGS, "gout_mngs_pclkdbg_mngs",
+	     "dout_mngs_pclk_dbg_mngs", CLK_ENABLE_PCLK_DBG_MNGS, 1, 0, 0),
+	GATE(CLK_GOUT_MNGS_PCLKDBG_ASYNCDAPSLV, "gout_mngs_pclkdbg_asyncdapslv",
+	     "dout_mngs_pclk_dbg_mngs", CLK_ENABLE_PCLK_DBG_MNGS, 0, 0, 0),
+	GATE(CLK_GOUT_MNGS_PCLK_SYSREG_MNGS, "gout_mngs_pclk_sysreg_mngs",
+	     "dout_mngs_pclk_mngs", CLK_ENABLE_PCLK_MNGS, 5, 0, 0),
+	GATE(CLK_GOUT_MNGS_PCLK_STM_TXACTOR, "gout_mngs_pclk_stm_txactor",
+	     "dout_mngs_pclk_mngs", CLK_ENABLE_PCLK_MNGS, 4, 0, 0),
+	GATE(CLK_GOUT_MNGS_PCLK_XIU_PERI_MNGS_ACLK,
+	     "gout_mngs_pclk_xiu_peri_mngs_aclk", "dout_mngs_pclk_mngs",
+	     CLK_ENABLE_PCLK_MNGS, 3, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_MNGS_PCLK_PMU_MNGS, "gout_mngs_pclk_pmu_mngs",
+	     "dout_mngs_pclk_mngs", CLK_ENABLE_PCLK_MNGS, 2, 0, 0),
+	GATE(CLK_GOUT_MNGS_PCLK_XIU_MNGSSFRX_1X2,
+	     "gout_mngs_pclk_xiu_mngssfrx_1x2", "dout_mngs_pclk_mngs",
+	     CLK_ENABLE_PCLK_MNGS, 1, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_MNGS_PCLK_AXI2APB_MNGS_ACLK,
+	     "gout_mngs_pclk_axi2apb_mngs_aclk", "dout_mngs_pclk_mngs",
+	     CLK_ENABLE_PCLK_MNGS, 0, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_MNGS_PCLK_HPM_MNGS, "gout_mngs_pclk_hpm_mngs",
+	     "dout_mngs_pclk_mngs", CLK_ENABLE_PCLK_HPM_MNGS, 0,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_MNGS_SCLK_MNGS, "gout_mngs_sclk_mngs", "dout_mngs_mngs",
+	     CLK_ENABLE_SCLK_MNGS, 0, 0, 0),
+	GATE(CLK_GOUT_MNGS_SCLK_PROMISE2_MNGS, "gout_mngs_sclk_promise2_mngs",
+	     "dout_mngs_sclk_promise_mngs", CLK_ENABLE_SCLK_PROMISE_MNGS, 2, 0,
+	     0),
+	GATE(CLK_GOUT_MNGS_SCLK_PROMISE1_MNGS, "gout_mngs_sclk_promise1_mngs",
+	     "dout_mngs_sclk_promise_mngs", CLK_ENABLE_SCLK_PROMISE_MNGS, 1, 0,
+	     0),
+	GATE(CLK_GOUT_MNGS_SCLK_PROMISE0_MNGS, "gout_mngs_sclk_promise0_mngs",
+	     "dout_mngs_sclk_promise_mngs", CLK_ENABLE_SCLK_PROMISE_MNGS, 0, 0,
+	     0),
+};
+
+static const struct samsung_cmu_info mngs_cmu_info __initconst = {
+	.pll_clks		= mngs_pll_clks,
+	.nr_pll_clks		= ARRAY_SIZE(mngs_pll_clks),
+	.mux_clks		= mngs_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(mngs_mux_clks),
+	.div_clks		= mngs_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(mngs_div_clks),
+	.gate_clks		= mngs_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(mngs_gate_clks),
+	.nr_clk_ids		= MNGS_NR_CLK,
+	.clk_regs		= mngs_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(mngs_clk_regs),
+};
+
+/* ---- CMU_PERIC0 --------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_PERIC0 (0x13610000) */
+#define CLK_CON_MUX_ACLK_PERIC0_66_USER		0x0200
+#define CLK_CON_MUX_SCLK_UART0_USER		0x0204
+#define CLK_STAT_MUX_ACLK_PERIC0_66_USER	0x0600
+#define CLK_STAT_MUX_SCLK_UART0_USER		0x0604
+#define CG_CTRL_VAL_ACLK_PERIC0_66		0x0800
+#define CG_CTRL_VAL_SCLK_UART0			0x0840
+#define CG_CTRL_VAL_SCLK_PWM			0x0844
+#define CLKOUT_CMU_PERIC0			0x0C00
+#define CLKOUT_CMU_PERIC0_DIV_STAT		0x0C04
+#define PERIC0_SFR_IGNORE_REQ_SYSCLK		0x0D04
+#define CMU_PERIC0_SPARE0			0x0D08
+#define CMU_PERIC0_SPARE1			0x0D0C
+#define CG_CTRL_MAN_ACLK_PERIC0_66		0x1800
+#define CG_CTRL_MAN_SCLK_UART0			0x1840
+#define CG_CTRL_MAN_SCLK_PWM			0x1844
+#define CG_CTRL_STAT_ACLK_PERIC0_66_0		0x1C00
+#define CG_CTRL_STAT_ACLK_PERIC0_66_1		0x1C04
+#define CG_CTRL_STAT_SCLK_UART0			0x1C40
+#define CG_CTRL_STAT_SCLK_PWM			0x1C44
+#define QCH_CTRL_AXILHASYNCM_PERIC0		0x2000
+#define QCH_CTRL_CMU_PERIC0			0x2004
+#define QCH_CTRL_PMU_PERIC0			0x2008
+#define QCH_CTRL_SYSREG_PERIC0			0x200C
+#define QSTATE_CTRL_GPIO_BUS0			0x2404
+#define QSTATE_CTRL_UART0			0x2408
+#define QSTATE_CTRL_ADCIF			0x240C
+#define QSTATE_CTRL_PWM				0x2410
+#define QSTATE_CTRL_HSI2C0			0x2414
+#define QSTATE_CTRL_HSI2C1			0x2418
+#define QSTATE_CTRL_HSI2C4			0x241C
+#define QSTATE_CTRL_HSI2C5			0x2420
+#define QSTATE_CTRL_HSI2C9			0x2424
+#define QSTATE_CTRL_HSI2C10			0x2428
+#define QSTATE_CTRL_HSI2C11			0x242C
+
+static const unsigned long peric0_clk_regs[] __initconst = {
+	CLK_CON_MUX_ACLK_PERIC0_66_USER,
+	CLK_CON_MUX_SCLK_UART0_USER,
+	CLK_STAT_MUX_ACLK_PERIC0_66_USER,
+	CLK_STAT_MUX_SCLK_UART0_USER,
+	CG_CTRL_VAL_ACLK_PERIC0_66,
+	CG_CTRL_VAL_SCLK_UART0,
+	CG_CTRL_VAL_SCLK_PWM,
+	CLKOUT_CMU_PERIC0,
+	CLKOUT_CMU_PERIC0_DIV_STAT,
+	PERIC0_SFR_IGNORE_REQ_SYSCLK,
+	CMU_PERIC0_SPARE0,
+	CMU_PERIC0_SPARE1,
+	CG_CTRL_MAN_ACLK_PERIC0_66,
+	CG_CTRL_MAN_SCLK_UART0,
+	CG_CTRL_MAN_SCLK_PWM,
+	CG_CTRL_STAT_ACLK_PERIC0_66_0,
+	CG_CTRL_STAT_ACLK_PERIC0_66_1,
+	CG_CTRL_STAT_SCLK_UART0,
+	CG_CTRL_STAT_SCLK_PWM,
+	QCH_CTRL_AXILHASYNCM_PERIC0,
+	QCH_CTRL_CMU_PERIC0,
+	QCH_CTRL_PMU_PERIC0,
+	QCH_CTRL_SYSREG_PERIC0,
+	QSTATE_CTRL_GPIO_BUS0,
+	QSTATE_CTRL_UART0,
+	QSTATE_CTRL_ADCIF,
+	QSTATE_CTRL_PWM,
+	QSTATE_CTRL_HSI2C0,
+	QSTATE_CTRL_HSI2C1,
+	QSTATE_CTRL_HSI2C4,
+	QSTATE_CTRL_HSI2C5,
+	QSTATE_CTRL_HSI2C9,
+	QSTATE_CTRL_HSI2C10,
+	QSTATE_CTRL_HSI2C11,
+};
+
+PNAME(peric0_mux_aclk_peric0_66_user_p)	= { "oscclk",
+					    "gout_top_aclk_peric0_66" };
+PNAME(peric0_mux_sclk_uart0_user_p)	= { "oscclk",
+					    "gout_top_sclk_peric0_uart0" };
+
+static const struct samsung_mux_clock peric0_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_PERIC0_ACLK_PERIC0_66_USER,
+	    "mout_peric0_aclk_peric0_66_user", peric0_mux_aclk_peric0_66_user_p,
+	    CLK_CON_MUX_ACLK_PERIC0_66_USER, 12, 1),
+	MUX(CLK_MOUT_PERIC0_SCLK_UART0_USER, "mout_peric0_sclk_uart0_user",
+	    peric0_mux_sclk_uart0_user_p, CLK_CON_MUX_SCLK_UART0_USER, 12, 1),
+};
+
+static const struct samsung_gate_clock peric0_gate_clks[] __initconst = {
+	GATE(CLK_GOUT_PERIC0_PCLK_HSI2C11, "gout_peric0_pclk_hsi2c11",
+	     "mout_peric0_aclk_peric0_66_user", CG_CTRL_VAL_ACLK_PERIC0_66, 15,
+	     0, 0),
+	GATE(CLK_GOUT_PERIC0_PCLK_HSI2C10, "gout_peric0_pclk_hsi2c10",
+	     "mout_peric0_aclk_peric0_66_user", CG_CTRL_VAL_ACLK_PERIC0_66, 14,
+	     0, 0),
+	GATE(CLK_GOUT_PERIC0_PCLK_HSI2C9, "gout_peric0_pclk_hsi2c9",
+	     "mout_peric0_aclk_peric0_66_user", CG_CTRL_VAL_ACLK_PERIC0_66, 13,
+	     0, 0),
+	GATE(CLK_GOUT_PERIC0_PCLK_HSI2C5, "gout_peric0_pclk_hsi2c5",
+	     "mout_peric0_aclk_peric0_66_user", CG_CTRL_VAL_ACLK_PERIC0_66, 12,
+	     0, 0),
+	GATE(CLK_GOUT_PERIC0_PCLK_HSI2C4, "gout_peric0_pclk_hsi2c4",
+	     "mout_peric0_aclk_peric0_66_user", CG_CTRL_VAL_ACLK_PERIC0_66, 11,
+	     0, 0),
+	GATE(CLK_GOUT_PERIC0_PCLK_HSI2C1, "gout_peric0_pclk_hsi2c1",
+	     "mout_peric0_aclk_peric0_66_user", CG_CTRL_VAL_ACLK_PERIC0_66, 10,
+	     0, 0),
+	GATE(CLK_GOUT_PERIC0_PCLK_HSI2C0, "gout_peric0_pclk_hsi2c0",
+	     "mout_peric0_aclk_peric0_66_user", CG_CTRL_VAL_ACLK_PERIC0_66, 9,
+	     0, 0),
+	GATE(CLK_GOUT_PERIC0_PCLK_PWM, "gout_peric0_pclk_pwm",
+	     "mout_peric0_aclk_peric0_66_user", CG_CTRL_VAL_ACLK_PERIC0_66, 8,
+	     0, 0),
+	GATE(CLK_GOUT_PERIC0_PCLK_ADCIF, "gout_peric0_pclk_adcif",
+	     "mout_peric0_aclk_peric0_66_user", CG_CTRL_VAL_ACLK_PERIC0_66, 7,
+	     0, 0),
+	GATE(CLK_GOUT_PERIC0_PCLK_UART0, "gout_peric0_pclk_uart0",
+	     "mout_peric0_aclk_peric0_66_user", CG_CTRL_VAL_ACLK_PERIC0_66, 6,
+	     0, 0),
+	GATE(CLK_GOUT_PERIC0_PCLK_GPIO_BUS0, "gout_peric0_pclk_gpio_bus0",
+	     "mout_peric0_aclk_peric0_66_user", CG_CTRL_VAL_ACLK_PERIC0_66, 5,
+	     0, 0),
+	GATE(CLK_GOUT_PERIC0_PCLK_SYSREG_PERIC0,
+	     "gout_peric0_pclk_sysreg_peric0",
+	     "mout_peric0_aclk_peric0_66_user", CG_CTRL_VAL_ACLK_PERIC0_66, 4,
+	     0, 0),
+	GATE(CLK_GOUT_PERIC0_PCLK_PMU_PERIC0, "gout_peric0_pclk_pmu_peric0",
+	     "mout_peric0_aclk_peric0_66_user", CG_CTRL_VAL_ACLK_PERIC0_66, 3,
+	     0, 0),
+	GATE(CLK_GOUT_PERIC0_PCLK_CMU_PERIC0, "gout_peric0_pclk_cmu_peric0",
+	     "mout_peric0_aclk_peric0_66_user", CG_CTRL_VAL_ACLK_PERIC0_66, 2,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_PERIC0_ACLK_AXI2APB_PERIC0P,
+	     "gout_peric0_aclk_axi2apb_peric0p",
+	     "mout_peric0_aclk_peric0_66_user", CG_CTRL_VAL_ACLK_PERIC0_66, 1,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_PERIC0_ACLK_AXILHASYNCM_PERIC0,
+	     "gout_peric0_aclk_axilhasyncm_peric0",
+	     "mout_peric0_aclk_peric0_66_user", CG_CTRL_VAL_ACLK_PERIC0_66, 0,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_PERIC0_SCLK_UART0, "gout_peric0_sclk_uart0",
+	     "mout_peric0_sclk_uart0_user", CG_CTRL_VAL_SCLK_UART0, 0, 0, 0),
+	GATE(CLK_GOUT_PERIC0_SCLK_PWM, "gout_peric0_sclk_pwm", "oscclk",
+	     CG_CTRL_VAL_SCLK_PWM, 0, 0, 0),
+};
+
+static const struct samsung_cmu_info peric0_cmu_info __initconst = {
+	.mux_clks		= peric0_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(peric0_mux_clks),
+	.gate_clks		= peric0_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(peric0_gate_clks),
+	.nr_clk_ids		= PERIC0_NR_CLK,
+	.clk_regs		= peric0_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(peric0_clk_regs),
+};
+
+/* ---- CMU_PERIC1 --------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_PERIC1 (0x14c80000) */
+#define CLK_CON_MUX_ACLK_PERIC1_66_USER		0x0200
+#define CLK_CON_MUX_SCLK_SPI0_USER		0x0204
+#define CLK_CON_MUX_SCLK_SPI1_USER		0x0208
+#define CLK_CON_MUX_SCLK_SPI2_USER		0x020C
+#define CLK_CON_MUX_SCLK_SPI3_USER		0x0210
+#define CLK_CON_MUX_SCLK_SPI4_USER		0x0214
+#define CLK_CON_MUX_SCLK_SPI5_USER		0x0218
+#define CLK_CON_MUX_SCLK_SPI6_USER		0x021C
+#define CLK_CON_MUX_SCLK_SPI7_USER		0x0220
+#define CLK_CON_MUX_SCLK_UART1_USER		0x0224
+#define CLK_CON_MUX_SCLK_UART2_USER		0x0228
+#define CLK_CON_MUX_SCLK_UART3_USER		0x022C
+#define CLK_CON_MUX_SCLK_UART4_USER		0x0230
+#define CLK_CON_MUX_SCLK_UART5_USER		0x0234
+#define CLK_STAT_MUX_ACLK_PERIC1_66_USER	0x0600
+#define CLK_STAT_MUX_SCLK_SPI0_USER		0x0604
+#define CLK_STAT_MUX_SCLK_SPI1_USER		0x0608
+#define CLK_STAT_MUX_SCLK_SPI2_USER		0x060C
+#define CLK_STAT_MUX_SCLK_SPI3_USER		0x0610
+#define CLK_STAT_MUX_SCLK_SPI4_USER		0x0614
+#define CLK_STAT_MUX_SCLK_SPI5_USER		0x0618
+#define CLK_STAT_MUX_SCLK_SPI6_USER		0x061C
+#define CLK_STAT_MUX_SCLK_SPI7_USER		0x0620
+#define CLK_STAT_MUX_SCLK_UART1_USER		0x0624
+#define CLK_STAT_MUX_SCLK_UART2_USER		0x0628
+#define CLK_STAT_MUX_SCLK_UART3_USER		0x062C
+#define CLK_STAT_MUX_SCLK_UART4_USER		0x0630
+#define CLK_STAT_MUX_SCLK_UART5_USER		0x0634
+#define CG_CTRL_VAL_ACLK_PERIC1_66		0x0800
+#define CG_CTRL_VAL_ACLK_PERIC1_66_HSI2C	0x0804
+#define CG_CTRL_VAL_SCLK_SPI0			0x0840
+#define CG_CTRL_VAL_SCLK_SPI1			0x0844
+#define CG_CTRL_VAL_SCLK_SPI2			0x0848
+#define CG_CTRL_VAL_SCLK_SPI3			0x084C
+#define CG_CTRL_VAL_SCLK_SPI4			0x0850
+#define CG_CTRL_VAL_SCLK_SPI5			0x0854
+#define CG_CTRL_VAL_SCLK_SPI6			0x0858
+#define CG_CTRL_VAL_SCLK_SPI7			0x085C
+#define CG_CTRL_VAL_SCLK_UART1			0x0860
+#define CG_CTRL_VAL_SCLK_UART2			0x0864
+#define CG_CTRL_VAL_SCLK_UART3			0x0868
+#define CG_CTRL_VAL_SCLK_UART4			0x086C
+#define CG_CTRL_VAL_SCLK_UART5			0x0870
+#define CLKOUT_CMU_PERIC1			0x0C00
+#define CLKOUT_CMU_PERIC1_DIV_STAT		0x0C04
+#define PERIC1_SFR_IGNORE_REQ_SYSCLK		0x0D04
+#define CMU_PERIC1_SPARE0			0x0D08
+#define CMU_PERIC1_SPARE1			0x0D0C
+#define CG_CTRL_MAN_ACLK_PERIC1_66		0x1800
+#define CG_CTRL_MAN_ACLK_PERIC1_66_HSI2C	0x1804
+#define CG_CTRL_MAN_SCLK_SPI0			0x1840
+#define CG_CTRL_MAN_SCLK_SPI1			0x1844
+#define CG_CTRL_MAN_SCLK_SPI2			0x1848
+#define CG_CTRL_MAN_SCLK_SPI3			0x184C
+#define CG_CTRL_MAN_SCLK_SPI4			0x1850
+#define CG_CTRL_MAN_SCLK_SPI5			0x1854
+#define CG_CTRL_MAN_SCLK_SPI6			0x1858
+#define CG_CTRL_MAN_SCLK_SPI7			0x185C
+#define CG_CTRL_MAN_SCLK_UART1			0x1860
+#define CG_CTRL_MAN_SCLK_UART2			0x1864
+#define CG_CTRL_MAN_SCLK_UART3			0x1868
+#define CG_CTRL_MAN_SCLK_UART4			0x186C
+#define CG_CTRL_MAN_SCLK_UART5			0x1870
+#define CG_CTRL_STAT_ACLK_PERIC1_66_0		0x1C00
+#define CG_CTRL_STAT_ACLK_PERIC1_66_1		0x1C04
+#define CG_CTRL_STAT_ACLK_PERIC1_66_2		0x1C08
+#define CG_CTRL_STAT_ACLK_PERIC1_66_3		0x1C0C
+#define CG_CTRL_STAT_ACLK_PERIC1_66_HSI2C	0x1C10
+#define CG_CTRL_STAT_SCLK_SPI0			0x1C40
+#define CG_CTRL_STAT_SCLK_SPI1			0x1C44
+#define CG_CTRL_STAT_SCLK_SPI2			0x1C48
+#define CG_CTRL_STAT_SCLK_SPI3			0x1C4C
+#define CG_CTRL_STAT_SCLK_SPI4			0x1C50
+#define CG_CTRL_STAT_SCLK_SPI5			0x1C54
+#define CG_CTRL_STAT_SCLK_SPI6			0x1C58
+#define CG_CTRL_STAT_SCLK_SPI7			0x1C5C
+#define CG_CTRL_STAT_SCLK_UART1			0x1C60
+#define CG_CTRL_STAT_SCLK_UART2			0x1C64
+#define CG_CTRL_STAT_SCLK_UART3			0x1C68
+#define CG_CTRL_STAT_SCLK_UART4			0x1C6C
+#define CG_CTRL_STAT_SCLK_UART5			0x1C70
+#define QCH_CTRL_AXILHASYNCM_PERIC1		0x2000
+#define QCH_CTRL_CMU_PERIC1			0x2004
+#define QCH_CTRL_PMU_PERIC1			0x2008
+#define QCH_CTRL_SYSREG_PERIC1			0x200C
+#define QSTATE_CTRL_GPIO_PERIC1			0x2410
+#define QSTATE_CTRL_GPIO_NFC			0x2414
+#define QSTATE_CTRL_GPIO_TOUCH			0x2418
+#define QSTATE_CTRL_GPIO_FF			0x241C
+#define QSTATE_CTRL_GPIO_ESE			0x2420
+#define QSTATE_CTRL_UART1			0x2424
+#define QSTATE_CTRL_UART2			0x2428
+#define QSTATE_CTRL_UART3			0x242C
+#define QSTATE_CTRL_UART4			0x2430
+#define QSTATE_CTRL_UART5			0x2434
+#define QSTATE_CTRL_SPI0			0x2438
+#define QSTATE_CTRL_SPI1			0x243C
+#define QSTATE_CTRL_SPI2			0x2440
+#define QSTATE_CTRL_SPI3			0x2444
+#define QSTATE_CTRL_SPI4			0x2448
+#define QSTATE_CTRL_SPI5			0x244C
+#define QSTATE_CTRL_SPI6			0x2450
+#define QSTATE_CTRL_SPI7			0x2454
+#define QSTATE_CTRL_HSI2C2			0x2458
+#define QSTATE_CTRL_HSI2C3			0x245C
+#define QSTATE_CTRL_HSI2C6			0x2460
+#define QSTATE_CTRL_HSI2C7			0x2464
+#define QSTATE_CTRL_HSI2C8			0x2468
+#define QSTATE_CTRL_HSI2C12			0x246C
+#define QSTATE_CTRL_HSI2C13			0x2470
+#define QSTATE_CTRL_HSI2C14			0x2474
+
+static const unsigned long peric1_clk_regs[] __initconst = {
+	CLK_CON_MUX_ACLK_PERIC1_66_USER,
+	CLK_CON_MUX_SCLK_SPI0_USER,
+	CLK_CON_MUX_SCLK_SPI1_USER,
+	CLK_CON_MUX_SCLK_SPI2_USER,
+	CLK_CON_MUX_SCLK_SPI3_USER,
+	CLK_CON_MUX_SCLK_SPI4_USER,
+	CLK_CON_MUX_SCLK_SPI5_USER,
+	CLK_CON_MUX_SCLK_SPI6_USER,
+	CLK_CON_MUX_SCLK_SPI7_USER,
+	CLK_CON_MUX_SCLK_UART1_USER,
+	CLK_CON_MUX_SCLK_UART2_USER,
+	CLK_CON_MUX_SCLK_UART3_USER,
+	CLK_CON_MUX_SCLK_UART4_USER,
+	CLK_CON_MUX_SCLK_UART5_USER,
+	CLK_STAT_MUX_ACLK_PERIC1_66_USER,
+	CLK_STAT_MUX_SCLK_SPI0_USER,
+	CLK_STAT_MUX_SCLK_SPI1_USER,
+	CLK_STAT_MUX_SCLK_SPI2_USER,
+	CLK_STAT_MUX_SCLK_SPI3_USER,
+	CLK_STAT_MUX_SCLK_SPI4_USER,
+	CLK_STAT_MUX_SCLK_SPI5_USER,
+	CLK_STAT_MUX_SCLK_SPI6_USER,
+	CLK_STAT_MUX_SCLK_SPI7_USER,
+	CLK_STAT_MUX_SCLK_UART1_USER,
+	CLK_STAT_MUX_SCLK_UART2_USER,
+	CLK_STAT_MUX_SCLK_UART3_USER,
+	CLK_STAT_MUX_SCLK_UART4_USER,
+	CLK_STAT_MUX_SCLK_UART5_USER,
+	CG_CTRL_VAL_ACLK_PERIC1_66,
+	CG_CTRL_VAL_ACLK_PERIC1_66_HSI2C,
+	CG_CTRL_VAL_SCLK_SPI0,
+	CG_CTRL_VAL_SCLK_SPI1,
+	CG_CTRL_VAL_SCLK_SPI2,
+	CG_CTRL_VAL_SCLK_SPI3,
+	CG_CTRL_VAL_SCLK_SPI4,
+	CG_CTRL_VAL_SCLK_SPI5,
+	CG_CTRL_VAL_SCLK_SPI6,
+	CG_CTRL_VAL_SCLK_SPI7,
+	CG_CTRL_VAL_SCLK_UART1,
+	CG_CTRL_VAL_SCLK_UART2,
+	CG_CTRL_VAL_SCLK_UART3,
+	CG_CTRL_VAL_SCLK_UART4,
+	CG_CTRL_VAL_SCLK_UART5,
+	CLKOUT_CMU_PERIC1,
+	CLKOUT_CMU_PERIC1_DIV_STAT,
+	PERIC1_SFR_IGNORE_REQ_SYSCLK,
+	CMU_PERIC1_SPARE0,
+	CMU_PERIC1_SPARE1,
+	CG_CTRL_MAN_ACLK_PERIC1_66,
+	CG_CTRL_MAN_ACLK_PERIC1_66_HSI2C,
+	CG_CTRL_MAN_SCLK_SPI0,
+	CG_CTRL_MAN_SCLK_SPI1,
+	CG_CTRL_MAN_SCLK_SPI2,
+	CG_CTRL_MAN_SCLK_SPI3,
+	CG_CTRL_MAN_SCLK_SPI4,
+	CG_CTRL_MAN_SCLK_SPI5,
+	CG_CTRL_MAN_SCLK_SPI6,
+	CG_CTRL_MAN_SCLK_SPI7,
+	CG_CTRL_MAN_SCLK_UART1,
+	CG_CTRL_MAN_SCLK_UART2,
+	CG_CTRL_MAN_SCLK_UART3,
+	CG_CTRL_MAN_SCLK_UART4,
+	CG_CTRL_MAN_SCLK_UART5,
+	CG_CTRL_STAT_ACLK_PERIC1_66_0,
+	CG_CTRL_STAT_ACLK_PERIC1_66_1,
+	CG_CTRL_STAT_ACLK_PERIC1_66_2,
+	CG_CTRL_STAT_ACLK_PERIC1_66_3,
+	CG_CTRL_STAT_ACLK_PERIC1_66_HSI2C,
+	CG_CTRL_STAT_SCLK_SPI0,
+	CG_CTRL_STAT_SCLK_SPI1,
+	CG_CTRL_STAT_SCLK_SPI2,
+	CG_CTRL_STAT_SCLK_SPI3,
+	CG_CTRL_STAT_SCLK_SPI4,
+	CG_CTRL_STAT_SCLK_SPI5,
+	CG_CTRL_STAT_SCLK_SPI6,
+	CG_CTRL_STAT_SCLK_SPI7,
+	CG_CTRL_STAT_SCLK_UART1,
+	CG_CTRL_STAT_SCLK_UART2,
+	CG_CTRL_STAT_SCLK_UART3,
+	CG_CTRL_STAT_SCLK_UART4,
+	CG_CTRL_STAT_SCLK_UART5,
+	QCH_CTRL_AXILHASYNCM_PERIC1,
+	QCH_CTRL_CMU_PERIC1,
+	QCH_CTRL_PMU_PERIC1,
+	QCH_CTRL_SYSREG_PERIC1,
+	QSTATE_CTRL_GPIO_PERIC1,
+	QSTATE_CTRL_GPIO_NFC,
+	QSTATE_CTRL_GPIO_TOUCH,
+	QSTATE_CTRL_GPIO_FF,
+	QSTATE_CTRL_GPIO_ESE,
+	QSTATE_CTRL_UART1,
+	QSTATE_CTRL_UART2,
+	QSTATE_CTRL_UART3,
+	QSTATE_CTRL_UART4,
+	QSTATE_CTRL_UART5,
+	QSTATE_CTRL_SPI0,
+	QSTATE_CTRL_SPI1,
+	QSTATE_CTRL_SPI2,
+	QSTATE_CTRL_SPI3,
+	QSTATE_CTRL_SPI4,
+	QSTATE_CTRL_SPI5,
+	QSTATE_CTRL_SPI6,
+	QSTATE_CTRL_SPI7,
+	QSTATE_CTRL_HSI2C2,
+	QSTATE_CTRL_HSI2C3,
+	QSTATE_CTRL_HSI2C6,
+	QSTATE_CTRL_HSI2C7,
+	QSTATE_CTRL_HSI2C8,
+	QSTATE_CTRL_HSI2C12,
+	QSTATE_CTRL_HSI2C13,
+	QSTATE_CTRL_HSI2C14,
+};
+
+PNAME(peric1_mux_aclk_peric1_66_user_p)	= { "oscclk",
+					    "gout_top_aclk_peric1_66" };
+PNAME(peric1_mux_sclk_spi0_user_p)	= { "oscclk",
+					    "gout_top_sclk_peric1_spi0" };
+PNAME(peric1_mux_sclk_spi1_user_p)	= { "oscclk",
+					    "gout_top_sclk_peric1_spi1" };
+PNAME(peric1_mux_sclk_spi2_user_p)	= { "oscclk",
+					    "gout_top_sclk_peric1_spi2" };
+PNAME(peric1_mux_sclk_spi3_user_p)	= { "oscclk",
+					    "gout_top_sclk_peric1_spi3" };
+PNAME(peric1_mux_sclk_spi4_user_p)	= { "oscclk",
+					    "gout_top_sclk_peric1_spi4" };
+PNAME(peric1_mux_sclk_spi5_user_p)	= { "oscclk",
+					    "gout_top_sclk_peric1_spi5" };
+PNAME(peric1_mux_sclk_spi6_user_p)	= { "oscclk",
+					    "gout_top_sclk_peric1_spi6" };
+PNAME(peric1_mux_sclk_spi7_user_p)	= { "oscclk",
+					    "gout_top_sclk_peric1_spi7" };
+PNAME(peric1_mux_sclk_uart1_user_p)	= { "oscclk",
+					    "gout_top_sclk_peric1_uart1" };
+PNAME(peric1_mux_sclk_uart2_user_p)	= { "oscclk",
+					    "gout_top_sclk_peric1_uart2" };
+PNAME(peric1_mux_sclk_uart3_user_p)	= { "oscclk",
+					    "gout_top_sclk_peric1_uart3" };
+PNAME(peric1_mux_sclk_uart4_user_p)	= { "oscclk",
+					    "gout_top_sclk_peric1_uart4" };
+PNAME(peric1_mux_sclk_uart5_user_p)	= { "oscclk",
+					    "gout_top_sclk_peric1_uart5" };
+
+static const struct samsung_mux_clock peric1_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_PERIC1_ACLK_PERIC1_66_USER,
+	    "mout_peric1_aclk_peric1_66_user", peric1_mux_aclk_peric1_66_user_p,
+	    CLK_CON_MUX_ACLK_PERIC1_66_USER, 12, 1),
+	MUX(CLK_MOUT_PERIC1_SCLK_SPI0_USER, "mout_peric1_sclk_spi0_user",
+	    peric1_mux_sclk_spi0_user_p, CLK_CON_MUX_SCLK_SPI0_USER, 12, 1),
+	MUX(CLK_MOUT_PERIC1_SCLK_SPI1_USER, "mout_peric1_sclk_spi1_user",
+	    peric1_mux_sclk_spi1_user_p, CLK_CON_MUX_SCLK_SPI1_USER, 12, 1),
+	MUX(CLK_MOUT_PERIC1_SCLK_SPI2_USER, "mout_peric1_sclk_spi2_user",
+	    peric1_mux_sclk_spi2_user_p, CLK_CON_MUX_SCLK_SPI2_USER, 12, 1),
+	MUX(CLK_MOUT_PERIC1_SCLK_SPI3_USER, "mout_peric1_sclk_spi3_user",
+	    peric1_mux_sclk_spi3_user_p, CLK_CON_MUX_SCLK_SPI3_USER, 12, 1),
+	MUX(CLK_MOUT_PERIC1_SCLK_SPI4_USER, "mout_peric1_sclk_spi4_user",
+	    peric1_mux_sclk_spi4_user_p, CLK_CON_MUX_SCLK_SPI4_USER, 12, 1),
+	MUX(CLK_MOUT_PERIC1_SCLK_SPI5_USER, "mout_peric1_sclk_spi5_user",
+	    peric1_mux_sclk_spi5_user_p, CLK_CON_MUX_SCLK_SPI5_USER, 12, 1),
+	MUX(CLK_MOUT_PERIC1_SCLK_SPI6_USER, "mout_peric1_sclk_spi6_user",
+	    peric1_mux_sclk_spi6_user_p, CLK_CON_MUX_SCLK_SPI6_USER, 12, 1),
+	MUX(CLK_MOUT_PERIC1_SCLK_SPI7_USER, "mout_peric1_sclk_spi7_user",
+	    peric1_mux_sclk_spi7_user_p, CLK_CON_MUX_SCLK_SPI7_USER, 12, 1),
+	MUX(CLK_MOUT_PERIC1_SCLK_UART1_USER, "mout_peric1_sclk_uart1_user",
+	    peric1_mux_sclk_uart1_user_p, CLK_CON_MUX_SCLK_UART1_USER, 12, 1),
+	MUX(CLK_MOUT_PERIC1_SCLK_UART2_USER, "mout_peric1_sclk_uart2_user",
+	    peric1_mux_sclk_uart2_user_p, CLK_CON_MUX_SCLK_UART2_USER, 12, 1),
+	MUX(CLK_MOUT_PERIC1_SCLK_UART3_USER, "mout_peric1_sclk_uart3_user",
+	    peric1_mux_sclk_uart3_user_p, CLK_CON_MUX_SCLK_UART3_USER, 12, 1),
+	MUX(CLK_MOUT_PERIC1_SCLK_UART4_USER, "mout_peric1_sclk_uart4_user",
+	    peric1_mux_sclk_uart4_user_p, CLK_CON_MUX_SCLK_UART4_USER, 12, 1),
+	MUX(CLK_MOUT_PERIC1_SCLK_UART5_USER, "mout_peric1_sclk_uart5_user",
+	    peric1_mux_sclk_uart5_user_p, CLK_CON_MUX_SCLK_UART5_USER, 12, 1),
+};
+
+static const struct samsung_gate_clock peric1_gate_clks[] __initconst = {
+	GATE(CLK_GOUT_PERIC1_PCLK_SPI7, "gout_peric1_pclk_spi7",
+	     "mout_peric1_aclk_peric1_66_user", CG_CTRL_VAL_ACLK_PERIC1_66, 25,
+	     0, 0),
+	GATE(CLK_GOUT_PERIC1_PCLK_SPI6, "gout_peric1_pclk_spi6",
+	     "mout_peric1_aclk_peric1_66_user", CG_CTRL_VAL_ACLK_PERIC1_66, 24,
+	     0, 0),
+	GATE(CLK_GOUT_PERIC1_PCLK_SPI5, "gout_peric1_pclk_spi5",
+	     "mout_peric1_aclk_peric1_66_user", CG_CTRL_VAL_ACLK_PERIC1_66, 23,
+	     0, 0),
+	GATE(CLK_GOUT_PERIC1_PCLK_SPI4, "gout_peric1_pclk_spi4",
+	     "mout_peric1_aclk_peric1_66_user", CG_CTRL_VAL_ACLK_PERIC1_66, 22,
+	     0, 0),
+	GATE(CLK_GOUT_PERIC1_PCLK_SPI3, "gout_peric1_pclk_spi3",
+	     "mout_peric1_aclk_peric1_66_user", CG_CTRL_VAL_ACLK_PERIC1_66, 21,
+	     0, 0),
+	GATE(CLK_GOUT_PERIC1_PCLK_SPI2, "gout_peric1_pclk_spi2",
+	     "mout_peric1_aclk_peric1_66_user", CG_CTRL_VAL_ACLK_PERIC1_66, 20,
+	     0, 0),
+	GATE(CLK_GOUT_PERIC1_PCLK_SPI1, "gout_peric1_pclk_spi1",
+	     "mout_peric1_aclk_peric1_66_user", CG_CTRL_VAL_ACLK_PERIC1_66, 19,
+	     0, 0),
+	GATE(CLK_GOUT_PERIC1_PCLK_SPI0, "gout_peric1_pclk_spi0",
+	     "mout_peric1_aclk_peric1_66_user", CG_CTRL_VAL_ACLK_PERIC1_66, 18,
+	     0, 0),
+	GATE(CLK_GOUT_PERIC1_PCLK_UART5, "gout_peric1_pclk_uart5",
+	     "mout_peric1_aclk_peric1_66_user", CG_CTRL_VAL_ACLK_PERIC1_66, 17,
+	     0, 0),
+	GATE(CLK_GOUT_PERIC1_PCLK_UART4, "gout_peric1_pclk_uart4",
+	     "mout_peric1_aclk_peric1_66_user", CG_CTRL_VAL_ACLK_PERIC1_66, 16,
+	     0, 0),
+	GATE(CLK_GOUT_PERIC1_PCLK_UART3, "gout_peric1_pclk_uart3",
+	     "mout_peric1_aclk_peric1_66_user", CG_CTRL_VAL_ACLK_PERIC1_66, 15,
+	     0, 0),
+	GATE(CLK_GOUT_PERIC1_PCLK_UART2, "gout_peric1_pclk_uart2",
+	     "mout_peric1_aclk_peric1_66_user", CG_CTRL_VAL_ACLK_PERIC1_66, 14,
+	     0, 0),
+	GATE(CLK_GOUT_PERIC1_PCLK_UART1, "gout_peric1_pclk_uart1",
+	     "mout_peric1_aclk_peric1_66_user", CG_CTRL_VAL_ACLK_PERIC1_66, 13,
+	     0, 0),
+	GATE(CLK_GOUT_PERIC1_PCLK_GPIO_ESE, "gout_peric1_pclk_gpio_ese",
+	     "mout_peric1_aclk_peric1_66_user", CG_CTRL_VAL_ACLK_PERIC1_66, 12,
+	     0, 0),
+	GATE(CLK_GOUT_PERIC1_PCLK_GPIO_FF, "gout_peric1_pclk_gpio_ff",
+	     "mout_peric1_aclk_peric1_66_user", CG_CTRL_VAL_ACLK_PERIC1_66, 11,
+	     0, 0),
+	GATE(CLK_GOUT_PERIC1_PCLK_GPIO_TOUCH, "gout_peric1_pclk_gpio_touch",
+	     "mout_peric1_aclk_peric1_66_user", CG_CTRL_VAL_ACLK_PERIC1_66, 10,
+	     0, 0),
+	GATE(CLK_GOUT_PERIC1_PCLK_GPIO_NFC, "gout_peric1_pclk_gpio_nfc",
+	     "mout_peric1_aclk_peric1_66_user", CG_CTRL_VAL_ACLK_PERIC1_66, 9,
+	     0, 0),
+	GATE(CLK_GOUT_PERIC1_PCLK_GPIO_PERIC1, "gout_peric1_pclk_gpio_peric1",
+	     "mout_peric1_aclk_peric1_66_user", CG_CTRL_VAL_ACLK_PERIC1_66, 8,
+	     0, 0),
+	GATE(CLK_GOUT_PERIC1_PCLK_SYSREG_PERIC1,
+	     "gout_peric1_pclk_sysreg_peric1",
+	     "mout_peric1_aclk_peric1_66_user", CG_CTRL_VAL_ACLK_PERIC1_66, 7,
+	     0, 0),
+	GATE(CLK_GOUT_PERIC1_PCLK_PMU_PERIC1, "gout_peric1_pclk_pmu_peric1",
+	     "mout_peric1_aclk_peric1_66_user", CG_CTRL_VAL_ACLK_PERIC1_66, 6,
+	     0, 0),
+	GATE(CLK_GOUT_PERIC1_PCLK_CMU_PERIC1, "gout_peric1_pclk_cmu_peric1",
+	     "mout_peric1_aclk_peric1_66_user", CG_CTRL_VAL_ACLK_PERIC1_66, 5,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_PERIC1_ACLK_AXI2APB_PERIC1_2P,
+	     "gout_peric1_aclk_axi2apb_peric1_2p",
+	     "mout_peric1_aclk_peric1_66_user", CG_CTRL_VAL_ACLK_PERIC1_66, 4,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_PERIC1_ACLK_AXI2APB_PERIC1_1P,
+	     "gout_peric1_aclk_axi2apb_peric1_1p",
+	     "mout_peric1_aclk_peric1_66_user", CG_CTRL_VAL_ACLK_PERIC1_66, 3,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_PERIC1_ACLK_AXI2APB_PERIC1_0P,
+	     "gout_peric1_aclk_axi2apb_peric1_0p",
+	     "mout_peric1_aclk_peric1_66_user", CG_CTRL_VAL_ACLK_PERIC1_66, 2,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_PERIC1_ACLK_XIU_PERIC1SFRX,
+	     "gout_peric1_aclk_xiu_peric1sfrx",
+	     "mout_peric1_aclk_peric1_66_user", CG_CTRL_VAL_ACLK_PERIC1_66, 1,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_PERIC1_ACLK_AXILHASYNCM_PERIC1,
+	     "gout_peric1_aclk_axilhasyncm_peric1",
+	     "mout_peric1_aclk_peric1_66_user", CG_CTRL_VAL_ACLK_PERIC1_66, 0,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_PERIC1_PCLK_HSI2C14, "gout_peric1_pclk_hsi2c14",
+	     "mout_peric1_aclk_peric1_66_user",
+	     CG_CTRL_VAL_ACLK_PERIC1_66_HSI2C, 7, 0, 0),
+	GATE(CLK_GOUT_PERIC1_PCLK_HSI2C13, "gout_peric1_pclk_hsi2c13",
+	     "mout_peric1_aclk_peric1_66_user",
+	     CG_CTRL_VAL_ACLK_PERIC1_66_HSI2C, 6, 0, 0),
+	GATE(CLK_GOUT_PERIC1_PCLK_HSI2C12, "gout_peric1_pclk_hsi2c12",
+	     "mout_peric1_aclk_peric1_66_user",
+	     CG_CTRL_VAL_ACLK_PERIC1_66_HSI2C, 5, 0, 0),
+	GATE(CLK_GOUT_PERIC1_PCLK_HSI2C8, "gout_peric1_pclk_hsi2c8",
+	     "mout_peric1_aclk_peric1_66_user",
+	     CG_CTRL_VAL_ACLK_PERIC1_66_HSI2C, 4, 0, 0),
+	GATE(CLK_GOUT_PERIC1_PCLK_HSI2C7, "gout_peric1_pclk_hsi2c7",
+	     "mout_peric1_aclk_peric1_66_user",
+	     CG_CTRL_VAL_ACLK_PERIC1_66_HSI2C, 3, 0, 0),
+	GATE(CLK_GOUT_PERIC1_PCLK_HSI2C6, "gout_peric1_pclk_hsi2c6",
+	     "mout_peric1_aclk_peric1_66_user",
+	     CG_CTRL_VAL_ACLK_PERIC1_66_HSI2C, 2, 0, 0),
+	GATE(CLK_GOUT_PERIC1_PCLK_HSI2C3, "gout_peric1_pclk_hsi2c3",
+	     "mout_peric1_aclk_peric1_66_user",
+	     CG_CTRL_VAL_ACLK_PERIC1_66_HSI2C, 1, 0, 0),
+	GATE(CLK_GOUT_PERIC1_PCLK_HSI2C2, "gout_peric1_pclk_hsi2c2",
+	     "mout_peric1_aclk_peric1_66_user",
+	     CG_CTRL_VAL_ACLK_PERIC1_66_HSI2C, 0, 0, 0),
+	GATE(CLK_GOUT_PERIC1_SCLK_SPI0, "gout_peric1_sclk_spi0",
+	     "mout_peric1_sclk_spi0_user", CG_CTRL_VAL_SCLK_SPI0, 0, 0, 0),
+	GATE(CLK_GOUT_PERIC1_SCLK_SPI1, "gout_peric1_sclk_spi1",
+	     "mout_peric1_sclk_spi1_user", CG_CTRL_VAL_SCLK_SPI1, 0, 0, 0),
+	GATE(CLK_GOUT_PERIC1_SCLK_SPI2, "gout_peric1_sclk_spi2",
+	     "mout_peric1_sclk_spi2_user", CG_CTRL_VAL_SCLK_SPI2, 0, 0, 0),
+	GATE(CLK_GOUT_PERIC1_SCLK_SPI3, "gout_peric1_sclk_spi3",
+	     "mout_peric1_sclk_spi3_user", CG_CTRL_VAL_SCLK_SPI3, 0, 0, 0),
+	GATE(CLK_GOUT_PERIC1_SCLK_SPI4, "gout_peric1_sclk_spi4",
+	     "mout_peric1_sclk_spi4_user", CG_CTRL_VAL_SCLK_SPI4, 0, 0, 0),
+	GATE(CLK_GOUT_PERIC1_SCLK_SPI5, "gout_peric1_sclk_spi5",
+	     "mout_peric1_sclk_spi5_user", CG_CTRL_VAL_SCLK_SPI5, 0, 0, 0),
+	GATE(CLK_GOUT_PERIC1_SCLK_SPI6, "gout_peric1_sclk_spi6",
+	     "mout_peric1_sclk_spi6_user", CG_CTRL_VAL_SCLK_SPI6, 0, 0, 0),
+	GATE(CLK_GOUT_PERIC1_SCLK_SPI7, "gout_peric1_sclk_spi7",
+	     "mout_peric1_sclk_spi7_user", CG_CTRL_VAL_SCLK_SPI7, 0, 0, 0),
+	GATE(CLK_GOUT_PERIC1_SCLK_UART1, "gout_peric1_sclk_uart1",
+	     "mout_peric1_sclk_uart1_user", CG_CTRL_VAL_SCLK_UART1, 0, 0, 0),
+	GATE(CLK_GOUT_PERIC1_SCLK_UART2, "gout_peric1_sclk_uart2",
+	     "mout_peric1_sclk_uart2_user", CG_CTRL_VAL_SCLK_UART2, 0, 0, 0),
+	GATE(CLK_GOUT_PERIC1_SCLK_UART3, "gout_peric1_sclk_uart3",
+	     "mout_peric1_sclk_uart3_user", CG_CTRL_VAL_SCLK_UART3, 0, 0, 0),
+	GATE(CLK_GOUT_PERIC1_SCLK_UART4, "gout_peric1_sclk_uart4",
+	     "mout_peric1_sclk_uart4_user", CG_CTRL_VAL_SCLK_UART4, 0, 0, 0),
+	GATE(CLK_GOUT_PERIC1_SCLK_UART5, "gout_peric1_sclk_uart5",
+	     "mout_peric1_sclk_uart5_user", CG_CTRL_VAL_SCLK_UART5, 0, 0, 0),
+};
+
+static const struct samsung_cmu_info peric1_cmu_info __initconst = {
+	.mux_clks		= peric1_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(peric1_mux_clks),
+	.gate_clks		= peric1_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(peric1_gate_clks),
+	.nr_clk_ids		= PERIC1_NR_CLK,
+	.clk_regs		= peric1_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(peric1_clk_regs),
+};
+
+static int __init exynos8890_cmu_probe(struct platform_device *pdev)
+{
+	const struct samsung_cmu_info *info;
+	struct device *dev = &pdev->dev;
+
+	info = of_device_get_match_data(dev);
+	exynos8890_init_clocks(dev->of_node, info);
+	samsung_cmu_register_one(dev->of_node, info);
+
+	return 0;
+}
+
+static const struct of_device_id exynos8890_cmu_of_match[] = {
+	{
+		.compatible = "samsung,exynos8890-cmu-apollo",
+		.data = &apollo_cmu_info,
+	}, {
+		.compatible = "samsung,exynos8890-cmu-aud",
+		.data = &aud_cmu_info,
+	}, {
+		.compatible = "samsung,exynos8890-cmu-bus0",
+		.data = &bus0_cmu_info,
+	}, {
+		.compatible = "samsung,exynos8890-cmu-bus1",
+		.data = &bus1_cmu_info,
+	}, {
+		.compatible = "samsung,exynos8890-cmu-ccore",
+		.data = &ccore_cmu_info,
+	}, {
+		.compatible = "samsung,exynos8890-cmu-disp0",
+		.data = &disp0_cmu_info,
+	}, {
+		.compatible = "samsung,exynos8890-cmu-disp1",
+		.data = &disp1_cmu_info,
+	}, {
+		.compatible = "samsung,exynos8890-cmu-fsys0",
+		.data = &fsys0_cmu_info,
+	}, {
+		.compatible = "samsung,exynos8890-cmu-fsys1",
+		.data = &fsys1_cmu_info,
+	}, {
+		.compatible = "samsung,exynos8890-cmu-g3d",
+		.data = &g3d_cmu_info,
+	}, {
+		.compatible = "samsung,exynos8890-cmu-mif0",
+		.data = &mif0_cmu_info,
+	}, {
+		.compatible = "samsung,exynos8890-cmu-mif1",
+		.data = &mif1_cmu_info,
+	}, {
+		.compatible = "samsung,exynos8890-cmu-mif2",
+		.data = &mif2_cmu_info,
+	}, {
+		.compatible = "samsung,exynos8890-cmu-mif3",
+		.data = &mif3_cmu_info,
+	}, {
+		.compatible = "samsung,exynos8890-cmu-mngs",
+		.data = &mngs_cmu_info,
+	}, {
+		.compatible = "samsung,exynos8890-cmu-peric0",
+		.data = &peric0_cmu_info,
+	}, {
+		.compatible = "samsung,exynos8890-cmu-peric1",
+		.data = &peric1_cmu_info,
+	},
+	{ },
+};
+
+static struct platform_driver exynos8890_cmu_driver __refdata = {
+	.driver = {
+		.name = "exynos8890-cmu",
+		.of_match_table = exynos8890_cmu_of_match,
+		.suppress_bind_attrs = true,
+	},
+	.probe = exynos8890_cmu_probe,
+};
+
+static int __init exynos8890_cmu_init(void)
+{
+	return platform_driver_register(&exynos8890_cmu_driver);
+}
+core_initcall(exynos8890_cmu_init);
-- 
2.43.0


