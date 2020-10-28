Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE08C29E152
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 29 Oct 2020 03:00:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728361AbgJ2CAL (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 28 Oct 2020 22:00:11 -0400
Received: from mail-ej1-f67.google.com ([209.85.218.67]:46510 "EHLO
        mail-ej1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728247AbgJ1V4e (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 28 Oct 2020 17:56:34 -0400
Received: by mail-ej1-f67.google.com with SMTP id t25so980137ejd.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Oct 2020 14:56:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zEOPVnIriWnz7tz2sSdEz13BX2WjRTr9TsE2CM6SY4E=;
        b=QgKen0TQ7mLnQ+GTmM4pmEeP2rMCitmwU4BR0ALeV7YhCW1IBCiGtR+p0G1FH/4lV7
         /UahTo7tvLwJuwMH6ntvpNoTi9Rl1TkE8UmrkHRh9Rnx8wA8VuVEJmK1GR3vllpm2GeE
         yLb7AVB4GUgEdQbwMQxjQ4VlZHfyiEL4X40fRrNPPX5fI3AIJ7lltD9X47zqinn7yzw+
         xXCCOVgXX94QvFgyMoYQdHWPXA+llFlWbrAWTok2DSLEI37zMR3M9cRKnVQAIuoZIVVq
         MFklvnsgvM3VoNTOjmDVb//dEn/CQaCUeqqgjCWvZ79szEYx3sf4LdAtpRT2OrdY9xkN
         geRw==
X-Gm-Message-State: AOAM5301/g0wo09PkPfxQlcYXU/uOlmeyXWP0Wm7ITmKZyxEXymvEzil
        T46VMfp6wCNOtdeJQpRrt3/n25+3vTDfWQ==
X-Google-Smtp-Source: ABdhPJypS4oXy3dtNcq5B8PBsziTWrOdzKHvfNldkli91T1BTz+Ki2y9XWOX1jtH/RIIC3VexfwQbw==
X-Received: by 2002:a17:906:284b:: with SMTP id s11mr533571ejc.326.1603911397156;
        Wed, 28 Oct 2020 11:56:37 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id u13sm236587ejj.4.2020.10.28.11.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 11:56:36 -0700 (PDT)
Date:   Wed, 28 Oct 2020 19:56:34 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 1/3] ARM: dts: exynos: Enable BlueTooth support for Trats
 board
Message-ID: <20201028185634.GA159042@kozik-lap>
References: <CGME20201027142341eucas1p16e42afed4cae1292ed72fcd631424562@eucas1p1.samsung.com>
 <20201027142330.5121-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201027142330.5121-1-m.szyprowski@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Oct 27, 2020 at 03:23:28PM +0100, Marek Szyprowski wrote:
> Add a node for the BCM4334 Bluetooth chip on the serial bus #0 on
> the Exynos4210-based Trats boards.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4210-trats.dts | 31 ++++++++++++++++++++++++++

Thanks, applied.

Best regards,
Krzysztof

