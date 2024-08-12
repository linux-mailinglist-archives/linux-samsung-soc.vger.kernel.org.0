Return-Path: <linux-samsung-soc+bounces-4238-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9F694EE6B
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 12 Aug 2024 15:36:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB8C7B2411F
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 12 Aug 2024 13:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D0A184555;
	Mon, 12 Aug 2024 13:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OG6wDyTa"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E69184526
	for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Aug 2024 13:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723469672; cv=none; b=pIwbLVBvI9PlqzOOX+ZmgN0jYaahKqQqv3qtfxgKnHEzHeI4YumDRfGvJMqE4ExEMuSv5oQGE1bDFyuXIBgHClp9RG1mfW6m9oSE/h9tQ4R1CJ+A4uESwdpBD3yXrPgDGxYJGQAZMjs2fx1lLHR+iqv/MadGcCDAqx1HAAFjO+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723469672; c=relaxed/simple;
	bh=IlxS+D8E+Bo6nHEepn+0mTB7t42TrSmGndFVSzcMSuk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B1FCQJJYo3KeDieWyIWvNw4ORdT2X6Zp+bpXtm9rDWANZ1BlWNrJYX7zujVnQ1t9k1MjgGsZsZcnlAmr3Il0rTYxwEcJBc2raQmK26K2HCgYiUX9KM2NNLI2gEdtToEGbID5FwT8e4ES3+dmr4H0fSiIr2xeqJJ+zAtoXrzmKj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OG6wDyTa; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-428141be2ddso32745895e9.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Aug 2024 06:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723469669; x=1724074469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2vRtjY9RoJ4lkxTaWAaQzIhkuMec1ZzRbTb9Hn16sHA=;
        b=OG6wDyTawd/3werPYRuF9y8q0ToceWZYEzRt4u00yzLBDlZCr3Eio02O9eU8/CKnm2
         uO4MCfjSXLm2+5aBNFscI5wDkXrLAyJ1q7GaYaTDngRN5Q1iCwQc+h+PlywjD3VKRJUJ
         kec5LTmq3BRx8nCcHcu+nQGd2FBCA+XNmLiYBgd/NT7R0QRc2Wf02PnmVfLdTYtGxxC9
         vCDdztXill5VdbdqXy4h/36/agwAIDd56K1+5QjED4fkjWGcmZFPeO7uspMC3xTgJ/U2
         FjJFHw/W0U9EmD4cw1Fz4QjGepCxUkJCtq0vp0qa7lq5XdcCSM2HkUD0VEo4PsGwuQqZ
         HtvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723469669; x=1724074469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2vRtjY9RoJ4lkxTaWAaQzIhkuMec1ZzRbTb9Hn16sHA=;
        b=Fw66VrQ6vcoRICAooj0J+XLTy7lVRQu6orYI51Kx2m1Xzqgk19Z27fypu3oaxaPfjS
         fXVX77VEfLjfNbM3oNrxGX7er8MA4QsXxllKofcOQ1sqnmOmk/UFjO0ddre+xOgf6R6P
         gUKsg4ho68aWCf9kC5hlbvwAZOQOKolZFkT1fLJ+HQQH1VJZPNU+0J/rdOkR3ZrFB6P6
         8/goQmXnsSatY65uHS/riUIuDRdMJJu8XSkwi2Exm5IQZo26vZFj2Mao73imPKiFdF/U
         4bmHpa0FiKcd4M8CyGwSX56zJztL4SnmuJOCvVb5rhx/iPpTnASFEEugrd4RGGMvPY6E
         0GRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdT15sKUYzNi5qJ2wPKSbTKWKkbAx8u1Z6Snvg4TgwyvT+I0tCVL7MusaJZ0We95m6jQMdUPgFYYcToo1dZG7YwCVfckjatCTfXYOii7rNqVs=
X-Gm-Message-State: AOJu0YwpPYxHrA2aa57OuSWeX8uQWzZA5CCVijhutEpTCXFyCPNsgAxb
	+3+SkeKh9KeWnIuxkV1Is7xubOgw4h9M4AlWJ5jvPfPM9C7OWmbGUcA3peuAVdk=
