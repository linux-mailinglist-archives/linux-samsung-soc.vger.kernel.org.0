Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14086568E8D
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  6 Jul 2022 18:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233721AbiGFQDG (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 6 Jul 2022 12:03:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232948AbiGFQDF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Jul 2022 12:03:05 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2044E22B0D
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Jul 2022 09:03:04 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id y16so26661995lfb.9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Jul 2022 09:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sjIYiBfpYQaZCjiDDUw80GeN5SJaPdXasGJiDMkWxx0=;
        b=wKIYPHA6pwqe7VBGw4C/BVENa9OPi+2EvxykSz8CTEztaDAqJqvtNtbpwhN4icYsdg
         vEA1+JrIEo52tdGHOrMaMvGaG8hN9bpAC/d+rg50NSbGg4+vHOgEb3nk9fJ+wjntiMWI
         oTOHt0sVyB5OAbVV7W0CwPMvCcAAoWWXE2u8pJQxZiSIiTES74lZ6bC6CQDS8BVd9xAR
         OZ9tna8dKhb4s+7PcoyyQcRxD8Bxy9U8KvfKpSkVaaN4FXI/RBSd2yTuVgFB3bUeyLOV
         0jWHjycoY1g5qu9/htA06d+GLG/PAjIJlibILCAqepzupx/N6jx8xTErwg1PFFzaPWDr
         bceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sjIYiBfpYQaZCjiDDUw80GeN5SJaPdXasGJiDMkWxx0=;
        b=CeX2SqiXXz4Y2Ff/7rbw7w7VL5zSbAiNpRYVFojTcxo4D8suKAxqHNQnCfsh9R1tNc
         1L5pFRbxFeIWT4rfhi6rr6wkni4hN21cv6M/uIPr7dRu+1Ds3gRUQcWPXb44U7z9Megw
         2msdBd8k542nyIYhIwG6KJ8zAGgkITarorQ6qH5QaNGjA9KmiHnpDqPhtmQzS+O7EafN
         MPAdhfZIbXxDzxFIG0avOja+asfWEQe5qwYdYRLHaWTGBnKaNj9LdUx3Nb3vt/hqbudy
         yxU2MIhd6EhAChEoG+alxddLDSLKNqWYJXZchiSQIV2cD9M/0SuQMOQohs3CzzehaX+P
         B7cg==
X-Gm-Message-State: AJIora9SSk17PzOatFVhiKlC9EN84eYn5tRiCwst3MwDZb2cZSLONkAC
        kKMV87F23tAtVg0Dw8Ve+6cZIA==
X-Google-Smtp-Source: AGRyM1unqErbr3qYZpHW56eVIYhDooRVtn4q6LJtZhaFdI8X9EUOJ3+nA+KNf9HCytKf/0j47GI3LQ==
X-Received: by 2002:a19:771d:0:b0:47f:95ef:1d66 with SMTP id s29-20020a19771d000000b0047f95ef1d66mr27209667lfc.590.1657123381595;
        Wed, 06 Jul 2022 09:03:01 -0700 (PDT)
Received: from krzk-bin.home ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id w10-20020a2e9bca000000b0025a65ed7aa4sm6291292ljj.51.2022.07.06.09.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 09:03:01 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/3] dt-bindings: soc: samsung: exynos-pmu: use abolute ref paths
Date:   Wed,  6 Jul 2022 18:02:56 +0200
Message-Id: <20220706160257.27579-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706160257.27579-1-krzysztof.kozlowski@linaro.org>
References: <20220706160257.27579-1-krzysztof.kozlowski@linaro.org>
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

Preferred coding for referencing other schemas is to use absolute path.
Quotes over path are also not needed.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

---

Changes since v1:
1. Add Rb tag
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index a5d489acfdca..1835ca08416d 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -75,13 +75,13 @@ properties:
     const: 3
 
   syscon-poweroff:
-    $ref: "../../power/reset/syscon-poweroff.yaml#"
+    $ref: /schemas/power/reset/syscon-poweroff.yaml#
     type: object
     description:
       Node for power off method
 
   syscon-reboot:
-    $ref: "../../power/reset/syscon-reboot.yaml#"
+    $ref: /schemas/power/reset/syscon-reboot.yaml#
     type: object
     description:
       Node for reboot method
-- 
2.34.1

