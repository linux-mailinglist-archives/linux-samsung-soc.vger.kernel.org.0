Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 021B629C3F0
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 27 Oct 2020 18:51:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2901484AbgJ0OX4 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 27 Oct 2020 10:23:56 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:60775 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2895604AbgJ0OXy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 27 Oct 2020 10:23:54 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201027142342euoutp02c33daa20b5e28194905ee7e72fae903f~B33H0yK2k2797327973euoutp02p
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Oct 2020 14:23:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201027142342euoutp02c33daa20b5e28194905ee7e72fae903f~B33H0yK2k2797327973euoutp02p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1603808622;
        bh=ucA7jhPwAZxi6baZIF7kxSy27Ok9a4Itdk82Az5bvjM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=o2Hv1AGAO2Nu71DUl8xYD9XtCDSbXwZoLgC9FaeMTc8uuzyirQDNqLutuCfeKzjfN
         8INe1+rr0hv1ja7JyPlU/L5yiAdv7YUAz2+4r7E7P+EIJF/NGW7lY+ih+KEiZzfrHC
         WMdH6cZSqthnfu7eTmU6EnDdYSWrDFrg5VUbx1Is=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201027142342eucas1p10e468b14a3bac1531800b3200cfec2e6~B33HmxTdS1107111071eucas1p1p;
        Tue, 27 Oct 2020 14:23:42 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id F1.7A.06318.E6D289F5; Tue, 27
        Oct 2020 14:23:42 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201027142342eucas1p18136ba60377ee2985b6bc123908a3c98~B33HSGuUk1105111051eucas1p1r;
        Tue, 27 Oct 2020 14:23:42 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201027142342eusmtrp12b448ffd40b81de1697addfb77cf0e99~B33HRkx921905119051eusmtrp1D;
        Tue, 27 Oct 2020 14:23:42 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-7c-5f982d6e138f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id CD.70.06017.E6D289F5; Tue, 27
        Oct 2020 14:23:42 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201027142341eusmtip28feb2419c77497a688382db4d2886ac4~B33G-p6yb2982029820eusmtip2e;
        Tue, 27 Oct 2020 14:23:41 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 3/3] ARM: dts: exynos: Enable BlueTooth support for Midas
 board family
