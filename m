Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0B51B61AA
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 18 Sep 2019 12:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726959AbfIRKq5 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 18 Sep 2019 06:46:57 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:36689 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725899AbfIRKq4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 18 Sep 2019 06:46:56 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190918104655euoutp02bac651d30cba8b3a6a44aea6c4d404a6~FgpOXZ4nj3079330793euoutp02v
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Sep 2019 10:46:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190918104655euoutp02bac651d30cba8b3a6a44aea6c4d404a6~FgpOXZ4nj3079330793euoutp02v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1568803615;
        bh=W0m0YckfTXthUtjYcHFKSPQtO04i18UtJ6ZHRQHTJ+Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=u8zWtzrE0iztglvtc11sU8TEMgOXSE4PlEc9wj7PsM/f5ylcebV15zJOO2cqqFCNa
         mR2GWkPt3BUdJqIhNaYPxome6TvsQMqbGW8PSVo4egpzWzOHpcN4/Npb4w/G0JO6by
         b5pKVEAGkaCAFbPIlQYpqyv+Uih/8WPSos0OurjE=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190918104654eucas1p1e66884c672d780de895c4e1e46781058~FgpNNBBJD3008830088eucas1p1I;
        Wed, 18 Sep 2019 10:46:54 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id D8.16.04469.E1B028D5; Wed, 18
        Sep 2019 11:46:54 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190918104653eucas1p2e23ccbd05b3b780300adc9f4cb7a4c49~FgpMNee2u2379423794eucas1p2T;
        Wed, 18 Sep 2019 10:46:53 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190918104653eusmtrp156f91b8f66f54e7b6a70ed449ee7a999~FgpL9nIQq2822328223eusmtrp1-;
        Wed, 18 Sep 2019 10:46:53 +0000 (GMT)
X-AuditID: cbfec7f2-54fff70000001175-86-5d820b1e07bf
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 4E.1C.04117.C1B028D5; Wed, 18
        Sep 2019 11:46:53 +0100 (BST)
