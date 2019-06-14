Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6717346D0A
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 15 Jun 2019 01:57:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725981AbfFNX5Z (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 14 Jun 2019 19:57:25 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39954 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbfFNX5Z (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 14 Jun 2019 19:57:25 -0400
Received: by mail-pg1-f194.google.com with SMTP id d30so2378464pgm.7;
        Fri, 14 Jun 2019 16:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q98iyrGWjD0YwRuDYJj8GlFuZI5lhh67IlCxLlcXVmA=;
        b=az4+ReQKjM03dCR9+sthGLa8hV6BEVyYvuQMen+YsB1zbfPZOFNzYKf0GShH4ZCZS+
         P/UQ2GFUHlXbGsNrgtUtha8IXW6yFHeO8kYRq5l4M5Tf3VnsRhKP6t41roofEg183KwJ
         qcVI7Yy/HA05K+92MFGmlZ++5Ei8RYEH7xK5m8rR7k0JYd+OBiQb4gKw2teTgZhNG4gC
         d1JoH2zx9Se0ucEanJre1Xly3wEkE+654I4uDeGthvjNv3PsoI7DtjGzNUn28+Ca4fBW
         ymnKkrmJNHjOMHXuyzVMEh9mHo3eZusiyJd+JGS7RFwyFeGOgS9ayIUTlv2td2c8QwTR
         G2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q98iyrGWjD0YwRuDYJj8GlFuZI5lhh67IlCxLlcXVmA=;
        b=Zp9CbMkmPuVY+sSaqFL6bMFVEb+JQyVxSwPI73mpW5/VNjQ0MmuhrJktMg3xtvcPEx
         /F/2RBIQeSXcihy+TgfzoyIDCzm18eNMrDT/ul+vxeYLR7qj55d6REffiqSDEscjtJso
         1XS2BS/nJD2GxioKgyJKr4AO5aT14ePu6thOnU6oBP4dk6qnfsf0H8kfPlfG70GorIaS
         YUIMiE5WOtZJh+KU562vkXmVGIM0osc7aQ5QSIW2RwDLbeZmkXyP4y4F5sKRxd4fy//l
         wS1J5oCi8HOyE1GOYMjt7UfivxUtRwC9WsIJsqy0gmGJhodSS0IIoJvX/4cTtsjzdH1M
         9NKQ==
X-Gm-Message-State: APjAAAVQxu2pR/tBWxB+rWP6jWpUYlH/an3qPElhU9k579TxlI0u2LAY
        lDNlr52Hey8o+ejwxL3B5hI=
X-Google-Smtp-Source: APXvYqxO5LbnNpF6nCUM1ozAuY8tYMdG9Okq6hVZoCa6Hp0axEd8QmubSP09VeQeaaXyZ4HpN9e32w==
X-Received: by 2002:a62:ee05:: with SMTP id e5mr99169656pfi.117.1560556644477;
        Fri, 14 Jun 2019 16:57:24 -0700 (PDT)
Received: from localhost.localdomain ([162.251.69.147])
        by smtp.gmail.com with ESMTPSA id z13sm3777831pfa.123.2019.06.14.16.57.23
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 16:57:23 -0700 (PDT)
From:   Joseph Kogut <joseph.kogut@gmail.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, kgene@kernel.org,
        krzk@kernel.org
Cc:     airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Joseph Kogut <joseph.kogut@gmail.com>
Subject: [PATCH v2 2/2] arm: dts: add ARM Mali GPU node for Odroid XU3
Date:   Fri, 14 Jun 2019 16:57:19 -0700
Message-Id: <20190614235719.8134-1-joseph.kogut@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190614203144.3850-2-joseph.kogut@gmail.com>
References: <20190614203144.3850-2-joseph.kogut@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add device tree node for mali gpu on Odroid XU3 SoCs.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---

Changes v1 -> v2:
- Use interrupt name ordering from binding doc
- Specify a single clock for GPU node
- Add gpu opp table
- Fix warnings from IRQ_TYPE_NONE

 .../boot/dts/exynos5422-odroidxu3-common.dtsi | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
index 93a48f2dda49..b8a4246e3b37 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
@@ -48,6 +48,32 @@
 		cooling-levels = <0 130 170 230>;
 	};

+	gpu: gpu@11800000 {
+		compatible = "samsung,exynos-mali", "arm,mali-t628";
+		reg = <0x11800000 0x5000>;
+		interrupts = <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 74  IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "job", "mmu", "gpu";
+		clocks = <&clock CLK_G3D>;
+		mali-supply = <&buck4_reg>;
+		operating-points-v2 = <&gpu_opp_table>;
+	};
+
+	gpu_opp_table: gpu-opp-table {
+		compatible = "operating-points-v2";
+
+		opp-177000000 {
+			opp-hz = /bits/ 64 <117000000>;
+			opp-microvolt = <812500>;
+		};
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <1150000>;
+		};
+	};
+
 	thermal-zones {
 		cpu0_thermal: cpu0-thermal {
 			thermal-sensors = <&tmu_cpu0 0>;
--
2.22.0

