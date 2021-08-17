Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69DDB3EE703
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 17 Aug 2021 09:11:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238112AbhHQHLc (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 17 Aug 2021 03:11:32 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:35810
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233996AbhHQHLc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 17 Aug 2021 03:11:32 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id AA38F3F339
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Aug 2021 07:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629184258;
        bh=WHeeah62hjlFErzdEXoq5NwxsOhOjcjZ4nIVDJHy4hc=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=ffY3L2eRSkqMSe137qONQFBkjCmNmfsgh3AV35cxUy0qWTVO6PdwvP9IDhjhM+rK4
         fLjSeKpoQrzjJwlHNbXUJPv9ZBL26Cy4YJebTxT7ysxUOOaWruvvEeXFNrGPmjhppF
         mDB1RR+yi+0ZbLYT85DgyJSkGXQmZUWbrjl6/Q3maSzGH1ULnZYi9PyAFN0ERHhGqA
         Pb1WTSCqdgKZJa6lBPPLf4ZgerAFxFkmTTWpDhaMSFGdf20GH8TkKofClSapn1dmNO
         /xtkJyfaNLa1SU8YqeXkpb9TIukmCcfWsTskLZyrZ1+9WlU9ht1grXgKqIzlpMXzEJ
         o6U4+BDjQFVog==
Received: by mail-ed1-f69.google.com with SMTP id k13-20020aa7c04d000000b003bf04c03fc4so1634048edo.22
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Aug 2021 00:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WHeeah62hjlFErzdEXoq5NwxsOhOjcjZ4nIVDJHy4hc=;
        b=CIjEY2h+33bMCavAxTTRk2Dy3LFQc3y/EH2NgT7KqBMHXEMUIFpV2ekqm4XfXpMI4a
         8aglE9fkQ6eAbVjiP3WnS5bYZAo+e/n2qWC32qiDZG0y6MR2NENOue+w6/2yO2zN71Ip
         CLnz7DVv9Mz+gsw8g/FaJf/Fr+FO0wfgw2jFwQGgswHlz8CTxo/HiCm6X2zNRJ/iPHsj
         1nfIHf0VuPw4e63jo2LP3XlF/8PkG5mXLwjhCfzyCod2+CSEAC+r5MNqjjACZWS27kTz
         5hb3L29KOZwqfk3e/J6fHkMvKJiCuAxejsoxr7aX8JjxS0gOHPSOcvjiaU5cENhfIfBO
         CedA==
X-Gm-Message-State: AOAM533XNheor7htlH4dMo/TvzwWhiftR3FjzqhI0umm+aVuWiLfrr2A
        G70xnfOK52MEJvSHNKSPi5cSz3I4xctGlhnIrHSjCpfE89yYHIrTqnm63IXkNgHtgxKHE8tn8Wo
        H0xHcvptvFFsGYw5lFRuDIHa5sXFneiJ5/t8yz5tPZOB+i+ZS
X-Received: by 2002:a50:a455:: with SMTP id v21mr2450963edb.369.1629184258435;
        Tue, 17 Aug 2021 00:10:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxow0aRHdptwVh6pCglt0KMTvnyI1SrKpUMvXF8rY0OLi5SPGSL/hpUBq/nJ+FQyycIBPD5Vg==
X-Received: by 2002:a50:a455:: with SMTP id v21mr2450939edb.369.1629184258229;
        Tue, 17 Aug 2021 00:10:58 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id p23sm570535edt.71.2021.08.17.00.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 00:10:57 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] pinctrl: samsung: pull for v5.15
Date:   Tue, 17 Aug 2021 09:09:13 +0200
Message-Id: <20210817070913.6387-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Linus,

Just few commits for v5.15.

Best regards,
Krzysztof


The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-5.15

for you to fetch changes up to cdd3d945dcec0d0dab845175dc9400ab54512aa6:

  pinctrl: samsung: Add Exynos850 SoC specific data (2021-08-13 09:39:42 +0200)

----------------------------------------------------------------
Samsung pinctrl drivers changes for v5.15

1. Fix number of pins in one GPIO pin bank.
2. Add support for Exynos850 SoC (Exynos3830).

----------------------------------------------------------------
Jaehyoung Choi (1):
      pinctrl: samsung: Fix pinctrl bank pin count

Sam Protsenko (2):
      dt-bindings: pinctrl: samsung: Add Exynos850 doc
      pinctrl: samsung: Add Exynos850 SoC specific data

 .../bindings/pinctrl/samsung-pinctrl.txt           |   1 +
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     | 116 +++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos.h           |  29 ++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   4 +-
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   1 +
 5 files changed, 150 insertions(+), 1 deletion(-)
