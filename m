Return-Path: <linux-samsung-soc+bounces-3965-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B137394092B
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 30 Jul 2024 09:13:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C738C1C2273E
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 30 Jul 2024 07:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E71F6190486;
	Tue, 30 Jul 2024 07:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="EJRNzOGi"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B20818FC8A
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jul 2024 07:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722323556; cv=none; b=bOWalZGl8eS16hFiVEGGdzvY1GuLYKhw9+bLkMyVX3vWsVubcxUp/Lm4v6qDE8nLqrIlRzqLSwRV1C7F+ew9uDMLCEeT8GnwMLGZy7hbJqxo9VE4B+HfQWHE8ZL4y6rWNpeCmC/nIHNNooLI5vIX+hZDvhgYy5vPJmw17g7XbLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722323556; c=relaxed/simple;
	bh=1qw/Y/pJGdYJoP89EMr+s+Nx81kw46PPYysCfN3TZ6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=mHX6HFHKfrPvgIN2J9d0Nu0mUpdLhMR9eR3m1bV9e0Agpq4SwMvD1IWm0MNekjttdiZE5ScwW8ytpgqrYLlAOPSIY7nGoslZUC8137tKUoH6Z85/sxZapl5AbULMwo/il0mh2L+jjHctlGeUKox6Nxm5L93XOIQl4MsqK1rkOoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=EJRNzOGi; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20240730071230epoutp033a9ff93113334d0a4cd8cfb2ed9d44f7~m7CTQRjwf1181111811epoutp03Y
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jul 2024 07:12:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20240730071230epoutp033a9ff93113334d0a4cd8cfb2ed9d44f7~m7CTQRjwf1181111811epoutp03Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1722323550;
	bh=c2cdGWtvoVG6tluq6LVhS7EhYRtZCWoSzpLlaZux+ec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EJRNzOGinJExJsu72gKXsBLFUB0qavZeHOtCM/9AX9cTG4O4XYmwihyzMu1tv4Y0F
	 FkBkikcavzdSrVTHyKf2jvCSAZh583xtrwiUZn5J/mLiAFGoKdMHznYhFJwddbowCA
	 s2Gs7K9a3U6OQwsn8A7LnS4ppDAXP41VYbS5sz4M=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20240730071229epcas2p2e88200bbae30e58181dbfbeee1669660~m7CSfp5VO1210412104epcas2p2I;
	Tue, 30 Jul 2024 07:12:29 +0000 (GMT)
Received: from epsmgec2p1-new.samsung.com (unknown [182.195.36.90]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4WY5yh6T2Qz4x9Pv; Tue, 30 Jul
	2024 07:12:28 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmgec2p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	83.96.19039.C5298A66; Tue, 30 Jul 2024 16:12:28 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20240730071228epcas2p1923fbb513190816d7bd9afaf0a4f5066~m7CRNQKZ61152911529epcas2p1L;
	Tue, 30 Jul 2024 07:12:28 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240730071228epsmtrp18dd2a67c5e3332c8791aaa46f8639c4e~m7CRMSWQP1007310073epsmtrp1f;
	Tue, 30 Jul 2024 07:12:28 +0000 (GMT)
X-AuditID: b6c32a4d-36b9f70000004a5f-23-66a8925cf752
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	99.4B.08964.B5298A66; Tue, 30 Jul 2024 16:12:27 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240730071227epsmtip2f95df53dcd62155ae271c1bd42aa173c~m7CQ3KMqp0511105111epsmtip2M;
	Tue, 30 Jul 2024 07:12:27 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v5 4/4] clk: samsung: add top clock support for ExynosAuto
 v920 SoC
Date: Tue, 30 Jul 2024 16:12:21 +0900
Message-ID: <20240730071221.2590284-5-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240730071221.2590284-1-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCJsWRmVeSWpSXmKPExsWy7bCmqW7MpBVpBuveq1k8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZl22SkJqakFimk5iXnp2Tm
	pdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYA3amkUJaYUwoUCkgsLlbSt7Mpyi8t
	SVXIyC8usVVKLUjJKTAv0CtOzC0uzUvXy0stsTI0MDAyBSpMyM7Y8eI7S8GGTuaK9i23GRsY
	11xn6mLk5JAQMJFoeHmbrYuRi0NIYA+jxJl3c5ggnE+MEq9ajrFAON8YJW7OnMUM07J111qo
	qr2MEut+HIZyPjJK/Ju5CGgYBwebgK7En38OIHERgT1MElvOLwErYhY4yyhxd84CdpBRwgKh
	EutmngIbyyKgKrHz3QM2EJtXwF7i85Z/jBDr5CUurnkOFucUcJA48HEeC0SNoMTJmU/AbGag
	muats5lBFkgIzOWQeDblGjtEs4vErAVNUK8KS7w6vgUqLiXxsr8Nys6XmHz9LRNEcwOjxLV/
	3VCP2kssOvOTHeQdZgFNifW79EFMCQFliSO3oPbySXQc/ssOEeaV6GgTgmhUk/h05TLUEBmJ
	YyeeMUOUeEh8WR0MCavJjBLT3u5jm8CoMAvJN7OQfDMLYe8CRuZVjFKpBcW56anJRgWGunmp
	5fCITs7P3cQITr5avjsYX6//q3eIkYmD8RCjBAezkghv/JWlaUK8KYmVValF+fFFpTmpxYcY
	TYHhPZFZSjQ5H5j+80riDU0sDUzMzAzNjUwNzJXEee+1zk0REkhPLEnNTk0tSC2C6WPi4JRq
	YBIvPFPYxzdhqmMmh31Enec50Tvsh7M6GtZ7Tnt0ry91x6O1OjfqU6deCF/Ikf+b5dRfRuEF
	tzxYbjL9eHLipvf/7p7nFzQ6ri28PbfjU/kX7rm5AlcYn5tK+3z6VavxdceSn27lMjmLH4ds
	b7Fgsdv1Ivr86ZKKF3s+6j5TCtOsu2Z54z1Di3e2224LQ5M2kVlCKRGe33fJ6KnKXl0xvfK/
	WljVoW8730UtOGzuJKatE3nZsSv1UnV/9hqPL4W/14Ym537YKGb+viKihuWd3zu9007nvjEu
	4E0R5lFMr3/qm/PI/GymxYu4wAxhlRn17ek7KhVTPlS7hqkd3HKuqM6RdcpBMZ9VlY7MMq9E
	lViKMxINtZiLihMBkzljEUcEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNLMWRmVeSWpSXmKPExsWy7bCSvG70pBVpBrt+WVs8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZx2aSk5mSWpRbp2yVwZex4
	8Z2lYEMnc0X7ltuMDYxrrjN1MXJySAiYSGzdtRbI5uIQEtjNKPF/y2s2iISMxMaG/+wQtrDE
	/ZYjrBBF7xklOp8eB0pwcLAJ6Er8+ecAEhcROMQkMfHzUxYQh1ngMqPEsbuTmUG6hQWCJa6/
	Owc2iUVAVWLnuwdgG3gF7CU+b/nHCLFBXuLimudgcU4BB4kDH+exgNhCQDXvmy8yQ9QLSpyc
	+QQszgxU37x1NvMERoFZSFKzkKQWMDKtYpRMLSjOTc8tNiwwzEst1ytOzC0uzUvXS87P3cQI
	jg8tzR2M21d90DvEyMTBeIhRgoNZSYQ3/srSNCHelMTKqtSi/Pii0pzU4kOM0hwsSuK84i96
	U4QE0hNLUrNTUwtSi2CyTBycUg1MhfHBLJyN0093/I33VphU7/Re/e98sQUTuhdpNcn+yFms
	c9xF47j/ETuzahHNo/ELZ10Off7qre+mG70LfvrsrZvJ+bYx8f3GR6XRz/7Ld3y/IOnYLfqy
	IKDjdMOXCTy/jq2QfLJhR4WCzG5+lnX77RIf/V0hYnRn9qPj9Quf2XNsXfl74hl2gdwbP7Nv
	Xd1srKP37e/CGxOuFIQeOVUh7hnx/nbpwfC3XyYXvDRwn5hifMZLVMbnUedVqale3AY35iqy
	CrGXNXQbL474se/BwySb43uqj3Xrrs9dHrTw+27ZmLXOgq4tj6OTmVSFYsQeP/QKu7Qtsu8g
	g+N2vdvyrKEXuT6yvl1/dK0t7/aC+UosxRmJhlrMRcWJAK6JUYr+AgAA
X-CMS-MailID: 20240730071228epcas2p1923fbb513190816d7bd9afaf0a4f5066
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240730071228epcas2p1923fbb513190816d7bd9afaf0a4f5066
References: <20240730071221.2590284-1-sunyeal.hong@samsung.com>
	<CGME20240730071228epcas2p1923fbb513190816d7bd9afaf0a4f5066@epcas2p1.samsung.com>

This adds support for CMU_TOP which generates clocks for all the
function blocks such as CORE, HSI0/1/2, PERIC0/1 and so on. For
CMU_TOP, PLL_SHARED0,1,2,3,4 and 5 will be the sources of this block
and they will generate bus clocks.

Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
---
 drivers/clk/samsung/Makefile             |    1 +
 drivers/clk/samsung/clk-exynosautov920.c | 1173 ++++++++++++++++++++++
 2 files changed, 1174 insertions(+)
 create mode 100644 drivers/clk/samsung/clk-exynosautov920.c

diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
index 3056944a5a54..f1ba48758c78 100644
--- a/drivers/clk/samsung/Makefile
+++ b/drivers/clk/samsung/Makefile
@@ -21,6 +21,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos7.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos7885.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos850.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynosautov9.o
+obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynosautov920.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-gs101.o
 obj-$(CONFIG_S3C64XX_COMMON_CLK)	+= clk-s3c64xx.o
 obj-$(CONFIG_S5PV210_COMMON_CLK)	+= clk-s5pv210.o clk-s5pv210-audss.o
