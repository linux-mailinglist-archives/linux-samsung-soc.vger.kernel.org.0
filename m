Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EE4F25EE3B
	for <lists+linux-samsung-soc@lfdr.de>; Sun,  6 Sep 2020 16:31:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbgIFOWk (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 6 Sep 2020 10:22:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:57398 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728896AbgIFOV4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 6 Sep 2020 10:21:56 -0400
Received: from localhost.localdomain (unknown [194.230.155.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C2005207BC;
        Sun,  6 Sep 2020 14:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599402111;
        bh=cDyc+wot3vTMEATBk2z4vEu0zSazrJ7Fe/RR4d6egKY=;
        h=From:To:Cc:Subject:Date:From;
        b=UoXNCHzaBtT3ITrr6Y52mq0pWb01bUH+0eJPTdvWjjHlT/g1UIOSprE+ik68wQ/bX
         Tu3YV+m2f1IaNEor5YJyMvvp424lSWzoelj3ESbPnRa4/m7v3Ky3qLaTPepAVEe8HF
         9C+3BpMHgNMA0BcMQ/mPY0Aa/YjqNhMNnOcK0vtg=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH v3 1/3] ARM: dts: exynos: Add assigned clock parent to CMU in Exynos3250
Date:   Sun,  6 Sep 2020 16:21:44 +0200
Message-Id: <20200906142146.21266-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Commit 52005dece527 ("ARM: dts: Add assigned clock parents to CMU node
for exynos3250") added assigned clocks under Clock Management Unit to
fix hangs when accessing ISP registers.

However the dtschema expects "clocks" property if "assigned-clocks" are
used.  Add reference to input clock, the parent used in
"assigned-clock-parents" to silence the dtschema warnings:

  arch/arm/boot/dts/exynos3250-artik5-eval.dt.yaml: clock-controller@10030000: 'clocks' is a dependency of 'assigned-clocks'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v2:
1. Use XUSBXTI as real input clock.

Changes since v1:
1. Add clocks property.

This is a v2 for:
https://lore.kernel.org/linux-samsung-soc/20200901101534.GE23793@kozik-lap/T/#me85ac382b847dadbc3f6ebf30e94e70b5df1ebb6
---
 arch/arm/boot/dts/exynos3250-artik5.dtsi | 4 ++++
 arch/arm/boot/dts/exynos3250-monk.dts    | 4 ++++
 arch/arm/boot/dts/exynos3250-rinato.dts  | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250-artik5.dtsi b/arch/arm/boot/dts/exynos3250-artik5.dtsi
index 6c2f320be2f4..12887b3924af 100644
--- a/arch/arm/boot/dts/exynos3250-artik5.dtsi
+++ b/arch/arm/boot/dts/exynos3250-artik5.dtsi
@@ -55,6 +55,10 @@
 	assigned-clock-rates = <6000000>;
 };
 
+&cmu {
+	clocks = <&xusbxti>;
+};
+
 &cpu0 {
 	cpu0-supply = <&buck2_reg>;
 };
diff --git a/arch/arm/boot/dts/exynos3250-monk.dts b/arch/arm/boot/dts/exynos3250-monk.dts
index 9d77a73bc92b..c1a68e612037 100644
--- a/arch/arm/boot/dts/exynos3250-monk.dts
+++ b/arch/arm/boot/dts/exynos3250-monk.dts
@@ -164,6 +164,10 @@
 	status = "okay";
 };
 
+&cmu {
+	clocks = <&xusbxti>;
+};
+
 &cpu0 {
 	cpu0-supply = <&buck2_reg>;
 };
diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot/dts/exynos3250-rinato.dts
index 3df003af0d15..b55afaaa691e 100644
--- a/arch/arm/boot/dts/exynos3250-rinato.dts
+++ b/arch/arm/boot/dts/exynos3250-rinato.dts
@@ -205,6 +205,10 @@
 	status = "okay";
 };
 
+&cmu {
+	clocks = <&xusbxti>;
+};
+
 &cpu0 {
 	cpu0-supply = <&buck2_reg>;
 };
-- 
2.17.1

