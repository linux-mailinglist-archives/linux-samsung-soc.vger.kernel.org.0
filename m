Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA8C65F3147
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  3 Oct 2022 15:31:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbiJCNbR (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 3 Oct 2022 09:31:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229917AbiJCNbQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 3 Oct 2022 09:31:16 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F03AB201A8
        for <linux-samsung-soc@vger.kernel.org>; Mon,  3 Oct 2022 06:31:14 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id i203-20020a1c3bd4000000b003b3df9a5ecbso9059510wma.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Oct 2022 06:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=eWlt+DkLoPtLTcMntu/Est1VYDCDRL0KLk/6rYDuqBk=;
        b=bIhzD5rd35NW3dhNR/3KSyDQPcg0xBDSFAEfNDCnp00rL+oyEbu+wYpdqqmjl8DGKc
         1ISoib/HmH5JT7X5F0Xa0J2XMhXTSiboJZCyS1lp1yZlHO2FeEttsVYDirFiNWT8heLl
         ycHF2pcADOXR35uFV1bUzVqgcSY9xbSjRmnHizoZ8S7EpOqCWRJ2l3FXvBogJBNmZRNV
         vHA7PlUw7vLmgXgzn9eeA5VAw6eA87gHpd3ZTwtXZQZI+DQLF5G1HRcudYrwtZAVa++U
         Lva4G5Ys6T8ek0fuYrNLMVQFTPNdu/GGeEl28dj9ESS4/OB/aL4H0rK0pjgGO43+VmKy
         Pjxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=eWlt+DkLoPtLTcMntu/Est1VYDCDRL0KLk/6rYDuqBk=;
        b=2UzN19p9neO8UUvBj/uXlNZbOAZM+n2iFNVtglgx1+6A0ULnM4CBc5GzF0umeHJNh8
         oJvzvabITh3reZT/V0AT7eIrlMuEAxgGAP0ioUjSlM1jlJQZOJ5gCF34ASoLFGPY3fMt
         yjN3pedM/6bYr0NQlwvSMenWLvCp7Sa0o/xEE49XeI8Pc1igep+z9CdxAxs/guxrcKpl
         V46VkNDv6WjwBTNscQoBAk1YTIE1r69f9cY9x6YVdC6wTXpJ9QrZGThXbDv+lxopxYfR
         195HnsTiQEf1v9rp5EyLCp9OE6Qm9eFPNyLAxqOpRnNWbaycRXEB5fU7xSFlyLCIkIbB
         2MnA==
X-Gm-Message-State: ACrzQf09btTlk6QiHG6AzHO2nANxwtEchh04OUb8ffZOt666QS+KS7Mp
        1x74dCWtiGFMA2yoHeO0SYoUCQ==
X-Google-Smtp-Source: AMsMyM6kLte73S/yXSXb8h8VgVNwltnrK1QawlrE9Aeu31SFFkiNN8SxTrEIso4UKJA3FNEVwvbruA==
X-Received: by 2002:a05:600c:214e:b0:3b4:709b:b0d with SMTP id v14-20020a05600c214e00b003b4709b0b0dmr7191663wml.4.1664803873458;
        Mon, 03 Oct 2022 06:31:13 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:f3a:9f5e:1605:a75a? ([2a05:6e02:1041:c10:f3a:9f5e:1605:a75a])
        by smtp.googlemail.com with ESMTPSA id n2-20020a05600c3b8200b003a540fef440sm16868737wms.1.2022.10.03.06.31.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 06:31:12 -0700 (PDT)
Message-ID: <96462a60-417d-bf99-1a15-af0cce47aeb6@linaro.org>
Date:   Mon, 3 Oct 2022 15:31:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v8 19/29] thermal/of: Remove of_thermal_get_crit_temp()
Content-Language: en-US
To:     Marek Szyprowski <m.szyprowski@samsung.com>, rafael@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-omap@vger.kernel.org
References: <20221003092602.1323944-1-daniel.lezcano@linaro.org>
 <CGME20221003093207eucas1p1d456288f35eadbc6fcda0bf24b58e678@eucas1p1.samsung.com>
 <20221003092602.1323944-20-daniel.lezcano@linaro.org>
 <4e4d873b-4a40-334a-34e7-defb0fcc4e6b@samsung.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <4e4d873b-4a40-334a-34e7-defb0fcc4e6b@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


Hi Marek,

On 03/10/2022 14:50, Marek Szyprowski wrote:
> Hi Daniel,
> 
> On 03.10.2022 11:25, Daniel Lezcano wrote:
>> The generic version of of_thermal_get_crit_temp() can be used. Let's
>> remove this ops which is pointless.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> 
> This patch breaks Exynos thermal driver as it introduces a NULL pointer
> dereference in exynos_tmu_initialize():
> 

Thanks for testing and reporting, I've just sent a fix for that 
(unfortunately can not be tested from my side)



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
