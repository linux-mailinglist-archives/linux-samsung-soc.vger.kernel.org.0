Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B1DC62EDD2
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 18 Nov 2022 07:42:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241507AbiKRGm2 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 18 Nov 2022 01:42:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241268AbiKRGlc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 18 Nov 2022 01:41:32 -0500
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 884F9AF0A9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Nov 2022 22:40:51 -0800 (PST)
Received: by mail-il1-x12c.google.com with SMTP id q5so2092054ilt.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Nov 2022 22:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1h3lz0DSBoategYLivX3zWUKi0KsQyvxUG/DauE+x84=;
        b=BgAqPYkiUcaOX+t8/tpxntr/ai3Ou5E79vr1OFokABSABuwAAYyVh64Nhu8UPY4dVf
         B/ZnFiIO7tNYNJuAvrf//8GaApB/mCIJxX33MWHtoIowgVZIU8//AMe1RRlpJ0AyTIAo
         ennHZF4pCYHgfir/BYmric0v0TxN6tgJ50uzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1h3lz0DSBoategYLivX3zWUKi0KsQyvxUG/DauE+x84=;
        b=jfxoQP3Dhp+Qa0fqT88cwFAzMYqPGabzNz7N+IcnHZy/n1FvK3ekCqleU27e8wFVLq
         8ApJqipej4D6vA8tu825AYSWogoOPxK2uQB5cN7Et6+KOwy3GjvbQpQoqIPlGRyB3tGv
         /x7S2IyzwrW/Fr9Sw8APxlD9eT0GgN2+UTH9kwKYYyZOg81mVRlOcH0T2S7cMWlDfNe/
         LV+ZRzBFoyCVmgLQQAWoqzpGNcymlMM/oq7BgNHmQu+A/18fytBoRIKBg4F3DOtxPYiA
         n4JyDempXpxuOPqBTpMOUVpZ7sXIKbuv1tW+vzwSzy2AWY8AI/OcSA4K59zAT1W+JNS4
         nNxA==
X-Gm-Message-State: ANoB5pmhs+H4Rm3v1lxJ1rByzo+nQRUk9Vc1N4oI6mda92Kdw6T7VUs8
        x2OwB6MKyUP1t1oDGrvt2ItcLEe7J2rPHfWZXaXitQ==
X-Google-Smtp-Source: AA0mqf4UfhCd1mank/MvokLXuih0ZIMQlLg/WJN5Og6vXb1s7xgvXH94iPkW/Z+oJ+BeEucny5tnsra81ke6v3qEgrM=
X-Received: by 2002:a05:6e02:5a5:b0:300:d831:8c90 with SMTP id
 k5-20020a056e0205a500b00300d8318c90mr2729866ils.21.1668753650978; Thu, 17 Nov
 2022 22:40:50 -0800 (PST)
MIME-Version: 1.0
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <20221110183853.3678209-4-jagan@amarulasolutions.com> <47ed3aae-308a-3b13-93c5-e31a3024f3a0@denx.de>
In-Reply-To: <47ed3aae-308a-3b13-93c5-e31a3024f3a0@denx.de>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Fri, 18 Nov 2022 12:10:40 +0530
Message-ID: <CAMty3ZCQhR64k8f1DN0uYnL2TSRc7LdqWym2usPTa2AKYKa2HQ@mail.gmail.com>
Subject: Re: [PATCH v8 03/14] drm: bridge: Generalize Exynos-DSI driver into a
 Samsung DSIM bridge
To:     Marek Vasut <marex@denx.de>
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
        Matteo Lisi <matteo.lisi@engicam.com>,
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

On Thu, Nov 17, 2022 at 10:31 AM Marek Vasut <marex@denx.de> wrote:
>
> On 11/10/22 19:38, Jagan Teki wrote:
>
> [...]
>
> > +static int samsung_dsim_wait_for_hdr_fifo(struct samsung_dsim *dsi)
> > +{
> > +     int timeout = 2000;
> > +
> > +     do {
> > +             u32 reg = samsung_dsim_read(dsi, DSIM_FIFOCTRL_REG);
> > +
> > +             if (!(reg & DSIM_SFR_HEADER_FULL))
>
> Seems that unless I wait for DSIM_SFR_HEADER_EMPTY here, there may be
> some command transfer corruption if very short commands are transferred
> in rapid succession. This can be triggered with icn6211 driver for example.

Not aware of this test, maybe adjusting or fixing the wait code on top
of this initial support later make sense.

Thanks,
Jagan.
