Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F56F13030E
	for <lists+linux-samsung-soc@lfdr.de>; Sat,  4 Jan 2020 16:22:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbgADPWN (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 4 Jan 2020 10:22:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:59874 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726080AbgADPWN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 4 Jan 2020 10:22:13 -0500
Received: from localhost.localdomain (unknown [194.230.155.149])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F0F1024653;
        Sat,  4 Jan 2020 15:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578151332;
        bh=jcT4GSBIn8e+Ebzgnoq/9qfcn1TpLAtbC6dlWOL1uUU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZD5yZ8fNVPFpBjWdpdTnb38YwvSNT84/QcNJtBIJAGj+kxv8KX7wfS+N/N6F7gIzf
         dLnRjSyxkoJzjCE/QWfF1Azr+H/CR7K8DnF3lA6geiq4YSOz50EfAkr2xq7TOJ5TRU
         UK4XG8Vk/bw/b/F6KH+PfVvU971I81XooI9PvZ/0=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Kukjin Kim <kgene@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 07/20] media: samsung: Rename Samsung and Exynos to lowercase
Date:   Sat,  4 Jan 2020 16:20:54 +0100
Message-Id: <20200104152107.11407-8-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200104152107.11407-1-krzk@kernel.org>
References: <20200104152107.11407-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Fix up inconsistent usage of upper and lowercase letters in "Samsung"
and "Exynos" names.

"SAMSUNG" and "EXYNOS" are not abbreviations but regular trademarked
names.  Therefore they should be written with lowercase letters starting
with capital letter.

The lowercase "Exynos" name is promoted by its manufacturer Samsung
Electronics Co., Ltd., in advertisement materials and on website.

Although advertisement materials usually use uppercase "SAMSUNG", the
lowercase version is used in all legal aspects (e.g. on Wikipedia and in
privacy/legal statements on
https://www.samsung.com/semiconductor/privacy-global/).

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Move bindings change to separate patch.
---
 Documentation/media/v4l-drivers/fimc.rst      | 6 +++---
 Documentation/media/v4l-drivers/tuners.rst    | 2 +-
 drivers/media/platform/exynos4-is/media-dev.c | 2 +-
 drivers/media/platform/s3c-camif/camif-core.c | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/media/v4l-drivers/fimc.rst b/Documentation/media/v4l-drivers/fimc.rst
index 74585ba48b7f..2783aef65c01 100644
--- a/Documentation/media/v4l-drivers/fimc.rst
+++ b/Documentation/media/v4l-drivers/fimc.rst
@@ -2,7 +2,7 @@
 
 .. include:: <isonum.txt>
 
-The Samsung S5P/EXYNOS4 FIMC driver
+The Samsung S5P/Exynos4 FIMC driver
 ===================================
 
 Copyright |copy| 2012 - 2013 Samsung Electronics Co., Ltd.
@@ -19,7 +19,7 @@ drivers/media/platform/exynos4-is directory.
 Supported SoCs
 --------------
 
-S5PC100 (mem-to-mem only), S5PV210, EXYNOS4210
+S5PC100 (mem-to-mem only), S5PV210, Exynos4210
 
 Supported features
 ------------------
@@ -65,7 +65,7 @@ Media device interface
 ~~~~~~~~~~~~~~~~~~~~~~
 
 The driver supports Media Controller API as defined at :ref:`media_controller`.
-The media device driver name is "SAMSUNG S5P FIMC".
+The media device driver name is "Samsung S5P FIMC".
 
 The purpose of this interface is to allow changing assignment of FIMC instances
 to the SoC peripheral camera input at runtime and optionally to control internal
diff --git a/Documentation/media/v4l-drivers/tuners.rst b/Documentation/media/v4l-drivers/tuners.rst
index 7509be888909..d7924141c544 100644
--- a/Documentation/media/v4l-drivers/tuners.rst
+++ b/Documentation/media/v4l-drivers/tuners.rst
@@ -18,7 +18,7 @@ These differ mainly by the bandswitch byte.
 Tuner Manufacturers
 -------------------
 
-- SAMSUNG Tuner identification: (e.g. TCPM9091PD27)
+- Samsung Tuner identification: (e.g. TCPM9091PD27)
 
 .. code-block:: none
 
diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
index 9aaf3b8060d5..96e336b19cc3 100644
--- a/drivers/media/platform/exynos4-is/media-dev.c
+++ b/drivers/media/platform/exynos4-is/media-dev.c
@@ -1439,7 +1439,7 @@ static int fimc_md_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&fmd->pipelines);
 	fmd->pdev = pdev;
 
-	strscpy(fmd->media_dev.model, "SAMSUNG S5P FIMC",
+	strscpy(fmd->media_dev.model, "Samsung S5P FIMC",
 		sizeof(fmd->media_dev.model));
 	fmd->media_dev.ops = &fimc_md_ops;
 	fmd->media_dev.dev = dev;
diff --git a/drivers/media/platform/s3c-camif/camif-core.c b/drivers/media/platform/s3c-camif/camif-core.c
index c6fbcd7036d6..92f43c0cbc0c 100644
--- a/drivers/media/platform/s3c-camif/camif-core.c
+++ b/drivers/media/platform/s3c-camif/camif-core.c
@@ -304,7 +304,7 @@ static int camif_media_dev_init(struct camif_dev *camif)
 	int ret;
 
 	memset(md, 0, sizeof(*md));
-	snprintf(md->model, sizeof(md->model), "SAMSUNG S3C%s CAMIF",
+	snprintf(md->model, sizeof(md->model), "Samsung S3C%s CAMIF",
 		 ip_rev == S3C6410_CAMIF_IP_REV ? "6410" : "244X");
 	strscpy(md->bus_info, "platform", sizeof(md->bus_info));
 	md->hw_revision = ip_rev;
-- 
2.17.1

