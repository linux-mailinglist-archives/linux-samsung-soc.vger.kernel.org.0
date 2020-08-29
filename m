Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F779256965
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 29 Aug 2020 19:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728373AbgH2RZ6 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 29 Aug 2020 13:25:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:59976 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728355AbgH2RZx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 29 Aug 2020 13:25:53 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 460AC20714;
        Sat, 29 Aug 2020 17:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598721953;
        bh=+nY9mykADdwF60jwNNmm7FFTN2Md3KZ+mkgsQiSWT+A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uXvec8+QQTrPCMN2QCX7MutzzreA731+VA/ru/aRaEVo4FxWXEyrs4Nvji4j94j6+
         6AbmrY3qk1PGNm0pXx+eEHDAOt6W/H5tOhSbELqVS1Nnk7CN7PJG5o/N6KzjFQVZEz
         ZZKBhouPI0Oulk5z40uiLVft2UUwnO8ZSOFNSOYw=
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
Subject: [PATCH 4/4] ARM: dts: exynos: Remove snps,dwc2 compatible in Exynos3250
Date:   Sat, 29 Aug 2020 19:25:32 +0200
Message-Id: <20200829172532.29358-4-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200829172532.29358-1-krzk@kernel.org>
References: <20200829172532.29358-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The binding for DesignWare HS OTG USB 2.0 in Samsung SoCs take only one
compatible.  This fixes dtbs_check warnings like:

  arch/arm/boot/dts/exynos3250-artik5-eval.dt.yaml: hsotg@12480000:
    compatible: ['samsung,s3c6400-hsotg', 'snps,dwc2'] is not valid under any of the given schemas (Possible causes of the failure):

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos3250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 6d467022d929..78734c132822 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -350,7 +350,7 @@
 		};
 
 		hsotg: hsotg@12480000 {
-			compatible = "samsung,s3c6400-hsotg", "snps,dwc2";
+			compatible = "samsung,s3c6400-hsotg";
 			reg = <0x12480000 0x20000>;
 			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cmu CLK_USBOTG>;
-- 
2.17.1

