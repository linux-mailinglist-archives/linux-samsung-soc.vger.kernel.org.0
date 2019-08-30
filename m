Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1077A377B
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 30 Aug 2019 15:04:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727729AbfH3NE2 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 30 Aug 2019 09:04:28 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:59544 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727417AbfH3NE2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 30 Aug 2019 09:04:28 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190830130426euoutp02db07f43c042adc8fce46f0b2b8d286cd~-tQ3n7YMP1583915839euoutp02X
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Aug 2019 13:04:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190830130426euoutp02db07f43c042adc8fce46f0b2b8d286cd~-tQ3n7YMP1583915839euoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1567170266;
        bh=2xqEu70r6RMEME0AhD6SObpfPFhGDn3/wRuu8aUgTB8=;
        h=From:To:Cc:Subject:Date:References:From;
        b=OyBvlEoHcUh6ImM8WdG+czJYmEo4Mu1TLHiBkgHjFafEpKIWJ0gnRe5fb6WA1zg10
         Q3HoZhWVsxVE+VjIlS1lKHVHUaL/unDqoCPZ172JyZavzLNTHK4qOnVTuNF7Vuowbe
         fhrW/66veJUvsDcBb2s/Msug8llr6V11XvAPkhrQ=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190830130425eucas1p161f56b09f6af505fba160b5fa5421a72~-tQ231Aq42896328963eucas1p1k;
        Fri, 30 Aug 2019 13:04:25 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id B0.88.04309.9DE196D5; Fri, 30
        Aug 2019 14:04:25 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190830130425eucas1p1b6806fad77366797271e70ce8ef4d296~-tQ2IVKnZ2898728987eucas1p1g;
        Fri, 30 Aug 2019 13:04:25 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190830130424eusmtrp2c0ebcb8a459ea7f1976fdf9e6aac8c38~-tQ16NQT_2200122001eusmtrp2Z;
        Fri, 30 Aug 2019 13:04:24 +0000 (GMT)
X-AuditID: cbfec7f4-f2e849c0000010d5-e7-5d691ed9aa10
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id EF.79.04117.8DE196D5; Fri, 30
        Aug 2019 14:04:24 +0100 (BST)
Received: from AMDC2765.DIGITAL.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190830130424eusmtip1860981b08019ed0e1440c2cd14d1a3be~-tQ1k85HV1527415274eusmtip1v;
        Fri, 30 Aug 2019 13:04:24 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] ARM: multi_v7_defconfig: Make MAX77802 regulator driver
 built-in
