Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84231B61AC
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 18 Sep 2019 12:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727208AbfIRKq7 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 18 Sep 2019 06:46:59 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:56395 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727030AbfIRKq7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 18 Sep 2019 06:46:59 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190918104657euoutp01c27aa112947b7fa36a47c8e5d0a46e20~FgpQkO0pk1222412224euoutp01q
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Sep 2019 10:46:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190918104657euoutp01c27aa112947b7fa36a47c8e5d0a46e20~FgpQkO0pk1222412224euoutp01q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1568803618;
        bh=Fg34vQ6u3eTKQ0Qf8Q7c1nFh3IddQHSKx58BNil8ldQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WJTS+/epT52kLp7u/BlOfIXcntR8+gNImaNYNohCbkwhoPFnWE3xaCuu/Bzo3RU3h
         pl+ujPwRj0YliFeUKpQUSfV82EEBifo/Ig5nHY7wAvbirS3bJVcbwADddkAFnwQJyU
         4VoGY1qxHltCCLrRkmnSaVEmS+vlUSdpWMBZXdXY=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190918104657eucas1p12201d567faa2f2d7dc6023200a5ca002~FgpPuudRf2818828188eucas1p1L;
        Wed, 18 Sep 2019 10:46:57 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id CB.D3.04374.02B028D5; Wed, 18
        Sep 2019 11:46:56 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190918104656eucas1p1d9cad1394b08d05a99151c4fbc9425ce~FgpO8LDOy2746227462eucas1p1K;
        Wed, 18 Sep 2019 10:46:56 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190918104655eusmtrp270282fc5ffb1f42b02db696e62190d14~FgpOnUrk41555615556eusmtrp2H;
        Wed, 18 Sep 2019 10:46:55 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-3e-5d820b20f0a1
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 58.B6.04166.F1B028D5; Wed, 18
        Sep 2019 11:46:55 +0100 (BST)
Received: from AMDC3061.DIGITAL.local (unknown [106.120.51.75]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190918104655eusmtip168de677be306b2ee05b27ddf12af27aa~FgpN8RAdV0585005850eusmtip1F;
        Wed, 18 Sep 2019 10:46:55 +0000 (GMT)
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
To:     broonie@kernel.org
Cc:     lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
        krzk@kernel.org, sbkim73@samsung.com, alsa-devel@alsa-project.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v1 2/9] mfd: wm8994: Add support for MCLKn clock control
Date:   Wed, 18 Sep 2019 12:46:27 +0200
Message-Id: <20190918104634.15216-3-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190918104634.15216-1-s.nawrocki@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSeUgUcRj1N7OzM5pr4yr6qZWxdFCWB0WNKGIUNUWlgRRkS606qair7HgW
        oXjkfRCFiwoqFtqKuK5ieeaVi0XqqoggmqESVhq0GuWRuY7Wf++9773f+/j4UbhUQzhS4cpY
        TqVURMrEFqLm/t+DJw/uSZW7j+pcmTFDD8Y0qOsJ5tmnOTEzlqFDTHnfIMEMDWlJ5udYFsbo
        ZscJRj3UiTF1fVMkY/z+hmAyOvpIpvdbJsEYapYxXytWa0wVsy0lUySr02SL2cbnyWxx2SZi
        C5o0iDXqDviTty28Q7jI8HhO5eZzzyKsuyoNj8miEwuyirEUVCnJQeYU0KdBq1/Ec5AFJaVr
        EKRMZ4oFsoxgIHN5hxgR5LbmkbuR+e4JJAyqESysDWP/Iur+xW2XmPaA/LcFyIRtaTuYLMve
        LsHpdQwWN0pEpoENzcJCae92QEQfhubGF9tYQntB1VKlWKhzhlptF27C5rQ3/BieEZkeArqZ
        hMKO6Z2dLsBS6a+dgA180Tft6Ptgs6UcEwJpCPLaJkmBFCH4qK9AgssLevUGIgdRW/sdg/pW
        N0E+B+8KJjCTDLQVTCxam2R8Cz5pLsYFWQJZj6WC+xCsaYoxATtC7tymSMAs6L5qSeFChQhG
        6rKxIuRc8r+sAiENsufi+KhQjj+l5BJceUUUH6cMdQ2OjtKhrR/0/o9+5TXqXA/qQTSFZJYS
        +JAilxKKeD4pqgcBhctsJf6PkuVSSYgi6QGnir6riovk+B7kRIlk9pKHZjOBUjpUEctFcFwM
        p9qdYpS5YwoKVGKXZePpR12fel5euHbF5c71E4bVcL40/fPqpo/EOvFIBJfgoL4Z0pXWnnTR
        xsnhampQPzFqMDjXqPLjZ9vM8vZfatgI9vUYaB9+dd9rpJHqnqiO22tHusSep2tveDvGW770
        q7ZbWfdeCpjXnL2llvvN17nnbnh2nEkL8HIgc2UiPkzhcRxX8Yq/skfKLz0DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeLIzCtJLcpLzFFi42I5/e/4XV157qZYg7nr9C2uXDzEZLFxxnpW
        i6kPn7BZXGndxGgx/8g5Vovz5zewW3y70sFksenxNVaLGef3MVmsPXKX3eLz+/2sFq17j7Bb
        HH7TzmpxccUXJgc+jw2fm9g8ds66y+6xaVUnm8fmJfUe0+f8Z/To27KK0ePzJrkA9ig9m6L8
        0pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jIOLm5kLOgQq
        +jqmMzUwLuTtYuTkkBAwkXh68AZjFyMXh5DAUkaJj9PfMncxcgAlpCTmtyhB1AhL/LnWxQZR
        84lRYuWe74wgCTYBQ4neo31gtoiAmMTtOZ3MIEXMAl3MEu93/GIFSQgLeEi8nH2YHcRmEVCV
        2LZ5KZjNK2AtsfjdQjaIDfISqzccYAaxOQVsJD5deMACYgsB1Sw4No1xAiPfAkaGVYwiqaXF
        uem5xYZ6xYm5xaV56XrJ+bmbGIHRsO3Yz807GC9tDD7EKMDBqMTDe+BUQ6wQa2JZcWXuIUYJ
        DmYlEd6A2vpYId6UxMqq1KL8+KLSnNTiQ4ymQEdNZJYSTc4HRmpeSbyhqaG5haWhubG5sZmF
        kjhvh8DBGCGB9MSS1OzU1ILUIpg+Jg5OqQbGyrX7TgTKxDqp6aY0P5pzzEQl58bRHT96RUtC
        bs1ycRWwrmi9f/3U/G2CQk8Xeb7ttgsoeGMjv2nThVIGh3nnnt/5sMQ27lJI58za727ZM276
        T1GMTI7O4+970WB+cJv6mjMzvu1bfFH19sNLV/Q94vdfU5eyi1Ns/ntz9YTk831OfK9XzD4R
        rsRSnJFoqMVcVJwIACl+nLCcAgAA
