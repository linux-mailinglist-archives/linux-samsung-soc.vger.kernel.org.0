Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75676B9032
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 20 Sep 2019 15:03:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726950AbfITNDX (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 20 Sep 2019 09:03:23 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:46451 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726977AbfITNDX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Sep 2019 09:03:23 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190920130321euoutp011b277ee4ef185813c65b5f48de8fa8e6~GJy7BSrnV2955929559euoutp01V
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Sep 2019 13:03:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190920130321euoutp011b277ee4ef185813c65b5f48de8fa8e6~GJy7BSrnV2955929559euoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1568984601;
        bh=JlOPACoW2mjd+3bF1MoPEIsxNgc0uMnAeyavRXGANVA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KC7PZXRTlxZekOZD2IhRahuKjDCF1vk4zVQNSLR6Zt/cL+zsi2U8u96bWC/SW+5Hm
         INn0j0gNDmx+vySIhQ2mrN6Z1OGj+jgAozrC10uPqR1gGXtJ2DyuDGuYaT26Ypw7UN
         lwR6+x0VFCwtsRc/0mdIbAuYyDDqETPEvSqj2hT0=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190920130321eucas1p14eddd716a9d563b55218a2ec6b8475cb~GJy6M9b8_2917429174eucas1p18;
        Fri, 20 Sep 2019 13:03:21 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id D1.DB.04309.81EC48D5; Fri, 20
        Sep 2019 14:03:20 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190920130320eucas1p1ade2cf71fadfd442bcd79748e8512e09~GJy5cIFoJ2912129121eucas1p1C;
        Fri, 20 Sep 2019 13:03:20 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190920130319eusmtrp1a7f0cc47063296e8af21306821b1553d~GJy5Km6Tx0476604766eusmtrp1f;
        Fri, 20 Sep 2019 13:03:19 +0000 (GMT)
X-AuditID: cbfec7f4-ae1ff700000010d5-ee-5d84ce1895bb
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 40.11.04117.71EC48D5; Fri, 20
        Sep 2019 14:03:19 +0100 (BST)
Received: from AMDC3061.DIGITAL.local (unknown [106.120.51.75]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190920130319eusmtip2c7bdcb035f356389188b0fe5a03b5587~GJy4eTcu_1303613036eusmtip27;
        Fri, 20 Sep 2019 13:03:19 +0000 (GMT)
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
Subject: [PATCH v2 06/10] ASoC: dt-bindings: Document
 "samsung,arndale-wm1811" compatible
Date:   Fri, 20 Sep 2019 15:02:15 +0200
Message-Id: <20190920130218.32690-7-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190920130218.32690-1-s.nawrocki@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSfyyUcRzH+z53zz2Pq7OnIz5h5MaaNiQ1z0LLVtv908paW2VWhyfEHd3j
        R+qPpBPJz1r5keZI0bXCcYpQznHXLJexUs0QtpimcbPJr5yH+u/1fX/e7+/7s+++JE9cgzuR
        sYokRqmQxUsEQn5zz6LZG/pU4fsbZnzowX49RjeU1OH0g7EJAT2YqUV0haEPp83meoJeGMzG
        aO34Z5wuMXdg9EvDMEHPz77D6cx2A0F3zWThdH+tBTtqK62fzxBIW8qGCalWc0cgbay+IS0u
        X0PS/CYNks5rXU8R54VBUUx8bAqj9D1yURhTVDQsSPxJXNWVPcfT0YAgB9mQQB0EVccAZmUx
        VYtA/ycxBwnX2YJgyNSAc4d5BC0T7fhWYuJRFcYNahB8nG7k/4uov2oJq0tA+UFedz6ysj21
        F0ZKMjau4lFTGBR2v9ootKPCQF1iXg+QJJ/yhOKncVZZRAWCrq8C49rc4EX9e56VbaggmBri
        moHSElA6OUpwpmPQttC5yXYwbWzaZBfovZ/L5wK3EOS+/U5wh0IEI0Y14lyB0GXsx61b8Cgv
        qGv15eQQMHY3biwHlC0M/dpplXnreK+5mMfJIsi+LebcHrCkKd7c2QnuTqzxOZbCUFuNgHvf
        AgSVpfJC5Fb2v0uNkAY5MsmsPJphDyiYVB9WJmeTFdE+kQlyLVr/Pr2rRssb1LocoUcUiSQ7
        RGqTKlyMy1LYNLkeAcmT2IvKD2WEi0VRsrRrjDLhgjI5nmH1yJnkSxxF17eNhompaFkSE8cw
        iYxya4qRNk7pSBchDFedCAaPc54FlsiboToHw2ztalZ8gEvI8uloO4/MKndLlLPG4fLJVH+L
        eE/6yq42798/8qpfn61UsSp3NGf0z/Jz8Ao+s5jmatr9CS49kSXlm3r6tn87nLj6uHU57UqA
        cGzluGMnw6bO6L7Qk0HjoYoWUd1S1gebZ3PkQwmfjZH57eMpWdlfF2Ss6zoDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjkeLIzCtJLcpLzFFi42I5/e/4PV3xcy2xBh9PWVhcuXiIyWLjjPWs
        FlMfPmGzuNK6idFi/pFzrBbnz29gt/h2pYPJYtPja6wWM87vY7JYe+Quu8Xn9/tZLVr3HmG3
        OPymndXi4oovTA58Hhs+N7F57Jx1l91j06pONo/NS+o9ps/5z+jRt2UVo8fnTXIB7FF6NkX5
        pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GRMn3mUreMFe
        sXXWStYGxstsXYycHBICJhJPZi9iArGFBJYySizaKdfFyAEUl5KY36IEUSIs8edaF1A5F1DJ
        J0aJnz1P2UESbAKGEr1H+xhBbBEBTYmOebdZQYqYBb4zSRx4fJIZZJCwQKTEwVc2ICaLgKrE
        9KXZIOW8AtYSW8/NZ4KYLy+xesMBZhCbU8BG4uUNmHOsJU7v28s+gZFvASPDKkaR1NLi3PTc
        YiO94sTc4tK8dL3k/NxNjMA42Hbs55YdjF3vgg8xCnAwKvHwehxriRViTSwrrsw9xCjBwawk
        wjvHtClWiDclsbIqtSg/vqg0J7X4EKMp0E0TmaVEk/OBMZpXEm9oamhuYWlobmxubGahJM7b
        IXAwRkggPbEkNTs1tSC1CKaPiYNTqoGxX/FXxbmZi5qOPPmrJr3Adrt/S1GnY+7lkxP+z9hd
        17t7UrTdsf2bdiwxmtZe95mDg+dwwfn7U+d8EePqy6tQrBEw227GbCwk9O7X7Ypm9gQNNsvJ
        zzfVxC6Rv+v45ljeF2enixUX5L1fBa0vC6k4/37/87ayqs1rM267qS50fLH5f4vQlpPSSizF
        GYmGWsxFxYkALdGSTJkCAAA=
X-CMS-MailID: 20190920130320eucas1p1ade2cf71fadfd442bcd79748e8512e09
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190920130320eucas1p1ade2cf71fadfd442bcd79748e8512e09
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190920130320eucas1p1ade2cf71fadfd442bcd79748e8512e09
References: <20190920130218.32690-1-s.nawrocki@samsung.com>
        <CGME20190920130320eucas1p1ade2cf71fadfd442bcd79748e8512e09@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add compatible string for boards with WM1811 CODEC to the list.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes since v1:
 - none
---
 Documentation/devicetree/bindings/sound/arndale.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/arndale.txt b/Documentation/devicetree/bindings/sound/arndale.txt
index 0e76946385ae..17530120ccfc 100644
--- a/Documentation/devicetree/bindings/sound/arndale.txt
+++ b/Documentation/devicetree/bindings/sound/arndale.txt
@@ -1,8 +1,9 @@
 Audio Binding for Arndale boards
 
 Required properties:
-- compatible : Can be the following,
-			"samsung,arndale-rt5631"
+- compatible : Can be one of the following:
+		"samsung,arndale-rt5631",
+		"samsung,arndale-wm1811"
 
 - samsung,audio-cpu: The phandle of the Samsung I2S controller
 - samsung,audio-codec: The phandle of the audio codec
-- 
2.17.1

