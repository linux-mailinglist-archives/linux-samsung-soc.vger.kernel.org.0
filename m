Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD9FF617D65
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  3 Nov 2022 14:05:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231318AbiKCNFE (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 3 Nov 2022 09:05:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230139AbiKCNEk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Nov 2022 09:04:40 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFFA5D60
        for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Nov 2022 06:03:20 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id c15-20020a17090a1d0f00b0021365864446so1719431pjd.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Nov 2022 06:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sCUBB08PoVZ26bcT4Cxprl0+CgnyFaSro8o/etFxILQ=;
        b=NMOF7LMrwGZkM4Tpc29C7h3cTqZFKOVJ3vIia5vjFEJJ4H7B5PBOcPyzkq455HN7gk
         FTmv3c9jmCde5kxbFdR10ZoLz4a0JGb7Znsy/G7IW3aeadZOKKCIwmKa6neDPb/+PMlQ
         G5q3pQ/DzKlFHkwEqE1EWRBb8h1BN/hw2oOsWTTcIxbTC8Rbh0h6JO5zsVlRMtfDcPmG
         EwsBA48uyosKZ2jbVe5iAc8agQJkePiVass7YVRzKWxPROkBwJrrtbt0YtPlspLlftVk
         CaAE3bU5N7T2BznUtAq+AbzJjt2hmk0sVJOfygsa2zvm6OklRDJ4p1kusTQunUxAS2Uc
         +2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sCUBB08PoVZ26bcT4Cxprl0+CgnyFaSro8o/etFxILQ=;
        b=nKld1sBBK5iu4PRrr761d2aO2L71tmB5u24oGB8La+2USfvIDaTp/MOOhNiNBcMb1J
         uJh3pVmphTQRyc8yrsuzh90kiCK7iayQC6ZUnTBRHsde5pYIcV77JQl4qvvZ96gAclO5
         32rAetIzNPpIJetWGNBvoZ+dD5+yZQANjOodkM4SjbKxAFElTINGC7vOHUwZFGvRB1fU
         SllavVWaxTEsu71mpFkTU2OK3dOTTaGaEz522Sg0xSJo1Rso6fWFLCtajrP8slu3kdkI
         qo9V3wKkVci1XyyVFIuk1PeBQCxdT62rPdiUBojuuQCF5CpZDceJICNfgqb20ayRl5Ft
         D4HA==
X-Gm-Message-State: ACrzQf1ZDwOJhvnY8jgWmNTfXBJ8o06VWkSSwynccwSZdGDmt5oHZRbF
        I/jybnYTJA2fnVpZ7ZyqSMGcuZxHBiSCPHTQb8aoeg==
X-Google-Smtp-Source: AMsMyM7FZiZCLkFDkx1bnVpjXpomckekbyKXpexKWDuVwHGpOCtLDD7blXzZ7m7RqCbEnHJAeDZqypgjZcrJQy4UliA=
X-Received: by 2002:a17:903:41cc:b0:186:b756:a5f0 with SMTP id
 u12-20020a17090341cc00b00186b756a5f0mr30145351ple.132.1667480600358; Thu, 03
 Nov 2022 06:03:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221028191243.31721-1-semen.protsenko@linaro.org>
 <CGME20221028191256eucas1p1a4fd95cbcc44959fa968956a92738f03@eucas1p1.samsung.com>
 <20221028191243.31721-4-semen.protsenko@linaro.org> <7ed8c884-cee1-7cb0-f2ce-f7ec156cd841@samsung.com>
In-Reply-To: <7ed8c884-cee1-7cb0-f2ce-f7ec156cd841@samsung.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 3 Nov 2022 14:03:08 +0100
Message-ID: <CAPLW+4nrns9BovWCTOsi3F7=2FWLi2sK0+Cid4Cva2Vs2ZWdqQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] iommu/exynos: Modularize the driver
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Janghyuck Kim <janghyuck.kim@samsung.com>,
        Cho KyongHo <pullip.cho@samsung.com>,
        Daniel Mentz <danielmentz@google.com>,
        David Virag <virag.david003@gmail.com>, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Marek,

[snip]

> MODULE_DEVICE_TABLE(of, sysmmu_of_match); is missing, so the driver
> won't be automatically loaded, what breaks its operation if compiled as
> module.
>

Right, didn't think about hot-plug case. Will add
MODULE_DEVICE_TABLE() along with MODULE_ALIAS() in v2, thanks.

> Also Exynos DRM and S5P-MFC drivers rely on the Exynos IOMMU being
> built-in, so they need to be adjusted for modularized builds too imho,
> at least in the Kconfig dependency.
>

Sure, I'll check all Kconfigs and defconfigs before sending out v2.

Btw, can you please also check my most recent reply [1] for the
"[PATCH 1/2] iommu/exynos: Abstract getting the fault info"?

[1] https://lore.kernel.org/lkml/CAPLW+4n-Lf6je61rxdJ9nJnX9h9F8F-y+qikG7eFF0avQpMV9Q@mail.gmail.com/

Thanks!

[snip]
