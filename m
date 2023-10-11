Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86AC47C572F
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 11 Oct 2023 16:43:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235041AbjJKOn2 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 11 Oct 2023 10:43:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234905AbjJKOn1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 11 Oct 2023 10:43:27 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 750F39D
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Oct 2023 07:43:24 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-d8168d08bebso7281615276.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Oct 2023 07:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697035403; x=1697640203; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QHSGgNwplrQByUQEFDMoiW6T88xkz7+Z7CzZX4tel1c=;
        b=del6lvyz8L/ympiDcQdKBYdjBpFmPkmZ7Hr6GrQOkREWEDZcGYfYb4WMWOZLH2TMts
         o6WSTmSS2ny1c1H8OSRu1fyqeJdqcYrklcELEuMoEC/sPc3oTqdvu0GX+GckmWgNEgez
         3pyiWkpYVMugu6DSqC3J1iqh2se1SgoYzuspzkGnh7sY7z81mwf66lE/QrIisDhxRsvZ
         DLpLxRIFzTqKNMpCukYEsAJhnfZHF5ntiGCUmiSLQbWUpEKqxwlENPyS2GMU3P47Xick
         mXWSkcVyTq0b4ML0CCwo/ZZu8n4tBWcLA+dAjCL6ZVWDVQQIJz2rV2Skmm8kIQRzLCxO
         LWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697035403; x=1697640203;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QHSGgNwplrQByUQEFDMoiW6T88xkz7+Z7CzZX4tel1c=;
        b=ATtFwfUl7bH1R0nmF9+35wCSTq562bTasnqlhhBY1rqTtlQX1U3BXkuG12Zoa+1kho
         iDYKTTr0nFRDafKoChOcz4C6WenL5OSWUD6Mho6FjRhcj/5qVj/lS9//P/2AdkC+bB7h
         3nnsxs700TBhlTeNfUL/cQY6wRM3Aszu/CRkwZ4NKEyXiNcNz7pYhz9Tjr4E9+J8iIJD
         ZzKvf862xwHn/qKQIWNJRiazpoObipa1K4qWAqTRbcYQHVCq85F8/pHo7UwhEp2UHlh3
         Ei0dsQqU/JuwpXOE+woPJpIpxRKiMQjge5Ex8i+fc999I8gE0f2kccS+0X7CS8lZniaL
         Z9NQ==
X-Gm-Message-State: AOJu0YxoeQEaSsYa52/9ndkYlpqrAdnjoWQTi75Oum3PZ8rzgvHV3kW+
        VCrkPUfMKCUKgDmi05cgz1B2jmwvk5zWo39qKmTYnQ==
X-Google-Smtp-Source: AGHT+IG6ejFYIQqSBlCuZeoLJFdvXD5HM2pcfGye3trv5p0ja9AYy6Vps/U8uovRHfUX5MkuYivucvBJhgbz9bJ3CCY=
X-Received: by 2002:a25:5d1:0:b0:d9a:501e:95d7 with SMTP id
 200-20020a2505d1000000b00d9a501e95d7mr4970434ybf.8.1697035403592; Wed, 11 Oct
 2023 07:43:23 -0700 (PDT)
MIME-Version: 1.0
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
 <20231010224928.2296997-16-peter.griffin@linaro.org> <e2320e90-5e3b-4b50-8af9-56dee639d022@roeck-us.net>
In-Reply-To: <e2320e90-5e3b-4b50-8af9-56dee639d022@roeck-us.net>
From:   Peter Griffin <peter.griffin@linaro.org>
Date:   Wed, 11 Oct 2023 15:43:12 +0100
Message-ID: <CADrjBPoaG2XPx-hrxXAVj9xFQeCPJrJMX0sM-cOkv0gRV=zAOw@mail.gmail.com>
Subject: Re: [PATCH v2 15/20] watchdog: s3c2410_wdt: Add support for Google
 tensor SoCs
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Guenter,

Thanks for your review.

On Wed, 11 Oct 2023 at 00:56, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Tue, Oct 10, 2023 at 11:49:23PM +0100, Peter Griffin wrote:
> > This patch adds the compatibles and drvdata for the Google
> > gs101 & gs201 SoCs found in Pixel 6 and Pixel 7 phones. Similar
> > to Exynos850 it has two watchdog instances, one for each cluster
> > and has some control bits in PMU registers.
> >
> > The watchdog IP found in gs101 SoCs also supports a few
> > additional bits/features in the WTCON register which we add
> > support for and an additional register detailed below.
> >
> > dbgack-mask - Enables masking WDT interrupt and reset request
> > according to asserted DBGACK input
> >
> > windowed-mode - Enabled Windowed watchdog mode
> >
> > Windowed watchdog mode also has an additional register WTMINCNT.
> > If windowed watchdog is enabled and you reload WTCNT when the
> > value is greater than WTMINCNT, it prompts interrupt or reset
> > request as if the watchdog time has expired.
>
> I am a bit lost with this one. The patch adds QUIRK_HAS_WTMINCNT_REG
> but doesn't use it. It also adds S3C2410_WTMINCNT but does not use it
> either.
>
> What is the point of doing that ? It is just confusing.

Good spot, it seems I lost a few hunks from this patch at some point, sorry
about that. I will update and send a v3.

regards,

Peter.
