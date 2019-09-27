Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE87BFF69
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 27 Sep 2019 08:52:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726027AbfI0Gwf (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 27 Sep 2019 02:52:35 -0400
Received: from mail-wr1-f43.google.com ([209.85.221.43]:37285 "EHLO
        mail-wr1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbfI0Gwf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 27 Sep 2019 02:52:35 -0400
Received: by mail-wr1-f43.google.com with SMTP id i1so1377124wro.4;
        Thu, 26 Sep 2019 23:52:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=od5B4j98TvNYBzRRG1HwoKOK/0TgQjKHWbpoGxQhWMA=;
        b=ajcj43eQminsdWFZj1BcSC4hNR2IMMhCpFPxUMUxP1+887tOQm9PMtCmo5boupGYsM
         Qziyr2ReK50I1cXAyQUoBteTD7/O/mB0ZBfIgmXSHSIbEPoyd4DP9PH9NSrowV2PeYvI
         Ni6ibxFdiC7c3nkgGoe0CkpIbZ0sWID5T/uatlgVSaNxdkEprYcpGdWo7lHlteq8UCCo
         fFSnln+5nqV/RJpXL9zJ8KnfY0fhZBe9aTq90IlxY5GNKIuGo4/I+fULL8S1ESh7e1p6
         cGwNJs51Wk2LcDAisr1kyQoVG0M4pGIJ5xPBoPTpWcaF0+2VD9Ngz857HBdWDzV19B5X
         bzqg==
X-Gm-Message-State: APjAAAV+lryCbpGfvK4o6eCYoQ9//Kjxo9UM9tS5lv6eSOXpcG1m3yZQ
        hCzEtoaBTzh2UfwoU7/PPm5MYDEP
X-Google-Smtp-Source: APXvYqxdEtihX4Yerytw8i64RZ/298ncU9GqZWRrjMVs8x96gM2opoAvGjGhrDbKmbgWIrHpe/sbHg==
X-Received: by 2002:adf:a350:: with SMTP id d16mr1667998wrb.326.1569567152554;
        Thu, 26 Sep 2019 23:52:32 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id j1sm3672139wrg.24.2019.09.26.23.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2019 23:52:31 -0700 (PDT)
Date:   Fri, 27 Sep 2019 08:52:29 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kukjin Kim <kgene@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: timer: Use defines instead of numbers in
 Exynos MCT examples
Message-ID: <20190927065229.GA18923@pi3>
References: <CGME20190926183707epcas3p350fe17bc738540b37f1130d967c31a62@epcas3p3.samsung.com>
 <20190926183643.7118-1-krzk@kernel.org>
 <fc0809b0-1e6a-0564-75d9-0ccb14d2826c@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fc0809b0-1e6a-0564-75d9-0ccb14d2826c@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Sep 27, 2019 at 08:36:47AM +0200, Marek Szyprowski wrote:
> Hi Krzysztof,
 >   
> >       timer@10050000 {
> >           compatible = "samsung,exynos4412-mct";
> >           reg = <0x10050000 0x800>;
> >   
> > -        interrupts = <0 57 0>, <0 69 0>, <0 70 0>, <0 71 0>,
> > -                     <0 42 0>;
> > +        interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> 
> the last one should be GIC_PPI
> 
> >       };
> >   
> >     - |
> >       // In this example, the IP contains four local timers, but using
> >       // a per-processor interrupt to handle them. All the local timer
> >       // interrupts are specified.
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> >   
> >       timer@10050000 {
> >           compatible = "samsung,exynos4412-mct";
> >           reg = <0x10050000 0x800>;
> >   
> > -        interrupts = <0 57 0>, <0 69 0>, <0 70 0>, <0 71 0>,
> > -                     <0 42 0>, <0 42 0>, <0 42 0>, <0 42 0>;
> > +        interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> 
> again, last 4 entries should use GIC_PPI

Indeed, thanks for noticing it.

Best regards,
Krzysztof

