Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4ABAB65BEB2
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  3 Jan 2023 12:11:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236816AbjACLLc (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 3 Jan 2023 06:11:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236914AbjACLLF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Jan 2023 06:11:05 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EF36B4A6
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Jan 2023 03:11:04 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id bp15so45170087lfb.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Jan 2023 03:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9D5LFOOL7M248RT3YKkgzKFTBRXhYh2dkwaJ1IaRHxA=;
        b=EnOEatK+DA5jF5hkgO1d9SjyfsSx+JiDXvYMOfqMv+LZMR6PCSVgIVzkVR58uboHuD
         qeDlDmM7YhSAjXKD0MUkL+bsKd0nAjQoXKlLEliz8pFBAu894A9JJjYiW/y4VrnhYdlT
         Rya9NYCDUqRobuLp/HaPfCwfndMc56IcsUPtfQXI0zmqc3/AD+cnQ1uBizkLuNQUFOEb
         xnjtEH8onQteF23DbXjfYq48XFV+OUj5/QKDmNKebwbWMX3qAYAYjk9P8m2c5sSsPCoo
         jsk98/REB0LQ3eeGj2WJhFRdl+vP5GHD//P2d+bCyvIZhsLlujymbK5JPJH7YOhoh7si
         vz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9D5LFOOL7M248RT3YKkgzKFTBRXhYh2dkwaJ1IaRHxA=;
        b=x4njd7HVFn059syfkkptvR5ZlzQ4ny31HaYeCd58OYHvaakDO/CaTZd6EDPbafZgTW
         Klwq6OWosMOU/dGREL3jG0HfitYCHY2vEU/CSs2PkUsIq4KeLdhU+H21iR/aj/k5Xvtj
         XlpN9SNd63p3Bp1iguAPPSbfLA5N3VA60vDunSCx6m+ohbMDKGozCE4Ke8zzuwNz8LfR
         mEgH6LpRWcsJLidOi0ZQSKIEOOIy7WPC0svE+PPn3kChOGmrEoKxESCxT65ilJ7EIfKT
         shAsQm56mLAKaRT6KLb+cqoBbCLztMQQYB6+Pv3oFkUEiGzCzNLGy8bAg7hh6WZ+h1AI
         Tjiw==
X-Gm-Message-State: AFqh2kpRCM6W9bUvEJ3H02/FZo8ScHOYp/WNOu0fEPzoSCWmgdil/hQV
        rXij+Ao5iMKuum9rpjcMO4pBKg==
X-Google-Smtp-Source: AMrXdXuAKQ0YTIV1hBpWs/3wrPMP3yAYJaFJ9eyf/qO07z2O81ePy+C/Oezlg0JBhGYsf5BvJNWYhA==
X-Received: by 2002:ac2:5b41:0:b0:4a4:68b9:66dd with SMTP id i1-20020ac25b41000000b004a468b966ddmr12722492lfp.40.1672744262769;
        Tue, 03 Jan 2023 03:11:02 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id w16-20020a05651234d000b004b57a253deasm4792967lfr.162.2023.01.03.03.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jan 2023 03:11:02 -0800 (PST)
Message-ID: <b3ec1abe-7fb4-0c12-33b6-9f4e8d03f8b2@linaro.org>
Date:   Tue, 3 Jan 2023 12:11:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 4/5] arm64: dts: fsd: Add codec node for Tesla FSD
Content-Language: en-US
To:     Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>,
        lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, s.nawrocki@samsung.com,
        perex@perex.cz, tiwai@suse.com, pankaj.dubey@samsung.com,
        alim.akhtar@samsung.com, rcsekar@samsung.com,
        aswani.reddy@samsung.com
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20230103045613.100309-1-p.rajanbabu@samsung.com>
 <CGME20230103045703epcas5p2344520777efa3c06321732e2784e6c6c@epcas5p2.samsung.com>
 <20230103045613.100309-5-p.rajanbabu@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230103045613.100309-5-p.rajanbabu@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 03/01/2023 05:56, Padmanabhan Rajanbabu wrote:
> Add device tree node support for codec on Tesla FSD platform.
> 
> Signed-off-by: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
> ---
>  arch/arm64/boot/dts/tesla/fsd-evb.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> index cf5f2ce4d2a7..e2fd49774f15 100644
> --- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
> +++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> @@ -10,6 +10,7 @@
>  
>  /dts-v1/;
>  #include "fsd.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
>  
>  / {
>  	model = "Tesla Full Self-Driving (FSD) Evaluation board";
> @@ -34,6 +35,18 @@
>  	clock-frequency = <24000000>;
>  };
>  
> +&hsi2c_5 {
> +	status = "okay";
> +
> +	tlv320aic3x: codec@18 {
> +		#sound-dai-cells = <0>;
> +		compatible = "ti,tlv320aic3104";
> +		reg = <0x18>;

First compatible, then reg, then the rest.

> +		reset-gpios = <&gpg1 6 GPIO_ACTIVE_LOW>;
> +		status = "okay";

It's by default. Why do you need it?

Best regards,
Krzysztof

