Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72C14BF257
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 26 Sep 2019 14:01:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726033AbfIZMBS (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 26 Sep 2019 08:01:18 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:58802 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726029AbfIZMBS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Sep 2019 08:01:18 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190926120116euoutp01d354d6bd8011eb1b0ec844edbbd299b7~H_0bSOwBU2072820728euoutp01X
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Sep 2019 12:01:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190926120116euoutp01d354d6bd8011eb1b0ec844edbbd299b7~H_0bSOwBU2072820728euoutp01X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1569499276;
        bh=9LJuqhkdt4DdylyxkRQhnaMr9vldbmxF+QJ+uVvM74s=;
        h=From:To:Cc:Subject:Date:References:From;
        b=FMsYPRxsIEHEVoPHBso64oCl/M6hq1/3WbPMR+z9qUXHSX7PzHoEsuaL3MHgfuAyx
         L/9T+bWZKoDzot1k3duH3yzyrSQUe8G4G9wv+N81DJsplMAF/QFwBvBcw+t6snl5pG
         z6JdpT/6HVrHS7PtDft83MrZBNw2WduL+M71/uJY=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190926120116eucas1p2bca9b4a5ec904a86d063490aecaca02f~H_0a5zr3a2847228472eucas1p2u;
        Thu, 26 Sep 2019 12:01:16 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 51.B2.04469.C88AC8D5; Thu, 26
        Sep 2019 13:01:16 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190926120115eucas1p20280a4e50c826d43bea7bfe5d670aebe~H_0afpe9U2921029210eucas1p26;
        Thu, 26 Sep 2019 12:01:15 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190926120115eusmtrp1f2411ae4d07f8f80aceaf302c7ae762c~H_0afri760184101841eusmtrp1R;
        Thu, 26 Sep 2019 12:01:15 +0000 (GMT)
X-AuditID: cbfec7f2-569ff70000001175-1f-5d8ca88cbcf2
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 76.51.04166.B88AC8D5; Thu, 26
        Sep 2019 13:01:15 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190926120115eusmtip1e57df697420b160508f68a254fbb4efc~H_0Z4PDWO2539325393eusmtip1F;
        Thu, 26 Sep 2019 12:01:15 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Falkowski <m.falkowski@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] dt-bindings: sound: Convert Samsung Exynos Odroid XU3/XU4
 audio complex to dt-schema
