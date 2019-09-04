Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EFC7A7F46
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  4 Sep 2019 11:24:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725840AbfIDJYx (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 4 Sep 2019 05:24:53 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:48474 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729649AbfIDJYx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Sep 2019 05:24:53 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190904092452euoutp01331a7896871d33d1a58735fd661de638~BMflNRfit1931719317euoutp017
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Sep 2019 09:24:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190904092452euoutp01331a7896871d33d1a58735fd661de638~BMflNRfit1931719317euoutp017
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1567589092;
        bh=lwAT+BjUKEjG0CDt4a3pcKnom2Lnd4UIYI/8gAIDNog=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DT8vTafI3OuQvn4wP4xGnYawjAvt8T+F1SNipwdyN6NNsfl4JDqZMsRh/+7Y+d9X9
         NPyrUI8Bib3IjASwXpDwgIqtKqdL8MNLoOySbwDHUuNcOyomGwRgkiT+kz6PAsqz2B
         KMGnVJAy2txiKqQ0BdSiuFXeUbQ1bf2ky0YjfwOI=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190904092451eucas1p28d1ee4461aaaace7b1c40cfe6a94ae0e~BMfk1c-Ty2899028990eucas1p24;
        Wed,  4 Sep 2019 09:24:51 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 2D.31.04469.3E28F6D5; Wed,  4
        Sep 2019 10:24:51 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190904092450eucas1p1d569f8694d9f4a55b2bc599c696f4168~BMfkD7Fwq1811918119eucas1p1b;
        Wed,  4 Sep 2019 09:24:50 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190904092450eusmtrp10d4581c5ebf692e10358a09c0adf2f9a~BMfj1t_xs2960329603eusmtrp1i;
        Wed,  4 Sep 2019 09:24:50 +0000 (GMT)
X-AuditID: cbfec7f2-54fff70000001175-ef-5d6f82e3cbf7
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 2B.CA.04117.2E28F6D5; Wed,  4
        Sep 2019 10:24:50 +0100 (BST)
Received: from AMDC2765.DIGITAL.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190904092450eusmtip1b60e644d6366e75bd14ccfe2fd80e5c8~BMfjfHR211532115321eusmtip1K;
        Wed,  4 Sep 2019 09:24:50 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 3/3] arm64: dts: exynos: Remove useless #address-cells
 property for GIC node
Date:   Wed,  4 Sep 2019 11:24:42 +0200
Message-Id: <20190904092442.26260-4-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904092442.26260-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRmVeSWpSXmKPExsWy7djP87qPm/JjDc4skbF4MG8bm8XGGetZ
        Lc6f38BuMeP8PiaLtUfusjuwemxa1cnm0bdlFaPH501yAcxRXDYpqTmZZalF+nYJXBl7/y5h
        L5jKVnF30SumBsYprF2MnBwSAiYSR+c9BbK5OIQEVjBKfLy+ggnC+cIo8eD0ehaQKiGBz4wS
        kw7xdTFygHX8nZUCUbOcUWJq5xo2uIZ1F9oYQRrYBAwlut52sYHYIgKqEp/bFrCD2MwC2xkl
        Gi8LggwSFoiTWLtKE8RkASo5/LQGpIJXwFaip3EJ1HHyEqs3HGAGsTkF7CT273rHCLJKQuA6
        m8TPNb1sEEUuEo/X7IayhSVeHd/CDmHLSJye3MMC0dDMKPHw3Fp2CKeHUeJy0wxGiCpricPH
        L7KCXMEsoCmxfpc+RNhRovXiAiaIh/kkbrwVhDifT2LStunMEGFeiY42IYhqNYlZx9fBrT14
        4RIzhO0h8b3xDBMkCCcySlydGTOBUX4Wwq4FjIyrGMVTS4tz01OLDfNSy/WKE3OLS/PS9ZLz
        czcxAuP+9L/jn3Ywfr2UdIhRgINRiYd3h19erBBrYllxZe4hRgkOZiUR3tA9ObFCvCmJlVWp
        RfnxRaU5qcWHGKU5WJTEeasZHkQLCaQnlqRmp6YWpBbBZJk4OKUaGFldniwWv8mfoP//vMPy
        51XHGu95Cb1NE17zg8tL47j8xObMRzFcHXmqUdnybCJiu5iDAxlWWR+fyqAVWalhzbko9Z+g
        4gOhjdYXzDsfrX0Zq/bHcd3Hd8vifgUfWBL1k/uP4ZouLUPjpnVCdzZ8Pz6d5d56kdlv++JX
        fzGZ6ebmtqNsxgntfCWW4oxEQy3mouJEAEGcBK33AgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBLMWRmVeSWpSXmKPExsVy+t/xu7qPmvJjDX5vULN4MG8bm8XGGetZ
        Lc6f38BuMeP8PiaLtUfusjuwemxa1cnm0bdlFaPH501yAcxRejZF+aUlqQoZ+cUltkrRhhZG
        eoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehl7/y5hL5jKVnF30SumBsYprF2MHBwS
        AiYSf2eldDFycQgJLGWU6NvQCxTnBIrLSJyc1gBlC0v8udbFBlH0iVHi765eZpAEm4ChRNdb
        kAQnh4iAqsTntgXsIEXMAjsZJZqvz2YHSQgLxEgcnDWBDWQbC1DR4ac1IGFeAVuJnsYlUAvk
        JVZvOAA2k1PATmL/rneMILYQUE3/nk+sExj5FjAyrGIUSS0tzk3PLTbSK07MLS7NS9dLzs/d
        xAgMxW3Hfm7Zwdj1LvgQowAHoxIP7w6/vFgh1sSy4srcQ4wSHMxKIryhe3JihXhTEiurUovy
        44tKc1KLDzGaAt00kVlKNDkfGCd5JfGGpobmFpaG5sbmxmYWSuK8HQIHY4QE0hNLUrNTUwtS
        i2D6mDg4pRoYbW5+ENxu+uLx3oMKGesWJbXGvnKfwNq21tOhJvanx6bIxycntnr88bnMvffo
        1xj5Lb3Xl/ju+RZw2nrZZeVlNcqrp60zlvvoNvnqsmI90edVfzKWnuu8tPCNwMUKy3deeW9P
        Jx6PX2tzcOciXY0PO2dxagYKXi+edEa5/E3Etoxde7csDP2nZ6XEUpyRaKjFXFScCAC5HGgN
        WwIAAA==
X-CMS-MailID: 20190904092450eucas1p1d569f8694d9f4a55b2bc599c696f4168
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190904092450eucas1p1d569f8694d9f4a55b2bc599c696f4168
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190904092450eucas1p1d569f8694d9f4a55b2bc599c696f4168
References: <20190904092442.26260-1-m.szyprowski@samsung.com>
        <CGME20190904092450eucas1p1d569f8694d9f4a55b2bc599c696f4168@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

GIC node on Exynos7 has no childres, this #address-cells property makes
no sense for it. Remove it then.

Reported-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos7.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index f09800f355db..5ba4169a10e2 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -97,7 +97,6 @@
 		gic: interrupt-controller@11001000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
-			#address-cells = <0>;
 			interrupt-controller;
 			reg =	<0x11001000 0x1000>,
 				<0x11002000 0x1000>,
-- 
2.17.1

