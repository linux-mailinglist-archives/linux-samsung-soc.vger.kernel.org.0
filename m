Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE9B330C0B
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  8 Mar 2021 12:14:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231573AbhCHLNc (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 8 Mar 2021 06:13:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:46988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229627AbhCHLNW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 8 Mar 2021 06:13:22 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 34045651CD;
        Mon,  8 Mar 2021 11:13:22 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1lJDpA-000JV7-4r; Mon, 08 Mar 2021 11:13:20 +0000
Date:   Mon, 08 Mar 2021 11:13:18 +0000
Message-ID: <87blbtzynl.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Hector Martin <marcan@marcan.st>
Cc:     linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Tony Lindgren <tony@atomide.com>,
        Mohamed Mediouni <mohamed.mediouni@caramail.com>,
        Stan Skowronek <stan@corellium.com>,
        Alexander Graf <graf@amazon.com>,
        Will Deacon <will@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Hellwig <hch@infradead.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFT PATCH v3 07/27] arm64: arch_timer: implement support for interrupt-names
In-Reply-To: <20210304213902.83903-8-marcan@marcan.st>
References: <20210304213902.83903-1-marcan@marcan.st>
        <20210304213902.83903-8-marcan@marcan.st>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: marcan@marcan.st, linux-arm-kernel@lists.infradead.org, robh@kernel.org, arnd@kernel.org, olof@lixom.net, krzk@kernel.org, mark.kettenis@xs4all.nl, tony@atomide.com, mohamed.mediouni@caramail.com, stan@corellium.com, graf@amazon.com, will@kernel.org, linus.walleij@linaro.org, mark.rutland@arm.com, andy.shevchenko@gmail.com, gregkh@linuxfoundation.org, corbet@lwn.net, catalin.marinas@arm.com, hch@infradead.org, davem@davemloft.net, devicetree@vger.kernel.org, linux-serial@vger.kernel.org, linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 04 Mar 2021 21:38:42 +0000,
Hector Martin <marcan@marcan.st> wrote:
> 
> This allows the devicetree to correctly represent the available set of
> timers, which varies from device to device, without the need for fake
> dummy interrupts for unavailable slots.
> 
> Also add the hyp-virt timer/PPI, which is not currently used, but worth
> representing.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Reviewed-by: Tony Lindgren <tony@atomide.com>

Reviewed-by: Marc Zyngier <maz@kernel.org>

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.
