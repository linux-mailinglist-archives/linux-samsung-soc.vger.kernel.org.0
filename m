Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE6EE4222E2
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  5 Oct 2021 11:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233455AbhJEJ7C (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 5 Oct 2021 05:59:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232723AbhJEJ7C (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 5 Oct 2021 05:59:02 -0400
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6E1FC061749
        for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Oct 2021 02:57:11 -0700 (PDT)
Received: by mail-vk1-xa2f.google.com with SMTP id y74so9007696vky.12
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Oct 2021 02:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5tyZ1L4nPxHAH57fPWcCNfvTj6DGtahCV/QiQgPB4f0=;
        b=w6WrpcoLhjiXUHF0pSlcCde3W3uqzcYz6OKbgnEaoYfsjMFccUF39SiE6HKJr2E9yf
         OgR6+50MXyzsGvfduM48g3XoZFulVjK2VFTXlV3QueU4lT2Wk8CN9GsvSBi55UbJXOXX
         wQ/7uJUi1+Hfweauq0/hWJ3nQaNQVo1FMIi3WkwTHzeyShGK08Y81G9Atx2+tNgXkuEZ
         tRXZTIp08hpwg7VDQzccA5vCO2iuySmkCxMwVYaGZ5vwmR6Ccj6lLOaQjkkiIJITaEAV
         P1qNBxRz4O6H8klxQbXOUo3Xdm9oM27ER8/RGyJploTJkGBCCYGw4iRZegjux/pdwMHU
         8n0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5tyZ1L4nPxHAH57fPWcCNfvTj6DGtahCV/QiQgPB4f0=;
        b=c9EwhDGif802P4AnROt0S1BRer6C+MJVmB14vXmd1HcO4uqWCNlArkCKPVV7qOkjZY
         N8gCfdmCAmq49C2wcYYtO9cU7MMi98/EucrMLHtHLRjAph75OdYJsB0sDiiNw9huBadY
         m/auUAfmyFkke1/wcpOheqb9PUbmEbgxCnT3hTdY7r3ZTQ3Ohy0hKXq7O295OrCu1Aav
         eiMxedla74sU8RYqzMGlkn3/uS/HM1U3QfX7Q5bZBVMFXhaX5eFqeeEpBr6UnVXKUPDt
         lzi0lVAz1my6iw3miRsbBDs3rtEi8QU8hZ5/azydTreMmrUmwJUnJTG9x1ojLL81vgb+
         /ahA==
X-Gm-Message-State: AOAM533cZhuW9p6hwwOevX9dVadQvTJJx2dcQ3LRkeEz7pfwj3+0yCXd
        AJkT8Q1qcTOrgnCi9cc+F/eHPdrw8ZUoH50Ds32LDQ==
X-Google-Smtp-Source: ABdhPJxkOlO4SYnOan3kE1N3PVnE07RjPPQhgqdJa8q8rTuO1aJhb1yAzCCR3efsvdB7JDWMo19sbFRbS33OTJ8AmG0=
X-Received: by 2002:a1f:1bc6:: with SMTP id b189mr19231679vkb.15.1633427830840;
 Tue, 05 Oct 2021 02:57:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210914142315.26596-1-semen.protsenko@linaro.org> <6efec37b-4392-dffe-1bda-d4f7aac6643f@canonical.com>
In-Reply-To: <6efec37b-4392-dffe-1bda-d4f7aac6643f@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Tue, 5 Oct 2021 12:56:59 +0300
Message-ID: <CAPLW+4nJ6yumqRC8YqUSVaWJSWrfj+fjWRTe0Opc1qa2L=F6+A@mail.gmail.com>
Subject: Re: [PATCH] tty: serial: samsung: Improve naming for common macro
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 15 Sept 2021 at 10:28, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 14/09/2021 16:23, Sam Protsenko wrote:
> > Having "_USI" suffix in EXYNOS_COMMON_SERIAL_DRV_DATA_USI() macro is
> > confusing. Rename it to just EXYNOS_COMMON_SERIAL_DRV_DATA() and provide
> > USI registers availability for all Exynos variants instead.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> >  drivers/tty/serial/samsung_tty.c | 11 ++++-------
> >  1 file changed, 4 insertions(+), 7 deletions(-)>
> > diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
> > index e2f49863e9c2..542b7e2b99dc 100644
> > --- a/drivers/tty/serial/samsung_tty.c
> > +++ b/drivers/tty/serial/samsung_tty.c
> > @@ -2780,7 +2780,7 @@ static struct s3c24xx_serial_drv_data s5pv210_serial_drv_data = {
> >  #endif
> >
> >  #if defined(CONFIG_ARCH_EXYNOS)
> > -#define EXYNOS_COMMON_SERIAL_DRV_DATA_USI(_has_usi)          \
> > +#define EXYNOS_COMMON_SERIAL_DRV_DATA(_has_usi)                      \
> >       .info = &(struct s3c24xx_uart_info) {                   \
> >               .name           = "Samsung Exynos UART",        \
> >               .type           = TYPE_S3C6400,                 \
> > @@ -2804,21 +2804,18 @@ static struct s3c24xx_serial_drv_data s5pv210_serial_drv_data = {
> >               .has_fracval    = 1,                            \
> >       }                                                       \
> >
> > -#define EXYNOS_COMMON_SERIAL_DRV_DATA                                \
> > -     EXYNOS_COMMON_SERIAL_DRV_DATA_USI(0)
> > -
> >  static struct s3c24xx_serial_drv_data exynos4210_serial_drv_data = {
> > -     EXYNOS_COMMON_SERIAL_DRV_DATA,
> > +     EXYNOS_COMMON_SERIAL_DRV_DATA(0),
> >       .fifosize = { 256, 64, 16, 16 },
> >  };
> >
> >  static struct s3c24xx_serial_drv_data exynos5433_serial_drv_data = {
> > -     EXYNOS_COMMON_SERIAL_DRV_DATA,
> > +     EXYNOS_COMMON_SERIAL_DRV_DATA(0),
> >       .fifosize = { 64, 256, 16, 256 },
> >  };
> >
> >  static struct s3c24xx_serial_drv_data exynos850_serial_drv_data = {
> > -     EXYNOS_COMMON_SERIAL_DRV_DATA_USI(1),
>
> Makes sense, although I would prefer to have here true or false. More
> obvious. Otherwise "1" looks like counter/number for some property.
>
> The has_usi field in struct could be then also converted to bool.
>

No problem, will send v2 shortly.

>
> Best regards,
> Krzysztof
