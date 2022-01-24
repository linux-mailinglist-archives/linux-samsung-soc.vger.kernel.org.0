Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A274A498236
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 24 Jan 2022 15:29:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238666AbiAXO30 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 24 Jan 2022 09:29:26 -0500
Received: from mailout3.samsung.com ([203.254.224.33]:41904 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238803AbiAXO3Y (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 24 Jan 2022 09:29:24 -0500
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220124142922epoutp03786a342f31fe66784f41ebac53de348d~NOzq8H3AX1227112271epoutp03e
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Jan 2022 14:29:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220124142922epoutp03786a342f31fe66784f41ebac53de348d~NOzq8H3AX1227112271epoutp03e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1643034562;
        bh=j9aTZhrih+PjTrp55yaGicTDrz1Y+HTbrGOna855YgA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ie7XE9dsX4jtS8N/guRS6PQw11sA0tkIUmk0Q4Yzu48mQSlF05IMtMnLNdugTZ/3f
         pIytJPlDKsA64Ta0bXKkb2I3v8HzUZilANb10Ngit7KIbc64hl5+wcKurlyk9M9yBM
         F98mig/Xd/VO0nbhtLrjy80vqHgSZhYChc8mQths=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas5p3.samsung.com (KnoxPortal) with ESMTP id
        20220124142921epcas5p3081c75ea8e435644c29e75aa7f74fe0e~NOzp6wFuG0627406274epcas5p3w;
        Mon, 24 Jan 2022 14:29:21 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.174]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4JjC6N2kTPz4x9Ps; Mon, 24 Jan
        2022 14:29:16 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
        epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        73.5D.46822.E56BEE16; Mon, 24 Jan 2022 23:23:27 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
        20220124142915epcas5p2c112efe9f08ffa2a53122f4e2b8042e1~NOzksUWT30974809748epcas5p2S;
        Mon, 24 Jan 2022 14:29:15 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220124142915epsmtrp297a06ccbcdeea6443e9e7cbe03f90c5e~NOzkq56iw1656816568epsmtrp2w;
        Mon, 24 Jan 2022 14:29:15 +0000 (GMT)
X-AuditID: b6c32a4a-de5ff7000000b6e6-1c-61eeb65e9389
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        81.EA.29871.BB7BEE16; Mon, 24 Jan 2022 23:29:15 +0900 (KST)
Received: from Jaguar.sa.corp.samsungelectronics.net (unknown
        [107.108.73.139]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220124142912epsmtip1c829b06aaa692ee0e30037bc0259ac26~NOzhjZMb71063810638epsmtip1f;
        Mon, 24 Jan 2022 14:29:12 +0000 (GMT)
From:   Alim Akhtar <alim.akhtar@samsung.com>
To:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net, arnd@arndb.de,
        linus.walleij@linaro.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
        s.nawrocki@samsung.com, linux-samsung-soc@vger.kernel.org,
        pankaj.dubey@samsung.com, sboyd@kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>, linux-fsd@tesla.com,
        Aswani Reddy <aswani.reddy@samsung.com>,
        Niyas Ahmed S T <niyas.ahmed@samsung.com>,
        Chandrasekar R <rcsekar@samsung.com>,
        Jayati Sahu <jayati.sahu@samsung.com>,
        Sriranjani P <sriranjani.p@samsung.com>,
        Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH v5 05/16] clk: samsung: fsd: Add cmu_peric block clock
 information
Date:   Mon, 24 Jan 2022 19:46:33 +0530
Message-Id: <20220124141644.71052-6-alim.akhtar@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220124141644.71052-1-alim.akhtar@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNJsWRmVeSWpSXmKPExsWy7bCmhm78tneJBntOMloceH+QxeLBvG1s
        Fn8nHWO3OLR5K7vF+2U9jBbzj5xjtThyagmTxca3P5gspvxZzmSx6fE1VouPPfdYLR6+Cre4
        vGsOm8WM8/uYLJ5MecRqcer6ZzaLRVu/sFvMurCD1aJ17xF2i8Nv2lkt/l3byGLx+PofNovb
        b9axOoh7rJm3htHj969JjB6zGnrZPDat6mTzuHNtD5vH5iX1HldONLF69G1Zxejxr2kuu8fn
        TXIBXFHZNhmpiSmpRQqpecn5KZl56bZK3sHxzvGmZgaGuoaWFuZKCnmJuam2Si4+AbpumTlA
        3yoplCXmlAKFAhKLi5X07WyK8ktLUhUy8otLbJVSC1JyCkwK9IoTc4tL89L18lJLrAwNDIxM
        gQoTsjO23/7HVHBmA2PF/h3eDYz9cxm7GDk5JARMJDqvL2TvYuTiEBLYzShx6OJ6VgjnE6PE
        q0UvmCGcb4wSpzbfZodpOTLpBgtEYi+jxMyTR6H6W5gkVqzZBDaYTUBb4u70LUwgtoiAm8SN
        xg4mkCJmgR8sEjdmPGQDSQgLhEhMmvgfzGYRUJW4/fMfC4jNK2AjMWHWNjaIdfISqzccYAax
        OQVsJeYt/MYEEX/CIXG4UxrCdpFYNu0tK4QtLPHq+BaoU6UkPr/bCzSHA8jOlujZZQwRrpFY
        Ou8YC4RtL3HgyhwWkBJmAU2J9bv0QcLMAnwSvb+fMEF08kp0tAlBVKtKNL+7CtUpLTGxuxtq
        qYfE7tZmaJhMYJRYePIv8wRG2VkIUxcwMq5ilEwtKM5NTy02LTDKSy2Hx1Ryfu4mRnAq1vLa
        wfjwwQe9Q4xMHIyHGCU4mJVEeKtS3iUK8aYkVlalFuXHF5XmpBYfYjQFhthEZinR5HxgNsgr
        iTc0sTQwMTMzM7E0NjNUEuc9nb4hUUggPbEkNTs1tSC1CKaPiYNTqoHJvH9p5955yr0Hj+ZK
        7RTd92LqLv3UWKvLjcYdnuu6/jAtn3X8Zyen2oPPxhtufwrKORyT1J99Irdq1URVxdjS9bc6
        w/xF7OSFs6z5vXmeHGrULNScPCNja+3DyyxvmPauf2RmuHfFDivr9Ml3Xoat9Hn6vpuZh6n9
        yI7+65F3al5NzXqkrNvOuLl0be7sn1LTit/O+JA5lW9ij76E/5MCf9vM6FSLXZfEjxv4aF86
        NWXu32s5SSnp5Rk8B1Ycm7EgROnR3KsRShMVP0p+rJDbcmzu1Add5/nnvBWYNd9uTVbqLdX8
        JMcDeV+l78QsnL0wKGmJ3GWj0JXGbn42tUJZrxJErM0SNG7su9SsnO6jxFKckWioxVxUnAgA
        kjhf+U4EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPLMWRmVeSWpSXmKPExsWy7bCSnO7u7e8SDeYdV7E48P4gi8WDedvY
        LP5OOsZucWjzVnaL98t6GC3mHznHanHk1BImi41vfzBZTPmznMli0+NrrBYfe+6xWjx8FW5x
        edccNosZ5/cxWTyZ8ojV4tT1z2wWi7Z+YbeYdWEHq0Xr3iPsFofftLNa/Lu2kcXi8fU/bBa3
        36xjdRD3WDNvDaPH71+TGD1mNfSyeWxa1cnmcefaHjaPzUvqPa6caGL16NuyitHjX9Ncdo/P
        m+QCuKK4bFJSczLLUov07RK4Mrbf/sdUcGYDY8X+Hd4NjP1zGbsYOTkkBEwkjky6wdLFyMUh
        JLCbUeLogzYWiIS0xPWNE9ghbGGJlf+es0MUNTFJtPbvACtiE9CWuDt9CxOILSLgIdH27x4z
        SBGzQB+rxP72b8wgCWGBIIkXN/eD2SwCqhK3f/4Da+YVsJGYMGsbG8QGeYnVGw6A1XAK2ErM
        W/gNaCgH0DYbiXO/VSYw8i1gZFjFKJlaUJybnltsWGCYl1quV5yYW1yal66XnJ+7iREcR1qa
        Oxi3r/qgd4iRiYPxEKMEB7OSCG9VyrtEId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rwXuk7GCwmk
        J5akZqemFqQWwWSZODilGpjaJzcs/vsy909TC8PySS5NL7YEXOBgirT49jDM7sD5/3N3nXq1
        O96o7wybZZH6++ufH58Tr2Xse7xEuuLyRT/PKYGWe/eIpXWwvHuR3+e45enc3nJT3UfaJ3eo
        yFXfvmL+/M3HE9XK8wujNy5T+XZgQmT4jJ/2ein/tDfMOMVTd07+6OkJS6ZsUHSRTO4rj1Dn
        7WV66XTfvSbSUTV0Aad47XX34I65bI+e/E4sfMK0o++DQ1zFVuPSm078wSmxIp+znXL4H95Y
        MuffwUs1CXrHVh6fFJJlIjz5xQXFM5rb+g/s0WL/ZLB3ldDpqssar5vMvmUlSVtZ8+9yf/L6
        CfdSc1PRUL3Od/a33KpjbKcpsRRnJBpqMRcVJwIA851YHxIDAAA=
X-CMS-MailID: 20220124142915epcas5p2c112efe9f08ffa2a53122f4e2b8042e1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220124142915epcas5p2c112efe9f08ffa2a53122f4e2b8042e1
References: <20220124141644.71052-1-alim.akhtar@samsung.com>
        <CGME20220124142915epcas5p2c112efe9f08ffa2a53122f4e2b8042e1@epcas5p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add CMU_PERIC block clock information needed for various IPs
functions found in this block.

Cc: linux-fsd@tesla.com
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Signed-off-by: Aswani Reddy <aswani.reddy@samsung.com>
Signed-off-by: Niyas Ahmed S T <niyas.ahmed@samsung.com>
Signed-off-by: Chandrasekar R <rcsekar@samsung.com>
Signed-off-by: Jayati Sahu <jayati.sahu@samsung.com>
Signed-off-by: Sriranjani P <sriranjani.p@samsung.com>
Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 drivers/clk/samsung/clk-fsd.c | 405 ++++++++++++++++++++++++++++++++++
 1 file changed, 405 insertions(+)

diff --git a/drivers/clk/samsung/clk-fsd.c b/drivers/clk/samsung/clk-fsd.c
index ae35c4303b55..a3d328318814 100644
--- a/drivers/clk/samsung/clk-fsd.c
+++ b/drivers/clk/samsung/clk-fsd.c
@@ -8,14 +8,19 @@
  * Common Clock Framework support for FSD SoC.
  */
 
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
 
 #include <dt-bindings/clock/fsd-clk.h>
 
 #include "clk.h"
+#include "clk-exynos-arm64.h"
 
 /* Register Offset definitions for CMU_CMU (0x11c10000) */
 #define PLL_LOCKTIME_PLL_SHARED0			0x0
@@ -308,3 +313,403 @@ static void __init fsd_clk_cmu_init(struct device_node *np)
 }
 
 CLK_OF_DECLARE(fsd_clk_cmu, "tesla,fsd-clock-cmu", fsd_clk_cmu_init);