X-Google-Smtp-Source: AGHT+IEEUwAlG76HjxJAsyK8S8T/mYq4aEjAVVfNn3IzdOaUbHmzoELCalL3YkqLxnDddPuKFudeRg==
X-Received: by 2002:a05:600c:138b:b0:428:10ec:e5ca with SMTP id 5b1f17b1804b1-429d4801e5dmr2984845e9.14.1723469668894;
        Mon, 12 Aug 2024 06:34:28 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429c7737c64sm102733975e9.31.2024.08.12.06.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 06:34:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 12 Aug 2024 15:34:00 +0200
Subject: [PATCH 6/9] memory: tegra124-emc: simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240812-cleanup-h-of-node-put-memory-v1-6-5065a8f361d2@linaro.org>
References: <20240812-cleanup-h-of-node-put-memory-v1-0-5065a8f361d2@linaro.org>
In-Reply-To: <20240812-cleanup-h-of-node-put-memory-v1-0-5065a8f361d2@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Lukasz Luba <lukasz.luba@arm.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1246;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=IlxS+D8E+Bo6nHEepn+0mTB7t42TrSmGndFVSzcMSuk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmug9WY865X4GH2lunkVHCyM14mLujFcZgf8J78
 qI8SrlTVxaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZroPVgAKCRDBN2bmhouD
 10aeD/41meg3/8L8q4GOxl5Jxe+3hlN0PEmllVJ2SQY0syA/bR9hZ5HnHZrvd8TUzKepy5Pr/iy
 SDdFyfaLYElBSZYUrpBIJ0eSCjbPuaUaT3FfClCW3EVZXO+OxFPD/NC6IY1HJyaiegFT0SWc68G
 z7Qa0sL2FuqN0bItr5eRrGgOAN+nscmxIw4WqKd7VgPoDTN44IskG7JMI/CPEnJuGPhY5xqzCfr
 iYjP38QLXnQz1Qh9LZdeRg8hS+5HkEwTaqNoBE0kd3JiYjkxdR/5GUQEWeit8zufS8B1DM4/Rc6
 hQSZm6PkJDv9n5P9hLBD+ufLVQKJdYdfJVEC8iraYg/e06vlLB/elPsn/+qb/yM6alFuOb8AfDd
 Fi4yVboCoRyJuvc+V7wKvfz/TcqI2iqSmJNaJmzxtFeNxbsIp7lPMD8LyxYy3l3xQXW5DHKaRvA
 z6JJ4JSxAbNYluLpGBJZCTHl+fIUhU3S0CgxZH5GNnIgvq4Rf6HgIZIL4zky6HtPopfmW9TQAvH
 M6qgaLDwO8DwsDv5Bw1IF3VS0SxwBLiWxLQV1iVKRJiXcpLhDUReB4QFLv1X7ycVnOaouhNPrdb
 eavRIJkAtuQb6YhgpqUazX1eq/fCPLnT/sCa0s59ys02ye5w9qbbg0GqzWnGenksh6pnzHYOsX7
 fBP6UmhbugpR3vw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_child_of_node_scoped() when iterating over device
nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/tegra/tegra124-emc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index 47c0c19e13fd..03f1daa2d132 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -992,7 +992,6 @@ static int tegra_emc_load_timings_from_dt(struct tegra_emc *emc,
 					  struct device_node *node)
 {
 	int child_count = of_get_child_count(node);
-	struct device_node *child;
 	struct emc_timing *timing;
 	unsigned int i = 0;
 	int err;
@@ -1004,14 +1003,12 @@ static int tegra_emc_load_timings_from_dt(struct tegra_emc *emc,
 
 	emc->num_timings = child_count;
 
-	for_each_child_of_node(node, child) {
+	for_each_child_of_node_scoped(node, child) {
 		timing = &emc->timings[i++];
 
 		err = load_one_timing_from_dt(emc, timing, child);
-		if (err) {
-			of_node_put(child);
+		if (err)
 			return err;
-		}
 	}
 
 	sort(emc->timings, emc->num_timings, sizeof(*timing), cmp_timings,

-- 
2.43.0


