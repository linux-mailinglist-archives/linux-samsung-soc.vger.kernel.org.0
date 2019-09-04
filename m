Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7373A7F44
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  4 Sep 2019 11:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729643AbfIDJYy (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 4 Sep 2019 05:24:54 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:34499 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729268AbfIDJYx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Sep 2019 05:24:53 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190904092451euoutp02375aae94d5a38b4c6c6df5dd4bf9dfe8~BMfkTcfcL2785127851euoutp02C
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Sep 2019 09:24:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190904092451euoutp02375aae94d5a38b4c6c6df5dd4bf9dfe8~BMfkTcfcL2785127851euoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1567589091;
        bh=V370ltT0rd0fHIGcav3btRyCP3B9v6qbYkKkz3baA9s=;
        h=From:To:Cc:Subject:Date:References:From;
        b=d5x9fvcwcgLIk7PSKRT9xLpeY0JVpvyzCPdf7WpA5VgyjOJAEjk7qBT9rD8jpEgV8
         HRHiZEIu7DzcWlUEOTmc0QpAq1Fm9zt0u9kQ3hvoiO24REYHjaljQv+sD6SzIjC85G
         GhHyzlMvnH64+0l2RIHtL7z7Q3hm5IIWMhXTXD5k=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190904092450eucas1p2516b5418a228bb98356487ebc491e263~BMfjy9Bnw2898628986eucas1p26;
        Wed,  4 Sep 2019 09:24:50 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id D7.2B.04309.2E28F6D5; Wed,  4
        Sep 2019 10:24:50 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190904092449eucas1p28ec98275a95882948f4d298f15c15325~BMfjDzlFl2694026940eucas1p2o;
        Wed,  4 Sep 2019 09:24:49 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190904092449eusmtrp1be720517aed01c3099b48aefa2c53a76~BMfi1kYbH2981829818eusmtrp1a;
        Wed,  4 Sep 2019 09:24:49 +0000 (GMT)
X-AuditID: cbfec7f4-f2e849c0000010d5-ba-5d6f82e28ed9
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 2A.CA.04117.1E28F6D5; Wed,  4
        Sep 2019 10:24:49 +0100 (BST)
Received: from AMDC2765.DIGITAL.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190904092449eusmtip11b9b5e478f56d4d412351eceb2193622~BMficHt3R1532115321eusmtip1I;
        Wed,  4 Sep 2019 09:24:49 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 0/3] arm64: dts: exynos: A few more fixes
Date:   Wed,  4 Sep 2019 11:24:39 +0200
Message-Id: <20190904092442.26260-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNIsWRmVeSWpSXmKPExsWy7djPc7qPmvJjDQ6sF7Z4MG8bm8XGGetZ
        Lc6f38BuMeP8PiaLtUfusjuwemxa1cnm0bdlFaPH501yAcxRXDYpqTmZZalF+nYJXBn3On+y
        FUxlrWj63sbWwNjH0sXIySEhYCLR8e0AexcjF4eQwApGiWNfVrNAOF8YJZoaW5kgnM+MEs9v
        7GOCaVnX+pERIrGcUWLy2mXscC03ry5mBaliEzCU6HrbxQZiiwioSnxuW8AOYjMLbGeUaLws
        CGILC1hK3H39HewQFqCa7htdjCA2r4CtRNO5jawQ2+QlVm84wAxhb2GTWL9FE8J2kdj66iw7
        hC0s8er4FihbRuL05B6wHyQEmhklHp5byw7h9DBKXG6awQhRZS1x+PhFoA0cQBdpSqzfpQ8R
        dpQ49G8HO0hYQoBP4sZbQYib+SQmbZvODBHmlehoE4KoVpOYdXwd3NqDFy5Bnekh8fdiN1hc
        SCBWYufOKawTGOVmIexawMi4ilE8tbQ4Nz212CgvtVyvODG3uDQvXS85P3cTIzDKT/87/mUH
        464/SYcYBTgYlXh4d/jlxQqxJpYVV+YeYpTgYFYS4Q3dkxMrxJuSWFmVWpQfX1Sak1p8iFGa
        g0VJnLea4UG0kEB6YklqdmpqQWoRTJaJg1OqgTF1u/18tuOri7r0vRIurJiRuM1oXuLhyR8e
        yen/cp55e6ujzO+saZvOuPAJy1b1XH9sf1VA00bIw0uE9fu3RKapy+5u5Johp56mYLlV9xWn
        xePPN53y4p30tsl6eX5pmhv6Rq1tcnqx35Ri9sl8u9g5vcRcrv6c+q2cs9H8RuixNUoL1r1Y
        aqHEUpyRaKjFXFScCACaIujQ7gIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrELMWRmVeSWpSXmKPExsVy+t/xu7oPm/JjDXqb5S0ezNvGZrFxxnpW
        i/PnN7BbzDi/j8li7ZG77A6sHptWdbJ59G1ZxejxeZNcAHOUnk1RfmlJqkJGfnGJrVK0oYWR
        nqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsa9zp9sBVNZK5q+t7E1MPaxdDFyckgI
        mEisa/3I2MXIxSEksJRR4vHOjYwQCRmJk9MaWCFsYYk/17rYIIo+MUpsOfeaCSTBJmAo0fUW
        JMHJISKgKvG5bQE7SBGzwE5Giebrs9lBEsIClhJ3X38HW8cCVNR9owtsA6+ArUTTuY1QG+Ql
        Vm84wDyBkWcBI8MqRpHU0uLc9NxiI73ixNzi0rx0veT83E2MwPDaduznlh2MXe+CDzEKcDAq
        8fDu8MuLFWJNLCuuzD3EKMHBrCTCG7onJ1aINyWxsiq1KD++qDQntfgQoynQ8onMUqLJ+cDQ
        zyuJNzQ1NLewNDQ3Njc2s1AS5+0QOBgjJJCeWJKanZpakFoE08fEwSnVwHhuwZ8iL6lbvTZC
        ixtrQ2YGb5tUzVRwlfGfYOwqyTXcG1QnHP0j1MPEHt7NHNB/wjZjh8zEGp1D/0NZnHMaf3Gd
        1Or57sdz2PCTvKiR04nqJIGDzMbP99tkHI7TyQ5pKuXl+vZhi0LtqqbVN4KskjbkmvzKSF4Q
        O6W6IW3Lhy9neW9POivxUomlOCPRUIu5qDgRAEf45WRFAgAA
X-CMS-MailID: 20190904092449eucas1p28ec98275a95882948f4d298f15c15325
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190904092449eucas1p28ec98275a95882948f4d298f15c15325
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190904092449eucas1p28ec98275a95882948f4d298f15c15325
References: <CGME20190904092449eucas1p28ec98275a95882948f4d298f15c15325@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Dear All,

While fixing the issue reported by Alim Akhtar, I've noticed a few more
issues in arm64/exynos dts files. This patchset fixes them.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland


Patch summary:

Marek Szyprowski (3):
  arm64: dts: exynos: Move GPU under /soc node for Exynos5433
  arm64: dts: exynos: Move GPU under /soc node for Exynos7
  arm64: dts: exynos: Remove useless #address-cells property for GIC
    node

 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 102 ++++++++++-----------
 arch/arm64/boot/dts/exynos/exynos7.dtsi    |  23 +++--
 2 files changed, 62 insertions(+), 63 deletions(-)

-- 
2.17.1

