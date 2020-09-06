Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12D8E25EE37
	for <lists+linux-samsung-soc@lfdr.de>; Sun,  6 Sep 2020 16:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728763AbgIFOW5 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 6 Sep 2020 10:22:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:57422 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728905AbgIFOVz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 6 Sep 2020 10:21:55 -0400
Received: from localhost.localdomain (unknown [194.230.155.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4C1AC208C7;
        Sun,  6 Sep 2020 14:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599402114;
        bh=br/hzg6lNZVK5EakhampscuZH0tZyYzLNorJ+mKMInE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=2Ytcjf9GeqtEZRksLpNgVi2vJfHcPxzotuV8g1kn1dLhaSjp7M6O775tKpVNPzYTx
         Xywx24N8ytJfIrnP3yPCx2Gt27sUgrWnR6oZDUfUClVR0ZTe1sYRI70M5E0PZwWMdY
         MIRvwjkcco0yWvYmpLUdNaKGQLm9WEIMsoqdHBzg=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH v3 2/3] ARM: dts: exynos: Add assigned clock parent to CMU in Exynos4412 Odroid
Date:   Sun,  6 Sep 2020 16:21:45 +0200
Message-Id: <20200906142146.21266-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200906142146.21266-1-krzk@kernel.org>
References: <20200906142146.21266-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Commit 68605101460e ("ARM: dts: exynos: Add support for audio over HDMI
for Odroid X/X2/U3") added assigned clocks under Clock Management Unit.

However the dtschema expects "clocks" property if "assigned-clocks" are
used.  Add reference to input clock, the parent used in
"assigned-clock-parents" to silence the dtschema warnings:

  arch/arm/boot/dts/exynos4412-odroidu3.dt.yaml: clock-controller@10030000: 'clocks' is a dependency of 'assigned-clocks'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v2:
1. Use XUSBXTI as real input clock.
---
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index ca3c78e0966c..4a9f9881f10f 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -120,6 +120,7 @@
 };
 
 &clock {
+	clocks = <&clock CLK_XUSBXTI>;
 	assigned-clocks = <&clock CLK_FOUT_EPLL>;
 	assigned-clock-rates = <45158401>;
 };
-- 
2.17.1

