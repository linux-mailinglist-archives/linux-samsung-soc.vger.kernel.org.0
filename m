Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 976AA23FAC4
	for <lists+linux-samsung-soc@lfdr.de>; Sun,  9 Aug 2020 01:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728589AbgHHXoz (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 8 Aug 2020 19:44:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:53488 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728332AbgHHXjB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 8 Aug 2020 19:39:01 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 160B620748;
        Sat,  8 Aug 2020 23:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596929940;
        bh=drw5bpymsEmzse0AQE94EHwiijtRpGBgXRZNsFvsyBE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NpZCWtnq71kpXJ9iYHfq59ckJG1JzewA3B0h+ZiagwtbXVuENCQGR684Fox9k0d5R
         koO/RvSS0l7uQn+DUx7ulBEUpr/wBoZE9wUQlxmhvcwCpRgLK9nLHIBRLcogi1n8mH
         O47902uCqJdlx0drmF1mdDufD6ufHJbmba3y3JvM=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sasha Levin <sashal@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 12/40] ARM: exynos: MCPM: Restore big.LITTLE cpuidle support
Date:   Sat,  8 Aug 2020 19:38:16 -0400
Message-Id: <20200808233844.3618823-12-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200808233844.3618823-1-sashal@kernel.org>
References: <20200808233844.3618823-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Marek Szyprowski <m.szyprowski@samsung.com>

[ Upstream commit ea9dd8f61c8a890843f68e8dc0062ce78365aab8 ]

Call exynos_cpu_power_up(cpunr) unconditionally. This is needed by the
big.LITTLE cpuidle driver and has no side-effects on other code paths.

The additional soft-reset call during little core power up has been added
to properly boot all cores on the Exynos5422-based boards with secure
firmware (like Odroid XU3/XU4 family). This however broke big.LITTLE
CPUidle driver, which worked only on boards without secure firmware (like
Peach-Pit/Pi Chromebooks). Apply the workaround only when board is
running under secure firmware.

Fixes: 833b5794e330 ("ARM: EXYNOS: reset Little cores when cpu is up")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/mach-exynos/mcpm-exynos.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-exynos/mcpm-exynos.c b/arch/arm/mach-exynos/mcpm-exynos.c
index 9a681b421ae11..cd861c57d5adf 100644
--- a/arch/arm/mach-exynos/mcpm-exynos.c
+++ b/arch/arm/mach-exynos/mcpm-exynos.c
@@ -26,6 +26,7 @@
 #define EXYNOS5420_USE_L2_COMMON_UP_STATE	BIT(30)
 
 static void __iomem *ns_sram_base_addr __ro_after_init;
+static bool secure_firmware __ro_after_init;
 
 /*
  * The common v7_exit_coherency_flush API could not be used because of the
@@ -58,15 +59,16 @@ static void __iomem *ns_sram_base_addr __ro_after_init;
 static int exynos_cpu_powerup(unsigned int cpu, unsigned int cluster)
 {
 	unsigned int cpunr = cpu + (cluster * EXYNOS5420_CPUS_PER_CLUSTER);
+	bool state;
 
 	pr_debug("%s: cpu %u cluster %u\n", __func__, cpu, cluster);
 	if (cpu >= EXYNOS5420_CPUS_PER_CLUSTER ||
 		cluster >= EXYNOS5420_NR_CLUSTERS)
 		return -EINVAL;
 
-	if (!exynos_cpu_power_state(cpunr)) {
-		exynos_cpu_power_up(cpunr);
-
+	state = exynos_cpu_power_state(cpunr);
+	exynos_cpu_power_up(cpunr);
+	if (!state && secure_firmware) {
 		/*
 		 * This assumes the cluster number of the big cores(Cortex A15)
 		 * is 0 and the Little cores(Cortex A7) is 1.
@@ -258,6 +260,8 @@ static int __init exynos_mcpm_init(void)
 		return -ENOMEM;
 	}
 
+	secure_firmware = exynos_secure_firmware_available();
+
 	/*
 	 * To increase the stability of KFC reset we need to program
 	 * the PMU SPARE3 register
-- 
2.25.1

