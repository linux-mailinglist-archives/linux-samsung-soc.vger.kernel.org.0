Return-Path: <linux-samsung-soc+bounces-5232-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB479B8F0F
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  1 Nov 2024 11:21:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEC981F22E80
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  1 Nov 2024 10:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCCF719D8B7;
	Fri,  1 Nov 2024 10:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LPDq0nWU"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB6319E819
	for <linux-samsung-soc@vger.kernel.org>; Fri,  1 Nov 2024 10:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730456371; cv=none; b=NLSdgG/W1ezzUbStYK1Y/aonjDzqz5C+cDitp37/AMjO6y47CrIF+4UIyuncxB4REcE31Wi6Jr6h5HuptLNSSS44EprNsIv6r1lLjC4XIaMp1n6rdGKwTX0IIbL8MtG2kRC5v1bt7Z0QBPKsaKvQI2Xthee1HxHhy56q/lWtBx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730456371; c=relaxed/simple;
	bh=Pbf6ekV+i45DFn0vAhN81yq5JTl3TzjpRpOOR4scnrw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j0FOt3QnkzcEP65ZwgEkSgVnDr4QFQcfHL3kbPP9onfR6NTjN4jeL4pXYc13Evji4Q1j7TdDdCRk/FBMM81k5KPIzytT0NydN8C2dFQcamWMiBWOMYDfvjfNL6LUUNfFvwarlg1iGjb4DYOovhfg3oYWjbdJajfeXDYuuJkM6wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LPDq0nWU; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so2440893e87.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Nov 2024 03:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730456367; x=1731061167; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SSyJnhqtzNGB7l1kz5uHZfxocs7V67foS6FdivcD7DM=;
        b=LPDq0nWUy3/bWgb9gOAemPwNFv7ME4/jBhY5+xIMxjCg7sryILu6836hANayqdZUIu
         gs1u7LR0CM1GRbZ3uBKuNeooNh/Pw8lOzAl/7+Zqmkp8a/rgzAYmkmzt/rLhFiBWN4LC
         esF7VSCioNml39fZQqDEXdYaE+g2pNqVFUe5nwIK6dlssJ6MfHM/923WP4GxAx4TdTwN
         QK20If0rUdSD9q6nC3qPFwDn4Uut6syd6G+jUkwMWPnROkOV++jZcTVPsmQjqgxrc/JN
         9dvDV3udKScbJ9yHyZ4fuRYhqFcaekkDSu15AsbnXbBvkFVqO53ByABHrA9XKSAMy+tE
         2Dkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730456367; x=1731061167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SSyJnhqtzNGB7l1kz5uHZfxocs7V67foS6FdivcD7DM=;
        b=rMeVJGxXuYhjEAgjECMmyDhUt/6DWQo7IfluwF6IK8F6Yo96HTJwWQt8p3EnYiHfG0
         erRuaG+Xf9IdMbKesj+KXnbdj2uSQnH1YBRKIy7wb4hA5vaQRVMmAfbDxCQVZ+mC7XC0
         fw20qHLWpkZpkCCEHl3aa4uqinx2GJQGx9U0mzObgXeALCIeOkg+o6XpT6ckGHwlonlE
         AxZQlAECxsh9vGrviXUb0ewZxpvdiEuoqgA9O5dWtIfugaaaGNi3HfulpHyzn8NfzgXu
         DvZ8/ZuAeB4O6qkQRE+tUmWKotAlQhneuS6ppI2itWIORdCMYdjCMjNCXpkCa4faYGkf
         hWaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQndFvTZVRIAZ5CbH3Zq7CdvlkkyWNbfEhC8j7MDL/97GFmoKZBoCnZCNSGmlGCfB/V/JJB+Vb4kJcGkX8WrWuJw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmh7WCLAhtguQZSsmv7EWFyLw+rG1c7Msvdl1ddddZHFQr+SeQ
	DiuUxOqW2uu/U9Jv9a0oRhFp2RZn99KaXG+7Cm3mfBJBbUADGWQ5yoohdN77jms=
X-Google-Smtp-Source: AGHT+IGhSWfH6euhYW2znlkFK+r3govgY1LuFIe7fOuMV+C37e3QgH0MbPED7GtFqocAeau78Vvz7w==
X-Received: by 2002:a2e:4c12:0:b0:2f6:6074:db71 with SMTP id 38308e7fff4ca-2fdec5f831amr26624951fa.17.1730456367449;
        Fri, 01 Nov 2024 03:19:27 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fdef5d6ef4sm5197031fa.48.2024.11.01.03.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 03:19:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 01 Nov 2024 12:19:08 +0200
