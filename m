Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CB572DFAC8
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 21 Dec 2020 11:08:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbgLUKHo (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 21 Dec 2020 05:07:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbgLUKHn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 21 Dec 2020 05:07:43 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A553C0613D3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Dec 2020 02:06:34 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 3so10361262wmg.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Dec 2020 02:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=0Vv2JbmBAjngC3pMRGSx1cPuMWHtt6tiXQKcY+Kelgw=;
        b=TLglt5AQvjZgZmdtnh/EyevOANMYsHXzcV/JGMkqoYtFMBAB4kYQ/FqDpNBbyLj48D
         YFxH24jMq6+64MYkJlnI6seNq47sfrXEI+5MhdutCJwZVSkm48VuGXPf1v1VNOJsdxlv
         iHthvFWR/wkc83nv1NiMeo2ZqObxpNRmpONRObi9+XxrKHLCmAkJ/phEI4ldc2oInkdo
         JUHNZwIT9NV6u4DS+PMxv7l3sd8oxRa1+zUHbr+0w0Qmq4tLYEe2EE/qyUhhFL/1NBbX
         Ay/tfe9NA/6jbseLr44dJdVM/Q9g5/cYjg5ReXw9X+mdgjkMjyKP0GxowkASkcKWE3Ii
         DiIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=0Vv2JbmBAjngC3pMRGSx1cPuMWHtt6tiXQKcY+Kelgw=;
        b=OTZtc0f3H7CTBSU0IatXM+F5F1HZ4i4Q9WPBL2gScIQQTl3h8IC1zbMXOeTr42hP4f
         XVHyEiXt95t3+X4yUBxk/zzWl1smRRbuT0elXBx2GRcSEiE2x4AOmU+O1Avpnf9k1olF
         xvWJ3Ak+bvOitaXf/v6GEUoFrd+B5ABa1xuoEZoMN5yimkoKtFLLjg680Yfn0hDfV5OY
         afHc1dVue9lDo2YnmDWZoOs8lsCuapiI8F2H97wzCxWLHY1iHwcO+Dpt7ImLuhMdEvac
         wu9tdQCic+ahMxmeRQbwaUV8eL9+BRblniDkY2S7ijhGi22v4xCa3thSu2ln4KAmvRql
         Zhxw==
X-Gm-Message-State: AOAM533CN3pb+3UUzgnLrSEnUW6Qgv6eIaztAMaFH2WdAMlq4Bo3oqSO
        3TcjkV4Mj8HJXWzU3cfiMLkY4E5rNdrUcElJ
X-Google-Smtp-Source: ABdhPJwV1UaD4rwmRRKU3eYSK2VySTMJPM9TCAXi8auRr8LxcUXt/74B0bP1dkXBIbzejKLTyh/UWg==
X-Received: by 2002:a1c:7d58:: with SMTP id y85mr5910588wmc.50.1608544757077;
        Mon, 21 Dec 2020 01:59:17 -0800 (PST)
Received: from dell ([91.110.221.144])
        by smtp.gmail.com with ESMTPSA id e16sm27858733wra.94.2020.12.21.01.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 01:59:16 -0800 (PST)
Date:   Mon, 21 Dec 2020 09:59:12 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Timon Baetz <timon.baetz@protonmail.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 2/6] power: supply: max8997_charger: Set CHARGER
 current limit
Message-ID: <20201221095912.GB53991@dell>
References: <20201202203516.43053-1-timon.baetz@protonmail.com>
 <20201221095001.595366-1-timon.baetz@protonmail.com>
 <20201221095001.595366-2-timon.baetz@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201221095001.595366-2-timon.baetz@protonmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 21 Dec 2020, Timon Baetz wrote:

> Register for extcon notification and set charging current depending on
> the detected cable type. Current values are taken from vendor kernel,
> where most charger types end up setting 650mA [0].
> 
> Also enable and disable the CHARGER regulator based on extcon events.
> 
> [0] https://github.com/krzk/linux-vendor-backup/blob/samsung/galaxy-s2-epic-4g-touch-sph-d710-exynos4210-dump/drivers/misc/max8997-muic.c#L1675-L1678
> 
> Signed-off-by: Timon Baetz <timon.baetz@protonmail.com>
> ---
>  drivers/mfd/max8997.c                  |  4 +-

Please split this out into a separate patch.

>  drivers/power/supply/max8997_charger.c | 94 ++++++++++++++++++++++++++
>  2 files changed, 96 insertions(+), 2 deletions(-)

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
