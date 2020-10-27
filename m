Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5997429C330
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 27 Oct 2020 18:44:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1821467AbgJ0RoE (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 27 Oct 2020 13:44:04 -0400
Received: from mail-ej1-f68.google.com ([209.85.218.68]:46168 "EHLO
        mail-ej1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1821449AbgJ0Rnv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 27 Oct 2020 13:43:51 -0400
Received: by mail-ej1-f68.google.com with SMTP id t25so3421970ejd.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Oct 2020 10:43:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Gb9rORXmj9e7k2/cGD0/grAcFw6yTc2vIt7AFkb+R8c=;
        b=OpCJJWljZW3/PMfDMH4GoXvuw7idichTh+ZITD27hQx4cd6HNwDYJCNuzNHV63VJQJ
         RHhECrD1M5LiTKLcF/UR29/E83R+0M1f2WcuRZjiANOKTy+y0WMUEEy4gnx1LxhMcKXc
         fvrbOOzezZaPaiiDog2ZSnPYaF/S5qWapqzDP73X+s9cyIv5JCfIKK63jxueudpNCfN/
         1cFeWoaOUdyIHSiyXhhWq9//y8mdqQs9u9iQCT9xKJV68jGbmSMqd92coY02c9dvsXHl
         aNs6LHNBg/GfjExILL5MNTF4fmG7SHMuh5VoF3SbU8dFj4Q1Xnglc9e6UJE1nC0Yio3q
         2E2g==
X-Gm-Message-State: AOAM5326kVvK3FyXOAA3O7Yz73ZEh3x9gXabOjPSeraTrUVpoXFzBjtP
        0Sb0XASbzQ264BUTUanNDZCyhzHdC86R1XG2
X-Google-Smtp-Source: ABdhPJzh26ynFel6AxxZ3leruS6ekSzicUJX/wkM3/L34+7WDedee3RE5sZ5g5lx5qKsfnw9hwhPmQ==
X-Received: by 2002:a17:906:f90a:: with SMTP id lc10mr3652945ejb.272.1603820629619;
        Tue, 27 Oct 2020 10:43:49 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id u18sm1394516ejn.122.2020.10.27.10.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 10:43:48 -0700 (PDT)
Date:   Tue, 27 Oct 2020 18:43:46 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos: Remove 'opp-shared' from Exynos4412
 bus OPP-tables
Message-ID: <20201027174346.GB135184@kozik-lap>
References: <CGME20200911122246eucas1p1a8ccc7c5b970ce6aa9aa346d78ad69df@eucas1p1.samsung.com>
 <20200911122236.16805-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200911122236.16805-1-m.szyprowski@samsung.com>
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

Thanks, applied.

Best regards,
Krzysztof

