Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 643B34A9C1D
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  4 Feb 2022 16:41:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353177AbiBDPlS (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 4 Feb 2022 10:41:18 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:53578
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237808AbiBDPlR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Feb 2022 10:41:17 -0500
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 10C433F320
        for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Feb 2022 15:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643989277;
        bh=wZglkyjtNPMuirlfKz4+2S7FR+L5T3ePXu8KGwauAX0=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=QNw8I9AabfM74xQi5XbAjF0o9/ehUzQ7MHrhR8ZPRQVj80+G3SGJ+ROY6oP13S6Rf
         uNyRsxnmVFlwR+uHK2mEM/lU1h2dCowgEjRKu2BYlUWYxVIo02SR8NZHo6/AFBYOeo
         DV81BspFnSaDxXpTFKZgMVv5jSpuX2u3w/wJl4qgn/h8Iyfbikp0dJyVzFiczpscDk
         PXWI7ZbeTAd21clhMFy6g7H5rPI9rM9GCF+jWZyitrqeeGKswKvX8Hc0QzDFLXsidR
         iSYawFbdH9NMhOo7WUBztwbw/IGwlPBInJm5mdvGblRXa2Yn16CWE4O4/eSupVY7fG
         7YroRqplXMq3w==
Received: by mail-ej1-f70.google.com with SMTP id ka12-20020a170907990c00b006c41c582397so1241100ejc.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Feb 2022 07:41:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wZglkyjtNPMuirlfKz4+2S7FR+L5T3ePXu8KGwauAX0=;
        b=ZGw8TDlKumvjm97hOnRfTu6SoanPP+Bu62cUdADbqq6CubULi6ldXTkFsrsyg3I/LY
         NXYkgPVTtZdnDgWmuw9g3jJX0rQVNLB5TvDhKERBzFgVt7J2yjR+njU+akwt0fZw3gwi
         TqOMunShC3U8FGMgMNgUs+8+gqATTY1isYUHH7tARr4lyF5k3sEejS1kR+dpvPu91za+
         /0qan11bGrWWJonZd3LhASlGu8c76Vs5pTM+bdFW/ugikQgXa/uHKct+nZvVq2l7Wo+n
         oaJ2HYh/LkmbYFmdUo1M1rsUgMXAIedoMeqKnyUZIV1UiojNu+6L5KEldV+BxtnZn3Wt
         k0ng==
X-Gm-Message-State: AOAM5323Lz5Qi0Y3v+o1aK9xZ9pAALFeqxN7lxoXljvoSg4+io8LZU5B
        sSUELLOEVsj9VMwozetAcH4HOXEHfKefqWsv8t+ZzTJUPy51/OcT5aAQ0Jo+/tUIJe674athD8I
        yvHXiwjj0TQZ6g67i3VXxwSipLPmGHp7B9xPRaZHbQhClpv0Q
X-Received: by 2002:aa7:cb58:: with SMTP id w24mr3572673edt.425.1643989276599;
        Fri, 04 Feb 2022 07:41:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIHtmwRhhbCAkf12pMJG1LNwuiJTM+g7YJu4r1672xFdn7Pt3ou2gK4nQ5FcODLQfJZP6z3g==
X-Received: by 2002:aa7:cb58:: with SMTP id w24mr3572655edt.425.1643989276429;
        Fri, 04 Feb 2022 07:41:16 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id rn16sm770753ejb.61.2022.02.04.07.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 07:41:15 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [GIT PULL 1/2] clk: samsung: Tesla FSD for v5.18
Date:   Fri,  4 Feb 2022 16:41:11 +0100
Message-Id: <20220204154112.133723-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Arnd and Olof,

The driver changes for Tesla FSD clock controller. I got ack for these from
Sylwester.

Best regards,
Krzysztof


The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-fsd-5.18

for you to fetch changes up to 0b59bc00a6936e8670b58d4307a2cfba341d40d0:

  clk: samsung: fix missing Tesla FSD dependency on Exynos (2022-02-01 09:14:53 +0100)

----------------------------------------------------------------
Samsung clock controller changes for v5.18

Add support for Tesla FSD SoC clock controller within Samsung Exynos SoC
clock controller drivers.  The Tesla FSD's clock controller is similar
to Samsung Exynos one, so entire driver structure can be re-used.

----------------------------------------------------------------
Alim Akhtar (9):
      dt-bindings: clock: Add bindings definitions for FSD CMU blocks
      dt-bindings: clock: Document FSD CMU bindings
      clk: samsung: fsd: Add initial clock support
      clk: samsung: fsd: Add cmu_peric block clock information
      clk: samsung: fsd: Add cmu_fsys0 clock information
      clk: samsung: fsd: Add cmu_fsys1 clock information
      clk: samsung: fsd: Add cmu_imem block clock information
      clk: samsung: fsd: Add cmu_mfc block clock information
      clk: samsung: fsd: Add cam_csi block clock information

Krzysztof Kozlowski (1):
      clk: samsung: fix missing Tesla FSD dependency on Exynos

 .../devicetree/bindings/clock/tesla,fsd-clock.yaml |  198 +++
 drivers/clk/samsung/Kconfig                        |    9 +
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-fsd.c                      | 1803 ++++++++++++++++++++
 drivers/clk/samsung/clk-pll.c                      |    1 +
 drivers/clk/samsung/clk-pll.h                      |    1 +
 include/dt-bindings/clock/fsd-clk.h                |  150 ++
 7 files changed, 2163 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/tesla,fsd-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-fsd.c
 create mode 100644 include/dt-bindings/clock/fsd-clk.h
