Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA5E628F85F
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 15 Oct 2020 20:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390717AbgJOSVM (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 15 Oct 2020 14:21:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:56496 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390708AbgJOSVE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 15 Oct 2020 14:21:04 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D89B5221EB;
        Thu, 15 Oct 2020 18:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602786063;
        bh=0BKu3tc82Qa+6P8WYK+BNKslqyUcv6Q0wJ9UoOwV1F4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Dk38Xi0pykYIXFAyWL74mexHFv9PNy/76ISkjLIJrVw507S0Y0n62EfK8hQVxEgTi
         nT6/qITxOt7/Qp20SzH2usQkTapWfELMDMPZJ9Hqyd7QWIxpiTVffaCutjVINt9Z1t
         G3Vr322cHOhJ59SOybt4b3WoaTfffTshgCe0NeY0=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Gabriel Ribba Esteva <gabriel.ribbae@gmail.com>
Subject: [PATCH 4/4] ARM: dts: exynos: disable pull up of USB 3.0 over-current on Odroid XU
Date:   Thu, 15 Oct 2020 20:20:44 +0200
Message-Id: <20201015182044.480562-4-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201015182044.480562-1-krzk@kernel.org>
References: <20201015182044.480562-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The Odroid XU has external pull ups for USB 3.0 over-current pins, so
disable the internal one.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5410-odroidxu.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5410-odroidxu.dts b/arch/arm/boot/dts/exynos5410-odroidxu.dts
index 6cc4d4653f84..27f079d33eb1 100644
--- a/arch/arm/boot/dts/exynos5410-odroidxu.dts
+++ b/arch/arm/boot/dts/exynos5410-odroidxu.dts
@@ -638,6 +638,16 @@ &tmu_cpu3 {
 	vtmu-supply = <&ldo10_reg>;
 };
 
+&usb3_0_oc {
+	/* External pull up */
+	samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+};
+
+&usb3_1_oc {
+	/* External pull up */
+	samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+};
+
 &usbdrd_dwc3_0 {
 	dr_mode = "peripheral";
 };
-- 
2.25.1

