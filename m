Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19992677AB9
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 23 Jan 2023 13:23:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230357AbjAWMXi (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 23 Jan 2023 07:23:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230150AbjAWMXh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 07:23:37 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADF4093C6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 04:23:35 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id d3so11180695plr.10
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 04:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aIEL5P6p2AgUUtZFiRe5g0PuF0Ki6dnU36M7iQ78QJo=;
        b=dHvjQk4fZccAWq195lGXzY+sGlK8ijb+kUXPtUAQyDLduf9h2ELuGdd+eLJRCV/WvQ
         huC0xXCrcaX092cyTm9vCmSNdPTD8Obr72vUm2qmk0BCWpG0zVF6djhRluop36aiwUke
         gEahZG/2O8VtbvHQ8I2SzmSdvN26xIkqtiomo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aIEL5P6p2AgUUtZFiRe5g0PuF0Ki6dnU36M7iQ78QJo=;
        b=SKd4Jw80Ok8LTIURX6ppNilcEtSqDCfHhYF39iz4T4wdqsA+HmXRwUOEhHTXYzPD9t
         ANgbFkfOL4OC1PYzY3GzOURCXMrKGtuOcG0D+gOtGs831qvXqOvTDdpPiKaRWq12J4qS
         WhfVn+ig6eDvAUoHThtBivq1SYYSSYOfniwpMCDve2nagZ3S1dDBMgFZ3p5xbv0VnDao
         kVPOICephIBh5LRSwYErbOgSm/JbQK10RfP4rQIIAuhBv9cs5PX39D+bO+81Mzhvc5lZ
         2W4sG2vKkWfZ6kt+41icgiRNt7ykKdddBliG2BLKSSZmr/F1VKJ8pCFq7S5Hx0bww38r
         FA8w==
X-Gm-Message-State: AFqh2krU0mfHwu2mZ3tI9V1jxzWaHOAM2crsdVhNkASt5TZntbkYmDmJ
        23Za8sIuqberMmy1P+n2ftHorg==
X-Google-Smtp-Source: AMrXdXveIkHkD/fQ5P3u2SJOkve1VXA+Lvybo5Wx4KBxfNIXMhG84UybnrksjDTPH8WX3IjvBnV5pQ==
X-Received: by 2002:a17:902:b083:b0:194:d057:46e5 with SMTP id p3-20020a170902b08300b00194d05746e5mr14536604plr.62.1674476615077;
        Mon, 23 Jan 2023 04:23:35 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
        by smtp.gmail.com with ESMTPSA id w10-20020a170902e88a00b001960806728asm1291811plg.88.2023.01.23.04.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 04:23:34 -0800 (PST)
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
Subject: [PATCH v11 00/18] drm: Add Samsung MIPI DSIM bridge
Date:   Mon, 23 Jan 2023 17:53:01 +0530
Message-Id: <20230123122319.261341-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
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

This series supports common bridge support for Samsung MIPI DSIM
which is used in Exynos and i.MX8MM SoC's.

The final bridge supports both the Exynos and i.MX8M Mini/Nano/Plus.

Patch 0001 - 0004: adding devm_drm_of_dsi_get_bridge

Patch 0005 - 0006: optional PHY, PMS_P offset

Patch 0007       : introduce hw_type

Patch 0008	 : fixing host init

Patch 0009	 : atomic_check

Patch 0010	 : input_bus_flags

Patch 0011	 : atomic_get_input_bus_fmts

Patch 0012 - 0013: component vs bridge

Patch 0014	 : DSIM bridge

Patch 0015 - 0016: i.MX8M Mini/Nano

Patch 0017 - 0018: i.MX8M Plus

Changes for v11:
- collect RB from Frieder Schrempf
- collect ACK from Rob
- collect ACK from Robert
- fix BIT macro replacements
- fix checkpatch --strict warnings
- fix unneeded commit text
- drop extra lines

Changes for v10:
- rebase on drm-misc-next
- add drm_of_dsi_find_panel_or_bridge
- add devm_drm_of_dsi_get_bridge
- fix host initialization (Thanks to Marek Szyprowski)
- rearrange the tiny patches for easy to review
- update simple names for enum hw_type
- add is_hw_exynos macro
- rework on commit messages

Changes for v9:
- rebase on drm-misc-next
- drop drm bridge attach fix for Exynos
- added prepare_prev_first flag
- added pre_enable_prev_first flag
- fix bridge chain order for exynos
- added fix for Exynos host init for first DSI transfer
- added MEDIA_BUS_FMT_FIXED
- return MEDIA_BUS_FMT_RGB888_1X24 output_fmt if supported output_fmt
  list is unsupported.
- added MEDIA_BUS_FMT_YUYV10_1X20
- added MEDIA_BUS_FMT_YUYV12_1X24

Changes for v8:
* fixed comment lines
* fixed commit messages
* fixed video mode bits
* collect Marek Ack
* fixed video mode bit names
* update input formats logic
* added imx8mplus support

Changes for v7:
* fix the drm bridge attach chain for exynos drm dsi driver
* fix the hw_type checking logic

Changes for v6:
* handle previous bridge for exynos dsi while attaching bridge 

Changes for v5:
* bridge changes to support multi-arch
* updated and clear commit messages
* add hw_type via plat data
* removed unneeded quirk
* rebased on linux-next

Changes for v4:
* include Inki Dae in MAINTAINERS
* remove dsi_driver probe in exynos_drm_drv to support multi-arch build
* update init handling to ensure host init done on first cmd transfer

Changes for v3:
* fix the mult-arch build
* fix dsi host init
* updated commit messages

Changes for v2:
* fix bridge handling
* fix dsi host init
* correct the commit messages

Tested in Engicam i.Core MX8M Mini SoM.

Repo:
https://github.com/openedev/kernel/tree/imx8mm-dsi-v11

v10:
https://lore.kernel.org/all/20221214125907.376148-1-jagan@amarulasolutions.com/

Any inputs?
Jagan.

Jagan Teki (16):
  drm: of: Lookup if child node has DSI panel or bridge
  drm: bridge: panel: Add devm_drm_of_dsi_get_bridge helper
  drm: exynos: dsi: Drop explicit call to bridge detach
  drm: exynos: dsi: Switch to devm_drm_of_dsi_get_bridge
  drm: exynos: dsi: Mark PHY as optional
  drm: exynos: dsi: Add platform PLL_P (PMS_P) offset
  drm: exynos: dsi: Introduce hw_type platform data
  drm: exynos: dsi: Add atomic check
  drm: exynos: dsi: Add input_bus_flags
  drm: exynos: dsi: Add atomic_get_input_bus_fmts
  drm: exynos: dsi: Consolidate component and bridge
  drm: exynos: dsi: Add Exynos based host irq hooks
  drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM bridge
  dt-bindings: display: exynos: dsim: Add NXP i.MX8M Mini/Nano support
  drm: bridge: samsung-dsim: Add i.MX8M Mini/Nano support
  dt-bindings: display: exynos: dsim: Add NXP i.MX8M Plus support

Marek Szyprowski (1):
  drm: exynos: dsi: Handle proper host initialization

Marek Vasut (1):
  drm: bridge: samsung-dsim: Add i.MX8M Plus support

 .../bindings/display/exynos/exynos_dsim.txt   |    2 +
 MAINTAINERS                                   |    9 +
 drivers/gpu/drm/bridge/Kconfig                |   12 +
 drivers/gpu/drm/bridge/Makefile               |    1 +
 drivers/gpu/drm/bridge/panel.c                |   34 +
 drivers/gpu/drm/bridge/samsung-dsim.c         | 1884 +++++++++++++++++
 drivers/gpu/drm/drm_of.c                      |  112 +-
 drivers/gpu/drm/exynos/Kconfig                |    1 +
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 1793 +---------------
 include/drm/bridge/samsung-dsim.h             |  118 ++
 include/drm/drm_bridge.h                      |    2 +
 include/drm/drm_of.h                          |   12 +
 12 files changed, 2284 insertions(+), 1696 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
 create mode 100644 include/drm/bridge/samsung-dsim.h

-- 
2.25.1

