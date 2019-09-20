Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A556AB9035
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 20 Sep 2019 15:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbfITND0 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 20 Sep 2019 09:03:26 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:46499 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726984AbfITND0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Sep 2019 09:03:26 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190920130325euoutp01d83aa8450c26172dddf22a14a58692b6~GJy_UBEwh3045630456euoutp01i
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Sep 2019 13:03:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190920130325euoutp01d83aa8450c26172dddf22a14a58692b6~GJy_UBEwh3045630456euoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1568984605;
        bh=6Pr3bvlwTEEuaJryJIjyun0TpsiDiHDMaMQxx7hutTk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ubMgNsHARLMq1TeGGWcA+08NV7BWgfXB58Pll3imGPzTllhXVFCsaU9V6SnZ3MQub
         8qc+B6C+GmTdlCueYGuSoKPzv3P1H3GaQTKDUlpRWhOUp/5IT7ZgmKwKT/mWzZ8BXu
         XsP0v/NDoGDJjACX4uTZY7AQXEsczYCixit7Evvo=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190920130324eucas1p2026e88c13bccc5334aa475f44156ae9a~GJy9YmXuM1572315723eucas1p2Y;
        Fri, 20 Sep 2019 13:03:24 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 57.DB.04309.B1EC48D5; Fri, 20
        Sep 2019 14:03:23 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190920130323eucas1p218c6822eca3869eb0d3b7380497bbca4~GJy8Pm_q91587515875eucas1p2n;
        Fri, 20 Sep 2019 13:03:23 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190920130322eusmtrp18133960dcc519cdf00c91349b024d1ed~GJy7_A22n0476604766eusmtrp1j;
        Fri, 20 Sep 2019 13:03:22 +0000 (GMT)
X-AuditID: cbfec7f4-afbff700000010d5-fa-5d84ce1bac4a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 82.11.04117.A1EC48D5; Fri, 20
        Sep 2019 14:03:22 +0100 (BST)
Received: from AMDC3061.DIGITAL.local (unknown [106.120.51.75]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190920130322eusmtip22fb2f23f6afc2355304e5de35b82149b~GJy7UlkfU1284812848eusmtip2f;
        Fri, 20 Sep 2019 13:03:22 +0000 (GMT)
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
To:     broonie@kernel.org, krzk@kernel.org
Cc:     lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
        sbkim73@samsung.com, alsa-devel@alsa-project.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 08/10] ASoC: samsung: Rename Arndale card driver
Date:   Fri, 20 Sep 2019 15:02:17 +0200
Message-Id: <20190920130218.32690-9-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190920130218.32690-1-s.nawrocki@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSa0hTYRjHe89l5zidnqbim0bGNEvBWyWdUCKpYF+CPpYXaupBpW3ajloW
        qJmmeWtoMVHDUd6amDZ1lWGTeVl4m6MhkpqXBLPSAq3UQvN4tL79nv/z/7/Pw8NLouJ63J1M
        VKYwKqVMLhEIMUPfmsXfYzgnOmhplaZtVhNCPy9vxumHM3MC2parB3R1zzBOWywtBP3Tlo/Q
        +o+jOF1ueYPQTT2TBL38zYjTuZ09BN39NQ+nrQ0ryGlHactytkD6qmKSkOp19wTS1ppMqaZq
        E0hL2nRAuqw/cIGIEIbFMfLENEYVeOqKMKG/rBAkz4hvmNoWkSww7VQA7EhIHYfZxlqMYzHV
        AKDul6QACLd4BcDR8nWML5YBrNT2CXYTU+1tOJ+oB3Bx0PdfYmOiHeEaAioYFveWAI5dqMNw
        qjwb50wotYBAde+zbZMzdQZ+erBKFACSxKhD8N3a9gARFQo7520EP8wTNrZ0oRzbUWFwYewx
        wr0DKQMBX2wOAd50FlbOzO9s5ww/m9t2wvvhQFkRxgfuAFj0epzgCzWAU2btTjoUdputOLcF
        SvnC5o5AXg6HS9UWhJMh5QjHFvdyMrqFpQYNyssimH9XzLu94W+dBuHZHRbObWI8S+FanRnn
        D3QfwLmBdYEaeFb8H6YFQAfcmFRWEc+wR5XM9QBWpmBTlfEBsUkKPdj6PgMb5pWXoONPjAlQ
        JJA4iLRvc6LFuCyNTVeYACRRiYuoKiQ7WiyKk6XfZFRJl1WpcoY1AQ8Sk7iJbu2ZjhRT8bIU
        5irDJDOq3S5C2rlngUvekZagifovXn6Z+zzEyWhTl6GOPTcodwrOGE54umqMcbDqNImufobI
        wSMjj/KcvN7P9tcpjQarfCXKtarhRO3F8Wtlx2wZtWEK7dDtH9/9o4oLfTyLMkcE9t20/YSx
        dBhz8iw2h8QKK8LPq2Z91I0bT5CaIeXBiJPTH8ZagyQYmyAL9kNVrOwvfUZ2BjoDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgkeLIzCtJLcpLzFFi42I5/e/4PV2pcy2xBhPvWVpcuXiIyWLjjPWs
        FlMfPmGzuNK6idFi/pFzrBbnz29gt/h2pYPJYtPja6wWM87vY7JYe+Quu8Xn9/tZLVr3HmG3
        OPymndXi4oovTA58Hhs+N7F57Jx1l91j06pONo/NS+o9ps/5z+jRt2UVo8fnTXIB7FF6NkX5
        pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GacmdzMWPBSq
        OLTlLVMD4wP+LkZODgkBE4n7W7ewdjFycQgJLGWUWLvkIUsXIwdQQkpifosSRI2wxJ9rXWwQ
        NZ8YJfaeWcAMkmATMJToPdrHCGKLCGhKdMy7DTaIWeA7k8SBxyfBioQFnCVeTPnBDjKURUBV
        4vJPNpAwr4C1xN7nV9ghFshLrN5wAKycU8BG4uWNRUwgthBQzel9e9knMPItYGRYxSiSWlqc
        m55bbKRXnJhbXJqXrpecn7uJERgL24793LKDsetd8CFGAQ5GJR5ej2MtsUKsiWXFlbmHGCU4
        mJVEeOeYNsUK8aYkVlalFuXHF5XmpBYfYjQFumkis5Rocj4wTvNK4g1NDc0tLA3Njc2NzSyU
        xHk7BA7GCAmkJ5akZqemFqQWwfQxcXBKNTDGXkt1fTIv2cpUc+FjR9OdYlP+yVUVrr1Ut2BN
        aPf2o/wF9a/3i7ds57ereF5oUjDDnVPdNXJa3JcDJWuPT1c+OlVoJecklZPpvy8+fsm8R9Gs
        p/fa5r72nxuMGS4/0HiiWOC333yXsM1Myz0c0219DOfM/PNha3ySxe/XRT+q11atXvtwxXVH
        JZbijERDLeai4kQA4wv62JsCAAA=
