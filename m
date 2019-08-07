Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19DBD84B17
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  7 Aug 2019 13:55:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729681AbfHGLzp (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 7 Aug 2019 07:55:45 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:34858 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729673AbfHGLzp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Aug 2019 07:55:45 -0400
Received: by mail-qk1-f194.google.com with SMTP id r21so65587339qke.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Aug 2019 04:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SYVsSHsvSWXRztrf3IuVhfzf5yR2eq8e4OeojMpGXV4=;
        b=MvVp0PhouLDFbAzPC6BlPhwnjMq6wj4aKW+xqnyO4EpFpbnlmYNShTSj2QvZyC2cwo
         id+9iDAv2VuLz4ZkOVmpWD1iFCrwBLFEzgrsVH7lrHNpz3794rZO51JvOwAAtLZKxLag
         KuferNUkbVm+v83TZ3zD0XXQ2ZXvook4I1m8N86QUeZ/JH7AT1mPxoVIhYstrgX7Du+a
         Us50AGkRmA3jrnvewEbut09BEHBAtTdwhhwW7cWPiC8wTo7iwH/9xwmZYsG0GKzbXmOA
         JfRO1GBWleE+OiE3Rry//QTfz0UyU5RMxzecKNz68fhKbBiH6J+Gnrl4QNF+hwmmjLYk
         BZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SYVsSHsvSWXRztrf3IuVhfzf5yR2eq8e4OeojMpGXV4=;
        b=DOGIMDtijHhgPI+KdZvErPjl2Br6l4G0QydYus8oZfhqXdt3lXBhijG6cqugtN9SAX
         c8ZWZZ1KKoqi3hBNv21pftTobFCFyd3LEm9zEdUWL+ZyIlCjK4NUJ+Bzdy1cb25a0tnm
         mjNnhqlu+5kRcj3Id8Hu3Rab6pA6YBwqAdZms1izeQJJaH8q+SsWtIp/LMYL2hT4eS8q
         DfGO2UzeY+Pz4eQvJ2Cpqf/FPW4MsjRV770pKzub/TIwOJ/pQ2MTkqkALxVsAblirvnp
         QyXHRz8zHplRzTzN2sQomgc5xmBvfe2I4rkDk868USl46EWTspm9rKQNJkORAbF3/yPL
         sw7w==
X-Gm-Message-State: APjAAAUoo+9vOHhnBQGha9vCeCoHkUe5myNglzUj8xv7LAaoqZlDpKYL
        mZJYwUu8bmaGdhMdlyNAhlMm3YhplHq3MWEGCTKjhA==
X-Google-Smtp-Source: APXvYqwEsXcr4FpH9gDfLIkM8xlP9ZUuM0nR3mM2uKxsKf/UACxOWHfAXNmHuJ/ZKRMRUNo55y8wJzZDblUivvVNr2A=
X-Received: by 2002:a37:4d16:: with SMTP id a22mr8030512qkb.103.1565178944593;
 Wed, 07 Aug 2019 04:55:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190804201637.1240-1-sam@ravnborg.org> <20190804201637.1240-9-sam@ravnborg.org>
In-Reply-To: <20190804201637.1240-9-sam@ravnborg.org>
From:   Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date:   Wed, 7 Aug 2019 13:55:33 +0200
Message-ID: <CA+M3ks4weUp8wtZktTj9TwLis=x4EyyRjOYh6eavvw_CxuKkuA@mail.gmail.com>
Subject: Re: [PATCH v1 08/16] drm/sti: fix opencoded use of drm_panel_*
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     ML dri-devel <dri-devel@lists.freedesktop.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Alison Wang <alison.wang@nxp.com>,
        Allison Randal <allison@lohutok.net>,
        Andrzej Hajda <a.hajda@samsung.com>,
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
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/S5P EXYNOS AR..." 
        <linux-samsung-soc@vger.kernel.org>, linux-tegra@vger.kernel.org,
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Le dim. 4 ao=C3=BBt 2019 =C3=A0 22:17, Sam Ravnborg <sam@ravnborg.org> a =
=C3=A9crit :
>
> Use the drm_panel_(enable|disable|get_modes) functions.

Applied on drm-misc-next,
Thanks.

Benjamin

>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> Cc: Vincent Abriou <vincent.abriou@st.com>
> ---
>  drivers/gpu/drm/sti/sti_dvo.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/sti/sti_dvo.c b/drivers/gpu/drm/sti/sti_dvo.=
c
> index 9e6d5d8b7030..e55870190bf5 100644
> --- a/drivers/gpu/drm/sti/sti_dvo.c
> +++ b/drivers/gpu/drm/sti/sti_dvo.c
> @@ -221,8 +221,7 @@ static void sti_dvo_disable(struct drm_bridge *bridge=
)
>
>         writel(0x00000000, dvo->regs + DVO_DOF_CFG);
>
> -       if (dvo->panel)
> -               dvo->panel->funcs->disable(dvo->panel);
> +       drm_panel_disable(dvo->panel);
>
>         /* Disable/unprepare dvo clock */
>         clk_disable_unprepare(dvo->clk_pix);
> @@ -262,8 +261,7 @@ static void sti_dvo_pre_enable(struct drm_bridge *bri=
dge)
>         if (clk_prepare_enable(dvo->clk))
>                 DRM_ERROR("Failed to prepare/enable dvo clk\n");
>
> -       if (dvo->panel)
> -               dvo->panel->funcs->enable(dvo->panel);
> +       drm_panel_enable(dvo->panel);
>
>         /* Set LUT */
>         writel(config->lowbyte,  dvo->regs + DVO_LUT_PROG_LOW);
> @@ -340,7 +338,7 @@ static int sti_dvo_connector_get_modes(struct drm_con=
nector *connector)
>         struct sti_dvo *dvo =3D dvo_connector->dvo;
>
>         if (dvo->panel)
> -               return dvo->panel->funcs->get_modes(dvo->panel);
> +               return drm_panel_get_modes(dvo->panel);
>
>         return 0;
>  }
> --
> 2.20.1
>
