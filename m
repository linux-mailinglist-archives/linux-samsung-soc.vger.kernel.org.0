Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA593A6291
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  3 Sep 2019 09:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbfICHd1 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 3 Sep 2019 03:33:27 -0400
Received: from foss.arm.com ([217.140.110.172]:33100 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726452AbfICHd0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Sep 2019 03:33:26 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A2DB344;
        Tue,  3 Sep 2019 00:33:26 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AF6ED3F246;
        Tue,  3 Sep 2019 00:33:24 -0700 (PDT)
From:   Guillaume Gardet <guillaume.gardet@arm.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Guillaume Gardet <guillaume.gardet@arm.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: gpu: mali-midgard: Add samsung exynos5250 compatible
Date:   Tue,  3 Sep 2019 09:33:00 +0200
Message-Id: <20190903073300.5927-1-guillaume.gardet@arm.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190830104502.7128-2-guillaume.gardet@arm.com>
References: <20190830104502.7128-2-guillaume.gardet@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add "samsung,exynos5250-mali" binding.

Signed-off-by: Guillaume Gardet <guillaume.gardet@arm.com>

Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
---
 Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
index b99a43bb471a..47bc1ac36426 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
@@ -30,12 +30,15 @@ properties:
           - enum:
              - rockchip,rk3399-mali
           - const: arm,mali-t860
+      - items:
+          - enum:
+             - samsung,exynos5250-mali
+          - const: arm,mali-t604
       - items:
           - enum:
              - samsung,exynos5433-mali
           - const: arm,mali-t760
 
-          # "arm,mali-t604"
           # "arm,mali-t624"
           # "arm,mali-t628"
           # "arm,mali-t830"
-- 
2.23.0

