Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57B925BB1F2
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 16 Sep 2022 20:19:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbiIPSTV (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 16 Sep 2022 14:19:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229932AbiIPSTU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Sep 2022 14:19:20 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E17E1B6D65
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Sep 2022 11:19:19 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id fs14so21822631pjb.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Sep 2022 11:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=6/ckE0N+vNzaxGLgwJSuWT0/q2cuiYdOQMuwOn2B7t8=;
        b=DMpejqyky6AsrmEC9aRTqIJN9sjXiE8K8ml5RDHRRAca85MCaBszwjBCd34wljuWDE
         j29qGXmvPuZlKoNv5Bh7zlCXZzBHhhYs329lV7Fo11VazHvQDZPgo4b24xSH+Yu6QMQO
         mDhj6pmJefImPqNsr9vJNzQxJFi7jGpOMy9G4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=6/ckE0N+vNzaxGLgwJSuWT0/q2cuiYdOQMuwOn2B7t8=;
        b=Ah6Bc7rZRlI5qNo1HPzU7H2D5aCnjO2s8G1zEJ355cfXMIrSDOWhDP2b/VSXjqlGz2
         J1PV0f7qW5PANQ0czhBlK72p2mkU8qSJrOUT+pYUXha9gv1ZToCYI+8K1P8wVdE6seJq
         7bNc639XgVu3b/UV2/qiWSNO9qcpwgGdDijIxHQ50SOkru1kTcTHQs34zI6ARzV46mzk
         F5iBoUAvhG7WKlVqiMSa6/aMHFhNgnVjOcNouWwGHkYaDnGJTBbZ4fMG5nkiuKL9Rane
         SxVE2R61jP5nlhkAS1ftHaJvA4uxQOPFcPu/b8IRSzkK0TbtYyqsRsjA9LJHLxagxaAH
         JaUA==
X-Gm-Message-State: ACrzQf2eg6LKezJqN0w8MXMo4ipoaeL53HMZRVG+hv1rCSWQ5iy0uz2U
        FldkIlhcigF6AWDp8C9MRftyJA==
X-Google-Smtp-Source: AMsMyM4PFKPfJXE+dxrQtzX/R5VZWUx6U+gQWD2XSIw5i/dxXXsp6m3QxW4LtnOhDMh2HsDgC9Nsaw==
X-Received: by 2002:a17:902:b94c:b0:178:336f:13d6 with SMTP id h12-20020a170902b94c00b00178336f13d6mr1127317pls.64.1663352359234;
        Fri, 16 Sep 2022 11:19:19 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:ae5d:6ee4:5c2f:6733])
        by smtp.gmail.com with ESMTPSA id d14-20020a17090a6a4e00b002007b60e288sm1770000pjm.23.2022.09.16.11.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 11:19:18 -0700 (PDT)
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
        Neil Armstrong <narmstrong@linaro.org>,
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
Subject: [PATCH v5 08/11] drm: bridge: samsung-dsim: Add atomic_get_input_bus_fmts
Date:   Fri, 16 Sep 2022 23:47:28 +0530
Message-Id: <20220916181731.89764-9-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220916181731.89764-1-jagan@amarulasolutions.com>
References: <20220916181731.89764-1-jagan@amarulasolutions.com>
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

Finding the right input bus format throughout the pipeline is hard
so add atomic_get_input_bus_fmts callback and initialize with the
default RGB888_1X24 bus format on DSI-end.

This format can be used in pipeline for negotiating bus format between
the DSI-end of this bridge and the other component closer to pipeline
components.

v5, v4:
* none

v3:
* include media-bus-format.h

v2:
* none

v1:
* new patch

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 28 +++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 60f22c506c0f..527fef6f1ff6 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -15,6 +15,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/irq.h>
+#include <linux/media-bus-format.h>
 #include <linux/of_device.h>
 #include <linux/phy/phy.h>
 
@@ -1321,6 +1322,32 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
 	pm_runtime_put_sync(dsi->dev);
 }
 
+#define MAX_INPUT_SEL_FORMATS	1
+
+static u32 *
+samsung_dsim_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+				       struct drm_bridge_state *bridge_state,
+				       struct drm_crtc_state *crtc_state,
+				       struct drm_connector_state *conn_state,
+				       u32 output_fmt,
+				       unsigned int *num_input_fmts)
+{
+	u32 *input_fmts;
+
+	*num_input_fmts = 0;
+
+	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
+			     GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	/* This is the DSI-end bus format */
+	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
+	*num_input_fmts = 1;
+
+	return input_fmts;
+}
+
 static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
 				     struct drm_bridge_state *bridge_state,
 				     struct drm_crtc_state *crtc_state,
@@ -1368,6 +1395,7 @@ static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
 	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset			= drm_atomic_helper_bridge_reset,
+	.atomic_get_input_bus_fmts	= samsung_dsim_atomic_get_input_bus_fmts,
 	.atomic_check			= samsung_dsim_atomic_check,
 	.atomic_pre_enable		= samsung_dsim_atomic_pre_enable,
 	.atomic_enable			= samsung_dsim_atomic_enable,
-- 
2.25.1

