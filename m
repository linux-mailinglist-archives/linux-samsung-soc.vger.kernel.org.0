Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73441B902E
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 20 Sep 2019 15:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726983AbfITNDW (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 20 Sep 2019 09:03:22 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:46419 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726937AbfITNDV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Sep 2019 09:03:21 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190920130319euoutp012ed1913ceb77422b8772d3f4375ccb1a~GJy4ucUNL3045630456euoutp01Y
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Sep 2019 13:03:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190920130319euoutp012ed1913ceb77422b8772d3f4375ccb1a~GJy4ucUNL3045630456euoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1568984599;
        bh=IG9aCUpkb0C0GY0PPxLQ1iORcwSzlQcY4xdiM6gKoI8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=i15ajaJ/KFHXFBUaLOCPFR1tDw2owWQ5VbH8nOf22PDwNO1m8vAjilP34jiwUQNV+
         Hwy3B1CCSyuKJJg7DNkf78LmM0CtbcnoYQ0hFUXKc1NAj+XesF/W9ZLEw+3AeCkrLm
         FPg9zQ19A5xpZsTzLg9s3b7yz0dBIxfaVlCXQjgw=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190920130318eucas1p156104b46606a060bd072a6e6f11aeafb~GJy38FL7A2596425964eucas1p1O;
        Fri, 20 Sep 2019 13:03:18 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id CC.7A.04374.61EC48D5; Fri, 20
        Sep 2019 14:03:18 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190920130317eucas1p188d724710077d704f768798c6555c741~GJy3BFm9X2911529115eucas1p15;
        Fri, 20 Sep 2019 13:03:17 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190920130317eusmtrp16b78b1f48999d384e18ddb1881338181~GJy2vn7m_0476604766eusmtrp1W;
        Fri, 20 Sep 2019 13:03:17 +0000 (GMT)
X-AuditID: cbfec7f5-4ddff70000001116-32-5d84ce16f1b3
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 3D.01.04117.51EC48D5; Fri, 20
        Sep 2019 14:03:17 +0100 (BST)
Received: from AMDC3061.DIGITAL.local (unknown [106.120.51.75]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190920130316eusmtip205c8a75816f8ed3648877c26c6490308~GJy2D0jwE1287812878eusmtip2S;
        Fri, 20 Sep 2019 13:03:16 +0000 (GMT)
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
Subject: [PATCH v2 04/10] ASoC: wm8994: Add support for MCLKn clock gating
Date:   Fri, 20 Sep 2019 15:02:13 +0200
Message-Id: <20190920130218.32690-5-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190920130218.32690-1-s.nawrocki@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOKsWRmVeSWpSXmKPExsWy7djPc7pi51piDe7MFbK4cvEQk8XGGetZ
        LaY+fMJmcaV1E6PF/CPnWC3On9/AbvHtSgeTxabH11gtZpzfx2Sx9shddovP7/ezWrTuPcJu
        cfhNO6vFxRVfmBz4PDZ8bmLz2DnrLrvHplWdbB6bl9R7TJ/zn9Gjb8sqRo/Pm+QC2KO4bFJS
        czLLUov07RK4Mjo6P7MUfDCo6J27l7GBsV29i5GTQ0LAROLMz2WMILaQwApGiclrBLsYuYDs
        L4wSiz7uYoVwPjNKHG/YxQ7TsXL5KajEckaJabfOMcG17Fh0hw2kik3AUKL3aB/YXBEBdYn7
        M5rAOpgFXjJJTDi6jgkkISzgJbH5+kqwBhYBVYkFvxaA2bwC1hK/9v5hhVgnL7F6wwFmEJtT
        wEbi5Y1FTBDxbewSrw4oQdguEktutrNA2MISr45vgTpVRuL05B4WkMUSAs2MEj27b7NDOBMY
        Je4fX8AIUWUtcfj4RaBtHEDnaUqs36UPEXaU6Lq7iwUkLCHAJ3HjrSBImBnInLRtOjNEmFei
        o00IolpF4veq6VCnSUl0P/kP1ekh8aYpBBI+/YwS6zZPYJvAKD8LYdcCRsZVjOKppcW56anF
        xnmp5XrFibnFpXnpesn5uZsYgcnn9L/jX3cw7vuTdIhRgINRiYfX41hLrBBrYllxZe4hRgkO
        ZiUR3jmmTbFCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeasZHkQLCaQnlqRmp6YWpBbBZJk4OKUa
        GPWdEjIcpHcY7El8eYgpaWvXC3mnZWFs7nrVykJHTxyPE0uQyShU1ePZ/8dfpPuowV+FlDb7
        iSUfXshxPpXRufy4a8GS9rbjKp2zuHmz7PWMjHdE1rsLXJtu2OWbqepxeX8fa7mSakHMPcF/
        O6fHfmXWKmW6Iu9ow7t/yoR9Iav4bqybGL1EiaU4I9FQi7moOBEA8uyqPDoDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeLIzCtJLcpLzFFi42I5/e/4PV3Rcy2xBs+6hSyuXDzEZLFxxnpW
        i6kPn7BZXGndxGgx/8g5Vovz5zewW3y70sFksenxNVaLGef3MVmsPXKX3eLz+/2sFq17j7Bb
        HH7TzmpxccUXJgc+jw2fm9g8ds66y+6xaVUnm8fmJfUe0+f8Z/To27KK0ePzJrkA9ig9m6L8
        0pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jI7OzywFHwwq
        eufuZWxgbFfvYuTkkBAwkVi5/BRrFyMXh5DAUkaJV7d7gRwOoISUxPwWJYgaYYk/17rYIGo+
        MUqcX7WPBSTBJmAo0Xu0jxHEFhHQlOiYdxtsELPAdyaJA49PMoMkhAW8JDZfX8kGYrMIqEos
        +LUAzOYVsJb4tfcPK8QGeYnVGw6A1XMK2Ei8vLGICcQWAqo5vW8v+wRGvgWMDKsYRVJLi3PT
        c4uN9IoTc4tL89L1kvNzNzECo2HbsZ9bdjB2vQs+xCjAwajEw+txrCVWiDWxrLgy9xCjBAez
        kgjvHNOmWCHelMTKqtSi/Pii0pzU4kOMpkBHTWSWEk3OB0ZqXkm8oamhuYWlobmxubGZhZI4
        b4fAwRghgfTEktTs1NSC1CKYPiYOTqkGxhajKzNFc3N1pU691717vyhCZ5dYr++tOe5KIj8X
        6X9+MkUr7ftWnnVFGm083xYu7lhc8yGqRN/S/93R/20r7Wac8a+d86t/34O5cWlfVbZe1Fpw
        U1dhr92XbxpekYfDNFkuaK/tO9cou9u+4DTbzLXVMyNzfu+f65+t4j01IH+1wrpbTgd/iyix
        FGckGmoxFxUnAgBuipennAIAAA==
X-CMS-MailID: 20190920130317eucas1p188d724710077d704f768798c6555c741
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190920130317eucas1p188d724710077d704f768798c6555c741
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190920130317eucas1p188d724710077d704f768798c6555c741
References: <20190920130218.32690-1-s.nawrocki@samsung.com>
        <CGME20190920130317eucas1p188d724710077d704f768798c6555c741@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

As an intermediate step before covering the clocking subsystem
of the CODEC entirely by the clk API add handling of external CODEC's
master clocks in DAPM events when the AIFn clocks are sourced directly
from MCLKn; when FLLn are used we enable/disable respective MCLKn
before/after FLLn is enabled/disabled.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes since v1:
 - addressed review comments from Charles
---
 sound/soc/codecs/wm8994.c | 108 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 104 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index f69545dced25..15ce64a48a87 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -1038,6 +1038,45 @@ static bool wm8994_check_class_w_digital(struct snd_soc_component *component)
 	return true;
 }
 
+static int aif_mclk_set(struct snd_soc_component *component, int aif, bool enable)
+{
+	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
+	unsigned int offset, val, clk_idx;
+	int ret;
+
+	if (aif)
+		offset = 4;
+	else
+		offset = 0;
+
+	val = snd_soc_component_read32(component, WM8994_AIF1_CLOCKING_1 + offset);
+	val &= WM8994_AIF1CLK_SRC_MASK;
+
+	switch (val) {
+	case 0:
+		clk_idx = WM8994_MCLK1;
+		break;
+	case 1:
+		clk_idx = WM8994_MCLK2;
+		break;
+	default:
+		return 0;
+	}
+
+	if (enable) {
+		ret = clk_prepare_enable(wm8994->mclk[clk_idx].clk);
+		if (ret < 0) {
+			dev_err(component->dev,	"Failed to enable MCLK%d\n",
+				clk_idx);
+			return ret;
+		}
+	} else {
+		clk_disable_unprepare(wm8994->mclk[clk_idx].clk);
+	}
+
+	return 0;
+}
+
 static int aif1clk_ev(struct snd_soc_dapm_widget *w,
 		      struct snd_kcontrol *kcontrol, int event)
 {
@@ -1045,7 +1084,7 @@ static int aif1clk_ev(struct snd_soc_dapm_widget *w,
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 	struct wm8994 *control = wm8994->wm8994;
 	int mask = WM8994_AIF1DAC1L_ENA | WM8994_AIF1DAC1R_ENA;
-	int i;
+	int ret, i;
 	int dac;
 	int adc;
 	int val;
@@ -1061,6 +1100,10 @@ static int aif1clk_ev(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
+		ret = aif_mclk_set(component, 0, true);
+		if (ret < 0)
+			return ret;
+
 		/* Don't enable timeslot 2 if not in use */
 		if (wm8994->channels[0] <= 2)
 			mask &= ~(WM8994_AIF1DAC2L_ENA | WM8994_AIF1DAC2R_ENA);
@@ -1133,6 +1176,12 @@ static int aif1clk_ev(struct snd_soc_dapm_widget *w,
 		break;
 	}
 
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMD:
+		aif_mclk_set(component, 0, false);
+		break;
+	}
+
 	return 0;
 }
 
@@ -1140,13 +1189,17 @@ static int aif2clk_ev(struct snd_soc_dapm_widget *w,
 		      struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
-	int i;
+	int ret, i;
 	int dac;
 	int adc;
 	int val;
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
+		ret = aif_mclk_set(component, 1, true);
+		if (ret < 0)
+			return ret;
+
 		val = snd_soc_component_read32(component, WM8994_AIF2_CONTROL_1);
 		if ((val & WM8994_AIF2ADCL_SRC) &&
 		    (val & WM8994_AIF2ADCR_SRC))
@@ -1218,6 +1271,12 @@ static int aif2clk_ev(struct snd_soc_dapm_widget *w,
 		break;
 	}
 
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMD:
+		aif_mclk_set(component, 1, false);
+		break;
+	}
+
 	return 0;
 }
 
@@ -1623,10 +1682,10 @@ SND_SOC_DAPM_POST("Late Disable PGA", late_disable_ev)
 static const struct snd_soc_dapm_widget wm8994_lateclk_widgets[] = {
 SND_SOC_DAPM_SUPPLY("AIF1CLK", WM8994_AIF1_CLOCKING_1, 0, 0, aif1clk_ev,
 		    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
-		    SND_SOC_DAPM_PRE_PMD),
+		    SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
 SND_SOC_DAPM_SUPPLY("AIF2CLK", WM8994_AIF2_CLOCKING_1, 0, 0, aif2clk_ev,
 		    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
-		    SND_SOC_DAPM_PRE_PMD),
+		    SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
 SND_SOC_DAPM_PGA("Direct Voice", SND_SOC_NOPM, 0, 0, NULL, 0),
 SND_SOC_DAPM_MIXER("SPKL", WM8994_POWER_MANAGEMENT_3, 8, 0,
 		   left_speaker_mixer, ARRAY_SIZE(left_speaker_mixer)),
@@ -2141,6 +2200,7 @@ static int _wm8994_set_fll(struct snd_soc_component *component, int id, int src,
 	u16 reg, clk1, aif_reg, aif_src;
 	unsigned long timeout;
 	bool was_enabled;
+	struct clk *mclk;
 
 	switch (id) {
 	case WM8994_FLL1:
@@ -2216,6 +2276,27 @@ static int _wm8994_set_fll(struct snd_soc_component *component, int id, int src,
 	snd_soc_component_update_bits(component, WM8994_FLL1_CONTROL_1 + reg_offset,
 			    WM8994_FLL1_ENA, 0);
 
+	/* Disable MCLK if needed before we possibly change to new clock parent */
+	if (was_enabled) {
+		reg = snd_soc_component_read32(component, WM8994_FLL1_CONTROL_5
+							+ reg_offset);
+		reg = ((reg & WM8994_FLL1_REFCLK_SRC_MASK)
+			>> WM8994_FLL1_REFCLK_SRC_SHIFT) + 1;
+
+		switch (reg) {
+		case WM8994_FLL_SRC_MCLK1:
+			mclk = wm8994->mclk[WM8994_MCLK1].clk;
+			break;
+		case WM8994_FLL_SRC_MCLK2:
+			mclk = wm8994->mclk[WM8994_MCLK2].clk;
+			break;
+		default:
+			mclk = NULL;
+		}
+
+		clk_disable_unprepare(mclk);
+	}
+
 	if (wm8994->fll_byp && src == WM8994_FLL_SRC_BCLK &&
 	    freq_in == freq_out && freq_out) {
 		dev_dbg(component->dev, "Bypassing FLL%d\n", id + 1);
@@ -2260,10 +2341,29 @@ static int _wm8994_set_fll(struct snd_soc_component *component, int id, int src,
 	/* Clear any pending completion from a previous failure */
 	try_wait_for_completion(&wm8994->fll_locked[id]);
 
+	switch (src) {
+	case WM8994_FLL_SRC_MCLK1:
+		mclk = wm8994->mclk[WM8994_MCLK1].clk;
+		break;
+	case WM8994_FLL_SRC_MCLK2:
+		mclk = wm8994->mclk[WM8994_MCLK2].clk;
+		break;
+	default:
+		mclk = NULL;
+	}
+
 	/* Enable (with fractional mode if required) */
 	if (freq_out) {
+		ret = clk_prepare_enable(mclk);
+		if (ret < 0) {
+			dev_err(component->dev, "Failed to enable MCLK for FLL%d\n",
+				id + 1);
+			return ret;
+		}
+
 		/* Enable VMID if we need it */
 		if (!was_enabled) {
+
 			active_reference(component);
 
 			switch (control->type) {
-- 
2.17.1

