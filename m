Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2778E64B35C
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 13 Dec 2022 11:40:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234969AbiLMKko (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 13 Dec 2022 05:40:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234943AbiLMKkk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 13 Dec 2022 05:40:40 -0500
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF7EB6332
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Dec 2022 02:40:39 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-417b63464c6so85873507b3.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Dec 2022 02:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OgaNyZ5x1h+jMKektNE6VuQR1NP6W7drX5dxHtMPlQI=;
        b=RDXEgdT6yVC7DW5EyDhcIf6vwcRJIWkt3UP0rOA11lSxdm59tY0IsUMdQp2WycH7Pc
         Z3h7MMckJvu0VKwzFCwRsgQyqX0TGyQFyMX3HmGC5Seb19hFKucWFtFpfjPIEOCLTl7Q
         vvqxaAQqrtyRQDOlLJx/Ip/6Kk4wyJSxwfMcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OgaNyZ5x1h+jMKektNE6VuQR1NP6W7drX5dxHtMPlQI=;
        b=Hx03JZxXHh8iuOiajpCUzPa0qSZkyqCgqcs2WwkvHTUcBwE1P+QLMroY5K5uKfH88P
         I0vtLvaBcQVMyZiHTSjnnQZ0yJrYEgnylZIF9+YJT5wCVzL6r+EoeZlrN3RN2j4nMoyh
         jS3iOs9dACy93ASN0lsNVptaeKS782jcy0X0SQHTGtYV18dS2F7vPhU6+tVROgC/iJqp
         o67YMGo1JaYPF5zEUUd5l169ai22IuJ75rkroBnp+mvN0dO0vC+UaozWEU5Ez5f4AVtE
         f+l8DxlmxpPVY8oYMHwuU9r/MQeWGSoDkVr+4IjaldIt2lcSN8PVnXFuiBFbWKMVvemm
         Z65A==
X-Gm-Message-State: ANoB5plFSW4izOhR/zqY6eCgcj12seaxdeY63Fdf5/rsj9R/9zlr1wbS
        nFrD1xf1TZTZxcyFof6PWnAQxjH8nqddR9jCK9g85Q==
X-Google-Smtp-Source: AA0mqf5DankXuvzmLW7KEnaFY93f/DEga3DelFoCUPUnc4GwBdl+S8ngxEG2JOAUAfhFyIJW08TXMjSkik/hyNM6QKo=
X-Received: by 2002:a81:7357:0:b0:407:7bc3:d949 with SMTP id
 o84-20020a817357000000b004077bc3d949mr2669877ywc.186.1670928039143; Tue, 13
 Dec 2022 02:40:39 -0800 (PST)
MIME-Version: 1.0
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
 <CGME20221209152722eucas1p2534c4e4837d3006683fc57c0dcb1ab52@eucas1p2.samsung.com>
 <20221209152343.180139-11-jagan@amarulasolutions.com> <df99edbd-7150-7274-2c5e-fe6d4ed4d92d@samsung.com>
 <CAMty3ZCCscqE8e_Rr9KpmUONxh4aCBWB7qh4xSvuCGrUT4kUeQ@mail.gmail.com>
 <b1e38212-985c-21c9-58a5-7504719c3af8@samsung.com> <ed13b791-ab47-7aaa-7993-bb49478e7f2a@samsung.com>
 <CAMty3ZBzpmwAV7e7wdBu+GOmg6M7xqqc46QtGzuLsnv2kT0Zdw@mail.gmail.com> <395a4762-70fe-1caf-579f-2b5952232470@samsung.com>
In-Reply-To: <395a4762-70fe-1caf-579f-2b5952232470@samsung.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Tue, 13 Dec 2022 16:10:27 +0530
Message-ID: <CAMty3ZABHUjSHRBR6RCnyE19HOWknw67s__0WBKgMnX5nQBy9w@mail.gmail.com>
Subject: Re: [PATCH v9 10/18] drm: bridge: samsung-dsim: Init exynos host for
 first DSI transfer
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
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
        Marek Vasut <marex@denx.de>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Marek,

On Tue, Dec 13, 2022 at 2:28 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 12.12.2022 16:33, Jagan Teki wrote:
>
> On Mon, Dec 12, 2022 at 8:52 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>
> On 12.12.2022 09:43, Marek Szyprowski wrote:
>
> On 12.12.2022 09:32, Jagan Teki wrote:
>
> On Mon, Dec 12, 2022 at 1:56 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>
> Hi Jagan,
>
> On 09.12.2022 16:23, Jagan Teki wrote:
>
> The existing drm panels and bridges in Exynos required host
> initialization during the first DSI command transfer even though
> the initialization was done before.
>
> This host reinitialization is handled via DSIM_STATE_REINITIALIZED
> flag and triggers from host transfer.
>
> Do this exclusively for Exynos.
>
> Initial logic is derived from Marek Szyprowski changes.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes from v9:
> - derived from v8
> - added comments
>
>    drivers/gpu/drm/bridge/samsung-dsim.c | 15 ++++++++++++++-
>    include/drm/bridge/samsung-dsim.h     |  5 +++--
>    2 files changed, 17 insertions(+), 3 deletions(-)
>
> The following chunk is missing compared to v8:
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> b/drivers/gpu/drm/bridge/samsung-dsim.c
> index 6e9ad955ebd3..6a9403cb92ae 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1315,7 +1315,9 @@ static int samsung_dsim_init(struct samsung_dsim
> *dsi, unsigned int flag)
>                   return 0;
>
>           samsung_dsim_reset(dsi);
> -       samsung_dsim_enable_irq(dsi);
> +
> +       if (!(dsi->state & DSIM_STATE_INITIALIZED))
> +               samsung_dsim_enable_irq(dsi);
>
> Is this really required? does it make sure that the IRQ does not
> enable twice?
>
> That's what that check does. Without the 'if (!(dsi->state &
> DSIM_STATE_INITIALIZED))' check, the irqs will be enabled twice (first
> from pre_enable, then from the first transfer), what leads to a
> warning from irq core.
>
> I've just noticed that we also would need to clear the
> DSIM_STATE_REINITIALIZED flag in dsim_suspend.
>
> However I've found that a bit simpler patch would keep the current code
> flow for Exynos instead of this reinitialization hack. This can be
> applied on the "[PATCH v9 09/18] drm: bridge: samsung-dsim: Add host
> init in pre_enable" patch:
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> b/drivers/gpu/drm/bridge/samsung-dsim.c
> index 0b2e52585485..acc95c61ae45 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1291,9 +1291,11 @@ static void samsung_dsim_atomic_pre_enable(struct
> drm_bridge *bridge,
>
>          dsi->state |=3D DSIM_STATE_ENABLED;
>
> -       ret =3D samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
> -       if (ret)
> -               return;
> +       if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
> +               ret =3D samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
> +               if (ret)
> +                       return;
> +       }
>
> Sorry, I don't understand this. Does it mean Exynos doesn't need to
> init host in pre_enable? If I remember correctly even though the host
> is initialized it has to reinitialize during the first transfer - This
> is what the Exynos requirement is. Please correct or explain here.
>
> This is a matter of enabling power regulator(s) in the right order and do=
ing the host initialization in the right moment. It was never a matter of r=
e-initialization. See the current code for the reference (it uses the same =
approach as my above change). I've already explained that here:
>
> https://lore.kernel.org/all/e96197f9-948a-997e-5453-9f9d179b5f5a@samsung.=
com/
>
> If you would like to see the exact proper moment of the dsi host initiali=
zation on the Exynos see the code here:
>
> https://github.com/mszyprow/linux/tree/v5.18-next-20220511-dsi-rework and=
 patches adding mipi_dsi_host_init() to panel/bridge drivers.

As I said before, the downstream bridge needs an explicit call to host
init via mipi_dsi_host_init - this is indeed not a usual use-case
scenario. Let's handle this with a REINIT fix and see if we can update
this later to handle both scenarios.

Would you please test this repo, I have included all.

https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v10

Thanks,
Jagan.
