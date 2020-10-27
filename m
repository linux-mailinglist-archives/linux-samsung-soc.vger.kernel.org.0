Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8967829C3FB
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 27 Oct 2020 18:51:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1822695AbgJ0Rvt (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 27 Oct 2020 13:51:49 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:34618 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2901477AbgJ0OXy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 27 Oct 2020 10:23:54 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20201027142342euoutp019f69603936fecc19189f717fc4b9719e~B33HgcjAq3119531195euoutp01M
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Oct 2020 14:23:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20201027142342euoutp019f69603936fecc19189f717fc4b9719e~B33HgcjAq3119531195euoutp01M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1603808622;
        bh=w63XQDjZCP11ykXLFKcGVmM/GiTpYJJ2CyfjB4+5SLY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FGTNg8hT/eVgKMccKtXSRDv+/vHbjU/R7q7FRw/WHz77JFxi8lsOSvE+i8yAphzS6
         wO+DNF6AUAE+OWZ8tuqYcrmyAPO+ZJcxGDeYwMMtZ+oA5IU14IdQURe4QOUD9gmSLZ
         QW/TRkMPhO4HEytLjBFVGFiLDrur5NigwGtCX/Rk=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201027142342eucas1p24204108b772cd6af95988b5785051830~B33HQGVG_2017720177eucas1p2F;
        Tue, 27 Oct 2020 14:23:42 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 27.BD.06456.E6D289F5; Tue, 27
        Oct 2020 14:23:42 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201027142341eucas1p299a5277c0de2a490f12a64cc84438fcf~B33HACEDf2016120161eucas1p2F;
        Tue, 27 Oct 2020 14:23:41 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201027142341eusmtrp2e40ba5f3996886f33dee8b1cdf081e70~B33G-eCvQ2617126171eusmtrp2O;
        Tue, 27 Oct 2020 14:23:41 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-de-5f982d6e317a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id BC.70.06017.D6D289F5; Tue, 27
        Oct 2020 14:23:41 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201027142341eusmtip28dc17536a60715035283214ed331fe74~B33GtQm0r0110301103eusmtip2z;
        Tue, 27 Oct 2020 14:23:41 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 2/3] ARM: dts: exynos: Enable BlueTooth support for
 Universal C210 board
