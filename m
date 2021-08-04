Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A9B43E03C4
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  4 Aug 2021 17:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237104AbhHDPBW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 4 Aug 2021 11:01:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:35142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231255AbhHDPBW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Aug 2021 11:01:22 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8D34D60D07;
        Wed,  4 Aug 2021 15:01:09 +0000 (UTC)
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1mBIOJ-002wYT-Gx; Wed, 04 Aug 2021 16:01:07 +0100
Date:   Wed, 04 Aug 2021 16:01:06 +0100
Message-ID: <87k0l1w8y5.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
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
In-Reply-To: <CAPLW+4=v4bDcuxGVqs06mobGj34At4cD+vg48b4dPujarS07Tg@mail.gmail.com>
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
        <20210730144922.29111-13-semen.protsenko@linaro.org>
        <15871f8ced3c757fad1ab3b6e62c4e64@misterjones.org>
        <CAPLW+4=v4bDcuxGVqs06mobGj34At4cD+vg48b4dPujarS07Tg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: semen.protsenko@linaro.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, krzysztof.kozlowski@canonical.com, linus.walleij@linaro.org, tomasz.figa@gmail.com, robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com, jirislaby@kernel.org, gregkh@linuxfoundation.org, ckeepax@opensource.wolfsonmicro.com, ryu.real@samsung.com, tom.gall@linaro.org, sumit.semwal@linaro.org, john.stultz@linaro.org, amit.pundir@linaro.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 04 Aug 2021 15:39:38 +0100,
Sam Protsenko <semen.protsenko@linaro.org> wrote:

> > You are also missing the hypervisor virtual timer interrupt.
> >
> 
> Checked SoC TRM, there is no PPI for hypervisor virtual timer
> interrupt, and no mentioning of it at all. Likewise, I checked ARMv8
> ARM and TRM, almost no description of it. Also, I checked other
> platforms, and seems like everyone does the same (having only 4
> interrupts). And I wasn't able to find any documentation on that, so I
> guess I'll leave it as is, if you don't mind.

I *do* mind, and other DTs being wrong isn't a good enough excuse! ;-)

From the ARMv8 ARM (ARM DDI 0487G.b)
<quote>
D11.2.4 Timers

In an implementation of the Generic Timer that includes EL3, if EL3
can use AArch64, the following timers are implemented:

* An EL1 physical timer, that:
  - In Secure state, can be accessed from EL1.
  - In Non-secure state, can be accessed from EL1 unless those
    accesses are trapped to EL2.
    When this timer can be accessed from EL1, an EL1 control
    determines whether it can be accessed from EL0.
* A Non-secure EL2 physical timer.
* A Secure EL3 physical timer. An EL3 control determines whether this
  register is accessible from Secure EL1.
* An EL1 virtual timer.
* When FEAT_VHE is implemented, a Non-secure EL2 virtual timer.
* When FEAT_SEL2 is implemented, a Secure EL2 physical timer.
* When FEAT_SEL2 is implemented, a Secure EL2 virtual timer.
</quote>

Cortex-A55 being an ARMv8.2 implementation, it has FEAT_VHE, and thus
it does have a NS-EL2 virtual timer. This is further confirmed by the
TRM which documents CNTHV*_EL2 as valid system registers[1].

So the timer exists, the signal is routed out of the core, and it
is likely that it is connected to the GIC.

If the designers have omitted it, then it needs to be documented as
such.

Thanks,

	M.

[1] https://developer.arm.com/documentation/100442/0100/register-descriptions/aarch64-system-registers/aarch64-architectural-system-register-summary

-- 
Without deviation from the norm, progress is not possible.
