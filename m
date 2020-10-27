Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14E1F29C2F8
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 27 Oct 2020 18:42:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1821107AbgJ0Rka (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 27 Oct 2020 13:40:30 -0400
Received: from mail-ej1-f66.google.com ([209.85.218.66]:39994 "EHLO
        mail-ej1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1821101AbgJ0Rk1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 27 Oct 2020 13:40:27 -0400
Received: by mail-ej1-f66.google.com with SMTP id z5so3435110ejw.7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Oct 2020 10:40:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1TOHRATujw9fWV701bnbZEZLpgM7iJ17RwkKSiQR4Vw=;
        b=DoJKYQBPvXmOLgmrBPy/zqhO0ePxKeTrCi+cgAJ6AbTYpCQAMPlM1RJvHJ4FrtKsbt
         mmj3sqY9vTc8UwfqkS1gSDPRn1fl1Sdz4kwTbHbb8dKLMAwYQJbBrM+V9byTZmXiM9vC
         kGHzMwuDk36vQZiR/B6do/1d9JJyTbvYACFDdVcLv9rMpJZKJ4FL/7LblqwA3DVnnkAh
         Z+bhZQDCRppCii4I8FC9NF3E8YV7in+4RK8RBDLw6y4D49ucSW4+Qn0HSAUtjW/Mc4q+
         11lUeQVpANiAhdQ3qACvoyeCyqskP6UN+/mGGb+wCkx5Q6e8VPWv+snyr6k5y66bR06X
         htAg==
X-Gm-Message-State: AOAM533YRwY4DNqrpzbMRrHbaHjlUdNfubCzl9PKlRPGCmsTEXJ/a+nv
        6mHulGOEIb9J76fw38/DfTQ=
X-Google-Smtp-Source: ABdhPJyugBC3zGjmPuJlmIN/WZRtHeTaQHbpqad5KJegWTCNUbWpmSm/azeX0fDhSBSqtpCoeSMImQ==
X-Received: by 2002:a17:906:6a47:: with SMTP id n7mr3465941ejs.306.1603820425505;
        Tue, 27 Oct 2020 10:40:25 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id o3sm1350143edv.63.2020.10.27.10.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 10:40:24 -0700 (PDT)
Date:   Tue, 27 Oct 2020 18:40:22 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos: Remove 'opp-shared' from Exynos3 bus
 OPP-tables
Message-ID: <20201027174022.GA135184@kozik-lap>
References: <CGME20200911122231eucas1p2c0964f2dc4326522a87fc0571ae58c37@eucas1p2.samsung.com>
 <20200911122220.13698-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200911122220.13698-1-m.szyprowski@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Sep 11, 2020 at 02:22:20PM +0200, Marek Szyprowski wrote:
> Commits 1019fe2c7280 ("ARM: dts: exynos: Adjust bus related OPPs to the
> values correct for Exynos5422 Odroids") and 9ff416cf45a0 ("ARM: dts:
> exynos: Disable frequency scaling for FSYS bus on Odroid XU3 family")
> revealed that 'opp-shared' property for the Exynos bus OPPs was used
> incorrectly, what had the side-effect of disabling frequency scaling for
> the second and latter buses sharing given OPP-table.
> 
> Fix this by removing bogus 'opp-shared' properties from Exynos3 bus
> OPP-tables. This restores frequency scaling for the following busses:
> RightBus, LCD0, FSYS and MFC.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos3250.dtsi | 5 -----

Thanks, applied.

Best regards,
Krzysztof

