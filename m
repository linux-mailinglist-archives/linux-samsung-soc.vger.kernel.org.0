Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC4EE21BC53
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 10 Jul 2020 19:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726872AbgGJRfP (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 10 Jul 2020 13:35:15 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:36105 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726925AbgGJRfP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 10 Jul 2020 13:35:15 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200710173513euoutp01bb6bd479eb3ba44b891fa620e7ebfa90~gdKNn6nTg1427214272euoutp01P
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Jul 2020 17:35:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200710173513euoutp01bb6bd479eb3ba44b891fa620e7ebfa90~gdKNn6nTg1427214272euoutp01P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1594402513;
        bh=Ucl8qQkq/Y/lZnIAjMzZVO6MQAbXoZrhmEgdirnuKH0=;
        h=From:To:Cc:Subject:Date:References:From;
        b=OvrOYy/kTbR+2OTKwaj4zV3vFmWbjyEXQp08mVAWUf9OiAunak6Cp1We8zrqLo8NM
         ynRa74op30uG5SqIa9SDNzvfK9DvlC1R2LZdtuTqygArN6OziS2ZngNMZQAS5+62VW
         +n8gSBE9uz6u8vbEkEAg3ZPYPU+Xp/9D/TuX7h1U=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200710173512eucas1p16154c5959623fa570f517785a7204f47~gdKNQR5003026630266eucas1p13;
        Fri, 10 Jul 2020 17:35:12 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id EF.1D.06318.0D6A80F5; Fri, 10
        Jul 2020 18:35:12 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200710173512eucas1p101c03994a728150f18428295192edf25~gdKM9O5EL3193331933eucas1p1n;
        Fri, 10 Jul 2020 17:35:12 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200710173512eusmtrp240beea254a53a5f0a7153c32847ebafe~gdKM8kZVk0083200832eusmtrp20;
        Fri, 10 Jul 2020 17:35:12 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-cb-5f08a6d08ac0
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 95.BE.06017.0D6A80F5; Fri, 10
        Jul 2020 18:35:12 +0100 (BST)
Received: from AMDC3061.digital.local (unknown [106.120.51.75]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200710173511eusmtip12ba193e6f648ff4a75f48ef80a6ce13b~gdKMbTkxq2698126981eusmtip1H;
        Fri, 10 Jul 2020 17:35:11 +0000 (GMT)
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
To:     broonie@kernel.org, krzk@kernel.org
Cc:     simon@lineageos.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        b.zolnierkie@samsung.com, m.szyprowski@samsung.com,
        linux-samsung-soc@vger.kernel.org, s.nawrocki@samsung.com
Subject: [PATCH 1/3] ASoC: samsung: Document DT bindings for Midas sound
 subsystem
Date:   Fri, 10 Jul 2020 19:34:58 +0200
Message-Id: <20200710173500.22365-1-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrFIsWRmVeSWpSXmKPExsWy7djPc7oXlnHEG0z5om9x5eIhJouNM9az
        Wkx9+ITNYv6Rc6wW589vYLeYcX4fk8XaI3fZLVr3HmG3OPymndViy5nbbA5cHhs+N7F5bFrV
        yebRsn4Tm0ffllWMHp83yQWwRnHZpKTmZJalFunbJXBlLNpRWbBEpmLNg/VsDYzvRLoYOTgk
        BEwkmp8EdTFycQgJrGCUuPCkma2LkRPI+cIosXlDGIT9mVHixckgEBuk/uz+TSwQ8eVA8Zka
        EM1A9bvWb2UHSbAJGEr0Hu1jBLFFBNQl7s9oYgUpYha4ySgxc1Mf2AZhgRCJy9vugjWwCKhK
        /Lu1EKyBV8Ba4vGnTewQ2+QlVm84wAzSLCHwmU2ia2sHVMJF4sX5G2wQtrDEq+NboOIyEv93
        zmeCaGhmlOjZfZsdwpnAKHH/+AJGiCpriTvnfrGBAoBZQFNi/S59iLCjRGvjXyZIuPBJ3Hgr
        CBJmBjInbZvODBHmlehoE4KoVpH4vWo6E4QtJdH95D8LRImHxIHb8pAAipXYO30W8wRGuVkI
        qxYwMq5iFE8tLc5NTy02zkst1ytOzC0uzUvXS87P3cQITBGn/x3/uoNx35+kQ4wCHIxKPLwL
        EjnihVgTy4orcw8xSnAwK4nwOp09HSfEm5JYWZValB9fVJqTWnyIUZqDRUmc13jRy1ghgfTE
        ktTs1NSC1CKYLBMHp1QD4zTOuobDypP7+me/XXJqI/sNns0Lv6Z0Cujx/c6eKXtA5twcFwm1
        XMY5LWujGwL0Yl23laQaOr9pc/YtYPkgu/vbo2MBG0wXSee+kclwMFRY+lJLyPuV59XtUhEP
        ZCatEi8wf17zxen0vYRXh9VmGd9o+FG/8aeQxrEy+Zxy9RlG0aekehY9UWIpzkg01GIuKk4E
        AOU8TPINAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrILMWRmVeSWpSXmKPExsVy+t/xu7oXlnHEGyxul7a4cvEQk8XGGetZ
        LaY+fMJmMf/IOVaL8+c3sFvMOL+PyWLtkbvsFq17j7BbHH7Tzmqx5cxtNgcujw2fm9g8Nq3q
        ZPNoWb+JzaNvyypGj8+b5AJYo/RsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOtjEyV
        9O1sUlJzMstSi/TtEvQyFu2oLFgiU7HmwXq2BsZ3Il2MnBwSAiYSZ/dvYuli5OIQEljKKHFj
        2Xe2LkYOoISUxPwWJYgaYYk/17rYQGwhgU+MEhtOKoPYbAKGEr1H+xhBbBEBTYmOebdZQeYw
        CzxklNh//D4jyBxhgSCJj7srQGpYBFQl/t1aCFbPK2At8fjTJnaI+fISqzccYJ7AyLOAkWEV
        o0hqaXFuem6xkV5xYm5xaV66XnJ+7iZGYHBuO/Zzyw7GrnfBhxgFOBiVeHgXJHLEC7EmlhVX
        5h5ilOBgVhLhdTp7Ok6INyWxsiq1KD++qDQntfgQoynQ8onMUqLJ+cDIySuJNzQ1NLewNDQ3
        Njc2s1AS5+0QOBgjJJCeWJKanZpakFoE08fEwSnVwCi/uqs7rbLyxuyeF8zV22912uhp7Aw4
        WfQ8c8WuU4t07C0Zfp5/bcyieepNRoC/m8lcpyeKq3eoLN9xn9WeY4u+45S901a4rv5i4NRr
        a5l9SOOHdeBe+/3W7Il7RLI4Wf4s79m9pDlwiotY/Vmn7S5vNqq/Y9u6Tdbws7PLrUP8P5cs
        KziwIEGJpTgj0VCLuag4EQAA5MzSZAIAAA==
X-CMS-MailID: 20200710173512eucas1p101c03994a728150f18428295192edf25
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200710173512eucas1p101c03994a728150f18428295192edf25
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200710173512eucas1p101c03994a728150f18428295192edf25
References: <CGME20200710173512eucas1p101c03994a728150f18428295192edf25@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This patch adds documentation of DT biding for the Midas sound complex.
Partially based on the *txt version by Simon Shields <simon@lineageos.org>.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 .../bindings/sound/samsung,midas-audio.yaml        | 105 +++++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml

diff --git a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
new file mode 100644
index 0000000..4a82829
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/samsung,midas-audio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Midas audio complex with WM1811 codec
+
+maintainers:
+  - Sylwester Nawrocki <s.nawrocki@samsung.com>
+
+properties:
+  compatible:
+    const: samsung,midas-audio
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
+        description: phandle to the I2S controller
+
+  codec:
+    type: object
+    properties:
+      sound-dai:
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+        description: phandle to the WM1811 CODEC node
+
+  samsung,audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description: |
+      List of the connections between audio components; each entry is
+      a pair of strings, the first being the connection's sink, the second
+      being the connection's source; valid names for sources and sinks are
+      the WM1811's pins (as documented in its binding), and the jacks
+      on the board: HP, SPK, Main Mic, Sub Mic, Headset Mic.
+
+  mic-bias-supply:
+    description: Supply for the micbias on the Main microphone
+
+  submic-bias-supply:
+    description: Supply for the micbias on the Sub microphone
+
+  fm-sel-gpios:
+    description: GPIO pin for FM selection
+
+  lineout-sel-gpios:
+    description: GPIO pin for line out selection
+
+required:
+  - compatible
+  - model
+  - cpu
+  - codec
+  - samsung,audio-routing
+  - mic-bias-supply
+  - submic-bias-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    sound {
+        compatible = "samsung,midas-audio";
+        model = "Midas";
+
+        mic-bias-gpios = <&gpf1 7 GPIO_ACTIVE_HIGH>;
+        submic-bias-gpios = <&gpf2 0 GPIO_ACTIVE_HIGH>;
+
+        mic-bias-supply = <&mic_bias_reg>;
+        submic-bias-supply = <&submic_bias_reg>;
+
+        samsung,audio-routing =
+                "HP", "HPOUT1L",
+                "HP", "HPOUT1R",
+
+                "SPK", "SPKOUTLN",
+                "SPK", "SPKOUTLP",
+                "SPK", "SPKOUTRN",
+                "SPK", "SPKOUTRP",
+
+                "RCV", "HPOUT2N",
+                "RCV", "HPOUT2P",
+
+                "IN1LP", "Main Mic",
+                "IN1LN", "Main Mic",
+                "IN1RP", "Sub Mic",
+                "IN1LP", "Sub Mic";
+
+        cpu {
+            sound-dai = <&i2s0>;
+        };
+
+        codec {
+            sound-dai = <&wm1811>;
+        };
+
+    };
-- 
2.7.4

