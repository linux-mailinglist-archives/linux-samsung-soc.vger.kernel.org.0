Return-Path: <linux-samsung-soc+bounces-601-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFA080E7A7
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 12 Dec 2023 10:31:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85763282BC6
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 12 Dec 2023 09:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2486584F8;
	Tue, 12 Dec 2023 09:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="frpOk7iE"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23BEFD9
	for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Dec 2023 01:31:12 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40c3f68b79aso32864295e9.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Dec 2023 01:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702373470; x=1702978270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NVnjFBFz55vwuXcf5dpaWSskODt2yW9zgN1+Y6WbSck=;
        b=frpOk7iE3iN+cOlot0z0VFu2ULEK6USe63qMPGeBVisSI50BQ8ys7oaPB1gZq0Atn9
         u3boAojj/wKvASeK4hheSwQVfdSX5pWMMJisFhwhPSf9FT4X0El42mczwydTrU5veSpE
         nGnXGwL8XC6ln5nWQIKVJBB4F+Zn2MxkU8EE7r/vQYXTvM4/mndHTOXrZ14nV/umOBWi
         ShVdZfoKTwnBPpaUUCcHKEe3+hsF40CKYDXocAyQOWcFYYypReqjSXaunCmofatnSxvn
         axBQkMRbVEYVuuTUuYOQrxlbBxB7XAsfyb22LLnvIoJ8j3jmUnkmBxScWGBngoElJc2H
         Xbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702373470; x=1702978270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NVnjFBFz55vwuXcf5dpaWSskODt2yW9zgN1+Y6WbSck=;
        b=nfO8/ET1sBWbk14Op9UAEEJR6IuwY5VF9eZjMJfXw+MzMDqOE3pNNrjEg9U0e4N8xb
         bt3FaLuduGcIHJvExBwQrPI/WrOq++Rv/7A9wqTGLKTkuWQVzEZjJaHKA5Fly0pMXwId
         cQpbrjU735xUt4ZxedqJIKbXkBHpPyXjANoVZyFsAcL+IH/GKcZFnrifNshefr6MQeg5
         L+OikmyViQRjopEXBT3A13VQISPEHF/j6cI+XTeSlM1gdAi5mCz/Q/QdtLksIK9BVk3d
         yEUEjgxnI8wiYjUNIJd8i8/0iBVJ7Nn3tuwa3GZVGxrxNW5jlcWvBd6zgrQMo6NkPSY4
         LCFw==
X-Gm-Message-State: AOJu0YzRcG83JEfPa9GoS0hn/BE/DdF7v+yolGG6KQhpNSaozs1CJlj/
	Zu+IXwNpkdHNdGBi1yd22T6pvg==
X-Google-Smtp-Source: AGHT+IHsBMD4HPskhcKBj6CsvZc0x/kXc8Rz3Q4Lo1KDd6I8GyolcXLw0xRVM/BY8ShVZqGZwcYz1g==
X-Received: by 2002:a05:600c:2149:b0:40c:2b85:5b74 with SMTP id v9-20020a05600c214900b0040c2b855b74mr2832288wml.85.1702373470496;
        Tue, 12 Dec 2023 01:31:10 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id q12-20020a05600c46cc00b0040b4c59f133sm15799711wmo.1.2023.12.12.01.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 01:31:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Jaewon Kim <jaewon02.kim@samsung.com>
Subject: [GIT PULL 1/2] arm64: dts: samsung: Exynops and Google for v6.8
Date: Tue, 12 Dec 2023 10:31:04 +0100
Message-Id: <20231212093105.13938-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

DTS and bindings for v6.8, together.  Explanation for this is in first point of
pull-request tag message below.  The bindings are still kept on topic branch,
just in case if any other subsystem wants to pull them.

I expect this week to take more Google GS101 changes, so there will be later
another pull request on top of this one.  If you have any comments about GS101,
now is good time to say.

Best regards,
Krzysztof


The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.8

for you to fetch changes up to 40af852a7ca59d23ab4afd02af2623121da2f116:

  Merge branch 'for-v6.8/samsung-bindings-compatibles' into next/dt64 (2023-12-11 08:41:24 +0100)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.8

Two (and a half) major items are coming with this pull request:
1. Add specific compatibles to all Samsung Exynos and Tesla FSD blocks,
   because that's what guidelines expect [1] and is generally
   recommended practice.  Existing compatibles are left untouched, thus
   no driver changes are needed.  The work only cleans things up, so any
   future contributions will use recommended style: specific and
   fallback compatibles.

   Since no driver changes are needed in this work and the DTS is
   directly affected by bindings change (running tests with `make
   dtbs_check`), this pull includes all bindings changes, even though
   usual practice is that bindings come via driver subsystem.  Keeping
   everything here makes review and testing easier.  Also will allow us
   to avoid conflicts related to new platforms (see below).

2. Add ExynosAutov920 SoC and SADK board (Samsung Automotive Development
   Kit) with minimal support so far: serial console, GPIO-based keys and
   PWM fan.

3. Add few bindings for upcoming Google GS101 SoC.  This pull request
   does not include its DTS yet, just few reviewed dependencies.  DTS
   will be coming soon.

[1] Documentation/devicetree/bindings/writing-bindings.rst

