Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F76B9CD4F
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 26 Aug 2019 12:32:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730819AbfHZKcH (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 26 Aug 2019 06:32:07 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:39680 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730992AbfHZKcF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Aug 2019 06:32:05 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190826103203euoutp02614cf6f0021beff3d514e8085762bace~_cmrtqeuP1642716427euoutp02z
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Aug 2019 10:32:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190826103203euoutp02614cf6f0021beff3d514e8085762bace~_cmrtqeuP1642716427euoutp02z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1566815523;
        bh=NZ+VJSBSuMJZ1LsKhikkT1JtTORGR3MpX9HFSakbNt8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jiZXgtKkaY4l26GGPK9+os1bcuAvCmeoUf+quC03D5pHK17+EXmh+QRY1luRhn3wk
         QEyrs86sfxJaLSkbdtVYYpljB5fP0tGoH0zOt30rsAUlWMy1il8UAhHvdsYoCbJkwD
         40aDZdk18lZbwmMs0dJizqZne3vf4iPBxKzkaV9A=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190826103203eucas1p253ac54e8f949f2c3179390520a1bd4db~_cmrJ34zW2269822698eucas1p2t;
        Mon, 26 Aug 2019 10:32:03 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 61.1C.04309.325B36D5; Mon, 26
        Aug 2019 11:32:03 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190826103202eucas1p123d075e3da50b5aa1574ae46aa6aa946~_cmqKyvbh1330513305eucas1p1v;
        Mon, 26 Aug 2019 10:32:02 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190826103202eusmtrp2fe7c49bb526d3075f66390db82a35592~_cmp8yav11574315743eusmtrp2p;
        Mon, 26 Aug 2019 10:32:02 +0000 (GMT)
X-AuditID: cbfec7f4-afbff700000010d5-fd-5d63b523f853
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 8E.C1.04166.125B36D5; Mon, 26
        Aug 2019 11:32:02 +0100 (BST)
Received: from AMDC2765.DIGITAL.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190826103201eusmtip25081a60986ad78ed10d013113226f758~_cmpkoYjL0460004600eusmtip2g;
        Mon, 26 Aug 2019 10:32:01 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2 0/2] Exynos SoCs: enable support for ARM Architected
 Timers
