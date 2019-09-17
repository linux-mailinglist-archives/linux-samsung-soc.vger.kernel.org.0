Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 254F5B4CA1
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 17 Sep 2019 13:14:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbfIQLOZ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 17 Sep 2019 07:14:25 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:38825 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725881AbfIQLOZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 17 Sep 2019 07:14:25 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190917111422euoutp01d8d459f4641773179982a0e87ceec236~FNX5r5R7o2292422924euoutp01l
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Sep 2019 11:14:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190917111422euoutp01d8d459f4641773179982a0e87ceec236~FNX5r5R7o2292422924euoutp01l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1568718862;
        bh=+T4Ln6oiDTILmNOD7NA9RZIJq3p9bQROpS3Hh10iuY4=;
        h=From:To:Cc:Subject:Date:References:From;
        b=fnM+BGiMe7rDSMceFjO0FgFdMCWx4YiSnskwolB0yv+mo6ikuVvXK9RJxhmEnxd8x
         LfxY7P2haOvkcglgFMxai8vLAgYlBv/U7lrklbO+t4CU3wP1DTRFwU8QWdJzNfvUA2
         aHl9Bb5arS/OuQeT5jq4WumC8vOBGb+x8tL0RJQo=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190917111421eucas1p24cc0a4b8720f2d388a61791724a3c1d6~FNX47f-yA2249822498eucas1p2E;
        Tue, 17 Sep 2019 11:14:21 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id DD.03.04469.D00C08D5; Tue, 17
        Sep 2019 12:14:21 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190917111420eucas1p1f4c9fc370f501b1ec1e2d2fb4299db96~FNX4M9dS-0399103991eucas1p1J;
        Tue, 17 Sep 2019 11:14:20 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190917111420eusmtrp11f60249cb22d27cb9bc5503c701ca00a~FNX3_cgzO0235002350eusmtrp1V;
        Tue, 17 Sep 2019 11:14:20 +0000 (GMT)
X-AuditID: cbfec7f2-569ff70000001175-f0-5d80c00d21c9
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 34.A1.04117.C00C08D5; Tue, 17
        Sep 2019 12:14:20 +0100 (BST)
