Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8657270EF0
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 23 Jul 2019 04:04:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729586AbfGWCEy (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 22 Jul 2019 22:04:54 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:36967 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727251AbfGWCEy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 22 Jul 2019 22:04:54 -0400
Received: by mail-pl1-f194.google.com with SMTP id b3so19942170plr.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jul 2019 19:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=c+fYefKdegWfzNVcvBNCZFAqK5d+WzXI5vtjxfFF6J8=;
        b=zRFzuYvWEWhGryAT6Q8/QwGY+31z0WJLeKBR9uQowX7cZbFobNq11qUpTg8+BZ9xdX
         geyyg7Y+iGQzwrwj3w8cE1UZojdY1o3jWGaU9cpggpJHJO1wmLY1aPQwKWhPKX7GxOIm
         /NvsPv7aR2tvFuB2l39aNzgFqRfkVWHNr/zBjK6BcrfdIBv5z6Ljx1/ZPwVyrbRfH+fn
         WC0xIll82mi599BW7YbJ6tFjpvgPx0Lgi5B03JE0YEPlBUchR3PWyTjQSVOMMOY5KJ2F
         be5nLPczyeJJU4UOXcnq4KKqAfKifvC4IYRjLWX3B2c/N80/HngqF6zuF/cKP6wBQfJd
         yM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=c+fYefKdegWfzNVcvBNCZFAqK5d+WzXI5vtjxfFF6J8=;
        b=ucvAQOOwVxlFvrBOAd3XocvgnB+L9HtVNjzzqiAYKSL5oarJo1TYjJaN4OisfTYCyD
         jn6NHj/JxK7DCyRuZ1OvjWSsJtvMfEnbg//4xDo/gU/xxbbHwYZinvg12tRu9ek+Lpz2
         eA82/32SeCH+0AR/4GocM/pUh7ZUuthfu/Na7t9tHrl+qd3+j5nVttu9WnCMQZ8QZBC4
         XG3c2ahoj37w+2caq4SZLegs5zcnamhwsf2CIJZLWAa8GW16OigbOuJYtayJbgRPps36
         YfNrSJdTLA1QEDYzEYBB4DbEkoW6jDOA6AnVQFcbHXyTOV4EkB7upOekT/u0iFcF2sUV
         92zw==
X-Gm-Message-State: APjAAAW5Gaaggco0ufllrnw4iYfLr49SCBwcNl+T8Olf8ImIVvPYM5+I
        9vvuSBad4LIkUlXL2GvnX1hj+g==
X-Google-Smtp-Source: APXvYqz1TZYMRg8AYFQKtJluS92AI/3l+SomVKMpEHPQggv0G3T/KfU0bla677YewN8LIbRxc6gdVw==
X-Received: by 2002:a17:902:4623:: with SMTP id o32mr76901784pld.112.1563847493573;
        Mon, 22 Jul 2019 19:04:53 -0700 (PDT)
Received: from localhost ([122.172.28.117])
        by smtp.gmail.com with ESMTPSA id z63sm6349546pfb.98.2019.07.22.19.04.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 19:04:52 -0700 (PDT)
Date:   Tue, 23 Jul 2019 07:34:50 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     krzk@kernel.org, robh+dt@kernel.org, vireshk@kernel.org,
        devicetree@vger.kernel.org, kgene@kernel.org,
        pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com
Subject: Re: [PATCH v2 0/9] Exynos Adaptive Supply Voltage support
Message-ID: <20190723020450.z2pqwetkn2tfhacq@vireshk-i7>
References: <CGME20190718143117eucas1p1e534b9075d10fbbbe427c66192205eb1@eucas1p1.samsung.com>
 <20190718143044.25066-1-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190718143044.25066-1-s.nawrocki@samsung.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 18-07-19, 16:30, Sylwester Nawrocki wrote:
> This is second iteration of patch series adding ASV (Adaptive Supply 
> Voltage) support for Exynos SoCs. The first one can be found at:
> https://lore.kernel.org/lkml/20190404171735.12815-1-s.nawrocki@samsung.com
> 
> The main changes comparing to the first (RFC) version are:
>  - moving ASV data tables from DT to the driver,
>  - converting the chipid and the ASV drivers to use regmap,
>  - converting the ASV driver to proper platform driver.
> 
> I tried the opp-supported-hw bitmask approach as in the Qualcomm CPUFreq
> DT bindings but it resulted in too many OPPs and DT nodes, around 200
> per CPU cluster. So the ASV OPP tables are now in the ASV driver, as in
> downstream kernels.

Hmm. Can you explain why do you have so many OPPs? How many
frequencies do you actually support per cluster and what all varies
per frequency based on hw ? How many hw version do u have ?

I am asking as the OPP core can be improved to support your case if
possible. But I need to understand the problem first.

-- 
viresh