Date:   Mon, 26 Aug 2019 12:31:40 +0200
Message-Id: <20190826103142.3477-2-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190826103142.3477-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPIsWRmVeSWpSXmKPExsWy7djP87rKW5NjDXavZLHYOGM9q8X1L89Z
        Lc6f38BusenxNVaLGef3MVmsPXKX3YHNY9OqTjaPzUvqPfq2rGL0+LxJLoAlissmJTUnsyy1
        SN8ugSvj45Nf7AWbuCu2NV5gb2Ccz9nFyMkhIWAicWv/YTYQW0hgBaPEsq6ULkYuIPsLo8SR
        C/vYIZzPjBJPm/4ywXS8+7aKFSKxnFHi8OOzjHAtSw9fYwepYhMwlOh62wU2V0TAW2Lymb9g
        o5gFtjFKbOl9wAySEBYIkJjz8xrQWA4OFgFViYarySAmr4CNxPljmhDL5CVWbzjADBLmFLCV
        eLDCEGSKhMBjNokvd56xQdS4SBz6fJIdwhaWeHV8C5QtI/F/53wmiIZmRomH59ayQzg9jBKX
        m2YwQlRZSxw+fpEVZAOzgKbE+l36EGFHiflN+8EWSwjwSdx4KwgSZgYyJ22bDhXmlehoE4Ko
        VpOYdXwd3NqDFy4xQ9geEleePGWCBM8ERom7m3YwT2CUn4WwbAEj4ypG8dTS4tz01GKjvNRy
        veLE3OLSvHS95PzcTYzAZHD63/EvOxh3/Uk6xCjAwajEw5tQmhwrxJpYVlyZe4hRgoNZSYQ3
        Rz8xVog3JbGyKrUoP76oNCe1+BCjNAeLkjhvNcODaCGB9MSS1OzU1ILUIpgsEwenVANjTN2T
        38HajgK/Qo7JdU6JerbK1NNm4U9HGcWjPxoLfzy7euv9O4t5R5bp2bySkPoW5PfN9JJ4Wq3b
        fQdGFq319a9ZmaYr3v904Xvmjg8ZnNMtHz2T5jA7/7uesaOf9d3HiAufJwSE1XIK74nyeGf1
        8cX3//tCfFLKqlWleiS0Yxb92V0j1zxXiaU4I9FQi7moOBEAYxKXFgIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPLMWRmVeSWpSXmKPExsVy+t/xe7pKW5NjDab7WWycsZ7V4vqX56wW
        589vYLfY9Pgaq8WM8/uYLNYeucvuwOaxaVUnm8fmJfUefVtWMXp83iQXwBKlZ1OUX1qSqpCR
        X1xiqxRtaGGkZ2hpoWdkYqlnaGwea2VkqqRvZ5OSmpNZllqkb5egl/HxyS/2gk3cFdsaL7A3
        MM7n7GLk5JAQMJF4920VaxcjF4eQwFJGiTOPb7NDJGQkTk5rYIWwhSX+XOtigyj6xCjxbsdt
        ZpAEm4ChRNdbkAQnh4iAr8TjNytZQIqYBXYwSmzZ8RasW1jAT2L/tCWMXYwcHCwCqhINV5NB
        TF4BG4nzxzQh5stLrN5wgBkkzClgK/FghSFIWAio4s+jeawTGPkWMDKsYhRJLS3OTc8tNtQr
        TswtLs1L10vOz93ECAzMbcd+bt7BeGlj8CFGAQ5GJR7ehNLkWCHWxLLiytxDjBIczEoivDn6
        ibFCvCmJlVWpRfnxRaU5qcWHGE2BLprILCWanA+MmrySeENTQ3MLS0NzY3NjMwslcd4OgYMx
        QgLpiSWp2ampBalFMH1MHJxSDYytzfZxvy5b7vBcK3frROvJKVcrfLY4f/esig/YW5l7sa1m
        S++xomMX3tvU/pjz4s8+lffrzXIUBR4EqK0qET/Q8Fj74LKD2xrP3WN4nN7x3Fom//zNY4X/
        15cx9WY3OF2Q6v/05u6Vla0Se9Q8fXTqHiXbf3hVuGUPd61kc7vSbpGwpFtXNK2VWIozEg21
        mIuKEwFG1G+EYgIAAA==
X-CMS-MailID: 20190826103202eucas1p123d075e3da50b5aa1574ae46aa6aa946
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190826103202eucas1p123d075e3da50b5aa1574ae46aa6aa946
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190826103202eucas1p123d075e3da50b5aa1574ae46aa6aa946
References: <20190826103142.3477-1-m.szyprowski@samsung.com>
        <CGME20190826103202eucas1p123d075e3da50b5aa1574ae46aa6aa946@eucas1p1.samsung.com>
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

v2:
- dropped MCT patches (merged to v5.1)
- dropped timer priority change patch (merged to v5.3)

v1: https://patchwork.kernel.org/cover/10814913/
- initial version, covers some MCT patches previously sent as a timer
  rework for Exynos5433


Patch summary:

Marek Szyprowski (2):
  ARM: dts: exynos: Add support ARM architected timers
  ARM: exynos: Enable support for ARM architected timers

 arch/arm/boot/dts/exynos3250.dtsi | 10 ++++++++++
 arch/arm/boot/dts/exynos5250.dtsi |  1 +
 arch/arm/boot/dts/exynos54xx.dtsi | 10 ++++++++++
 arch/arm/mach-exynos/Kconfig      |  1 +
 4 files changed, 22 insertions(+)

-- 
2.17.1

