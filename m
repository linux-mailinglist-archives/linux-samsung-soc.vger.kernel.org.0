Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6060439A23
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 25 Oct 2021 17:16:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233922AbhJYPTM (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 25 Oct 2021 11:19:12 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:47275 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233928AbhJYPSn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 25 Oct 2021 11:18:43 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id C45965806C2;
        Mon, 25 Oct 2021 11:16:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 25 Oct 2021 11:16:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=0jRcvudXPXM/a
        o9XoLGKBfJZiC+x5dQANxi83lap800=; b=WG4xrcKoorkVrGJVI/C8FHnd6AQg/
        JKvx2HuXPgQ3s4iknbtwnJ8+HA4MYLAuvAFtjFpSq7UNpapjkeCekznO43BsfDIQ
        Bqj32xHepC42MXPJTFREQR33SvWIhorX6T18Mmbi6yJBrICDYN/oyZSLCgsjVsW2
        kG3aiKCCRzhBXTYVhpUxsNCdWqMWOcP8MfTzfo1gm6xzDuJdzdNVio/C9Q0srfqE
        lnVGGGZ3OuY+yaZjN99vU56Zivg0jTjf57lCXscJRd1gxdCWCymQyIG8pI8KdfFY
        6C75CYGMxXr5OAskmOlzSas6hQSS1Pf8h8JXqiJ6bMZwUZ1SxmyFRWnPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=0jRcvudXPXM/ao9XoLGKBfJZiC+x5dQANxi83lap800=; b=Hs8Rjx/T
        BgtdmUIJmIsvqIBiulZunxyMUlBdrH1w/6WqJYWlMJZwyz5KuiZH8kXL9ZGtPeIt
        RbjLtuzmbF5b+zCqZVk6vtaSBsYvmFpjsDBzlCUx7Weyk3i7KqwFH5K71eCguMi9
        jHwVTtACWVqnrFutjjNltceOJVzs6nzaJnycFxrIEGmyjHEYeDkS8ALIsspXFeIX
        z+3sC2iQKiepNjx/o6SnmVSX05Q0XgxhWfg3QB6xQ+kH9cIveMpB4ZxSxJqo4RdD
        1s+NFkZ91OMb9O0Bd/ZCuyyU4rpGDLwDcRbILM2mTwvYLG9Q7E7GZM7BBTohSIPv
        BmYVQ7VC7H/5sA==
X-ME-Sender: <xms:RMp2YfEe_jFI3CDTQ6sp5lZNjrGfH--3DSZmqFCXsvc29gildDUTow>
    <xme:RMp2YcXOIWVHjALID14K4B0pfe6IziVB2tKXcRWMssjal_6VczkcYlGiB0DlVqU_N
    2XWGYeMTgoEk4V1usg>
X-ME-Received: <xmr:RMp2YRJgJtphC1O0grrfLpkVBYsSE7WY33zUKANxCWqR1PDV_EXXKs__m1N3YxFwiH0G96KQWNMM_u2sAQAoK-d6TETgwNpM2vgw-11H>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgkeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:RMp2YdF_Is4MzlIM-CWrbvNTElUfzktTGkr5jDprsBx1E6emgAKHkQ>
    <xmx:RMp2YVX2dRKR79OfMQDnT0YN7JpjX1Crz-gX9aJ_BAT7mGFg3EUplQ>
    <xmx:RMp2YYPczCSvT_UUjiuZOfmB9IHGsk5x489tkVkoepjsz6CYLsFgmA>
    <xmx:RMp2Yfg6taOa8wuyXeUx0b4UthLLHhp8w4EtjrXsfA1-UMN8Ld8INA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 11:16:19 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Robert Foss <robert.foss@linaro.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     Seung-Woo Kim <sw0312.kim@samsung.com>,
        linux-arm-msm@vger.kernel.org,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Rob Clark <robdclark@gmail.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Chen Feng <puck.chen@hisilicon.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        linux-samsung-soc@vger.kernel.org,
        Xinliang Liu <xinliang.liu@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        linux-kernel@vger.kernel.org, Inki Dae <inki.dae@samsung.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Sean Paul <sean@poorly.run>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v6 15/21] drm/bridge: sn65dsi83: Register and attach our DSI device at probe
