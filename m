Return-Path: <linux-samsung-soc+bounces-324-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C9D800F47
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  1 Dec 2023 17:11:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E43E2B2128F
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  1 Dec 2023 16:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A1F24C630;
	Fri,  1 Dec 2023 16:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uc6YCJPV"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 987BA1700
	for <linux-samsung-soc@vger.kernel.org>; Fri,  1 Dec 2023 08:11:06 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-33332096330so466390f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Dec 2023 08:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701447065; x=1702051865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Na4sCZBqaYV+EJVudDdf2S+Yg7btkgpmOTYDQ5k6d0U=;
        b=uc6YCJPVde22bqtky5lQvb3U/I6xP+dCUyiXjzO/KJOkh5raZ6bd0NRnm1tkG/e9q5
         MsmPtiFE+0ublZZnBbQn55Ol38H7hI2eylmqZ6YJMoPJA+gvejh06COue05ip3+BCkTw
         JQw5HTbDrXMexXH03omkbNrtKFoQ9s2kuFijwp5JKXRdKJFAAql9yHCIjm8VpmZgpyVM
         2ibQDTo8Ah+I8kN6PF6h3KmSZDxvmKV2t2j5/Z7gvdFDb16Dq2o8jRcFujNtkcgNpfLT
         6urma8IxC5C+vpIrvfM6Cd5mR3qPQGP/rz88GbrWJIsJNVsbqWKLx03pCo/nAJDIEltG
         2Nng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701447065; x=1702051865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Na4sCZBqaYV+EJVudDdf2S+Yg7btkgpmOTYDQ5k6d0U=;
        b=Nzyqy1K+DpkFkGXhF4QdYSBaiul5ym6xyfULEmfooQlSk3unsmxsojDoyVyjY1X4gH
         +kMWQfRFPIVUVtisGMc6ejnCUykDE+jGrJGwGeQE7Os+JAFw4VfaGjvnxAVj3J9Y4iS2
         1TSVijkWCESfJpF+/YKYCgD+YuhCjKzMibE2Br/92UzZAixeJiCtaFSKTR7iblJ97Nll
         newCznO6r1YZQYTC3GvS805M0Z+vrIO21mrbGSQZNA6cVTTNoz5fRDhVSGafKOnMy4/s
         7Jmp7i06tSG200xn4QtzWq6oNstdAqsOc+hso8z1C//R/nJGhnZ9sXvA1yeAmJL+5eMz
         FdkA==
X-Gm-Message-State: AOJu0YwXic99uOsoBdMlNCz61U0L7x/G3S6/sKxYH6/Ol8YFfhxdVlSK
	gj5su+bOrRiS5NMIQ/Vs5LfQFQ==
X-Google-Smtp-Source: AGHT+IGy8yElejPyYySJIajsgPiQMaC0muWo5E2zC9em+q/Gq3ClRVAOr7CPCFcYQtfWeHbthyy8Iw==
X-Received: by 2002:adf:ce8e:0:b0:333:e01:c265 with SMTP id r14-20020adfce8e000000b003330e01c265mr899191wrn.8.1701447065182;
        Fri, 01 Dec 2023 08:11:05 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id cg16-20020a5d5cd0000000b003332656cd73sm3907386wrb.105.2023.12.01.08.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 08:11:04 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com
Cc: peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel-team@android.com,
	linux-serial@vger.kernel.org
Subject: [PATCH v5 11/20] clk: samsung: clk-pll: Add support for pll_{0516,0517,518}
Date: Fri,  1 Dec 2023 16:09:16 +0000
Message-ID: <20231201160925.3136868-12-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231201160925.3136868-1-peter.griffin@linaro.org>
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These plls are found in the Tensor gs101 SoC found in the Pixel 6.

pll0516x: Integer PLL with high frequency
pll0517x: Integer PLL with middle frequency
pll0518x: Integer PLL with low frequency

PLL0516x
FOUT = (MDIV * 2 * FIN)/PDIV * 2^SDIV)

PLL0517x and PLL0518x
FOUT = (MDIV * FIN)/PDIV*2^SDIV)

The PLLs are similar enough to pll_0822x that the same code can handle
both. The main difference is the change in the fout formula for the
high frequency 0516 pll.

Locktime for 516,517 & 518 is 150 the same as the pll_0822x lock factor.
MDIV, SDIV PDIV masks and bit shifts are also the same as 0822x.

When defining the PLL the "con" parameter should be set to CON3
register, like this

PLL(pll_0517x, CLK_FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
    PLL_LOCKTIME_PLL_SHARED0, PLL_CON3_PLL_SHARED0,
    NULL),

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Will McVicker <willmcvicker@google.com>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/clk/samsung/clk-pll.c | 6 ++++++
 drivers/clk/samsung/clk-pll.h | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 74934c6182ce..4bbdf5e91650 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -443,6 +443,9 @@ static unsigned long samsung_pll0822x_recalc_rate(struct clk_hw *hw,
 	sdiv = (pll_con3 >> PLL0822X_SDIV_SHIFT) & PLL0822X_SDIV_MASK;
 
 	fvco *= mdiv;
+	if (pll->type == pll_0516x)
+		fvco *= 2;
+
 	do_div(fvco, (pdiv << sdiv));
 
 	return (unsigned long)fvco;
@@ -1316,6 +1319,9 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	case pll_1417x:
 	case pll_0818x:
 	case pll_0822x:
+	case pll_0516x:
+	case pll_0517x:
+	case pll_0518x:
 		pll->enable_offs = PLL0822X_ENABLE_SHIFT;
 		pll->lock_offs = PLL0822X_LOCK_STAT_SHIFT;
 		if (!pll->rate_table)
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index 0725d485c6ee..ffd3d52c0dec 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -38,6 +38,9 @@ enum samsung_pll_type {
 	pll_0822x,
 	pll_0831x,
 	pll_142xx,
+	pll_0516x,
+	pll_0517x,
+	pll_0518x,
 };
 
 #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
-- 
2.43.0.rc2.451.g8631bc7472-goog


