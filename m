Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 916307EB04E
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 14 Nov 2023 13:53:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233088AbjKNMxE (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 14 Nov 2023 07:53:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232992AbjKNMwx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 14 Nov 2023 07:52:53 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8C27D55
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Nov 2023 04:52:49 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-dae0ab8ac3eso5553551276.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Nov 2023 04:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699966369; x=1700571169; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dm5tIBxlFob9g4Fl4wFAfi9oUFoS3/1CELy15DVM1mI=;
        b=IUva1w1nEizlrvNSoUb3UCdQBfVmQ5Q4YZp7nEJb92vakCXDD3tvM56YuNFWj73t56
         TOoZ95mU9fpkZD2KzIW51MFjmpbE6+hIE3T+so0B1GAhA59XFPmZTZSjSDtLr8mydiBn
         Ef9QF2o6CrkfgsAZcZmj+S4j8KOM99mRlpubKhiM/m53A3QLZcc5PUzMkjqGMDY8tRdu
         PS8vjaJPg0kpvBHmKGd8zxZQbZXG+Bwl+WJuQcx5XkAv1XEgI7/vnmvOcFgAVwjfcR2L
         th8L1YtixZdLUKGq3erttfLhik3qL8eBf1l3jQIVwmRRUC1q/x+O6K6Hk1CZ3y4DfDHl
         jIhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699966369; x=1700571169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dm5tIBxlFob9g4Fl4wFAfi9oUFoS3/1CELy15DVM1mI=;
        b=sckGE1ZXAn0HlDoc5iZfNcTsluZfAXZwdo8bVhyblW+9F5zvhQk9Su7zwb+d8fzvU3
         5e/aKbHbQLG4mjrPwue36a02rHezoJp/LzFo9xU/snF+ngUmjxlGsN423BDxi9zL5cvx
         fT8bvvti6uUaWl8tHeailW2vWYaMEtPozkcBVn1Wwe7S0g173gr9OQFJxFAw4c2us47f
         poICZYHrKAjaHWuObzDQl494qayoII2WHW6j5T3XBDj/dNcrJslKHPxFWlbLzkMlsr/x
         RwKSi+NoINHBOosaDU4U5MBpddq59goH2ELsVK+ravIvIwDwCGLR3IT6L+feBrsu8Ut7
         IlOw==
X-Gm-Message-State: AOJu0YxQhtMW8ooNYjP05mXRtUJJS0uvFeuoNR4B9Shbs/c/IFN7fkCl
        SL02AdmlqpwhPMmnraF1CvHxHPdvuGSokAUgcN6c2A==
X-Google-Smtp-Source: AGHT+IHb5y2/nAMzpAAbpcAqsc2332J3Hl+TEbnJYw6VgROQL9pFrDJMQLjA7DxF+w42E0bHCOIHzfYDBAjoO7yaXoA=
X-Received: by 2002:a25:6951:0:b0:da3:ab41:2fc8 with SMTP id
 e78-20020a256951000000b00da3ab412fc8mr8347458ybc.16.1699966368706; Tue, 14
 Nov 2023 04:52:48 -0800 (PST)
MIME-Version: 1.0
References: <CGME20231031095014epcas2p2814fa2bb5f940ccb0d0951667df34f98@epcas2p2.samsung.com>
 <20231031094852.118677-1-jaewon02.kim@samsung.com> <CACRpkdZRMJgWkLwKstpN_9=VGutbE1wBv+X_a15RJ=7ddNtbHw@mail.gmail.com>
 <15d9340a-dd4f-43fc-96c6-f6a8daf76e11@linaro.org>
In-Reply-To: <15d9340a-dd4f-43fc-96c6-f6a8daf76e11@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 14 Nov 2023 13:52:36 +0100
Message-ID: <CACRpkdYrJMnJLHa1+Vtga3WdYySx9ioGzqmnf1uZKGdBxEWa_Q@mail.gmail.com>
Subject: Re: [PATCH 00/10] Introduce ExynosAutov920 SoC and SADK board
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Nov 13, 2023 at 8:59=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 13/11/2023 15:11, Linus Walleij wrote:
> > Hi Jaewon,
> >
> > thanks for your patches!
> >
> > On Tue, Oct 31, 2023 at 10:50=E2=80=AFAM Jaewon Kim <jaewon02.kim@samsu=
ng.com> wrote:
> >
> >>   dt-bindings: pinctrl: samsung: add exynosautov920 pinctrl binding
> >>   pinctrl: samsung: add exynosautv920 pinctrl
> >
> > It is best if I can apply these two separately once Krzysztof is happy
> > with them. I hope that would work? I don't see any specific dependencie=
s.
>
> That's fine. I might have conflicting pieces in-flight, but then I'll
> funnel these through you as well. I can apply these to my
> samsung-pinctrl tree and send them to you as usual, unless you prefer to
> apply yourself.

Oh that's best of course, you take them when you think they are ready.

I was more referring to that we should be able to merge the two pin control
patches apart from the rest of the series.

Yours,
Linus Walleij
