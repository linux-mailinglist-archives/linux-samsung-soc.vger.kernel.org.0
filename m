Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 139576249BD
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 10 Nov 2022 19:41:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbiKJSlu (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 10 Nov 2022 13:41:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230196AbiKJSls (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Nov 2022 13:41:48 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADD4F20F47
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Nov 2022 10:41:47 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id v17so2220041plo.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Nov 2022 10:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYhu5eH5OESD2mHDfRJuY9STQW0S1Diwxqb3V2Z5yqk=;
        b=gSeOlthtbzGMRS1IG7vWP1FNcjB1szzt4s8tQN9iJQkGGsNJ06t75K4GURpRW/AfTy
         CBUjsRJqXQie5Tw9VHhMQMMCPsXulGbnPrt9TzcYVkGmyafWgB0iDbwWrKiYHIddw2o7
         e3z8X6mCPfXMZbcH2NoPr70j8V1H/putThOoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYhu5eH5OESD2mHDfRJuY9STQW0S1Diwxqb3V2Z5yqk=;
        b=snyDkWx6HO4POlV9sGZNLvUV8KkxQbUa0XyN4YMPz3jfKjvE0aCLb95hbUfuKzq8YM
         LmD6wQE0LfHJZDTe7RX2A7XUfhF10zcTzNmFqCbfVLfTfD8yXAdFcL58H9O2XTaG/Lfl
         bMfG6c2gg23R54mVz9l+E36mY3fJRdQwK5GLvUK6VJdLUiiNGTg/yRfhWp09lcbotn2V
         A7ZQbzvNFvLlbMfD9R6hm7ny33Ghc9oPnlG4sDMxPmhuBI4eQ1l+ZG+bHwe8CF4T4a0Z
         VwEao0KMQftBqRzk5ewU2sbr4FQuoR3HwKkFl/kmywVpFb5/4KCGv7T5KJrc4vWmVfSQ
         52vw==
X-Gm-Message-State: ACrzQf1d8mHzCBTiiLAFk81a6bfg/2HisjJ9Tnj4NMoOprntM0C4WT2C
        HzCRSQsQEj3uGkHuvE22uHnLkw==
X-Google-Smtp-Source: AMsMyM4K1aRNzKoQEFPuY8Zefmhwi0ftczc7HS/ufWUcHUOgslxTt+1UIKWa/+wOlb+0Q/WnHT80hA==
X-Received: by 2002:a17:903:2c9:b0:188:537d:78d9 with SMTP id s9-20020a17090302c900b00188537d78d9mr1518714plk.48.1668105707398;
        Thu, 10 Nov 2022 10:41:47 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:b5a4:486a:f07:f67e])
        by smtp.gmail.com with ESMTPSA id c2-20020a170903234200b001869efb722csm11635627plh.215.2022.11.10.10.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 10:41:46 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Fancy Fang <chen.fang@nxp.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Marek Vasut <marex@denx.de>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v8 13/14] dt-bindings: display: exynos: dsim: Add NXP i.MX8M Plus support
Date:   Fri, 11 Nov 2022 00:08:52 +0530
Message-Id: <20221110183853.3678209-14-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110183853.3678209-1-jagan@amarulasolutions.com>
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Samsung MIPI DSIM bridge can also be found in i.MX8M Plus SoC.

Add dt-bingings for it.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
index 5133d4d39190..2a5f0889ec32 100644
--- a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
+++ b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
@@ -8,6 +8,7 @@ Required properties:
 		"samsung,exynos5422-mipi-dsi" /* for Exynos5422/5800 SoCs */
 		"samsung,exynos5433-mipi-dsi" /* for Exynos5433 SoCs */
 		"fsl,imx8mm-mipi-dsim" /* for i.MX8M Mini/Nano SoCs */
+		"fsl,imx8mp-mipi-dsim" /* for i.MX8M Plus SoCs */
   - reg: physical base address and length of the registers set for the device
   - interrupts: should contain DSI interrupt
   - clocks: list of clock specifiers, must contain an entry for each required
-- 
2.25.1

