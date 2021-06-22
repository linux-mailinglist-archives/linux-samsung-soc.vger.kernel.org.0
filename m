Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A44C33B06C8
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 22 Jun 2021 16:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231724AbhFVOMi (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 22 Jun 2021 10:12:38 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:34616 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231603AbhFVOMh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 10:12:37 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 77AC81FD6D;
        Tue, 22 Jun 2021 14:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624371020; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=w2dZcC3pCkzy5sp555ZXIoyomUNrqmZoWcUP2DgjlBg=;
        b=zL8QGnMFbeGfsdbHMdvk3T9QOa67vCBsYr/vQZY7lEuDeBJnhuicYnmCadJrnC256hVZLO
        5iipjR5YHVOaqliAv2cq76JU3Y+jd7mo58CAQ5eesRyBOGxcWm2PqU6ysTS8g993/wzq8U
        Xl/WxIcbSUYpbK0VPonEyKGO/xoZ+TQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624371020;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=w2dZcC3pCkzy5sp555ZXIoyomUNrqmZoWcUP2DgjlBg=;
        b=41k16nu8F+fiwSxPnCuq8da7b8e/Qk7BpEUgqb69uTSjjy84d8ul23QzdhP/XogpJKTBUj
        LkkMrYRQ0znXtiDA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id 7324411A98;
        Tue, 22 Jun 2021 14:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624371020; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=w2dZcC3pCkzy5sp555ZXIoyomUNrqmZoWcUP2DgjlBg=;
        b=zL8QGnMFbeGfsdbHMdvk3T9QOa67vCBsYr/vQZY7lEuDeBJnhuicYnmCadJrnC256hVZLO
        5iipjR5YHVOaqliAv2cq76JU3Y+jd7mo58CAQ5eesRyBOGxcWm2PqU6ysTS8g993/wzq8U
        Xl/WxIcbSUYpbK0VPonEyKGO/xoZ+TQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624371020;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=w2dZcC3pCkzy5sp555ZXIoyomUNrqmZoWcUP2DgjlBg=;
        b=41k16nu8F+fiwSxPnCuq8da7b8e/Qk7BpEUgqb69uTSjjy84d8ul23QzdhP/XogpJKTBUj
        LkkMrYRQ0znXtiDA==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id kB86G0vv0WD3UAAALh3uQQ
        (envelope-from <tzimmermann@suse.de>); Tue, 22 Jun 2021 14:10:19 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
        christian.koenig@amd.com, Xinhui.Pan@amd.com,
        james.qian.wang@arm.com, liviu.dudau@arm.com,
        mihail.atanassov@arm.com, brian.starkey@arm.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        krzysztof.kozlowski@canonical.com, xinliang.liu@linaro.org,
        tiantao6@hisilicon.com, john.stultz@linaro.org,
        kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
        laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de,
        p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, chunkuang.hu@kernel.org, matthias.bgg@gmail.com,
        bskeggs@redhat.com, tomba@kernel.org, hjc@rock-chips.com,
        heiko@sntech.de, benjamin.gaignard@linaro.org,
        yannick.fertre@foss.st.com, philippe.cornu@foss.st.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        wens@csie.org, jernej.skrabec@gmail.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, jyri.sarha@iki.fi, emma@anholt.net,
        linux-graphics-maintainer@vmware.com, zackr@vmware.com,
        hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
        michal.simek@xilinx.com
Cc:     amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org, nouveau@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 15/22] drm/stm: Don't set struct drm_device.irq_enabled
Date:   Tue, 22 Jun 2021 16:09:55 +0200
Message-Id: <20210622141002.11590-16-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210622141002.11590-1-tzimmermann@suse.de>
References: <20210622141002.11590-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The field drm_device.irq_enabled is only used by legacy drivers
with userspace modesetting. Don't set it in stm.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/stm/ltdc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 08b71248044d..e9c5a52f041a 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -1339,9 +1339,6 @@ int ltdc_load(struct drm_device *ddev)
 		goto err;
 	}
 
-	/* Allow usage of vblank without having to call drm_irq_install */
-	ddev->irq_enabled = 1;
-
 	clk_disable_unprepare(ldev->pixel_clk);
 
 	pinctrl_pm_select_sleep_state(ddev->dev);
-- 
2.32.0

