Return-Path: <linux-samsung-soc+bounces-6004-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A692F9F9A4A
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 20 Dec 2024 20:21:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB49E188FD67
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 20 Dec 2024 19:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3543F22914E;
	Fri, 20 Dec 2024 19:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kVFfTdZE"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36AD228C95
	for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2024 19:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734722250; cv=none; b=rKrPKGzekQ5SgEw2A6L/mh0QD2X+M5r889K3JtrpQe2q+Ayt617soGpshdqLNmrS6ldq55d6JjlBt60zETbZ87l8M3ogo6gAawipSZFCRV13QEUDYlxEUivzsvdhogW+eHOEqTMn11Bdpk45nAOe8C6sngVuGmePkTWENY4Ns7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734722250; c=relaxed/simple;
	bh=4hPxpWbsnHCjP4hLc8Zphcq6ukHo7hTPqma5dXTRkXM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AuQlPkXd5bbJPbH4r+ZietXoSWfNjoQVu3dwtDbtcmczDZSNlqE6uQXByJhwpGE0V8WpfpROcpGibQqL1lzo7RBwdOD6pgXGjP0tu/xAX9WD4OJTaGo2kHCCWrUndhWf+YY3ZPRM8gxAPp8PJs/MezGPUjNusuQjfZUT2gVtEm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kVFfTdZE; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5401b7f7141so1868617e87.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2024 11:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734722244; x=1735327044; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yk3kLrzAJHgvjY+83xFqVzpLl9kCLAkeO4BDIFkSB2M=;
        b=kVFfTdZEveJOrLuTVx8VGPqxLcq7L+e5hCuHwOMhR0U1ckpXkQTBPHEIcsIA1EAMo9
         rdwm2RomH+g05rbDJCV1O9VHOMDf3rwGvGiIRfIg/9B4RR1VzADDWhhtOTU5RsV9Rjqu
         G3v3l9NN77IXexPhaW33N9G3SwlhNQA6GGU3W3cQcPfoVrM6cdX3mYgAZmCtqSS8YZlD
         GHTlVMlaPB+x+2m2T7QMZY0SaaqFMoCiFgEF5lsgYN38WPJOJ4hLpX09H4PRTqNwXR79
         5FpG54cwsrXGSbx3msSLyO6q6mz5zqBLm5+52ZOhGLywosaHVjSLIrvA4PlI9lCv+onR
         fIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734722244; x=1735327044;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yk3kLrzAJHgvjY+83xFqVzpLl9kCLAkeO4BDIFkSB2M=;
        b=iGhautN6u2Fk2k6Qg6H+R4qJjWt7F5cbQgv/s2OmrumynU7MeDBDnz1M9vU2FLNMu+
         peFrORYONi6JmtrYkgBBYTLmobuI1BkxIB6ej5PHBiKX/D3xArt3JWKn4Mlm5R/VkrOH
         jIwihBRxKANJCOhOVDehpfQXzDbC3HrIBWZ340F5BK07Qvcci/5PeSGSitSX69Su6bqv
         VzRSE6Ji1lZaPgwLds9YPI2gOGthksPxtKLvGJWPxh55bU2TZPh5hPgtdbQirsl+ZEPw
         8BOjVSrb4txtJjuOZFViAJOp53nkDWUiFaY5Yjb8aZArjpQE082/R6syBZKbDVFA4nSV
         zH/A==
X-Forwarded-Encrypted: i=1; AJvYcCX7XJslGdov1eD0ufET+rZzNA0dqwapjIei/INhxmoxrB+Xe80OllmMImxf8X/XZzwpJy5nBvYisfZxmxJ3na0MfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsxedD0gXMFB6foujuwIMc+L37H2kcrxSxi9I1c9ZL2Ab/Kvy4
	UShG8b/xOVbE/PuLejYiJwdmMuWmY7o6vhpePQCP1Re1JCHyjweZ4UtxiUWq7b4=
X-Gm-Gg: ASbGncumyWonm/XEJwA2c5Dac53CgTyhSnHhNA/rhD/hs43hzGdpTfMXihFDTA3cb3R
	cDem4j4BeIwMIlcMe5PgVpsrt7VS6VDvEJNlcot2tjriHeZF6tXA5bkem0iaV79DKIUW2SLs3ZF
	2ZFusSYSNcr/k5CUhmwqt2GUiIn+GdD95XcQRo5AZ1gQA4kor4TuXsezL44DqAkJG0Nou3oFll7
	iLWi0s1whsRV8pAM5TxfwWuKwQ522MUF7lxbFuYTNgerdkFxm9PzLxn42/GcIZK
