Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89AB882355
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  5 Aug 2019 19:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728870AbfHERBW (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 5 Aug 2019 13:01:22 -0400
Received: from mail-yw1-f65.google.com ([209.85.161.65]:32896 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728837AbfHERBW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 5 Aug 2019 13:01:22 -0400
Received: by mail-yw1-f65.google.com with SMTP id l124so29809438ywd.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Aug 2019 10:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cIbQ4za8IZrsQAjL3OZsGC1nPdFfsuxFro0p+nH7Dtw=;
        b=ewve7ba8nAhqLvACMGYoen4dyOeu19thOZB3u2JoJSFJKMMmpoBZIHx4OTEAFq6+YU
         2T6NmOErkfkbM5Ij6RM6WqQNdClldTcisztsB2xH9jDtoMn8QNZbkBHRkRLDr6foMdiV
         dg70SB8DbzbTHCerzWKo1uNye8oZaLImDgt+/kV0UbF4ohDlnADI60L4my2JO71QPTxv
         PBhjGH/gAb9mHkAzwSnlkAeKUf+WYdlH0tgiaM/n6/DZty7Zd0GS3Lvv68yVnT+37Arn
         K4sWLb4peI+MOGbER2CtVFt/A7JPYs+M1x9F7Xs/TB6fY4PFADNVK4CxE8R8tYb4zu+3
         7d4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cIbQ4za8IZrsQAjL3OZsGC1nPdFfsuxFro0p+nH7Dtw=;
        b=TEsnl/ZL/1wEmcB4ca7Q9Sv7Ok1Q+P6EhcYIlfv1yNz4rh6h2mbTfx2cK1o6p1B9fd
         0fiJISJiD5/1Ddr7G3QPbaTN/BEpO1LV2nCZeqa+7dAutxILmA7QTk4W0wV50RI/CTt6
         gxIyI8EzcEJq5o3yqlRNaBn+vS29TOefjY2DWR9pMPXZ3Q1OXHlx91lW0cFpyx90SKsY
         SwvyiDhwK0PfzjAe55NXzKW9JhMGHtKIujfzPHQeJT12hJecO6mov1/ioSllJ2KlSgse
         /LIxzRJd/Q+TvPwdVeJyKv9iCx7o1yD+k391/XxODGh1wBidDTJ5w9uTL2zpl/bcRZXp
         YjbQ==
X-Gm-Message-State: APjAAAWXkgu9UALm6RtM0SiQa+phTu+B7habphAKg/rn3iEhfoqB1J55
        1MJMLTJP4VqMBoYHcL164ZxP5A==
X-Google-Smtp-Source: APXvYqxtoTdTptN1R84Axo11wc/c0Rm0lgtLL0MMAVBsGnc3bX6jGmG+OScUr4H/lM6VC1xtTSwhiQ==
X-Received: by 2002:a81:6355:: with SMTP id x82mr96463850ywb.396.1565024481310;
        Mon, 05 Aug 2019 10:01:21 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id m40sm20329904ywh.2.2019.08.05.10.01.20
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 05 Aug 2019 10:01:20 -0700 (PDT)
Date:   Mon, 5 Aug 2019 13:01:20 -0400
From:   Sean Paul <sean@poorly.run>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Alison Wang <alison.wang@nxp.com>,
        Allison Randal <allison@lohutok.net>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Enrico Weigelt <info@metux.net>,
        Fabio Estevam <festevam@gmail.com>,
        Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Marek Vasut <marex@denx.de>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sean Paul <sean@poorly.run>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincent Abriou <vincent.abriou@st.com>
Subject: Re: [PATCH v1 14/16] drm/panel: call prepare/enable only once
Message-ID: <20190805170120.GZ104440@art_vandelay>
References: <20190804201637.1240-1-sam@ravnborg.org>
 <20190804201637.1240-15-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190804201637.1240-15-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, Aug 04, 2019 at 10:16:35PM +0200, Sam Ravnborg wrote:
> Many panel drivers duplicate logic to prevent prepare to be called
> for a panel that is already prepared.
> Likewise for enable.
> 
> Implement this logic in drm_panel so the individual drivers
> no longer needs this.
> A panel is considered prepared/enabled only if the prepare/enable call
> succeeds.
> For disable/unprepare it is unconditionally considered
> disabled/unprepared.

Hi Sam,
I did a similar thing a few years ago [1]. IIRC it was well received and just
needed some nits cleaned up. Unfortunately I lost interest^W^W switched to other
things and dropped it. So thanks for picking this back up!

Fast forward to today, I still think it's a good idea but I want to make sure
this won't negatively interact with the self refresh helpers. With the helpers
in place, it's possible to call disable consecutively (ie: once to enter self
refresh and again to actually shut down). I did a quick pass and it looks like
this patch might break that behavior, so you might want to take that into
account.

Sean


[1]- https://patchwork.freedesktop.org/series/30712/

> 
> This allows calls to prepare/enable again, even if there were
> some issue disabling a regulator or similar during disable/unprepare.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_panel.c | 66 ++++++++++++++++++++++++++++++-------
>  include/drm/drm_panel.h     | 21 ++++++++++++
>  2 files changed, 75 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index da19d5b4a2f4..0853764040de 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -66,10 +66,21 @@ EXPORT_SYMBOL(drm_panel_init);
>   */
>  int drm_panel_prepare(struct drm_panel *panel)
>  {
> -	if (panel && panel->funcs && panel->funcs->prepare)
> -		return panel->funcs->prepare(panel);
> +	int ret = -ENOSYS;
>  
> -	return panel ? -ENOSYS : -EINVAL;
> +	if (!panel)
> +		return -EINVAL;
> +
> +	if (panel->prepared)
> +		return 0;
> +
> +	if (panel->funcs && panel->funcs->prepare)
> +		ret = panel->funcs->prepare(panel);
> +
> +	if (ret >= 0)
> +		panel->prepared = true;
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL(drm_panel_prepare);
>  
> @@ -85,10 +96,21 @@ EXPORT_SYMBOL(drm_panel_prepare);
>   */
>  int drm_panel_enable(struct drm_panel *panel)
>  {
> -	if (panel && panel->funcs && panel->funcs->enable)
> -		return panel->funcs->enable(panel);
> +	int ret = -ENOSYS;
>  
> -	return panel ? -ENOSYS : -EINVAL;
> +	if (!panel)
> +		return -EINVAL;
> +
> +	if (panel->enabled)
> +		return 0;
> +
> +	if (panel->funcs && panel->funcs->enable)
> +		ret = panel->funcs->enable(panel);
> +
> +	if (ret >= 0)
> +		panel->enabled = true;
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL(drm_panel_enable);
>  
> @@ -104,10 +126,20 @@ EXPORT_SYMBOL(drm_panel_enable);
>   */
>  int drm_panel_disable(struct drm_panel *panel)
>  {
> -	if (panel && panel->funcs && panel->funcs->disable)
> -		return panel->funcs->disable(panel);
> +	int ret = -ENOSYS;
>  
> -	return panel ? -ENOSYS : -EINVAL;
> +	if (!panel)
> +		return -EINVAL;
> +
> +	if (!panel->enabled)
> +		return 0;
> +
> +	if (panel->funcs && panel->funcs->disable)
> +		ret = panel->funcs->disable(panel);
> +
> +	panel->enabled = false;
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL(drm_panel_disable);
>  
> @@ -124,10 +156,20 @@ EXPORT_SYMBOL(drm_panel_disable);
>   */
>  int drm_panel_unprepare(struct drm_panel *panel)
>  {
> -	if (panel && panel->funcs && panel->funcs->unprepare)
> -		return panel->funcs->unprepare(panel);
> +	int ret = -ENOSYS;
>  
> -	return panel ? -ENOSYS : -EINVAL;
> +	if (!panel)
> +		return -EINVAL;
> +
> +	if (!panel->prepared)
> +		return 0;
> +
> +	if (panel->funcs && panel->funcs->unprepare)
> +		ret = panel->funcs->unprepare(panel);
> +
> +	panel->prepared = false;
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL(drm_panel_unprepare);
>  
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index 624bd15ecfab..7493500fc9bd 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -65,6 +65,9 @@ struct drm_panel_funcs {
>  	 * @prepare:
>  	 *
>  	 * Turn on panel and perform set up.
> +	 * When the panel is successfully prepared the prepare() function
> +	 * will not be called again until the panel has been unprepared.
> +	 *
>  	 */
>  	int (*prepare)(struct drm_panel *panel);
>  
> @@ -72,6 +75,8 @@ struct drm_panel_funcs {
>  	 * @enable:
>  	 *
>  	 * Enable panel (turn on back light, etc.).
> +	 * When the panel is successfully enabled the enable() function
> +	 * will not be called again until the panel has been disabled.
>  	 */
>  	int (*enable)(struct drm_panel *panel);
>  
> @@ -79,6 +84,7 @@ struct drm_panel_funcs {
>  	 * @disable:
>  	 *
>  	 * Disable panel (turn off back light, etc.).
> +	 * If the panel is already disabled the disable() function is not called.
>  	 */
>  	int (*disable)(struct drm_panel *panel);
>  
> @@ -86,6 +92,7 @@ struct drm_panel_funcs {
>  	 * @unprepare:
>  	 *
>  	 * Turn off panel.
> +	 * If the panel is already unprepared the unprepare() function is not called.
>  	 */
>  	int (*unprepare)(struct drm_panel *panel);
>  
> @@ -145,6 +152,20 @@ struct drm_panel {
>  	 * Panel entry in registry.
>  	 */
>  	struct list_head list;
> +
> +	/**
> +	 * @prepared:
> +	 *
> +	 * Set to true when the panel is successfully prepared.
> +	 */
> +	bool prepared;
> +
> +	/**
> +	 * @enabled:
> +	 *
> +	 * Set to true when the panel is successfully enabled.
> +	 */
> +	bool enabled;
>  };
>  
>  void drm_panel_init(struct drm_panel *panel);
> -- 
> 2.20.1
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
