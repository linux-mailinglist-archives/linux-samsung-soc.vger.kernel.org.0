Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C3C22589CC
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  1 Sep 2020 09:55:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727818AbgIAHym (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 1 Sep 2020 03:54:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:45466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727028AbgIAHyk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 1 Sep 2020 03:54:40 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 111052083B;
        Tue,  1 Sep 2020 07:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598946879;
        bh=o7UEqMqPPvvhiO414ovEcDlR1s0CegXtD3+46I/QY5U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=N4e/iUBkhVXbL8k2uAy8pqvV0jVkZoTWfROJb/CmnqEwFUXGdCGIaqSihqrTxu0r+
         j1YPsV2RpmdOkkGndjdOYWuxZc56aDahCDpKsw+J5IwwDCe9cx/s4K1UShVbKwhe9p
         ltnZ7N8n5mQ+EK9Qfk/tDM/IFc1fGcMk2cUAteOA=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH 03/13] ARM: dts: exynos: Remove unneeded address/size cells in Exynos5260 GIC
Date:   Tue,  1 Sep 2020 09:54:07 +0200
Message-Id: <20200901075417.22481-4-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901075417.22481-1-krzk@kernel.org>
References: <20200901075417.22481-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The Exynos5260 GIC node does not have any children so remove the address
and size cells as they are not needed by DT bindings.  The size-cells of
'0' were also incorrect.  This fixes dtbs_check warning:

  arch/arm/boot/dts/exynos5260-xyref5260.dt.yaml: interrupt-controller@10481000: #size-cells:0:0: 1 was expected

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5260.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5260.dtsi b/arch/arm/boot/dts/exynos5260.dtsi
index 9b45e052cca9..973448c4ad93 100644
--- a/arch/arm/boot/dts/exynos5260.dtsi
+++ b/arch/arm/boot/dts/exynos5260.dtsi
@@ -164,8 +164,6 @@
 		gic: interrupt-controller@10481000 {
 			compatible = "arm,gic-400", "arm,cortex-a15-gic";
 			#interrupt-cells = <3>;
-			#address-cells = <0>;
-			#size-cells = <0>;
 			interrupt-controller;
 			reg = <0x10481000 0x1000>,
 				<0x10482000 0x2000>,
-- 
2.17.1

