Return-Path: <linux-samsung-soc+bounces-7563-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C638FA6D1B0
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 23 Mar 2025 23:40:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA0E93AA068
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 23 Mar 2025 22:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD8B1E0087;
	Sun, 23 Mar 2025 22:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bqH2k5Wb"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3011DA617
	for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769574; cv=none; b=lvErr+/YIVXuCk89F6FGidC2J0LRBuIV/dZUOWIiuUXExgAt+n7tNuF/VfVoPNbpxeXR6GIPDytW16B3kBqfWmYEkX12fR48dBphnXhB+7xHEtS18wleywDGHEvsxVXZ1ZSsa1DPZMrSUSeNkBi1HPtrxY8WA1ia5ckzaQ02veE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769574; c=relaxed/simple;
	bh=aNL2ZMIsaWDhYzyM225HQs3M+JBebedfnAV5JfLB8LU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u2LfmksdcilxAdjPqqlRNgiCBq/S7HjEdL+XnG6c304sBtFIyZ95TmMM9AVQf5Rk5NwjhcidzhBnAacDGs0m65IpdJO8d0J/0QA1xmlZVbqkbMMFw/ZjdnTGUwq/x3JVLvAczM9k48wkKhNirPdNxWB4xeG2eEd+Nx4OCs1U3gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bqH2k5Wb; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac2a9a74d9cso776693466b.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769569; x=1743374369; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PkErzt1Ss+Bkd54SXbmEFKlCZnBrxlDz3Xe8Bme42SE=;
        b=bqH2k5WbpvoGhXCbaaGdtiyVBP2hZ8kMKQgAIxWxRiwhSejhXehUQCMhSmRSiyALDr
         VT3FIr3b9MoUZtqqDEQB2rfTPsII/q0fbva1yRX3xx+SZR36rGKpI6jUQyQmXaYLerRY
         mMbkZbSXgOYzr0EZlRYaDJS6NCu26n9d790TfwhqufvnUFbFp4JrNbszyTw8bt9XnbOr
         O1W0UjEA/l4LN79gT07zi+Sf+npmBIxzRxFO+WuXme/YPcCAlUeL7dK54p6m1OG52X/G
         X1ElnOccaR0fYrM5iBUmSn+r0Q6flBswUryzkpmWEIgW+HtSDugvkGCKfdyI/GrSsdqd
         Jo7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769569; x=1743374369;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PkErzt1Ss+Bkd54SXbmEFKlCZnBrxlDz3Xe8Bme42SE=;
        b=Zg+wAjxCfPMWzJOciLKHgyRARwpK2+gwOwbr+fQ574KDVs7ZG8IwIF3XzX6ntPs/wL
         cMBgz1nipKzEKGawsckJKyCrlkCG6fhIt9Ggt+Rrtg+RK8IOCTmSGG8msroLgjIqeBfm
         gqHaQiLj3Z7KULRMuLAI6wjtg8u1iqKyytwRnIF1CWBbgE9LTD7S5JjkSkjZjbKTUVpH
         Qae8Cf8I1zwKteWEimiBRVsouV03TJcs9awlAnfeMsLjBio6Cl+p2egcd6Kv3q5AjAvL
         VKLGHwZMrz7DVRUVX7ePeq74eeE/zO/esatwRQUluqJisQ7nOPajY166zp/KNym+enVU
         cEUA==
X-Forwarded-Encrypted: i=1; AJvYcCU+PtV7m0LSHGok5exgrkSvn0Sb6bJGUiO+P5lj1HPQO+L0ZbLhCdN3GiwMZTXshV/mkwClEtKqKBG/uL5TVRTrPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWxhokwoqvbX6rmcfKepmMnBUe7NPr232RHd0Lilkj6hOU7jPn
	vlVsy6BFEuoUndS4rxQtRrqLgQBwLXboY51K1Vj1NKDq55f8ESxg80aKRG6QfXg=
