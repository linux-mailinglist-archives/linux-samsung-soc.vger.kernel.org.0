Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF904201B1
	for <lists+linux-samsung-soc@lfdr.de>; Sun,  3 Oct 2021 15:25:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230207AbhJCN1H (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 3 Oct 2021 09:27:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230050AbhJCN1G (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 3 Oct 2021 09:27:06 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FBEFC0613EC;
        Sun,  3 Oct 2021 06:25:19 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F2ADA2A;
        Sun,  3 Oct 2021 15:25:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633267514;
        bh=VHWbPfGiA5vgTAu1+k5AM/WGLi1c7AUlzQbdWY3enhc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h/2eYjwJbH2EhjYD40qxfbcEgYr3mE2IAAas4v5feH+XAkkT1BgxIkzYa06DtV8ZJ
         EGzSpMCGvRfSWCjwZLJzUC8o7X3Bf6J0UPkB/gHZWzl2XGBTtdBn6f67BRJU7V8OWE
         df/2bykLM9Wcuj02kfnm0rlzKLBpNTFJPdjZTaAU=
Date:   Sun, 3 Oct 2021 16:25:09 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Jonas Karlman <jonas@kwiboo.se>,
        Thierry Reding <thierry.reding@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
        Kyungmin Park <kyungmin.park@samsung.com>,
        linux-kernel@vger.kernel.org,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Inki Dae <inki.dae@samsung.com>,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        dri-devel@lists.freedesktop.org,
        John Stultz <john.stultz@linaro.org>,
        Chen Feng <puck.chen@hisilicon.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v4 00/24] drm/bridge: Make panel and bridge probe order
 consistent
Message-ID: <YVmvNTzZyqQHI4Co@pendragon.ideasonboard.com>
References: <20210910101218.1632297-1-maxime@cerno.tech>
 <YVTg8nqA9obYokxT@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YVTg8nqA9obYokxT@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Maxime,

On Thu, Sep 30, 2021 at 12:56:02AM +0300, Laurent Pinchart wrote:
> On Fri, Sep 10, 2021 at 12:11:54PM +0200, Maxime Ripard wrote:
> > Hi,
> > 
> > We've encountered an issue with the RaspberryPi DSI panel that prevented the
> > whole display driver from probing.
> > 
> > The issue is described in detail in the commit 7213246a803f ("drm/vc4: dsi:
> > Only register our component once a DSI device is attached"), but the basic idea
> > is that since the panel is probed through i2c, there's no synchronization
> > between its probe and the registration of the MIPI-DSI host it's attached to.
> > 
> > We initially moved the component framework registration to the MIPI-DSI Host
> > attach hook to make sure we register our component only when we have a DSI
> > device attached to our MIPI-DSI host, and then use lookup our DSI device in our
> > bind hook.
> > 
> > However, all the DSI bridges controlled through i2c are only registering their
> > associated DSI device in their bridge attach hook, meaning with our change
> > above, we never got that far, and therefore ended up in the same situation than
> > the one we were trying to fix for panels.
> > 
> > The best practice to avoid those issues is to register its functions only after
> > all its dependencies are live. We also shouldn't wait any longer than we should
> > to play nice with the other components that are waiting for us, so in our case
> > that would mean moving the DSI device registration to the bridge probe.
> > 
> > I also had a look at all the DSI hosts, and it seems that exynos, kirin and msm
> > would be affected by this and wouldn't probe anymore after those changes.
> > Exynos and kirin seems to be simple enough for a mechanical change (that still
> > requires to be tested), but the changes in msm seemed to be far more important
> > and I wasn't confortable doing them.
> > 
> > Let me know what you think,
> 
> I've tested this series on my RPi CM4-based board, and there's a clear
> improvement: the sn65dsi83 now probes successfully !
> 
> The downside is that I can now look at a panel that desperately refuses
> to display anything. That's a separate issue, but it prevents me from
> telling whether this series introduces regressions :-S I'll try to debug
> that separately.

I managed to (partly) fix that issue with a few backports from the RPi
kernel, making me confident enough to say

Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

for

drivers/gpu/drm/bridge/ti-sn65dsi83.c
drivers/gpu/drm/drm_bridge.c
drivers/gpu/drm/drm_mipi_dsi.c
include/drm/drm_mipi_dsi.h

> Also, Kieran, would you be able to test this with the SN65DSI86 ?
> 
> > ---
> > 
> > Changes from v3:
> >   - Converted exynos and kirin
> >   - Converted all the affected bridge drivers
> >   - Reworded the documentation a bit
> > 
> > Changes from v2:
> >   - Changed the approach as suggested by Andrzej, and aligned the bridge on the
> >     panel this time.
> >   - Fixed some typos
> > 
> > Changes from v1:
> >   - Change the name of drm_of_get_next function to drm_of_get_bridge
> >   - Mention the revert of 87154ff86bf6 and squash the two patches that were
> >     reverting that commit
> >   - Add some documentation
> >   - Make drm_panel_attach and _detach succeed when no callback is there
> > 
> > Maxime Ripard (24):
> >   drm/bridge: Add documentation sections
> >   drm/bridge: Document the probe issue with MIPI-DSI bridges
> >   drm/mipi-dsi: Create devm device registration
> >   drm/mipi-dsi: Create devm device attachment
> >   drm/bridge: adv7533: Switch to devm MIPI-DSI helpers
> >   drm/bridge: adv7511: Register and attach our DSI device at probe
> >   drm/bridge: anx7625: Switch to devm MIPI-DSI helpers
> >   drm/bridge: anx7625: Register and attach our DSI device at probe
> >   drm/bridge: lt8912b: Switch to devm MIPI-DSI helpers
> >   drm/bridge: lt8912b: Register and attach our DSI device at probe
> >   drm/bridge: lt9611: Switch to devm MIPI-DSI helpers
> >   drm/bridge: lt9611: Register and attach our DSI device at probe
> >   drm/bridge: lt9611uxc: Switch to devm MIPI-DSI helpers
> >   drm/bridge: lt9611uxc: Register and attach our DSI device at probe
> >   drm/bridge: ps8640: Switch to devm MIPI-DSI helpers
> >   drm/bridge: ps8640: Register and attach our DSI device at probe
> >   drm/bridge: sn65dsi83: Switch to devm MIPI-DSI helpers
> >   drm/bridge: sn65dsi83: Register and attach our DSI device at probe
> >   drm/bridge: sn65dsi86: Switch to devm MIPI-DSI helpers
> >   drm/bridge: sn65dsi86: Register and attach our DSI device at probe
> >   drm/bridge: tc358775: Switch to devm MIPI-DSI helpers
> >   drm/bridge: tc358775: Register and attach our DSI device at probe
> >   drm/kirin: dsi: Adjust probe order
> >   drm/exynos: dsi: Adjust probe order
> > 
> >  Documentation/gpu/drm-kms-helpers.rst        |  12 +++
> >  drivers/gpu/drm/bridge/adv7511/adv7511.h     |   1 -
> >  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c |  15 ++-
> >  drivers/gpu/drm/bridge/adv7511/adv7533.c     |  20 +---
> >  drivers/gpu/drm/bridge/analogix/anx7625.c    |  40 ++++----
> >  drivers/gpu/drm/bridge/lontium-lt8912b.c     |  31 ++----
> >  drivers/gpu/drm/bridge/lontium-lt9611.c      |  62 +++++-------
> >  drivers/gpu/drm/bridge/lontium-lt9611uxc.c   |  65 +++++-------
> >  drivers/gpu/drm/bridge/parade-ps8640.c       | 101 ++++++++++---------
> >  drivers/gpu/drm/bridge/tc358775.c            |  50 +++++----
> >  drivers/gpu/drm/bridge/ti-sn65dsi83.c        |  86 ++++++++--------
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c        |  94 ++++++++---------
> >  drivers/gpu/drm/drm_bridge.c                 |  69 ++++++++++++-
> >  drivers/gpu/drm/drm_mipi_dsi.c               |  81 +++++++++++++++
> >  drivers/gpu/drm/exynos/exynos_drm_dsi.c      |  19 ++--
> >  drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c |  27 +++--
> >  include/drm/drm_mipi_dsi.h                   |   4 +
> >  17 files changed, 460 insertions(+), 317 deletions(-)

-- 
Regards,

Laurent Pinchart
