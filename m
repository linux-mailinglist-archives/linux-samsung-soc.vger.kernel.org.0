Return-Path: <linux-samsung-soc+bounces-10324-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A37B336B2
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 25 Aug 2025 08:49:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8ECEB177586
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 25 Aug 2025 06:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 780802853E3;
	Mon, 25 Aug 2025 06:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="YNN8r7pb"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0E628469A
	for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Aug 2025 06:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756104580; cv=none; b=kgB5nLzck5E4GzqNp0YX50D/hrEqZSAE79GF7oKVkvmZUkuIHI1j1qCPmucGq2DTYfYGPkSyBUwCVRyCldlpxojmyDYJuji0m0odnk+EczuwfeW2XmD8BxL34TYqwNKHSqLK3YTYgo0ZcyZV53SPGLWc+dYoxzS20WTZ60xATmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756104580; c=relaxed/simple;
	bh=PGQyZHBt+2TI7bQsGoDKqg3NGsJZZlHM3S6h6THT+Vc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=XqmM/43khfdDi1lccIROK8jZQdJXAYRAbVd9ApyLXuB49Fetjq6jvXosqlbZ3IaQUQjJ10YE0VoBeDXvMzthr6tHdW0fprtk1yeWzBk3+SP7xjomi8GdKhlm8vDF/ixN4+THeqR5TebuMDZBo9vnxN8KgBdnZfEt2L1+6qjh7iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=YNN8r7pb; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250825064936epoutp0403f6062e901107ccc77c029fc752b661~e787B632t2805528055epoutp04g
	for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Aug 2025 06:49:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250825064936epoutp0403f6062e901107ccc77c029fc752b661~e787B632t2805528055epoutp04g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756104576;
	bh=yH6GFKFxgx+DIpgysEnSIApLTzEXbpxJD7g9W0MXb10=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YNN8r7pbWbqNetthUxjpahx2k35CCtp5HbfBi0P+f98MNgkX+uU9/RxjuTBM/aiwp
	 JLcs3NhiPcTKkXA0w9DkDz6WkqvoOn/lSzF0tsnuGCQbPFmKa7Icm9TypPJTZCuE5X
	 qOXw2q1c7jDH2k86dpqDqje8D1PyKMB1GMEVzVjU=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250825064935epcas2p20566c926aa953b02f19886ba644fca0d~e786egxsE3063530635epcas2p2F;
	Mon, 25 Aug 2025 06:49:35 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.100]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4c9Lxp3NGDz6B9mD; Mon, 25 Aug
	2025 06:49:34 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250825064933epcas2p1e138f8c874f634123590af3bf63e49bd~e784-ZXRH0730307303epcas2p1q;
	Mon, 25 Aug 2025 06:49:33 +0000 (GMT)
Received: from asswp60 (unknown [10.229.9.60]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250825064933epsmtip130fd9627db65fe1df20686d14f1dcc8e~e7846ENts1012910129epsmtip1Y;
	Mon, 25 Aug 2025 06:49:33 +0000 (GMT)
From: Shin Son <shin.son@samsung.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
	<lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Shin Son <shin.son@samsung.com>, linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] thermal: exynos_tmu: Support new hardware and update
 TMU interface
Date: Mon, 25 Aug 2025 15:49:28 +0900
Message-ID: <20250825064929.188101-3-shin.son@samsung.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250825064929.188101-1-shin.son@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250825064933epcas2p1e138f8c874f634123590af3bf63e49bd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250825064933epcas2p1e138f8c874f634123590af3bf63e49bd
References: <20250825064929.188101-1-shin.son@samsung.com>
	<CGME20250825064933epcas2p1e138f8c874f634123590af3bf63e49bd@epcas2p1.samsung.com>

The Exynos tmu driver's private data structure has been extended
to support the exynosautov920 hardware, which requires per-sensor interrupt
enablement and dual-zone handling:

- Add 'slope_comp' : compensation parameter below 25 degrees.
- Add 'calib_temp' : stores the fused calibaration temperature.
- Add 'tz_count' : reflects the new 1:2 hardware-to-thermal-zone ratio.
- Add 'valid_sensor_bitmap' : bitmap to enable interrupts
			      for each valid sensor.
