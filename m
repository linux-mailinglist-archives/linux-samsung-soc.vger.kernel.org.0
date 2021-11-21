Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 205914584EF
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 21 Nov 2021 17:57:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238341AbhKURAB (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 21 Nov 2021 12:00:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238326AbhKUQ75 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 21 Nov 2021 11:59:57 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79F36C061574
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Nov 2021 08:56:52 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id b40so69305125lfv.10
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Nov 2021 08:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B7xe7ejeuIGEwCH9PIhTk0vWdr6HZ3Wf0VU2/9Zm6Dk=;
        b=zbl6sQX5C2dkHBwnnygq5NvpqE+eB530j/9pzxHLIKdNQruZijsSeZZffHtt8EtEYa
         K68sDGJqxN4H5Co2rIMIXlkSSBY4rWt33dknqwu2jtaHqnGQzVGm2KNjonz/d/SsZZrG
         kX+TviwyQcB7BoAAUCwH/IiOQG3E+ZbGTuwNGK/Ni8YvwZeav84qze3I8hvQ4/ruOD6R
         FvVWzAm32NnKhdE4ub33ocDtt2SNzElp/lUbZGc6W9nIfvwweCWxS+9zLKg4G+LAD94b
         N3oXMsPLJvO4zeqvvJkSMNo3Hf/t3EEEj9gygrFmUwuhEhYvigiXSgnXOZSS8j1H16nE
         SY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B7xe7ejeuIGEwCH9PIhTk0vWdr6HZ3Wf0VU2/9Zm6Dk=;
        b=tB7LjiibMf76bnzebMyB+0bNKHmO5u4zDB9Ig/JQwIAscnS54QsbmKU0aRSKHsyKQR
         MhmIiafqP0pa24XkknTeNrdzzY0L7mwiYlp0l98yAPZHhxCl+ATDMs48C1LRzBKGcouC
         gFlGHFhyvOfmTaLjDN/eYXYYDTKpyE+aU9z3/0UwGoqhOnu5pgj0PsZVmcEHi65aWFtW
         ZuwS+caSoC1RUKEma462Nlk1zW0lCoyVkzXVpYECO7jF3WrqJD3vPcc18YJiOpwMnWO1
         B4bgPsvtgsBj7+QbUVGLNbiTzO/JtU64kxmmxg6irxoE9KqLt/j+Un5J21bK5VE/JBxN
         BqpQ==
X-Gm-Message-State: AOAM530JZaVZOS9GpMSZv1WZu0nt4bHCAhrVo2MH83zh/nHvlQpWuk6O
        tM7yCzW9Yg/AFDNJD+U+SGxNrw==
X-Google-Smtp-Source: ABdhPJzghj3Kx+HzhIzyf2GmhjhBt4dWAhgLyGaVp1SN1lqRgtJLfgif380+kLk4FJg4qGmMoQo6Rw==
X-Received: by 2002:a05:6512:16aa:: with SMTP id bu42mr51785744lfb.477.1637513810856;
        Sun, 21 Nov 2021 08:56:50 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id z2sm690096lfd.301.2021.11.21.08.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 08:56:50 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v4 01/12] dt-bindings: watchdog: Require samsung,syscon-phandle for Exynos7
Date:   Sun, 21 Nov 2021 18:56:36 +0200
Message-Id: <20211121165647.26706-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211121165647.26706-1-semen.protsenko@linaro.org>
References: <20211121165647.26706-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Exynos7 watchdog driver is clearly indicating that its dts node must
define syscon phandle property. That was probably forgotten, so add it.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Fixes: 2b9366b66967 ("watchdog: s3c2410_wdt: Add support for Watchdog device on Exynos7")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
Changes in v4:
  - Added R-b tag by Guenter Roeck

Changes in v3:
  - Added R-b tag by Rob Herring

Changes in v2:
  - Added R-b tag by Krzysztof Kozlowski
  - Added "Fixes" tag

 Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 76cb9586ee00..93cd77a6e92c 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -39,8 +39,8 @@ properties:
   samsung,syscon-phandle:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
-      Phandle to the PMU system controller node (in case of Exynos5250
-      and Exynos5420).
+      Phandle to the PMU system controller node (in case of Exynos5250,
+      Exynos5420 and Exynos7).
 
 required:
   - compatible
@@ -58,6 +58,7 @@ allOf:
             enum:
               - samsung,exynos5250-wdt
               - samsung,exynos5420-wdt
+              - samsung,exynos7-wdt
     then:
       required:
         - samsung,syscon-phandle
-- 
2.30.2

