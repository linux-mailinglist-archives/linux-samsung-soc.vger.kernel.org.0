Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E98FB4607D4
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 28 Nov 2021 18:06:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358663AbhK1RJe (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 28 Nov 2021 12:09:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358717AbhK1RHd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 28 Nov 2021 12:07:33 -0500
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23B8DC0613FA
        for <linux-samsung-soc@vger.kernel.org>; Sun, 28 Nov 2021 09:03:17 -0800 (PST)
Received: by mail-vk1-xa2a.google.com with SMTP id m16so8408994vkl.13
        for <linux-samsung-soc@vger.kernel.org>; Sun, 28 Nov 2021 09:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BY3oht+y8HrGDIiA0mto2rflEOHEoMX+CLpzHXZf2nA=;
        b=isEtZ0KqXs7KwQiyrUe6920AusXIYyZ3lAycqrX8wlYMxZzrktdUryhup02VI1Fc9m
         6RbwZfK5VEwmxi4UjWRmZWbt303aROEHrxkJJaNuODRMse9Ohe1/XfcUA2kKvpqE/UhR
         RbvvxfS7z6qb3X5YjlkfRE/T60Xju+cO7p9YyQj6EXdMEqvWjpSSGjY7+8CraHpfL2aA
         ffanPd/1CCgvM5Qlb7yHtQ4jsRvgFbvogD1YtoQrtwx8TwfczmVqEphgtQg/Mw4op13n
         xhf2K4LG1zddQ8cTqaUD7GGqrYRoeY6Irx5UZc4QfFAbdWaoCrgQ8/GT2dQ3C6PBrKqL
         g4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BY3oht+y8HrGDIiA0mto2rflEOHEoMX+CLpzHXZf2nA=;
        b=g+mfFK4g5kAx5UhJXtcRmmWb3+7dTxI4jAC1N8JLXYLs6DjctpIjSuw3WwvDRjoRW4
         JEEoMFVhm07IUAxNqRNNzttDYOOqPenDVqZWOoHWbCOmS9i2WiboDy8yVqnrbuBF5jvr
         B6hzRN9q072HczvMGbpNmTOBqrwbddv/etNmlTo2Fe5cskTBP7dlKk/4le6rSZcBxz5Z
         UMpJtwUca9PweCBjC2zDf/GIIfyLo2lBe227T9odNzi7eg3acMtOUwQb3q74N964uzTu
         9putq7xazZYU9/Ly3BMfIiytCj7V3J1tJSf3MqQe2AXct3vymxgiRS58oPur06iaSkRk
         aMAw==
X-Gm-Message-State: AOAM530HON4m5bZa+F/caASUvBjVQf9hJrJ2JjDJReyUJVxinyQMRT9Z
        gnNXCVXneedmCziHHih0ttFCtmjHfYy/aRi6DDfJWYyOnqR3JGSF
X-Google-Smtp-Source: ABdhPJzWijuBwUQuP+Vndk1T+sepX2T8/WmWaWQfnWsOR0CMc9FuYs9zuujxjQxRb2Guzz9nNOvUpGArHq0GRwbXUxw=
X-Received: by 2002:a1f:2849:: with SMTP id o70mr25716022vko.35.1638118996213;
 Sun, 28 Nov 2021 09:03:16 -0800 (PST)
MIME-Version: 1.0
References: <20211127223253.19098-1-semen.protsenko@linaro.org>
 <20211127223253.19098-5-semen.protsenko@linaro.org> <YaOR+TbcR1V4ovf/@kroah.com>
 <CAPLW+4mG8AMPCXGWYwURVJhCw0Cv=mYYzNAZf0i7akVcqc384w@mail.gmail.com>
In-Reply-To: <CAPLW+4mG8AMPCXGWYwURVJhCw0Cv=mYYzNAZf0i7akVcqc384w@mail.gmail.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Sun, 28 Nov 2021 19:03:05 +0200
Message-ID: <CAPLW+4k9OAdcg8XcTbazV_470mFw3x61_UakoR-qNHo5C8et_g@mail.gmail.com>
Subject: Re: [PATCH 4/8] tty: serial: samsung: Remove USI initialization
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, 28 Nov 2021 at 18:26, Sam Protsenko <semen.protsenko@linaro.org> wrote:
>
> On Sun, 28 Nov 2021 at 16:28, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Sun, Nov 28, 2021 at 12:32:49AM +0200, Sam Protsenko wrote:
> > > USI control is now extracted to dedicated USIv2 driver. Remove USI
> > > related code from serial driver to avoid conflicts and code duplication.
> >
> > What conflicts?
> >
>
> There might be possible conflicts when accessing the same USI register
> from both serial driver and USIv2 driver. Also there will be conflicts
> when trying to access the same I/O address space in those both
> drivers.
>
> > What duplication?  All you did here was delete code.
> >
>
> It's all explained in [PATCH 0/8], but long story short, I've added
> USIv2 driver (in this series) which handles the code that's removed
> from serial driver in this patch.
>

In other words, this code is now present here: [1]. But of course
USIv2 driver must be applied first, and then this patch (removing the
same code from serial driver). That's why it's in the same series and
it's placed after USIv2 driver ([PATCH 3/8]).

[1] https://patchwork.kernel.org/project/linux-samsung-soc/patch/20211127223253.19098-4-semen.protsenko@linaro.org/

> > confused,
> >
> > greg k-h
