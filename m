Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B73726BE8A9
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 17 Mar 2023 12:55:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbjCQLzz (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 17 Mar 2023 07:55:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbjCQLzy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 17 Mar 2023 07:55:54 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FC4CB5B6A
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Mar 2023 04:55:45 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id cy23so19223932edb.12
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Mar 2023 04:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679054144;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QCfN6F0y+kXWsG65TzOeSOHJ6drfqPHeFbLKw0Y/4s8=;
        b=VIUUaZkpbCR3AYJSEO8c6EiLnQNmeAC8tRTMe2yPr30khWpYlUywqm6yH7DGRJCHZY
         vka+VfTLn5D64BZl0Vpt+myHQf6eFZDfsqFyrkc5zbr14RN5w8APrAjLKndrv+LFFnuX
         fcxzFVVrUPsGYLYsNRi+GBwR7BCZYTKJzpoKK8ZA2blmbLBQ9lX38Ttj410by/rnFvBn
         DMfu/IXaho0ZAsFaQ/nzWog0lhO6I+Q7y+3i9xKSFg6oxaFw4tXa9cBqYKjKQl4rVPG+
         VZcmVr9eohRDQXOPLmAhdxhktnB+PyNHiL0cDRAt3Nclx75CSn3LA1uktPS4MnKTAnKv
         2lEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679054144;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QCfN6F0y+kXWsG65TzOeSOHJ6drfqPHeFbLKw0Y/4s8=;
        b=l1oGso0GhpRzHotnEp3XdKYwsudZz/VBqK/7v7JlYEDW5M7k9Aax9vLYNlVkAUzKKB
         C6VhBWSA7S8j//d7Wnqz+kCarOgHbLBJa+JrmCEWJBTJJ5xZ5XB83JtPd8l5twmW/ot8
         DRWtctn2AJiU1oTYXY4PZjS19jh279J/zLk3z2ZanFXnhBNzrWN4X6aTY6Uaoa6Bdw37
         njUYAJnACM9SQ29sGhZpdpz1douW+/SAlI7BneBq2kv2EqTILRbLrinGwUsdIwp7r5YE
         kPbSnQxyrGdhM2wdKg2BWEDSanXZCXeNVzIuyt1pU85KNAa4oBIRD9l1tnjFmtiaZXs7
         LmUg==
X-Gm-Message-State: AO0yUKU8vptmsdP8JmUHLO/ImKq1vLZ/gHlFzu9qYKGnnXlzbbigJY7w
        3D/uaVnB6EJqsTQiRoFT7xxrgQ==
X-Google-Smtp-Source: AK7set+Ko5FIjm3ObaskmXZ0dZBIDnZsLVXTEbaqMpCzXJHlY/hAwcXTRKxymUkWCqYoFZOlhjr2Gw==
X-Received: by 2002:aa7:d056:0:b0:4fb:6d55:7e7 with SMTP id n22-20020aa7d056000000b004fb6d5507e7mr3074656edo.21.1679054143738;
        Fri, 17 Mar 2023 04:55:43 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d013:3eeb:7658:cec? ([2a02:810d:15c0:828:d013:3eeb:7658:cec])
        by smtp.gmail.com with ESMTPSA id m23-20020a509317000000b004fb95f51f54sm981748eda.12.2023.03.17.04.55.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 04:55:43 -0700 (PDT)
Message-ID: <20db729f-e8fb-3d16-54a2-b9a54b9a1b55@linaro.org>
Date:   Fri, 17 Mar 2023 12:55:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5 1/2] ARM: dts: exynos: replace mshc0 alias with
 mmc-ddr-1_8v property
Content-Language: en-US
To:     Henrik Grimler <henrik@grimler.se>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, alim.akhtar@samsung.com,
        m.szyprowski@samsung.com, jenneron@protonmail.com,
        markuss.broks@gmail.com, martin.juecker@gmail.com,
        virag.david003@gmail.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230316211558.8526-1-henrik@grimler.se>
 <20230316211558.8526-2-henrik@grimler.se>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230316211558.8526-2-henrik@grimler.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 16/03/2023 22:15, Henrik Grimler wrote:
> Previously, the mshc0 alias has been necessary so that
> MMC_CAP_1_8V_DDR | MMC_CAP_8_BIT_DATA are set for mshc_0/mmc_0.
> However, these capabilities should be described in the device tree so
> that we do not have to rely on the alias.
> 
> The property mmc-ddr-1_8v replaces MMC_CAP_1_8V_DDR, while bus_width =
> <8>, which is already set for all the mshc0/mmc0 nodes, replaces
> MMC_CAP_8_BIT_DATA.
> 
> Also drop other mshc aliases as they are not needed.
> 
> Signed-off-by: Henrik Grimler <henrik@grimler.se>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> ---
> 
> Changes since v4:
> * Do not set mmc-ddr-1_8v for sdhci_0 on Exynos 4210,
>   following Marek's tests
> 
> Changes since v3:
> * Drop attempt at node sorting/cleaning
> * Move two mmc alias additions to the other patch
> * Update commit message
> 
> Changes since v2:
> * Set mmc-ddr-1_8v in device trees for mshc_0/mmc_0
> 
> 
>  arch/arm/boot/dts/exynos3250-artik5.dtsi            | 1 +
>  arch/arm/boot/dts/exynos3250-monk.dts               | 1 +
>  arch/arm/boot/dts/exynos3250-rinato.dts             | 1 +

Why you do not remove Exynos3250 aliases?

Best regards,
Krzysztof

