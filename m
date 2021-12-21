Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 154E847C166
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 21 Dec 2021 15:24:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235570AbhLUOYW (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 21 Dec 2021 09:24:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235558AbhLUOYV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Dec 2021 09:24:21 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A662C061746
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Dec 2021 06:24:21 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id u22so21674994lju.7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Dec 2021 06:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BJPodIdKd7uox4+aV0LM87Y6jk1nhwyZFgSOdrH/QvQ=;
        b=W82MlYQc11vHWblLScCzUogC46lln3s5pTZiQYa/C1N/WNEg56ZOWyQuUNyWRqcaG4
         LS98n1Uz1TO8YINmodadLCMRNekcRtacrnAad/kFe/f4I3GFlI+WJKAdbHWLKmP5x+HE
         +H2yHyyYHf300239x38IpMOOPgulaKqxWvnyh0CmqYQOqtcOsO+c9Nh6+3JhGQMvwyza
         +pkS3fNrJIJ72S+IDvKux7iyC64D6v9gH5atZ7dunnpMzb8Ygx+JpKnQybe7ub9kuXow
         BV9y9GQjqdn5JFV9Mhcq8SmQZXT0fm5QL5FiksEjFjwGQGCaVLYumOOcYdhzeSzd63Z8
         ELpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BJPodIdKd7uox4+aV0LM87Y6jk1nhwyZFgSOdrH/QvQ=;
        b=397EE1V5dY5i6b/xNoMOZictlTam3jmOZ0WHVC8doW6Ex6kKY/mLykcSmfjQc76XF6
         8Q2cnsdzgODFRlmD5mJlzWqqBM6II+9/IiXScwSNxPZkxa2tCUfk1keMeMmawhqms1eX
         fIn3kYz2TFjndjxZ/4S/qSNhwAB2BkH2gKrKc62ERrqv9ocx0ENpAyPMETIhNBg7k0O4
         FctoHinyfrcHmGz01hvx0lTHMobPgJJ7VXin0fgVrg4jQIgP8b/OR24OqrMBs1PEefPB
         ugF9gok3FK96aJrk/x6mAPY2xMVyLZCbhoc70ipWo/+6x2rhgkQ3bm1aR9YdklPfkpos
         sp5g==
X-Gm-Message-State: AOAM5330+y1jkaVId4CZGYzyq7kccD43ERViGKvdPy3eRf/xA71UhXQF
        PNXcjRaGtc84HaB+r3ZZuO4c0Q==
X-Google-Smtp-Source: ABdhPJzyddF2Ob5V4adQbTfyjPnTlOAKpz4sJtvc3fBsDR10SykWV4FlwkNN0pPYg+i4bgR9lwwRHQ==
X-Received: by 2002:a2e:a361:: with SMTP id i1mr2707302ljn.32.1640096659263;
        Tue, 21 Dec 2021 06:24:19 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id e13sm1368933lfs.306.2021.12.21.06.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 06:24:18 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Hao Fang <fanghao11@huawei.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v5 0/2] arm64: dts: exynos: Add E850-96 board support
Date:   Tue, 21 Dec 2021 16:24:15 +0200
Message-Id: <20211221142417.19312-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

WinLink's E850-96 is a dev board based on Exynos850 SoC [1]. The board's
design follows 96boards specifications, hence it's compatible with
96boards mezzanines [2].

This patch series adds the initial support for E850-96 board and
Exynos850 SoC. Only basic platform components are enabled at the moment
(like serial, I2C, eMMC, RTC, WDT, clock driver, etc). Right now with
this patch series it's possible to run the kernel with BusyBox rootfs as
a RAM disk. More features are coming soon.

[1] https://www.samsung.com/semiconductor/minisite/exynos/products/mobileprocessor/exynos-850/
[2] https://www.96boards.org/products/mezzanine/

Changes in v5:
  - Excluded applied patches from the series
  - Defined clock binding constants in SoC DTSI file to workaround the
    missing patches in Krzysztof's tree

Changes in v4:
  - Removed slew_rate pin nodes
  - Moved rtcclk clock to board dts file

Changes in v3:
  - Ordered the pinctrl_alive phandle alphabetically (patch 7/7)
  - No other changes in v3

Changes in v2:
  - Rebased on krzk/linux.git (for-next), to account for Exynos7885
    changes
  - Added missing and new tags (R-b and Ack)
  - Addressed all comments for v1

Sam Protsenko (2):
  arm64: dts: exynos: Add initial Exynos850 SoC support
  arm64: dts: exynos: Add initial E850-96 board support

 arch/arm64/boot/dts/exynos/Makefile           |   1 +
 .../boot/dts/exynos/exynos850-e850-96.dts     | 195 +++++
 .../boot/dts/exynos/exynos850-pinctrl.dtsi    | 643 +++++++++++++++
 arch/arm64/boot/dts/exynos/exynos850.dtsi     | 759 ++++++++++++++++++
 4 files changed, 1598 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850.dtsi

-- 
2.30.2

