Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FAB087ADA
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  9 Aug 2019 15:10:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbfHINKL (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 9 Aug 2019 09:10:11 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:50213 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406938AbfHINKL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Aug 2019 09:10:11 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190809131010euoutp01c67ebaceaf27c7e0bc9d92f1cd3b4a12~5Qy3xQciJ0141201412euoutp01g
        for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Aug 2019 13:10:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190809131010euoutp01c67ebaceaf27c7e0bc9d92f1cd3b4a12~5Qy3xQciJ0141201412euoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1565356210;
        bh=eV7aXC+fniaseilztzXwk8ZuX/jT4ZN5XIooSNcpGkc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=drytBoGwu2dyaRQy4IjWhm9WU60SI1dlpNZ+XDu6tms/DpXJv6OAdyf2yGzEssnrA
         GxTNHRvu9ELHM4F2RmKZdNSOt+RBafeW2vl6dnX+81OqnzttKsS6P4Qh4RoyUVjbyr
         jaIUvDsihBM8oPZACKfLQ6751V7vk7oguKk0wgm8=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190809131009eucas1p2f96a4e9a570e501def3688f3e42ea557~5Qy3TJ7Th0583805838eucas1p2E;
        Fri,  9 Aug 2019 13:10:09 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id EF.9E.04469.1B07D4D5; Fri,  9
        Aug 2019 14:10:09 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190809131008eucas1p278e77594a3b73a92db8987dcb0eccd80~5Qy2kDLwm0564805648eucas1p2W;
        Fri,  9 Aug 2019 13:10:08 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190809131008eusmtrp202bd8997bf6e5e3105dacc7b750679c6~5Qy2WBi4X2175521755eusmtrp2B;
        Fri,  9 Aug 2019 13:10:08 +0000 (GMT)
X-AuditID: cbfec7f2-54fff70000001175-ea-5d4d70b1e235
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id E8.E7.04166.0B07D4D5; Fri,  9
        Aug 2019 14:10:08 +0100 (BST)
Received: from AMDC2765.DIGITAL.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190809131008eusmtip2c2b713d4db3753ac9b7bc7c54734ba83~5Qy2CAH4Y1790617906eusmtip2W;
        Fri,  9 Aug 2019 13:10:08 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 3/3] ARM: dts: exynos: Add CAM power domain to
 Exynos5422/5800
Date:   Fri,  9 Aug 2019 15:09:58 +0200
Message-Id: <20190809130958.25410-3-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190809130958.25410-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VRa0hTcRTvfx+7d8vVdYqeLJIGZUlpI8FBZQYRKxTtW2SjbnmZ4py26yyt
        QJNkrhqzJMWo/FBqE5vOBxr4LmebbWpmpT0FP1iMqCVkYObd7fHt9+QczqFxxSwRRWcbCjij
        gdUrJTKic3jRu6M1P1W70za/Vt1a4yDVPl8Lpa7x9WLq5sdvqWRC47RXSDTWdjvSBJwb0/Fj
        sj2ZnD67kDPGJ52UZS31W8n8r5Jz3c86iBL0mrQgmgYmASrGtBYkoxVMI4K+vklMJN8ROKaW
        cJEEEPjftREWJA02bkzZkWg0IHB9HqYEI1hZKE0VsIRRgcVvkQg4nNkMgfI6SijgjBXBy57b
        uGCEMekwdLkRCXsQK6Fet0GQ5cxeuNluk4jDoqGppT8YlzJJcN89ENwImBEJzNVX/9noAHj7
        x5GIw+CTq50S8QZY7r6LiYUyBB+9zZRIriJ4fqnmT2M3DLnGg9fAmW3geBQvyvuhp3QIE4+0
        Bl75QwUZX4HXO6txUZaDuVwhprdArevhv7EDYxO4iDXgK3OT4rEqETzx/iRtKLr2/7A6hOwo
        kjPxuTqOVxm4s3E8m8ubDLq403m5TrTyec8v17cutDBxahAxNFKGyEs2pWgVJFvIF+UOIqBx
        Zbh8kk7VKuSZbFExZ8w7YTTpOX4QracJZaT8/KoPGQpGxxZwORyXzxn/uhgtjSpB2DSrjzlj
        nr/W5cGWVqc4X/id8RFb02JGZ6iqkSOVD6goVUhsQDd9sM12J2dmXKOMI3n9OtbetOy79SPB
        czwrdHv36K7FBhIVe64U1KYf9j21XXyTHDDuc0eYdFRagJ41F1U57lXqMnJC5qrrD5m/WBOl
        Ry8kdmDu9wuWTCXBZ7GqWNzIs78BmrJOQ/UCAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCLMWRmVeSWpSXmKPExsVy+t/xe7obCnxjDb4dkbfYOGM9q8X58xvY
        LWac38dksfbIXXYHFo9NqzrZPPq2rGL0+LxJLoA5Ss+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLP
        yMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS/j74E+1oKPbBU7z25laWC8ydrFyMkhIWAiMfna
        KsYuRi4OIYGljBIL264xQyRkJE5Oa4AqEpb4c62LDaLoE6PE8w2LGUESbAKGEl1vQRKcHCIC
        qhKf2xawgxQxC0xglDjfOQMsISzgJzFp9yWgBg4OFqCifafyQMK8ArYS07ZMYINYIC+xesMB
        sMWcAnYSS08dBLOFgGpuLL/HNIGRbwEjwypGkdTS4tz03GJDveLE3OLSvHS95PzcTYzAENx2
        7OfmHYyXNgYfYhTgYFTi4W1Q9IkVYk0sK67MPcQowcGsJMJ7hcM3Vog3JbGyKrUoP76oNCe1
        +BCjKdBNE5mlRJPzgfGRVxJvaGpobmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7NbUgtQimj4mD
        U6qBkd9m2xTJUuMYtaMGJcuW6LxbsWI38/JuzYXb9W51bKw0fnFsY8KdEsPnoRq9y4N4bc+s
        XTMvvX6y6ZYZfjYXxHOym0pE/jUeCk68fl3AyGx+bGbjzwel6fOt58ts2TJ9Vzur4rM5gboH
        OkW6PW4dvai7yktjfo3eO90FzHcLm7NNkiwzyqyuKLEUZyQaajEXFScCAK8Y94pXAgAA
X-CMS-MailID: 20190809131008eucas1p278e77594a3b73a92db8987dcb0eccd80
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190809131008eucas1p278e77594a3b73a92db8987dcb0eccd80
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190809131008eucas1p278e77594a3b73a92db8987dcb0eccd80
References: <20190809130958.25410-1-m.szyprowski@samsung.com>
        <CGME20190809131008eucas1p278e77594a3b73a92db8987dcb0eccd80@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

CAM power domain contains CAMIF, 3AA and FIMC LITE devices. It is present
only in Exynos 5422/5800 SoCs. Currently there are no drivers nor the
device nodes for those devices, but instatiating its power domain allows
to turn it off and save some power.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos5800.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5800.dtsi b/arch/arm/boot/dts/exynos5800.dtsi
index 57d3b319fd65..de639eecc5c9 100644
--- a/arch/arm/boot/dts/exynos5800.dtsi
+++ b/arch/arm/boot/dts/exynos5800.dtsi
@@ -131,3 +131,12 @@
 &mfc {
 	compatible = "samsung,mfc-v8";
 };
+
+&soc {
+	cam_pd: power-domain@10045100 {
+		compatible = "samsung,exynos4210-pd";
+		reg = <0x10045100 0x20>;
+		#power-domain-cells = <0>;
+		label = "CAM";
+	};
+};
-- 
2.17.1

