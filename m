Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6389CB4CA5
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 17 Sep 2019 13:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbfIQLO3 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 17 Sep 2019 07:14:29 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:47053 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726799AbfIQLO0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 17 Sep 2019 07:14:26 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190917111424euoutp02852119c18a0a6cb661cf3a42968a7417~FNX8LjfA61841318413euoutp02F
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Sep 2019 11:14:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190917111424euoutp02852119c18a0a6cb661cf3a42968a7417~FNX8LjfA61841318413euoutp02F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1568718865;
        bh=O+tpv5YH60GH75cK5y76RSwCxfMXAXTR6xr+6tD+6eo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mk08F3P1ovzNYVLh0MErc1kKiDJ6TqtkahY4Ee3St/emBWE8HWLIcawAHP6Yd6d9O
         OeYSx3Kq/g6UrI+UAjmmnUp3lZ9d4fmIN0jwxDVnzTCOfPMY8rhvbRbQUOBs6IPBaU
         wOoNfimV5XuRaXvT+m21H0k2x+beYP3P2gyFjXGQ=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190917111424eucas1p13132111e39c3ad4ddbf23e0f27c223cb~FNX7azAfY1744217442eucas1p1U;
        Tue, 17 Sep 2019 11:14:24 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id AD.D0.04374.F00C08D5; Tue, 17
        Sep 2019 12:14:23 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190917111423eucas1p2efddf7b93fe21dcfa262d8f539116517~FNX6pwabL2246722467eucas1p2I;
        Tue, 17 Sep 2019 11:14:23 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190917111423eusmtrp20315d096d0928d0371daf2db35c5e55f~FNX6biU4I0712107121eusmtrp2P;
        Tue, 17 Sep 2019 11:14:23 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-9d-5d80c00fe71d
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 4C.5C.04166.F00C08D5; Tue, 17
        Sep 2019 12:14:23 +0100 (BST)
