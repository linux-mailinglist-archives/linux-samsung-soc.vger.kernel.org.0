Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95788E941
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 29 Apr 2019 19:36:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728898AbfD2Rgb (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 29 Apr 2019 13:36:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:46154 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728839AbfD2Rgb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 29 Apr 2019 13:36:31 -0400
Received: from localhost.localdomain (unknown [194.230.155.114])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 855172087B;
        Mon, 29 Apr 2019 17:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556559391;
        bh=1qN7zw9SX539SvBWVdVLuEUJH8ykSSIFT8r6sWdCtpE=;
        h=From:To:Subject:Date:From;
        b=xW5xTQMHGezt8E4fUbMn4vmYibd5CAf5YIt7Sh0XksUCAbLxjMCjT+6CM2nLL2enj
         l1WPJFIljrV0eCawVQhQGYDO1f8hJ0zZ0XTYBik49/3C29F/Ol85fL5PbDJmooO58D
         enoyOgL4VD4u8CIDvOIy8K6sHLC/3hURWQn3N3UY=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ARM: exynos: Make ARCH_EXYNOS3 a default option
Date:   Mon, 29 Apr 2019 19:36:19 +0200
Message-Id: <20190429173620.5078-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

By default for ARMv7 Exynos platform we select all flavors.  One kernel
image simplifies testing and maintenance.  However Exynos3 was not
selected by default so far (thus it lacked in multi_v7 kernel).

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/mach-exynos/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 1c518b8ee520..21ad78d79d8d 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -49,6 +49,7 @@ config S5P_DEV_MFC
 
 config ARCH_EXYNOS3
 	bool "SAMSUNG EXYNOS3"
+	default y
 	select ARM_CPU_SUSPEND if PM
 	help
 	  Samsung EXYNOS3 (Cortex-A7) SoC based systems
-- 
2.17.1

