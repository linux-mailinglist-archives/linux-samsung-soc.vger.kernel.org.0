Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC8FBA0158
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 28 Aug 2019 14:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726253AbfH1MKQ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 28 Aug 2019 08:10:16 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:44148 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbfH1MKP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 28 Aug 2019 08:10:15 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190828121014euoutp027c982b5ecfe828432dfcbbfc7952aea0~-FO9z3ioz3229032290euoutp02o
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Aug 2019 12:10:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190828121014euoutp027c982b5ecfe828432dfcbbfc7952aea0~-FO9z3ioz3229032290euoutp02o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1566994214;
        bh=hbM0dbFub5dilWQZiDNc2NPkK2MLXSDTzGjKbpMBxSE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XVATmfynSyy1mZpqjvEIeSj9MpTiGl23a0nbUc/iQ6LDauU/AtvrIIC7rw2m0lncc
         vy60Rl3t3/kwtAHIjUkdtdK8heCaosFn9w4pTPfrLL3yDQGYiIyBjJraJelwEPbEeP
         oxg+5Zdp7M+q3Mo0SPUPGTsRqW8IBjbBCfbJT+NI=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190828121013eucas1p28be42cd0efb247cc6dd3b28843a5737c~-FO9WQFBB1354913549eucas1p2v;
        Wed, 28 Aug 2019 12:10:13 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id BC.0D.04469.52F666D5; Wed, 28
        Aug 2019 13:10:13 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190828121012eucas1p2fb78bfebe16d744dc28194bb224650e2~-FO8c_mhh1358913589eucas1p2n;
        Wed, 28 Aug 2019 12:10:12 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190828121012eusmtrp12adbbc9cffea5fb75aef9cdbb408447e~-FO8OlbDH1908619086eusmtrp1i;
        Wed, 28 Aug 2019 12:10:12 +0000 (GMT)
X-AuditID: cbfec7f2-54fff70000001175-2d-5d666f2577fc
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 8B.C4.04117.42F666D5; Wed, 28
        Aug 2019 13:10:12 +0100 (BST)
Received: from AMDC2765.DIGITAL.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190828121011eusmtip14396855e7a74917cc1c4810e0db3ce3c~-FO7zicJ42336023360eusmtip1X;
        Wed, 28 Aug 2019 12:10:11 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marc Zyngier <maz@kernel.org>
Subject: [PATCH v3 2/2] ARM: exynos: Enable support for ARM architected
 timers
