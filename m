Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C10D925CB7C
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  3 Sep 2020 22:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729240AbgICUtE (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 3 Sep 2020 16:49:04 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39476 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728397AbgICUtD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Sep 2020 16:49:03 -0400
Received: by mail-wm1-f67.google.com with SMTP id b79so4157839wmb.4;
        Thu, 03 Sep 2020 13:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TTR4ZevWbBTzzWBk5Ftm+jdBL57hcsdTyw/U1bSsOcE=;
        b=r691mwlEN1DZRFY5CzBJjooZAKjA+OIV1MMR7EI1j3jj/s+AqooIGCUEWQexXAycWg
         FXCQkxO+osEOBsBvKDnbOxYpOU7g5g6gOM39OsWTr2xk6ZeiMMTnfFKbbnmht4dm4vad
         zdu8v2V+/ftDGnv7v9zMxdRxSKE9u1I0M30BO05AmUk03fGsi46pWHH9mCDUSXg88fte
         KcT42HaACAncF68B+pBsoeOBWVAQ/Z0QkVuR/pcMjuhJdp0wyJwBbruxR5EwMRXKiBwC
         u0vZUTv14+3otg7wiA4HErum/PH+r6SxkuKXFxCb8HxFf1oXzH+b+metDE7XBBuviO3Z
         TyIw==
X-Gm-Message-State: AOAM533rDYF9NMRM9QwHgnpycG+ts3BpcVmuJP52CyvYhq2Y1+8qq2+v
        wa+5mts6m6+SwACxxyllBFQ=
X-Google-Smtp-Source: ABdhPJxbAqG+Z7hrWdt6vHYFdCHeNv0eFaCop/ZdMBXFkp4runoehm2xwhF/xenMGGhJzuf0hgPGCg==
X-Received: by 2002:a1c:234d:: with SMTP id j74mr4123561wmj.157.1599166139821;
        Thu, 03 Sep 2020 13:48:59 -0700 (PDT)
Received: from kozik-lap ([194.230.155.106])
        by smtp.googlemail.com with ESMTPSA id j7sm6108628wrs.11.2020.09.03.13.48.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Sep 2020 13:48:58 -0700 (PDT)
Date:   Thu, 3 Sep 2020 22:48:56 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: Re: [PATCH 01/13] ARM: dts: exynos: Correct compatible for Exynos5
 GIC
Message-ID: <20200903204856.GA20285@kozik-lap>
References: <20200901075417.22481-1-krzk@kernel.org>
 <20200901075417.22481-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200901075417.22481-2-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Sep 01, 2020 at 09:54:05AM +0200, Krzysztof Kozlowski wrote:
> Exynos5250 and Exynso54xx SoCs have ARM GIC 400.  Correct the
> compatibles to match dtschema and fix the dtbs_check warnings like:
> 
>   arch/arm/boot/dts/exynos5420-peach-pit.dt.yaml: interrupt-controller@10481000:
>     compatible: ['arm,gic-400', 'arm,cortex-a15-gic', 'arm,cortex-a9-gic']
>     is not valid under any of the given schemas
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/boot/dts/exynos5.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied 1-10.

Best regards,
Krzysztof