+
+/* Register Offset definitions for CMU_PERIC (0x14010000) */
+#define PLL_CON0_PERIC_DMACLK_MUX		0x100
+#define PLL_CON0_PERIC_EQOS_BUSCLK_MUX		0x120
+#define PLL_CON0_PERIC_PCLK_MUX			0x140
+#define PLL_CON0_PERIC_TBUCLK_MUX		0x160
+#define PLL_CON0_SPI_CLK			0x180
+#define PLL_CON0_SPI_PCLK			0x1a0
+#define PLL_CON0_UART_CLK			0x1c0
+#define PLL_CON0_UART_PCLK			0x1e0
+#define MUX_PERIC_EQOS_PHYRXCLK			0x1000
+#define DIV_EQOS_BUSCLK				0x1800
+#define DIV_PERIC_MCAN_CLK			0x1804
+#define DIV_RGMII_CLK				0x1808
+#define DIV_RII_CLK				0x180c
+#define DIV_RMII_CLK				0x1810
+#define DIV_SPI_CLK				0x1814
+#define DIV_UART_CLK				0x1818
+#define GAT_EQOS_TOP_IPCLKPORT_CLK_PTP_REF_I	0x2000
+#define GAT_GPIO_PERIC_IPCLKPORT_OSCCLK		0x2004
+#define GAT_PERIC_ADC0_IPCLKPORT_I_OSCCLK	0x2008
+#define GAT_PERIC_CMU_PERIC_IPCLKPORT_PCLK	0x200c
+#define GAT_PERIC_PWM0_IPCLKPORT_I_OSCCLK	0x2010
+#define GAT_PERIC_PWM1_IPCLKPORT_I_OSCCLK	0x2014
+#define GAT_ASYNC_APB_DMA0_IPCLKPORT_PCLKM	0x2018
+#define GAT_ASYNC_APB_DMA0_IPCLKPORT_PCLKS	0x201c
+#define GAT_ASYNC_APB_DMA1_IPCLKPORT_PCLKM	0x2020
+#define GAT_ASYNC_APB_DMA1_IPCLKPORT_PCLKS	0x2024
+#define GAT_AXI2APB_PERIC0_IPCLKPORT_ACLK	0x2028
+#define GAT_AXI2APB_PERIC1_IPCLKPORT_ACLK	0x202c
+#define GAT_AXI2APB_PERIC2_IPCLKPORT_ACLK	0x2030
+#define GAT_BUS_D_PERIC_IPCLKPORT_DMACLK	0x2034
+#define GAT_BUS_D_PERIC_IPCLKPORT_EQOSCLK	0x2038
+#define GAT_BUS_D_PERIC_IPCLKPORT_MAINCLK	0x203c
+#define GAT_BUS_P_PERIC_IPCLKPORT_EQOSCLK	0x2040
+#define GAT_BUS_P_PERIC_IPCLKPORT_MAINCLK	0x2044
+#define GAT_BUS_P_PERIC_IPCLKPORT_SMMUCLK	0x2048
+#define GAT_EQOS_TOP_IPCLKPORT_ACLK_I		0x204c
+#define GAT_EQOS_TOP_IPCLKPORT_CLK_RX_I		0x2050
+#define GAT_EQOS_TOP_IPCLKPORT_HCLK_I		0x2054
+#define GAT_EQOS_TOP_IPCLKPORT_RGMII_CLK_I	0x2058
+#define GAT_EQOS_TOP_IPCLKPORT_RII_CLK_I	0x205c
+#define GAT_EQOS_TOP_IPCLKPORT_RMII_CLK_I	0x2060
+#define GAT_GPIO_PERIC_IPCLKPORT_PCLK		0x2064
+#define GAT_NS_BRDG_PERIC_IPCLKPORT_CLK__PSOC_PERIC__CLK_PERIC_D	0x2068
+#define GAT_NS_BRDG_PERIC_IPCLKPORT_CLK__PSOC_PERIC__CLK_PERIC_P	0x206c
+#define GAT_PERIC_ADC0_IPCLKPORT_PCLK_S0	0x2070
+#define GAT_PERIC_DMA0_IPCLKPORT_ACLK		0x2074
+#define GAT_PERIC_DMA1_IPCLKPORT_ACLK		0x2078
+#define GAT_PERIC_I2C0_IPCLKPORT_I_PCLK		0x207c
+#define GAT_PERIC_I2C1_IPCLKPORT_I_PCLK		0x2080
+#define GAT_PERIC_I2C2_IPCLKPORT_I_PCLK		0x2084
+#define GAT_PERIC_I2C3_IPCLKPORT_I_PCLK		0x2088
+#define GAT_PERIC_I2C4_IPCLKPORT_I_PCLK		0x208c
+#define GAT_PERIC_I2C5_IPCLKPORT_I_PCLK		0x2090
+#define GAT_PERIC_I2C6_IPCLKPORT_I_PCLK		0x2094
+#define GAT_PERIC_I2C7_IPCLKPORT_I_PCLK		0x2098
+#define GAT_PERIC_MCAN0_IPCLKPORT_CCLK		0x209c
+#define GAT_PERIC_MCAN0_IPCLKPORT_PCLK		0x20a0
+#define GAT_PERIC_MCAN1_IPCLKPORT_CCLK		0x20a4
+#define GAT_PERIC_MCAN1_IPCLKPORT_PCLK		0x20a8
+#define GAT_PERIC_MCAN2_IPCLKPORT_CCLK		0x20ac
+#define GAT_PERIC_MCAN2_IPCLKPORT_PCLK		0x20b0
+#define GAT_PERIC_MCAN3_IPCLKPORT_CCLK		0x20b4
+#define GAT_PERIC_MCAN3_IPCLKPORT_PCLK		0x20b8
+#define GAT_PERIC_PWM0_IPCLKPORT_I_PCLK_S0	0x20bc
+#define GAT_PERIC_PWM1_IPCLKPORT_I_PCLK_S0	0x20c0
+#define GAT_PERIC_SMMU_IPCLKPORT_CCLK		0x20c4
+#define GAT_PERIC_SMMU_IPCLKPORT_PERIC_BCLK	0x20c8
+#define GAT_PERIC_SPI0_IPCLKPORT_I_PCLK		0x20cc
+#define GAT_PERIC_SPI0_IPCLKPORT_I_SCLK_SPI	0x20d0
+#define GAT_PERIC_SPI1_IPCLKPORT_I_PCLK		0x20d4
+#define GAT_PERIC_SPI1_IPCLKPORT_I_SCLK_SPI	0x20d8
+#define GAT_PERIC_SPI2_IPCLKPORT_I_PCLK		0x20dc
+#define GAT_PERIC_SPI2_IPCLKPORT_I_SCLK_SPI	0x20e0
+#define GAT_PERIC_TDM0_IPCLKPORT_HCLK_M		0x20e4
+#define GAT_PERIC_TDM0_IPCLKPORT_PCLK		0x20e8
+#define GAT_PERIC_TDM1_IPCLKPORT_HCLK_M		0x20ec
+#define GAT_PERIC_TDM1_IPCLKPORT_PCLK		0x20f0
+#define GAT_PERIC_UART0_IPCLKPORT_I_SCLK_UART	0x20f4
+#define GAT_PERIC_UART0_IPCLKPORT_PCLK		0x20f8
+#define GAT_PERIC_UART1_IPCLKPORT_I_SCLK_UART	0x20fc
+#define GAT_PERIC_UART1_IPCLKPORT_PCLK		0x2100
+#define GAT_SYSREG_PERI_IPCLKPORT_PCLK		0x2104
+
+static const unsigned long peric_clk_regs[] __initconst = {
+	PLL_CON0_PERIC_DMACLK_MUX,
+	PLL_CON0_PERIC_EQOS_BUSCLK_MUX,
+	PLL_CON0_PERIC_PCLK_MUX,
+	PLL_CON0_PERIC_TBUCLK_MUX,
+	PLL_CON0_SPI_CLK,
+	PLL_CON0_SPI_PCLK,
+	PLL_CON0_UART_CLK,
+	PLL_CON0_UART_PCLK,
+	MUX_PERIC_EQOS_PHYRXCLK,
+	DIV_EQOS_BUSCLK,
+	DIV_PERIC_MCAN_CLK,
+	DIV_RGMII_CLK,
+	DIV_RII_CLK,
+	DIV_RMII_CLK,
+	DIV_SPI_CLK,
+	DIV_UART_CLK,
+	GAT_EQOS_TOP_IPCLKPORT_CLK_PTP_REF_I,
+	GAT_GPIO_PERIC_IPCLKPORT_OSCCLK,
+	GAT_PERIC_ADC0_IPCLKPORT_I_OSCCLK,
+	GAT_PERIC_CMU_PERIC_IPCLKPORT_PCLK,
+	GAT_PERIC_PWM0_IPCLKPORT_I_OSCCLK,
+	GAT_PERIC_PWM1_IPCLKPORT_I_OSCCLK,
+	GAT_ASYNC_APB_DMA0_IPCLKPORT_PCLKM,
+	GAT_ASYNC_APB_DMA0_IPCLKPORT_PCLKS,
+	GAT_ASYNC_APB_DMA1_IPCLKPORT_PCLKM,
+	GAT_ASYNC_APB_DMA1_IPCLKPORT_PCLKS,
+	GAT_AXI2APB_PERIC0_IPCLKPORT_ACLK,
+	GAT_AXI2APB_PERIC1_IPCLKPORT_ACLK,
+	GAT_AXI2APB_PERIC2_IPCLKPORT_ACLK,
+	GAT_BUS_D_PERIC_IPCLKPORT_DMACLK,
+	GAT_BUS_D_PERIC_IPCLKPORT_EQOSCLK,
+	GAT_BUS_D_PERIC_IPCLKPORT_MAINCLK,
+	GAT_BUS_P_PERIC_IPCLKPORT_EQOSCLK,
+	GAT_BUS_P_PERIC_IPCLKPORT_MAINCLK,
+	GAT_BUS_P_PERIC_IPCLKPORT_SMMUCLK,
+	GAT_EQOS_TOP_IPCLKPORT_ACLK_I,
+	GAT_EQOS_TOP_IPCLKPORT_CLK_RX_I,
+	GAT_EQOS_TOP_IPCLKPORT_HCLK_I,
+	GAT_EQOS_TOP_IPCLKPORT_RGMII_CLK_I,
+	GAT_EQOS_TOP_IPCLKPORT_RII_CLK_I,
+	GAT_EQOS_TOP_IPCLKPORT_RMII_CLK_I,
+	GAT_GPIO_PERIC_IPCLKPORT_PCLK,
+	GAT_NS_BRDG_PERIC_IPCLKPORT_CLK__PSOC_PERIC__CLK_PERIC_D,
+	GAT_NS_BRDG_PERIC_IPCLKPORT_CLK__PSOC_PERIC__CLK_PERIC_P,
+	GAT_PERIC_ADC0_IPCLKPORT_PCLK_S0,
+	GAT_PERIC_DMA0_IPCLKPORT_ACLK,
+	GAT_PERIC_DMA1_IPCLKPORT_ACLK,
+	GAT_PERIC_I2C0_IPCLKPORT_I_PCLK,
+	GAT_PERIC_I2C1_IPCLKPORT_I_PCLK,
+	GAT_PERIC_I2C2_IPCLKPORT_I_PCLK,
+	GAT_PERIC_I2C3_IPCLKPORT_I_PCLK,
+	GAT_PERIC_I2C4_IPCLKPORT_I_PCLK,
+	GAT_PERIC_I2C5_IPCLKPORT_I_PCLK,
+	GAT_PERIC_I2C6_IPCLKPORT_I_PCLK,
+	GAT_PERIC_I2C7_IPCLKPORT_I_PCLK,
+	GAT_PERIC_MCAN0_IPCLKPORT_CCLK,
+	GAT_PERIC_MCAN0_IPCLKPORT_PCLK,
+	GAT_PERIC_MCAN1_IPCLKPORT_CCLK,
+	GAT_PERIC_MCAN1_IPCLKPORT_PCLK,
+	GAT_PERIC_MCAN2_IPCLKPORT_CCLK,
+	GAT_PERIC_MCAN2_IPCLKPORT_PCLK,
+	GAT_PERIC_MCAN3_IPCLKPORT_CCLK,
+	GAT_PERIC_MCAN3_IPCLKPORT_PCLK,
+	GAT_PERIC_PWM0_IPCLKPORT_I_PCLK_S0,
+	GAT_PERIC_PWM1_IPCLKPORT_I_PCLK_S0,
+	GAT_PERIC_SMMU_IPCLKPORT_CCLK,
+	GAT_PERIC_SMMU_IPCLKPORT_PERIC_BCLK,
+	GAT_PERIC_SPI0_IPCLKPORT_I_PCLK,
+	GAT_PERIC_SPI0_IPCLKPORT_I_SCLK_SPI,
+	GAT_PERIC_SPI1_IPCLKPORT_I_PCLK,
+	GAT_PERIC_SPI1_IPCLKPORT_I_SCLK_SPI,
+	GAT_PERIC_SPI2_IPCLKPORT_I_PCLK,
+	GAT_PERIC_SPI2_IPCLKPORT_I_SCLK_SPI,
+	GAT_PERIC_TDM0_IPCLKPORT_HCLK_M,
+	GAT_PERIC_TDM0_IPCLKPORT_PCLK,
+	GAT_PERIC_TDM1_IPCLKPORT_HCLK_M,
+	GAT_PERIC_TDM1_IPCLKPORT_PCLK,
+	GAT_PERIC_UART0_IPCLKPORT_I_SCLK_UART,
+	GAT_PERIC_UART0_IPCLKPORT_PCLK,
+	GAT_PERIC_UART1_IPCLKPORT_I_SCLK_UART,
+	GAT_PERIC_UART1_IPCLKPORT_PCLK,
+	GAT_SYSREG_PERI_IPCLKPORT_PCLK,
+};
+
+static const struct samsung_fixed_rate_clock peric_fixed_clks[] __initconst = {
+	FRATE(PERIC_EQOS_PHYRXCLK, "eqos_phyrxclk", NULL, 0, 125000000),
+};
+
+/* List of parent clocks for Muxes in CMU_PERIC */
+PNAME(mout_peric_dmaclk_p) = { "fin_pll", "cmu_peric_shared1div4_dmaclk_gate" };
+PNAME(mout_peric_eqos_busclk_p) = { "fin_pll", "dout_cmu_pll_shared0_div4" };
+PNAME(mout_peric_pclk_p) = { "fin_pll", "dout_cmu_peric_shared1div36" };
+PNAME(mout_peric_tbuclk_p) = { "fin_pll", "dout_cmu_peric_shared0div3_tbuclk" };
+PNAME(mout_peric_spi_clk_p) = { "fin_pll", "dout_cmu_peric_shared0div20" };
+PNAME(mout_peric_spi_pclk_p) = { "fin_pll", "dout_cmu_peric_shared1div36" };
+PNAME(mout_peric_uart_clk_p) = { "fin_pll", "dout_cmu_peric_shared1div4_dmaclk" };
+PNAME(mout_peric_uart_pclk_p) = { "fin_pll", "dout_cmu_peric_shared1div36" };
+PNAME(mout_peric_eqos_phyrxclk_p) = { "dout_peric_rgmii_clk", "eqos_phyrxclk" };
+
+static const struct samsung_mux_clock peric_mux_clks[] __initconst = {
+	MUX(0, "mout_peric_dmaclk", mout_peric_dmaclk_p, PLL_CON0_PERIC_DMACLK_MUX, 4, 1),
+	MUX(0, "mout_peric_eqos_busclk", mout_peric_eqos_busclk_p,
+	    PLL_CON0_PERIC_EQOS_BUSCLK_MUX, 4, 1),
+	MUX(0, "mout_peric_pclk", mout_peric_pclk_p, PLL_CON0_PERIC_PCLK_MUX, 4, 1),
+	MUX(0, "mout_peric_tbuclk", mout_peric_tbuclk_p, PLL_CON0_PERIC_TBUCLK_MUX, 4, 1),
+	MUX(0, "mout_peric_spi_clk", mout_peric_spi_clk_p, PLL_CON0_SPI_CLK, 4, 1),
+	MUX(0, "mout_peric_spi_pclk", mout_peric_spi_pclk_p, PLL_CON0_SPI_PCLK, 4, 1),
+	MUX(0, "mout_peric_uart_clk", mout_peric_uart_clk_p, PLL_CON0_UART_CLK, 4, 1),
+	MUX(0, "mout_peric_uart_pclk", mout_peric_uart_pclk_p, PLL_CON0_UART_PCLK, 4, 1),
+	MUX(PERIC_EQOS_PHYRXCLK_MUX, "mout_peric_eqos_phyrxclk", mout_peric_eqos_phyrxclk_p,
+		MUX_PERIC_EQOS_PHYRXCLK, 0, 1),
+};
+
+static const struct samsung_div_clock peric_div_clks[] __initconst = {
+	DIV(0, "dout_peric_eqos_busclk", "mout_peric_eqos_busclk", DIV_EQOS_BUSCLK, 0, 4),
+	DIV(0, "dout_peric_mcan_clk", "mout_peric_dmaclk", DIV_PERIC_MCAN_CLK, 0, 4),
+	DIV(PERIC_DOUT_RGMII_CLK, "dout_peric_rgmii_clk", "mout_peric_eqos_busclk",
+		DIV_RGMII_CLK, 0, 4),
+	DIV(0, "dout_peric_rii_clk", "dout_peric_rmii_clk", DIV_RII_CLK, 0, 4),
+	DIV(0, "dout_peric_rmii_clk", "dout_peric_rgmii_clk", DIV_RMII_CLK, 0, 4),
+	DIV(0, "dout_peric_spi_clk", "mout_peric_spi_clk", DIV_SPI_CLK, 0, 6),
+	DIV(0, "dout_peric_uart_clk", "mout_peric_uart_clk", DIV_UART_CLK, 0, 6),
+};
+
+static const struct samsung_gate_clock peric_gate_clks[] __initconst = {
+	GATE(PERIC_EQOS_TOP_IPCLKPORT_CLK_PTP_REF_I, "peric_eqos_top_ipclkport_clk_ptp_ref_i",
+	     "fin_pll", GAT_EQOS_TOP_IPCLKPORT_CLK_PTP_REF_I, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(0, "peric_gpio_peric_ipclkport_oscclk", "fin_pll", GAT_GPIO_PERIC_IPCLKPORT_OSCCLK,
+	     21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_PCLK_ADCIF, "peric_adc0_ipclkport_i_oscclk", "fin_pll",
+	     GAT_PERIC_ADC0_IPCLKPORT_I_OSCCLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(0, "peric_cmu_peric_ipclkport_pclk", "mout_peric_pclk",
+	     GAT_PERIC_CMU_PERIC_IPCLKPORT_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(0, "peric_pwm0_ipclkport_i_oscclk", "fin_pll", GAT_PERIC_PWM0_IPCLKPORT_I_OSCCLK, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(0, "peric_pwm1_ipclkport_i_oscclk", "fin_pll", GAT_PERIC_PWM1_IPCLKPORT_I_OSCCLK, 21,
+	     CLK_IGNORE_UNUSED, 0),
+	GATE(0, "peric_async_apb_dma0_ipclkport_pclkm", "mout_peric_dmaclk",
+	     GAT_ASYNC_APB_DMA0_IPCLKPORT_PCLKM, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(0, "peric_async_apb_dma0_ipclkport_pclks", "mout_peric_pclk",
+	     GAT_ASYNC_APB_DMA0_IPCLKPORT_PCLKS, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(0, "peric_async_apb_dma1_ipclkport_pclkm", "mout_peric_dmaclk",
+	     GAT_ASYNC_APB_DMA1_IPCLKPORT_PCLKM, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(0, "peric_async_apb_dma1_ipclkport_pclks", "mout_peric_pclk",
+	     GAT_ASYNC_APB_DMA1_IPCLKPORT_PCLKS, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(0, "peric_axi2apb_peric0_ipclkport_aclk", "mout_peric_pclk",
+	     GAT_AXI2APB_PERIC0_IPCLKPORT_ACLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(0, "peric_axi2apb_peric1_ipclkport_aclk", "mout_peric_pclk",
+	     GAT_AXI2APB_PERIC1_IPCLKPORT_ACLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(0, "peric_axi2apb_peric2_ipclkport_aclk", "mout_peric_pclk",
+	     GAT_AXI2APB_PERIC2_IPCLKPORT_ACLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(0, "peric_bus_d_peric_ipclkport_dmaclk", "mout_peric_dmaclk",
+	     GAT_BUS_D_PERIC_IPCLKPORT_DMACLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_BUS_D_PERIC_IPCLKPORT_EQOSCLK, "peric_bus_d_peric_ipclkport_eqosclk",
+	     "dout_peric_eqos_busclk", GAT_BUS_D_PERIC_IPCLKPORT_EQOSCLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(0, "peric_bus_d_peric_ipclkport_mainclk", "mout_peric_tbuclk",
+	     GAT_BUS_D_PERIC_IPCLKPORT_MAINCLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_BUS_P_PERIC_IPCLKPORT_EQOSCLK, "peric_bus_p_peric_ipclkport_eqosclk",
+	     "dout_peric_eqos_busclk", GAT_BUS_P_PERIC_IPCLKPORT_EQOSCLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(0, "peric_bus_p_peric_ipclkport_mainclk", "mout_peric_pclk",
+	     GAT_BUS_P_PERIC_IPCLKPORT_MAINCLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(0, "peric_bus_p_peric_ipclkport_smmuclk", "mout_peric_tbuclk",
+	     GAT_BUS_P_PERIC_IPCLKPORT_SMMUCLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_EQOS_TOP_IPCLKPORT_ACLK_I, "peric_eqos_top_ipclkport_aclk_i",
+	     "dout_peric_eqos_busclk", GAT_EQOS_TOP_IPCLKPORT_ACLK_I, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_EQOS_TOP_IPCLKPORT_CLK_RX_I, "peric_eqos_top_ipclkport_clk_rx_i",
+	     "mout_peric_eqos_phyrxclk", GAT_EQOS_TOP_IPCLKPORT_CLK_RX_I, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_EQOS_TOP_IPCLKPORT_HCLK_I, "peric_eqos_top_ipclkport_hclk_i",
+	     "dout_peric_eqos_busclk", GAT_EQOS_TOP_IPCLKPORT_HCLK_I, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_EQOS_TOP_IPCLKPORT_RGMII_CLK_I, "peric_eqos_top_ipclkport_rgmii_clk_i",
+	     "dout_peric_rgmii_clk", GAT_EQOS_TOP_IPCLKPORT_RGMII_CLK_I, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(0, "peric_eqos_top_ipclkport_rii_clk_i", "dout_peric_rii_clk",
+	     GAT_EQOS_TOP_IPCLKPORT_RII_CLK_I, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(0, "peric_eqos_top_ipclkport_rmii_clk_i", "dout_peric_rmii_clk",
+	     GAT_EQOS_TOP_IPCLKPORT_RMII_CLK_I, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(0, "peric_gpio_peric_ipclkport_pclk", "mout_peric_pclk",
+	     GAT_GPIO_PERIC_IPCLKPORT_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(0, "peric_ns_brdg_peric_ipclkport_clk__psoc_peric__clk_peric_d", "mout_peric_tbuclk",
+	     GAT_NS_BRDG_PERIC_IPCLKPORT_CLK__PSOC_PERIC__CLK_PERIC_D, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(0, "peric_ns_brdg_peric_ipclkport_clk__psoc_peric__clk_peric_p", "mout_peric_pclk",
+	     GAT_NS_BRDG_PERIC_IPCLKPORT_CLK__PSOC_PERIC__CLK_PERIC_P, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(0, "peric_adc0_ipclkport_pclk_s0", "mout_peric_pclk",
+	     GAT_PERIC_ADC0_IPCLKPORT_PCLK_S0, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_DMA0_IPCLKPORT_ACLK, "peric_dma0_ipclkport_aclk", "mout_peric_dmaclk",
+	     GAT_PERIC_DMA0_IPCLKPORT_ACLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_DMA1_IPCLKPORT_ACLK, "peric_dma1_ipclkport_aclk", "mout_peric_dmaclk",
+	     GAT_PERIC_DMA1_IPCLKPORT_ACLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_PCLK_HSI2C0, "peric_i2c0_ipclkport_i_pclk", "mout_peric_pclk",
+	     GAT_PERIC_I2C0_IPCLKPORT_I_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_PCLK_HSI2C1, "peric_i2c1_ipclkport_i_pclk", "mout_peric_pclk",
+	     GAT_PERIC_I2C1_IPCLKPORT_I_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_PCLK_HSI2C2, "peric_i2c2_ipclkport_i_pclk", "mout_peric_pclk",
+	     GAT_PERIC_I2C2_IPCLKPORT_I_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_PCLK_HSI2C3, "peric_i2c3_ipclkport_i_pclk", "mout_peric_pclk",
+	     GAT_PERIC_I2C3_IPCLKPORT_I_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_PCLK_HSI2C4, "peric_i2c4_ipclkport_i_pclk", "mout_peric_pclk",
+	     GAT_PERIC_I2C4_IPCLKPORT_I_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_PCLK_HSI2C5, "peric_i2c5_ipclkport_i_pclk", "mout_peric_pclk",
+	     GAT_PERIC_I2C5_IPCLKPORT_I_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_PCLK_HSI2C6, "peric_i2c6_ipclkport_i_pclk", "mout_peric_pclk",
+	     GAT_PERIC_I2C6_IPCLKPORT_I_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_PCLK_HSI2C7, "peric_i2c7_ipclkport_i_pclk", "mout_peric_pclk",
+	     GAT_PERIC_I2C7_IPCLKPORT_I_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_MCAN0_IPCLKPORT_CCLK, "peric_mcan0_ipclkport_cclk", "dout_peric_mcan_clk",
+	     GAT_PERIC_MCAN0_IPCLKPORT_CCLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_MCAN0_IPCLKPORT_PCLK, "peric_mcan0_ipclkport_pclk", "mout_peric_pclk",
+	     GAT_PERIC_MCAN0_IPCLKPORT_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_MCAN1_IPCLKPORT_CCLK, "peric_mcan1_ipclkport_cclk", "dout_peric_mcan_clk",
+	     GAT_PERIC_MCAN1_IPCLKPORT_CCLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_MCAN1_IPCLKPORT_PCLK, "peric_mcan1_ipclkport_pclk", "mout_peric_pclk",
+	     GAT_PERIC_MCAN1_IPCLKPORT_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_MCAN2_IPCLKPORT_CCLK, "peric_mcan2_ipclkport_cclk", "dout_peric_mcan_clk",
+	     GAT_PERIC_MCAN2_IPCLKPORT_CCLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_MCAN2_IPCLKPORT_PCLK, "peric_mcan2_ipclkport_pclk", "mout_peric_pclk",
+	     GAT_PERIC_MCAN2_IPCLKPORT_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_MCAN3_IPCLKPORT_CCLK, "peric_mcan3_ipclkport_cclk", "dout_peric_mcan_clk",
+	     GAT_PERIC_MCAN3_IPCLKPORT_CCLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_MCAN3_IPCLKPORT_PCLK, "peric_mcan3_ipclkport_pclk", "mout_peric_pclk",
+	     GAT_PERIC_MCAN3_IPCLKPORT_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_PWM0_IPCLKPORT_I_PCLK_S0, "peric_pwm0_ipclkport_i_pclk_s0", "mout_peric_pclk",
+	     GAT_PERIC_PWM0_IPCLKPORT_I_PCLK_S0, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_PWM1_IPCLKPORT_I_PCLK_S0, "peric_pwm1_ipclkport_i_pclk_s0", "mout_peric_pclk",
+	     GAT_PERIC_PWM1_IPCLKPORT_I_PCLK_S0, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(0, "peric_smmu_ipclkport_cclk", "mout_peric_tbuclk",
+	     GAT_PERIC_SMMU_IPCLKPORT_CCLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(0, "peric_smmu_ipclkport_peric_bclk", "mout_peric_tbuclk",
+	     GAT_PERIC_SMMU_IPCLKPORT_PERIC_BCLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_PCLK_SPI0, "peric_spi0_ipclkport_i_pclk", "mout_peric_spi_pclk",
+	     GAT_PERIC_SPI0_IPCLKPORT_I_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_SCLK_SPI0, "peric_spi0_ipclkport_i_sclk_spi", "dout_peric_spi_clk",
+	     GAT_PERIC_SPI0_IPCLKPORT_I_SCLK_SPI, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_PCLK_SPI1, "peric_spi1_ipclkport_i_pclk", "mout_peric_spi_pclk",
+	     GAT_PERIC_SPI1_IPCLKPORT_I_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_SCLK_SPI1, "peric_spi1_ipclkport_i_sclk_spi", "dout_peric_spi_clk",
+	     GAT_PERIC_SPI1_IPCLKPORT_I_SCLK_SPI, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_PCLK_SPI2, "peric_spi2_ipclkport_i_pclk", "mout_peric_spi_pclk",
+	     GAT_PERIC_SPI2_IPCLKPORT_I_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_SCLK_SPI2, "peric_spi2_ipclkport_i_sclk_spi", "dout_peric_spi_clk",
+	     GAT_PERIC_SPI2_IPCLKPORT_I_SCLK_SPI, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_HCLK_TDM0, "peric_tdm0_ipclkport_hclk_m", "mout_peric_pclk",
+	     GAT_PERIC_TDM0_IPCLKPORT_HCLK_M, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_PCLK_TDM0, "peric_tdm0_ipclkport_pclk", "mout_peric_pclk",
+	     GAT_PERIC_TDM0_IPCLKPORT_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_HCLK_TDM1, "peric_tdm1_ipclkport_hclk_m", "mout_peric_pclk",
+	     GAT_PERIC_TDM1_IPCLKPORT_HCLK_M, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_PCLK_TDM1, "peric_tdm1_ipclkport_pclk", "mout_peric_pclk",
+	     GAT_PERIC_TDM1_IPCLKPORT_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_SCLK_UART0, "peric_uart0_ipclkport_i_sclk_uart", "dout_peric_uart_clk",
+	     GAT_PERIC_UART0_IPCLKPORT_I_SCLK_UART, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_PCLK_UART0, "peric_uart0_ipclkport_pclk", "mout_peric_uart_pclk",
+	     GAT_PERIC_UART0_IPCLKPORT_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_SCLK_UART1, "peric_uart1_ipclkport_i_sclk_uart", "dout_peric_uart_clk",
+	     GAT_PERIC_UART1_IPCLKPORT_I_SCLK_UART, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(PERIC_PCLK_UART1, "peric_uart1_ipclkport_pclk", "mout_peric_uart_pclk",
+	     GAT_PERIC_UART1_IPCLKPORT_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(0, "peric_sysreg_peri_ipclkport_pclk", "mout_peric_pclk",
+	     GAT_SYSREG_PERI_IPCLKPORT_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+};
+
+static const struct samsung_cmu_info peric_cmu_info __initconst = {
+	.mux_clks		= peric_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(peric_mux_clks),
+	.div_clks		= peric_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(peric_div_clks),
+	.gate_clks		= peric_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(peric_gate_clks),
+	.fixed_clks		= peric_fixed_clks,
+	.nr_fixed_clks		= ARRAY_SIZE(peric_fixed_clks),
+	.nr_clk_ids		= PERIC_NR_CLK,
+	.clk_regs		= peric_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(peric_clk_regs),
+	.clk_name		= "dout_cmu_pll_shared0_div4",
+};
+
+/**
+ * fsd_cmu_probe - Probe function for FSD platform clocks
+ * @pdev: Pointer to platform device
+ *
+ * Configure clock hierarchy for clock domains of FSD platform
+ */
+static int __init fsd_cmu_probe(struct platform_device *pdev)
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
+/* CMUs which belong to Power Domains and need runtime PM to be implemented */
+static const struct of_device_id fsd_cmu_of_match[] = {
+	{
+		.compatible = "tesla,fsd-clock-peric",
+		.data = &peric_cmu_info,
+	}, {
+	},
+};
+
+static struct platform_driver fsd_cmu_driver __refdata = {
+	.driver	= {
+		.name = "fsd-cmu",
+		.of_match_table = fsd_cmu_of_match,
+		.suppress_bind_attrs = true,
+	},
+	.probe = fsd_cmu_probe,
+};
+
+static int __init fsd_cmu_init(void)
+{
+	return platform_driver_register(&fsd_cmu_driver);
+}
+core_initcall(fsd_cmu_init);
-- 
2.25.1

