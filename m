Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7E1487AD9
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  9 Aug 2019 15:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406945AbfHINKL (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 9 Aug 2019 09:10:11 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:50212 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbfHINKL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Aug 2019 09:10:11 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190809131009euoutp016404f847bd13b3d2796972e8bcb1e331~5Qy3qr4bQ0351803518euoutp01O
        for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Aug 2019 13:10:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190809131009euoutp016404f847bd13b3d2796972e8bcb1e331~5Qy3qr4bQ0351803518euoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1565356210;
        bh=poj/PsBvmXjg3K8pwq6CDJpvCfa5uon8kGJr8HbhEoo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BJljkR8AwQf44P4x9pcIvPrEVDuMxehqz9TU2Vz7RC+8TYJHQBncJ2FgS4Lxvz/z2
         u05eggdtmSq/eazNmYhShpS/rnSMpKhBVRzzFbNQhZAYR6C/yZmYSnuzLP+krCPOcu
         kIwLc0/wnStLSqNJWcuIXJ3ehgDBwAOAp0iTMEsI=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190809131009eucas1p136e8e87273869b059e341a1c6f6fc1be~5Qy3SSJ7l2082120821eucas1p1u;
        Fri,  9 Aug 2019 13:10:09 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 0D.C0.04309.1B07D4D5; Fri,  9
        Aug 2019 14:10:09 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190809131008eucas1p1408312d799bd98f14d3b1c2916e78e68~5Qy2acqWK3134531345eucas1p1B;
        Fri,  9 Aug 2019 13:10:08 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190809131008eusmtrp26545437642c009646e14820a4381198d~5Qy2EyC9J2208122081eusmtrp2N;
        Fri,  9 Aug 2019 13:10:08 +0000 (GMT)
X-AuditID: cbfec7f4-afbff700000010d5-09-5d4d70b1cfe8
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 4D.19.04117.0B07D4D5; Fri,  9
        Aug 2019 14:10:08 +0100 (BST)
Received: from AMDC2765.DIGITAL.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190809131007eusmtip29fed941d5e3da3226256dc20737c4844~5Qy1u6hrz2052420524eusmtip2R;
        Fri,  9 Aug 2019 13:10:07 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 2/3] ARM: dts: exynos: Add G3D power domain to Exynos542x
Date:   Fri,  9 Aug 2019 15:09:57 +0200
Message-Id: <20190809130958.25410-2-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190809130958.25410-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRmVeSWpSXmKPExsWy7djP87obC3xjDZbtZLfYOGM9q8X58xvY
        LWac38dksfbIXXYHFo9NqzrZPPq2rGL0+LxJLoA5issmJTUnsyy1SN8ugStj+Y39zAUn2Cru
        7tjO2sC4mrWLkZNDQsBEom1+H0sXIxeHkMAKRokDp5cyQThfGCWe3twClfnMKHF6Ui8TTMu/
        9utQieWMEncO7gVLgLXs/2oCYrMJGEp0ve1iA7FFBFQlPrctYAdpYBboY5S4vncuM0hCWMBT
        4sLK5WCHsAAVLdg9C8zmFbCVWHfuBTvENnmJ1RsOgNVzCthJLD11kBlkkITACTaJh2t2MUMU
        uUjsvz8VyhaWeHV8C1SzjMT/nfOZIBqaGSUenlvLDuH0MEpcbprBCFFlLXH4+EWg1RxA92lK
        rN+lDxF2lNg4AWQzB5DNJ3HjrSBImBnInLRtOlSYV6KjTQiiWk1i1vF1cGsPXrgEdY6HxOrr
        c1ghoTWRUaL/yg+mCYzysxCWLWBkXMUonlpanJueWmyUl1quV5yYW1yal66XnJ+7iREY96f/
        Hf+yg3HXn6RDjAIcjEo8vA2KPrFCrIllxZW5hxglOJiVRHivcPjGCvGmJFZWpRblxxeV5qQW
        H2KU5mBREuetZngQLSSQnliSmp2aWpBaBJNl4uCUamAsUeAySMzLTTWR4LaYpex9+wrTrpP5
        IfesgpIlOw9qfvkaOI/h/HNLRw2zuXkx+o7Pn+Wnvgzfvy957vWjnzfE3N12eDYf07/Nd9+9
        e78vsCPKx1t1eurxKVWSTA8N11SYNr6TrNWpv/iIPaqW86/8lEsBj96dl/1fHsoiK8jxbH7R
        vFUukZuVWIozEg21mIuKEwH0tGji9wIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKLMWRmVeSWpSXmKPExsVy+t/xe7obCnxjDW7/4bbYOGM9q8X58xvY
        LWac38dksfbIXXYHFo9NqzrZPPq2rGL0+LxJLoA5Ss+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLP
        yMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS9j+Y39zAUn2Cru7tjO2sC4mrWLkZNDQsBE4l/7
        dZYuRi4OIYGljBJvP75mg0jISJyc1gBVJCzx51oXG0TRJ0aJ2acvMoMk2AQMJbredoE1iAio
        SnxuW8AOUsQsMIFR4nznDLCEsICnxIWVy8EmsQAVLdg9C8zmFbCVWHfuBTvEBnmJ1RsOgA3l
        FLCTWHrqIJgtBFRzY/k9pgmMfAsYGVYxiqSWFuem5xYb6RUn5haX5qXrJefnbmIEBuG2Yz+3
        7GDsehd8iFGAg1GJh1dD3idWiDWxrLgy9xCjBAezkgjvFQ7fWCHelMTKqtSi/Pii0pzU4kOM
        pkBHTWSWEk3OB0ZIXkm8oamhuYWlobmxubGZhZI4b4fAwRghgfTEktTs1NSC1CKYPiYOTqkG
        xr2PPM7cv9K8+UzV7ep9P7wbDYI0hTb+9fjxdIfKL48dDTP6og/eMa9ZvdS0gNf1fk9s5duW
        q1lMmRIfDfNOPDE86yz67vXTDcGM516e/9i7I/DL0YPvjSpKt1+ae2DX7DdFmVGrZgssTDe4
        cr3ljj3b191y0sIKM+MEq9dPP7F+0pydBU/a7lxXYinOSDTUYi4qTgQAc/YjflgCAAA=
X-CMS-MailID: 20190809131008eucas1p1408312d799bd98f14d3b1c2916e78e68
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190809131008eucas1p1408312d799bd98f14d3b1c2916e78e68
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190809131008eucas1p1408312d799bd98f14d3b1c2916e78e68
References: <20190809130958.25410-1-m.szyprowski@samsung.com>
        <CGME20190809131008eucas1p1408312d799bd98f14d3b1c2916e78e68@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add a power domain for G3D/MALI device present in Exynos542x/5800 SoCs.
Node for the MALI device will be added by a separate patch.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index aae63c367946..fd43aa3a649d 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -294,6 +294,13 @@
 			label = "MFC";
 		};
 
+		g3d_pd: power-domain@10044080 {
+			compatible = "samsung,exynos4210-pd";
+			reg = <0x10044080 0x20>;
+			#power-domain-cells = <0>;
+			label = "G3D";
+		};
+
 		disp_pd: power-domain@100440c0 {
 			compatible = "samsung,exynos4210-pd";
 			reg = <0x100440C0 0x20>;
-- 
2.17.1