Received: from AMDC2459.digital.local (unknown [106.120.51.95]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190917111419eusmtip1ab28af2e793c60c81d71d9c2eb2bcc94~FNX3W8Txq2311223112eusmtip1N;
        Tue, 17 Sep 2019 11:14:19 +0000 (GMT)
From:   Maciej Falkowski <m.falkowski@samsung.com>
To:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     krzk@kernel.org, sbkim73@samsung.com, s.nawrocki@samsung.com,
        lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, a.hajda@samsung.com,
        m.szyprowski@samsung.com, m.falkowski@samsung.com
Subject: [PATCH 1/2] dt-bindings: sound: Convert Samsung I2S controller to
 dt-schema
Date:   Tue, 17 Sep 2019 13:14:12 +0200
Message-Id: <20190917111413.22711-1-m.falkowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMKsWRmVeSWpSXmKPExsWy7djP87q8BxpiDSa857G4te4cq8WVi4eY
        LKY+fMJmMf8IkHv+/AZ2i29XOpgsLu+aw2Yx4/w+JosHzevYLNYeuctusfT6RSaL1r1H2C0O
        v2lntbi44guTA5/Hhs9NbB5r5q1h9Ng56y67x6ZVnWwefVtWMXp83iQXwBbFZZOSmpNZllqk
        b5fAlXGt5zNrwU2nittztrE2MP427mLk4JAQMJGY2eXTxcjFISSwglFi3qf1bBDOF0aJvlXv
        GbsYOYGcz4wSN1uqQGyQhjX/dzNBFC1nlFj9dT8LXMemjauZQKrYBAwk+t/sZQGxRQTqJCZO
        m8cMUsQs8JBR4s7ez+wgCWGBMImLu1vBGlgEVCW6bxxnB7mJV8BG4u2TfIht8hKrNxwA65UQ
        mMwusXX6V1aIhIvE62MNbBC2sMSr41vYIWwZidOTe1ggfquWuPZNFqK3hVHi+rS3UPXWEn9W
        TWQDqWEW0JRYv0sfIuwosWBfNxtEK5/EjbeCIGFmIHPStunMEGFeiY42IQhTVeLNhFiIRmmJ
        1jX7GSFsD4mdHfdZIMEWK3HnZj/7BEa5WQirFjAyrmIUTy0tzk1PLTbMSy3XK07MLS7NS9dL
        zs/dxAhMKqf/Hf+0g/HrpaRDjAIcjEo8vDc218cKsSaWFVfmHmKU4GBWEuENqAUK8aYkVlal
        FuXHF5XmpBYfYpTmYFES561meBAtJJCeWJKanZpakFoEk2Xi4JRqYCxwUW+xdWUq8Dnynjld
        jl9Md7+UrYLpjsorUS8YedYK/ym7IKX1rm+W3/f9H7uOLnvf1TrZ+NTj/kdfdEqlg/7c+/7/
        4tvOBz+ZfITcdlkIX5Sz2Ru5p1762+L55qkW//lnPfywdlNjZ918hZgH29XLP8rWC+wUeHPT
        cWvYvTlhcXsvqYaW5CixFGckGmoxFxUnAgCy1PfZJgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLLMWRmVeSWpSXmKPExsVy+t/xu7o8BxpiDRZukrS4te4cq8WVi4eY
        LKY+fMJmMf8IkHv+/AZ2i29XOpgsLu+aw2Yx4/w+JosHzevYLNYeuctusfT6RSaL1r1H2C0O
        v2lntbi44guTA5/Hhs9NbB5r5q1h9Ng56y67x6ZVnWwefVtWMXp83iQXwBalZ1OUX1qSqpCR
        X1xiqxRtaGGkZ2hpoWdkYqlnaGwea2VkqqRvZ5OSmpNZllqkb5egl3Gt5zNrwU2nittztrE2
        MP427mLk5JAQMJFY8383UxcjF4eQwFJGiY6u7SwQCWmJ/dc+skPYwhJ/rnWxgdhCAp8YJdae
        UAWx2QQMJPrf7GUBaRYRaGKUmH/zJ5jDLPCWUaJlxyEmkCphgRCJNwuOMYPYLAKqEt03jgNN
        5eDgFbCRePskH2KBvMTqDQeYJzDyLGBkWMUoklpanJueW2ykV5yYW1yal66XnJ+7iREY1NuO
        /dyyg7HrXfAhRgEORiUe3hub62OFWBPLiitzDzFKcDArifAG1AKFeFMSK6tSi/Lji0pzUosP
        MZoC7Z7ILCWanA+MuLySeENTQ3MLS0NzY3NjMwslcd4OgYMxQgLpiSWp2ampBalFMH1MHJxS
        DYxJU6enb0m6V8V/Rq/ls8KKb6VbTac6azVfy7j2qmiDdugnwagFK3iuHjzHN9NG9/fN52vC
        D/b7PPp295ThYbd5uUE/nrsKm05/WGdlHH3h2OH9brYt69c83JZTF/RKqHX2neKZxXHfP22o
        mSiwsdS+M9PM+1CbUAfr+tItfpM+yOdoBwRHGlxXYinOSDTUYi4qTgQAo6YkfoACAAA=
X-CMS-MailID: 20190917111420eucas1p1f4c9fc370f501b1ec1e2d2fb4299db96
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190917111420eucas1p1f4c9fc370f501b1ec1e2d2fb4299db96
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190917111420eucas1p1f4c9fc370f501b1ec1e2d2fb4299db96
References: <CGME20190917111420eucas1p1f4c9fc370f501b1ec1e2d2fb4299db96@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Convert Samsung I2S controller to newer dt-schema format

Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
---
 .../devicetree/bindings/sound/samsung-i2s.txt |  84 -------------
 .../bindings/sound/samsung-i2s.yaml           | 119 ++++++++++++++++++
 2 files changed, 119 insertions(+), 84 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/samsung-i2s.txt
 create mode 100644 Documentation/devicetree/bindings/sound/samsung-i2s.yaml

diff --git a/Documentation/devicetree/bindings/sound/samsung-i2s.txt b/Documentation/devicetree/bindings/sound/samsung-i2s.txt
deleted file mode 100644
index a88cb00fa096..000000000000
--- a/Documentation/devicetree/bindings/sound/samsung-i2s.txt
+++ /dev/null
@@ -1,84 +0,0 @@
-* Samsung I2S controller
-
-Required SoC Specific Properties:
-
-- compatible : should be one of the following.
-   - samsung,s3c6410-i2s: for 8/16/24bit stereo I2S.
-   - samsung,s5pv210-i2s: for 8/16/24bit multichannel(5.1) I2S with
-     secondary fifo, s/w reset control and internal mux for root clk src.
-   - samsung,exynos5420-i2s: for 8/16/24bit multichannel(5.1) I2S for
-     playback, stereo channel capture, secondary fifo using internal
-     or external dma, s/w reset control, internal mux for root clk src
-     and 7.1 channel TDM support for playback. TDM (Time division multiplexing)
-     is to allow transfer of multiple channel audio data on single data line.
-   - samsung,exynos7-i2s: with all the available features of exynos5 i2s,
-     exynos7 I2S has 7.1 channel TDM support for capture, secondary fifo
-     with only external dma and more no.of root clk sampling frequencies.
-   - samsung,exynos7-i2s1: I2S1 on previous samsung platforms supports
-     stereo channels. exynos7 i2s1 upgraded to 5.1 multichannel with
-     slightly modified bit offsets.
-
-- reg: physical base address of the controller and length of memory mapped
-  region.
-- dmas: list of DMA controller phandle and DMA request line ordered pairs.
-- dma-names: identifier string for each DMA request line in the dmas property.
-  These strings correspond 1:1 with the ordered pairs in dmas.
-- clocks: Handle to iis clock and RCLK source clk.
-- clock-names:
-  i2s0 uses some base clocks from CMU and some are from audio subsystem internal
-  clock controller. The clock names for i2s0 should be "iis", "i2s_opclk0" and
-  "i2s_opclk1" as shown in the example below.
-  i2s1 and i2s2 uses clocks from CMU. The clock names for i2s1 and i2s2 should
-  be "iis" and "i2s_opclk0".
-  "iis" is the i2s bus clock and i2s_opclk0, i2s_opclk1 are sources of the root
-  clk. i2s0 has internal mux to select the source of root clk and i2s1 and i2s2
-  doesn't have any such mux.
-- #clock-cells: should be 1, this property must be present if the I2S device
-  is a clock provider in terms of the common clock bindings, described in
-  ../clock/clock-bindings.txt.
-- clock-output-names (deprecated): from the common clock bindings, names of
-  the CDCLK I2S output clocks, suggested values are "i2s_cdclk0", "i2s_cdclk1",
-  "i2s_cdclk3" for the I2S0, I2S1, I2S2 devices respectively.
-
-There are following clocks available at the I2S device nodes:
- CLK_I2S_CDCLK    - the CDCLK (CODECLKO) gate clock,
- CLK_I2S_RCLK_PSR - the RCLK prescaler divider clock (corresponding to the
-		    IISPSR register),
- CLK_I2S_RCLK_SRC - the RCLKSRC mux clock (corresponding to RCLKSRC bit in
-		    IISMOD register).
-
-Refer to the SoC datasheet for availability of the above clocks.
-The CLK_I2S_RCLK_PSR and CLK_I2S_RCLK_SRC clocks are usually only available
-in the IIS Multi Audio Interface.
-
-Note: Old DTs may not have the #clock-cells property and then not use the I2S
-node as a clock supplier.
-
-Optional SoC Specific Properties:
-
-- samsung,idma-addr: Internal DMA register base address of the audio
-  sub system(used in secondary sound source).
-- pinctrl-0: Should specify pin control groups used for this controller.
-- pinctrl-names: Should contain only one value - "default".
-- #sound-dai-cells: should be 1.
-
-
-Example:
-
-i2s0: i2s@3830000 {
-	compatible = "samsung,s5pv210-i2s";
-	reg = <0x03830000 0x100>;
-	dmas = <&pdma0 10
-		&pdma0 9
-		&pdma0 8>;
-	dma-names = "tx", "rx", "tx-sec";
-	clocks = <&clock_audss EXYNOS_I2S_BUS>,
-		<&clock_audss EXYNOS_I2S_BUS>,
-		<&clock_audss EXYNOS_SCLK_I2S>;
-	clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
-	#clock-cells = <1>;
-	samsung,idma-addr = <0x03000000>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2s0_bus>;
-	#sound-dai-cells = <1>;
-};
diff --git a/Documentation/devicetree/bindings/sound/samsung-i2s.yaml b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
new file mode 100644
index 000000000000..59dc76035cb4
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/samsung-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung SoC I2S controller
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+  - Sangbeom Kim <sbkim73@samsung.com>
+  - Sylwester Nawrocki <s.nawrocki@samsung.com>
+
+properties:
+  compatible:
+    description: |
+      samsung,s3c6410-i2s: for 8/16/24bit stereo I2S.
+
+      samsung,s5pv210-i2s: for 8/16/24bit multichannel(5.1) I2S with
+      secondary fifo, s/w reset control and internal mux for root clk src.
+
+      samsung,exynos5420-i2s: for 8/16/24bit multichannel(5.1) I2S for
+      playback, stereo channel capture, secondary fifo using internal
+      or external dma, s/w reset control, internal mux for root clk src
+      and 7.1 channel TDM support for playback. TDM (Time division multiplexing)
+      is to allow transfer of multiple channel audio data on single data line.
+
+      samsung,exynos7-i2s: with all the available features of exynos5 i2s.
+
+      exynos7 I2S has 7.1 channel TDM support for capture, secondary fifo
+      with only external dma and more no.of root clk sampling frequencies.
+
+      samsung,exynos7-i2s1: I2S1 on previous samsung platforms supports
+      stereo channels. exynos7 i2s1 upgraded to 5.1 multichannel with
+      slightly modified bit offsets.
+    enum:
+      - "samsung,s3c6410-i2s"
+      - "samsung,s5pv210-i2s"
+      - "samsung,exynos5420-i2s"
+      - "samsung,exynos7-i2s"
+      - "samsung,exynos7-i2s1"
+
+  reg:
+    maxItems: 1
+
+  dmas:
+    description: list of DMA controller phandle and DMA request line ordered pairs.
+
+  dma-names:
+    description: |
+      identifier string for each DMA request line in the dmas property.
+      These strings correspond 1:1 with the ordered pairs in dmas.
+
+  clocks:
+    minItems: 1
+    maxItems: 3
+
+  clock-names:
+    oneOf:
+      - items:
+          - const: iis
+      - items:
+          - const: iis
+          - const: i2s_opclk0
+      - items:
+          - const: iis
+          - const: i2s_opclk0
+          - const: i2s_opclk1
+    description: |
+      "iis" is the i2s bus clock.
+      For i2s1 and i2s2 - "iis", "i2s_opclk0"
+      For i2s0 - "iis", "i2s_opclk0", "i2s_opclk1"
+
+  "#clock-cells":
+    const: 1
+
+  samsung,idma-addr:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Internal DMA register base address of the audio
+      sub system(used in secondary sound source).
+
+  pinctrl-0:
+    description: Should specify pin control groups used for this controller.
+
+  pinctrl-names:
+    const: default
+
+  "#sound-dai-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - dmas
+  - dma-names
+  - clocks
+  - clock-names
+
+examples:
+  - |
+    i2s0: i2s@3830000 {
+        compatible = "samsung,s5pv210-i2s";
+        reg = <0x03830000 0x100>;
+        dmas = <&pdma0 10
+                &pdma0 9
+                &pdma0 8>;
+        dma-names = "tx", "rx", "tx-sec";
+        clocks = <&clock_audss 0>, // EXYNOS_I2S_BUS
+                <&clock_audss 0>, // EXYNOS_I2S_BUS
+                <&clock_audss 0>; // EXYNOS_SCLK_I2S
+        clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
+        #clock-cells = <1>;
+        samsung,idma-addr = <0x03000000>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&i2s0_bus>;
+        #sound-dai-cells = <1>;
+    };
+
-- 
2.17.1

