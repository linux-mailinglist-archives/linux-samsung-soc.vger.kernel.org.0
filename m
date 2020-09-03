Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC33D25C795
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  3 Sep 2020 18:57:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728409AbgICQ5Z (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 3 Sep 2020 12:57:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728465AbgICQ5Z (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Sep 2020 12:57:25 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77CA0C061247
        for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Sep 2020 09:57:24 -0700 (PDT)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kDsY5-0003YE-GK; Thu, 03 Sep 2020 18:57:22 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1kDsY3-005L3c-Mc; Thu, 03 Sep 2020 18:57:19 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     kernel@pengutronix.de, Laurent.pinchart@ideasonboard.com,
        krzk@kernel.org, narmstrong@baylibre.com,
        Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu,  3 Sep 2020 18:57:13 +0200
Message-Id: <20200903165717.1272492-13-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200903165717.1272492-1-m.tretter@pengutronix.de>
References: <20200903165717.1272492-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
        metis.ext.pengutronix.de
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=4.0 tests=BAYES_00,RDNS_NONE,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no autolearn_force=no
        version=3.4.2
Subject: [PATCH 12/16] drm/exynos: use identifier instead of register offsets
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Different revisions of the MIPI-DSI PHY have slightly different register
layouts. Currently, the register layout was stored per platform, which
makes it necessary to define the layout for each new platform.

Keep the register layout in the driver and use identifiers to specify
which register layout shall be used on a platform.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 54 ++++++++++++++++---------
 1 file changed, 36 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 21db18ae0772..287bc6e9b3ca 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -239,8 +239,13 @@ struct exynos_dsi_transfer {
 #define DSIM_STATE_CMD_LPM		BIT(2)
 #define DSIM_STATE_VIDOUT_AVAILABLE	BIT(3)
 
+enum exynos_reg_offset {
+	EXYNOS_REG_OFS,
+	EXYNOS5433_REG_OFS
+};
+
 struct exynos_dsi_driver_data {
-	const unsigned int *reg_ofs;
+	enum exynos_reg_offset reg_ofs;
 	unsigned int plltmr_reg;
 	unsigned int has_freqband:1;
 	unsigned int has_clklane_stop:1;
@@ -315,18 +320,6 @@ enum reg_idx {
 	NUM_REGS
 };
 
-static inline void exynos_dsi_write(struct exynos_dsi *dsi, enum reg_idx idx,
-				    u32 val)
-{
-
-	writel(val, dsi->reg_base + dsi->driver_data->reg_ofs[idx]);
-}
-
-static inline u32 exynos_dsi_read(struct exynos_dsi *dsi, enum reg_idx idx)
-{
-	return readl(dsi->reg_base + dsi->driver_data->reg_ofs[idx]);
-}
-
 static const unsigned int exynos_reg_ofs[] = {
 	[DSIM_STATUS_REG] =  0x00,
 	[DSIM_SWRST_REG] =  0x04,
@@ -375,6 +368,31 @@ static const unsigned int exynos5433_reg_ofs[] = {
 	[DSIM_PHYTIMING2_REG] = 0xBC,
 };
 
+static inline void exynos_dsi_write(struct exynos_dsi *dsi, enum reg_idx idx,
+				    u32 val)
+{
+	const unsigned int *reg_ofs;
+
+	if (dsi->driver_data->reg_ofs == EXYNOS5433_REG_OFS)
+		reg_ofs = exynos5433_reg_ofs;
+	else
+		reg_ofs = exynos_reg_ofs;
+
+	writel(val, dsi->reg_base + reg_ofs[idx]);
+}
+
+static inline u32 exynos_dsi_read(struct exynos_dsi *dsi, enum reg_idx idx)
+{
+	const unsigned int *reg_ofs;
+
+	if (dsi->driver_data->reg_ofs == EXYNOS5433_REG_OFS)
+		reg_ofs = exynos5433_reg_ofs;
+	else
+		reg_ofs = exynos_reg_ofs;
+
+	return readl(dsi->reg_base + reg_ofs[idx]);
+}
+
 enum reg_value_idx {
 	RESET_TYPE,
 	PLL_TIMER,
@@ -448,7 +466,7 @@ static const unsigned int exynos5433_reg_values[] = {
 };
 
 static const struct exynos_dsi_driver_data exynos3_dsi_driver_data = {
-	.reg_ofs = exynos_reg_ofs,
+	.reg_ofs = EXYNOS_REG_OFS,
 	.plltmr_reg = 0x50,
 	.has_freqband = 1,
 	.has_clklane_stop = 1,
@@ -460,7 +478,7 @@ static const struct exynos_dsi_driver_data exynos3_dsi_driver_data = {
 };
 
 static const struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
-	.reg_ofs = exynos_reg_ofs,
+	.reg_ofs = EXYNOS_REG_OFS,
 	.plltmr_reg = 0x50,
 	.has_freqband = 1,
 	.has_clklane_stop = 1,
@@ -472,7 +490,7 @@ static const struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
 };
 
 static const struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
-	.reg_ofs = exynos_reg_ofs,
+	.reg_ofs = EXYNOS_REG_OFS,
 	.plltmr_reg = 0x58,
 	.num_clks = 2,
 	.max_freq = 1000,
@@ -482,7 +500,7 @@ static const struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
 };
 
 static const struct exynos_dsi_driver_data exynos5433_dsi_driver_data = {
-	.reg_ofs = exynos5433_reg_ofs,
+	.reg_ofs = EXYNOS5433_REG_OFS,
 	.plltmr_reg = 0xa0,
 	.has_clklane_stop = 1,
 	.num_clks = 5,
@@ -493,7 +511,7 @@ static const struct exynos_dsi_driver_data exynos5433_dsi_driver_data = {
 };
 
 static const struct exynos_dsi_driver_data exynos5422_dsi_driver_data = {
-	.reg_ofs = exynos5433_reg_ofs,
+	.reg_ofs = EXYNOS5433_REG_OFS,
 	.plltmr_reg = 0xa0,
 	.has_clklane_stop = 1,
 	.num_clks = 2,
-- 
2.20.1