X-Gm-Gg: ASbGncueXQU0UjeZTvM8W7//OMNvO3Vhwgb/g7xlqjvAPBIQ9RuW5wBfx7CW2scANxj
	R84MCR/UiOYWCk4Uz1tIiuEpgtSxukJM8PN+t9KgYa/dNbYmGxgzpoAaEnC6nwOYnjMc7YlSFcD
	tdTsL2DZJDtdigaHrm+cyEEeAnOujZVixbP7BGRYktGt+xDBpcNATEZ28bbEjB4PMqu/99Rc94t
	MDH0QkytNrshGIE21LaPi4XrrtFYl8SdLv6+ex6pbCsgFRF84KqrhfJU7waMXAoiH+9Tk4vH/TG
	HBdcumAkwjsu+ijfVy2CBmtdMh/CkxUceluOPx+3PdnnYHiJvKfkiDfDlZ2oczbXbi24n1F2nox
	UrPr2VAkKGoZG3ImMjN1UJ9ktxOXL
X-Google-Smtp-Source: AGHT+IGAFdzsUecxR0Ot+aNtVjqQT9dbvewdjFSLK22DE4stZjNqeNVzWwfh7T1/N7CaL7vQgLskZA==
X-Received: by 2002:a17:907:ba0c:b0:ac2:4db0:1d22 with SMTP id a640c23a62f3a-ac3f251f16emr1170254266b.42.1742769568705;
        Sun, 23 Mar 2025 15:39:28 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:28 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:25 +0000
Subject: [PATCH 09/34] mfd: sec: slightly rework runtime platform data
 allocation
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-9-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

As a preparation for adding support for Samsung's S2MPG10, which is
connected via SPEEDY / ACPM rather than I2C, we're going to split out
(move) all I2C-specific driver code into its own kernel module, and
create a (common) core transport-agnostic kernel module.

Transport drivers will have to do device tree parsing, and the core
driver will allocate its own additional memory as needed.

In preparation for that change, separate out runtime platform data
allocation from device tree parsing.

Having this change will create less churn in the upcoming split of the
transport-specific parts.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-core.c | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index b931f66f366571d93ce59c301265fe1c9550b37d..9c514f4b5f853ec2b4e234c578935ffad145cd4b 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -262,27 +262,16 @@ static void sec_pmic_configure(struct sec_pmic_dev *sec_pmic)
  * Only the common platform data elements for s5m8767 are parsed here from the
  * device tree. Other sub-modules of s5m8767 such as pmic, rtc , charger and
  * others have to parse their own platform data elements from device tree.
- *
- * The s5m8767 platform data structure is instantiated here and the drivers for
- * the sub-modules need not instantiate another instance while parsing their
- * platform data.
  */
-static struct sec_platform_data *
-sec_pmic_i2c_parse_dt_pdata(struct device *dev)
+static void sec_pmic_i2c_parse_dt_pdata(struct device *dev,
+					struct sec_platform_data *pd)
 {
-	struct sec_platform_data *pd;
-
-	pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
-	if (!pd)
-		return ERR_PTR(-ENOMEM);
-
 	pd->manual_poweroff =
 		of_property_read_bool(dev->of_node,
 				      "samsung,s2mps11-acokb-ground");
 	pd->disable_wrstbi =
 		of_property_read_bool(dev->of_node,
 				      "samsung,s2mps11-wrstbi-ground");
-	return pd;
 }
 
 static int sec_pmic_probe(struct i2c_client *i2c)
@@ -303,11 +292,16 @@ static int sec_pmic_probe(struct i2c_client *i2c)
 	sec_pmic->i2c = i2c;
 	sec_pmic->irq = i2c->irq;
 
-	pdata = sec_pmic_i2c_parse_dt_pdata(sec_pmic->dev);
-	if (IS_ERR(pdata)) {
-		ret = PTR_ERR(pdata);
-		return ret;
-	}
+	/*
+	 * The s5m8767 platform data structure is instantiated here and the
+	 * drivers for the sub-modules need not instantiate another instance
+	 * while parsing their platform data.
+	 */
+	pdata = devm_kzalloc(sec_pmic->dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return -ENOMEM;
+
+	sec_pmic_i2c_parse_dt_pdata(sec_pmic->dev, pdata);
 
 	sec_pmic->device_type = (unsigned long)of_device_get_match_data(sec_pmic->dev);
 	sec_pmic->pdata = pdata;

-- 
2.49.0.395.g12beb8f557-goog


