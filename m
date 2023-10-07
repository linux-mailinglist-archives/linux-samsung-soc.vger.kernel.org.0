Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 051E77BC427
	for <lists+linux-samsung-soc@lfdr.de>; Sat,  7 Oct 2023 04:15:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234091AbjJGCPK (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 6 Oct 2023 22:15:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234108AbjJGCPJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 Oct 2023 22:15:09 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8837E100
        for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Oct 2023 19:14:57 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-27747002244so2099911a91.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Oct 2023 19:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696644897; x=1697249697; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OmwMXhTarCatb9NCqPkt+8vsHUJEJPTqRytW2qNQM+I=;
        b=ta6h1y00X6iHmZYhv9Opn+Cd+cwdJVhgMXKgcjSGtEeIXeWOp7SMjTKB6K5grW1+zY
         mdXx4u42kcKT3Vw2yD85/mTe+/AFkRVvY6S9SLolnfek2cwEcW5rTR7rrD7KII7AoWsa
         PZDzQO8+k7qjYheSmn81kOphqB2lE2CjvJxPVjHVB2hGNYUSs6z0Y0TwXvtxKRT0NBNZ
         ZD7Z1kdIksjnEamspS0Wk8YuYvJojhTmDeHvm1nkVwH2xV/EB/hghhhQRf6mYryakRcP
         EOzKo1OE5qL9ArOvwtxttZRHSEKVcgHaou18tb8YFyjLB2UqtEWFrdkgO5fhm67Z4sve
         Muhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696644897; x=1697249697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OmwMXhTarCatb9NCqPkt+8vsHUJEJPTqRytW2qNQM+I=;
        b=lGuECa7fcl4kM1imP4NBGwa/auxWRLiNYHpTF2fK6KzLOC60gCkjt4cWpD2SKzAO24
         ircMn+IVfGuEH2tYWNnf7mdmVoCObFJqEC4oJyneGSKu6I6GUicU7bMjwyA6OhDJ3xQp
         6tqA2KWBkGKJuADHi46Jfpr6uxGxP7uQcz/qtMQaBNTk7YnnfMRn+OQc9llRwSSpjdPK
         pPov2wUYCvHQFbR0Wm7aR1szPo3TUEilx/GF53jT2QfAq+Ej3bYJCUW5sxoPWFqmF9Wp
         wmjOhCEU4Mvv1G48BrTyKdgrC+5grkhnLZW2+APhCaE+8HzOIZVAi53Tlw46TxM65C47
         iWbw==
X-Gm-Message-State: AOJu0YynDrnoLj8OonoAraykX4l0DZpRfyxFGARHiTzkYy9kKX+F0RMw
        DtupQH/Q8Wt9C7YutUn2Gs7Q/p/BJArt9GaYNjjTjQ==
X-Google-Smtp-Source: AGHT+IE4N8mEXZ+Sf6QjH5HJEG+NHwGaiY72YE+cpdx/5P/OYP1BJbf0OS5y+nuKS/dwCBllK5jEsE1KIaVCkl5d9jA=
X-Received: by 2002:a17:90b:4c12:b0:274:bf7a:60cd with SMTP id
 na18-20020a17090b4c1200b00274bf7a60cdmr9625536pjb.34.1696644896930; Fri, 06
 Oct 2023 19:14:56 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20231006130038eucas1p1c849a21714227a11759681ef909ffd94@eucas1p1.samsung.com>
 <20231006125557.212681-1-m.majewski2@samsung.com> <20231006125557.212681-2-m.majewski2@samsung.com>
In-Reply-To: <20231006125557.212681-2-m.majewski2@samsung.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 6 Oct 2023 21:14:45 -0500
Message-ID: <CAPLW+4nFLeBqNRh7g8a5eJZdT_G6Dtc4zs6nkyTpcG++mYHxfA@mail.gmail.com>
Subject: Re: [PATCH 1/4] pinctrl: samsung: defer pinctrl_enable
To:     Mateusz Majewski <m.majewski2@samsung.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Oct 6, 2023 at 8:01=E2=80=AFAM Mateusz Majewski <m.majewski2@samsun=
g.com> wrote:
>
> dev_pinctrl_register function immediately enables the pinctrl subsystem,

Nitpick: dev -> devm

> which is unpreferable in general, since drivers might be unable to
> handle calls immediately. Hence devm_pinctrl_register_and_init, which
> does not call pinctrl_enable, is preferred.
>
> In case of our driver using the old function does not seem to be
> problematic for now, but will become an issue when we postpone parts of
> pinctrl initialization in a future commit, and it is a good idea to move
> off a deprecated-ish function anyway.
>
> Signed-off-by: Mateusz Majewski <m.majewski2@samsung.com>
> ---
>  drivers/pinctrl/samsung/pinctrl-samsung.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/=
samsung/pinctrl-samsung.c
> index e54847040b4a..e496af72a587 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> @@ -904,11 +904,11 @@ static int samsung_pinctrl_register(struct platform=
_device *pdev,
>         if (ret)
>                 return ret;
>
> -       drvdata->pctl_dev =3D devm_pinctrl_register(&pdev->dev, ctrldesc,
> -                                                 drvdata);
> -       if (IS_ERR(drvdata->pctl_dev)) {
> +       ret =3D devm_pinctrl_register_and_init(&pdev->dev, ctrldesc, drvd=
ata,
> +                                            &drvdata->pctl_dev);
> +       if (ret) {
>                 dev_err(&pdev->dev, "could not register pinctrl driver\n"=
);
> -               return PTR_ERR(drvdata->pctl_dev);
> +               return ret;
>         }
>
>         for (bank =3D 0; bank < drvdata->nr_banks; ++bank) {
> @@ -1176,6 +1176,10 @@ static int samsung_pinctrl_probe(struct platform_d=
evice *pdev)
>         if (ret)
>                 goto err_unregister;
>
> +       ret =3D pinctrl_enable(drvdata->pctl_dev);
> +       if (ret)
> +               goto err_unregister;
> +
>         platform_set_drvdata(pdev, drvdata);
>
>         return 0;
> --
> 2.42.0
>
