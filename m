Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1C8CE28AE
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 24 Oct 2019 05:13:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392397AbfJXDNp (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 23 Oct 2019 23:13:45 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:47002 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390589AbfJXDNo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 23 Oct 2019 23:13:44 -0400
Received: by mail-pf1-f196.google.com with SMTP id b25so125483pfi.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Oct 2019 20:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/FvSWUTwb3VLZA0Xf0z7RcCEXwmqXYbk21bOLI6Ind8=;
        b=sKQkrmUmxlXGiYByd2i7MTXHlCBZpoduhmNKTn2b+4WTlEd9sqJxIlyZ+kwj6qCQt6
         4BIQumt//PtptZYr9DJp8O83ejzzIWb9zwkVqmB0Bf2/fPyoyBokiTWczNosOTRJQ5OY
         TLsGSWJWUIqamq4uD2ohoSqBavspu6j21L7o1rk5kyPzqVK/v/sq46u+fuxiWDYmaZ4u
         AU0XcEHw1+rfCDqi9jXvViNv+pLj3EIXq/XhytlYWlx5bJCiOL1x2+v0vl7i5PZFoOwt
         92BmIjiD3QDTfjY55Bk/GHBfFrBfes9X4OtcC3occLA7hH0pVPFddwHx3uWXMfnirMB3
         pcLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/FvSWUTwb3VLZA0Xf0z7RcCEXwmqXYbk21bOLI6Ind8=;
        b=sy3xMq+W3EDFFNiex6ahMNHmcg8ySGBRLRXw+rX6dvWIdBTCUbiNjyA4IrJOjhRmyu
         2qKB5fXqSaNSYJ68T9DkdRPCwOVvl6Em6Dy1Md37fYZqp9djEUrT/7q1pXmBRkHtYA6w
         3RMRu5GIIXCrKoJr9I+pYUWjwPTBBdy3daKkiZXSfsao9XMPToGicVvKcn9JobufICeS
         K9VSGjaxrgs6TuzghlwWUPm74nZjf2v0wMTvd+ztIXr2WAr9QMaa79Q39Cn+/HWzW3Th
         1fEvitHIZCXAhCl2879KrthWxwoA7xRt5gvvqolJREmP+HNIP7aTuUuLCr0BQneKnc1N
         bntg==
X-Gm-Message-State: APjAAAVBXAsO7Sdu8kCtgo6/0pv0KRmk8Rh/+OXn2B+1MoO2fBnCI1tt
        qy1UlSgf0552lVPbgwQhQH7wEg==
X-Google-Smtp-Source: APXvYqydSOmNxbN/vYtkU1iPjd1cVFUew/aXCub1UINvWE/D7AIfNj9Kf6waQGQolR3SBvI3HEafpw==
X-Received: by 2002:a63:1b59:: with SMTP id b25mr13990872pgm.267.1571886823938;
        Wed, 23 Oct 2019 20:13:43 -0700 (PDT)
Received: from localhost ([122.172.151.112])
        by smtp.gmail.com with ESMTPSA id x12sm23593463pfm.130.2019.10.23.20.13.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Oct 2019 20:13:43 -0700 (PDT)
Date:   Thu, 24 Oct 2019 08:43:39 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH] cpufreq: s3c64xx: Remove pointless NULL check in
 s3c64xx_cpufreq_driver_init
Message-ID: <20191024031339.qaoh3p5efmaawslq@vireshk-i7>
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
> Link: https://github.com/ClangBuiltLinux/linux/issues/748
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  drivers/cpufreq/s3c64xx-cpufreq.c | 7 -------
>  1 file changed, 7 deletions(-)

Applied. Thanks.

-- 
viresh
