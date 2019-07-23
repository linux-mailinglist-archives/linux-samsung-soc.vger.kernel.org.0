Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08ABB70EC7
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 23 Jul 2019 03:48:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730839AbfGWBss (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 22 Jul 2019 21:48:48 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34443 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730026AbfGWBsr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 22 Jul 2019 21:48:47 -0400
Received: by mail-pf1-f193.google.com with SMTP id b13so18262316pfo.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jul 2019 18:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tSmnjYLr4XnnXcZ+h5qygzO/vu9yBr7SlvfWk0oPsHs=;
        b=bqWosns6ku3Fc2lvihluziKAZVN5g9VBJGwdBeEg0niOa9coayRBgsZDKeNrrOGuRM
         1ys7oqabOhX396o7/uZgRtvsq+RrHfJPAzz4LMmYFniinIFq6DcopcyIKUruknf/iuXw
         mXVOugoYmvLSn3rg8nZ9e7Yj39W2wS8wj1q5swlqeZuKRIWIOafWcCH7jhheay8dMc/O
         sLsA9O5eIoQMDMKOlnvPy2nB5b1UhFtNUInIvlZ/jVC4uK3jESSTdRQPSKJQIIMYkZQI
         pSUgqeWC5dONoRzZSzfBpAWTj36R4kWNXVFiTrcaGQH2EoCrlQS09pjY0RAtlZScIcl6
         lVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tSmnjYLr4XnnXcZ+h5qygzO/vu9yBr7SlvfWk0oPsHs=;
        b=njdJwVAs6yp+JIqkeZJPILqFCRKtuzQnDUzZT8coV5R/aIwp5jdBVHUB6wpUTU5tej
         nWDoj0sB1IDxxtkmrVz6+7Fpng+/Ed2CdKBuLjBVcmDwyttTZwqFypzSj/NEnNMSkVHz
         366NckuE7exmAnEwWjh9Qa/g4cqs9JEJrsbVx8xjQP9QGVCVFNFwKQDwHykrBDKU+OBz
         xgzWXfMuCiEwv/Q1u809+EjuwsBPMujHJpXdV7wPu3j+m8yUUVBuDQU6TuQSFv2KvIqQ
         ZalmLO2NkSs19fXMGE8dlV6wiEkrAb+EGAS+tdIAYctnsNOPH70cIFnxVBw/dJq7DfJb
         hV4A==
X-Gm-Message-State: APjAAAXa15nss04x7DP4FTV8cqDaNkvMbj7Hz8WGE2XjloTAHrVBrSvW
        3QBJQ7fCp+mVR9bfJ7iC6LUCqw==
X-Google-Smtp-Source: APXvYqyxp0cHGLs8U/L2DtyISYxwUziJvpXuvUsf8zTcnWojfKIhYVspEl2HKfU7BL6HG2uLn/m/1g==
X-Received: by 2002:a62:d45d:: with SMTP id u29mr3161818pfl.135.1563846527114;
        Mon, 22 Jul 2019 18:48:47 -0700 (PDT)
Received: from localhost ([122.172.28.117])
        by smtp.gmail.com with ESMTPSA id o14sm33661343pjp.19.2019.07.22.18.48.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 18:48:45 -0700 (PDT)
Date:   Tue, 23 Jul 2019 07:18:41 +0530
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
Subject: Re: [PATCH v3 2/5] opp: core: add regulators enable and disable
Message-ID: <20190723014841.yyttacgagktbkwg2@vireshk-i7>
References: <20190719150535.15501-1-k.konieczny@partner.samsung.com>
 <CGME20190719150554eucas1p2f4c9e4d2767ab740d419c42d4aeed6d5@eucas1p2.samsung.com>
 <20190719150535.15501-3-k.konieczny@partner.samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190719150535.15501-3-k.konieczny@partner.samsung.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 19-07-19, 17:05, k.konieczny@partner.samsung.com wrote:
> Add enable regulators to dev_pm_opp_set_regulators() and disable
> regulators to dev_pm_opp_put_regulators(). Even if bootloader
> leaves regulators enabled, they should be enabled in kernel in
> order to increase the reference count.
> 
> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
> ---
> Changes in v3:
> - corrected error path in enable
> - improved commit message
> Changes in v2:
> - move regulator enable and disable into loop
> ---
>  drivers/opp/core.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index 0e7703fe733f..a8a480cdabab 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -1570,6 +1570,12 @@ struct opp_table *dev_pm_opp_set_regulators(struct device *dev,
>  			goto free_regulators;
>  		}
>  
> +		ret = regulator_enable(reg);
> +		if (ret < 0) {
> +			regulator_put(reg);
> +			goto free_regulators;
> +		}
> +
>  		opp_table->regulators[i] = reg;
>  	}
>  
> @@ -1583,8 +1589,10 @@ struct opp_table *dev_pm_opp_set_regulators(struct device *dev,
>  	return opp_table;
>  
>  free_regulators:
> -	while (i != 0)
> -		regulator_put(opp_table->regulators[--i]);
> +	while (i--) {
> +		regulator_disable(opp_table->regulators[i]);
> +		regulator_put(opp_table->regulators[i]);
> +	}
>  
>  	kfree(opp_table->regulators);
>  	opp_table->regulators = NULL;
> @@ -1610,8 +1618,10 @@ void dev_pm_opp_put_regulators(struct opp_table *opp_table)
>  	/* Make sure there are no concurrent readers while updating opp_table */
>  	WARN_ON(!list_empty(&opp_table->opp_list));
>  
> -	for (i = opp_table->regulator_count - 1; i >= 0; i--)
> +	for (i = opp_table->regulator_count - 1; i >= 0; i--) {
> +		regulator_disable(opp_table->regulators[i]);
>  		regulator_put(opp_table->regulators[i]);
> +	}
>  
>  	_free_set_opp_data(opp_table);

Applied. Thanks.

-- 
viresh
