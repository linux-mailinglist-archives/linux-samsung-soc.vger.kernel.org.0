Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C162B104A4A
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 21 Nov 2019 06:32:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbfKUFcO (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 21 Nov 2019 00:32:14 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38970 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726132AbfKUFcN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 21 Nov 2019 00:32:13 -0500
Received: by mail-pg1-f194.google.com with SMTP id b126so998366pga.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Nov 2019 21:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yE3H52ST3bCRAdHmUDzhL/7UmgqQkrfup+4Ir818ZIQ=;
        b=M7BBqQwbeIa8JPve1L1VxPnrWig2i9WY0ZyJQqNtb4XAMmkDMSCMWoXgsK/BUgwDUG
         +d9RoKdI2qyNSdaD+nSIAoT7F4oQIUqrWJd/nlez1kwBmCmhxwHQwABfxrJ5IP+wo2Np
         tAso4ANpMBRdhCbXYBWd9wpXO9r11KzHWL9BoyF9oNUi9p7j3jazmA2qZctVscY3YyDJ
         GWW/g07xgm2+CEP4ffmAH+DyewVtNhP/yJaOVzOJK5pztvZNrR1n9PqUzwRYF8FWjpFf
         +nQ0SA77fRXYfHhgPIg2TTZCDsMmEdFh0XpHNs3hB8UFqQTbHJ0EM/l3gY7KwLMyAD30
         cNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yE3H52ST3bCRAdHmUDzhL/7UmgqQkrfup+4Ir818ZIQ=;
        b=JEkiqhlkWgmd4RNjMzZlKrKF0tF0ismRnGV8p4+9BdaZxfYlbMgJrgeMK8y+sg2lEM
         GctI8x0f1hnZJF+YJFZkCQUXTtY03/FvJimCQTc6PagHeMgX6fQbAQtm3taRrBz9Re7b
         +5Hju/fNBU3V8x1YNKWArz4VuW+NVOJzFBsVtZSHt2usgxXL5POvpD32Js6iUMlC1Mcc
         o7k9BpRas1I64SI0GISkDWuWIUjnpQ6OJPTISUxe6Fvr3sDUvS435fLBSW45Q0yQZ2Jv
         1GdLG7zykHZjFr0JAhhiAWi40x2rXhnwJrHtbYeeYsrhudnDQY3NitHCNTa9fB9XxYQW
         p+Tg==
X-Gm-Message-State: APjAAAV4D46yD3QmPxROZ02/gsHJ8BPAb3x7Za0hFSUpL6xsnq4qJkeZ
        zORkkjbGEjfzwf7tKCFaZUwt1Q==
X-Google-Smtp-Source: APXvYqwNM9dZdansKs8pKoOeaen5b9vqImpjSGgtw89kbCl3/6894oiyg46ElaulgywEwwJJ0Y0fIQ==
X-Received: by 2002:aa7:8421:: with SMTP id q1mr8754271pfn.174.1574314333119;
        Wed, 20 Nov 2019 21:32:13 -0800 (PST)
Received: from localhost ([223.226.74.76])
        by smtp.gmail.com with ESMTPSA id p16sm1083971pjp.31.2019.11.20.21.32.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Nov 2019 21:32:12 -0800 (PST)
Date:   Thu, 21 Nov 2019 11:02:07 +0530
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
Subject: Re: [PATCH v2 08/11] thermal: samsung: Appease the kernel-doc deity
Message-ID: <20191121053207.gyulu3vb3caaituv@vireshk-i7>
References: <cover.1574242756.git.amit.kucheria@linaro.org>
 <1ded1697c6e5eff11b034b3302b9c79e88fa9c42.1574242756.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ded1697c6e5eff11b034b3302b9c79e88fa9c42.1574242756.git.amit.kucheria@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20-11-19, 21:15, Amit Kucheria wrote:
> Fix up the following warning when compiled with make W=1:
> 
> linux.git/drivers/thermal/samsung/exynos_tmu.c:141: warning: bad
> line:         driver
> linux.git/drivers/thermal/samsung/exynos_tmu.c:203: warning: Function
> parameter or member 'tzd' not described in 'exynos_tmu_data'
> linux.git/drivers/thermal/samsung/exynos_tmu.c:203: warning: Function
> parameter or member 'tmu_set_trip_temp' not described in
> 'exynos_tmu_data'
> linux.git/drivers/thermal/samsung/exynos_tmu.c:203: warning: Function
> parameter or member 'tmu_set_trip_hyst' not described in
> 'exynos_tmu_data'
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  drivers/thermal/samsung/exynos_tmu.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
