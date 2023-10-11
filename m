Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C2517C5BCE
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 11 Oct 2023 20:49:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235193AbjJKStm (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 11 Oct 2023 14:49:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233236AbjJKSt0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 11 Oct 2023 14:49:26 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73F3CB6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Oct 2023 11:49:21 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3226cc3e324so140857f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Oct 2023 11:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697050160; x=1697654960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwPgb0Vxa46C21WbpKo3fGsmmsstakxunKdlGSyuz/I=;
        b=DmTTJvaYJ+Q7OFi+LHLfTdgDh2QI8Cm+mXFcsvKzl17BEw+YM2XvSiKYH2mUh6HAUU
         b2wPZx0mdQEvxLdcY/Ri5W9eoDSjgwG6TfobKpqV2xObFGPP/m+p5F1Oafgveuuyzqo1
         VF2qoYJRkPiL6c40jeO8jWvwSLpVgj2gWXYSJSASMdW9tMbNvikNl6luoU/+Dodv0QhS
         nzO5p75Y49EQ5EWkPrP7txpIRf9AeINZV+loVymjOosjZLSnLrZVR2h0OrjESRyAS1QA
         3qR5FJMqUzjleUuS8hKDzJa1EC0PrNxqu0D3lkEBz5tcNBBDEz7d709GwBrlW3UEaoIY
         SoMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697050160; x=1697654960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gwPgb0Vxa46C21WbpKo3fGsmmsstakxunKdlGSyuz/I=;
        b=oOKfhKJWMOCJDPofgHwIM5CgnMigE0nHJ4IQrfD7pPwUi+qt0BvPDyhfyPH3Kw5etg
         t89vtNl4Abk1h2fyA6gIWzlGu6UbA71YGfZVsCqwjGSJXuzcJKrTDN3o5wCZvt5jAz0z
         SNWMkjGHCOQ9MkpSWNAcpeI98A1LWJG/GNigKSNUVGtNV8UaXqTP6mBGxJ/OLXHNBAyF
         eO1tCViJw8YbNe8hoX/kUaVrEGiUinwFWrXqcBFQjXGePSTDynJJ/+VgFMFSNoC2Qaw+
         FeRfUJSMFbY21L04/gx+JW/pSAXtlBwYKULOA0w3C9cq2oaISSdF1MbecpzBaAZoIA62
         MrHg==
X-Gm-Message-State: AOJu0YyrTq8P85H9XBj3Tcl018kGlJhl8QpSiN9ydZDab3BhmAT/1MJL
        mXFS3kCyDPfSiWcM6vWyPUjMAw==
X-Google-Smtp-Source: AGHT+IFxq973Ob/kOR6t1bmL2SP/if638Oo0uwRo3quVfL0DpoW+bXn2/XL7gAGw658ulQS/plNO0g==
X-Received: by 2002:a5d:4a0b:0:b0:31a:b3aa:d19b with SMTP id m11-20020a5d4a0b000000b0031ab3aad19bmr19222081wrq.23.1697050159908;
        Wed, 11 Oct 2023 11:49:19 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id v6-20020adff686000000b0031980294e9fsm16003875wrp.116.2023.10.11.11.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 11:49:19 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: [PATCH v3 06/20] dt-bindings: pinctrl: samsung: add google,gs101-pinctrl compatible
Date:   Wed, 11 Oct 2023 19:48:09 +0100
Message-ID: <20231011184823.443959-7-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
In-Reply-To: <20231011184823.443959-1-peter.griffin@linaro.org>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add the "google,gs101-pinctrl" compatible to the dt-schema bindings
documentation.

Add maxItems of 50 for the interrupts property as gs101 can have
multiple irqs.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../bindings/pinctrl/samsung,pinctrl.yaml     | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 26614621774a..6dc648490668 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -35,6 +35,7 @@ properties:
 
   compatible:
     enum:
+      - google,gs101-pinctrl
       - samsung,s3c2412-pinctrl
       - samsung,s3c2416-pinctrl
       - samsung,s3c2440-pinctrl
@@ -58,7 +59,8 @@ properties:
   interrupts:
     description:
       Required for GPIO banks supporting external GPIO interrupts.
-    maxItems: 1
+    minItems: 1
+    maxItems: 50
 
   power-domains:
     maxItems: 1
@@ -134,6 +136,24 @@ allOf:
           minItems: 1
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101-pinctrl
+    then:
+      properties:
+        interrupts:
+          description:
+            Required for external wakeup interrupts. List all external
+            wakeup interrupts supported by this bank.
+          minItems: 1
+          maxItems: 50
+    else:
+      properties:
+        interrupts:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:
-- 
2.42.0.655.g421f12c284-goog

