Return-Path: <linux-samsung-soc+bounces-5837-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1376C9F1EDF
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 14 Dec 2024 14:37:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F3167A0640
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 14 Dec 2024 13:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E38D193094;
	Sat, 14 Dec 2024 13:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tQ1PAgW0"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CC517E015
	for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Dec 2024 13:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734183437; cv=none; b=VwJtlnMtHwpDTTunsdZoQvLE4sFkeGkCLucbvcJFiOMiOrzcz+03Co5GXgGO2vy7yLOHXbFqFw3jmH5474NAICYziXI9mvf1d5fDL2RtwuCQUZtav+U/BVsZWdhpK7BORqpiwzk+L1kDNlI8jX0fYixceWCWzTgnQjHMoO8d848=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734183437; c=relaxed/simple;
	bh=CFKCP8gmNVOgeqNjr+3QJjtmtNC/tAX/00xUMnJ/tTs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iH3Mfm7wlQIbjMe8wQh3dtZIVWr61B7M2EFq9upojxwJ9im+6adBRMCwjjzYt8OoGZlHmyNVtHXEu4l0C7HO2iF+kpfXg7y6JXoBj26oC8RZv49uXE9WT9LF4PvL9JVJIeGj5fEOTRJxS3gONum8KqxvuWtGY+06HNfv3R8znVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tQ1PAgW0; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54021daa6cbso3045038e87.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Dec 2024 05:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734183432; x=1734788232; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D5Yifu5AHqHdXbQoT1ZLOpnCiREtj9Cd9aALDn2mK+0=;
        b=tQ1PAgW0k11qQeZXHtPzNhlu34oullOFnWhsHthvUsQjQA3SqqKFE4krFadpJFOOhz
         rbVaZn6Sdd3y7+xrEFOR8lqtECMmvbHvDIR4ozWd5rxL4vIZenQpU/mWIxziqUmj2/E9
         kVc9Ombkenb4OEY9qlSzDBmOruPgzGd0PfGU6Ohis5zqGRxLCJtR7z37WJ85vRv0pOoQ
         REk5yAXEQL6Lq8z/pRbKMfQS4amMNd1XurXZDdTX5COyDESuXdl91gnY8a0OII7nOt2E
         oBkAxacodx1nkFcaI9NWhLbA/sxXxpjW4PWQZhwPowtsh5LR5ZOS/97KJg6mLTMxaGUv
         nzFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734183432; x=1734788232;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D5Yifu5AHqHdXbQoT1ZLOpnCiREtj9Cd9aALDn2mK+0=;
        b=TMNRNdCQW+YaDcSXwdTxumn1fqL1n0X95JciwMktCjxhT8eV1hRmBHe2Y/IcYvKwpH
         FdNVLrKF91pE13ANNzp7zwX98VYohJS47FVyy/y5TtZwhpd0CCZ0hITi/Lsd8BpK3Nqz
         QiLJLV135Yib+yf8bO1ZcOpV+Fnykq3CUUqX7Fo6HjolZ83FijQ+lpbJsfCVSkmFGYnX
         qDOIL59svj5SkvTwgfYlJp+a9QMgRpj2S6f3XRvX9Zh/8+cJjwJqidk94v1Q0zB1Xqtt
         dFlbxGJPwyHvopKohScmz9tofhO3vbvj1Pf6FAzNY5yZ+UPOp1A7UF2e1qpLy7Vm0R7B
         3eYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTqM9fV3n5VytKuWBYabqcUZGIgFCoM04wr64CFeJIFEI7I9WiTVyjILAVVZCaRommBzFIf7Gba5aq6tGkvkC19A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmNQw7COAFYETsjOSMXbwqFJ6WBDdTdbmkGKN/eA4MKjzspJO0
	C6UJe/L1VLsO0HNc1u/irqEM/H/TyH/oV/iIjTMHZNwrQ3nF1ZzqPRJYyA/wBCE=
X-Gm-Gg: ASbGncukVKAfEMGcHaiXdohmbcsjla3g1NzJ1ycUeMesVnd1NMETVLseNUR0MXeqGJj
	G6MK3QCXhXXnhd2ZOzHHWCSafIBDoWTSRDEN+aaBifOKHlZIMrlC9lr7iHjjW7C+T9Q8YDHSvde
	+m2Ds5EfR+x9UGZ5gzxfENbEM7gVRPtzB1s4rJcMjXu6LdRdz8pPu2/KuPjYIHKQqtwbmeL38Pt
	uvIYdGXjBB9ggwnW7N0RnDTphJqGm38L6sxrEf4gw+tdfGOo+BoGQa8n54W+Atu
