Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 392017F4DC
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  2 Aug 2019 12:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389206AbfHBKSk (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 2 Aug 2019 06:18:40 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:57844 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbfHBKSk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 2 Aug 2019 06:18:40 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190802101838euoutp01b7550d6e34e8d19678b77a9329f08307~3E8G-vQkO2777427774euoutp01D
        for <linux-samsung-soc@vger.kernel.org>; Fri,  2 Aug 2019 10:18:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190802101838euoutp01b7550d6e34e8d19678b77a9329f08307~3E8G-vQkO2777427774euoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1564741118;
        bh=tt7ZwHog//aT+96fntmTlRV/eYTIyQYAJuD05o6SvqE=;
        h=From:To:Cc:Subject:Date:References:From;
        b=BKivneFet9Eej67aUSFNCJ2lxv5WaUKklqlklbevPz4GtlngzJJ5RkdRTs4MMVyzP
         0uiFmdvnK+hXgEMKIwAUjdk4BZZeqJqcIHvP8IrviGTXOC8Li6xxhkiOAqge87n/8B
         cHvSbXq0GNC082+kNMcw+HHBHuk6M/TUyKlfmTzE=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190802101837eucas1p2904da5438b0b34217bbeb8fbc79bc21d~3E8GmMZsZ0671406714eucas1p25;
        Fri,  2 Aug 2019 10:18:37 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 8A.60.04298.DFD044D5; Fri,  2
        Aug 2019 11:18:37 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190802101837eucas1p148cc47e6eb2faa3d08ed245a67c11e77~3E8FuNEZQ1652216522eucas1p1Y;
        Fri,  2 Aug 2019 10:18:37 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190802101836eusmtrp11d2130774b40baf98e0460486536f5db~3E8FgOgdF1563515635eusmtrp1W;
        Fri,  2 Aug 2019 10:18:36 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-0e-5d440dfd9863
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 5C.78.04140.CFD044D5; Fri,  2
        Aug 2019 11:18:36 +0100 (BST)
Received: from AMDC2765.DIGITAL.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190802101836eusmtip1ae4533333dc73fa644adaab04f981c33~3E8FNUYjX2621926219eusmtip1p;
        Fri,  2 Aug 2019 10:18:36 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 1/2] ARM: dts: exynos: Add port map to Exynos5250 AHCI node
Date:   Fri,  2 Aug 2019 12:18:21 +0200
Message-Id: <20190802101822.10131-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRmVeSWpSXmKPExsWy7djPc7p/eV1iDS6f0rTYOGM9q8X58xvY
        LWac38dksfbIXXYHFo9NqzrZPPq2rGL0+LxJLoA5issmJTUnsyy1SN8ugSvj6sU+toJ+9opF
        0w8zNTB+Ye1i5OCQEDCRaFrG2cXIxSEksIJRYkPnIyYI5wujxNvWDawQzmdGiblXtrN3MXKC
        dexsvswCkVjOKPG0eQcTSAKsZUGDD4jNJmAo0fW2iw3EFhFQlfjctoAdpIFZoI9R4vreucwg
        CWEBb4kvb46ygNgsQEWTJvYxgdzEK2ArceiKNcQyeYnVGw4wg/RKCGxgk5g16RwzRMJF4vqM
        mUwQtrDEq+NboK6TkTg9uYcFoqGZUeLhubXsEE4Po8TlphmMEFXWEoePXwSHALOApsT6XfoQ
        YUeJP9OamSEBwydx460gSJgZyJy0bTpUmFeio00IolpNYtbxdXBrD164BHWah8TM3WuZIWES
        KzH/zjOWCYxysxB2LWBkXMUonlpanJueWmyYl1quV5yYW1yal66XnJ+7iREY2af/Hf+0g/Hr
        paRDjAIcjEo8vAzPnWKFWBPLiitzDzFKcDArifD28TrHCvGmJFZWpRblxxeV5qQWH2KU5mBR
        EuetZngQLSSQnliSmp2aWpBaBJNl4uCUamD0PSRp6nrPzedrx0dh5flhjA0ujAyfxIuuKttv
        /e0mYGd7amG5Xk7QMeHT7K/kIn1zQycf151p0K+QqvfzI+fhJQvqL7W7zlDMmR6VuoL388qW
        GhsBo60ubQscQn2ehNRq/k6T+3xQfTP/0T0/63JPvvzf5M/RpMlu/y0lWd7gAXcMyyk7CyWW
        4oxEQy3mouJEALSz5yjoAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNLMWRmVeSWpSXmKPExsVy+t/xu7p/eF1iDdb817fYOGM9q8X58xvY
        LWac38dksfbIXXYHFo9NqzrZPPq2rGL0+LxJLoA5Ss+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLP
        yMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS/j6sU+toJ+9opF0w8zNTB+Ye1i5OSQEDCR2Nl8
        mQXEFhJYyiixbIotRFxG4uS0BqgaYYk/17rYuhi5gGo+AdXs3c8IkmATMJToeguS4OQQEVCV
        +Ny2gB2kiFlgAqPE+c4ZYAlhAW+JL2+Ogm1gASqaNLGPqYuRg4NXwFbi0BVriAXyEqs3HGCe
        wMizgJFhFaNIamlxbnpusZFecWJucWleul5yfu4mRmBAbTv2c8sOxq53wYcYBTgYlXh4GZ47
        xQqxJpYVV+YeYpTgYFYS4e3jdY4V4k1JrKxKLcqPLyrNSS0+xGgKtHsis5Rocj4w2PNK4g1N
        Dc0tLA3Njc2NzSyUxHk7BA7GCAmkJ5akZqemFqQWwfQxcXBKNTAKBly/b6I9od3W3ymkcets
        NVsTy33vfNNZ3/f57Pl85be1k2n44d18Ez/8W5YefTFo5sQ2VuF/PwK37J5/hvnJP4MP/JPk
        Zkde57vG3L9U2GHH7KByXqnWWVUPPqTvCnz4b3Lpl5ydf+1fm0QeVsn+yL46b4HN8gxtq2Nh
        a3bdC/m+/YBbn7C7EktxRqKhFnNRcSIAh1GiND4CAAA=
X-CMS-MailID: 20190802101837eucas1p148cc47e6eb2faa3d08ed245a67c11e77
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190802101837eucas1p148cc47e6eb2faa3d08ed245a67c11e77
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190802101837eucas1p148cc47e6eb2faa3d08ed245a67c11e77
References: <CGME20190802101837eucas1p148cc47e6eb2faa3d08ed245a67c11e77@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Exynos AHCI (SATA) controller has only one port for SATA device. According
to AHCI driver bindings (ata/ahci-platform.txt), if the bootloader doesn't
program the PORTS_IMPL register to proper value, the available port map has
to be provided by 'ports-implemented' device tree property. This fixes
SATA operation on Exynos5250-based boards since Linux v4.5.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index d5e0392b409e..30f6f5c6bbcb 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -346,6 +346,7 @@
 			clock-names = "sata", "sclk_sata";
 			phys = <&sata_phy>;
 			phy-names = "sata-phy";
+			ports-implemented = <0x1>;
 			status = "disabled";
 		};
 
-- 
2.17.1

