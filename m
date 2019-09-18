Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEFFEB61AF
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 18 Sep 2019 12:47:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727252AbfIRKrC (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 18 Sep 2019 06:47:02 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:56425 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727030AbfIRKrC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 18 Sep 2019 06:47:02 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190918104700euoutp018833c6b2343b85032bd334f591965a89~FgpS1K2zC1218112181euoutp015
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Sep 2019 10:47:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190918104700euoutp018833c6b2343b85032bd334f591965a89~FgpS1K2zC1218112181euoutp015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1568803620;
        bh=jo8NfcFsM8ji+aA0mcIGGdLDNGkm0zm4tpKoJrabSrY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CTrkaf5I2LFLe+b0XBhJjavasYCLap3TqC3EL56dXR0IdTy270pElDrT8PDZMVWfu
         nlzhs0ZsvIIFoZ/ujrIULQeWc+H7pSZZC0awRWJ749YTBtI18KL0msSr+G3oukWkK4
         xoUjO8ewVLfyOjwxaC3FMxInN0XkGGE9EXH37zG8=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190918104659eucas1p268d83ad670640425cfc782c6a87e1dda~FgpSDt1CI2378523785eucas1p2Q;
        Wed, 18 Sep 2019 10:46:59 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id D3.B4.04309.32B028D5; Wed, 18
        Sep 2019 11:46:59 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190918104658eucas1p2c1f07d3e8b915d8c3a448b80d2af5df0~FgpRPSm0y2379323793eucas1p2S;
        Wed, 18 Sep 2019 10:46:58 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190918104658eusmtrp251a8c7bd204d9283fc9fada0282614bd~FgpQ-n90U1555615556eusmtrp2V;
        Wed, 18 Sep 2019 10:46:58 +0000 (GMT)
X-AuditID: cbfec7f4-ae1ff700000010d5-0b-5d820b23ff2b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 41.2C.04117.22B028D5; Wed, 18
        Sep 2019 11:46:58 +0100 (BST)
Received: from AMDC3061.DIGITAL.local (unknown [106.120.51.75]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190918104657eusmtip1bc8fbffa86f46a4eab0e900e30467598~FgpQVzh8b0585005850eusmtip1H;
        Wed, 18 Sep 2019 10:46:57 +0000 (GMT)
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
Subject: [PATCH v1 3/9] ASoC: wm8994: Add support for setting MCLKn clock
 rate
Date:   Wed, 18 Sep 2019 12:46:28 +0200
Message-Id: <20190918104634.15216-4-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190918104634.15216-1-s.nawrocki@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSXUgUYRSG/WZ2dkZzbHaUPJhobUkU5E91MaCUWheDZAne9KPllpNK/rWj
        VlYomvlTamm2JoZl4aqR2mpLa1TLqi0luG1toqlkJl1YYrVaRpq5jtXde573fTnng4/CWS3h
        RSWlZgjqVFWyUu4i0z/72bd53Yq82EDTFZazWU0Yd7+6leCq3o/LOVuBDnF13X0EZ7G0kdx3
        WxHG6T70E1y15QnG3eseITn71FOCK3jcTXJdnwsJzto4jYW68W32PDlvqBkheV1zsZxvv5PD
        a2oXEF/W0Yx4u84nijzgEhIvJCdlCeqA7XEuiU97+8j0MsUpfZse5aIvdAlypoDZBqW2T7IS
        5EKxTCOCyvwWuTRMI/gyN0VIgx2BXTuL/la0PfO4ZGgRGM1j6F+laqCdcKTkTBCU9pQtNTyY
        VTBUW7zUwJk5DCbna2QOw52JgtcTRqwEUZSM8YNym68D00wwXB3OxaVtvnC3zbiknZkQ+PZy
        dOlYYPQkWAw3ZFJoFwzVW5a1O0yYO0hJe8OCoQ6TCvkILj0aIqXhMoJ35pvLDwqGLrOVcFyB
        MxuhtTNAwmFQOmeTOzAwbjAwqXBgfFFW6DW4hGkousBK6fXwq1mDSdoLLo4vyKQIDw9mwIFZ
        phzBzMipy8i35v+qmwg1I08hU0xJEMQtqcJJf1GVImamJvgfTUvRocXv0/vbPP0Qdc4dMSGG
        QkpX2vgiN5YlVFni6RQTAgpXetBR53JiWTpedTpbUKcdVmcmC6IJraZkSk/6jNPoQZZJUGUI
        xwUhXVD/dTHK2SsX1YW+6Q3spOsPJQa3aCfYylvPLbTr+ahhS3b4NfvbmPIdVdbo8Mi4MxWR
        Tla1vdBPuO0T16BZSwS++jpWP73ybPHOfU2uEQ2zx0Tznu7q0WFN9e6c99Gd+2MVW78p9m4z
        dGFho8cjBme949fHGK6PDP5QzPPPT2zob4qP5oyNaz4qZWKiKmgTrhZVfwC7XBIZOgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgkeLIzCtJLcpLzFFi42I5/e/4XV0l7qZYg6uTRS2uXDzEZLFxxnpW
        i6kPn7BZXGndxGgx/8g5Vovz5zewW3y70sFksenxNVaLGef3MVmsPXKX3eLz+/2sFq17j7Bb
        HH7TzmpxccUXJgc+jw2fm9g8ds66y+6xaVUnm8fmJfUe0+f8Z/To27KK0ePzJrkA9ig9m6L8
        0pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jP2nz7EX9AlW
        bNuwjbGB8QNvFyMnh4SAicTyo3+Zuxi5OIQEljJKPNqzga2LkQMoISUxv0UJokZY4s+1LjaI
        mk+MEtPXTmEHSbAJGEr0Hu1jBLFFBMQkbs/pBBvELNDFLPF+xy9WkISwgJ9E87QHjCBDWQRU
        JfqvyIOEeQWsJabcaWCGWCAvsXrDATCbU8BG4tOFBywgthBQzYJj0xgnMPItYGRYxSiSWlqc
        m55bbKRXnJhbXJqXrpecn7uJERgL24793LKDsetd8CFGAQ5GJR5eibMNsUKsiWXFlbmHGCU4
        mJVEeANq62OFeFMSK6tSi/Lji0pzUosPMZoC3TSRWUo0OR8Yp3kl8YamhuYWlobmxubGZhZK
        4rwdAgdjhATSE0tSs1NTC1KLYPqYODilGhgVaiceVbvDaNek5n3E5zFbjaWdmN51/UU/o6sE
        ZFX/1uza2ry1JX+up8u5XfOO6i2y5DhRZjdpluqcC7t2rG9gV9zZyPm0vCtvVu9c/9/97fKs
        JoE+547wXf95lZFrwXNHe3+/CxwiUulKhp/W7xXo/z6f+0qGGaeFDouo/cxfxre9UkPWKCix
        FGckGmoxFxUnAgAmziw7mwIAAA==
X-CMS-MailID: 20190918104658eucas1p2c1f07d3e8b915d8c3a448b80d2af5df0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190918104658eucas1p2c1f07d3e8b915d8c3a448b80d2af5df0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190918104658eucas1p2c1f07d3e8b915d8c3a448b80d2af5df0
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
        <CGME20190918104658eucas1p2c1f07d3e8b915d8c3a448b80d2af5df0@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Extend the set_sysclk() handler so we also set frequency of the MCLK1,
MCLK2 clocks through clk API when those clocks are specified in DT for
the device.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/codecs/wm8994.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index d5fb7f5dd551..b6b0842ae1fc 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -2372,12 +2372,30 @@ static int wm8994_set_fll(struct snd_soc_dai *dai, int id, int src,
 	return _wm8994_set_fll(dai->component, id, src, freq_in, freq_out);
 }
 
+static int wm8994_set_mclk_rate(struct wm8994_priv *wm8994, unsigned int id,
+				unsigned int *freq)
+{
+	struct wm8994 *control = wm8994->wm8994;
+	int ret;
+
+	if (!control->mclk[id].clk || *freq == wm8994->mclk[id])
+		return 0;
+
+	ret = clk_set_rate(control->mclk[id].clk, *freq);
+	if (ret < 0)
+		return ret;
+
+	*freq = clk_get_rate(control->mclk[id].clk);
+
+	return 0;
+}
+
 static int wm8994_set_dai_sysclk(struct snd_soc_dai *dai,
 		int clk_id, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
-	int i;
+	int ret, i;
 
 	switch (dai->id) {
 	case 1:
@@ -2392,6 +2410,11 @@ static int wm8994_set_dai_sysclk(struct snd_soc_dai *dai,
 	switch (clk_id) {
 	case WM8994_SYSCLK_MCLK1:
 		wm8994->sysclk[dai->id - 1] = WM8994_SYSCLK_MCLK1;
+
+		ret = wm8994_set_mclk_rate(wm8994, dai->id - 1, &freq);
+		if (ret < 0)
+			return ret;
+
 		wm8994->mclk[0] = freq;
 		dev_dbg(dai->dev, "AIF%d using MCLK1 at %uHz\n",
 			dai->id, freq);
@@ -2400,6 +2423,11 @@ static int wm8994_set_dai_sysclk(struct snd_soc_dai *dai,
 	case WM8994_SYSCLK_MCLK2:
 		/* TODO: Set GPIO AF */
 		wm8994->sysclk[dai->id - 1] = WM8994_SYSCLK_MCLK2;
+
+		ret = wm8994_set_mclk_rate(wm8994, dai->id - 1, &freq);
+		if (ret < 0)
+			return ret;
+
 		wm8994->mclk[1] = freq;
 		dev_dbg(dai->dev, "AIF%d using MCLK2 at %uHz\n",
 			dai->id, freq);
-- 
2.17.1

