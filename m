Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D8AA4BD83F
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 21 Feb 2022 09:41:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346546AbiBUHw4 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 21 Feb 2022 02:52:56 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346545AbiBUHwy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 21 Feb 2022 02:52:54 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D173FFF0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Feb 2022 23:52:30 -0800 (PST)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E894D3F33A
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Feb 2022 07:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645429942;
        bh=qQajbByHop08s8930aDCC1zsrDrtbnT1Cr9gDc0vug0=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=s18TSVRN7el65S2li0opLGLsRLGT8rpEj4SdVsd83TgI5LNEpsqjmY99eXp7Ebd8N
         yPl9s/xCLrDEH8zeTaWxBKjXJ/2ihuvjuUMnVwN9DSZ4Aau92OlCcveJLDKimig/32
         HkqYDA/z4aFzVZivmM7EFoYzc9ct5pEGMc8k2Ip/H6tB0p8ewv/3d14s0IrxYqcDWz
         quzND3pCa+Sgs5DIhmZyj+L7nGyEV0B22zS/XBx28Q+gQufdxJSuJDUwsSn32oIxra
         WIrcjg7pJnTPvE2rRJd7I9yY1k/96za/DCifEIOHOom6lHLmC6vS2iZXdZLieGoTJW
         rh1+hgTW4P5qQ==
Received: by mail-wm1-f70.google.com with SMTP id v130-20020a1cac88000000b0037e3d70e7e1so4922179wme.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Feb 2022 23:52:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qQajbByHop08s8930aDCC1zsrDrtbnT1Cr9gDc0vug0=;
        b=C+7yLQyks5FkGPpwCBajS83TSiVUB4JbL/NX1yQjNDXVb2vv36ttE1cs8UJ0Cs8U9h
         lLD2jgGEUHrhjOTZiaiD1PeNAHdPILshNwzwHewN2/yKF8Jy/t60JNCW8ygxIOJV6Hhc
         xqHEsKRhN4DcYEZgjkzcVSe/rA6ZsIS/EnkRlutnBTMucR64mVms8x4hQyWMP1GMwqrn
         BlpI95jD2SkODQkSPBuhEvQneMaZRfK4vZlnJ/D0vmpqVAM1SGENDE/xoHvf8QGTl9C4
         IopECksY0gLCDHxiWsxTsd67A9+zhLapZAJl2xd1lbt3JXlGw27rlh7/I1KYkivtsiM8
         M4TQ==
X-Gm-Message-State: AOAM531rFuowxiijrvE0+w3RrZ/Bfu5D5GgJBnivNu589B9zrfayjn7n
        54KdAgFAVyXYT+7qSSLSpUbMvWgOZYqq5KWvUjnxYv72cJiVK/wKEswPHp3rmay9WUUptVhkCm6
        Wpt4EFS3+BoWdvQpO1YY+jVxaXHYrgxVIgi6zO7mHHzdXWZ1+
X-Received: by 2002:adf:f703:0:b0:1e3:19a4:7cdb with SMTP id r3-20020adff703000000b001e319a47cdbmr14521711wrp.567.1645429942639;
        Sun, 20 Feb 2022 23:52:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw49YqbTrZLwpBmGC1r7GcSSh5edmOHxq/yeGteRcrUzTPpqza5LH5U//QFyG+kIxWwHgEkrA==
X-Received: by 2002:adf:f703:0:b0:1e3:19a4:7cdb with SMTP id r3-20020adff703000000b001e319a47cdbmr14521696wrp.567.1645429942473;
        Sun, 20 Feb 2022 23:52:22 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id r10sm9382566wrv.28.2022.02.20.23.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 23:52:22 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: exynos: move aliases to board in Exynos850
Date:   Mon, 21 Feb 2022 08:52:19 +0100
Message-Id: <20220221075219.10827-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The aliases for typical blocks which are disabled by default in DTSI
(like I2C, UART and MMC) should be defined in the board DTS.  The board
should add aliases only for enabled blocks according to its specific
order.

On Exynos850, move aliases of enabled blocks to E850-96 board and remove
unused ones.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

See also:
https://lore.kernel.org/linux-rockchip/CAK8P3a25iYksubCnQb1-e5yj=crEsK37RB9Hn4ZGZMwcVVrG7g@mail.gmail.com/
---
 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts |  5 +++++
 arch/arm64/boot/dts/exynos/exynos850.dtsi        | 16 ----------------
 2 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts b/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
index 7b5a61d22cc5..f52a55f644f7 100644
--- a/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
+++ b/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
@@ -20,6 +20,11 @@ / {
 	model = "WinLink E850-96 board";
 	compatible = "winlink,e850-96", "samsung,exynos850";
 
+	aliases {
+		mmc0 = &mmc_0;
+		serial0 = &serial_0;
+	};
+
 	chosen {
 		stdout-path = &serial_0;
 	};
diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index d1700e96fee2..1c6d8fdf453c 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -29,22 +29,6 @@ aliases {
 		pinctrl3 = &pinctrl_hsi;
 		pinctrl4 = &pinctrl_core;
 		pinctrl5 = &pinctrl_peri;
-		mmc0 = &mmc_0;
-		serial0 = &serial_0;
-		serial1 = &serial_1;
-		serial2 = &serial_2;
-		i2c0 = &i2c_0;
-		i2c1 = &i2c_1;
-		i2c2 = &i2c_2;
-		i2c3 = &i2c_3;
-		i2c4 = &i2c_4;
-		i2c5 = &i2c_5;
-		i2c6 = &i2c_6;
-		i2c7 = &hsi2c_0;
-		i2c8 = &hsi2c_1;
-		i2c9 = &hsi2c_2;
-		i2c10 = &hsi2c_3;
-		i2c11 = &hsi2c_4;
 	};
 
 	arm-pmu {
-- 
2.32.0

