Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6357387AD8
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  9 Aug 2019 15:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406934AbfHINKH (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 9 Aug 2019 09:10:07 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:50178 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbfHINKH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Aug 2019 09:10:07 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190809131004euoutp01392e933165458eec6925f6d007492e55~5Qyy2jKBl0210902109euoutp01B
        for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Aug 2019 13:10:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190809131004euoutp01392e933165458eec6925f6d007492e55~5Qyy2jKBl0210902109euoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1565356204;
        bh=iZlvDtNzib0FoipuJvVjod0b6s8nYOpTHeBiRa/IW1E=;
        h=From:To:Cc:Subject:Date:References:From;
        b=dCPox59AkM9Znl9U1wnhAJznl/IsVGyH5NoDZOr3T3Q1uE/wCBvH3fDmZsQlzzObI
         atAu/2mjS5foDGHFpvG946tk6wsFv3JPZEotizh0qrYJ+xx8YT2lwBAwEbqmkd7CL2
         cU6JmAUG+SUzbl/Zr6z0pIaa0gBITvrU78LjS5Yk=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190809131004eucas1p2ff049a822346166fe07a0aeb7028b1cc~5QyydGppx1251212512eucas1p2w;
        Fri,  9 Aug 2019 13:10:04 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id DD.9E.04469.CA07D4D5; Fri,  9
        Aug 2019 14:10:04 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190809131003eucas1p2bba78f21ecdb5497b07fcdca53836be2~5Qyxu2s_51187311873eucas1p2r;
        Fri,  9 Aug 2019 13:10:03 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190809131003eusmtrp24c2de2b8291f4d09414fcdac927c43f1~5Qyxg3SDS2208122081eusmtrp2D;
        Fri,  9 Aug 2019 13:10:03 +0000 (GMT)
X-AuditID: cbfec7f2-54fff70000001175-de-5d4d70acbf04
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id BA.19.04117.BA07D4D5; Fri,  9
        Aug 2019 14:10:03 +0100 (BST)
Received: from AMDC2765.DIGITAL.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190809131003eusmtip2661fb4f0c3c4bb40da3d2786d1fa680f~5QyxLkFdm2052420524eusmtip2O;
        Fri,  9 Aug 2019 13:10:02 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 1/3] ARM: dts: exynos: Move MSC power domain to the right
 place
Date:   Fri,  9 Aug 2019 15:09:56 +0200
Message-Id: <20190809130958.25410-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRmVeSWpSXmKPExsWy7djP87prCnxjDbaeZLPYOGM9q8X58xvY
        LWac38dksfbIXXYHFo9NqzrZPPq2rGL0+LxJLoA5issmJTUnsyy1SN8ugStj3cIrjAV7OCve
        fcxpYDzC3sXIySEhYCLR/WgCYxcjF4eQwApGibf/rzBBOF8YJX49nscG4XxmlJhzu4cZpuXM
        r+VsILaQwHJGif8zzOE6zh27xQiSYBMwlOh62wVWJCKgKvG5bQE7SBGzQB+jxPW9c8EmCQsE
        Snw7dA2sgQWoaNvFZ0ANHBy8ArYSmxfaQiyTl1i94QAzSK+EwAY2iS/fTjJBJFwkFp/vgHpC
        WOLV8S1QtozE/53zmSAamhklHp5byw7h9DBKXG6awQhRZS1x+PhFVpBtzAKaEut36UOEHSXm
        z/vGDhKWEOCTuPFWECTMDGRO2jadGSLMK9HRJgRRrSYx6/g6uLUHL1yCBpCHxPbujUyQAIqV
        OD+jg20Co9wshF0LGBlXMYqnlhbnpqcWG+allusVJ+YWl+al6yXn525iBEb26X/HP+1g/Hop
        6RCjAAejEg9vg6JPrBBrYllxZe4hRgkOZiUR3iscvrFCvCmJlVWpRfnxRaU5qcWHGKU5WJTE
        easZHkQLCaQnlqRmp6YWpBbBZJk4OKUaGKsufPS4dj30JoNn2gydeb7sHyR1I8OidD6biTFk
        z1/Y4GLa8vrR4qpdmoXPLkkG84hP3vRqmW9YSbPc34e7JwQmfpV0vCl44tdNZq4z/+tY1J5I
        HF6eo7Y06OarAk4zpbyjjhM2i1enTZw67+G+TKVnm3Urv7/2n8XyOdEv1ffN9OUys3baLlFi
        Kc5INNRiLipOBAAUB9J16AIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNLMWRmVeSWpSXmKPExsVy+t/xe7qrC3xjDTbMErDYOGM9q8X58xvY
        LWac38dksfbIXXYHFo9NqzrZPPq2rGL0+LxJLoA5Ss+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLP
        yMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS9j3cIrjAV7OCvefcxpYDzC3sXIySEhYCJx5tdy
        ti5GLg4hgaWMEnsbTrNBJGQkTk5rYIWwhSX+XOuCKvrEKDF9wlRGkASbgKFE19susAYRAVWJ
        z20L2EGKmAUmMEqc75wBlhAW8JdoevKfGcRmASradvEZUJyDg1fAVmLzQluIBfISqzccYJ7A
        yLOAkWEVo0hqaXFuem6xkV5xYm5xaV66XnJ+7iZGYEBtO/Zzyw7GrnfBhxgFOBiVeHg15H1i
        hVgTy4orcw8xSnAwK4nwXuHwjRXiTUmsrEotyo8vKs1JLT7EaAq0eyKzlGhyPjDY80riDU0N
        zS0sDc2NzY3NLJTEeTsEDsYICaQnlqRmp6YWpBbB9DFxcEo1MEbO126+dVf5ePIhSUWl5YsD
        F027taZr/Z2soKadpt8YLnwJy+76xjzL/umWNY0bn1yZ9Gp7P3vf8r6HatNSd89azTavYsZ2
        l4YJh6Lnnf0WlhYr/O/dKd4NDJWcQbGqaq0TdHdw5jTN/Xjx3p1j5/h/7qg13Z7PcPHZc4vy
        jQxrCluq1Wy7b55RYinOSDTUYi4qTgQAt3YEqT4CAAA=
X-CMS-MailID: 20190809131003eucas1p2bba78f21ecdb5497b07fcdca53836be2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190809131003eucas1p2bba78f21ecdb5497b07fcdca53836be2
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190809131003eucas1p2bba78f21ecdb5497b07fcdca53836be2
References: <CGME20190809131003eucas1p2bba78f21ecdb5497b07fcdca53836be2@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

DT nodes should be sorted by 'reg' property, so move MSC power domain
node in exynos5420.dtsi to the end of power domains to keep them sorted.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 679d70a87e9f..aae63c367946 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -294,13 +294,6 @@
 			label = "MFC";
 		};
 
-		msc_pd: power-domain@10044120 {
-			compatible = "samsung,exynos4210-pd";
-			reg = <0x10044120 0x20>;
-			#power-domain-cells = <0>;
-			label = "MSC";
-		};
-
 		disp_pd: power-domain@100440c0 {
 			compatible = "samsung,exynos4210-pd";
 			reg = <0x100440C0 0x20>;
@@ -315,6 +308,13 @@
 			label = "MAU";
 		};
 
+		msc_pd: power-domain@10044120 {
+			compatible = "samsung,exynos4210-pd";
+			reg = <0x10044120 0x20>;
+			#power-domain-cells = <0>;
+			label = "MSC";
+		};
+
 		pinctrl_0: pinctrl@13400000 {
 			compatible = "samsung,exynos5420-pinctrl";
 			reg = <0x13400000 0x1000>;
-- 
2.17.1

