Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECDD1173483
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 28 Feb 2020 10:50:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgB1Juw (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 28 Feb 2020 04:50:52 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:50821 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbgB1Juv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 28 Feb 2020 04:50:51 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200228095050euoutp0228ce87276010cb8f1692b6ea111055c4~3iByBYRfN2503725037euoutp02-
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Feb 2020 09:50:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200228095050euoutp0228ce87276010cb8f1692b6ea111055c4~3iByBYRfN2503725037euoutp02-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1582883450;
        bh=fleFuhr5f/VAyMK6Ws0ACTPuUjhV43jHArcUZ5teahY=;
        h=From:To:Cc:Subject:Date:References:From;
        b=LSFqrg1OtEgAnd68LwPNyBHNTcIBqGddRnoX8jZks8iBhQA6ZDJ0cgmhl/bRGFqut
         RbYCti2yNqInQBrfi/6m5fK3wqkQGplLQTAu41ch9H8XztxQwaXJ2fleYhMgtfgsm0
         vKKwHlM4fJ1U62uto++f2+raXh3eEwmzbItz9MD4=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200228095049eucas1p2ac8c33b5304ffbb16564d035483c9c2c~3iBx08QUG0672906729eucas1p2-;
        Fri, 28 Feb 2020 09:50:49 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 93.99.60698.972E85E5; Fri, 28
        Feb 2020 09:50:49 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200228095049eucas1p291d54f69ee1586060c3594c017616265~3iBxeXGN-0581205812eucas1p2p;
        Fri, 28 Feb 2020 09:50:49 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200228095049eusmtrp14284121bf77f8eb41b99decc85d895df~3iBxdlR1B0639106391eusmtrp1Y;
        Fri, 28 Feb 2020 09:50:49 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-72-5e58e2795731
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id D7.C1.08375.972E85E5; Fri, 28
        Feb 2020 09:50:49 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200228095049eusmtip1e51e17ed0b1c297535423ecaae9bfaba~3iBxHwJxP1095410954eusmtip13;
        Fri, 28 Feb 2020 09:50:49 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Sangbeom Kim <sbkim73@samsung.com>,
        Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] ASoC: samsung: Silence warnings during deferred probe
