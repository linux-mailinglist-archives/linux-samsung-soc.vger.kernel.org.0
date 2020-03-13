Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4A50183502
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 12 Mar 2020 16:34:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727560AbgCLPeT (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 12 Mar 2020 11:34:19 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:50478 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727196AbgCLPeS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 12 Mar 2020 11:34:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1584027256; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=rO4/v/2w+7THJFW0RfxrvZkO1GC67XqmS2u1njvdczg=;
        b=G9BRTY8YPISlqnByCoxWg+TsHLZoaEV5NQFjH6jGMeBFKUvznHTE4S1mpqgcyXiQ2Sp+Kt
        5BMLM8g6eC4m6AS8KbPINAyAb8PBnHweIYE3DRy+3E3uRaoKbTyNRNGoLYUAHeNBiQWVlA
        xvEyQM7IUScidtPjW9KwkPDL1Hpjudk=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Stenkin Evgeniy <stenkinevgeniy@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/2] dt-bindings: arm/samsung: Add compatible string for the Galaxy S2
Date:   Thu, 12 Mar 2020 16:34:10 +0100
Message-Id: <20200312153411.13535-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add compatible string for the Samsung Galaxy S2 (i9100 version), which
is an Exynos 4210 based device.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 63acd57c4799..e2b19caac795 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -55,6 +55,7 @@ properties:
               - samsung,smdkv310                # Samsung SMDKV310 eval
               - samsung,trats                   # Samsung Tizen Reference
               - samsung,universal_c210          # Samsung C210
+              - samsung,i9100                   # Samsung Galaxy S2
           - const: samsung,exynos4210
           - const: samsung,exynos4
 
-- 
2.25.1

