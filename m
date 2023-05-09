Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E3946FCD5A
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  9 May 2023 20:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234908AbjEISKA (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 9 May 2023 14:10:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234959AbjEISJt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 9 May 2023 14:09:49 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 653074C3A
        for <linux-samsung-soc@vger.kernel.org>; Tue,  9 May 2023 11:09:47 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-50c8d87c775so8021026a12.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 May 2023 11:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683655786; x=1686247786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OOQJ77m1hn2uL1cTNrMZrbjBsCRcFkR8CI8TyWOVeFY=;
        b=OovPyp7aIg8w0Y2PWf73DJevlnGdLg6GkUsrV5aMhfHSA/KQaHoY89Y1q4g8zhbUe3
         cNTyTRLnrYWmioL+NQm7sH+YoyOTLtcEI0eXmQNHMGO3O6AxcD3g101jAc2BFiz5jCYc
         DkQLoj06QPse32O1Igj++xPPUtAcks/RooaQrH5VyjbCpwaVfCb4mmftt5wGXpO45jEf
         wwGvn+faJfzqPADD5jqw/msSmUOcrzf3WOJVTyoS/mLKIJ+GMoBF/C8DO/yQSWtmsLKj
         2XXq0b3BuqHulO3w8gNELQpPD8kbuMgqvsMLTJT2JtRJJw91y2SGsKK0pVUq/dYp9P7E
         k7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683655786; x=1686247786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OOQJ77m1hn2uL1cTNrMZrbjBsCRcFkR8CI8TyWOVeFY=;
        b=VO0p7YQNQPVILgUtZyE1yjtqZEVe3S4YhSGJsYw5uFVWj70Y/lSSSW1x6ZUcKXzpAT
         8o78fhh352zjz8igEE5aAoykqhu7xkjxUJJ+EPqSA8qEMNdpvQ0Wxw5c1tZ/GVluS3Vn
         ZX7ODCC0mGiqSiQqCcIc5X/661DFHKmWGsOTFOTSrOMyMizYXxQRDx+iAvc1XbJhHKHI
         ZD4qbU4i9yTqyl6kxOGaIZJW59GYJ7nXU9QmBgK12zI1nkR9tIro7kOmzybOJqAw3siF
         JGyPNjSx4brCTPLenggjqUuuKdWsFITTjiE08Vy1wmU4On2raelzQeZTFkDhQI7li8y2
         jy7Q==
X-Gm-Message-State: AC+VfDzZfu7AXL9+HLNBO3sHkVzHhTOfIVJyX0IioV2RONIqc1L12KrP
        Q9Kaq6eLnStD9zO16Xife5pZkg==
X-Google-Smtp-Source: ACHHUZ6cDJL6YidGvvj6uPnksNjdWxWsEBzwCc6yc87ckzFi/G3UAAmcV2j/+o2UMJfpv4L8Y5V2aA==
X-Received: by 2002:a05:6402:10cc:b0:502:2494:b8fc with SMTP id p12-20020a05640210cc00b005022494b8fcmr10929397edu.7.1683655785888;
        Tue, 09 May 2023 11:09:45 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
        by smtp.gmail.com with ESMTPSA id dy28-20020a05640231fc00b0050d8b5757d1sm1015286edb.54.2023.05.09.11.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 11:09:45 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Artur Weber <aweber.kernel@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>, soc@kernel.org,
        Russell King <linux@armlinux.org.uk>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Kukjin Kim <kgene@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-phy@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: (subset) [PATCH v3 04/13] soc: samsung: Re-introduce Exynos4212 support
Date:   Tue,  9 May 2023 20:09:31 +0200
Message-Id: <168365575564.242810.10871458937058949630.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230501195525.6268-5-aweber.kernel@gmail.com>
References: <20230501195525.6268-1-aweber.kernel@gmail.com> <20230501195525.6268-5-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Mon, 01 May 2023 21:55:16 +0200, Artur Weber wrote:
> Support for the Exynos4212 SoC was originally dropped as there were
> no boards using it. We will be adding a device that uses it, so add
> it back.
> 
> This reverts commit c40610198f35e8264f9175dafe74db6288a07eda.
> 
> 
> [...]

Applied, thanks!

[04/13] soc: samsung: Re-introduce Exynos4212 support
        https://git.kernel.org/krzk/linux/c/514a935fd0d4d522a08257f5acbc5439174c7cf0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
