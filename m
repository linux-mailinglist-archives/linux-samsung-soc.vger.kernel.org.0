Return-Path: <linux-samsung-soc+bounces-5229-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C269B8F09
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  1 Nov 2024 11:20:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAD221C243A0
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  1 Nov 2024 10:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB16119DF4D;
	Fri,  1 Nov 2024 10:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KJfcXG56"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA0219D060
	for <linux-samsung-soc@vger.kernel.org>; Fri,  1 Nov 2024 10:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730456363; cv=none; b=IuU/NKJDRI1PPk1WQkBFJbe64xCfJAczLtxnLEi2xpBmnP3kTVb/AJoK0zgELYvtL7JbNyxHKKB069UareK6ZfLacampSSYAiVDg8CdpbA7SSSInjBeYp0VxL9zuzl5x8QsC+VhtZ8kwOCIAJ1yirMVX4sXz4l8y1EC2cwDfHjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730456363; c=relaxed/simple;
	bh=VCAvQVMxBhx8BnYWztLsVnSCZi3RzfwM/RTfomnZ9hc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pdt9MI0JqdV6Q4lMeJI7N1LSye2/2rCbtwbXsqqFqYVpxt0IxnIOpZpO6KiIPI2U35ivd48MWq1q4CvWLSqhgt+gcZX3/aK9Db+iXOuO9btwxwY/KlhLr5QK8REOXILBW5kPEgENdvvBmLj6NJMGKf0ASoba2fKM07BY51qTB+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KJfcXG56; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f75c56f16aso17152461fa.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Nov 2024 03:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730456359; x=1731061159; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UmsNhbcOu0CL1PS3KGzwEdaRMJlXKDzwHWxwdzXZd0g=;
        b=KJfcXG56xBZD50EcYiuKfn/56fxhE0n5iX/ssJIxOyyCARXFX2UeIXp5PevbkHMQ4I
         xB7e7KWX50V0yfBFKtSARF6+rN2S8quWy156GYrttxh7QrnbeGZVa1DDy0MRp7vAnzq6
         KGXAC9ScU7CmSPJqtGpHXLSAmG00xkbIxnY7CbzaNR3xwwtAbMC/7brgsbFIZXVBlgxF
         Ax2c+/3f2JtXgsT/iXuegY7to3CK00wY8CAZ6X6JbpQyzckTm5QtcB3TxnyjdM1+zKpr
         /tvZzdOkxoC7G9+0fcGg1dCq2xIkePcRXTqtyfDDvMW216tl9YzpUQfAylaz5MDFzQE6
         2Ngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730456359; x=1731061159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UmsNhbcOu0CL1PS3KGzwEdaRMJlXKDzwHWxwdzXZd0g=;
        b=t7w7qEwTHcAbgpd61C5G9cA5nxtus7qRI7/qFX/haZw5lRx1chn2LNO1diy67eccY5
         WbAPzdsbKM7ISW2VBbFxtjg+TkixcMcBZHBUsWS5j61pFymts3MMBoAjmqHlkzPz83kc
         TNLUzLeTFqdMfxiGpZLEhtmIvMCgr53gGyLv3XLikkT4CvsP9qobaomoO0b56W7oMsbk
         B71wksmRSj2TJTzKcdiYx74Vwl35E0w/XPk95Jmd2VJY2ZoCDUfSTLnkw0AUCMKCoJbC
         98/5vJw631m87zw1PbAJmYLcmUAh47mG0KDuKIzlz4nr0HuxL6eYZN9ieqBTNRhuJPFP
         vEkA==
X-Forwarded-Encrypted: i=1; AJvYcCW+vgvqWK015kXhO4Wv5nYKeZDUkGR1IeXtGD2nukyNLg2EjGMKz07QrJk9pfSSAYkIpWqM0TEaEn/oU9OgWq0YWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVxWr+ddxvPcr5pdy0/dgy08fqwQWhg3FVJd0ahb3VgIfD+8nE
	moCasAjG6PyedciLtvEf9zbiBuUUdHNF/TcPF/rujjptdfSssGDtKtswAUa2dKo=
