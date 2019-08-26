Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 878D99CD52
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 26 Aug 2019 12:32:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730992AbfHZKcH (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 26 Aug 2019 06:32:07 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:39673 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730895AbfHZKcE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Aug 2019 06:32:04 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190826103203euoutp02f872d57ddf031af8ee923150b50a507c~_cmrK0jw51620116201euoutp02Z
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Aug 2019 10:32:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190826103203euoutp02f872d57ddf031af8ee923150b50a507c~_cmrK0jw51620116201euoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1566815523;
        bh=AmZKpaQJcCRJYjglpjOPbLazFEnUnkpKaFbP4Z2GDfw=;
        h=From:To:Cc:Subject:Date:References:From;
        b=qpHarLKyCAdeGLArHq+lI6EEogO8Yl/aNSdfi9+p0z81/loPJi4NPG/YSRs/6v7AJ
         cPfk6uMixNnn5oGHHmHe2UtI2GrNY22P3Luq+ySDrKzSkFgGvBh2daRDuC7f+d+b6p
         cMymHlcRJdKrBVX+hlFXSZ5GFAh5T4ssFUpZJ1qI=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190826103202eucas1p1ffd543ce3f39805b5027f48ab545ac7a~_cmqtgBbE0322003220eucas1p1W;
        Mon, 26 Aug 2019 10:32:02 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id DD.56.04374.225B36D5; Mon, 26
        Aug 2019 11:32:02 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190826103201eucas1p1358f33d8fbdc8cef8ba2ebdcb1b3a51a~_cmpzCWTe0323703237eucas1p1a;
        Mon, 26 Aug 2019 10:32:01 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190826103201eusmtrp24d54d279e44e8d06669e370efbc30570~_cmpk7yo91574315743eusmtrp2n;
        Mon, 26 Aug 2019 10:32:01 +0000 (GMT)
X-AuditID: cbfec7f5-4ddff70000001116-6d-5d63b52282dd
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id FD.C1.04166.125B36D5; Mon, 26
        Aug 2019 11:32:01 +0100 (BST)
Received: from AMDC2765.DIGITAL.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190826103201eusmtip2dae8b5cb288fdaabfdcc3536dca51892~_cmpNXjho0460004600eusmtip2f;
        Mon, 26 Aug 2019 10:32:01 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 0/5] Exynos SoCs: enable support for ARM Architected Timers
