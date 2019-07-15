Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CAC16894D
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 15 Jul 2019 14:47:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730445AbfGOMpP (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 15 Jul 2019 08:45:15 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:50030 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730409AbfGOMpP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 15 Jul 2019 08:45:15 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190715124514euoutp02a19d89be7822a636b8872a999edf4374~xlU92Zpw70730707307euoutp02Z
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Jul 2019 12:45:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190715124514euoutp02a19d89be7822a636b8872a999edf4374~xlU92Zpw70730707307euoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1563194714;
        bh=SAzXsKHOymM7Nf0c7urmnuAYn2JuU3b4W7hMQuBtNSk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Hbc1JXcYhmIsgdQZj2aCxkN9ZVpYeWw1Xer3j94RMRfGNcsKgRn+3BMD1qdUqsxF0
         mq62EGHUhPyR1zf70WcgqLt27P/D5aA01MqwVmOI62TEt191H1gH0tGCvYYdSebv+o
         E1TP4EOeCQxiFcNb+YIHihPAPm7xN1YnLUtSqikc=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190715124513eucas1p279ca6f45a7660c16bb8a8999ce8a8b7c~xlU82OqX52439624396eucas1p2v;
        Mon, 15 Jul 2019 12:45:13 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 0F.35.04298.8557C2D5; Mon, 15
        Jul 2019 13:45:12 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190715124512eucas1p1bd847805f945ada00f2b7952592cc104~xlU8GE5aJ0572305723eucas1p1f;
        Mon, 15 Jul 2019 12:45:12 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190715124512eusmtrp1a046ecf1e93c0bceb3d7b9d366f470ab~xlU734WUQ0524305243eusmtrp1X;
        Mon, 15 Jul 2019 12:45:12 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-08-5d2c75589bb0
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 17.27.04140.7557C2D5; Mon, 15
        Jul 2019 13:45:12 +0100 (BST)
Received: from AMDC3778.DIGITAL.local (unknown [106.120.51.20]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190715124511eusmtip2ca884ce70884c076ff777cc9e27659fe~xlU7B8ra81184611846eusmtip2b;
        Mon, 15 Jul 2019 12:45:11 +0000 (GMT)
From:   Lukasz Luba <l.luba@partner.samsung.com>
To:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com,
        kyungmin.park@samsung.com, a.hajda@samsung.com,
        m.szyprowski@samsung.com, s.nawrocki@samsung.com,
        myungjoo.ham@samsung.com, Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v1 46/50] ARM: dts: exynos: change rates of bus_disp1 in
 Exynos5422
Date:   Mon, 15 Jul 2019 14:44:13 +0200
Message-Id: <20190715124417.4787-47-l.luba@partner.samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190715124417.4787-1-l.luba@partner.samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSaUhUURzFu/PmLU69eo2WN7WkCSFzayDhgmYGBQN9qC9FWJZjPlTU0eY5
        lgs4FZMLLrmgppUGbrjkmpm5lI4Ko6ljoOZQitNqWuYCWTE14xvr2+9//ufcw71cChN34Q5U
        uCKWVSrkkRJCJGwbWB/1OK9yDzycleONph+N4KipqAFHk6sfcVSqNY/Zxi8YGh1tJNHLmwsk
        mlY7oWbjBI6+Z7zF0auOewQqGu0WoHrtGxJVTOoFSK87iQw3qgmk6dKSqG8hBUemiSahv62s
        7kEdkH2b0pCy5po0QtZSnix78bVTIMtqrQGyleZ9Z8gAkW8IGxkexyq9/IJEYRX9S2TMAHk9
        Py0PV4M2Ih3YUJA5AvX6RmE6EFFiphpATaPROqwCmDavsQ4rAC7mF+ObkZz6QoJfVAGYUmnC
        /kVGRtSCdEBRBOMJ22uuWgJ2TDmA2vVgiwdjXgtg57unGyfZMmdhZ3cpsLCQcYEltakbWZo5
        Bud0gXyZM6xtfI5Z2MYsrxeMbRRDZoSEcz9mSN50Aqbl3rKyLZwfbLWyExzKyxDyzEF15kPA
        cxI0Zt+3enxg36Aet/RijCts6PDi5eNQo7NckjLzdji1uNMiY2bMbSvEeJmGqbfFvPsgbM0Y
        E/C8G1bVFVgPl8HWqQKcf51cAD8PG/A7wLn4f1kZADXAnlVxUaEsJ1Ww1zw5eRSnUoR6XomO
        agbmTzVkGlxuB2vjwb2AoYBkG+0f4hYoxuVxXHxUL4AUJrGjj66ZJTpEHp/AKqMvK1WRLNcL
        HCmhxJ5O3DJ7QcyEymPZCJaNYZWbWwFl46AGtcYxrTT/t9/CtIlypnvcPhjq/8TrQpOS54mE
        u+8zt4/TMYoml8JglV9nJRbjuGNiVrq17HHPgcSLhS6f4B6v5b0VOac9nlHy1f58H3opINA9
        M8ikk/oA9ycG112XlHne54jhbpHv/pZfVdUOedDV9lTxzxk2w5BSQgU49URIhFyYXHoIU3Ly
        v962fj9QAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHIsWRmVeSWpSXmKPExsVy+t/xe7oRpTqxBl88LW6tO8dqsXHGelaL
        61+es1rMPwLk9j9+zWxx/vwGdouzTW/YLW41yFhsenyN1eJjzz1Wi8u75rBZzDi/j8li7ZG7
        7BZLr19ksrh4ytXiduMKNovWvUfYLQ6/aWe1+HdtI4uDsMeaeWsYPd7faGX32LSqk81j85J6
        j4Pv9jB59G1ZxejxeZNcAHuUnk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWRqZK+
        nU1Kak5mWWqRvl2CXsbSox/YC46xV0zpnMzawLiNrYuRk0NCwERi4trpQDYXh5DAUkaJ7VfP
        MEEkxCQm7dvODmELS/y51gVV9IlR4u6uW0AJDg42AT2JHasKQWpEBFYwSkw+4Q1Swyzwmkni
        yNF3rCAJYYFgiY9LVrOA2CwCqhKzV3cwgfTyCthLPDoVCzFfXmL1hgPMIDYnUPjntAtgxwkJ
        2EksPvqTaQIj3wJGhlWMIqmlxbnpucVGesWJucWleel6yfm5mxiBcbPt2M8tOxi73gUfYhTg
        YFTi4XVI0Y4VYk0sK67MPcQowcGsJMJr+xUoxJuSWFmVWpQfX1Sak1p8iNEU6KaJzFKiyfnA
        mM4riTc0NTS3sDQ0NzY3NrNQEuftEDgYIySQnliSmp2aWpBaBNPHxMEp1cBYdazgaZbaLuVn
        r84EV3zrVbbWYuqs/JkXqzFr+YpzrqURfz4xzQqtWvDFkXfK489vg2LP3V1RFRXx76tSYOZJ
        7muXpq1X1vvlL2gW+ev4ZMXzh59X/Xe8lXxD69yM2ULxmge6bdkbFuhOXfut7/n7dv3716Ua
        VCdu4DZ0PrCNk2dH3/w17OellFiKMxINtZiLihMBzjyds7ECAAA=
X-CMS-MailID: 20190715124512eucas1p1bd847805f945ada00f2b7952592cc104
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190715124512eucas1p1bd847805f945ada00f2b7952592cc104
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190715124512eucas1p1bd847805f945ada00f2b7952592cc104
References: <20190715124417.4787-1-l.luba@partner.samsung.com>
        <CGME20190715124512eucas1p1bd847805f945ada00f2b7952592cc104@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The bus_disp1 OPP table has been aligned to the new parent rate. This patch
sets the proper frequencies before the devfreq governor starts working. It
sets 200MHz to bus ACLK_200_DISP1 which is controlled via CLK_DOUT_ACLK200
and 400MHz to ACLK400_DISP1 which is controlled via CLK_DOUT_ACLK400_DISP1.

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
index 2cfe1effe290..fac5659516ad 100644
--- a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
@@ -150,6 +150,9 @@
 
 &bus_disp1 {
 	devfreq = <&bus_wcore>;
+	assigned-clocks = <&clock CLK_DOUT_ACLK200>,
+			  <&clock CLK_DOUT_ACLK400_DISP1>;
+	assigned-clock-rates = <200000000>, <400000000>;
 	status = "okay";
 };
 
-- 
2.17.1

