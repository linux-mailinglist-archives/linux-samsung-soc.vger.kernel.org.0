Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3321C6B5F82
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 11 Mar 2023 19:06:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230261AbjCKSGf (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 11 Mar 2023 13:06:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230305AbjCKSGe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 11 Mar 2023 13:06:34 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DA9C532AF
        for <linux-samsung-soc@vger.kernel.org>; Sat, 11 Mar 2023 10:06:26 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id cn21so3026995edb.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 11 Mar 2023 10:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678557985;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fMcft7wNHp8AV8X5G2NHBZb+ziZBPuC7uUWTZGa3pOs=;
        b=HwSnmFkaLVcW4+BGIpV2BDzJDMm1EfGpX6Vdf1PcKMqXUXmgAJlmP++EBhgHwfPBF+
         KWcq58bR+HSjEYGGO8ZxI+G3YZj1dDUjy7rN778ZTX8akugwBLXfu5YEjbyDJBiXwCw2
         aJswcmg8jevxLsfrv1jyoK/M27Exj3bXYz+eJK7LtyWe9Q4aq7+9h6z6kWFPY8PtLWNX
         U6KyE/V7YpO6dvsh6bBrUj82F4jtvoroYQk2pcmtuDludD+aeDvan7U2wXwJ3hit15D9
         +QQsjUhea5WqRvLfo/BZrehQEyrGCXzLJw/cRLZZYQ3MpvKtBJsiIbamTaI1dydukT5O
         nxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678557985;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fMcft7wNHp8AV8X5G2NHBZb+ziZBPuC7uUWTZGa3pOs=;
        b=c5QZz5FmFqXNjBb0vAJ9rLewn9vGz+ngdzuP4ofmJOHHIipEsvK10aQXinJ+Q8S92L
         8ZdOQ0230MVG2R+qh3ggTp+hCgXNkzptWthDqpPo6/V3sMHickgj7zIW6JTAvp9vUxhN
         arb48JMTTXceaEtezGX+B8zpNKLiwQb6erk0iwsYG9LjlN/1IYulwe1ebIpldbgSl/7W
         FKL1pbxdr4spsu+Y/yUi/xASfzDJeXTvfRCBvGJk+0x8fDdxs1u6en2NkX+WaERZuYsf
         YlUOk27KkbU9Nu6P788Q7bagmhJjw3pjE5hgXDjvwXpaKKnVozizk2xhllpF5ZbTy+8E
         uLMQ==
X-Gm-Message-State: AO0yUKVMOS2Siynp/qpcxATndouF2AT/OrMSeHIghzn6FMlb4fYemmXA
        d1dtJH0Y01FryBHXbKn9btuNOaZfTDRq3e4aGxY=
X-Google-Smtp-Source: AK7set/UUWVgapWVVwtEI5mFGQ2d0YYnSGqO6TLQZA6F1qQqIPCVESi/Juksfq33lwnkSCVqj2IduA==
X-Received: by 2002:a17:906:3f5d:b0:871:178d:fc1e with SMTP id f29-20020a1709063f5d00b00871178dfc1emr28949632ejj.77.1678557984934;
        Sat, 11 Mar 2023 10:06:24 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:6927:e94d:fc63:9d6e? ([2a02:810d:15c0:828:6927:e94d:fc63:9d6e])
        by smtp.gmail.com with ESMTPSA id e23-20020a170906081700b009234539864asm441526ejd.40.2023.03.11.10.06.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Mar 2023 10:06:24 -0800 (PST)
Message-ID: <69d21d6e-decc-4060-9aa7-06a5d1cea029@linaro.org>
Date:   Sat, 11 Mar 2023 19:06:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] MAINTAINERS: update Andi's e-mail to @kernel.org
Content-Language: en-US
To:     Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Mark Brown <broonie@kernel.org>
References: <20230311170516.178913-1-andi.shyti@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230311170516.178913-1-andi.shyti@kernel.org>
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

On 11/03/2023 18:05, Andi Shyti wrote:
> Use the kernel.org e-mail for the maintainer entry
> 
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> ---
>  MAINTAINERS | 2 +-

FWIW:
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

(should probably also go to linux-spi as you target it to Mark to pick
it up, not to me)

Best regards,
Krzysztof