- Rename 'tzd' -> 'tzd_array' to register multiple thermal zones.

Since splitting this patch causes runtime errors during temperature
emulateion or problems where the read temperature feature fails to
retrieve values, I have submitted it as a single commit. To add support
for the exynosautov920 to the exisiting TMU interface, the following
changes are included:

1. Branch 'code_to_temp' and 'temp_to_code' for exynosautov920 SoC variant.
2. Loop over 'tz_count' in critical-point setup.
3. Introduce 'update_con_reg' for exynosautov920 control-register updates.
4. Add exynosautov920-specific branch in 'exynos_tmu_update_temp' function.
5. Skip high & low temperature threshold setup in exynosautov920.
6. Enable interrupts via bitmap in 'exynosautov920_tmu_set_crit_temp'.
7. Initialize all new members during 'exynosautov920_tmu_initialize'.
8. Clear IRQs by iterating the bitamp in exynosautov920.
9. Register each zone with 'devm_thermal_of_zone_register()'
   based on 'tz_count'.

Signed-off-by: Shin Son <shin.son@samsung.com>
---
 drivers/thermal/samsung/exynos_tmu.c | 336 ++++++++++++++++++++++++---
 1 file changed, 299 insertions(+), 37 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 47a99b3c5395..84c1545b2b53 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -121,8 +121,54 @@
 
 #define EXYNOS_NOISE_CANCEL_MODE		4
 
+/* ExynosAutov920 specific registers */
+#define EXYNOSAUTOV920_SLOPE_COMP		25
+#define EXYNOSAUTOV920_SLOPE_COMP_MASK		0xf
+#define EXYNOSAUTOV920_CALIB_SEL_TEMP		30
+#define EXYNOSAUTOV920_CALIB_SEL_TEMP_MASK	0x2
+
+#define EXYNOSAUTOV920_SENSOR0_TRIM_INFO	0x10
+#define EXYNOSAUTOV920_TRIM_MASK		0x1ff
+#define EXYNOSAUTOV920_TRIMINFO_25_SHIFT	0
+#define EXYNOSAUTOV920_TRIMINFO_85_SHIFT	9
+
+#define EXYNOSAUTOV920_TMU_REG_TRIMINFO2	0x04
+#define EXYNOSAUTOV920_MAX_SENSOR_NUMBER	16
+
+#define EXYNOSAUTOV920_TMU_REG_THRESHOLD(p)	(((p)) * 0x50 + 0x00D0)
+#define EXYNOSAUTOV920_TMU_REG_INTEN(p)		(((p)) * 0x50 + 0x00F0)
+#define EXYNOSAUTOV920_TMU_REG_INT_PEND(p)	(((p)) * 0x50 + 0x00F8)
+
+#define EXYNOSAUTOV920_CURRENT_TEMP_P1_P0	0x084
+#define EXYNOSAUTOV920_TMU_REG_EMUL_CON		0x0B0
+
+#define EXYNOSAUTOV920_TMU_REG_CONTROL		0x50
+#define EXYNOSAUTOV920_TMU_REG_CONTROL1		0x54
+#define EXYNOSAUTOV920_TMU_REG_AVG_CONTROL	0x58
+#define EXYNOSAUTOV920_TMU_SAMPLING_INTERVAL	0x70
+#define EXYNOSAUTOV920_TMU_REG_COUNTER_VALUE0	0x74
+#define EXYNOSAUTOV920_TMU_REG_COUNTER_VALUE1	0x78
+
+#define EXYNOSAUTOV920_TMU_THERM_TRIP_EN_SHIFT	12
+
+#define EXYNOSAUTOV920_TMU_T_BUF_VREF_SEL_SHIFT		8
+#define EXYNOSAUTOV920_TMU_T_BUF_VREF_SEL_MASK		0x1f
+#define EXYNOSAUTOV920_TMU_T_BUF_SLOPE_SEL_SHIFT	3
+#define EXYNOSAUTOV920_TMU_T_BUF_SLOPE_SEL_MASK		0xf
+#define EXYNOSAUTOV920_TMU_NUM_PROBE_MASK		0xf
+#define EXYNOSAUTOV920_TMU_NUM_PROBE_SHIFT		16
+#define EXYNOSAUTOV920_TMU_LPI_MODE_MASK		1
+#define EXYNOSAUTOV920_TMU_LPI_MODE_SHIFT		10
+
+#define EXYNOSAUTOV920_TMU_AVG_CON_UPDATE		0x0008011A
+#define EXYNOSAUTOV920_TMU_COUNTER_VALUE0_UPDATE	0x030003C0
+#define EXYNOSAUTOV920_TMU_COUNTER_VALUE1_UPDATE	0x03C0004D
+
 #define MCELSIUS	1000
 