diff --git a/drivers/clk/samsung/clk-exynosautov920.c b/drivers/clk/samsung/clk-exynosautov920.c
new file mode 100644
index 000000000000..c17d25e3c9a0
--- /dev/null
+++ b/drivers/clk/samsung/clk-exynosautov920.c
@@ -0,0 +1,1173 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024 Samsung Electronics Co., Ltd.
+ * Author: Sunyeal Hong <sunyeal.hong@samsung.com>
+ *
+ * Common Clock Framework support for ExynosAuto v920 SoC.
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#include <dt-bindings/clock/samsung,exynosautov920.h>
+
+#include "clk.h"
+#include "clk-exynos-arm64.h"
+
+/* NOTE: Must be equal to the last clock ID increased by one */
+#define CLKS_NR_TOP			(DOUT_CLKCMU_TAA_NOC + 1)
+#define CLKS_NR_PERIC0			(CLK_DOUT_PERIC0_I3C + 1)
+
+/* ---- CMU_TOP ------------------------------------------------------------ */
+
+/* Register Offset definitions for CMU_TOP (0x11000000) */
+#define PLL_LOCKTIME_PLL_MMC			0x0004
+#define PLL_LOCKTIME_PLL_SHARED0		0x0008
+#define PLL_LOCKTIME_PLL_SHARED1		0x000c
+#define PLL_LOCKTIME_PLL_SHARED2		0x0010
+#define PLL_LOCKTIME_PLL_SHARED3		0x0014
+#define PLL_LOCKTIME_PLL_SHARED4		0x0018
+#define PLL_LOCKTIME_PLL_SHARED5		0x0018
+#define PLL_CON0_PLL_MMC			0x0140
+#define PLL_CON3_PLL_MMC			0x014c
+#define PLL_CON0_PLL_SHARED0			0x0180
+#define PLL_CON3_PLL_SHARED0			0x018c
+#define PLL_CON0_PLL_SHARED1			0x01c0
+#define PLL_CON3_PLL_SHARED1			0x01cc
+#define PLL_CON0_PLL_SHARED2			0x0200
+#define PLL_CON3_PLL_SHARED2			0x020c
+#define PLL_CON0_PLL_SHARED3			0x0240
+#define PLL_CON3_PLL_SHARED3			0x024c
+#define PLL_CON0_PLL_SHARED4			0x0280
+#define PLL_CON3_PLL_SHARED4			0x028c
+#define PLL_CON0_PLL_SHARED5			0x02c0
+#define PLL_CON3_PLL_SHARED5			0x02cc
+
+/* MUX */
+#define CLK_CON_MUX_MUX_CLKCMU_ACC_NOC		0x1000
+#define CLK_CON_MUX_MUX_CLKCMU_APM_NOC		0x1004
+#define CLK_CON_MUX_MUX_CLKCMU_AUD_CPU		0x1008
+#define CLK_CON_MUX_MUX_CLKCMU_AUD_NOC		0x100c
+#define CLK_CON_MUX_MUX_CLKCMU_CIS_MCLK0	0x1010
+#define CLK_CON_MUX_MUX_CLKCMU_CIS_MCLK1	0x1014
+#define CLK_CON_MUX_MUX_CLKCMU_CIS_MCLK2	0x1018
+#define CLK_CON_MUX_MUX_CLKCMU_CIS_MCLK3	0x101c
+#define CLK_CON_MUX_MUX_CLKCMU_CMU_BOOST	0x1020
+#define CLK_CON_MUX_MUX_CLKCMU_CPUCL0_CLUSTER	0x1024
+#define CLK_CON_MUX_MUX_CLKCMU_CPUCL0_DBG	0x1028
+#define CLK_CON_MUX_MUX_CLKCMU_CPUCL0_SWITCH	0x102c
+#define CLK_CON_MUX_MUX_CLKCMU_CPUCL1_CLUSTER	0x1030
+#define CLK_CON_MUX_MUX_CLKCMU_CPUCL1_SWITCH	0x1034
+#define CLK_CON_MUX_MUX_CLKCMU_CPUCL2_CLUSTER	0x1038
+#define CLK_CON_MUX_MUX_CLKCMU_CPUCL2_SWITCH	0x103c
+#define CLK_CON_MUX_MUX_CLKCMU_DNC_NOC		0x1040
+#define CLK_CON_MUX_MUX_CLKCMU_DPTX_DPGTC	0x1044
+#define CLK_CON_MUX_MUX_CLKCMU_DPTX_DPOSC	0x1048
+#define CLK_CON_MUX_MUX_CLKCMU_DPTX_NOC		0x104c
+#define CLK_CON_MUX_MUX_CLKCMU_DPUB_DSIM	0x1050
+#define CLK_CON_MUX_MUX_CLKCMU_DPUB_NOC		0x1054
+#define CLK_CON_MUX_MUX_CLKCMU_DPUF0_NOC	0x1058
+#define CLK_CON_MUX_MUX_CLKCMU_DPUF1_NOC	0x105c
+#define CLK_CON_MUX_MUX_CLKCMU_DPUF2_NOC	0x1060
+#define CLK_CON_MUX_MUX_CLKCMU_DSP_NOC		0x1064
+#define CLK_CON_MUX_MUX_CLKCMU_G3D_NOCP		0x1068
+#define CLK_CON_MUX_MUX_CLKCMU_G3D_SWITCH	0x106c
+#define CLK_CON_MUX_MUX_CLKCMU_GNPU_NOC		0x1070
+#define CLK_CON_MUX_MUX_CLKCMU_HSI0_NOC		0x1074
+#define CLK_CON_MUX_MUX_CLKCMU_ACC_ORB		0x1078
+#define CLK_CON_MUX_MUX_CLKCMU_GNPU_XMAA	0x107c
+#define CLK_CON_MUX_MUX_CLKCMU_HSI1_MMC_CARD	0x1080
+#define CLK_CON_MUX_MUX_CLKCMU_HSI1_NOC		0x1084
+#define CLK_CON_MUX_MUX_CLKCMU_HSI1_USBDRD	0x1088
+#define CLK_CON_MUX_MUX_CLKCMU_HSI2_ETHERNET	0x108c
+#define CLK_CON_MUX_MUX_CLKCMU_HSI2_NOC		0x1090
+#define CLK_CON_MUX_MUX_CLKCMU_HSI2_NOC_UFS	0x1094
+#define CLK_CON_MUX_MUX_CLKCMU_HSI2_UFS_EMBD	0x1098
+#define CLK_CON_MUX_MUX_CLKCMU_ISP_NOC		0x109c
+#define CLK_CON_MUX_MUX_CLKCMU_M2M_JPEG		0x10a0
+#define CLK_CON_MUX_MUX_CLKCMU_M2M_NOC		0x10a4
+#define CLK_CON_MUX_MUX_CLKCMU_MFC_MFC		0x10a8
+#define CLK_CON_MUX_MUX_CLKCMU_MFC_WFD		0x10ac
+#define CLK_CON_MUX_MUX_CLKCMU_MFD_NOC		0x10b0
+#define CLK_CON_MUX_MUX_CLKCMU_MIF_NOCP		0x10b4
+#define CLK_CON_MUX_MUX_CLKCMU_MIF_SWITCH	0x10b8
+#define CLK_CON_MUX_MUX_CLKCMU_MISC_NOC		0x10bc
+#define CLK_CON_MUX_MUX_CLKCMU_NOCL0_NOC	0x10c0
+#define CLK_CON_MUX_MUX_CLKCMU_NOCL1_NOC	0x10c4
+#define CLK_CON_MUX_MUX_CLKCMU_NOCL2_NOC	0x10c8
+#define CLK_CON_MUX_MUX_CLKCMU_PERIC0_IP	0x10cc
+#define CLK_CON_MUX_MUX_CLKCMU_PERIC0_NOC	0x10d0
+#define CLK_CON_MUX_MUX_CLKCMU_PERIC1_IP	0x10d4
+#define CLK_CON_MUX_MUX_CLKCMU_PERIC1_NOC	0x10d8
+#define CLK_CON_MUX_MUX_CLKCMU_SDMA_NOC		0x10dc
+#define CLK_CON_MUX_MUX_CLKCMU_SNW_NOC		0x10e0
+#define CLK_CON_MUX_MUX_CLKCMU_SSP_NOC		0x10e4
+#define CLK_CON_MUX_MUX_CLKCMU_TAA_NOC		0x10e8
+#define CLK_CON_MUX_MUX_CLK_CMU_NOCP		0x10ec
+#define CLK_CON_MUX_MUX_CLK_CMU_PLLCLKOUT	0x10f0
+#define CLK_CON_MUX_MUX_CMU_CMUREF		0x10f4
+
+/* DIV */
+#define CLK_CON_DIV_CLKCMU_ACC_NOC		0x1800
+#define CLK_CON_DIV_CLKCMU_APM_NOC		0x1804
+#define CLK_CON_DIV_CLKCMU_AUD_CPU		0x1808
+#define CLK_CON_DIV_CLKCMU_AUD_NOC		0x180c
+#define CLK_CON_DIV_CLKCMU_CIS_MCLK0		0x1810
+#define CLK_CON_DIV_CLKCMU_CIS_MCLK1		0x1814
+#define CLK_CON_DIV_CLKCMU_CIS_MCLK2		0x1818
+#define CLK_CON_DIV_CLKCMU_CIS_MCLK3		0x181c
+#define CLK_CON_DIV_CLKCMU_CPUCL0_CLUSTER	0x1820
+#define CLK_CON_DIV_CLKCMU_CPUCL0_DBG		0x1824
+#define CLK_CON_DIV_CLKCMU_CPUCL0_SWITCH	0x1828
+#define CLK_CON_DIV_CLKCMU_CPUCL1_CLUSTER	0x182c
+#define CLK_CON_DIV_CLKCMU_CPUCL1_SWITCH	0x1830
+#define CLK_CON_DIV_CLKCMU_CPUCL2_CLUSTER	0x1834
+#define CLK_CON_DIV_CLKCMU_CPUCL2_SWITCH	0x1838
+#define CLK_CON_DIV_CLKCMU_DNC_NOC		0x183c
+#define CLK_CON_DIV_CLKCMU_DPTX_DPGTC		0x1840
+#define CLK_CON_DIV_CLKCMU_DPTX_DPOSC		0x1844
+#define CLK_CON_DIV_CLKCMU_DPTX_NOC		0x1848
+#define CLK_CON_DIV_CLKCMU_DPUB_DSIM		0x184c
+#define CLK_CON_DIV_CLKCMU_DPUB_NOC		0x1850
+#define CLK_CON_DIV_CLKCMU_DPUF0_NOC		0x1854
+#define CLK_CON_DIV_CLKCMU_DPUF1_NOC		0x1858
+#define CLK_CON_DIV_CLKCMU_DPUF2_NOC		0x185c
+#define CLK_CON_DIV_CLKCMU_DSP_NOC		0x1860
+#define CLK_CON_DIV_CLKCMU_G3D_NOCP		0x1864
+#define CLK_CON_DIV_CLKCMU_G3D_SWITCH		0x1868
+#define CLK_CON_DIV_CLKCMU_GNPU_NOC		0x186c
+#define CLK_CON_DIV_CLKCMU_HSI0_NOC		0x1870
+#define CLK_CON_DIV_CLKCMU_ACC_ORB		0x1874
+#define CLK_CON_DIV_CLKCMU_GNPU_XMAA		0x1878
+#define CLK_CON_DIV_CLKCMU_HSI1_MMC_CARD	0x187c
+#define CLK_CON_DIV_CLKCMU_HSI1_NOC		0x1880
+#define CLK_CON_DIV_CLKCMU_HSI1_USBDRD		0x1884
+#define CLK_CON_DIV_CLKCMU_HSI2_ETHERNET	0x1888
+#define CLK_CON_DIV_CLKCMU_HSI2_NOC		0x188c
+#define CLK_CON_DIV_CLKCMU_HSI2_NOC_UFS		0x1890
+#define CLK_CON_DIV_CLKCMU_HSI2_UFS_EMBD	0x1894
+#define CLK_CON_DIV_CLKCMU_ISP_NOC		0x1898
+#define CLK_CON_DIV_CLKCMU_M2M_JPEG		0x189c
+#define CLK_CON_DIV_CLKCMU_M2M_NOC		0x18a0
+#define CLK_CON_DIV_CLKCMU_MFC_MFC		0x18a4
+#define CLK_CON_DIV_CLKCMU_MFC_WFD		0x18a8
+#define CLK_CON_DIV_CLKCMU_MFD_NOC		0x18ac
+#define CLK_CON_DIV_CLKCMU_MIF_NOCP		0x18b0
+#define CLK_CON_DIV_CLKCMU_MISC_NOC		0x18b4
+#define CLK_CON_DIV_CLKCMU_NOCL0_NOC		0x18b8
+#define CLK_CON_DIV_CLKCMU_NOCL1_NOC		0x18bc
+#define CLK_CON_DIV_CLKCMU_NOCL2_NOC		0x18c0
+#define CLK_CON_DIV_CLKCMU_PERIC0_IP		0x18c4
+#define CLK_CON_DIV_CLKCMU_PERIC0_NOC		0x18c8
+#define CLK_CON_DIV_CLKCMU_PERIC1_IP		0x18cc
+#define CLK_CON_DIV_CLKCMU_PERIC1_NOC		0x18d0
+#define CLK_CON_DIV_CLKCMU_SDMA_NOC		0x18d4
+#define CLK_CON_DIV_CLKCMU_SNW_NOC		0x18d8
+#define CLK_CON_DIV_CLKCMU_SSP_NOC		0x18dc
+#define CLK_CON_DIV_CLKCMU_TAA_NOC		0x18e0
+#define CLK_CON_DIV_CLK_ADD_CH_CLK		0x18e4
+#define CLK_CON_DIV_CLK_CMU_PLLCLKOUT		0x18e8
+#define CLK_CON_DIV_DIV_CLKCMU_CMU_BOOST	0x18ec
+#define CLK_CON_DIV_DIV_CLK_CMU_NOCP		0x18f0
+
+static const unsigned long top_clk_regs[] __initconst = {
+	PLL_LOCKTIME_PLL_MMC,
+	PLL_LOCKTIME_PLL_SHARED0,
+	PLL_LOCKTIME_PLL_SHARED1,
+	PLL_LOCKTIME_PLL_SHARED2,
+	PLL_LOCKTIME_PLL_SHARED3,
+	PLL_LOCKTIME_PLL_SHARED4,
+	PLL_LOCKTIME_PLL_SHARED5,
+	PLL_CON0_PLL_MMC,
+	PLL_CON3_PLL_MMC,
+	PLL_CON0_PLL_SHARED0,
+	PLL_CON3_PLL_SHARED0,
+	PLL_CON0_PLL_SHARED1,
+	PLL_CON3_PLL_SHARED1,
+	PLL_CON0_PLL_SHARED2,
+	PLL_CON3_PLL_SHARED2,
+	PLL_CON0_PLL_SHARED3,
+	PLL_CON3_PLL_SHARED3,
+	PLL_CON0_PLL_SHARED4,
+	PLL_CON3_PLL_SHARED4,
+	PLL_CON0_PLL_SHARED5,
+	PLL_CON3_PLL_SHARED5,
+	CLK_CON_MUX_MUX_CLKCMU_ACC_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_APM_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_AUD_CPU,
+	CLK_CON_MUX_MUX_CLKCMU_AUD_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_CIS_MCLK0,
+	CLK_CON_MUX_MUX_CLKCMU_CIS_MCLK1,
+	CLK_CON_MUX_MUX_CLKCMU_CIS_MCLK2,
+	CLK_CON_MUX_MUX_CLKCMU_CIS_MCLK3,
+	CLK_CON_MUX_MUX_CLKCMU_CMU_BOOST,
+	CLK_CON_MUX_MUX_CLKCMU_CPUCL0_CLUSTER,
+	CLK_CON_MUX_MUX_CLKCMU_CPUCL0_DBG,
+	CLK_CON_MUX_MUX_CLKCMU_CPUCL0_SWITCH,
+	CLK_CON_MUX_MUX_CLKCMU_CPUCL1_CLUSTER,
+	CLK_CON_MUX_MUX_CLKCMU_CPUCL1_SWITCH,
+	CLK_CON_MUX_MUX_CLKCMU_CPUCL2_CLUSTER,
+	CLK_CON_MUX_MUX_CLKCMU_CPUCL2_SWITCH,
+	CLK_CON_MUX_MUX_CLKCMU_DNC_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_DPTX_DPGTC,
+	CLK_CON_MUX_MUX_CLKCMU_DPTX_DPOSC,
+	CLK_CON_MUX_MUX_CLKCMU_DPTX_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_DPUB_DSIM,
+	CLK_CON_MUX_MUX_CLKCMU_DPUB_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_DPUF0_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_DPUF1_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_DPUF2_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_DSP_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_G3D_NOCP,
+	CLK_CON_MUX_MUX_CLKCMU_G3D_SWITCH,
+	CLK_CON_MUX_MUX_CLKCMU_GNPU_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_HSI0_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_ACC_ORB,
+	CLK_CON_MUX_MUX_CLKCMU_GNPU_XMAA,
+	CLK_CON_MUX_MUX_CLKCMU_HSI1_MMC_CARD,
+	CLK_CON_MUX_MUX_CLKCMU_HSI1_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_HSI1_USBDRD,
+	CLK_CON_MUX_MUX_CLKCMU_HSI2_ETHERNET,
+	CLK_CON_MUX_MUX_CLKCMU_HSI2_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_HSI2_NOC_UFS,
+	CLK_CON_MUX_MUX_CLKCMU_HSI2_UFS_EMBD,
+	CLK_CON_MUX_MUX_CLKCMU_ISP_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_M2M_JPEG,
+	CLK_CON_MUX_MUX_CLKCMU_M2M_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_MFC_MFC,
+	CLK_CON_MUX_MUX_CLKCMU_MFC_WFD,
+	CLK_CON_MUX_MUX_CLKCMU_MFD_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_MIF_NOCP,
+	CLK_CON_MUX_MUX_CLKCMU_MIF_SWITCH,
+	CLK_CON_MUX_MUX_CLKCMU_MISC_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_NOCL0_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_NOCL1_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_NOCL2_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_PERIC0_IP,
+	CLK_CON_MUX_MUX_CLKCMU_PERIC0_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_PERIC1_IP,
+	CLK_CON_MUX_MUX_CLKCMU_PERIC1_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_SDMA_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_SNW_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_SSP_NOC,
+	CLK_CON_MUX_MUX_CLKCMU_TAA_NOC,
+	CLK_CON_MUX_MUX_CLK_CMU_NOCP,
+	CLK_CON_MUX_MUX_CLK_CMU_PLLCLKOUT,
+	CLK_CON_MUX_MUX_CMU_CMUREF,
+	CLK_CON_DIV_CLKCMU_ACC_NOC,
+	CLK_CON_DIV_CLKCMU_APM_NOC,
+	CLK_CON_DIV_CLKCMU_AUD_CPU,
+	CLK_CON_DIV_CLKCMU_AUD_NOC,
+	CLK_CON_DIV_CLKCMU_CIS_MCLK0,
+	CLK_CON_DIV_CLKCMU_CIS_MCLK1,
+	CLK_CON_DIV_CLKCMU_CIS_MCLK2,
+	CLK_CON_DIV_CLKCMU_CIS_MCLK3,
+	CLK_CON_DIV_CLKCMU_CPUCL0_CLUSTER,
+	CLK_CON_DIV_CLKCMU_CPUCL0_DBG,
+	CLK_CON_DIV_CLKCMU_CPUCL0_SWITCH,
+	CLK_CON_DIV_CLKCMU_CPUCL1_CLUSTER,
+	CLK_CON_DIV_CLKCMU_CPUCL1_SWITCH,
+	CLK_CON_DIV_CLKCMU_CPUCL2_CLUSTER,
+	CLK_CON_DIV_CLKCMU_CPUCL2_SWITCH,
+	CLK_CON_DIV_CLKCMU_DNC_NOC,
+	CLK_CON_DIV_CLKCMU_DPTX_DPGTC,
+	CLK_CON_DIV_CLKCMU_DPTX_DPOSC,
+	CLK_CON_DIV_CLKCMU_DPTX_NOC,
+	CLK_CON_DIV_CLKCMU_DPUB_DSIM,
+	CLK_CON_DIV_CLKCMU_DPUB_NOC,
+	CLK_CON_DIV_CLKCMU_DPUF0_NOC,
+	CLK_CON_DIV_CLKCMU_DPUF1_NOC,
+	CLK_CON_DIV_CLKCMU_DPUF2_NOC,
+	CLK_CON_DIV_CLKCMU_DSP_NOC,
+	CLK_CON_DIV_CLKCMU_G3D_NOCP,
+	CLK_CON_DIV_CLKCMU_G3D_SWITCH,
+	CLK_CON_DIV_CLKCMU_GNPU_NOC,
+	CLK_CON_DIV_CLKCMU_HSI0_NOC,
+	CLK_CON_DIV_CLKCMU_ACC_ORB,
+	CLK_CON_DIV_CLKCMU_GNPU_XMAA,
+	CLK_CON_DIV_CLKCMU_HSI1_MMC_CARD,
+	CLK_CON_DIV_CLKCMU_HSI1_NOC,
+	CLK_CON_DIV_CLKCMU_HSI1_USBDRD,
+	CLK_CON_DIV_CLKCMU_HSI2_ETHERNET,
+	CLK_CON_DIV_CLKCMU_HSI2_NOC,
+	CLK_CON_DIV_CLKCMU_HSI2_NOC_UFS,
+	CLK_CON_DIV_CLKCMU_HSI2_UFS_EMBD,
+	CLK_CON_DIV_CLKCMU_ISP_NOC,
+	CLK_CON_DIV_CLKCMU_M2M_JPEG,
+	CLK_CON_DIV_CLKCMU_M2M_NOC,
+	CLK_CON_DIV_CLKCMU_MFC_MFC,
+	CLK_CON_DIV_CLKCMU_MFC_WFD,
+	CLK_CON_DIV_CLKCMU_MFD_NOC,
+	CLK_CON_DIV_CLKCMU_MIF_NOCP,
+	CLK_CON_DIV_CLKCMU_MISC_NOC,
+	CLK_CON_DIV_CLKCMU_NOCL0_NOC,
+	CLK_CON_DIV_CLKCMU_NOCL1_NOC,
+	CLK_CON_DIV_CLKCMU_NOCL2_NOC,
+	CLK_CON_DIV_CLKCMU_PERIC0_IP,
+	CLK_CON_DIV_CLKCMU_PERIC0_NOC,
+	CLK_CON_DIV_CLKCMU_PERIC1_IP,
+	CLK_CON_DIV_CLKCMU_PERIC1_NOC,
+	CLK_CON_DIV_CLKCMU_SDMA_NOC,
+	CLK_CON_DIV_CLKCMU_SNW_NOC,
+	CLK_CON_DIV_CLKCMU_SSP_NOC,
+	CLK_CON_DIV_CLKCMU_TAA_NOC,
+	CLK_CON_DIV_CLK_ADD_CH_CLK,
+	CLK_CON_DIV_CLK_CMU_PLLCLKOUT,
+	CLK_CON_DIV_DIV_CLKCMU_CMU_BOOST,
+	CLK_CON_DIV_DIV_CLK_CMU_NOCP,
+};
+
+static const struct samsung_pll_clock top_pll_clks[] __initconst = {
+	/* CMU_TOP_PURECLKCOMP */
+	PLL(pll_531x, FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_SHARED0, PLL_CON3_PLL_SHARED0, NULL),
+	PLL(pll_531x, FOUT_SHARED1_PLL, "fout_shared1_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_SHARED1, PLL_CON3_PLL_SHARED1, NULL),
+	PLL(pll_531x, FOUT_SHARED2_PLL, "fout_shared2_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_SHARED2, PLL_CON3_PLL_SHARED2, NULL),
+	PLL(pll_531x, FOUT_SHARED3_PLL, "fout_shared3_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_SHARED3, PLL_CON3_PLL_SHARED3, NULL),
+	PLL(pll_531x, FOUT_SHARED4_PLL, "fout_shared4_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_SHARED4, PLL_CON3_PLL_SHARED4, NULL),
+	PLL(pll_531x, FOUT_SHARED5_PLL, "fout_shared5_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_SHARED5, PLL_CON3_PLL_SHARED5, NULL),
+	PLL(pll_531x, FOUT_MMC_PLL, "fout_mmc_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_MMC, PLL_CON3_PLL_MMC, NULL),
+};
+
+/* List of parent clocks for Muxes in CMU_TOP */
+PNAME(mout_shared0_pll_p) = { "oscclk", "fout_shared0_pll" };
+PNAME(mout_shared1_pll_p) = { "oscclk", "fout_shared1_pll" };
+PNAME(mout_shared2_pll_p) = { "oscclk", "fout_shared2_pll" };
+PNAME(mout_shared3_pll_p) = { "oscclk", "fout_shared3_pll" };
+PNAME(mout_shared4_pll_p) = { "oscclk", "fout_shared4_pll" };
+PNAME(mout_shared5_pll_p) = { "oscclk", "fout_shared5_pll" };
+PNAME(mout_mmc_pll_p) = { "oscclk", "fout_mmc_pll" };
+
+PNAME(mout_clkcmu_cmu_boost_p) = { "dout_shared2_div3", "dout_shared1_div4",
+				   "dout_shared2_div4", "dout_shared4_div4" };
+
+PNAME(mout_clkcmu_cmu_cmuref_p) = { "oscclk", "dout_cmu_boost" };
+
+PNAME(mout_clkcmu_acc_noc_p) = { "dout_shared2_div2", "dout_shared0_div3",
+				 "dout_shared4_div2", "dout_shared1_div3",
+				 "dout_shared2_div3", "dout_shared5_div1",
+				 "dout_shared3_div1", "oscclk" };
+
+PNAME(mout_clkcmu_acc_orb_p) = { "dout_shared2_div2", "dout_shared0_div3",
+				 "dout_shared1_div2", "dout_shared1_div3",
+				 "dout_shared2_div3", "fout_shared5_pll",
+				 "fout_shared3_pll", "oscclk" };
+
+PNAME(mout_clkcmu_apm_noc_p) = { "dout_shared2_div2", "dout_shared1_div4",
+				 "dout_shared2_div4", "dout_shared4_div4" };
+
+PNAME(mout_clkcmu_aud_cpu_p) = { "dout_shared0_div2", "dout_shared1_div2",
+				 "dout_shared2_div2", "dout_shared0_div3",
+				 "dout_shared4_div2", "dout_shared1_div3",
+				 "dout_shared2_div3", "dout_shared4_div3" };
+
+PNAME(mout_clkcmu_aud_noc_p) = { "dout_shared2_div2", "dout_shared4_div2",
+				 "dout_shared1_div2", "dout_shared2_div3" };
+
+PNAME(mout_clkcmu_cpucl0_switch_p) = { "dout_shared0_div2", "dout_shared1_div2",
+				       "dout_shared2_div2", "dout_shared4_div2" };
+
+PNAME(mout_clkcmu_cpucl0_cluster_p) = { "fout_shared2_pll", "fout_shared4_pll",
+					"dout_shared0_div2", "dout_shared1_div2",
+					"dout_shared2_div2", "dout_shared4_div2",
+					"dout_shared2_div3", "fout_shared3_pll" };
+
+PNAME(mout_clkcmu_cpucl0_dbg_p) = { "dout_shared2_div2", "dout_shared0_div3",
+				    "dout_shared4_div2", "dout_shared0_div4" };
+
+PNAME(mout_clkcmu_cpucl1_switch_p) = { "dout_shared0_div2", "dout_shared1_div2",
+				       "dout_shared2_div2", "dout_shared4_div2" };
+
+PNAME(mout_clkcmu_cpucl1_cluster_p) = { "fout_shared2_pll", "fout_shared4_pll",
+					"dout_shared0_div2", "dout_shared1_div2",
+					"dout_shared2_div2", "dout_shared4_div2",
+					"dout_shared2_div3", "fout_shared3_pll" };
+
+PNAME(mout_clkcmu_cpucl2_switch_p) = { "dout_shared0_div2", "dout_shared1_div2",
+				       "dout_shared2_div2", "dout_shared4_div2" };
+
+PNAME(mout_clkcmu_cpucl2_cluster_p) = { "fout_shared2_pll", "fout_shared4_pll",
+					"dout_shared0_div2", "dout_shared1_div2",
+					"dout_shared2_div2", "dout_shared4_div2",
+					"dout_shared2_div3", "fout_shared3_pll" };
+
+PNAME(mout_clkcmu_dnc_noc_p) = { "dout_shared1_div2", "dout_shared2_div2",
+				 "dout_shared0_div3", "dout_shared4_div2",
+				 "dout_shared1_div3", "dout_shared2_div3",
+				 "dout_shared1_div4", "fout_shared3_pll" };
+
+PNAME(mout_clkcmu_dptx_noc_p) = { "dout_shared4_div2", "dout_shared2_div3",
+				  "dout_shared1_div4", "dout_shared2_div4" };
+
+PNAME(mout_clkcmu_dptx_dpgtc_p) = { "oscclk", "dout_shared2_div3",
+				    "dout_shared2_div4", "dout_shared4_div4" };
+
+PNAME(mout_clkcmu_dptx_dposc_p) = { "oscclk", "dout_shared2_div4" };
+
+PNAME(mout_clkcmu_dpub_noc_p) = { "dout_shared4_div2", "dout_shared1_div3",
+				 "dout_shared2_div3", "dout_shared1_div4",
+				 "dout_shared2_div4", "dout_shared4_div4",
+				 "fout_shared3_pll" };
+
+PNAME(mout_clkcmu_dpub_dsim_p) = { "dout_shared2_div3", "dout_shared2_div4" };
+
+PNAME(mout_clkcmu_dpuf_noc_p) = { "dout_shared4_div2", "dout_shared1_div3",
+				   "dout_shared2_div3", "dout_shared1_div4",
+				   "dout_shared2_div4", "dout_shared4_div4",
+				   "fout_shared3_pll" };
+
+PNAME(mout_clkcmu_dsp_noc_p) = { "dout_shared0_div2", "dout_shared1_div2",
+				 "dout_shared2_div2", "dout_shared0_div3",
+				 "dout_shared4_div2", "dout_shared1_div3",
+				 "fout_shared5_pll", "fout_shared3_pll" };
+
+PNAME(mout_clkcmu_g3d_switch_p) = { "dout_shared0_div2", "dout_shared1_div2",
+				    "dout_shared2_div2", "dout_shared4_div2" };
+
+PNAME(mout_clkcmu_g3d_nocp_p) = { "dout_shared2_div3", "dout_shared1_div4",
+				  "dout_shared2_div4", "dout_shared4_div4" };
+
+PNAME(mout_clkcmu_gnpu_noc_p) = { "dout_shared0_div2", "dout_shared1_div2",
+				  "dout_shared2_div2", "dout_shared0_div3",
+				  "dout_shared4_div2", "dout_shared2_div3",
+				  "fout_shared5_pll", "fout_shared3_pll" };
+
+PNAME(mout_clkcmu_hsi0_noc_p) = { "dout_shared4_div2", "dout_shared2_div3",
+				  "dout_shared1_div4", "dout_shared2_div4" };
+
+PNAME(mout_clkcmu_hsi1_noc_p) = { "dout_shared2_div3", "dout_shared1_div4",
+				  "dout_shared2_div4", "dout_shared4_div4" };
+
+PNAME(mout_clkcmu_hsi1_usbdrd_p) = { "oscclk", "dout_shared2_div3",
+				     "dout_shared2_div4", "dout_shared4_div4" };
+
+PNAME(mout_clkcmu_hsi1_mmc_card_p) = { "oscclk", "dout_shared2_div2",
+				       "dout_shared4_div2", "fout_mmc_pll" };
+
+PNAME(mout_clkcmu_hsi2_noc_p) = { "dout_shared4_div2", "dout_shared2_div3",
+				  "dout_shared1_div4", "dout_shared2_div4" };
+
+PNAME(mout_clkcmu_hsi2_noc_ufs_p) = { "dout_shared4_div2", "dout_shared2_div3",
+				      "dout_shared1_div4", "dout_shared2_div2" };
+
+PNAME(mout_clkcmu_hsi2_ufs_embd_p) = { "oscclk", "dout_shared2_div3",
+				       "dout_shared2_div4", "dout_shared4_div4" };
+
+PNAME(mout_clkcmu_hsi2_ethernet_p) = { "oscclk", "dout_shared2_div2",
+				       "dout_shared0_div3", "dout_shared1_div3" };
+
+PNAME(mout_clkcmu_isp_noc_p) = { "dout_shared2_div2", "dout_shared0_div3",
+				 "dout_shared4_div2", "dout_shared1_div3",
+				 "dout_shared2_div3", "fout_shared5_pll",
+				 "fout_shared3_pll", "oscclk" };
+
+PNAME(mout_clkcmu_m2m_noc_p) = { "dout_shared0_div3", "dout_shared4_div2",
+				 "dout_shared2_div3", "dout_shared1_div4" };
+
+PNAME(mout_clkcmu_m2m_jpeg_p) = { "dout_shared0_div3", "dout_shared4_div2",
+				  "dout_shared2_div3", "dout_shared1_div4" };
+
+PNAME(mout_clkcmu_mfc_mfc_p) = { "dout_shared0_div3", "dout_shared4_div2",
+				 "dout_shared2_div3", "dout_shared1_div4" };
+
+PNAME(mout_clkcmu_mfc_wfd_p) = { "dout_shared0_div3", "dout_shared4_div2",
+				 "dout_shared2_div3", "dout_shared1_div4" };
+
+PNAME(mout_clkcmu_mfd_noc_p) = { "dout_shared2_div2", "dout_shared0_div3",
+				 "dout_shared4_div2", "dout_shared1_div3",
+				 "dout_shared2_div3", "fout_shared5_pll",
+				 "fout_shared3_pll", "oscclk" };
+
+PNAME(mout_clkcmu_mif_switch_p) = { "fout_shared0_pll", "fout_shared1_pll",
+				    "fout_shared2_pll", "fout_shared4_pll",
+				    "dout_shared0_div2", "dout_shared1_div2",
+				    "dout_shared2_div2", "fout_shared5_pll" };
+
+PNAME(mout_clkcmu_mif_nocp_p) = { "dout_shared2_div3", "dout_shared1_div4",
+				  "dout_shared2_div4", "dout_shared4_div4" };
+
+PNAME(mout_clkcmu_misc_noc_p) = { "dout_shared4_div2", "dout_shared2_div3",
+				  "dout_shared1_div4", "dout_shared2_div4" };
+
+PNAME(mout_clkcmu_nocl0_noc_p) = { "dout_shared0_div2", "dout_shared1_div2",
+				   "dout_shared2_div2", "dout_shared0_div3",
+				   "dout_shared4_div2", "dout_shared1_div3",
+				   "dout_shared2_div3", "fout_shared3_pll" };
+
+PNAME(mout_clkcmu_nocl1_noc_p) = { "dout_shared2_div2", "dout_shared0_div3",
+				   "dout_shared4_div2", "dout_shared1_div3",
+				   "dout_shared2_div3", "fout_shared5_pll",
+				   "fout_shared3_pll", "oscclk" };
+
+PNAME(mout_clkcmu_nocl2_noc_p) = { "dout_shared2_div2", "dout_shared0_div3",
+				   "dout_shared4_div2", "dout_shared1_div3",
+				   "dout_shared2_div3", "fout_shared5_pll",
+				   "fout_shared3_pll", "oscclk" };
+
+PNAME(mout_clkcmu_peric0_noc_p) = { "dout_shared2_div3", "dout_shared2_div4" };
+
+PNAME(mout_clkcmu_peric0_ip_p) = { "dout_shared2_div3", "dout_shared2_div4" };
+
+PNAME(mout_clkcmu_peric1_noc_p) = { "dout_shared2_div3", "dout_shared2_div4" };
+
+PNAME(mout_clkcmu_peric1_ip_p) = { "dout_shared2_div3", "dout_shared2_div4" };
+
+PNAME(mout_clkcmu_sdma_noc_p) = { "dout_shared1_div2", "dout_shared2_div2",
+				  "dout_shared0_div3", "dout_shared4_div2",
+				  "dout_shared1_div3", "dout_shared2_div3",
+				  "dout_shared1_div4", "fout_shared3_pll" };
+
+PNAME(mout_clkcmu_snw_noc_p) = { "dout_shared2_div2", "dout_shared0_div3",
+				 "dout_shared4_div2", "dout_shared1_div3",
+				 "dout_shared2_div3", "fout_shared5_pll",
+				 "fout_shared3_pll", "oscclk" };
+
+PNAME(mout_clkcmu_ssp_noc_p) = { "dout_shared2_div3", "dout_shared1_div4",
+				  "dout_shared2_div2", "dout_shared4_div4" };
+
+PNAME(mout_clkcmu_taa_noc_p) = { "dout_shared2_div2", "dout_shared0_div3",
+				 "dout_shared4_div2", "dout_shared1_div3",
+				 "dout_shared2_div3", "fout_shared5_pll",
+				 "fout_shared3_pll", "oscclk" };
+
+static const struct samsung_mux_clock top_mux_clks[] __initconst = {
+	/* CMU_TOP_PURECLKCOMP */
+	MUX(MOUT_SHARED0_PLL, "mout_shared0_pll", mout_shared0_pll_p,
+	    PLL_CON0_PLL_SHARED0, 4, 1),
+	MUX(MOUT_SHARED1_PLL, "mout_shared1_pll", mout_shared1_pll_p,
+	    PLL_CON0_PLL_SHARED1, 4, 1),
+	MUX(MOUT_SHARED2_PLL, "mout_shared2_pll", mout_shared2_pll_p,
+	    PLL_CON0_PLL_SHARED2, 4, 1),
+	MUX(MOUT_SHARED3_PLL, "mout_shared3_pll", mout_shared3_pll_p,
+	    PLL_CON0_PLL_SHARED3, 4, 1),
+	MUX(MOUT_SHARED4_PLL, "mout_shared4_pll", mout_shared4_pll_p,
+	    PLL_CON0_PLL_SHARED4, 4, 1),
+	MUX(MOUT_SHARED5_PLL, "mout_shared5_pll", mout_shared5_pll_p,
+	    PLL_CON0_PLL_SHARED5, 4, 1),
+	MUX(MOUT_MMC_PLL, "mout_mmc_pll", mout_mmc_pll_p,
+	    PLL_CON0_PLL_MMC, 4, 1),
+
+	/* BOOST */
+	MUX(MOUT_CLKCMU_CMU_BOOST, "mout_clkcmu_cmu_boost",
+	    mout_clkcmu_cmu_boost_p, CLK_CON_MUX_MUX_CLKCMU_CMU_BOOST, 0, 2),
+	MUX(MOUT_CLKCMU_CMU_CMUREF, "mout_clkcmu_cmu_cmuref",
+	    mout_clkcmu_cmu_cmuref_p, CLK_CON_MUX_MUX_CMU_CMUREF, 0, 1),
+
+	/* ACC */
+	MUX(MOUT_CLKCMU_ACC_NOC, "mout_clkcmu_acc_noc",
+	    mout_clkcmu_acc_noc_p, CLK_CON_MUX_MUX_CLKCMU_ACC_NOC, 0, 3),
+	MUX(MOUT_CLKCMU_ACC_ORB, "mout_clkcmu_acc_orb",
+	    mout_clkcmu_acc_orb_p, CLK_CON_MUX_MUX_CLKCMU_ACC_ORB, 0, 3),
+
+	/* APM */
+	MUX(MOUT_CLKCMU_APM_NOC, "mout_clkcmu_apm_noc",
+	    mout_clkcmu_apm_noc_p, CLK_CON_MUX_MUX_CLKCMU_APM_NOC, 0, 2),
+
+	/* AUD */
+	MUX(MOUT_CLKCMU_AUD_CPU, "mout_clkcmu_aud_cpu",
+	    mout_clkcmu_aud_cpu_p, CLK_CON_MUX_MUX_CLKCMU_AUD_CPU, 0, 3),
+	MUX(MOUT_CLKCMU_AUD_NOC, "mout_clkcmu_aud_noc",
+	    mout_clkcmu_aud_noc_p, CLK_CON_MUX_MUX_CLKCMU_AUD_NOC, 0, 2),
+
+	/* CPUCL0 */
+	MUX(MOUT_CLKCMU_CPUCL0_SWITCH, "mout_clkcmu_cpucl0_switch",
+	    mout_clkcmu_cpucl0_switch_p, CLK_CON_MUX_MUX_CLKCMU_CPUCL0_SWITCH,
+	    0, 2),
+	MUX(MOUT_CLKCMU_CPUCL0_CLUSTER, "mout_clkcmu_cpucl0_cluster",
+	    mout_clkcmu_cpucl0_cluster_p, CLK_CON_MUX_MUX_CLKCMU_CPUCL0_CLUSTER,
+	    0, 3),
+	MUX(MOUT_CLKCMU_CPUCL0_DBG, "mout_clkcmu_cpucl0_dbg",
+	    mout_clkcmu_cpucl0_dbg_p, CLK_CON_MUX_MUX_CLKCMU_CPUCL0_DBG,
+	    0, 2),
+
+	/* CPUCL1 */
+	MUX(MOUT_CLKCMU_CPUCL1_SWITCH, "mout_clkcmu_cpucl1_switch",
+	    mout_clkcmu_cpucl1_switch_p, CLK_CON_MUX_MUX_CLKCMU_CPUCL1_SWITCH,
+	    0, 2),
+	MUX(MOUT_CLKCMU_CPUCL1_CLUSTER, "mout_clkcmu_cpucl1_cluster",
+	    mout_clkcmu_cpucl1_cluster_p, CLK_CON_MUX_MUX_CLKCMU_CPUCL1_CLUSTER,
+	    0, 3),
+
+	/* CPUCL2 */
+	MUX(MOUT_CLKCMU_CPUCL2_SWITCH, "mout_clkcmu_cpucl2_switch",
+	    mout_clkcmu_cpucl2_switch_p, CLK_CON_MUX_MUX_CLKCMU_CPUCL2_SWITCH,
+	    0, 2),
+	MUX(MOUT_CLKCMU_CPUCL2_CLUSTER, "mout_clkcmu_cpucl2_cluster",
+	    mout_clkcmu_cpucl2_cluster_p, CLK_CON_MUX_MUX_CLKCMU_CPUCL2_CLUSTER,
+	    0, 3),
+
+	/* DNC */
+	MUX(MOUT_CLKCMU_DNC_NOC, "mout_clkcmu_dnc_noc",
+	    mout_clkcmu_dnc_noc_p, CLK_CON_MUX_MUX_CLKCMU_DNC_NOC, 0, 3),
+
+	/* DPTX */
+	MUX(MOUT_CLKCMU_DPTX_NOC, "mout_clkcmu_dptx_noc",
+	    mout_clkcmu_dptx_noc_p, CLK_CON_MUX_MUX_CLKCMU_DPTX_NOC, 0, 2),
+	MUX(MOUT_CLKCMU_DPTX_DPGTC, "mout_clkcmu_dptx_dpgtc",
+	    mout_clkcmu_dptx_dpgtc_p, CLK_CON_MUX_MUX_CLKCMU_DPTX_DPGTC, 0, 2),
+	MUX(MOUT_CLKCMU_DPTX_DPOSC, "mout_clkcmu_dptx_dposc",
+	    mout_clkcmu_dptx_dposc_p, CLK_CON_MUX_MUX_CLKCMU_DPTX_DPOSC, 0, 1),
+
+	/* DPUB */
+	MUX(MOUT_CLKCMU_DPUB_NOC, "mout_clkcmu_dpub_noc",
+	    mout_clkcmu_dpub_noc_p, CLK_CON_MUX_MUX_CLKCMU_DPUB_NOC, 0, 3),
+	MUX(MOUT_CLKCMU_DPUB_DSIM, "mout_clkcmu_dpub_dsim",
+	    mout_clkcmu_dpub_dsim_p, CLK_CON_MUX_MUX_CLKCMU_DPUB_DSIM, 0, 1),
+
+	/* DPUF */
+	MUX(MOUT_CLKCMU_DPUF0_NOC, "mout_clkcmu_dpuf0_noc",
+	    mout_clkcmu_dpuf_noc_p, CLK_CON_MUX_MUX_CLKCMU_DPUF0_NOC, 0, 3),
+	MUX(MOUT_CLKCMU_DPUF1_NOC, "mout_clkcmu_dpuf1_noc",
+	    mout_clkcmu_dpuf_noc_p, CLK_CON_MUX_MUX_CLKCMU_DPUF1_NOC, 0, 3),
+	MUX(MOUT_CLKCMU_DPUF2_NOC, "mout_clkcmu_dpuf2_noc",
+	    mout_clkcmu_dpuf_noc_p, CLK_CON_MUX_MUX_CLKCMU_DPUF2_NOC, 0, 3),
+
+	/* DSP */
+	MUX(MOUT_CLKCMU_DSP_NOC, "mout_clkcmu_dsp_noc",
+	    mout_clkcmu_dsp_noc_p, CLK_CON_MUX_MUX_CLKCMU_DSP_NOC, 0, 3),
+
+	/* G3D */
+	MUX(MOUT_CLKCMU_G3D_SWITCH, "mout_clkcmu_g3d_switch",
+	    mout_clkcmu_g3d_switch_p, CLK_CON_MUX_MUX_CLKCMU_G3D_SWITCH, 0, 2),
+	MUX(MOUT_CLKCMU_G3D_NOCP, "mout_clkcmu_g3d_nocp",
+	    mout_clkcmu_g3d_nocp_p, CLK_CON_MUX_MUX_CLKCMU_G3D_NOCP, 0, 2),
+
+	/* GNPU */
+	MUX(MOUT_CLKCMU_GNPU_NOC, "mout_clkcmu_gnpu_noc",
+	    mout_clkcmu_gnpu_noc_p, CLK_CON_MUX_MUX_CLKCMU_GNPU_NOC, 0, 3),
+
+	/* HSI0 */
+	MUX(MOUT_CLKCMU_HSI0_NOC, "mout_clkcmu_hsi0_noc",
+	    mout_clkcmu_hsi0_noc_p, CLK_CON_MUX_MUX_CLKCMU_HSI0_NOC, 0, 2),
+
+	/* HSI1 */
+	MUX(MOUT_CLKCMU_HSI1_NOC, "mout_clkcmu_hsi1_noc",
+	    mout_clkcmu_hsi1_noc_p, CLK_CON_MUX_MUX_CLKCMU_HSI1_NOC,
+	    0, 2),
+	MUX(MOUT_CLKCMU_HSI1_USBDRD, "mout_clkcmu_hsi1_usbdrd",
+	    mout_clkcmu_hsi1_usbdrd_p, CLK_CON_MUX_MUX_CLKCMU_HSI1_USBDRD,
+	    0, 2),
+	MUX(MOUT_CLKCMU_HSI1_MMC_CARD, "mout_clkcmu_hsi1_mmc_card",
+	    mout_clkcmu_hsi1_mmc_card_p, CLK_CON_MUX_MUX_CLKCMU_HSI1_MMC_CARD,
+	    0, 2),
+
+	/* HSI2 */
+	MUX(MOUT_CLKCMU_HSI2_NOC, "mout_clkcmu_hsi2_noc",
+	    mout_clkcmu_hsi2_noc_p, CLK_CON_MUX_MUX_CLKCMU_HSI2_NOC,
+	    0, 2),
+	MUX(MOUT_CLKCMU_HSI2_NOC_UFS, "mout_clkcmu_hsi2_noc_ufs",
+	    mout_clkcmu_hsi2_noc_ufs_p, CLK_CON_MUX_MUX_CLKCMU_HSI2_NOC_UFS,
+	    0, 2),
+	MUX(MOUT_CLKCMU_HSI2_UFS_EMBD, "mout_clkcmu_hsi2_ufs_embd",
+	    mout_clkcmu_hsi2_ufs_embd_p, CLK_CON_MUX_MUX_CLKCMU_HSI2_UFS_EMBD,
+	    0, 2),
+	MUX(MOUT_CLKCMU_HSI2_ETHERNET, "mout_clkcmu_hsi2_ethernet",
+	    mout_clkcmu_hsi2_ethernet_p, CLK_CON_MUX_MUX_CLKCMU_HSI2_ETHERNET,
+	    0, 2),
+
+	/* ISP */
+	MUX(MOUT_CLKCMU_ISP_NOC, "mout_clkcmu_isp_noc",
+	    mout_clkcmu_isp_noc_p, CLK_CON_MUX_MUX_CLKCMU_ISP_NOC, 0, 3),
+
+	/* M2M */
+	MUX(MOUT_CLKCMU_M2M_NOC, "mout_clkcmu_m2m_noc",
+	    mout_clkcmu_m2m_noc_p, CLK_CON_MUX_MUX_CLKCMU_M2M_NOC, 0, 2),
+	MUX(MOUT_CLKCMU_M2M_JPEG, "mout_clkcmu_m2m_jpeg",
+	    mout_clkcmu_m2m_jpeg_p, CLK_CON_MUX_MUX_CLKCMU_M2M_JPEG, 0, 2),
+
+	/* MFC */
+	MUX(MOUT_CLKCMU_MFC_MFC, "mout_clkcmu_mfc_mfc",
+	    mout_clkcmu_mfc_mfc_p, CLK_CON_MUX_MUX_CLKCMU_MFC_MFC, 0, 2),
+	MUX(MOUT_CLKCMU_MFC_WFD, "mout_clkcmu_mfc_wfd",
+	    mout_clkcmu_mfc_wfd_p, CLK_CON_MUX_MUX_CLKCMU_MFC_WFD, 0, 2),
+
+	/* MFD */
+	MUX(MOUT_CLKCMU_MFD_NOC, "mout_clkcmu_mfd_noc",
+	    mout_clkcmu_mfd_noc_p, CLK_CON_MUX_MUX_CLKCMU_MFD_NOC, 0, 3),
+
+	/* MIF */
+	MUX(MOUT_CLKCMU_MIF_SWITCH, "mout_clkcmu_mif_switch",
+	    mout_clkcmu_mif_switch_p, CLK_CON_MUX_MUX_CLKCMU_MIF_SWITCH, 0, 3),
+	MUX(MOUT_CLKCMU_MIF_NOCP, "mout_clkcmu_mif_nocp",
+	    mout_clkcmu_mif_nocp_p, CLK_CON_MUX_MUX_CLKCMU_MIF_NOCP, 0, 2),
+
+	/* MISC */
+	MUX(MOUT_CLKCMU_MISC_NOC, "mout_clkcmu_misc_noc",
+	    mout_clkcmu_misc_noc_p, CLK_CON_MUX_MUX_CLKCMU_MISC_NOC, 0, 2),
+
+	/* NOCL0 */
+	MUX(MOUT_CLKCMU_NOCL0_NOC, "mout_clkcmu_nocl0_noc",
+	    mout_clkcmu_nocl0_noc_p, CLK_CON_MUX_MUX_CLKCMU_NOCL0_NOC, 0, 3),
+
+	/* NOCL1 */
+	MUX(MOUT_CLKCMU_NOCL1_NOC, "mout_clkcmu_nocl1_noc",
+	    mout_clkcmu_nocl1_noc_p, CLK_CON_MUX_MUX_CLKCMU_NOCL1_NOC, 0, 3),
+
+	/* NOCL2 */
+	MUX(MOUT_CLKCMU_NOCL2_NOC, "mout_clkcmu_nocl2_noc",
+	    mout_clkcmu_nocl2_noc_p, CLK_CON_MUX_MUX_CLKCMU_NOCL2_NOC, 0, 3),
+
+	/* PERIC0 */
+	MUX(MOUT_CLKCMU_PERIC0_NOC, "mout_clkcmu_peric0_noc",
+	    mout_clkcmu_peric0_noc_p, CLK_CON_MUX_MUX_CLKCMU_PERIC0_NOC, 0, 1),
+	MUX(MOUT_CLKCMU_PERIC0_IP, "mout_clkcmu_peric0_ip",
+	    mout_clkcmu_peric0_ip_p, CLK_CON_MUX_MUX_CLKCMU_PERIC0_IP, 0, 1),
+
+	/* PERIC1 */
+	MUX(MOUT_CLKCMU_PERIC1_NOC, "mout_clkcmu_peric1_noc",
+	    mout_clkcmu_peric1_noc_p, CLK_CON_MUX_MUX_CLKCMU_PERIC1_NOC, 0, 1),
+	MUX(MOUT_CLKCMU_PERIC1_IP, "mout_clkcmu_peric1_ip",
+	    mout_clkcmu_peric1_ip_p, CLK_CON_MUX_MUX_CLKCMU_PERIC1_IP, 0, 1),
+
+	/* SDMA */
+	MUX(MOUT_CLKCMU_SDMA_NOC, "mout_clkcmu_sdma_noc",
+	    mout_clkcmu_sdma_noc_p, CLK_CON_MUX_MUX_CLKCMU_SDMA_NOC, 0, 3),
+
+	/* SNW */
+	MUX(MOUT_CLKCMU_SNW_NOC, "mout_clkcmu_snw_noc",
+	    mout_clkcmu_snw_noc_p, CLK_CON_MUX_MUX_CLKCMU_SNW_NOC, 0, 3),
+
+	/* SSP */
+	MUX(MOUT_CLKCMU_SSP_NOC, "mout_clkcmu_ssp_noc",
+	    mout_clkcmu_ssp_noc_p, CLK_CON_MUX_MUX_CLKCMU_SSP_NOC, 0, 2),
+
+	/* TAA */
+	MUX(MOUT_CLKCMU_TAA_NOC, "mout_clkcmu_taa_noc",
+	    mout_clkcmu_taa_noc_p, CLK_CON_MUX_MUX_CLKCMU_TAA_NOC, 0, 3),
+};
+
+static const struct samsung_div_clock top_div_clks[] __initconst = {
+	/* CMU_TOP_PURECLKCOMP */
+
+	/* BOOST */
+	DIV(DOUT_CLKCMU_CMU_BOOST, "dout_clkcmu_cmu_boost",
+	    "mout_clkcmu_cmu_boost", CLK_CON_DIV_DIV_CLKCMU_CMU_BOOST, 0, 2),
+
+	/* ACC */
+	DIV(DOUT_CLKCMU_ACC_NOC, "dout_clkcmu_acc_noc",
+	    "mout_clkcmu_acc_noc", CLK_CON_DIV_CLKCMU_ACC_NOC, 0, 4),
+	DIV(DOUT_CLKCMU_ACC_ORB, "dout_clkcmu_acc_orb",
+	    "mout_clkcmu_acc_orb", CLK_CON_DIV_CLKCMU_ACC_ORB, 0, 4),
+
+	/* APM */
+	DIV(DOUT_CLKCMU_APM_NOC, "dout_clkcmu_apm_noc",
+	    "mout_clkcmu_apm_noc", CLK_CON_DIV_CLKCMU_APM_NOC, 0, 3),
+
+	/* AUD */
+	DIV(DOUT_CLKCMU_AUD_CPU, "dout_clkcmu_aud_cpu",
+	    "mout_clkcmu_aud_cpu", CLK_CON_DIV_CLKCMU_AUD_CPU, 0, 3),
+	DIV(DOUT_CLKCMU_AUD_NOC, "dout_clkcmu_aud_noc",
+	    "mout_clkcmu_aud_noc", CLK_CON_DIV_CLKCMU_AUD_NOC, 0, 4),
+
+	/* CPUCL0 */
+	DIV(DOUT_CLKCMU_CPUCL0_SWITCH, "dout_clkcmu_cpucl0_switch",
+	    "mout_clkcmu_cpucl0_switch",
+	    CLK_CON_DIV_CLKCMU_CPUCL0_SWITCH, 0, 3),
+	DIV(DOUT_CLKCMU_CPUCL0_CLUSTER, "dout_clkcmu_cpucl0_cluster",
+	    "mout_clkcmu_cpucl0_cluster",
+	    CLK_CON_DIV_CLKCMU_CPUCL0_CLUSTER, 0, 3),
+	DIV(DOUT_CLKCMU_CPUCL0_DBG, "dout_clkcmu_cpucl0_dbg",
+	    "mout_clkcmu_cpucl0_dbg",
+	    CLK_CON_DIV_CLKCMU_CPUCL0_DBG, 0, 4),
+
+	/* CPUCL1 */
+	DIV(DOUT_CLKCMU_CPUCL1_SWITCH, "dout_clkcmu_cpucl1_switch",
+	    "mout_clkcmu_cpucl1_switch",
+	    CLK_CON_DIV_CLKCMU_CPUCL1_SWITCH, 0, 3),
+	DIV(DOUT_CLKCMU_CPUCL1_CLUSTER, "dout_clkcmu_cpucl1_cluster",
+	    "mout_clkcmu_cpucl1_cluster",
+	    CLK_CON_DIV_CLKCMU_CPUCL1_CLUSTER, 0, 3),
+
+	/* CPUCL2 */
+	DIV(DOUT_CLKCMU_CPUCL2_SWITCH, "dout_clkcmu_cpucl2_switch",
+	    "mout_clkcmu_cpucl2_switch",
+	    CLK_CON_DIV_CLKCMU_CPUCL2_SWITCH, 0, 3),
+	DIV(DOUT_CLKCMU_CPUCL2_CLUSTER, "dout_clkcmu_cpucl2_cluster",
+	    "mout_clkcmu_cpucl2_cluster",
+	    CLK_CON_DIV_CLKCMU_CPUCL2_CLUSTER, 0, 3),
+
+	/* DNC */
+	DIV(DOUT_CLKCMU_DNC_NOC, "dout_clkcmu_dnc_noc",
+	    "mout_clkcmu_dnc_noc", CLK_CON_DIV_CLKCMU_DNC_NOC, 0, 4),
+
+	/* DPTX */
+	DIV(DOUT_CLKCMU_DPTX_NOC, "dout_clkcmu_dptx_noc",
+	    "mout_clkcmu_dptx_noc", CLK_CON_DIV_CLKCMU_DPTX_NOC, 0, 4),
+	DIV(DOUT_CLKCMU_DPTX_DPGTC, "dout_clkcmu_dptx_dpgtc",
+	    "mout_clkcmu_dptx_dpgtc", CLK_CON_DIV_CLKCMU_DPTX_DPGTC, 0, 3),
+	DIV(DOUT_CLKCMU_DPTX_DPOSC, "dout_clkcmu_dptx_dposc",
+	    "mout_clkcmu_dptx_dposc", CLK_CON_DIV_CLKCMU_DPTX_DPOSC, 0, 5),
+
+	/* DPUB */
+	DIV(DOUT_CLKCMU_DPUB_NOC, "dout_clkcmu_dpub_noc",
+	    "mout_clkcmu_dpub_noc", CLK_CON_DIV_CLKCMU_DPUB_NOC, 0, 4),
+	DIV(DOUT_CLKCMU_DPUB_DSIM, "dout_clkcmu_dpub_dsim",
+	    "mout_clkcmu_dpub_dsim", CLK_CON_DIV_CLKCMU_DPUB_DSIM, 0, 4),
+
+	/* DPUF */
+	DIV(DOUT_CLKCMU_DPUF0_NOC, "dout_clkcmu_dpuf0_noc",
+	    "mout_clkcmu_dpuf0_noc", CLK_CON_DIV_CLKCMU_DPUF0_NOC, 0, 4),
+	DIV(DOUT_CLKCMU_DPUF1_NOC, "dout_clkcmu_dpuf1_noc",
+	    "mout_clkcmu_dpuf1_noc", CLK_CON_DIV_CLKCMU_DPUF1_NOC, 0, 4),
+	DIV(DOUT_CLKCMU_DPUF2_NOC, "dout_clkcmu_dpuf2_noc",
+	    "mout_clkcmu_dpuf2_noc", CLK_CON_DIV_CLKCMU_DPUF2_NOC, 0, 4),
+
+	/* DSP */
+	DIV(DOUT_CLKCMU_DSP_NOC, "dout_clkcmu_dsp_noc",
+	    "mout_clkcmu_dsp_noc", CLK_CON_DIV_CLKCMU_DSP_NOC, 0, 4),
+
+	/* G3D */
+	DIV(DOUT_CLKCMU_G3D_SWITCH, "dout_clkcmu_g3d_switch",
+	    "mout_clkcmu_g3d_switch", CLK_CON_DIV_CLKCMU_G3D_SWITCH, 0, 3),
+	DIV(DOUT_CLKCMU_G3D_NOCP, "dout_clkcmu_g3d_nocp",
+	    "mout_clkcmu_g3d_nocp", CLK_CON_DIV_CLKCMU_G3D_NOCP, 0, 3),
+
+	/* GNPU */
+	DIV(DOUT_CLKCMU_GNPU_NOC, "dout_clkcmu_gnpu_noc",
+	    "mout_clkcmu_gnpu_noc", CLK_CON_DIV_CLKCMU_GNPU_NOC, 0, 4),
+
+	/* HSI0 */
+	DIV(DOUT_CLKCMU_HSI0_NOC, "dout_clkcmu_hsi0_noc",
+	    "mout_clkcmu_hsi0_noc", CLK_CON_DIV_CLKCMU_HSI0_NOC, 0, 4),
+
+	/* HSI1 */
+	DIV(DOUT_CLKCMU_HSI1_NOC, "dout_clkcmu_hsi1_noc",
+	    "mout_clkcmu_hsi1_noc", CLK_CON_DIV_CLKCMU_HSI1_NOC, 0, 4),
+	DIV(DOUT_CLKCMU_HSI1_USBDRD, "dout_clkcmu_hsi1_usbdrd",
+	    "mout_clkcmu_hsi1_usbdrd", CLK_CON_DIV_CLKCMU_HSI1_USBDRD, 0, 4),
+	DIV(DOUT_CLKCMU_HSI1_MMC_CARD, "dout_clkcmu_hsi1_mmc_card",
+	    "mout_clkcmu_hsi1_mmc_card", CLK_CON_DIV_CLKCMU_HSI1_MMC_CARD, 0, 9),
+
+	/* HSI2 */
+	DIV(DOUT_CLKCMU_HSI2_NOC, "dout_clkcmu_hsi2_noc",
+	    "mout_clkcmu_hsi2_noc", CLK_CON_DIV_CLKCMU_HSI2_NOC, 0, 4),
+	DIV(DOUT_CLKCMU_HSI2_NOC_UFS, "dout_clkcmu_hsi2_noc_ufs",
+	    "mout_clkcmu_hsi2_noc_ufs", CLK_CON_DIV_CLKCMU_HSI2_NOC_UFS, 0, 4),
+	DIV(DOUT_CLKCMU_HSI2_UFS_EMBD, "dout_clkcmu_hsi2_ufs_embd",
+	    "mout_clkcmu_hsi2_ufs_embd", CLK_CON_DIV_CLKCMU_HSI2_UFS_EMBD, 0, 3),
+	DIV(DOUT_CLKCMU_HSI2_ETHERNET, "dout_clkcmu_hsi2_ethernet",
+	    "mout_clkcmu_hsi2_ethernet", CLK_CON_DIV_CLKCMU_HSI2_ETHERNET, 0, 3),
+
+	/* ISP */
+	DIV(DOUT_CLKCMU_ISP_NOC, "dout_clkcmu_isp_noc",
+	    "mout_clkcmu_isp_noc", CLK_CON_DIV_CLKCMU_ISP_NOC, 0, 4),
+
+	/* M2M */
+	DIV(DOUT_CLKCMU_M2M_NOC, "dout_clkcmu_m2m_noc",
+	    "mout_clkcmu_m2m_noc", CLK_CON_DIV_CLKCMU_M2M_NOC, 0, 4),
+	DIV(DOUT_CLKCMU_M2M_JPEG, "dout_clkcmu_m2m_jpeg",
+	    "mout_clkcmu_m2m_jpeg", CLK_CON_DIV_CLKCMU_M2M_JPEG, 0, 4),
+
+	/* MFC */
+	DIV(DOUT_CLKCMU_MFC_MFC, "dout_clkcmu_mfc_mfc",
+	    "mout_clkcmu_mfc_mfc", CLK_CON_DIV_CLKCMU_MFC_MFC, 0, 4),
+	DIV(DOUT_CLKCMU_MFC_WFD, "dout_clkcmu_mfc_wfd",
+	    "mout_clkcmu_mfc_wfd", CLK_CON_DIV_CLKCMU_MFC_WFD, 0, 4),
+
+	/* MFD */
+	DIV(DOUT_CLKCMU_MFD_NOC, "dout_clkcmu_mfd_noc",
+	    "mout_clkcmu_mfd_noc", CLK_CON_DIV_CLKCMU_MFD_NOC, 0, 4),
+
+	/* MIF */
+	DIV(DOUT_CLKCMU_MIF_NOCP, "dout_clkcmu_mif_nocp",
+	    "mout_clkcmu_mif_nocp", CLK_CON_DIV_CLKCMU_MIF_NOCP, 0, 4),
+
+	/* MISC */
+	DIV(DOUT_CLKCMU_MISC_NOC, "dout_clkcmu_misc_noc",
+	    "mout_clkcmu_misc_noc", CLK_CON_DIV_CLKCMU_MISC_NOC, 0, 4),
+
+	/* NOCL0 */
+	DIV(DOUT_CLKCMU_NOCL0_NOC, "dout_clkcmu_nocl0_noc",
+	    "mout_clkcmu_nocl0_noc", CLK_CON_DIV_CLKCMU_NOCL0_NOC, 0, 4),
+
+	/* NOCL1 */
+	DIV(DOUT_CLKCMU_NOCL1_NOC, "dout_clkcmu_nocl1_noc",
+	    "mout_clkcmu_nocl1_noc", CLK_CON_DIV_CLKCMU_NOCL1_NOC, 0, 4),
+
+	/* NOCL2 */
+	DIV(DOUT_CLKCMU_NOCL2_NOC, "dout_clkcmu_nocl2_noc",
+	    "mout_clkcmu_nocl2_noc", CLK_CON_DIV_CLKCMU_NOCL2_NOC, 0, 4),
+
+	/* PERIC0 */
+	DIV(DOUT_CLKCMU_PERIC0_NOC, "dout_clkcmu_peric0_noc",
+	    "mout_clkcmu_peric0_noc", CLK_CON_DIV_CLKCMU_PERIC0_NOC, 0, 4),
+	DIV(DOUT_CLKCMU_PERIC0_IP, "dout_clkcmu_peric0_ip",
+	    "mout_clkcmu_peric0_ip", CLK_CON_DIV_CLKCMU_PERIC0_IP, 0, 4),
+
+	/* PERIC1 */
+	DIV(DOUT_CLKCMU_PERIC1_NOC, "dout_clkcmu_peric1_noc",
+	    "mout_clkcmu_peric1_noc", CLK_CON_DIV_CLKCMU_PERIC1_NOC, 0, 4),
+	DIV(DOUT_CLKCMU_PERIC1_IP, "dout_clkcmu_peric1_ip",
+	    "mout_clkcmu_peric1_ip", CLK_CON_DIV_CLKCMU_PERIC1_IP, 0, 4),
+
+	/* SDMA */
+	DIV(DOUT_CLKCMU_SDMA_NOC, "dout_clkcmu_sdma_noc",
+	    "mout_clkcmu_sdma_noc", CLK_CON_DIV_CLKCMU_SDMA_NOC, 0, 4),
+
+	/* SNW */
+	DIV(DOUT_CLKCMU_SNW_NOC, "dout_clkcmu_snw_noc",
+	    "mout_clkcmu_snw_noc", CLK_CON_DIV_CLKCMU_SNW_NOC, 0, 4),
+
+	/* SSP */
+	DIV(DOUT_CLKCMU_SSP_NOC, "dout_clkcmu_ssp_noc",
+	    "mout_clkcmu_ssp_noc", CLK_CON_DIV_CLKCMU_SSP_NOC, 0, 4),
+
+	/* TAA */
+	DIV(DOUT_CLKCMU_TAA_NOC, "dout_clkcmu_taa_noc",
+	    "mout_clkcmu_taa_noc", CLK_CON_DIV_CLKCMU_TAA_NOC, 0, 4),
+};
+
+static const struct samsung_fixed_factor_clock top_fixed_factor_clks[] __initconst = {
+	FFACTOR(DOUT_SHARED0_DIV1, "dout_shared0_div1",
+		"mout_shared0_pll", 1, 1, 0),
+	FFACTOR(DOUT_SHARED0_DIV2, "dout_shared0_div2",
+		"mout_shared0_pll", 1, 2, 0),
+	FFACTOR(DOUT_SHARED0_DIV3, "dout_shared0_div3",
+		"mout_shared0_pll", 1, 3, 0),
+	FFACTOR(DOUT_SHARED0_DIV4, "dout_shared0_div4",
+		"mout_shared0_pll", 1, 4, 0),
+	FFACTOR(DOUT_SHARED1_DIV1, "dout_shared1_div1",
+		"mout_shared1_pll", 1, 1, 0),
+	FFACTOR(DOUT_SHARED1_DIV2, "dout_shared1_div2",
+		"mout_shared1_pll", 1, 2, 0),
+	FFACTOR(DOUT_SHARED1_DIV3, "dout_shared1_div3",
+		"mout_shared1_pll", 1, 3, 0),
+	FFACTOR(DOUT_SHARED1_DIV4, "dout_shared1_div4",
+		"mout_shared1_pll", 1, 4, 0),
+	FFACTOR(DOUT_SHARED2_DIV1, "dout_shared2_div1",
+		"mout_shared2_pll", 1, 1, 0),
+	FFACTOR(DOUT_SHARED2_DIV2, "dout_shared2_div2",
+		"mout_shared2_pll", 1, 2, 0),
+	FFACTOR(DOUT_SHARED2_DIV3, "dout_shared2_div3",
+		"mout_shared2_pll", 1, 3, 0),
+	FFACTOR(DOUT_SHARED2_DIV4, "dout_shared2_div4",
+		"mout_shared2_pll", 1, 4, 0),
+	FFACTOR(DOUT_SHARED3_DIV1, "dout_shared3_div1",
+		"mout_shared3_pll", 1, 1, 0),
+	FFACTOR(DOUT_SHARED3_DIV2, "dout_shared3_div2",
+		"mout_shared3_pll", 1, 2, 0),
+	FFACTOR(DOUT_SHARED3_DIV3, "dout_shared3_div3",
+		"mout_shared3_pll", 1, 3, 0),
+	FFACTOR(DOUT_SHARED3_DIV4, "dout_shared3_div4",
+		"mout_shared3_pll", 1, 4, 0),
+	FFACTOR(DOUT_SHARED4_DIV1, "dout_shared4_div1",
+		"mout_shared4_pll", 1, 1, 0),
+	FFACTOR(DOUT_SHARED4_DIV2, "dout_shared4_div2",
+		"mout_shared4_pll", 1, 2, 0),
+	FFACTOR(DOUT_SHARED4_DIV3, "dout_shared4_div3",
+		"mout_shared4_pll", 1, 3, 0),
+	FFACTOR(DOUT_SHARED4_DIV4, "dout_shared4_div4",
+		"mout_shared4_pll", 1, 4, 0),
+	FFACTOR(DOUT_SHARED5_DIV1, "dout_shared5_div1",
+		"mout_shared5_pll", 1, 1, 0),
+	FFACTOR(DOUT_SHARED5_DIV2, "dout_shared5_div2",
+		"mout_shared5_pll", 1, 2, 0),
+	FFACTOR(DOUT_SHARED5_DIV3, "dout_shared5_div3",
+		"mout_shared5_pll", 1, 3, 0),
+	FFACTOR(DOUT_SHARED5_DIV4, "dout_shared5_div4",
+		"mout_shared5_pll", 1, 4, 0),
+};
+
+static const struct samsung_cmu_info top_cmu_info __initconst = {
+	.pll_clks		= top_pll_clks,
+	.nr_pll_clks		= ARRAY_SIZE(top_pll_clks),
+	.mux_clks		= top_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(top_mux_clks),
+	.div_clks		= top_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(top_div_clks),
+	.fixed_factor_clks	= top_fixed_factor_clks,
+	.nr_fixed_factor_clks	= ARRAY_SIZE(top_fixed_factor_clks),
+	.nr_clk_ids		= CLKS_NR_TOP,
+	.clk_regs		= top_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(top_clk_regs),
+};
+
+static void __init exynosautov920_cmu_top_init(struct device_node *np)
+{
+	exynos_arm64_register_cmu(NULL, np, &top_cmu_info);
+}
+
+/* Register CMU_TOP early, as it's a dependency for other early domains */
+CLK_OF_DECLARE(exynosautov920_cmu_top, "samsung,exynosautov920-cmu-top",
+	       exynosautov920_cmu_top_init);
+
+/* ---- CMU_PERIC0 --------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_PERIC0 (0x10800000) */
+#define PLL_CON0_MUX_CLKCMU_PERIC0_IP_USER	0x0600
+#define PLL_CON0_MUX_CLKCMU_PERIC0_NOC_USER	0x0610
+#define CLK_CON_MUX_MUX_CLK_PERIC0_I3C		0x1000
+#define CLK_CON_MUX_MUX_CLK_PERIC0_USI00_USI	0x1004
+#define CLK_CON_MUX_MUX_CLK_PERIC0_USI01_USI	0x1008
+#define CLK_CON_MUX_MUX_CLK_PERIC0_USI02_USI	0x100c
+#define CLK_CON_MUX_MUX_CLK_PERIC0_USI03_USI	0x1010
+#define CLK_CON_MUX_MUX_CLK_PERIC0_USI04_USI	0x1014
+#define CLK_CON_MUX_MUX_CLK_PERIC0_USI05_USI	0x1018
+#define CLK_CON_MUX_MUX_CLK_PERIC0_USI06_USI	0x101c
+#define CLK_CON_MUX_MUX_CLK_PERIC0_USI07_USI	0x1020
+#define CLK_CON_MUX_MUX_CLK_PERIC0_USI08_USI	0x1024
+#define CLK_CON_MUX_MUX_CLK_PERIC0_USI_I2C	0x1028
+#define CLK_CON_DIV_DIV_CLK_PERIC0_I3C		0x1800
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI00_USI	0x1804
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI01_USI	0x1808
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI02_USI	0x180c
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI03_USI	0x1810
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI04_USI	0x1814
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI05_USI	0x1818
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI06_USI	0x181c
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI07_USI	0x1820
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI08_USI	0x1824
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI_I2C	0x1828
+
+static const unsigned long peric0_clk_regs[] __initconst = {
+	PLL_CON0_MUX_CLKCMU_PERIC0_IP_USER,
+	PLL_CON0_MUX_CLKCMU_PERIC0_NOC_USER,
+	CLK_CON_MUX_MUX_CLK_PERIC0_I3C,
+	CLK_CON_MUX_MUX_CLK_PERIC0_USI00_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC0_USI01_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC0_USI02_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC0_USI03_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC0_USI04_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC0_USI05_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC0_USI06_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC0_USI07_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC0_USI08_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC0_USI_I2C,
+	CLK_CON_DIV_DIV_CLK_PERIC0_I3C,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI00_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI01_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI02_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI03_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI04_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI05_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI06_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI07_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI08_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI_I2C,
+};
+
+/* List of parent clocks for Muxes in CMU_PERIC0 */
+PNAME(mout_peric0_ip_user_p) = { "oscclk", "dout_clkcmu_peric0_ip" };
+PNAME(mout_peric0_noc_user_p) = { "oscclk", "dout_clkcmu_peric0_noc" };
+PNAME(mout_peric0_usi_p) = { "oscclk", "mout_peric0_ip_user" };
+
+static const struct samsung_mux_clock peric0_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_PERIC0_IP_USER, "mout_peric0_ip_user",
+	    mout_peric0_ip_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_IP_USER, 4, 1),
+	MUX(CLK_MOUT_PERIC0_NOC_USER, "mout_peric0_noc_user",
+	    mout_peric0_noc_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_NOC_USER, 4, 1),
+	/* USI00 ~ USI08 */
+	MUX(CLK_MOUT_PERIC0_USI00_USI, "mout_peric0_usi00_usi",
+	    mout_peric0_usi_p, CLK_CON_MUX_MUX_CLK_PERIC0_USI00_USI, 0, 1),
+	MUX(CLK_MOUT_PERIC0_USI01_USI, "mout_peric0_usi01_usi",
+	    mout_peric0_usi_p, CLK_CON_MUX_MUX_CLK_PERIC0_USI01_USI, 0, 1),
+	MUX(CLK_MOUT_PERIC0_USI02_USI, "mout_peric0_usi02_usi",
+	    mout_peric0_usi_p, CLK_CON_MUX_MUX_CLK_PERIC0_USI02_USI, 0, 1),
+	MUX(CLK_MOUT_PERIC0_USI03_USI, "mout_peric0_usi03_usi",
+	    mout_peric0_usi_p, CLK_CON_MUX_MUX_CLK_PERIC0_USI03_USI, 0, 1),
+	MUX(CLK_MOUT_PERIC0_USI04_USI, "mout_peric0_usi04_usi",
+	    mout_peric0_usi_p, CLK_CON_MUX_MUX_CLK_PERIC0_USI04_USI, 0, 1),
+	MUX(CLK_MOUT_PERIC0_USI05_USI, "mout_peric0_usi05_usi",
+	    mout_peric0_usi_p, CLK_CON_MUX_MUX_CLK_PERIC0_USI05_USI, 0, 1),
+	MUX(CLK_MOUT_PERIC0_USI06_USI, "mout_peric0_usi06_usi",
+	    mout_peric0_usi_p, CLK_CON_MUX_MUX_CLK_PERIC0_USI06_USI, 0, 1),
+	MUX(CLK_MOUT_PERIC0_USI07_USI, "mout_peric0_usi07_usi",
+	    mout_peric0_usi_p, CLK_CON_MUX_MUX_CLK_PERIC0_USI07_USI, 0, 1),
+	MUX(CLK_MOUT_PERIC0_USI08_USI, "mout_peric0_usi08_usi",
+	    mout_peric0_usi_p, CLK_CON_MUX_MUX_CLK_PERIC0_USI08_USI, 0, 1),
+	/* USI_I2C */
+	MUX(CLK_MOUT_PERIC0_USI_I2C, "mout_peric0_usi_i2c",
+	    mout_peric0_usi_p, CLK_CON_MUX_MUX_CLK_PERIC0_USI_I2C, 0, 1),
+	/* USI_I3C */
+	MUX(CLK_MOUT_PERIC0_I3C, "mout_peric0_i3c",
+	    mout_peric0_usi_p, CLK_CON_MUX_MUX_CLK_PERIC0_I3C, 0, 1),
+};
+
+static const struct samsung_div_clock peric0_div_clks[] __initconst = {
+	/* USI00 ~ USI08 */
+	DIV(CLK_DOUT_PERIC0_USI00_USI, "dout_peric0_usi00_usi",
+	    "mout_peric0_usi00_usi", CLK_CON_DIV_DIV_CLK_PERIC0_USI00_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC0_USI01_USI, "dout_peric0_usi01_usi",
+	    "mout_peric0_usi01_usi", CLK_CON_DIV_DIV_CLK_PERIC0_USI01_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC0_USI02_USI, "dout_peric0_usi02_usi",
+	    "mout_peric0_usi02_usi", CLK_CON_DIV_DIV_CLK_PERIC0_USI02_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC0_USI03_USI, "dout_peric0_usi03_usi",
+	    "mout_peric0_usi03_usi", CLK_CON_DIV_DIV_CLK_PERIC0_USI03_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC0_USI04_USI, "dout_peric0_usi04_usi",
+	    "mout_peric0_usi04_usi", CLK_CON_DIV_DIV_CLK_PERIC0_USI04_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC0_USI05_USI, "dout_peric0_usi05_usi",
+	    "mout_peric0_usi05_usi", CLK_CON_DIV_DIV_CLK_PERIC0_USI05_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC0_USI06_USI, "dout_peric0_usi06_usi",
+	    "mout_peric0_usi06_usi", CLK_CON_DIV_DIV_CLK_PERIC0_USI06_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC0_USI07_USI, "dout_peric0_usi07_usi",
+	    "mout_peric0_usi07_usi", CLK_CON_DIV_DIV_CLK_PERIC0_USI07_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC0_USI08_USI, "dout_peric0_usi08_usi",
+	    "mout_peric0_usi08_usi", CLK_CON_DIV_DIV_CLK_PERIC0_USI08_USI,
+	    0, 4),
+	/* USI_I2C */
+	DIV(CLK_DOUT_PERIC0_USI_I2C, "dout_peric0_usi_i2c",
+	    "mout_peric0_usi_i2c", CLK_CON_DIV_DIV_CLK_PERIC0_USI_I2C, 0, 4),
+	/* USI_I3C */
+	DIV(CLK_DOUT_PERIC0_I3C, "dout_peric0_i3c",
+	    "mout_peric0_i3c", CLK_CON_DIV_DIV_CLK_PERIC0_I3C, 0, 4),
+};
+
+static const struct samsung_cmu_info peric0_cmu_info __initconst = {
+	.mux_clks		= peric0_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(peric0_mux_clks),
+	.div_clks		= peric0_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(peric0_div_clks),
+	.nr_clk_ids		= CLKS_NR_PERIC0,
+	.clk_regs		= peric0_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(peric0_clk_regs),
+	.clk_name		= "dout_clkcmu_peric0_noc",
+};
+
+static int __init exynosautov920_cmu_probe(struct platform_device *pdev)
+{
+	const struct samsung_cmu_info *info;
+	struct device *dev = &pdev->dev;
+
+	info = of_device_get_match_data(dev);
+	exynos_arm64_register_cmu(dev, dev->of_node, info);
+
+	return 0;
+}
+
+static const struct of_device_id exynosautov920_cmu_of_match[] = {
+	{
+		.compatible = "samsung,exynosautov920-cmu-peric0",
+		.data = &peric0_cmu_info,
+	},
+};
+
+static struct platform_driver exynosautov920_cmu_driver __refdata = {
+	.driver = {
+		.name = "exynosautov920-cmu",
+		.of_match_table = exynosautov920_cmu_of_match,
+		.suppress_bind_attrs = true,
+	},
+	.probe = exynosautov920_cmu_probe,
+};
+
+static int __init exynosautov920_cmu_init(void)
+{
+	return platform_driver_register(&exynosautov920_cmu_driver);
+}
+core_initcall(exynosautov920_cmu_init);
-- 
2.45.2


