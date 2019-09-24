Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B8ABBC73C
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 24 Sep 2019 13:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440870AbfIXLxA (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 24 Sep 2019 07:53:00 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:42996 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394463AbfIXLxA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 24 Sep 2019 07:53:00 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190924115258euoutp017bf3bfa9be898ed9c3d2a6a7b37d532c~HXanIoKIV1056110561euoutp01k
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Sep 2019 11:52:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190924115258euoutp017bf3bfa9be898ed9c3d2a6a7b37d532c~HXanIoKIV1056110561euoutp01k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1569325978;
        bh=CWvuY3k301nl3Yj6hWj5zjiuGiasro9eBzzNA0vutdA=;
        h=From:To:Cc:Subject:Date:References:From;
        b=cYylepdcPa9MLmfZnnSNJyeDBMQri72MWCWW4flRYrIcnI+mykRVZDzrUYDHDG0Uy
         Bir/4dRNWqhBJoj1PXo4Zn74E8C0AE0JOR7WULHRO6wGMFbgz6wG7ZXzARl7pliSvx
         +akOx9Em8/yVIUs+OG/Izihw2cGb7/R3I6MF6Iag=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190924115258eucas1p219c4a7ac93df1b26a08e835a2a930d52~HXamxMZp82125821258eucas1p2v;
        Tue, 24 Sep 2019 11:52:58 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 11.4D.04374.A930A8D5; Tue, 24
        Sep 2019 12:52:58 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190924115258eucas1p2d7dbc9fbfbcd5809a74ffeb71a703a8f~HXamc33152125821258eucas1p2u;
        Tue, 24 Sep 2019 11:52:58 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190924115258eusmtrp2766f58de47462ef90faf85959d95c82f~HXamcTfst0158201582eusmtrp23;
        Tue, 24 Sep 2019 11:52:58 +0000 (GMT)
X-AuditID: cbfec7f5-4ddff70000001116-9a-5d8a039a2e20
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id B9.22.04166.A930A8D5; Tue, 24
        Sep 2019 12:52:58 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190924115257eusmtip1b7c7a158e8e1e83723c99941bb1a0dd1~HXamHsTKG2088720887eusmtip12;
        Tue, 24 Sep 2019 11:52:57 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maciej Falkowski <m.falkowski@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ARM: dts: exynos: Add missing clock-cells property to
 Exynos3250 i2s node
Date:   Tue, 24 Sep 2019 13:52:43 +0200
Message-Id: <20190924115243.25702-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFIsWRmVeSWpSXmKPExsWy7djP87qzmLtiDZq+yFicP7+B3WLG+X1M
        Fg+a17FZrD1yl93i8Jt2VgdWj02rOtk8+rasYvT4vEkugDmKyyYlNSezLLVI3y6BK2Py1Ufs
        BY/ZKrbsncvWwHiBtYuRg0NCwETi7Mb6LkYuDiGBFYwShz6dYYJwvjBKbL50ghXC+cwoceHf
        PyCHE6xj2/9rbBCJ5YwSO6acYQFJgLXsOWQAYrMJGEp0ve1iA7FFBFQlPrctYAdpYBbYzChx
        +9cssAZhgRiJY0vmgBWxABUdOH+MEeQmXgFbiWP3cyGWyUus3nCAGaRXQmAHm8T2N1PYIRIu
        EjsONrBB2MISr45vgYrLSPzfOZ8JoqGZUeLhubXsEE4Po8TlphmMEFXWEoePXwSHALOApsT6
        XfoQYUeJC2cuMUEChk/ixltBkDAzkDlp23RmiDCvREebEES1msSs4+vg1h68cIkZwvaQ2Nx0
        jw0SJrES7Yc+M01glJuFsGsBI+MqRvHU0uLc9NRi47zUcr3ixNzi0rx0veT83E2MwBg//e/4
        1x2M+/4kHWIU4GBU4uGV2NYRK8SaWFZcmXuIUYKDWUmEd5NWW6wQb0piZVVqUX58UWlOavEh
        RmkOFiVx3mqGB9FCAumJJanZqakFqUUwWSYOTqkGRrFlYR/mll5+cdCMcdFZVadg5qtxOUFJ
        r1JvTMl2d3t0bUutsLDmjZNpHvnnVrWmzq9e+LXuzq9ss4vrNKeIFRZYRszYlLy6/MKLy/Eu
        R0Tu/nftjVr3/pvKbId180Uu8c/trDA76Omwof2A9HfbC6fVLY5MT7wskFWiJnrftOD2yyMf
        Xro4CCuxFGckGmoxFxUnAgDppV7m7QIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrALMWRmVeSWpSXmKPExsVy+t/xu7qzmLtiDToX8VicP7+B3WLG+X1M
        Fg+a17FZrD1yl93i8Jt2VgdWj02rOtk8+rasYvT4vEkugDlKz6Yov7QkVSEjv7jEVina0MJI
        z9DSQs/IxFLP0Ng81srIVEnfziYlNSezLLVI3y5BL2Py1UfsBY/ZKrbsncvWwHiBtYuRk0NC
        wERi2/9rbF2MXBxCAksZJeb3drBAJGQkTk5rgCoSlvhzrYsNxBYS+MQocfk4E4jNJmAo0fUW
        Ii4ioCrxuW0BO8ggZoGtjBL7fr8EaxYWiJJYt+IK2FAWoKID548xdjFycPAK2Eocu58LMV9e
        YvWGA8wTGHkWMDKsYhRJLS3OTc8tNtQrTswtLs1L10vOz93ECAytbcd+bt7BeGlj8CFGAQ5G
        JR5eiW0dsUKsiWXFlbmHGCU4mJVEeDdptcUK8aYkVlalFuXHF5XmpBYfYjQF2j2RWUo0OR8Y
        9nkl8YamhuYWlobmxubGZhZK4rwdAgdjhATSE0tSs1NTC1KLYPqYODilGhilzI+mfVjnWVup
        +fLI+w0L1ST3a3gKcKV+CjaY7vmkkm3lq+B9TyX/Tn1iED6NecaVtceCjz2/LP/5sab6qVxx
        sWtntJsdJUINMpasElOenJa3dvMMY5mrrPWMM3aH1GscZG7bue9R0mqNQgk++f8am5hLQs/P
        vHTPudk4W7b4L3f5vwPXlWqUWIozEg21mIuKEwEXJ+w5QwIAAA==
X-CMS-MailID: 20190924115258eucas1p2d7dbc9fbfbcd5809a74ffeb71a703a8f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190924115258eucas1p2d7dbc9fbfbcd5809a74ffeb71a703a8f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190924115258eucas1p2d7dbc9fbfbcd5809a74ffeb71a703a8f
References: <CGME20190924115258eucas1p2d7dbc9fbfbcd5809a74ffeb71a703a8f@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Maciej Falkowski <m.falkowski@samsung.com>

'#clock-cells' is a required property for clocks provider, missing
may cause compilation errors.

Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos3250.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 190d9160a5d1..bf32e00334ce 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -687,6 +687,7 @@
 			interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cmu CLK_I2S>, <&cmu CLK_SCLK_I2S>;
 			clock-names = "iis", "i2s_opclk0";
+			#clock-cells = <1>;
 			dmas = <&pdma0 14>, <&pdma0 13>;
 			dma-names = "tx", "rx";
 			pinctrl-0 = <&i2s2_bus>;
-- 
2.17.1



