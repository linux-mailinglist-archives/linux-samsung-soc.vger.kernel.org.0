Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBDFC675947
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 20 Jan 2023 16:55:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231663AbjATPy5 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 20 Jan 2023 10:54:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231638AbjATPyj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Jan 2023 10:54:39 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7973B5E511
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 07:54:28 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so6154423wmb.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 07:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EQJmlP0ahwhCy64nPp0f4kxP53tZ/X2Yzc+wIK+4yII=;
        b=xJEAZC6zlx+KwoAgbRUrd6wC8Z+xMWPQ/cjEV/s7q0OZa18GQC8b4uqmQwk6+x1k28
         yLpDOVrsxt4FBP0g3XhheOlOSsCzEixck84v6F/5WTzCfrdoPUrfQWxqgM7iC6opeF6N
         j1oqf2Hzow9Kw0saP59ws39+NCbVPlCxfucQDoyVAG7yVoAchmK/7Hskd0YfQCEGyk8x
         +542TcO2ivk+zNbab1z6p8hglEl98/3Rwp/35s/I3nyxp/9JOT/71z9SIlRfbSDnqBXY
         lNuQJKwYsx0Skh1Q6XRE5H07m84V19mTA3cjLo1Qrv/odT21lJq4ZtTaVO2sSce1TV0c
         h3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EQJmlP0ahwhCy64nPp0f4kxP53tZ/X2Yzc+wIK+4yII=;
        b=bBpBdpEh6voBa0sE6jcn4mzqfMYNeQHtM3tSGLRMg7ioJECxIAyjzmeuCrUor1tum/
         MjW7a6GvX+kOaxfy7WKIffMEyLpxygXpizlOPQHX0tTkJWfg7hSwGlW6KpFxH2xv1AKo
         Aa59JGwFEOEl3XYx94EPAYZbVTEGv584LyMrCXJ2sYEPPveMSYjXWhzGQgkT7Nx6aYoD
         bTgGFnFQs1aOoEVw0aiBvNM9re1un8etBQ+V+RFj5OXip6ot/ERPixRAjvlrr8XdYxEF
         Yi2wl2n9qWPAPBPWH2zPRF2myMEjk91gqj/OfMqDo8PRgoRg+FCl+BiDBmXe+wbd80Xd
         WuzQ==
X-Gm-Message-State: AFqh2kpDdlcUrzE9JS+KbxjtG9IEeO0hfDJ9/wOXbgl7Eei9jU20FGa+
        RmsRnJDdAmNTEdBRrKObsntWIA==
X-Google-Smtp-Source: AMrXdXv+1xCnGZdqR61XFQ54dLuSwc59oBvmfaV7eF7lDZj6FpAid213KGUX2amnLnSCslLlf5t4Pg==
X-Received: by 2002:a05:600c:4b0f:b0:3d6:2952:679b with SMTP id i15-20020a05600c4b0f00b003d62952679bmr14509508wmp.34.1674230068008;
        Fri, 20 Jan 2023 07:54:28 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n42-20020a05600c3baa00b003d96efd09b7sm3349596wms.19.2023.01.20.07.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 07:54:27 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     replicant@osuosl.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
        Henrik Grimler <henrik@grimler.se>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 10/11] ARM: dts: exynos: correct HS200 property in Exynos5260
Date:   Fri, 20 Jan 2023 16:54:03 +0100
Message-Id: <20230120155404.323386-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230120155404.323386-1-krzysztof.kozlowski@linaro.org>
References: <20230120155404.323386-1-krzysztof.kozlowski@linaro.org>
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

There is no supports-hs200-mode property for MMC nodes, so assume
intention was mmc-hs200-1_8v:

  exynos5260-xyref5260.dtb: mmc@12140000: Unevaluated properties are not allowed ('supports-hs200-mode' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos5260-xyref5260.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5260-xyref5260.dts b/arch/arm/boot/dts/exynos5260-xyref5260.dts
index 3c3b751d4360..387b8494f18f 100644
--- a/arch/arm/boot/dts/exynos5260-xyref5260.dts
+++ b/arch/arm/boot/dts/exynos5260-xyref5260.dts
@@ -87,7 +87,7 @@ &mmc_0 {
 	status = "okay";
 	broken-cd;
 	cap-mmc-highspeed;
-	supports-hs200-mode; /* 200 MHz */
+	mmc-hs200-1_8v;
 	card-detect-delay = <200>;
 	samsung,dw-mshc-ciu-div = <3>;
 	samsung,dw-mshc-sdr-timing = <0 4>;
-- 
2.34.1

