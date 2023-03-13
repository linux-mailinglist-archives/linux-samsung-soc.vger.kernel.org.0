Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E0AE6B7AD8
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 13 Mar 2023 15:49:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230355AbjCMOtc (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 13 Mar 2023 10:49:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231234AbjCMOt3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Mar 2023 10:49:29 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8933927D4D
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Mar 2023 07:49:26 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id o12so49739797edb.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Mar 2023 07:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678718965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2T7TMVzgpqXlC3zlXj5xP9tL1Bj0GX2d0ToyXWGAhm4=;
        b=JS1Dm6nBvx2iaKXRbUw0D6X88GLSs2hUUjPZwZHoQiNyp40LWP2g5JyTXdd0s5R5Ax
         +TtYDb6d14VRnbXFqbKzJf+3EeYywwfHir1A96mH3bejvQ8GdXLnm0fb6plCz+5tpwA8
         b7s4UtU1akqEYIn79m+1WyOjRlZ2+4JpydxRklyjdtPk5nWVTemEbPPHhPBDAqaYyCnW
         wR1fiu7sq4kcoJswv35k/owSAwxxMlvHBlZz8l5LnopyNt484+Tw5/uYapc43ni7M4Dq
         2vIFh2XpX24jUscI8o5DZEjvE5lfXjjVZavV89Ez7jKc2YNLWZDNBZG4GH0+4UqJWMNC
         hODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678718965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2T7TMVzgpqXlC3zlXj5xP9tL1Bj0GX2d0ToyXWGAhm4=;
        b=jg1FUh7nqy7LnOxpDWLUDD09/oRAA6Bid+A1ma2s9XRhmTuFLEMWESpZA1vVZWmMrd
         OIvilxhXfjRu+qOJjesL0IrtTMig23gGVYEA0uHGbUyNO5EVIv0uwnprNUKriysitzWj
         l+wB1HtEug2nZbO0vRWmhjMiSgR8zrgOAy4mHS8tOu654Qv+hpqf2ZqUYCRk/TBSNVj7
         aV5hGtfueMM3e4FNhbfe3JT/deJhkcglkAXQGJXpOD6rYPay0DFJBYGkiKRYQLfTPB6L
         pYb7how8lTozChuCQNSjpsZyykF7JKAJbG+O1hioULthBCSSbnCPkvk9yPWSP3LyRcKr
         T4oA==
X-Gm-Message-State: AO0yUKUL5uOn8gPy7jWKsPUMaKHWYZoEOF9RdpXboh/zOTf0M7OxupF2
        MRiUBmbOpBIZLS5r8xZ7LBxjLQ==
X-Google-Smtp-Source: AK7set9hTLDM9odgKuufCHWLEa0EP5x9bwITZh0leh+YGwYDj1CxtolXHz9te9ZH35Sukyf3+WV7nw==
X-Received: by 2002:a17:906:9704:b0:927:de85:96a2 with SMTP id k4-20020a170906970400b00927de8596a2mr4134212ejx.38.1678718965103;
        Mon, 13 Mar 2023 07:49:25 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:69db:4882:d071:27c4])
        by smtp.gmail.com with ESMTPSA id ia17-20020a170907a07100b0092153c6b549sm3030164ejc.22.2023.03.13.07.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 07:49:24 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 00/10] media: samsung: dt-bindings conversion and minor fixes
Date:   Mon, 13 Mar 2023 15:49:06 +0100
Message-Id: <20230313144916.511884-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Changes since v3
================
1. Include here also dependency:
   https://lore.kernel.org/all/20230207205834.673163-1-krzysztof.kozlowski@linaro.org/
2. Rebase, add tags.

Changes since v2
================
1. Move size-cells next to address-cells.
2. Drop dead/debug code.
3. Add Rb tags.

Changes since v1
================
1. Collect few independent patches into one patchset.

Best regards,
Krzysztof

Krzysztof Kozlowski (10):
  media: dt-bindings: samsung-fimc: drop simple-bus
  media: samsung: exynos4-is: do not require pinctrl
  media: samsung: exynos4-is: drop simple-bus from compatibles
  media: dt-bindings: i2c: samsung,s5k6a3: convert to dtschema
  media: dt-bindings: i2c: samsung,s5k5baf: convert to dtschema
  media: dt-bindings: samsung,exynos4210-csis: convert to dtschema
  media: dt-bindings: samsung,exynos4212-fimc-lite: convert to dtschema
  media: dt-bindings: samsung,exynos4212-is: convert to dtschema
  media: dt-bindings: samsung,fimc: convert to dtschema
  media: dt-bindings: samsung,s5c73m3: convert to dtschema

 .../bindings/media/exynos-fimc-lite.txt       |  16 -
 .../bindings/media/exynos4-fimc-is.txt        |  50 ----
 .../bindings/media/i2c/samsung,s5k5baf.yaml   | 101 +++++++
 .../bindings/media/i2c/samsung,s5k6a3.yaml    |  98 ++++++
 .../media/samsung,exynos4210-csis.yaml        | 170 +++++++++++
 .../media/samsung,exynos4210-fimc.yaml        | 152 ++++++++++
 .../media/samsung,exynos4212-fimc-is.yaml     | 220 ++++++++++++++
 .../media/samsung,exynos4212-fimc-lite.yaml   |  63 ++++
 .../bindings/media/samsung,fimc.yaml          | 279 ++++++++++++++++++
 .../bindings/media/samsung,s5c73m3.yaml       | 165 +++++++++++
 .../bindings/media/samsung-fimc.txt           | 209 -------------
 .../bindings/media/samsung-mipi-csis.txt      |  81 -----
 .../bindings/media/samsung-s5c73m3.txt        |  97 ------
 .../bindings/media/samsung-s5k5baf.txt        |  58 ----
 .../bindings/media/samsung-s5k6a3.txt         |  33 ---
 MAINTAINERS                                   |   6 +
 .../platform/samsung/exynos4-is/media-dev.c   |  10 +-
 17 files changed, 1260 insertions(+), 548 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/exynos-fimc-lite.txt
 delete mode 100644 Documentation/devicetree/bindings/media/exynos4-fimc-is.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5baf.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k6a3.yaml
 create mode 100644 Documentation/devicetree/bindings/media/samsung,exynos4210-csis.yaml
 create mode 100644 Documentation/devicetree/bindings/media/samsung,exynos4210-fimc.yaml
 create mode 100644 Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-is.yaml
 create mode 100644 Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-lite.yaml
 create mode 100644 Documentation/devicetree/bindings/media/samsung,fimc.yaml
 create mode 100644 Documentation/devicetree/bindings/media/samsung,s5c73m3.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/samsung-fimc.txt
 delete mode 100644 Documentation/devicetree/bindings/media/samsung-mipi-csis.txt
 delete mode 100644 Documentation/devicetree/bindings/media/samsung-s5c73m3.txt
 delete mode 100644 Documentation/devicetree/bindings/media/samsung-s5k5baf.txt
 delete mode 100644 Documentation/devicetree/bindings/media/samsung-s5k6a3.txt

-- 
2.34.1

