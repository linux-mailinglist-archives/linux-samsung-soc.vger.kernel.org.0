Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA8E3DFF81
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  4 Aug 2021 12:42:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236763AbhHDKnJ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 4 Aug 2021 06:43:09 -0400
Received: from mslow1.mail.gandi.net ([217.70.178.240]:55681 "EHLO
        mslow1.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237473AbhHDKm5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Aug 2021 06:42:57 -0400
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 2C190C3CBC
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Aug 2021 10:42:43 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 462AAFF803;
        Wed,  4 Aug 2021 10:41:59 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 2/4] rtc: s5m: signal the core when alarm are not available
Date:   Wed,  4 Aug 2021 12:41:30 +0200
Message-Id: <20210804104133.5158-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210804104133.5158-1-alexandre.belloni@bootlin.com>
References: <20210804104133.5158-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Clear the RTC_FEATURE_ALARM bit to signal to the core when alarms are not
available to ensure the alarm callbacks are never called and userspace is
aware alarms are not supported.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-s5m.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 4c1596c55de8..ee195697e6c6 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -794,25 +794,20 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 
 	info->rtc_dev->ops = &s5m_rtc_ops;
 
-	err = devm_rtc_register_device(info->rtc_dev);
-	if (err)
-		return err;
-
 	if (!info->irq) {
-		dev_info(&pdev->dev, "Alarm IRQ not available\n");
-		return 0;
-	}
-
-	ret = devm_request_threaded_irq(&pdev->dev, info->irq, NULL,
-					s5m_rtc_alarm_irq, 0, "rtc-alarm0",
-					info);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Failed to request alarm IRQ: %d: %d\n",
-			info->irq, ret);
-		return ret;
+		clear_bit(RTC_FEATURE_ALARM, info->rtc_dev->features);
+	} else {
+		ret = devm_request_threaded_irq(&pdev->dev, info->irq, NULL,
+						s5m_rtc_alarm_irq, 0, "rtc-alarm0",
+						info);
+		if (ret < 0) {
+			dev_err(&pdev->dev, "Failed to request alarm IRQ: %d: %d\n",
+				info->irq, ret);
+			return ret;
+		}
 	}
 
-	return 0;
+	return devm_rtc_register_device(info->rtc_dev);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.31.1

