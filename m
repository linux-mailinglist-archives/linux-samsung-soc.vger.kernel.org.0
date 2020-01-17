Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55FCC141123
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 17 Jan 2020 19:52:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbgAQSwE (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 17 Jan 2020 13:52:04 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:43541 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726897AbgAQSwE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 17 Jan 2020 13:52:04 -0500
Received: by mail-ed1-f68.google.com with SMTP id dc19so23209899edb.10;
        Fri, 17 Jan 2020 10:52:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iADPKHK7d3ydzoFY9n3Dkar3ylgJnVIkMCKC9IngmZs=;
        b=XEHn9q74Q1Xfhv1QEjvJRzilcAvggvC4nE7R20Yu8yxcyglotDMjlVmjDiukqVWwPl
         JQRO8Kl+hJXfvhfbS+UXWxnfOrlghNkiJnoKaBx4gUUAvjHiCpAWKXGj1NGWu2YWs/bE
         1Y9kkmlb+FQ/lMcFvNDgwpi5WkVXKf1fC2tJINAemorWDU4Tv8Tmuz/5VpSA34X3GB4t
         s6dH1zzp/MxWGnvmWbqrNTMmEmfsJq5NAISO2Y6VY0TtgBHPdFXq0673egGsOFlt4xZ7
         UrmYs6ROwzrCdAndxDgQ8FYvfB5PCJj0wKNhiNKN+ggQsmBrgZ9ZWVhfrtBZKKrODI30
         rdHA==
X-Gm-Message-State: APjAAAWhFs0Is7u7st8UnC3kIp+wHSG5A78dkYL87HQ6KYgrdah1V5yy
        PGLvGtYtXD/KS6c25nHtZotFSdSC
X-Google-Smtp-Source: APXvYqzcraweFJDWFwGlf398rI/rRGx+XFkYWj0pg0IGtLTVPQOLZdqfXwp5uo+D0DDaQqKj9Y4jYw==
X-Received: by 2002:a50:cc08:: with SMTP id m8mr5477698edi.263.1579287122537;
        Fri, 17 Jan 2020 10:52:02 -0800 (PST)
Received: from kozik-lap ([194.230.155.229])
        by smtp.googlemail.com with ESMTPSA id x8sm999836eds.88.2020.01.17.10.52.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jan 2020 10:52:01 -0800 (PST)
Date:   Fri, 17 Jan 2020 19:51:59 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 1/3] ARM: dts: exynos: Add GPU thermal zone cooling maps
 for Odroid XU3/XU4/HC1
Message-ID: <20200117185159.GA3772@kozik-lap>
References: <CGME20200117123454eucas1p2a7a3a6b64fae5382ef404ac2542aa4b3@eucas1p2.samsung.com>
 <20200117123448.13807-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200117123448.13807-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Jan 17, 2020 at 01:34:46PM +0100, Marek Szyprowski wrote:
> Add trip points and cooling maps for GPU thermal zone for Odroid
> XU3/XU4/HC1 boards. Trip points are based on the CPU thermal zone for the
> those boards.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5422-odroidhc1.dts    | 32 ++++++++++
>  .../boot/dts/exynos5422-odroidxu3-common.dtsi | 59 +++++++++++++++++++
>  2 files changed, 91 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5422-odroidhc1.dts b/arch/arm/boot/dts/exynos5422-odroidhc1.dts
> index f163206265bb..8f38ef5bff55 100644
> --- a/arch/arm/boot/dts/exynos5422-odroidhc1.dts
> +++ b/arch/arm/boot/dts/exynos5422-odroidhc1.dts
> @@ -215,6 +215,38 @@
>  				};
>  			};
>  		};
> +		gpu_thermal: gpu-thermal {
> +			thermal-sensors = <&tmu_gpu 0>;
> +			polling-delay-passive = <250>;
> +			polling-delay = <0>;

These should not be needed - you do not add more than 4 thermal zones.

Best regards,
Krzysztof

