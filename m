Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56FEC5B7944
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 13 Sep 2022 20:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231846AbiIMST2 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 13 Sep 2022 14:19:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231838AbiIMSTL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 13 Sep 2022 14:19:11 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFC096BCF6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Sep 2022 10:29:59 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id q21so18651677edc.9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Sep 2022 10:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=EMlArogLUibXaoKnYk1CV9sHo7Gq9xb+suw2yBMebFM=;
        b=mygQINdjOb5RMojcTMEEg/ey9xgaxwr7YzNek/bhXpoau2n29c7onCYy756n3DqWTt
         mh4Ls/dS0yaBlYldfJPElcEirBBKuIavahGFjSx7A39a7VR6nvM9SwKxurWUBM7ofxU8
         C+QbkQGBQ6JFzdHdy0XBdEu2hbSWjkAPO+0Ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=EMlArogLUibXaoKnYk1CV9sHo7Gq9xb+suw2yBMebFM=;
        b=6Vxpx4II3+1ZBlwE89S66IdbCudrG8PvSuIjC6ib9GPYavcXlO6SganPsOfNwa98oY
         Qy+5TSty/LIDK1kzSo9Tlh2Atu1vx/wAoSNjJtjUwNAc4HDb+GbOU3pfKJek2QlW/obS
         0mTJvVdbs0F7ZcCis86ewgWdxVh15TlsjHA1Kl64ukLNWlLQsllc6FMtRBmNFsl/7HQi
         fhHqAuzX6kPvSLw9P2gSJqpoDRa5tpl1o/sZeMm2AOEMsuMdPxwkQdjVEG531U9UA+oc
         k8swvvTpVPpgxYI1g5UvpFGo4DoXvmxlMEJUHAMX5mfDVqCqO0uIB7a+S6VBjfo281bB
         JB7Q==
X-Gm-Message-State: ACgBeo0y+QclcS2MZ5QOlpyYHn/GdWNtBZHi1cq1eD+mm8Uk6Gt6rpEw
        Kg8iyxfp2lIwWN/ClY9OEcAGQnjXO7WoNgUMxKjR6w==
X-Google-Smtp-Source: AA6agR5FlIp3DDeMeyc4cNSST6U1wRI8xO3EUzBAdfaktabONjxRDdspRTPz7FzXlNxwduPmlYo61+4TeRuP4CvY3GY=
X-Received: by 2002:a05:6402:428c:b0:440:8259:7a2b with SMTP id
 g12-20020a056402428c00b0044082597a2bmr26695638edc.329.1663090198376; Tue, 13
 Sep 2022 10:29:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220829184031.1863663-1-jagan@amarulasolutions.com>
 <CGME20220829184118eucas1p2cda47fa166cafcb904800a55a5f66180@eucas1p2.samsung.com>
 <20220829184031.1863663-3-jagan@amarulasolutions.com> <7511aa28-a944-d241-5bea-8404008e7dce@samsung.com>
 <d750a140-c87e-16af-7683-22d48f68305a@samsung.com> <CAMty3ZBVrRa9VHDpGBM_r9gdU=Ex4iwpSHjzcOdxSBrwRrHF2A@mail.gmail.com>
 <473e88ee-1866-49ca-4a43-17a378e6fe47@samsung.com>
