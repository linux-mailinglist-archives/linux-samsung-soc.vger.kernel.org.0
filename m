Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E5872A6205
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  4 Nov 2020 11:39:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728508AbgKDKjE (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 4 Nov 2020 05:39:04 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:47750 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729599AbgKDKhr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Nov 2020 05:37:47 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201104103732euoutp02b7c208287dbf5933db3feb42387c9546~ER77NYwva2852028520euoutp02e
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Nov 2020 10:37:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201104103732euoutp02b7c208287dbf5933db3feb42387c9546~ER77NYwva2852028520euoutp02e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1604486252;
        bh=2a12Ishl6dROfsBuQFSa17sVXwF7PkvSSX4ixHc5NZE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Wh7vnpm+0J7hBGsmR6pc3dFgnNE3efa3Uh4Hs+09hqVJKN+H1JO5v1XxokXc+wocE
         qolniknLTEl0c9pAqN/axFISGXlzTK09XWZA+VpZVjSG2/kUYUlm/mRbTxeanneGbu
         BQDX0zKNDwc95RAGlDIpWEJ7u112c/FSnM/7Ln0Q=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201104103726eucas1p2cd33ec5d3a164cc9c09a166fb136006b~ER72MDlCo1144911449eucas1p2q;
        Wed,  4 Nov 2020 10:37:26 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id A7.8F.06456.66482AF5; Wed,  4
        Nov 2020 10:37:26 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201104103726eucas1p2e8f7c32f13b4232d925e901284ada13d~ER71udMfb1145811458eucas1p2n;
        Wed,  4 Nov 2020 10:37:26 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201104103726eusmtrp1e530e1fe73ff14deca6c32d24728480c~ER71tjWgu0613806138eusmtrp1Z;
        Wed,  4 Nov 2020 10:37:26 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-15-5fa28466ef04
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 0F.75.06314.46482AF5; Wed,  4
        Nov 2020 10:37:24 +0000 (GMT)
Received: from AMDC3061.digital.local (unknown [106.120.51.75]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201104103724eusmtip2a27f0801494ca72c6885d4086cb9b9bc~ER7z97sjL1005710057eusmtip28;
        Wed,  4 Nov 2020 10:37:24 +0000 (GMT)
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
To:     georgi.djakov@linaro.org, cw00.choi@samsung.com, krzk@kernel.org
Cc:     devicetree@vger.kernel.org, robh+dt@kernel.org,
        a.swigon@samsung.com, myungjoo.ham@samsung.com,
        inki.dae@samsung.com, sw0312.kim@samsung.com,
        b.zolnierkie@samsung.com, m.szyprowski@samsung.com,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, s.nawrocki@samsung.com
Subject: [PATCH v8 4/7] PM / devfreq: exynos-bus: Add registration of
 interconnect child device
Date:   Wed,  4 Nov 2020 11:36:54 +0100
Message-Id: <20201104103657.18007-5-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201104103657.18007-1-s.nawrocki@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSfSzUcRzH973fw/2Ys59j8x2irtTUkB7mO25NTXV/NLX1RxuiKz8P447d
        D8XaKM+PJ1ouM+dpo7PCxWXEjMu1CUOoKMpzpZpjU1rl56f67/39fF7vz+e9z74UJm4kHKgo
        ZTyjUspjJKQlbuj7PuQenl4denglcz+arsgAqFnTSKCJtUUCaY2DBHq5/pVEpZ16EhVPF+Fo
        aKhJiPSz4wQabS8nkbnACJBmqEuAHhrfCtHkrXoSZXQahaj3cxaBNCXLpJ+NTK/LIWVT409J
        2XSeSSB7XJsiK2zRAZlZ73yBDLSUhjExUYmMyvPEFcvItPefiLh2mxsb6gksFdRa5wILCtLH
        YM3SnCAXWFJiuh7AhZlVkn+sAXg/XQM4SkybAdTNXcwF1LZjuOksz9QBuKw2Yv8MrTXfSM5A
        0l6w4FnhttmO9oeZ8xU4B2F0NgYNbcUY17Cl5TBtbAXnNE67wq43r4XcBhHtC1tzbvLxXGBD
        U/c2bkFL4bA5TcjNgXSPEPZO9uJ8In9Y3kfyvC38aGoR8toJ9pfk4zyfBmB+x+SOuQjAaVMl
        4ClfODX4g+QGYbQbbGz35MsnYcvoXYyfbw1frdhwZWxLFhtKd8oimJ0p5ul9cFNXKuC1A8yb
        +72TTAZ/Nvvw51ED+KRBTRQBl7L/uyoB0AF7JoFVRDCsl5K57sHKFWyCMsLjWqxCD7a+Uf8v
        02obWB+52gNoCkisRN2GqlAxIU9kkxQ9AFKYxE50aqA/RCwKkyclM6rYUFVCDMP2AEcKl9iL
        jlYvXxbTEfJ4Jpph4hjV366AsnBIBX5dPmdC6gJSguxnCKfVIM0R75oAC6l28UCzdrNhM1mb
        FejaZ+87cycmuazV0eX4uS8f7klTleo9DxRVBruO2Ufr75LzrMzh8dGVA2Nj3hkLEqkxp67l
        kpv78zFTgN0u9nZt8AxsH9U2dZwPcj60Vzpyuo3a7WR4sTQfOVDYsREswdlIuddBTMXK/wCa
        E0XOQgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAIsWRmVeSWpSXmKPExsVy+t/xe7opLYviDU7st7G4P6+V0WLjjPWs
        Fte/PGe1mH/kHKvFla/v2Sym793EZjHp/gQWi/PnN7BbbHp8jdXi8q45bBafe48wWsw4v4/J
        Yu2Ru+wWtxtXsFm07j3CbnH4TTurxYzJL9kcBD02repk87hzbQ+bx/3u40wem5fUe/RtWcXo
        8XmTXABblJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpOZllqkb5d
        gl5G88PXrAW7BCt+9F9nbmBcwtfFyMEhIWAicXGDexcjF4eQwFJGiUMbfzJDxKUk5rcodTFy
        ApnCEn+udbFB1HxilHj99zczSIJNwFCi92gfI4gtIuAhcap1LSuIzSwwg1ni9CxTEFtYIF5i
        9ar/YPUsAqoS+27dZAeZzytgLbG1swZivrzE6g0HwEo4BWwkLn5uZgexhYBKFj8/xzSBkW8B
        I8MqRpHU0uLc9NxiQ73ixNzi0rx0veT83E2MwNjYduzn5h2MlzYGH2IU4GBU4uE9sG1hvBBr
        YllxZe4hRgkOZiURXqezp+OEeFMSK6tSi/Lji0pzUosPMZoC3TSRWUo0OR8Yt3kl8YamhuYW
        lobmxubGZhZK4rwdAgdjhATSE0tSs1NTC1KLYPqYODilGhgXCsd+/GHMwNzVG7r9pOR8/tAv
        Zndma7K6TmM6urPpycWKN6ZLzdu80ysOzd8iHNrz95fg5OO2qyKPah8+yqB249zvh+Ebi86c
        VDY3sTyss2uWXtTRLH9prrd1LpqSz16sTT3tYWv64+VF01zp5gX/mvXjtrD7fju2NPMKZ8r6
        p60q3wu6WHcpsRRnJBpqMRcVJwIAyEniaKMCAAA=
X-CMS-MailID: 20201104103726eucas1p2e8f7c32f13b4232d925e901284ada13d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201104103726eucas1p2e8f7c32f13b4232d925e901284ada13d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201104103726eucas1p2e8f7c32f13b4232d925e901284ada13d
References: <20201104103657.18007-1-s.nawrocki@samsung.com>
        <CGME20201104103726eucas1p2e8f7c32f13b4232d925e901284ada13d@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This patch adds registration of a child platform device for the exynos
interconnect driver. It is assumed that the interconnect provider will
only be needed when #interconnect-cells property is present in the bus
DT node, hence the child device will be created only when such a property
is present.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes for v8, v7, v6:
 - none.

Changes for v5:
 - new patch.
---
 drivers/devfreq/exynos-bus.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/devfreq/exynos-bus.c b/drivers/devfreq/exynos-bus.c
index 1e684a4..ee300ee 100644
--- a/drivers/devfreq/exynos-bus.c
+++ b/drivers/devfreq/exynos-bus.c
@@ -24,6 +24,7 @@
 
 struct exynos_bus {
 	struct device *dev;
+	struct platform_device *icc_pdev;
 
 	struct devfreq *devfreq;
 	struct devfreq_event_dev **edev;
@@ -156,6 +157,8 @@ static void exynos_bus_exit(struct device *dev)
 	if (ret < 0)
 		dev_warn(dev, "failed to disable the devfreq-event devices\n");
 
+	platform_device_unregister(bus->icc_pdev);
+
 	dev_pm_opp_of_remove_table(dev);
 	clk_disable_unprepare(bus->clk);
 	if (bus->opp_table) {
@@ -168,6 +171,8 @@ static void exynos_bus_passive_exit(struct device *dev)
 {
 	struct exynos_bus *bus = dev_get_drvdata(dev);
 
+	platform_device_unregister(bus->icc_pdev);
+
 	dev_pm_opp_of_remove_table(dev);
 	clk_disable_unprepare(bus->clk);
 }
@@ -432,6 +437,18 @@ static int exynos_bus_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err;
 
+	/* Create child platform device for the interconnect provider */
+	if (of_get_property(dev->of_node, "#interconnect-cells", NULL)) {
+		    bus->icc_pdev = platform_device_register_data(
+						dev, "exynos-generic-icc",
+						PLATFORM_DEVID_AUTO, NULL, 0);
+
+		    if (IS_ERR(bus->icc_pdev)) {
+			    ret = PTR_ERR(bus->icc_pdev);
+			    goto err;
+		    }
+	}
+
 	max_state = bus->devfreq->profile->max_state;
 	min_freq = (bus->devfreq->profile->freq_table[0] / 1000);
 	max_freq = (bus->devfreq->profile->freq_table[max_state - 1] / 1000);
-- 
2.7.4