Date:   Tue, 27 Oct 2020 15:23:29 +0100
Message-Id: <20201027142330.5121-2-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201027142330.5121-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOIsWRmVeSWpSXmKPExsWy7djP87p5ujPiDd43cVtsnLGe1eL6l+es
        FufPb2C3mHF+H5PF2iN32R1YPTat6mTz6NuyitHj8ya5AOYoLpuU1JzMstQifbsEroyNL88w
        FWzirVix/xVbA+Ms7i5GTg4JAROJrYe/sXUxcnEICaxglGg5fYUJwvnCKHF0znV2kCohgc9A
        mYfKMB3H961hhShaDlT0qhWho2HBP7AONgFDia63XWwgtoiAqsTntgXsIEXMAtsYJV4vmAlW
        JCwQJfHn7w1WEJsFqOjUj1Ywm1fARmJu/zE2iHXyEqs3HGAGsTkFbCX2XrgGtlpC4DKbxMoJ
        Z4EcDiDHRaL/lDpEvbDEq+Nb2CFsGYn/O+czQdQ3M0o8PLeWHcLpYZS43DSDEaLKWuLOuV9s
        IIOYBTQl1u/Shwg7SvQf+MIIMZ9P4sZbQZAwM5A5adt0Zogwr0RHmxBEtZrErOPr4NYevHCJ
        GcL2kFh2dDo0FCcwSmzZnjaBUX4Wwq4FjIyrGMVTS4tz01OLDfNSy/WKE3OLS/PS9ZLzczcx
        AqP/9L/jn3Ywfr2UdIhRgINRiYf3hsKMeCHWxLLiytxDjBIczEoivE5nT8cJ8aYkVlalFuXH
        F5XmpBYfYpTmYFES5zVe9DJWSCA9sSQ1OzW1ILUIJsvEwSnVwBie/HpFUG5k+gXzrMsJ51nv
        rAx6/2Hjw357Pg4rtq4jO4RfRNgt/HRg33Khaj2JnJKO9F0KvM7nmg0r7t2cxLfiZXrMernM
        suk//u5aX6uqK8rzrMc+YptcnUpWZyFLZHuc1MvXc/3V69x+383O3jbTrezAeRXlTy7hnAuS
        T1fbB7Zezv3JpcRSnJFoqMVcVJwIALVvpwb6AgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJLMWRmVeSWpSXmKPExsVy+t/xe7q5ujPiDR4stLTYOGM9q8X1L89Z
        Lc6f38BuMeP8PiaLtUfusjuwemxa1cnm0bdlFaPH501yAcxRejZF+aUlqQoZ+cUltkrRhhZG
        eoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehkbX55hKtjEW7Fi/yu2BsZZ3F2MnBwS
        AiYSx/etYe1i5OIQEljKKNH8eio7REJG4uS0BlYIW1jiz7UuNhBbSOATo0TDeS0Qm03AUKLr
        LURcREBV4nPbAnaQQcwCOxglulsugA0SFoiQ2PfpIjOIzQJUdOpHK9hQXgEbibn9x9ggFshL
        rN5wAKyGU8BWYu+Fa6wQy2wkzl9tZZnAyLeAkWEVo0hqaXFuem6xkV5xYm5xaV66XnJ+7iZG
        YDBuO/Zzyw7GrnfBhxgFOBiVeHhvKMyIF2JNLCuuzD3EKMHBrCTC63T2dJwQb0piZVVqUX58
        UWlOavEhRlOgoyYyS4km5wMjJa8k3tDU0NzC0tDc2NzYzEJJnLdD4GCMkEB6YklqdmpqQWoR
        TB8TB6dUA6PRhw2XOA8J1z+oPPqMgymNU/aAs2PE++2XRO89+695UXHf5xh1PhFR9SPSIlOu
        nNE/riZa8LLk9bvjVsstNi9Z5n5vCa8Xy3/5xVl5cT3sBp5H+9LmlL7kTU1j2JvALi0r/2H9
        tf5JE8/ELwp/VZ26aEfWDOH7DTvyndozAoJjTxTe49y9drISS3FGoqEWc1FxIgCFVV5BXAIA
        AA==
X-CMS-MailID: 20201027142341eucas1p299a5277c0de2a490f12a64cc84438fcf
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201027142341eucas1p299a5277c0de2a490f12a64cc84438fcf
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201027142341eucas1p299a5277c0de2a490f12a64cc84438fcf
References: <20201027142330.5121-1-m.szyprowski@samsung.com>
        <CGME20201027142341eucas1p299a5277c0de2a490f12a64cc84438fcf@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add a node for the BCM4330 Bluetooth chip on the serial bus #0 on
the Exynos4210-based Universal C210 boards.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 .../boot/dts/exynos4210-universal_c210.dts    | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
index eecf93280b3a..68ab4290bcef 100644
--- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
@@ -545,6 +545,24 @@
 		samsung,pins = "gpx3-7";
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 	};
+
+	bt_shutdown: bt-shutdown {
+		samsung,pins = "gpe1-4";
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
 };
 
 &pinctrl_0 {
@@ -612,6 +630,17 @@
 	status = "okay";
 	/delete-property/dmas;
 	/delete-property/dma-names;
+	pinctrl-0 = <&uart0_data &uart0_fctl>;
+	pinctrl-names = "default";
+
+	bluetooth {
+		compatible = "brcm,bcm4330-bt";
+		pinctrl-0 = <&bt_shutdown &bt_device_wakeup &bt_host_wakeup>;
+		pinctrl-names = "default";
+		shutdown-gpios = <&gpe1 4 GPIO_ACTIVE_HIGH>;
+		device-wakeup-gpios = <&gpx3 1 GPIO_ACTIVE_HIGH>;
+		host-wakeup-gpios = <&gpx2 6 GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &serial_1 {
-- 
2.17.1