X-CMS-MailID: 20190920130323eucas1p218c6822eca3869eb0d3b7380497bbca4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190920130323eucas1p218c6822eca3869eb0d3b7380497bbca4
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190920130323eucas1p218c6822eca3869eb0d3b7380497bbca4
References: <20190920130218.32690-1-s.nawrocki@samsung.com>
        <CGME20190920130323eucas1p218c6822eca3869eb0d3b7380497bbca4@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Rename arndale_rt5631.c to just arnddale.c as we support other CODECs
than RT5631.  While at it replace spaces in Kconfig with tabs.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes since v1:
 - new patch.
---
 sound/soc/samsung/Kconfig                         | 10 +++++-----
 sound/soc/samsung/Makefile                        |  4 ++--
 sound/soc/samsung/{arndale_rt5631.c => arndale.c} |  0
 3 files changed, 7 insertions(+), 7 deletions(-)
 rename sound/soc/samsung/{arndale_rt5631.c => arndale.c} (100%)

diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index 6803cbfa9e46..1a0b163ca47b 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -194,11 +194,11 @@ config SND_SOC_ODROID
 	help
 	  Say Y here to enable audio support for the Odroid XU3/XU4.
 
-config SND_SOC_ARNDALE_RT5631_ALC5631
-        tristate "Audio support for RT5631(ALC5631) on Arndale Board"
-        depends on I2C
-        select SND_SAMSUNG_I2S
-        select SND_SOC_RT5631
+config SND_SOC_ARNDALE
+	tristate "Audio support for Arndale Board"
+	depends on I2C
+	select SND_SAMSUNG_I2S
+	select SND_SOC_RT5631
 	select MFD_WM8994
 	select SND_SOC_WM8994
 
diff --git a/sound/soc/samsung/Makefile b/sound/soc/samsung/Makefile
index c3b76035f69c..8f5dfe20b9f1 100644
--- a/sound/soc/samsung/Makefile
+++ b/sound/soc/samsung/Makefile
@@ -39,7 +39,7 @@ snd-soc-lowland-objs := lowland.o
 snd-soc-littlemill-objs := littlemill.o
 snd-soc-bells-objs := bells.o
 snd-soc-odroid-objs := odroid.o
-snd-soc-arndale-rt5631-objs := arndale_rt5631.o
+snd-soc-arndale-objs := arndale.o
 snd-soc-tm2-wm5110-objs := tm2_wm5110.o
 
 obj-$(CONFIG_SND_SOC_SAMSUNG_JIVE_WM8750) += snd-soc-jive-wm8750.o
@@ -62,5 +62,5 @@ obj-$(CONFIG_SND_SOC_LOWLAND) += snd-soc-lowland.o
 obj-$(CONFIG_SND_SOC_LITTLEMILL) += snd-soc-littlemill.o
 obj-$(CONFIG_SND_SOC_BELLS) += snd-soc-bells.o
 obj-$(CONFIG_SND_SOC_ODROID) += snd-soc-odroid.o
-obj-$(CONFIG_SND_SOC_ARNDALE_RT5631_ALC5631) += snd-soc-arndale-rt5631.o
+obj-$(CONFIG_SND_SOC_ARNDALE) += snd-soc-arndale.o
 obj-$(CONFIG_SND_SOC_SAMSUNG_TM2_WM5110) += snd-soc-tm2-wm5110.o
diff --git a/sound/soc/samsung/arndale_rt5631.c b/sound/soc/samsung/arndale.c
similarity index 100%
rename from sound/soc/samsung/arndale_rt5631.c
rename to sound/soc/samsung/arndale.c
-- 
2.17.1

