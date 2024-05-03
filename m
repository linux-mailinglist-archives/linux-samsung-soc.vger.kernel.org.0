Return-Path: <linux-samsung-soc+bounces-3080-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5268BAF88
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  3 May 2024 17:12:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F9831F217F9
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  3 May 2024 15:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE1BB4D5BF;
	Fri,  3 May 2024 15:12:39 +0000 (UTC)
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2A94AEFD
	for <linux-samsung-soc@vger.kernel.org>; Fri,  3 May 2024 15:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714749159; cv=none; b=ePTxUySW/jnNMX9ZRr5Sx+iWcPHYZL60fT2WQA5Q8Nvic/iqg5PV25GDmMHM99YU+mhpGhfJBmRcN4biLSqv88xJxI3QE97L5ZgM9I1TQMm5yaOWgjsE8IRWxx+qeQWEoiSbRM3RqNQ7K4rjuXLj8fXcIaZiYV+hH8Pkmwq30vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714749159; c=relaxed/simple;
	bh=yxmnHdi84J6hDnFV38UMgQYHbTNJK5gk0LtGGxzXvtc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lUISk+MYgXzPHVTyMbgd7Dt1X9orWm1Dvk1uiaTYzYzyUcrY6DDReudoGafDrPsPkMjLblT9d1Yr/mjX7tetX16s+sh56S4um/shElpdeTJfQr7F886SW1Id2mz+2kxbcbCsSXAcs4+r78RiHBeH2u5ZAzH2ISLvErnvDkCdga4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1s2uaL-0004xn-Bt; Fri, 03 May 2024 17:12:29 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <l.stach@pengutronix.de>)
	id 1s2uZO-00FjHY-FX; Fri, 03 May 2024 17:11:30 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	kernel@pengutronix.de,
	patchwork-lst@pengutronix.de
Subject: [PATCH 11/14] drm/bridge: analogix_dp: don't wait for PLL lock too early
Date: Fri,  3 May 2024 17:11:26 +0200
Message-Id: <20240503151129.3901815-12-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240503151129.3901815-1-l.stach@pengutronix.de>
References: <20240503151129.3901815-1-l.stach@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org

The PLL will be reconfigured later, which may cause it to go out of lock
anyways, so there is no point in waiting for the PLL to lock here. Instead
we can continue execution of the link setup, which will properly set the
PLL parameters and will wait for the PLL to lock at the appropriate times.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index d267cf05cbca..e9c643a8b6fc 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -356,7 +356,6 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
 int analogix_dp_init_analog_func(struct analogix_dp_device *dp)
 {
 	u32 reg;
-	int timeout_loop = 0;
 
 	analogix_dp_set_analog_power_down(dp, POWER_ALL, 0);
 
@@ -368,18 +367,7 @@ int analogix_dp_init_analog_func(struct analogix_dp_device *dp)
 	writel(reg, dp->reg_base + ANALOGIX_DP_DEBUG_CTL);
 
 	/* Power up PLL */
-	if (analogix_dp_get_pll_lock_status(dp) == PLL_UNLOCKED) {
-		analogix_dp_set_pll_power_down(dp, 0);
-
-		while (analogix_dp_get_pll_lock_status(dp) == PLL_UNLOCKED) {
-			timeout_loop++;
-			if (DP_TIMEOUT_LOOP_COUNT < timeout_loop) {
-				dev_err(dp->dev, "failed to get pll lock status\n");
-				return -ETIMEDOUT;
-			}
-			usleep_range(10, 20);
-		}
-	}
+	analogix_dp_set_pll_power_down(dp, 0);
 
 	/* Enable Serdes FIFO function and Link symbol clock domain module */
 	reg = readl(dp->reg_base + ANALOGIX_DP_FUNC_EN_2);
-- 
2.39.2


