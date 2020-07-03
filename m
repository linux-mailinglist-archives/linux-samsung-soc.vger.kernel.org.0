Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 816C3213E92
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  3 Jul 2020 19:31:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726560AbgGCRbr (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 3 Jul 2020 13:31:47 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:56168 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726148AbgGCRbr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Jul 2020 13:31:47 -0400
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20200703173145epoutp04acaddf5f2f4b570f2cfd88e7f4642c95~eTmMG0M400265202652epoutp04S
        for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Jul 2020 17:31:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20200703173145epoutp04acaddf5f2f4b570f2cfd88e7f4642c95~eTmMG0M400265202652epoutp04S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1593797505;
        bh=YSw2I+nRDJfqjQfJDsK2xbkKENE3fuVKKn3Gij0/jkY=;
        h=From:To:Cc:Subject:Date:References:From;
        b=gOy3MjFyH0MXFxxtSwQsfMWe13o7I4x9rh1pf7Ov+3ITSsQwIuP3P97zNIdVSNzmK
         uD8lljf36OzZWEyBXhDE1uqRSoolDI6dP4V5jA/wKJovlOgrb2tHl+c5IFPzM1R/r6
         HWTzUfvKhJ9lt5/nm7Yby8y8PSZPpc8Gv7c/Hxk8=
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
        epcas5p2.samsung.com (KnoxPortal) with ESMTP id
        20200703173144epcas5p23a293aea4c96ca089c47fa5250edf0c9~eTmK2c4qi1242112421epcas5p20;
        Fri,  3 Jul 2020 17:31:44 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
        epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
        DE.49.09475.F7B6FFE5; Sat,  4 Jul 2020 02:31:43 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
        20200703173142epcas5p4e7b758249859dea792958000e2a697b2~eTmJsitGE0621906219epcas5p4t;
        Fri,  3 Jul 2020 17:31:42 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200703173142epsmtrp202cb972b0a31ecc9e18e7df922d504b8~eTmJr0z201620116201epsmtrp27;
        Fri,  3 Jul 2020 17:31:42 +0000 (GMT)
X-AuditID: b6c32a4b-389ff70000002503-37-5eff6b7fdb35
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        2D.E7.08303.E7B6FFE5; Sat,  4 Jul 2020 02:31:42 +0900 (KST)
Received: from Jaguar.sa.corp.samsungelectronics.net (unknown
        [107.108.73.139]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200703173141epsmtip29d97054ccbb1b290174ee9eb3ef47f82~eTmIIam1o1115611156epsmtip2W;
        Fri,  3 Jul 2020 17:31:40 +0000 (GMT)
From:   Alim Akhtar <alim.akhtar@samsung.com>
To:     vkoul@kernel.org
Cc:     robh+dt@kernel.org, krzk@kernel.org, kwmad.kim@samsung.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        kishon@ti.com, Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v12 1/2] dt-bindings: phy: Document Samsung UFS PHY bindings
Date:   Fri,  3 Jul 2020 22:41:34 +0530
Message-Id: <20200703171135.77389-1-alim.akhtar@samsung.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkleLIzCtJLcpLzFFi42LZdlhTQ7c++3+cQctJK4sH87axWcw/co7V
        4sLTHjaL8+c3sFvc3HKUxWLT42usFpd3zWGzmHF+H5NF694j7BY775xgduDy2LSqk81j85J6
        j74tqxg9jt/YzuTxeZNcAGsUl01Kak5mWWqRvl0CV0b3zaWsBZ1iFV8nb2NsYOwS7GLk5JAQ
        MJFYd/kiUxcjF4eQwG5GibU7VjNDOJ8YJV5v2s8C4XxmlDjd+IsVpuXMzHNsEIldjBJHvl5g
        hHBamCQOdC1jBqliE9CWuDt9CxOILSIgIrF65TywImaBv4wS265/BBslLOAjceXOabAiFgFV
        ibbW30BjOTh4BWwkHp5UgNgmL7F6wwGwmbwCghInZz5hAbGZgeLNW2eD3Soh8JNd4vGGyywQ
        DS4S709OhTpVWOLV8S3sELaUxOd3e8HmSwhkS/TsMoYI10gsnXcMqtVe4sCVOSwgJcwCmhLr
        d+lDrOKT6P39hAmik1eio00IolpVovndVahOaYmJ3d1QSz0kpi5cABYXEoiVWLVtBfsERrlZ
        SB6YheSBWQjLFjAyr2KUTC0ozk1PLTYtMM5LLdcrTswtLs1L10vOz93ECE4tWt47GB89+KB3
        iJGJg/EQowQHs5IIb4Lqvzgh3pTEyqrUovz4otKc1OJDjNIcLErivEo/zsQJCaQnlqRmp6YW
        pBbBZJk4OKUamFg/eK7uV8uJ2acUNvlWPcvy1G8P7/fsepG/u9f43jLuakl/zUUVM5xzzfu/
        hM/icHY80zkxoeWSxkMRDp178e8km4+WPppn0rPrOOdODavIxyqbomO0LWu8Pas3xDJcdyla
        KMUsXrHP4/MBxV2509b8X7z8m2iH1iS12sLbsx7/f3uk/EVCewVvukX63MnGBidkVF/Ed537
        dHb3Pp2IB48Nlx1rT1r9Wi50xULFp9lG8+vmhG5J3mD8Xf2ezlRN/98p83f/uDCp9YD03slL
        ric/Kne8LLX0/tHN7QU/xZy5rl6YK14Uefvbj0/ZkrMvzThmwpDuqM44s9qicaNV+1SZSf1n
        epZNmnhjW+73g41KLMUZiYZazEXFiQApulGZnAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMLMWRmVeSWpSXmKPExsWy7bCSvG5d9v84g9VXNC0ezNvGZjH/yDlW
        iwtPe9gszp/fwG5xc8tRFotNj6+xWlzeNYfNYsb5fUwWrXuPsFvsvHOC2YHLY9OqTjaPzUvq
        Pfq2rGL0OH5jO5PH501yAaxRXDYpqTmZZalF+nYJXBndN5eyFnSKVXydvI2xgbFLsIuRk0NC
        wETizMxzbF2MXBxCAjsYJf78PsUCkZCWuL5xAjuELSyx8t9zdoiiJiaJk093gCXYBLQl7k7f
        wgRiiwiISKxeOY8RpIhZoJ1J4vr3A2AJYQEfiSt3ToPZLAKqEm2tv4HWcXDwCthIPDypALFA
        XmL1hgPMIDavgKDEyZlPWEBKmAXUJdbPEwIJMwOVNG+dzTyBkX8WkqpZCFWzkFQtYGRexSiZ
        WlCcm55bbFhglJdarlecmFtcmpeul5yfu4kRHO5aWjsY96z6oHeIkYmD8RCjBAezkghvguq/
        OCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8X2ctjBMSSE8sSc1OTS1ILYLJMnFwSjUwsSQ/j9y/
        Z23O24s24h+t5GpqP3k4yHcuq8u6c6P+HMu76BDLuKzZgqt19/nwdhTEXjxj+ysjWDxfapLj
        xdS/N0N/Tnb4GFk58Ydrx9PlAqukPMX2GPXen+JzQdirZU/9aoE8h9rA34ZeDexPmcpe/S3t
        WXL6RAN33uzfbu+j/tdKPXVs8TKTiF6y8k6AZNLLZLnS1ZzHHJ3Pq0158NlowlLGST/0xZVT
        p0WaZH9QYVBfztCtFmItMilxx8NagccWr412Fqw+uefXv+uJgWd4ys9k2DZE+sWd313wrElw
        YUxy0zyt0DVfzfw3V06NaNS8/GWJXNCNg/0q+j4empe4+dkKdxnrLF3Mod43rV6JpTgj0VCL
        uag4EQCdznb05gIAAA==
X-CMS-MailID: 20200703173142epcas5p4e7b758249859dea792958000e2a697b2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20200703173142epcas5p4e7b758249859dea792958000e2a697b2
References: <CGME20200703173142epcas5p4e7b758249859dea792958000e2a697b2@epcas5p4.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This patch documents Samsung UFS PHY device tree bindings

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Tested-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
---
 .../bindings/phy/samsung,ufs-phy.yaml         | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
new file mode 100644
index 000000000000..636cc501b54f
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/samsung,ufs-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung SoC series UFS PHY Device Tree Bindings
+
+maintainers:
+  - Alim Akhtar <alim.akhtar@samsung.com>
+
+properties:
+  "#phy-cells":
+    const: 0
+
+  compatible:
+    enum:
+      - samsung,exynos7-ufs-phy
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    items:
+      - const: phy-pma
+
+  clocks:
+    items:
+      - description: PLL reference clock
+      - description: symbol clock for input symbol ( rx0-ch0 symbol clock)
+      - description: symbol clock for input symbol ( rx1-ch1 symbol clock)
+      - description: symbol clock for output symbol ( tx0 symbol clock)
+
+  clock-names:
+    items:
+      - const: ref_clk
+      - const: rx1_symbol_clk
+      - const: rx0_symbol_clk
+      - const: tx0_symbol_clk
+
+  samsung,pmu-syscon:
+    $ref: '/schemas/types.yaml#/definitions/phandle'
+    description: phandle for PMU system controller interface, used to
+                 control pmu registers bits for ufs m-phy
+
+required:
+  - "#phy-cells"
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - samsung,pmu-syscon
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/exynos7-clk.h>
+
+    ufs_phy: ufs-phy@15571800 {
+        compatible = "samsung,exynos7-ufs-phy";
+        reg = <0x15571800 0x240>;
+        reg-names = "phy-pma";
+        samsung,pmu-syscon = <&pmu_system_controller>;
+        #phy-cells = <0>;
+        clocks = <&clock_fsys1 SCLK_COMBO_PHY_EMBEDDED_26M>,
+                 <&clock_fsys1 PHYCLK_UFS20_RX1_SYMBOL_USER>,
+                 <&clock_fsys1 PHYCLK_UFS20_RX0_SYMBOL_USER>,
+                 <&clock_fsys1 PHYCLK_UFS20_TX0_SYMBOL_USER>;
+        clock-names = "ref_clk", "rx1_symbol_clk",
+                      "rx0_symbol_clk", "tx0_symbol_clk";
+
+    };
+...

base-commit: aab2003999e78bbf2058dae1e661c44ede1d9766
-- 
2.17.1

