Return-Path: <linux-samsung-soc+bounces-4598-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 39117975188
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 11 Sep 2024 14:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DB6F1C221DF
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 11 Sep 2024 12:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8254A193092;
	Wed, 11 Sep 2024 12:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="fm0836T9"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A4B18C930
	for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Sep 2024 12:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726056719; cv=none; b=duOkL6NRvMgCQ72yLlZwVNBJQXZUb9LPmuK/coa1tYbuCFYLD7m+7pzuBGhyJnTj6y4wcFxBjE72HZN/yXDvTTMbz19+xz/7MpJ4vwIiT7Lf6tdeXM7aOhDPxUAac3d1HDz4VixGr2OUIdSV1CVLjcqCDk8TkXdmPnmjXcXKDNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726056719; c=relaxed/simple;
	bh=gY3sYk1R8x/s7rHhF9wyEi7cHSsdKFKDg0teFGH3L/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=LVjBYeI7eqgF+ssC5UEo9+rJN3ENvuYZV4AXOsFQUmsEyWNiLwOSHBtfmXT117ycN7DS1pj65WTkMbrVM8G8DHBgl7P0CE0qiZRjv/bGcJVHiO+ZwzPJeU3SAkK6MsRNpeEMd9BsfBE3/lhX7XeNdnpiQNHVST0CuExp908fbIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=fm0836T9; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20240911121155euoutp014007da5ef8273f5614cd8cb00322179d~0L3AoTqOP0990809908euoutp01D
	for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Sep 2024 12:11:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20240911121155euoutp014007da5ef8273f5614cd8cb00322179d~0L3AoTqOP0990809908euoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1726056715;
	bh=NJdZThH/4rVsf6XBL7/98lsA2ZRMGdmDLTG8epuqeXs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fm0836T9VLbJbXzXgN7F87AI6oZJtGBQ022ZayU1cBU9iu8NeIN6L9Vkv2bs5TB3z
	 u+mwoYpTwW4Le+EaZ2O6EdfNzC+R+FoB3tyqYQimj2PAty94ZxJBsWPJeYBOVxJ/p7
	 QmV4KRm39fLr2G5jAx9JQfn24b1vUKIGyzLKeFD0=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20240911121155eucas1p1f1fda5e90a3c7cf15e520430d0564982~0L3ADN0pR1328313283eucas1p1s;
	Wed, 11 Sep 2024 12:11:55 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id D2.61.09875.B0981E66; Wed, 11
	Sep 2024 13:11:55 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20240911121154eucas1p1a429a565c446cdd968f565df1ffae42c~0L2-fJYMn2450124501eucas1p1N;
	Wed, 11 Sep 2024 12:11:54 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240911121154eusmtrp28d359762649260d33f3c7f8a315fd71e~0L2-eCf6X2688526885eusmtrp2c;
	Wed, 11 Sep 2024 12:11:54 +0000 (GMT)
X-AuditID: cbfec7f4-131ff70000002693-93-66e1890b802d
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id DC.4D.19096.A0981E66; Wed, 11
	Sep 2024 13:11:54 +0100 (BST)
Received: from AMDC4515.eu.corp.samsungelectronics.net (unknown
	[106.120.51.28]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240911121153eusmtip1f4eff36b994b8846f7538e82aadde599~0L2_jbr-E0774607746eusmtip14;
	Wed, 11 Sep 2024 12:11:53 +0000 (GMT)
From: Mateusz Majewski <m.majewski2@samsung.com>
To: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Mateusz Majewski <m.majewski2@samsung.com>, Bartlomiej Zolnierkiewicz
	<bzolnier@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob
	Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, Anand
	Moon <linux.amoon@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v4 3/7] drivers/thermal/exynos: improve sanitize_temp_error
