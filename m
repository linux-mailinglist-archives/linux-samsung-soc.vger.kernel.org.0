Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A58153F65C
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  7 Jun 2022 08:39:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237147AbiFGGj3 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 7 Jun 2022 02:39:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237117AbiFGGjY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 02:39:24 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01E57CC174
        for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Jun 2022 23:39:23 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id x5so16543634edi.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jun 2022 23:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gthr2rDVZCC5eUHDm7nypGvnCL9siQbR0c9qEemOTuU=;
        b=IvA5jkbAS5+IBxZxoWfSit5DnOBQ0k10JnVeMYYxdDh3qyb1DLpCpcnuvo/tFqY8GT
         a69iHzkN+Uh3t4pLRLmdVYeqmew221YH2maRr6z5sctq/91L7H5CeH6RhJAe2O6Yr2c1
         bqKECVvsCtjKmcak8bKEpUrHf3IWso1LKM0x2upz3XSwuv9imhe8M552TEI2z9Pa/mWa
         V0yUXNnTOApxjL9sMRQexJ5vJx0dAKxgrKSt+rpF86dCkP6075Na3uvygeH1Zho1r2Is
         yA0rWO2MRNaNBJ6KVDqKN6SV41Nmsr+oBd55+NcOtwQlA3zgDt122OnbrSAiTd/XerTs
         xDiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gthr2rDVZCC5eUHDm7nypGvnCL9siQbR0c9qEemOTuU=;
        b=cyc4LgeG/ZdFDMJ5c4RTrh8wZ7l02MD/xG2spZA7Veyv+Q2bYs4rmUm2sI8MtY8Na6
         IkaUCEJxUo82qWsSA0bYLX0tzVcNEfy5qnp3OQwpt3avxZol/rdn45QgKuKaO9lkpKSb
         qxlDTUnPaDTdlA19JX4e9yxyTNYYpNJqoVaSjTwPC/BhEOAwOn2EOruo1omKyH990FFc
         KW5TUrw6/+JLSdHMEgcj2JAG2ml/n7QTV0youPxNS0INl5HhdN9lo6lT8EdKFagiYhfB
         LRP1ujlbd6GLMeO5LFoqH0qhxyXYJHis4pDgRfpnHQbHTY0nNJ8AfbeiLFwlJcQ9m4d8
         MRBA==
X-Gm-Message-State: AOAM533kh9haDi1B/8PuHENEEQoTSgJD+E04R9AKDkae6Tjg73xsNJCP
        oMYDrsJFlA3TknGSef5hiuEA9Kby7leFLg==
X-Google-Smtp-Source: ABdhPJxxFmJ9G+AwxhXaxPpm1WR2ZpLgf0OBshN0o4FZtDFEwlK9zWxovY0dyVuqAnCcmVkc0cNhaA==
X-Received: by 2002:a05:6402:195:b0:431:5499:35eb with SMTP id r21-20020a056402019500b00431549935ebmr12138246edv.346.1654583961608;
        Mon, 06 Jun 2022 23:39:21 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id jo13-20020a170906f6cd00b006febc86b8besm7016888ejb.117.2022.06.06.23.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 23:39:21 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-arm-kernel@lists.infradead.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc:     Chanho Park <chanho61.park@samsung.com>
Subject: Re: (subset) [PATCH v3 6/8] arm64: dts: fsd: use local header for pinctrl register values
Date:   Tue,  7 Jun 2022 08:39:14 +0200
Message-Id: <165458395109.7886.9170091860455591934.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220605160508.134075-7-krzysztof.kozlowski@linaro.org>
References: <20220605160508.134075-1-krzysztof.kozlowski@linaro.org> <20220605160508.134075-7-krzysztof.kozlowski@linaro.org>
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

On Sun, 5 Jun 2022 18:05:06 +0200, Krzysztof Kozlowski wrote:
> The DTS uses hardware register values directly in pin controller pin
> configuration.  These are not some IDs or other abstraction layer but
> raw numbers used in the registers.
> 
> These numbers were previously put in the bindings header to avoid code
> duplication and to provide some context meaning (name), but they do not
> fit the purpose of bindings.  It is also quite confusing to use
> constants prefixed with Exynos for other SoC, because there is actually
> nothing here in common, except the actual value.
> 
> [...]

Applied, thanks!

[6/8] arm64: dts: fsd: use local header for pinctrl register values
      https://git.kernel.org/krzk/linux/c/2a795ade7740a3217eb2b08179479018c5bf25dd

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
