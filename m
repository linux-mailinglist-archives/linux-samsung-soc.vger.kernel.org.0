Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27BF52661C3
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 11 Sep 2020 17:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbgIKPDn (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 11 Sep 2020 11:03:43 -0400
Received: from mail-ej1-f68.google.com ([209.85.218.68]:45372 "EHLO
        mail-ej1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726274AbgIKPCf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 11:02:35 -0400
Received: by mail-ej1-f68.google.com with SMTP id i26so14191504ejb.12;
        Fri, 11 Sep 2020 08:00:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0ZsoGj1RzPrf2TRsjqQZWuaKEAUJYQqnu3wsCh7rZCw=;
        b=qFwhQqwb/xa73XZ7nGMIWBO+n6aPHSodlL03kdpMIi4HRPxLx5YRPbU9EhTKfaQrt+
         f3scAucAj+qdG7Z/YOhtIEMf0xlM9xD+VZPIJ0RS19nV5RtBN7OMbsw21sr0UiXUwT/O
         BY6SIrxGvYW/0RSEJHo4n2UjUW5UZg9u1I0UiAa6+9pKs9s09hrSYb3VaAsx/slLpyz3
         898HanR0GpinppPSxPSSbxGlbyUAYOHcMoIRBWZfnDO9ML/reuwbBulA3itfa+Eujx//
         qy02XJJ/hJis2LXQ8r5Dp6zckxZVLCwJuXaWP86Jp9QNrs+S9Uqq9Kf2TKkapfTPR2Y2
         PYmw==
X-Gm-Message-State: AOAM5312FACi835mFbzP+ekdUwNFN8ysqyyoxa24MlAg5VU2efEceBaV
        356iC01hOvTsfMRN9dFhmjUHjJpQkwutlQ==
X-Google-Smtp-Source: ABdhPJwZHiY5Rfa19iuLEAR/VPmA/pAeV2n2uyQ7Ar6ijYqLwqvPzkQh/DM3V9GvYiSZDa+BoTXlCg==
X-Received: by 2002:a05:6402:78b:: with SMTP id d11mr2469596edy.341.1599835573944;
        Fri, 11 Sep 2020 07:46:13 -0700 (PDT)
Received: from kozik-lap ([194.230.155.174])
        by smtp.googlemail.com with ESMTPSA id d24sm1818951edp.17.2020.09.11.07.46.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Sep 2020 07:46:12 -0700 (PDT)
Date:   Fri, 11 Sep 2020 16:46:10 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sangbeom Kim <sbkim73@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kukjin Kim <kgene@kernel.org>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: exynos: Remove undocumented i2s
 properties in Exynos5433
Message-ID: <20200911144610.GA15290@kozik-lap>
References: <20200903203250.19830-1-krzk@kernel.org>
 <20200903203250.19830-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200903203250.19830-3-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Sep 03, 2020 at 10:32:49PM +0200, Krzysztof Kozlowski wrote:
> Few I2S device node properties were not documented and not used by any
> of the drivers.  Remove them to fix dtbs_check warning:
> 
>   arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: i2s@14d60000:
>     Additional properties are not allowed ('samsung,supports-rstclr', 'samsung,supports-tdm',
>     'samsung,supports-6ch', 'samsung,supports-low-rfs' were unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 4 ----

Applied.

Best regards,
Krzysztof

