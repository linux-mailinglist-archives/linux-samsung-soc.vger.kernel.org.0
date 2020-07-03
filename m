Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34D30213F5E
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  3 Jul 2020 20:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbgGCSpr (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 3 Jul 2020 14:45:47 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:12789 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726707AbgGCSpr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Jul 2020 14:45:47 -0400
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20200703184545epoutp0494501b16f057ab4be638b763090ecc90~eUmzG7Gyq2405024050epoutp04_
        for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Jul 2020 18:45:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20200703184545epoutp0494501b16f057ab4be638b763090ecc90~eUmzG7Gyq2405024050epoutp04_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1593801945;
        bh=ZYub6H8gQX1Iy/PZwDCY/s4lpFyG7k81rGHbPOmeFUc=;
        h=From:To:Cc:Subject:Date:References:From;
        b=fVsIrEfv4oSj0jyRtYdMihBrfhqArDArQ/1BKRedShXJYFgre7RkmxSGI/BNXddXl
         XLNKKQhxnbEiqXnaR0AN9UNpWCdjkwm3u6kxDBw9cl8WlTcfGuEFT1GBzvaM7Zir65
         ZTpymyZ+UMZ/7/sOZM5A3Cr2VoUFOIZ945jqnza4=
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
        epcas5p3.samsung.com (KnoxPortal) with ESMTP id
        20200703184544epcas5p32650181d3d75a5c7aa5e71eb2cf1a74e~eUmyi8VKc1350513505epcas5p3L;
        Fri,  3 Jul 2020 18:45:44 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
        epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
        6C.DD.09475.8DC7FFE5; Sat,  4 Jul 2020 03:45:44 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
        20200703184543epcas5p4adb3db7693094c72477b8469d9f205ba~eUmxO8UcQ1251212512epcas5p4J;
        Fri,  3 Jul 2020 18:45:43 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200703184543epsmtrp22554f4300cbcdb7fff0b9551671820c2~eUmxOQWmb2407924079epsmtrp2_;
        Fri,  3 Jul 2020 18:45:43 +0000 (GMT)
X-AuditID: b6c32a4b-389ff70000002503-bc-5eff7cd8e914
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        4F.E5.08382.7DC7FFE5; Sat,  4 Jul 2020 03:45:43 +0900 (KST)
Received: from Jaguar.sa.corp.samsungelectronics.net (unknown
        [107.108.73.139]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200703184542epsmtip1af93ed4f5baeed3ff8936c34e753026f~eUmwFu7wm1737817378epsmtip1J;
        Fri,  3 Jul 2020 18:45:41 +0000 (GMT)
From:   Alim Akhtar <alim.akhtar@samsung.com>
To:     rzk@kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH] arm64: dts: exynos: Add minimal bootargs
Date:   Fri,  3 Jul 2020 23:55:36 +0530
Message-Id: <20200703182536.9190-1-alim.akhtar@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRmVeSWpSXmKPExsWy7bCmlu6Nmv9xBjfOKFk8mLeNzWL+kXOs
        FpseX2O1uLxrDpvFjPP7mCxa9x5ht9j5/gOjA7vHplWdbB6bl9R79G1ZxejxeZNcAEsUl01K
        ak5mWWqRvl0CV8b364+YCrrZKuY9mcXSwDiLtYuRg0NCwETi/8HALkYuDiGB3YwSm29/Z4Nw
        PjFK3J2wFMr5xihx6d8huI6HN8sh4nuB4s8bmboYOYGcFiaJ7VvzQGw2AW2Ju9O3gMVFBIQk
        DjT8YgFpYBY4wijRcP4FWEJYwFJi9a0VzCA2i4CqRPetPrA4r4C1xP0v78HiEgLyEqs3HGAG
        aZYQWMUu8fzrHHaIhIvE3P7HLBC2sMSr41ug4lISn9/tZYO4NFuiZ5cxRLhGYum8Y1Dl9hIH
        rsxhASlhFtCUWL9LHyTMLMAn0fv7CRNEJ69ER5sQRLWqRPO7q1Cd0hITu7tZIWwPiT13H7FD
        vB4rMePbA6YJjDKzEIYuYGRcxSiZWlCcm55abFpgnJdarlecmFtcmpeul5yfu4kRHM9a3jsY
        Hz34oHeIkYmD8RCjBAezkghvguq/OCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8Sj/OxAkJpCeW
        pGanphakFsFkmTg4pRqYIn9zXMie53H48LHS54ozVlmVLkzvf/eU4a7n1KPtW4zKNiw9MP/u
        90N7wzhenPnR9G5t4720pv3NLb84eFgdWTYULfx/JlySw/zznEQmz66rbbUfnkxb5cbpZ/7S
        qjk9/9Ekl7Q5jm57Xf94n9o5L/bxudSY/p/2VRIiXiKa+37ec/4bfed/bu935yM5u79f2nGt
        g8lo6cZJiXYnzEV/7OGT3WdjX356eYfow/39STnnN5/tedJzsSTiTfPhwspTbb6nXnh0CopO
        CZb49uRS41WjlxNyFrUv877cEqP/YPfNRzxvbrlU9p5TLb7ZvVRAbiHbfdnZ0aZfQp1MeNY/
        n2q/P3WuzeTPnFkpkZcnySuxFGckGmoxFxUnAgA4lJbQVgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJJMWRmVeSWpSXmKPExsWy7bCSnO71mv9xBrv3sls8mLeNzWL+kXOs
        FpseX2O1uLxrDpvFjPP7mCxa9x5ht9j5/gOjA7vHplWdbB6bl9R79G1ZxejxeZNcAEsUl01K
        ak5mWWqRvl0CV8b364+YCrrZKuY9mcXSwDiLtYuRg0NCwETi4c3yLkYuDiGB3YwSb9+9Y+li
        5ASKS0tc3ziBHcIWllj57zk7RFETk8Sza3PAEmwC2hJ3p29hArFFBIQkDjT8YgEpYhY4xSjR
        v30zWJGwgKXE6lsrmEFsFgFVie5bfWANvALWEve/vGeG2CAvsXrDAeYJjDwLGBlWMUqmFhTn
        pucWGxYY5qWW6xUn5haX5qXrJefnbmIEh46W5g7G7as+6B1iZOJgPMQowcGsJMKboPovTog3
        JbGyKrUoP76oNCe1+BCjNAeLkjjvjcKFcUIC6YklqdmpqQWpRTBZJg5OqQYmWY6Hutu+Nqn9
        KOPZX6MSelTNeEITX6daudyTCTFGu1NnHUm8V8XvXs/3k1PEJn0fg5vls8sr5k9xvi5jr+u/
        bZXzeet3bqILy2c0PE3dwctqYZRw3Pj6r18afyV/3vZSvShy7fohzbv7FxtMa/kvHqFaKf47
        6ve3WDkHvdB9Lm3n439O93fgu/DlBG87u5zTBbZaD5to+/3HTr/xlio8KXUq49DrqENfzm6S
        Fqve9/PHq/9a0fMP3LFINmd0nHHFaGX7uwczbnHtX+kkvST+f/v5dE8GzxZffZaCMOfOM0ab
        0h+uSVz1tmr7oY40b63ihSYTntrfKHu6e2es6o/4d55r7zDzVhU9ant9wnWqEktxRqKhFnNR
        cSIAq30LnIwCAAA=
X-CMS-MailID: 20200703184543epcas5p4adb3db7693094c72477b8469d9f205ba
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20200703184543epcas5p4adb3db7693094c72477b8469d9f205ba
References: <CGME20200703184543epcas5p4adb3db7693094c72477b8469d9f205ba@epcas5p4.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add minimal bootargs to enable earlycon and console.
This really useful in case kernel has crashed early in
boot process.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
index 790f12ca8981..d7b42d5a3b2d 100644
--- a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
@@ -24,6 +24,7 @@
 
 	chosen {
 		stdout-path = &serial_2;
+		bootargs = "earlycon=exynos4210,0x14c30000 console=ttySAC0,115200n8";
 	};
 
 	memory@40000000 {

base-commit: 9e50b94b3eb0d859a2586b5a40d7fd6e5afd9210
-- 
2.17.1

