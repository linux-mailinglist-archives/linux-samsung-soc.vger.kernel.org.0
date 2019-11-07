Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41FD8F253A
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  7 Nov 2019 03:21:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732990AbfKGCVb (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 6 Nov 2019 21:21:31 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43866 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728569AbfKGCVa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Nov 2019 21:21:30 -0500
Received: by mail-pl1-f193.google.com with SMTP id a18so355769plm.10
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Nov 2019 18:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=F8VYuNOSid43MrjVcuL5CaqvY6S8eW3r2yuK7BO5dwk=;
        b=SDJGXLGggE+E5m+gMdad8MXvtzmZkX9FQLHSFJY3No1jFMqqPX+P84oKpd1BRIrIhv
         iHfXEo4bZUfrs6P/8pwMKgedu8kInPSpg5nFo2uz3zf1gdd8OL1Ng0DHLWx5c7Uee8Q9
         yJyvD+Bykzyl0Hg3JVhqGVV5HWNrOjC214hZ1NoZk6sskkkKY2Al6aqc1NU5TPF28t3M
         Btek2alNVky8HWFU/w7EbzgdzWyIrgtDDLzh67x7C7u9sOC4exJ799z/f1N8WPY+IoGY
         FURMba0tsOS5HB1nWufsBEGQUFaKz/ilUfP4nAKu7Ux+y/z4gug6Zwg+mxN8Jj2GEr+Q
         pQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=F8VYuNOSid43MrjVcuL5CaqvY6S8eW3r2yuK7BO5dwk=;
        b=ps8f3YfyZk6/pfQjIkATk20s2a821uDhaWrBPNsZOFxw3++mxiYYDFfOmCSqn5ASVA
         qflDcxR8kGEpgmPqIwMknl5QXAorAh4lLCysFpPU3pGuwbc22fAzwXAhpNNhvbGiuZad
         UtaojGgUy5GUmFjPw3H1YbMDIcPzEL1iqCZJGn0ZbbJbgyUv6NjpCN4bbi+ra8O7JZhP
         wP3FhZSGcVcUpjWIJ/CdfVjKzoHQnEqwQJbTDMSEWrDgVHBfRW8go/34SgV2BTKRtLFx
         /W/m550CrdnxWFfJCNC38ftEIVQepg1iDSWO2rT3cPOBwwCXv60E+fb2ZcJkuLO5cAWD
         EQTg==
X-Gm-Message-State: APjAAAVQ82vXMAoJ/fg6lNRjbzuSXqYaZWVzHr/aVyFH6VrH9a+kS3hL
        Nw0mNdRdYPxxf/rA0rS/h1kzrQ==
X-Google-Smtp-Source: APXvYqwCjUUa2EravddhWJUCM9i3hC9daXOm5Ys3mXL0S5Zxg/iGcWx5LIEoQdFU17focrcutXV10A==
X-Received: by 2002:a17:902:6946:: with SMTP id k6mr1064471plt.60.1573093289898;
        Wed, 06 Nov 2019 18:21:29 -0800 (PST)
Received: from localhost ([122.171.110.253])
        by smtp.gmail.com with ESMTPSA id s23sm402279pgh.21.2019.11.06.18.21.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Nov 2019 18:21:29 -0800 (PST)
Date:   Thu, 7 Nov 2019 07:51:25 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     linux-kernel@vger.kernel.org, edubezval@gmail.com,
        Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Guillaume La Roque <glaroque@baylibre.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Javi Merino <javi.merino@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jun Nie <jun.nie@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 08/11] thermal: samsung: Appease the kernel-doc deity
Message-ID: <20191107022125.wkdsdoolondcxhju@vireshk-i7>
References: <cover.1573046440.git.amit.kucheria@linaro.org>
 <ef268335454e96e6ee3d13deb1cb89af0d0a3b61.1573046440.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef268335454e96e6ee3d13deb1cb89af0d0a3b61.1573046440.git.amit.kucheria@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 06-11-19, 18:58, Amit Kucheria wrote:
> Fix up the following warning when compiled with make W=1:
> 
> linux.git/drivers/thermal/mtk_thermal.c:374: warning: cannot understand function prototype: 'const struct mtk_thermal_data mt8173_thermal_data = '
> linux.git/drivers/thermal/mtk_thermal.c:413: warning: cannot understand function prototype: 'const struct mtk_thermal_data mt2701_thermal_data = '
> linux.git/drivers/thermal/mtk_thermal.c:443: warning: cannot understand function prototype: 'const struct mtk_thermal_data mt2712_thermal_data = '
> linux.git/drivers/thermal/mtk_thermal.c:499: warning: cannot understand function prototype: 'const struct mtk_thermal_data mt8183_thermal_data = '
> linux.git/drivers/thermal/mtk_thermal.c:529: warning: Function parameter or member 'sensno' not described in 'raw_to_mcelsius'

Incorrect log here.

> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  drivers/thermal/samsung/exynos_tmu.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
> index fb2c55123a99e..8193b66a3f831 100644
> --- a/drivers/thermal/samsung/exynos_tmu.c
> +++ b/drivers/thermal/samsung/exynos_tmu.c
> @@ -138,7 +138,7 @@ enum soc_type {
>  
>  /**
>   * struct exynos_tmu_data : A structure to hold the private data of the TMU
> -	driver
> + *			    driver
>   * @id: identifier of the one instance of the TMU controller.
>   * @base: base address of the single instance of the TMU controller.
>   * @base_second: base address of the common registers of the TMU controller.
> @@ -162,8 +162,11 @@ enum soc_type {
>   *	0 < reference_voltage <= 31
>   * @regulator: pointer to the TMU regulator structure.
>   * @reg_conf: pointer to structure to register with core thermal.
> + * @tzd: pointer to thermal_zone_device structure
>   * @ntrip: number of supported trip points.
>   * @enabled: current status of TMU device
> + * @tmu_set_trip_temp: SoC specific method to set trip (rising threshold)
> + * @tmu_set_trip_hyst: SoC specific to set hysteresis (falling threshold)
>   * @tmu_initialize: SoC specific TMU initialization method
>   * @tmu_control: SoC specific TMU control method
>   * @tmu_read: SoC specific TMU temperature read method
> -- 
> 2.17.1

-- 
viresh
