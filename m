Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBD57235A89
	for <lists+linux-samsung-soc@lfdr.de>; Sun,  2 Aug 2020 22:36:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726058AbgHBUgL (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 2 Aug 2020 16:36:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:55860 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725925AbgHBUgL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 2 Aug 2020 16:36:11 -0400
Received: from localhost.localdomain (unknown [194.230.155.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D79CC20722;
        Sun,  2 Aug 2020 20:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596400571;
        bh=BQ+dzz0/RbU56sb1Yo1q2mdEO2kai1wfHmpYJJz77WI=;
        h=From:To:Subject:Date:From;
        b=uUwuyNfOoIgk9OWczmE8sU8ApXy8yOiVT/ZukA56DkAvM2k8Xqqdxy/C+eOeEO3FC
         44HmbAA9BSMJymAS5BoG9BN+9qwOSdQB8oOM/XEhd20wk8S1PgjOkbB5MhlIXyDokc
         e4RMAfC0C57GgkplNVz0e9RL8ye7ThiBfl93j97s=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: s3c24xx: demote kerneldoc comment
Date:   Sun,  2 Aug 2020 22:36:05 +0200
Message-Id: <20200802203605.15125-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Remove kerneldoc annotation to fix warning:

    arch/arm/mach-s3c24xx/mach-h1940.c:185: warning:
        cannot understand function prototype: 'struct s3c2410fb_display h1940_lcd __initdata = '

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/mach-s3c24xx/mach-h1940.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/mach-h1940.c b/arch/arm/mach-s3c24xx/mach-h1940.c
index 89528bea89f1..c09f61d35d57 100644
--- a/arch/arm/mach-s3c24xx/mach-h1940.c
+++ b/arch/arm/mach-s3c24xx/mach-h1940.c
@@ -179,9 +179,9 @@ static struct s3c2410_ts_mach_info h1940_ts_cfg __initdata = {
 		.cfg_gpio = s3c24xx_ts_cfg_gpio,
 };
 
-/**
+/*
  * Set lcd on or off
- **/
+ */
 static struct s3c2410fb_display h1940_lcd __initdata = {
 	.lcdcon5=	S3C2410_LCDCON5_FRM565 | \
 			S3C2410_LCDCON5_INVVLINE | \
-- 
2.17.1

