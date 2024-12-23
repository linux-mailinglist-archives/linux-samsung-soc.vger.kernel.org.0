Return-Path: <linux-samsung-soc+bounces-6041-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A76329FA987
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 23 Dec 2024 04:00:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66B231625F4
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 23 Dec 2024 03:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C7519005F;
	Mon, 23 Dec 2024 02:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sA1dThsG"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D498A18E743
	for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Dec 2024 02:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734922760; cv=none; b=SRcmo8gjs1Gskw9l59wsXtPi3b/ULbatPKJ6VnF9hOa+bFe+H8OKSiI+mmjYZ/ZweKw6+EWc0jlMOU7eEE8+CVxp7p2EfCn89/4tuESctTdv/NyQD3/3tobYl34eVAxyHAuZrnFWIr494Bxl/uEDU3O4tHsX102WlgUYCEsaXVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734922760; c=relaxed/simple;
	bh=qie1G35P6Yl7cippcpWCMVmv6O7BDmJcfLKNOKKg6kE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RGmQ1F8QhZLn/zUsDhvXBF7BFrfYPaeyFjkS4whq1WGiW61uCkba7/zo/X6wkxk/yAt5PVpgIkonLaEYOgre5RaGvgS9r0tP58BBR6ZwZ9evZ1Dh9OsSP5e+JokDls4Ew4qtfCdNFwlH4dARHI0EGV6a146noHO6QqliFNF2KEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sA1dThsG; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53f22fd6832so4048279e87.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 22 Dec 2024 18:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734922757; x=1735527557; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hqnxj6s3/EgjVuNjxM9/sx/Q8vGKE4sDTiUqotmlFDQ=;
        b=sA1dThsGBp15GAakNXQm+X7Tq84qkX3EJ92uF0/U09OCFg+SDNzlrH0ykEMz9Aeu/M
         CTCkutNouL84FRoGvdBLoL45WaLH1IdjXCALx2jKZ64lYdG21TGUEfeqqbiYTgPV71pm
         xO9yCCnxOb6KJtoI9QIuYrauaCoy4j2YcBDGF3AhyBoPvShrkhzj/xLl0vtazvX1ncuv
         gt1uX9u4UKEhfbBE0kP5LzIgZeOOJ5wDonU0guWJBEEjD9ihJ8+PmBD2E18gO/5hXfjT
         /uodaUAq6jEeN8294gx6A2J58roDtCkUx+mBSZC/D7EnDPjqmdBJFJcZm8kTajsQ1tq2
         UmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734922757; x=1735527557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hqnxj6s3/EgjVuNjxM9/sx/Q8vGKE4sDTiUqotmlFDQ=;
        b=W0961gu9/V3BumTtJ5lON5iTSIDMCO5UHS/gb4GZSCVpeSFqaa25F1z1CTlL1Egm9Z
         ZD//A87W2Ldn62TW0KqebKygQUY42hOu1ta4rdGKSCtasBVFTinjnIdUfDCCKAuFmMtH
         erVT4J2IwWC3Ra5wruHG5oFql6hL3h+ooyEPjbIwpVq0RovlyZa3in8ohlG0cQaNA15d
         MHLUOE3ukhdby/1giAQpiCzad4ANwG0RTbR+pMxKjmkrsT7P0NF7AenpOdBRgV96vRJA
         6emPY9bxFcly1EV/j+wDQaJ15DbW67OPhI2fE9+JRdRT8FxKtiZWLHLNSkXWxl2H4SGf
         rVlA==
X-Forwarded-Encrypted: i=1; AJvYcCWDRRtDhRDFird8NaAci41tPxMIqDbaoOa0p1syFrur+jx14/wFr98RhAotGv5ewr/oW6+HpX2ha4QC2xEaVxKEgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXsshh13r0Ruc5isXtpxZz0rXVQeztRCuuKeLzTHZQlcQIkjYk
	kxTgRJqh6gNJA+5dCa3I7b3CSJft91vrZ8C7sl4onWxY22dnnuNmH62zOX0ck7c=
X-Gm-Gg: ASbGncsH1HB1/+ZzJ9xUVie+RcyiRB8BWhdjj6emmEhOJAOXc6mrTuDNNFgt1zbWb1m
	quZCdlqWQDVcPVpFADsqSnH0bnuUJpPiMy7Kse3KitmnZqLDeCiZoyr/91COv+6AC/JNJt+I4dU
	aDTsV3OfleGQM6nVLhdVYuGNAlvC09wcBFasTllbvtmVudyrTrqiCah2BuGP3BVzCusu1536ZcN
	PmmGuixqEjL3ms958w8g+fEq45fFRaoUL6cykFe/vGsnNogPU9XOrPH80Q6gHgg
