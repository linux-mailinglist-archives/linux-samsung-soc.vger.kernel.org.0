Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7EC74AAD5
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 18 Jun 2019 21:06:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730650AbfFRTGl (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 18 Jun 2019 15:06:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:41640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730196AbfFRTGl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 15:06:41 -0400
Received: from localhost.localdomain (unknown [194.230.155.186])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4296B215EA;
        Tue, 18 Jun 2019 19:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560884800;
        bh=8Pg1RVM5aZ3oBKkDdus18bslAtYlcoTCIBdsEfOp1J8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Vk8uLH50kEOnB6d+lSctcgXbT/0T5J440YyatXboLJSV1EBGNGlMnCIzatFDPkfmV
         Eeyxb5SHQYUwqqOAvh9A/ZEVR+9/m/lhzp+bWeU0OBIzSGtjK8zVj8XfOcR58ibPUY
         uqK940pnUfzEPj6JfiIL4HZohgjI/JcKeSOuSXh0=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kukjin Kim <kgene@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Olof Johansson <olof@lixom.net>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     Joseph Kogut <joseph.kogut@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RFT 10/10] arm64: defconfig: Enable Panfrost driver
Date:   Tue, 18 Jun 2019 21:05:34 +0200
Message-Id: <20190618190534.4951-11-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190618190534.4951-1-krzk@kernel.org>
References: <20190618190534.4951-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Enable support for Mali GPU with Panfrost driver, e.g. for Exynos5433
and Exynos7 (having Mali T760).

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6b4f5cf23324..972b17239f13 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -517,6 +517,7 @@ CONFIG_DRM_HISI_HIBMC=m
 CONFIG_DRM_HISI_KIRIN=m
 CONFIG_DRM_MESON=m
 CONFIG_DRM_PL111=m
+CONFIG_DRM_PANFROST=m
 CONFIG_FB=y
 CONFIG_FB_MODE_HELPERS=y
 CONFIG_BACKLIGHT_GENERIC=m
@@ -717,7 +718,6 @@ CONFIG_ARCH_TEGRA_194_SOC=y
 CONFIG_ARCH_K3_AM6_SOC=y
 CONFIG_SOC_TI=y
 CONFIG_TI_SCI_PM_DOMAINS=y
-CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
 CONFIG_EXTCON_USB_GPIO=y
 CONFIG_EXTCON_USBC_CROS_EC=y
 CONFIG_MEMORY=y
-- 
2.17.1

