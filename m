Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2BB82535D9
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 26 Aug 2020 19:15:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbgHZRPo (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 26 Aug 2020 13:15:44 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:56582 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726851AbgHZRPm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 Aug 2020 13:15:42 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200826171540euoutp023d3496e5ccc488d328951e2708f19d78~u4NkKyAYA1528515285euoutp02P
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Aug 2020 17:15:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200826171540euoutp023d3496e5ccc488d328951e2708f19d78~u4NkKyAYA1528515285euoutp02P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1598462140;
        bh=76OUI6kZLvGNA+1rSSjmylaVxRhw/F8xCRxQ/TEodJM=;
        h=From:To:Cc:Subject:Date:References:From;
        b=qXbgfVY/sqRu9gt99eIf4YVtn3n40OixmB9D/+8lWPL5A8mlrwjaisQ5kxMsK1w1M
         DMqfeCn0Uk9mMIe4JlvI3LuzW2yvR1DGQg7JbJrtq1hUSoG3Xlzj8bbH6xNYX4HldZ
         KAtuWz3674U1rv9Pn2+0LitwNApW8uH/ldnlAfVg=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200826171540eucas1p1bcd0aeccbe67bc5ddb709b27d4f571e8~u4Njs6tIG1337913379eucas1p1J;
        Wed, 26 Aug 2020 17:15:40 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id A1.AE.06318.BB8964F5; Wed, 26
        Aug 2020 18:15:39 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200826171539eucas1p2e999972d3e7dd6dd701e312548933e87~u4NjBr9K90677706777eucas1p2K;
        Wed, 26 Aug 2020 17:15:39 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200826171539eusmtrp22689a7514204a322c73ee17f1e7477c3~u4NjA3XYZ0859008590eusmtrp2V;
        Wed, 26 Aug 2020 17:15:39 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-ca-5f4698bbc755
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 18.4C.06314.BB8964F5; Wed, 26
        Aug 2020 18:15:39 +0100 (BST)
Received: from AMDC3061.digital.local (unknown [106.120.51.75]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200826171538eusmtip1b3620b893e0bcf28afa09652cd6ced2d~u4NiWnxe90053800538eusmtip1e;
        Wed, 26 Aug 2020 17:15:38 +0000 (GMT)
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
To:     linux-clk@vger.kernel.org
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        m.szyprowski@samsung.com, b.zolnierkie@samsung.com,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 1/3] clk: samsung: Add clk ID definitions for the CPU parent
 clocks
Date:   Wed, 26 Aug 2020 19:15:27 +0200
Message-Id: <20200826171529.23618-1-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSa0hTYRjHeXfO2TkOV6cp+bZKYyZ0Qc3LhxOKlqScIKKiIiRbMw8qOidn
        ztuXhPCSqYkQilleyLSFqWuZ09JQ2yB1UyS1pRbNyEsjzEvebaej9O33/C88Dy8vgUjKMSkR
        n5TCsEmKRJlQhLYYV8ze7WUR8hOTtmCquawRo0YWfmBUZY8Zo+7bZhHKYmnCKZ1tGKPmCiYw
        aqitQkiVWToEVEPPOE4Nfginst/24FT3z1yM2hxuRilt2zo4tZv+NZqN04bycZzWae8K6ZdP
        btNFei2g53XuF4SRouAYJjE+lWF9Q26K4h5UDKPJrc7py906QRboE+UDJwKSgXCq0ALygYiQ
        kPUA6rQPcc6QkAsAFpuv8TwP4HqXz05hrfkFyhfqABzWVwv4wVGoWljCuJSQ9IOF74sAx67k
        QWg1rgi5EEIuIjBf/1vAGS7kFajL6/sXQkkvaJzrRzgWk0HQmNcE+HUe8HnTO4QrQ/IxDu1j
        rzDeOAOXn7Zvh1zgjEmP83wAbhkqBXzhDoAF7Z9xfigG8IuparsRBMfMq46bCMdNR2Fjmy8v
        n4YlW58AJ0NyFxy17+FkxIElLaUIL4thXo6ETx+Ga9pSAc9SeG9yC+WZhlk5jwD/dFFw2V6D
        FQP38v+7qgDQAjdGo1bGMuqAJCbNR61QqjVJsT63VEodcPyY3k3TYivoWI/uAiQBZM7iI/II
        uQRTpKozlF0AEojMVRzW33tDIo5RZGQyrErOahIZdRfYT6AyN3FAzXSUhIxVpDAJDJPMsDuu
        gHCSZgGvZlXndGZoYe2iyekPG5VWvRHjmdBp/r7pkev/rLJ6KqRFih0fqjHNp0deD/1Km92g
        ZjVbHr935PVlw3nlzMZZb1Wt4dLVJz3pCFsZ/uZjf/Qh5zCmYfaki/9FUU79gD01ZMDTqvmW
        PtIxGZhi1w8uGWvXNmx95zom9tVZrVkyVB2n8DuGsGrFXzEMNKAtAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrALMWRmVeSWpSXmKPExsVy+t/xu7q7Z7jFGzw+x2exccZ6VovrX56z
        Wsw/co7Vov/xa2aL8+c3sFtsenyN1eJjzz1Wi8u75rBZzDi/j8li7ZG77BYXT7latO49wm5x
        +E07q8W/axtZLFbt+sPowO/x/kYru8fOWXfZPTat6mTz2Lyk3qNvyypGj8+b5ALYovRsivJL
        S1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQyps65xlKwg6fi
        x+FNTA2MZ7i6GDk5JARMJH5vXMfSxcjFISSwlFHiypYnbF2MHEAJKYn5LUoQNcISf651sUHU
        fGKU6Hp/hh0kwSZgKNF7tI8RxBYRkJW4dewnWBGzQCOLxNmJa1hBEsICwRLzl65nA7FZBFQl
        jn08ywxi8wpYSxzr2MAIsUFeYvWGA8wTGHkWMDKsYhRJLS3OTc8tNtQrTswtLs1L10vOz93E
        CAztbcd+bt7BeGlj8CFGAQ5GJR5ejXi3eCHWxLLiytxDjBIczEoivE5nT8cJ8aYkVlalFuXH
        F5XmpBYfYjQFWj6RWUo0OR8Yd3kl8YamhuYWlobmxubGZhZK4rwdAgdjhATSE0tSs1NTC1KL
        YPqYODilGhhjXE+Ynyvw/m79hPnMg1Xrlx9cO3+Df+DyKpGfqarZryXXnRdSWR4Q8mNHAKPa
        JK8DytOTH0cFGgbxlMZKKnYr886a7f/w4Bspo5PiWlJW1cenpidobFXb49Dt2axX9TttjtOO
        tD2Xrdbxa+x48vtHHkPV1YObZJZezflqevTx98cNb+efi2lQYinOSDTUYi4qTgQAZbgSBoMC
        AAA=
X-CMS-MailID: 20200826171539eucas1p2e999972d3e7dd6dd701e312548933e87
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200826171539eucas1p2e999972d3e7dd6dd701e312548933e87
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200826171539eucas1p2e999972d3e7dd6dd701e312548933e87
References: <CGME20200826171539eucas1p2e999972d3e7dd6dd701e312548933e87@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add clock ID definitions for the CPU parent clocks for SoCs
which don't have such definitions yet. This will allow us to
reference the parent clocks directly by cached struct clk_hw
pointers in the clock provider, rather than doing clk lookup
by name.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 include/dt-bindings/clock/exynos5250.h | 4 +++-
 include/dt-bindings/clock/exynos5420.h | 5 +++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/exynos5250.h b/include/dt-bindings/clock/exynos5250.h
index bc8a3c5..e259cc0 100644
--- a/include/dt-bindings/clock/exynos5250.h
+++ b/include/dt-bindings/clock/exynos5250.h
@@ -172,8 +172,10 @@
 #define CLK_MOUT_GPLL		1025
 #define CLK_MOUT_ACLK200_DISP1_SUB	1026
 #define CLK_MOUT_ACLK300_DISP1_SUB	1027
+#define CLK_MOUT_APLL		1028
+#define CLK_MOUT_MPLL		1029
 
 /* must be greater than maximal clock id */
-#define CLK_NR_CLKS		1028
+#define CLK_NR_CLKS		1030
 
 #endif /* _DT_BINDINGS_CLOCK_EXYNOS_5250_H */
diff --git a/include/dt-bindings/clock/exynos5420.h b/include/dt-bindings/clock/exynos5420.h
index ff917c8..9fffc6c 100644
--- a/include/dt-bindings/clock/exynos5420.h
+++ b/include/dt-bindings/clock/exynos5420.h
@@ -231,6 +231,11 @@
 #define CLK_MOUT_SCLK_SPLL	660
 #define CLK_MOUT_MX_MSPLL_CCORE_PHY	661
 #define CLK_MOUT_SW_ACLK_G3D	662
+#define CLK_MOUT_APLL		663
+#define CLK_MOUT_MSPLL_CPU	664
+#define CLK_MOUT_KPLL		665
+#define CLK_MOUT_MSPLL_KFC	666
+
 
 /* divider clocks */
 #define CLK_DOUT_PIXEL		768
-- 
2.7.4

