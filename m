Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53DB14367AE
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 21 Oct 2021 18:26:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbhJUQ2T (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 21 Oct 2021 12:28:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231883AbhJUQ2S (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 21 Oct 2021 12:28:18 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24D55C061764;
        Thu, 21 Oct 2021 09:26:02 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id z11-20020a1c7e0b000000b0030db7b70b6bso307906wmc.1;
        Thu, 21 Oct 2021 09:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MJX2i4HqBrM5vK2Tz/O1+2LEtyHzF3MISyrbDZ9H1L0=;
        b=Ei/6JKliMFXsBAo5RU5GpOOPsS7XlFzAhvK8H56I9S/O8dxSN9/RULALxLfxuRbMuj
         FLyXizJ3d75jhBhDABUjUAh3cIghGKGlS1MqR0SQQlhoBHiAx+eXzFdY+OpuKI+mr2g3
         4Xm0/7J/FIE1xnZpo1dZUN8In7hgKaTV3xNLLuRgnc1Uh+ytshpF0U15u1Dxlup5aUz2
         vUaxKT/nsqC8Q08oa3ZNyxO0cjW1oVVoiaoj3Fy3kptW2GdfJGMJgNACrO0OsfG4Jz4m
         ucK9MQlVBQo81f8YudTvTZHNo+3bKMTNHpgm0MKAGMSXXhxMlVFo7PAU3MmjA8XJn5qD
         O10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MJX2i4HqBrM5vK2Tz/O1+2LEtyHzF3MISyrbDZ9H1L0=;
        b=NxL1W44BDkjl89XHwLi8rhDurJWmpeBrgWAW6hxhHoD/o8bdeZ3gb774K30tmn7QZ/
         vStAUhaZxytKUGPz9CBXsPQHi792AwL4q9gbl4Jb3KXlJiFMuoilFk31cDuGcYhJdY7I
         +pX7ALasYUcICGMkGYb52pzXIq42Esr8L2kG8l/q/V26rUP4cVJC3kHIgZLT2QKqeCqP
         Yz7KeP4Yhhhx/fNGPa6yFsyVNUg3IP0DfqGOsLsOE5IJWns58dL03jX1FJR0K4eA8oiJ
         pER7/j3zqTBveUZ5G2ik7drL5oIvIVAFoyfvYOQSWPoJD6qHTX8b0y3DXB/v5ac7WsGe
         AgNA==
X-Gm-Message-State: AOAM532S+aLEM9W1Xb/k9+fYJ8NibhOnOtPOzb4/8UXacynWpnH6xQeY
        vMT/8BEViZu3V5iddy0z6EFtUTLCbbxXRWtRIMQ=
X-Google-Smtp-Source: ABdhPJxMMEpgJvFCUhkiPbr0GtGuVpBCjP3S4KkFi+sJX0HKzCpcukiyjXaKzSDNiLpZS2pS4vkln3p9WiZuTWqUWOs=
X-Received: by 2002:a7b:c007:: with SMTP id c7mr22651421wmb.101.1634833560514;
 Thu, 21 Oct 2021 09:26:00 -0700 (PDT)
MIME-Version: 1.0
References: <20211021073947.499373-1-maxime@cerno.tech> <20211021073947.499373-22-maxime@cerno.tech>
In-Reply-To: <20211021073947.499373-22-maxime@cerno.tech>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 21 Oct 2021 09:30:39 -0700
Message-ID: <CAF6AEGvQzyzNs57nCuR5ZRC14kB8CscykJ+4=gmZB6==OXCQEA@mail.gmail.com>
Subject: Re: [PATCH v5 21/21] drm/msm/dsi: Adjust probe order
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sam Ravnborg <sam@ravnborg.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Thierry Reding <thierry.reding@gmail.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Robert Foss <robert.foss@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        "moderated list:ARM/S5P EXYNOS AR..." 
        <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        Chen Feng <puck.chen@hisilicon.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        John Stultz <john.stultz@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sean Paul <sean@poorly.run>, Inki Dae <inki.dae@samsung.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Caleb Connolly <caleb.connolly@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Oct 21, 2021 at 12:41 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Switch to the documented order dsi-host vs bridge probe.
>
> Tested-by: Amit Pundir <amit.pundir@linaro.org>
> Tested-by: Caleb Connolly <caleb.connolly@linaro.org>
> Tested-by: John Stultz <john.stultz@linaro.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

I guess this should probably land together w/ the rest of the series,
so a-b for merging thru drm-misc

BR,
-R

> ---
>  drivers/gpu/drm/msm/dsi/dsi.c         | 50 ++++++++++++++++-----------
>  drivers/gpu/drm/msm/dsi/dsi.h         |  2 +-
>  drivers/gpu/drm/msm/dsi/dsi_host.c    | 22 ++++--------
>  drivers/gpu/drm/msm/dsi/dsi_manager.c |  6 ++--
>  drivers/gpu/drm/msm/msm_drv.h         |  2 ++
>  5 files changed, 43 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> index 614dc7f26f2c..ad73ebb84b2d 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -112,18 +112,7 @@ static int dsi_bind(struct device *dev, struct device *master, void *data)
>  {
>         struct drm_device *drm = dev_get_drvdata(master);
>         struct msm_drm_private *priv = drm->dev_private;
> -       struct platform_device *pdev = to_platform_device(dev);
> -       struct msm_dsi *msm_dsi;
> -
> -       DBG("");
> -       msm_dsi = dsi_init(pdev);
> -       if (IS_ERR(msm_dsi)) {
> -               /* Don't fail the bind if the dsi port is not connected */
> -               if (PTR_ERR(msm_dsi) == -ENODEV)
> -                       return 0;
> -               else
> -                       return PTR_ERR(msm_dsi);
> -       }
> +       struct msm_dsi *msm_dsi = dev_get_drvdata(dev);
>
>         priv->dsi[msm_dsi->id] = msm_dsi;
>
> @@ -136,12 +125,8 @@ static void dsi_unbind(struct device *dev, struct device *master,
>         struct drm_device *drm = dev_get_drvdata(master);
>         struct msm_drm_private *priv = drm->dev_private;
>         struct msm_dsi *msm_dsi = dev_get_drvdata(dev);
> -       int id = msm_dsi->id;
>
> -       if (priv->dsi[id]) {
> -               dsi_destroy(msm_dsi);
> -               priv->dsi[id] = NULL;
> -       }
> +       priv->dsi[msm_dsi->id] = NULL;
>  }
>
>  static const struct component_ops dsi_ops = {
> @@ -149,15 +134,40 @@ static const struct component_ops dsi_ops = {
>         .unbind = dsi_unbind,
>  };
>
> -static int dsi_dev_probe(struct platform_device *pdev)
> +int dsi_dev_attach(struct platform_device *pdev)
>  {
>         return component_add(&pdev->dev, &dsi_ops);
>  }
>
> -static int dsi_dev_remove(struct platform_device *pdev)
> +void dsi_dev_detach(struct platform_device *pdev)
>  {
> -       DBG("");
>         component_del(&pdev->dev, &dsi_ops);
> +}
> +
> +static int dsi_dev_probe(struct platform_device *pdev)
> +{
> +       struct msm_dsi *msm_dsi;
> +
> +       DBG("");
> +       msm_dsi = dsi_init(pdev);
> +       if (IS_ERR(msm_dsi)) {
> +               /* Don't fail the bind if the dsi port is not connected */
> +               if (PTR_ERR(msm_dsi) == -ENODEV)
> +                       return 0;
> +               else
> +                       return PTR_ERR(msm_dsi);
> +       }
> +
> +       return 0;
> +}
> +
> +static int dsi_dev_remove(struct platform_device *pdev)
> +{
> +       struct msm_dsi *msm_dsi = platform_get_drvdata(pdev);
> +
> +       DBG("");
> +       dsi_destroy(msm_dsi);
> +
>         return 0;
>  }
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
> index b50db91cb8a7..83787cbee419 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -116,7 +116,7 @@ int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
>  struct drm_panel *msm_dsi_host_get_panel(struct mipi_dsi_host *host);
>  unsigned long msm_dsi_host_get_mode_flags(struct mipi_dsi_host *host);
>  struct drm_bridge *msm_dsi_host_get_bridge(struct mipi_dsi_host *host);
> -int msm_dsi_host_register(struct mipi_dsi_host *host, bool check_defer);
> +int msm_dsi_host_register(struct mipi_dsi_host *host);
>  void msm_dsi_host_unregister(struct mipi_dsi_host *host);
>  int msm_dsi_host_set_src_pll(struct mipi_dsi_host *host,
>                         struct msm_dsi_phy *src_phy);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index e269df285136..f741494b1bf6 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1624,6 +1624,10 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
>         if (ret)
>                 return ret;
>
> +       ret = dsi_dev_attach(msm_host->pdev);
> +       if (ret)
> +               return ret;
> +
>         DBG("id=%d", msm_host->id);
>         if (msm_host->dev)
>                 queue_work(msm_host->workqueue, &msm_host->hpd_work);
> @@ -1636,6 +1640,8 @@ static int dsi_host_detach(struct mipi_dsi_host *host,
>  {
>         struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>
> +       dsi_dev_detach(msm_host->pdev);
> +
>         msm_host->device_node = NULL;
>
>         DBG("id=%d", msm_host->id);
> @@ -1970,7 +1976,7 @@ int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
>         return 0;
>  }
>
> -int msm_dsi_host_register(struct mipi_dsi_host *host, bool check_defer)
> +int msm_dsi_host_register(struct mipi_dsi_host *host)
>  {
>         struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>         int ret;
> @@ -1984,20 +1990,6 @@ int msm_dsi_host_register(struct mipi_dsi_host *host, bool check_defer)
>                         return ret;
>
>                 msm_host->registered = true;
> -
> -               /* If the panel driver has not been probed after host register,
> -                * we should defer the host's probe.
> -                * It makes sure panel is connected when fbcon detects
> -                * connector status and gets the proper display mode to
> -                * create framebuffer.
> -                * Don't try to defer if there is nothing connected to the dsi
> -                * output
> -                */
> -               if (check_defer && msm_host->device_node) {
> -                       if (IS_ERR(of_drm_find_panel(msm_host->device_node)))
> -                               if (!of_drm_find_bridge(msm_host->device_node))
> -                                       return -EPROBE_DEFER;
> -               }
>         }
>
>         return 0;
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index c41d39f5b7cf..fc949a84cef6 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -72,7 +72,7 @@ static int dsi_mgr_setup_components(int id)
>         int ret;
>
>         if (!IS_BONDED_DSI()) {
> -               ret = msm_dsi_host_register(msm_dsi->host, true);
> +               ret = msm_dsi_host_register(msm_dsi->host);
>                 if (ret)
>                         return ret;
>
> @@ -92,10 +92,10 @@ static int dsi_mgr_setup_components(int id)
>                  * because only master DSI device adds the panel to global
>                  * panel list. The panel's device is the master DSI device.
>                  */
> -               ret = msm_dsi_host_register(slave_link_dsi->host, false);
> +               ret = msm_dsi_host_register(slave_link_dsi->host);
>                 if (ret)
>                         return ret;
> -               ret = msm_dsi_host_register(master_link_dsi->host, true);
> +               ret = msm_dsi_host_register(master_link_dsi->host);
>                 if (ret)
>                         return ret;
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 8b005d1ac899..31d50e98a723 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -344,6 +344,8 @@ int msm_edp_modeset_init(struct msm_edp *edp, struct drm_device *dev,
>
>  struct msm_dsi;
>  #ifdef CONFIG_DRM_MSM_DSI
> +int dsi_dev_attach(struct platform_device *pdev);
> +void dsi_dev_detach(struct platform_device *pdev);
>  void __init msm_dsi_register(void);
>  void __exit msm_dsi_unregister(void);
>  int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
> --
> 2.31.1
>
