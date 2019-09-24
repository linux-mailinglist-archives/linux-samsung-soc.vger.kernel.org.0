Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08471BC757
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 24 Sep 2019 13:58:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388579AbfIXL6P (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 24 Sep 2019 07:58:15 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38224 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390022AbfIXL6P (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 24 Sep 2019 07:58:15 -0400
Received: by mail-wm1-f66.google.com with SMTP id 3so1725439wmi.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Sep 2019 04:58:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qhBDTOhtejpWE4OjD7U4GXEMklKBOqGbWbvirS5XTVw=;
        b=jTSGOvL7raE43t9gRRKEiD+6/gLz1x7UNhFGgk5cW68pUbZQIhjDqwHTe6Xl+NjSNU
         S++YF0j5tVOvIHsIp/Cy0QEcoUc3Lgx9213pns49biW4QRAQ/ewvGBuwAxdhhvft6mJJ
         2tOwtQ+WdhpJGsrIZgILskJJrc2M+Mcmp78UOJQcYgyz6ediLq65UUYce1NKLaMf7j1c
         gron0deSkmSYh7ZAWB/b0R0egozyy2eXT9mxc57+RUWQBnzaMgPfo5Z9UZSmMObk62uA
         6BTFzf2SmxvEy96wn9E+LdO7DOv9sxSwiM2I65RPEmJFC+PR5DOerNTB9G56yF1ciypR
         fF5A==
X-Gm-Message-State: APjAAAVyNeaZg9b9VSv4bWZov6pKfmzq3CWtWBmyGUBQFfekAU2sVDV5
        NOcngTJ4v0fRBwHeacC4pd44sI5e
X-Google-Smtp-Source: APXvYqwUMeIOpQ1cFiXU5Us6mdt75WswF0hY3V4REhusMF1SWfXIbEnO+whKPYOo2v63VJ9epQ9rKQ==
X-Received: by 2002:a1c:80ca:: with SMTP id b193mr2195787wmd.171.1569326292733;
        Tue, 24 Sep 2019 04:58:12 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id v64sm2446639wmf.12.2019.09.24.04.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2019 04:58:12 -0700 (PDT)
Date:   Tue, 24 Sep 2019 13:58:10 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maciej Falkowski <m.falkowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos: Add missing clock-cells property to
 Exynos3250 i2s node
Message-ID: <20190924115810.GA9218@pi3>
References: <CGME20190924115258eucas1p2d7dbc9fbfbcd5809a74ffeb71a703a8f@eucas1p2.samsung.com>
 <20190924115243.25702-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190924115243.25702-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Sep 24, 2019 at 01:52:43PM +0200, Marek Szyprowski wrote:
> From: Maciej Falkowski <m.falkowski@samsung.com>
> 
> '#clock-cells' is a required property for clocks provider, missing
> may cause compilation errors.

This needs to be explained better. What compilation errors did you see
(or expect)? As of now, there is no clock consumer for i2s clocks.

After adding clock-cells, the driver will register/provide its clocks,
so you add quite visible change without mentioning the effects in change
log.

Best regards,
Krzysztof

> 
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos3250.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
> index 190d9160a5d1..bf32e00334ce 100644
> --- a/arch/arm/boot/dts/exynos3250.dtsi
> +++ b/arch/arm/boot/dts/exynos3250.dtsi
> @@ -687,6 +687,7 @@
>  			interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cmu CLK_I2S>, <&cmu CLK_SCLK_I2S>;
>  			clock-names = "iis", "i2s_opclk0";
> +			#clock-cells = <1>;
>  			dmas = <&pdma0 14>, <&pdma0 13>;
>  			dma-names = "tx", "rx";
>  			pinctrl-0 = <&i2s2_bus>;
> -- 
> 2.17.1
> 
> 
> 
