Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13622271557
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 20 Sep 2020 17:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbgITP1o (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 20 Sep 2020 11:27:44 -0400
Received: from mail-ej1-f65.google.com ([209.85.218.65]:46885 "EHLO
        mail-ej1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgITP1o (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 20 Sep 2020 11:27:44 -0400
Received: by mail-ej1-f65.google.com with SMTP id z23so14290797ejr.13
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Sep 2020 08:27:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cFXggMalbpMIUVSNVF8+ZKSQLO+IcM2y3Tqg5VYpZcY=;
        b=p8yM3mAK28xy9S5X2gTIdkfW2uBd/v/xwnAOT8X+l3AtEb7ta2pE5HDRLP78aehOIm
         n6RqNaFF+PdkUyJVrfSFO+93ZTiOuc/YlfnipWJgIH7oEEwcuElOKAHtMJmE2VyhTDG3
         ATOSr6fVXZKyc4dVXkJOu1DUPH5E4Tq66xVxZwQighc1KBBLbi/ZjPLXARGs1w5cmvJm
         jaGUduqJbvyIR3NxrHIMCGSrvT9r7c6E8uvGQxcI1SSE8iRiyBwDdO5/QQGbgwA9y979
         yJpEJ6DGpyhYTNBFgK19iv5jLaZPry3JKfMgEEM+Fuqb6tAe8vUflHM+B4s/kMPeHGX5
         KPOw==
X-Gm-Message-State: AOAM530A/DqmdDj1GY9FKngVu2FMqkCrdCrVBLm0g5J+SttqqP2a5IBf
        EcWwOfIjpDPOTegaFVKNMAMCdACusKQ=
X-Google-Smtp-Source: ABdhPJyYIBSH/C7vTtcaiGV9Olc/pLw5sh0QuVazAtfUuxcJEkYwP4LB7mqtqQs0jn5mI1zXnWbhjA==
X-Received: by 2002:a17:906:e216:: with SMTP id gf22mr45800772ejb.2.1600615661957;
        Sun, 20 Sep 2020 08:27:41 -0700 (PDT)
Received: from kozik-lap ([194.230.155.191])
        by smtp.googlemail.com with ESMTPSA id s14sm6115057eju.84.2020.09.20.08.27.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Sep 2020 08:27:40 -0700 (PDT)
Date:   Sun, 20 Sep 2020 17:27:38 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos: Remove 'opp-shared' from Exynos4412
 bus OPP-tables
Message-ID: <20200920152738.GA7451@kozik-lap>
References: <CGME20200911122246eucas1p1a8ccc7c5b970ce6aa9aa346d78ad69df@eucas1p1.samsung.com>
 <20200911122236.16805-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200911122236.16805-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Sep 11, 2020 at 02:22:36PM +0200, Marek Szyprowski wrote:
> Commits 1019fe2c7280 ("ARM: dts: exynos: Adjust bus related OPPs to the
> values correct for Exynos5422 Odroids") and 9ff416cf45a0 ("ARM: dts:
> exynos: Disable frequency scaling for FSYS bus on Odroid XU3 family")
> revealed that 'opp-shared' property for the Exynos bus OPPs was used
> incorrectly, what had the side-effect of disabling frequency scaling for
> the second and latter buses sharing given OPP-table.
> 
> Fix this by removing bogus 'opp-shared' properties from Exynos4412 bus
> OPP-tables. This restores frequency scaling for the following busses:
> C2C, RightBus, and MFC.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4412.dtsi | 6 ------
>  1 file changed, 6 deletions(-)
>

As discussed on IRC, I am waiting with these patches till you let me
know they're good.

Best regards,
Krzysztof

