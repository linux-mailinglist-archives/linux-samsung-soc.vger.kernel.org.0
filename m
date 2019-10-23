Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48173E1F7C
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 23 Oct 2019 17:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406780AbfJWPij (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 23 Oct 2019 11:38:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:36714 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406692AbfJWPii (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 23 Oct 2019 11:38:38 -0400
Received: from localhost.localdomain (unknown [194.230.155.217])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 98BAC21A4C;
        Wed, 23 Oct 2019 15:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571845117;
        bh=bM/mEFcrlLuEZp0P1EMlHoIbnorgdXnXqaEVenoUobo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LFIe6aUM5wa79Oq3zx51FbUaTsKJLxlsXTmgfOYoBNi3ZXfGUQYka3xC8T0jZwAxb
         vR3WlTWia7oj09i6auE3vk7sqbYzwjIv526kXHicgl0jR7zV4cqj3AM0YNYpAc0bsq
         n9CEB1VIcKbzOy1iRM/Z/ni1Mv/rUbHLiZED8eW0=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 2/2] ARM: s3c: Rename s5p_usb_phy functions
Date:   Wed, 23 Oct 2019 17:38:24 +0200
Message-Id: <20191023153824.6085-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023153824.6085-1-krzk@kernel.org>
References: <20191023153824.6085-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The name s5p_usb_phy_init() suggests it is shared with S5Pv210 platform,
but it is not.  It is specific to S3C64xx, so make it clear in the
name.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/mach-s3c64xx/setup-usb-phy.c        | 4 ++--
 arch/arm/plat-samsung/devs.c                 | 4 ++--
 arch/arm/plat-samsung/include/plat/usb-phy.h | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/setup-usb-phy.c b/arch/arm/mach-s3c64xx/setup-usb-phy.c
index 6aaaa1d8e8b9..d6b0e3b268af 100644
--- a/arch/arm/mach-s3c64xx/setup-usb-phy.c
+++ b/arch/arm/mach-s3c64xx/setup-usb-phy.c
@@ -73,7 +73,7 @@ static int s3c_usb_otgphy_exit(struct platform_device *pdev)
 	return 0;
 }
 
-int s5p_usb_phy_init(struct platform_device *pdev, int type)
+int s3c_usb_phy_init(struct platform_device *pdev, int type)
 {
 	if (type == USB_PHY_TYPE_DEVICE)
 		return s3c_usb_otgphy_init(pdev);
@@ -81,7 +81,7 @@ int s5p_usb_phy_init(struct platform_device *pdev, int type)
 	return -EINVAL;
 }
 
-int s5p_usb_phy_exit(struct platform_device *pdev, int type)
+int s3c_usb_phy_exit(struct platform_device *pdev, int type)
 {
 	if (type == USB_PHY_TYPE_DEVICE)
 		return s3c_usb_otgphy_exit(pdev);
diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
index 1d1fa068d228..1602f6dc900b 100644
--- a/arch/arm/plat-samsung/devs.c
+++ b/arch/arm/plat-samsung/devs.c
@@ -1010,9 +1010,9 @@ void __init dwc2_hsotg_set_platdata(struct dwc2_hsotg_plat *pd)
 	npd = s3c_set_platdata(pd, sizeof(*npd), &s3c_device_usb_hsotg);
 
 	if (!npd->phy_init)
-		npd->phy_init = s5p_usb_phy_init;
+		npd->phy_init = s3c_usb_phy_init;
 	if (!npd->phy_exit)
-		npd->phy_exit = s5p_usb_phy_exit;
+		npd->phy_exit = s3c_usb_phy_exit;
 }
 #endif /* CONFIG_S3C_DEV_USB_HSOTG */
 
diff --git a/arch/arm/plat-samsung/include/plat/usb-phy.h b/arch/arm/plat-samsung/include/plat/usb-phy.h
index 94da89ecbd3b..759d66a0773a 100644
--- a/arch/arm/plat-samsung/include/plat/usb-phy.h
+++ b/arch/arm/plat-samsung/include/plat/usb-phy.h
@@ -7,7 +7,7 @@
 #ifndef __PLAT_SAMSUNG_USB_PHY_H
 #define __PLAT_SAMSUNG_USB_PHY_H __FILE__
 
-extern int s5p_usb_phy_init(struct platform_device *pdev, int type);
-extern int s5p_usb_phy_exit(struct platform_device *pdev, int type);
+extern int s3c_usb_phy_init(struct platform_device *pdev, int type);
+extern int s3c_usb_phy_exit(struct platform_device *pdev, int type);
 
 #endif /* __PLAT_SAMSUNG_USB_PHY_H */
-- 
2.17.1

