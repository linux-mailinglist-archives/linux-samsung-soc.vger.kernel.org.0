Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAFFD241E95
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 11 Aug 2020 18:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729257AbgHKQqe convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 11 Aug 2020 12:46:34 -0400
Received: from mail-ej1-f65.google.com ([209.85.218.65]:34295 "EHLO
        mail-ej1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728844AbgHKQqd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 11 Aug 2020 12:46:33 -0400
Received: by mail-ej1-f65.google.com with SMTP id o23so13832274ejr.1;
        Tue, 11 Aug 2020 09:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=G2/FL5p/UBsN/pTnJvwvZ3cpq1IwMUSfHcFh9xZXbUU=;
        b=JZxbYiDYcNlPUWjyr8sFwXVi2gKMAytqf4PrQMKEwRk+aFxPHrKWLwrxXfRJ3m1Jxv
         Rry97EZGsv9+ZVBISjHP8b689bQ49LTHt/tNbjq49qor6oVQxqjzeMMtvXXVJ8+trE90
         RIpm567TQYAroMWk88VvdIp1ooM2Xe9yYPeCRbWY7GHm2OTTaVP9C7rV6y9tHlNclQuj
         +H9bB/EMeT2dji5HOSzfqql4T+GKBFPFdPHoQfUgMk1gm4ijv9WiEBIJJjmhrtaaxMIa
         TWOmNtY0ulzs60tABqny7mvbReZv6o2zuZLSMctFaA5XXf/yT5J/ufg3Ub3xqoGfpeix
         /wRQ==
X-Gm-Message-State: AOAM531dCnVo7WgwNjKdK4I4WA8ytPp3DSYjf+sYFw291Tc7XehRJedz
        IAZ2A/wPXRI5BqnZbWoXRnmIe/ZzFyg=
X-Google-Smtp-Source: ABdhPJxfsaegErx+I1BPh4/QzrIWeC3zvULnFaO+1ZfLEODfWZgX80kzF3d8nTpmh2MeaBaPwrQ/wA==
X-Received: by 2002:a17:906:a413:: with SMTP id l19mr27923288ejz.15.1597164391237;
        Tue, 11 Aug 2020 09:46:31 -0700 (PDT)
Received: from kozik-lap ([194.230.155.117])
        by smtp.googlemail.com with ESMTPSA id p20sm15338656ejy.107.2020.08.11.09.46.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Aug 2020 09:46:30 -0700 (PDT)
Date:   Tue, 11 Aug 2020 18:46:28 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Tomasz Figa <tomasz.figa@gmail.com>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mike Turquette <mturquette@baylibre.com>,
        "moderated list:SAMSUNG SOC CLOCK DRIVERS" 
        <linux-samsung-soc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2] clk: samsung: Prevent potential endless loop in the
 PLL set_rate ops
Message-ID: <20200811164628.GA7958@kozik-lap>
References: <CGME20200811112518eucas1p2a751f664a907ac7cd8e1dd235dc2fa54@eucas1p2.samsung.com>
 <20200811112507.24418-1-s.nawrocki@samsung.com>
 <CA+Ln22Hfys7r2EDstOsdks1X88Fuv77DLTuXLWDynTt4kmiCiQ@mail.gmail.com>
 <20200811162358.GA7169@kozik-lap>
 <CA+Ln22Es+Mtokw91wzUaoWC2yCQHRJDEvW6=U1Rbt2H7PbDOeA@mail.gmail.com>
 <20200811163428.GA7590@kozik-lap>
 <CA+Ln22FdFBPU5f0agknRN5xnUtJWOuGARfnsYh3ru_xdjoGC=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <CA+Ln22FdFBPU5f0agknRN5xnUtJWOuGARfnsYh3ru_xdjoGC=A@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Aug 11, 2020 at 06:41:20PM +0200, Tomasz Figa wrote:
> 2020年8月11日(火) 18:34 Krzysztof Kozlowski <krzk@kernel.org>:
> >
> > On Tue, Aug 11, 2020 at 06:28:18PM +0200, Tomasz Figa wrote:
> > > 2020年8月11日(火) 18:24 Krzysztof Kozlowski <krzk@kernel.org>:
> > > >
> > > > On Tue, Aug 11, 2020 at 02:59:07PM +0200, Tomasz Figa wrote:
> > > > > Hi Sylwester,
> > > > >
> > > > > 2020年8月11日(火) 13:25 Sylwester Nawrocki <s.nawrocki@samsung.com>:
> > > > > >
> > > > > > In the .set_rate callback for some PLLs there is a loop polling state
> > > > > > of the PLL lock bit and it may become an endless loop when something
> > > > > > goes wrong with the PLL. For some PLLs there is already (a duplicated)
> > > > > > code for polling with timeout. This patch replaces that code with
> > > > > > the readl_relaxed_poll_timeout_atomic() macro and moves it to a common
> > > > > > helper function, which is then used for all the PLLs. The downside
> > > > > > of switching to the common macro is that we drop the cpu_relax() call.
> > > > >
> > > > > Tbh. I'm not sure what effect was exactly expected from cpu_relax() in
> > > > > the functions which already had timeout handling. Could someone shed
> > > > > some light on this?
> > > >
> > > > For us, it should not matter much, except:
> > > > 1. when on A9 with ARM_ERRATA_754327, but we do not enable it on our
> > > >    platforms,
> > > > 2. it is a generic pattern for busy loops.
> > > >
> > > > On other architectures it could mean something (e.g. yield to other
> > > > hyper-threading CPU).
> > >
> > > Okay, thanks for confirming that it doesn't matter for us.
> > >
> > > Now, I wonder if the readx_poll_*() helpers are supposed to take all
> > > of those into account or on systems which would benefit from such
> > > operations, it would be the caller's responsibility.
> >
> > That's a very good point. In case of ARM_ERRATA_754327, busy waiting
> > should have a barrier thus cpu_relax() is desired. I guess the generic
> > macro for busy waiting therefore should use them.
> 
> Is there yet another macro available somewhere or you mean
> read_poll_timeout_atomic()? The latter doesn't include cpu_relax().

Yes, I meant the generic read_poll_timeout_atomic().

> Given that udelay() likely already does this kind of an idle call,
> perhaps it could be as simple as this?
> 
>         if (__delay_us) \
>                 udelay(__delay_us); \
> +       else \
> +               cpu_relax(); \
> 

I think udelay does not have it. Delaying by some simple operations
(e.g. multiplication) does not require IO barriers.

> On the other hand, I wonder if there are cases where a call to
> cpu_relax() is not desirable.

Hmmm, it is really a generic pattern all over the kernel, so I doubt
that generic macros should target such case.

Best regards,
Krzysztof

