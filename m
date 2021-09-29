Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3995E41BB3D
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 29 Sep 2021 01:56:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243327AbhI1X6d (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 28 Sep 2021 19:58:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243285AbhI1X6c (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Sep 2021 19:58:32 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64F83C061746
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Sep 2021 16:56:52 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id q8-20020a056902150800b005b640f67812so1100614ybu.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Sep 2021 16:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=n/4ji2XuxpZN636ga4YIidKk8OUAj8FasKFOyipQUCs=;
        b=I824tzwXK4ArJM33zKh8o41jaDjDUrDwRpvfINUp1+mgEb5E+73AhhO7xB2aGXDHYN
         RHFI+0EmQVLvawHS6MK/NJHIx+ksKZm/NBOoZt8qYkipjxv6FREv0V8BlNPi0UNotPyK
         jelAwquik+M3dN82rRK9qNJqatBYNi95BqfB0ZaJ909diQpb9I9WE1xpoydt7Wl9HOJS
         tLnkvR02vXmMUpakGUA7yNLzrY9JxZ9np72xou6mg+LWNetAWUilreJ7GSbotmzIVX54
         iA+Jv0m/Qj8ED6rqsfyEEwsXDa60y5SPuILXh7bmGelUhv84dRGMz+K3X7RJKgOVyjQ1
         H6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=n/4ji2XuxpZN636ga4YIidKk8OUAj8FasKFOyipQUCs=;
        b=AIO5BratVTpgvCZ+wJecZbmPZm8OPmKekTLS8GR90pAqt8KzuYUZPTBuw3WnXKDTbT
         2zlzFzX2jmORKDvTvaTUzO/P/RxUnesNBk7xYT3I44kdgQSZulsF3UMgezuVV0640yyT
         ecNTsAFUrwgmTh0OG1OUr/oV5zvBqc5/fPsoKsHS+CCNRfvOu5uaWj5O6oHY5fhk+xxG
         RBN3fhX25J/+GN1Q7qJREIEc5W1BZmcD/YDCuK9s1mpb9eWiDuVExWInJd42PlLvJhb7
         eI3H/oY0wDpU8gcidLEb3teDDJYRtu2M3+lpkc93Ho1+MpyGN51k3R/bEiCHWZzWj7Ev
         XR+g==
X-Gm-Message-State: AOAM532SKw5ckyzWCDJCKd20jL5MEh8Ao33foiJ9l4nkVGQdTXZ75rMm
        GngnilI9olyzU58TB1ZjREyoLYvj8FvzVIOYLLY=
X-Google-Smtp-Source: ABdhPJwiBWkFSrRZjL9CwMHS4p+dCQodZ0zYKtZ+o0uIxNB3pJVtsnCdQl0dwzC+XK2dm4Dr78SZgIrssykhmy8RZNc=
X-Received: from willmcvicker.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:a25:2e07:: with SMTP id
 u7mr9785709ybu.1.1632873411609; Tue, 28 Sep 2021 16:56:51 -0700 (PDT)
Date:   Tue, 28 Sep 2021 23:56:17 +0000
Message-Id: <20210928235635.1348330-1-willmcvicker@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
Subject: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select configs
From:   Will McVicker <willmcvicker@google.com>
To:     Russell King <linux@armlinux.org.uk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Saravana Kannan <saravanak@google.com>,
        Will McVicker <willmcvicker@google.com>,
        kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This is v2 of the series of patches that modularizes a number of core
ARCH_EXYNOS drivers. Based off of the feedback from the v1 series, I have
modularized all of the drivers that are removed from the ARCH_EXYNOS
series of "select XXX". This includes setting the following configs as
tristate:

 * COMMON_CLK_SAMSUNG
 * EXYNOS_ARM64_COMMON_CLK
 * PINCTRL_SAMSUNG
 * PINCTRL_EXYNOS
 * EXYNOS_PMU_ARM64
 * EXYNOS_PM_DOMAINS

Additionally, it introduces the config EXYNOS_PMU_ARM64 and EXYNOS_PMU_ARM
which was previously EXYNOS_PMU and EXYNOS_PMU_ARM_DRIVERS respectively.
The reason for these new configs is because we are not able to easily
modularize the ARMv7 PMU driver due to built-in arch dependencies on
pmu_base_addr under arch/arm/mach-exynos/*. So the new configs split up
the ARM and ARM64 portions into two separate configs.

Overall, these drivers didn't require much refactoring and converted to
modules relatively easily. However, due to my lack of exynos hardware, I
was not able to boot test these changes. I'm mostly concerned about the
CLK_OF_DECLARE() changes having dependencies on early timers. So I'm
requesting help for testing these changes on the respective hardware.

Lastly, this series is based off of [1] since there are dependencies on
EXYNOS_CHIPID from that series..

[1] https://lore.kernel.org/lkml/20210919093114.35987-1-krzysztof.kozlowski@canonical.com/

* From v1:
  - Fixed modifying hidden configs
  - Modularized all the drivers that were touched
  - Removed HAVE_S3C_RTC
  - Updated all Samsung ARCH_XXX configs as suggested from reviews
  - Rebased on top of 5.15-rc3 and pulled in [1]

Will McVicker (12):
  arm64: don't have ARCH_EXYNOS select EXYNOS_CHIPID
  timekeeping: add API for getting timekeeping_suspended
  clk: samsung: add support for CPU clocks
  clk: samsung: exynos5433: update apollo and atlas clock probing
  clk: export __clk_lookup
  clk: samsung: modularize exynos arm64 clk drivers
  clk: samsung: set exynos arm64 clk driver as tristate
  pinctrl: samsung: modularize the ARM and ARM64 pinctrls
  pinctrl: samsung: set PINCTRL_EXYNOS and PINCTRL_SAMSUNG as tristate
  soc: samsung: pmu: modularize the Exynos ARMv8 PMU driver
  soc: samsung: pm_domains: modularize EXYNOS_PM_DOMAINS
  ARM: rtc: remove HAVE_S3C_RTC in favor of direct dependencies

 arch/arm/Kconfig                              |   1 -
 arch/arm/mach-exynos/Kconfig                  |   6 +-
 arch/arm/mach-s3c/Kconfig.s3c64xx             |   1 -
 arch/arm/mach-s5pv210/Kconfig                 |   3 -
 arch/arm64/Kconfig.platforms                  |   6 -
 drivers/clk/clk.c                             |   1 +
 drivers/clk/samsung/Kconfig                   |   5 +-
 drivers/clk/samsung/Makefile                  |   3 +-
 drivers/clk/samsung/clk-cpu.c                 |  28 +-
 drivers/clk/samsung/clk-cpu.h                 |   2 +-
 drivers/clk/samsung/clk-exynos5433.c          | 465 ++++++++----------
 drivers/clk/samsung/clk-exynos7.c             | 177 +++----
 drivers/clk/samsung/clk-pll.c                 |   6 +-
 drivers/clk/samsung/clk.c                     |  35 +-
 drivers/clk/samsung/clk.h                     |  50 +-
 drivers/pinctrl/samsung/Kconfig               |   5 +-
 drivers/pinctrl/samsung/Makefile              |  13 +-
 drivers/pinctrl/samsung/pinctrl-exynos-arm.c  | 102 ++--
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    |  73 +--
 drivers/pinctrl/samsung/pinctrl-exynos.c      |  17 +-
 drivers/pinctrl/samsung/pinctrl-samsung.c     |  11 +-
 drivers/rtc/Kconfig                           |  10 +-
 drivers/soc/samsung/Kconfig                   |  18 +-
 drivers/soc/samsung/Makefile                  |   8 +-
 drivers/soc/samsung/exynos-pmu.c              |  13 +-
 drivers/soc/samsung/exynos-pmu.h              |   2 +-
 drivers/soc/samsung/pm_domains.c              |  12 +-
 include/linux/soc/samsung/exynos-pmu.h        |   2 +-
 include/linux/timekeeping.h                   |   1 +
 kernel/time/timekeeping.c                     |  11 +
 30 files changed, 553 insertions(+), 534 deletions(-)

-- 
2.33.0.685.g46640cef36-goog

