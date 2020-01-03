Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 825B112FB46
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  3 Jan 2020 18:12:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728248AbgACRMZ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 3 Jan 2020 12:12:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:47012 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728241AbgACRMZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Jan 2020 12:12:25 -0500
Received: from localhost.localdomain (unknown [194.230.155.149])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3F3F3215A4;
        Fri,  3 Jan 2020 17:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578071544;
        bh=cCjYxGd/KL0FWzSgniFPKokn3dk8mcXrfNpZVsyTpT8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=xA6XHN2nVnw918Eoyu0EvDCapCnFRnn9DNly7Hg4+bvZxxcS6oz4MVzfw40I78S5b
         K5RRhw6EvVLEE+nGE1ASRRG2RGXMPKtOQM7/0coDIShOz6w0bP0AL7Pj6jEW2P7zPw
         UoMDOpqa9XMD6O0JTv7XCoUMLqkYx/Ha8d9IQShE=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 08/19] memory: samsung: Rename Exynos to lowercase
Date:   Fri,  3 Jan 2020 18:11:20 +0100
Message-Id: <20200103171131.9900-9-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200103171131.9900-1-krzk@kernel.org>
References: <20200103171131.9900-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Fix up inconsistent usage of upper and lowercase letters in "Exynos"
name.

"EXYNOS" is not an abbreviation but a regular trademarked name.
Therefore it should be written with lowercase letters starting with
capital letter.

The lowercase "Exynos" name is promoted by its manufacturer Samsung
Electronics Co., Ltd., in advertisement materials and on website.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/memory/samsung/Kconfig       | 2 +-
 drivers/memory/samsung/exynos-srom.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/samsung/Kconfig b/drivers/memory/samsung/Kconfig
index e9c3ce92350c..20a8406ce786 100644
--- a/drivers/memory/samsung/Kconfig
+++ b/drivers/memory/samsung/Kconfig
@@ -8,7 +8,7 @@ config SAMSUNG_MC
 if SAMSUNG_MC
 
 config EXYNOS5422_DMC
-	tristate "EXYNOS5422 Dynamic Memory Controller driver"
+	tristate "Exynos5422 Dynamic Memory Controller driver"
 	depends on ARCH_EXYNOS || (COMPILE_TEST && HAS_IOMEM)
 	select DDR
 	depends on DEVFREQ_GOV_SIMPLE_ONDEMAND
diff --git a/drivers/memory/samsung/exynos-srom.c b/drivers/memory/samsung/exynos-srom.c
index c27c6105c66d..6510d7bab217 100644
--- a/drivers/memory/samsung/exynos-srom.c
+++ b/drivers/memory/samsung/exynos-srom.c
@@ -3,7 +3,7 @@
 // Copyright (c) 2015 Samsung Electronics Co., Ltd.
 //	      http://www.samsung.com/
 //
-// EXYNOS - SROM Controller support
+// Exynos - SROM Controller support
 // Author: Pankaj Dubey <pankaj.dubey@samsung.com>
 
 #include <linux/io.h>
-- 
2.17.1