Date:   Wed, 28 Aug 2019 14:10:05 +0200
Message-Id: <20190828121005.29368-3-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828121005.29368-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrKIsWRmVeSWpSXmKPExsWy7djPc7qq+WmxBr9u8VhsnLGe1eL6l+es
        FufPb2C32PT4GqvFjPP7mCzWHrnLbrFzzklWB3aPTas62Tw2L6n36NuyitHj8ya5AJYoLpuU
        1JzMstQifbsEroxbn36xFRxiq7j74DRbA+N+1i5GTg4JAROJT2/bmboYuTiEBFYwSjydf4QN
        wvnCKLFkyxdmCOczo8TS2VcYYVpWTL/OCJFYziixZf1tRriWXRu/gFWxCRhKdL3tYgOxRQS8
        JSaf+csOUsQscBVo1LVPLF2MHBzCAgESh17wgdSwCKhKbPr7gg0kzCtgKzG1wwtimbzE6g0H
        mEFsTgE7iUObOllAxkgIPGeTWHz9EBtEkYvE64Mnoa4Tlnh1fAs7hC0jcXpyD1RDM6PEw3Nr
        2SGcHkaJy00zoDqsJQ4fv8gKsplZQFNi/S59EFNCwFFi0nU1CJNP4sZbQZBiZiBz0rbpzBBh
        XomONiGIGWoSs46vg9t68MIlZgjbQ6JrQjcLJHgmMkpMmzeBfQKj/CyEXQsYGVcxiqeWFuem
        pxYb5qWW6xUn5haX5qXrJefnbmIEJobT/45/2sH49VLSIUYBDkYlHl6OxLRYIdbEsuLK3EOM
        EhzMSiK8j1RSY4V4UxIrq1KL8uOLSnNSiw8xSnOwKInzVjM8iBYSSE8sSc1OTS1ILYLJMnFw
        SjUwarZ3N5zfc++M9PrHLEtf5l/ozw9zeHLlwpLkObpne52u7eQ/ctDzoMOLXVOXCtY+cZlt
        KyQvNnmdwIydsxvf95Q3RE7yZGZTynj+7vOCW4vW7n12JIAzSbBQwk38rdemn3YXw61tZJ4e
        0Z3nJvOzwMVW7pbAk7BwNr06VfYHNx/lOhjuu7esRImlOCPRUIu5qDgRACW2E2sIAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKLMWRmVeSWpSXmKPExsVy+t/xu7oq+WmxBrcvCVhsnLGe1eL6l+es
        FufPb2C32PT4GqvFjPP7mCzWHrnLbrFzzklWB3aPTas62Tw2L6n36NuyitHj8ya5AJYoPZui
        /NKSVIWM/OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYxbn36xFRxi
        q7j74DRbA+N+1i5GTg4JAROJFdOvM3YxcnEICSxllHj2YC4LREJG4uS0BqgiYYk/17rYIIo+
        MUpc/vWXGSTBJmAo0fUWJMHJISLgK/H4zUqwZmaBm4wSO+9odDFycAgL+En8nsgEEmYRUJXY
        9PcFG0iYV8BWYmqHF8R4eYnVGw6ATeQUsJM4tKkTbIoQUMmDZ7sYJzDyLWBkWMUoklpanJue
        W2ykV5yYW1yal66XnJ+7iREYpNuO/dyyg7HrXfAhRgEORiUe3oTktFgh1sSy4srcQ4wSHMxK
        IryPVFJjhXhTEiurUovy44tKc1KLDzGaAt00kVlKNDkfGEF5JfGGpobmFpaG5sbmxmYWSuK8
        HQIHY4QE0hNLUrNTUwtSi2D6mDg4pRoY05wuinC0FkR8yd19kOeOS0xEhPPP1squTN+zhy/k
        PXnLeeLuitfGay+v2TPxdH3p/T3VfK5fVmjoLax+X3RobX//zfi5/Z0VndOjDivzlDz15HnS
        cPXwuf0H7ps8FvulOPGka53mCb2dVoaft902Wfwrcsn6H8oWSx5d9png0Tk76btZVvivaCWW
        4oxEQy3mouJEAIVY0HNoAgAA
X-CMS-MailID: 20190828121012eucas1p2fb78bfebe16d744dc28194bb224650e2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190828121012eucas1p2fb78bfebe16d744dc28194bb224650e2
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190828121012eucas1p2fb78bfebe16d744dc28194bb224650e2
References: <20190828121005.29368-1-m.szyprowski@samsung.com>
        <CGME20190828121012eucas1p2fb78bfebe16d744dc28194bb224650e2@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

ARM architected timer can be used together with Exynos MultiCore Timer
driver, so enable support for it. Support for ARM architected timers is
essential for enabling proper KVM support.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/mach-exynos/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index f83786640f94..9dab1f50a02f 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -19,6 +19,7 @@ menuconfig ARCH_EXYNOS
 	select EXYNOS_SROM
 	select EXYNOS_PM_DOMAINS if PM_GENERIC_DOMAINS
 	select GPIOLIB
+	select HAVE_ARM_ARCH_TIMER if ARCH_EXYNOS5 && VIRTUALIZATION
 	select HAVE_ARM_SCU if SMP
 	select HAVE_S3C2410_I2C if I2C
 	select HAVE_S3C2410_WATCHDOG if WATCHDOG
-- 
2.17.1