Date:   Mon, 25 Oct 2021 17:15:30 +0200
Message-Id: <20211025151536.1048186-16-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025151536.1048186-1-maxime@cerno.tech>
References: <20211025151536.1048186-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

In order to avoid any probe ordering issue, the best practice is to move
the secondary MIPI-DSI device registration and attachment to the
MIPI-DSI host at probe time. Let's do this.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 80 +++++++++++++++------------
 1 file changed, 46 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 539edd2c19f5..945f08de45f1 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -245,40 +245,6 @@ static int sn65dsi83_attach(struct drm_bridge *bridge,
 			    enum drm_bridge_attach_flags flags)
 {
 	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
-	struct device *dev = ctx->dev;
-	struct mipi_dsi_device *dsi;
-	struct mipi_dsi_host *host;
-	int ret = 0;
-
-	const struct mipi_dsi_device_info info = {
-		.type = "sn65dsi83",
-		.channel = 0,
-		.node = NULL,
-	};
-
-	host = of_find_mipi_dsi_host_by_node(ctx->host_node);
-	if (!host) {
-		dev_err(dev, "failed to find dsi host\n");
-		return -EPROBE_DEFER;
-	}
-
-	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
-	if (IS_ERR(dsi)) {
-		return dev_err_probe(dev, PTR_ERR(dsi),
-				     "failed to create dsi device\n");
-	}
-
-	ctx->dsi = dsi;
-
-	dsi->lanes = ctx->dsi_lanes;
-	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST;
-
-	ret = devm_mipi_dsi_attach(dev, dsi);
-	if (ret < 0) {
-		dev_err(dev, "failed to attach dsi to host\n");
-		return ret;
-	}
 
 	return drm_bridge_attach(bridge->encoder, ctx->panel_bridge,
 				 &ctx->bridge, flags);
@@ -636,6 +602,44 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
 	return 0;
 }
 
+static int sn65dsi83_host_attach(struct sn65dsi83 *ctx)
+{
+	struct device *dev = ctx->dev;
+	struct mipi_dsi_device *dsi;
+	struct mipi_dsi_host *host;
+	const struct mipi_dsi_device_info info = {
+		.type = "sn65dsi83",
+		.channel = 0,
+		.node = NULL,
+	};
+	int ret;
+
+	host = of_find_mipi_dsi_host_by_node(ctx->host_node);
+	if (!host) {
+		dev_err(dev, "failed to find dsi host\n");
+		return -EPROBE_DEFER;
+	}
+
+	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
+	if (IS_ERR(dsi))
+		return dev_err_probe(dev, PTR_ERR(dsi),
+				     "failed to create dsi device\n");
+
+	ctx->dsi = dsi;
+
+	dsi->lanes = ctx->dsi_lanes;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST;
+
+	ret = devm_mipi_dsi_attach(dev, dsi);
+	if (ret < 0) {
+		dev_err(dev, "failed to attach dsi to host: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int sn65dsi83_probe(struct i2c_client *client,
 			   const struct i2c_device_id *id)
 {
@@ -679,7 +683,15 @@ static int sn65dsi83_probe(struct i2c_client *client,
 	ctx->bridge.of_node = dev->of_node;
 	drm_bridge_add(&ctx->bridge);
 
+	ret = sn65dsi83_host_attach(ctx);
+	if (ret)
+		goto err_remove_bridge;
+
 	return 0;
+
+err_remove_bridge:
+	drm_bridge_remove(&ctx->bridge);
+	return ret;
 }
 
 static int sn65dsi83_remove(struct i2c_client *client)
-- 
2.31.1

