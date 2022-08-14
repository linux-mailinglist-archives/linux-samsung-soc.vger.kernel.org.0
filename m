Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6865359211B
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 14 Aug 2022 17:34:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240628AbiHNPeB (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 14 Aug 2022 11:34:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231252AbiHNPda (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 14 Aug 2022 11:33:30 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84F092BC6;
        Sun, 14 Aug 2022 08:30:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 377A8B80B4D;
        Sun, 14 Aug 2022 15:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82022C4314B;
        Sun, 14 Aug 2022 15:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660491015;
        bh=dA6ZEuwj7DPqjItnEoT4QchiUOKqV/ohRsxC0LHDOW0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JXgTDBOABiffiVpBOZfuKphny11/sBUdu9XH6rSx2Le0+ZVvPZA6uVdOqfEH6zf70
         XT+PwuWuP6bVRzEJ2CfMTdAlTQAdh022fPxZwykUm9Rfon5nO7znLU6DQkYlWNO0OF
         +XNhlk0SHXW32KTur71FLx2az4mDKGfsqQyZCb+ZNkezdnfbeaIYZq7fDIVptgw/VE
         uwFhLg6X85kd9nPZcdsjSchYtw5p5/iUTDc/4XQRim15GqltX2tTk9F3sWI/ZpWeCR
         +JZgXJlG+dilyeW6aKnSGzf3vSDBNRud6Rv76FTJCpbkQ9wQZdiB+xXEd047ONjPJF
         ymIDFnjapy3Qw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Sasha Levin <sashal@kernel.org>,
        kishon@ti.com, linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 57/64] phy: samsung: phy-exynos-pcie: sanitize init/power_on callbacks
Date:   Sun, 14 Aug 2022 11:24:30 -0400
Message-Id: <20220814152437.2374207-57-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814152437.2374207-1-sashal@kernel.org>
References: <20220814152437.2374207-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Marek Szyprowski <m.szyprowski@samsung.com>

[ Upstream commit f2812227bb07e2eaee74253f11cea1576945df31 ]

The exynos-pcie driver called phy_power_on() before phy_init() for some
historical reasons. However the generic PHY framework assumes that the
proper sequence is to call phy_init() first, then phy_power_on(). The
operations done by both functions should be considered as one action and as
such they are called by the exynos-pcie driver (without doing anything
between them). The initialization is just a sequence of register writes,
which cannot be altered without breaking the hardware operation.

To match the generic PHY framework requirement, simply move all register
writes to the phy_init()/phy_exit() and drop power_on()/power_off()
callbacks. This way the driver will also work with the old (incorrect)
PHY initialization call sequence.

Link: https://lore.kernel.org/r/20220628220409.26545-1-m.szyprowski@samsung.com
Reported-by: Bjorn Helgaas <helgaas@kernel.org>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Reviewed-by: Chanho Park <chanho61.park@samsung.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-By: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/phy/samsung/phy-exynos-pcie.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos-pcie.c b/drivers/phy/samsung/phy-exynos-pcie.c
index 578cfe07d07a..53c9230c2907 100644
--- a/drivers/phy/samsung/phy-exynos-pcie.c
+++ b/drivers/phy/samsung/phy-exynos-pcie.c
@@ -51,6 +51,13 @@ static int exynos5433_pcie_phy_init(struct phy *phy)
 {
 	struct exynos_pcie_phy *ep = phy_get_drvdata(phy);
 
+	regmap_update_bits(ep->pmureg, EXYNOS5433_PMU_PCIE_PHY_OFFSET,
+			   BIT(0), 1);
+	regmap_update_bits(ep->fsysreg, PCIE_EXYNOS5433_PHY_GLOBAL_RESET,
+			   PCIE_APP_REQ_EXIT_L1_MODE, 0);
+	regmap_update_bits(ep->fsysreg, PCIE_EXYNOS5433_PHY_L1SUB_CM_CON,
+			   PCIE_REFCLK_GATING_EN, 0);
+
 	regmap_update_bits(ep->fsysreg,	PCIE_EXYNOS5433_PHY_COMMON_RESET,
 			   PCIE_PHY_RESET, 1);
 	regmap_update_bits(ep->fsysreg, PCIE_EXYNOS5433_PHY_MAC_RESET,
@@ -109,20 +116,7 @@ static int exynos5433_pcie_phy_init(struct phy *phy)
 	return 0;
 }
 
-static int exynos5433_pcie_phy_power_on(struct phy *phy)
-{
-	struct exynos_pcie_phy *ep = phy_get_drvdata(phy);
-
-	regmap_update_bits(ep->pmureg, EXYNOS5433_PMU_PCIE_PHY_OFFSET,
-			   BIT(0), 1);
-	regmap_update_bits(ep->fsysreg, PCIE_EXYNOS5433_PHY_GLOBAL_RESET,
-			   PCIE_APP_REQ_EXIT_L1_MODE, 0);
-	regmap_update_bits(ep->fsysreg, PCIE_EXYNOS5433_PHY_L1SUB_CM_CON,
-			   PCIE_REFCLK_GATING_EN, 0);
-	return 0;
-}
-
-static int exynos5433_pcie_phy_power_off(struct phy *phy)
+static int exynos5433_pcie_phy_exit(struct phy *phy)
 {
 	struct exynos_pcie_phy *ep = phy_get_drvdata(phy);
 
@@ -135,8 +129,7 @@ static int exynos5433_pcie_phy_power_off(struct phy *phy)
 
 static const struct phy_ops exynos5433_phy_ops = {
 	.init		= exynos5433_pcie_phy_init,
-	.power_on	= exynos5433_pcie_phy_power_on,
-	.power_off	= exynos5433_pcie_phy_power_off,
+	.exit		= exynos5433_pcie_phy_exit,
 	.owner		= THIS_MODULE,
 };
 
-- 
2.35.1