+#define EXYNOS_DEFAULT_TZ_COUNT		1
+#define EXYNOS_MAX_TZ_COUNT		2
+
 enum soc_type {
 	SOC_ARCH_EXYNOS3250 = 1,
 	SOC_ARCH_EXYNOS4210,
@@ -133,6 +179,7 @@ enum soc_type {
 	SOC_ARCH_EXYNOS5420_TRIMINFO,
 	SOC_ARCH_EXYNOS5433,
 	SOC_ARCH_EXYNOS7,
+	SOC_ARCH_EXYNOSAUTOV920,
 };
 
 /**
@@ -150,6 +197,8 @@ enum soc_type {
  * @efuse_value: SoC defined fuse value
  * @min_efuse_value: minimum valid trimming data
  * @max_efuse_value: maximum valid trimming data
+ * @slope_comp: allocated value of the slope compensation.
+ * @calib_temp: calibration temperature of the TMU.
  * @temp_error1: fused value of the first point trim.
  * @temp_error2: fused value of the second point trim.
  * @gain: gain of amplifier in the positive-TC generator block
@@ -157,7 +206,9 @@ enum soc_type {
  * @reference_voltage: reference voltage of amplifier
  *	in the positive-TC generator block
  *	0 < reference_voltage <= 31
- * @tzd: pointer to thermal_zone_device structure
+ * @tz_count: The allocated number of the thermal zone
+ * @tzd_array: pointer array of thermal_zone_device structure
+ * @valid_sensor_bitmap: The enabled sensor of the TMU device
  * @enabled: current status of TMU device
  * @tmu_set_low_temp: SoC specific method to set trip (falling threshold)
  * @tmu_set_high_temp: SoC specific method to set trip (rising threshold)
@@ -181,10 +232,14 @@ struct exynos_tmu_data {
 	u32 efuse_value;
 	u32 min_efuse_value;
 	u32 max_efuse_value;
+	u16 slope_comp;
+	u16 calib_temp;
 	u16 temp_error1, temp_error2;
 	u8 gain;
 	u8 reference_voltage;
-	struct thermal_zone_device *tzd;
+	u8 tz_count;
+	unsigned long valid_sensor_bitmap;
+	struct thermal_zone_device *tzd_array[EXYNOS_MAX_TZ_COUNT];
 	bool enabled;
 
 	void (*tmu_set_low_temp)(struct exynos_tmu_data *data, u8 temp);
@@ -208,10 +263,25 @@ static int temp_to_code(struct exynos_tmu_data *data, u8 temp)
 	if (data->cal_type == TYPE_ONE_POINT_TRIMMING)
 		return temp + data->temp_error1 - EXYNOS_FIRST_POINT_TRIM;
 
-	return (temp - EXYNOS_FIRST_POINT_TRIM) *
-		(data->temp_error2 - data->temp_error1) /
-		(EXYNOS_SECOND_POINT_TRIM - EXYNOS_FIRST_POINT_TRIM) +
-		data->temp_error1;
+	if (data->soc == SOC_ARCH_EXYNOSAUTOV920) {
+		if ((temp - EXYNOS_FIRST_POINT_TRIM) >= 0) {
+			return (temp - EXYNOS_FIRST_POINT_TRIM) *
+				(data->temp_error2 - data->temp_error1) /
+				(data->calib_temp - EXYNOS_FIRST_POINT_TRIM) +
+				data->temp_error1;
+		} else {
+			return ((temp - EXYNOS_FIRST_POINT_TRIM) *
+				(data->temp_error2 - data->temp_error1) /
+				(data->calib_temp - EXYNOS_FIRST_POINT_TRIM) *
+				((57 + data->slope_comp) * 1000 / 65)) / 1000 +
+				data->temp_error1;
+		}
+	} else {
+		return (temp - EXYNOS_FIRST_POINT_TRIM) *
+			(data->temp_error2 - data->temp_error1) /
+			(EXYNOS_SECOND_POINT_TRIM - EXYNOS_FIRST_POINT_TRIM) +
+			data->temp_error1;
+	}
 }
 
 /*
@@ -223,10 +293,25 @@ static int code_to_temp(struct exynos_tmu_data *data, u16 temp_code)
 	if (data->cal_type == TYPE_ONE_POINT_TRIMMING)
 		return temp_code - data->temp_error1 + EXYNOS_FIRST_POINT_TRIM;
 
-	return (temp_code - data->temp_error1) *
-		(EXYNOS_SECOND_POINT_TRIM - EXYNOS_FIRST_POINT_TRIM) /
-		(data->temp_error2 - data->temp_error1) +
-		EXYNOS_FIRST_POINT_TRIM;
+	if (data->soc == SOC_ARCH_EXYNOSAUTOV920) {
+		if ((temp_code - data->temp_error1) >= 0) {
+			return (temp_code - data->temp_error1) *
+				(data->calib_temp - EXYNOS_FIRST_POINT_TRIM) /
+				(data->temp_error2 - data->temp_error1) +
+				EXYNOS_FIRST_POINT_TRIM;
+		} else {
+			return ((temp_code - data->temp_error1) *
+				(data->calib_temp - EXYNOS_FIRST_POINT_TRIM) /
+				(data->temp_error2 - data->temp_error1) *
+				(65 * 1000 / (57 + data->slope_comp))) / 1000 +
+				EXYNOS_FIRST_POINT_TRIM;
+		}
+	} else {
+		return (temp_code - data->temp_error1) *
+			(EXYNOS_SECOND_POINT_TRIM - EXYNOS_FIRST_POINT_TRIM) /
+			(data->temp_error2 - data->temp_error1) +
+			EXYNOS_FIRST_POINT_TRIM;
+	}
 }
 
 static void sanitize_temp_error(struct exynos_tmu_data *data, u32 trim_info)
@@ -262,6 +347,9 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
 		clk_enable(data->clk_sec);
 
 	status = readb(data->base + EXYNOS_TMU_REG_STATUS);
+	if (data->soc == SOC_ARCH_EXYNOSAUTOV920)
+		status = readl(data->base + EXYNOS_TMU_REG_TRIMINFO);
+
 	if (!status) {
 		ret = -EBUSY;
 	} else {
@@ -280,27 +368,31 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
 static int exynos_thermal_zone_configure(struct platform_device *pdev)
 {
 	struct exynos_tmu_data *data = platform_get_drvdata(pdev);
-	struct thermal_zone_device *tzd = data->tzd;
-	int ret, temp;
+	struct thermal_zone_device *tzd;
+	int ret, temp, idx;
 
-	ret = thermal_zone_get_crit_temp(tzd, &temp);
-	if (ret) {
-		/* FIXME: Remove this special case */
-		if (data->soc == SOC_ARCH_EXYNOS5433)
-			return 0;
+	for (idx = 0; idx < data->tz_count; ++idx) {
+		tzd = data->tzd_array[idx];
 
-		dev_err(&pdev->dev,
-			"No CRITICAL trip point defined in device tree!\n");
-		return ret;
-	}
+		ret = thermal_zone_get_crit_temp(tzd, &temp);
+		if (ret) {
+			/* FIXME: Remove this special case */
+			if (data->soc == SOC_ARCH_EXYNOS5433)
+				return 0;
 
-	mutex_lock(&data->lock);
-	clk_enable(data->clk);
+			dev_err(&pdev->dev,
+				"No CRITICAL trip point defined in device tree!\n");
+			return ret;
+		}
 
-	data->tmu_set_crit_temp(data, temp / MCELSIUS);
+		mutex_lock(&data->lock);
+		clk_enable(data->clk);
 
-	clk_disable(data->clk);
-	mutex_unlock(&data->lock);
+		data->tmu_set_crit_temp(data, temp / MCELSIUS);
+
+		clk_disable(data->clk);
+		mutex_unlock(&data->lock);
+	}
 
 	return 0;
 }
