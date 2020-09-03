Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F71625C733
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  3 Sep 2020 18:42:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729010AbgICQm1 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 3 Sep 2020 12:42:27 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:34838 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728937AbgICQm0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Sep 2020 12:42:26 -0400
Received: by mail-il1-f196.google.com with SMTP id l4so3324494ilq.2;
        Thu, 03 Sep 2020 09:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6Sphnv+kZz9m5G/Scys4rI5dlFuqK5i9UXTX5h29xxM=;
        b=rFfdjeR0lusgfyMKrA9Ay15UK55vm4CQwQ8SyN6Gjov91NnaBjX1PxkZp+7UPWK3KT
         L75mOga0AO4pLXU3l+7mgAdrVvtEVXvRAPaHO6e+W47EbUFcdi6z9TYuEGhlTBke68Yr
         PMEZGAGgo2y8Fo4YZ/BuybuX/vtKAWrkOof8WeD5UsVwqbFKzKGEIJ+ieUQEf/W7X1+/
         IXdgDjkQPDjh09qntHy32jYtrG7zudeRpS+tIFNcJsREBL4V9QzYokWhyEiBwbVz50Nr
         eXfCdeSi2TI+Bm/foJixoH95GMsyNhcN6ATQz/UlD3UD1YrqynPe41k61g/UEJwQ5fQ6
         bG2g==
X-Gm-Message-State: AOAM533RBaB0I7BDYhl+DnW720ORH9MRcxOtUSdURsevqG5XFWS7llpL
        i8BK/Vyf9cQ0kQ48fEFwoQ==
X-Google-Smtp-Source: ABdhPJyf5z2NqnEUDQWThMqUbFgeD+F0Z4y8wVXxVNOYbxoIN6ARDFco2WA47g884qz86E7kb3prsQ==
X-Received: by 2002:a92:bf0a:: with SMTP id z10mr4215186ilh.39.1599151345148;
        Thu, 03 Sep 2020 09:42:25 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id p78sm1578646iod.0.2020.09.03.09.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 09:42:24 -0700 (PDT)
Received: (nullmailer pid 2924166 invoked by uid 1000);
        Thu, 03 Sep 2020 16:42:23 -0000
Date:   Thu, 3 Sep 2020 10:42:23 -0600
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
Subject: Re: [PATCH 02/10] dt-bindings: gpu: arm,mali-midgard: Use
 unevaluatedProperties
Message-ID: <20200903164223.GA2923881@bogus>
References: <20200829142501.31478-1-krzk@kernel.org>
 <20200829142501.31478-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200829142501.31478-2-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, Aug 29, 2020 at 04:24:53PM +0200, Krzysztof Kozlowski wrote:
> Additional properties or nodes actually might appear (e.g. operating
> points table) so use unevaluatedProperties to fix dtbs_check warnings
> like:
> 
>   arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: gpu@14ac0000:
>     'opp_table' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

NAK. See https://lore.kernel.org/r/CAL_JsqKPXJxsHPS34_TCf9bwgKxZNSV4mvQR-WKRnknQVtGGxQ@mail.gmail.com/
