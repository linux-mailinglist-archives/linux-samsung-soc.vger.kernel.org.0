Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B9417F1ED5
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 20 Nov 2023 22:21:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232483AbjKTVVe (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 20 Nov 2023 16:21:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232406AbjKTVVW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Nov 2023 16:21:22 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E301122
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Nov 2023 13:21:17 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4084de32db5so23325975e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Nov 2023 13:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700515276; x=1701120076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oK3+J+uq1zdoJ4AWa77B+gNqjCRYeG1aCZZpF63aTJ0=;
        b=OvM3uzsk0Fy7QzOWF3X7F2CCQADhUQWKlU5551umnL541EWd1DpENmcWTWjpQEhrMo
         q4oM5UKNfCBbR4XfRAFdvB58QrWcRBgVMm5T0AxvaIutUASMGqtKbE8rOcEWsd0i7Aou
         pPoeoZ4fMfrspHE1AZzOg8GYEGSR216L4JF6rMNKyhi3a1hONV672fEngvQz6IMqk/N1
         ufrUX/GG0o/T17lwB4OXnz0fAZj7hzQ5fbmMvIKTxdQYpMvoz+8bdfk7xQ4xfTjkd/4/
         DzBU73nchL3BURGuX3DpOKUOQ+72ernVA54rdEO5uHNr8DG3ApBeQUWPEERoe5FB4x3+
         mN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700515276; x=1701120076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oK3+J+uq1zdoJ4AWa77B+gNqjCRYeG1aCZZpF63aTJ0=;
        b=g+R/VBFw32qLY3EbxlHVIJtuF4Gx7Ch5rZL0Wrl6ltvGbZjqsYkfS7qmIIHNbCNxS3
         cfYY0m/DDACD0YP3z5buXLvbCVDu28YWy2OCzNbMekq1GmizxJccSokqmyxE9aR2pgKC
         4XtHXrB10saZ9V6QUfpktmvAJQnaLPZW5hR5gsvATRHM1V+MWZIch4rJdNvIL+gOzNM+
         tIiCFrhPX8nOxF9Y5NoJ79Ffdrgz5joTUZWTmE08jq/NpuN8gPPoXq96RuK8t/TXksB3
         QTUett82GH2EhdqYYupECJPp8gIDXUb0xMeekpYXWPUGWI9kiQQx/MeQ1yPTBRljiFGL
         cv5g==
X-Gm-Message-State: AOJu0YxUYeyrGLBjeL/zNF1Lin+g06X2ZhAjSizvGwlW7Tp3u1rzwfLV
        V+cTS4oLKu1Bilf3l9z7GI5xgw==
X-Google-Smtp-Source: AGHT+IHRXdtnlZRBClLJAt3XTWnDX/mD73i3sd95M4tx/4bmM+eSRXliXrhZDPcmIFMdPyRbkhup5A==
X-Received: by 2002:a05:600c:4f84:b0:404:4b6f:d705 with SMTP id n4-20020a05600c4f8400b004044b6fd705mr7792272wmq.17.1700515276465;
        Mon, 20 Nov 2023 13:21:16 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id je14-20020a05600c1f8e00b0040596352951sm19518451wmb.5.2023.11.20.13.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:21:15 -0800 (PST)
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
Subject: [PATCH v4 07/19] dt-bindings: pinctrl: samsung: add gs101-wakeup-eint compatible
Date:   Mon, 20 Nov 2023 21:20:25 +0000
Message-ID: <20231120212037.911774-8-peter.griffin@linaro.org>
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

gs101 is similar to newer Exynos SoCs like Exynos850 and ExynosAutov9
where more than one pin controller can do external wake-up interrupt.
So add a dedicated compatible for it.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 1b75abebb953..41f3a2f2992e 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -30,6 +30,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - google,gs101-wakeup-eint
           - samsung,s3c2410-wakeup-eint
           - samsung,s3c2412-wakeup-eint
           - samsung,s3c64xx-wakeup-eint
@@ -104,6 +105,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - google,gs101-wakeup-eint
               - samsung,exynos850-wakeup-eint
               - samsung,exynosautov9-wakeup-eint
               - samsung,exynosautov920-wakeup-eint
-- 
2.43.0.rc1.413.gea7ed67945-goog

