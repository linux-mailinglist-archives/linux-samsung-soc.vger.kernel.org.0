Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3ED6963013
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  9 Jul 2019 07:40:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbfGIFkU (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 9 Jul 2019 01:40:20 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33725 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726391AbfGIFkS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 9 Jul 2019 01:40:18 -0400
Received: by mail-pl1-f195.google.com with SMTP id c14so9466759plo.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Jul 2019 22:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oNfoBSAVs4HwlcfNYsclg/dP1n0XavIgjkMDpD1mPiY=;
        b=qj/En8SAcjlo3abd1feAIjM0u/Mro4Llh0ow4E5dJPGEUYTgknUTKxU1/i+J3jWMBN
         p25OPQsFgd7UEZdsGY6Ix40FcQTMNKciT4LNWrGbY+OeyG9jIxEI2RBpPnmpn5e8ORa4
         k0mt57EeQt3A48ZZOsXkdS5epjRbA1SLO1Ka2SyShqNIbp0lVHJWqYVmsT6VR8FFtQsK
         DFhDLtC7yfbeY27Br1XDph3bkoPnKvgG1iMFUaOUBpyUvVBo8OUPEIO6Xvo+5OHjrrUe
         qRGZfmT4Bcz6Y4Fkj1e6/gkz2Y8JL8TLEthi+V2VYj2DUGcr0fiiOU+Jeg2nsd4X3lBK
         Jjyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oNfoBSAVs4HwlcfNYsclg/dP1n0XavIgjkMDpD1mPiY=;
        b=kCHkcGlIgSfiR/WxjS2lpIxn6n2Faf/4z6SzrZeptw7nXkhtfO8ffCu2tbfU2r452o
         g9n86/guqDVV8YXYo1i6ws9pAbriE8hns9yJ1TRtYDmzJAGmqmFpvg3C5ratOZhH07pw
         Yakq3wH7wl2Etr2dwnTlX/qRtm3Jyz9UGaUS1dMaaB6WxtTaortXalot+1b3UVUXJO+Y
         UZXfmapenJYXTQVoUg/5QgETYFcA7Mq96Re48mFKQU/8ZWGTae906xDZPMOK79a4zVTS
         J1uHijHQg3Ks1YxZUHSr2L9kdNzvS+mIHxX+H4M1DjuFbIqpHvoCeOmcjDCq43FqQHe0
         dDEg==
X-Gm-Message-State: APjAAAU7ADY2HGapxDb1hoUXKv1QQ9+bxkEtm0QpF9lH92Y0wz5BpMiu
        S5039PnxyikkSY7BxCfVcQDw3mHrSQw=
X-Google-Smtp-Source: APXvYqyV89mc4OQKczZ8sRKuZ6VoDj+GFu/P2sqMf45IqdFh8iCwtAvZ5SJ+Cb5vmTNA4cnNYsunBw==
X-Received: by 2002:a17:902:b20c:: with SMTP id t12mr29930984plr.285.1562650818025;
        Mon, 08 Jul 2019 22:40:18 -0700 (PDT)
Received: from localhost ([122.172.28.117])
        by smtp.gmail.com with ESMTPSA id l31sm41547789pgm.63.2019.07.08.22.40.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jul 2019 22:40:16 -0700 (PDT)
Date:   Tue, 9 Jul 2019 11:10:14 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     k.konieczny@partner.samsung.com
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Mark Rutland <mark.rutland@arm.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] opp: core: add regulators enable and disable
Message-ID: <20190709054014.o3g4e6gbovrq3vvn@vireshk-i7>
References: <20190708141140.24379-1-k.konieczny@partner.samsung.com>
 <CGME20190708141159eucas1p1751506975ff96a436e14940916623722@eucas1p1.samsung.com>
 <20190708141140.24379-2-k.konieczny@partner.samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190708141140.24379-2-k.konieczny@partner.samsung.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 08-07-19, 16:11, k.konieczny@partner.samsung.com wrote:
> From: Kamil Konieczny <k.konieczny@partner.samsung.com>
> 
> Add enable regulators to dev_pm_opp_set_regulators() and disable
> regulators to dev_pm_opp_put_regulators(). This prepares for
> converting exynos-bus devfreq driver to use dev_pm_opp_set_rate().
> 
> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
> ---
>  drivers/opp/core.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index 0e7703fe733f..947cac452854 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -1580,8 +1580,19 @@ struct opp_table *dev_pm_opp_set_regulators(struct device *dev,
>  	if (ret)
>  		goto free_regulators;
>  
> +	for (i = 0; i < opp_table->regulator_count; i++) {
> +		ret = regulator_enable(opp_table->regulators[i]);
> +		if (ret < 0)
> +			goto disable;
> +	}

I am wondering on why is this really required as this isn't done for
any other platform, probably because the regulators are enabled by
bootloader and are always on.

-- 
viresh
