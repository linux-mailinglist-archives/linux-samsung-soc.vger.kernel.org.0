Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 951A4332AC1
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  9 Mar 2021 16:41:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231817AbhCIPk1 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 9 Mar 2021 10:40:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231663AbhCIPkW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 9 Mar 2021 10:40:22 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78F03C06174A
        for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Mar 2021 07:40:21 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id 2so21233051ljr.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Mar 2021 07:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lu+kK3nSAEUTNwnDM4pW2WC6uWJJmrapOL1I+PVvtnU=;
        b=RGZPUNMxbSls/6ut21Ur6KbghdWogF4sL+NXMIA9cKyeKwNKL0Hz0mhyFsSXv/OBtb
         jnTPF5TJwRfP2h3ns1CWqPwbvZ4FlR8eSaemHeyxekynGvXftNVUqM65k0VzJehBmDiy
         owGLAG6He59RMMoToMWvTXpswEBmJpDEWhPBCvrtWjGEFW10PpYT6vEhruku3/ccszps
         RiZ0KG+sggU/vWnMvLxnqun6CIJ+9PI9QkRuasLDeWjdRis4tG9zoBRBzMgZyJc7uNlS
         tDF2cw3jmG11uhRjhoVDbmrssDArdZ/i28IYjqFlv8rJaqbzR0I9MClkeGzwb4zyqUyh
         kn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lu+kK3nSAEUTNwnDM4pW2WC6uWJJmrapOL1I+PVvtnU=;
        b=WE1nVaJ27miFTsG42ps3V0rSJyJeXfMerKPh6AfWF4c9BWZTVqEQO5+CQXE/WA4zx0
         fvm291ZW+mngenKhr5wemhiytv3eftiGzqJbdElAJcFkyn/RmxV7KvJvm+neV87+M39L
         rGE/fCDwbMe5WEgj9RENFcBQe3eZ8LuqTW3Sdp5qFx6FcJ0nojN1sS8N1zsdpOrLHbwR
         XHXjhFzS2C2LHCyo+GpMlsGYRuF5GJJKCpPx4kAVL2J+DJFNVFY9dluaTAWBeoVxVYj/
         tkFAjL6RJDblCDaVVyqUUmwXoFtgNkyqCf8Z6jbCQRReKQzhMSMP/is2nhopkT9iMQjt
         tbjQ==
X-Gm-Message-State: AOAM532AepHzUK/AN+X/0b5c6QwvJIYVkG8uuwpo4JQys3ISO9CiOidN
        lFaE0FVmqhQEtqsUb65GGC8Mug+bc0HvGtdeTRWQyg==
X-Google-Smtp-Source: ABdhPJwEI7sL2ZOe/ozOi+pJFvTfLuJFts7EVCGgPZapWZODVntgxp5IN5ZQc/HGdbEc0f45tW7JoT/HzKQUQHQUuLQ=
X-Received: by 2002:a2e:864a:: with SMTP id i10mr16814623ljj.467.1615304420049;
 Tue, 09 Mar 2021 07:40:20 -0800 (PST)
MIME-Version: 1.0
References: <20210304213902.83903-1-marcan@marcan.st> <20210304213902.83903-13-marcan@marcan.st>
 <CAL_JsqJF2Hz=4U7FR_GOSjCxqt3dpf-CAWFNfsSrDjDLpHqgCA@mail.gmail.com>
 <6e4880b3-1fb6-0cbf-c1a5-7a46fd9ccf62@marcan.st> <CAK8P3a0Hmwt-ywzS-2eEmqyQ0v2SxLsLxFwfTUoWwbzCrBNhsQ@mail.gmail.com>
 <CAL_JsqJHRM59GC3FjvaGLCELemy1uspnGvTEFH6q0OdyBPVSjA@mail.gmail.com>
 <CAK8P3a0_GBB-VYFO5NaySyBJDN2Ra-WMH4WfFrnzgOejmJVG8g@mail.gmail.com>
 <20210308211306.GA2920998@robh.at.kernel.org> <CACRpkdZd_PU-W37szfGL7J2RYWhZzXdX342vt93H7mWXdh5iHA@mail.gmail.com>
 <CAK8P3a104VXhPHuWaJVEw3uMEp3rSEHsFJ6w2sW4FhNjiQ2VQQ@mail.gmail.com>
In-Reply-To: <CAK8P3a104VXhPHuWaJVEw3uMEp3rSEHsFJ6w2sW4FhNjiQ2VQQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Mar 2021 16:40:09 +0100
Message-ID: <CACRpkdYSFGF1crqDnwB_UbEXV8q5xqx7n8VHCyKYjCpy1PMK8A@mail.gmail.com>
Subject: Re: [RFT PATCH v3 12/27] of/address: Add infrastructure to declare
 MMIO as non-posted
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, Hector Martin <marcan@marcan.st>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Marc Zyngier <maz@kernel.org>, Olof Johansson <olof@lixom.net>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Tony Lindgren <tony@atomide.com>,
        Mohamed Mediouni <mohamed.mediouni@caramail.com>,
        Stan Skowronek <stan@corellium.com>,
        Alexander Graf <graf@amazon.com>,
        Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Hellwig <hch@infradead.org>,
        "David S. Miller" <davem@davemloft.net>,
        DTML <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:GENERIC INCLUDE/ASM HEADER FILES" 
        <linux-arch@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Mar 9, 2021 at 1:41 PM Arnd Bergmann <arnd@kernel.org> wrote:

> - A driver writer may want to choose between posted and
>   nonposted mmio based on performance considerations:
>   if writes are never serialized, posted writes should always
>   be faster. However, if the driver uses a spinlock to serialize
>   writes, then a nonposted write is likely faster than a posted
>   write followed by a read that serializes the spin_unlock.
>   In this case we want the driver to explicitly pick one over
>   the other, and not have rely on bus specific magic.

OK then I am all for having drivers explicitly choose access
method. Openness to speed optimization is a well established
Linux kernel design principle.

Yours,
Linus Walleij
