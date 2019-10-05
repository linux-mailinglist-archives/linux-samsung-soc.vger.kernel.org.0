Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DCA9CCC70
	for <lists+linux-samsung-soc@lfdr.de>; Sat,  5 Oct 2019 21:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729253AbfJETBz (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 5 Oct 2019 15:01:55 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35639 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729755AbfJETBz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 5 Oct 2019 15:01:55 -0400
Received: by mail-lj1-f194.google.com with SMTP id m7so9733667lji.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 05 Oct 2019 12:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cLnPIVbBJS+TxpO+SqFajYphNiVo4QZ5RCiCT+hdl/0=;
        b=yjBGb7YkhVlUnWVh1z11Gt4T3I97PkNYGB6u4AujbJIlRcsROUQ8lx59RmCuXDtVnY
         JfEWnWsXwUbqOoYErwHaZXi9lFD8Ayfsp0mlFtidGFrHL2LKYDLTcBcMTnjxc3C70RVq
         DYrDQLnn6ZPatonqM+3qWgFGx3No3skQVde3fwBREmdmPk6ZzSy8a9UPJi1n8B/Z0ODl
         muwChKMZQyZH6wvqbjQ1c6JdYQ+y+0/Ljcqlmw3wvaWn+nr9WxkwR6papCF1gwnqJSk7
         ks/UQQjnVMMNw8op4JJ/oNy1yd4x3ehqU9P+Yj5j5bfL0I7fP7r2pEqRwPevh90q6EN9
         GW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cLnPIVbBJS+TxpO+SqFajYphNiVo4QZ5RCiCT+hdl/0=;
        b=sPF43zmqhpNRqrq7OuMztia7MCx7TUhLHnWiDNlk/tFHb7Xg1OHGhWGR2OnAMfaOGT
         y0oMzESJIrpitnktkepWpLijJD7e3MLKztX+JYLEanlr1jW48pKCXBc79Db0D1lympYG
         Ew7ej+2mzBSGcn9hTocRJxp41+TY1w8vV9vfZ/iziAJ4fi3U7JSV9GdpWsp3GDZlfhSV
         dRDThlntFaeXzMI6Ej0KUbL0XVC1NgVomnxVT7Ojb60kwd7kl//aX7Ks8KiLI/tAkEw7
         mz68QbG95OytnXmr2SAXysYR5/bT2Nr+KMEuaIaV/bms8IO7MjacQBPyPgbix988Ec4V
         umzA==
X-Gm-Message-State: APjAAAWC8/cuP4ciEbgfDoG15IrKa4qLkKCHDOpbl38SeZj30pYnFgcA
        53vyr//tI6c2bqwpUOv7mZgM6BQo3XR4KfEyiqqaCg==
X-Google-Smtp-Source: APXvYqzKaW2NgNBp6MUPtuvXz9pw5/psSZ8RIpsZPr6vu/11xyyRUj+RCR6PRRrx5s83L0M46vj7xj5KMzhRPKRww8k=
X-Received: by 2002:a2e:9094:: with SMTP id l20mr13767405ljg.35.1570302112498;
 Sat, 05 Oct 2019 12:01:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191004231017.130290-1-dmitry.torokhov@gmail.com>
In-Reply-To: <20191004231017.130290-1-dmitry.torokhov@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 5 Oct 2019 21:01:37 +0200
Message-ID: <CACRpkdZ_+YKKmNrho5edu7hn8UsOCPySSn2YMWz+qjYwMxgvpw@mail.gmail.com>
Subject: Re: [PATCH 0/7] regulator: switch to using [devm_]fwnode_gpiod_get_index
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Sangbeom Kim <sbkim73@samsung.com>,
        Support Opensource <support.opensource@diasemi.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, Oct 5, 2019 at 1:10 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> This series swiches regulator drivers form using
> [devm_]gpiod_get_from_of_node() that is scheduled to be removed in favor
> of [devm_]fwnode_gpiod_get_index() that behaves more like standard
> [devm_]gpiod_get_index() and will potentially handle secondary software
> nodes in cases we need to augment platform firmware.

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Too bad with the build robots being unable to parse the
pull deps. Now they hammer out complaints.

Yours,
Linus Walleij
