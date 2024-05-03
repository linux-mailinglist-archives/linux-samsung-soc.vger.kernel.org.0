Return-Path: <linux-samsung-soc+bounces-3082-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BDD8BAF8A
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  3 May 2024 17:12:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C566D1C21B6B
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  3 May 2024 15:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B0514F885;
	Fri,  3 May 2024 15:12:42 +0000 (UTC)
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C9A4AEFE
	for <linux-samsung-soc@vger.kernel.org>; Fri,  3 May 2024 15:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714749162; cv=none; b=qqIS+aGiikhV6hUoQs59BmMl/sYRVTl8ILR0f404DEWLg2dJNMK8gXQ8ZRNa8GBPi34zpP6NwZbFD0Gl5ThQkP4OyFEqJ66g40h518rDc5bLQZnsIbERYDFRmwDmhBccs4hAsygb0nOdWOk/+o4h49k+NuQfuQ98krvhusB2Cpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714749162; c=relaxed/simple;
	bh=BmPCC1ZI/6KUOKEqlUSoKgRLDU0ecmyjGCu/5AZUAWg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DeaKcrW0oFZnb6Ur5nk+TW7YsLmjbkR0DmT6tuWzWpnjKHglwbZv7hIRTl1/Oka3DUIcjt7UIRGLDXqk/B7TyXjyk8qCZT7kXw5nqM4yXC7PHRfWyLAcibslxkXBczv/eyBr/DaJH7I/YN42xdvKbM7QS2cqxe6P9jDo7zBDkow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1s2uaM-0004zn-Ir; Fri, 03 May 2024 17:12:30 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <l.stach@pengutronix.de>)
	id 1s2uZO-00FjHY-Hp; Fri, 03 May 2024 17:11:30 +0200
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
Subject: [PATCH 12/14] drm/bridge: analogix_dp: simplify and correct PLL lock checks
Date: Fri,  3 May 2024 17:11:27 +0200
Message-Id: <20240503151129.3901815-13-l.stach@pengutronix.de>
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

