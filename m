Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B821641DA1F
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 30 Sep 2021 14:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350994AbhI3Mq6 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 30 Sep 2021 08:46:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350996AbhI3Mq4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Sep 2021 08:46:56 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A219C06176F
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Sep 2021 05:45:14 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id w29so9839236wra.8
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Sep 2021 05:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=FR0+kEOcKlq7l4rpUaA/sQX17u3kFeNcfk9lelXlWEg=;
        b=U5wgRFM2oZNKQCdACVEnN/PY1pazGShIczlxnlmZx77O+N263dqplEctt/sQaZHpOD
         hlEcsVqUiTyndbmwPYlr8m3ythPO1FonbuXbGLTb7KuQG3Ck0udU2uwoxhTad5ZQr4NP
         UdukK7mP5VsgGx+KI0lVPyb5Xm7Uzc8x0kF4I9hpcPCkn7eAnxkWjNN9bZRgOFBGs1QM
         zenKRBko2C2y0uoROOW+rGj6WIB1ZPFumOLUC7a2TYFR9DhJmNxDO/wELyWA6VIqhzLp
         ZQ1rXUpnhN/7DeYdfeTKevHyMD4bW3NNzNCQl4UpVd22FMfamW1VNwGN9l/hQxtrxUpe
         FArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=FR0+kEOcKlq7l4rpUaA/sQX17u3kFeNcfk9lelXlWEg=;
        b=y4lq9MC88haUo9tqPKMkVYKwEwAtuVqJZmCeHAxif0jAkAUfcm4v5ZrKjwi+p3gXkc
         LmSLDhbRuzBsAGsHohHwir+x8Y5BoukTJfIlq/M4RHMvmOhemlVcrpZn95TcKt+a/dKg
         g3uzDbPRBv2bje+qMNPjvTjBpFpkc0Q5JGntNpTcwGI7lAOPYT1z9IvB5EKxq7WDaNYa
         GfTsUigHSgyth/hQcHNf2lprAYLVxnHGYhRrjhDSCLoUfYQuzc01qGqEvgULPNka2xzx
         BqQDLD+zvBSuH3nI5PRkex1FvUwvvVWqYKS+njolRXZxxtA8ydnDAYXmm8XjG1VixBqx
         dVoA==
X-Gm-Message-State: AOAM5321TukkQz3H/uKc90wHPpsWmLti/kZZogcaxBmdRWCmVRrmVLHo
        q51LgSbQKdx4uRo0+UcL3XnrSg==
X-Google-Smtp-Source: ABdhPJw7iEWw4B+SZSgxwLpkc1ZayA38d1mLm4WfjWyxrEfNNMijUBsKT774geAQAwuuaPz5baAPYw==
X-Received: by 2002:a5d:400b:: with SMTP id n11mr6039318wrp.317.1633005912605;
        Thu, 30 Sep 2021 05:45:12 -0700 (PDT)
Received: from google.com ([95.148.6.233])
        by smtp.gmail.com with ESMTPSA id g1sm5214172wmk.2.2021.09.30.05.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 05:45:12 -0700 (PDT)
Date:   Thu, 30 Sep 2021 13:45:10 +0100
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
Message-ID: <YVWxVr92tIvww7kR@google.com>
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com>
 <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <c65bf0db-6fd1-eb05-f407-37c41f9125f4@canonical.com>
 <YVWCK5QO331rfhJJ@google.com>
 <CA+Ln22EbXKsRFZ=3L4A_jqciRxG2hnAh9iKTfQ_Ypr2NJgDzQQ@mail.gmail.com>
 <YVWkxnc8wTdBgRsv@google.com>
 <CA+Ln22FBy2ks9gX3df=rQw-6W3iftMVoqsoqBPchGCqDDoMaLg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+Ln22FBy2ks9gX3df=rQw-6W3iftMVoqsoqBPchGCqDDoMaLg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 30 Sep 2021, Tomasz Figa wrote:

