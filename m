Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49E4A506BF5
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 19 Apr 2022 14:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349877AbiDSMO1 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 19 Apr 2022 08:14:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352389AbiDSMNJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 19 Apr 2022 08:13:09 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A3F0231
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Apr 2022 05:08:33 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id c64so20941717edf.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Apr 2022 05:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gJBICKQLh4SmRmRXg7WcqpSsoivPECC+yHqWJcRnyBw=;
        b=Sn37T4kc1gy6ZYukal91cqyroyiiW0YOKutyzzxL28XA021ppNbIRoT1O3N+vhXW3N
         +RyZY0Hy6LmczFbwuQG8t6BhAgN472/45bvNHNpmrlRfJY32fI7Or2xZy+Fhpmq3PgcD
         q5e8W4q44jtq1Q3ZvOd/MnlnC8Zi4KmpTtep9lJBACmNVsSazRv+QjwGwozjxlVq1nzg
         EUizVvuL/kBaF9D+ynoknZyRiZreXODj1OvFLz+Qk5jZ556+k35E1pjtj7X7xVgJnlBv
         BTyjfM9+ClMhojyOf1tfD6VAub9L3iLUEDfu5d7Mrq/Cfeecla3rYxMFRXU5Oed9Dplf
         NLtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gJBICKQLh4SmRmRXg7WcqpSsoivPECC+yHqWJcRnyBw=;
        b=LLLNnOBlkqm10gTVMHi2sWI0sYhU78GHilhp4SmtYv/9oC2FPs39eTPc/v/RYdOoUc
         NnF4fi1LB2thGdHm67Fi7iNWRiGRBIaFx7SSCi5SxV0ylzn8AUEqPPMnuVy7+/FDN4hD
         jU4QjkKL+XYS+2WjRYNl3yENIhFs44s/cSm2+kwg6BNiOHCObU2tGv9At8sr4iR2AXA7
         KGM22U5HjAGX7nxMQyoN+zCUxE+KjedjzAUYwfopA70qUune7o88J55LQm71ej33Nhd+
         tYeIE1c1E+CnggYOSFhr9pFvqa/d6z9VyBizHWSqAZuewyUerc4ZulA2lEovLWJUyTIW
         fXVQ==
X-Gm-Message-State: AOAM530h2E0JIkZTX9VnZN+KjqjntHqWv3MG1fRWraLwp+5xxviiE+Kx
        3PjWeAqozO6fmscKE9vz1mdiiw==
X-Google-Smtp-Source: ABdhPJwfSsZ+0H3n/XuujAWcXTuBSL/NU/on/b6lZHEaFDgqno2IZJZAD1kRcItiaW2nIfGLCX/8ug==
X-Received: by 2002:a05:6402:50cb:b0:423:d7a8:719e with SMTP id h11-20020a05640250cb00b00423d7a8719emr14101396edb.37.1650370112033;
        Tue, 19 Apr 2022 05:08:32 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id cb25-20020a170906a45900b006e87e5f9c4asm5677200ejb.140.2022.04.19.05.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 05:08:31 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH RESEND usb] dt-bindings: usb: samsung,exynos-usb2: add missing required reg
Date:   Tue, 19 Apr 2022 14:08:27 +0200
Message-Id: <20220419120827.249627-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

"reg" property is required on Samsung S5PV210/Exynos EHCI/OHCI
controllers.

Fixes: 4bf2283cb208 ("dt-bindings: usb: samsung,exynos-usb2: convert to dtschema")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Acked-by: Rob Herring <robh@kernel.org>

---

Fix for commit in v5.18-rc1.

Hi Greg, could you pick it up for fixes via USB?

---
 Documentation/devicetree/bindings/usb/samsung,exynos-usb2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-usb2.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-usb2.yaml
index 340dff8d19c3..9c92defbba01 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-usb2.yaml
@@ -62,6 +62,7 @@ required:
   - interrupts
   - phys
   - phy-names
+  - reg
 
 allOf:
   - if:
-- 
2.32.0

