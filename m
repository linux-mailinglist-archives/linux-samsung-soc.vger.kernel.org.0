Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7191125C740
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  3 Sep 2020 18:43:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728358AbgICQnX (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 3 Sep 2020 12:43:23 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:40380 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728085AbgICQnW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Sep 2020 12:43:22 -0400
Received: by mail-io1-f68.google.com with SMTP id j2so3614440ioj.7;
        Thu, 03 Sep 2020 09:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Vm4YZ0rV7T1k22Okll5l0Zfn2qIEM+/b9DI6foS5uOU=;
        b=eIdixNMwVA1BSVf5r8j4q5hPyRPL52EpoEaisYI4aQUKS3ZJtjD4a6baafk9ylTD3A
         dA+WKOa0RclbuptiyB/EgsU6F0Gc9NqkJ6i8Ffs278hHSpakjmPIJ+UI0G3Pd6IAzkDA
         d84bU5urrpfRhGrjrz053Gq0NnMbY4DC+t1ebJpAuVYLR2GOnwxux16w+E5YWKesckt1
         krBb6UoMjv2AFFSHBIpeSTsjork0r0K0YCUlSNOkHq6NZKPULBczPeThK5KrXNqG2+/Z
         jV30eQu7NCj1+m5rstb6V1m/VutonmTEnPE1tgveaqpm+ncsNBxiGzKFaFtU4lZ0g4Qm
         kcUg==
X-Gm-Message-State: AOAM530monXh5Ei5z5cNobpSQRdBRSXcHOno1JSBzqK9FkDZvJ2WaPcT
        TdxEf5dW28Lw+OnQ4kGomA==
X-Google-Smtp-Source: ABdhPJxdGWvSm91m5o4p27kxDEJ3BksNrLtWiBafKboKccHq8iHXL8Nu/05NN9zEgfjXFSxDiBv6CA==
X-Received: by 2002:a02:834a:: with SMTP id w10mr4193188jag.63.1599151401695;
        Thu, 03 Sep 2020 09:43:21 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id w12sm1483444ioa.8.2020.09.03.09.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 09:43:21 -0700 (PDT)
Received: (nullmailer pid 2925553 invoked by uid 1000);
        Thu, 03 Sep 2020 16:43:19 -0000
Date:   Thu, 3 Sep 2020 10:43:19 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Kukjin Kim <kgene@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Lee Jones <lee.jones@linaro.org>,
        Sangbeom Kim <sbkim73@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        alsa-devel@alsa-project.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 06/10] dt-bindings: sound: samsung-i2s: Use
 unevaluatedProperties
Message-ID: <20200903164319.GA2925151@bogus>
References: <20200829142501.31478-1-krzk@kernel.org>
 <20200829142501.31478-6-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200829142501.31478-6-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, Aug 29, 2020 at 04:24:57PM +0200, Krzysztof Kozlowski wrote:
> Additional properties actually might appear (e.g. power-domains) so use
> unevaluatedProperties to fix dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: i2s@11440000:
>     Additional properties are not allowed ('power-domains', '#address-cells', 'interrupts', '#size-cells' were unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  Documentation/devicetree/bindings/sound/samsung-i2s.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

NAK. See https://lore.kernel.org/r/CAL_JsqKPXJxsHPS34_TCf9bwgKxZNSV4mvQR-WKRnknQVtGGxQ@mail.gmail.com/
