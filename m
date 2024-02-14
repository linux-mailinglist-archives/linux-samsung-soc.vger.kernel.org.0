Return-Path: <linux-samsung-soc+bounces-1937-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA0A8545FF
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 14 Feb 2024 10:35:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FE251C223B4
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 14 Feb 2024 09:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7619212E5C;
	Wed, 14 Feb 2024 09:34:49 +0000 (UTC)
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203F61AAB1
	for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Feb 2024 09:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707903289; cv=none; b=oqq/6lw31tUp3Bz4+mSDcH/jVR+idKxiUkwd8a32oDSg0qRv9jsg3kOVNQprWGi7DPHdryz+a7H546JFV+2AVEe9J4tZo2QTL2BvpXcJ1Qh+cXPi3nLogVWjiNfV73v2h1j+/W27NJC2uWj2UChOkN0d3Txde67YXn3n1++/b2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707903289; c=relaxed/simple;
	bh=nipCLLMDWvTbNQBD2/LQ6KGkbMAdcFJTiu0fWjzZ3NQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qbZVBBb6UVNzdxv5K2A9AkAMavUwH6td8zbXpCqJZigF54BV08WvWSp0fJS4KvnxA//XL7Xf7bbh0aEnl4V7HttqthN5JrxO5gQcEnibVxo7OqEJ8WHF9pjOsiOLsjZCqScq8iBoMPPSlIQfbnpTlCOmdfeP1AHm1UOfX7qTYJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBf2-0005Ss-Pr; Wed, 14 Feb 2024 10:34:36 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBey-000fEk-Pb; Wed, 14 Feb 2024 10:34:32 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBey-004Y6F-2J;
	Wed, 14 Feb 2024 10:34:32 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-pwm@vger.kernel.org
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH v6 097/164] pwm: samsung: Change prototype of helpers to prepare further changes
Date: Wed, 14 Feb 2024 10:32:24 +0100
Message-ID:  <33ea7d7fbf3be4a542ae8aafa213470c5831487e.1707900770.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5324; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=nipCLLMDWvTbNQBD2/LQ6KGkbMAdcFJTiu0fWjzZ3NQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlzIi6JSgJnfb/o/v1UGfK1a40dVFvZSJlDgqKg Xk6KeC51PSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZcyIugAKCRCPgPtYfRL+ TuvLB/4s6CYTlewRyBSFA8yqp2ewf3X+euU/JvyxQzepa8SVKlsrV4tnHeD+xFnp+RqgpAFO5JU e6LfiEBaE6UV0labcIneyRzPIjgbuMRflcg3lHFjscxkp8PxEdubdCq5O9AKwjVmzaDN0C8Q0IL KEITIuzA+A0qRlQL0GpLK9AFixeLfdELnSB89xosG1buGODiys5KZin48/E1FfYeIf+zOB8ST/6 qDxMp+WFilHpw2dDNO3wNip+D9kZNgjlcrssD/gJ6OIJCLrvZtov0n10aFN3rvxK62ucJo1XpHy CGuidjlALj1MtuKxTuNb5rqEi1HmUxIR0tZyroklEVeN7FhR
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org

This prepares the driver for further changes that will make it harder to
determine the pwm_chip from a given samsung_pwm_chip. To just not have
to do that, rework pwm_samsung_calc_tin() and pwm_samsung_parse_dt take
a pwm_chip. Also use the pwm_chip as driver data instead of the
samsung_pwm_chip.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/pwm/pwm-samsung.c | 41 ++++++++++++++++++++++-----------------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/drivers/pwm/pwm-samsung.c b/drivers/pwm/pwm-samsung.c
index 0f9a2a5e3ebc..ecd612adf19d 100644
--- a/drivers/pwm/pwm-samsung.c
+++ b/drivers/pwm/pwm-samsung.c
@@ -181,9 +181,10 @@ static unsigned long pwm_samsung_get_tin_rate(struct samsung_pwm_chip *our_chip,
 	return rate / (reg + 1);
 }
 
