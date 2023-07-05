Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE380747F04
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  5 Jul 2023 10:07:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232426AbjGEIHL (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 5 Jul 2023 04:07:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbjGEIHK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Jul 2023 04:07:10 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A786E1716
        for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Jul 2023 01:07:06 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qGxXO-0003pF-Mg; Wed, 05 Jul 2023 10:06:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qGxXM-00CDNI-Cf; Wed, 05 Jul 2023 10:06:56 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qGxXL-002Oax-32; Wed, 05 Jul 2023 10:06:55 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-pwm@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH v2 2/8] pwm: samsung: Put per-channel data into driver data
Date:   Wed,  5 Jul 2023 10:06:44 +0200
Message-Id: <20230705080650.2353391-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230705080650.2353391-1-u.kleine-koenig@pengutronix.de>
References: <20230705080650.2353391-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3039; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=WbiUwtPhzGh+pbselDpueT/s8UBjYMzeiRbx+5zTqq4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkpSSPWvJ6AQIwKMYnjS7Qm+aJ2ek7MjuPpBH7p MJ+4ijKLIeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZKUkjwAKCRCPgPtYfRL+ Tk7gCACH0Fi8f0lpQzCKqkOQHd0QeL4SkQGmefCTrxSRQvwtBbKy+o302v6xpGPEKjJUA79eDCZ HzNohOGBi9Wiuy+pyp5XDtge9gayxEtbSTpTf+U9w/td4lQRNLn85Gcuv68rHOPRYk+AT8K2Oy+ lJ8WyTP2tRQZLqOrdV/XVj57oDmigWnh6EgGu7OyhwEm+qf60gp16M5hb9t5daSgEI52waGtxdZ OX7PU4Z2Uu7NEhT7M47+3rIn0Sl2SJ3VYHnXtnoPWx0pTeSBn3B+kh/TOGEe8Dwbm0B9uGLtatN RnI5l/2pqplhffD5HPM/FDQb71WHqKpQAmP9+YJe5Dnxplxu
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Instead of allocating extra data in .request() provide the needed memory
in struct samsung_pwm_chip. This reduces the number of allocations. Even
though now all 5 channel structs are allocated this is probably
outweighed by the reduced overhead to track up to 6 smaller allocations.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/pwm/pwm-samsung.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/pwm/pwm-samsung.c b/drivers/pwm/pwm-samsung.c
index e8828f57ab15..d1a2bc01071b 100644
--- a/drivers/pwm/pwm-samsung.c
+++ b/drivers/pwm/pwm-samsung.c
@@ -88,6 +88,7 @@ struct samsung_pwm_chip {
 	struct clk *base_clk;
 	struct clk *tclk0;
 	struct clk *tclk1;
+	struct samsung_pwm_channel channel[SAMSUNG_PWM_NUM];
 };
 
 #ifndef CONFIG_CLKSRC_SAMSUNG_PWM
@@ -228,7 +229,6 @@ static unsigned long pwm_samsung_calc_tin(struct samsung_pwm_chip *chip,
 static int pwm_samsung_request(struct pwm_chip *chip, struct pwm_device *pwm)
 {
 	struct samsung_pwm_chip *our_chip = to_samsung_pwm_chip(chip);
-	struct samsung_pwm_channel *our_chan;
 
 	if (!(our_chip->variant.output_mask & BIT(pwm->hwpwm))) {
 		dev_warn(chip->dev,
@@ -237,20 +237,11 @@ static int pwm_samsung_request(struct pwm_chip *chip, struct pwm_device *pwm)
 		return -EINVAL;
 	}
 
-	our_chan = kzalloc(sizeof(*our_chan), GFP_KERNEL);
-	if (!our_chan)
-		return -ENOMEM;
-
-	pwm_set_chip_data(pwm, our_chan);
+	memset(&our_chip->channel[pwm->hwpwm], 0, sizeof(our_chip->channel[pwm->hwpwm]));
 
 	return 0;
 }
 
-static void pwm_samsung_free(struct pwm_chip *chip, struct pwm_device *pwm)
-{
-	kfree(pwm_get_chip_data(pwm));
-}
-
 static int pwm_samsung_enable(struct pwm_chip *chip, struct pwm_device *pwm)
 {
 	struct samsung_pwm_chip *our_chip = to_samsung_pwm_chip(chip);
@@ -318,7 +309,7 @@ static int __pwm_samsung_config(struct pwm_chip *chip, struct pwm_device *pwm,
 				int duty_ns, int period_ns, bool force_period)
 {
 	struct samsung_pwm_chip *our_chip = to_samsung_pwm_chip(chip);
-	struct samsung_pwm_channel *chan = pwm_get_chip_data(pwm);
+	struct samsung_pwm_channel *chan = &our_chip->channel[pwm->hwpwm];
 	u32 tin_ns = chan->tin_ns, tcnt, tcmp, oldtcmp;
 
 	tcnt = readl(our_chip->base + REG_TCNTB(pwm->hwpwm));
@@ -473,7 +464,6 @@ static int pwm_samsung_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 
 static const struct pwm_ops pwm_samsung_ops = {
 	.request	= pwm_samsung_request,
-	.free		= pwm_samsung_free,
 	.apply		= pwm_samsung_apply,
 	.owner		= THIS_MODULE,
 };
@@ -639,9 +629,9 @@ static int pwm_samsung_resume(struct device *dev)
 
 	for (i = 0; i < SAMSUNG_PWM_NUM; i++) {
 		struct pwm_device *pwm = &chip->pwms[i];
-		struct samsung_pwm_channel *chan = pwm_get_chip_data(pwm);
+		struct samsung_pwm_channel *chan = &our_chip->channel[i];
 
-		if (!chan)
+		if (!(pwm->flags & PWMF_REQUESTED))
 			continue;
 
 		if (our_chip->variant.output_mask & BIT(i))
-- 
2.39.2