Date:   Thu, 26 Sep 2019 14:01:11 +0200
Message-Id: <20190926120111.8478-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjleLIzCtJLcpLzFFi42LZduznOd2eFT2xBhuP8FpcuXiIyWLqwyds
        FvOPnGO1OH9+A7vFtysdTBaXd81hs5hxfh+TxYPmdWwWa4/cZbdYev0ik0Xr3iPsFofftLM6
        8Hhs+NzE5rFm3hpGj52z7rJ7bFrVyebRt2UVo8fnTXIBbFFcNimpOZllqUX6dglcGc/WXGct
        mK9fceDPUdYGxkcqXYycHBICJhIzLt9h72Lk4hASWMEo0bj8HSOE84VR4vj+N1CZz4wS5z80
        McK0HD6zlhUisZxR4ui6L+xwLeua14NVsQkYSnS97WIDsUUE6iTOnjkCNpdZ4AiTRPP930wg
        CWGBdInv/3aBNbAIqEpcv9ENZvMK2EjMmz6fFWKdvMTqDQeYIexmdom120wgbBeJw1cfskDY
        whKvjm9hh7BlJE5P7mEBWQZUzyjx8Nxadginh1HictMMqCesJQ4fvwi0gQPoJE2J9bv0IcKO
        Ek+fNbOBhCUE+CRuvBUECTMDmZO2TWeGCPNKdLQJQVSrScw6vg5u7cELl6DO9JBYMek4mC0k
        ECtx4NlB5gmMcrMQdi1gZFzFKJ5aWpybnlpsmJdarlecmFtcmpeul5yfu4kRmEpO/zv+aQfj
        10tJhxgFOBiVeHgPhHXHCrEmlhVX5h5ilOBgVhLh9Y3siRXiTUmsrEotyo8vKs1JLT7EKM3B
        oiTOW83wIFpIID2xJDU7NbUgtQgmy8TBKdXAKDO35u7vrPDgHNG+qkNnJOQ3LXqkEfLg7/H6
        npOOO1oMrr261tyQ9kin1MPKJFThSdqz1Q71GZEXYmbOlM9/8Ek869fWy41zr+iqG9kJTt/K
        E/Zf7KHzqd+TW3ZqFZzIU1nvVT5xacI7tWip3Yk3Q2eq5l58F5bT2tV0J3qd4ZeILf8vHvin
        rcRSnJFoqMVcVJwIAC+BY4MhAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKLMWRmVeSWpSXmKPExsVy+t/xu7rdK3piDfa1mlhcuXiIyWLqwyds
        FvOPnGO1OH9+A7vFtysdTBaXd81hs5hxfh+TxYPmdWwWa4/cZbdYev0ik0Xr3iPsFofftLM6
        8Hhs+NzE5rFm3hpGj52z7rJ7bFrVyebRt2UVo8fnTXIBbFF6NkX5pSWpChn5xSW2StGGFkZ6
        hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6Gc/WXGctmK9fceDPUdYGxkcqXYycHBIC
        JhKHz6xl7WLk4hASWMooMWPXZyaIhIzEyWkNrBC2sMSfa11sEEWfGCXmrz3DDJJgEzCU6HoL
        kRARaGKUOLZ5JguIwyxwiknixtUpjCBVwgKpEsuaToONYhFQlbh+oxsszitgIzFv+nyoFfIS
        qzccYJ7AyLOAkWEVo0hqaXFuem6xoV5xYm5xaV66XnJ+7iZGYBBvO/Zz8w7GSxuDDzEKcDAq
        8fAeCOuOFWJNLCuuzD3EKMHBrCTC6xvZEyvEm5JYWZValB9fVJqTWnyI0RRo+URmKdHkfGCE
        5ZXEG5oamltYGpobmxubWSiJ83YIHIwREkhPLEnNTk0tSC2C6WPi4JRqYPTeW7LreEMbQ+Qt
        ZiuH/zLlN5IUP2xS859vZTi/ZvprNelFh+yfVOm+iVwY/6LZZ5NOwYYZh19fzNU/8rslNVgu
        V0BLPPAc+6Qd59p+3V2w58jhOzMezmOMce34G3tg/xa3+TOkRHQmBwa3uRy6EC1Ul9A8zcpc
        f2Kc7MVl9vZ5eRxrH5/5e1SJpTgj0VCLuag4EQBWNB4zeAIAAA==
X-CMS-MailID: 20190926120115eucas1p20280a4e50c826d43bea7bfe5d670aebe
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190926120115eucas1p20280a4e50c826d43bea7bfe5d670aebe
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190926120115eucas1p20280a4e50c826d43bea7bfe5d670aebe
References: <CGME20190926120115eucas1p20280a4e50c826d43bea7bfe5d670aebe@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Maciej Falkowski <m.falkowski@samsung.com>

Convert Samsung Exynos Odroid XU3/XU4 audio complex with MAX98090 codec
to newer dt-schema format.

'clocks' property is unneeded in the bindings and is left undefined in 'properties'.

'samsung,audio-widgets' and 'samsung,audio-routing' are optional from driver
perspective and they are set as unrequired.

Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 .../bindings/sound/samsung,odroid.txt         | 54 -----------
 .../bindings/sound/samsung,odroid.yaml        | 91 +++++++++++++++++++
 2 files changed, 91 insertions(+), 54 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/samsung,odroid.txt
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,odroid.yaml

