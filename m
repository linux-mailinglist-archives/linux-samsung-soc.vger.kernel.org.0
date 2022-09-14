Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B57725B82D8
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 14 Sep 2022 10:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbiINIWU (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 14 Sep 2022 04:22:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbiINIWR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 14 Sep 2022 04:22:17 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E866606B6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Sep 2022 01:22:13 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id b35so21111007edf.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Sep 2022 01:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=C3szHyN1H7uWCYSHMJkK9hI6f1WnHoGR06A9hdGC5m4=;
        b=dg7GYZg434lKn977vNMDHW6Xq/ubpOjo++bwDYcJPjweH2hQShU/U6gZFxlsC0iKMs
         8mOGaOkJQ748aVQ+LVzYlg8yxuEtpq9wPKofxczXqHdOe8B0NAvkgEotk4Wf/XQ0QH2F
         8GZUW846oDXv1IBly8apJw9S/XSBIXJeC7cBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=C3szHyN1H7uWCYSHMJkK9hI6f1WnHoGR06A9hdGC5m4=;
        b=HEHwBQn5qqhqMwJKHVQKDyEpdJhaYpujFx1zB5TuKRCwe4rLzHMDz0dNbMvotFmrxk
         vwmIBM0Ucdg4OmPRkEoJBN1m0GPGGZfeqmev0jJXM7EFSWdAnhrRMEx4LN0iVa2HddsS
         FVyP49DQCFQMAk7MbrSUIY1DJQiUa3Sei1cnwL1dZNR529j+EDHAG8zBWicko6MnYMXM
         4LguLZZxtsunDAx4/SJQfQltEMlkNPG/nCBDAGVjlLKEqfiJ7YB4VU8CBeuF/eOJlxAk
         bUyyio0iNaiwXxYupiePrZISvriEZuWlM/g56xiMuT8p5v1teBhXMhi1G4BIvlJyMgim
         NwAw==
X-Gm-Message-State: ACgBeo2fOtMbt38uIiLzCFBk4Zup1sWdMaASawMhAqqLN1kuBeOQWyrz
        BEpQ3sWK8zTypSQgK7NoeJQ8zHJtZrkV1EK/d929Bg==
X-Google-Smtp-Source: AA6agR5VXO7LGKlo/0ITP5xoJJtYJWB9kOGeOCXFZPjSD3tELNNBCLBAsYH7sCGgrDncAa9Ie4CYWyAxAnqxa9WrMj0=
X-Received: by 2002:a05:6402:e86:b0:440:d1be:20c7 with SMTP id
 h6-20020a0564020e8600b00440d1be20c7mr29564784eda.349.1663143732102; Wed, 14
 Sep 2022 01:22:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220829184031.1863663-1-jagan@amarulasolutions.com>
 <20220829184031.1863663-8-jagan@amarulasolutions.com> <CAHCN7xKxS6oaX8kGYv_bhWfCFUEMBykN87BwXMPkcCg=OwKXrw@mail.gmail.com>
In-Reply-To: <CAHCN7xKxS6oaX8kGYv_bhWfCFUEMBykN87BwXMPkcCg=OwKXrw@mail.gmail.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Wed, 14 Sep 2022 13:52:01 +0530
Message-ID: <CAMty3ZAKjpXpdK1ZNw9dX_ojC4NKCZZ36HaQZGPDfrqiMk0kpQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/12] drm: bridge: samsung-dsim: Fix PLL_P (PMS_P) offset
To:     Adam Ford <aford173@gmail.com>
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
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Marek Vasut <marex@denx.de>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
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

On Tue, Aug 30, 2022 at 1:12 AM Adam Ford <aford173@gmail.com> wrote:
>
> On Mon, Aug 29, 2022 at 1:41 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > The i.MX 8M Mini Applications Processor Reference Manual, Rev. 3, 11/2020
> > with 13.7.10.1 Master PLL PMS Value setting Register mentioned PMS_P offset
> > range from BIT[18-13] and the upstream driver is using the same offset.
> >
> > However, offset 13 is not working on i.MX8M Mini platforms but downstream
> > NXP driver is using 14 [1] and it is working with i.MX8M Mini SoC.
>
> From the line you highlighted in the link, the downstream NXP ones
> shows 13 if I'm reading it correctly.
>
> #define PLLCTRL_SET_P(x) REG_PUT(x, 18, 13)

PMS_P value set in sec_mipi_dsim_check_pll_out using PLLCTRL_SET_P()
with offset 13 and then an additional offset of one bit added in
sec_mipi_dsim_config_pll via PLLCTRL_SET_PMS().

Please check this for additional information
https://github.com/fschrempf/linux/commit/bbb3549a99e162ef6ad4c83d5fd4d39a6daa6d56

I'll update the additional information in commit messages in v5.

Thanks,
Jagan.
