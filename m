Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB7245199C1
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  4 May 2022 10:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346284AbiEDIe1 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 4 May 2022 04:34:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346322AbiEDIe0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 04:34:26 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C13124952
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 01:30:50 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id l7so1499321ejn.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 May 2022 01:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L7LS3CTO+y/aLliPfCEtLr2UH4vA3T5jXf37IbE+3f8=;
        b=YdXA+oaBj1pYNLd3toBgP3od+CdYH9zwZTjAfUNsA3xe7CdJ7WM9hdUYGHZ4mdxgCP
         sLghdrsDiOAsUJc+wObLsvA0Ks/DoxpM7i4Q402vJjgriKNqRMnvDfw4Md7/UPmzJPZG
         Rl/+RxFxoKWsXxlsCfwAMQl2n5POTISOzFqrahotltObdvyNF4VMtS+dfrSEguyXydhw
         4QpUM0XPHav4yP8SiomGXqE2xVYnC+3NHCpTLo+EBvI0vCSK+/wzKKfyzsOpwIlOwtmi
         XjfI5VQZGmwXfA2kio4ulKFP6HOK1ZD6nHmje49obrUJHhR4dmNN5Hktc6IJx7CFiyTK
         YgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L7LS3CTO+y/aLliPfCEtLr2UH4vA3T5jXf37IbE+3f8=;
        b=FYK3ENQVoSCUlghvbgPUD0FXFoLmGcXUO19sjnzE+/wPk1nfue7FIWKh91qdnZLGC3
         eAvScEQr6ENlJOsPfQW/G5VrtbeXuc1ygsFat/85k1ehBhhF0G+XXTpH7zTFEFZUt7jv
         d2cKkdakceHmLIme7Ho7DMErpsAkv02+cnHM4NIoRCOD3FqgsFlBA3QaSU0sq8/notDF
         oa5jhczU/mHia07jE5eyiVIA6Th1+WfJcf30KUR3+/kGvaJMekQm78J2HYYKvSp3H/f5
         rWJQ2U/x1b2BKrnSleyaUBKau74sOnKjOs5xza52zAKSmRfztFXPSvbri1wXuMaVfFZC
         ks8A==
X-Gm-Message-State: AOAM531NAArk2DIatZVYQl0wYxP5Vw4H4xyvR3qaXz/lVXZLTy1s9Uop
        +ztIV8no/RJFAHAeQV+nkgKBcg==
X-Google-Smtp-Source: ABdhPJwxGhgEs+20/YIlsLAvn3XZ5DJ494PHqzI6RNwjNmqHFbrbM5igiNM9oxB0U3AsrzhyuB2nkw==
X-Received: by 2002:a17:907:8a21:b0:6f4:d2e5:4d17 with SMTP id sc33-20020a1709078a2100b006f4d2e54d17mr345553ejc.196.1651653048687;
        Wed, 04 May 2022 01:30:48 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id jz15-20020a17090775ef00b006f3ef214e4fsm5377029ejc.181.2022.05.04.01.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 01:30:48 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Scott Branden <sbranden@broadcom.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-samsung-soc@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Liviu Dudau <liviu.dudau@arm.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Broadcom Kernel Team <bcm-kernel-feedback-list@broadcom.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     Rob Herring <robh@kernel.org>
Subject: Re: (subset) [PATCH v2 7/9] ARM: dts: exynos: drop useless 'dma-channels/requests' properties
Date:   Wed,  4 May 2022 10:30:35 +0200
Message-Id: <165165303187.30033.108615029823581053.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220430121902.59895-8-krzysztof.kozlowski@linaro.org>
References: <20220430121902.59895-1-krzysztof.kozlowski@linaro.org> <20220430121902.59895-8-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, 30 Apr 2022 14:19:00 +0200, Krzysztof Kozlowski wrote:
> The pl330 DMA controller provides number of DMA channels and requests
> through its registers, so duplicating this information (with a chance of
> mistakes) in DTS is pointless.  Additionally the DTS used always wrong
> property names which causes DT schema check failures - the bindings
> documented 'dma-channels' and 'dma-requests' properties without leading
> hash sign.
> 
> [...]

Applied, thanks!

[7/9] ARM: dts: exynos: drop useless 'dma-channels/requests' properties
      commit: d414b7a3f370d640cff544a3aa3a41abf34fd5d6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
