Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A331CE282
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  7 Oct 2019 15:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728052AbfJGNDV (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 7 Oct 2019 09:03:21 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:49240 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727716AbfJGNDV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Oct 2019 09:03:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=JUv5W88r1SVcQDN6DZBdoB+smrYd96kwwVVcehVYOQw=; b=Mhn7P3d0v8OW
        OgQuC64q+SUoXirzcYClIMYcsVo52SWMVbnQPVgYGSPTUxhYvtplJ3Oj3pzgZk5YG63nfeW8ROi+Q
        JDMPGar2+NewTi8mhT85tZ/AOY9vwGyvX8btaUsM4WRv/jHw5fGt4pMfsXoz21ZB3ErEHhXAjQfbX
        K+24U=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iHSfV-0003Rg-0O; Mon, 07 Oct 2019 13:03:17 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 7A7D9274162F; Mon,  7 Oct 2019 14:03:16 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Sangbeom Kim <sbkim73@samsung.com>
Subject: Applied "regulator: s2mps11: switch to using devm_fwnode_gpiod_get" to the regulator tree
In-Reply-To: <20191004231017.130290-5-dmitry.torokhov@gmail.com>
X-Patchwork-Hint: ignore
Message-Id: <20191007130316.7A7D9274162F@ypsilon.sirena.org.uk>
Date:   Mon,  7 Oct 2019 14:03:16 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The patch

   regulator: s2mps11: switch to using devm_fwnode_gpiod_get

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.5

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

From de2792b507675641885075bc99e283de861b1ce6 Mon Sep 17 00:00:00 2001
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 4 Oct 2019 16:10:14 -0700
Subject: [PATCH] regulator: s2mps11: switch to using devm_fwnode_gpiod_get

devm_gpiod_get_from_of_node() is being retired in favor of
devm_fwnode_gpiod_get_index(), that behaves similar to
devm_gpiod_get_index(), but can work with arbitrary firmware node. It
will also be able to support secondary software nodes.

Let's switch this driver over.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Link: https://lore.kernel.org/r/20191004231017.130290-5-dmitry.torokhov@gmail.com
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/s2mps11.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 5bc00884cf51..4f2dc5ebffdc 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -844,10 +844,9 @@ static void s2mps14_pmic_dt_parse_ext_control_gpio(struct platform_device *pdev,
 		if (!rdata[reg].init_data || !rdata[reg].of_node)
 			continue;
 
-		gpio[reg] = devm_gpiod_get_from_of_node(&pdev->dev,
-				rdata[reg].of_node,
-				"samsung,ext-control-gpios",
-				0,
+		gpio[reg] = devm_fwnode_gpiod_get(&pdev->dev,
+				of_fwnode_handle(rdata[reg].of_node),
+				"samsung,ext-control",
 				GPIOD_OUT_HIGH | GPIOD_FLAGS_BIT_NONEXCLUSIVE,
 				"s2mps11-regulator");
 		if (PTR_ERR(gpio[reg]) == -ENOENT)
-- 
2.20.1

