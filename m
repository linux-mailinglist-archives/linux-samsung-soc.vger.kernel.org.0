Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD2A0602CC9
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 18 Oct 2022 15:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbiJRNWD (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 18 Oct 2022 09:22:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbiJRNWD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Oct 2022 09:22:03 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4639C8970
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Oct 2022 06:21:57 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id x13so8554394qkg.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Oct 2022 06:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z33uk414We1g4gOsoWnqaO7N6y0Y3KHqQiFLjsfZ0NM=;
        b=vN5NSQX9kYsCu2gbkglEpzN0tZk9vRDunf7Q1bxVnxsWe9Ktap/0XANVUv+ZhNmiY5
         N9s1KbO5bK41RhG+m7nutyn4o7wCGrMZYClfTnVX9TuSkve+y1WiqxteuBAhPhrIrdS5
         kqHET7a2gC2GPKTJzpIQm7/6Np+GqfuH71feC5oYLfWWEw7o2kqQHBSj9BkfJekhsEK5
         SVtgfri6WXqGkezL6x+XQnHCpVCzeSc1sxBUeiEdRjHmFdcmSj70EZJVjjx7kTOtYJfo
         D2o8zRjbZ8csb8xa2wAVcKR4lLIOAzT4LEnl5PyLWhjX0IATF/QHBBiTCojCVortpMLo
         mlPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z33uk414We1g4gOsoWnqaO7N6y0Y3KHqQiFLjsfZ0NM=;
        b=6CuopU5Rl7/q6xkOzBXmuaWVcopxc6TIg3+xEku+dNsYSMmnkrNqw9yPTwLudrOZOo
         fdPUu5DZbncZ8hqtOxclOi9R/cQZGfRruHbia5mghXDnKVOLRPfdbZoBA+hDJtyV3pVL
         l1lP9uop8h7h4ub40KFUuN5yZGdvnqEQlzUy3qZ0JGw1GVxIgEUeKlcfnrgKt4dRkUq3
         EYwmFpQabcHgFndDja5W/4MHjtN/GnhAGC4lYhnMSoViVZx32HfGDNpaCy9xo39mwILy
         ypaMcY+hIaddyB4z3OI3lzwq5RZijdlXlJhYS4pFOL2wpr6/tM0hBMqMEvcdaxU4UqJb
         ucEg==
X-Gm-Message-State: ACrzQf3+Y//+mte5YCOj0PCws4zVUcDaugfxhHXT1XYXmBK1RBf4WyLl
        jkgN+qmSBs8pbEBjkhSk0XxjJg==
X-Google-Smtp-Source: AMsMyM6epQhO71IfWyUMPE+bzbtfykSK7NicJ9F6vuCbAfCo/fkzPjKIspvbWZKzkwzvREm+k6zsng==
X-Received: by 2002:a05:620a:2443:b0:6ee:b1f0:3798 with SMTP id h3-20020a05620a244300b006eeb1f03798mr1706821qkn.444.1666099316769;
        Tue, 18 Oct 2022 06:21:56 -0700 (PDT)
Received: from krzk-bin.MSRM (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id i19-20020a05620a249300b006b949afa980sm2415794qkn.56.2022.10.18.06.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 06:21:56 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     chanho61.park@samsung.com, pankaj.dubey@samsung.com,
        alim.akhtar@samsung.com, linus.walleij@linaro.org,
        robh+dt@kernel.org,
        Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>,
        krzysztof.kozlowski+dt@linaro.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] arm64: dts: fix drive strength macros and values for FSD Platform
Date:   Tue, 18 Oct 2022 09:21:52 -0400
Message-Id: <166609930553.9199.13331632528050957780.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221013104024.50179-1-p.rajanbabu@samsung.com>
References: <CGME20221013110708epcas5p3c54c22bbc77175eb2a26dc9fd43814d5@epcas5p3.samsung.com> <20221013104024.50179-1-p.rajanbabu@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 13 Oct 2022 16:10:20 +0530, Padmanabhan Rajanbabu wrote:
> With reference to FSD SoC HW UM, there are some deviations in the
> drive strength macros names and macro values. Also the IPs are not
> using the default drive strength values as recommended by HW UM.
> 
> FSD SoC pinctrl has following four levels of drive-strength and their
> corresponding values:
> Level-1 <-> 0
> Level-2 <-> 1
> Level-4 <-> 2
> Level-6 <-> 3
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: fix drive strength macros as per FSD HW UM
      https://git.kernel.org/krzk/linux/c/3a27bce7e13e3b5368377c9a518927e197a4afb1
[2/4] arm64: dts: fix HSI2C drive strength values as per FSD HW UM
      https://git.kernel.org/krzk/linux/c/bb997d949e5a835f626facfd67b1768fd4492398
[3/4] arm64: dts: fix UART drive strength values as per FSD HW UM
      https://git.kernel.org/krzk/linux/c/8aa0323c14d546a14cb1d39e38673bda20699f7e
[4/4] arm64: dts: fix SPI drive strength values as per FSD HW UM
      https://git.kernel.org/krzk/linux/c/54e628d4fb24f54d70aa423da485bf5f5ab7260b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
