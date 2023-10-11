Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E07D97C44F4
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 11 Oct 2023 00:50:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344230AbjJJWuw (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 10 Oct 2023 18:50:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344311AbjJJWuZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Oct 2023 18:50:25 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9968018C
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Oct 2023 15:50:14 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3248ac76acbso5508665f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Oct 2023 15:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696978213; x=1697583013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8B+1n8ZspvMDAO+6CGyqMp1YUiIBa+Rr/m0wXbQpt1w=;
        b=XEcGGDWa+ltAk6yU5x8v/VX0p1xtXMFqwqzZj5H3IaqH9s0WWzrv8BUzjE/wEdbs6f
         9u3YEk1jdqLgZatgpQH5Y+rbS9nDJo0+z3Yi5USi/+Phqftko3zmYKY7ah6up9Gr03PG
         nNnPxxXmqmOliHEnVxm1w73nyIxHTpqXX6/jt5rwM3/7J2B4ZYvfo90qySiNO8HYqvV9
         KeSmhP0xDYGcRfovcGSjuNCkluVgEANXJKqe06D1d6Dg7EUdxL6C1ioQfouorSfiZcqR
         7cE5HyZnrj9SeA+vJ4qyop2bqhA8aUxNjVZMrrs3bYTHi79qBeQGGJmYu8/N34fjXUZ6
         Ur8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696978213; x=1697583013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8B+1n8ZspvMDAO+6CGyqMp1YUiIBa+Rr/m0wXbQpt1w=;
        b=tJ6LHxWSkENQAb45J6rkzi6OfASEqyPPj9pYTHouEqNE1s6ZukUWh1XdWM/xvHoTMl
         lV1u2bJz6KtvGC6G8mHT6m+L+z8roIIWod3ejkgVI1BZ+xYzlKE3TAJV9BKUT66Qk+LB
         AtCb+lCw+HcWMamDe0qTl51oI7ZE1UWYPPhWvUi/i4iWgDTcXENbEx0mnh1TICgf7BOO
         Q56iZX+bdtKAII2HPPFMnuU04cy+ijfROfKfDPzahOtVyYcH/fZfv+Ad/ymwZu5QBf1v
         cvsiFtJGc5bffAL3XQen697rollPjQQ5ZNDOFpIhWTXbgQRGzfBe1iCDw0wuonTIlmEk
         3DEg==
X-Gm-Message-State: AOJu0YzSGYMtRqUiFpb5V/v7IreCDO2hjSC8gzEmVnhO+vIdGYCBJ+2q
        Ci0omMtlBFBXwA4RWxYDbh0Mrw==
X-Google-Smtp-Source: AGHT+IFNKYWmXPYya1Bjw42Oh7jD9oz26ynuGCLLvWuIaWGFX6zOsUeNHcNJv6bU1UptvL6ZW4qmrg==
X-Received: by 2002:a5d:5103:0:b0:31f:b138:5a0 with SMTP id s3-20020a5d5103000000b0031fb13805a0mr16014732wrt.48.1696978212798;
        Tue, 10 Oct 2023 15:50:12 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id j13-20020adfe50d000000b003196b1bb528sm13689547wrm.64.2023.10.10.15.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 15:50:11 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: [PATCH v2 18/20] arm64: dts: google: Add initial Oriole/pixel 6 board support
Date:   Tue, 10 Oct 2023 23:49:26 +0100
Message-ID: <20231010224928.2296997-19-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
In-Reply-To: <20231010224928.2296997-1-peter.griffin@linaro.org>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add initial board support for the Pixel 6 phone code named Oriole. This
has been tested with a minimal busybox initramfs and boots to a shell.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/boot/dts/google/Makefile         |  4 ++
 arch/arm64/boot/dts/google/gs101-oriole.dts | 79 +++++++++++++++++++++
 2 files changed, 83 insertions(+)
 create mode 100644 arch/arm64/boot/dts/google/Makefile
 create mode 100644 arch/arm64/boot/dts/google/gs101-oriole.dts

diff --git a/arch/arm64/boot/dts/google/Makefile b/arch/arm64/boot/dts/google/Makefile
new file mode 100644
index 000000000000..5cea8ff27141
--- /dev/null
+++ b/arch/arm64/boot/dts/google/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+
+dtb-$(CONFIG_ARCH_GOOGLE_TENSOR) += \
+	gs101-oriole.dtb \
diff --git a/arch/arm64/boot/dts/google/gs101-oriole.dts b/arch/arm64/boot/dts/google/gs101-oriole.dts
new file mode 100644
index 000000000000..3bebca989d34
--- /dev/null
+++ b/arch/arm64/boot/dts/google/gs101-oriole.dts
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Oriole Device Tree
+ *
+ * Copyright 2021-2023 Google,LLC
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include "gs101-pinctrl.h"
+#include "gs101.dtsi"
+
+/ {
+	model = "Oriole";
+	compatible = "google,gs101-oriole", "google,gs101";
+
+	chosen {
+		bootargs = "earlycon=exynos4210,mmio32,0x10A00000 console=ttySAC0";
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&key_voldown &key_volup &key_power>;
+
+		button-vol-down {
+			label = "KEY_VOLUMEDOWN";
+			linux,code = <KEY_VOLUMEDOWN>;
+			gpios = <&gpa7 3 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-vol-up {
+			label = "KEY_VOLUMEUP";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&gpa8 1 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-power {
+			label = "KEY_POWER";
+			linux,code = <KEY_POWER>;
+			gpios = <&gpa10 1 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+	};
+};
+
+&pinctrl_1 {
+	key_voldown: key-voldown-pins {
+		samsung,pins = "gpa7-3";
+		samsung,pin-function = <0xf>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	key_volup: key-volup-pins {
+		samsung,pins = "gpa8-1";
+		samsung,pin-function = <0xf>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+};
+
+&pinctrl_0 {
+	key_power: key-power-pins {
+		samsung,pins = "gpa10-1";
+		samsung,pin-function = <0xf>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+};
+
+&watchdog_cl0 {
+	timeout-sec = <30>;
+};
-- 
2.42.0.609.gbb76f46606-goog