Date:   Fri, 28 Feb 2020 10:50:42 +0100
Message-Id: <20200228095042.27389-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNIsWRmVeSWpSXmKPExsWy7djP87qVjyLiDI48MbS4cvEQk8XUh0/Y
        LM6f38BuMeP8PiaLtUfuslscftPOanFxxRcmB3aPDZ+b2Dw2repk8+jbsorR4/MmuQCWKC6b
        lNSczLLUIn27BK6MtZcvsxes1Kg48/AXcwPjZ8UuRk4OCQETiX3zXrJ1MXJxCAmsYJS4/P4I
        E4TzhVFiy9oVLBDOZ0aJHbOOssG0TJ+/EKplOaNEy7fNCC3rj55nBqliEzCU6HrbBdYhIuAk
        MXPOe7AOZoEzjBIX/3UzgSSEBdwkbk0+xwJiswioSqw6e4gdxOYVsJU4f+I3E8Q6eYnVGw4w
        gzRLCFxmk/jYMYkVIuEi8fnxUagiYYlXx7ewQ9gyEqcn97BANDQzSjw8t5YdwukB+q9pBiNE
        lbXEnXO/gG7iALpJU2L9Ln2IsKPE3N33mEDCEgJ8EjfeCoKEmYHMSdumM0OEeSU62oQgqtUk
        Zh1fB7f24IVLzBC2h8T++V9YQMqFBGIl/h0Wm8AoNwth1QJGxlWM4qmlxbnpqcXGeanlesWJ
        ucWleel6yfm5mxiBSeD0v+NfdzDu+5N0iFGAg1GJh3fBjvA4IdbEsuLK3EOMEhzMSiK8G7+G
        xgnxpiRWVqUW5ccXleakFh9ilOZgURLnNV70MlZIID2xJDU7NbUgtQgmy8TBKdXAeHDZgXPd
        +z42cp1ptHtsmby7XEf68jONiI251b58NixPJ/ssaJnx4AjfUbPH54wsSk5c2Xjw2arU75Pd
        zB8a9bBMdtcR67vGW/J8ev8ZmYJVFUXqvCcitF08zPI12zRe/d29VVP+o4tK1wuePezH47qf
        yFbcsDJ+qvVPLvNw+7T4zS9L2n9GKLEUZyQaajEXFScCAC9quGP+AgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrILMWRmVeSWpSXmKPExsVy+t/xu7qVjyLiDB5Mk7K4cvEQk8XUh0/Y
        LM6f38BuMeP8PiaLtUfuslscftPOanFxxRcmB3aPDZ+b2Dw2repk8+jbsorR4/MmuQCWKD2b
        ovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTublNSczLLUIn27BL2MtZcvsxes
        1Kg48/AXcwPjZ8UuRk4OCQETienzF7J1MXJxCAksZZSYPecEK0RCRuLktAYoW1jiz7UuqKJP
        jBIf30xnBEmwCRhKdL0FSXByiAi4SHzp3MMMUsQscIFRYumV3ewgCWEBN4lbk8+xgNgsAqoS
        q84eAovzCthKnD/xmwlig7zE6g0HmCcw8ixgZFjFKJJaWpybnltsqFecmFtcmpeul5yfu4kR
        GHzbjv3cvIPx0sbgQ4wCHIxKPLwLdoTHCbEmlhVX5h5ilOBgVhLh3fg1NE6INyWxsiq1KD++
        qDQntfgQoynQ8onMUqLJ+cDIyCuJNzQ1NLewNDQ3Njc2s1AS5+0QOBgjJJCeWJKanZpakFoE
        08fEwSnVwBiSkmceGqp4QeP8jz/JgbnS+UcfT2XbfGLBmiWqApuUvZoWcz+1OfD9cU/y2smF
        f3PuXMpeFdGZfPzaiW13ncVutR5gqcyVCvZUklnapX+sLaP4cBH7nrkJWuWpSZyRVRr7fqne
        SI2b9KBa7ezTwrMhL33ffl4gfP/xg3CXowbPIr+Llt1lv6bEUpyRaKjFXFScCAA7l7r6VAIA
        AA==
X-CMS-MailID: 20200228095049eucas1p291d54f69ee1586060c3594c017616265
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200228095049eucas1p291d54f69ee1586060c3594c017616265
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200228095049eucas1p291d54f69ee1586060c3594c017616265
References: <CGME20200228095049eucas1p291d54f69ee1586060c3594c017616265@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Don't confuse user with meaningless warning about the failure in getting
resources and registering card in case of deferred probe.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 sound/soc/samsung/arndale.c        | 4 +++-
 sound/soc/samsung/littlemill.c     | 2 +-
 sound/soc/samsung/lowland.c        | 2 +-
 sound/soc/samsung/odroid.c         | 4 +++-
 sound/soc/samsung/smdk_wm8994.c    | 2 +-
 sound/soc/samsung/smdk_wm8994pcm.c | 2 +-
 sound/soc/samsung/snow.c           | 4 +++-
 sound/soc/samsung/speyside.c       | 2 +-
 sound/soc/samsung/tobermory.c      | 2 +-
 9 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/sound/soc/samsung/arndale.c b/sound/soc/samsung/arndale.c
index d64602950cbd..6e6d67d6e0ab 100644
--- a/sound/soc/samsung/arndale.c
+++ b/sound/soc/samsung/arndale.c
@@ -174,7 +174,9 @@ static int arndale_audio_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_card(card->dev, card);
 	if (ret) {
-		dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n", ret);
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev,
+				"snd_soc_register_card() failed: %d\n", ret);
 		goto err_put_of_nodes;
 	}
 	return 0;
