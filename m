Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A88A55BB1EE
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 16 Sep 2022 20:19:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbiIPSTH (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 16 Sep 2022 14:19:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbiIPSTH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Sep 2022 14:19:07 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 236AFB6D68
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Sep 2022 11:19:05 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id fv3so21871878pjb.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Sep 2022 11:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=btq8+UvEuEu4v/DMPqax3KQNrb7VRjirbnKm5H1X5d4=;
        b=YdBKDmr3sXtbPM/f1RFYSy36rI90QAemtIF0NfqOj6gxl5hT6RhWPNx1kF5u3SWRsg
         qdA+vypt8+c3kx6qYGL8uZuKBuA7ptHoH6aAyi81pAAYWEvVhA5Cr5YOQS1+MGcP3Ycs
         2VuGfz7uRc0+OYDaycHuTAT3H/RsKalTt3Q6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=btq8+UvEuEu4v/DMPqax3KQNrb7VRjirbnKm5H1X5d4=;
        b=TPQ94yLk0EkewYoPOPcL6SLJg8e6hOkQBviGAo/qm5BE/+d3XqlynS+VhQpAow0fi+
         xCmZyKAaWtlf0KtcBOKbYgQjtZFcLq4yIh0BKeeOJNBAXhFaKNBml87hMbDGHnIvo3b0
         0CIcps6UeqYvC+eM0sZ5u+LccJrpl7cztXFCfWtlyCrEbAl0yFbaQrbthYtv4M7KR/NI
         EwbHhmXObULnyolvs73unQzFL5gW+5LpNUdXL9obM8CBGjqC2z03ILDZTXKk15vtBOeC
         WJFhM34A5JOfPIf4MeqbR8gLN+IgbM9j5f1qhOIFc/gxSWYUNDi/1Hbqr6xJcrp/hL2g
         pzCw==
X-Gm-Message-State: ACrzQf1jHkBA8VbfU9A4LGAL0w5mEGcLQw2r7VDfsz9tio4wWV/jKJCl
        PHcmrnrtjnNjUfBWzOCXJdi0ew==
X-Google-Smtp-Source: AMsMyM5Yo3Kl8awJvYOisIZ3GPjLjoGmJhsTyQWPKvT3XeYfdgGBcIDp/PLG1WiEruiDzYuF96ooHw==
X-Received: by 2002:a17:90a:9295:b0:202:582b:1765 with SMTP id n21-20020a17090a929500b00202582b1765mr6666216pjo.99.1663352344609;
        Fri, 16 Sep 2022 11:19:04 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:ae5d:6ee4:5c2f:6733])
        by smtp.gmail.com with ESMTPSA id d14-20020a17090a6a4e00b002007b60e288sm1770000pjm.23.2022.09.16.11.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 11:19:03 -0700 (PDT)
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
Subject: [PATCH v5 06/11] drm: bridge: samsung-dsim: Add atomic_check
Date:   Fri, 16 Sep 2022 23:47:26 +0530
Message-Id: <20220916181731.89764-7-jagan@amarulasolutions.com>
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

Look like an explicit fixing up of mode_flags is required for DSIM IP
present in i.MX8M Mini/Nano SoCs.

At least the LCDIF + DSIM needs active low sync polarities in order
to correlate the correct sync flags of the surrounding components in
the chain to make sure the whole pipeline can work properly.

On the other hand the i.MX 8M Mini Applications Processor Reference Manual,
Rev. 3, 11/2020 says.
"13.6.3.5.2 RGB interface
 Vsync, Hsync, and VDEN are active high signals."

No clear evidence about whether it can be documentation issues or
something, so added a comment FIXME for this and updated the active low
sync polarities using SAMSUNG_DSIM_TYPE_IMX8MM hw_type.

v5:
* rebase based new bridge changes [mszyprow]
* remove DSIM_QUIRK_FIXUP_SYNC_POL
* add hw_type check for sync polarities change.

v4:
* none

v3:
* add DSIM_QUIRK_FIXUP_SYNC_POL to handle mode_flasg fixup

v2:
* none

v1:
* fix mode flags in atomic_check instead of mode_fixup

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 26 ++++++++++++++++++++++++++
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 6d524338d4ff..8abf89326424 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1315,6 +1315,31 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
 	pm_runtime_put_sync(dsi->dev);
 }
 
+static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
+				     struct drm_bridge_state *bridge_state,
+				     struct drm_crtc_state *crtc_state,
+				     struct drm_connector_state *conn_state)
+{
+	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
+	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
+
+	if (dsi->plat_data->hw_type & SAMSUNG_DSIM_TYPE_IMX8MM) {
+		/**
+		 * FIXME:
+		 * At least LCDIF + DSIM needs active low sync,
+		 * but i.MX 8M Mini Applications Processor Reference Manual,
+		 * Rev. 3, 11/2020 says
+		 *
+		 * 13.6.3.5.2 RGB interface
+		 * Vsync, Hsync, and VDEN are active high signals.
+		 */
+		adjusted_mode->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
+		adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
+	}
+
+	return 0;
+}
+
 static void samsung_dsim_mode_set(struct drm_bridge *bridge,
 				  const struct drm_display_mode *mode,
 				  const struct drm_display_mode *adjusted_mode)
@@ -1337,6 +1362,7 @@ static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
 	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset			= drm_atomic_helper_bridge_reset,
+	.atomic_check			= samsung_dsim_atomic_check,
 	.atomic_pre_enable		= samsung_dsim_atomic_pre_enable,
 	.atomic_enable			= samsung_dsim_atomic_enable,
 	.atomic_disable			= samsung_dsim_atomic_disable,
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index 57b27d75369e..0c5a905f3de7 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -27,6 +27,7 @@ enum samsung_dsim_type {
 	SAMSUNG_DSIM_TYPE_EXYNOS5410,
 	SAMSUNG_DSIM_TYPE_EXYNOS5422,
 	SAMSUNG_DSIM_TYPE_EXYNOS5433,
+	SAMSUNG_DSIM_TYPE_IMX8MM,
 	SAMSUNG_DSIM_TYPE_COUNT,
 };
 
-- 
2.25.1

