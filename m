Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C5034336E2
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 19 Oct 2021 15:20:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235872AbhJSNXK (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 19 Oct 2021 09:23:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235763AbhJSNXJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 19 Oct 2021 09:23:09 -0400
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35EE4C061745
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Oct 2021 06:20:57 -0700 (PDT)
Received: by mail-ua1-x936.google.com with SMTP id u5so13654779uao.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Oct 2021 06:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yakjl3k2K+eVxhNNWDfRDoKIqXUztjprPOzVgOncdWQ=;
        b=zkN1LOShPIaJLCCuJKUVdZXh8rfBKPDQq7AQULRZLfLQfG4UW0nnf6Ly3xtLBJlTU9
         iM0ceOmIGLZcBdyt0cQqrkWmdpgUFVAyoXrHS6zozluOWh62tgUkpmh54su7Ck8U2oIt
         wOU+c/ISp3063otRZJKkJ7nxC0rw+SFfhkvNR6HJgwFFJV7/N6sfQFp2Xp4+oVq/9ZPV
         Mu3EkqEprpIVcuQsE9XjwHNsidgTeLs5AaXMdyzWtlqjVG8zebe/Jg/iCMRxOlWKFU7Q
         Pv5TTAI3NG7mqhEwNocdQOC0Ziw0xP3r98/0TwFWpsWeH5Fbko1Bk4Rz76jhito2YnEX
         DbEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yakjl3k2K+eVxhNNWDfRDoKIqXUztjprPOzVgOncdWQ=;
        b=NZHzE22JyBhL+SCI7OJowJeXoTlHZty8SF/xDcnLM/P4hfxoilBjyAiDpnSHA5vMa6
         J0gAXyC6VUyKAKls5mybsH1mbRVXXkTC8sThgDMyEIpu013EtWpBk/d9xXudSqqsinPw
         1lu3JNCdeImhhDjDP9NGXT2BJCwYRDkVNb5UMgDcLVSLW8HcszVlUuRF2yyKTcu8uBIE
         POOmLK3gdKRtUN+kryPZzippG+0ejAXzY6RP1cFgfhKNUt6V2mRmEalVK7KYyDPBlKd1
         5cRzWnsrb7TCqKihD6CXwpzu8u8dPJx61HrWUKsKPenkXEM16hsIDBgPKKJGYzi8WMwD
         9s9w==
X-Gm-Message-State: AOAM531F40cqJO+gE9X/FXZ2BBPA/PRyYjq6kOTrI3PX1BvR6Zawl1YB
        BzDtyGcCakRLVpsE7ioaN1U+A0+PYMFrI2SohfUyMF094W7PfItc
X-Google-Smtp-Source: ABdhPJzEXTNc1bgO5xY3Fz7Wp7BiIO+u3gIQlsaK3t6XTvo2QR/edpc1j0onYDbLRZc+kiVFbJ88kbsY/xppDBq4YeE=
X-Received: by 2002:a67:1781:: with SMTP id 123mr35032706vsx.1.1634649656361;
 Tue, 19 Oct 2021 06:20:56 -0700 (PDT)
MIME-Version: 1.0
References: <20211018173201.2166-1-semen.protsenko@linaro.org> <YW3DjEuszEZ1Uw6/@piout.net>
In-Reply-To: <YW3DjEuszEZ1Uw6/@piout.net>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Tue, 19 Oct 2021 16:20:45 +0300
Message-ID: <CAPLW+4mLdu-QGhhpFMsMK-GCS9vY9r-L0NnjyijtohfeRSiC3g@mail.gmail.com>
Subject: Re: [PATCH] rtc: s3c: Remove usage of devm_rtc_device_register()
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-rtc@vger.kernel.org,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 18 Oct 2021 at 21:57, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 18/10/2021 20:32:01+0300, Sam Protsenko wrote:
> > devm_rtc_device_register() is deprecated. Use devm_rtc_allocate_device()
> > and devm_rtc_register_device() API instead.
> >
>
> If you do that, please also set the range properly, either in the same
> patch or as a follow-up.
>

No problem. Just sent patch series [1], which supersedes this one.
Time range setting is present there in [PATCH 2/4].

[1] https://lkml.org/lkml/2021/10/19/632

> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> >  drivers/rtc/rtc-s3c.c | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> > index e57d3ca70a78..10e591794276 100644
> > --- a/drivers/rtc/rtc-s3c.c
> > +++ b/drivers/rtc/rtc-s3c.c
> > @@ -447,15 +447,18 @@ static int s3c_rtc_probe(struct platform_device *pdev)
> >
> >       device_init_wakeup(&pdev->dev, 1);
> >
> > -     /* register RTC and exit */
> > -     info->rtc = devm_rtc_device_register(&pdev->dev, "s3c", &s3c_rtcops,
> > -                                          THIS_MODULE);
> > +     info->rtc = devm_rtc_allocate_device(&pdev->dev);
> >       if (IS_ERR(info->rtc)) {
> > -             dev_err(&pdev->dev, "cannot attach rtc\n");
> >               ret = PTR_ERR(info->rtc);
> >               goto err_nortc;
> >       }
> >
> > +     info->rtc->ops = &s3c_rtcops;
> > +
> > +     ret = devm_rtc_register_device(info->rtc);
> > +     if (ret)
> > +             goto err_nortc;
> > +
> >       ret = devm_request_irq(&pdev->dev, info->irq_alarm, s3c_rtc_alarmirq,
> >                              0, "s3c2410-rtc alarm", info);
> >       if (ret) {
> > --
> > 2.30.2
> >
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
