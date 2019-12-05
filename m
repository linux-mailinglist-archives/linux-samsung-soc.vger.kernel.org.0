Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD381147E5
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  5 Dec 2019 21:00:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729656AbfLEUAO (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 5 Dec 2019 15:00:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:36722 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729632AbfLEUAO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Dec 2019 15:00:14 -0500
Received: from localhost.localdomain (unknown [194.230.155.234])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D187224670;
        Thu,  5 Dec 2019 20:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575576013;
        bh=rqMWnns6lhszBfCz46NO49QQ35oB1L0mfuooUiga/ow=;
        h=From:To:Subject:Date:From;
        b=jrOvRfxGmHBT0rouyjK6iV3sHT/UR9SNVCiKTLjeC86rGy37hqks1vdXk6DB9/iCq
         5uEGDt0XfmedBwhHykDOrpdNHA0pOJMKyJAQNS9d/8OV0ghvCHsCbgO7RpWga5hQ+C
         iM2ogEv5KqDS2T8F9QTU/QvdNTKAXczNlAIkgeJI=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Lukasz Luba <l.luba@partner.samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: exynos_defconfig: Bring back explicitly wanted options
Date:   Thu,  5 Dec 2019 21:00:06 +0100
Message-Id: <20191205200006.5164-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Few options KALLSYMS_ALL, SCSI, PM_DEVFREQ and mutex/spinlock debugging
were removed with savedefconfig because they were selected by other
options.  However these are user-visible options and they might not be
selected in the future.  Exactly this happened with commit 0e4a459f56c3
("tracing: Remove unnecessary DEBUG_FS dependency") removing the
dependency between DEBUG_FS and TRACING.

To avoid losing these options in the future, explicitly mention them in
defconfig.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/configs/exynos_defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index e7e4bb5ad8d5..026407101cf2 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -38,6 +38,7 @@ CONFIG_CRYPTO_SHA256_ARM=m
 CONFIG_CRYPTO_SHA512_ARM=m
 CONFIG_CRYPTO_AES_ARM_BS=m
 CONFIG_CRYPTO_CHACHA20_NEON=m
+CONFIG_KALLSYMS_ALL=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_PARTITION_ADVANCED=y
@@ -92,6 +93,7 @@ CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_CRYPTOLOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=8192
+CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_CHR_DEV_SG=y
 CONFIG_ATA=y
@@ -291,6 +293,7 @@ CONFIG_CROS_EC_SPI=y
 CONFIG_COMMON_CLK_MAX77686=y
 CONFIG_COMMON_CLK_S2MPS11=y
 CONFIG_EXYNOS_IOMMU=y
+CONFIG_PM_DEVFREQ=y
 CONFIG_DEVFREQ_GOV_PERFORMANCE=y
 CONFIG_DEVFREQ_GOV_POWERSAVE=y
 CONFIG_DEVFREQ_GOV_USERSPACE=y
@@ -355,4 +358,7 @@ CONFIG_SOFTLOCKUP_DETECTOR=y
 # CONFIG_DETECT_HUNG_TASK is not set
 CONFIG_PROVE_LOCKING=y
 CONFIG_DEBUG_ATOMIC_SLEEP=y
+CONFIG_DEBUG_RT_MUTEXES=y
+CONFIG_DEBUG_SPINLOCK=y
+CONFIG_DEBUG_MUTEXES=y
 CONFIG_DEBUG_USER=y
-- 
2.17.1

