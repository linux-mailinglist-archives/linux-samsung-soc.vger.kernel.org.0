Return-Path: <linux-samsung-soc+bounces-5840-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3ECF9F1EF9
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 14 Dec 2024 14:38:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01BE4167147
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 14 Dec 2024 13:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFE8719F410;
	Sat, 14 Dec 2024 13:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cdPGpyY8"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7212A195FE5
	for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Dec 2024 13:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734183442; cv=none; b=U53f5QUfJ1jJFqmFIkLwnBcXhgm93u/v5762gC73KMp69wwhggefMZeWtM7te56t8ziMGeDKkBie6bbnKqYorkEqnBbM+uFqawjB/BYlwIxEk1adVrQ/BkoPI/eNj9tgBB3K10WA33d7NQ/PfvoYiOXfIolNmjHBpLT3hRoDSlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734183442; c=relaxed/simple;
	bh=E7JeGNI7sqGcWqcAailaiFOGnnaUQ0FrCYoy+ca8RpM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bdyLl+3GbXfzkCoE5mEam1ACmHa9Uw8LVC6GKHx1EvzypTxxlJD/rOlKWdZffbzMxcivROcrJHo5TKsDV0EurIoisP/fb0sNk4HiMDg02NooK3fMHp+6vSNp749klza38SBjU4IHRkkh0J7SrYxd+h0e0dIAeTDmSI0W9PGxHv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cdPGpyY8; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so22247791fa.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Dec 2024 05:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734183439; x=1734788239; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6YJ4q6tadgk1hWcoorHO9q9AcqKR3C+KJI1u0hIFBaE=;
        b=cdPGpyY8kpWHQeR+br0KiiqVLmv6xtTuP3qOO5h/7qHtrMjjtmHZhbRUohsZU0n1D0
         qrtDrWMpCscbA/fezeEnwCD7cciCW+h8v59xMrGN4Scrzg00wM+3k5NEZCzCSXm1dVAH
         XxvokM0L/7tBf0mZ5BRf2jv5lNwh/VeHCFGokpwkixzmrWxv5ggCkIVR3ujHAAreVsbm
         bQbkoffDN+lTE1bjJX4nP60UsUgtJw6ThqWAlIgNaCKRmHcnv7YOXymefiZ5vKYOBUmk
         CiUJ6ND0gr+NxROPE+k6qIYMxZihT75FQU4C4PuD48PmnC4eTs7APlLtF84TjfbdJ97d
         BrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734183439; x=1734788239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6YJ4q6tadgk1hWcoorHO9q9AcqKR3C+KJI1u0hIFBaE=;
        b=q+64JW5Qj7P1Qfgr/fh2aAIg5VB3t+hvjTxB+QTYgs+O0tVCWEr9Mjt1pJ7jdIBUmz
         SlXxhy6ajCgAC7Z+Y5rArBVzC/9na994WGQsrG1RXNmaq8iyf7+wjle70jJTwv0SPWc2
         MqkofUMfbBE/o7LrerwwsS7f4/B6koYghAFGA2kQZoTnyJI/BbAt+DscuCfQrziF0ONB
         q2x2n8ZkYpRNeq3k1m1XKGTvdY2oOU3ajxg2vc1z4UuUkKWs8tsa3vA7VWzPUQ+O5EhI
         V851/7iLjcd0nHJv8ZCCNFblAvqBbT3MLm6/pS/15RcDPMOG4R6lj0dXItcPFb8J7EcW
         H0wA==
X-Forwarded-Encrypted: i=1; AJvYcCWMWgazHmMHAXE9isk1dF7AcKfYx1pZzQh9gyp2CXNxeJaYftal/wLDIImQLCwTvhzYNfQ6cbFmLMZ1pk6dxTP9wA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfxkL9LoxMPsjy78NTo/qmRwPb7QDjd+pI1RxFxX1dUlkExKAA
	xIiWsO28pw4Mt1/fVlJZqOYb+48plrFUKNCZug1wi0cYQMPME0yjrIQPkJhD8PE=
X-Gm-Gg: ASbGnctlDZGy9DFp0TyxbDr8xv3KUWZGS6DOqwZpeKNEy7c35/MIIlH1Zws788FThvB
	MOaiqffFHC0sra7PbUcfjSOvaXyiATpWeM3/6k78OeJU8B7IMmlfdf9mRXr+UmHlgbPKaStXgb9
	/ntfTi0L/kgletRtBl4N0sqsR19qz1BdADl0gOZvwKsbDy/0HvoT+s6Jx4gcTJ61FnvjNZKlgUn
	uQzJYH8BlkkzkrkgaAh5YsFovzzr0OmKPuaGOixCRftiWHbg+1ah5/ZkZ0HAlkB
