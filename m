Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 400697C5BF5
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 11 Oct 2023 20:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346860AbjJKStt (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 11 Oct 2023 14:49:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235129AbjJKSt0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 11 Oct 2023 14:49:26 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7171F3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Oct 2023 11:49:22 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-405505b07dfso8641895e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Oct 2023 11:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697050161; x=1697654961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yFhGX2ksyR6bl6kyiCZl+HBvDwsMQ5EUV+jwQV26TQk=;
        b=pdoqzPhoTsaLZAIoVC/MMW+mPkoF+rE0gMX2UH+KInrhmrL8xPUYOs49r7bzn/tYXP
         oAIlGp6NwHaIAX+mJ5ZWnFGYihI7U1Vq0S6+OOopLSdamfKzwM3zS8uL++SIgnrmdb6C
         EtTCULrPZcaa20qTnsEcxA69lyJ9Ga9Ic6tLnNZqUCgHhY/ZzoRuUjkJc/ONQd3v32KD
         2PHdu1gGDNbtqecB1deYej0NXcGKlt0DYgirlzSNTtT7VUwVB5BLUFsoqyeDlwoBO10C
         Qfn8soqyVVT5vOfSUQp0axg3GhjDeE18EgLlmjsz7OuG0+NComQap1awG10hVwCxw3Lx
         B93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697050161; x=1697654961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yFhGX2ksyR6bl6kyiCZl+HBvDwsMQ5EUV+jwQV26TQk=;
        b=HDFAcen3c4dPLo7MlSnkEAk6yxE8ocM5QEzuoGZepBEX3/3+frDEwNiz3Ie+9B23TS
         gY+CqGACnhO4Gcfwqccfz1q8S2rsW6hA7FLuYsBvUmhYIaY6nq5h46jbZeSPiABXo2pt
         3wg2tTdZLjiSJky1McysNCMRIDaWM6/9a7Sy1pWMjo4UDubYLY4vGlemzChbgLmoxf/g
         D7ijUMv8+B7Ae4H9ArU8kvnOVSwtZo5gnnNW4DyuzDADn5JeCtfo5ghA6wfZYf6nOBiu
         9t96QRp+q6mbQKZH9o/lIgty1xtjVbNkV4N3FsFY8OFAJRD6EDT+j5jVtpwsbRFGYqpq
         PWSQ==
X-Gm-Message-State: AOJu0YwmYWEDtwQ74PRz9TxQLsaMFxUdaj7mB3E18Q2XQVK38NvTiO6v
        ZkapMGP4cbZlv3q9hC9G7MRTHg==
X-Google-Smtp-Source: AGHT+IF9W+7AW/XlTQ7WDrQGflbC5JtDdmSRP62EIkSF11L7fYaLrR7J1qys5NGk48FiNmOh3TFgig==
X-Received: by 2002:a7b:c84e:0:b0:3fe:1fd9:bedf with SMTP id c14-20020a7bc84e000000b003fe1fd9bedfmr16045843wml.11.1697050161221;
        Wed, 11 Oct 2023 11:49:21 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id v6-20020adff686000000b0031980294e9fsm16003875wrp.116.2023.10.11.11.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 11:49:20 -0700 (PDT)
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
Subject: [PATCH v3 07/20] dt-bindings: pinctrl: samsung: add gs101-wakeup-eint compatible
Date:   Wed, 11 Oct 2023 19:48:10 +0100
Message-ID: <20231011184823.443959-8-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
In-Reply-To: <20231011184823.443959-1-peter.griffin@linaro.org>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

gs101 is similar to newer Exynos SoCs like Exynos850 and ExynosAutov9
where more than one pin controller can do external wake-up interrupt.
So add a dedicated compatible for it.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 1de91a51234d..7cddce761c46 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -29,6 +29,7 @@ description: |
 properties:
   compatible:
     enum:
+      - google,gs101-wakeup-eint
       - samsung,s3c2410-wakeup-eint
       - samsung,s3c2412-wakeup-eint
       - samsung,s3c64xx-wakeup-eint
@@ -99,6 +100,7 @@ allOf:
             enum:
               - samsung,exynos850-wakeup-eint
               - samsung,exynosautov9-wakeup-eint
+              - google,gs101-wakeup-eint
     then:
       properties:
         interrupts: false
-- 
2.42.0.655.g421f12c284-goog

