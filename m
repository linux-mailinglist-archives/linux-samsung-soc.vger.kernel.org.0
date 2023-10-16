Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C928D7CA096
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 16 Oct 2023 09:29:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbjJPH3U (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 16 Oct 2023 03:29:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbjJPH3U (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 16 Oct 2023 03:29:20 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABD24B4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Oct 2023 00:29:18 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9ae2cc4d17eso673389966b.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Oct 2023 00:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697441357; x=1698046157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rzKbeL+RltdAkMywXo6rwpyMCBTadikUP8iBiYw2KH8=;
        b=Fa9DWsMkPSAFo8kzfD2lgzuWw8u3Syl14mHMx97nzGVvfLKtmqvCPik5GJdvI5KXsm
         YK/WyYq+YeAz873pnBp+gn/Evr4mDDXm/7G7G2n+g9CW2bKVQi6NiWc+VtcC+NaexUEV
         Tg/CKVT1jamwYKJXXqp3rEuSjSBzWe2WTF2x61tfr07T56jQ6cIGRDxPaX3LbmgXTjEo
         XE2L334DYG+2KHwsxkaxZ/9rJWSWNtbCxpX2rI5It2Hh7LmOYQtzwUpRXQ1o00FmSxen
         Ne+jzPlh0q2HNKjhGfSS91D15HbwF/kPhJHxk0u/CdTq/wjDnMYaMleymCGksELky/L7
         6ImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697441357; x=1698046157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rzKbeL+RltdAkMywXo6rwpyMCBTadikUP8iBiYw2KH8=;
        b=kTDWDDEt5zU/54F8WdCWmJBGeDoGp/QPuaEVPM6JJb87g2LBTtpwP+4oQKICMJyitE
         6yTfcozgKyb95YvtzSNJk7flMjisb/uEo2pKtPaUr5cExBSltN4omqqtihyBtuS19B6O
         zlOfRdTJFiyTyHcFB9wBcwJPTtSBosR86Fxf4GyXgR8BZINJvuu5jKWk6QsBBdeYcU0q
         6X/qahiDBOfD3XYLGENoC7mzf3oPuQ1vQz5cNXURDcHi84f9LxSbW8gv/gRSTkD4Dass
         NYBk0EvNjEbCFODV9X9bZUumUwf88pECdReCQvPjz1LbHEtfN3dpNvyrwdrFDERizoYO
         BqLw==
X-Gm-Message-State: AOJu0YxKdDPhmdJ2gD47InTUxX3M+OgirTmTDn0OjGIF7yB9ekn9gN4A
        oXGuB4jFQtvBjTvJYYxxFrmdrA==
X-Google-Smtp-Source: AGHT+IGYRxGC8BqeUozOgg4NTbh/Jlhq/lYDZ8UNbvwPqpI4s0ghq19dNlzi0lfqffb4DNNxhWxA5w==
X-Received: by 2002:a17:906:3012:b0:99d:e617:abeb with SMTP id 18-20020a170906301200b0099de617abebmr27876199ejz.23.1697441357118;
        Mon, 16 Oct 2023 00:29:17 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.154])
        by smtp.gmail.com with ESMTPSA id v3-20020a17090606c300b009b29668fce7sm3480791ejb.113.2023.10.16.00.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 00:29:16 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/2] ARM: defconfig: pull for v6.7
Date:   Mon, 16 Oct 2023 09:29:10 +0200
Message-Id: <20231016072911.27148-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-defconfig-6.7

for you to fetch changes up to 438fb575463fc490e6200e5e28d02159492a97f8:

  ARM: exynos_defconfig: add driver for ISL29018 (2023-10-06 13:57:37 +0200)

----------------------------------------------------------------
Samsung defconfig changes for v6.7

Enable several drivers for boards with Samsung Exynos ARM SoCs in
exynos_defconfig and multi_v7_defconfig: display PHYs, AHCI DWC, TM2
touchkey (used on ARM and ARM64 Exynos-based boards), Samsung camera
sensors and Intersil 29018 light sensor.

Enable also IIO in s5pv210_defconfig used by MAX17040 fuel gauge driver.

----------------------------------------------------------------
Marek Szyprowski (6):
      ARM: multi_v7_defconfig: make Exynos related PHYs modules
      ARM: multi_v7_defconfig: add AHCI_DWC driver
      ARM: exynos_defconfig: replace SATA_AHCI_PLATFORM with AHCI_DWC driver
      ARM: multi_v7_defconfig: add tm2-touchkey driver
      ARM: multi_v7_defconfig: add drivers for S5C73M3 & S5K6A3 camera sensors
      ARM: exynos_defconfig: add driver for ISL29018

Svyatoslav Ryhel (1):
      ARM: s5pv210_defconfig: enable IIO required by MAX17040

 arch/arm/configs/exynos_defconfig   | 3 ++-
 arch/arm/configs/multi_v7_defconfig | 6 ++++++
 arch/arm/configs/s5pv210_defconfig  | 1 +
 3 files changed, 9 insertions(+), 1 deletion(-)