X-Google-Smtp-Source: AGHT+IE9qVtEb8hD2onX8ybuoo0wSFkN9p7iG6F8kIb0o7PuyhgLHcCk1r8J3Jw9UwSv1zFmy1Mfnw==
X-Received: by 2002:a2e:a9a4:0:b0:2fb:5035:11da with SMTP id 38308e7fff4ca-2fdecbf0f16mr32352421fa.33.1730456359186;
        Fri, 01 Nov 2024 03:19:19 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fdef5d6ef4sm5197031fa.48.2024.11.01.03.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 03:19:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 01 Nov 2024 12:19:05 +0200
Subject: [PATCH RFC v2 4/7] drm/bridge: connector: add support for HDMI
 codec framework
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-drm-bridge-hdmi-connector-v2-4-739ef9addf9e@linaro.org>
References: <20241101-drm-bridge-hdmi-connector-v2-0-739ef9addf9e@linaro.org>
In-Reply-To: <20241101-drm-bridge-hdmi-connector-v2-0-739ef9addf9e@linaro.org>
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
 Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6723;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=VCAvQVMxBhx8BnYWztLsVnSCZi3RzfwM/RTfomnZ9hc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJKsYO8+YDuFklEfu+skckO4ZOt5+W0xK+/+6Z
 1rclxZqyrqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZySrGAAKCRCLPIo+Aiko
 1cmbB/9Yy/vFGsEApTBXMt+htavdpcCL/LupIRx3AwRlP1DVMaaeA//3GIrPkTHkVeRQC8f1wqv
 QVBZWKFk65TsruuRDxnqIcUGZ69N6RunSoerxpFkMkGhruRHstvbYpkchUWvkmRipptTDScgjUC
 sLxjOK3D36zBue0TPgNy0Hsfb2LKt0JIZDd7/gYE9Js17Yrfbk0UKRryL7Tf0r0ZbMjFbv93+Bo
 YqbmtPiPJh5/pzpQmXr2Y9ZrxEM3KsBtsOG7s7yKCv8+tsQzNpb8g2fB41bY7ozJq/wQAUu0RJz
 oof6u4qxGP0bdRLj3159+LtPxL9alfGvL5OKRihHwA1tqz3l
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add necessary glue code to be able to use new HDMI codec framework from
the DRM bridge drivers. The drm_bridge implements a limited set of the
hdmi_codec_ops interface, with the functions accepting both
drm_connector and drm_bridge instead of just a generic void pointer.

This framework is integrated with the DRM HDMI Connector framework, but
can also be used for DisplayPort connectors.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 95 +++++++++++++++++++++++++-
 include/drm/drm_bridge.h                       | 23 +++++++
 2 files changed, 116 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 320c297008aaa8b6ef5b1f4c71928849b202e8ac..12ab9f14cc8a8672478ae2804c9a68d766d88ea5 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -20,6 +20,8 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
