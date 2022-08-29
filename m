Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 024165A5408
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 29 Aug 2022 20:41:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229446AbiH2SlT (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 29 Aug 2022 14:41:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbiH2SlR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 29 Aug 2022 14:41:17 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BC8A7F0B4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Aug 2022 11:41:17 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id m10-20020a17090a730a00b001fa986fd8eeso15574476pjk.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Aug 2022 11:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=V9K+I20QaNq4O5Ra7YlAgpXXseteLWhgORIY+myzuBs=;
        b=ornPFx88Hc3KxbFSN8rDnQptppeQGh6Q7FqKlH60GpmuLXnO6iJ4hYAn0e3+IxO9yq
         CRIYZ6CdazpE2la1L91GzJF5js/DrF8awehRmtH2Ds36jtk4vl/EIsPPQ0pGYOqHMsIm
         BnmCePHhicKjc9V67CaurSuWwxvA1vS6M3uAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=V9K+I20QaNq4O5Ra7YlAgpXXseteLWhgORIY+myzuBs=;
        b=GZ+vuykY7K+J595pTtsfzARrHclgyi4CL8+2Njz3Uj8qeXMsKcR4QaWvw2qn+s2KqD
         fzc6aunn2wNmlx57Dayh6mJpIYhyqKKDelGese83uDQX8VyP2MOGuU7YaJfURq8rPEf8
         Odb0z/vHSFuUFiFrbRrxuyztwNFW+wlOra3hr65BqybIoEPljBD2WMHp4vZEHPxM5Boz
         TGa47bffGTOu05JmAKaUs8JHOGBGMeYobIHGixw87tiSXyXILNOJeJvj99ZdKOdFwVro
         +zuolp2DpBEvo8HF8whlL/FlakkkiubamBovr1Ifqaz2+HbaHtwjy5oI9rIrcDkFdPRF
         /3xQ==
X-Gm-Message-State: ACgBeo0SIbqwMgM5cTLm8Lu/gwBJFKjHVfJWIb/m95jmPyy0f7ClTCls
        8/HfIZ9uwhrSDpDHvLw+O0Gm9g==
X-Google-Smtp-Source: AA6agR6kwjgKG7jQbJjeT1oa/zfUjHoKziT4vv3E/X3mf9UBam5tcGdOKDGpOwEFvNbvebl8ScyNuQ==
X-Received: by 2002:a17:902:f68d:b0:16f:2314:7484 with SMTP id l13-20020a170902f68d00b0016f23147484mr17308520plg.136.1661798476471;
        Mon, 29 Aug 2022 11:41:16 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:43f7:1644:6259:830d])
        by smtp.gmail.com with ESMTPSA id k13-20020aa7998d000000b005385e2e86eesm1619042pfh.18.2022.08.29.11.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 11:41:16 -0700 (PDT)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Fancy Fang <chen.fang@nxp.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Marek Vasut <marex@denx.de>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v4 03/12] drm: bridge: samsung-dsim: Lookup OF-graph or Child node devices
Date:   Tue, 30 Aug 2022 00:10:22 +0530
Message-Id: <20220829184031.1863663-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220829184031.1863663-1-jagan@amarulasolutions.com>
References: <20220829184031.1863663-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The child devices in MIPI DSI can be binding with OF-graph
and also via child nodes.

The OF-graph interface represents the child devices via
remote and associated endpoint numbers like

dsi {
   compatible = "fsl,imx8mm-mipi-dsim";

   ports {
	port@0 {
	     reg = <0>;

	     dsi_in_lcdif: endpoint@0 {
		  reg = <0>;
		  remote-endpoint = <&lcdif_out_dsi>;
	     };
	};

	port@1 {
	     reg = <1>;

	     dsi_out_bridge: endpoint {
		  remote-endpoint = <&bridge_in_dsi>;
	     };
	};
};

The child node interface represents the child devices via
conventional child nodes on given DSI parent like

dsi {
   compatible = "samsung,exynos5433-mipi-dsi";

   ports {
        port@0 {
             reg = <0>;

             dsi_to_mic: endpoint {
                  remote-endpoint = <&mic_to_dsi>;
             };
        };
   };

   panel@0 {
        reg = <0>;
   };
};

As Samsung DSIM bridge is common DSI IP across all Exynos DSI
and NXP i.MX8M host controllers, this patch adds support to
lookup the child devices whether its bindings on the associated
host represent OF-graph or child node interfaces.

v4, v3:
* none

v2:
* new patch

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 38 +++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index ab2fa0f42f40..8130845750ac 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1357,18 +1357,52 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 	struct samsung_dsim *dsi = host_to_dsi(host);
 	const struct samsung_dsim_plat_data *pdata = dsi->plat_data;
 	struct device *dev = dsi->dev;
+	struct device_node *np = dev->of_node;
+	struct device_node *remote;
 	struct drm_panel *panel;
 	int ret;
 
-	panel = of_drm_find_panel(device->dev.of_node);
+	/**
+	 * Devices can also be child nodes when we also control that device
+	 * through the upstream device (ie, MIPI-DCS for a MIPI-DSI device).
+	 *
+	 * Lookup for a child node of the given parent that isn't either port
+	 * or ports.
+	 */
+	for_each_available_child_of_node(np, remote) {
+		if (of_node_name_eq(remote, "port") ||
+		    of_node_name_eq(remote, "ports"))
+			continue;
+
+		goto of_find_panel_or_bridge;
+	}
+
+	/*
+	 * of_graph_get_remote_node() produces a noisy error message if port
+	 * node isn't found and the absence of the port is a legit case here,
+	 * so at first we silently check whether graph presents in the
+	 * device-tree node.
+	 */
+	if (!of_graph_is_present(np))
+		return -ENODEV;
+
+	remote = of_graph_get_remote_node(np, 1, 0);
+
+of_find_panel_or_bridge:
+	if (!remote)
+		return -ENODEV;
+
+	panel = of_drm_find_panel(remote);
 	if (!IS_ERR(panel)) {
 		dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
 	} else {
-		dsi->out_bridge = of_drm_find_bridge(device->dev.of_node);
+		dsi->out_bridge = of_drm_find_bridge(remote);
 		if (!dsi->out_bridge)
 			dsi->out_bridge = ERR_PTR(-EINVAL);
 	}
 
+	of_node_put(remote);
+
 	if (IS_ERR(dsi->out_bridge)) {
 		ret = PTR_ERR(dsi->out_bridge);
 		DRM_DEV_ERROR(dev, "failed to find the bridge: %d\n", ret);
-- 
2.25.1

