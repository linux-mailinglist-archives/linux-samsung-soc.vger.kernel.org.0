Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C7865F1AD4
	for <lists+linux-samsung-soc@lfdr.de>; Sat,  1 Oct 2022 10:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbiJAIKQ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 1 Oct 2022 04:10:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbiJAIKN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 1 Oct 2022 04:10:13 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DEFA53D10
        for <linux-samsung-soc@vger.kernel.org>; Sat,  1 Oct 2022 01:10:11 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id a5-20020a17090aa50500b002008eeb040eso8252987pjq.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 01 Oct 2022 01:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=/wOwPBnm9F+B6EUxE0EwDr5bec7v1ZzaQI0ncINcEEQ=;
        b=Yr+KjrdROxVsREjh1ynA2uo4DlPOxokxTsDToUrFOH2o7Dt17vXjhGsqWwiKK5X2Sh
         L/9HN67ayNzogP9iWvS0oLGQWZgKr27VJr/e1NVphMK/siE+j4pi+5kfpq5jhEK+f4M8
         3dKNSUbd3ilmJ9AbAvEr93KHT3MlN8PSp6Fy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=/wOwPBnm9F+B6EUxE0EwDr5bec7v1ZzaQI0ncINcEEQ=;
        b=6h2Ic1T3mrCsUvxhH1vjHdZ/jJ6mJlcjInl5Vf+f8/vo2jej9gAk9PJfvk5W6M/Qg0
         PtIS2Sc+QRzqVls1yoX3kXcDK9LRtwG/QQCsuAuopC08XSkDUXaqLsFO4W+mtNmClZUW
         x3F/tytwejdrlQTkf0CUz6bhqZReb6yG6UyIq0D75F+24ZiLgYxmUrn1PKSDiUZVHPcl
         xPWepMa//visG+36hjFs/VbtIDhKNwvZnoTBlzeDsun6W5cHGnakiyVBgKObC88ezLd2
         MstzvNaVtxIi/gcjp98QgSi39NRbAdFj3exYDDJbQXCtpcQrAnOSsn67bkRqwKx98aKm
         XS6g==
X-Gm-Message-State: ACrzQf3KgCDsqwqt+Z9kqzJdDTFmltD4OMBcZehOJHlXvQbDju7Zg3HK
        5KlJLC4R6OLReHshkasZNhlzXQ==
X-Google-Smtp-Source: AMsMyM4WWThhOeR7xZ08N6zla/HEqxatjILfotzm2bCjMVN+iyfgHlEjngVKbpobMpMRcufvi+o3ww==
X-Received: by 2002:a17:902:9a49:b0:17a:6662:9334 with SMTP id x9-20020a1709029a4900b0017a66629334mr12368026plv.63.1664611810678;
        Sat, 01 Oct 2022 01:10:10 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:7254:4392:bc7c:c69])
        by smtp.gmail.com with ESMTPSA id c194-20020a624ecb000000b005409c9d2d41sm3167041pfb.62.2022.10.01.01.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Oct 2022 01:10:10 -0700 (PDT)
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
        Rob Herring <robh@kernel.org>
Subject: [PATCH v6 09/10] dt-bindings: display: exynos: dsim: Add NXP i.MX8MM support
Date:   Sat,  1 Oct 2022 13:36:49 +0530
Message-Id: <20221001080650.1007043-10-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221001080650.1007043-1-jagan@amarulasolutions.com>
References: <20221001080650.1007043-1-jagan@amarulasolutions.com>
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

Samsung MIPI DSIM bridge can also be found in i.MX8MM SoC.

Add dt-bingings for it.

v6, v5, v4:
* none

v3:
* collect Rob Acked-by

v2:
* updated comments

v1:
* new patch

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
index be377786e8cd..8efcf4728e0b 100644
--- a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
+++ b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
@@ -7,6 +7,7 @@ Required properties:
 		"samsung,exynos5410-mipi-dsi" /* for Exynos5410/5420/5440 SoCs */
 		"samsung,exynos5422-mipi-dsi" /* for Exynos5422/5800 SoCs */
 		"samsung,exynos5433-mipi-dsi" /* for Exynos5433 SoCs */
+		"fsl,imx8mm-mipi-dsim" /* for i.MX8M Mini SoCs */
   - reg: physical base address and length of the registers set for the device
   - interrupts: should contain DSI interrupt
   - clocks: list of clock specifiers, must contain an entry for each required
-- 
2.25.1

