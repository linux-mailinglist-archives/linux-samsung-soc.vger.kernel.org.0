Return-Path: <linux-samsung-soc+bounces-5997-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DAD9F9A2B
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 20 Dec 2024 20:17:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00E19188FBAF
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 20 Dec 2024 19:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25CAA22146B;
	Fri, 20 Dec 2024 19:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YCv97DXD"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0332210C0
	for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2024 19:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734722231; cv=none; b=PKvm8kWz+zWpyPqt3XMY7MIdIRbAiwF4SIdPEmSQJxfT7fAKpdErkVMwrR9DTBzWA0QhbNbaQ/Jv8WQOMzARbbHSSRQ/5d1MeviEBNexWRZgQc1YnaznOEr7Bsk1fZYYQPekutnL4EMAqQQRGdGEwZ21wcbyBM2LKVDf4c5ndQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734722231; c=relaxed/simple;
	bh=6koNmDXcOf4CbyeGeobrJUiApePK/ghJFVbajP7FMx0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RimsdEvGDyOxz5uhDk6Ive1KJxB0sCeS7b7ySZlqD6pPbqrwMqxjJgwOw3PLKLvY8U0lwSEIEGdPSOGmVavyfiVkH97QHpgSB1x7Z4DTyZNGaPI3Ofr4PvUaLTSq266jnA0WSV4AULea5icQRXW4ZzL+ff2AhTdHeWEwVwcy95A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YCv97DXD; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5401bd6cdb4so2409359e87.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2024 11:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734722228; x=1735327028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SbqFqEWhdexua+X7kS2heKGav8iVEOxoFkfoy1VF4D4=;
        b=YCv97DXDBch4986WUtb/4ITJO43sNJZ6BNo/A93ebcn+WRdo11kdY6PIFf/EGAMHuh
         VvcWjV3tdqVTUT1G8rOjky4yKhyRu5v9U0mODC6ZAJ6z1+V6qGF6Dwk96gZE8D/x8Q61
         UfHPow4bVOPwBu657iim3dLe8OEOIBTqqALcKaPwSWTS8e4yKGM2vuswdRsZkB0K8ywi
         6DiGhW7bHL0LPLjTgaAQTaBnJyOLMVhF/W8BgilPCJ6mJlQ6sYcaQ8wuLHmprSHb5Meu
         cHEeqMWuNTki5YIDOAA+1HcfSznIOImnVufkwRcQfgr7bsuEShhXVDidVF41H2apskxc
         rOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734722228; x=1735327028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SbqFqEWhdexua+X7kS2heKGav8iVEOxoFkfoy1VF4D4=;
        b=N5TqOpVWxdNmDQ6xibM2z9fiA1RzzaT5CaSI/8iG5RH8/0pqULmvbsbyAMYUr1iFpe
         XafdOMoA7C7FCEo5sySKdMVIk8x2JiQAnewEXcaIAad0LNGllSZzaixKA7yuzqAmmkZv
         6Fsc2pRZilZbtxepapD6r1Yb3k2V1Za+gPpeYCeZdg/jHoumTuCdb4zgNmJmsM0kpK3N
         I2RNZbvzlWRbTflA5ARxJg2j5Lq46bsg8iZoJR21fVTOWPj5hw7dS4OxGasv20ODfy5N
         hAh8OYPrmTwRKISAf1q5/W4/iWLecGkIU0r5L3dxLUGItOSbqbMcvYgWuvvEOjTkz2iF
         huRA==
X-Forwarded-Encrypted: i=1; AJvYcCVIG3oeQha/qME8oKUIGmkSbW9tyufUuRBG0+hGihSqQc43unw9+ro+ql63/Rgq3S4s2vduB19lWOocun+Op8dqPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YydObIJGyAjAjhCZBqRn0P2mVb61VdV2Dvh5tn5KHUUT/XdrLnZ
	UdrUlsqjzruZ5bGaoluVCaBjBUEHQnya3Ly6NAIr3oSciWwJKt9ZrMdAN9+cYNM=
X-Gm-Gg: ASbGnct42pzEtLeYjoDfQs7Eeer79nokSVfbs6RRY2FMvnyPQq+JE8uq1oz5og5dqYD
	rSr7jZLGnGmcACuGFimBn6gHCGyFmonhMrsHxp+K/v26o+55Tzx1bdKDtUhUSFfK068KGQRXbhj
	7m/YfzuQrTIxFktPmUJw0eKU0g2BEuqNyXqBRbIp71D2QllvJZbqyhXZ0EBspnkn4dx+L93kgMi
	X2778I4SkwVM4E7gC7f4UqVQGRzjPrIP2smgH0sQ4pE8Yf9OrlOGf7LqQmxjr6b
X-Google-Smtp-Source: AGHT+IH+pgCMkj1f1D4uTVIQ8LE/rpsTVBWlpzRwVAuIIJM/o+Cur1S6iEYvpVA7gXnrQkHowsl5+w==
X-Received: by 2002:a05:6512:ba6:b0:542:241e:75ac with SMTP id 2adb3069b0e04-54229524509mr1454579e87.5.1734722228039;
        Fri, 20 Dec 2024 11:17:08 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223813877sm545141e87.149.2024.12.20.11.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 11:17:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Dec 2024 21:16:58 +0200