Date:   Mon, 26 Aug 2019 12:31:39 +0200
Message-Id: <20190826103142.3477-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRmVeSWpSXmKPExsWy7djP87pKW5NjDdafVLXYOGM9q8X1L89Z
        Lc6f38BusenxNVaLGef3MVmsPXKX3YHNY9OqTjaPzUvqPfq2rGL0+LxJLoAlissmJTUnsyy1
        SN8ugStj6fFNbAXHeCr+HvnF2MA4l6uLkZNDQsBEYuGjuYxdjFwcQgIrGCW2vv/ODJIQEvjC
        KLHkPBdE4jOjxPT169hgOvqXn2OGSCxnlFh14TUbhAPU8WfBWhaQKjYBQ4mut11gHSIC3hKT
        z/xlByliFtjGKLGl9wHYDmGgxN3v+5hAbBYBVYlpT/+CNfAK2EjMbLoCtU5eYvWGA2DrJASO
        sEnsX7AEaAMHkOMiMXWZCkSNsMSr41vYIWwZif875zNB1DczSjw8t5YdwulhlLjcNIMRospa
        4vDxi6wgg5gFNCXW79KHCDtKdLY3MkHM55O48VYQJMwMZE7aNp0ZIswr0dEmBFGtJjHr+Dq4
        tQcvXIIq8ZC4sNoDEoqxEr/PHmKfwCg3C2HVAkbGVYziqaXFuempxcZ5qeV6xYm5xaV56XrJ
        +bmbGIFRf/rf8a87GPf9STrEKMDBqMTDm1CaHCvEmlhWXJl7iFGCg1lJhDdHPzFWiDclsbIq
        tSg/vqg0J7X4EKM0B4uSOG81w4NoIYH0xJLU7NTUgtQimCwTB6dUA+NWl4xfe5byfXlQ+Wgx
        R2qYhAD7vIKalqMT1My6wtJWpYQxKzIUsixrYZillmAq+fHkA/W8q98Y9e7tWZQQuH3Nc8U9
        R4wYpKIZtjvN/cj+4/z6bbIvKmOUQ2d9tJ92TaDLUu3E+cv5BoG8T/yzTHvUs+/LbxVxytNd
        4ixVK5u47OCi9z5lP5VYijMSDbWYi4oTAZzXjVD2AgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNLMWRmVeSWpSXmKPExsVy+t/xe7qKW5NjDda9VrXYOGM9q8X1L89Z
        Lc6f38BusenxNVaLGef3MVmsPXKX3YHNY9OqTjaPzUvqPfq2rGL0+LxJLoAlSs+mKL+0JFUh
        I7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS9j6fFNbAXHeCr+HvnF
        2MA4l6uLkZNDQsBEon/5OeYuRi4OIYGljBKv95xjh0jISJyc1sAKYQtL/LnWxQZR9IlR4vuG
        E2AJNgFDia63IAlODhEBX4nHb1aygBQxC+xglNiy4y1YkbCAt8Td7/uYQGwWAVWJaU//gjXw
        CthIzGy6wgaxQV5i9YYDzBMYeRYwMqxiFEktLc5Nzy021CtOzC0uzUvXS87P3cQIDLhtx35u
        3sF4aWPwIUYBDkYlHt6E0uRYIdbEsuLK3EOMEhzMSiK8OfqJsUK8KYmVValF+fFFpTmpxYcY
        TYGWT2SWEk3OB0ZDXkm8oamhuYWlobmxubGZhZI4b4fAwRghgfTEktTs1NSC1CKYPiYOTqkG
        xtTYA95pXrk9pccT7Fb6mmydvuJJuIxJkhyr8WRtEeO35YtKnvYm7vj2+f8VmdUx5f8PGH2p
        3f/K6tSNblOOx/eCGnKcdpgePfYn4NCSx7eyY0VKNv5f/mWlX1NdJWfIugab35bKlQLFl1yF
        BTr2tYhHX+62Op/yvnXfm0/RZ+p/zmGfJf/KXImlOCPRUIu5qDgRAKL3Cq9OAgAA
X-CMS-MailID: 20190826103201eucas1p1358f33d8fbdc8cef8ba2ebdcb1b3a51a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190826103201eucas1p1358f33d8fbdc8cef8ba2ebdcb1b3a51a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190826103201eucas1p1358f33d8fbdc8cef8ba2ebdcb1b3a51a
References: <CGME20190826103201eucas1p1358f33d8fbdc8cef8ba2ebdcb1b3a51a@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Dear All,

ARM Architected Timers are present in all CortexA7/A15 based Samsung
Exynos SoCs. So far they were not enabled, because there were some issues
related to their initialization. Samsung Exynos SoCs used custom timer
hardware - Exynos MultiCore Timer. It turned out that enabling MCT it is
also needed to get ARM Architected Timers working, because they both
share some common hardware blocks (global system counter).

This patchset enables support for ARM Architected Timer driver together
with a standard Exynos MultiCore Timer driver, which is kept as a default
timer source on ARM 32bit platforms. Support for ARM architected timers
is essential for enabling proper KVM support on those platforms.

Some of the MCT cleanup patches were earlier a part of the similar
patchset for ARM64-based Exynos5433 SoC.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland

Marek Szyprowski (5):
  clocksource: exynos_mct: Remove dead code
  clocksource: exynos_mct: Fix error path in timer resources
    initialization
  clocksource: exynos_mct: Increase priority over ARM arch timer
  ARM: dts: exynos: Add support ARM architected timers
  ARM: exynos: Enable support for ARM architected timers

 arch/arm/boot/dts/exynos3250.dtsi | 10 ++++++++++
 arch/arm/boot/dts/exynos5250.dtsi |  1 +
 arch/arm/boot/dts/exynos54xx.dtsi | 10 ++++++++++
 arch/arm/mach-exynos/Kconfig      |  1 +
 drivers/clocksource/exynos_mct.c  | 27 +++++++++++++++++----------
 include/linux/cpuhotplug.h        |  2 +-
 6 files changed, 40 insertions(+), 11 deletions(-)

-- 
2.17.1

