Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6257123F34
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 18 Dec 2019 06:42:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbfLRFm3 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 18 Dec 2019 00:42:29 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42517 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725897AbfLRFm2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 18 Dec 2019 00:42:28 -0500
Received: by mail-pf1-f196.google.com with SMTP id 4so567848pfz.9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Dec 2019 21:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xV4KfJlK4YlnhchUUwxKnteaYwdyYGzcZQcMfxQtzso=;
        b=pEEICwashl/t9nYsbZJNVLzXODux5zOMFmXSAptDtsF9vUIfUAI33C2FPralqEaTvY
         1MlZvXRJ4hKdvSRnd4S8+a9babevrFB/uNOVs0XpWwZIZ96uuWorNIbZ3YqkN35i5qaH
         SPRYJrHojpcfB2XlcMwpI8elGpnb94JQJ4orUHclz5Y6aXFEPkfiISDLVxJI95F2uDeb
         tGy4zO4ZbaehRmteUSqEvXYKbcTGCNBMcdcHb0ez7MRkewuR7EOejC0HcZZ+8XsvUPRC
         pk7grQlH5jvmB3CTeiE6n5qJXboxfhhCFXe8qNNWppwOECUgyfrFu/ykxBxUSaARYREH
         ZH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xV4KfJlK4YlnhchUUwxKnteaYwdyYGzcZQcMfxQtzso=;
        b=B8uZMQSGBl8t17BwRJJ/69RgQ+IQwskgWImpdDPlhRiuHdUq98R0Zv6K9o7FugaILq
         sTpB05LK/EUlpLbzh0bwGWxCVS7KKfV9awdOhgnP6P5WEgry2Kycx3DIxOPUVWOdBFe/
         GK//W+o6AHzba1ux1ZEQjdkhveKc02Y0OlVDoHIZrzAGTdF5eQ9Xv03iyzSxavCzhkWS
         gk29Gu1cFmGyWg8j7WJyMiy3OR9NUQoPc8++6a4BaVdQ+t5gcW4/2gzBxV/V6ABMpVQ/
         C9qZaJuSvId6EDGYPRHTszoFp6IrSINqfFzUNM5c1QrxmndN2csmOW1kkEImpKRJAO0e
         qMAg==
X-Gm-Message-State: APjAAAUZgCdQ1LiU6Q80q6lUTeATKRWfVP3oiXXWW/ilutJ1Jms95QoQ
        j8x+GiAJtsAgjE9GxQr6q6bVPQ==
X-Google-Smtp-Source: APXvYqyWesdIIO3qxjlP7JTHe12xBW/M910oPFrSVXRrjw3E1ufF2TfARQMbp5ECnXSXj86QKLMFmg==
X-Received: by 2002:a63:5d03:: with SMTP id r3mr957260pgb.306.1576647747835;
        Tue, 17 Dec 2019 21:42:27 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id g7sm1139962pfq.33.2019.12.17.21.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 21:42:27 -0800 (PST)
Date:   Tue, 17 Dec 2019 21:42:24 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v2 2/4] ARM: dts: qcom: Correct USB3503 GPIOs polarity
Message-ID: <20191218054224.GE448416@yoga>
References: <20191211145054.24835-1-m.szyprowski@samsung.com>
 <CGME20191211145213eucas1p2c438f848ba705fa407331bb31b03b626@eucas1p2.samsung.com>
 <20191211145208.24976-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191211145208.24976-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed 11 Dec 06:52 PST 2019, Marek Szyprowski wrote:

> Current USB3503 driver ignores GPIO polarity and always operates as if the
> GPIO lines were flagged as ACTIVE_HIGH. Fix the polarity for the existing
> USB3503 chip applications to match the chip specification and common
> convention for naming the pins. The only pin, which has to be ACTIVE_LOW
> is the reset pin. The remaining are ACTIVE_HIGH. This change allows later
> to fix the USB3503 driver to properly use generic GPIO bindings and read
> polarity from DT.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dts b/arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dts
> index 26160c324802..942e3a2cac35 100644
> --- a/arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dts
> +++ b/arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dts
> @@ -143,7 +143,7 @@
>  				compatible = "smsc,usb3503a";
>  				reg = <0x8>;
>  				connect-gpios = <&gpioext2 1 GPIO_ACTIVE_HIGH>;
> -				intn-gpios = <&gpioext2 0 GPIO_ACTIVE_LOW>;
> +				intn-gpios = <&gpioext2 0 GPIO_ACTIVE_HIGH>;
>  				initial-mode = <1>;
>  			};
>  		};
> -- 
> 2.17.1
> 
