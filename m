Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ABBB2604B1
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  7 Sep 2020 20:34:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729654AbgIGSeJ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 7 Sep 2020 14:34:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:41520 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730226AbgIGSdy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Sep 2020 14:33:54 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E0FA72087D;
        Mon,  7 Sep 2020 18:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599503634;
        bh=t266Nu1lB7LStASkQx6vx6QrRbEc2k7w1JLEvAlzAJc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DUBHzOWIgCRdcU0dSwV3do+czaKmzBjG/mqhWRLUmK5mQkpZdrxYisfCl2NN/sRWf
         v9Q4apQPRU2UhKc3dwOO7KbfQtnBY8IFUywDR8798XNegaf0770XfhU6Z8Pagitg8i
         KJQPGkxPXp3CiH0aK0F3vGuaiGYsbVwX3gVZyPFA=
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
Subject: [PATCH 10/11] ARM: dts: s3c24xx: add address to CPU node
Date:   Mon,  7 Sep 2020 20:33:12 +0200
Message-Id: <20200907183313.29234-11-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200907183313.29234-1-krzk@kernel.org>
References: <20200907183313.29234-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The CPU nodes should be described as children of "cpus" bus node with
appropriate "reg" properties:

  cpus: '#address-cells' is a required property
  cpus: '#size-cells' is a required property
  cpu: 'device_type' is a required property
  cpu: 'reg' is a required property

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/s3c2416.dtsi | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/s3c2416.dtsi b/arch/arm/boot/dts/s3c2416.dtsi
index d1dec9f52f69..4f084f4fe44f 100644
--- a/arch/arm/boot/dts/s3c2416.dtsi
+++ b/arch/arm/boot/dts/s3c2416.dtsi
@@ -18,8 +18,13 @@
 	};
 
 	cpus {
-		cpu {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
 			compatible = "arm,arm926ej-s";
+			reg = <0x0>;
 		};
 	};
 
-- 
2.17.1

