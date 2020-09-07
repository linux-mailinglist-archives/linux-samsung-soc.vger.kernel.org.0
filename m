Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FA6E2604B7
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  7 Sep 2020 20:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729463AbgIGSdm (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 7 Sep 2020 14:33:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:41076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729371AbgIGSdk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Sep 2020 14:33:40 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 48C522087D;
        Mon,  7 Sep 2020 18:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599503619;
        bh=s0flrS3T7iHEQZPLLbZNxQAS1/ObOpRmsE3khQgaTCQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ctpz+j1nJ7LaJQNoTLyEz9rqwr5xi2gzDyVSSOjC+E8K0PoJmjXn1zhUuXL6q0Ugn
         E85aqCmpGzNx3HA/LGmOUEVGAMHVShXclAT+vto16Oin1hSMxHSrIXDNdPTVSmI837
         qwlorB8yeviwPXzeag9b7nPOUhnywxl72QSVTPRE=
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
Subject: [PATCH 05/11] ARM: dts: s3c6410: align node SROM bus node name with dtschema in SMDK6410
Date:   Mon,  7 Sep 2020 20:33:07 +0200
Message-Id: <20200907183313.29234-6-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200907183313.29234-1-krzk@kernel.org>
References: <20200907183313.29234-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The SROM controller is modeled with a bus so align the device node name
with dtschema to fix warning:

  srom-cs1@18000000: $nodename:0: 'srom-cs1@18000000'
    does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/s3c6410-smdk6410.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/s3c6410-smdk6410.dts b/arch/arm/boot/dts/s3c6410-smdk6410.dts
index 74379061a11a..69c9ec4cf381 100644
--- a/arch/arm/boot/dts/s3c6410-smdk6410.dts
+++ b/arch/arm/boot/dts/s3c6410-smdk6410.dts
@@ -42,7 +42,7 @@
 		#clock-cells = <0>;
 	};
 
-	srom-cs1@18000000 {
+	srom-cs1-bus@18000000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.17.1