Subject: [PATCH RFC v2 7/7] drm/bridge_connector: hook
 __drm_atomic_helper_connector_hdmi_update_edid()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-drm-bridge-hdmi-connector-v2-7-739ef9addf9e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4075;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Pbf6ekV+i45DFn0vAhN81yq5JTl3TzjpRpOOR4scnrw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJKsZAyyzFUbIF1GNuLd1ZpLZ1B2KWEi1m5jD4
 rBI+bHjpFKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZySrGQAKCRCLPIo+Aiko
 1bv9B/9aAzBx6TyAdD0HiTY84ACPnO30AoIMqz4lY2qeZr1j/AXgrWjWY+hZqDi6N6X6s8F7ArV
 QOhiCSvJ/wBqX2oIw4oG6kn/StwLHzUzjvdq5q4vVKjwGKIh6cc8LzyoJi5L1/eI7L59vUDpn0U
 qHPk1TWzpjbuGNKpe/rT/Ds0c7458AmhADW48RgNU0NAjvbZYvcLT1IKTfs0ZTNtJlqnZnGSnA4
 KD+5OOhfX5lF5o9KH9K9DnZFeaL7wehWOzHLWlqjaWakWwIgCQzluX4lK5NCstgZnkT9XyOHW0q
 YWrQ6YVSm+zTkO8F578PtuXJBzB9WY50mHLRzLH1cDQL1qdN
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Extend drm_bridge_connector code to read the EDID and use it to update
connector status if the bridge chain implements HDMI bridge. Performing
it from the generic location minimizes individual bridge's code and
enforces standard behaviour from all corresponding drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 65 ++++++++++++++++++++------
 1 file changed, 51 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 12ab9f14cc8a8672478ae2804c9a68d766d88ea5..4069e0f972d5fcabf7e07238583fc9ea89ab113f 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -17,6 +17,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
@@ -175,17 +176,53 @@ static void drm_bridge_connector_disable_hpd(struct drm_connector *connector)
  * Bridge Connector Functions
  */
 
+static const struct drm_edid *
+drm_bridge_connector_read_edid(struct drm_connector *connector,
+			       enum drm_connector_status status)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	const struct drm_edid *drm_edid;
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_edid;
+	if (!bridge)
+		return NULL;
+
+	if (status != connector_status_connected)
+		return NULL;
+
+	drm_edid = drm_bridge_edid_read(bridge, connector);
+	if (!drm_edid_valid(drm_edid)) {
+		drm_edid_free(drm_edid);
+		return NULL;
+	}
+
+	return drm_edid;
+}
+
 static enum drm_connector_status
 drm_bridge_connector_detect(struct drm_connector *connector, bool force)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
 	struct drm_bridge *detect = bridge_connector->bridge_detect;
+	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
 	enum drm_connector_status status;
 
 	if (detect) {
 		status = detect->funcs->detect(detect);
 
+		if (hdmi) {
+			const struct drm_edid *drm_edid = drm_bridge_connector_read_edid(connector,
+											 status);
+			int ret;
+
+			ret = __drm_atomic_helper_connector_hdmi_update_edid(connector, drm_edid);
+			if (ret)
+				drm_warn(connector->dev, "updating EDID failed with %d\n", ret);
+		}
+
 		drm_bridge_connector_hpd_notify(connector, status);
 	} else {
 		switch (connector->connector_type) {
@@ -246,29 +283,29 @@ static const struct drm_connector_funcs drm_bridge_connector_funcs = {
 static int drm_bridge_connector_get_modes_edid(struct drm_connector *connector,
 					       struct drm_bridge *bridge)
 {
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
 	enum drm_connector_status status;
 	const struct drm_edid *drm_edid;
-	int n;
 
 	status = drm_bridge_connector_detect(connector, false);
 	if (status != connector_status_connected)
-		goto no_edid;
+		return 0;
 
-	drm_edid = drm_bridge_edid_read(bridge, connector);
-	if (!drm_edid_valid(drm_edid)) {
+	/* In HDMI setup the EDID has been read and handled as a part of .detect() */
+	if (!hdmi) {
+		drm_edid = drm_bridge_connector_read_edid(connector, status);
+		if (!drm_edid) {
+			drm_edid_connector_update(connector, NULL);
+			return 0;
+		}
+
+		drm_edid_connector_update(connector, drm_edid);
 		drm_edid_free(drm_edid);
-		goto no_edid;
 	}
 
-	drm_edid_connector_update(connector, drm_edid);
-	n = drm_edid_connector_add_modes(connector);
-
-	drm_edid_free(drm_edid);
-	return n;
-
-no_edid:
-	drm_edid_connector_update(connector, NULL);
-	return 0;
+	return drm_edid_connector_add_modes(connector);
 }
 
 static int drm_bridge_connector_get_modes(struct drm_connector *connector)

-- 
2.39.5


