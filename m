Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB6752572D6
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 31 Aug 2020 06:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbgHaE3X (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 31 Aug 2020 00:29:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726042AbgHaE3R (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 31 Aug 2020 00:29:17 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3352C061755
        for <linux-samsung-soc@vger.kernel.org>; Sun, 30 Aug 2020 21:29:14 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id g29so3628199pgl.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 30 Aug 2020 21:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fy+jYTLzmo8SG0PRGSLlA/pnVKtwE9a1uKPk/UDp9I4=;
        b=NA4ctU1kZIKSEfqA8R2XSbBLEyXSCjda7w9pU9k/KMsgUTwNEPReFipZw7VUKCb0tb
         TRy4OCOMUBA29mByAF5JiZgD0Qt9inZ3HuChAvAxxnFwXrWmjHGKxGXYkY3pmnynkb6z
         OYvELM2mDyL8dfVNEkQ9c0DnRkmk1UGStGtJS4yOtZ00Pb6rmJE7QF2OElRDPHYb8zhH
         ZMI7y/MvR3UJIrdxn12l0R3X6aml2dbxkz6FGd+Tj8kVb9zSYRQTLb3RqH+w3RQ+bWO7
         quqAr0ZA4rwS1G12JBIlV2fxR6h8JtA5lJXbNfCDXLt3qmthqFeKLQMXFJNzVTsfzDlg
         vb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fy+jYTLzmo8SG0PRGSLlA/pnVKtwE9a1uKPk/UDp9I4=;
        b=fdYnVmQEyOb0Ag1EAek1ttd8rZ/7ehpbUw1XL+cbkTpXpePE9peIDWSyMZMMw1ENcT
         yzAxHXQGgb4yK4fLrNyx7Ot9AY4qlQND+X+jvDpVjD/b03bFMOgCdjiL3qx5cCPLSRHt
         5gdynj+Op94l3czPEwJV+ZXbwKOFEKdL4zmpVJvUzw0I46MY2u0bPX8Aq3ZvD4ZAlaBz
         gX7GAFRxftaquwl4l3UZAdVmW2GA1emAVOBki9+r3VfnBDmZEmmhGWxP3LjsGtWg7zOU
         bz2UDQO4hPBMmsNOLhQeFJonAwz6krOcfmDptm2oXFSZlmvR4V+6PVchwZpS6YlgvuKv
         7yUA==
X-Gm-Message-State: AOAM533hSkdQsa4SMnMOP70IGLc84eJpZksh/ymiUkHfwMquYKEUap3e
        MdksL8Be9QKs5Q3FeCF/hp6zNw==
X-Google-Smtp-Source: ABdhPJyD6b4IOWELQvuYc3r+NvPnogxg5ZJa39sm8LOUCLLFiHHrfalUW2QapDOWE73WPvEvqmk3zA==
X-Received: by 2002:a63:ab43:: with SMTP id k3mr7183808pgp.426.1598848154284;
        Sun, 30 Aug 2020 21:29:14 -0700 (PDT)
Received: from localhost ([122.167.135.199])
        by smtp.gmail.com with ESMTPSA id h9sm6641639pfq.18.2020.08.30.21.29.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 30 Aug 2020 21:29:13 -0700 (PDT)
Date:   Mon, 31 Aug 2020 09:59:09 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kukjin Kim <kgene@kernel.org>, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] cpufreq: s5pv210: Use dev_err instead of pr_err in
 probe
Message-ID: <20200831042909.jeg2rv6f3mhcnkim@vireshk-i7>
References: <20200826160016.469-1-krzk@kernel.org>
 <20200826160016.469-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200826160016.469-2-krzk@kernel.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 26-08-20, 18:00, Krzysztof Kozlowski wrote:
> dev_err() allows easily to identify the device printing the message so
> no need for __func__.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/cpufreq/s5pv210-cpufreq.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
> index 7dccdb364fcf..911a655895d8 100644
> --- a/drivers/cpufreq/s5pv210-cpufreq.c
> +++ b/drivers/cpufreq/s5pv210-cpufreq.c
> @@ -616,8 +616,7 @@ static int s5pv210_cpufreq_probe(struct platform_device *pdev)
>  
>  	np = of_find_compatible_node(NULL, NULL, "samsung,s5pv210-clock");
>  	if (!np) {
> -		pr_err("%s: failed to find clock controller DT node\n",
> -			__func__);
> +		dev_err(dev, "failed to find clock controller DT node\n");
>  		result = -ENODEV;
>  		goto err_clock;
>  	}
> @@ -625,16 +624,14 @@ static int s5pv210_cpufreq_probe(struct platform_device *pdev)
>  	clk_base = of_iomap(np, 0);
>  	of_node_put(np);
>  	if (!clk_base) {
> -		pr_err("%s: failed to map clock registers\n", __func__);
> -		result = -EFAULT;

I have restored this back as it didn't look intentional.

Applied both. Thanks.

-- 
viresh