X-Google-Smtp-Source: AGHT+IH7GrEJ+nHDwloF/OFQFZEQzwooiYY9IFdBtoTAYVRf6NL8qqpEat42azwSyL6c6a4QLAv8Qw==
X-Received: by 2002:a05:6512:e8c:b0:53a:1a81:f006 with SMTP id 2adb3069b0e04-5422953fedcmr1599190e87.31.1734722243677;
        Fri, 20 Dec 2024 11:17:23 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223813877sm545141e87.149.2024.12.20.11.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 11:17:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Dec 2024 21:17:05 +0200
Subject: [PATCH v8 08/10] drm/vc4: hdmi: switch to using generic HDMI Codec
 infrastructure
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-drm-bridge-hdmi-connector-v8-8-2399dbae2990@linaro.org>
References: <20241220-drm-bridge-hdmi-connector-v8-0-2399dbae2990@linaro.org>
In-Reply-To: <20241220-drm-bridge-hdmi-connector-v8-0-2399dbae2990@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6893;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=4hPxpWbsnHCjP4hLc8Zphcq6ukHo7hTPqma5dXTRkXM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZcKvFyQT9rpbN2fe/WXBUuBjqTFUuG+iKsIeK
 8F1T4+eV7WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2XCrwAKCRCLPIo+Aiko
 1W2DCACme2ZO/3yM7XaN7OQitkxP0YNEVFD+ldL1JIaG5TMxtJ5uUu+SOYup2ajsM6j0M4AONn7
 efOICYitPyufnl/eYeKnMsUcgHUMRZFNU16kny0l2abRi27bMzgmpuefqmIWQCL9C/ZI+SrIOUo
 n3Kylr8bxIaeBLtbXK7kQHXuPL00f3DvHDJNunztaa4hwvw+gbYX2oSu/EEa2J3JaAWZI+yTlqJ
 W/LH4XyaO+85Xqr4c/H5dpV3f3JBx4gXe4qI83dK8rm4O6pdhRNil2LHLJVrGde98QpjXNlXPW8
 ghIa2wstdd+dktsNqv8WJdsX+cQdznX/YkUJAFuOimit0Ptf
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Drop driver-specific implementation and use the generic HDMI Codec
framework in order to implement the HDMI audio support.

Acked-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 73 +++++++++++-------------------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  2 --
 2 files changed, 18 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 203293a8beca738dbfeaaf15f350026e263e646b..24199b511f2ee1bc3aa5f4a30e9d3d928d556ff1 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -584,6 +584,7 @@ static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs =
 };
 
 static const struct drm_connector_hdmi_funcs vc4_hdmi_hdmi_connector_funcs;
+static const struct drm_connector_hdmi_audio_funcs vc4_hdmi_audio_funcs;
 
 static int vc4_hdmi_connector_init(struct drm_device *dev,
 				   struct vc4_hdmi *vc4_hdmi)
@@ -609,6 +610,12 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 	if (ret)
 		return ret;
 
+	ret = drm_connector_hdmi_audio_init(connector, dev->dev,
+					    &vc4_hdmi_audio_funcs,
+					    8, false, -1);
+	if (ret)
+		return ret;
+
 	drm_connector_helper_add(connector, &vc4_hdmi_connector_helper_funcs);
 
 	/*
@@ -1921,9 +1928,9 @@ static bool vc4_hdmi_audio_can_stream(struct vc4_hdmi *vc4_hdmi)
 	return true;
 }
 
-static int vc4_hdmi_audio_startup(struct device *dev, void *data)
+static int vc4_hdmi_audio_startup(struct drm_connector *connector)
 {
-	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
 	unsigned long flags;
 	int ret = 0;
@@ -1985,9 +1992,9 @@ static void vc4_hdmi_audio_reset(struct vc4_hdmi *vc4_hdmi)
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 }
 
-static void vc4_hdmi_audio_shutdown(struct device *dev, void *data)
+static void vc4_hdmi_audio_shutdown(struct drm_connector *connector)
 {
-	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
 	unsigned long flags;
 	int idx;
@@ -2057,13 +2064,12 @@ static int sample_rate_to_mai_fmt(int samplerate)
 }
 
 /* HDMI audio codec callbacks */
