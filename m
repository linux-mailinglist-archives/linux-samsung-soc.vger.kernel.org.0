Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C0C7CE297
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  7 Oct 2019 15:04:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728350AbfJGND4 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 7 Oct 2019 09:03:56 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:49400 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728107AbfJGNDZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Oct 2019 09:03:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=GpM+rehdO7Dce//pJR+29v/6dn/QNkn9CgShWMuH7R4=; b=mKgVAl6qlpbm
        7o5bCGnN4sZyWpBLmY/O+cD/4iSp/vSz4jKy+gO0iDWEL2lIVJNAZHWwD02+P2ojyhLyeDLUtTX1L
        EtVj4KJ/u8QBIguLYZYlb5rCl+Fqe6Hu0HEfawUg4QD9jp+YBc3f4xQmVqI09Ypg7/McLSWHvPcK8
        cmqLE=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iHSfX-0003SL-Qs; Mon, 07 Oct 2019 13:03:19 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 4C63D274162F; Mon,  7 Oct 2019 14:03:19 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Sangbeom Kim <sbkim73@samsung.com>
Subject: Applied "regulator: s5m8767: switch to using devm_fwnode_gpiod_get" to the regulator tree
In-Reply-To:  <20191004231017.130290-2-dmitry.torokhov@gmail.com>
X-Patchwork-Hint: ignore
Message-Id: <20191007130319.4C63D274162F@ypsilon.sirena.org.uk>
Date:   Mon,  7 Oct 2019 14:03:19 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The patch

   regulator: s5m8767: switch to using devm_fwnode_gpiod_get

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 5be0e549e18f8ad7efa81b3e054ca094b7782f55 Mon Sep 17 00:00:00 2001
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 4 Oct 2019 16:10:11 -0700
Subject: [PATCH] regulator: s5m8767: switch to using devm_fwnode_gpiod_get

devm_gpiod_get_from_of_node() is being retired in favor of
devm_fwnode_gpiod_get_index(), that behaves similar to
devm_gpiod_get_index(), but can work with arbitrary firmware node. It
will also be able to support secondary software nodes.

Let's switch this driver over.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Link: https://lore.kernel.org/r/20191004231017.130290-2-dmitry.torokhov@gmail.com
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/s5m8767.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/s5m8767.c b/drivers/regulator/s5m8767.c
index 6ca27e9d5ef7..bdc07739e9a2 100644
--- a/drivers/regulator/s5m8767.c
+++ b/drivers/regulator/s5m8767.c
@@ -567,11 +567,10 @@ static int s5m8767_pmic_dt_parse_pdata(struct platform_device *pdev,
 			continue;
 		}
 
-		rdata->ext_control_gpiod = devm_gpiod_get_from_of_node(
+		rdata->ext_control_gpiod = devm_fwnode_gpiod_get(
 			&pdev->dev,
-			reg_np,
-			"s5m8767,pmic-ext-control-gpios",
-			0,
+			of_fwnode_handle(reg_np),
+			"s5m8767,pmic-ext-control",
 			GPIOD_OUT_HIGH | GPIOD_FLAGS_BIT_NONEXCLUSIVE,
 			"s5m8767");
 		if (PTR_ERR(rdata->ext_control_gpiod) == -ENOENT)
-- 
2.20.1

