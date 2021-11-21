Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52872458451
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 21 Nov 2021 16:06:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238398AbhKUPJI (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 21 Nov 2021 10:09:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238395AbhKUPJH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 21 Nov 2021 10:09:07 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA37AC06173E
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Nov 2021 07:06:02 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id bu18so68452915lfb.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Nov 2021 07:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k8vZd6v9v9+rdgKV/PqzJo8VveO9M9COmbjdbxILTmY=;
        b=T2epvNnR/erfzq7gZjzmw5DBnXb43OC0XHNHflZQZwKGVhk6X6ovTmVXeJ1TsGMdSz
         DQi0nRto2Wd1WHdiGwF++7+syR8m6i/ShNRApO17Z9Nx45f2wsIULpKiDDFOcbV/hhPt
         LqDEfEF5Hc/d4C4CG78rP1Yg4H5hT+rsBYRzTgJtjgslK3z4pmSu3zPPvWUQUA7dtmbl
         3oK7VhXehX+RN0I68oOgFkeqY6PqSyamTIuA+ltpooetsMxtzOEmJPRHvoy94RjlDr8T
         fzQhe85iirJSN6f/7gpEG75jTSM/Wm/OKY8XlQrW+o7y4/r5R4D+NNgn4DMlVbHX0F+5
         SXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k8vZd6v9v9+rdgKV/PqzJo8VveO9M9COmbjdbxILTmY=;
        b=Bvha8E8q8WecwV18efTsbclalCNFSVGEaACh09LLN9HkIKiD9bAoP7cxzekhG87Y9H
         mFJZ2/ne7jb6buiraISS8g1PZxsm/aounC6bB3uHF48sDbY0NotmJZu+IfyMq5+XsNC7
         7T2ILIxNW3PoCYE8LyJ2xTgxFGIeApN3ESE0LzEEuKGAQeja4nBhMYB1QYRuoTV8KalB
         ODSS2e1eNZyLAinUDJXsOYRTXk+kWuS1TGjCCdDuT1AAMnxfJNBJJUDZKBF4oktMGEyU
         KrkpjKnpNjmd/6yzLnTwHe5BImv30hF/wW6wPSAOE3Iqzmc4xC/whmz95IWgGO5iOCVx
         BlqA==
X-Gm-Message-State: AOAM530oZjyhWOXZ6zbkk48s9Na/C+i7gFV1OVO4LY4BLH8GuOX+/gVz
        o5jkxomwGjGrivK/Wn+pXvt3Zg==
X-Google-Smtp-Source: ABdhPJxfPdCz9cplT/BecIooFLfm3HHfz5dDCAwheJVLk50og2S+UyVylGS1Lj8vXq4tE9zkADh3DQ==
X-Received: by 2002:ac2:464f:: with SMTP id s15mr48950544lfo.590.1637507160860;
        Sun, 21 Nov 2021 07:06:00 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id bj11sm578251ljb.62.2021.11.21.07.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 07:05:59 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Will McVicker <willmcvicker@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: [PATCH v2 1/2] arm64: defconfig: Enable Samsung I2C driver
Date:   Sun, 21 Nov 2021 17:05:57 +0200
Message-Id: <20211121150558.21801-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

i2c-s3c2410 driver is needed for some arm64 Exynos SoCs, e.g. Exynos850.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - Rebased on latest linux-next

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f2e2b9bdd702..0da6a944d5cd 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -461,6 +461,7 @@ CONFIG_I2C_QCOM_GENI=m
 CONFIG_I2C_QUP=y
 CONFIG_I2C_RIIC=y
 CONFIG_I2C_RK3X=y
+CONFIG_I2C_S3C2410=y
 CONFIG_I2C_SH_MOBILE=y
 CONFIG_I2C_TEGRA=y
 CONFIG_I2C_UNIPHIER_F=y
-- 
2.30.2