X-Google-Smtp-Source: AGHT+IEsAJNSOOaV9y+nIfiI5YFrovLlSSoOsQwRPv3DQ9rP0DXXCsbsdQs9e6lOh7MvObzo8vwB4A==
X-Received: by 2002:a05:6512:10cd:b0:542:2a20:e696 with SMTP id 2adb3069b0e04-5422a20e763mr3184995e87.12.1734922757058;
        Sun, 22 Dec 2024 18:59:17 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f658csm1124639e87.44.2024.12.22.18.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 18:59:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 23 Dec 2024 04:58:58 +0200
Subject: [PATCH v9 07/10] drm/bridge_connector: hook
 drm_atomic_helper_connector_hdmi_hotplug()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241223-drm-bridge-hdmi-connector-v9-7-6ce16bcedb8b@linaro.org>
References: <20241223-drm-bridge-hdmi-connector-v9-0-6ce16bcedb8b@linaro.org>
In-Reply-To: <20241223-drm-bridge-hdmi-connector-v9-0-6ce16bcedb8b@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4313;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=qie1G35P6Yl7cippcpWCMVmv6O7BDmJcfLKNOKKg6kE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaNHxc64kwoBabpycJjPJSrQzZBWx0rjDhWX0g
 hu7SI/TS3yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2jR8QAKCRCLPIo+Aiko
 1cRAB/0Y9MaFBTfXRl+OHwE9mEz9kBDl4uUf9S6zWWs5/Zspm3g4ocdNYQPOVPvzfLv3YzIz4yx
 07/Txug+JO/W7Gc8yBtcurFBnkP9QHxdv3R6RXY50q1W2f3vYxo13mVHjvUjRH8ARihdxR1sl3B
 Vi+VFMo928lRyBfodzdLdjEpD7Q5GAVwjtKAiA6kyt6UBaL0HagIRPmPPd/hz7LvUu79Detl5Rk
 6xGL1yl5xvss0d2T4mlB9aMCNSgKrF+9qFBRcUSYwyqwjq7t2bRd/Bqg2EkROAPFELoBK18uEEZ
 2mVg1jyCMy06rHFflzxviEd1a/5+MhQjaHaBrksBliJeH57c
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Extend drm_bridge_connector code to read the EDID and use it to update
connector status if the bridge chain implements HDMI bridge. Performing
it from the generic location minimizes individual bridge's code and
enforces standard behaviour from all corresponding drivers.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 39 ++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index cc955ee008d843d73fedb891e97143a4168fd311..66e4ab81fa0c2717490193e896389757f0a903f2 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -17,6 +17,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
@@ -180,11 +181,15 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
 	struct drm_bridge *detect = bridge_connector->bridge_detect;
+	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
 	enum drm_connector_status status;
 
 	if (detect) {
 		status = detect->funcs->detect(detect);
 
+		if (hdmi)
+			drm_atomic_helper_connector_hdmi_hotplug(connector, status);
+
 		drm_bridge_connector_hpd_notify(connector, status);
 	} else {
 		switch (connector->connector_type) {
@@ -203,6 +208,16 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
 	return status;
 }
 
+static void drm_bridge_connector_force(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
+
+	if (hdmi)
+		drm_atomic_helper_connector_hdmi_force(connector);
+}
+
 static void drm_bridge_connector_debugfs_init(struct drm_connector *connector,
 					      struct dentry *root)
 {
@@ -231,6 +246,7 @@ static void drm_bridge_connector_reset(struct drm_connector *connector)
 static const struct drm_connector_funcs drm_bridge_connector_funcs = {
 	.reset = drm_bridge_connector_reset,
 	.detect = drm_bridge_connector_detect,
+	.force = drm_bridge_connector_force,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -276,6 +292,14 @@ static int drm_bridge_connector_get_modes(struct drm_connector *connector)
 		to_drm_bridge_connector(connector);
 	struct drm_bridge *bridge;
 
+	/*
+	 * If there is a HDMI bridge, EDID has been updated as a part of
+	 * the .detect(). Just update the modes here.
+	 */
+	bridge = bridge_connector->bridge_hdmi;
+	if (bridge)
+		return drm_edid_connector_add_modes(connector);
+
 	/*
 	 * If display exposes EDID, then we parse that in the normal way to
 	 * build table of supported modes.
@@ -368,10 +392,25 @@ static int drm_bridge_connector_write_infoframe(struct drm_connector *connector,
 	return bridge->funcs->hdmi_write_infoframe(bridge, type, buffer, len);
 }
 
+static const struct drm_edid *
+drm_bridge_connector_read_edid(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_edid;
+	if (!bridge)
+		return NULL;
+
+	return drm_bridge_edid_read(bridge, connector);
+}
+
 static const struct drm_connector_hdmi_funcs drm_bridge_connector_hdmi_funcs = {
 	.tmds_char_rate_valid = drm_bridge_connector_tmds_char_rate_valid,
 	.clear_infoframe = drm_bridge_connector_clear_infoframe,
 	.write_infoframe = drm_bridge_connector_write_infoframe,
+	.read_edid = drm_bridge_connector_read_edid,
 };
 
 static int drm_bridge_connector_audio_startup(struct drm_connector *connector)

-- 
2.39.5


