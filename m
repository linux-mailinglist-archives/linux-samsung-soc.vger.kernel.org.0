Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8223C1AF826
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 19 Apr 2020 09:05:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbgDSHFl (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 19 Apr 2020 03:05:41 -0400
Received: from cmccmta3.chinamobile.com ([221.176.66.81]:10706 "EHLO
        cmccmta3.chinamobile.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgDSHFl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 19 Apr 2020 03:05:41 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.11]) by rmmx-syy-dmz-app11-12011 (RichMail) with SMTP id 2eeb5e9bf7f3f5e-b8207; Sun, 19 Apr 2020 15:04:20 +0800 (CST)
X-RM-TRANSID: 2eeb5e9bf7f3f5e-b8207
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.1.172.61])
        by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee65e9bf7f1b01-98e0f;
        Sun, 19 Apr 2020 15:04:20 +0800 (CST)
X-RM-TRANSID: 2ee65e9bf7f1b01-98e0f
From:   Tang Bin <tangbin@cmss.chinamobile.com>
To:     kgene@kernel.org, krzk@kernel.org, linux@armlinux.org.uk
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tang Bin <tangbin@cmss.chinamobile.com>,
        Shengju Zhang <zhangshengju@cmss.chinamobile.com>
Subject: [PATCH] ARM: samsung: Use devm_platform_ioremap_resource() to simplify code
Date:   Sun, 19 Apr 2020 15:06:07 +0800
Message-Id: <20200419070607.15488-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use devm_platform_ioremap_resource() instead of
platform_get_resource()+ devm_ioremap_resource().

Signed-off-by: Shengju Zhang <zhangshengju@cmss.chinamobile.com>
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 arch/arm/plat-samsung/adc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/plat-samsung/adc.c b/arch/arm/plat-samsung/adc.c
index 839bf7d5f..55b1925f6 100644
--- a/arch/arm/plat-samsung/adc.c
+++ b/arch/arm/plat-samsung/adc.c
@@ -333,7 +333,6 @@ static int s3c_adc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct adc_device *adc;
-	struct resource *regs;
 	enum s3c_cpu_type cpu = platform_get_device_id(pdev)->driver_data;
 	int ret;
 	unsigned tmp;
@@ -370,8 +369,7 @@ static int s3c_adc_probe(struct platform_device *pdev)
 		return PTR_ERR(adc->clk);
 	}
 
-	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	adc->regs = devm_ioremap_resource(dev, regs);
+	adc->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(adc->regs))
 		return PTR_ERR(adc->regs);
 
-- 
2.20.1.windows.1