Date:   Fri, 30 Aug 2019 15:04:16 +0200
Message-Id: <20190830130416.10420-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHIsWRmVeSWpSXmKPExsWy7djP87o35TJjDf68ULHYOGM9q8X58xvY
        LTY9vsZqMeP8PiaLtUfusjuwemxa1cnmsXlJvUffllWMHp83yQWwRHHZpKTmZJalFunbJXBl
        zD4iWbCLvaLx1gHWBsY9bF2MnBwSAiYSXXdfsXcxcnEICaxglHjT/IERwvnCKDHp0nNWCOcz
        o8ThIy+AMhxgLa8mcEHElzNKzN/VyQTX0f3/PDvIXDYBQ4mut11gO0QEvCUmn/kLtoNZoI9R
        4vreucwgCWGBYImfF3+xgtgsAqoSLx71MoHYvAK2EnvezmCHOFBeYvWGA8wgzRICB9gkDi1t
        ZoZIuEhc/fgA6gthiVfHt0A1yEj83zmfCaKhmVHi4bm17BBOD6PE5aYZjBBV1hKHj19kBXmI
        WUBTYv0ufYjfHCUuPA2GMPkkbrwVBClmBjInbZvODBHmlehoE4KYoSYx6/g6uK0HL1yCusxD
        4t/ED2B7hARiJQ68ucQ4gVFuFsKqBYyMqxjFU0uLc9NTi43yUsv1ihNzi0vz0vWS83M3MQJj
        /fS/4192MO76k3SIUYCDUYmH12J7eqwQa2JZcWXuIUYJDmYlEd55HhmxQrwpiZVVqUX58UWl
        OanFhxilOViUxHmrGR5ECwmkJ5akZqemFqQWwWSZODilGhh1zD0esLgx/z7nznHLKuyR85Xu
        971br6jzrVTfr1eg+jJk9QE1fRf9q2y9gloNnzJybmieYFcXXC/zZuP5e4JCzkU9e+ayGp6a
        5Ds3dwJrY/gH0zczF5+7WnznlpmvgtXJvo9bnfMzVz76E+niU9TkI6Nz85Q9v4Ise8Ok+VNT
        YrrtDJ5PvajEUpyRaKjFXFScCADv9/7H8QIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMLMWRmVeSWpSXmKPExsVy+t/xu7o35DJjDdZcMLTYOGM9q8X58xvY
        LTY9vsZqMeP8PiaLtUfusjuwemxa1cnmsXlJvUffllWMHp83yQWwROnZFOWXlqQqZOQXl9gq
        RRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJalFunbJehlzD4iWbCLvaLx1gHWBsY9bF2M
        HBwSAiYSryZwdTFycQgJLGWUONrxjKmLkRMoLiNxcloDK4QtLPHnWhcbRNEnRomdD94zgiTY
        BAwlut6CJDg5RAR8JR6/WckCUsQsMIFR4nznDLANwgKBEs0v60FqWARUJV486gVbwCtgK7Hn
        7Qx2iAXyEqs3HGCewMizgJFhFaNIamlxbnpusZFecWJucWleul5yfu4mRmCAbTv2c8sOxq53
        wYcYBTgYlXh4LbanxwqxJpYVV+YeYpTgYFYS4Z3nkRErxJuSWFmVWpQfX1Sak1p8iNEUaPlE
        ZinR5Hxg8OeVxBuaGppbWBqaG5sbm1koifN2CByMERJITyxJzU5NLUgtgulj4uCUamDc7ix5
        13PZ5kVNs/dtnCQ7ZfeypQ7tKr7Ra2RnVD5+MOH6oluPTavftjLcamXxl1ojZnP2s1ebo1zM
        yyDJt9OFvgeayge+fNQkMm3dYkkHO7P7ijwr3wjKuNxnn/xv4eYV7/QypG1N1HlURXufNj4M
        5lpcxi5mKnSpbmsLT+xNta+cImV5D44psRRnJBpqMRcVJwIAwOK430YCAAA=
X-CMS-MailID: 20190830130425eucas1p1b6806fad77366797271e70ce8ef4d296
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190830130425eucas1p1b6806fad77366797271e70ce8ef4d296
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190830130425eucas1p1b6806fad77366797271e70ce8ef4d296
References: <CGME20190830130425eucas1p1b6806fad77366797271e70ce8ef4d296@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Maxim 77802 PMIC is a main PMIC for the following Exynos5 based boards:
Odroid XU, Chromebook Pit and Chromebook Pi. Driver for its voltage
regulator is needed very early during boot to properly instantiate SD/MMC
devices and mount rootfs, so change that driver to be compiled-in.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/configs/multi_v7_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 64aa1136d43c..3dc636c3c5c7 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -562,7 +562,7 @@ CONFIG_REGULATOR_MAX8997=m
 CONFIG_REGULATOR_MAX8998=m
 CONFIG_REGULATOR_MAX77686=y
 CONFIG_REGULATOR_MAX77693=m
-CONFIG_REGULATOR_MAX77802=m
+CONFIG_REGULATOR_MAX77802=y
 CONFIG_REGULATOR_PALMAS=y
 CONFIG_REGULATOR_PBIAS=y
 CONFIG_REGULATOR_PWM=y
-- 
2.17.1

