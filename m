Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59D01226263
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 20 Jul 2020 16:44:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726389AbgGTOol (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 20 Jul 2020 10:44:41 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:44316 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgGTOol (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Jul 2020 10:44:41 -0400
Received: by mail-ed1-f68.google.com with SMTP id by13so12951243edb.11;
        Mon, 20 Jul 2020 07:44:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0HM8dWOd03Xwa1bC5SGcH0nUtfjgvSGaWuMh3QgzqM0=;
        b=PfJlGteecNFqIsLzlgteavnwjrNirzqbqnRdxRlFX7oApU7LQffKdVcXLEvAL7YyQF
         lvrNv4/zqcWWwaCxJQMhCSatGvJIyCpL4ChBKHLo59VknUP8c9MJjW58yciQvYqZ6Dkb
         vz/r/cznwTrHX29aCt8GZNwf+39gW130p1NFu0TFuwYeoEgim3TL4yYZXyPZ7/7cY/1e
         NzncO2DdbnUtwresqs3Qz94UJDTiU6KbnE7ROS/ocTQ1UQQ47jk6bV7rIIUd75DmQtOr
         aZlEVAPl+iWXVxdOBPFveoEvCrj27ZcdLcMQxp37CdikojO45UBdrZ3rNIf1TrZv9BkN
         b/Fg==
X-Gm-Message-State: AOAM5330GoAa5kGBVyMI00qolEEQ1nXgiHD/dMa4e4LNVF786Xd774Jd
        CX/Sfn6tizt9/gToVnpZYS8=
X-Google-Smtp-Source: ABdhPJww7JQR+GfMFex2hVJbwy3vyEws6ntw/wPzQwDf8/RNCUE9mdFO45pRgEfz+rvbxYmyQZsvFQ==
X-Received: by 2002:a50:f384:: with SMTP id g4mr21152865edm.205.1595256279539;
        Mon, 20 Jul 2020 07:44:39 -0700 (PDT)
Received: from kozik-lap ([194.230.155.200])
        by smtp.googlemail.com with ESMTPSA id lv17sm14988265ejb.56.2020.07.20.07.44.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jul 2020 07:44:38 -0700 (PDT)
Date:   Mon, 20 Jul 2020 16:44:36 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc:     robh+dt@kernel.org, kgene@kernel.org, linux@armlinux.org.uk,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH for v5.9] ARM: SAMSUNG: Replace HTTP links with HTTPS ones
Message-ID: <20200720144436.GA22791@kozik-lap>
References: <20200719093939.57412-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200719093939.57412-1-grandmaster@al2klimov.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, Jul 19, 2020 at 11:39:39AM +0200, Alexander A. Klimov wrote:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>             If both the HTTP and HTTPS versions
>             return 200 OK and serve the same content:
>               Replace HTTP with HTTPS.
> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---
>  Continuing my work started at 93431e0607e5.
>  See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
>  (Actually letting a shell for loop submit all this stuff for me.)
> 
>  If there are any URLs to be removed completely
>  or at least not (just) HTTPSified:
>  Just clearly say so and I'll *undo my change*.
>  See also: https://lkml.org/lkml/2020/6/27/64
> 
>  If there are any valid, but yet not changed URLs:
>  See: https://lkml.org/lkml/2020/6/26/837
> 
>  If you apply the patch, please let me know.
> 
>  Sorry again to all maintainers who complained about subject lines.
>  Now I realized that you want an actually perfect prefixes,
>  not just subsystem ones.
>  I tried my best...
>  And yes, *I could* (at least half-)automate it.
>  Impossible is nothing! :)
> 
> 
>  arch/arm/boot/dts/exynos5410-pinctrl.dtsi | 2 +-
>  arch/arm/mach-s3c24xx/Kconfig             | 2 +-
>  arch/arm/mach-s3c24xx/mach-h1940.c        | 2 +-
>  arch/arm/mach-s3c24xx/mach-mini2440.c     | 2 +-
>  arch/arm/mach-s3c24xx/mach-n30.c          | 2 +-
>  arch/arm/mach-s3c24xx/mach-rx3715.c       | 2 +-

Thanks, applied. I split the DTS and mach-s3c changes to two commits
because they go through different branches.

Best regards,
Krzysztof

