Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C24A5A540A
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 29 Aug 2022 20:41:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbiH2Sl2 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 29 Aug 2022 14:41:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbiH2Sl1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 29 Aug 2022 14:41:27 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A14380EA8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Aug 2022 11:41:24 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id h13-20020a17090a648d00b001fdb9003787so4143099pjj.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Aug 2022 11:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=PPlEiJ1s7VViC3D9HvOY78/ATyLjYX2n1j74zd4YcKk=;
        b=QhLJ26UKWuluZfQdk2QtTP/ylCjGaEfAvCSyKojFJah7jSAQzU1r0fOM0wwqIoTz4p
         qgSIew4UizYRkAW6QT/fbhSo3SzpbwVDA1ruqI6zIUz/T9TTIatvdSBd073EOlUZV4Eo
         DRkj4pMqHCOyyeEtGUYEJoMCeEkSUuKo8sznY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=PPlEiJ1s7VViC3D9HvOY78/ATyLjYX2n1j74zd4YcKk=;
        b=L0g0/CjBlanq1BYQ2DdapFBxTd78jFC5uJIA3t1ARjNgUE7GRTUfWOKh13z25pVHyJ
         jwX27l7MhEXHJUj8/Q0bxt7vlWtCQv/VeDkQBIR7Gsi0wZh4B7U+AgFW2IBcYO1xX3Kp
         JcFYJhaIDu35FYmh1WruSLbPPPJZdl5wUr5xqVMpIcQJTm+IwCb0Fc6QBwjkO7D8omsc
         y4zAeMfs6YdPNPg9ELdDBzOA2Vd4UThHYbtiEEXgljvN9fM82sTubnOi0xvOA/IPW0qM
         oQNomSXJjKucjHKBRrVu6jA0snl4vBdxSrcHb8FAk+BK45sk/KU0ikcXM97Egk4Tcy5l
         d76w==
X-Gm-Message-State: ACgBeo2X3F/Txu2u6RNWoPWxlmbuScChxxijxqO6zwRVFRj3mBHFugB8
        XRhl5Bk+r3ZqZROziEs9I86iMw==
X-Google-Smtp-Source: AA6agR6vTqim2hlf9fZI6ItfjbP5zs3H1cmu5kV+ibwJP7DhviVYcQ0aOB9pCO7sJpJMBJKgwW6xRA==
X-Received: by 2002:a17:90b:2c12:b0:1fd:78fa:5ea7 with SMTP id rv18-20020a17090b2c1200b001fd78fa5ea7mr16325155pjb.29.1661798482992;
        Mon, 29 Aug 2022 11:41:22 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:43f7:1644:6259:830d])
        by smtp.gmail.com with ESMTPSA id k13-20020aa7998d000000b005385e2e86eesm1619042pfh.18.2022.08.29.11.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 11:41:22 -0700 (PDT)
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
Subject: [PATCH v4 04/12] drm: bridge: samsung-dsim: Handle platform init via driver_data
Date:   Tue, 30 Aug 2022 00:10:23 +0530
Message-Id: <20220829184031.1863663-5-jagan@amarulasolutions.com>
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

In order to make a common Samsung DSIM bridge driver some platform
specific glue code needs to maintain separately as it is hard to
maintain platform specific glue and conventional component_ops on
the drm bridge drivers side.

This patch is trying to support that glue code initialization based
on the DSIM_QUIRK_PLAT_DATA set from respective driver_data.

So, the platforms which enable DSIM_QUIRK_PLAT_DATA flags will handle
all platform specific initialization via samsung_dsim_plat_probe.

The platform probe is responsible to
- initialize samsung_dsim_plat_data and install hooks
- initialize component_ops
- preserve samsung_dsim structure pointer

v4:
* none

v3:
* update samsung_dsim_plat_probe return value
* add plat_data quirk to handle platform init

v2:
* fix samsung_dsim_plat_probe return pointer

v1:
* use platform_init instead of exynos_specific
* handle component_ops in glue code

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 16 ++++++++++++++--
 include/drm/bridge/samsung-dsim.h     |  5 +++++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 8130845750ac..76dc7687857a 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -369,6 +369,7 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.reg_values = reg_values,
+	.quirks = DSIM_QUIRK_PLAT_DATA,
 };
 
 static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
@@ -381,6 +382,7 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.reg_values = reg_values,
+	.quirks = DSIM_QUIRK_PLAT_DATA,
 };
 
 static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
@@ -391,6 +393,7 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.reg_values = reg_values,
+	.quirks = DSIM_QUIRK_PLAT_DATA,
 };
 
 static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
@@ -402,6 +405,7 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
 	.reg_values = exynos5433_reg_values,
+	.quirks = DSIM_QUIRK_PLAT_DATA,
 };
 
 static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
@@ -413,6 +417,7 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 12,
 	.reg_values = exynos5422_reg_values,
+	.quirks = DSIM_QUIRK_PLAT_DATA,
 };
 
 static const struct of_device_id samsung_dsim_of_match[] = {
@@ -1609,7 +1614,11 @@ static int samsung_dsim_probe(struct platform_device *pdev)
 	dsi->bridge.of_node = dev->of_node;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
-	ret = samsung_dsim_plat_probe(dsi);
+	if (dsi->driver_data->quirks & DSIM_QUIRK_PLAT_DATA)
+		ret = samsung_dsim_plat_probe(dsi);
+	else
+		ret = mipi_dsi_host_register(&dsi->dsi_host);
+
 	if (ret)
 		goto err_disable_runtime;
 
@@ -1627,7 +1636,10 @@ static int samsung_dsim_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 
-	samsung_dsim_plat_remove(dsi);
+	if (dsi->driver_data->quirks & DSIM_QUIRK_PLAT_DATA)
+		samsung_dsim_plat_remove(dsi);
+	else
+		mipi_dsi_host_unregister(&dsi->dsi_host);
 
 	return 0;
 }
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index 2e245bffd1b6..97fdee5ef5df 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -33,6 +33,10 @@ struct samsung_dsim_transfer {
 	u16 rx_done;
 };
 
+enum samsung_dsim_quirks {
+	DSIM_QUIRK_PLAT_DATA		= BIT(0),
+};
+
 struct samsung_dsim_driver_data {
 	const unsigned int *reg_ofs;
 	unsigned int plltmr_reg;
@@ -43,6 +47,7 @@ struct samsung_dsim_driver_data {
 	unsigned int wait_for_reset;
 	unsigned int num_bits_resol;
 	const unsigned int *reg_values;
+	enum samsung_dsim_quirks quirks;
 };
 
 struct samsung_dsim_host_ops {
-- 
2.25.1

