Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C90D746957
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 14 Jun 2019 22:33:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbfFNUbz (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 14 Jun 2019 16:31:55 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45392 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbfFNUbz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 14 Jun 2019 16:31:55 -0400
Received: by mail-pf1-f196.google.com with SMTP id r1so2074385pfq.12;
        Fri, 14 Jun 2019 13:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AtSiqk5nC9LJRg1jpcdANXdpq0IBjpFzpPAT20QKwLs=;
        b=D9Zi0GLfXAxnK/1KAzAoqvnxrpDfxQcd8uc+ubVdKQ8OWuZFEibKd2qRjzla+7IFNS
         Q0jYmMOKetE6GkCPQSOh1Px3ZltrpfqKqD4nw/byc6+q4sDy9zWbPkXB0jfy0q1IshZt
         Dbvv2CUtzxO24ht5eBCHUlSqX9cW/hndKnXLLRKl9o1rfIhaYqDAKrmASX1w2High6cv
         hLJzPEwnHLsK2w2GSL7UIwCthVhtCjb6QXAjl2/SUr9wfuPN9ga76ohI6viKZpEdzCL0
         L7J5XP/W+JurJSnwUPDddLZE7080G/vEk45SeYWimus+OdZg/7hvF2Ukr//3/uHwM3WZ
         zerA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AtSiqk5nC9LJRg1jpcdANXdpq0IBjpFzpPAT20QKwLs=;
        b=Uyv/e/fmNh13PNiuRhxIV3nk+GF7KPWOQOC+9aiduViLbAIIO+9gyVnwp9NYoT6TY0
         wpCFs4FtLsNzNj1mwCbJh1DNGtzHDE9DCYs2sfEbqEA/Ra6g8/ZQ1kQeb9p+jbKtbXu+
         vL/ObQr0xEamEM242ocOvsHCRclS3gytJLX1RfWzBp14alG1A04xnbWvcrkSBnchsgdJ
         YgLZgw8eivFh1ZhkTm9004kiDF3TADu9dMvsL2zPiB5yclQhtVHoy/09pnQ8rSVqeFVV
         J3kk6FWzdrhSssUOzruttO/dZ1/b+x7/IYokoY4E2WMkOwg8k8AYKIFC4d49R9lRy9pA
         9hzA==
X-Gm-Message-State: APjAAAXjGg5Dlt0L70+GcwJmtfIw4qxbeheZCspNi5nXQxrCY3yuFlVN
        Z12GVo1murTKPPw/iPbupTI=
X-Google-Smtp-Source: APXvYqzGVKsRY/HKe8P6drib97plaMeKe2fpFoiPvoa234LjxzhsrXYVgV3vx4vgJagc9QCCwyR/rA==
X-Received: by 2002:a17:90a:b00b:: with SMTP id x11mr13055151pjq.120.1560544314155;
        Fri, 14 Jun 2019 13:31:54 -0700 (PDT)
Received: from localhost.localdomain ([162.251.69.147])
        by smtp.gmail.com with ESMTPSA id 188sm5189016pfe.30.2019.06.14.13.31.52
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 13:31:53 -0700 (PDT)
From:   Joseph Kogut <joseph.kogut@gmail.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, kgene@kernel.org,
        krzk@kernel.org
Cc:     airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Joseph Kogut <joseph.kogut@gmail.com>
Subject: [PATCH 2/2] arm: dts: add ARM Mali GPU node for Odroid XU3
Date:   Fri, 14 Jun 2019 13:31:44 -0700
Message-Id: <20190614203144.3850-2-joseph.kogut@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190614203144.3850-1-joseph.kogut@gmail.com>
References: <20190614203144.3850-1-joseph.kogut@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add device tree node for mali gpu on Odroid XU3 SoCs.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 .../boot/dts/exynos5422-odroidxu3-common.dtsi  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
index 93a48f2dda49..1f2ae19d01af 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
@@ -48,6 +48,24 @@
 		cooling-levels = <0 130 170 230>;
 	};
 
+	gpu: gpu@11800000 {
+		compatible = "samsung,exynos-mali", "arm,mali-t628";
+		reg = <0x11800000 0x5000>;
+		interrupts = <0 117 0>,
+			     <0 219 0>,
+			     <0 74  0>;
+		interrupt-names = "gpu", "job", "mmu";
+		clocks = <&clock CLK_G3D>,
+			 <&clock CLK_DOUT_ACLK_G3D>,
+			 <&clock CLK_FOUT_VPLL>;
+		mali-supply = <&buck4_reg>;
+		operating-points = <
+			/* KHz  uV   */
+			600000  1150000
+			177000  812500
+		>;
+	};
+
 	thermal-zones {
 		cpu0_thermal: cpu0-thermal {
 			thermal-sensors = <&tmu_cpu0 0>;
-- 
2.22.0

