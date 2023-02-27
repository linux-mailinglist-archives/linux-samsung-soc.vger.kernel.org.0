Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C47D6A40E5
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 27 Feb 2023 12:40:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbjB0LkI (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 27 Feb 2023 06:40:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbjB0LkH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Feb 2023 06:40:07 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D02F21284A
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Feb 2023 03:40:06 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id ky4so6394241plb.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Feb 2023 03:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N1ZnzcX6mJcklgIlxO4H+jhNQQoX1Q7wrMHIRpiIlXQ=;
        b=gPmtRl7o/gvgryv9Forg6QUIlY4pxym14sRc75prF3j8+RJzmSIINSVdMaENOs1e5g
         KAk0UL5oiDxhVixkLGLKLcd6AlhoblZ5QY6ZfyC4+V4Ng4Si2AKgM+TidR/HX1MA2Ih5
         n+85lVvWCrrKoSvHcORCVU88KrfneKq/Wy1os=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N1ZnzcX6mJcklgIlxO4H+jhNQQoX1Q7wrMHIRpiIlXQ=;
        b=DGdjvCQGIo+93WaJlMW/Z+sv26a32XN6rnkA5vZh6PpJaz/1v33lCbYqmWOq1UAv/P
         NWPc8MXFHEfGCmFpE1IXh+RMDUXm7cL6m/2pdlVQgsLtolaTxRdkbOMvsb1uvjmcVpmY
         mEfexD7IwFiAzhSl8EbxWfDT0JChqYdFAvUvSfb8WcWjeKB0Cu//aokVgs3PaTu2mUuE
         ToENUIL993lIxluPZv/pC++wCzxa6NFfHY9xAkvubGOggV2ZD35FLpikQZIIKVncnLxG
         7vdTDNmlVDMbfnXpIX2i8F+gaGw/pwEYv2Q5yjJo0dWRuecCN7L3du9jsG6NEOuOuZFW
         JOLA==
X-Gm-Message-State: AO0yUKW7zFMNvNzqTi2fEoWJBZYDJlBIGjIzNNcK/QKDh0/+M2t3Ci8r
        g70AoJ5uqNsVFKMq36SvEid9S3G98EAOEngBECs=
X-Google-Smtp-Source: AK7set/sHrlW+bT0OuPrRs9R8JYcXfvDbAW5REUG+10aoyqgeKq6Zk8Q/5QxU9HPeAUD+xb8ZkTZxQ==
X-Received: by 2002:a17:902:d48b:b0:19d:20d7:d51 with SMTP id c11-20020a170902d48b00b0019d20d70d51mr1628482plg.29.1677498006324;
        Mon, 27 Feb 2023 03:40:06 -0800 (PST)
Received: from localhost.localdomain ([94.140.8.120])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902ba8a00b0019c919bccf8sm4395277pls.86.2023.02.27.03.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 03:40:05 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Tim Harvey <tharvey@gateworks.com>,
        Adam Ford <aford173@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Marek Vasut <marex@denx.de>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v13 04/18] drm: exynos: dsi: Switch to DSI panel or bridge find helper
Date:   Mon, 27 Feb 2023 17:09:11 +0530
Message-Id: <20230227113925.875425-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230227113925.875425-1-jagan@amarulasolutions.com>
References: <20230227113925.875425-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

drm_of_dsi_find_panel_or_bridge is capable of looking up the
downstream DSI bridge and panel and trying to add a panel bridge
if the panel is found.

Replace explicit finding calls with drm_of_dsi_find_panel_or_bridge
followed with drmm_panel_bridge_add.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v13, v12, v11:
- none
Changes for v10:
- new patch

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index df15501b1075..12a6dd987e8f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -25,6 +25,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_mipi_dsi.h>
+#include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
@@ -1470,24 +1471,26 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 	struct device *dev = dsi->dev;
 	struct drm_encoder *encoder = &dsi->encoder;
 	struct drm_device *drm = encoder->dev;
+	struct drm_bridge *bridge;
 	struct drm_panel *panel;
 	int ret;
 
-	panel = of_drm_find_panel(device->dev.of_node);
-	if (!IS_ERR(panel)) {
-		dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
-	} else {
-		dsi->out_bridge = of_drm_find_bridge(device->dev.of_node);
-		if (!dsi->out_bridge)
-			dsi->out_bridge = ERR_PTR(-EINVAL);
-	}
+	ret = drm_of_dsi_find_panel_or_bridge(dev->of_node, 1, 0,
+					      &panel, &bridge);
+	if (ret)
+		return ret;
 
-	if (IS_ERR(dsi->out_bridge)) {
-		ret = PTR_ERR(dsi->out_bridge);
+	if (panel)
+		bridge = drmm_panel_bridge_add(NULL, panel);
+
+	if (IS_ERR(bridge)) {
+		ret = PTR_ERR(bridge);
 		DRM_DEV_ERROR(dev, "failed to find the bridge: %d\n", ret);
 		return ret;
 	}
 
+	dsi->out_bridge = bridge;
+
 	DRM_DEV_INFO(dev, "Attached %s device\n", device->name);
 
 	drm_bridge_add(&dsi->bridge);
@@ -1531,8 +1534,6 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
 	struct exynos_dsi *dsi = host_to_dsi(host);
 	struct drm_device *drm = dsi->encoder.dev;
 
-	dsi->out_bridge = NULL;
-
 	if (drm->mode_config.poll_enabled)
 		drm_kms_helper_hotplug_event(drm);
 
-- 
2.25.1

