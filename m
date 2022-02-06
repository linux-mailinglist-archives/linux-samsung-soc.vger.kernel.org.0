Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 253EF4AAFD2
	for <lists+linux-samsung-soc@lfdr.de>; Sun,  6 Feb 2022 15:04:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235477AbiBFOEN (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 6 Feb 2022 09:04:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234424AbiBFOEL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 6 Feb 2022 09:04:11 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C694EC043185
        for <linux-samsung-soc@vger.kernel.org>; Sun,  6 Feb 2022 06:04:10 -0800 (PST)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DD51540328
        for <linux-samsung-soc@vger.kernel.org>; Sun,  6 Feb 2022 13:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644155896;
        bh=lR5QuC/RulAMRDxY+ifBfJU5LKjeK10Pu1tPwMpMBhw=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=R/sqQgIdhrXOJnbgmUmZaIj/dzW+TawzABLl4fCG9Q5gBkOjAzByHv2UmaLbhgoUU
         qtB68S95PYBmmCNZn+nxA6GMtlBvxR4xSHOegytaTl9oKjIkUmUMGEnMdCy0eYtthr
         /gIMxDqOhDilEwxpPytjbtn1PijFbmHBbyOJCvJNZDi1nC3AHrTXQHF3Osu8YxyscZ
         hKjU17KgdgyiNoHVm/A7H9NHLnNuODc5TaeGCwhCNEsWG8XLRun5CKdOJe8zrLtZYT
         RmMLxA7BblHJvJmi5NsN/bR5DuMTro036MaswNqXWVSczFVcQVp+DyoDxa/rI0sdlC
         9jAKUIJ1nfyPA==
Received: by mail-wr1-f72.google.com with SMTP id k12-20020adfe3cc000000b001d6806dfde1so3782122wrm.16
        for <linux-samsung-soc@vger.kernel.org>; Sun, 06 Feb 2022 05:58:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lR5QuC/RulAMRDxY+ifBfJU5LKjeK10Pu1tPwMpMBhw=;
        b=Df+OmfdmAHwd+R9nID7eATwoc+0tZvFSbZpoVgCXYl8fHnEVPZ1hu1SalcWsXFFAzD
         3VC4qg+zLAlgt9HLA9enngKHmZik2ConGXqXN7okNaS11f/ubJ1v+UImFQdb4SOn6RCg
         0gIyEhlSxJ0u99j1AoHwazyX/z8OVsi/Dn4jmcMagIYWw4T8nGwuxpVZs+jTKQ9td2//
         4u4iEq8keQgZqciDH22UsFHZL4TevPqUXuvTgm1fXgyWpu4R4EENRSVvWemKMtKYo8Ag
         pEvr7veuh1Hd0hsKmZvfXohuEj7KB/gi0RpKjyddziDGi+wGIEhmj64WlFt0+Tjffnck
         Jtdg==
X-Gm-Message-State: AOAM530tkEqQMv8O365I0K3eLZycsZ/ywe1ggxly2g3vKFAZmgCjGTS8
        pu+uvPyRgOJ3CCDED4fCV9toFg179vqG7TBJZuCnLzQM+UnYyWXgfHf6bqB6v9Ix7sHS5mKqr1d
        SFwthbNAxFxLMfpDp9ur4WPA6JgC29Cw1lqt+bHaayoeO+IG6
X-Received: by 2002:a05:600c:3d0c:: with SMTP id bh12mr10822063wmb.179.1644155896245;
        Sun, 06 Feb 2022 05:58:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTX+molkn93Ebp+4k6R2HYipWuqcMWZxzQzfvUagW0IQOkjly+1ESbyJzirwTgRGM+iphQMw==
X-Received: by 2002:a05:600c:3d0c:: with SMTP id bh12mr10822054wmb.179.1644155896117;
        Sun, 06 Feb 2022 05:58:16 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id e9sm8296888wrg.60.2022.02.06.05.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 05:58:15 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 4/8] dt-bindings: memory: lpddr3: adjust IO width to spec
Date:   Sun,  6 Feb 2022 14:58:03 +0100
Message-Id: <20220206135807.211767-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220206135807.211767-1-krzysztof.kozlowski@canonical.com>
References: <20220206135807.211767-1-krzysztof.kozlowski@canonical.com>
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

According to JEDEC Standard No. 209-3 (table 3.4.1 "Mode Register
Assignment and Definition in LPDDR3 SDRAM"), the LPDDR3 supports only
16- and 32-bit IO width.  Drop the unsupported others.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/memory-controllers/ddr/jedec,lpddr3.yaml           | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr3.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr3.yaml
index e36f3607e25a..d6787b5190ee 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr3.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr3.yaml
@@ -34,10 +34,8 @@ properties:
     description: |
       IO bus width in bits of SDRAM chip.
     enum:
-      - 64
       - 32
       - 16
-      - 8
 
   manufacturer-id:
     $ref: /schemas/types.yaml#/definitions/uint32
-- 
2.32.0

