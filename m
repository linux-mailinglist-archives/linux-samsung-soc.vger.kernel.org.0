Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27CD555234B
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 20 Jun 2022 19:57:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244668AbiFTR5p (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 20 Jun 2022 13:57:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244831AbiFTR5d (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Jun 2022 13:57:33 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2080B19C2F
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jun 2022 10:57:32 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id eq6so8833709edb.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jun 2022 10:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VrRt2lOCy922nfr7XfMsj/Ktk4CkWXqc85e3Ig/vB+c=;
        b=mZhcCjDlXssr3H8K8DuLZ3exyF1IiroVWETn58RQj2Aiwe2KRb3Mo5BwZpaA4esg51
         /kEw8hgFo1uQ6gWqHIUymnSFcx5OYLCfIaWoJrLdNXTlqhRMr2zLxGiLkL+iEb313coM
         FhLz//RQB4hImWL+rM/S/LA5XxbO6OSm58o+CsJ6ovLhui+Abnb1A4dVQYmv5j3wASa7
         0gWAyiXu3t9CnBsyGfLBNVvPp1wGQUu8zPtAURqNGhMCSgS9jWOlH7MJagvOWWdkRIKS
         OJb9Rzsnoxfi5SPj2e/ZreJfu9XXVl6uxL9KBsatYPI6oi6TCfd4dOTrZWo/qagT7EBp
         g2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VrRt2lOCy922nfr7XfMsj/Ktk4CkWXqc85e3Ig/vB+c=;
        b=sOSYAgPDYSjZih1PvKMmfvJU+y7i4OikM4Ornvepty6fzxkcKZCGGKp440delnryPL
         vTt9EKUfJs+5NlfcLauUjvQmzASxPd+FmMF8+1gwyMQvXAATU52z7oUd8ctKZFNu7Nin
         VKwx8apZTH95iv+dlI/xmebJruLQyWvN7ma0x9SmyBTZ2yXMxkwrGT3vC+bpuaonTrkR
         0AXDZLFkQTP+SZMUdoc/8vBLQI5WwBntABYv5o/eg+IAJwE/cy77xVNcBxY7ourwcNwi
         AkS82NQHfyx+znqHKfsjVTetf4rwMFoHEdJyq+kzUIYpXC7kOfcpROWsW4ah4Zlr6Vg5
         pOyQ==
X-Gm-Message-State: AJIora8Zf1RKxFnoyK2cMSdaOppZmJRgF7b7LKDIsKbBK3g3lVcGFkcK
        u+BcsvtPtLyaApfxx5ZddSy2rw==
X-Google-Smtp-Source: AGRyM1sCLQNiPJbSeZysVNpu4lZNBSZg//4StCRKxRFZ9Utrf2lV3tcTtY7IAhELcw4FOk2Q2eBhOA==
X-Received: by 2002:aa7:d88a:0:b0:435:6abb:1284 with SMTP id u10-20020aa7d88a000000b004356abb1284mr17848268edq.353.1655747850768;
        Mon, 20 Jun 2022 10:57:30 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id g13-20020aa7c84d000000b004357b717a96sm4309925edt.85.2022.06.20.10.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 10:57:30 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/8] ARM: dts: iextend leds on Exynos boards
Date:   Mon, 20 Jun 2022 19:57:08 +0200
Message-Id: <20220620175716.132143-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Changes since v1
================
1. Drop the label from several places, per discussions with Jacek on other
patchset.

Best regards,
Krzysztof

Krzysztof Kozlowski (8):
  ARM: dts: exynos: add function to LED node in Origen 4210
  ARM: dts: exynos: add function to LED nodes in Tiny4412
  ARM: dts: exynos: add function and color to LED nodes in Itop Elite
  ARM: dts: exynos: add function and color to LED node in Odroid U3
  ARM: dts: exynos: add function and color to LED nodes in Odroid X/X2
  ARM: dts: exynos: add function and color to LED node in Odroid HC1
  ARM: dts: exynos: add function and color to LED node in Odroid XU4
  ARM: dts: exynos: add function and color to LED nodes in Odroid XU/XU3

 arch/arm/boot/dts/exynos4210-origen.dts         | 2 ++
 arch/arm/boot/dts/exynos4412-itop-elite.dts     | 5 ++++-
 arch/arm/boot/dts/exynos4412-odroidu3.dts       | 4 +++-
 arch/arm/boot/dts/exynos4412-odroidx.dts        | 5 ++++-
 arch/arm/boot/dts/exynos4412-tiny4412.dts       | 3 +++
 arch/arm/boot/dts/exynos5422-odroidhc1.dts      | 4 +++-
 arch/arm/boot/dts/exynos5422-odroidxu4.dts      | 4 +++-
 arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi | 8 +++++++-
 8 files changed, 29 insertions(+), 6 deletions(-)

-- 
2.34.1