In-Reply-To: <473e88ee-1866-49ca-4a43-17a378e6fe47@samsung.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Tue, 13 Sep 2022 22:59:47 +0530
Message-ID: <CAMty3ZAVV_dLnkBsgBCYgNbVNE-hMFiORqv7AxkDpwciJawtzw@mail.gmail.com>
Subject: Re: [PATCH v4 02/12] drm: bridge: Add Samsung DSIM bridge driver
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        dri-devel@lists.freedesktop.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        Robert Foss <robert.foss@linaro.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Fancy Fang <chen.fang@nxp.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Sep 7, 2022 at 3:34 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Jagan,
>
> On 06.09.2022 21:07, Jagan Teki wrote:
> > On Mon, Sep 5, 2022 at 4:54 PM Marek Szyprowski
> > <m.szyprowski@samsung.com> wrote:
> >> On 02.09.2022 12:47, Marek Szyprowski wrote:
> >>> On 29.08.2022 20:40, Jagan Teki wrote:
> >>>> Samsung MIPI DSIM controller is common DSI IP that can be used in
> >>>> various
> >>>> SoCs like Exynos, i.MX8M Mini/Nano.
> >>>>
> >>>> In order to access this DSI controller between various platform SoCs,
> >>>> the ideal way to incorporate this in the drm stack is via the drm bridge
> >>>> driver.
> >>>>
> >>>> This patch is trying to differentiate platform-specific and bridge
> >>>> driver
> >>>> code and keep maintaining the exynos_drm_dsi.c code as platform-specific
> >>>> glue code and samsung-dsim.c as a common bridge driver code.
> >>>>
> >>>> - Exynos specific glue code is exynos specific te_irq, host_attach, and
> >>>>     detach code along with conventional component_ops.
> >>>>
> >>>> - Samsung DSIM is a bridge driver which is common across all
> >>>> platforms and
> >>>>     the respective platform-specific glue will initialize at the end
> >>>> of the
> >>>>     probe. The platform-specific operations and other glue calls will
> >>>> invoke
> >>>>     on associate code areas.
> >>>>
> >>>> v4:
> >>>> * include Inki Dae in MAINTAINERS
> >>>> * remove dsi_driver probe in exynos_drm_drv to support multi-arch build
> >>> This breaks Exynos DRM completely as the Exynos DRM driver is not able
> >>> to wait until the DSI driver is probed and registered as component.
> >>>
> >>> I will show how to rework this the way it is done in
> >>> drivers/gpu/drm/exynos/exynos_dp.c and
> >>> drivers/gpu/drm/bridge/analogix/analogix_dp_core.c soon...
> >> I've finally had some time to implement such approach, see
> >> https://protect2.fireeye.com/v1/url?k=c5d024d9-a4ab8e4e-c5d1af96-74fe4860001d-625a8324a9797375&q=1&e=489b94d4-84fb-408e-b679-a8d27acf2930&u=https%3A%2F%2Fgithub.com%2Fmszyprow%2Flinux%2Ftree%2Fv6.0-dsi-v4-reworked
> >>
> >> If you want me to send the patches against your v4 patchset, let me
> >> know, but imho my changes are much more readable after squashing to the
> >> original patches.
> >>
> >> Now the driver is fully multi-arch safe and ready for further
> >> extensions. I've removed the weak functions, reworked the way the
> >> plat_data is used (dropped the patch related to it) and restored
> >> exynos-dsi driver as a part of the Exynos DRM drivers/subsystem. Feel
> >> free to resend the above as v5 after testing on your hardware. At least
> >> it properly works now on all Exynos boards I have, both compiled into
> >> the kernel or as modules.
> > Thanks. I've seen the repo added on top of Dave patches - does it mean
> > these depends on Dave changes as well?
>
> Yes and no. My rework doesn't change anything with this dependency. It
> comes from my patch "drm: exynos: dsi: Restore proper bridge chain
> order" already included in your series (patch #1). Without it exynos-dsi
> driver hacks the list of bridges to ensure the order of pre_enable calls
> needed for proper operation. This works somehow with DSI panels on my
> test systems, but it has been reported that it doesn't work with a bit
> more complex display pipelines. Only that patch depends on the Dave's
> patches. If you remove it, you would need to adjust the code in the
> exynos_drm_dsi.c and samsung-dsim.c respectively. imho it would be
> better to keep it and merge Dave's patches together with dsi changes, as
> they are the first real client of it.

I think the Dave patches especially "drm/bridge: Introduce
pre_enable_upstream_first to alter bridge init order" seems not 100%
relevant to this series as they affect bridge chain call flow
globally. Having a separate series for that makes sense to me. I'm
sending v5 by excluding those parts.

Jagan.