diff --git a/Documentation/devicetree/bindings/sound/samsung,odroid.txt b/Documentation/devicetree/bindings/sound/samsung,odroid.txt
deleted file mode 100644
index e9da2200e173..000000000000
--- a/Documentation/devicetree/bindings/sound/samsung,odroid.txt
+++ /dev/null
@@ -1,54 +0,0 @@
-Samsung Exynos Odroid XU3/XU4 audio complex with MAX98090 codec
-
-Required properties:
-
- - compatible - "hardkernel,odroid-xu3-audio" - for Odroid XU3 board,
-		"hardkernel,odroid-xu4-audio" - for Odroid XU4 board (deprecated),
-		"samsung,odroid-xu3-audio" - for Odroid XU3 board (deprecated),
-		"samsung,odroid-xu4-audio" - for Odroid XU4 board (deprecated)
- - model - the user-visible name of this sound complex
- - clocks - should contain entries matching clock names in the clock-names
-    property
- - samsung,audio-widgets - this property specifies off-codec audio elements
-   like headphones or speakers, for details see widgets.txt
- - samsung,audio-routing - a list of the connections between audio
-   components;  each entry is a pair of strings, the first being the
-   connection's sink, the second being the connection's source;
-   valid names for sources and sinks are the MAX98090's pins (as
-   documented in its binding), and the jacks on the board
-
-   For Odroid X2:
-     "Headphone Jack", "Mic Jack", "DMIC"
-
-   For Odroid U3, XU3:
-     "Headphone Jack", "Speakers"
-
-   For Odroid XU4:
-     no entries
-
-Required sub-nodes:
-
- - 'cpu' subnode with a 'sound-dai' property containing the phandle of the I2S
-    controller
- - 'codec' subnode with a 'sound-dai' property containing list of phandles
-    to the CODEC nodes, first entry must be corresponding to the MAX98090
-    CODEC and the second entry must be the phandle of the HDMI IP block node
-
-Example:
-
-sound {
-	compatible = "hardkernel,odroid-xu3-audio";
-	model = "Odroid-XU3";
-	samsung,audio-routing =
-		"Headphone Jack", "HPL",
-		"Headphone Jack", "HPR",
-		"IN1", "Mic Jack",
-		"Mic Jack", "MICBIAS";
-
-	cpu {
-		sound-dai = <&i2s0 0>;
-	};
-	codec {
-		sound-dai = <&hdmi>, <&max98090>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/sound/samsung,odroid.yaml b/Documentation/devicetree/bindings/sound/samsung,odroid.yaml
new file mode 100644
index 000000000000..db6d3ea3180e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/samsung,odroid.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/samsung,odroid.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos Odroid XU3/XU4 audio complex with MAX98090 codec
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+  - Sylwester Nawrocki <s.nawrocki@samsung.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: hardkernel,odroid-xu3-audio
+
+      - const: hardkernel,odroid-xu4-audio
+        deprecated: true
+
+      - const: samsung,odroid-xu3-audio
+        deprecated: true
+
+      - const: samsung,odroid-xu4-audio
+        deprecated: true
+
+  model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: The user-visible name of this sound complex.
+
+  cpu:
+    type: object
+    properties:
+      sound-dai:
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+        description: phandles to the I2S controllers
+
+  codec:
+    type: object
+    properties:
+      sound-dai:
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+        description: |
+          List of phandles to the CODEC nodes,
+          first entry must be corresponding to the MAX98090 CODEC and
+          the second entry must be the phandle of the HDMI IP block node.
+
+  samsung,audio-widgets:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description: |
+      This property specifies off-codec audio elements
+      like headphones or speakers, for details see widgets.txt
+
+  samsung,audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description: |
+      List of the connections between audio
+      components;  each entry is a pair of strings, the first being the
+      connection's sink, the second being the connection's source;
+      valid names for sources and sinks are the MAX98090's pins (as
+      documented in its binding), and the jacks on the board.
+      For Odroid X2: "Headphone Jack", "Mic Jack", "DMIC"
+      For Odroid U3, XU3: "Headphone Jack", "Speakers"
+      For Odroid XU4: no entries
+
+required:
+  - compatible
+  - model
+  - cpu
+  - codec
+
+examples:
+  - |
+    sound {
+        compatible = "hardkernel,odroid-xu3-audio";
+        model = "Odroid-XU3";
+        samsung,audio-routing =
+                "Headphone Jack", "HPL",
+                "Headphone Jack", "HPR",
+                "IN1", "Mic Jack",
+                "Mic Jack", "MICBIAS";
+
+        cpu {
+            sound-dai = <&i2s0 0>;
+        };
+
+        codec {
+            sound-dai = <&hdmi>, <&max98090>;
+        };
+    };
+
-- 
2.17.1



