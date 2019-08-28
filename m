Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D250A0156
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 28 Aug 2019 14:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbfH1MKP (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 28 Aug 2019 08:10:15 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:57124 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726259AbfH1MKP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 28 Aug 2019 08:10:15 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190828121013euoutp015eede965129a58eeb94bbb461d3e91b4~-FO9NoxRl2141221412euoutp01H
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Aug 2019 12:10:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190828121013euoutp015eede965129a58eeb94bbb461d3e91b4~-FO9NoxRl2141221412euoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1566994213;
        bh=qxg4eKkn9BtPXnVTuj1QUTi1vX7GlxQmt1hcIeadHos=;
        h=From:To:Cc:Subject:Date:References:From;
        b=bRTWTw4wzxEHkrMo2WUEvkFhTku57hHpM3J7ai2LEk3KW9IpnQrrOuolVGbRlT9LJ
         l3qfXG1GDdQ0FeTdkq+yNjRX0mbKY6JbnXfWRY/sPxyRrQu8vrIKqjIPk9UvFiVsxR
         /mb7XVhAuIoKQrHf0JGMBS/wwmJs24m9O13g2xUU=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190828121012eucas1p11c684a21fd49b1eaaa47f78e7ebbd3b3~-FO8jpyTh2730927309eucas1p1V;
        Wed, 28 Aug 2019 12:10:12 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 6C.0D.04374.42F666D5; Wed, 28
        Aug 2019 13:10:12 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190828121011eucas1p1ff9b23536aaa79643e5fca10c02db9a0~-FO7uoFwD0721107211eucas1p1d;
        Wed, 28 Aug 2019 12:10:11 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190828121011eusmtrp294f9b067602613913ea20be078a736da~-FO7gjFKS1346013460eusmtrp2D;
        Wed, 28 Aug 2019 12:10:11 +0000 (GMT)
X-AuditID: cbfec7f5-4ddff70000001116-3a-5d666f24c9ad
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id D8.03.04166.32F666D5; Wed, 28
        Aug 2019 13:10:11 +0100 (BST)
Received: from AMDC2765.DIGITAL.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190828121011eusmtip1126e4504de7131131ceab2154ae52630~-FO7FHqHR2349323493eusmtip1j;
        Wed, 28 Aug 2019 12:10:11 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marc Zyngier <maz@kernel.org>
Subject: [PATCH v3 0/2] Exynos SoCs: enable support for ARM Architected
 Timers
Date:   Wed, 28 Aug 2019 14:10:03 +0200
Message-Id: <20190828121005.29368-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJIsWRmVeSWpSXmKPExsWy7djP87oq+WmxBnfeillsnLGe1eL6l+es
        FufPb2C32PT4GqvFjPP7mCzWHrnLbrFzzklWB3aPTas62Tw2L6n36NuyitHj8ya5AJYoLpuU
        1JzMstQifbsErox9vw4zF5zgq1izXKmB8TF3FyMnh4SAicSjbevYuhi5OIQEVjBKfDx2hwXC
        +cIo0fm2jQnC+cwo8fXBDlaYlpmPD0AlljNKLF3exwbXcn/veRaQKjYBQ4mut11sILaIgLfE
        5DN/2UGKmAWuAnVc+wRUxMEhLBAgMbvNA6SGRUBV4tm268wgNq+ArUT/tY1MENvkJVZvOMAM
        0ishcIJN4t/WzewQCReJz2eXQhUJS7w6vgUqLiPxf+d8JoiGZkaJh+fWskM4PYwSl5tmMEJU
        WUscPn6RFeQKZgFNifW79CHCjhKt9yexgYQlBPgkbrwVBAkzA5mTtk1nhgjzSnS0CUFUq0nM
        Or4Obu3BC5eYIWwPifYV+8FsIYFYiRVLfzNOYJSbhbBrASPjKkbx1NLi3PTUYuO81HK94sTc
        4tK8dL3k/NxNjMAEcPrf8a87GPf9STrEKMDBqMTDm5CcFivEmlhWXJl7iFGCg1lJhPeRSmqs
        EG9KYmVValF+fFFpTmrxIUZpDhYlcd5qhgfRQgLpiSWp2ampBalFMFkmDk6pBsaq8xf/P1jl
        yVm/YPX3mR/W7tst6fQhWWTXruBtyy7ua5kdKf7yqvkelyaxvtvXb0fvUnN81L7J/KbHp6p+
        L7n1/neF12gIMYVeyVwxZQufd7z3Ak6rvc/l2Db9Nu8vX2g0g/fQjivaWnLbprD7vW+bqBqW
        t9s1fP3HBb7vNrs6lvxhkv97a8VCJZbijERDLeai4kQA55TycPwCAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHLMWRmVeSWpSXmKPExsVy+t/xu7rK+WmxBjvWS1tsnLGe1eL6l+es
        FufPb2C32PT4GqvFjPP7mCzWHrnLbrFzzklWB3aPTas62Tw2L6n36NuyitHj8ya5AJYoPZui
        /NKSVIWM/OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYx9vw4zF5zg
        q1izXKmB8TF3FyMnh4SAicTMxweYuhi5OIQEljJKnD58lwkiISNxcloDK4QtLPHnWhcbRNEn
        RokVN/rYQRJsAoYSXW9BEpwcIgK+Eo/frGQBsZkFbjJK7LyjAWILC/hJ/G9YAlbPIqAq8Wzb
        dWYQm1fAVqL/2kaoZfISqzccYJ7AyLOAkWEVo0hqaXFuem6xoV5xYm5xaV66XnJ+7iZGYNht
        O/Zz8w7GSxuDDzEKcDAq8fAmJKfFCrEmlhVX5h5ilOBgVhLhfaSSGivEm5JYWZValB9fVJqT
        WnyI0RRo+URmKdHkfGBM5JXEG5oamltYGpobmxubWSiJ83YIHIwREkhPLEnNTk0tSC2C6WPi
        4JRqYGRMs74T/zpEdtt5Hjej/iXWYQeUnqXf9pda1d05939dmamlbci6AoUbOhumxhk2vtVf
        3ejNy125X6hs2ylmq3Sbf4e7kxTVDZhUiwS//nK8fmiZ87y5jYzzYzU1H/y52ruH7WjdQcM9
        dUFl12ODtj7m5rnjdL7kdqlamMtSvbMuyeyxp85cVmIpzkg01GIuKk4EAPX6TBlRAgAA
X-CMS-MailID: 20190828121011eucas1p1ff9b23536aaa79643e5fca10c02db9a0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190828121011eucas1p1ff9b23536aaa79643e5fca10c02db9a0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190828121011eucas1p1ff9b23536aaa79643e5fca10c02db9a0
References: <CGME20190828121011eucas1p1ff9b23536aaa79643e5fca10c02db9a0@eucas1p1.samsung.com>
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

Best regards
Marek Szyprowski
Samsung R&D Institute Poland


Changelog:

v3:
- checked the status of arch timer registers on all Exynos5 SoCs,
  dropped 'not-fw-configured' property on most of them as requested
  by Marc Zyngier
- dropped enabling arch timers on Exynos3250, as there is no benefit from
  that (none of the Exynos3250-based board boots in HYP mode)

v2: https://www.spinics.net/lists/arm-kernel/msg751017.html
- dropped MCT patches (merged to v5.1)
- dropped timer priority change patch (merged to v5.3)

v1: https://www.spinics.net/lists/arm-kernel/msg751018.html
- initial version, covers some MCT patches previously sent as a timer
  rework for Exynos5433


Patch summary:

Marek Szyprowski (2):
  ARM: dts: exynos: Add support ARM architected timers on Exynos5
  ARM: exynos: Enable support for ARM architected timers

 arch/arm/boot/dts/exynos5420-peach-pit.dts | 4 ++++
 arch/arm/boot/dts/exynos54xx.dtsi          | 9 +++++++++
 arch/arm/boot/dts/exynos5800-peach-pi.dts  | 4 ++++
 arch/arm/mach-exynos/Kconfig               | 1 +
 4 files changed, 18 insertions(+)

-- 
2.17.1

