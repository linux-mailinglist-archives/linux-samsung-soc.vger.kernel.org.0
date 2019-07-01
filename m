Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2D2C4ECB8
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 21 Jun 2019 17:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbfFUP7G (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 21 Jun 2019 11:59:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:43342 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725985AbfFUP7F (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 11:59:05 -0400
Received: from localhost.localdomain (unknown [194.230.155.186])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1C6B521530;
        Fri, 21 Jun 2019 15:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561132744;
        bh=PF+Llwd8yY31nGr5OjUO/cfVQ/SG2UO4HozBGeHxZGg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=hyuAxBtTWarQtz3irOoFgTFHCK2RoT+/OddNkhYJe5jY/Ad+A5UKWqfWW9Un+I/qN
         kij5k3Qx5D6NOUQw19gwyr3+ulnmLl/2yJ/Z22h84fMswspgqdrKDN36bzQBu6a6fw
         AuIURjCZ/2qYOf2+2efQgoEFEQET9G34H8zrZPaM=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Anand Moon <linux.amoon@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] ARM: dts: exynos: Use proper regulator for eMMC memory on Arndale Octa
Date:   Fri, 21 Jun 2019 17:58:45 +0200
Message-Id: <20190621155845.7079-4-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190621155845.7079-1-krzk@kernel.org>
References: <20190621155845.7079-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The eMMC memory is supplied by LDO18 (PVDD_EMMC_1V8) and buck10
(PVDD_EMMCF_2V8), not by LDO10. The LDO10 (PVDD_PRE_1V8) supplies
instead VDDP_MMC pin of eMMC host interface and it is already marked as
always on.

This change only properly models the hardware and reflects in usage of
regulators.  There is no functional change because:
1. LDO18 cannot be turned off (e.g. by lack of consumers) because in
   off mode it is controlled by LDO18EN pin, which is pulled up by
   always-on regulator LDO2 (PVDD_APIO_1V8).
2. LDO10 is marked as always on so removing its consumer will not have
   effect.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. New patch.
---
 arch/arm/boot/dts/exynos5420-arndale-octa.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
index 3126a6c3f842..ac7f2fa0ba22 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -780,7 +780,7 @@
 	samsung,dw-mshc-ddr-timing = <0 2>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus1 &sd0_bus4 &sd0_bus8>;
-	vmmc-supply = <&ldo10_reg>;
+	vmmc-supply = <&ldo18_reg>;
 	vqmmc-supply = <&ldo3_reg>;
 	bus-width = <8>;
 	cap-mmc-highspeed;
-- 
2.17.1