@@ -323,6 +415,38 @@ static u32 get_con_reg(struct exynos_tmu_data *data, u32 con)
 	return con;
 }
 
+static void update_con_reg(struct exynos_tmu_data *data)
+{
+	u32 val, t_buf_vref_sel, t_buf_slope_sel;
+
+	val = readl(data->base + EXYNOS_TMU_REG_TRIMINFO);
+	t_buf_vref_sel = (val >> EXYNOSAUTOV920_TMU_T_BUF_VREF_SEL_SHIFT)
+				& EXYNOSAUTOV920_TMU_T_BUF_VREF_SEL_MASK;
+	t_buf_slope_sel = (val >> EXYNOSAUTOV920_TMU_T_BUF_SLOPE_SEL_SHIFT)
+				& EXYNOSAUTOV920_TMU_T_BUF_SLOPE_SEL_MASK;
+
+	val = readl(data->base +  EXYNOSAUTOV920_TMU_REG_CONTROL);
+	val &= ~(EXYNOS_TMU_REF_VOLTAGE_MASK << EXYNOS_TMU_REF_VOLTAGE_SHIFT);
+	val |= (t_buf_vref_sel << EXYNOS_TMU_REF_VOLTAGE_SHIFT);
+	val &= ~(EXYNOS_TMU_BUF_SLOPE_SEL_MASK << EXYNOS_TMU_BUF_SLOPE_SEL_SHIFT);
+	val |= (t_buf_slope_sel << EXYNOS_TMU_BUF_SLOPE_SEL_SHIFT);
+	writel(val, data->base + EXYNOSAUTOV920_TMU_REG_CONTROL);
+
+	val = readl(data->base + EXYNOSAUTOV920_TMU_REG_CONTROL1);
+	val &= ~(EXYNOSAUTOV920_TMU_NUM_PROBE_MASK << EXYNOSAUTOV920_TMU_NUM_PROBE_SHIFT);
+	val &= ~(EXYNOSAUTOV920_TMU_LPI_MODE_MASK << EXYNOSAUTOV920_TMU_LPI_MODE_SHIFT);
+	val |= (find_last_bit(&data->valid_sensor_bitmap, EXYNOSAUTOV920_MAX_SENSOR_NUMBER)
+		<< EXYNOSAUTOV920_TMU_NUM_PROBE_SHIFT);
+	writel(val, data->base + EXYNOSAUTOV920_TMU_REG_CONTROL1);
+
+	writel(1, data->base + EXYNOSAUTOV920_TMU_SAMPLING_INTERVAL);
+	writel(EXYNOSAUTOV920_TMU_AVG_CON_UPDATE, data->base + EXYNOSAUTOV920_TMU_REG_AVG_CONTROL);
+	writel(EXYNOSAUTOV920_TMU_COUNTER_VALUE0_UPDATE,
+	       data->base + EXYNOSAUTOV920_TMU_REG_COUNTER_VALUE0);
+	writel(EXYNOSAUTOV920_TMU_COUNTER_VALUE1_UPDATE,
+	       data->base + EXYNOSAUTOV920_TMU_REG_COUNTER_VALUE1);
+}
+
 static void exynos_tmu_control(struct platform_device *pdev, bool on)
 {
 	struct exynos_tmu_data *data = platform_get_drvdata(pdev);
@@ -354,9 +478,8 @@ static void exynos_tmu_update_temp(struct exynos_tmu_data *data, int reg_off,
 	u16 tmu_temp_mask;
 	u32 th;
 
-	tmu_temp_mask =
-		(data->soc == SOC_ARCH_EXYNOS7) ? EXYNOS7_TMU_TEMP_MASK
-						: EXYNOS_TMU_TEMP_MASK;
+	tmu_temp_mask = (data->soc == SOC_ARCH_EXYNOS7 || data->soc == SOC_ARCH_EXYNOSAUTOV920)
+		? EXYNOS7_TMU_TEMP_MASK	: EXYNOS_TMU_TEMP_MASK;
 
 	th = readl(data->base + reg_off);
 	th &= ~(tmu_temp_mask << bit_off);
@@ -582,6 +705,65 @@ static void exynos7_tmu_initialize(struct platform_device *pdev)
 	sanitize_temp_error(data, trim_info);
 }
 
+static void exynosautov920_tmu_set_low_temp(struct exynos_tmu_data *data, u8 temp)
+{
+	/*
+	 * Failing thresholds are not supported on Exynosautov920.
+	 * We use polling instead.
+	 */
+}
+
+static void exynosautov920_tmu_set_high_temp(struct exynos_tmu_data *data, u8 temp)
+{
+	/*
+	 * Rising thresholds are not supported on Exynosautov920.
+	 * We use polling instead.
+	 */
+}
+
+static void exynosautov920_tmu_disable_low(struct exynos_tmu_data *data)
+{
+	/* Again, this is handled by polling. */
+}
+
+static void exynosautov920_tmu_disable_high(struct exynos_tmu_data *data)
+{
+	/* Again, this is handled by polling. */
+}
+
+static void exynosautov920_tmu_set_crit_temp(struct exynos_tmu_data *data, u8 temp)
+{
+	unsigned int idx;
+
+	for_each_set_bit(idx, &data->valid_sensor_bitmap, EXYNOSAUTOV920_MAX_SENSOR_NUMBER) {
+		exynos_tmu_update_temp(data, EXYNOSAUTOV920_TMU_REG_THRESHOLD(idx), 16, temp);
+		exynos_tmu_update_bit(data, EXYNOSAUTOV920_TMU_REG_INTEN(idx), 7, true);
+	}
+}
+
+static void exynosautov920_tmu_initialize(struct platform_device *pdev)
+{
+	struct exynos_tmu_data *data = platform_get_drvdata(pdev);
+	unsigned int val;
+
+	data->tmu_control(pdev, false);
+
+	update_con_reg(data);
+
+	val = readl(data->base + EXYNOS_TMU_REG_TRIMINFO);
+	data->cal_type = TYPE_TWO_POINT_TRIMMING;
+	data->slope_comp = (val >> EXYNOSAUTOV920_SLOPE_COMP) & EXYNOSAUTOV920_SLOPE_COMP_MASK;
+
+	val = readl(data->base + EXYNOSAUTOV920_SENSOR0_TRIM_INFO);
+	data->temp_error1 = (val >> EXYNOSAUTOV920_TRIMINFO_25_SHIFT) & EXYNOSAUTOV920_TRIM_MASK;
+	data->temp_error2 = (val >> EXYNOSAUTOV920_TRIMINFO_85_SHIFT) & EXYNOSAUTOV920_TRIM_MASK;
+
+	val = readl(data->base + EXYNOSAUTOV920_TMU_REG_TRIMINFO2);
+	val = (val >> EXYNOSAUTOV920_CALIB_SEL_TEMP) & EXYNOSAUTOV920_CALIB_SEL_TEMP_MASK;
+
+	data->calib_temp = (85 + (20 * val));
+}
+
 static void exynos4210_tmu_control(struct platform_device *pdev, bool on)
 {
 	struct exynos_tmu_data *data = platform_get_drvdata(pdev);
@@ -633,6 +815,24 @@ static void exynos7_tmu_control(struct platform_device *pdev, bool on)
 	writel(con, data->base + EXYNOS_TMU_REG_CONTROL);
 }
 
+static void exynosautov920_tmu_control(struct platform_device *pdev, bool on)
+{
+	struct exynos_tmu_data *data = platform_get_drvdata(pdev);
+	unsigned int con;
+
+	con = readl(data->base + EXYNOSAUTOV920_TMU_REG_CONTROL);
+
+	if (on) {
+		con |= BIT(EXYNOSAUTOV920_TMU_THERM_TRIP_EN_SHIFT);
+		con |= BIT(EXYNOS_TMU_CORE_EN_SHIFT);
+	} else {
+		con &= ~BIT(EXYNOSAUTOV920_TMU_THERM_TRIP_EN_SHIFT);
+		con &= ~BIT(EXYNOS_TMU_CORE_EN_SHIFT);
+	}
+
+	writel(con, data->base + EXYNOSAUTOV920_TMU_REG_CONTROL);
+}
+
 static int exynos_get_temp(struct thermal_zone_device *tz, int *temp)
 {
 	struct exynos_tmu_data *data = thermal_zone_device_priv(tz);
@@ -671,7 +871,7 @@ static u32 get_emul_con_reg(struct exynos_tmu_data *data, unsigned int val,
 
 		val &= ~(EXYNOS_EMUL_TIME_MASK << EXYNOS_EMUL_TIME_SHIFT);
 		val |= (EXYNOS_EMUL_TIME << EXYNOS_EMUL_TIME_SHIFT);
-		if (data->soc == SOC_ARCH_EXYNOS7) {
+		if (data->soc == SOC_ARCH_EXYNOS7 || data->soc == SOC_ARCH_EXYNOSAUTOV920) {
 			val &= ~(EXYNOS7_EMUL_DATA_MASK <<
 				EXYNOS7_EMUL_DATA_SHIFT);
 			val |= (temp_to_code(data, temp) <<
@@ -703,6 +903,8 @@ static void exynos4412_tmu_set_emulation(struct exynos_tmu_data *data,
 		emul_con = EXYNOS5433_TMU_EMUL_CON;
 	else if (data->soc == SOC_ARCH_EXYNOS7)
 		emul_con = EXYNOS7_TMU_REG_EMUL_CON;
+	else if (data->soc == SOC_ARCH_EXYNOSAUTOV920)
+		emul_con = EXYNOSAUTOV920_TMU_REG_EMUL_CON;
 	else
 		emul_con = EXYNOS_EMUL_CON;
 
@@ -756,11 +958,19 @@ static int exynos7_tmu_read(struct exynos_tmu_data *data)
 		EXYNOS7_TMU_TEMP_MASK;
 }
 
+static int exynosautov920_tmu_read(struct exynos_tmu_data *data)
+{
+	return readw(data->base + EXYNOSAUTOV920_CURRENT_TEMP_P1_P0) &
+		EXYNOS7_TMU_TEMP_MASK;
+}
+
 static irqreturn_t exynos_tmu_threaded_irq(int irq, void *id)
 {
 	struct exynos_tmu_data *data = id;
+	int idx;
 
-	thermal_zone_device_update(data->tzd, THERMAL_EVENT_UNSPECIFIED);
+	for (idx = 0; idx < data->tz_count; ++idx)
+		thermal_zone_device_update(data->tzd_array[idx], THERMAL_EVENT_UNSPECIFIED);
 
 	mutex_lock(&data->lock);
 	clk_enable(data->clk);
@@ -805,6 +1015,16 @@ static void exynos4210_tmu_clear_irqs(struct exynos_tmu_data *data)
 	writel(val_irq, data->base + tmu_intclear);
 }
 
+static void exynosautov920_tmu_clear_irqs(struct exynos_tmu_data *data)
+{
+	unsigned int idx, val_irq;
+
+	for_each_set_bit(idx, &data->valid_sensor_bitmap, EXYNOSAUTOV920_MAX_SENSOR_NUMBER) {
+		val_irq = readl(data->base + EXYNOSAUTOV920_TMU_REG_INT_PEND(idx));
+		writel(val_irq, data->base + EXYNOSAUTOV920_TMU_REG_INT_PEND(idx));
+	}
+}
+
 static const struct of_device_id exynos_tmu_match[] = {
 	{
 		.compatible = "samsung,exynos3250-tmu",
@@ -833,6 +1053,9 @@ static const struct of_device_id exynos_tmu_match[] = {
 	}, {
 		.compatible = "samsung,exynos7-tmu",
 		.data = (const void *)SOC_ARCH_EXYNOS7,
+	}, {
+		.compatible = "samsung,exynosautov920-tmu",
+		.data = (const void *)SOC_ARCH_EXYNOSAUTOV920,
 	},
 	{ },
 };
@@ -865,6 +1088,8 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 
 	data->soc = (uintptr_t)of_device_get_match_data(&pdev->dev);
 
+	data->tz_count = EXYNOS_DEFAULT_TZ_COUNT;
+
 	switch (data->soc) {
 	case SOC_ARCH_EXYNOS4210:
 		data->tmu_set_low_temp = exynos4210_tmu_set_low_temp;
@@ -945,6 +1170,19 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 		data->min_efuse_value = 15;
 		data->max_efuse_value = 100;
 		break;
+	case SOC_ARCH_EXYNOSAUTOV920:
+		data->tmu_set_low_temp = exynosautov920_tmu_set_low_temp;
+		data->tmu_set_high_temp = exynosautov920_tmu_set_high_temp;
+		data->tmu_disable_low = exynosautov920_tmu_disable_low;
+		data->tmu_disable_high = exynosautov920_tmu_disable_high;
+		data->tmu_set_crit_temp = exynosautov920_tmu_set_crit_temp;
+		data->tmu_initialize = exynosautov920_tmu_initialize;
+		data->tmu_control = exynosautov920_tmu_control;
+		data->tmu_read = exynosautov920_tmu_read;
+		data->tmu_set_emulation = exynos4412_tmu_set_emulation;
+		data->tmu_clear_irqs = exynosautov920_tmu_clear_irqs;
+		data->tz_count = EXYNOS_MAX_TZ_COUNT;
+		break;
 	default:
 		dev_err(&pdev->dev, "Platform not supported\n");
 		return -EINVAL;
@@ -952,6 +1190,27 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 
 	data->cal_type = TYPE_ONE_POINT_TRIMMING;
 
+	if (data->soc == SOC_ARCH_EXYNOSAUTOV920) {
+		unsigned int sensor_idx[2];
+		const char *tmu_name;
+
+		if (device_property_read_string(&pdev->dev, "tmu-name", &tmu_name)) {
+			dev_err(&pdev->dev, "failed to get tmu-name\n");
+			return -ENODEV;
+		}
+
+		if (device_property_read_u32_array(&pdev->dev, "sensor-index-ranges",
+						   sensor_idx, 2)) {
+			dev_err(&pdev->dev, "failed to get sensor-index-ranges\n");
+			return -ENODEV;
+		}
+
+		bitmap_set(&data->valid_sensor_bitmap, sensor_idx[0],
+			   sensor_idx[1] - sensor_idx[0] + 1);
+		if (strcmp(tmu_name, "TMU_SUB1") == 0)
+			clear_bit(5, &data->valid_sensor_bitmap);
+	}
+
 	/*
 	 * Check if the TMU shares some registers and then try to map the
 	 * memory of common registers.
@@ -1006,7 +1265,7 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct exynos_tmu_data *data;
-	int ret;
+	int ret, idx;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -1084,11 +1343,14 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 		goto err_sclk;
 	}
 
-	data->tzd = devm_thermal_of_zone_register(dev, 0, data,
-						  &exynos_sensor_ops);
-	if (IS_ERR(data->tzd)) {
-		ret = dev_err_probe(dev, PTR_ERR(data->tzd), "Failed to register sensor\n");
-		goto err_sclk;
+	for (idx = 0; idx < data->tz_count; ++idx) {
+		data->tzd_array[idx] = devm_thermal_of_zone_register(dev, idx, data,
+								     &exynos_sensor_ops);
+		if (IS_ERR(data->tzd_array[idx])) {
+			ret = dev_err_probe(dev, PTR_ERR(data->tzd_array[idx]),
+					    "Failed to register sensor\n");
+			goto err_sclk;
+		}
 	}
 
 	ret = exynos_thermal_zone_configure(pdev);
-- 
2.50.1


