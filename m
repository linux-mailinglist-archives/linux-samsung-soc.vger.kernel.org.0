Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F027F4A7450
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  2 Feb 2022 16:13:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345395AbiBBPNe (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 2 Feb 2022 10:13:34 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:51514
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1345347AbiBBPNb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Feb 2022 10:13:31 -0500
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 52EA8402F6
        for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Feb 2022 15:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643814810;
        bh=nSYzIJyZPz2XWQqi86zTvNcY5aJPlKdbCVEXTZ9ouQg=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=Q6/Zi8v38A5nGqqs8tLqcUMTTX6K4k5BhYBU1pHfbHk/T3pdlGhVZnhNaFAJjYmYQ
         +86Z2HmbU4P9nSHQmAv1DHMQRleNDYpBNFsQErxziTJmZc8itaVnfXPe7vOPP9dPlA
         C6jNAarr8HOYDmoE0IwWI+45kuiBRhPfbD3niPDzQZSoPs1TAuXoQO8XPhBzQ+Uywi
         R/XugEcE7FUZfC3UmV0X1jrApCaRtf1ZQQoZ5L36oi2kAaBNP8cE0a706vwfofJORf
         d23MXD2VlxK6cKHm/VPLw1hjm2bTLzFB0OGL/9FnnSKIy/OmfYdzs1zGdPZ187o++j
         XuqF0oBF97c/Q==
Received: by mail-wm1-f71.google.com with SMTP id n7-20020a1c7207000000b0034ec3d8ce0aso2611273wmc.8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Feb 2022 07:13:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nSYzIJyZPz2XWQqi86zTvNcY5aJPlKdbCVEXTZ9ouQg=;
        b=DziBXxSU5NeZOVFZj3cm5Pmn2w7A2HkPwoxyCn6wLcEppOoKu2zYXI1LcnaU801EkI
         9w2mtQbZAOVkojDJ1H0+sKT635JTGoM2c+hFRGYFb/O9UxS2ntOxZKAubaYrlma7M5fH
         Iko3X77ziyhqhSSm11Z8GljGhH3LaPV4YWUICFbSjki1uPRSN9QXifiCwUfyLknM1E/g
         onq55bbWI97Y6ciyN0ytPMn9WwC6KqtfYiYkC4xPrvIfs5G8wjMVjPjHgwt/f4C+vB3h
         mBHFNmE5+kh2d+RslZfwdAaBr41PyIuLKICCXkIQ9eLdjYO8dOGgoWQTef3tCVvM8bn9
         KBXw==
X-Gm-Message-State: AOAM533FqaMFs4v6HAG+u8Suy1IzzVXo2w992icDyBW9IOGqXPsyJEXG
        gvaQXShBuhMrIY6CNnpiiyvooCmTRWUZgXVfVRsxbILNILgKFTZ+b2+KL/aGa8fU8ojmwm+zapv
        Oixj7qqIc0tK53oirQd5YXYGsRLgmatsQUJSO2cnl2JRFNmAQ
X-Received: by 2002:a05:6000:178b:: with SMTP id e11mr25081190wrg.69.1643814809921;
        Wed, 02 Feb 2022 07:13:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTzqdewy2j5IuYcrsXFVmbNlFRf9Nk9fBxctV3KCf8V1DiAcSfc4A5lOmWKc6NeRLaHh1/Vg==
X-Received: by 2002:a05:6000:178b:: with SMTP id e11mr25081162wrg.69.1643814809637;
        Wed, 02 Feb 2022 07:13:29 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id p7sm5098872wmq.20.2022.02.02.07.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 07:13:29 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/3] dt-bindings: serial: samsung_uart: Document Exynos5433 compatible
Date:   Wed,  2 Feb 2022 16:13:08 +0100
Message-Id: <20220202151310.285561-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220202151310.285561-1-krzysztof.kozlowski@canonical.com>
References: <20220202151310.285561-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Document the Exynos5433 UART compatible, supported since commit
31ec77aca72e ("serial: samsung: Add the support for Exynos5433 SoC").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/serial/samsung_uart.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index 2940afb874b3..6aceba4a5f79 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -26,6 +26,7 @@ properties:
           - samsung,s3c6400-uart
           - samsung,s5pv210-uart
           - samsung,exynos4210-uart
+          - samsung,exynos5433-uart
           - samsung,exynos850-uart
 
   reg:
@@ -111,6 +112,7 @@ allOf:
             enum:
               - apple,s5l-uart
               - samsung,exynos4210-uart
+              - samsung,exynos5433-uart
     then:
       properties:
         clocks:
-- 
2.32.0

