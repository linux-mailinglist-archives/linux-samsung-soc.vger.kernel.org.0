Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 549E422F562
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 27 Jul 2020 18:31:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730956AbgG0Qbs (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 27 Jul 2020 12:31:48 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:48247 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728932AbgG0Qbr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Jul 2020 12:31:47 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200727163144euoutp02fa62bf47567b8ab37af80f7206fdeae3~lqQpcAzmc1738017380euoutp029
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jul 2020 16:31:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200727163144euoutp02fa62bf47567b8ab37af80f7206fdeae3~lqQpcAzmc1738017380euoutp029
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1595867504;
        bh=IHQI5UhEbasJG8eX+GFcfkbOJeGBs47y2+Hux4yf0KY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fKf0DGg85J+OJ5S/dt/7vZD8UHB60KkcJAi/gWvRVt46n9x55rOZ1+x/7WGMd0qj5
         ZamDt8rxSlJCIijIWPmzGuFi5PJmROwBcNDsbO3W0yXH8QLl6lJx6DXjs7xkmZPnXs
         1hhN1IqZQN2jdOjiKRKv23ifo/X1a87j2z6HdGss=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200727163144eucas1p2d4dad0fa95f41721bb7926b1bfa9865f~lqQpJxWJM0910009100eucas1p2s;
        Mon, 27 Jul 2020 16:31:44 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 5D.8D.05997.0710F1F5; Mon, 27
        Jul 2020 17:31:44 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200727163143eucas1p10dd2f48d4965c546d2fb07d5a141de5e~lqQoMzG7i1543615436eucas1p1e;
        Mon, 27 Jul 2020 16:31:43 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200727163143eusmtrp27d6fd4a49c90cf4429f827c3d30bca5b~lqQoMHh-U2098820988eusmtrp2B;
        Mon, 27 Jul 2020 16:31:43 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-70-5f1f0170e5ea
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 53.06.06017.F610F1F5; Mon, 27
        Jul 2020 17:31:43 +0100 (BST)
Received: from AMDC3061.digital.local (unknown [106.120.51.75]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200727163142eusmtip267bdb687d7a7756e0c3c3e41f9951ee3~lqQnmQlDn0555405554eusmtip2-;
        Mon, 27 Jul 2020 16:31:42 +0000 (GMT)
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
To:     broonie@kernel.org, krzk@kernel.org
Cc:     simon@lineageos.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        b.zolnierkie@samsung.com, m.szyprowski@samsung.com,
        linux-samsung-soc@vger.kernel.org, s.nawrocki@samsung.com
Subject: [PATCH v2 2/3] ASoC: samsung: Add sound support for Midas boards
Date:   Mon, 27 Jul 2020 18:30:26 +0200
Message-Id: <20200727163027.9242-2-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200727163027.9242-1-s.nawrocki@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplleLIzCtJLcpLzFFi42LZduzned0CRvl4g1ePlS2uXDzEZLFxxnpW
        i6kPn7BZzD9yjtXi/PkN7BYzzu9jslh75C67ReveI+wWh9+0s1psOXObzYHLY8PnJjaPTas6
        2Txa1m9i8+jbsorR4/MmuQDWKC6blNSczLLUIn27BK6MhefWsRac72KsaNjSwNbAeLmoi5GT
        Q0LAROLj/MVsXYxcHEICKxglJnVMhnK+MEpMPHeJBaRKSOAzo0TvtTCYji+t3UwQRcsZJTaf
        Oc4M1/HyRxczSBWbgKFE79E+RhBbREBd4v6MJlaQImaBm4wSMzf1sYEkhAU8JSYf7WACsVkE
        VCUmb74Oto5XwEri97dtbBDr5CVWbzgANpRTwFpi24c5YKslBNrZJb5MOswMUeQi8XpCE5Qt
        LPHq+BZ2CFtG4v/O+VANzYwSPbtvs0M4Exgl7h9fwAhRZS1x59wvoHUcQPdpSqzfpQ8RdpSY
        t/c8WFhCgE/ixltBkDAzkDlp23RmiDCvREebEES1isTvVdOZIGwpie4n/1kgbA+J05NfQEOo
        j1Hiy4V2lgmM8rMQli1gZFzFKJ5aWpybnlpslJdarlecmFtcmpeul5yfu4kRmEhO/zv+ZQfj
        rj9JhxgFOBiVeHgz9svFC7EmlhVX5h5ilOBgVhLhdTp7Ok6INyWxsiq1KD++qDQntfgQozQH
        i5I4r/Gil7FCAumJJanZqakFqUUwWSYOTqkGRtbU2XZJhiK/Sxd8lpIV+L/1jiKn07WlCrbh
        LYvWCTN3xRU/9fyseOlYHpPop0aeBV+YY08JT/z6vMRn7958G9eXc12WHl51xDZxh5puZkT/
        t8bV7w5/f359VdWBVQXRLgfCVDS7rxavYrqX4ht11/HY9/LFYiqNocxzPy5s3XbpTPQO1h/H
        ZyuxFGckGmoxFxUnAgCfJ4tFIAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDLMWRmVeSWpSXmKPExsVy+t/xe7r5jPLxBituSltcuXiIyWLjjPWs
        FlMfPmGzmH/kHKvF+fMb2C1mnN/HZLH2yF12i9a9R9gtDr9pZ7XYcuY2mwOXx4bPTWwem1Z1
        snm0rN/E5tG3ZRWjx+dNcgGsUXo2RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK
        +nY2Kak5mWWpRfp2CXoZC8+tYy0438VY0bClga2B8XJRFyMnh4SAicSX1m4mEFtIYCmjRHer
        ZBcjB1BcSmJ+ixJEibDEn2tdbF2MXEAlnxglGm4+ZgZJsAkYSvQe7WMEsUUENCU65t1mBSli
        FnjIKLH/+H2whLCAp8Tkox1gC1gEVCUmb77OAmLzClhJ/P62jQ1ig7zE6g0HwIZyClhLbPsw
        B+ogK4nZN8+yTGDkW8DIsIpRJLW0ODc9t9hIrzgxt7g0L10vOT93EyMwpLcd+7llB2PXu+BD
        jAIcjEo8vAcOysULsSaWFVfmHmKU4GBWEuF1Ons6Tog3JbGyKrUoP76oNCe1+BCjKdBRE5ml
        RJPzgfGWVxJvaGpobmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7NbUgtQimj4mDU6qBUeRa/xL/
        xz+W3dd4flhuR15H+e8PnFXpda3yCyLStvzT0dGZcMA7+Jzdh2WN0kJ6h5i/71/+dV/T599W
        F6LTvptPX5LybU1+kex0lzwJu4MB3IY3DXwyd6d8/Sp94uL/VR1ybDYV706mJPtMkI0JzOzL
        iv0aGLRX8cmMettIkTKDNQy7g3v/KbEUZyQaajEXFScCAMakR0N/AgAA
X-CMS-MailID: 20200727163143eucas1p10dd2f48d4965c546d2fb07d5a141de5e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200727163143eucas1p10dd2f48d4965c546d2fb07d5a141de5e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200727163143eucas1p10dd2f48d4965c546d2fb07d5a141de5e
References: <20200727163027.9242-1-s.nawrocki@samsung.com>
        <CGME20200727163143eucas1p10dd2f48d4965c546d2fb07d5a141de5e@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Simon Shields <simon@lineageos.org>

This patch adds support for voice and BT calls, along with standard
audio output via the speaker, earpiece, headphone jack, HDMI, and
any accessories compatible with Midas boards. This patch also supports
headphone/headset detection and headsets with inline buttons.

Signed-off-by: Simon Shields <simon@lineageos.org>
[m.szyprowski: adaptation to v5.1+ kernels (DAI links initialization)]
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
[s.nawrocki: removal of the clk API calls for CODEC MCLK, the jack data
 structure moved to struct midas_priv, coding style and typo fixes,
 conversion to new cpu/codec/dai-node binding]
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/Kconfig        |   8 +
 sound/soc/samsung/Makefile       |   2 +
 sound/soc/samsung/midas_wm1811.c | 543 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 553 insertions(+)
 create mode 100644 sound/soc/samsung/midas_wm1811.c

diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index 4b5c348..1431be4 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -225,4 +225,12 @@ config SND_SOC_SAMSUNG_ARIES_WM8994
 	  via ADC, GPIOs, and an extcon device.  Switching between the Mic
 	  and TV-Out path is also handled.
 
+config SND_SOC_SAMSUNG_MIDAS_WM1811
+	tristate "SoC I2S Audio support for Midas boards"
+	depends on SND_SOC_SAMSUNG
+	select SND_SAMSUNG_I2S
+	select SND_SOC_WM8994
+	help
+	  Say Y if you want to add support for SoC audio on the Midas boards.
+
 endif #SND_SOC_SAMSUNG
diff --git a/sound/soc/samsung/Makefile b/sound/soc/samsung/Makefile
index 22259f7..398e843 100644
--- a/sound/soc/samsung/Makefile
+++ b/sound/soc/samsung/Makefile
@@ -42,6 +42,7 @@ snd-soc-odroid-objs := odroid.o
 snd-soc-arndale-objs := arndale.o
 snd-soc-tm2-wm5110-objs := tm2_wm5110.o
 snd-soc-aries-wm8994-objs := aries_wm8994.o
+snd-soc-midas-wm1811-objs := midas_wm1811.o
 
 obj-$(CONFIG_SND_SOC_SAMSUNG_JIVE_WM8750) += snd-soc-jive-wm8750.o
 obj-$(CONFIG_SND_SOC_SAMSUNG_NEO1973_WM8753) += snd-soc-neo1973-wm8753.o
@@ -66,3 +67,4 @@ obj-$(CONFIG_SND_SOC_ODROID) += snd-soc-odroid.o
 obj-$(CONFIG_SND_SOC_ARNDALE) += snd-soc-arndale.o
 obj-$(CONFIG_SND_SOC_SAMSUNG_TM2_WM5110) += snd-soc-tm2-wm5110.o
 obj-$(CONFIG_SND_SOC_SAMSUNG_ARIES_WM8994) += snd-soc-aries-wm8994.o
+obj-$(CONFIG_SND_SOC_SAMSUNG_MIDAS_WM1811) += snd-soc-midas-wm1811.o
diff --git a/sound/soc/samsung/midas_wm1811.c b/sound/soc/samsung/midas_wm1811.c
new file mode 100644
index 0000000..d03340c
--- /dev/null
+++ b/sound/soc/samsung/midas_wm1811.c
@@ -0,0 +1,543 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Midas audio support
+//
+// Copyright (C) 2018 Simon Shields <simon@lineageos.org>
+// Copyright (C) 2020 Samsung Electronics Co., Ltd.
+
+#include <linux/clk.h>
+#include <linux/mfd/wm8994/registers.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_gpio.h>
+#include <linux/regulator/consumer.h>
+#include <sound/jack.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+
+#include "i2s.h"
+#include "../codecs/wm8994.h"
+
+/*
+ * The MCLK1 clock source is XCLKOUT with its mux set to the external fixed rate
+ * oscillator (XXTI).
+ */
+#define MCLK1_RATE 24000000U
+#define MCLK2_RATE 32768U
+#define DEFAULT_FLL1_RATE 11289600U
+
+struct midas_priv {
+	struct regulator *reg_mic_bias;
+	struct regulator *reg_submic_bias;
+	struct gpio_desc *gpio_fm_sel;
+	struct gpio_desc *gpio_lineout_sel;
+	unsigned int fll1_rate;
+
+	struct snd_soc_jack headset_jack;
+};
+
+static int midas_start_fll1(struct snd_soc_pcm_runtime *rtd, unsigned int rate)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct midas_priv *priv = snd_soc_card_get_drvdata(card);
+	struct snd_soc_dai *aif1_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	int ret;
+
+	if (!rate)
+		rate = priv->fll1_rate;
+	/*
+	 * If no new rate is requested, set FLL1 to a sane default for jack
+	 * detection.
+	 */
+	if (!rate)
+		rate = DEFAULT_FLL1_RATE;
+
+	if (rate != priv->fll1_rate && priv->fll1_rate) {
+		/* while reconfiguring, switch to MCLK2 for SYSCLK */
+		ret = snd_soc_dai_set_sysclk(aif1_dai, WM8994_SYSCLK_MCLK2,
+					     MCLK2_RATE, SND_SOC_CLOCK_IN);
+		if (ret < 0) {
+			dev_err(card->dev, "Unable to switch to MCLK2: %d\n", ret);
+			return ret;
+		}
+	}
+
+	ret = snd_soc_dai_set_pll(aif1_dai, WM8994_FLL1, WM8994_FLL_SRC_MCLK1,
+				  MCLK1_RATE, rate);
+	if (ret < 0) {
+		dev_err(card->dev, "Failed to set FLL1 rate: %d\n", ret);
+		return ret;
+	}
+	priv->fll1_rate = rate;
+
+	ret = snd_soc_dai_set_sysclk(aif1_dai, WM8994_SYSCLK_FLL1,
+				     priv->fll1_rate, SND_SOC_CLOCK_IN);
+	if (ret < 0) {
+		dev_err(card->dev, "Failed to set SYSCLK source: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dai_set_sysclk(cpu_dai, SAMSUNG_I2S_OPCLK, 0,
+				     SAMSUNG_I2S_OPCLK_PCLK);
+	if (ret < 0) {
+		dev_err(card->dev, "Failed to set OPCLK source: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int midas_stop_fll1(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct midas_priv *priv = snd_soc_card_get_drvdata(card);
+	struct snd_soc_dai *aif1_dai = asoc_rtd_to_codec(rtd, 0);
+	int ret;
+
+	ret = snd_soc_dai_set_sysclk(aif1_dai, WM8994_SYSCLK_MCLK2,
+				     MCLK2_RATE, SND_SOC_CLOCK_IN);
+	if (ret < 0) {
+		dev_err(card->dev, "Unable to switch to MCLK2: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dai_set_pll(aif1_dai, WM8994_FLL1, 0, 0, 0);
+	if (ret < 0) {
+		dev_err(card->dev, "Unable to stop FLL1: %d\n", ret);
+		return ret;
+	}
+
+	priv->fll1_rate = 0;
+
+	return 0;
+}
+
+static int midas_aif1_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd	= substream->private_data;
+	unsigned int pll_out;
+
+	/* AIF1CLK should be at least 3MHz for "optimal performance" */
+	if (params_rate(params) == 8000 || params_rate(params) == 11025)
+		pll_out = params_rate(params) * 512;
+	else
+		pll_out = params_rate(params) * 256;
+
+	return midas_start_fll1(rtd, pll_out);
+}
+
+static struct snd_soc_ops midas_aif1_ops = {
+	.hw_params = midas_aif1_hw_params,
+};
+
+/*
+ * We only have a single external speaker, so mix stereo data
+ * to a single mono stream.
+ */
+static int midas_ext_spkmode(struct snd_soc_dapm_widget *w,
+			     struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *codec = snd_soc_dapm_to_component(w->dapm);
+	int ret = 0;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		ret = snd_soc_component_update_bits(codec, WM8994_SPKOUT_MIXERS,
+				  WM8994_SPKMIXR_TO_SPKOUTL_MASK,
+				  WM8994_SPKMIXR_TO_SPKOUTL);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		ret = snd_soc_component_update_bits(codec, WM8994_SPKOUT_MIXERS,
+				  WM8994_SPKMIXR_TO_SPKOUTL_MASK,
+				  0);
+		break;
+	}
+
+	return ret;
+}
+
+static int midas_mic_bias(struct snd_soc_dapm_widget *w,
+			  struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_card *card = w->dapm->card;
+	struct midas_priv *priv = snd_soc_card_get_drvdata(card);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		return regulator_enable(priv->reg_mic_bias);
+	case SND_SOC_DAPM_POST_PMD:
+		return regulator_disable(priv->reg_mic_bias);
+	}
+
+	return 0;
+}
+
+static int midas_submic_bias(struct snd_soc_dapm_widget *w,
+			     struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_card *card = w->dapm->card;
+	struct midas_priv *priv = snd_soc_card_get_drvdata(card);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		return regulator_enable(priv->reg_submic_bias);
+	case SND_SOC_DAPM_POST_PMD:
+		return regulator_disable(priv->reg_submic_bias);
+	}
+
+	return 0;
+}
+
+static int midas_fm_set(struct snd_soc_dapm_widget *w,
+			struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_card *card = w->dapm->card;
+	struct midas_priv *priv = snd_soc_card_get_drvdata(card);
+
+	if (!priv->gpio_fm_sel)
+		return 0;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		gpiod_set_value_cansleep(priv->gpio_fm_sel, 1);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		gpiod_set_value_cansleep(priv->gpio_fm_sel, 0);
+		break;
+	}
+
+	return 0;
+}
+
+static int midas_line_set(struct snd_soc_dapm_widget *w,
+			  struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_card *card = w->dapm->card;
+	struct midas_priv *priv = snd_soc_card_get_drvdata(card);
+
+	if (!priv->gpio_lineout_sel)
+		return 0;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		gpiod_set_value_cansleep(priv->gpio_lineout_sel, 1);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		gpiod_set_value_cansleep(priv->gpio_lineout_sel, 0);
+		break;
+	}
+
+	return 0;
+}
+
+static const struct snd_kcontrol_new midas_controls[] = {
+	SOC_DAPM_PIN_SWITCH("HP"),
+
+	SOC_DAPM_PIN_SWITCH("SPK"),
+	SOC_DAPM_PIN_SWITCH("RCV"),
+
+	SOC_DAPM_PIN_SWITCH("LINE"),
+	SOC_DAPM_PIN_SWITCH("HDMI"),
+
+	SOC_DAPM_PIN_SWITCH("Main Mic"),
+	SOC_DAPM_PIN_SWITCH("Sub Mic"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+
+	SOC_DAPM_PIN_SWITCH("FM In"),
+};
+
+static const struct snd_soc_dapm_widget midas_dapm_widgets[] = {
+	SND_SOC_DAPM_HP("HP", NULL),
+
+	SND_SOC_DAPM_SPK("SPK", midas_ext_spkmode),
+	SND_SOC_DAPM_SPK("RCV", NULL),
+
+	/* FIXME: toggle MAX77693 on i9300/i9305 */
+	SND_SOC_DAPM_LINE("LINE", midas_line_set),
+	SND_SOC_DAPM_LINE("HDMI", NULL),
+	SND_SOC_DAPM_LINE("FM In", midas_fm_set),
+
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_MIC("Main Mic", midas_mic_bias),
+	SND_SOC_DAPM_MIC("Sub Mic", midas_submic_bias),
+};
+
+static int midas_set_bias_level(struct snd_soc_card *card,
+				struct snd_soc_dapm_context *dapm,
+				enum snd_soc_bias_level level)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_get_pcm_runtime(card,
+						  &card->dai_link[0]);
+	struct snd_soc_dai *aif1_dai = asoc_rtd_to_codec(rtd, 0);
+
+	if (dapm->dev != aif1_dai->dev)
+		return 0;
+
+	switch (level) {
+	case SND_SOC_BIAS_STANDBY:
+		return midas_stop_fll1(rtd);
+	case SND_SOC_BIAS_PREPARE:
+		return midas_start_fll1(rtd, 0);
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int midas_late_probe(struct snd_soc_card *card)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_get_pcm_runtime(card,
+							&card->dai_link[0]);
+	struct snd_soc_dai *aif1_dai = asoc_rtd_to_codec(rtd, 0);
+	struct midas_priv *priv = snd_soc_card_get_drvdata(card);
+	int ret;
+
+	/* Use MCLK2 as SYSCLK for boot */
+	ret = snd_soc_dai_set_sysclk(aif1_dai, WM8994_SYSCLK_MCLK2, MCLK2_RATE,
+				     SND_SOC_CLOCK_IN);
+	if (ret < 0) {
+		dev_err(aif1_dai->dev, "Failed to switch to MCLK2: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_card_jack_new(card, "Headset",
+			SND_JACK_HEADSET | SND_JACK_MECHANICAL |
+			SND_JACK_BTN_0 | SND_JACK_BTN_1 | SND_JACK_BTN_2 |
+			SND_JACK_BTN_3 | SND_JACK_BTN_4 | SND_JACK_BTN_5,
+			&priv->headset_jack, NULL, 0);
+	if (ret)
+		return ret;
+
+	wm8958_mic_detect(aif1_dai->component, &priv->headset_jack,
+			  NULL, NULL, NULL, NULL);
+	return 0;
+}
+
+static struct snd_soc_dai_driver midas_ext_dai[] = {
+	{
+		.name = "Voice call",
+		.playback = {
+			.channels_min = 1,
+			.channels_max = 2,
+			.rate_min = 8000,
+			.rate_max = 16000,
+			.rates = (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000),
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		},
+		.capture = {
+			.channels_min = 1,
+			.channels_max = 2,
+			.rate_min = 8000,
+			.rate_max = 16000,
+			.rates = (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000),
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		},
+	},
+	{
+		.name = "Bluetooth",
+		.playback = {
+			.channels_min = 1,
+			.channels_max = 2,
+			.rate_min = 8000,
+			.rate_max = 16000,
+			.rates = (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000),
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		},
+		.capture = {
+			.channels_min = 1,
+			.channels_max = 2,
+			.rate_min = 8000,
+			.rate_max = 16000,
+			.rates = (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000),
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		},
+	},
+};
+
+static const struct snd_soc_component_driver midas_component = {
+	.name	= "midas-audio",
+};
+
+SND_SOC_DAILINK_DEFS(wm1811_hifi,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8994-aif1")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(wm1811_voice,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8994-aif2")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(wm1811_bt,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8994-aif3")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+static struct snd_soc_dai_link midas_dai[] = {
+	{
+		.name = "WM8994 AIF1",
+		.stream_name = "HiFi Primary",
+		.ops = &midas_aif1_ops,
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
+			SND_SOC_DAIFMT_CBM_CFM,
+		SND_SOC_DAILINK_REG(wm1811_hifi),
+	}, {
+		.name = "WM1811 Voice",
+		.stream_name = "Voice call",
+		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(wm1811_voice),
+	}, {
+		.name = "WM1811 BT",
+		.stream_name = "Bluetooth",
+		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(wm1811_bt),
+	},
+};
+
+static struct snd_soc_card midas_card = {
+	.name = "Midas WM1811",
+	.owner = THIS_MODULE,
+
+	.dai_link = midas_dai,
+	.num_links = ARRAY_SIZE(midas_dai),
+	.controls = midas_controls,
+	.num_controls = ARRAY_SIZE(midas_controls),
+	.dapm_widgets = midas_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(midas_dapm_widgets),
+
+	.set_bias_level = midas_set_bias_level,
+	.late_probe = midas_late_probe,
+};
+
+static int midas_probe(struct platform_device *pdev)
+{
+	struct device_node *cpu_dai_node = NULL, *codec_dai_node = NULL;
+	struct device_node *cpu = NULL, *codec = NULL;
+	struct snd_soc_card *card = &midas_card;
+	struct device *dev = &pdev->dev;
+	static struct snd_soc_dai_link *dai_link;
+	struct midas_priv *priv;
+	int ret, i;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	snd_soc_card_set_drvdata(card, priv);
+	card->dev = dev;
+
+	priv->reg_mic_bias = devm_regulator_get(dev, "mic-bias");
+	if (IS_ERR(priv->reg_mic_bias)) {
+		dev_err(dev, "Failed to get mic bias regulator\n");
+		return PTR_ERR(priv->reg_mic_bias);
+	}
+
+	priv->reg_submic_bias = devm_regulator_get(dev, "submic-bias");
+	if (IS_ERR(priv->reg_submic_bias)) {
+		dev_err(dev, "Failed to get submic bias regulator\n");
+		return PTR_ERR(priv->reg_submic_bias);
+	}
+
+	priv->gpio_fm_sel = devm_gpiod_get_optional(dev, "fm-sel", GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->gpio_fm_sel)) {
+		dev_err(dev, "Failed to get FM selection GPIO\n");
+		return PTR_ERR(priv->gpio_fm_sel);
+	}
+
+	priv->gpio_lineout_sel = devm_gpiod_get_optional(dev, "lineout-sel",
+						    GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->gpio_lineout_sel)) {
+		dev_err(dev, "Failed to get line out selection GPIO\n");
+		return PTR_ERR(priv->gpio_lineout_sel);
+	}
+
+	ret = snd_soc_of_parse_card_name(card, "model");
+	if (ret < 0) {
+		dev_err(dev, "Card name is not specified\n");
+		return ret;
+	}
+
+	ret = snd_soc_of_parse_audio_routing(card, "samsung,audio-routing");
+	if (ret < 0) {
+		dev_err(dev, "Audio routing invalid/unspecified\n");
+		return ret;
+	}
+
+	cpu = of_get_child_by_name(dev->of_node, "cpu");
+	if (!cpu)
+		return -EINVAL;
+
+	codec = of_get_child_by_name(dev->of_node, "codec");
+	if (!codec) {
+		of_node_put(cpu);
+		return -EINVAL;
+	}
+
+	cpu_dai_node = of_parse_phandle(cpu, "sound-dai", 0);
+	of_node_put(cpu);
+	if (!cpu_dai_node) {
+		dev_err(dev, "parsing cpu/sound-dai failed\n");
+		of_node_put(codec);
+		return -EINVAL;
+	}
+
+	codec_dai_node = of_parse_phandle(codec, "sound-dai", 0);
+	of_node_put(codec);
+	if (!codec_dai_node) {
+		dev_err(dev, "audio-codec property invalid/missing\n");
+		ret = -EINVAL;
+		goto put_cpu_dai_node;
+	}
+
+	for_each_card_prelinks(card, i, dai_link) {
+		dai_link->codecs->of_node = codec_dai_node;
+		dai_link->cpus->of_node = cpu_dai_node;
+		dai_link->platforms->of_node = cpu_dai_node;
+	}
+
+	ret = devm_snd_soc_register_component(dev, &midas_component,
+			midas_ext_dai, ARRAY_SIZE(midas_ext_dai));
+	if (ret < 0) {
+		dev_err(dev, "Failed to register component: %d\n", ret);
+		goto put_codec_dai_node;
+	}
+
+	ret = devm_snd_soc_register_card(dev, card);
+	if (ret < 0) {
+		dev_err(dev, "Failed to register card: %d\n", ret);
+		goto put_codec_dai_node;
+	}
+
+	return 0;
+
+put_codec_dai_node:
+	of_node_put(codec_dai_node);
+put_cpu_dai_node:
+	of_node_put(cpu_dai_node);
+	return ret;
+}
+
+static const struct of_device_id midas_of_match[] = {
+	{ .compatible = "samsung,midas-audio" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, midas_of_match);
+
+static struct platform_driver midas_driver = {
+	.driver = {
+		.name = "midas-audio",
+		.of_match_table = midas_of_match,
+		.owner = THIS_MODULE,
+		.pm = &snd_soc_pm_ops,
+	},
+	.probe = midas_probe,
+};
+module_platform_driver(midas_driver);
+
+MODULE_AUTHOR("Simon Shields <simon@lineageos.org>");
+MODULE_DESCRIPTION("ASoC support for Midas");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

