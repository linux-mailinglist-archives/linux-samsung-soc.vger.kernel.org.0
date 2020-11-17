Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7B7F2B6FCB
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 17 Nov 2020 21:11:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731741AbgKQULX (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 17 Nov 2020 15:11:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:35884 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731721AbgKQULP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 17 Nov 2020 15:11:15 -0500
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4ADB3204EC;
        Tue, 17 Nov 2020 20:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605643874;
        bh=/BIi5USoleXpeeAMw2wZWs+YFBvlFqf0DQJMUrsJay8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=E1ByeXDS7weqFEb1sGD50W0UkJRJLWuiM3VlEgP3FrVRzjOZCkddz/BGGV218mPjh
         AVN1ah9WBuX20CF6E23g5/Wi93M6v1+tHedppQmjq+IoxuCkcoUIaxF5D7Th2fkCVn
         XnXVT+iDG7V7XqjjLM3bZhd99SNcxZqnrmTMJI4o=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] ARM: dts: s3c24xx: add SMDK2416 board compatible
Date:   Tue, 17 Nov 2020 21:11:05 +0100
Message-Id: <20201117201106.128813-3-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201117201106.128813-1-krzk@kernel.org>
References: <20201117201106.128813-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add a compatible for SMDK2416 board next to the SoC compatible.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/s3c2416-smdk2416.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/s3c2416-smdk2416.dts b/arch/arm/boot/dts/s3c2416-smdk2416.dts
index 47626ede6fdd..e7c379a9842e 100644
--- a/arch/arm/boot/dts/s3c2416-smdk2416.dts
+++ b/arch/arm/boot/dts/s3c2416-smdk2416.dts
@@ -10,7 +10,7 @@
 
 / {
 	model = "SMDK2416";
-	compatible = "samsung,s3c2416";
+	compatible = "samsung,smdk2416", "samsung,s3c2416";
 
 	memory@30000000 {
 		device_type = "memory";
-- 
2.25.1

