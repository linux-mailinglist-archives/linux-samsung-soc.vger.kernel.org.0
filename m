Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF6FA371E
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 30 Aug 2019 14:53:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727455AbfH3Mw7 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 30 Aug 2019 08:52:59 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:41164 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727170AbfH3Mw7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 30 Aug 2019 08:52:59 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190830125256euoutp010d79fe4201455d18c3337d7c88206b3e~-tG1TFd6q0304303043euoutp01r
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Aug 2019 12:52:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190830125256euoutp010d79fe4201455d18c3337d7c88206b3e~-tG1TFd6q0304303043euoutp01r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1567169577;
        bh=fZdHeFkfxNZIk5BGq2ZVFVSxm6oxW+o7j39WKDUTBag=;
        h=From:To:Cc:Subject:Date:References:From;
        b=Wru1WlOm/LPJWu9dzVpAsWv42ad7HaaByd+dOVj+IlgoamEarat9Wc5A5yxZ4T4Ii
         557U33FrjwNSdkvGKnoKEeo2X0SSZUnWT5dkqT3bEBi82ALbK8DzbigJR9MWfmmAiL
         tKJWaArvsxd2LLWaA4cc/9UiPxVO7087WSEMZd1Y=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190830125256eucas1p16c644427ae0bd8e0eba0d21635346ed6~-tG0sy-Ja2860528605eucas1p1Z;
        Fri, 30 Aug 2019 12:52:56 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id DF.B6.04309.82C196D5; Fri, 30
        Aug 2019 13:52:56 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190830125255eucas1p1f39a9d097c3774857788b55e79b4e7c4~-tGz8l-Q32860628606eucas1p1P;
        Fri, 30 Aug 2019 12:52:55 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190830125255eusmtrp1e4a1ac02ad18e3297c76075c5d77d210~-tGzuXJyY2942629426eusmtrp1L;
        Fri, 30 Aug 2019 12:52:55 +0000 (GMT)
X-AuditID: cbfec7f4-ae1ff700000010d5-ef-5d691c28e604
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 12.74.04166.72C196D5; Fri, 30
        Aug 2019 13:52:55 +0100 (BST)
Received: from AMDC2765.DIGITAL.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190830125254eusmtip14c4740a0e2ca07a7a15de5f5ff1aeba0~-tGzViQHr1176311763eusmtip13;
        Fri, 30 Aug 2019 12:52:54 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Javier Martinez Canillas <javier@dowhile0.org>
Subject: [PATCH] ARM: dts: exynos: Mark LDO10 as always-on on Peach Pit/Pi
 Chromebooks
