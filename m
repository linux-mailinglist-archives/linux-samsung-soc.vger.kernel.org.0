Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BF90ADC8C
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  9 Sep 2019 17:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388935AbfIIP5a (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 9 Sep 2019 11:57:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:41188 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387886AbfIIP5a (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Sep 2019 11:57:30 -0400
Received: from localhost.localdomain (unknown [194.230.155.145])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4C73B21920;
        Mon,  9 Sep 2019 15:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568044650;
        bh=txx6fjNW+yD7Yjrg5RVtc6d5okKUDAGyirsR0YkwY7M=;
        h=From:To:Subject:Date:From;
        b=PDjn5+15Mk3M8whbyOUZOPBjsRWMu4Ge5FsGh1c6LeMrmSFKIYJEJNy/yyA/kN8pv
         Eyb8Bv/Jamj/KGoKTkpNKwQnp7caTAq8otWRIbeYo3pHMRlJWBGxY7ykJDQlfaC2tq
         dGycDUy/JTwt5NX9k1BABpSznNBXIAgC59WAdPAo=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sangbeom Kim <sbkim73@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [RESEND PATCH] regulator: s2mps11: Consistently use local variable
Date:   Mon,  9 Sep 2019 17:57:23 +0200
Message-Id: <20190909155723.24734-1-krzk@kernel.org>
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
index 054baaadfdfd..5bc00884cf51 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -1226,7 +1226,7 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 			goto out;
 		}
 
-		if (s2mps11->ext_control_gpiod[i]) {
+		if (config.ena_gpiod) {
 			ret = s2mps14_pmic_enable_ext_control(s2mps11,
 					regulator);
 			if (ret < 0) {
-- 
2.17.1

