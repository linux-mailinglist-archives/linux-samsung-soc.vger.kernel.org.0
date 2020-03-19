Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DED118BE18
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 19 Mar 2020 18:34:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727310AbgCSReU (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 19 Mar 2020 13:34:20 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:56830 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727189AbgCSReU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Mar 2020 13:34:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1584639256; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=qBlsxGpLBmHdOo3Pa/1eH5Uy1dwLHM/CfGO4+DeCi34=;
        b=Je4GKa+UuAr1MbxiDVpmiT2wk+aWvGzt4ExoMFYoO2sWeqmko1aBiLsA2E2CcpolZCP2aA
        6iaaF/ClCzWu0zh0e95nvEwehbXr1sBtTF7+/FPr5HchUKqNKfYm780nW4nc9VWOEQ7l8f
        AY7VdGxEhqFkZ2RhGi7b45mov+ZZK40=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Stenkin Evgeniy <stenkinevgeniy@gmail.com>,
        Jonas Heinrich <onny@project-insanity.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 1/2] dt-bindings: arm/samsung: Add compatible string for the Galaxy S2
Date:   Thu, 19 Mar 2020 18:34:10 +0100
Message-Id: <20200319173411.20607-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add compatible string for the Samsung Galaxy S2 (i9100 version), which
is an Exynos 4210 based device.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---

Notes:
    v2: Move compatible string so that the list is sorted in alphabetical order
    
    v3: No change

 .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 63acd57c4799..eb92f9eefaba 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -52,6 +52,7 @@ properties:
         items:
           - enum:
               - insignal,origen                 # Insignal Origen
+              - samsung,i9100                   # Samsung Galaxy S2 (GT-I9100)
               - samsung,smdkv310                # Samsung SMDKV310 eval
               - samsung,trats                   # Samsung Tizen Reference
               - samsung,universal_c210          # Samsung C210
-- 
2.25.1

