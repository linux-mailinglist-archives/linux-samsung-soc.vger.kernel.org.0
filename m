Return-Path: <linux-samsung-soc+bounces-1085-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3278983322C
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 20 Jan 2024 02:30:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84E25283DC2
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 20 Jan 2024 01:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83BD32585;
	Sat, 20 Jan 2024 01:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gP8zg9uO"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E92F10E1
	for <linux-samsung-soc@vger.kernel.org>; Sat, 20 Jan 2024 01:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705714194; cv=none; b=o4QX4IFVIhkZCswt9mCR3U7qNQfYY0G0/Wsq2JcdmDuy6XjIAG+dLj8TD0EX0HJNABkgbEixzoEmTOlewdx5IY6eoNE6MveWKUvrzeHaed9DbJx4NkgtjBBd4ExD1yKY1wHaJRvhN9FM90xC+S+sqej0osYJg9HXiH06XiPzJHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705714194; c=relaxed/simple;
	bh=BR7xoy5W3LPWbQptYcf2iJltu/xk4+8rmPDTn6GrAH4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SNUKg2/jtE8pr+tn7KbUPuTTVRSRrq9Wpt2zkttJoaBS4lb7aPBeDu4k3hBrq/oxBBLTb6tuo9z0EXXa4GbExG6DZcgFTBS1GsnrCjxCb2wic1695OYC800fkoaxB2pXH5lUmfwsjuK93XH6jMlr4RlW5VDoYhOrCMJ14QruTrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gP8zg9uO; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-20503dc09adso810906fac.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Jan 2024 17:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705714191; x=1706318991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OiAeINAHEbA4QSp4GanARERww/s8c8StZ3DswG6gVls=;
        b=gP8zg9uOFPUr4QKRXErYyCEV4x7H8LKGUELOrhB/FBcyVP+3XruFP7KHD6HbRnozex
         GppbEo3Y2+eVI/Iv75NGirkDEinFyr5iu9wiGLAYsmzn7ALeURq8e/3nuGgW09n4BG+5
         KaJohJ17rDdJ1HImmxhZyf4+sMQEmhfOSvPXuxNM8TtGjkJs9RbPBcC4VuDKjyzVZ63m
         2NINYEAOWVqePO+ELrOwEF+ZTjIiNatYAW2YRaO5giVGYoAsKk8JKzAvCry4JY3eUeh7
         xJk39npoWYZBo083nvcORsA/8w4N9XlSXSB7Cy7pVQXH2m+icNNeykUVmS/otCS1exP0
         JxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705714191; x=1706318991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OiAeINAHEbA4QSp4GanARERww/s8c8StZ3DswG6gVls=;
        b=Jbwcrbjvbb3WNVBPHc6C3wTLNL2d2voMjKk1UWPU+6tu+tne8iP9cqqbwQlDvQbi+J
         ryLKH3u39yGBm4Fo3OigdBEDnfaztCSHtcTzBNHGWW8TllcM/muM82dlHKYZymBeVRTm
         uvdud05regeWU2JJsXLLm05z1uNPw9xAgOTH4FQ+Tjkh0PiH6aKzF+1z6tdThHcM4QQs
         E3V20wjYDTlZHHhf1ESUEWHkwnD7pCbUF3YrCVMUNg1hU7lhk8Bf6djCNUQe/juE+nB2
         q4jKV1mrpKJF8vbqwFHWhcBvtH/8IhFjyMKHb0LzFhAmVuzHLYkx519UQaw0o286n/Ng
         dvPw==
X-Gm-Message-State: AOJu0YwFagKlCZYs5uNs9AxlhlXuE0a52nHVb5pv6DjT+xBj/BpL7gYN
	MkShq1CY2xvwtLps7ww33EO1ZbR/IuGIJYERt77kiNaxz5Pe0ri1/SDOTXk3w6Q=
X-Google-Smtp-Source: AGHT+IGCqhbxZTgA94dqrit0WJyXjhs0T/W+NhL1uMYVrBrUorc68XG9wch3r5dGF/Amr7+Ro4J0pQ==
X-Received: by 2002:a05:6870:168a:b0:210:b468:6a5d with SMTP id j10-20020a056870168a00b00210b4686a5dmr673917oae.16.1705714191506;
        Fri, 19 Jan 2024 17:29:51 -0800 (PST)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id fl10-20020a056870494a00b00206be9c4e67sm1095296oab.11.2024.01.19.17.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 17:29:51 -0800 (PST)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-spi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 3/7] clk: samsung: exynos850: Add PDMA clocks