Date: Wed, 11 Sep 2024 14:11:26 +0200
Message-ID: <20240911121136.1120026-4-m.majewski2@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240911121136.1120026-1-m.majewski2@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEKsWRmVeSWpSXmKPExsWy7djP87rcnQ/TDH7eZrd4MG8bm8X3LdeZ
	LNbsPcdkMe+zrMX8I+dYLc6f38BusenxNVaLy7vmsFl87j3CaDHj/D4mi3Ubb7FbLGxqYbeY
	eGwys8XaI3fZLeZ+mcps8X/PDnaLJw/72Cye9+1jchDyWDNvDaPHzll32T0W73nJ5LFpVSeb
	x51re9g8Ni+p9+jbsorR4/MmuQCOKC6blNSczLLUIn27BK6Mo4fWMBZc0quY+Og5UwPjCbUu
	Rk4OCQETidefnzJ2MXJxCAmsYJR41H6OHSQhJPCFUaLzjw9E4jOjxKnv7SwwHS9vvGCDSCxn
	lDjy/AGU08oksevMM0aQKjYBA4kHb5axgyREBBYzSjT+eMcK4jALTGSRWP+mG6xKWMBb4ujz
	SawgNouAqsT9y71gO3gF7CR+/vzEBLFPXuLimudsIDangL3E99fLGSFqBCVOznwCVs8MVNO8
	dTYzyAIJgfmcEu+2zgYaygHkuEisOJELMUdY4tXxLewQtozE/53zoebnS8zY/J4ForxC4u5B
	LwjTWuLjGWYQk1lAU2L9Ln2IYkeJyxumsUFU8EnceCsIsZ9PYtK26cwQYV6JjjYhiGpVieN7
	JjFD2NIST1puM0GUeEi8+Mw9gVFxFpJHZiF5ZBbC2gWMzKsYxVNLi3PTU4uN8lLL9YoTc4tL
	89L1kvNzNzECk93pf8e/7GBc/uqj3iFGJg7GQ4wSHMxKIrz9dvfShHhTEiurUovy44tKc1KL
	DzFKc7AoifOqpsinCgmkJ5akZqemFqQWwWSZODilGphWxv9Typ+k2R36p1NUJOhkitTVBRX/
	vJe9EGOZM2l1/HFmoVfLDu/SctPJrtFh3tO8idlOdW96WKztee8tW5uk3uf287RNrr6dV9PN
	4v0sJ7dkXl4rY+yN63lNrtGh6tbv+ydUJCyW/vP5ad+l8tVev5fMkJJdb5OSsTn/8+m0Pr54
	3+ROxQyRe8Gycx9sj95TVPOMf39n06UTAp3aVp2F727NeyPyRM0nqKw3UEPNibulfdt67lly
	tx/wCXZ84lzz38/QLT314qpX37T47t36sdUibo7VtS9VoU1yZaFHdm0Wu2Eh95D7xDz7R8sT
	t4e+2OFx/7zXJCHz82JVb3iCspYzahosU/5kNCH1ghJLcUaioRZzUXEiAKWnpeTlAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRmVeSWpSXmKPExsVy+t/xu7pcnQ/TDD5dVbN4MG8bm8X3LdeZ
	LNbsPcdkMe+zrMX8I+dYLc6f38BusenxNVaLy7vmsFl87j3CaDHj/D4mi3Ubb7FbLGxqYbeY
	eGwys8XaI3fZLeZ+mcps8X/PDnaLJw/72Cye9+1jchDyWDNvDaPHzll32T0W73nJ5LFpVSeb
	x51re9g8Ni+p9+jbsorR4/MmuQCOKD2bovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81gr
	I1MlfTublNSczLLUIn27BL2Mo4fWMBZc0quY+Og5UwPjCbUuRk4OCQETiZc3XrB1MXJxCAks
	ZZSYsusmK0RCWuLwlynsELawxJ9rXWwgtpBAM5PEs/PVIDabgIHEgzfLwGpEBJYzSmxu9wAZ
	xCwwl0Wi8/VqsISwgLfE0eeTwIayCKhK3L/cywJi8wrYSfz8+YkJYoG8xMU1z8EWcArYS3x/
	vZwRYpmdxMeNJ1kh6gUlTs58AtbLDFTfvHU28wRGgVlIUrOQpBYwMq1iFEktLc5Nzy020itO
	zC0uzUvXS87P3cQIjM5tx35u2cG48tVHvUOMTByMhxglOJiVRHj77e6lCfGmJFZWpRblxxeV
	5qQWH2I0Bbp7IrOUaHI+MD3klcQbmhmYGpqYWRqYWpoZK4nzsl05nyYkkJ5YkpqdmlqQWgTT
	x8TBKdXApD7zem0qA4OU9M/K7vj/su/iYi70xZzobTNN9b5p/1QpbUXoH6c/P+bJya3ODLZ2
	tlUP0i/aaSEl/1KeZ4rJ/rzNz5Tq/xj+392+Ys1r60NVX09uu5WUMdF30+KvX153/LecwbzY
	ryXywpWevt8evSfmHTp+8l/WxnnJ1yrX26WxiZaeSgj85BciKBhwdPe0G5NDiyZUc0p0Totw
	uMLWwFT79aLaoj8ld7Rn7YgOXFTcVC7tEVpl9fnwthrpdX8enfKas33xe9kzF5ZEF7ew/0r9
	p3FjbcF19ZaYR6/iPjH8Ddm96IFw4R3Ob2Ia1vICGx9q7uxKSotLbZrNdjT94O3zyg1SH+PM
	lir4WS3gUWIpzkg01GIuKk4EADuSQhZXAwAA
