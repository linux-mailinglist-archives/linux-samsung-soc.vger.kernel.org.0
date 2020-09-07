Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7D162604BE
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  7 Sep 2020 20:34:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730327AbgIGSek (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 7 Sep 2020 14:34:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:40906 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729049AbgIGSd3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Sep 2020 14:33:29 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9BA5F2137B;
        Mon,  7 Sep 2020 18:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599503608;
        bh=auu6XZN7jeuxk8EV2MxP/OlkX3oF50dJlcBz0GheMQo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fFmuTzeBy+USZjTsBiMvfWKHd+lOqTo3rVK5Z8SdYMTgLv4Zg/Ub7YdsdY/f+DZmJ
         qqxqCC304jgmSv6cU/JfiHS4EIMVHQ78xr+rx7zEwo/pEsIbaDYJx5+wh94jePhTHH
         DKRo2xQR1VBM8pl+qlw1g9l4X5BhOlsdiwk4AbCg=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lihua Yao <ylhuajnu@outlook.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH 01/11] ARM: dts: s5pv210: Correct ethernet unit address in SMDKV210
Date:   Mon,  7 Sep 2020 20:33:03 +0200
Message-Id: <20200907183313.29234-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200907183313.29234-1-krzk@kernel.org>
References: <20200907183313.29234-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The SROM bank 5 is at address 0xa8000000, just like the one put in "reg"
property of ethernet node.  Fix the unit address of ethernet node.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/s5pv210-smdkv210.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/s5pv210-smdkv210.dts b/arch/arm/boot/dts/s5pv210-smdkv210.dts
index 1e1570d66d89..7459e41e8ef1 100644
--- a/arch/arm/boot/dts/s5pv210-smdkv210.dts
+++ b/arch/arm/boot/dts/s5pv210-smdkv210.dts
@@ -39,7 +39,7 @@
 		clock-frequency = <32768>;
 	};
 
-	ethernet@18000000 {
+	ethernet@a8000000 {
 		compatible = "davicom,dm9000";
 		reg = <0xA8000000 0x2 0xA8000002 0x2>;
 		interrupt-parent = <&gph1>;
-- 
2.17.1

