Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D01CA7E47
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  4 Sep 2019 10:48:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729112AbfIDIsi (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 4 Sep 2019 04:48:38 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:47883 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728402AbfIDIsh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Sep 2019 04:48:37 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190904084835euoutp02042e9a595487d39e5d01ad5edefd418c~BL-6WTutv0570105701euoutp02J
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Sep 2019 08:48:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190904084835euoutp02042e9a595487d39e5d01ad5edefd418c~BL-6WTutv0570105701euoutp02J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1567586915;
        bh=QUK3C6xJvPCjCRbr96bW+GIDTEHg6r06EzHdIiAjOTE=;
        h=From:To:Cc:Subject:Date:References:From;
        b=h4tFr7MbZXyjhxZGq6oRJme7QIMtDQg+xNEGQNfjoh7yIHKtQuTNZBvtpSJmawbkG
         o4dpys8BK8INdNr7iDjVS5pOJAmakyhIUiFDFIIM5S9Cxx2SG7SzI175raTradQ1Hk
         NMiTIjqJP8tRZWj5rJuqb/Pk19WMm/1uxHh2RlqM=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190904084835eucas1p25dbe55d8c8feffdc23e9878147d0c16d~BL-51yQWZ1428814288eucas1p2e;
        Wed,  4 Sep 2019 08:48:35 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 4D.9B.04374.26A7F6D5; Wed,  4
        Sep 2019 09:48:34 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190904084834eucas1p20aff0f98a90b9c6939d9113932919aff~BL-5FZljf1428814288eucas1p2d;
        Wed,  4 Sep 2019 08:48:34 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190904084834eusmtrp28eb82da779d4c42eab502fca2a8d3408~BL-43X3hl0623006230eusmtrp2O;
        Wed,  4 Sep 2019 08:48:34 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-a0-5d6f7a6234a9
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 5B.71.04166.26A7F6D5; Wed,  4
        Sep 2019 09:48:34 +0100 (BST)
Received: from AMDC2765.DIGITAL.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190904084833eusmtip1cf6a70183321b7c3348fb78988b430f8~BL-4d8ium2488324883eusmtip1R;
        Wed,  4 Sep 2019 08:48:33 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH] arm64: dts: exynos: Propagate address/size cell change to
 /memory node