Date:   Tue, 27 Oct 2020 15:23:30 +0100
Message-Id: <20201027142330.5121-3-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201027142330.5121-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFIsWRmVeSWpSXmKPExsWy7djP87p5ujPiDe4/U7TYOGM9q8X1L89Z
        Lc6f38BuMeP8PiaLtUfusjuwemxa1cnm0bdlFaPH501yAcxRXDYpqTmZZalF+nYJXBlnPvSx
        Flzmqdj0aDlTA+Nuri5GTg4JAROJxiX/2boYuTiEBFYwSkzYN40ZwvnCKDH903QmCOczo8SB
        vuvsMC3TF79kgUgsZ5TYNHsLK1zLlYnfWEGq2AQMJbredrGB2CICqhKf2xawgxQxC2xjlHi9
        YCbYKGGBCIm3nSvAbBagogfbroM18ArYSFxedAVqnbzE6g0HmEFsTgFbib0XroFtkxC4zCZx
        aMsSqCIXicYnG1kgbGGJV8e3QMVlJE5P7mGBaGhmlHh4bi07hNPDKHG5aQYjRJW1xJ1zv4BW
        cwDdpymxfpc+RNhRYsaan6wgYQkBPokbbwVBwsxA5qRt05khwrwSHW1CENVqErOOr4Nbe/DC
        JWYI20PiyrSt0ECdwChxY/VppgmM8rMQli1gZFzFKJ5aWpybnlpsnJdarlecmFtcmpeul5yf
        u4kRmAJO/zv+dQfjvj9JhxgFOBiVeHhvKMyIF2JNLCuuzD3EKMHBrCTC63T2dJwQb0piZVVq
        UX58UWlOavEhRmkOFiVxXuNFL2OFBNITS1KzU1MLUotgskwcnFINjObZRxSsf2SdfH5cfrMp
        k6n5t/hAzjXcu2WXiz36yjaz93rY43kmTx2PVd+atbneP/JVYYiIFmu5xM3wIKfXiqHy7y4E
        3p1+7oSI4yqmeJcfVxZtyeb91mwqvVX9m7/t+/8mWS3XBC83HZ72xZZpabTA9VXPb+0Lj7Zy
        3HhX1a61b6bZGVurw0osxRmJhlrMRcWJAPQ3DU/9AgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFLMWRmVeSWpSXmKPExsVy+t/xe7p5ujPiDe6u4bfYOGM9q8X1L89Z
        Lc6f38BuMeP8PiaLtUfusjuwemxa1cnm0bdlFaPH501yAcxRejZF+aUlqQoZ+cUltkrRhhZG
        eoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehlnPvSxFlzmqdj0aDlTA+Nuri5GTg4J
        AROJ6YtfsnQxcnEICSxllGjd3sIGkZCRODmtgRXCFpb4c62LDaLoE6PEiYlLmEASbAKGEl1v
        u8AaRARUJT63LWAHKWIW2MEo0d1ygR0kISwQJnHuyBRmEJsFqOjBtutgDbwCNhKXF11hh9gg
        L7F6wwGwGk4BW4m9F66BbRYCqjl/tZVlAiPfAkaGVYwiqaXFuem5xUZ6xYm5xaV56XrJ+bmb
        GIHhuO3Yzy07GLveBR9iFOBgVOLhvaEwI16INbGsuDL3EKMEB7OSCK/T2dNxQrwpiZVVqUX5
        8UWlOanFhxhNgY6ayCwlmpwPjJW8knhDU0NzC0tDc2NzYzMLJXHeDoGDMUIC6YklqdmpqQWp
        RTB9TBycUg2MPTsf128/NyWvku3dkwaj+LWCCTd/vVXZ1xr2rE+RU5lboNxrosMXiZTm7g3H
        XVYEztLQUjm2rXaj0e3t2Y28aomVvrfP3H6x89oGA8X9hz70bP4sLqGhWl+9K+Hfre+iFZKP
        5KIC+rKnzljxJ6DiTMo0R1ne6wYT13vv3JAQremnMCPMNbxLiaU4I9FQi7moOBEA7lrgOF0C
        AAA=
X-CMS-MailID: 20201027142342eucas1p18136ba60377ee2985b6bc123908a3c98
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201027142342eucas1p18136ba60377ee2985b6bc123908a3c98
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201027142342eucas1p18136ba60377ee2985b6bc123908a3c98
References: <20201027142330.5121-1-m.szyprowski@samsung.com>
        <CGME20201027142342eucas1p18136ba60377ee2985b6bc123908a3c98@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add a node for the BCM4334 Bluetooth chip on the serial bus #0 on
the Exynos4412-based Midas board family.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4412-midas.dtsi | 28 +++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-midas.dtsi b/arch/arm/boot/dts/exynos4412-midas.dtsi
index 7e7c243ff196..2fc6e2034b0e 100644
--- a/arch/arm/boot/dts/exynos4412-midas.dtsi
+++ b/arch/arm/boot/dts/exynos4412-midas.dtsi
@@ -1109,6 +1109,21 @@
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 	};
 
+	bt_shutdown: bt-shutdown {
+		samsung,pins = "gpl0-6";
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	bt_host_wakeup: bt-host-wakeup {
+		samsung,pins = "gpx2-6";
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	bt_device_wakeup: bt-device-wakeup {
+		samsung,pins = "gpx3-1";
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
 	max77686_irq: max77686-irq {
 		samsung,pins = "gpx0-7";
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
@@ -1386,7 +1401,20 @@
 };
 
 &serial_0 {
+	pinctrl-0 = <&uart0_data &uart0_fctl>;
+	pinctrl-names = "default";
 	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm4330-bt";
+		pinctrl-0 = <&bt_shutdown &bt_device_wakeup &bt_host_wakeup>;
+		pinctrl-names = "default";
+		max-speed = <3000000>;
+		shutdown-gpios = <&gpl0 6 GPIO_ACTIVE_HIGH>;
+		device-wakeup-gpios = <&gpx3 1 GPIO_ACTIVE_HIGH>;
+		host-wakeup-gpios = <&gpx2 6 GPIO_ACTIVE_HIGH>;
+		clocks = <&max77686 MAX77686_CLK_PMIC>;
+	};
 };
 
 &serial_1 {
-- 
2.17.1

