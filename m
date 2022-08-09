Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 470D558D7D4
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  9 Aug 2022 13:09:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241057AbiHILJk (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 9 Aug 2022 07:09:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238495AbiHILJj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 9 Aug 2022 07:09:39 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BA7E21E13
        for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Aug 2022 04:09:36 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id t1so16507511lft.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Aug 2022 04:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=z1wW53E/Qxsr2vSx6nmGwn4G947AWzNAxHfLf2Udui8=;
        b=K9697b0hWypNC5Y7Ukm33jvCxg3rEpcsrx7eZBN6AYRJiXg0G8mkGWLE2nm72MEsYO
         eES5KUVP43qIjmaNnFi4bZlCpKZYbcKikxJJl7SiPL1XL7TjWp3u4U69SJtJfWtAJ2BP
         J76tCLlrU6Wo5cp056gQWv3J/Xn2KrgcjtxSB7r9/s8iQxvfP69+PJdUPxtXDQm15WdS
         eLMR26SCrZSrfFGUF1Z/lCXo85fBVHcphyDkVbrWVeuVjwdWkiawNLtYmpdZBm8QnStD
         LGrqaRtMq2+cb3AoTh3bWcGXhWq+8mpnY1CVH7cNuMwZuv+AB3zDb6UzDsEzRadk2sRL
         5MGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=z1wW53E/Qxsr2vSx6nmGwn4G947AWzNAxHfLf2Udui8=;
        b=0L5dQTi0Xa5cSC3/Ep0D16StY2Qwgmrq6clp2owa9Hp8Fg+78Vv3AKVR6sT0W6CKwJ
         X3tRLPgovHMott4g0D+Azm3S19EdB3X4fsebIFCwD1vaAkPMwoG/+wuSsrSH9s4QTOmo
         UtdBFUbWI6g5F4xhBsopdx8gdhlml/TQyHXIoCWqMzk7DO+xAUQu8VkzeCLzVC7da5pP
         8JNk9laaxt5M2PcoUgQAhCKPSuSL5hFxVPlbRllYq/L6B2qa9BRPXP1kn8/OZXnyhX3r
         DkbGeEsigBnbHJwFvZ+Udyz1rn5Ij7EWcFpH3r47uWLeMxVtju5esCPken/xyldddgx3
         68mQ==
X-Gm-Message-State: ACgBeo1CbNL9c8m+t2l3EwzD4IKc4dDD/q+sKn0pIG0z/FOg2DR7ajy3
        j/v/uH+TNai2nCCz2zGi955M8UMZa4aWpQgNKf2Reg==
X-Google-Smtp-Source: AA6agR6e6kdezHVuMYN+QNjKKaV87TyigC/jpShlv85dEwOIG5MateIIbdr+mhaKDyg1qz9Fo8IOHcbNVw0tnBG6Kv0=
X-Received: by 2002:a05:6512:2306:b0:48b:26f3:91b1 with SMTP id
 o6-20020a056512230600b0048b26f391b1mr7755169lfu.11.1660043374613; Tue, 09 Aug
 2022 04:09:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220808181555.10333-1-semen.protsenko@linaro.org> <94f31377-f2f0-7d1e-c191-ee55dd204fc5@linaro.org>
In-Reply-To: <94f31377-f2f0-7d1e-c191-ee55dd204fc5@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Tue, 9 Aug 2022 14:09:23 +0300
Message-ID: <CAPLW+4mC5of9v7AHUbxYDamQ4SNpK46oT7_A6R6t2uuBJ1gSpA@mail.gmail.com>
Subject: Re: [PATCH 0/7] clk: samsung: exynos850: Add CMUs needed for SysMMU
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 9 Aug 2022 at 10:09, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 08/08/2022 21:15, Sam Protsenko wrote:
> > This patch series implements some missing Exynos850 clock domains. Right
> > now those are mainly required for SysMMU clocks, although of course
> > there is a lot of other clocks generated by those CMUs.
> >
> > Exynos850 has next SysMMU instances:
> >   - SYSMMU_AUD
> >   - SYSMMU_DPU
> >   - SYSMMU_IS0
> >   - SYSMMU_IS1
> >   - SYSMMU_MFCMSCL
> >
> > As CMU_DPU is already implemented, that leaves CMU_AUD, CMU_IS and
> > CMU_MFCMSCL to be implemented, which is done in this series:
> >   - CMU_AUD: audio clocks
> >   - CMU_IS: camera clocks (Image Signal Processing)
> >   - CMU_MFCMSCL: multi-format codec and scaler clocks
>
> Please send a v2:
> 1. Using proper output from get_maintainers.pl
> 2. Using standard git send-email or any other equivalent method, so your
> patchset is properly threaded. It's not possible to apply it otherwise.
> See also:
> https://lore.kernel.org/all/20220808181600.10491-1-semen.protsenko@linaro.org/#t
>

Thanks, will do. Just wanted to avoid cluttering the "device tree"
mailing list with actual driver changes. But obviously it's not a
proper way.

>
> Best regards,
> Krzysztof