X-Google-Smtp-Source: AGHT+IEmz28NMTXAP81JXsAlUmRjxWGG4URFEoZPW2057H7lgb26FPjGbNMLBZ5J86SvfmTU0Z3DXQ==
X-Received: by 2002:a05:6512:ba3:b0:540:3567:2ede with SMTP id 2adb3069b0e04-5408ad822dcmr1895173e87.12.1734183431555;
        Sat, 14 Dec 2024 05:37:11 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120baa474sm220131e87.90.2024.12.14.05.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 05:37:10 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/5] drm/connector: make mode_valid() callback accept
 const mode pointer
Date: Sat, 14 Dec 2024 15:37:04 +0200
Message-Id: <20241214-drm-connector-mode-valid-const-v2-0-4f9498a4c822@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAACKXWcC/42NTQqDMBBGr1Jm3SlOrApd9R7FRX5GHdCkJBJax
 Ls3eoIu34PvfRskjsIJHpcNImdJEnwBdb2AnbQfGcUVBlWpOxE16OKCNnjPdg0Rl+AYs57FHTK
 tqLl2puKhtaaDEnlHHuRzHrz6wpOksvuef5kO+3c6E1ZoyDSqpqYdOnrO4nUMtxBH6Pd9/wHZe
 zDbzQAAAA==
X-Change-ID: 20241115-drm-connector-mode-valid-const-ae3db0ef6cb7
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
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6418;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=CFKCP8gmNVOgeqNjr+3QJjtmtNC/tAX/00xUMnJ/tTs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXYoDmM2S87MrW8vu+JbVhyOODFafbOCaZxOjt
 xp9pGfUjhmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ12KAwAKCRCLPIo+Aiko
 1eEwB/4jmBS/ZZEzFjxaESTGxzhJNhkCvznhOV0ymm9HyVmb5cREFRRAYjI5LoTWx7bG2RoJpPx
 UvuWQ54Hy/EBhfpWcduIr/JhudedQ7jBPBIKLI9pTuxk9R5EX73GEkl63Fke70Rl4RJk106amoZ
 L5UKcCV/8bd4eJp0zytj96tqIz4Ck6AKNLE/phVZ9qgSiEy8WyBf4S97qdT56EH3M7y0HwvvZUR
 hYu0+I8MmFd53hj3SU9abEOy2j4vRwWzuePJ9fgEjSd8QoY+ntVzjh+bjurDQ8D7x0pTI/WJqrS
 6pXMPMXEdtL00Ib+8dAXox6yumWc5m53LQxFithWGBOqgCaL
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

While working on the generic mode_valid() implementation for the HDMI
Connector framework I noticed that unlike other DRM objects
drm_connector accepts non-const pointer to struct drm_display_mode,
while obviously mode_valid() isn't expected to modify the argument.

Mass-change the DRM framework code to pass const argument to that
callback.

The series has been compile-tested with defconfig for x86-64, arm and
arm64.

Note: yes, I understand that this change might be hard to review and
merge. The only viable option that I foresee is to add new callback,
having the const argument and migrate drivers into using it one by one.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Rebased on top of linux-next
- Replaced 'accept const argument' with 'take a const arugment'
  (Laurent)
- Link to v1: https://lore.kernel.org/r/20241115-drm-connector-mode-valid-const-v1-0-b1b523156f71@linaro.org

