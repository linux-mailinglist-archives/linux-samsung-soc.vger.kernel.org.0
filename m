Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB36458D43C
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  9 Aug 2022 09:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235339AbiHIHJh (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 9 Aug 2022 03:09:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229976AbiHIHJh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 9 Aug 2022 03:09:37 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0BC42AC4
        for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Aug 2022 00:09:35 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id x19so7520961lfq.7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Aug 2022 00:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=a7fScNnE5HtMvpNSo+MB/TBjhVR9Z1KUchwMx8sZkuU=;
        b=RA8G03fI7XwC6bl+TQdVU0BDSI9O235lhKLkU9jA+iNC4ZFitSoZPvBlmzUfRD6fwT
         B37RjX6aqhsB0SvcvI4eRaF36SlQrCqKirE7mJioOPoAWl5goHVVp7zTvcenbqd3CNDz
         t1gvGhzSP+4jSR0NaL6G60naB8QkzspS35hRceEde/7ffW9fK7CspaiyUo2nva3snN0q
         IWIhIv3lKKLqSe7ga6nBowRr0iNc6A7qBbqvMbLZQDTAycS63ze6kyli+byX6340YAQu
         1G1tWfeiCtWOPPnsFArahQoW9/dncLcf8IWP1yqIC7Wb/rNbS+YhsrsTzdw9E8O/ammk
         DZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=a7fScNnE5HtMvpNSo+MB/TBjhVR9Z1KUchwMx8sZkuU=;
        b=lAnYiWzaDeI+jjdkBsLaovTN3cw3uZmUcOr8db3OASd8HbFSSSssaJBrDhQeWINs0T
         c1fd4u0L61f27gYFLqdUnVeOQiq5csy0o+ljlb+rKLHIq1dsieXqRBVRLV/40wSHGq8O
         9mDELMdgbcj2aTkKql8hhrMYry03ENxk+zX9yXxuIMYwrBO3UNcGwLTBTCLMM0NlSLgN
         lAH84bsdNqXLYAyZwNQg9Wvq9YKE97thN3T+fiGDZeV1lsarPOaG2fAUA/HG4r8uuxlq
         J9qkJjja1xMBB405QZ4WEr1QfcAeenubSH9LjQxzbCTKIbLpoKsFf5QVjEhPEqqujptb
         NeWg==
X-Gm-Message-State: ACgBeo1UfvGdU5u6yomuXRHpeMbWRZFmbzRIMq2WNwPDxJClFZC+FzY5
        z9nh5cJtXTKK/lMP45tdH8Apww==
X-Google-Smtp-Source: AA6agR5IW4FuVIfLWkhD0M6J9m0nH2bYieqIJrVXmboVJbuzXYotvpl8SlP8ZKFwYJ6kgoUn9yRE6A==
X-Received: by 2002:a05:6512:31c1:b0:48a:2990:17b6 with SMTP id j1-20020a05651231c100b0048a299017b6mr7180548lfe.10.1660028974250;
        Tue, 09 Aug 2022 00:09:34 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id r3-20020ac25c03000000b0048aa061c862sm1659717lfp.1.2022.08.09.00.09.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Aug 2022 00:09:33 -0700 (PDT)
Message-ID: <94f31377-f2f0-7d1e-c191-ee55dd204fc5@linaro.org>
Date:   Tue, 9 Aug 2022 10:09:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 0/7] clk: samsung: exynos850: Add CMUs needed for SysMMU
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20220808181555.10333-1-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220808181555.10333-1-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 08/08/2022 21:15, Sam Protsenko wrote:
> This patch series implements some missing Exynos850 clock domains. Right
> now those are mainly required for SysMMU clocks, although of course
> there is a lot of other clocks generated by those CMUs.
> 
> Exynos850 has next SysMMU instances:
>   - SYSMMU_AUD
>   - SYSMMU_DPU
>   - SYSMMU_IS0
>   - SYSMMU_IS1
>   - SYSMMU_MFCMSCL
> 
> As CMU_DPU is already implemented, that leaves CMU_AUD, CMU_IS and
> CMU_MFCMSCL to be implemented, which is done in this series:
>   - CMU_AUD: audio clocks
>   - CMU_IS: camera clocks (Image Signal Processing)
>   - CMU_MFCMSCL: multi-format codec and scaler clocks

Please send a v2:
1. Using proper output from get_maintainers.pl
2. Using standard git send-email or any other equivalent method, so your
patchset is properly threaded. It's not possible to apply it otherwise.
See also:
https://lore.kernel.org/all/20220808181600.10491-1-semen.protsenko@linaro.org/#t


Best regards,
Krzysztof