----------------------------------------------------------------
Jaewon Kim (10):
      arm64: dts: exynos: add gpio-key node for exynosautov9-sadk
      dt-bindings: samsung: exynos-sysreg: add exynosautov920 sysreg
      dt-bindings: samsung: exynos-pmu: add exynosautov920 compatible
      dt-bindings: samsung: usi: add exynosautov920-usi compatible
      dt-bindings: serial: samsung: add exynosautov920-uart compatible
      dt-bindings: pwm: samsung: add exynosautov920 compatible
      dt-bindings: arm: samsung: Document exynosautov920 SADK board binding
      dt-bindings: hwinfo: samsung,exynos-chipid: add exynosautov920 compatible
      arm64: dts: exynos: add initial support for exynosautov920 SoC
      arm64: dts: exynos: add minimal support for exynosautov920 sadk board

Krzysztof Kozlowski (28):
      dt-bindings: hwinfo: samsung,exynos-chipid: add specific compatibles for existing SoC
      dt-bindings: i2c: exynos5: add specific compatibles for existing SoC
      dt-bindings: i2c: samsung,s3c2410-i2c: add specific compatibles for existing SoC
      dt-bindings: mmc: samsung,exynos-dw-mshc: add specific compatibles for existing SoC
      dt-bindings: rtc: s3c-rtc: add specific compatibles for existing SoC
      dt-bindings: serial: samsung: add specific compatibles for existing SoC
      dt-bindings: samsung: exynos-pmu: add specific compatibles for existing SoC
      dt-bindings: gpu: arm,mali-midgard: add specific compatibles for existing Exynos SoC
      dt-bindings: iio: samsung,exynos-adc: add specific compatibles for existing SoC
      ASoC: dt-bindings: samsung-i2s: add specific compatibles for existing SoC
      dt-bindings: pwm: samsung: add specific compatibles for existing SoC
      arm64: dts: exynos5433: add specific compatibles to several blocks
      arm64: dts: exynos7: add specific compatibles to several blocks
      arm64: dts: exynos7885: add specific compatibles to several blocks
      arm64: dts: exynos850: add specific compatibles to several blocks
      arm64: dts: exynosautov9: add specific compatibles to several blocks
      Merge branch 'for-v6.8/samsung-bindings-compatibles' into next/dt64
      arm64: dts: exynos850: use Exynos7 fallbacks for pin wake-up controllers
      arm64: dts: exynosautov9: use Exynos7 fallbacks for pin wake-up controller
      dt-bindings: i2c: exynos5: add specific compatible for Tesla FSD
      dt-bindings: pwm: samsung: add specific compatible for Tesla FSD
      dt-bindings: serial: samsung: add specific compatible for Tesla FSD
      dt-bindings: samsung: exynos-pmu: add specific compatible for Tesla FSD
      dt-bindings: watchdog: samsung: add specific compatible for Tesla FSD
      Merge branch 'for-v6.8/samsung-bindings-compatibles' into next/dt64
      arm64: dts: fsd: add specific compatibles for Tesla FSD
      dt-bindings: samsung: exynos-sysreg: combine exynosautov920 with other enum
      Merge branch 'for-v6.8/samsung-bindings-compatibles' into next/dt64

Peter Griffin (3):
      dt-bindings: soc: samsung: exynos-pmu: Add gs101 compatible
      dt-bindings: clock: Add Google gs101 clock management unit bindings
      dt-bindings: soc: google: exynos-sysreg: add dedicated SYSREG compatibles to GS101

 .../bindings/arm/samsung/samsung-boards.yaml       |    6 +
 .../bindings/clock/google,gs101-clock.yaml         |  106 ++
 .../devicetree/bindings/gpu/arm,mali-midgard.yaml  |    5 +
 .../bindings/hwinfo/samsung,exynos-chipid.yaml     |   18 +-
 .../devicetree/bindings/i2c/i2c-exynos5.yaml       |   11 +-
 .../bindings/i2c/samsung,s3c2410-i2c.yaml          |   22 +-
 .../bindings/iio/adc/samsung,exynos-adc.yaml       |   29 +-
 .../bindings/mfd/samsung,exynos5433-lpass.yaml     |    2 +-
 .../bindings/mmc/samsung,exynos-dw-mshc.yaml       |   25 +-
 .../devicetree/bindings/pwm/pwm-samsung.yaml       |    4 +
 Documentation/devicetree/bindings/rtc/s3c-rtc.yaml |    5 +
 .../devicetree/bindings/serial/samsung_uart.yaml   |   17 +-
 .../bindings/soc/samsung/exynos-pmu.yaml           |   10 +
 .../bindings/soc/samsung/exynos-usi.yaml           |    6 +-
 .../soc/samsung/samsung,exynos-sysreg.yaml         |    5 +
 .../devicetree/bindings/sound/samsung-i2s.yaml     |   19 +-
 .../devicetree/bindings/watchdog/samsung-wdt.yaml  |   21 +-
 arch/arm64/boot/dts/exynos/Makefile                |    3 +-
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         |   60 +-
 arch/arm64/boot/dts/exynos/exynos7.dtsi            |   18 +-
 arch/arm64/boot/dts/exynos/exynos7885.dtsi         |   45 +-
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |   40 +-
 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts   |   51 +
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi       |   10 +-
 .../boot/dts/exynos/exynosautov920-pinctrl.dtsi    | 1266 ++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts |   88 ++
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     |  312 +++++
 arch/arm64/boot/dts/tesla/fsd.dtsi                 |   32 +-
 include/dt-bindings/clock/google,gs101.h           |  392 ++++++
 29 files changed, 2494 insertions(+), 134 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov920-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov920.dtsi
 create mode 100644 include/dt-bindings/clock/google,gs101.h

