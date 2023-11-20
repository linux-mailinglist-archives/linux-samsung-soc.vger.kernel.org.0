Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41F287F1ED7
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 20 Nov 2023 22:21:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232452AbjKTVVg (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 20 Nov 2023 16:21:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232430AbjKTVVY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Nov 2023 16:21:24 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97E6DE7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Nov 2023 13:21:19 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40907b82ab9so13118625e9.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Nov 2023 13:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700515278; x=1701120078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OkMSBNYAvYCAc3X4q8qxASdZhZ6ecouGkRCIVe4XyTs=;
        b=W6CPFW2Fes5ogCaFKqBnyhIyeufYNOxLlE/r/Sdo5gMeWKLEFKz7kM6Fk4zum/xTn8
         ayfk/BvFNWAuXl+WJhX8EZmQUVIDJambUVSAWl968hUK38RKFxoyXfgwDhw4x3HyP0ZS
         MNdwO8q2MarggSY8ZoL1tW/smyZ1yjMKAQnslLqxOJ3eeuM4fz4c/wytQuRFaGtKiEtm
         oGey/silqi7Q/6KgrQhoBenpYVs+DavYy+JYK/3ubCI1evbcAYgCLsN3CgHQCCDpnSvt
         dBx955cuXza97FFxIIFskvbljn190qmskbNFXp9YLS7bRYKt+qlYBPWD+U/gKqRA94WY
         svmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700515278; x=1701120078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OkMSBNYAvYCAc3X4q8qxASdZhZ6ecouGkRCIVe4XyTs=;
        b=HL2u3RDsWhQbuWKhU070SoPjHZAhp08DB5UpQH0cT2cobHULf09fTszmjHdGD8a7RE
         Y9eJdxED9yXCgq3uxEWMtKNLCikktrQ2V1s9BgwMSCXfdTSb/fx3dr6pEofh//1+m2Gk
         TGH7uJ/PXCAJsWFzns918HCxh9ziY+Fs7bd76yLRBNEYp9glMyuLV8I7I8hdINciOkmq
         covdrAdELybx+BEosO1a2zGEqCXOwptjmPYFAuyoKYddrkjRU4X731FWdpXbF5k2Hq1a
         U0vp3LWBaLMC7KBkTCo9BT6bn97nGPQoYQvYCaFDYGlHSp86cmFu0M3JyEixIIQGaTCK
         yYRQ==
X-Gm-Message-State: AOJu0Yxxot6P03QvyFee6On6Yokzv1u+H0tmI5peIQ0TUqeQlATHrgKG
        LUJZG1wX3dM8zoShzvjyf/oxyg==
X-Google-Smtp-Source: AGHT+IEJbzDcW7S5/GI1PbDI0zdEaDb2gaggZv2mN99zjWhskgR9PmElBCBPkOp59Dez6eQSpkYf2g==
X-Received: by 2002:a05:600c:1d1a:b0:402:ea8c:ea57 with SMTP id l26-20020a05600c1d1a00b00402ea8cea57mr602593wms.7.1700515278079;
        Mon, 20 Nov 2023 13:21:18 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id je14-20020a05600c1f8e00b0040596352951sm19518451wmb.5.2023.11.20.13.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:21:17 -0800 (PST)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, cw00.choi@samsung.com,
        alim.akhtar@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: [PATCH v4 08/19] dt-bindings: serial: samsung: Add google-gs101-uart compatible
Date:   Mon, 20 Nov 2023 21:20:26 +0000
Message-ID: <20231120212037.911774-9-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
In-Reply-To: <20231120212037.911774-1-peter.griffin@linaro.org>
References: <20231120212037.911774-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add dedicated google-gs101-uart compatible to the dt-schema for
representing uart of the Google Tensor gs101 SoC.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 Documentation/devicetree/bindings/serial/samsung_uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index e32c1b462836..ccc3626779d9 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -21,6 +21,7 @@ properties:
       - enum:
           - apple,s5l-uart
           - axis,artpec8-uart
+          - google,gs101-uart
           - samsung,s3c6400-uart
           - samsung,s5pv210-uart
           - samsung,exynos4210-uart
-- 
2.43.0.rc1.413.gea7ed67945-goog