-static unsigned long pwm_samsung_calc_tin(struct samsung_pwm_chip *our_chip,
+static unsigned long pwm_samsung_calc_tin(struct pwm_chip *chip,
 					  unsigned int chan, unsigned long freq)
 {
+	struct samsung_pwm_chip *our_chip = to_samsung_pwm_chip(chip);
 	struct samsung_pwm_variant *variant = &our_chip->variant;
 	unsigned long rate;
 	struct clk *clk;
@@ -197,12 +198,12 @@ static unsigned long pwm_samsung_calc_tin(struct samsung_pwm_chip *our_chip,
 				return rate;
 		}
 
-		dev_warn(our_chip->chip.dev,
+		dev_warn(chip->dev,
 			"tclk of PWM %d is inoperational, using tdiv\n", chan);
 	}
 
 	rate = pwm_samsung_get_tin_rate(our_chip, chan);
-	dev_dbg(our_chip->chip.dev, "tin parent at %lu\n", rate);
+	dev_dbg(chip->dev, "tin parent at %lu\n", rate);
 
 	/*
 	 * Compare minimum PWM frequency that can be achieved with possible
@@ -329,7 +330,7 @@ static int __pwm_samsung_config(struct pwm_chip *chip, struct pwm_device *pwm,
 		dev_dbg(chip->dev, "duty_ns=%d, period_ns=%d (%u)\n",
 						duty_ns, period_ns, period);
 
-		tin_rate = pwm_samsung_calc_tin(our_chip, pwm->hwpwm, period);
+		tin_rate = pwm_samsung_calc_tin(chip, pwm->hwpwm, period);
 
 		dev_dbg(chip->dev, "tin_rate=%lu\n", tin_rate);
 
@@ -506,9 +507,10 @@ static const struct of_device_id samsung_pwm_matches[] = {
 };
 MODULE_DEVICE_TABLE(of, samsung_pwm_matches);
 
-static int pwm_samsung_parse_dt(struct samsung_pwm_chip *our_chip)
+static int pwm_samsung_parse_dt(struct pwm_chip *chip)
 {
-	struct device_node *np = our_chip->chip.dev->of_node;
+	struct samsung_pwm_chip *our_chip = to_samsung_pwm_chip(chip);
+	struct device_node *np = chip->dev->of_node;
 	const struct of_device_id *match;
 	struct property *prop;
 	const __be32 *cur;
@@ -522,7 +524,7 @@ static int pwm_samsung_parse_dt(struct samsung_pwm_chip *our_chip)
 
 	of_property_for_each_u32(np, "samsung,pwm-outputs", prop, cur, val) {
 		if (val >= SAMSUNG_PWM_NUM) {
-			dev_err(our_chip->chip.dev,
+			dev_err(chip->dev,
 				"%s: invalid channel index in samsung,pwm-outputs property\n",
 								__func__);
 			continue;
@@ -533,7 +535,7 @@ static int pwm_samsung_parse_dt(struct samsung_pwm_chip *our_chip)
 	return 0;
 }
 #else
-static int pwm_samsung_parse_dt(struct samsung_pwm_chip *our_chip)
+static int pwm_samsung_parse_dt(struct pwm_chip *chip)
 {
 	return -ENODEV;
 }
@@ -543,6 +545,7 @@ static int pwm_samsung_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct samsung_pwm_chip *our_chip;
+	struct pwm_chip *chip;
 	unsigned int chan;
 	int ret;
 
@@ -550,13 +553,14 @@ static int pwm_samsung_probe(struct platform_device *pdev)
 	if (our_chip == NULL)
 		return -ENOMEM;
 
-	our_chip->chip.dev = &pdev->dev;
-	our_chip->chip.ops = &pwm_samsung_ops;
-	our_chip->chip.npwm = SAMSUNG_PWM_NUM;
+	chip = &our_chip->chip;
+	chip->dev = &pdev->dev;
+	chip->ops = &pwm_samsung_ops;
+	chip->npwm = SAMSUNG_PWM_NUM;
 	our_chip->inverter_mask = BIT(SAMSUNG_PWM_NUM) - 1;
 
 	if (IS_ENABLED(CONFIG_OF) && pdev->dev.of_node) {
-		ret = pwm_samsung_parse_dt(our_chip);
+		ret = pwm_samsung_parse_dt(chip);
 		if (ret)
 			return ret;
 	} else {
@@ -593,9 +597,9 @@ static int pwm_samsung_probe(struct platform_device *pdev)
 	our_chip->tclk0 = devm_clk_get(&pdev->dev, "pwm-tclk0");
 	our_chip->tclk1 = devm_clk_get(&pdev->dev, "pwm-tclk1");
 
-	platform_set_drvdata(pdev, our_chip);
+	platform_set_drvdata(pdev, chip);
 
-	ret = pwmchip_add(&our_chip->chip);
+	ret = pwmchip_add(chip);
 	if (ret < 0) {
 		dev_err(dev, "failed to register PWM chip\n");
 		clk_disable_unprepare(our_chip->base_clk);
@@ -612,17 +616,18 @@ static int pwm_samsung_probe(struct platform_device *pdev)
 
 static void pwm_samsung_remove(struct platform_device *pdev)
 {
-	struct samsung_pwm_chip *our_chip = platform_get_drvdata(pdev);
+	struct pwm_chip *chip = platform_get_drvdata(pdev);
+	struct samsung_pwm_chip *our_chip = to_samsung_pwm_chip(chip);
 
-	pwmchip_remove(&our_chip->chip);
+	pwmchip_remove(chip);
 
 	clk_disable_unprepare(our_chip->base_clk);
 }
 
 static int pwm_samsung_resume(struct device *dev)
 {
-	struct samsung_pwm_chip *our_chip = dev_get_drvdata(dev);
-	struct pwm_chip *chip = &our_chip->chip;
+	struct pwm_chip *chip = dev_get_drvdata(dev);
+	struct samsung_pwm_chip *our_chip = to_samsung_pwm_chip(chip);
 	unsigned int i;
 
 	for (i = 0; i < SAMSUNG_PWM_NUM; i++) {
-- 
2.43.0


