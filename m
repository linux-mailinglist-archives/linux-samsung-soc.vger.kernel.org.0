Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72EE852ECC0
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 20 May 2022 14:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236824AbiETM6Y (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 20 May 2022 08:58:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235847AbiETM6X (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 May 2022 08:58:23 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B9331356BD
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 May 2022 05:58:22 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id m6so9606142ljb.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 May 2022 05:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=aeapaOijB00yQtCta6NrjrtjqIImLzdoafEOBkLpSjM=;
        b=KjHR71XVuV4Ub6uPBCHGc/jZyzurj/ailaMNlwtGOOmMqDyBab8A6VpmrJSTqsZhSE
         MrDo/aj/5llE++qny3f5ZbajbVCfcObaxUdbsKAA8DlXx/amh0O5tcWpmUBzdWj01s2N
         B9UB3NDOe6oNwnk1LaS9PQpJxpZ2+l5tcfpklWN3acSKa4PGz//qzOK/S5UiWz26g+b4
         L0F5ri8gCCsNcsXX1iQ8bRTSs2A0W23kny9uCVQzg3gopHiSb6Q71e7USc6oJ1E/UW5O
         J0XHEuHY0o8iUg2NPmPbFQeuP3QN1bD4pObrDyn7i53no8pA/CHeREtRnOk0CcLo6xhk
         Vihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=aeapaOijB00yQtCta6NrjrtjqIImLzdoafEOBkLpSjM=;
        b=nuZSIQMlcW4g7c+C2AhBii5j47lTV40Ke7V/XrOzJ1lHidgRfFjUIv1rk6IKIAQEAB
         RqlfGQGsj27zi5tw/tbVhdJymRZMW8dFBv0LQydrVUkcvUxbr71axNl9lWBPRpnF+7Fl
         7+GO35ytgIMs8sLr2DxB93Eg4xxS8VnwR5rybps2+Jm9/ZHEajMlnzho6dzoBORI1foc
         TGO6HAyCmFZXVNvKLUxQE5hJC7jmQJAM5dK4Eb6dnRVunjRdYUhaM2TEYt5ZhYe5hQdD
         v+2at20LNGkBPCn3G9Fsjv//Vu00dGgGLr3pEXitY2VrEDsJu+SHSxkOap+DACjp9mVJ
         hI+Q==
X-Gm-Message-State: AOAM5319WJyLc8GmqrWCzxb0MkWX9l6mcYAFw38LkjnZgTmEDw7NGRff
        VRGDj3rUXy7Y2yNex3EvbNnAEA==
X-Google-Smtp-Source: ABdhPJw1UvwBwLdvxqidDQeWy6ThNK1RdVnumUbK3Ky3x9onS0wk6E+ldWRGtQWBJaZsUAT8uvjFIg==
X-Received: by 2002:a05:651c:1792:b0:235:1df3:7b8e with SMTP id bn18-20020a05651c179200b002351df37b8emr5506765ljb.464.1653051501002;
        Fri, 20 May 2022 05:58:21 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id m2-20020ac24282000000b0047255d21191sm650978lfh.192.2022.05.20.05.58.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 05:58:20 -0700 (PDT)
Message-ID: <02fb065d-5ad9-07df-0e1d-1b47beb883dc@linaro.org>
Date:   Fri, 20 May 2022 14:58:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 3/4] arm64: dts: exynosautov9: add watchdog DT nodes
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        linux-watchdog@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220520121750.71473-1-chanho61.park@samsung.com>
 <CGME20220520121722epcas2p169b2669f367e7461fa41663f3e90d303@epcas2p1.samsung.com>
 <20220520121750.71473-4-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220520121750.71473-4-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20/05/2022 14:17, Chanho Park wrote:
> Adds two cpu watchdog devices for ExynosAutov9 SoC.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 22 ++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> index 3e23db8f09d9..34be955dc2d5 100644
> --- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> @@ -400,6 +400,28 @@ ufs_0: ufs0@17e00000 {
>  			samsung,sysreg = <&syscon_fsys2 0x710>;
>  			status = "disabled";
>  		};
> +
> +		watchdog_cl0: watchdog@10050000 {
> +			compatible = "samsung,exynosautov9-wdt";
> +			reg = <0x10050000 0x100>;
> +			interrupts = <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cmu_peris CLK_GOUT_WDT_CLUSTER0>, <&xtcxo>;
> +			clock-names = "watchdog", "watchdog_src";
> +			samsung,syscon-phandle = <&pmu_system_controller>;
> +			samsung,cluster-index = <0>;
> +			status = "disabled";

Blocks which do not need board-level resources should be enabled by
default, so drop status and drop patch #4.

Best regards,
Krzysztof
