Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C6E16499B7
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 12 Dec 2022 08:49:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231202AbiLLHtf (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 12 Dec 2022 02:49:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiLLHte (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 12 Dec 2022 02:49:34 -0500
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CC8BB86B
        for <linux-samsung-soc@vger.kernel.org>; Sun, 11 Dec 2022 23:49:33 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-3bf4ade3364so135056787b3.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 11 Dec 2022 23:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SCbvvVskDyDlgaw21k/t1kR8QAcMi6s99/nya394pFA=;
        b=W2dEPyiEAYcUgBqWWTNf3dJsVQX0DPqNBRL+7NziTAbhM06Qn6r2D9U4PFwWdmRC6V
         DGkoqnKKf6XLhYCGzMJxMTjl+1qg6dD6tdklIrCc5IYryZ1l4Uqr/HAJuX/heMFemaxp
         E8KW+zizik4Y3BI410qS1+BFIt1xiMchaoIpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SCbvvVskDyDlgaw21k/t1kR8QAcMi6s99/nya394pFA=;
        b=R4cBOkn98FIex3QG2XMG4zevA2q9t0SZHvnuV/aO/EIGP/HZcNd2jBPeDbnoq+gAOv
         kyRj39C77Od73GusUr+16IPipl9mLuhJGlGn2rQ7E9dKmNlTWq0WjcBEzEwA77+SN3EE
         u1JaNMfpHkti5aGjTP2nuJUS6AzDNeXAjW5+PexVBV7A3VNFtDGruH5dbknIhl6pW8PZ
         fqAx5+4itvUCZWvGCwTA7pJvqMR2nWfxjkAf26y9h4AY8DSXRwZoruPMYdMYavAhD7Ix
         ayZ+0fXR9LgjXU7oChYSCU+dLQe5SDeeY6k0R9KeUBp4VxGKVfqLfh3RtQmZcjcQrZpN
         r6jg==
X-Gm-Message-State: ANoB5pk19twyrSDvgu2naC8ryWCcN/WLQIjbHUgAYIUTGmraD11e5iIV
        sEZZQKkUX6ud8ebVwQPsIJw1YJmNnOHmAjv9zZMb7Q==
X-Google-Smtp-Source: AA0mqf6vx87GZmGdICIaNHq5fMIf2ooBL9IwVK3Un+IGggZAtyqlNY3rCvzgKUqB+kl4rli/pdoRMso2oiqL9FXOcHo=
X-Received: by 2002:a81:69d7:0:b0:3c4:df92:a3d2 with SMTP id
 e206-20020a8169d7000000b003c4df92a3d2mr165808ywc.487.1670831372186; Sun, 11
 Dec 2022 23:49:32 -0800 (PST)
MIME-Version: 1.0
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
In-Reply-To: <20221209152343.180139-1-jagan@amarulasolutions.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Mon, 12 Dec 2022 13:19:20 +0530
Message-ID: <CAMty3ZC5P3NaiZotWHgXTa9-VK7zNDPDbfuKDYPLeoCQUQjLiA@mail.gmail.com>
Subject: Re: [PATCH v9 00/18] drm: bridge: Add Samsung MIPI DSIM bridge
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
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Dec 9, 2022 at 8:54 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> This series supports common bridge support for Samsung MIPI DSIM
> which is used in Exynos and i.MX8MM SoC's.
>
> The final bridge supports both the Exynos and i.MX8M Mini/Nano/Plus.
>
> Changes for v9:
> - rebase on drm-misc-next
> - drop drm bridge attach fix for Exynos
> - added prepare_prev_first flag
> - added pre_enable_prev_first flag
> - fix bridge chain order for exynos
> - added fix for Exynos host init for first DSI transfer
> - added MEDIA_BUS_FMT_FIXED
> - return MEDIA_BUS_FMT_RGB888_1X24 output_fmt if supported output_fmt
>   list is unsupported.
> - added MEDIA_BUS_FMT_YUYV10_1X20
> - added MEDIA_BUS_FMT_YUYV12_1X24
>
> Changes for v8:
> * fixed comment lines
> * fixed commit messages
> * fixed video mode bits
> * collect Marek Ack
> * fixed video mode bit names
> * update input formats logic
> * added imx8mplus support
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
> t
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
> Tested in Engicam i.Core MX8M Mini SoM.
>
> Repo:
> https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v9
>
> v8:
> https://lore.kernel.org/all/20221110183853.3678209-1-jagan@amarulasolutions.com/
>
> Any inputs?
> Jagan.
>
> Jagan Teki (16):
>   drm: panel: Enable prepare_prev_first flag for samsung-s6e panels
>   drm: exynos: dsi: Fix MIPI_DSI*_NO_* mode flags
>   drm: exynos: dsi: Properly name HSA/HBP/HFP/HSE bits
>   drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM bridge
>   drm: bridge: samsung-dsim: Lookup OF-graph or Child node devices
>   drm: bridge: samsung-dsim: Mark PHY as optional
>   drm: bridge: samsung-dsim: Add host init in pre_enable
>   drm: bridge: samsung-dsim: Init exynos host for first DSI transfer
>   drm: bridge: samsung-dsim: Add atomic_check
>   drm: bridge: samsung-dsim: Add platform PLL_P (PMS_P) offset
>   drm: bridge: samsung-dsim: Add atomic_get_input_bus_fmts
>   drm: bridge: samsung-dsim: Add input_bus_flags
>   dt-bindings: display: exynos: dsim: Add NXP i.MX8M Mini/Nano support
>   drm: bridge: samsung-dsim: Add i.MX8M Mini/Nano support
>   dt-bindings: display: exynos: dsim: Add NXP i.MX8M Plus support
>   drm: bridge: samsung-dsim: Add i.MX8M Plus support
>
> Marek Szyprowski (2):
>   drm/bridge: tc358764: Enable pre_enable_prev_first flag
>   drm: exynos: dsi: Restore proper bridge chain order

Can someone apply 1 to 5 patches, so I can send the following version
with DSIM conversion?

Jagan.