X-Google-Smtp-Source: AGHT+IFG9LRiCAbslkgJdWcTp68iI2gM9sr2Y/E6t/loWfDlKNLZ1XwCQ4KNA8IB5rjHj0E0zPcgUQ==
X-Received: by 2002:a05:6512:b27:b0:53e:1b34:fed2 with SMTP id 2adb3069b0e04-54090268d4cmr1991538e87.8.1734183438535;
        Sat, 14 Dec 2024 05:37:18 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120baa474sm220131e87.90.2024.12.14.05.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 05:37:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 15:37:07 +0200
Subject: [PATCH v2 3/5] drm/sti: hda: pass const struct drm_display_mode*
 to hda_get_mode_idx()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-drm-connector-mode-valid-const-v2-3-4f9498a4c822@linaro.org>
References: <20241214-drm-connector-mode-valid-const-v2-0-4f9498a4c822@linaro.org>
In-Reply-To: <20241214-drm-connector-mode-valid-const-v2-0-4f9498a4c822@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Peter Senna Tschudin <peter.senna@gmail.com>, Ian Ray <ian.ray@ge.com>, 
 Martyn Welch <martyn.welch@collabora.co.uk>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, 
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, virtualization@lists.linux.dev, 
 spice-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2281;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=E7JeGNI7sqGcWqcAailaiFOGnnaUQ0FrCYoy+ca8RpM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXYoE85Irlub5li3EqAJENRTB+KxenTAd7iEfb
 h6El8rjAnuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ12KBAAKCRCLPIo+Aiko
 1YUwB/48isvULWH0ldXb5Wl+P18s81zhuaBxagjYhXRzhD89tkMOOIDFKQ5NnpCsrx5cVD0yKjv
 kMohag3LXNjhoSb6V1QEjYKbs8lQb0k42nsTdNs7eAuj6nHqn4wLZtHrpJiY5LKtehsRL1dRH8O
 iK/UZnrOwyGKvuf1mJVxIEU5MCDqbZdSzcv6yfe/JQzyxz9wOMxr7r+/JMucbAHlMS9KNgFDAiB
 zaFXJ8heSm1wtZf1Lk7kysjtHakzIjmO2In9a50drym8tv9jTHOWts9OrYlWCTUVDWQtfxI2NO4
 XH8jKKBoyNjNCIHW2L3fgP2rD2Ch5f0VTLJDze5kmlwAxr8U
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Make hda_get_mode_idx() take a const struct drm_display_mode pointer
instead of just raw struct drm_display_mode. This is a preparation to
converting the mode_valid() callback of drm_connector to take a const
struct drm_display_mode argument.

Acked-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/sti/sti_hda.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_hda.c b/drivers/gpu/drm/sti/sti_hda.c
index b12863bea95559c4f874eb94cea8938609d435d4..57aa260d1e4620a85d10e80a84111be885bd0842 100644
--- a/drivers/gpu/drm/sti/sti_hda.c
+++ b/drivers/gpu/drm/sti/sti_hda.c
@@ -280,12 +280,12 @@ static void hda_write(struct sti_hda *hda, u32 val, int offset)
  *
  * Return true if mode is found
  */
-static bool hda_get_mode_idx(struct drm_display_mode mode, int *idx)
+static bool hda_get_mode_idx(const struct drm_display_mode *mode, int *idx)
 {
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(hda_supported_modes); i++)
-		if (drm_mode_equal(&hda_supported_modes[i].mode, &mode)) {
+		if (drm_mode_equal(&hda_supported_modes[i].mode, mode)) {
 			*idx = i;
 			return true;
 		}
@@ -443,7 +443,7 @@ static void sti_hda_pre_enable(struct drm_bridge *bridge)
 	if (clk_prepare_enable(hda->clk_hddac))
 		DRM_ERROR("Failed to prepare/enable hda_hddac clk\n");
 
-	if (!hda_get_mode_idx(hda->mode, &mode_idx)) {
+	if (!hda_get_mode_idx(&hda->mode, &mode_idx)) {
 		DRM_ERROR("Undefined mode\n");
 		return;
 	}
@@ -526,7 +526,7 @@ static void sti_hda_set_mode(struct drm_bridge *bridge,
 
 	drm_mode_copy(&hda->mode, mode);
 
-	if (!hda_get_mode_idx(hda->mode, &mode_idx)) {
+	if (!hda_get_mode_idx(&hda->mode, &mode_idx)) {
 		DRM_ERROR("Undefined mode\n");
 		return;
 	}
@@ -614,7 +614,7 @@ sti_hda_connector_mode_valid(struct drm_connector *connector,
 		= to_sti_hda_connector(connector);
 	struct sti_hda *hda = hda_connector->hda;
 
-	if (!hda_get_mode_idx(*mode, &idx)) {
+	if (!hda_get_mode_idx(mode, &idx)) {
 		return MODE_BAD;
 	} else {
 		result = clk_round_rate(hda->clk_pix, target);

-- 
2.39.5


