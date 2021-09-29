Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F182841BB53
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 29 Sep 2021 01:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243450AbhI1X6w (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 28 Sep 2021 19:58:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243489AbhI1X6n (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Sep 2021 19:58:43 -0400
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73785C061753
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Sep 2021 16:57:00 -0700 (PDT)
Received: by mail-qk1-x74a.google.com with SMTP id j19-20020a05620a411300b0045dc3262e59so3031898qko.22
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Sep 2021 16:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=vr0wJpYVwT3Wf5W9z3LnDmKiASoPIRkm5Y4SX8T/B5k=;
        b=kVj2HdM4TMb0AZXD1FVelYqajEn71wPdxCt1MylacuFcuLnC28OvEM6vzlnJnrNIfQ
         dtZDs/s8QIyZAFdlN8dSTFjJNzgRhbHRsK+Yy2UNBNgHAJxxeF82Zxx13tleu7Gq5vSI
         f6n5rGfRw6Zwmc4jARyZrnxwzIxDOzX3YuemP1rs2aVbnmnkuE5nXxz1CPXsQvjOAW99
         /FDrzGBP4EHHeAP+vl7lQ2ZCFwtXlryWd6Q1A4n3XEVmqnqcsnflNQwsm+HdIj9tBG5X
         MpYtsMrMB8cwoIm5LgbGqlwSll3rWTy4IuyIfj+N77lzL6s1D1tO9AJ9NnAmq97KvpWH
         VfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=vr0wJpYVwT3Wf5W9z3LnDmKiASoPIRkm5Y4SX8T/B5k=;
        b=vKBftqIMCciZjvybcUACnrbQHkbqjLs+nfiI1df+IPzL/4tNPlgG2UbFk3zPf7kvkL
         CcPh8xW+fNOna3MRow7PRz1Lo2ASxuIg/C/I2YECf2pLnU5f7BMRe8jKkS4iPf2YHySD
         OLa4p5u/+K2xozYqY3Xm0whKkk2/4eI824eOAVo7VA7BU+1eBNO9c2TcDZc1LiGa5+PS
         pGIpaUdDWErwPlEqCZWjUVV+YGQ6NJLytkt4zEfYJn+/ZAF7ZqL4jwug8bAryT+r0Qwc
         c8aL0O/RZF3vQsZSrv5vtO245OOnHyfDb1h65hxVPJKaKIKmQNwyzAz3s6qgA6GpuBNt
         /8Dg==
X-Gm-Message-State: AOAM53269+HHtuwg/TFBTLNZqlseYd53dVdU0mKVCs+Q5bMaEPsneJNa
        6Mz79w9KO/ucymrjR/3gzpf6ZcOHYe0lR6ETGBk=
X-Google-Smtp-Source: ABdhPJzVWvnFzcOenwV1KFMPgwyLHTY5xI3xxVNlgn4OW95Xjc374MNho/692ny5HZjJ8ThoLixN4aO9xsiIYMO9SYs=
X-Received: from willmcvicker.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:a05:6214:3ac:: with SMTP id
 m12mr8367504qvy.9.1632873419629; Tue, 28 Sep 2021 16:56:59 -0700 (PDT)
Date:   Tue, 28 Sep 2021 23:56:21 +0000
In-Reply-To: <20210928235635.1348330-1-willmcvicker@google.com>
Message-Id: <20210928235635.1348330-5-willmcvicker@google.com>
Mime-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
Subject: [PATCH v2 04/12] clk: samsung: exynos5433: update apollo and atlas
 clock probing
From:   Will McVicker <willmcvicker@google.com>
To:     Russell King <linux@armlinux.org.uk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Saravana Kannan <saravanak@google.com>,
        Will McVicker <willmcvicker@google.com>,
        kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use the samsung common clk driver to initialize and probe the apollo and
atlas clocks. This removes their dedicated init functions and uses the
platform driver to handle the probing.

Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/clk/samsung/clk-exynos5433.c | 130 ++++++++++-----------------
 1 file changed, 49 insertions(+), 81 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index f203074d858b..b45f6a65ba64 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -3675,47 +3675,28 @@ static const struct exynos_cpuclk_cfg_data exynos5433_apolloclk_d[] __initconst
 	{  0 },
 };
 
-static void __init exynos5433_cmu_apollo_init(struct device_node *np)
-{
-	void __iomem *reg_base;
-	struct samsung_clk_provider *ctx;
-	struct clk_hw **hws;
-
-	reg_base = of_iomap(np, 0);
-	if (!reg_base) {
-		panic("%s: failed to map registers\n", __func__);
-		return;
-	}
-
-	ctx = samsung_clk_init(np, reg_base, APOLLO_NR_CLK);
-	if (!ctx) {
-		panic("%s: unable to allocate ctx\n", __func__);
-		return;
-	}
-
-	samsung_clk_register_pll(ctx, apollo_pll_clks,
-				 ARRAY_SIZE(apollo_pll_clks), reg_base);
-	samsung_clk_register_mux(ctx, apollo_mux_clks,
-				 ARRAY_SIZE(apollo_mux_clks));
-	samsung_clk_register_div(ctx, apollo_div_clks,
-				 ARRAY_SIZE(apollo_div_clks));
-	samsung_clk_register_gate(ctx, apollo_gate_clks,
-				  ARRAY_SIZE(apollo_gate_clks));
-
-	hws = ctx->clk_data.hws;
-
-	exynos_register_cpu_clock(ctx, CLK_SCLK_APOLLO, "apolloclk",
-		hws[CLK_MOUT_APOLLO_PLL], hws[CLK_MOUT_BUS_PLL_APOLLO_USER], 0x200,
-		exynos5433_apolloclk_d, ARRAY_SIZE(exynos5433_apolloclk_d),
-		CLK_CPU_HAS_E5433_REGS_LAYOUT);
-
-	samsung_clk_sleep_init(reg_base, apollo_clk_regs,
-			       ARRAY_SIZE(apollo_clk_regs));
-
-	samsung_clk_of_add_provider(np, ctx);
-}
-CLK_OF_DECLARE(exynos5433_cmu_apollo, "samsung,exynos5433-cmu-apollo",
-		exynos5433_cmu_apollo_init);
+static const struct samsung_cpu_clock apollo_cpu_clks[] __initconst = {
+	CPU_CLK(CLK_SCLK_APOLLO, "apolloclk", "mout_apollo_pll",
+			"mout_bus_pll_apollo_user",
+			CLK_CPU_HAS_E5433_REGS_LAYOUT, 0x200,
+			exynos5433_apolloclk_d),
+};
+
+static const struct samsung_cmu_info apollo_cmu_info __initconst = {
+	.pll_clks	= apollo_pll_clks,
+	.nr_pll_clks	= ARRAY_SIZE(apollo_pll_clks),
+	.mux_clks	= apollo_mux_clks,
+	.nr_mux_clks	= ARRAY_SIZE(apollo_mux_clks),
+	.div_clks	= apollo_div_clks,
+	.nr_div_clks	= ARRAY_SIZE(apollo_div_clks),
+	.gate_clks	= apollo_gate_clks,
+	.nr_gate_clks	= ARRAY_SIZE(apollo_gate_clks),
+	.cpu_clks	= apollo_cpu_clks,
+	.nr_cpu_clks	= ARRAY_SIZE(apollo_cpu_clks),
+	.nr_clk_ids	= APOLLO_NR_CLK,
+	.clk_regs	= apollo_clk_regs,
+	.nr_clk_regs	= ARRAY_SIZE(apollo_clk_regs),
+};
 
 /*
  * Register offset definitions for CMU_ATLAS
@@ -3932,47 +3913,28 @@ static const struct exynos_cpuclk_cfg_data exynos5433_atlasclk_d[] __initconst =
 	{  0 },
 };
 
-static void __init exynos5433_cmu_atlas_init(struct device_node *np)
-{
-	void __iomem *reg_base;
-	struct samsung_clk_provider *ctx;
-	struct clk_hw **hws;
-
-	reg_base = of_iomap(np, 0);
-	if (!reg_base) {
-		panic("%s: failed to map registers\n", __func__);
-		return;
-	}
-
-	ctx = samsung_clk_init(np, reg_base, ATLAS_NR_CLK);
-	if (!ctx) {
-		panic("%s: unable to allocate ctx\n", __func__);
-		return;
-	}
-
-	samsung_clk_register_pll(ctx, atlas_pll_clks,
-				 ARRAY_SIZE(atlas_pll_clks), reg_base);
-	samsung_clk_register_mux(ctx, atlas_mux_clks,
-				 ARRAY_SIZE(atlas_mux_clks));
-	samsung_clk_register_div(ctx, atlas_div_clks,
-				 ARRAY_SIZE(atlas_div_clks));
-	samsung_clk_register_gate(ctx, atlas_gate_clks,
-				  ARRAY_SIZE(atlas_gate_clks));
-
-	hws = ctx->clk_data.hws;
-
-	exynos_register_cpu_clock(ctx, CLK_SCLK_ATLAS, "atlasclk",
-		hws[CLK_MOUT_ATLAS_PLL], hws[CLK_MOUT_BUS_PLL_ATLAS_USER], 0x200,
-		exynos5433_atlasclk_d, ARRAY_SIZE(exynos5433_atlasclk_d),
-		CLK_CPU_HAS_E5433_REGS_LAYOUT);
-
-	samsung_clk_sleep_init(reg_base, atlas_clk_regs,
-			       ARRAY_SIZE(atlas_clk_regs));
+static const struct samsung_cpu_clock atlas_cpu_clks[] __initconst = {
+	CPU_CLK(CLK_SCLK_ATLAS, "atlasclk", "mout_atlas_pll",
+			"mout_bus_pll_atlas_user",
+			CLK_CPU_HAS_E5433_REGS_LAYOUT, 0x200,
+			exynos5433_atlasclk_d),
+};
 
-	samsung_clk_of_add_provider(np, ctx);
-}
-CLK_OF_DECLARE(exynos5433_cmu_atlas, "samsung,exynos5433-cmu-atlas",
-		exynos5433_cmu_atlas_init);
+static const struct samsung_cmu_info atlas_cmu_info __initconst = {
+	.pll_clks	= atlas_pll_clks,
+	.nr_pll_clks	= ARRAY_SIZE(atlas_pll_clks),
+	.mux_clks	= atlas_mux_clks,
+	.nr_mux_clks	= ARRAY_SIZE(atlas_mux_clks),
+	.div_clks	= atlas_div_clks,
+	.nr_div_clks	= ARRAY_SIZE(atlas_div_clks),
+	.gate_clks	= atlas_gate_clks,
+	.nr_gate_clks	= ARRAY_SIZE(atlas_gate_clks),
+	.cpu_clks	= atlas_cpu_clks,
+	.nr_cpu_clks	= ARRAY_SIZE(atlas_cpu_clks),
+	.nr_clk_ids	= ATLAS_NR_CLK,
+	.clk_regs	= atlas_clk_regs,
+	.nr_clk_regs	= ARRAY_SIZE(atlas_clk_regs),
+};
 
 /*
  * Register offset definitions for CMU_MSCL
@@ -5700,6 +5662,12 @@ static const struct of_device_id exynos5433_cmu_of_match[] = {
 	}, {
 		.compatible = "samsung,exynos5433-cmu-imem",
 		.data = &imem_cmu_info,
+	}, {
+		.compatible = "samsung,exynos5433-cmu-atlas",
+		.data = &atlas_cmu_info,
+	}, {
+		.compatible = "samsung,exynos5433-cmu-apollo",
+		.data = &apollo_cmu_info,
 	}, {
 	},
 };
-- 
2.33.0.685.g46640cef36-goog

