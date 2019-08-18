Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9155191855
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 18 Aug 2019 19:28:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbfHRR2B (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 18 Aug 2019 13:28:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:39704 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725786AbfHRR2A (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 18 Aug 2019 13:28:00 -0400
Received: from localhost.localdomain (unknown [194.230.155.124])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A67302146E;
        Sun, 18 Aug 2019 17:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566149279;
        bh=iig6Re8PWJsFt/crrOvV4t6QJEhoY/povqVGZtQWCL8=;
        h=From:To:Subject:Date:From;
        b=xkCa3hC33h5bg5KUuIkrzhe1uCPvM7Tl/5rmvlydeZZ5K8asuzIByBwRVGSLc0I75
         XFDFI6xzc/4Dptm6HwBTdxhmviFC7R0LryBCOuDNdp/qnZTJfCiaGTPBC4GA/NYgZ7
         G+btALSxtO5dpm8uO0FF9jEZnumSpanY166oLTG0=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Kamil Konieczny <k.konieczny@partner.samsung.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Extend patterns for Samsung SoC, Security Subsystem and clock drivers
Date:   Sun, 18 Aug 2019 19:27:50 +0200
Message-Id: <20190818172750.20921-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Extend the patterns to cover all related files in respective
categories:
1. Samsung Exynos ARM architecture: add soc drivers headers and make
   directory matches consistent,
2. Samsung Security SubSystem driver (crypto): add bindings,
3. Samsung SoC clock drivers: add S3C24xx, S3C64xx and S5Pv210 bindings.

Cc: Kukjin Kim <kgene@kernel.org>
Cc: Vladimir Zapolskiy <vz@mleia.com>
Cc: Kamil Konieczny <k.konieczny@partner.samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-crypto@vger.kernel.org
Cc: linux-clk@vger.kernel.org
---
 MAINTAINERS | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 420567d1519a..35a4002ac58b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2199,8 +2199,9 @@ F:	drivers/*/*s3c24*
 F:	drivers/*/*/*s3c24*
 F:	drivers/*/*s3c64xx*
 F:	drivers/*/*s5pv210*
-F:	drivers/memory/samsung/*
-F:	drivers/soc/samsung/*
+F:	drivers/memory/samsung/
+F:	drivers/soc/samsung/
+F:	include/linux/soc/samsung/
 F:	Documentation/arm/samsung/
 F:	Documentation/devicetree/bindings/arm/samsung/
 F:	Documentation/devicetree/bindings/sram/samsung-sram.txt
@@ -14174,6 +14175,8 @@ M:	Kamil Konieczny <k.konieczny@partner.samsung.com>
 L:	linux-crypto@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/crypto/samsung-slimsss.txt
+F:	Documentation/devicetree/bindings/crypto/samsung-sss.txt
 F:	drivers/crypto/s5p-sss.c
 
 SAMSUNG S5P/EXYNOS4 SOC SERIES CAMERA SUBSYSTEM DRIVERS
@@ -14194,6 +14197,8 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git
 F:	drivers/clk/samsung/
 F:	include/dt-bindings/clock/exynos*.h
 F:	Documentation/devicetree/bindings/clock/exynos*.txt
+F:	Documentation/devicetree/bindings/clock/samsung,s3c*
+F:	Documentation/devicetree/bindings/clock/samsung,s5p*
 
 SAMSUNG SPI DRIVERS
 M:	Kukjin Kim <kgene@kernel.org>
-- 
2.17.1

