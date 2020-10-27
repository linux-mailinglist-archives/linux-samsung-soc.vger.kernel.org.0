Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0FAA29C3ED
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 27 Oct 2020 18:51:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895604AbgJ0OX4 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 27 Oct 2020 10:23:56 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:34619 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2901476AbgJ0OXy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 27 Oct 2020 10:23:54 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20201027142342euoutp010db14aca22e63f547278d8454085b105~B33HjM1qt3004030040euoutp01y
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Oct 2020 14:23:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20201027142342euoutp010db14aca22e63f547278d8454085b105~B33HjM1qt3004030040euoutp01y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1603808622;
        bh=J77/F/hLSR9dNv1sIfSu1cyyoED7ummEYJEbsG7LdZQ=;
        h=From:To:Cc:Subject:Date:References:From;
        b=L2znZ7qaKH3sTEgNVJ8A3b8+tnkzO0XtwxlRGm8qOTpjAjq6EvBGnlScspdTrx3u/
         WCyqVRwVZGkdFhbWQzzBk+uEnKieBv2J0TMMZM7TjsjUmh8Jd3Ut990m4pC3W85nbM
         py8Us4u/tYsGcsGNns+Vg+GesM/Bj07T/2cKag44=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201027142342eucas1p1aada8a2c2d98f157f3a06d65fc6b4e03~B33HKIuLR1100811008eucas1p1w;
        Tue, 27 Oct 2020 14:23:42 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id C6.BD.06456.E6D289F5; Tue, 27
        Oct 2020 14:23:42 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201027142341eucas1p16e42afed4cae1292ed72fcd631424562~B33GuVjf71100311003eucas1p1q;
        Tue, 27 Oct 2020 14:23:41 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201027142341eusmtrp2084fd0d752ceda521819cf188abc923f~B33Gtw19_2607926079eusmtrp2Z;
        Tue, 27 Oct 2020 14:23:41 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-dd-5f982d6ebe63
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 6A.70.06017.D6D289F5; Tue, 27
        Oct 2020 14:23:41 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201027142341eusmtip2f46f144e0c8670cb2db25842f40eedb3~B33GanCHB2801228012eusmtip2A;
        Tue, 27 Oct 2020 14:23:41 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 1/3] ARM: dts: exynos: Enable BlueTooth support for Trats
 board
