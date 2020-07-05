Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94706214AD7
	for <lists+linux-samsung-soc@lfdr.de>; Sun,  5 Jul 2020 09:18:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbgGEHSK (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 5 Jul 2020 03:18:10 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:47720 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726369AbgGEHSJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 5 Jul 2020 03:18:09 -0400
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20200705071806epoutp02bfe4174d0a55f9d6152578249fc61944~eyg_yAIZT2317523175epoutp02Q
        for <linux-samsung-soc@vger.kernel.org>; Sun,  5 Jul 2020 07:18:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20200705071806epoutp02bfe4174d0a55f9d6152578249fc61944~eyg_yAIZT2317523175epoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1593933486;
        bh=tmCSeqeth7VPuXjmGwKspXpbsIc/fjhuXoBgLnQs/sM=;
        h=From:To:Cc:Subject:Date:References:From;
        b=Jk8A4p+4A+V7loXDv0sV0otkGZ6rAvw4jTMmJDuzwZvRoOIK5jxnqj6x/KCiXO71S
         ZrBkvi1dOeix5IBwRy3f+5DIMbfY52t9PMLSJPhtUVAQzbGDZ8b31UZ7thsMCIJ+Jx
         xWvPWjuGMrk22nsST3yqJzB0pSuXnCKnCzX/DBj4=
Received: from epsmges5p1new.samsung.com (unknown [182.195.42.73]) by
        epcas5p1.samsung.com (KnoxPortal) with ESMTP id
        20200705071805epcas5p1d5a2ad3a040e2383d10a5bef1d7ce012~eyg9ewVJ-1567215672epcas5p1C;
        Sun,  5 Jul 2020 07:18:05 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
        epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        1D.E9.09467.DAE710F5; Sun,  5 Jul 2020 16:18:05 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
        20200705071805epcas5p37045f009655c40d573077babf17c51fa~eyg9GEk2u1303613036epcas5p3f;
        Sun,  5 Jul 2020 07:18:05 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200705071805epsmtrp25090eb91e8ab90409ad76a1035b7a2de~eyg9FV8YI1763917639epsmtrp2K;
        Sun,  5 Jul 2020 07:18:05 +0000 (GMT)
X-AuditID: b6c32a49-a3fff700000024fb-1b-5f017eadcbdf
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        8D.9D.08303.CAE710F5; Sun,  5 Jul 2020 16:18:04 +0900 (KST)
Received: from Jaguar.sa.corp.samsungelectronics.net (unknown
        [107.108.73.139]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200705071803epsmtip1646c3f37d1272c020dbbf589d28f97db~eyg8Ab2pQ0264602646epsmtip1T;
        Sun,  5 Jul 2020 07:18:03 +0000 (GMT)
From:   Alim Akhtar <alim.akhtar@samsung.com>
To:     rzk@kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 1/2] arm64: dts: exynos: Fix silent hang after boot
Date:   Sun,  5 Jul 2020 12:27:46 +0530
Message-Id: <20200705065747.63014-1-alim.akhtar@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRmVeSWpSXmKPExsWy7bCmuu7aOsZ4g6cfJSwezNvGZjH/yDlW
        i02Pr7FaXN41h81ixvl9TBate4+wW+x8/4HRgd1j06pONo/NS+o9+rasYvT4vEkugCWKyyYl
        NSezLLVI3y6BK+PrjGnsBX/YKzr797A3MN5l62Lk5JAQMJE4PbOZpYuRi0NIYDejxJo9M6Cc
        T4wSLzvaGSGcz4wSO661ssC0vF5+kxHEFhLYxShxok8RoqiFSaJ92iFWkASbgLbE3elbmEBs
        EQEhiQMNv8DGMgscYZRoOP8CLCEs4Cwxf+kjsAYWAVWJab9eg23gFbCR2PnnKiPENnmJ1RsO
        MIM0SwgsY5dYOmkVK0TCRWJO30Wok4QlXh3fwg5hS0l8frcX6DsOIDtbomeXMUS4RmLpvGNQ
        5fYSB67MYQEpYRbQlFi/Sx8kzCzAJ9H7+wkTRCevREebEES1qkTzu6tQndISE7u7oQ7wkOjc
        9ZwRpFxIIFZi6k3pCYwysxBmLmBkXMUomVpQnJueWmxaYJiXWq5XnJhbXJqXrpecn7uJERzR
        Wp47GO8++KB3iJGJg/EQowQHs5IIb682Y7wQb0piZVVqUX58UWlOavEhRmkOFiVxXqUfZ+KE
        BNITS1KzU1MLUotgskwcnFINTIFX94S+0znE7XYnb8qhXS8trUIKtM21z0vuX8E/5ffx+97R
        xSaHJG7/OOIts9nb4f/63cxzH4nK8u3Olf3DKXWH47JMveCZFVUySYeUzzQvPdGz+v2LeE63
        M8+r3pRJGf2SaYh51W2s+WHreanvXPs/KHQZP0ksOr14VU5dXln9/Dc2Sn/PslS1nY9Klnp6
        RfrDdIl7p+adW7HmIv9F1d7/88ueNK/uU9p7ZvVZU4c/zGXMqtV73E441qUZ7S9sqwrsPDUh
        OEjd4nitluc3Bi7ZrfVyTApWeudsC69vWtB10OCI9oQkNvMpNWWZiRP2XrNMcd7Ynhdp07Jb
        JkTsG+/n+KauHe1zsny8eT2mKrEUZyQaajEXFScCAAbhY2NXAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJJMWRmVeSWpSXmKPExsWy7bCSnO6aOsZ4g62nbCwezNvGZjH/yDlW
        i02Pr7FaXN41h81ixvl9TBate4+wW+x8/4HRgd1j06pONo/NS+o9+rasYvT4vEkugCWKyyYl
        NSezLLVI3y6BK+PrjGnsBX/YKzr797A3MN5l62Lk5JAQMJF4vfwmYxcjF4eQwA5Gief9L6AS
        0hLXN05gh7CFJVb+ew5mCwk0MUl8/p0JYrMJaEvcnb6FCcQWERCSONDwiwVkELPAKUaJ/u2b
        wRqEBZwl5i99xApiswioSkz79ZoFxOYVsJHY+ecqI8QCeYnVGw4wT2DkWcDIsIpRMrWgODc9
        t9iwwCgvtVyvODG3uDQvXS85P3cTIzh0tLR2MO5Z9UHvECMTB+MhRgkOZiUR3l5txngh3pTE
        yqrUovz4otKc1OJDjNIcLErivF9nLYwTEkhPLEnNTk0tSC2CyTJxcEo1MIlFd9x13LqJUyxI
        x+2v7rf7b2+a6fF/3v/w68vp6yJctS4EuSldYt/iojIpq9pgwsXpFfWPz3P4NuxsiFTdc3WS
        1P5Ld/OlAhZICHNz28amMKucXvit6eAqJqO65U27l3j1p3kd8bxiefH8pXtdzPdOPKxJ4XjR
        e+isg2CysadA+NTOJT4rigSMU8pvF8Y9PffTbv32ZXLxbBeSFtbqOEk+fRTZwO31yyRuwh45
        /qOM19gWfbpQvPqbmNT74Gc5d4zLvcuzOU1VXqaLzbmqdiQydmZ3BNc/99a175dm+OwyPtMn
        +s44cbKhgO0J33XezDGXLR5pn8ppTgh3mTDnYAbjxL5Lye5dp+d9sjhQqsRSnJFoqMVcVJwI
        APGLK+OMAgAA
X-CMS-MailID: 20200705071805epcas5p37045f009655c40d573077babf17c51fa
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20200705071805epcas5p37045f009655c40d573077babf17c51fa
References: <CGME20200705071805epcas5p37045f009655c40d573077babf17c51fa@epcas5p3.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Once regulators are disabled after kernel boot, on espresso
board silent hang observed because of LDO7 being disabled.
LDO7 actually provide power to CPU cores and non-cpu blocks
circuitries.
Keep this regulator always-on to fix this hang.

Fixes: 9589f7721e16 ("arm64: dts: Add S2MPS15 PMIC node on exynos7-espresso")
Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
index 790f12ca8981..bb86950032d3 100644
--- a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
@@ -157,6 +157,7 @@
 				regulator-min-microvolt = <700000>;
 				regulator-max-microvolt = <1150000>;
 				regulator-enable-ramp-delay = <125>;
+				regulator-always-on;
 			};
 
 			ldo8_reg: LDO8 {

base-commit: 9e50b94b3eb0d859a2586b5a40d7fd6e5afd9210
-- 
2.17.1