Date: Fri, 19 Jan 2024 19:29:44 -0600
Message-Id: <20240120012948.8836-4-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240120012948.8836-1-semen.protsenko@linaro.org>
References: <20240120012948.8836-1-semen.protsenko@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Peripheral DMA (PDMA) clocks in CMU_CORE controller:
  - PDMA_ACLK: clock for PDMA0 (regular DMA)
  - SPDMA_ACLK: clock for PDMA1 (secure DMA)

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/clk/samsung/clk-exynos850.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
index bdc1eef7d6e5..01913dc4eb27 100644
--- a/drivers/clk/samsung/clk-exynos850.c
+++ b/drivers/clk/samsung/clk-exynos850.c
@@ -26,7 +26,7 @@
 #define CLKS_NR_IS			(CLK_GOUT_IS_SYSREG_PCLK + 1)
 #define CLKS_NR_MFCMSCL			(CLK_GOUT_MFCMSCL_SYSREG_PCLK + 1)
 #define CLKS_NR_PERI			(CLK_GOUT_WDT1_PCLK + 1)
-#define CLKS_NR_CORE			(CLK_GOUT_SYSREG_CORE_PCLK + 1)
+#define CLKS_NR_CORE			(CLK_GOUT_SPDMA_CORE_ACLK + 1)
 #define CLKS_NR_DPU			(CLK_GOUT_DPU_SYSREG_PCLK + 1)
 
 /* ---- CMU_TOP ------------------------------------------------------------- */
@@ -1667,6 +1667,8 @@ CLK_OF_DECLARE(exynos850_cmu_peri, "samsung,exynos850-cmu-peri",
 #define CLK_CON_GAT_GOUT_CORE_GPIO_CORE_PCLK	0x2044
 #define CLK_CON_GAT_GOUT_CORE_MMC_EMBD_I_ACLK	0x20e8
 #define CLK_CON_GAT_GOUT_CORE_MMC_EMBD_SDCLKIN	0x20ec
+#define CLK_CON_GAT_GOUT_CORE_PDMA_ACLK		0x20f0
+#define CLK_CON_GAT_GOUT_CORE_SPDMA_ACLK	0x2124
 #define CLK_CON_GAT_GOUT_CORE_SSS_I_ACLK	0x2128
 #define CLK_CON_GAT_GOUT_CORE_SSS_I_PCLK	0x212c
 #define CLK_CON_GAT_GOUT_CORE_SYSREG_CORE_PCLK	0x2130
@@ -1683,6 +1685,8 @@ static const unsigned long core_clk_regs[] __initconst = {
 	CLK_CON_GAT_GOUT_CORE_GPIO_CORE_PCLK,
 	CLK_CON_GAT_GOUT_CORE_MMC_EMBD_I_ACLK,
 	CLK_CON_GAT_GOUT_CORE_MMC_EMBD_SDCLKIN,
+	CLK_CON_GAT_GOUT_CORE_PDMA_ACLK,
+	CLK_CON_GAT_GOUT_CORE_SPDMA_ACLK,
 	CLK_CON_GAT_GOUT_CORE_SSS_I_ACLK,
 	CLK_CON_GAT_GOUT_CORE_SSS_I_PCLK,
 	CLK_CON_GAT_GOUT_CORE_SYSREG_CORE_PCLK,
@@ -1726,6 +1730,10 @@ static const struct samsung_gate_clock core_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_MMC_EMBD_SDCLKIN, "gout_mmc_embd_sdclkin",
 	     "mout_core_mmc_embd_user", CLK_CON_GAT_GOUT_CORE_MMC_EMBD_SDCLKIN,
 	     21, CLK_SET_RATE_PARENT, 0),
+	GATE(CLK_GOUT_PDMA_CORE_ACLK, "gout_pdma_core_aclk",
+	     "mout_core_bus_user", CLK_CON_GAT_GOUT_CORE_PDMA_ACLK, 21, 0, 0),
+	GATE(CLK_GOUT_SPDMA_CORE_ACLK, "gout_spdma_core_aclk",
+	     "mout_core_bus_user", CLK_CON_GAT_GOUT_CORE_SPDMA_ACLK, 21, 0, 0),
 	GATE(CLK_GOUT_SSS_ACLK, "gout_sss_aclk", "mout_core_sss_user",
 	     CLK_CON_GAT_GOUT_CORE_SSS_I_ACLK, 21, 0, 0),
 	GATE(CLK_GOUT_SSS_PCLK, "gout_sss_pclk", "dout_core_busp",
-- 
2.39.2


