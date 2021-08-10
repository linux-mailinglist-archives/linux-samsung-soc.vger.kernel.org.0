Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C03753E2DAA
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  6 Aug 2021 17:22:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244581AbhHFPXD (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 6 Aug 2021 11:23:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244603AbhHFPWT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 Aug 2021 11:22:19 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D97A9C06136B
        for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Aug 2021 08:22:00 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id t9so18613860lfc.6
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Aug 2021 08:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LbWIWkb92WuK+in7BBT+KYzyiOlQmHXQ02Uw5+dkVz4=;
        b=ZXY9Cxw/FrJeV2CNeaL+VsXKpAeBzlEx7AtzlQz3O4IdIGtJNF1TpvxN7YioQ9fm6W
         m55T6DV5Yk9ib4alvt3mp/zcKaDYzxqBxykoqMxdziDUGstQySOgQUrQgPtN7iZSuI+6
         VmgVAbK2qAONJm2NhJsTFKc8b+TahUQwZyiwY5GL1DcmuqBPDha9qeSiNVly3OqpLlR7
         9cLea2sBntN5Zg0/MooJvu70YLGTH940Ry1gh3jh5sPiWCTe8A4DkCr4CXXwdcNvncyP
         gsVdP08ohWTnGaA0jo8fq3rRs3ggoya0ORepGhTFSJokztDPfg9R50Oi5lNwCU8ychBE
         uVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LbWIWkb92WuK+in7BBT+KYzyiOlQmHXQ02Uw5+dkVz4=;
        b=K5/cp9KUR+rcgY1glVQqZW8MA9bgAz43/x7l5b53gZBSG8hv0Fmx1rS3k4yPbGccLX
         oZXuEuaMMXs0Yzd2fuzGMg4bdq+l0aGoR+96CW0FPSkU2FLVaqZZo0c78ZpgzZfDz1Mb
         +sSpGpS1uz7tLNWA41/Ri7LcKK1FkQeYPbYH7PI/V1MCZ3lAIPwVPfXfMzdk3hzj3NSC
         CsNz9nBn0latYGnMAgoxsOxnqYf4bnlw+k3drImpUNEuHi/IB5SV9SKG3vseSwrykyWm
         en/HkEKqU7toBSkgS/iJ8Dipg33L4XvxXW4m6wTEqdM/duSSMIVksPOJyRSPuKRESjIR
         2LTQ==
X-Gm-Message-State: AOAM530qM56lWiBOeV2sql7PKcppvklLg6BqrfUMO3PlGlj85Jcdczbf
        4DifNCUKomiy5kr8dSvbVGCA0g==
X-Google-Smtp-Source: ABdhPJxuStLatcb8ra5mN7cfwnrWkACCZUHn1GXowOQhdqresviED3ffDFdn11WuXBwjrGdF+2n/Og==
X-Received: by 2002:a19:c754:: with SMTP id x81mr6415586lff.86.1628263319241;
        Fri, 06 Aug 2021 08:21:59 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id c3sm862281lfi.199.2021.08.06.08.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 08:21:58 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Cc:     Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: [PATCH v2 7/8] clk: samsung: Add Exynos850 clock driver stub
Date:   Fri,  6 Aug 2021 18:21:45 +0300
Message-Id: <20210806152146.16107-8-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210806152146.16107-1-semen.protsenko@linaro.org>
References: <20210806152146.16107-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

For now it's just a stub driver to make the serial driver work. Later it
will be implemented properly. This driver doesn't really change clocks,
only registers the UART clock as a fixed-rate clock. Without this clock
driver the UART driver won't work, as it's trying to obtain "uart" clock
and fails if it's not able to.

In order to get a functional serial console we have to implement that
minimal clock driver with "uart" clock. It's not necessary to actually
configure clocks, as those are already configured in bootloader, so
kernel can rely on that for now.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - Used hard coded clock indexes, as clock bindings were removed; will
    add clock bindings back (reimplemented) once proper clock driver is
    ready
  - Removed .data = 0 for exynos850-oscclk, as it's in BSS section
  - Removed comma for terminator {}
  - Made exynos850_clk_init() static
  - Removed checking np for NULL, as it's already done in of_iomap()

 drivers/clk/samsung/Makefile        |  1 +
 drivers/clk/samsung/clk-exynos850.c | 64 +++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 drivers/clk/samsung/clk-exynos850.c

diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
index 028b2e27a37e..c46cf11e4d0b 100644
--- a/drivers/clk/samsung/Makefile
+++ b/drivers/clk/samsung/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos5433.o
 obj-$(CONFIG_EXYNOS_AUDSS_CLK_CON) += clk-exynos-audss.o
 obj-$(CONFIG_EXYNOS_CLKOUT)	+= clk-exynos-clkout.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos7.o
+obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos850.o
 obj-$(CONFIG_S3C2410_COMMON_CLK)+= clk-s3c2410.o
 obj-$(CONFIG_S3C2410_COMMON_DCLK)+= clk-s3c2410-dclk.o
 obj-$(CONFIG_S3C2412_COMMON_CLK)+= clk-s3c2412.o
diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
new file mode 100644
index 000000000000..36c7c7fe7cf0
--- /dev/null
+++ b/drivers/clk/samsung/clk-exynos850.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2019 Samsung Electronics Co., Ltd.
+ * Copyright (C) 2021 Linaro Ltd.
+ *
+ * Common Clock Framework support for Exynos850 SoC.
+ */
+
+#include <linux/clk.h>
+#include <linux/clkdev.h>
+#include <linux/clk-provider.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+
+#include "clk.h"
+
+/* Will be extracted to bindings header once proper clk driver is implemented */
+#define OSCCLK		1
+#define DOUT_UART	2
+#define CLK_NR_CLKS	3
+
+/* Fixed rate clocks generated outside the SoC */
+static struct samsung_fixed_rate_clock exynos850_fixed_rate_ext_clks[] __initdata = {
+	FRATE(OSCCLK, "fin_pll", NULL, 0, 26000000),
+};
+
+/*
+ * Model the UART clock as a fixed-rate clock for now, to make serial driver
+ * work. This clock is already configured in the bootloader.
+ */
+static const struct samsung_fixed_rate_clock exynos850_peri_clks[] __initconst = {
+	FRATE(DOUT_UART, "DOUT_UART", NULL, 0, 200000000),
+};
+
+static const struct of_device_id ext_clk_match[] __initconst = {
+	{ .compatible = "samsung,exynos850-oscclk" },
+	{}
+};
+
+static void __init exynos850_clk_init(struct device_node *np)
+{
+	void __iomem *reg_base;
+	struct samsung_clk_provider *ctx;
+
+	reg_base = of_iomap(np, 0);
+	if (!reg_base)
+		panic("%s: failed to map registers\n", __func__);
+
+	ctx = samsung_clk_init(np, reg_base, CLK_NR_CLKS);
+	if (!ctx)
+		panic("%s: unable to allocate ctx\n", __func__);
+
+	samsung_clk_of_register_fixed_ext(ctx,
+			exynos850_fixed_rate_ext_clks,
+			ARRAY_SIZE(exynos850_fixed_rate_ext_clks),
+			ext_clk_match);
+
+	samsung_clk_register_fixed_rate(ctx, exynos850_peri_clks,
+			ARRAY_SIZE(exynos850_peri_clks));
+
+	samsung_clk_of_add_provider(np, ctx);
+}
+
+CLK_OF_DECLARE(exynos850_clk, "samsung,exynos850-clock", exynos850_clk_init);
-- 
2.30.2

