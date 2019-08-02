Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A753E7F4DD
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  2 Aug 2019 12:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725886AbfHBKSk (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 2 Aug 2019 06:18:40 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:36153 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730509AbfHBKSk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 2 Aug 2019 06:18:40 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190802101838euoutp029cb2c99d3786710839648d3ff0cceb3d~3E8HXMfoL0267202672euoutp02l
        for <linux-samsung-soc@vger.kernel.org>; Fri,  2 Aug 2019 10:18:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190802101838euoutp029cb2c99d3786710839648d3ff0cceb3d~3E8HXMfoL0267202672euoutp02l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1564741118;
        bh=fpLDg15zCl4qmsBZot0A8Oq5qgXg5xSdJ7fB+li9VFo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZalOgfrS7LCvrSWCQH4ZWK00WUW264p4wfo7sSSSZ+MSR8e3lclDfkAopix8IWGPg
         DkVOKMIIIQmS5xYrJQ5OH0tdfIo3+IkIiYX4ihOc+4hYlf078hWTtHqtTvKyPnTqxV
         49N+tkWnlkX75XWxdBldXhq0oqoIVVKhw3fF+Lb8=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190802101838eucas1p266bd29d3785ac33ad4174e943c19acad~3E8Gv3fSV3105131051eucas1p2N;
        Fri,  2 Aug 2019 10:18:38 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id AE.F9.04325.DFD044D5; Fri,  2
        Aug 2019 11:18:37 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190802101837eucas1p11151beea191d44688611ae70861d621e~3E8GDNHkC2730727307eucas1p1a;
        Fri,  2 Aug 2019 10:18:37 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190802101837eusmtrp17d5ca125ddbaa2803866a032d0134785~3E8F1MN821563515635eusmtrp1X;
        Fri,  2 Aug 2019 10:18:37 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-b1-5d440dfd85f1
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 09.6E.04146.DFD044D5; Fri,  2
        Aug 2019 11:18:37 +0100 (BST)
Received: from AMDC2765.DIGITAL.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190802101836eusmtip15771be9f46e7a31ad6f87984ab281688~3E8FgPF6P2669026690eusmtip1R;
        Fri,  2 Aug 2019 10:18:36 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 2/2] ARM: exynos_defconfig: Enable AHCI-platform SATA driver
Date:   Fri,  2 Aug 2019 12:18:22 +0200
Message-Id: <20190802101822.10131-2-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190802101822.10131-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAIsWRmVeSWpSXmKPExsWy7djPc7p/eV1iDTpaDS02zljPanH+/AZ2
        ixnn9zFZrD1yl92BxWPTqk42j74tqxg9Pm+SC2CO4rJJSc3JLEst0rdL4MqYtnI7c8FRtoqG
        b1+YGhivsnYxcnBICJhIvPtk2MXIxSEksIJR4s6XH0wQzhdGiVX/97N1MXICOZ8ZJXYdNAOx
        QRr6L62BKlrOKPFi4hEWuI5Fs0DGcnKwCRhKdL3tAusWEVCV+Ny2gB2kiFmgj1Hi+t65zCAJ
        YQEfid5Tt9lA7mABKpp0RxwkzCtgK3FzzyIWiG3yEqs3HAAr5xSwk9jSuZYdIn6CTeLNKS4I
        20XixqmljBC2sMSr41ugamQkTk/uATtOQqCZUeLhubXsEE4Po8TlphlQHdYSh49fBAcGs4Cm
        xPpd+hBhR4nFvxcxQsKIT+LGW0GQMDOQOWnbdGaIMK9ER5sQRLWaxKzj6+DWHrxwiRnC9pB4
        8bWVERKIE4FO+KszgVF+FsKuBYyMqxjFU0uLc9NTi43zUsv1ihNzi0vz0vWS83M3MQLj/fS/
        4193MO77k3SIUYCDUYmHl+G5U6wQa2JZcWXuIUYJDmYlEd4+XudYId6UxMqq1KL8+KLSnNTi
        Q4zSHCxK4rzVDA+ihQTSE0tSs1NTC1KLYLJMHJxSDYx1EZXfk6pFhYTVRGwmz9QMb29e/FX4
        Wfnhr53lAqdWzG4oDQrVFdu6xeXA8cjnllc/8mVNVJdUn8h793fqPv039QU1ESuV4i95KdRP
        cFRhsr8o2zg1q2h9f3f2DzZx999bDl5fW3HLr7PszdpdnpFRTg23uEJmd7dMkc1gkViQv02X
        o/OclBJLcUaioRZzUXEiACmnGD3zAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCLMWRmVeSWpSXmKPExsVy+t/xu7p/eV1iDV7eZbXYOGM9q8X58xvY
        LWac38dksfbIXXYHFo9NqzrZPPq2rGL0+LxJLoA5Ss+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLP
        yMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS9j2srtzAVH2Soavn1hamC8ytrFyMkhIWAi0X9p
        DVMXIxeHkMBSRokZEz5CJWQkTk5rgLKFJf5c62KDKPrEKDHx5QdGkASbgKFE11uQBCeHiICq
        xOe2BewgRcwCExglznfOAEsIC/hI9J66DWRzcLAAFU26Iw4S5hWwlbi5ZxELxAJ5idUbDjCD
        2JwCdhJbOteyg9hCQDUL33xhnMDIt4CRYRWjSGppcW56brGhXnFibnFpXrpecn7uJkZgCG47
        9nPzDsZLG4MPMQpwMCrx8DI8d4oVYk0sK67MPcQowcGsJMLbx+scK8SbklhZlVqUH19UmpNa
        fIjRFOimicxSosn5wPjIK4k3NDU0t7A0NDc2NzazUBLn7RA4GCMkkJ5YkpqdmlqQWgTTx8TB
        KdXAWCr8fPuJM1YXrpVM6tIpdQsUenw7/vWf+qMBc55Z1RZcO+ndLVBjd5dj86Gu+W+d8gtc
        zRuMX1pZSAW7Jp8u60tb9zHDfrGeWdG/PXu0zz6dXMpw1apgXtQ9RZkf/0uWW1wMCDJ227jH
        xez68vXJjREzXW0sPrzqmph6v8PM/25E49ZNb6qzlViKMxINtZiLihMB8pi+6VcCAAA=
X-CMS-MailID: 20190802101837eucas1p11151beea191d44688611ae70861d621e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190802101837eucas1p11151beea191d44688611ae70861d621e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190802101837eucas1p11151beea191d44688611ae70861d621e
References: <20190802101822.10131-1-m.szyprowski@samsung.com>
        <CGME20190802101837eucas1p11151beea191d44688611ae70861d621e@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Exynos5250-based Arndale board has one eSATA port, so enable AHCI-platform
driver, which handles it.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/configs/exynos_defconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index c95c54284da2..51a5937dc572 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -92,9 +92,12 @@ CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_CRYPTOLOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=8192
-CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_CHR_DEV_SG=y
+CONFIG_ATA=y
+# CONFIG_SATA_PMP is not set
+CONFIG_SATA_AHCI_PLATFORM=y
+# CONFIG_ATA_SFF is not set
 CONFIG_MD=y
 CONFIG_BLK_DEV_DM=y
 CONFIG_DM_CRYPT=m
-- 
2.17.1