diff --git a/sound/soc/samsung/littlemill.c b/sound/soc/samsung/littlemill.c
index 59904f44118b..2f2f83a8c23a 100644
--- a/sound/soc/samsung/littlemill.c
+++ b/sound/soc/samsung/littlemill.c
@@ -325,7 +325,7 @@ static int littlemill_probe(struct platform_device *pdev)
 	card->dev = &pdev->dev;
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret)
+	if (ret && ret != -EPROBE_DEFER)
 		dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n",
 			ret);
 
diff --git a/sound/soc/samsung/lowland.c b/sound/soc/samsung/lowland.c
index 098eefc764db..fcc7897ee7d0 100644
--- a/sound/soc/samsung/lowland.c
+++ b/sound/soc/samsung/lowland.c
@@ -183,7 +183,7 @@ static int lowland_probe(struct platform_device *pdev)
 	card->dev = &pdev->dev;
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret)
+	if (ret && ret != -EPROBE_DEFER)
 		dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n",
 			ret);
 
diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index f0f5fa9c27d3..30c7e1bc2a30 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -311,7 +311,9 @@ static int odroid_audio_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_card(dev, card);
 	if (ret < 0) {
-		dev_err(dev, "snd_soc_register_card() failed: %d\n", ret);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "snd_soc_register_card() failed: %d\n",
+				ret);
 		goto err_put_clk_i2s;
 	}
 
diff --git a/sound/soc/samsung/smdk_wm8994.c b/sound/soc/samsung/smdk_wm8994.c
index 28f8be000aa1..8fa5f6b387ad 100644
--- a/sound/soc/samsung/smdk_wm8994.c
+++ b/sound/soc/samsung/smdk_wm8994.c
@@ -178,7 +178,7 @@ static int smdk_audio_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 
-	if (ret)
+	if (ret && ret != -EPROBE_DEFER)
 		dev_err(&pdev->dev, "snd_soc_register_card() failed:%d\n", ret);
 
 	return ret;
diff --git a/sound/soc/samsung/smdk_wm8994pcm.c b/sound/soc/samsung/smdk_wm8994pcm.c
index 2e3dc7320c62..6e44f7927852 100644
--- a/sound/soc/samsung/smdk_wm8994pcm.c
+++ b/sound/soc/samsung/smdk_wm8994pcm.c
@@ -118,7 +118,7 @@ static int snd_smdk_probe(struct platform_device *pdev)
 
 	smdk_pcm.dev = &pdev->dev;
 	ret = devm_snd_soc_register_card(&pdev->dev, &smdk_pcm);
-	if (ret)
+	if (ret && ret != -EPROBE_DEFER)
 		dev_err(&pdev->dev, "snd_soc_register_card failed %d\n", ret);
 
 	return ret;
diff --git a/sound/soc/samsung/snow.c b/sound/soc/samsung/snow.c
index f075aae9561a..bebcf0a4d608 100644
--- a/sound/soc/samsung/snow.c
+++ b/sound/soc/samsung/snow.c
@@ -216,7 +216,9 @@ static int snow_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_card(dev, card);
 	if (ret) {
-		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", ret);
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev,
+				"snd_soc_register_card failed (%d)\n", ret);
 		return ret;
 	}
 
diff --git a/sound/soc/samsung/speyside.c b/sound/soc/samsung/speyside.c
index ea0d1ec67f01..8f175f204eb7 100644
--- a/sound/soc/samsung/speyside.c
+++ b/sound/soc/samsung/speyside.c
@@ -330,7 +330,7 @@ static int speyside_probe(struct platform_device *pdev)
 	card->dev = &pdev->dev;
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret)
+	if (ret && ret != -EPROBE_DEFER)
 		dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n",
 			ret);
 
diff --git a/sound/soc/samsung/tobermory.c b/sound/soc/samsung/tobermory.c
index fdce28cc26c4..1aa3fdb4b152 100644
--- a/sound/soc/samsung/tobermory.c
+++ b/sound/soc/samsung/tobermory.c
@@ -229,7 +229,7 @@ static int tobermory_probe(struct platform_device *pdev)
 	card->dev = &pdev->dev;
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret)
+	if (ret && ret != -EPROBE_DEFER)
 		dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n",
 			ret);
 
-- 
2.17.1

