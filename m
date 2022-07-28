Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41C15583A3E
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 28 Jul 2022 10:20:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234986AbiG1IUL (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 28 Jul 2022 04:20:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235103AbiG1IUI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 28 Jul 2022 04:20:08 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 839EA10D
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Jul 2022 01:20:06 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id y11so1759552lfs.6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Jul 2022 01:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=DKzfCCCnKo3KEpIcC/EIkk48aTnRNunOV51qSF2JIg0=;
        b=K11/htmnd+5P5N6e+/fDuUA5yhnkoDDKjWZWWoVGByVs2g2geIP1E8LLgQd0WDPlFv
         BOd0ICk2MiuKnh6oigxU+LcCtJPOdkHEe5LK9J6SXtAHsHSJf1VHI+pQQOtx47QDJFGK
         6PQCzsyKjjDDAAEfUpFDURAtS5zIKiEoXR82uApJdhQxeIzXoKds77fw+mW2fQqgPR/L
         hAzWH5Aqgr6R6GMS7gij/ZnJJ7A3aSJXdU/7BwXuIsKHAi94O+C6fwCXWtLIP8tG0hN8
         xnXZTfDVm04wBX+6gnpio4o4N81z6EVKRE1iH2LG/V407ObYmCu9aOFBd47LSQycxIyu
         Cjkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DKzfCCCnKo3KEpIcC/EIkk48aTnRNunOV51qSF2JIg0=;
        b=fhkmNP1ceaMkjBdtGPqmqHHSRG4VtGMrR4jzMbU+SfEnoFcBwhuwAldkdgIbXVRCna
         I6P0PfrJ7+RXAPG80/Jxc2Xt5ZYDOFMHWLhDH1i7XB1BT4PuZVEo6aBRKR5gXHokFTXz
         2E+h6H8/cytu6AOrUyDzbd36IPfcc9QJB3jYmLKKjfDvbuD6VgRww5hUFBKndIh471r8
         XYNldyR1tATP27v8s5MKn86QvcOfmC1pRFc9myr6sR2ND4Q2WCoe2mbDv313aGqK6LLH
         0kGe41lfdn3/k/JQMMmri7BmvZtMtRfnnxHgC2qScAagNyeMI24gYKeotaUyjToSP4qp
         8bFw==
X-Gm-Message-State: AJIora94jZc9MVNKs0cGN18bILIygugrhSAmIyEFQwkUQy4qOQI3kKcm
        JvL0E4/WN+O3iKhhYHvnSXyFnw==
X-Google-Smtp-Source: AGRyM1tYjlAr/l8HMjRK6lch+iSSPXvv9ggcKMcsJFEUii6FD895YJnlkl/W/UOFIsjL+fWjuSfolg==
X-Received: by 2002:a05:6512:a84:b0:48a:556d:5539 with SMTP id m4-20020a0565120a8400b0048a556d5539mr9947898lfu.6.1658996404853;
        Thu, 28 Jul 2022 01:20:04 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id a1-20020a19ca01000000b00488d0e38283sm84816lfg.153.2022.07.28.01.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 01:20:04 -0700 (PDT)
Message-ID: <9f8bebcc-fc09-cbdf-aa62-3d0012df662a@linaro.org>
Date:   Thu, 28 Jul 2022 10:20:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 6/6] clk: samsung: exynosautov9: add fsys1 clock support
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220727060146.9228-1-chanho61.park@samsung.com>
 <CGME20220727060612epcas2p47e21a2545b686d536de47518f7b5c199@epcas2p4.samsung.com>
 <20220727060146.9228-7-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220727060146.9228-7-chanho61.park@samsung.com>
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

On 27/07/2022 08:01, Chanho Park wrote:
> CMU_FSYS1 provides clocks for USB(2 x USB3.1 Gen-1, 2 x USB 2.0) and
> mmc. For MMC clocks, PLL_MMC(PLL0831X type) is also supported as a PLL
> source clock provider.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