Date:   Fri, 30 Aug 2019 14:52:42 +0200
Message-Id: <20190830125242.10008-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAIsWRmVeSWpSXmKPExsWy7djPc7oaMpmxBpc+MVtsnLGe1eLa7xls
        FufPb2C3mHF+H5PF2iN32R1YPf7ObmX22LSqk82jb8sqRo/Pm+QCWKK4bFJSczLLUov07RK4
        Mta3RxV8FajY+vkSawNjF18XIyeHhICJxOonf5m7GLk4hARWMEpsmnaPFcL5wijxdMMfRgjn
        M6PE1bn3mGBa/m2/wA6RWM4oMXffTka4lkmvlzCDVLEJGEp0ve1iA7FFBFQlPrctYAexmQUO
        MEp826sIYgsLREg0tX8Hi7MA1Vw69hasl1fAVuLW9T5WiG3yEqs3HAA7UEJgB5vEsjX7mSES
        LhJ/Zl2GKhKWeHV8CzuELSNxenIPC0RDM6PEw3Nr2SGcHkaJy00zGCGqrCUOH78I1M0BdJKm
        xPpd+hBhR4kti5cwgoQlBPgkbrwVhDiaT2LStunMEGFeiY42IYhqNYlZx9fBrT144RLUaR4S
        f298BrOFBGIl9qxZwjiBUW4Wwq4FjIyrGMVTS4tz01OLjfJSy/WKE3OLS/PS9ZLzczcxAuP9
        9L/jX3Yw7vqTdIhRgINRiYfXYnt6rBBrYllxZe4hRgkOZiUR3nkeGbFCvCmJlVWpRfnxRaU5
        qcWHGKU5WJTEeasZHkQLCaQnlqRmp6YWpBbBZJk4OKUaGM26Y/aZFK9qf/fRPXLV+fLJYRNu
        XNiyzH6OerWLCJ9/xIcpC1kWTylfXu8wW7uiuv3hrR9rpzWvFthUd6LnSkulZcQ0x1geyQ8d
        OjkzZtoL9d22Y7/s3K7B3JH5bue1nJ0/ds393hzIMPsD884QTj4HIXW/2t067yznLhXN5+nw
        6PbW7N11RImlOCPRUIu5qDgRAEkAx9XzAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGLMWRmVeSWpSXmKPExsVy+t/xu7rqMpmxBmvO8lhsnLGe1eLa7xls
        FufPb2C3mHF+H5PF2iN32R1YPf7ObmX22LSqk82jb8sqRo/Pm+QCWKL0bIryS0tSFTLyi0ts
        laINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mta3RxV8FajY+vkSawNjF18X
        IyeHhICJxL/tF9i7GLk4hASWMkr8/7CaHSIhI3FyWgMrhC0s8edaFxtE0SdGiYXXroMVsQkY
        SnS9BUlwcogIqEp8blsANolZ4BCjxOo131hAEsICYRJ9TRfBJrEAFV069pYZxOYVsJW4db0P
        aoO8xOoNB5gnMPIsYGRYxSiSWlqcm55bbKhXnJhbXJqXrpecn7uJERhm24793LyD8dLG4EOM
        AhyMSjy8FtvTY4VYE8uKK3OBlnIwK4nwzvPIiBXiTUmsrEotyo8vKs1JLT7EaAq0fCKzlGhy
        PjAG8kriDU0NzS0sDc2NzY3NLJTEeTsEDsYICaQnlqRmp6YWpBbB9DFxcEo1MAacv92vlr6E
        65s9a1dfBuuVHWE71l5+7ntArUFy+twJJhl7Ld0O/LuysO7IqTrxzXV/38/vP3zAxedSJvtM
        tY2v5FKNKgv9ZN8ueZhnWGV/VqbXWjpZZZGhmN9VHpaXKa8+3bgqo/mEKVv1/vXCkMAz/nwv
        DDXzo4yfzDW0mbJF+5rNhM98b5VYijMSDbWYi4oTAdGUGCNJAgAA
X-CMS-MailID: 20190830125255eucas1p1f39a9d097c3774857788b55e79b4e7c4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190830125255eucas1p1f39a9d097c3774857788b55e79b4e7c4
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190830125255eucas1p1f39a9d097c3774857788b55e79b4e7c4
References: <CGME20190830125255eucas1p1f39a9d097c3774857788b55e79b4e7c4@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Commit aff138bf8e37 ("ARM: dts: exynos: Add TMU nodes regulator supply for
Peach boards") assigned LDO10 to Exynos Thermal Measurement Unit, but it
turned out that it supplies also some other critical parts and board
freezes/crashes when it is turned off.

The mentioned commit made Exynos TMU a consumer of that regulator and in
typical case Exynos TMU driver keeps it enabled from early boot. However
there are such configurations (example is multi_v7_defconfig), in which
some of the regulators are compiled as modules and are not available from
early boot. In such case it may happen that LDO10 is turned off by
regulator core, because it has no consumers yet (in this case consumer
drivers cannot get it, because the supply regulators for it are not yet
available). This in turn causes the board to crash. This patch restores
'always-on' property for the LDO10 regulator.

Fixes: aff138bf8e37 ("ARM: dts: exynos: Add TMU nodes regulator supply for Peach boards")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos5420-peach-pit.dts | 1 +
 arch/arm/boot/dts/exynos5800-peach-pi.dts  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index 77e08a4c7300..2bcbdf8a39bf 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -440,6 +440,7 @@
 				regulator-name = "vdd_ldo10";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
 				regulator-state-mem {
 					regulator-off-in-suspend;
 				};
diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index 5e8cec736444..60ca3d685247 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -440,6 +440,7 @@
 				regulator-name = "vdd_ldo10";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
 				regulator-state-mem {
 					regulator-off-in-suspend;
 				};
-- 
2.17.1

