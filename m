Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CBC0435C00
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 21 Oct 2021 09:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231623AbhJUHnB (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 21 Oct 2021 03:43:01 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:48615 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231627AbhJUHmb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 21 Oct 2021 03:42:31 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id A929C2B01301;
        Thu, 21 Oct 2021 03:40:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 21 Oct 2021 03:40:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=5DYu0cvmP8Ovg
        zPcAQBqcadRggWOBGnej15W0Sy1/ns=; b=frf6ixAAgk8gfXoePOUjIetNMXMX0
        syKAoDiqgHsHMeRgC0g6VuRwbzUB/3kQuHveuIeqdtf61epvZ3SIzYuuslciFVrD
        Bf5cBDfWCqiRyFI/wV4VvrRcODSlm3CsCwnueGSC9dziG3A0JumskEr8WHogyieb
        3ktII+qw4mUZpV9lO6hHhVPl3zLAjZ+D0JhAr/NeJXPemcWFKiAjprW/zODFiMsF
        EU7bNfl+G/50R3FNoNl0y8gy85zzNFHSCCjkAWM03+Vbl/CqHe8pBQ/lIWgqRfpW
        /4ipa0/jyoMQxJ3P/Dg+iANZvlT4LmAtqUnDuD83YcZkOmzvQPWCTCOJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=5DYu0cvmP8OvgzPcAQBqcadRggWOBGnej15W0Sy1/ns=; b=TC+cH+wM
        QZ8NNj3mjJiEpavlSzGXMYG8mfud4Jq5diA0ziJdilr65MD7Lj1uG1oXXTG9ns39
        QpNo5bxktl0kkdnAB4M6UdOrnD7Q9920YkYwm5ilEyUN7T9qvBJ7GouzzIh2D5n8
        w0YJC5BoGzCSMa1tj02gnOb8m+hkGQugSmsnz/njpnTNlqj5uK2kfOYmssMCpeOD
        HOKX/dzi0sxoGBF7u5wHiWL2cSB6xW6/zr5z7b/Enbh3FZfZgcwYlebexp2Ymzos
        V2KufcN9kc6/5exKW1gqJP9U/8xQmrK7zXllkliyCgY+87rHuC5ei/acB05eUR1h
        I+jlsg/0pUJ6Cw==
X-ME-Sender: <xms:XRlxYVJYP-OSV5V63hyWxv-HdFYQA6xOtuyqTMUO3Dfona3iwbogjw>
    <xme:XRlxYRJj4HrSimHjFUivj12cgrSuB17jiEw7nzBN1aPE08UqouAruCnkQsvjtuQY9
    kYJvziq3gSMqF3-U6Y>
X-ME-Received: <xmr:XRlxYduyhNLGixC2bn1lDJ0zqxcjQRhxNPiRgx2-yC2AX2y2Qb9snzLkzLxzVcothxVgQFVFcY2k_Gh9D1eljvKhJ81sy51LagCZ2LF9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvhedgudduiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
    heehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:XRlxYWZV-OtpxNN-Mk7mB8o7GRPiCu7RchiYbYjhKQqN6-1rDYkCZw>
    <xmx:XRlxYcbEwf-1Oi0XaseAUFQbLBcb1HjWW9z_ikBxGW0N1idInQBvAw>
    <xmx:XRlxYaBIuZdKV-WUO9hRHw2mkLq9412b1DM5QDt-bz6Ms3e8aOKTSQ>
    <xmx:XRlxYWZF7Dx5JoTCuUNlNXwsoFO-bRNitVdTAm36If6NxnauPn6SnZpRXg0>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Oct 2021 03:40:12 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Sam Ravnborg <sam@ravnborg.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Thierry Reding <thierry.reding@gmail.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Robert Foss <robert.foss@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     Seung-Woo Kim <sw0312.kim@samsung.com>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tian Tao <tiantao6@hisilicon.com>,
        freedreno@lists.freedesktop.org,
        Chen Feng <puck.chen@hisilicon.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        John Stultz <john.stultz@linaro.org>,
        Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
        Sean Paul <sean@poorly.run>, Inki Dae <inki.dae@samsung.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        dri-devel@lists.freedesktop.org
Subject: [PATCH v5 04/21] drm/bridge: anx7625: Register and attach our DSI device at probe
Date:   Thu, 21 Oct 2021 09:39:30 +0200
Message-Id: <20211021073947.499373-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211021073947.499373-1-maxime@cerno.tech>
References: <20211021073947.499373-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

In order to avoid any probe ordering issue, the best practice is to move
the secondary MIPI-DSI device registration and attachment to the
MIPI-DSI host at probe time. Let's do this.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 4adeb2bad03a..d0317651cd75 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1367,12 +1367,6 @@ static int anx7625_bridge_attach(struct drm_bridge *bridge,
 		return -ENODEV;
 	}
 
-	err = anx7625_attach_dsi(ctx);
-	if (err) {
-		DRM_DEV_ERROR(dev, "Fail to attach to dsi : %d\n", err);
-		return err;
-	}
-
 	if (ctx->pdata.panel_bridge) {
 		err = drm_bridge_attach(bridge->encoder,
 					ctx->pdata.panel_bridge,
@@ -1845,10 +1839,24 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 	platform->bridge.type = DRM_MODE_CONNECTOR_eDP;
 	drm_bridge_add(&platform->bridge);
 
+	ret = anx7625_attach_dsi(platform);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "Fail to attach to dsi : %d\n", ret);
+		goto unregister_bridge;
+	}
+
 	DRM_DEV_DEBUG_DRIVER(dev, "probe done\n");
 
 	return 0;
 
+unregister_bridge:
+	drm_bridge_remove(&platform->bridge);
+
+	if (!platform->pdata.low_power_mode)
+		pm_runtime_put_sync_suspend(&client->dev);
+
+	anx7625_unregister_i2c_dummy_clients(platform);
+
 free_wq:
 	if (platform->workqueue)
 		destroy_workqueue(platform->workqueue);
-- 
2.31.1