Date:   Wed,  4 Sep 2019 10:48:29 +0200
Message-Id: <20190904084829.23944-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNIsWRmVeSWpSXmKPExsWy7djP87pJVfmxBo9mWlg8mLeNzWLjjPWs
        FufPb2C3mHF+H5PF2iN32R1YPTat6mTz6NuyitHj8ya5AOYoLpuU1JzMstQifbsErowHn3Yy
        F8zgq1g9Yxl7A2MbTxcjJ4eEgInE4UdrmbsYuTiEBFYwSuyZ84ERwvnCKNGy6SU7hPOZUeLI
        3hZGmJYL3yaxgNhCAssZJRr+a8B1nF49gQkkwSZgKNH1tosNxBYRUJX43LaAHcRmFtjOKNF4
        WRDEFhaIlNi4dCYriM0CVLPh3nSwobwCthKvpnUxQyyTl1i94QDYfRICW9gkFn7ZC5VwkXi3
        r5UFwhaWeHV8CzuELSPxf+d8JoiGZkaJh+fWskM4PYwSl5tmQP1gLXH4+EWg1RxAJ2lKrN+l
        DxF2lPja8BYsLCHAJ3HjrSDE0XwSk7ZNZ4YI80p0tAlBVKtJzDq+Dm7twQuXoE7zkGibf5EJ
        EkCxEgtOL2GcwCg3C2HXAkbGVYziqaXFuempxcZ5qeV6xYm5xaV56XrJ+bmbGIFRfvrf8a87
        GPf9STrEKMDBqMTDKxCYFyvEmlhWXJl7iFGCg1lJhDd0T06sEG9KYmVValF+fFFpTmrxIUZp
        DhYlcd5qhgfRQgLpiSWp2ampBalFMFkmDk6pBkbu9CWSIQVNF64+Y9RM9IhbuFTIRNzraK5c
        T/D7SVdt/qYYXT/0JOBiDCeXj9DHg2EBuluOfJR2eary4dPpiRM1ZT+fuWvfK/h5+tlpayMf
        GAlLMyh9UbwUxcWd+/FT3U0VxnnG1d/KNj+JFX//PfuQ3sTypXm3W2dkSv7eJ3wh9n/4bN53
        09qUWIozEg21mIuKEwEq3JKs7gIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrILMWRmVeSWpSXmKPExsVy+t/xu7pJVfmxBrfXcls8mLeNzWLjjPWs
        FufPb2C3mHF+H5PF2iN32R1YPTat6mTz6NuyitHj8ya5AOYoPZui/NKSVIWM/OISW6VoQwsj
        PUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYwHn3YyF8zgq1g9Yxl7A2MbTxcjJ4eE
        gInEhW+TWLoYuTiEBJYySvQ8eMcKkZCRODmtAcoWlvhzrYsNxBYS+ARUtCIVxGYTMJToegsR
        FxFQlfjctoAdZBCzwE5Giebrs9lBEsIC4RJzn98DK2IBKtpwbzoLiM0rYCvxaloXM8QCeYnV
        Gw4wT2DkWcDIsIpRJLW0ODc9t9hQrzgxt7g0L10vOT93EyMwuLYd+7l5B+OljcGHGAU4GJV4
        eHf45cUKsSaWFVfmHmKU4GBWEuEN3ZMTK8SbklhZlVqUH19UmpNafIjRFGj5RGYp0eR8YODn
        lcQbmhqaW1gamhubG5tZKInzdggcjBESSE8sSc1OTS1ILYLpY+LglGpgdOWfoR6c1/Ky/TTj
        pLQv83786bJadC7ct7Z5rvHLgz+UnoWlTOn1PdTq+6YsPFO/u7LF5ch8rv4X0csvvWwrt28t
        2H+m9FM5V97dmQzWzUtf92jpbtryljO5XWCZ5uzCF7K+qbvCEj8+NPQM+nZLweaMIpPs2aoz
        1RGzv3U9XcjE03pp8cfzSizFGYmGWsxFxYkAnu7f50QCAAA=
X-CMS-MailID: 20190904084834eucas1p20aff0f98a90b9c6939d9113932919aff
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190904084834eucas1p20aff0f98a90b9c6939d9113932919aff
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190904084834eucas1p20aff0f98a90b9c6939d9113932919aff
References: <CGME20190904084834eucas1p20aff0f98a90b9c6939d9113932919aff@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Commit ef72171b3621 ("arm64: dts: exynos: Remove unneeded address space
mapping for soc node") changed the address and size cells in root node from
2 to 1, but /memory nodes for the affected boards were not updated. This
went unnoticed on Exynos5433-based TM2(e) boards, because they use u-boot,
which updates /memory node to the correct values. On the other hand, the
mentioned commit broke boot on Exynos7-based Espresso board, which
bootloader doesn't touch /memory node at all.

Reported-by: Alim Akhtar <alim.akhtar@samsung.com>
Fixes: ef72171b3621 ("arm64: dts: exynos: Remove unneeded address space mapping for soc node")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 2 +-
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index db22eb56e968..e6321c8567de 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -50,7 +50,7 @@
 
 	memory@20000000 {
 		device_type = "memory";
-		reg = <0x0 0x20000000 0x0 0xc0000000>;
+		reg = <0x20000000 0xc0000000>;
 	};
 
 	gpio-keys {
diff --git a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
index 080e0f56e108..28b02830225f 100644
--- a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
@@ -28,7 +28,7 @@
 
 	memory@40000000 {
 		device_type = "memory";
-		reg = <0x0 0x40000000 0x0 0xC0000000>;
+		reg = <0x40000000 0xC0000000>;
 	};
 
 	usb30_vbus_reg: regulator-usb30 {
-- 
2.17.1

