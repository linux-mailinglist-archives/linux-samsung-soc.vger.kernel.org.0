Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF66325C72A
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  3 Sep 2020 18:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728344AbgICQlz (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 3 Sep 2020 12:41:55 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:39106 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728500AbgICQlw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Sep 2020 12:41:52 -0400
Received: by mail-io1-f65.google.com with SMTP id b6so3607460iof.6;
        Thu, 03 Sep 2020 09:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Wd2vM2P8GP7stt4qpcMkqIPITIt3Ct2eJFilR5ppWPI=;
        b=k50DIZk3FeWW103BfeRi0BBg+QwILKZF+IVnsWKlU8YQ7sWmxq3Nxvei2xUmsz1egC
         uhy7P4ZnmyjWQQNo9U/M6nTF3g2HUJNfP4USIkBkG7F21NvJB16nEjtdi5IKmlqqGsDb
         VAbx/2ZpL1fF40veiIq4GY0/U0xt5ukVMfnWfdMU4asPv0Wg2NQqCOTjzXS0pKhy61KD
         3CMGoKKxSKilencqW6j4MIrulg87g4NU6RUkDpaA0ZsK+iTLsmAkvw11Xk9j8mN6I7Zg
         pPL06FhjWPSWcGa5rHURnCYrzLoDvONxP4fX7KSw+WxN8fuQnUkfmc75chCrYlobQPwL
         291Q==
X-Gm-Message-State: AOAM530AnHzIsUPk/YRP9V+38IBcrlY4FAln2AWKAsZuwxfLfHThJw0Z
        YWpyzOo9l3QMnV75uw/+8Q==
X-Google-Smtp-Source: ABdhPJzDecNUqKQf1RpxUDZRVZ3zNdbS9KNP+UvJxBO5cwkdQiDLk1fX4u9oDum9yV0Oyy8pM76AHg==
X-Received: by 2002:a6b:8fc9:: with SMTP id r192mr3940678iod.24.1599151311395;
        Thu, 03 Sep 2020 09:41:51 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id k16sm1482659ioc.15.2020.09.03.09.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 09:41:50 -0700 (PDT)
Received: (nullmailer pid 2923306 invoked by uid 1000);
        Thu, 03 Sep 2020 16:41:49 -0000
Date:   Thu, 3 Sep 2020 10:41:49 -0600
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
Subject: Re: [PATCH 01/10] dt-bindings: arm: samsung: pmu: Use
 unevaluatedProperties
Message-ID: <20200903164149.GA2922901@bogus>
References: <20200829142501.31478-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200829142501.31478-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, Aug 29, 2020 at 04:24:52PM +0200, Krzysztof Kozlowski wrote:
> Additional properties actually might appear (e.g. assigned-clocks) so
> use unevaluatedProperties to fix dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: system-controller@105c0000:
>     'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/samsung/pmu.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

NAK. See https://lore.kernel.org/r/CAL_JsqKPXJxsHPS34_TCf9bwgKxZNSV4mvQR-WKRnknQVtGGxQ@mail.gmail.com/