Subject: [PATCH v8 01/10] ASoC: hdmi-codec: pass data to get_dai_id too
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-drm-bridge-hdmi-connector-v8-1-2399dbae2990@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5752;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=6koNmDXcOf4CbyeGeobrJUiApePK/ghJFVbajP7FMx0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZcKuvQVpmC050nEq/u3YGXeJFMKYu9J3CXE1b
 dpWj8ms6vyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2XCrgAKCRCLPIo+Aiko
 1ZGkB/0WVSPqmHWl3e+7V2eQahPUzFhUClcaYE/omJo1OjF8ARW3sg6SDDPLhn9RixBH4qkZk2Q
 fqqS2lfhu0vV7sf5sdEdFJsWxewSBZQfgnCfULlrnj4TxwnjOI2oDCG6/mJl4PbhbwA0AGeX7qD
 wyDusQ3hkbdCTj12FQNqj1mE0G23EWdJj1BGj2QzKfD1zBWdxpQx1WCewCpRmE/7+dFrRsh2Tsu
 2YRDnVC2DozseFJSxYYhMfaZdqXrhNM7ODIvS5Z2Xn+kR/YeqC6wEM9ng7a7BmeE4fEgSO+S8CM
 R/JjfPOi/40fY42rPl0FwM//z+b7+dZe6cK4O4ujymKofDqO
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The upcoming DRM connector HDMI codec implementation is going to use
codec-specific data in the .get_dai_id to get drm_connector. Pass data
to the callback, as it is done with other hdmi_codec_ops callbacks.

Acked-by: Mark Brown <broonie@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c      | 3 ++-
 drivers/gpu/drm/bridge/analogix/anx7625.c           | 3 ++-
 drivers/gpu/drm/bridge/lontium-lt9611.c             | 3 ++-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c          | 3 ++-
 drivers/gpu/drm/bridge/sii902x.c                    | 3 ++-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 3 ++-
 include/sound/hdmi-codec.h                          | 3 ++-
 sound/soc/codecs/hdmi-codec.c                       | 2 +-
 8 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
index 61f4a38e7d2bf6905683cbc9e762b28ecc999d05..51fb9a574b4e28450b2598a92e2930ace5128b71 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
@@ -204,7 +204,8 @@ static void audio_shutdown(struct device *dev, void *data)
 }
 
 static int adv7511_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
-					struct device_node *endpoint)
+					struct device_node *endpoint,
+					void *data)
 {
 	struct of_endpoint of_ep;
 	int ret;
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 6238eabd23282d5f7e59a05d267737f40211aaf3..d65680d1bc8f2f27927b8a9d6926b72531791614 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1952,7 +1952,8 @@ static void anx7625_audio_shutdown(struct device *dev, void *data)
 }
 
 static int anx7625_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
-				       struct device_node *endpoint)
+				       struct device_node *endpoint,
+				       void *data)
 {
 	struct of_endpoint of_ep;
 	int ret;
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 74f726efc74613460a6eb9c41f0bbad2ab06208f..698a9a01783d28edc734b6932a7768978de65ffc 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -1057,7 +1057,8 @@ static void lt9611_audio_shutdown(struct device *dev, void *data)
 }
 
 static int lt9611_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
-				      struct device_node *endpoint)
+				      struct device_node *endpoint,
+				      void *data)
 {
 	struct of_endpoint of_ep;
 	int ret;
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index db9a5466060b663e88d58e85f24bf2d58d74a81c..f4c3ff1fdc6923eb7a8c0d8f7f92e7649c797d77 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -522,7 +522,8 @@ static void lt9611uxc_audio_shutdown(struct device *dev, void *data)
 }
 
 static int lt9611uxc_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
-					 struct device_node *endpoint)
+					 struct device_node *endpoint,
+					 void *data)
 {
 	struct of_endpoint of_ep;
 	int ret;
diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 127da22011b3235b049c38413e56d50414cf36fb..a02d30c0ba4221d7fee0eb50892ab4d8e8436004 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -815,7 +815,8 @@ static int sii902x_audio_get_eld(struct device *dev, void *data,
 }
 
 static int sii902x_audio_get_dai_id(struct snd_soc_component *component,
-				    struct device_node *endpoint)
+				    struct device_node *endpoint,
+				    void *data)
 {
 	struct of_endpoint of_ep;
 	int ret;
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
index f1c5a8d0fa90e2eb2ee488b6a5871b005f797ea1..2c903c9fe8052ab721445188fd2b75270a55f2b0 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
@@ -148,7 +148,8 @@ static int dw_hdmi_i2s_get_eld(struct device *dev, void *data, uint8_t *buf,
 }
 
 static int dw_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
-				  struct device_node *endpoint)
+				  struct device_node *endpoint,
+				  void *data)
 {
 	struct of_endpoint of_ep;
 	int ret;
diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
index 5e1a9eafd10f5d4f831abbb6f4c0fff661909584..b3407b47b4a7878532ecf3b08eeecd443d6fdb07 100644
--- a/include/sound/hdmi-codec.h
+++ b/include/sound/hdmi-codec.h
@@ -105,7 +105,8 @@ struct hdmi_codec_ops {
 	 * Optional
 	 */
 	int (*get_dai_id)(struct snd_soc_component *comment,
-			  struct device_node *endpoint);
+			  struct device_node *endpoint,
+			  void *data);
 
 	/*
 	 * Hook callback function to handle connector plug event.
diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index d9df29a26f4f213a30a2ebcdb63a593f9cf4b901..f536ca60e162dca6b50b37854ca6de2c114bc2a1 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -995,7 +995,7 @@ static int hdmi_of_xlate_dai_id(struct snd_soc_component *component,
 	int ret = -ENOTSUPP; /* see snd_soc_get_dai_id() */
 
 	if (hcp->hcd.ops->get_dai_id)
-		ret = hcp->hcd.ops->get_dai_id(component, endpoint);
+		ret = hcp->hcd.ops->get_dai_id(component, endpoint, hcp->hcd.data);
 
 	return ret;
 }

-- 
2.39.5


