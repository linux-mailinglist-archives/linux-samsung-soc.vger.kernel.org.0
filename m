Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC5241D2C2B
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 14 May 2020 12:08:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725955AbgENKIQ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 14 May 2020 06:08:16 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:52269 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725925AbgENKIP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 May 2020 06:08:15 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200514100812euoutp01c191b11a089704e3f76f5b629f9ac6ed~O3Spyfr7G0661006610euoutp01q
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 May 2020 10:08:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200514100812euoutp01c191b11a089704e3f76f5b629f9ac6ed~O3Spyfr7G0661006610euoutp01q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1589450892;
        bh=pyYr7Ewi8sGlBrwS6b6/m9DYGRvNNmkmK1alQSdWm+o=;
        h=From:To:Cc:Subject:Date:References:From;
        b=ZGcTyQwTG3eSIhs1Lbasehs3Ynx400YQ/m3vNZvYusLnf9FqMHENkX+OyK/E9iw2/
         Qcl5WoTssbT7bsMbrXOctOkL1xSgFznFB79JKPnfdkCUkoQQiUL69x6R5RUNQKep9v
         fT9t8n9N4RzGbUOqA/krnFDNNleTatDIuVaBCJbk=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200514100812eucas1p249b633ebc2422de71176126186eaec4b~O3Spa9AlR2384123841eucas1p2Y;
        Thu, 14 May 2020 10:08:12 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 48.A9.60698.C881DBE5; Thu, 14
        May 2020 11:08:12 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200514100812eucas1p1d42ad25e93858a4bc801049f93f58250~O3SpDWnyW2113921139eucas1p1u;
        Thu, 14 May 2020 10:08:12 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200514100812eusmtrp1448896cd90fbb65b5040f8a57da9a553~O3SpCpHks2324223242eusmtrp1Z;
        Thu, 14 May 2020 10:08:12 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-55-5ebd188c4a6f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id C6.62.07950.C881DBE5; Thu, 14
        May 2020 11:08:12 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200514100811eusmtip14ca3836435828a1f65de3288f87e479e~O3Sop6xwg1405014050eusmtip1p;
        Thu, 14 May 2020 10:08:11 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH] drm/exynos: mixer: Fix enabling of the runtime power
 management
Date:   Thu, 14 May 2020 12:08:12 +0200
Message-Id: <20200514100812.17043-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRmVeSWpSXmKPExsWy7djP87o9EnvjDNZdl7G4te4cq8XGGetZ
        La58fc9mMen+BBaLGef3MVmsPXKX3WLG5JdsDuwe97uPM3n0bVnF6PF5k1wAcxSXTUpqTmZZ
        apG+XQJXxqYVKQX3OSquvnrO0sC4ib2LkZNDQsBEYvaXZSxdjFwcQgIrGCVuTrjICuF8YZTo
        PPcCyvnMKHFg6zY2mJZJT9aygNhCAssZJZ5/TITrmLPtETNIgk3AUKLrbRdYg4iAm0TT4Zlg
        k5gFrjNKfPuxCGy5sECQxKJlHWANLAKqEu9XnGXqYuTg4BWwlVj0LgRimbzE6g0HmCHsI2wS
        sy/mQtguEs3vDjNC2MISr45vgfpHRuL05B6wfyQEmhklHp5byw7h9DBKXG6aAdVhLXHn3C82
        kGXMApoS63fpQ4QdJdbPv8cIEpYQ4JO48VYQJMwMZE7aNp0ZIswr0dEmBFGtJjHr+Dq4tQcv
        XII600PiesttVkj4xEq0dp1gmsAoNwth1wJGxlWM4qmlxbnpqcXGeanlesWJucWleel6yfm5
        mxiBUX/63/GvOxj3/Uk6xCjAwajEw/vg+u44IdbEsuLK3EOMEhzMSiK8fuuBQrwpiZVVqUX5
        8UWlOanFhxilOViUxHmNF72MFRJITyxJzU5NLUgtgskycXBKNTDuFqhctCjxstmTGT8e71WM
        PB8X9JPP0NdnwmHr5tPPbWsz/Sakre/v+LZu4YdW8b6+xjUPHde9d4z9ZfNnEZO46tNrabvO
        X+o69N88nuHdZt5mMwsTYzWxyZ07K5N1D29Zo3u5If7xcknj/1naYVv8lUs+S0hYb3I7xFpY
        L8QV5rWR2XyWyHclluKMREMt5qLiRABDt4S19gIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJLMWRmVeSWpSXmKPExsVy+t/xu7o9EnvjDJ5NZba4te4cq8XGGetZ
        La58fc9mMen+BBaLGef3MVmsPXKX3WLG5JdsDuwe97uPM3n0bVnF6PF5k1wAc5SeTVF+aUmq
        QkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexqYVKQX3OSquvnrO
        0sC4ib2LkZNDQsBEYtKTtSxdjFwcQgJLGSWaNs5khkjISJyc1sAKYQtL/LnWxQZiCwl8YpR4
        MoEPxGYTMJToegsRFxHwkGj+dpwdZBCzwG1GiaUf5rGAJIQFAiQ+LTgBZrMIqEq8X3GWqYuR
        g4NXwFZi0bsQiPnyEqs3HGCewMizgJFhFaNIamlxbnpusZFecWJucWleul5yfu4mRmCwbTv2
        c8sOxq53wYcYBTgYlXh4LW7tjhNiTSwrrsw9xCjBwawkwuu3HijEm5JYWZValB9fVJqTWnyI
        0RRo90RmKdHkfGAk5JXEG5oamltYGpobmxubWSiJ83YIHIwREkhPLEnNTk0tSC2C6WPi4JRq
        YJSU2pFySILvUpbhwZjon9bL/rXf38YoE9+UL3aB51fCsvc/KwMvTI+6dMTipZKamfudGBM5
        jivft8/K7+T6eC77po1JUkZH0P57CdZ8Vt97a+UaDjs1KnwT/WFq5zvv4I+CaBNHjYd/JV23
        R/hqpgUu4IgQ0+zsNmO8ubSzrqFIZYpzQF68EktxRqKhFnNRcSIAVtJokkwCAAA=
X-CMS-MailID: 20200514100812eucas1p1d42ad25e93858a4bc801049f93f58250
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200514100812eucas1p1d42ad25e93858a4bc801049f93f58250
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200514100812eucas1p1d42ad25e93858a4bc801049f93f58250
References: <CGME20200514100812eucas1p1d42ad25e93858a4bc801049f93f58250@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Runtime power management is essential for the Exynos Mixer driver
operation. It should be enabled before adding its DRM component, because
in some cases (when deferred probe takes place due to the IOMMU
availability) the DRM driver might be initialized directly from the
Mixer's component_add() call, what results in starting the driver
operation without enabling the runtime power management.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index ffbf4a950f69..829d2ce7560d 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1200,9 +1200,11 @@ static int mixer_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, ctx);
 
+	pm_runtime_enable(dev);
+
 	ret = component_add(&pdev->dev, &mixer_component_ops);
-	if (!ret)
-		pm_runtime_enable(dev);
+	if (ret)
+		pm_runtime_disable(dev);
 
 	return ret;
 }
-- 
2.17.1