Move the wait loop into its own function, so it doesn't need to be
replicated in multiple locations. Also move the PLL lock checks between
setting the link bandwidth, which may cause the PLL to unlock, and the
MACRO_RST, which needs the PLL to be locked.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 .../drm/bridge/analogix/analogix_dp_core.c    | 34 +++++++------------
 .../drm/bridge/analogix/analogix_dp_core.h    |  7 +---
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 12 +++----
 3 files changed, 18 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 736b2ed745e1..7bbc3d8a85df 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -231,7 +231,7 @@ static int analogix_dp_training_pattern_dis(struct analogix_dp_device *dp)
 static int analogix_dp_link_start(struct analogix_dp_device *dp)
 {
 	u8 buf[4];
-	int lane, lane_count, pll_tries, retval;
+	int lane, lane_count, retval;
 
 	lane_count = dp->link_train.lane_count;
 
@@ -243,6 +243,11 @@ static int analogix_dp_link_start(struct analogix_dp_device *dp)
 
 	/* Set link rate and count as you want to establish*/
 	analogix_dp_set_link_bandwidth(dp, dp->link_train.link_rate);
+	retval = analogix_dp_wait_pll_locked(dp);
+	if (retval) {
+		DRM_DEV_ERROR(dp->dev, "Wait for pll lock failed %d\n", retval);
+		return retval;
+	}
 	/*
 	 * MACRO_RST must be applied after the PLL_LOCK to avoid
 	 * the DP inter pair skew issue for at least 10 us
@@ -270,18 +275,6 @@ static int analogix_dp_link_start(struct analogix_dp_device *dp)
 					DP_TRAIN_PRE_EMPH_LEVEL_0;
 	analogix_dp_set_lane_link_training(dp);
 
-	/* Wait for PLL lock */
-	pll_tries = 0;
-	while (analogix_dp_get_pll_lock_status(dp) == PLL_UNLOCKED) {
-		if (pll_tries == DP_TIMEOUT_LOOP_COUNT) {
-			dev_err(dp->dev, "Wait for PLL lock timed out\n");
-			return -ETIMEDOUT;
-		}
-
-		pll_tries++;
-		usleep_range(90, 120);
-	}
-
 	/* Set training pattern 1 */
 	analogix_dp_set_training_pattern(dp, TRAINING_PTN1);
 
@@ -634,9 +627,14 @@ static int analogix_dp_fast_link_train(struct analogix_dp_device *dp)
 {
 	int ret;
 	u8 link_align, link_status[2];
-	enum pll_status status;
 
 	analogix_dp_set_link_bandwidth(dp, dp->link_train.link_rate);
+	ret = analogix_dp_wait_pll_locked(dp);
+	if (ret) {
+		DRM_DEV_ERROR(dp->dev, "Wait for pll lock failed %d\n", ret);
+		return ret;
+	}
+
 	/*
 	 * MACRO_RST must be applied after the PLL_LOCK to avoid
 	 * the DP inter pair skew issue for at least 10 us
@@ -645,14 +643,6 @@ static int analogix_dp_fast_link_train(struct analogix_dp_device *dp)
 	analogix_dp_set_lane_count(dp, dp->link_train.lane_count);
 	analogix_dp_set_lane_link_training(dp);
 
-	ret = readx_poll_timeout(analogix_dp_get_pll_lock_status, dp, status,
-				 status != PLL_UNLOCKED, 120,
-				 120 * DP_TIMEOUT_LOOP_COUNT);
-	if (ret) {
-		DRM_DEV_ERROR(dp->dev, "Wait for pll lock failed %d\n", ret);
-		return ret;
-	}
-
 	/* source Set training pattern 1 */
 	analogix_dp_set_training_pattern(dp, TRAINING_PTN1);
 	/* From DP spec, pattern must be on-screen for a minimum 500us */
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index 382b2f068ab9..774d11574b09 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -95,11 +95,6 @@ enum dynamic_range {
 	CEA
 };
 
-enum pll_status {
-	PLL_UNLOCKED,
-	PLL_LOCKED
-};
-
 enum clock_recovery_m_value_type {
 	CALCULATED_M,
 	REGISTER_M
@@ -191,7 +186,7 @@ void analogix_dp_swreset(struct analogix_dp_device *dp);
 void analogix_dp_config_interrupt(struct analogix_dp_device *dp);
 void analogix_dp_mute_hpd_interrupt(struct analogix_dp_device *dp);
 void analogix_dp_unmute_hpd_interrupt(struct analogix_dp_device *dp);
-enum pll_status analogix_dp_get_pll_lock_status(struct analogix_dp_device *dp);
+int analogix_dp_wait_pll_locked(struct analogix_dp_device *dp);
 void analogix_dp_set_pll_power_down(struct analogix_dp_device *dp, bool enable);
 void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
 				       enum analog_power_block block,
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index e9c643a8b6fc..143a78b1d156 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -217,15 +217,13 @@ void analogix_dp_unmute_hpd_interrupt(struct analogix_dp_device *dp)
 	writel(reg, dp->reg_base + ANALOGIX_DP_INT_STA_MASK);
 }
 
-enum pll_status analogix_dp_get_pll_lock_status(struct analogix_dp_device *dp)
+int analogix_dp_wait_pll_locked(struct analogix_dp_device *dp)
 {
-	u32 reg;
+	u32 val;
 
-	reg = readl(dp->reg_base + ANALOGIX_DP_DEBUG_CTL);
-	if (reg & PLL_LOCK)
-		return PLL_LOCKED;
-	else
-		return PLL_UNLOCKED;
+	return readl_poll_timeout(dp->reg_base + ANALOGIX_DP_DEBUG_CTL, val,
+				  val & PLL_LOCK, 120,
+				  120 * DP_TIMEOUT_LOOP_COUNT);
 }
 
 void analogix_dp_set_pll_power_down(struct analogix_dp_device *dp, bool enable)
-- 
2.39.2