Received: from AMDC2459.digital.local (unknown [106.120.51.95]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190917111422eusmtip133de2112be1ae796ddc8d4a96eeb72bc~FNX51WbHb2351623516eusmtip1B;
        Tue, 17 Sep 2019 11:14:22 +0000 (GMT)
From:   Maciej Falkowski <m.falkowski@samsung.com>
To:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     krzk@kernel.org, sbkim73@samsung.com, s.nawrocki@samsung.com,
        lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, a.hajda@samsung.com,
        m.szyprowski@samsung.com, m.falkowski@samsung.com
Subject: [PATCH 2/2] dt-bindings: sound: Convert Samsung SMDK audio complex
Date:   Tue, 17 Sep 2019 13:14:13 +0200
Message-Id: <20190917111413.22711-2-m.falkowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190917111413.22711-1-m.falkowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEKsWRmVeSWpSXmKPExsWy7djP87r8BxpiDf5uNrO4te4cq8WVi4eY
        LKY+fMJmMf8IkHv+/AZ2i29XOpgsLu+aw2Yx4/w+JosHzevYLNYeuctusfT6RSaL1r1H2C0O
        v2lntbi44guTA5/Hhs9NbB5r5q1h9Ng56y67x6ZVnWwefVtWMXp83iQXwBbFZZOSmpNZllqk
        b5fAlXH18BrGgj3CFad2PmNtYDwu0MXIySEhYCJxbettli5GLg4hgRWMEgumNrBBOF8YJRbe
        +gWV+cwoceP7PUaYlrnT/rFDJJYzSrR/nc4M17L7+TxWkCo2AQOJ/jd7WUBsEYE6iYnT5oEV
        MQs8ZJS4s/czO0hCWMBbYsrEp8wgNouAqsSCeSvA4rwCNhJt9x+xQqyTl1i94QBYDaeArcTc
        W39ZQQZJCKxil/h14As7RJGLxI6pq6FsYYlXx7dA2TIS/3fOZ+pi5ACyqyWufZOF6G1hlLg+
        7S0bRI21xJ9VE9lAapgFNCXW79KHCDtKbFhwiw2ilU/ixltBkDAzkDlpG8jDIGFeiY42IQhT
        VeLNhFiIRmmJ1jX7GSHCHhIvXltDQmcCo8S+BQfYJjDKz0JYtYCRcRWjeGppcW56arFxXmq5
        XnFibnFpXrpecn7uJkZgyjn97/jXHYz7/iQdYhTgYFTi4b2xuT5WiDWxrLgy9xCjBAezkghv
        QC1QiDclsbIqtSg/vqg0J7X4EKM0B4uSOG81w4NoIYH0xJLU7NTUgtQimCwTB6dUA2PZT/mN
        U/T/eM7yXrG55ZL+lLNufQcZZZ64K/6U4C7W+f5F5vWyVaXbfhju+8xW75Nf5sKjncZ+9eaM
        t+bJXrGqhsuWaHRcvqtwMPR34b6Uf74NFTx7a0pvvTIWT7XUnenZM3/Krdwg+/3m3xtZtgcl
        ut1yfpO++J3TnXOTyrsl58tuaZv2qF2JpTgj0VCLuag4EQAyXu5mNQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnkeLIzCtJLcpLzFFi42I5/e/4XV3+Aw2xBqdeM1vcWneO1eLKxUNM
        FlMfPmGzmH8EyD1/fgO7xbcrHUwWl3fNYbOYcX4fk8WD5nVsFmuP3GW3WHr9IpNF694j7BaH
        37SzWlxc8YXJgc9jw+cmNo8189YweuycdZfdY9OqTjaPvi2rGD0+b5ILYIvSsynKLy1JVcjI
        Ly6xVYo2tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJzcksSy3St0vQy7h6eA1jwR7hilM7n7E2
        MB4X6GLk5JAQMJGYO+0fexcjF4eQwFJGiTU7d7NDJKQl9l/7CGULS/y51sUGUfQJqOjqJhaQ
        BJuAgUT/m70sIAkRgSZGifk3f4I5zAJvGSVadhxiAqkSFvCWmDLxKTOIzSKgKrFg3gqwsbwC
        NhJt9x+xQqyQl1i94QBYDaeArcTcW3/B4kJANUufnGGfwMi3gJFhFaNIamlxbnpusaFecWJu
        cWleul5yfu4mRmAkbDv2c/MOxksbgw8xCnAwKvHwGmyrjxViTSwrrsw9xCjBwawkwhtQCxTi
        TUmsrEotyo8vKs1JLT7EaAp01ERmKdHkfGCU5pXEG5oamltYGpobmxubWSiJ83YIHIwREkhP
        LEnNTk0tSC2C6WPi4JRqYMxaZ/f+/Ddzx80i11ImTa5e7Ddbk8v/xHeOppLNdhfsL1gHTrCX
        /XPveHbmBx8bRtnjCtqOrJfMJ51PciyZdZXrshLvr9obk7/ZZW7mOqh3hDlKasfuz5e8g/Pm
        cE76qL3gjcQ7P7NdLsY/w89ef9l28k1n1dM3ZobiPHmiNufOnWBZ63N7voESS3FGoqEWc1Fx
        IgCO5+XamgIAAA==
X-CMS-MailID: 20190917111423eucas1p2efddf7b93fe21dcfa262d8f539116517
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190917111423eucas1p2efddf7b93fe21dcfa262d8f539116517
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190917111423eucas1p2efddf7b93fe21dcfa262d8f539116517
References: <20190917111413.22711-1-m.falkowski@samsung.com>
        <CGME20190917111423eucas1p2efddf7b93fe21dcfa262d8f539116517@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Convert Samsung SMDK audio complex to newer dt-schema format.

Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
---
 .../bindings/sound/samsung,smdk-wm8994.txt    | 14 -------
 .../bindings/sound/samsung,smdk-wm8994.yaml   | 38 +++++++++++++++++++
 2 files changed, 38 insertions(+), 14 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.txt
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.yaml

diff --git a/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.txt b/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.txt
deleted file mode 100644
index 4686646fb122..000000000000
--- a/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-Samsung SMDK audio complex
-
-Required properties:
-- compatible : "samsung,smdk-wm8994"
-- samsung,i2s-controller: The phandle of the Samsung I2S0 controller
-- samsung,audio-codec: The phandle of the WM8994 audio codec
-Example:
-
-sound {
-		compatible = "samsung,smdk-wm8994";
-
-		samsung,i2s-controller = <&i2s0>;
-		samsung,audio-codec = <&wm8994>;
-};
diff --git a/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.yaml b/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.yaml
new file mode 100644
index 000000000000..a66c0dfdeb57
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/samsung,smdk-wm8994.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung SoC SMDK audio complex
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+  - Sangbeom Kim <sbkim73@samsung.com>
+  - Sylwester Nawrocki <s.nawrocki@samsung.com>
+
+properties:
+  compatible:
+    const: "samsung,smdk-wm8994"
+
+  samsung,i2s-controller:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of the Samsung I2S0 controller
+
+  samsung,audio-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of the WM8994 audio codec
+
+required:
+  - compatible
+  - samsung,i2s-controller
+  - samsung,audio-codec
+
+examples:
+  - |
+    sound {
+        compatible = "samsung,smdk-wm8994";
+        samsung,i2s-controller = <&i2s0>;
+        samsung,audio-codec = <&wm8994>;
+    };
+
-- 
2.17.1

