Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F47075758E
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 18 Jul 2023 09:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231546AbjGRHmS (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 18 Jul 2023 03:42:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231769AbjGRHmP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Jul 2023 03:42:15 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46F9910FC
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jul 2023 00:42:11 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-51e56749750so7284906a12.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jul 2023 00:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689666129; x=1692258129;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7EfXYzBbWQLvdtmmRr8ox/bAyyNFbovDsvAMHwPJrv4=;
        b=ywnIrxHLMiM7RmQshK3fsGE0pr9ZFaew5hvy9vCMhV+ouNhka6618kA7iHpx0pbWpY
         Tkj45pde3OGS2csJvdVAO2518KPu1s5miTpB7HKxF5pdjDpgj0qyVoob0n/e0O7x3/BN
         XOkA+e7gJA/4WJ/vbUqyQR4+/bpOmCMaaSnp6TbU/q8RTPTo0obPSu2sH5GGPRPD98dD
         KeYsx/KboZ1DXkCXuTN3IQQ/s7t0PzZTHqy0+vvxKRHG0zOrjgs/Aa9bLS4bUfhIFJgj
         U94nAEYk8WeSgfv75Chq9qsEhb5xp39kIanVAz8IipAv3fMWporUmVBCCUtLrkKTzw8v
         VB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689666129; x=1692258129;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7EfXYzBbWQLvdtmmRr8ox/bAyyNFbovDsvAMHwPJrv4=;
        b=Cp8Gb00OeA35W7x3DSfKF2l19KqfYrG11i0yF1qENTIMezroqzm6N8psloluHbMKYi
         zX4S+t3tbM7rL3kgXyvXwMB5lm9q+9jjtM6CxJX5I/VrOgXD3I4TL9SOk+1nRJeLqPEd
         /f15yRG3BEjavX2AQCtzT57BnYttVSXnGaupQ09VJfwCGtQrds1QLPMNQ7CcfISzTgbd
         TILu9eGPxdcdNdBE2TfYyO2oc1CKiZmTeU536lAD/jpbvqfErRBd/vycm65NJNSLdJ7K
         GmXh8RqvM2yjhKKwGAb09iUJ+Ivdu/NEBkffrq9JMAPREBCm2/ZBmCy9deHp3PlRCSwG
         FdUw==
X-Gm-Message-State: ABy/qLZHRfJUArpMzcOOk3lr7C03H253MifjaPyXPANbH4L+odiqDmlp
        3avh8d2912Z6hb+JLegXCFnP/g==
X-Google-Smtp-Source: APBJJlGxWf0Aai2aU5w4/wHeuQWwUZnDbVIRAKbLboMM2v70hEH0td/HsDHgowQHt5VDqvdhrgMikA==
X-Received: by 2002:a17:906:60d:b0:993:f9b2:93c1 with SMTP id s13-20020a170906060d00b00993f9b293c1mr12755636ejb.9.1689666129729;
        Tue, 18 Jul 2023 00:42:09 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id c1-20020a170906170100b009882e53a42csm657587eje.81.2023.07.18.00.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 00:42:09 -0700 (PDT)
Message-ID: <f5fa0ae9-2a72-9c82-99f6-e9249cceda02@linaro.org>
Date:   Tue, 18 Jul 2023 09:42:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 1/2] dt-bindings: pwm: samsung: add exynosautov9
 compatible
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20230718034201.136800-1-jaewon02.kim@samsung.com>
 <CGME20230718034723epcas2p3913ad208c70659965b4ec204570aa0a1@epcas2p3.samsung.com>
 <20230718034201.136800-2-jaewon02.kim@samsung.com>
 <4e546dbf-8f10-a27e-dd8b-052151ebf00a@linaro.org> <ZLZB0om1y9qLXDdF@orome>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZLZB0om1y9qLXDdF@orome>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 18/07/2023 09:40, Thierry Reding wrote:
> On Tue, Jul 18, 2023 at 08:04:51AM +0200, Krzysztof Kozlowski wrote:
>> On 18/07/2023 05:42, Jaewon Kim wrote:
>>> Add samsung,exynosautov9-pwm compatible string to binding document.
>>>
>>> Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
>>> ---
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Do you prefer to take this through the Samsung tree for DT validation
> and whatnot, or should I pick this up via the PWM tree?
> 
> In case of the former:
> 
> Acked-by: Thierry Reding <thierry.reding@gmail.com>


Since there is no driver change, I can grab it via Samsung Soc. Thanks.

Best regards,
Krzysztof

