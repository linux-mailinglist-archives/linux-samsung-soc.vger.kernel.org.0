Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8188EE107B
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 23 Oct 2019 05:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732161AbfJWDXI (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 22 Oct 2019 23:23:08 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41573 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732091AbfJWDXH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 22 Oct 2019 23:23:07 -0400
Received: by mail-pg1-f194.google.com with SMTP id t3so11234561pga.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Oct 2019 20:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vG1wlSoVjAH3TslkWdryreWfIFyS6PFtkukPqp6iu6k=;
        b=LXsEOBqKOd15Ki+pYR61bVtYMBRigi5yBLP9kWdnCjKN1Swh9GjKCUwx0e3QhP41oi
         f6UJc+sH3LzMZoN5qWZvLMzAjEU16NRk8kTsJPTu7URZghySrGM6OTxY9fqqjuAyt3uB
         HxfziLk4zNdgSGfMY3vn4D+fHbIQTuh2zDQX0+0jzinbdY/BmlbbGmqBiBOcegI/b0tJ
         ojhMWWAwm3fDesTkzWreV/gkOS+mhpjHcAcqoqKZc4aFnm+M4kBRGIj5lV0WwPW/N7Pj
         2xkTKceWyv4TxlJ6s5uVbJ7Pb8+aahzzhlR9yxioAT2pJFcOEdxw0J2tRmXjARLs2pFt
         whlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vG1wlSoVjAH3TslkWdryreWfIFyS6PFtkukPqp6iu6k=;
        b=OX5aYvLffaHehUWAMEGSPz+pRrhT7g1J1oSKEDcdbgsqwXTxcMgiw/pPp6n1r9MMqL
         CGs2rRFBGBzAGXpv2l1HTYVZ9YriL21cI9S1oKqEbm5LKzafcBjNdMxytZ6aSgd6zcjL
         pBhfIjBrBmaEi2mIL9FoEOiKlxGCuHv1gijbiOetpA9nKfFbXpDMSIiGLaKQPoxGxG5u
         s1dyUL+xfbVSHw0hMorVPQwZDaR6Pw7vlCDN1IgYc2MS2AJleKjMuwO0t7R3hIXasGRq
         ZDIB3yMLExZClT1BbuF8HWpCn1HAzH8T1cZMLkuyeDf5Wtj907ij7E46GSBSz2Ww+u64
         vMdw==
X-Gm-Message-State: APjAAAXMRhsF/NRXWo3v/1ci3fGI/4AZtWVKdWT6f2TP+JVk2v79e0ya
        oUre7DTUrb3CMfk9cqugu9J4Ig==
X-Google-Smtp-Source: APXvYqzL207UMotVVbLIBySCNyQniimBEc7wiboiIj6T8IbhYFht01SBvULx1tt1kgQWqReZqGRDrQ==
X-Received: by 2002:a17:90a:ac12:: with SMTP id o18mr8782943pjq.93.1571800985488;
        Tue, 22 Oct 2019 20:23:05 -0700 (PDT)
Received: from localhost ([122.172.151.112])
        by smtp.gmail.com with ESMTPSA id f15sm19700257pfd.141.2019.10.22.20.23.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Oct 2019 20:23:04 -0700 (PDT)
Date:   Wed, 23 Oct 2019 08:53:02 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Nathan Chancellor <natechancellor@gmail.com>, broonie@kernel.org
Cc:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH] cpufreq: s3c64xx: Remove pointless NULL check in
 s3c64xx_cpufreq_driver_init
Message-ID: <20191023032302.tu5nkvulo2yoctgr@vireshk-i7>
References: <20191023000906.14374-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191023000906.14374-1-natechancellor@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22-10-19, 17:09, Nathan Chancellor wrote:
> When building with Clang + -Wtautological-pointer-compare:
> 
> drivers/cpufreq/s3c64xx-cpufreq.c:152:6: warning: comparison of array
> 's3c64xx_freq_table' equal to a null pointer is always false
> [-Wtautological-pointer-compare]
>         if (s3c64xx_freq_table == NULL) {
>             ^~~~~~~~~~~~~~~~~~    ~~~~
> 1 warning generated.
> 
> The definition of s3c64xx_freq_table is surrounded by an ifdef
> directive for CONFIG_CPU_S3C6410, which is always true for this driver
> because it depends on it in drivers/cpufreq/Kconfig.arm (and if it
> weren't, there would be a build error because s3c64xx_freq_table would
> not be a defined symbol).
> 
> Resolve this warning by removing the unnecessary NULL check because it
> is always false as Clang notes. While we are at it, remove the
> unnecessary ifdef conditional because it is always true.
> 
> Fixes: b3748ddd8056 ("[ARM] S3C64XX: Initial support for DVFS")

+broonie, who wrote this patch to see his views on why he kept it like
this.

> Link: https://github.com/ClangBuiltLinux/linux/issues/748
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  drivers/cpufreq/s3c64xx-cpufreq.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/cpufreq/s3c64xx-cpufreq.c b/drivers/cpufreq/s3c64xx-cpufreq.c
> index af0c00dabb22..c6bdfc308e99 100644
> --- a/drivers/cpufreq/s3c64xx-cpufreq.c
> +++ b/drivers/cpufreq/s3c64xx-cpufreq.c
> @@ -19,7 +19,6 @@
>  static struct regulator *vddarm;
>  static unsigned long regulator_latency;
>  
> -#ifdef CONFIG_CPU_S3C6410
>  struct s3c64xx_dvfs {
>  	unsigned int vddarm_min;
>  	unsigned int vddarm_max;
> @@ -48,7 +47,6 @@ static struct cpufreq_frequency_table s3c64xx_freq_table[] = {
>  	{ 0, 4, 800000 },
>  	{ 0, 0, CPUFREQ_TABLE_END },
>  };
> -#endif
>  
>  static int s3c64xx_cpufreq_set_target(struct cpufreq_policy *policy,
>  				      unsigned int index)
> @@ -149,11 +147,6 @@ static int s3c64xx_cpufreq_driver_init(struct cpufreq_policy *policy)
>  	if (policy->cpu != 0)
>  		return -EINVAL;
>  
> -	if (s3c64xx_freq_table == NULL) {
> -		pr_err("No frequency information for this CPU\n");
> -		return -ENODEV;
> -	}
> -
>  	policy->clk = clk_get(NULL, "armclk");
>  	if (IS_ERR(policy->clk)) {
>  		pr_err("Unable to obtain ARMCLK: %ld\n",
> -- 
> 2.23.0

-- 
viresh