X-CMS-MailID: 20240911121154eucas1p1a429a565c446cdd968f565df1ffae42c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20240911121154eucas1p1a429a565c446cdd968f565df1ffae42c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240911121154eucas1p1a429a565c446cdd968f565df1ffae42c
References: <20240911121136.1120026-1-m.majewski2@samsung.com>
	<CGME20240911121154eucas1p1a429a565c446cdd968f565df1ffae42c@eucas1p1.samsung.com>

There are two minor issues regarding this function.

One is that it attempts to calculate the second calibration value even
if 1-point trimming is being used; in this case, the calculated value is
probably not useful and is never used anyway. Changing this also
requires a minor reordering in Exynos5433 initialization function, so
that we know which type of trimming is used before we call
sanitize_temp_error.

The second issue is that the function is not very consistent when it
comes to the use of Exynos7-specific parameters. This seems to not be an
issue in practice, in part because some of these issues are related to
the mentioned calculation of the second calibration value. However,
fixing this makes the code a bit less confusing, and will be required
for Exynos850 which has 9-bit temperature values and uses 2-point
trimming.

Signed-off-by: Mateusz Majewski <m.majewski2@samsung.com>
---
v3 -> v4: further reworked to avoid SoC-specific code, instead using
  SoC-specific parameters inside of exynos_tmu_data (probably different
  enough to drop R-b).
v1 -> v2: reworked to change shift instead of only mask and to also fix
  the 2-point trimming issue.

 drivers/thermal/samsung/exynos_tmu.c | 40 ++++++++++++++++++----------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index b68e9755c933..8b1014915c31 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -111,6 +111,7 @@
 #define EXYNOS7_TMU_REG_EMUL_CON		0x160
 
 #define EXYNOS7_TMU_TEMP_MASK			0x1ff
+#define EXYNOS7_TMU_TEMP_SHIFT			9
 #define EXYNOS7_PD_DET_EN_SHIFT			23
 #define EXYNOS7_TMU_INTEN_RISE0_SHIFT		0
 #define EXYNOS7_EMUL_DATA_SHIFT			7
