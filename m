Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7335AA7F47
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  4 Sep 2019 11:24:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729268AbfIDJYy (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 4 Sep 2019 05:24:54 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:48470 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729644AbfIDJYx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Sep 2019 05:24:53 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190904092451euoutp015ced738f9b9eba166429d28b0bb680a3~BMfk_hZfp1858918589euoutp01c
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Sep 2019 09:24:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190904092451euoutp015ced738f9b9eba166429d28b0bb680a3~BMfk_hZfp1858918589euoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1567589091;
        bh=olUHJT7CMn3noJGTWjrB4fne9Pntvwa01sKeoH8tIfY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PRDwqfuKHifEy1LATrha/SJOTX6GY59jv2I2DrEA2VBGM6ocVSthlyD22wGuh57Wb
         Yx+W+LkqyZb0HZjcy1/PeUMKi1g4cPhmMcofQbme57EdO/Su/m8ED94dSwAVGEguAE
         I7X4fmuDUVfeNQgi/XJf9vJGL8lNC7ONsjQUSB0I=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190904092451eucas1p1281e3305a2d04b6ddeab074868df7795~BMfke5H9B1405814058eucas1p1B;
        Wed,  4 Sep 2019 09:24:51 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 01.61.04374.2E28F6D5; Wed,  4
        Sep 2019 10:24:51 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190904092450eucas1p1c97c5a12de93ac4387fa343327718300~BMfjt2Oxw1811518115eucas1p1j;
        Wed,  4 Sep 2019 09:24:50 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190904092450eusmtrp1be57f6cb16d8eb78d05663746517347d~BMfjfTD3_2981829818eusmtrp1b;
        Wed,  4 Sep 2019 09:24:50 +0000 (GMT)
X-AuditID: cbfec7f5-4ddff70000001116-b5-5d6f82e24a42
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id BA.CA.04117.2E28F6D5; Wed,  4
        Sep 2019 10:24:50 +0100 (BST)
Received: from AMDC2765.DIGITAL.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190904092449eusmtip1d50086048493af44ef53d239b40cca82~BMfjJoaRt1524515245eusmtip1a;
        Wed,  4 Sep 2019 09:24:49 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 2/3] arm64: dts: exynos: Move GPU under /soc node for
 Exynos7
