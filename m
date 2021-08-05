Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 911B13E0F31
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  5 Aug 2021 09:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232409AbhHEHav (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 5 Aug 2021 03:30:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:38408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231499AbhHEHau (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Aug 2021 03:30:50 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0812960F58;
        Thu,  5 Aug 2021 07:30:37 +0000 (UTC)
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1mBXpr-0034o3-4w; Thu, 05 Aug 2021 08:30:35 +0100
Date:   Thu, 05 Aug 2021 08:30:30 +0100
Message-ID: <87zgtwbb6x.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Subject: Re: [PATCH 12/12] arm64: dts: exynos: Add Exynos850 SoC support
In-Reply-To: <e264f96e-a230-456b-08a5-dbe3a31bdb43@canonical.com>
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
        <20210730144922.29111-13-semen.protsenko@linaro.org>
        <15871f8ced3c757fad1ab3b6e62c4e64@misterjones.org>
        <CAPLW+4=v4bDcuxGVqs06mobGj34At4cD+vg48b4dPujarS07Tg@mail.gmail.com>
        <bf21badb-804f-45f0-c02b-80ff57ab9931@canonical.com>
        <CAPLW+4nY=hozOR+B_0sPZODrk9PXaXg+NB-9pVhDbAjEy7yjhg@mail.gmail.com>
        <e264f96e-a230-456b-08a5-dbe3a31bdb43@canonical.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: krzysztof.kozlowski@canonical.com, semen.protsenko@linaro.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, linus.walleij@linaro.org, tomasz.figa@gmail.com, robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com, jirislaby@kernel.org, gregkh@linuxfoundation.org, ckeepax@opensource.wolfsonmicro.com, ryu.real@samsung.com, tom.gall@linaro.org, sumit.semwal@linaro.org, john.stultz@linaro.org, amit.pundir@linaro.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 05 Aug 2021 08:17:14 +0100,
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote:
> 
> On 04/08/2021 23:30, Sam Protsenko wrote:
> >>>
> >>> Nice catch! Actually there is an error (typo?) in SoC's TRM, saying
> >>> that Virtual Interface Control Register starts at 0x3000 offset (from
> >>> 0x12a00000), where it obviously should be 0x4000, that's probably
> >>> where this dts error originates from. Btw, I'm also seeing the same
> >>> error in exynos7.dtsi.
> >>
> >> What's the error exactly? The "Virtual interface control register"
> >> offset (3rd region) is set properly to 0x4000 on Exynos7. Also one for
> >> the Exynos5433 looks correct.
> >>
> > 
> > The issue is that 2nd region's size is 0x1000, but it must be 0x2000.
> > It's defined by GIC-400 architecture, as I understand. Please look at
> > [1], table 3-1 has very specific offsets and sizes for each functional
> > block, and each particular SoC must adhere to that spec. So having
> > 0x1000 for 2nd region can't be correct. And because exynos7.dtsi has
> > GIC-400 as well, and 0x1000 is specified there for 2nd region size
> > too, so I presume there is the same mistake there.
> 
> I understand, the range length has indeed same mistake. However it does
> not matter that much There are no registers pass 0x10C (so pass 0x1000).
> This address space is not used.

I have no idea which spec you are looking at, but the GICv2
architecture (of which GIC400 is an implementation) definitely has a
register in the second 4kB page of the CPU interface. It contains the
GICC_DIR register, which is used to deactivate an interrupt when
EOIMode==1.

Linux actively uses it when started at EL2.

	M.

-- 
Without deviation from the norm, progress is not possible.
