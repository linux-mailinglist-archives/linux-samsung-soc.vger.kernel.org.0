Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95B60256956
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 29 Aug 2020 19:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728203AbgH2RZm (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 29 Aug 2020 13:25:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:59416 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728105AbgH2RZl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 29 Aug 2020 13:25:41 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 05E3C206B5;
        Sat, 29 Aug 2020 17:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598721941;
        bh=PAx0+OydMEHzBmwG79GAR/AQlFPKngcxVB7RdipQB8U=;
        h=From:To:Cc:Subject:Date:From;
        b=mpVIoQzZ1YogEx+PTRt9DNFtpizI+iHqcH2vQ0HCPr3Z0xt8nXIsITo8Tqev8lHWe
         hRBTzSyL8qlibl8km/etPH1INIyTg/pc1Tp4kCMIDUCjPb8TMscX2savhm+xrbexf9
         AldGn8F/Boqsl/lGA6rS4BP59EV6BR/as8YHhtQY=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Hoegeun Kwon <hoegeun.kwon@samsung.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH 1/4] dt-bindings: display: samsung,amoled-mipi-dsi: Do not require enable-gpios on samsung,s6e63j0x03
Date:   Sat, 29 Aug 2020 19:25:29 +0200
Message-Id: <20200829172532.29358-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The samsung,s6e63j0x03 does not have enable GPIO, so do not require it.
This fixes dtbs_check warning:

  arch/arm/boot/dts/exynos3250-rinato.dt.yaml: panel@0: 'enable-gpios' is a required property

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../display/panel/samsung,amoled-mipi-dsi.yaml       | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,amoled-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/panel/samsung,amoled-mipi-dsi.yaml
index 96bdde9298e0..ccc482570d6a 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,amoled-mipi-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,amoled-mipi-dsi.yaml
@@ -12,6 +12,17 @@ maintainers:
 allOf:
   - $ref: panel-common.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,s6e3ha2
+              - samsung,s6e3hf2
+    then:
+      required:
+        - enable-gpios
+
 properties:
   compatible:
     enum:
@@ -39,7 +50,6 @@ required:
   - vdd3-supply
   - vci-supply
   - reset-gpios
-  - enable-gpios
 
 additionalProperties: false
 
-- 
2.17.1

