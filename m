Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE0531E77C5
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 29 May 2020 10:05:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbgE2IFA (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 29 May 2020 04:05:00 -0400
Received: from mail-ej1-f68.google.com ([209.85.218.68]:39279 "EHLO
        mail-ej1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725855AbgE2IE7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 29 May 2020 04:04:59 -0400
Received: by mail-ej1-f68.google.com with SMTP id f7so1178500ejq.6
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 May 2020 01:04:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wZMyTkIlx/3txehUnEvjb/TU9K5BSXcc9XmAazKGJLM=;
        b=O9vhFXcb+Y0BXAT6BEnb/DSiebG0EXQbXBiAZduBrEgIYsWuCfrLz+jOrojqYN+Ywo
         gfE9JhzgtIJv79nugDQVKEgDSwts1H1jkqzq84Nve2m6YUsKqD+FHSiPFUa+J7kw8DDo
         zxhvC4Z4Fe6fOPWyGe9dZXP/4ifpJ34wR/NLHu0zVDV0n6oPUjjIR/Poou3WmskdA0oz
         3G3YJ5PLRLYiodWc7jq+LDO2Ce0teIrPlXs1CxHcadyunDfkrt5zNP1YQW38+173qxQo
         9ET/lekxXM3HiNXzI/ZNAdi1VwmEJJ4rOfaJa2iZV99SHtFqDFBqtJNnHSgKvn0DFl/0
         OzqQ==
X-Gm-Message-State: AOAM5304HM38X9mfx3HgSYA2w6C1SOcDkXqDuRZtBcB7lKJJcBbxH8UB
        nzwYAPrYIA3sWnlStDOnVX4=
X-Google-Smtp-Source: ABdhPJyigOnQKqX/YvQNDiqV3XhjrdnRzu4KRLfl979qQTOnAKaTB0J9hzx3phgluTWH/Ww2t0VPuQ==
X-Received: by 2002:a17:906:398:: with SMTP id b24mr6875555eja.44.1590739497416;
        Fri, 29 May 2020 01:04:57 -0700 (PDT)
Received: from kozik-lap ([194.230.155.118])
        by smtp.googlemail.com with ESMTPSA id af15sm6793233ejc.89.2020.05.29.01.04.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 May 2020 01:04:56 -0700 (PDT)
Date:   Fri, 29 May 2020 10:04:54 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos: Extend all Exynos5800 A15's OPPs with
 max voltage data
Message-ID: <20200529080454.GA23221@kozik-lap>
References: <CGME20200528081539eucas1p1590e576d26ffd51cb860e6c6040fc437@eucas1p1.samsung.com>
 <20200528081525.14858-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200528081525.14858-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, May 28, 2020 at 10:15:25AM +0200, Marek Szyprowski wrote:
> On Exynos5422/5800 the regulator supply for the A15 cores ("vdd_arm") is
> coupled with the regulator supply for the SoC internal circuits
> ("vdd_int"), thus all operating points that modify one of those supplies
> have to specify a triplet of the min/target/max values to properly work
> with regulator coupling.
> 
> Fixes: eaffc4de16c6 ("ARM: dts: exynos: Add missing CPU frequencies for Exynos5422/5800")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5800.dtsi | 6 +++---

Thanks, applied with Cc-stable to next/dt-late. It might miss this merge
window and in such case I will keep it for v5.9 cycle.

Best regards,
Krzysztof

