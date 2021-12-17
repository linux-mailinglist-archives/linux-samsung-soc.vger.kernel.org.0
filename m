Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 876E647820C
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 17 Dec 2021 02:30:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231778AbhLQBaJ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 16 Dec 2021 20:30:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231771AbhLQBaJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 20:30:09 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4FEDC06173E
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Dec 2021 17:30:08 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id bn20so876096ljb.8
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Dec 2021 17:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ugQenULSknE3I1itQCSZf3NnOOSTayqXrmSZAjd+2lM=;
        b=YJu1YwewKoo4mxIhVEaVuSXJtNF6GzbJRmGg8kwO1pYmsvPg2bI2xPJAUwU+IOvwTP
         6w5FCk8758irUEWJllrPS6+M2WVBmi8CrWSe3qI58E34m/fKJlnHz5QU2sLOdFHXqtah
         8vj7L5Fg8jmMHZ6VegiXRNFwstnkBw0TrYgDz9EZnkOFNKBezLdBQtl/vxwaIDyDB20H
         /pOeRV+IpviHrsK3xAOEVRLblJzsP2HncOzXUW8EP75dVqJDHdqgrN9VpSt7TzITifRM
         1Fr8cMH/c2sKeAaRAR3N58R3/dx3IFSuFNmhpg5bE6vLKmx31n9+Xhm8355wx5BsnC+C
         zh4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ugQenULSknE3I1itQCSZf3NnOOSTayqXrmSZAjd+2lM=;
        b=izEa4OBdWeqWeCRYOP7AEeSlv7Uz5M8BPg7XIk0zxQFS/bGAnOqsb0oLd4WgTwltq9
         tK1pTOuuhpUL2bmd4Q6yiNbA2gBbcOWPQx5WZhUTkGdz/SbbaCMhj08otTyD8oCAnddK
         4ATs7oerXZq0y/ibssU36sgTx6ZrIinsfL451m0WJceExk5mxR7PonxfvE0vfnwn1jmI
         8YNPy3YkTxmbHMGEj3Q9NuRoygG0lEOlqZaB6qx3WlTxWw7IOWE6sfM+roi+MZ5T1mfb
         DbEtmXT5KsehQElJUdyu3oDtyyvyeVDT/68B/Mv4n02jhAJWRc0OcVPqv2W3Qo+La4QT
         zanQ==
X-Gm-Message-State: AOAM532xv2CF6PZuWgDNqa1MtNGRC3OsPHkFGqci8oq9ROqhH2EL0XeL
        UpzH0sgdGQ6xZ82rVZnI8Cmrtg==
X-Google-Smtp-Source: ABdhPJzAthwZi8eNhhSb8f5t3uDYry1NmtxVvyfS1RspHZO4E4pl8uJoG28LZ1K+8XJ6Bk7SYYqqMQ==
X-Received: by 2002:a2e:3c0c:: with SMTP id j12mr691142lja.402.1639704606871;
        Thu, 16 Dec 2021 17:30:06 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id y36sm280788lfa.75.2021.12.16.17.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 17:30:06 -0800 (PST)
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
Subject: [PATCH v2 0/7] arm64: dts: exynos: Add E850-96 board support
Date:   Fri, 17 Dec 2021 03:29:58 +0200
Message-Id: <20211217013005.16646-1-semen.protsenko@linaro.org>
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
Exynos850 SoC, along with corresponding bindings. Only basic platform
components are enabled at the moment (like serial, I2C, eMMC, RTC, WDT,
clock driver, etc). Right now with this patch series it's possible to
run the kernel with BusyBox rootfs as a RAM disk. More features are
coming soon.

[1] https://www.samsung.com/semiconductor/minisite/exynos/products/mobileprocessor/exynos-850/
[2] https://www.96boards.org/products/mezzanine/

Changes in v2:
  - Rebased on krzk/linux.git (for-next), to account for Exynos7885
    changes
  - Added missing and new tags (R-b and Ack)
  - Addressed all comments for v1

Sam Protsenko (7):
  dt-bindings: clock: exynos850: Add bindings for Exynos850 sysreg
    clocks
  clk: samsung: exynos850: Add missing sysreg clocks
  dt-bindings: Add vendor prefix for WinLink
  dt-bindings: arm: samsung: Document E850-96 board binding
  dt-bindings: pinctrl: samsung: Add pin drive definitions for Exynos850
  arm64: dts: exynos: Add initial Exynos850 SoC support
  arm64: dts: exynos: Add initial E850-96 board support

 .../bindings/arm/samsung/samsung-boards.yaml  |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/exynos/Makefile           |   1 +
 .../boot/dts/exynos/exynos850-e850-96.dts     | 175 ++++
 .../boot/dts/exynos/exynos850-pinctrl.dtsi    | 713 +++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos850.dtsi     | 753 ++++++++++++++++++
 drivers/clk/samsung/clk-exynos850.c           |  29 +
 include/dt-bindings/clock/exynos850.h         |  12 +-
 include/dt-bindings/pinctrl/samsung.h         |  13 +-
 9 files changed, 1700 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850.dtsi

-- 
2.30.2