Date:   Wed,  4 Sep 2019 11:24:41 +0200
Message-Id: <20190904092442.26260-3-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904092442.26260-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOIsWRmVeSWpSXmKPExsWy7djPc7qPm/JjDVrDLR7M28ZmsXHGelaL
        8+c3sFvMOL+PyWLtkbvsDqwem1Z1snn0bVnF6PF5k1wAcxSXTUpqTmZZapG+XQJXxuqbc9kL
        PvFV/Dh7mK2B8T93FyMnh4SAicTeH1eZuhi5OIQEVjBKrHrzng3C+cIocWX+MUYI5zOjxPob
        F1hhWk4cfMgOkVjOKPFl3kZGkARYy4yjkSA2m4ChRNfbLjYQW0RAVeJz2wJ2EJtZYDujRONl
        QRBbWMBf4ufzZiYQmwWkZuVcsHpeAVuJ9f3r2SCWyUus3nCAGcTmFLCT2L/rHdhFEgKX2STe
        fHvMAlHkItGw+TUzhC0s8er4FnYIW0bi9OQeFoiGZkaJh+fWskM4PYwSl5tmMEJUWUscPn4R
        6DcOoPM0Jdbv0ocIO0rM7OxlAglLCPBJ3HgrCPEAn8SkbdOZIcK8Eh1tQhDVahKzjq+DW3vw
        wiWoczwkrqxaxQoJrImMEk/ef2abwCg/C2HZAkbGVYziqaXFuempxcZ5qeV6xYm5xaV56XrJ
        +bmbGIHRf/rf8a87GPf9STrEKMDBqMTDKxCYFyvEmlhWXJl7iFGCg1lJhDd0T06sEG9KYmVV
        alF+fFFpTmrxIUZpDhYlcd5qhgfRQgLpiSWp2ampBalFMFkmDk6pBsbdYTHWS71dgw/e/Jqk
        J747UfXnidN1HNaJi+NrXqkdPFUuKKRt6Jy8aO6uvgc2DHulv5VOvrNpQRHn0SXrVzpMnOp6
        qS40b8lvqbpnV1MX/wnr4FjMdDjn1MJ/C6a2rfuQmNQzsXeO7COf3Kcf++2Kci1u/ZfmvVmx
        2eLl1ater8y49VQFbrcpsRRnJBpqMRcVJwIACOY0IfoCAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJLMWRmVeSWpSXmKPExsVy+t/xu7qPmvJjDaZ181k8mLeNzWLjjPWs
        FufPb2C3mHF+H5PF2iN32R1YPTat6mTz6NuyitHj8ya5AOYoPZui/NKSVIWM/OISW6VoQwsj
        PUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYzVN+eyF3ziq/hx9jBbA+N/7i5GTg4J
        AROJEwcfsncxcnEICSxllLj34DczREJG4uS0BlYIW1jiz7UuNoiiT4wSD998YAJJsAkYSnS9
        BUlwcogIqEp8blsANolZYCejRPP12UAOB4ewgK/EjgPmIDUsIDUr54LV8wrYSqzvX88GsUBe
        YvWGA2CLOQXsJPbvescIYgsB1fTv+cQ6gZFvASPDKkaR1NLi3PTcYiO94sTc4tK8dL3k/NxN
        jMBg3Hbs55YdjF3vgg8xCnAwKvHw7vDLixViTSwrrsw9xCjBwawkwhu6JydWiDclsbIqtSg/
        vqg0J7X4EKMp0FETmaVEk/OBkZJXEm9oamhuYWlobmxubGahJM7bIXAwRkggPbEkNTs1tSC1
        CKaPiYNTqoHRsWz/v1X/t2h7bTBc4bYl69iSVerbLCdOLVxqf9R3d0yq4Jzb5fllHSvfV8b9
        myL/aqlgOpNcy81TYfccpOvZ7e4nxdxcb17NFrRScn9WyfeLfcmsbfu4Nr9b9WzLZf7Yhgdx
        rAq3Ul6GGU5t2TxHg/HIxV3xX4Ov8riZ/Hhk3vru9EGTY03+SizFGYmGWsxFxYkAtwLK51wC
        AAA=
X-CMS-MailID: 20190904092450eucas1p1c97c5a12de93ac4387fa343327718300
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190904092450eucas1p1c97c5a12de93ac4387fa343327718300
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190904092450eucas1p1c97c5a12de93ac4387fa343327718300
References: <20190904092442.26260-1-m.szyprowski@samsung.com>
        <CGME20190904092450eucas1p1c97c5a12de93ac4387fa343327718300@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Mali GPU hardware module is a standard hardware module integrated to
Exynos7 SoCs, so it should reside under the "/soc" node. The only SoC
components which are placed in the DT root, are those, which are a part
of CPUs: like ARM architected timers and ARM performance measurement
units.

Fixes: 4dc2a25d058d (arm-soc/samsung/dt64) arm64: dts: exynos: Add GPU/Mali T760 node to Exynos7
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos7.dtsi | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index bcb9d8cee267..f09800f355db 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -78,17 +78,6 @@
 		};
 	};
 
-	gpu: gpu@14ac0000 {
-		compatible = "samsung,exynos5433-mali", "arm,mali-t760";
-		reg = <0x14ac0000 0x5000>;
-		interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "job", "mmu", "gpu";
-		status = "disabled";
-		/* TODO: operating points for DVFS, cooling device */
-	};
-
 	psci {
 		compatible = "arm,psci-0.2";
 		method = "smc";
@@ -523,6 +512,17 @@
 			status = "disabled";
 		};
 
+		gpu: gpu@14ac0000 {
+			compatible = "samsung,exynos5433-mali", "arm,mali-t760";
+			reg = <0x14ac0000 0x5000>;
+			interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "job", "mmu", "gpu";
+			status = "disabled";
+			/* TODO: operating points for DVFS, cooling device */
+		};
+
 		mmc_0: mmc@15740000 {
 			compatible = "samsung,exynos7-dw-mshc-smu";
 			interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.17.1

