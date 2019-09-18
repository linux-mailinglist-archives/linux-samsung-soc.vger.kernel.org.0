Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E448EB61B4
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 18 Sep 2019 12:47:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727658AbfIRKrG (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 18 Sep 2019 06:47:06 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:36794 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727030AbfIRKrG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 18 Sep 2019 06:47:06 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190918104705euoutp027d14673bc46112b9746dfd8b949d9ed3~FgpXYuXwE3146531465euoutp02G
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Sep 2019 10:47:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190918104705euoutp027d14673bc46112b9746dfd8b949d9ed3~FgpXYuXwE3146531465euoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1568803625;
        bh=I7U/aKHNrCY1D+09WXBMjW4deg9Mt3W9OYXWUaaxfto=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kSmfmWVaZvAfw9toDeYq24CqZE+1x7MEWIg/zx/CSAG6CSGS70o6MsS89KAdeLN3T
         hQgLeLdL0xrrazOQXwsvIMLKnkOeb1E0FQ7LWLnFEi4F8gIvEw46qeM/LT9ciQpifr
         EefCR6UU7WtETs9y0EYwkse4p3rLOIrcBDIaIjnY=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190918104704eucas1p1423adf7331dc8711d0739adfe4519ecd~FgpWh648W2008520085eucas1p1m;
        Wed, 18 Sep 2019 10:47:04 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 86.B4.04309.82B028D5; Wed, 18
        Sep 2019 11:47:04 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190918104703eucas1p1a06ecce433753ba42b422317ec7db48c~FgpVznU012985529855eucas1p1P;
        Wed, 18 Sep 2019 10:47:03 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190918104703eusmtrp2a908048a1a8b4996403345653f978e8a~FgpVkEUs_1555615556eusmtrp2m;
        Wed, 18 Sep 2019 10:47:03 +0000 (GMT)
X-AuditID: cbfec7f4-afbff700000010d5-16-5d820b282f21
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 26.2C.04117.72B028D5; Wed, 18
        Sep 2019 11:47:03 +0100 (BST)
Received: from AMDC3061.DIGITAL.local (unknown [106.120.51.75]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190918104702eusmtip17fabbbca8d2668ec5a92c504d233cd8d~FgpU6jEB50585005850eusmtip1L;
        Wed, 18 Sep 2019 10:47:02 +0000 (GMT)
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
Subject: [PATCH v1 6/9] ASoC: dt-bindings: Document "samsung,arndale-wm1811"
 compatible
Date:   Wed, 18 Sep 2019 12:46:31 +0200
Message-Id: <20190918104634.15216-7-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190918104634.15216-1-s.nawrocki@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSe0hTYRjG+87Z2TmuVsdp+jFFYRhdIG8YHJhIgcQIAv+JbojNPKjkVDYv
        aYmmaF5qmZiazRyycFqiTRlppPNSK4XNmcwbosNLplngluFcrW1H67/3fd7f873P9/ERKK8N
        4xOp6Vm0NF2cJmBzWNoPO8bTJw4Wx4fXWTBq0jSEUK8bOjHqiWWZTU2WagDVPGLAKKOxC6e2
        J8sRSrNkxqgGYz9CdYzM45T1xwBGlb4bwanhb/cxyqS2IWcPi7qsxWxRb+M8LtK0V7BF3apC
        Ub3CCUTynnYgsmqC4vBrnOgkOi01h5aGxdzgpHR+d7Ay6/Db3atbWBGoZlcCLwKSUXClaZxV
        CTgEj1QDuGZ3okxjA3BhtdND8UgrgP1fIvYdyzo5YKBWAO2LG8g/h+VXK+am2GQEfPjeTXkR
        vqQfnFNUeI5FSQcCN383stwDH/Iq3Py84DGwyGOwo8SMumsuKYRTcjnOrAuGL7t0Ht2LjIZb
        44uesJDU4lCnViIMFAsHDVMoU/vAdX3PnjkQOnubEcZQAuCDt3M401S7bqdXAoYSwmG9yRWD
        cOU7CTv7whj5HBxcLcHdMiQPw+lNb7eMusoabT3KyFxYXsZj6BC4216/F4cPq5adLKYWwReq
        Gpx5oUcAmqpW0GoQ3Ph/mRKAduBPZ8skybQsMp3ODZWJJbLs9OTQmxkSDXB9oLE/etsb0OdI
        HAIkAQSHuLrRongeJs6R5UmGACRQgS83rqAwnsdNEufl09KMBGl2Gi0bAgEES+DPvXNg8TqP
        TBZn0bdoOpOW7k8RwotfBGrP5z1PNEQNCDMiJbnQVmCY9Z6WaO2f1BOVS+wFX8rYL/948Yhw
        beNCAmjxu9yT3/I0SD5mOe674zi6rVLMXpox7AaEK5Zq1+8af5aNPeOHZLbZctqCGpScho3d
        M49nWiYS7Lv2r6Z7qlfBYeOS0ZjAKvMVurgj1twk51r8BSxZijjiFCqVif8CX0K+tjwDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgkeLIzCtJLcpLzFFi42I5/e/4XV117qZYg+ntQhZXLh5istg4Yz2r
        xdSHT9gsrrRuYrSYf+Qcq8X58xvYLb5d6WCy2PT4GqvFjPP7mCzWHrnLbvH5/X5Wi9a9R9gt
        Dr9pZ7W4uOILkwOfx4bPTWweO2fdZffYtKqTzWPzknqP6XP+M3r0bVnF6PF5k1wAe5SeTVF+
        aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexvp3f1gKprFX
        bH72ibWBcQJbFyMnh4SAicSTA32MXYxcHEICSxkllq6cxdTFyAGUkJKY36IEUSMs8edaF1i9
        kMAnRonnx1RBbDYBQ4neoyC9nBwiAmISt+d0MoPMYRboYpZ4v+MXK0hCWCBcYt3aLewgNouA
        qsTa5mvMIDavgLXE9b4+dogF8hKrNxwAi3MK2Eh8uvCABWKZtcSCY9MYJzDyLWBkWMUoklpa
        nJueW2ykV5yYW1yal66XnJ+7iREYC9uO/dyyg7HrXfAhRgEORiUeXomzDbFCrIllxZW5hxgl
        OJiVRHgDautjhXhTEiurUovy44tKc1KLDzGaAh01kVlKNDkfGKd5JfGGpobmFpaG5sbmxmYW
        SuK8HQIHY4QE0hNLUrNTUwtSi2D6mDg4pRoYN2y84KCjaBd7g+NemcUya7+LU/M9rkpJ79wb
        1Pje4URoWdL+GbOX3k0pDizpyX/612FZY8M/JZHc76LMbLWxIdyH2Nhn5ky/zOTvZu3tY9W1
        Mr2R41Fq4o6EVw0G0YLSk6qD596Pca8z1uTiWujy+6ppanPOtmei9a8vd8edavHuaKhrnqfE
        UpyRaKjFXFScCAD8b0pwmwIAAA==
X-CMS-MailID: 20190918104703eucas1p1a06ecce433753ba42b422317ec7db48c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190918104703eucas1p1a06ecce433753ba42b422317ec7db48c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190918104703eucas1p1a06ecce433753ba42b422317ec7db48c
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
        <CGME20190918104703eucas1p1a06ecce433753ba42b422317ec7db48c@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add compatible string for boards with WM1811 CODEC to the list.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
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

