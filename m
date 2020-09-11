Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37B6F2665A4
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 11 Sep 2020 19:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbgIKRJO (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 11 Sep 2020 13:09:14 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46432 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgIKO6Z (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 10:58:25 -0400
Received: by mail-lj1-f195.google.com with SMTP id a22so12648323ljp.13;
        Fri, 11 Sep 2020 07:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bIIMnHfFJYpi3UwZe4wCDvPNzvOBVTUDM/t6ueEm2IQ=;
        b=mAyo/tpi8ARmR8aDwqrb1CtKPA3r11YT9SqXea3V7E11uhFHH/a5OIah7JgYkwgdwk
         3FnL7ijrjMjYZfCgwem+jZBiN0qfbSDtsb/V/STpcR7Yt1KAnWgeYIrqR30/1kaMNkYu
         040wegaJwfEPKkQu0m5yVEgdOr5Il0FyFkil0l8rQjHiVMw1x9tLxBrooiqhwWu9OnlN
         gta5Kfcr1d16HRcSWFETUlwOFcW1fseWDdFlSQlErkFKQHiWJ8AabYcyjPWLqEipdZ+2
         ZQozfyR9U/TCz5LlBXY+Oq0WSeAuXsCjPU6xConqI5yr5SKQu4NBHXhU4zjCpUZs1uL8
         RV/w==
X-Gm-Message-State: AOAM532gcbCwD7zWpO8CYPwcwR99ZP4/yl35z2KxPnt1O4skbuHLniaf
        y2xOpf9UKLMnU2j5bLzUg4ZI5OHHC3Dung==
X-Google-Smtp-Source: ABdhPJywwF2Qwh/N3i4i3wh28Wz8xzxLonYVXzEwdMBro7y7SeyhloT6RGdTzB5T3g8Tol8cwACJZw==
X-Received: by 2002:a17:906:a256:: with SMTP id bi22mr2324488ejb.375.1599835117275;
        Fri, 11 Sep 2020 07:38:37 -0700 (PDT)
Received: from kozik-lap ([194.230.155.174])
        by smtp.googlemail.com with ESMTPSA id f17sm1780002eds.45.2020.09.11.07.38.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Sep 2020 07:38:36 -0700 (PDT)
Date:   Fri, 11 Sep 2020 16:38:34 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Kukjin Kim <kgene@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Lihua Yao <ylhuajnu@outlook.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 00/11] ARM: dts: s3c: dtschema fixes
Message-ID: <20200911143834.GB659@kozik-lap>
References: <20200907183313.29234-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200907183313.29234-1-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Sep 07, 2020 at 08:33:02PM +0200, Krzysztof Kozlowski wrote:
> Hi,
> 
> This is last serie of big dtschema cleanups for Samsung DTS.  It fixes
> almost all dtschema violations, except:
> 
>   s3c6410-mini6410.dt.yaml: srom-cs1-bus@18000000: ethernet@18000000:reg:0: [402653184, 2, 402653188, 2] is too long
> 
> which is similar to the case with SMDK5410 (Exynos5410).
> 
> The patchset was not tested on HW.
> 
> Best regards,
> Krzysztof

Applied entire series.

Best regards,
Krzysztof

