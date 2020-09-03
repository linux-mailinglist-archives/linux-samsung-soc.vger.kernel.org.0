Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 634E125C893
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  3 Sep 2020 20:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728885AbgICSOh (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 3 Sep 2020 14:14:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:39210 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726990AbgICSOf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Sep 2020 14:14:35 -0400
Received: from localhost.localdomain (unknown [194.230.155.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4FEA320C09;
        Thu,  3 Sep 2020 18:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599156875;
        bh=FoUFinhB1+X7U1QOSldU/PcpF+RkPzZ476IfXOyA2hc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=p9gNwrUnZBxucQ7PrQ2ML/qTAR3bT3Wj6iTU2i76+2Z5GeIFUpEkQXViYYB/azjMh
         No+tMNFREwI8kHmUa1nu2ZFKEKXiquCWGGotUumTsOF1lJ2/hG7BywXxv8YjrLksmN
         V10jSMLh9UrG+jn4IOtx00y6jpVTiv/QkwoI+8J0=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH v2 2/3] ARM: dts: exynos: Add assigned clock parent to CMU in Exynos4412 Odroid
Date:   Thu,  3 Sep 2020 20:14:24 +0200
Message-Id: <20200903181425.5015-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200903181425.5015-1-krzk@kernel.org>
References: <20200903181425.5015-1-krzk@kernel.org>
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
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index ca3c78e0966c..9375df064076 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -120,6 +120,7 @@
 };
 
 &clock {
+	clocks = <&clock CLK_FOUT_EPLL>;
 	assigned-clocks = <&clock CLK_FOUT_EPLL>;
 	assigned-clock-rates = <45158401>;
 };
-- 
2.17.1

