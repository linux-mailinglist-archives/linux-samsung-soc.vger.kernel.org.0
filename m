Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9F8F53E638
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  6 Jun 2022 19:06:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232800AbiFFJWy (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 6 Jun 2022 05:22:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232782AbiFFJWw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 6 Jun 2022 05:22:52 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 632F3BC12
        for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Jun 2022 02:22:47 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id q21so27742479ejm.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jun 2022 02:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E4ZcLOSWxK+rHyXMfXMzvjD+ScWULFvbW/YKSseNd0o=;
        b=iqSxGuT0zbMSXTWCbKc9S/PpFRxvt9BtQtdpMZ5ns3VtW+KyRpo6YpE9Umv8BfkcGh
         ZIthpJqvD7pC6PhNlybLjSjYm3F0tzEr6g2rwrfhPuWW39m970WXKQi9XEZ402Z0hLAy
         y4jyI5Fklc4ZEiW2QkH1aSdnjgF9fNwObgXhyPFxdCXuDJFEwUs0nEsNqVxMY6HQE4eJ
         7kqilWtoyVWNLNQdVJo32Rk0BMvPw/i0THlwYXyGltY06wtmYEgoRlYu+4efpRNxhQgo
         fQ7Z8bECXEXUpxQvHmnf/2ieQ9w6kqumpuvKv0j658YTkhNaAGPR38cpVoZfvoN56kkj
         2gOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E4ZcLOSWxK+rHyXMfXMzvjD+ScWULFvbW/YKSseNd0o=;
        b=tUGftp6wEDSv+aOmvQgng46LKtXTRWsKkLdh+/M8eZ+YU7zHuNPSYgiRki7bpkP3L/
         Nb/66L27sSQdr7DJDQGkPRaqH/jAuWelh7LbXeoTLDBTW0SfZf/ENycpBu/dg7UvJ4d6
         6coXV36NR6xLEjio6MyX/4RB0ZnW9LQzM+Ytb2H8eBT5/fU5eLLiZDmekeDKlvh5FhjX
         O7yIZik51fQDkjwx8aq9SXT6sfXyteA1jO4lbZxKahb/1uVPB9bHpC8mBtC8V1iL0J2I
         8aDenBx46A9lXDujqr1qRhjbDPxXSnBslhSPApPhcz+5b95cH0xNWwrpsLXVMQeCox/Z
         h82Q==
X-Gm-Message-State: AOAM533T4JXr4lMjazq1OQreY7bHzLs01GFa57lE900AXXD3c+/HsxzK
        91vis4iDlYyACM0uf9g3/dRoJg==
X-Google-Smtp-Source: ABdhPJwXuzf4Ezx+ISzM3Eck2TLLVbePEC6V42utJkwRyYokw9c6UA4yBwLRej4c/S3TK8mNgmPkyA==
X-Received: by 2002:a17:906:1256:b0:711:9b13:553 with SMTP id u22-20020a170906125600b007119b130553mr7240072eja.45.1654507365269;
        Mon, 06 Jun 2022 02:22:45 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u21-20020a1709064ad500b006f3ef214e14sm5956397ejt.122.2022.06.06.02.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 02:22:44 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     David Virag <virag.david003@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-clk@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        linux-kernel@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: (subset) [PATCH 2/2] arm64: dts: exynos: Correct UART clocks on Exynos7885
Date:   Mon,  6 Jun 2022 11:22:36 +0200
Message-Id: <165450734050.62970.14533261660609424322.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220526055840.45209-3-virag.david003@gmail.com>
References: <20220526055840.45209-1-virag.david003@gmail.com> <20220526055840.45209-3-virag.david003@gmail.com>
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

On Thu, 26 May 2022 07:58:40 +0200, David Virag wrote:
> The clocks in the serial UART nodes were swapped by mistake on
> Exynos7885. This only worked correctly because of a mistake in the clock
> driver which has been fixed. With the fixed clock driver in place, the
> baudrate of the UARTs get miscalculated. Fix this by correcting the
> clocks in the dtsi.
> 
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: exynos: Correct UART clocks on Exynos7885
      https://git.kernel.org/krzk/linux/c/f84d83d8165570380f55f4ce578bfb131a9266c5

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
