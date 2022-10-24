Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 360C8609D08
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 24 Oct 2022 10:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbiJXIpJ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 24 Oct 2022 04:45:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230115AbiJXIpG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 24 Oct 2022 04:45:06 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6924C205ED
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Oct 2022 01:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1666601102; x=1698137102;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NA5Ny2XoE1i5QuR33NYRl8zhNYn5fWE/UngumuM7BWY=;
  b=emaAOgPmAvUnWJHpRqs4ghIo4esYo7UtieHFe2WL8OgJKv0Ij1Q6m4X3
   GJF2ojoeP+hbTjSLbJQQW/CD+CQIUWNtmc0MlRqduCwJT/+WWS5Z8Rnvu
   MTmKdNxbaShxo91maBRDTlAgK9rYoaN6CdI0rwVsCEq1/Oripl4PY3R+5
   7hLDxdTMVGxyjAkRiIuYMTCP3T6ZwbOjTibpIITQAfU5GJTt4wqbcaDqW
   taoi8wd4BQa58Lr+/lPreNuJw7Dnztm5Y0TF/9mN0Uvp7+xic8OYGrpbg
   NeuX1p5b0aK1Ln4rMlS/SSIy1/QSY2Ll8dDrVpjQ/cJPwDmUcfSRGWPVf
   g==;
X-IronPort-AV: E=Sophos;i="5.95,207,1661810400"; 
   d="scan'208";a="26925681"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 24 Oct 2022 10:45:00 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 24 Oct 2022 10:45:00 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 24 Oct 2022 10:45:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1666601100; x=1698137100;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NA5Ny2XoE1i5QuR33NYRl8zhNYn5fWE/UngumuM7BWY=;
  b=biL6DWSvBy4ewrOSUktNF1vAIXD7GXkRXE/+EFtJY3e7NuIfz3LkAveW
   xsqsNyts+HenRSJ5Uw3jvwznKigpqiuq7Dq0Yz7X9BInYT1t1Ws3Cpr7n
   HlPA4gnbmAY3IXz1xCnX0SuPfuIChy/5kGr16iG/IisMoSUxtWW4kCc6V
   7Se3pnYU0wIsp6cz+KxaoVwXxOH9IsAHyCGpq+YjpW+/s03TQ3RAW9TH3
   T+1qv8Vhz+Oe4e/A2YWSYoE6J10yRH2poMxpZzfNrBp0gsPyNMfjT+RnU
   ALY0oaYvG2M6WYKEmI2KiGnVAt3bllZ7VsZGGnE5FstzmEfFnKzitq++0
   w==;
X-IronPort-AV: E=Sophos;i="5.95,207,1661810400"; 
   d="scan'208";a="26925680"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 Oct 2022 10:45:00 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 302B9280056;
        Mon, 24 Oct 2022 10:45:00 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Jagan Teki <jagan@amarulasolutions.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
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
        Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org,
        linux-samsung-soc@vger.kernel.org,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v7 00/10] drm: bridge: Add Samsung MIPI DSIM bridge
Date:   Mon, 24 Oct 2022 10:44:57 +0200
Message-ID: <4778210.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20221005151309.7278-1-jagan@amarulasolutions.com>
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Jagan,

Am Mittwoch, 5. Oktober 2022, 17:12:59 CEST schrieb Jagan Teki:
> This series supports common bridge support for Samsung MIPI DSIM
> which is used in Exynos and i.MX8MM SoC's.
> 
> The final bridge supports both the Exynos and i.MX8MM DSI devices.
> 
> Changes for v7:
> * fix the drm bridge attach chain for exynos drm dsi driver
> * fix the hw_type checking logic
> 
> Changes for v6:
> * handle previous bridge for exynos dsi while attaching bridge
> 
> Changes for v5:
> * bridge changes to support multi-arch
> * updated and clear commit messages
> * add hw_type via plat data
> * removed unneeded quirk
> * rebased on linux-next
> 
> Changes for v4:
> * include Inki Dae in MAINTAINERS
> * remove dsi_driver probe in exynos_drm_drv to support multi-arch build
> * update init handling to ensure host init done on first cmd transfer
> 
> Changes for v3:
> * fix the mult-arch build
> * fix dsi host init
> * updated commit messages
> 
> Changes for v2:
> * fix bridge handling
> * fix dsi host init
> * correct the commit messages
> 
> Patch 0001: 	Samsung DSIM bridge
> 
> Patch 0002:	PHY optional
> 
> Patch 0003:	OF-graph or Child node lookup
> 
> Patch 0004: 	DSI host initialization
> 
> Patch 0005:	atomic check
> 
> Patch 0006:	PMS_P offset via plat data
> 
> Patch 0007:	atomic_get_input_bus_fmts
> 
> Patch 0008:	input_bus_flags
> 
> Patch 0009:	document fsl,imx8mm-mipi-dsim
> 
> Patch 0010:	add i.MX8MM DSIM support
> 
> Tested in Engicam i.Core MX8M Mini SoM.

Thanks for working on this!

This works on TQMa8MQML + MBa8Mx (imx8mm) using a SN65DSI83 DSI-LVDS-Bridge.
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Best regards,
Alexander

> Repo:
> https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v7
> 
> Any inputs?
> Jagan.
> 
> Jagan Teki (10):
>   drm: bridge: Add Samsung DSIM bridge driver
>   drm: bridge: samsung-dsim: Lookup OF-graph or Child node devices
>   drm: bridge: samsung-dsim: Mark PHY as optional
>   drm: bridge: samsung-dsim: Handle proper DSI host initialization
>   drm: bridge: samsung-dsim: Add atomic_check
>   drm: bridge: samsung-dsim: Add platform PLL_P (PMS_P) offset
>   drm: bridge: samsung-dsim: Add atomic_get_input_bus_fmts
>   drm: bridge: samsung-dsim: Add input_bus_flags
>   dt-bindings: display: exynos: dsim: Add NXP i.MX8MM support
>   drm: bridge: samsung-dsim: Add i.MX8MM support
> 
>  .../bindings/display/exynos/exynos_dsim.txt   |    1 +
>  MAINTAINERS                                   |    9 +
>  drivers/gpu/drm/bridge/Kconfig                |   12 +
>  drivers/gpu/drm/bridge/Makefile               |    1 +
>  drivers/gpu/drm/bridge/samsung-dsim.c         | 1856 +++++++++++++++++
>  drivers/gpu/drm/exynos/Kconfig                |    1 +
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 1766 +---------------
>  include/drm/bridge/samsung-dsim.h             |  115 +
>  8 files changed, 2108 insertions(+), 1653 deletions(-)
>  create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
>  create mode 100644 include/drm/bridge/samsung-dsim.h