@@ -152,6 +153,8 @@ enum soc_type {
  * @max_efuse_value: maximum valid trimming data
  * @temp_error1: fused value of the first point trim.
  * @temp_error2: fused value of the second point trim.
+ * @temp_mask: SoC specific temperature mask
+ * @temp_85_shift: SoC specific address shift
  * @gain: gain of amplifier in the positive-TC generator block
  *	0 < gain <= 15
  * @reference_voltage: reference voltage of amplifier
@@ -182,6 +185,8 @@ struct exynos_tmu_data {
 	u32 min_efuse_value;
 	u32 max_efuse_value;
 	u16 temp_error1, temp_error2;
+	u16 temp_mask;
+	int temp_85_shift;
 	u8 gain;
 	u8 reference_voltage;
 	struct thermal_zone_device *tzd;
@@ -229,25 +234,26 @@ static int code_to_temp(struct exynos_tmu_data *data, u16 temp_code)
 		EXYNOS_FIRST_POINT_TRIM;
 }
 
+/*
+ * Sanitize sensor calibration values, according to minimum and maximum
+ * values defined for each SoC.
+ */
 static void sanitize_temp_error(struct exynos_tmu_data *data, u32 trim_info)
 {
-	u16 tmu_temp_mask =
-		(data->soc == SOC_ARCH_EXYNOS7) ? EXYNOS7_TMU_TEMP_MASK
-						: EXYNOS_TMU_TEMP_MASK;
-
-	data->temp_error1 = trim_info & tmu_temp_mask;
-	data->temp_error2 = ((trim_info >> EXYNOS_TRIMINFO_85_SHIFT) &
-				EXYNOS_TMU_TEMP_MASK);
-
+	data->temp_error1 = trim_info & data->temp_mask;
 	if (!data->temp_error1 ||
 	    (data->min_efuse_value > data->temp_error1) ||
 	    (data->temp_error1 > data->max_efuse_value))
-		data->temp_error1 = data->efuse_value & EXYNOS_TMU_TEMP_MASK;
+		data->temp_error1 = data->efuse_value & data->temp_mask;
 
-	if (!data->temp_error2)
-		data->temp_error2 =
-			(data->efuse_value >> EXYNOS_TRIMINFO_85_SHIFT) &
-			EXYNOS_TMU_TEMP_MASK;
+	if (data->cal_type == TYPE_TWO_POINT_TRIMMING) {
+		data->temp_error2 = (trim_info >> data->temp_85_shift) &
+				    data->temp_mask;
+		if (!data->temp_error2)
+			data->temp_error2 =
+				(data->efuse_value >> data->temp_85_shift) &
+				data->temp_mask;
+	}
 }
 
 static int exynos_tmu_initialize(struct platform_device *pdev)
@@ -510,7 +516,6 @@ static void exynos5433_tmu_initialize(struct platform_device *pdev)
 	int sensor_id, cal_type;
 
 	trim_info = readl(data->base + EXYNOS_TMU_REG_TRIMINFO);
-	sanitize_temp_error(data, trim_info);
 
 	/* Read the temperature sensor id */
 	sensor_id = (trim_info & EXYNOS5433_TRIMINFO_SENSOR_ID_MASK)
@@ -532,6 +537,8 @@ static void exynos5433_tmu_initialize(struct platform_device *pdev)
 		break;
 	}
 
+	sanitize_temp_error(data, trim_info);
+
 	dev_info(&pdev->dev, "Calibration type is %d-point calibration\n",
 			cal_type ?  2 : 1);
 }
@@ -876,6 +883,7 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 		data->tmu_control = exynos4210_tmu_control;
 		data->tmu_read = exynos4210_tmu_read;
 		data->tmu_clear_irqs = exynos4210_tmu_clear_irqs;
+		data->temp_mask = EXYNOS_TMU_TEMP_MASK;
 		data->gain = 15;
 		data->reference_voltage = 7;
 		data->efuse_value = 55;
@@ -898,6 +906,7 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 		data->tmu_read = exynos4412_tmu_read;
 		data->tmu_set_emulation = exynos4412_tmu_set_emulation;
 		data->tmu_clear_irqs = exynos4210_tmu_clear_irqs;
+		data->temp_mask = EXYNOS_TMU_TEMP_MASK;
 		data->gain = 8;
 		data->reference_voltage = 16;
 		data->efuse_value = 55;
@@ -919,6 +928,8 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 		data->tmu_read = exynos4412_tmu_read;
 		data->tmu_set_emulation = exynos4412_tmu_set_emulation;
 		data->tmu_clear_irqs = exynos4210_tmu_clear_irqs;
+		data->temp_mask = EXYNOS_TMU_TEMP_MASK;
+		data->temp_85_shift = EXYNOS_TRIMINFO_85_SHIFT;
 		data->gain = 8;
 		if (res.start == EXYNOS5433_G3D_BASE)
 			data->reference_voltage = 23;
@@ -939,6 +950,7 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 		data->tmu_read = exynos7_tmu_read;
 		data->tmu_set_emulation = exynos4412_tmu_set_emulation;
 		data->tmu_clear_irqs = exynos4210_tmu_clear_irqs;
+		data->temp_mask = EXYNOS7_TMU_TEMP_MASK;
 		data->gain = 9;
 		data->reference_voltage = 17;
 		data->efuse_value = 75;
-- 
2.45.2