---
Dmitry Baryshkov (5):
      drm/encoder_slave: make mode_valid accept const struct drm_display_mode
      drm/amdgpu: don't change mode in amdgpu_dm_connector_mode_valid()
      drm/sti: hda: pass const struct drm_display_mode* to hda_get_mode_idx()
      drm/connector: make mode_valid_ctx take a const struct drm_display_mode
      drm/connector: make mode_valid take a const struct drm_display_mode

 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c           |  8 ++++----
 drivers/gpu/drm/amd/amdgpu/atombios_dp.c                 |  2 +-
 drivers/gpu/drm/amd/amdgpu/atombios_dp.h                 |  2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c        | 12 +++++++++---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h        |  2 +-
 drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c |  2 +-
 drivers/gpu/drm/arm/malidp_mw.c                          |  2 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c             |  2 +-
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c      |  2 +-
 drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c |  7 -------
 drivers/gpu/drm/display/drm_bridge_connector.c           |  2 +-
 drivers/gpu/drm/display/drm_hdmi_state_helper.c          |  2 +-
 drivers/gpu/drm/drm_crtc_helper_internal.h               |  2 +-
 drivers/gpu/drm/drm_probe_helper.c                       |  2 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c                     |  2 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c                |  2 +-
 drivers/gpu/drm/gma500/cdv_intel_crt.c                   |  2 +-
 drivers/gpu/drm/gma500/cdv_intel_dp.c                    |  2 +-
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c                  |  2 +-
 drivers/gpu/drm/gma500/cdv_intel_lvds.c                  |  2 +-
 drivers/gpu/drm/gma500/oaktrail_hdmi.c                   |  2 +-
 drivers/gpu/drm/gma500/psb_intel_drv.h                   |  2 +-
 drivers/gpu/drm/gma500/psb_intel_lvds.c                  |  2 +-
 drivers/gpu/drm/gma500/psb_intel_sdvo.c                  |  2 +-
 drivers/gpu/drm/i2c/ch7006_drv.c                         |  2 +-
 drivers/gpu/drm/i2c/sil164_drv.c                         |  2 +-
 drivers/gpu/drm/i915/display/dvo_ch7017.c                |  2 +-
 drivers/gpu/drm/i915/display/dvo_ch7xxx.c                |  2 +-
 drivers/gpu/drm/i915/display/dvo_ivch.c                  |  2 +-
 drivers/gpu/drm/i915/display/dvo_ns2501.c                |  2 +-
 drivers/gpu/drm/i915/display/dvo_sil164.c                |  2 +-
 drivers/gpu/drm/i915/display/dvo_tfp410.c                |  2 +-
 drivers/gpu/drm/i915/display/icl_dsi.c                   |  2 +-
 drivers/gpu/drm/i915/display/intel_crt.c                 |  2 +-
 drivers/gpu/drm/i915/display/intel_dp.c                  |  2 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c              |  2 +-
 drivers/gpu/drm/i915/display/intel_dsi.c                 |  2 +-
 drivers/gpu/drm/i915/display/intel_dsi.h                 |  2 +-
 drivers/gpu/drm/i915/display/intel_dvo.c                 |  2 +-
 drivers/gpu/drm/i915/display/intel_dvo_dev.h             |  2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c                |  2 +-
 drivers/gpu/drm/i915/display/intel_lvds.c                |  2 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c                |  2 +-
 drivers/gpu/drm/i915/display/intel_tv.c                  |  2 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c                   |  2 +-
 drivers/gpu/drm/imx/ipuv3/imx-tve.c                      |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c      |  2 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c                |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c                  |  2 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c              |  2 +-
 drivers/gpu/drm/qxl/qxl_display.c                        |  2 +-
 drivers/gpu/drm/radeon/atombios_dp.c                     |  2 +-
 drivers/gpu/drm/radeon/radeon_connectors.c               | 10 +++++-----
 drivers/gpu/drm/radeon/radeon_mode.h                     |  2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c                   |  2 +-
 drivers/gpu/drm/rockchip/inno_hdmi.c                     |  4 ++--
 drivers/gpu/drm/rockchip/rk3066_hdmi.c                   |  2 +-
 drivers/gpu/drm/sti/sti_dvo.c                            |  2 +-
 drivers/gpu/drm/sti/sti_hda.c                            | 12 ++++++------
 drivers/gpu/drm/sti/sti_hdmi.c                           |  2 +-
 drivers/gpu/drm/tegra/dsi.c                              |  2 +-
 drivers/gpu/drm/tegra/hdmi.c                             |  2 +-
 drivers/gpu/drm/tegra/sor.c                              |  2 +-
 drivers/gpu/drm/vc4/vc4_txp.c                            |  2 +-
 drivers/gpu/drm/virtio/virtgpu_display.c                 |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                      |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                      |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c                     |  2 +-
 include/drm/display/drm_hdmi_state_helper.h              |  2 +-
 include/drm/drm_encoder_slave.h                          |  2 +-
 include/drm/drm_modeset_helper_vtables.h                 |  4 ++--
 71 files changed, 92 insertions(+), 93 deletions(-)
---
base-commit: 4176cf5c5651c33769de83bb61b0287f4ec7719f
change-id: 20241115-drm-connector-mode-valid-const-ae3db0ef6cb7

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