+#include <sound/hdmi-codec.h>
+
 /**
  * DOC: overview
  *
@@ -354,10 +356,80 @@ static int drm_bridge_connector_write_infoframe(struct drm_connector *connector,
 	return bridge->funcs->hdmi_write_infoframe(bridge, type, buffer, len);
 }
 
+static int drm_bridge_connector_audio_startup(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	if (bridge->funcs->hdmi_codec_audio_startup)
+		return bridge->funcs->hdmi_codec_audio_startup(connector, bridge);
+	else
+		return 0;
+}
+
+static int drm_bridge_connector_prepare(struct drm_connector *connector,
+					struct hdmi_codec_daifmt *fmt,
+					struct hdmi_codec_params *hparms)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	return bridge->funcs->hdmi_codec_prepare(connector, bridge, fmt, hparms);
+}
+
+static void drm_bridge_connector_audio_shutdown(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return;
+
+	bridge->funcs->hdmi_codec_audio_shutdown(connector, bridge);
+}
+
+static int drm_bridge_connector_mute_stream(struct drm_connector *connector,
+					    bool enable, int direction)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	if (bridge->funcs->hdmi_codec_mute_stream)
+		return bridge->funcs->hdmi_codec_mute_stream(connector, bridge,
+							     enable, direction);
+	else
+		return -ENOTSUPP;
+}
+
+static const struct drm_connector_hdmi_codec_funcs drm_bridge_connector_hdmi_codec_funcs = {
+	.audio_startup = drm_bridge_connector_audio_startup,
+	.prepare = drm_bridge_connector_prepare,
+	.audio_shutdown = drm_bridge_connector_audio_shutdown,
+	.mute_stream = drm_bridge_connector_mute_stream,
+};
+
 static const struct drm_connector_hdmi_funcs drm_bridge_connector_hdmi_funcs = {
 	.tmds_char_rate_valid = drm_bridge_connector_tmds_char_rate_valid,
 	.clear_infoframe = drm_bridge_connector_clear_infoframe,
 	.write_infoframe = drm_bridge_connector_write_infoframe,
+	.codec_funcs = &drm_bridge_connector_hdmi_codec_funcs,
 };
 
 /* -----------------------------------------------------------------------------
@@ -459,7 +531,25 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	if (connector_type == DRM_MODE_CONNECTOR_Unknown)
 		return ERR_PTR(-EINVAL);
 
-	if (bridge_connector->bridge_hdmi)
+	if (bridge_connector->bridge_hdmi) {
+		bridge = bridge_connector->bridge_hdmi;
+
+		if (bridge->hdmi_codec_i2s ||
+		    bridge->hdmi_codec_spdif) {
+			if (!bridge->funcs->hdmi_codec_prepare ||
+			    !bridge->funcs->hdmi_codec_audio_shutdown)
+				return ERR_PTR(-EINVAL);
+
+			bridge_connector->bridge_hdmi = bridge;
+
+			connector->hdmi_codec.dev = bridge->hdmi_codec_dev;
+			connector->hdmi_codec.i2s = bridge->hdmi_codec_i2s;
+			connector->hdmi_codec.spdif = bridge->hdmi_codec_spdif;
+			connector->hdmi_codec.max_i2s_channels =
+				bridge->hdmi_codec_max_i2s_channels;
+			connector->hdmi_codec.sound_dai_port = bridge->hdmi_codec_dai_port;
+		}
+
 		ret = drmm_connector_hdmi_init(drm, connector,
 					       bridge_connector->bridge_hdmi->vendor,
 					       bridge_connector->bridge_hdmi->product,
@@ -468,10 +558,11 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 					       connector_type, ddc,
 					       supported_formats,
 					       max_bpc);
-	else
+	} else {
 		ret = drmm_connector_init(drm, connector,
 					  &drm_bridge_connector_funcs,
 					  connector_type, ddc);
+	}
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index e8d735b7f6a480468c88287e2517b387ceec0f22..0ef9580ef6669f84327bdcb85a24fc83f76541bb 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -41,6 +41,8 @@ struct drm_display_info;
 struct drm_minor;
 struct drm_panel;
 struct edid;
+struct hdmi_codec_daifmt;
+struct hdmi_codec_params;
 struct i2c_adapter;
 
 /**
@@ -676,6 +678,21 @@ struct drm_bridge_funcs {
 				    enum hdmi_infoframe_type type,
 				    const u8 *buffer, size_t len);
 
+	int (*hdmi_codec_audio_startup)(struct drm_connector *connector,
+					struct drm_bridge *bridge);
+
+	int (*hdmi_codec_prepare)(struct drm_connector *connector,
+				  struct drm_bridge *bridge,
+				  struct hdmi_codec_daifmt *fmt,
+				  struct hdmi_codec_params *hparms);
+
+	void (*hdmi_codec_audio_shutdown)(struct drm_connector *connector,
+					  struct drm_bridge *bridge);
+
+	int (*hdmi_codec_mute_stream)(struct drm_connector *connector,
+				      struct drm_bridge *bridge,
+				      bool enable, int direction);
+
 	/**
 	 * @debugfs_init:
 	 *
@@ -859,6 +876,12 @@ struct drm_bridge {
 	 * @DRM_BRIDGE_OP_HDMI is set.
 	 */
 	unsigned int max_bpc;
+
+	struct device *hdmi_codec_dev;
+	int hdmi_codec_max_i2s_channels;
+	unsigned int hdmi_codec_i2s : 1;
+	unsigned int hdmi_codec_spdif : 1;
+	int hdmi_codec_dai_port;
 };
 
 static inline struct drm_bridge *

-- 
2.39.5


