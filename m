Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C40F53E78F
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  6 Jun 2022 19:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241021AbiFFPlO (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 6 Jun 2022 11:41:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241022AbiFFPlO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 6 Jun 2022 11:41:14 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D8C656230
        for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Jun 2022 08:41:10 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id fu3so28238306ejc.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jun 2022 08:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=5bsP623yeVUhI4X2qyWKm7xhZAZBEQqTrR3MfihqiO0=;
        b=pGV3u32GEBOhd7TPDnOWLKJ9oLJuUOxDipMCgJt3EuoZ1rarvWVYq8oK+EU5doKOjK
         SjmxM35Rzb1UHksLLMUZC4DYfUe6w8HvXhq0YtIZ23J8rixxB6XuOgLghu9cBT3X7v+5
         8CKA9/yAOJtmExGP8T4abFpaA3PaM3BnjfL2ukfBwdBbz7233FZ2pQAgim1oO1u4diFw
         Dnf3lFRkKT93piQWB7AwqEXehvglKXOTwbtf2OtFQ4WNsFBDbscEbx8lE2uQE2D7ANLE
         Aeq7piv2zqJSmwRp4PA+HAoVDcvxcdfbrtP0VaTbP7qHmqDopLuXdRpnHi+IPAgVaH8Y
         Tqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5bsP623yeVUhI4X2qyWKm7xhZAZBEQqTrR3MfihqiO0=;
        b=meXW9OdqLJkvg/Yd5a1ar9BLVIJmjyVI5+OOXmmuQSzm7eMjo9iEH8TTb0WQoRCnFE
         48Rk7slw7+ujNrJf7Ewd63aO75MfXQp3Ubbo5clBH7zy+S0/EeFex8IjA/ZGlsVMq9CY
         CLzM8q5xmMAMuO/G7TD8TcFBwSnB6IqoGYirN7u++eKE2yQEPxVM+4ykgtQj6+9uI2dt
         GETFtReiLMMXeJejuHs7DLNjmcAxaDedDCJf4vg3fdL7bxZHPx7p4EXzHdzUdvWSe4/x
         lYgJpRk9A0EnroJKoNbzLY+Q/kZEuorUOUOkKSre79vLFXTTsScrW6NhFhW4+V6zfxGp
         krFQ==
X-Gm-Message-State: AOAM532QlNugl0J/DSw/SzGRmw3Va1p1UpFe8jEnu7iYvmcREJzPeZps
        trhb04IAb2ODhpBmS76MfyiE5A==
X-Google-Smtp-Source: ABdhPJxPmR5o/ptnO48/LLqqFHYgHv9f2kSvvBI4oOyV4SSHNtCri883LtJ4arOlCN8+RLxPMr+1YQ==
X-Received: by 2002:a17:906:5959:b0:710:c2e8:79f3 with SMTP id g25-20020a170906595900b00710c2e879f3mr11652199ejr.489.1654530069008;
        Mon, 06 Jun 2022 08:41:09 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id n16-20020aa7c790000000b0042bced44061sm8728646eds.10.2022.06.06.08.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jun 2022 08:41:08 -0700 (PDT)
Message-ID: <5fe2246f-97db-e7b0-a72e-c8c5ff6b2abe@linaro.org>
Date:   Mon, 6 Jun 2022 17:41:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 06/23] dt-bindings: mmc: exynos-dw-mshc: update
 samsung,pinctrl.yaml reference
Content-Language: en-US
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <cover.1654529011.git.mchehab@kernel.org>
 <5c937793dd7aec30da4964b39561072ae184f89b.1654529011.git.mchehab@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5c937793dd7aec30da4964b39561072ae184f89b.1654529011.git.mchehab@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 06/06/2022 17:25, Mauro Carvalho Chehab wrote:
> Changeset af030d83da1d ("dt-bindings: pinctrl: samsung: convert to dtschema")
> renamed: bindings/pinctrl/samsung-pinctrl.txt
> to: bindings/pinctrl/samsung-pinctrl.yaml, splitting it into multiple
> files.
> 
> Update exynos-dw-mshc.txt accordingly.
> 
> Fixes: af030d83da1d ("dt-bindings: pinctrl: samsung: convert to dtschema")
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Commit is okay, but you can also drop it entirely because entire part
will be removed with:
https://lore.kernel.org/all/20220605163710.144210-4-krzysztof.kozlowski@linaro.org/



Best regards,
Krzysztof
