Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78854412D31
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 21 Sep 2021 05:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231912AbhIUDP4 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 20 Sep 2021 23:15:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349430AbhIUC0e (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Sep 2021 22:26:34 -0400
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40069C1E3277
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Sep 2021 12:04:34 -0700 (PDT)
Received: by mail-pg1-x54a.google.com with SMTP id q23-20020a6562570000b029023cbfb4fd73so15969528pgv.14
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Sep 2021 12:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=lAZa/uDHOuRnoNyLpi7ucyhYyEvosH1TAO5N4aOwUf4=;
        b=HJ4DeaiXQZr/enJuuumnzUVek0sze1KSs1HaUFw8WJ2QjKDgCJ+XwqlXtIKksEJTSB
         eJPNj0/XcdBMPeuj/YrtRk5F29cSqZe1dId4FqCoGZiNPBWzdFx30W5h/xLW26+BqvfX
         YIeVJtYvSn8/osqR/UC47hxNHlwd5CFw1g5I6G6laBbLs6IrsPItvBwZaz/M7ZiPDiGy
         G78/3CoaXwvo4Q1SP5Yu+8dr780ohJwW8zQxL4td/6hORnL6horUxhkDSRBN3XhngzAH
         yHZp4/yFk/1CZnhehuXJnoiXyp7lpCgiwKBWgqRESq/OukmKsnArNqqSOHl6+vmjMmvv
         SEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=lAZa/uDHOuRnoNyLpi7ucyhYyEvosH1TAO5N4aOwUf4=;
        b=tlF4RxlYAGL8n/NzOoZ+xukVHA/9AV0Mx5QbY6fiJJE6zAagg9kIFIddJfN3SIE4dg
         IlJUn/XEosaG0lY4SGO1F+TpyLu5dboSXo74wv3TcFU61EUcMSj/1CNB0SeX3muulLgU
         gozC89Fzzi/KtidBWmfVCLDGCL9kjk6jYcl3LIv3GSQHSqXMJQJobzEfvUeNqSDMAAdu
         oyYm4qCVcq8M0sPWYq7/8ZGS4yW+5eaEyvDOXTleEtLC7ituW5GjMRlpVtCo4na1Gkh0
         awhLzJXR3qXaqzD/aDka1o3jMrND+Asg3IU7IHZBAIMBcepOVXScMSVMAAmr9ESKbTej
         AXGA==
X-Gm-Message-State: AOAM532lWdN+DhXZs0bV/ob+UxmdiVJqz1Wchtuq4qLyBIwpWlo9lgVt
        bURYpEvCpAl8dQ97vQhF0ulxAUU9zROuYvmr5xM=
X-Google-Smtp-Source: ABdhPJzUNF/PM6NP+/MIABOOlGQE6wEJIPyLI9894e884/ud4IKfYPTvMOuCyfQ8j6JThtSCqFknZPzuuWRs07ogzoQ=
X-Received: from willmcvicker.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:a05:6a00:1c52:b0:443:41c3:1e51 with
 SMTP id s18-20020a056a001c5200b0044341c31e51mr23232314pfw.32.1632164673665;
 Mon, 20 Sep 2021 12:04:33 -0700 (PDT)
Date:   Mon, 20 Sep 2021 19:03:45 +0000
Message-Id: <20210920190350.3860821-1-willmcvicker@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.464.g1972c5931b-goog
Subject: [PATCH v1 0/4] arm64: Kconfig: Update ARCH_EXYNOS select configs
From:   Will McVicker <willmcvicker@google.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Will McVicker <willmcvicker@google.com>,
        kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This patch series tries to address the issue of ARCH_EXYNOS force selecting
a handful of drivers without allowing the vendor to override any of the
default configs. This takes away from the flexibilty of compiling a generic
kernel with exynos kernel modules. For example, it doesn't allow vendors to
modularize these drivers out of the core kernel in order to share a generic
kernel image across multiple devices that require device-specific kernel
modules.

To address this without impacting the existing behavior, this series
switches the default config logic for the offending configs to use "default
y if ARCH_EXYNOS" versus having ARCH_EXYNOS directly select them. I have
verified that these patches do not impact the default aarch64 .config.

Will McVicker (4):
  clk: samsung: change COMMON_CLK_SAMSUNG default config logic
  soc: samsung: change SOC_SAMSUNG default config logic
  pinctrl: samsung: change PINCTRL_EXYNOS default config logic
  rtc: change HAVE_S3C_RTC default config logic

 arch/arm64/Kconfig.platforms    | 7 -------
 drivers/clk/samsung/Kconfig     | 1 +
 drivers/pinctrl/samsung/Kconfig | 1 +
 drivers/rtc/Kconfig             | 1 +
 drivers/soc/samsung/Kconfig     | 4 ++++
 5 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.33.0.464.g1972c5931b-goog

