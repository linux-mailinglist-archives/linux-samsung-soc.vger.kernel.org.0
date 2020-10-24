Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C929B297CDF
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 24 Oct 2020 16:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1762096AbgJXOo4 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 24 Oct 2020 10:44:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1762092AbgJXOo4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 24 Oct 2020 10:44:56 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2DECC0613CE;
        Sat, 24 Oct 2020 07:44:55 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id e17so6156635wru.12;
        Sat, 24 Oct 2020 07:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kq534MnYHP1HOQmgeHVngGcSa+WDNQzOpCGB3yZ6Zd8=;
        b=tOBcXBQVe60JQ/L7b1xul+jlZXEl5prAFat1jKNlLj1POre5BWWgqoyZpJ7yPj6LUv
         onXGzSo7wXw0QWyOh4FSlmYGYCHdUPY3BiPQfUO5ypAPE6mPNnilQ7EQ7UeoJGfWZPv7
         NwTM2mHnFtTn8Kc6Sw8ilvqZDRQyT4lwdY3Sf6dvX3nuN+bbzvJCS3Lc+iKDZfwClehy
         y6yFG4j33JKfk9UzvOyHltRCeS7MWQLRstc/poAOuoMJvgGfO40aXceajy1/0PyltMHg
         XCiBkENw/rdIYtNBeaoiOM0thRvmYbIQZSedrwizKpo0c9LJH4llbUmKmqeB7h6UeUEM
         0toA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kq534MnYHP1HOQmgeHVngGcSa+WDNQzOpCGB3yZ6Zd8=;
        b=Kk7krTCV42HIXY/mtA98xx9/0Ssj0R7a7yX1eyv2naacoFvaRxr8S+LCu8IFCCM+Qw
         MLNrcWoubGZxrOa2cK2jgMX5soZVFslzrO1MFVou1Taij7MaELenLftwQY/CIM6plqY9
         kRCgZb/KCnCO1zFVWPsP1m8iZnGmeTHbXhe+/pfLrkTCuMT82zlovgLnYLpBFdFvMN5Z
         NbYNCcP1HBcK2XkPvSDpCaYqTJmNrEUH9fjKFj7h59d72ctloGVyOQ9gwu4PAYQbNrby
         WjBCPYa5AYy6mcYTd2MxH3vEl9drCmdGj3SqwLAt1/1vFvmiqon86EvX8VdiKAByIlfI
         Y2cQ==
X-Gm-Message-State: AOAM533IxzJsE1ZYs0AHydea6bYqrUiJ79BiiKgcJn7aF4sxVz4cg2lx
        cWscn4mW43fWijX7wxYlFQ8=
X-Google-Smtp-Source: ABdhPJxxrjp2TiuNDCw97Q/LfOyVwi8thd7UEvf6LWHDIv4yDS2ORoR+OjGfKWKThLfOlMDcL2Uj0Q==
X-Received: by 2002:a5d:6ac6:: with SMTP id u6mr7960822wrw.65.1603550694418;
        Sat, 24 Oct 2020 07:44:54 -0700 (PDT)
Received: from adroid (165-170-184-091.ip-addr.vsenet.de. [91.184.170.165])
        by smtp.gmail.com with ESMTPSA id g83sm9963440wmf.15.2020.10.24.07.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2020 07:44:53 -0700 (PDT)
From:   =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     kgene@kernel.org, krzk@kernel.org, devicetree@vger.kernel.org,
        martin.juecker@gmail.com
Subject: [PATCH 1/5] dt-bindings: samsung: document bindings for p4note family boards
Date:   Sat, 24 Oct 2020 16:44:17 +0200
Message-Id: <20201024144421.34435-2-martin.juecker@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201024144421.34435-1-martin.juecker@gmail.com>
References: <20201024144421.34435-1-martin.juecker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Document the GT-N8010/GT-N8013 device binding and the p4note common
binding that it is based on.

Signed-off-by: Martin Jücker <martin.juecker@gmail.com>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml   | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index eb92f9eefaba..c604d1fa1335 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -83,6 +83,14 @@ properties:
           - const: samsung,exynos4412
           - const: samsung,exynos4
 
+      - description: Samsung p4note family boards
+        items:
+          - enum:
+              - samsung,n801x                   # Samsung GT-N8010/GT-N8013
+          - const: samsung,p4note
+          - const: samsung,exynos4412
+          - const: samsung,exynos4
+
       - description: Exynos5250 based boards
         items:
           - enum:
-- 
2.25.1