X-CMS-MailID: 20190918104656eucas1p1d9cad1394b08d05a99151c4fbc9425ce
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190918104656eucas1p1d9cad1394b08d05a99151c4fbc9425ce
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190918104656eucas1p1d9cad1394b08d05a99151c4fbc9425ce
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
        <CGME20190918104656eucas1p1d9cad1394b08d05a99151c4fbc9425ce@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The WM1811/WM8994/WM8958 audio CODEC DT bindings specify two optional
clocks: "MCLK1", "MCLK2". Add code for getting those clocks in the MFD
part of the wm8994 driver so they can be further handled in the audio
CODEC part.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/mfd/wm8994-core.c       | 9 +++++++++
 include/linux/mfd/wm8994/core.h | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/mfd/wm8994-core.c b/drivers/mfd/wm8994-core.c
index 1e9fe7d92597..02c19a0bdeb0 100644
--- a/drivers/mfd/wm8994-core.c
+++ b/drivers/mfd/wm8994-core.c
@@ -7,6 +7,7 @@
  * Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
  */
 
+#include <linux/clk.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -333,6 +334,14 @@ static int wm8994_device_init(struct wm8994 *wm8994, int irq)
 
 	dev_set_drvdata(wm8994->dev, wm8994);
 
+	wm8994->mclk[WM8994_MCLK1].id = "MCLK1";
+	wm8994->mclk[WM8994_MCLK2].id = "MCLK2";
+
+	ret = devm_clk_bulk_get_optional(wm8994->dev, ARRAY_SIZE(wm8994->mclk),
+					 wm8994->mclk);
+	if (ret != 0)
+		return ret;
+
 	/* Add the on-chip regulators first for bootstrapping */
 	ret = mfd_add_devices(wm8994->dev, 0,
 			      wm8994_regulator_devs,
diff --git a/include/linux/mfd/wm8994/core.h b/include/linux/mfd/wm8994/core.h
index e8b093522ffd..320297a1b70c 100644
--- a/include/linux/mfd/wm8994/core.h
+++ b/include/linux/mfd/wm8994/core.h
@@ -10,12 +10,19 @@
 #ifndef __MFD_WM8994_CORE_H__
 #define __MFD_WM8994_CORE_H__
 
+#include <linux/clk.h>
 #include <linux/mutex.h>
 #include <linux/interrupt.h>
 #include <linux/regmap.h>
 
 #include <linux/mfd/wm8994/pdata.h>
 
+enum {
+	WM8994_MCLK1,
+	WM8994_MCLK2,
+	WM8994_NUM_MCLK
+};
+
 enum wm8994_type {
 	WM8994 = 0,
 	WM8958 = 1,
@@ -60,6 +67,8 @@ struct wm8994 {
 	struct device *dev;
 	struct regmap *regmap;
 
+	struct clk_bulk_data mclk[WM8994_NUM_MCLK];
+
 	bool ldo_ena_always_driven;
 
 	int gpio_base;
-- 
2.17.1

