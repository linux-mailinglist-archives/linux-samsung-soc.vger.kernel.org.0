Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8998525B011
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  2 Sep 2020 17:49:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728238AbgIBPsx (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 2 Sep 2020 11:48:53 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:34090 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbgIBPsv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Sep 2020 11:48:51 -0400
Received: by mail-ed1-f67.google.com with SMTP id q21so5431750edv.1;
        Wed, 02 Sep 2020 08:48:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=25BrYDkb4I/zfoyKcwfjx4o/YRMeDib3DPF5ryd2jrY=;
        b=oJfFRmLNxWmAvtif2KXjvhAUc+x+e3fiFEbqamCkYeWn12B/cnKt6213V4YR/LFcvo
         TzvB73D9HHUdeKqyuaQLx5jZErJ7rHrSS8f6gdUsR6zMwd6SydRJBoQ3PqT7zAfIl35T
         sV4NbGJj9Lgd+TVaYWorYeeweF+ynv+Jtm3HB7nZ7dtJwmOUYO+AEHcekpZEjbDOoTRP
         HtnLyEFlxyBD9jtqSIeRFlVYsvn8d3wBLMYoHzwEx3aJGLOSzA8J83KfKWGlyOFcT8Jw
         1n3F0efu+WK/1vpgnqJsKUqyolBMSoF07m1ZNME3lr6h9wG4XAHeUD+4/V0cz24YCNVU
         TxOw==
X-Gm-Message-State: AOAM5319AgQo0YmjdT64EJBNcmRPKDAUua8OximjcvoH5ZcSYKKQiVI2
        ETKcT8vo/GaOxk1AU7uGJVc=
X-Google-Smtp-Source: ABdhPJyOr19mAVgDdQqKqdQcQlhxjLl5c+AwMZYRoKvZUU35wrmZXDj8yOg7lapvI4vsZNgh0bClog==
X-Received: by 2002:aa7:da16:: with SMTP id r22mr736126eds.132.1599061728604;
        Wed, 02 Sep 2020 08:48:48 -0700 (PDT)
Received: from kozik-lap ([194.230.155.106])
        by smtp.googlemail.com with ESMTPSA id s7sm3100909ejd.103.2020.09.02.08.48.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Sep 2020 08:48:48 -0700 (PDT)
Date:   Wed, 2 Sep 2020 17:48:45 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Denis GNUtoo Carikli <GNUtoo@cyberdimension.org>,
        Simon Shields <simon@lineageos.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: Re: [PATCH 24/33] ARM: dts: exynos: Correct compatible of fixed
 clocks in Midas boards
Message-ID: <20200902154845.GE21503@kozik-lap>
References: <20200830135200.24304-1-krzk@kernel.org>
 <20200830135200.24304-24-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200830135200.24304-24-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, Aug 30, 2020 at 03:51:51PM +0200, Krzysztof Kozlowski wrote:
> The fixed clocks implemented by Samsung clock drivers use only one
> compatible so drop the additional "fixed-clock" to fix dtbs_check
> warnings like:
> 
>   arch/arm/boot/dts/exynos4412-i9300.dt.yaml: xxti: compatible:0: 'fixed-clock' was expected
>     From schema: Documentation/devicetree/bindings/clock/fixed-clock.yaml
>   arch/arm/boot/dts/exynos4412-i9300.dt.yaml: xxti: compatible: ['samsung,clock-xxti', 'fixed-clock'] is too long
>   arch/arm/boot/dts/exynos4412-i9300.dt.yaml: xxti: compatible: Additional items are not allowed ('fixed-clock' was unexpected)
>   arch/arm/boot/dts/exynos4412-i9300.dt.yaml: xxti: '#clock-cells' is a required property
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/boot/dts/exynos4412-midas.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied 24-33.

Best regards,
Krzysztof

