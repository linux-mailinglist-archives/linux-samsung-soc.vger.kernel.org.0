Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D5BB141006
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 17 Jan 2020 18:41:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728773AbgAQRl3 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 17 Jan 2020 12:41:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:39812 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727573AbgAQRl3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 17 Jan 2020 12:41:29 -0500
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AA7922082F;
        Fri, 17 Jan 2020 17:41:28 +0000 (UTC)
Received: from rostedt by gandalf.local.home with local (Exim 4.93)
        (envelope-from <rostedt@goodmis.org>)
        id 1isVcd-000QMZ-Jp; Fri, 17 Jan 2020 12:41:27 -0500
Message-Id: <20200117174127.480853193@goodmis.org>
User-Agent: quilt/0.65
Date:   Fri, 17 Jan 2020 12:41:12 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     linux-kernel@vger.kernel.org,
        linux-rt-users <linux-rt-users@vger.kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Carsten Emde <C.Emde@osadl.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        John Kacur <jkacur@redhat.com>,
        Julia Cartwright <julia@ni.com>,
        Daniel Wagner <wagi@monom.org>,
        Tom Zanussi <zanussi@kernel.org>,
        Benjamin Rouxel <benjamin.rouxel@uva.nl>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH RT 01/32] i2c: exynos5: Remove IRQF_ONESHOT
References: <20200117174111.282847363@goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

4.19.94-rt39-rc1 stable review patch.
If anyone has any objections, please let me know.

------------------

From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

[ Upstream commit 4b217df0ab3f7910c96e42091cc7d9f221d05f01 ]

The drivers sets IRQF_ONESHOT and passes only a primary handler. The IRQ
is masked while the primary is handler is invoked independently of
IRQF_ONESHOT.
With IRQF_ONESHOT the core code will not force-thread the interrupt and
this is probably not intended. I *assume* that the original author copied
the IRQ registration from another driver which passed a primary and
secondary handler and removed the secondary handler but keeping the
ONESHOT flag.

Remove IRQF_ONESHOT.

Reported-by: Benjamin Rouxel <benjamin.rouxel@uva.nl>
Tested-by: Benjamin Rouxel <benjamin.rouxel@uva.nl>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
---
 drivers/i2c/busses/i2c-exynos5.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index c1ce2299a76e..5c57ecf4b79e 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -800,9 +800,7 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
 	}
 
 	ret = devm_request_irq(&pdev->dev, i2c->irq, exynos5_i2c_irq,
-				IRQF_NO_SUSPEND | IRQF_ONESHOT,
-				dev_name(&pdev->dev), i2c);
-
+			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), i2c);
 	if (ret != 0) {
 		dev_err(&pdev->dev, "cannot request HS-I2C IRQ %d\n", i2c->irq);
 		goto err_clk;
-- 
2.24.1


