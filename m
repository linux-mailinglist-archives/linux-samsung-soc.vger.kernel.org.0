Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD1C27B48B5
	for <lists+linux-samsung-soc@lfdr.de>; Sun,  1 Oct 2023 19:03:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235209AbjJARDd (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 1 Oct 2023 13:03:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235213AbjJARDd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 1 Oct 2023 13:03:33 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68020C9
        for <linux-samsung-soc@vger.kernel.org>; Sun,  1 Oct 2023 10:03:30 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qmzqS-0005BF-PV; Sun, 01 Oct 2023 19:03:04 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qmzqM-00AKTW-E4; Sun, 01 Oct 2023 19:02:58 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qmzqM-0079nP-4b; Sun, 01 Oct 2023 19:02:58 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Kukjin Kim <kgene.kim@samsung.com>,
        Siva Reddy Kallam <siva.kallam@samsung.com>,
        Surendranath Gurivireddy Balla <suren.reddy@samsung.com>
Cc:     Rob Herring <robh@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 1/4] PCI: exynos: Don't put .remove callback in .exit.text section
Date:   Sun,  1 Oct 2023 19:02:51 +0200
Message-Id: <20231001170254.2506508-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231001170254.2506508-1-u.kleine-koenig@pengutronix.de>
References: <20231001170254.2506508-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1702; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=OoB8V0QN2YibVFa/pOcDY8n94rmziBnKkvfd2aYMT2s=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlGaY4WoQOHcFdBW70op0DsB7a0aHbc76X9IrOy 7eIIAcsLyyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZRmmOAAKCRCPgPtYfRL+ TjcVCACY4BPKl48mzPmYqDljwCPyRIyCeg+us3NyvvSoE3Pnb9v1cHyeeGmTGrcF64inCFWWHcw fPOgiF1Enprc+xZQZXyqr2V1E8baAV7jlDYN+d3hizbi6L157BI5DOgog10EplgsLB1sgYn9R7P YAYmUi79sPqKLg9TagPO4LM2FZF+DTbyJStkbRpPVXITsRDbwC1cb9zBXbS1+JGoKyQhqADc7FT 5BefF3GO1Ei+b13cW3mTkp7p+iUaoFxWYFSAqxYC83F3wMmuUsavXCNIhZ4qXSrCOPBl90VR5Bv 7occyEzH9nC3oLBaaqYV2mEP+sVa9csXVcysgiQz7jBAuAXc
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

With CONFIG_PCI_EXYNOS=y and exynos_pcie_remove() marked with __exit,
the function is discarded from the driver. In this case a bound device
can still get unbound, e.g via sysfs. Then no cleanup code is run
resulting in resource leaks or worse.

The right thing to do is do always have the remove callback available.
This fixes the following warning by modpost:

	WARNING: modpost: drivers/pci/controller/dwc/pci-exynos: section mismatch in reference: exynos_pcie_driver+0x8 (section: .data) -> exynos_pcie_remove (section: .exit.text)

(with ARCH=x86_64 W=1 allmodconfig).

Fixes: 340cba6092c2 ("pci: Add PCIe driver for Samsung Exynos")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/pci/controller/dwc/pci-exynos.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index 6319082301d6..c6bede346932 100644
--- a/drivers/pci/controller/dwc/pci-exynos.c
+++ b/drivers/pci/controller/dwc/pci-exynos.c
@@ -375,7 +375,7 @@ static int exynos_pcie_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int __exit exynos_pcie_remove(struct platform_device *pdev)
+static int exynos_pcie_remove(struct platform_device *pdev)
 {
 	struct exynos_pcie *ep = platform_get_drvdata(pdev);
 
@@ -431,7 +431,7 @@ static const struct of_device_id exynos_pcie_of_match[] = {
 
 static struct platform_driver exynos_pcie_driver = {
 	.probe		= exynos_pcie_probe,
-	.remove		= __exit_p(exynos_pcie_remove),
+	.remove		= exynos_pcie_remove,
 	.driver = {
 		.name	= "exynos-pcie",
 		.of_match_table = exynos_pcie_of_match,
-- 
2.40.1

