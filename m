Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA8F24584EC
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 21 Nov 2021 17:56:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230330AbhKUQ74 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 21 Nov 2021 11:59:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237971AbhKUQ74 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 21 Nov 2021 11:59:56 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 285AAC061748
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Nov 2021 08:56:51 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id u3so69093298lfl.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Nov 2021 08:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7osbeXL+1CyqsigAAd8jmW1+rCcPt1AGKsERDXyK0YI=;
        b=WUPLA7RjKT3xPKZygE2w3taTSB5twgC2eq9PDKRSfa1PPRPzL8+MkrBce6yGyEQAF3
         mch1OD1BCukVhN6aLSfIVkkcG0gMVKtrHW1pG6CDGBi6xuiUvY10g5mkWODWvIxjtDT/
         CqWkbj/89y2AA5AqjgVj1mgOKlVbu06qKpMHEATr0ktsCsf7EYNtlAReE76UNjnUF+0V
         g5sZTk9B5EisOc+ijKVqOct9b8Z8atujfDodfxJ4G3YyvUiLbcIaH5EPLFLw/soSbG9U
         VPkHAdl8YpHZg/PfDSsksahOIPDbJEJpSv4JTwE8r9wF3tU5HMIC0bfe0A7CZ+cc87qR
         2wcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7osbeXL+1CyqsigAAd8jmW1+rCcPt1AGKsERDXyK0YI=;
        b=NhtE5dNfhhNLah78RkJyceVhSb46ly0LAJQa8o67zDr4VPWzoFUGXSOaN6LEH/j/ZX
         XZ9WCdR+dB+N1YhoRFs31BkLUusriu0n4N70i7ZOhzVHzsq2sF82kC1iDbhbdtKVehZH
         0w9VO95WizuhpNG0QtZd6266s0XfzyY2w8asVQwjFr8dygTvZqvISVtG9PUi+p8N9KKX
         eviJJsx8VSYYw6hZVJwU0PJhO2xRUbeaqGLq6tYhZXeb7vCLtY7LNFv49UuJyrPmkEhg
         1cwrvWVRqMafwOERs4/AOKwk/jSYMb0YxSC3aeoFx8dnAI3VdZXjZTRgaCeLE7NVAAGx
         wDjA==
X-Gm-Message-State: AOAM533Fw5vJpRX8weqxotR3Tac6y6bbuhCAoq+tsfszK7BtgkvYv5ab
        r6Tg9atWFJ5KvDV/exJXZxmdPg==
X-Google-Smtp-Source: ABdhPJzKRvqwD4Q6Xp7gSwZpW/mjFpjkrELigO8PKAoLdpnI45QpaFepdc7bJOl5p9prPFM6xBC0eA==
X-Received: by 2002:a2e:a593:: with SMTP id m19mr46616034ljp.407.1637513809310;
        Sun, 21 Nov 2021 08:56:49 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id g30sm614429lja.22.2021.11.21.08.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 08:56:48 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v4 00/12] watchdog: s3c2410: Add Exynos850 support
Date:   Sun, 21 Nov 2021 18:56:35 +0200
Message-Id: <20211121165647.26706-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Exynos850 WDT IP-core differs a bit from existing platforms:
  - Another set of PMU registers
  - Separate WDT instance for each CPU cluster, having different PMU
    registers/bits
  - Source clock is different from PCLK

Implement all missing features above and enable Exynos850 WDT support.
While at it, do a bit of cleaning up.

Changes in v4:
  - Fixed build error when CONFIG_OF is disabled (found by 0-day)
  - Added R-b tag by Guenter Roeck to all patches

Changes in v3:
  - Renamed "samsung,index" property to more descriptive
    "samsung,cluster-index"
  - bindings: Disabled "samsung,cluster-index" property for SoCs other
    than Exynos850
  - Added quirks documentation
  - Removed has_src_clk field: clk framework can handle NULL clk; added
    s3c2410wdt_get_freq() function instead, to figure out which clock to
    use for getting the rate
  - Used pre-defined and completely set driver data for cluster0 and
    cluster1
  - Coding style changes
  - Added R-b tags

Changes in v2:
  - Added patch to fail probe if no valid timeout was found, as
    suggested by Guenter Roeck (03/12)
  - Extracted code for separating disable/mask functions into separate
    patch (06/12)
  - Added patch for inverting mask register value (07/12)
  - Extracted PMU cleanup code to separate patch, to ease the review and
    porting (09/12)
  - Added patch for removing not needed 'err' label in probe function
    (11/12)
  - Addressed all outstanding review comments on mailing list

Sam Protsenko (12):
  dt-bindings: watchdog: Require samsung,syscon-phandle for Exynos7
  dt-bindings: watchdog: Document Exynos850 watchdog bindings
  watchdog: s3c2410: Fail probe if can't find valid timeout
  watchdog: s3c2410: Let kernel kick watchdog
  watchdog: s3c2410: Make reset disable register optional
  watchdog: s3c2410: Extract disable and mask code into separate
    functions
  watchdog: s3c2410: Implement a way to invert mask reg value
  watchdog: s3c2410: Add support for WDT counter enable register
  watchdog: s3c2410: Cleanup PMU related code
  watchdog: s3c2410: Support separate source clock
  watchdog: s3c2410: Remove superfluous err label
  watchdog: s3c2410: Add Exynos850 support

 .../bindings/watchdog/samsung-wdt.yaml        |  48 ++-
 drivers/watchdog/s3c2410_wdt.c                | 324 +++++++++++++-----
 2 files changed, 289 insertions(+), 83 deletions(-)

-- 
2.30.2

