Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 990B4333C9
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  3 Jun 2019 17:42:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726922AbfFCPm6 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 3 Jun 2019 11:42:58 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:37630 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726889AbfFCPm5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 3 Jun 2019 11:42:57 -0400
Received: by mail-vs1-f67.google.com with SMTP id o5so11541981vsq.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Jun 2019 08:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eFvvhaRusrBbL8rIah/3Coy1NP3U36B2fSZ3lMYlx8A=;
        b=nJh4XTxlZGurnl314LSdBmPwJLXwd8myttzFrQdqdfrUth4sB1WqCsVZtVpqczdZ9h
         hg+JKBWSdwKErXnEImgVEx7+P1zPnxw1i/LpwCBbs93V21N48nbs7HW/WD97yfad1hqv
         fREGryt58ccOsnJ1E60ail1mZ0nb/Dv0h8TsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eFvvhaRusrBbL8rIah/3Coy1NP3U36B2fSZ3lMYlx8A=;
        b=XQunjigaupOqmfLbNDtngrih7UNEy5zjjjneLzYIhCEzHQlm9mx//1Yl+CEczweAF9
         xZqXbR9CWj6nfwNOSwLCW9WesOPArEZUkKpomKsiYmMv4oDKzqlMjcLdM1iWsxWc/BT2
         kxZI6CU07jGjd4aoSsWuaFNXr3GsrNOfhxOithAN6u0CNn2qVZkiGfd+RsFBJAYN9q4i
         1Q+ghK6GBRZzkSPkK6kdmX4tmtawzKsGISRI8p75RlOCgS9UA3MoFIzj8sBDUgceK/8u
         9H3ECIg+e+j5Njj380BrkrSVp3VYCzuHM64N3d6Irm0y3vp4ZBKs5k8+0Km4c2kQ/z9H
         PuwQ==
X-Gm-Message-State: APjAAAXpoN4pALl9ckNGKav4JYHeiUad4i8Pa5bBjlBSYU2Cx1Q8Z4wg
        WW9FgA6+ssM2LSDLejPdnySMI0l78Jo=
X-Google-Smtp-Source: APXvYqx7ZT6gelfG52pLl1DyHWJZqEsaswG6d4F2Jmir/BhG4OZTHWuKajloYtv/QghXqJPzdyj+hg==
X-Received: by 2002:a67:69d6:: with SMTP id e205mr3931692vsc.98.1559576576608;
        Mon, 03 Jun 2019 08:42:56 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id j13sm1503668vke.52.2019.06.03.08.42.55
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Jun 2019 08:42:55 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id v129so2271818vsb.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Jun 2019 08:42:55 -0700 (PDT)
X-Received: by 2002:a67:ca0a:: with SMTP id z10mr13299139vsk.94.1559576574955;
 Mon, 03 Jun 2019 08:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190530210421.24941-1-linus.walleij@linaro.org>
 <CAD=FV=UWNbMoUrs3ZucRuNEKP27sMD0nt6ew2=fH7pxmFiTeYw@mail.gmail.com> <20190601080245.GA1012@kunai>
In-Reply-To: <20190601080245.GA1012@kunai>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 3 Jun 2019 08:42:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XuA+ZEWFk9Wi0ZPMxdhuoqA7JUM6imYVZB3J41XM2tVw@mail.gmail.com>
Message-ID: <CAD=FV=XuA+ZEWFk9Wi0ZPMxdhuoqA7JUM6imYVZB3J41XM2tVw@mail.gmail.com>
Subject: Re: [PATCH] i2c: mux: arb-gpio: Rewrite to use GPIO descriptors
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-i2c@vger.kernel.org,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On Sat, Jun 1, 2019 at 1:02 AM Wolfram Sang <wsa@the-dreams.de> wrote:
>
>
> > NOTE: any chance I can convince you to CC LKML on patches like this?
> > There's no patchwork for i2c so I can't easily grab this from
> > patchwork unless you CC LKML.
>
> See MAINTAINERS, there is a patchwork instance on ozlabs.

Ah, right!  Even so, CCing LKML can be a helpful thing to do for
patches.  If nothing else the archiving on lore.kernel.org is
valuable.

-Doug
