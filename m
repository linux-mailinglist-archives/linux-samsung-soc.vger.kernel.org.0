Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD4B25C93F
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  3 Sep 2020 21:15:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729393AbgICTPD (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 3 Sep 2020 15:15:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:36232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729371AbgICTPC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Sep 2020 15:15:02 -0400
Received: from localhost.localdomain (unknown [194.230.155.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E348020DD4;
        Thu,  3 Sep 2020 19:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599160501;
        bh=IVFnr/w8qzpikNYZme0KyM2gXhCf6WEzWZ9gUTCRq8Q=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=EJSstaUSaVq067mlnHyLCPe1lQiAd9/60P4Af6ExT5BYaoK1vA4paLS5ti8l+6wUH
         CHnVgnuRofbiPGV4H8hVYoIk4Eyz2L6CZgLe8ewPc3KFTZfl545+inMQjppsNh1/86
         OmjgYq7VppbLTdWiDXzEzl02o+HT/OBNb1aPTWuU=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Inki Dae <inki.dae@samsung.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 6/6] arm64: dts: exynos: Align OPP table name with dt-schema
Date:   Thu,  3 Sep 2020 21:14:38 +0200
Message-Id: <20200903191438.12781-6-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200903191438.12781-1-krzk@kernel.org>
References: <20200903191438.12781-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Device tree nodes should have hyphens instead of underscores.  This is
also expected by the bindings.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. New patch
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index b2eebdd88c3c..9651bb9fdadc 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -1087,7 +1087,7 @@
 			operating-points-v2 = <&gpu_opp_table>;
 			status = "disabled";
 
-			gpu_opp_table: opp_table {
+			gpu_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
 				opp-160000000 {
-- 
2.17.1