Received: from AMDC3061.DIGITAL.local (unknown [106.120.51.75]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190918104652eusmtip149538fb126963062e7f1fc6ac44ecb5f~FgpLXSzy60449804498eusmtip1i;
        Wed, 18 Sep 2019 10:46:52 +0000 (GMT)
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
Subject: [PATCH v1 1/9] ASoC: wm8994: Do not register inapplicable controls
 for WM1811
Date:   Wed, 18 Sep 2019 12:46:26 +0200
Message-Id: <20190918104634.15216-2-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190918104634.15216-1-s.nawrocki@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSfyyUcRzH+97zPPc8p86ejvh0GuuWSoaYraexluqP+6Naf7RGDV08YTns
        DiUrYn5dSGGEpLJwGC4zNLmdXxO5mGjMOkVMzHJYonTnYf33er8/n/f38/1896Uw0WtCTIVF
        RLOKCFm4hG+BN3Wv6V3sdyf5H+9txZjhQR2PaSisI5j8ySk+M5yiQczzzgGC0evrSWZ1OJ3H
        aL6NEEyh/h2Pqe2cIBnjYjvBpLR1kkzHfBrBDFYu805bSuuNSXxpS9EEKdWoM/jSN+UJ0oKS
        TSTNblQjqVFjf4m8auEdzIaHxbIKt1PXLUIbSgeIqDW3O2XaTpSIfh9VIYoC2hNyaoUqZEGJ
        6EoE/cktpAoJTGIZwYuZQK5gRFD7rBTfCbRXYZxfgWDswRyPE6aAOisJmdN82h2yurK32Jq2
        gfGSjK0ERm/wYOFPEW4uWNG+sLqxzDMzTjvCijZva7SQ9gJd2+yWD7QDVNdrMTMLaG9Y+mjA
        zQcBrSHhZcoK4prOQcb0HJ9jK5jraSQ5PgB9uZnbgWQEmW/HSU7kIPjSU7ad9oKOnkHCvBxG
        O0Fdqxtn+0BzhYrgdraEzwt7zTZmwidNBRhnCyE9VcR1H4J1dcH2ncXwcGoT51gKXV8Xce5J
        HyH4XhmXgxyK/s8qQ0iNbNkYpTyEVbpHsLddlTK5MiYixDUoUq5Bpt/T97dnqRmtDN3QIZpC
        kj1C+JDoLyJksco4uQ4BhUmshZfuJfiLhMGyuLusIjJQERPOKnXIjsIltsL4XYZrIjpEFs3e
        YtkoVrFT5VECcSK6svxzfdgwmVbs5jG7ljVzWT5gUL0KPZ8QtGTn2T+ff/Ksothl/2E756wa
        R/vRVa2Hh1A8PeEd8MM2tLpJ0jAi83k6tXK/yiZ2lSpPMWaK4svH8g6eeF/V211jCGweqgtY
        OuK8NnUz2O9M2K/HI/G5TmmCWL33RV+B375RMvXCp1wJrgyVuR/DFErZP/qui105AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnkeLIzCtJLcpLzFFi42I5/e/4XV1Z7qZYg2sxFlcuHmKy2DhjPavF
        1IdP2CyutG5itJh/5ByrxfnzG9gtvl3pYLLY9Pgaq8WM8/uYLNYeuctu8fn9flaL1r1H2C0O
        v2lntbi44guTA5/Hhs9NbB47Z91l99i0qpPNY/OSeo/pc/4zevRtWcXo8XmTXAB7lJ5NUX5p
        SapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpOZllqkb5dgl7GxnnnWAt+6lcs
        OHCEsYHxl0YXIweHhICJxP6VzF2MXBxCAksZJY48m8QMEZeSmN+i1MXICWQKS/y51sUGUfOJ
        UeJg83R2kASbgKFE79E+RhBbREBM4vacTrBBzAJdzBLvd/xiBUkIC4RJ7Fr0kgXEZhFQlfh6
        YApYM6+AtcShvS+YIDbIS6zecIAZxOYUsJH4dOEBWL0QUM2CY9MYJzDyLWBkWMUoklpanJue
        W2ykV5yYW1yal66XnJ+7iREYCduO/dyyg7HrXfAhRgEORiUeXomzDbFCrIllxZW5hxglOJiV
        RHgDautjhXhTEiurUovy44tKc1KLDzGaAh01kVlKNDkfGKV5JfGGpobmFpaG5sbmxmYWSuK8
        HQIHY4QE0hNLUrNTUwtSi2D6mDg4pRoYnR2CpdQk03k33J4ff71ui+AjI+PFZ7hXCwncTm47
        Hl858dXJuzeznTlKGGq1OnbnPFr1dfqKH57hC9yahDO91bra687rX7sh+vdKg4UCe5RDN/sH
        7vtFj9ZoWs1hCk91UUr7Mv3Fpdi73zcuCjh58FXCSRFbU4Zb36XjdHz1CvqXGStaPaxQYinO
        SDTUYi4qTgQA/8dnWJoCAAA=
X-CMS-MailID: 20190918104653eucas1p2e23ccbd05b3b780300adc9f4cb7a4c49
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190918104653eucas1p2e23ccbd05b3b780300adc9f4cb7a4c49
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190918104653eucas1p2e23ccbd05b3b780300adc9f4cb7a4c49
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
        <CGME20190918104653eucas1p2e23ccbd05b3b780300adc9f4cb7a4c49@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

In case of WM1811 device there are currently being registered controls
referring to registers not existing on that device.
It has been noticed when getting values of "AIF1ADC2 Volume", "AIF1DAC2
Volume" controls was failing during ALSA state restoring at boot time:
 "amixer: Mixer hw:0 load error: Device or resource busy"

Reading some registers through I2C was failing with EBUSY error and indeed
those registers were not available according to the datasheet.

To fix this controls not available on WM1811 are moved to a separate array
and registered only for WM8994 and WM8958.

There are some further differences between WM8994 and WM1811, e.g. registers
603h, 604h, 605h, which are not covered in this patch.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/codecs/wm8994.c | 43 +++++++++++++++++++++++----------------
 1 file changed, 26 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index c3d06e8bc54f..d5fb7f5dd551 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -533,13 +533,10 @@ static SOC_ENUM_SINGLE_DECL(dac_osr,
 static SOC_ENUM_SINGLE_DECL(adc_osr,
 			    WM8994_OVERSAMPLING, 1, osr_text);
 
-static const struct snd_kcontrol_new wm8994_snd_controls[] = {
+static const struct snd_kcontrol_new wm8994_common_snd_controls[] = {
 SOC_DOUBLE_R_TLV("AIF1ADC1 Volume", WM8994_AIF1_ADC1_LEFT_VOLUME,
 		 WM8994_AIF1_ADC1_RIGHT_VOLUME,
 		 1, 119, 0, digital_tlv),
-SOC_DOUBLE_R_TLV("AIF1ADC2 Volume", WM8994_AIF1_ADC2_LEFT_VOLUME,
-		 WM8994_AIF1_ADC2_RIGHT_VOLUME,
-		 1, 119, 0, digital_tlv),
 SOC_DOUBLE_R_TLV("AIF2ADC Volume", WM8994_AIF2_ADC_LEFT_VOLUME,
 		 WM8994_AIF2_ADC_RIGHT_VOLUME,
 		 1, 119, 0, digital_tlv),
@@ -556,8 +553,6 @@ SOC_ENUM("AIF2DACR Source", aif2dacr_src),
 
 SOC_DOUBLE_R_TLV("AIF1DAC1 Volume", WM8994_AIF1_DAC1_LEFT_VOLUME,
 		 WM8994_AIF1_DAC1_RIGHT_VOLUME, 1, 96, 0, digital_tlv),
-SOC_DOUBLE_R_TLV("AIF1DAC2 Volume", WM8994_AIF1_DAC2_LEFT_VOLUME,
-		 WM8994_AIF1_DAC2_RIGHT_VOLUME, 1, 96, 0, digital_tlv),
 SOC_DOUBLE_R_TLV("AIF2DAC Volume", WM8994_AIF2_DAC_LEFT_VOLUME,
 		 WM8994_AIF2_DAC_RIGHT_VOLUME, 1, 96, 0, digital_tlv),
 
@@ -565,17 +560,12 @@ SOC_SINGLE_TLV("AIF1 Boost Volume", WM8994_AIF1_CONTROL_2, 10, 3, 0, aif_tlv),
 SOC_SINGLE_TLV("AIF2 Boost Volume", WM8994_AIF2_CONTROL_2, 10, 3, 0, aif_tlv),
 
 SOC_SINGLE("AIF1DAC1 EQ Switch", WM8994_AIF1_DAC1_EQ_GAINS_1, 0, 1, 0),
-SOC_SINGLE("AIF1DAC2 EQ Switch", WM8994_AIF1_DAC2_EQ_GAINS_1, 0, 1, 0),
 SOC_SINGLE("AIF2 EQ Switch", WM8994_AIF2_EQ_GAINS_1, 0, 1, 0),
 
 WM8994_DRC_SWITCH("AIF1DAC1 DRC Switch", WM8994_AIF1_DRC1_1, 2),
 WM8994_DRC_SWITCH("AIF1ADC1L DRC Switch", WM8994_AIF1_DRC1_1, 1),
 WM8994_DRC_SWITCH("AIF1ADC1R DRC Switch", WM8994_AIF1_DRC1_1, 0),
 
-WM8994_DRC_SWITCH("AIF1DAC2 DRC Switch", WM8994_AIF1_DRC2_1, 2),
-WM8994_DRC_SWITCH("AIF1ADC2L DRC Switch", WM8994_AIF1_DRC2_1, 1),
-WM8994_DRC_SWITCH("AIF1ADC2R DRC Switch", WM8994_AIF1_DRC2_1, 0),
-
 WM8994_DRC_SWITCH("AIF2DAC DRC Switch", WM8994_AIF2_DRC_1, 2),
 WM8994_DRC_SWITCH("AIF2ADCL DRC Switch", WM8994_AIF2_DRC_1, 1),
 WM8994_DRC_SWITCH("AIF2ADCR DRC Switch", WM8994_AIF2_DRC_1, 0),
@@ -594,9 +584,6 @@ SOC_SINGLE("Sidetone HPF Switch", WM8994_SIDETONE, 6, 1, 0),
 SOC_ENUM("AIF1ADC1 HPF Mode", aif1adc1_hpf),
 SOC_DOUBLE("AIF1ADC1 HPF Switch", WM8994_AIF1_ADC1_FILTERS, 12, 11, 1, 0),
 
-SOC_ENUM("AIF1ADC2 HPF Mode", aif1adc2_hpf),
-SOC_DOUBLE("AIF1ADC2 HPF Switch", WM8994_AIF1_ADC2_FILTERS, 12, 11, 1, 0),
-
 SOC_ENUM("AIF2ADC HPF Mode", aif2adc_hpf),
 SOC_DOUBLE("AIF2ADC HPF Switch", WM8994_AIF2_ADC_FILTERS, 12, 11, 1, 0),
 
@@ -637,6 +624,24 @@ SOC_SINGLE("AIF2DAC 3D Stereo Switch", WM8994_AIF2_DAC_FILTERS_2,
 	   8, 1, 0),
 };
 
+/* Controls not available on WM1811 */
+static const struct snd_kcontrol_new wm8994_snd_controls[] = {
+SOC_DOUBLE_R_TLV("AIF1ADC2 Volume", WM8994_AIF1_ADC2_LEFT_VOLUME,
+		 WM8994_AIF1_ADC2_RIGHT_VOLUME,
+		 1, 119, 0, digital_tlv),
+SOC_DOUBLE_R_TLV("AIF1DAC2 Volume", WM8994_AIF1_DAC2_LEFT_VOLUME,
+		 WM8994_AIF1_DAC2_RIGHT_VOLUME, 1, 96, 0, digital_tlv),
+
+SOC_SINGLE("AIF1DAC2 EQ Switch", WM8994_AIF1_DAC2_EQ_GAINS_1, 0, 1, 0),
+
+WM8994_DRC_SWITCH("AIF1DAC2 DRC Switch", WM8994_AIF1_DRC2_1, 2),
+WM8994_DRC_SWITCH("AIF1ADC2L DRC Switch", WM8994_AIF1_DRC2_1, 1),
+WM8994_DRC_SWITCH("AIF1ADC2R DRC Switch", WM8994_AIF1_DRC2_1, 0),
+
+SOC_ENUM("AIF1ADC2 HPF Mode", aif1adc2_hpf),
+SOC_DOUBLE("AIF1ADC2 HPF Switch", WM8994_AIF1_ADC2_FILTERS, 12, 11, 1, 0),
+};
+
 static const struct snd_kcontrol_new wm8994_eq_controls[] = {
 SOC_SINGLE_TLV("AIF1DAC1 EQ1 Volume", WM8994_AIF1_DAC1_EQ_GAINS_1, 11, 31, 0,
 	       eq_tlv),
@@ -4258,13 +4263,15 @@ static int wm8994_component_probe(struct snd_soc_component *component)
 	wm8994_handle_pdata(wm8994);
 
 	wm_hubs_add_analogue_controls(component);
-	snd_soc_add_component_controls(component, wm8994_snd_controls,
-			     ARRAY_SIZE(wm8994_snd_controls));
+	snd_soc_add_component_controls(component, wm8994_common_snd_controls,
+				       ARRAY_SIZE(wm8994_common_snd_controls));
 	snd_soc_dapm_new_controls(dapm, wm8994_dapm_widgets,
 				  ARRAY_SIZE(wm8994_dapm_widgets));
 
 	switch (control->type) {
 	case WM8994:
+		snd_soc_add_component_controls(component, wm8994_snd_controls,
+					       ARRAY_SIZE(wm8994_snd_controls));
 		snd_soc_dapm_new_controls(dapm, wm8994_specific_dapm_widgets,
 					  ARRAY_SIZE(wm8994_specific_dapm_widgets));
 		if (control->revision < 4) {
@@ -4284,8 +4291,10 @@ static int wm8994_component_probe(struct snd_soc_component *component)
 		}
 		break;
 	case WM8958:
+		snd_soc_add_component_controls(component, wm8994_snd_controls,
+					       ARRAY_SIZE(wm8994_snd_controls));
 		snd_soc_add_component_controls(component, wm8958_snd_controls,
-				     ARRAY_SIZE(wm8958_snd_controls));
+					       ARRAY_SIZE(wm8958_snd_controls));
 		snd_soc_dapm_new_controls(dapm, wm8958_dapm_widgets,
 					  ARRAY_SIZE(wm8958_dapm_widgets));
 		if (control->revision < 1) {
-- 
2.17.1

