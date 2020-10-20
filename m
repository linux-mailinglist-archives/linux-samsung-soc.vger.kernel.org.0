Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5312D29088E
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 16 Oct 2020 17:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408027AbgJPPeM (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 16 Oct 2020 11:34:12 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.167]:22431 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404562AbgJPPeM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Oct 2020 11:34:12 -0400
X-Greylist: delayed 351 seconds by postgrey-1.27 at vger.kernel.org; Fri, 16 Oct 2020 11:34:11 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1602862450;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=RHHm2GRiu7U5GkLRxa3++Z6B/X0hzwPc1UHjyWgcsfg=;
        b=nrSdxWcqrD50uqIp2ndzW7e5EIk9QXJpHOlU2iNOpAgG8jtRXJJkY0FTB7lLF5Nf/w
        jc/MGdbxWzJmq5dcuDGuFQYd4D1uLt0MoBA3TqtRa+KkOLNsv9dj/r9nRDflXqNESWar
        Q6y55cDbL81y5wrQjFhbPkR44tRSwPj0bcK6SaH5Sa9dP7WGR4nVYRLtPDP+xMKgXh4p
        0hR9Y28nsuHJ8tkFtdTAMO5s4mchEu5GSB+QYGcJU36d/iyUVNm0ubxcam1ROYi+Wubd
        G9Cf9akgrGr+bPO+1OEKIUEIIHtvMPCTjNqBHC7GUMxPHkA3dtVP5vsTHQ6XCEjjMxLT
        tmeg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8jxIc2p"
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 47.2.1 DYNA|AUTH)
        with ESMTPSA id 509a5aw9GFS7bjx
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 16 Oct 2020 17:28:07 +0200 (CEST)
Date:   Fri, 16 Oct 2020 17:28:02 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>, ulf.hansson@linaro.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Len Brown <len.brown@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>, nks@flawful.org,
        georgi.djakov@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH V2 1/2] opp: Allow dev_pm_opp_get_opp_table() to return
 -EPROBE_DEFER
Message-ID: <20201016152802.GA3966@gerhold.net>
References: <24ff92dd1b0ee1b802b45698520f2937418f8094.1598260050.git.viresh.kumar@linaro.org>
 <20201015180555.gacdzkofpibkdn2e@bogus>
 <20201016042434.org6ibdqsqbzcdww@vireshk-i7>
 <20201016060021.sotk72u4hioctg7o@bogus>
 <20201016111222.lvakbmjhlrocpogt@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201016111222.lvakbmjhlrocpogt@bogus>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Oct 16, 2020 at 12:12:22PM +0100, Sudeep Holla wrote:
> On Fri, Oct 16, 2020 at 07:00:21AM +0100, Sudeep Holla wrote:
> > On Fri, Oct 16, 2020 at 09:54:34AM +0530, Viresh Kumar wrote:
> > > On 15-10-20, 19:05, Sudeep Holla wrote:
> > > > OK, this breaks with SCMI which doesn't provide clocks but manage OPPs
> > > > directly. Before this change clk_get(dev..) was allowed to fail and
> > > > --EPROBE_DEFER was not an error.
> > >
> > > I think the change in itself is fine. We should be returning from
> > > there if we get EPROBE_DEFER. The question is rather why are you
> > > getting EPROBE_DEFER here ?
> > >
> >
> > Ah OK, I didn't spend too much time, saw -EPROBE_DEFER, just reverted
> > this patch and it worked. I need to check it in detail yet.
> >
> 
> You confused me earlier. As I said there will be no clock provider
> registered for SCMI CPU/Dev DVFS.
> 	opp_table->clk = clk_get(dev, NULL);
> will always return -EPROBE_DEFER as there is no clock provider for dev.

Shouldn't it return -ENOENT if there is no clock for the SCMI case?
With -EPROBE_DEFER I would expect that it shows up at some point.

I tried to avoid a situation like this by ignoring all errors
!= -EPROBE_DEFER. So if clk_get(dev, NULL) would return -ENOENT
everything should work as expected...

Thanks,
Stephan
