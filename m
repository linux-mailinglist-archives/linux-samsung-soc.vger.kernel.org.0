Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F37BF619867
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  4 Nov 2022 14:47:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231566AbiKDNq7 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 4 Nov 2022 09:46:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231664AbiKDNq7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Nov 2022 09:46:59 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 987ED2614
        for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Nov 2022 06:46:57 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id i12so3212972qvs.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Nov 2022 06:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YiGpPdNoX5wXGMSfdL1E0pP/7NaEZ2Lyn9DqVTYL4cU=;
        b=Fk19rTDVzKv8kKsxmUBsegCLoZW/VV9ZiXJjNmW4BAma68sdE9nEb/NXffuA+Aa63b
         Un6WxnKoaX8D+3rnNfZ7P41JfEKTQxQAGgQxzI3YA4SjmEWV78Rtp7jGPeV0CyZEGeup
         Ew6yFOXShZMQ6nxmbdDR86y43iCK40N9odgCyuLaTl6lm9pm6cKMMIyOq+ItjL+KiQFr
         qNz+58Zvv7EzCnjmU3wu3/xxNAAmbZ/uhYtXcIi7enEJn1yi0fXKSlQHdK7OZAF2io1m
         yExNneixU8vLCf4WVtes44qCqgPFxd8abddPYaJdgzXvdVSsj2gEsurnJXZDJYBrnIoj
         0kRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YiGpPdNoX5wXGMSfdL1E0pP/7NaEZ2Lyn9DqVTYL4cU=;
        b=FpEqx43m1ybUGr7Q97bK5dmQtHRw0wjMc1fbbeKCI8tA0ZNVTG9bJW5DhKEwe5JdOn
         vP/KMT7jGvXx74UWRpVM2zFLCMiafmG8bm/6BlpZleYCE1OScHTJb5o/TDhkkBo9nlFb
         0sFQuMWHC2Nud6FcW0PwC6+tNFwZ7pOUahPmTc6KdJTLvX1blDBde7KPU/p7ZRoF1/cp
         4BQp0bgLEp/WD4VYhKzJQlF+Al3ZjXlT19LdoPjM0wlqRVKgUVkJEFr6XiJ/EdFqR7lH
         0z/9qPFNsEPj4Pew6cXa20GkJgUFtAbgz+VvkRFGlrTgDaZEVI70SQPfh+X/va76MXLN
         9vtA==
X-Gm-Message-State: ACrzQf3mM5v5czSlj9i84OmG8vbsmk5NGOlfLEDW9lVrjrZP9OWeXgZf
        EElhCN781t/nF2ZvWqr5DsuABA==
X-Google-Smtp-Source: AMsMyM4nfPfuMMdhpgKN4gcbMIFUHuGFeGmMgyIyZnd6J0DPxQafmKAbs4A5+ytwpCb9x+wMPqxG+g==
X-Received: by 2002:a05:6214:f22:b0:4bb:728b:b592 with SMTP id iw2-20020a0562140f2200b004bb728bb592mr32034191qvb.130.1667569616736;
        Fri, 04 Nov 2022 06:46:56 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:aad6:acd8:4ed9:299b? ([2601:586:5000:570:aad6:acd8:4ed9:299b])
        by smtp.gmail.com with ESMTPSA id v3-20020a05620a440300b006b929a56a2bsm3136177qkp.3.2022.11.04.06.46.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 06:46:56 -0700 (PDT)
Message-ID: <cc7c13c2-df5c-68bf-a4b6-e46df64db1c3@linaro.org>
Date:   Fri, 4 Nov 2022 09:46:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 3/6] iommu/exynos: Modularize the driver
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Janghyuck Kim <janghyuck.kim@samsung.com>,
        Cho KyongHo <pullip.cho@samsung.com>,
        Daniel Mentz <danielmentz@google.com>,
        David Virag <virag.david003@gmail.com>, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20221103195154.21495-1-semen.protsenko@linaro.org>
 <20221103195154.21495-4-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221103195154.21495-4-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 03/11/2022 15:51, Sam Protsenko wrote:
> Rework the driver so it can be built as a loadable module. That can be
> useful as not all ARM64 platforms need it. And that's ok for it to be a
> module because it's not a critical driver (platform can work when it's
> disabled).
> 
> Remove method and module exit function are not implemented, as the
> removal of IOMMUs cannot be done reliably. As Robin Murphy mentioned in
> [1]:
> 
>     ...it's better not to even pretend that removing an IOMMU's driver
>     while other drivers are using it (usually via DMA ops without even
>     realising) is going to have anything other than catastrophic
>     results.
> 
> [1] https://lore.kernel.org/lkml/20220702213724.3949-2-semen.protsenko@linaro.org/T/#md7e1e3f5b2c9e7fa5bc28fe33e818b6aa4a7237c
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