Date:   Tue, 27 Oct 2020 15:23:28 +0100
Message-Id: <20201027142330.5121-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRmVeSWpSXmKPExsWy7djPc7p5ujPiDU60sllsnLGe1eL6l+es
        FufPb2C3mHF+H5PF2iN32R1YPTat6mTz6NuyitHj8ya5AOYoLpuU1JzMstQifbsEroy2v4/Z
        Ch7xVDye5NvAeIqri5GTQ0LARGLdlB/sXYxcHEICKxglLn6bxQLhfGGU+PLpODOE85lR4uan
        WcwwLfOP3WGCSCxnlFhy6jorXMum6U8ZQarYBAwlut52sYHYIgKqEp/bFoAtYRbYxijxesFM
        dpCEsECgxNFZvWANLEBFv66tA2vgFbCRuD/jJxvEOnmJ1RsOgN0hIbCFTWLR0pfsEAkXiSU7
        njBB2MISr45vgYrLSPzfOZ8JoqGZUeLhubXsEE4Po8TlphmMEFXWEnfO/QJawQF0k6bE+l36
        EGFHidl3V4KFJQT4JG68FQQJMwOZk7ZNZ4YI80p0tAlBVKtJzDq+Dm7twQuXoEHkIbH22ymw
        04QEYiVeHbnOOIFRbhbCrgWMjKsYxVNLi3PTU4sN81LL9YoTc4tL89L1kvNzNzEC4/z0v+Of
        djB+vZR0iFGAg1GJh/eGwox4IdbEsuLK3EOMEhzMSiK8TmdPxwnxpiRWVqUW5ccXleakFh9i
        lOZgURLnNV70MlZIID2xJDU7NbUgtQgmy8TBKdXAuPbTceV1VpuSf0yxEtjfoXLodVe4kU+T
        wKXD52rqXm1fk6PbPTllQpwZW/rbPoak19IultN3MHyYmtXVEVP1xuLOrrbjEcwLWlv4Fv48
        FjQtc3vJ7BkNvK8dxX0bRB/cfxp3JyErbdorboFPYY9mRsgfN2Lk/9bpfo/3isb1WgeVpTmT
        J72LUGIpzkg01GIuKk4EAB6G9OnvAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrALMWRmVeSWpSXmKPExsVy+t/xe7q5ujPiDa7uVrPYOGM9q8X1L89Z
        Lc6f38BuMeP8PiaLtUfusjuwemxa1cnm0bdlFaPH501yAcxRejZF+aUlqQoZ+cUltkrRhhZG
        eoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehltfx+zFTziqXg8ybeB8RRXFyMnh4SA
        icT8Y3eYuhi5OIQEljJK3LhwgA0iISNxcloDK4QtLPHnWhdYXEjgE6PEhxYnEJtNwFCi6y1E
        XERAVeJz2wJ2kEHMAjsYJbpbLrCDJIQF/CXub3/ABGKzABX9urYOrIFXwEbi/oyfUMvkJVZv
        OMA8gZFnASPDKkaR1NLi3PTcYiO94sTc4tK8dL3k/NxNjMDQ2nbs55YdjF3vgg8xCnAwKvHw
        3lCYES/EmlhWXJl7iFGCg1lJhNfp7Ok4Id6UxMqq1KL8+KLSnNTiQ4ymQMsnMkuJJucDwz6v
        JN7Q1NDcwtLQ3Njc2MxCSZy3Q+BgjJBAemJJanZqakFqEUwfEwenVAPj7uVXXXOZTtTd/1cb
        ZmDNIFb29lvIuwv8t7xWXmwM+dJxSTn+LtfvmRXv5P8oeQpNT6qbu7/rXM318sXb69/mxu9V
        5kn8Yq6wJ9ZIUmhX39Jsza+FibKh/dd1RR1LHPk/9ITWNjkJxxfc5m6Y8bxMxuT5l+2efOzV
        E+tindN8JURljI6oWimxFGckGmoxFxUnAgAfFPmmQwIAAA==
X-CMS-MailID: 20201027142341eucas1p16e42afed4cae1292ed72fcd631424562
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201027142341eucas1p16e42afed4cae1292ed72fcd631424562
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201027142341eucas1p16e42afed4cae1292ed72fcd631424562
References: <CGME20201027142341eucas1p16e42afed4cae1292ed72fcd631424562@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add a node for the BCM4334 Bluetooth chip on the serial bus #0 on
the Exynos4210-based Trats boards.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4210-trats.dts | 31 ++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index a226bec56a45..eb6ca2a74cc0 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -462,6 +462,26 @@
 	};
 };
 
+&pinctrl_1 {
+	bt_shutdown: bt-shutdown {
+		samsung,pins = "gpl1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	bt_host_wakeup: bt-host-wakeup {
+		samsung,pins = "gpx2-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	bt_device_wakeup: bt-device-wakeup {
+		samsung,pins = "gpx3-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+};
+
 &rtc {
 	status = "okay";
 	clocks = <&clock CLK_RTC>, <&pmic_ap_clk>;
@@ -512,6 +532,17 @@
 
 &serial_0 {
 	status = "okay";
+	pinctrl-0 = <&uart0_data &uart0_fctl>;
+	pinctrl-names = "default";
+
+	bluetooth {
+		compatible = "brcm,bcm4330-bt";
+		pinctrl-0 = <&bt_shutdown &bt_device_wakeup &bt_host_wakeup>;
+		pinctrl-names = "default";
+		shutdown-gpios = <&gpl1 0 GPIO_ACTIVE_HIGH>;
+		device-wakeup-gpios = <&gpx3 1 GPIO_ACTIVE_HIGH>;
+		host-wakeup-gpios = <&gpx2 6 GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &serial_1 {
-- 
2.17.1

