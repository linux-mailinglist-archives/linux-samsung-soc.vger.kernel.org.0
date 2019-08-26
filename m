Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E2CF9CD51
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 26 Aug 2019 12:32:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726388AbfHZKcH (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 26 Aug 2019 06:32:07 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:54147 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731004AbfHZKcF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Aug 2019 06:32:05 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190826103204euoutp01c5b5640db6a17e3ad7045d9a222daf54~_cmsUA0Vr2451824518euoutp01N
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Aug 2019 10:32:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190826103204euoutp01c5b5640db6a17e3ad7045d9a222daf54~_cmsUA0Vr2451824518euoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1566815524;
        bh=Ip+6fltHztJReMlz2T2VDcULtxKY9cslS3Sg66M7syQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qTHrARphzpFDDjCFLr2OMcgDO9mrtkasQCA1dYSdjdHzkcIFhFfCaeDgBs28rZz/Z
         WcZkNh8T0M4GLlpcg+Q/6RKlhqY/ghSSToL3v3VR8166WGjpkyyX7GIl3jVfvd7D80
         eIIyaGXTBzkHgs7CB/waot33pqYKHMeNU2XSIwfU=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190826103204eucas1p2823fac6836c8ef1735d94e92f4cd59cb~_cmr1jt_n2547125471eucas1p2R;
        Mon, 26 Aug 2019 10:32:04 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id D1.1C.04309.325B36D5; Mon, 26
        Aug 2019 11:32:03 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190826103203eucas1p2d67b0ef44758eb06252b340f7751701a~_cmq-EDne2893828938eucas1p2i;
        Mon, 26 Aug 2019 10:32:03 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190826103202eusmtrp2a62a27e9ae1e3ee315e38b06a5ad69ea~_cmqw9sHO1574315743eusmtrp2s;
        Mon, 26 Aug 2019 10:32:02 +0000 (GMT)
X-AuditID: cbfec7f4-ae1ff700000010d5-fe-5d63b523cc81
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 5A.63.04117.225B36D5; Mon, 26
        Aug 2019 11:32:02 +0100 (BST)
Received: from AMDC2765.DIGITAL.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190826103202eusmtip266c0211cac19abf51a585a59911f35a2~_cmqTNKKp0324503245eusmtip21;
        Mon, 26 Aug 2019 10:32:02 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2 2/2] ARM: exynos: Enable support for ARM architected
 timers
Date:   Mon, 26 Aug 2019 12:31:42 +0200
Message-Id: <20190826103142.3477-4-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190826103142.3477-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPIsWRmVeSWpSXmKPExsWy7djP87rKW5NjDSZf07XYOGM9q8X1L89Z
        Lc6f38BusenxNVaLGef3MVmsPXKX3YHNY9OqTjaPzUvqPfq2rGL0+LxJLoAlissmJTUnsyy1
        SN8ugSvj9J36gk1sFbf+SDUwbmTtYuTkkBAwkbi1cDNjFyMXh5DACkaJXU9+s0E4XxglVt+4
        DpX5zCjx7fF7ZpiWw79mQVUtZ5S4vu0XM1zLopfLWUCq2AQMJbredrGB2CIC3hKTz/xlByli
        FtjGKLGl9wFQBweHsECAxJYHUSA1LAKqEpNWdIAdxStgI/G89w0bxDZ5idUbDoCVcwrYSjxY
        YQgyRkLgNpvE/n1zoWpcJL71r4J6SFji1fEt7BC2jMT/nfOZIBqaGSUenlvLDuH0MEpcbprB
        CFFlLXH4+EVWkA3MApoS63fpQ4QdJTZv7mAHCUsI8EnceCsIEmYGMidtm84MEeaV6GgTgqhW
        k5h1fB3c2oMXLkEDy0Pi9NKz0FCcwChx79E5tgmM8rMQli1gZFzFKJ5aWpybnlpslJdarlec
        mFtcmpeul5yfu4kRmAxO/zv+ZQfjrj9JhxgFOBiVeHgTSpNjhVgTy4orcw8xSnAwK4nw5ugn
        xgrxpiRWVqUW5ccXleakFh9ilOZgURLnrWZ4EC0kkJ5YkpqdmlqQWgSTZeLgBKaDAJ5Z4i/O
        PC9hM/u/955rMPtGK317i43Ss6yVnsp/5BTo6i/mWJOZNdm7JdlGoEhpW1OIfR4bZ9eBAOF/
        HT/1NDYaVq2abKckMM1Fgp9tVrGp8e18V8+X2nfWKiV+X6DLqhTMOFN1h+6Gy5MYLn/afjVn
        XqREykv113b7Hm3oiJfeav9JiE+JpTgj0VCLuag4EQB68HSDAgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrALMWRmVeSWpSXmKPExsVy+t/xe7pKW5NjDWbdNLLYOGM9q8X1L89Z
        Lc6f38BusenxNVaLGef3MVmsPXKX3YHNY9OqTjaPzUvqPfq2rGL0+LxJLoAlSs+mKL+0JFUh
        I7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS/j9J36gk1sFbf+SDUw
        bmTtYuTkkBAwkTj8axZbFyMXh5DAUkaJN98Ws0EkZCROTmuAKhKW+HOtC6roE6PE3eO3wIrY
        BAwlut52gdkiAr4Sj9+sZAEpYhbYwSixZcdbsG5hAT+JZ/ffghWxCKhKTFrRARbnFbCReN77
        BmqbvMTqDQeYuxg5ODgFbCUerDAECQsBlfx5NI91AiPfAkaGVYwiqaXFuem5xUZ6xYm5xaV5
        6XrJ+bmbGIGhue3Yzy07GLveBR9iFOBgVOLhTShNjhViTSwrrsw9xCjBwawkwpujnxgrxJuS
        WFmVWpQfX1Sak1p8iNEU6KaJzFKiyfnAuMkriTc0NTS3sDQ0NzY3NrNQEuftEDgYIySQnliS
        mp2aWpBaBNPHxMEJDEQb/sWslhseaW95Ujapn+Hi12V+XFffXdCTOZJ0bebley6xdfU7bLYH
        Liz7fUJwpbmI+Kk1C44/Mj0mPM2C40if3CzFTyse3Vu68Numpv377rP8EFmcuPb/kx0SFtaW
        Ftdl3myRlfRRee/ueOXIbR7O/58YnGbfvGdt1xSRtWtbTE3MiYrsaws/KrEUZyQaajEXFScC
        AAnK575jAgAA
X-CMS-MailID: 20190826103203eucas1p2d67b0ef44758eb06252b340f7751701a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190826103203eucas1p2d67b0ef44758eb06252b340f7751701a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190826103203eucas1p2d67b0ef44758eb06252b340f7751701a
References: <20190826103142.3477-1-m.szyprowski@samsung.com>
        <CGME20190826103203eucas1p2d67b0ef44758eb06252b340f7751701a@eucas1p2.samsung.com>
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
index d7422233a130..833ab92516fa 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -18,6 +18,7 @@ menuconfig ARCH_EXYNOS
 	select EXYNOS_SROM
 	select EXYNOS_PM_DOMAINS if PM_GENERIC_DOMAINS
 	select GPIOLIB
+	select HAVE_ARM_ARCH_TIMER if VIRTUALIZATION
 	select HAVE_ARM_SCU if SMP
 	select HAVE_S3C2410_I2C if I2C
 	select HAVE_S3C2410_WATCHDOG if WATCHDOG
-- 
2.17.1

