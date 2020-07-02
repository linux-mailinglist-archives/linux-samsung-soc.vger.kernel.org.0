Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3145211BE0
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  2 Jul 2020 08:16:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726241AbgGBGQV (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 2 Jul 2020 02:16:21 -0400
Received: from mail-ej1-f67.google.com ([209.85.218.67]:35113 "EHLO
        mail-ej1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbgGBGQU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Jul 2020 02:16:20 -0400
Received: by mail-ej1-f67.google.com with SMTP id rk21so27844107ejb.2;
        Wed, 01 Jul 2020 23:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=asJB3DmZKuKIHGzbAUilqlxuUPwGBy0bD6WFb3w9qmI=;
        b=twQsTXfHAm3Ofy9WGo6iTQth94PkIC2erWUGbCr8ejJUVxy+4cvInBm5WkS9i5gNPv
         NtYlyd+Z33Anz/mKP+UNatXb6rabybxpYfbwkEvju/lzwkwu2Yi+3WWUET/todkGmHAE
         ecE5P9jEgw+fOqos4BcVK6Fn2/5xNA25+H3QmCugrbWyS+veGdpqCGHfq8fIAukSRhSx
         zS2eHLJ1umZBk0mzSVkwmIzSlGbFae5lj1byXu7vbF7FAUPAE7a/gVPC+1COS8PS1tCe
         OqYQ7w+zN6KQmtEs4zxJqsVx6FhjNLlGGk2uwQAdhe0jXmrFgxzjB2oJkYKybXDSIthf
         ugMw==
X-Gm-Message-State: AOAM532Vc/wpPQdX+K2yoE6oN07rCgkskHNpSKG7zAvxB5/YHugv1mkO
        SU62tIsypg5OO86WO4jo3126yjx6
X-Google-Smtp-Source: ABdhPJysWqg+M+Y1cev+9zbHZwY89lD8Vq/lDl/1VbeLtMjuR39qx67zQwvhvBQsiIQ0edve30zw1g==
X-Received: by 2002:a17:906:57c6:: with SMTP id u6mr25548743ejr.194.1593670578627;
        Wed, 01 Jul 2020 23:16:18 -0700 (PDT)
Received: from kozik-lap ([194.230.155.195])
        by smtp.googlemail.com with ESMTPSA id ck6sm7155992edb.18.2020.07.01.23.16.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Jul 2020 23:16:17 -0700 (PDT)
Date:   Thu, 2 Jul 2020 08:16:11 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Sylwester Nawrocki <snawrocki@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH v2] ARM: dts: exynos: Fix missing empty reg/ranges
 property regulators on Trats
Message-ID: <20200702061611.GC4175@kozik-lap>
References: <CGME20200629210025eucas1p219a52e75ecce9e813aa80f0126780189@eucas1p2.samsung.com>
 <20200629205948.32250-1-krzk@kernel.org>
 <97651868-30f3-6b91-1ea2-551ee1ebad8f@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <97651868-30f3-6b91-1ea2-551ee1ebad8f@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Jun 30, 2020 at 08:27:01AM +0200, Marek Szyprowski wrote:
> Hi Krzysztof,
> 
> On 29.06.2020 22:59, Krzysztof Kozlowski wrote:
> > Remove the regulators node entirely because its children do not have any
> > unit addresses.  This fixes DTC warning:
> >
> >      Warning (simple_bus_reg): /regulators/regulator-0: missing or empty reg/ranges property
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> What about removing the regulators node from other boards: 
> exynos4412-origen.dts, exynos5420-smdk5420.dts and exynos5250-arndale.dts?
> 
> On the other hand, maybe it would be really easier to add missing 
> address/size-cells properties to exynos4210-trats.dts/regulators node?

Indeed let's keep it consistent so in such case better to add here
proper address/size-cells.

Thanks for feedback!

Best regards,
Krzysztof

