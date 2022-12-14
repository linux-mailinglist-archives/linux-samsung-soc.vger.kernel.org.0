Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19CFE64C9A0
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 14 Dec 2022 14:02:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238447AbiLNNCu (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 14 Dec 2022 08:02:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238470AbiLNNCO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 14 Dec 2022 08:02:14 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0E7410AC
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Dec 2022 05:01:38 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id m4so3258534pls.4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Dec 2022 05:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8dC2Gsn7/DPw+06SvyPKXiLZl5J5e+MnQLJWr0R5lg=;
        b=C/CoxKrwgllUTgPoZwwqsWxbBjhZtbqeoP5H6TRO0VLQcRnrnz27cgh1gckODs6c4Y
         hjo/OgwrORxVMs+lneUR07jTMMyD06UxUsWzui1Dl2cz5AHMf2wezgZHAW9itVOKpJVE
         UfRhJmsZdywxBj0qj2Utiv0IGovp5fHumb29c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l8dC2Gsn7/DPw+06SvyPKXiLZl5J5e+MnQLJWr0R5lg=;
        b=bXw6WEcs4BLZaopeHrghA37o6YOeyJEy3CZvkh70KZcEBExBA46hDHisaPl1vD7B+3
         oF+UB3oGsmUpEYeHNOK61G2qfvQYaS4F6njWt+9zUgSHFb0/QYWCPyFCZrV4nu8v62bE
         3A1YQ7VWwP1HYtGv/j9v9cDWrEIgKNIaFRR6MHPpsnpo9Utay61a8FeC0w56ZHwT4Sua
         EULvOdeuPsOU8oVdxgEik8GNztga3qspQcnO9IuTXkZi44d1vF7+4LfaldgN49iWpWrE
         kek3Rrxdz33BqC7lEi0olrYFrarwoaeSJQJ6/WZPBvurVLPTKBi53YRODX2Wp3P7h/n5
         3Mpg==
X-Gm-Message-State: ANoB5pm/jK13ewMCMpxvpzTZJnhIRQte8eeAUUFRudiSylwuGoZGmI/d
        IZPtclfAltaX8AT2zQI00r50aw==
X-Google-Smtp-Source: AA0mqf6ckNSerlrEGekXR/9I5wplg+qXi2frZincM6Z8lCDtlsNIlHj2C/nPOVwF6cGNeV60yfii6Q==
X-Received: by 2002:a17:903:2412:b0:188:82fc:e277 with SMTP id e18-20020a170903241200b0018882fce277mr24851098plo.12.1671022898068;
        Wed, 14 Dec 2022 05:01:38 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:5e03:faf:846e:352d])
        by smtp.gmail.com with ESMTPSA id ix17-20020a170902f81100b001895f7c8a71sm1838651plb.97.2022.12.14.05.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 05:01:37 -0800 (PST)
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
        Jagan Teki <jagan@amarulasolutions.com>,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v10 17/18] dt-bindings: display: exynos: dsim: Add NXP i.MX8M Plus support
Date:   Wed, 14 Dec 2022 18:29:06 +0530
Message-Id: <20221214125907.376148-18-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221214125907.376148-1-jagan@amarulasolutions.com>
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
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

Cc: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v10, v9:
- none

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