-static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
+static int vc4_hdmi_audio_prepare(struct drm_connector *connector,
 				  struct hdmi_codec_daifmt *daifmt,
 				  struct hdmi_codec_params *params)
 {
-	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
-	struct drm_connector *connector = &vc4_hdmi->connector;
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	unsigned int sample_rate = params->sample_rate;
 	unsigned int channels = params->channels;
@@ -2075,7 +2081,7 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 	int ret = 0;
 	int idx;
 
-	dev_dbg(dev, "%s: %u Hz, %d bit, %d channels\n", __func__,
+	dev_dbg(&vc4_hdmi->pdev->dev, "%s: %u Hz, %d bit, %d channels\n", __func__,
 		sample_rate, params->sample_width, channels);
 
 	mutex_lock(&vc4_hdmi->mutex);
@@ -2214,40 +2220,12 @@ static const struct snd_dmaengine_pcm_config pcm_conf = {
 	.prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config,
 };
 
-static int vc4_hdmi_audio_get_eld(struct device *dev, void *data,
-				  uint8_t *buf, size_t len)
-{
-	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
-	struct drm_connector *connector = &vc4_hdmi->connector;
-
-	mutex_lock(&connector->eld_mutex);
-	memcpy(buf, connector->eld, min(sizeof(connector->eld), len));
-	mutex_unlock(&connector->eld_mutex);
-
-	return 0;
-}
-
-static const struct hdmi_codec_ops vc4_hdmi_codec_ops = {
-	.get_eld = vc4_hdmi_audio_get_eld,
+static const struct drm_connector_hdmi_audio_funcs vc4_hdmi_audio_funcs = {
+	.startup = vc4_hdmi_audio_startup,
 	.prepare = vc4_hdmi_audio_prepare,
-	.audio_shutdown = vc4_hdmi_audio_shutdown,
-	.audio_startup = vc4_hdmi_audio_startup,
-};
-
-static struct hdmi_codec_pdata vc4_hdmi_codec_pdata = {
-	.ops = &vc4_hdmi_codec_ops,
-	.max_i2s_channels = 8,
-	.i2s = 1,
+	.shutdown = vc4_hdmi_audio_shutdown,
 };
 
-static void vc4_hdmi_audio_codec_release(void *ptr)
-{
-	struct vc4_hdmi *vc4_hdmi = ptr;
-
-	platform_device_unregister(vc4_hdmi->audio.codec_pdev);
-	vc4_hdmi->audio.codec_pdev = NULL;
-}
-
 static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 {
 	const struct vc4_hdmi_register *mai_data =
@@ -2255,7 +2233,6 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 	struct snd_soc_dai_link *dai_link = &vc4_hdmi->audio.link;
 	struct snd_soc_card *card = &vc4_hdmi->audio.card;
 	struct device *dev = &vc4_hdmi->pdev->dev;
-	struct platform_device *codec_pdev;
 	const __be32 *addr;
 	int index, len;
 	int ret;
@@ -2348,20 +2325,6 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 		return ret;
 	}
 
-	codec_pdev = platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
-						   PLATFORM_DEVID_AUTO,
-						   &vc4_hdmi_codec_pdata,
-						   sizeof(vc4_hdmi_codec_pdata));
-	if (IS_ERR(codec_pdev)) {
-		dev_err(dev, "Couldn't register the HDMI codec: %ld\n", PTR_ERR(codec_pdev));
-		return PTR_ERR(codec_pdev);
-	}
-	vc4_hdmi->audio.codec_pdev = codec_pdev;
-
-	ret = devm_add_action_or_reset(dev, vc4_hdmi_audio_codec_release, vc4_hdmi);
-	if (ret)
-		return ret;
-
 	dai_link->cpus		= &vc4_hdmi->audio.cpu;
 	dai_link->codecs	= &vc4_hdmi->audio.codec;
 	dai_link->platforms	= &vc4_hdmi->audio.platform;
@@ -2374,7 +2337,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 	dai_link->stream_name = "MAI PCM";
 	dai_link->codecs->dai_name = "i2s-hifi";
 	dai_link->cpus->dai_name = dev_name(dev);
-	dai_link->codecs->name = dev_name(&codec_pdev->dev);
+	dai_link->codecs->name = dev_name(&vc4_hdmi->connector.hdmi_audio.codec_pdev->dev);
 	dai_link->platforms->name = dev_name(dev);
 
 	card->dai_link = dai_link;
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index b2424a21da230db99db207efa293417faccd254d..e3d989ca302b72533c374dfa3fd0d5bd7fe64a82 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -104,8 +104,6 @@ struct vc4_hdmi_audio {
 	struct snd_soc_dai_link_component codec;
 	struct snd_soc_dai_link_component platform;
 	struct snd_dmaengine_dai_dma_data dma_data;
-	struct hdmi_audio_infoframe infoframe;
-	struct platform_device *codec_pdev;
 	bool streaming;
 };
 

-- 
2.39.5


