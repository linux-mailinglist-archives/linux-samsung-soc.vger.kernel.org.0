Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 884296C9522
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 26 Mar 2023 16:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232388AbjCZOci (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 26 Mar 2023 10:32:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232375AbjCZOch (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:37 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A7A07A8F
        for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Mar 2023 07:32:34 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ4-0007kx-CV; Sun, 26 Mar 2023 16:32:28 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ3-006rYz-Lv; Sun, 26 Mar 2023 16:32:27 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ2-0088U9-RW; Sun, 26 Mar 2023 16:32:26 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 006/117] media: s5p_cec: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:30:33 +0200
Message-Id: <20230326143224.572654-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1775; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=tcL5tkmuSnS1HmL16JCmXlgKNGuUJ0rYD9dyuN308RI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFZ9l7PCy4kTO1trNzbj+ciNYh9efVmRJt/RW G9iM/wommaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWfQAKCRCPgPtYfRL+ TjAxCACYlbgxZ3vtA7orhIDBO1GfWZ5YMpAmrpb3TuUcz7zhPFbfjOe7YgIlYmQ5BbWhpk8TgpX EvoHt845y/GnxBsYEx3d7oVYZyv0J7fr2V5fYQIai0HgxJXHKsOFxMBDC0ddjbZwsnYy9O4JuBG LKIkWoYCTEzG8iQgJwazfLOOiwgVHV9UJB5zKLqXxZQU1eggfbOMCH8STL/P7xEoGEwzZ/SU5AF sOLQUaeJs/7XaHVTtArKHCsAp4Pr9rgE5ZXwsNIxQreVWIxznM0BLd0KQOceFmI/AzOV0DKJz09 8JfW+0OordTnpai/X3cNIKqB2deGntXcxa/+hlEIXO1GdBrM
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/media/cec/platform/s5p/s5p_cec.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/cec/platform/s5p/s5p_cec.c b/drivers/media/cec/platform/s5p/s5p_cec.c
index 0a30e7acdc10..51ab4a80aafe 100644
--- a/drivers/media/cec/platform/s5p/s5p_cec.c
+++ b/drivers/media/cec/platform/s5p/s5p_cec.c
@@ -249,14 +249,13 @@ static int s5p_cec_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int s5p_cec_remove(struct platform_device *pdev)
+static void s5p_cec_remove(struct platform_device *pdev)
 {
 	struct s5p_cec_dev *cec = platform_get_drvdata(pdev);
 
 	cec_notifier_cec_adap_unregister(cec->notifier, cec->adap);
 	cec_unregister_adapter(cec->adap);
 	pm_runtime_disable(&pdev->dev);
-	return 0;
 }
 
 static int __maybe_unused s5p_cec_runtime_suspend(struct device *dev)
@@ -295,7 +294,7 @@ MODULE_DEVICE_TABLE(of, s5p_cec_match);
 
 static struct platform_driver s5p_cec_pdrv = {
 	.probe	= s5p_cec_probe,
-	.remove	= s5p_cec_remove,
+	.remove_new = s5p_cec_remove,
 	.driver	= {
 		.name		= CEC_NAME,
 		.of_match_table	= s5p_cec_match,
-- 
2.39.2

