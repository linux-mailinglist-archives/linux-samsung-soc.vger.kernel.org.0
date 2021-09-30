Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06F8C41D91C
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 30 Sep 2021 13:51:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350634AbhI3LxW (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 30 Sep 2021 07:53:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350526AbhI3LxV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Sep 2021 07:53:21 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21CEDC06176F
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Sep 2021 04:51:39 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id m22so4137154wrb.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Sep 2021 04:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=xlLchu9pA+HRuQy8Eh7M3MggbaSXnYTP34T1WmzkkE0=;
        b=axY0QMNME8v2dkmouaen9wXhMHTziGIxO+d3340F3bqI30XnGOl9s11e9PQPj9B6CZ
         OL367phLiuLJ5gav9xVeJLM30zfF2SO0h7hI9Y8ZvfRQTlfSoQcgv2T3RrhAwE2RrFIO
         O85fkjz3VPpjbw4b073M7Ef91b85Z6X7ZHiqLXSXBRuTBxxkxoCV2mKyeZWHjwg6pzX4
         5ieLzIZXyVyCKUj9ytGX1phVaaUeuJ6QCcZckMwGYCSLmJ1dlyk2Fta5Cx5DePvFMlgI
         ekL9QU9TXEW/VD8pMjE8tGTe3qvoiy3LKbJ8I/YMXozS+ANaV4A+9Ds2WVmxtfOEGffL
         XfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=xlLchu9pA+HRuQy8Eh7M3MggbaSXnYTP34T1WmzkkE0=;
        b=Q+9o74K+zygmaazm3pBDiQOmPF1i31saboYA6TZjASWla1x2L/xqfJsgs5+sEcV8CM
         Vdb4NehwEaUALyaAr8ero2aLR2xC1mgQdOo5uY3RK3rEbgJaWTmfC93HcJxrVf0QGJrp
         kOqVU5f/rnOVD5E6/5O1Up/dgeDrDvQOPL7Arsa3tJZ3aFUMBiYtiD6TjZbLxaVxuTmR
         EYtbayVOU937VwyLawJio7r2QZ3gsSqO15/+BcXCB/SR0IYPhJ7bitwJG/G90n5trZLs
         0HhK5eO2rhL3swdYnuhk9YbqL8yxxuMsi6fLiKLTB+C9K584rMtfSTx1EQc5x9h10dB6
         LgNQ==
X-Gm-Message-State: AOAM530qhVvAdvhzq2Zewmbho03p7sRh4PgY7+O5sIdgm5BYr/uoa0+z
        8Wj4SNcKivRIChkgbEmJSnnLnA==
X-Google-Smtp-Source: ABdhPJw6RauvPA4WRlAQf33JGSZercRIoTQP+mpY8LbAzU1BaQInNozmnGaoLT1BMaqQi4cuglILJQ==
X-Received: by 2002:a5d:47ad:: with SMTP id 13mr5741091wrb.77.1633002697676;
        Thu, 30 Sep 2021 04:51:37 -0700 (PDT)
Received: from google.com ([95.148.6.233])
        by smtp.gmail.com with ESMTPSA id y11sm3419023wrg.18.2021.09.30.04.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 04:51:37 -0700 (PDT)
Date:   Thu, 30 Sep 2021 12:51:34 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Tomasz Figa <tomasz.figa@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Will McVicker <willmcvicker@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Saravana Kannan <saravanak@google.com>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-rtc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select
 configs
Message-ID: <YVWkxnc8wTdBgRsv@google.com>
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com>
 <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <c65bf0db-6fd1-eb05-f407-37c41f9125f4@canonical.com>
 <YVWCK5QO331rfhJJ@google.com>
 <CA+Ln22EbXKsRFZ=3L4A_jqciRxG2hnAh9iKTfQ_Ypr2NJgDzQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+Ln22EbXKsRFZ=3L4A_jqciRxG2hnAh9iKTfQ_Ypr2NJgDzQQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 30 Sep 2021, Tomasz Figa wrote:

> 2021年9月30日(木) 18:23 Lee Jones <lee.jones@linaro.org>:
> >
> > I've taken the liberty of cherry-picking some of the points you have
> > reiteratted a few times.  Hopefully I can help to address them
> > adequently.
> >
> > On Thu, 30 Sep 2021, Krzysztof Kozlowski wrote:
> > > Reminder: these are essential drivers and all Exynos platforms must have
> > > them as built-in (at least till someone really tests this on multiple
> > > setups).
> >
> > > Therefore I don't agree with calling it a "problem" that we select
> > > *necessary* drivers for supported platforms. It's by design - supported
> > > platforms should receive them without ability to remove.
> >
> > > The selected drivers are essential for supported platforms.
> >
> > SoC specific drivers are only essential/necessary/required in
> > images designed to execute solely on a platform that requires them.
> > For a kernel image which is designed to be generic i.e. one that has
> > the ability to boot on vast array of platforms, the drivers simply
> > have to be *available*.
> >
> > Forcing all H/W drivers that are only *potentially* utilised on *some*
> > platforms as core binary built-ins doesn't make any technical sense.
> > The two most important issues this causes are image size and a lack of
> > configurability/flexibility relating to real-world application i.e.
> > the one issue we already agreed upon; H/W or features that are too
> > new (pre-release).
> >
> > Bloating a generic kernel with potentially hundreds of unnecessary
> > drivers that will never be executed in the vast majority of instances
> > doesn't achieve anything.  If we have a kernel image that has the
> > ability to boot on 10's of architectures which have 10's of platforms
> > each, that's a whole host of unused/wasted executable space.
> >
> > In order for vendors to work more closely with upstream, they need the
> > ability to over-ride a *few* drivers to supplement them with some
> > functionality which they believe provides them with a competitive edge
> > (I think you called this "value-add" before) prior to the release of a
> > device.  This is a requirement that cannot be worked around.
> 
> [Chiming in as a clock driver sub-maintainer and someone who spent a
> non-insignificant part of his life on SoC driver bring-up - not as a
> Google employee.]
> 
> I'd argue that the proper way for them to achieve it would be to
> extend the upstream frameworks and/or existing drivers with
> appropriate APIs to allow their downstream modules to plug into what's
> already available upstream.

Is that the same as exporting symbols to framework APIs?

Since this is already a method GKI uses to allow external modules to
interact with the core kernel/frameworks.  However, it's not possible
to upstream these without an upstream user for each one.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
