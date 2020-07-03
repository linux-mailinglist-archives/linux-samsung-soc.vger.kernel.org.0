Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31D652131D2
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  3 Jul 2020 04:41:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726122AbgGCClO (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 2 Jul 2020 22:41:14 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:33216 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725915AbgGCClO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Jul 2020 22:41:14 -0400
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20200703024111epoutp029d529dc09f0983dac1237f468761b2b1~eHcoYgV-z2672126721epoutp028
        for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Jul 2020 02:41:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20200703024111epoutp029d529dc09f0983dac1237f468761b2b1~eHcoYgV-z2672126721epoutp028
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1593744072;
        bh=YSw2I+nRDJfqjQfJDsK2xbkKENE3fuVKKn3Gij0/jkY=;
        h=From:To:Cc:Subject:Date:References:From;
        b=hv9W12d3SOXTB8rJl7kyjt4vrEiRf0pAaYtLjMSXyveFyDfSOZsPBAJ3C0ks0b+8w
         Kc9xkkG0h4tpLXVzU77/6uFECJIuoUamRVDLNAAutSB900btRMOsf0+VjKJctxbnZW
         T1WcQQR1n0JX/HEY6OHNyhtp3lL96NNOSw6ogW3Q=
Received: from epsmges5p1new.samsung.com (unknown [182.195.42.73]) by
        epcas5p2.samsung.com (KnoxPortal) with ESMTP id
        20200703024111epcas5p2d272acbb32254c83e7204dac256d03c0~eHcnom4cR2476424764epcas5p2R;
        Fri,  3 Jul 2020 02:41:11 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
        epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        D3.1A.09467.7CA9EFE5; Fri,  3 Jul 2020 11:41:11 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
        20200703024110epcas5p1ef8cfff90d1fcb9604613a44ee466d0b~eHcmtS6g60819808198epcas5p1T;
        Fri,  3 Jul 2020 02:41:10 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200703024110epsmtrp2a07fc93caaeb29c73fb439a2f27433e6~eHcmsRYsZ0790007900epsmtrp2V;
        Fri,  3 Jul 2020 02:41:10 +0000 (GMT)
X-AuditID: b6c32a49-a29ff700000024fb-66-5efe9ac7069b
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        BB.8D.08303.6CA9EFE5; Fri,  3 Jul 2020 11:41:10 +0900 (KST)
Received: from Jaguar.sa.corp.samsungelectronics.net (unknown
        [107.108.73.139]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200703024108epsmtip11bddd1a3b4b861e7b8c6b2f11a87e6ec~eHclK306I2726127261epsmtip1-;
        Fri,  3 Jul 2020 02:41:08 +0000 (GMT)
From:   Alim Akhtar <alim.akhtar@samsung.com>
To:     vkoul@kernel.org
Cc:     robh+dt@kernel.org, krzk@kernel.org, kwmad.kim@samsung.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        kishon@ti.com, Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v11 1/2] dt-bindings: phy: Document Samsung UFS PHY bindings
Date:   Fri,  3 Jul 2020 07:51:02 +0530
Message-Id: <20200703022103.41849-1-alim.akhtar@samsung.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkleLIzCtJLcpLzFFi42LZdlhTS/f4rH9xBu3b2CwezAMS84+cY7W4
        8LSHzeL8+Q3sFje3HGWx2PT4GqvF5V1z2CxmnN/HZNG69wi7xc47J5gduDw2repk89i8pN6j
        b8sqRo/jN7YzeXzeJBfAGsVlk5Kak1mWWqRvl8CV0X1zKWtBp1jF18nbGBsYuwS7GDk5JARM
        JGY8OM7UxcjFISSwm1Fi5c7XrBDOJ0aJ9R1fmCGcz4wSjev72WFapm65wgKR2MUosfbdPDYI
        p4VJomn2YyaQKjYBbYm707eA2SICIhKrV85jBCliFvjLKLHt+kdWkISwgI/Ew4a9zCA2i4Cq
        xMGba8FsXgEbidPvL7JCrJOXWL3hAFRcUOLkzCcsIDYzULx562yw+yQEvrJLXDlxihGiwUVi
        betPNghbWOLV8S1Qd0tJfH63FyjOAWRnS/TsMoYI10gsnXeMBcK2lzhwZQ4LSAmzgKbE+l36
        EKv4JHp/P2GC6OSV6GgTgqhWlWh+dxWqU1piYnc31MUeEs9WTmYHKRcSiJWYeCt4AqPcLCT3
        z0Jy/yyEXQsYmVcxSqYWFOempxabFhjmpZbrFSfmFpfmpesl5+duYgSnFi3PHYx3H3zQO8TI
        xMF4iFGCg1lJhDdB9V+cEG9KYmVValF+fFFpTmrxIUZpDhYlcV6lH2fihATSE0tSs1NTC1KL
        YLJMHJxSDUw865M5nNyFrp2okvfs6TgwQW/vk/zbnhd9av6FtHGcFt21/0Wvzh33syd2BAjs
        Lo991H/Walv16dKO6jwvBy6jVZWf961+uPGz9283YdMtl/QToyKqOc5vyUn/+Y572//ee5ba
        3y/F9bFtKvd32M/xWPr+wrybN5lPz/iYvOvDYQbJ6/PuaUtptLX+5shu8q3kS2Y3UOGLfPBa
        XX3t4hXq8+tmfF2WsVqu9sqN4DlMm74VTr4kcmZTVNriuqjunHcvJ949UDRdKuhfRgyHre+y
        JGdTtaCMzWVfzl0/unrF4wtVus3773tOZX1suOQJq8aLqfcmTrY48GUz93exs43L/n2s8vpf
        wRCxsZkjadYrJZbijERDLeai4kQAWwm295wDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCLMWRmVeSWpSXmKPExsWy7bCSnO6xWf/iDK69YLZ4MG8bm8X8I+dY
        LS487WGzOH9+A7vFzS1HWSw2Pb7GanF51xw2ixnn9zFZtO49wm6x884JZgcuj02rOtk8Ni+p
        9+jbsorR4/iN7UwenzfJBbBGcdmkpOZklqUW6dslcGV031zKWtApVvF18jbGBsYuwS5GTg4J
        AROJqVuusHQxcnEICexglGhtnswIkZCWuL5xAjuELSyx8t9zdoiiJiaJVZtfM4Mk2AS0Je5O
        38IEYosIiEisXjmPEaSIWaCdSeL69wNgCWEBH4mHDXvBGlgEVCUO3lwLZvMK2Eicfn+RFWKD
        vMTqDQeg4oISJ2c+ATqJA2iQusT6eUIgYWagkuats5knMPLPQlI1C6FqFpKqBYzMqxglUwuK
        c9Nziw0LjPJSy/WKE3OLS/PS9ZLzczcxggNeS2sH455VH/QOMTJxMB5ilOBgVhLhTVD9FyfE
        m5JYWZValB9fVJqTWnyIUZqDRUmc9+ushXFCAumJJanZqakFqUUwWSYOTqkGpt6eSQnz3Y99
        myY3e8E6hsvxEhYn/f+onTz5MNcxjde7jrtNLuXc45wVX1uNPvzYayzpJp5bLr6iYvYzbsVl
        C17Ut/QsnL5yQwxPXMH5rPIVGcoPW9TurTt+9pZu2LxtndqK94TzfTdJKNSuW8cibOJjttbw
        G8vsZq7kz4GXXLr26t37rq641/P8B8mtTDFv9/FsPfZUQUMljfPxg7VCGW9mzvRu/bureibb
        Pol+t5UpCzJ7zNYI7+fxN9Zd2X6y5l1ILPfLq6e+WzxmOzGHc9vCRJEpslZu1l5i+SlfT7kU
        /qvj8NLfv1Xz8oU7TJfn/ff6UOqQ3O7x0uH8J9fid1FLsuqj1RtMJbx+7PBnUWIpzkg01GIu
        Kk4EAL9SAg3nAgAA
X-CMS-MailID: 20200703024110epcas5p1ef8cfff90d1fcb9604613a44ee466d0b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20200703024110epcas5p1ef8cfff90d1fcb9604613a44ee466d0b
References: <CGME20200703024110epcas5p1ef8cfff90d1fcb9604613a44ee466d0b@epcas5p1.samsung.com>
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

