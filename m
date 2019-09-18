Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 644F3B61A8
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 18 Sep 2019 12:46:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727026AbfIRKqy (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 18 Sep 2019 06:46:54 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:36670 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726916AbfIRKqy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 18 Sep 2019 06:46:54 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190918104652euoutp028f1c8fb36496487f51d884b723d51dc4~FgpLqDjBf2984129841euoutp02g
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Sep 2019 10:46:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190918104652euoutp028f1c8fb36496487f51d884b723d51dc4~FgpLqDjBf2984129841euoutp02g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1568803612;
        bh=ggJz+4OHEUqpSZrdoYYcYTj+Ba5FvZUZV0pOCGMmb8k=;
        h=From:To:Cc:Subject:Date:References:From;
        b=c8rcNFBmJY/mDx16xNixV62Snrx4Jw4CtpMWh6d8iQ24GmnFfd34cSfpEgNceMtMI
         ejK+qbVaROwHcATQ4inNn0MuJRHtiic9kUTRBd3pwpfS6Bvuu2bAi9v4bYJFP3XA/D
         ZV4ECaIc0LF5RgJzvBkZktmxVSx3SzS5c2+CNut4=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190918104651eucas1p15b28111f23924f96ccf4792636cee51d~FgpKsh7Rn2838228382eucas1p1v;
        Wed, 18 Sep 2019 10:46:51 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 10.B4.04309.B1B028D5; Wed, 18
        Sep 2019 11:46:51 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190918104650eucas1p2288b0b7e8081e872c4f181cb5ca8ba0d~FgpJy2Sw32181121811eucas1p2Q;
        Wed, 18 Sep 2019 10:46:50 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190918104650eusmtrp19ceb2288f128253001e6dbaaee5e1800~FgpJiquYc2822328223eusmtrp19;
        Wed, 18 Sep 2019 10:46:50 +0000 (GMT)
X-AuditID: cbfec7f4-afbff700000010d5-f6-5d820b1bdca6
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id EC.1C.04117.A1B028D5; Wed, 18
        Sep 2019 11:46:50 +0100 (BST)
Received: from AMDC3061.DIGITAL.local (unknown [106.120.51.75]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190918104649eusmtip142f4b56d9d48d65ef5cdaa9c2a5c8877~FgpI5PALX0585305853eusmtip1C;
        Wed, 18 Sep 2019 10:46:49 +0000 (GMT)
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
Subject: [PATCH v1 0/9] Basic sound support for Arndale board / wm8994
 updates
Date:   Wed, 18 Sep 2019 12:46:25 +0200
Message-Id: <20190918104634.15216-1-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSe0hTYRjG+85l5zjdOE7JLw2FUX8UeZkEO2CEZcT+KRQLShs186DmNm3H
        eYtymCs1NfGOLDRJ0jlvy8uy8roaJKTWCkHUvESkSeYkCDXzdJT++33P+zy8Dy8fiUpqcV8y
        SZvG6LQqtVQgxHre/B4L9HPPVYasvPSinRPDCN1Z047TlXOLAtpptAK6zv4Op8fGOgj6lzMf
        oa0Ln3C6ZqwfoVvt0wTt+jGA08ZXdoIe+X4fpyea1pFwsaLDlStQPK+dJhRWc4FA8exJjqLa
        tA0UJV1moHBZ/SOJGOGJeEadlM7ogk9eEyZ2bvUKUhvdM+sa6nEDWCQLgRsJqePQONQPCoGQ
        lFBNAA58tSDcQEKtA1iRf4xnF4DjqzF7gfnuZoQPPAWwrLVgN70TGMotQDmXgJLB4tclgGNv
        aj+cMnG6kESpTQSubNVihYAkvahIaOk+wHkw6jAcHyzHOBZRYdA09UjAbwuALR2D/7KQaiDg
        /EwPxg/OwLKWEYRnL7jk6CJ4PghHy4swPnAXwKIXUwT/KAVw1lEPeFcYHHFM4FwLlDoC2/uC
        efkU7DEbEE6GlBhOrnhyMrqDZT3VKC+LYP49Ce8+BDfM1bsVfOGDxe3dago47aoi+Msp4ftZ
        F1IK/Gv/76oHwAx8GD2rSWDYUC2TEcSqNKxemxB0PUVjBTs/ZvSPY90G+jbjhgFFAqmHaPCt
        QSnBVelslmYYQBKVeosib+coJaJ4VVY2o0u5qtOrGXYY+JGY1Ed0a9/nWAmVoEpjkhkmldHt
        TRHSzdcA2mSmK8kRBmdU8UMdMPTGZfRnWhZ+bkba0DtRJZfbvkSvXrpw1ujf0JbuYauSm9NY
        2XK2U/7B4t09zTx63OyIPbc0Z5R3bulPB1KTFQFCfE1uu1GZczMkXEYJzs9c3HYVqPOiI5a/
        FX7czvPEGje6VGSSvHtNbBfX4aE2vRRjE1Wyo6iOVf0FuGyyMi0DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrALMWRmVeSWpSXmKPExsVy+t/xu7pS3E2xBnffiVpcuXiIyWLjjPWs
        FlMfPmGzuNK6idFi/pFzrBbnz29gt/h2pYPJYtPja6wWM87vY7JYe+Quu8Xn9/tZLVr3HmG3
        OPymndXi4oovTA58Hhs+N7F57Jx1l91j06pONo/NS+o9ps/5z+jRt2UVo8fnTXIB7FF6NkX5
        pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GRv/bmcrWMpd
        MX/RAtYGxiccXYycHBICJhKPtq5k6mLk4hASWMoo0fpmLWMXIwdQQkpifosSRI2wxJ9rXWwg
        tpDAJ0aJH+1mIDabgKFE79E+RhBbREBM4vacTmaQOcwCXcwS73f8YgVJCAv4STzZ9YIdxGYR
        UJW4cGAyC4jNK2AtMef2XDaIBfISqzccYJ7AyLOAkWEVo0hqaXFuem6xkV5xYm5xaV66XnJ+
        7iZGYGhvO/Zzyw7GrnfBhxgFOBiVeHglzjbECrEmlhVX5h5ilOBgVhLhDaitjxXiTUmsrEot
        yo8vKs1JLT7EaAq0fCKzlGhyPjDu8kriDU0NzS0sDc2NzY3NLJTEeTsEDsYICaQnlqRmp6YW
        pBbB9DFxcEo1MApOs3VRmDVZYZroC9Hm721pBqKHcrj1X6wxNuvc4Da5xVr//Qn103ftlzPe
        78mMvsVj1DhD8fivmE8MdRcXzZ13c+69d/812uez7FX9Edvs8JDfr8742o13ATNTrQ/p8lzT
        WvGl1vBC+aMpBf/ZNyX917iZrHvQS6JxpsK0UNeTH85b37wjulKJpTgj0VCLuag4EQBJQJG8
        gwIAAA==
X-CMS-MailID: 20190918104650eucas1p2288b0b7e8081e872c4f181cb5ca8ba0d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190918104650eucas1p2288b0b7e8081e872c4f181cb5ca8ba0d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190918104650eucas1p2288b0b7e8081e872c4f181cb5ca8ba0d
References: <CGME20190918104650eucas1p2288b0b7e8081e872c4f181cb5ca8ba0d@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This patch series adds basic audio support for Exynos5250 SoC based Arndale 
board, the Bluetooth receiver source and HDMI output are not covered yet.

There is also one fix for wm8994 driver related to WM1811 CODEC and wm8994
updates to handle MCLK clocks, similar to patches:
 ae1ea48c5c59 ("ASoC: arizona: Add gating for source clocks of the FLLs")
 7a4413d0dc96 ("ASoC: arizona: Add gating for clock when used for direct MCLK")

Sylwester Nawrocki (9):
  ASoC: wm8994: Do not register inapplicable controls for WM1811
  mfd: wm8994: Add support for MCLKn clock control
  ASoC: wm8994: Add support for setting MCLKn clock rate
  ASoC: wm8994: Add support for MCLKn clock gating
  ASoC: samsung: arndale: Simplify DAI link initialization
  ASoC: dt-bindings: Document "samsung,arndale-wm1811" compatible
  ASoC: samsung: arndale: Add support for WM1811 CODEC
  ASoC: samsung: arndale: Add missing OF node dereferencing
  ARM: dts: arndale: Add audio support (WM1811 CODEC boards)

 .../devicetree/bindings/sound/arndale.txt     |   5 +-
 arch/arm/boot/dts/exynos5250-arndale.dts      |  27 ++-
 drivers/mfd/wm8994-core.c                     |   9 +
 include/linux/mfd/wm8994/core.h               |   9 +
 sound/soc/codecs/wm8994.c                     | 164 +++++++++++++++---
 sound/soc/samsung/arndale_rt5631.c            | 155 +++++++++++++----
 6 files changed, 306 insertions(+), 63 deletions(-)

-- 
2.17.1