> 2021年9月30日(木) 20:51 Lee Jones <lee.jones@linaro.org>:
> >
> > On Thu, 30 Sep 2021, Tomasz Figa wrote:
> >
> > > 2021年9月30日(木) 18:23 Lee Jones <lee.jones@linaro.org>:
> > > >
> > > > I've taken the liberty of cherry-picking some of the points you have
> > > > reiteratted a few times.  Hopefully I can help to address them
> > > > adequently.
> > > >
> > > > On Thu, 30 Sep 2021, Krzysztof Kozlowski wrote:
> > > > > Reminder: these are essential drivers and all Exynos platforms must have
> > > > > them as built-in (at least till someone really tests this on multiple
> > > > > setups).
> > > >
> > > > > Therefore I don't agree with calling it a "problem" that we select
> > > > > *necessary* drivers for supported platforms. It's by design - supported
> > > > > platforms should receive them without ability to remove.
> > > >
> > > > > The selected drivers are essential for supported platforms.
> > > >
> > > > SoC specific drivers are only essential/necessary/required in
> > > > images designed to execute solely on a platform that requires them.
> > > > For a kernel image which is designed to be generic i.e. one that has
> > > > the ability to boot on vast array of platforms, the drivers simply
> > > > have to be *available*.
> > > >
> > > > Forcing all H/W drivers that are only *potentially* utilised on *some*
> > > > platforms as core binary built-ins doesn't make any technical sense.
> > > > The two most important issues this causes are image size and a lack of
> > > > configurability/flexibility relating to real-world application i.e.
> > > > the one issue we already agreed upon; H/W or features that are too
> > > > new (pre-release).
> > > >
> > > > Bloating a generic kernel with potentially hundreds of unnecessary
> > > > drivers that will never be executed in the vast majority of instances
> > > > doesn't achieve anything.  If we have a kernel image that has the
> > > > ability to boot on 10's of architectures which have 10's of platforms
> > > > each, that's a whole host of unused/wasted executable space.
> > > >
> > > > In order for vendors to work more closely with upstream, they need the
> > > > ability to over-ride a *few* drivers to supplement them with some
> > > > functionality which they believe provides them with a competitive edge
> > > > (I think you called this "value-add" before) prior to the release of a
> > > > device.  This is a requirement that cannot be worked around.
> > >
> > > [Chiming in as a clock driver sub-maintainer and someone who spent a
> > > non-insignificant part of his life on SoC driver bring-up - not as a
> > > Google employee.]
> > >
> > > I'd argue that the proper way for them to achieve it would be to
> > > extend the upstream frameworks and/or existing drivers with
> > > appropriate APIs to allow their downstream modules to plug into what's
> > > already available upstream.
> >
> > Is that the same as exporting symbols to framework APIs?
> >
> > Since this is already a method GKI uses to allow external modules to
> > interact with the core kernel/frameworks.  However, it's not possible
> > to upstream these without an upstream user for each one.
> 
> Not necessary the core frameworks, could also be changing the ways the
> existing drivers register to allow additional drivers to extend the
> functionality rather than completely overwrite them. It's really hard
> to tell what the right way would be without knowing the exact things
> they find missing in the upstream drivers. As for upstream users, this
> is exactly the point - upstream is a bidirectional effort, one takes
> from it and should contribute things back.
> 
> Generally, the subsystems being mentioned here are so basic (clock,
> pinctrl, rtc), that I really can't imagine what kind of rocket science
> one might want to hide for competitive reasons... If it's for an
> entire SoC, I wonder why Intel and AMD don't have similar concerns and
> contribute support for their newest hardware far before the release.

I don't have visibility into the driver-overrides I'm afraid.

I do know that code-space can be a problem though.  So any way we can
make the core binary smaller (i.e. remove anything that can be built
as a module) will have a positive effect.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
