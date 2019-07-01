Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D22A44D95B
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 20 Jun 2019 20:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbfFTSfr (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 20 Jun 2019 14:35:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:34670 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725936AbfFTSfq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 20 Jun 2019 14:35:46 -0400
Received: from localhost.localdomain (unknown [194.230.155.186])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DBE0C206BF;
        Thu, 20 Jun 2019 18:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561055745;
        bh=xj5NKVILW1vXpyLmUm8wT730CqgsMjGhUJ8Q/bucuKc=;
        h=From:To:Cc:Subject:Date:From;
        b=IHiBkNAUXc40eLbfxLFFk4XKgP7QLJLbr3cOakWdWeP4372jCubtsYBhhitfB8Ojg
         3iP+fQyMON1vDjeunUQbG8zUtyj1MkBWHyCOAsVjif1t2BcPNu24AgbrbUjJV0NOQt
         Veg+ObXLWB4bEOKmYvTzszXwb4y5hAFQz7xO7gxg=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sangbeom Kim <sbkim73@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>, notify@kernel.org,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH 1/6] regulator: s2mps11: Consistently use local variable
Date:   Thu, 20 Jun 2019 20:35:25 +0200
Message-Id: <20190620183530.5386-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The value under 's2mps11->ext_control_gpiod[i]' is assigned to local
variable and used in probe in one place before.  Use it consistently
later so code will be easier to read.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/regulator/s2mps11.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index af9bf10b4c33..e155c58061af 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -1194,7 +1194,7 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 			goto out;
 		}
 
-		if (s2mps11->ext_control_gpiod[i]) {
+		if (config.ena_gpiod) {
 			ret = s2mps14_pmic_enable_ext_control(s2mps11,
 					regulator);
 			if (ret < 0) {
-- 
2.17.1

