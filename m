Return-Path: <linux-samsung-soc+bounces-7931-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F54A8320D
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  9 Apr 2025 22:37:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E28C41B625D2
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  9 Apr 2025 20:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EF2B2139D1;
	Wed,  9 Apr 2025 20:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yC72xFrH"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5628A1E376E
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Apr 2025 20:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231053; cv=none; b=rTrN/iGRtIXiaN55y7Yx866awYELxjdRLwP/dBPMxCGQ6Hl58HTmlP85dVix6HNnNPUsZV034hhGWXlxtg6+WQvafH4MWqkXcR7d1TnR7XEvtRjb+Atj5/4C9xfv38Xq2HuJnyiSQQ0UmecFBi/u6MpETpaHWy5SaGPKZeij6jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231053; c=relaxed/simple;
	bh=tsdrTMiTnNObe2LDn3eDzMfDyfZC6HWbEFx0Lf1cNCM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DnE7OcRIemEgjjJaQZXbuW1mHtmSKfKQ8nP9nMhZP5Y6Mb33lslixSFu16qTs/vCRUs2z0zBCgeTm3Ozy7oipfS0RLrh/4vEY1/qJgPylSoGOQewHoFqF2ZkY450awCvMe11DJDifyYtLkhW2m9RKkBpc/rdNsq09PHhxQ3P+Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yC72xFrH; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac297cbe017so220764166b.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Apr 2025 13:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231050; x=1744835850; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7mtIpZ1dCwsUMG8DFGQr3qQ3OUgcfYXch7fq8kcJQB4=;
        b=yC72xFrHvj0/Yjo8RRSgm0iW6YOkLt0+dpP6Fw9RN4XNjdTlE06pVr8i6Pn1W4Rn29
         AYa1ZSN3SYNawoltyHm6nql3Ae3CzkwHARA4D386uMOFqYL9vPinxS11gFskr/QAHG1w
         y+BKHqlZm8AyQTgBq46LQvVjERMiCrHox8at0XRkixfTMU+fb/x0s7WakSL2LyMgipvS
         RrD5UKSqXupYQVEsxDQqlKduB7ZaVwSQpt0FC8XcfHCjAOj7iTaV3cIwoCCxnkrinIpC
         96CtMDEugpBwV6JxDte3DSqsggy/qJTXj9D+SjCRHKdzfNgEnnnjWBkELP4L9vIMBj8L
         LVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231050; x=1744835850;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7mtIpZ1dCwsUMG8DFGQr3qQ3OUgcfYXch7fq8kcJQB4=;
        b=gJi1Ji0FdLYrNyLccK1iDirrr6vJ7jEHltn8XG63ZOpGScJyjZ+IS3E6oZv6ODk438
         S7HF+rsGBfexMTGxFLSsYl5XFY++3gBrlyGRWsvigTEVaWZHNcN0c5poAO0W5BSJtimU
         xTMUVsmzE7A6hlC7c1TKBRXp4nBdhSKl6Aqi9b64k9Z/graJabNgFpITA5jc1l3GODW9
         OR5iFhBCiIGL3ykDj0PrFNPnFZ4hDJfLtAZLAkeTls4u0Cx3SYqWtsGfUHzr8QJ4fizu
         37F5E2ryBkHqzr3piCD6w85blEsfDC323BByY2osGTxm0lr81mx7eCIa+AZ70Ar5cXuc
         h0YA==
X-Forwarded-Encrypted: i=1; AJvYcCWK1Wrw/kcFf/kQrjsgxLYDWlPYOVWLGOR8bwB4idAqICcsmdqvYSLku82OXIsqlDaqIFazZ9Ga6bQIUThhMi3FMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXTSCqSkcPqcpz1mM2AcS12fgB1P6mqQrKj7gzrdvWYV7Gq3ps
	4pXZHiqPIPdYJmltn4n9hOVh+D0V6xdDp9eHqF/qJMKWNxRB6u591TN0apQ3V0o=
X-Gm-Gg: ASbGncuVkB6hcwTuK21vaE64cVSyWbj4oYf8YU0lI2nC/o8ePTpMHIqOXK2y12lcfsD
	ObVwKH7nomInBxGBUO6Kk0L67Mf6YaqGrT+3dS9qX9mgsqZZ4LLsAoRJgz6v/idbHL2nCa5QCaO
	BHt1M8jW+sdpQY03O68QPdGv1oncHLPIP4COHEkDfVlx9VZDqy5n2d8+/gvelP0vEFJTDpNop9/
	5vROKwnDXYag4NNiNXcvPUbFLrybyp3dwUhf0+Ghd1WIRQq+cSmXGvkFM+P068ZnA7JIu3Xldny
	/kUEWyCLocIoH4qkENxavADga6mrXDrzVIbpNb1deixU8YthHqMC8AeblTwm+qiUIJv5g0DjREa
	y4vDGukisAblSzhnL065R5TuaCVoq13wx1h/x+Q==
X-Google-Smtp-Source: AGHT+IFZHe9tjs8049MjKvJfq5LBYCiZj/mmqlSGnagdvOrDi6Wwc2Fgm3ngPo+Rfnqp+n5oWSA7zw==
X-Received: by 2002:a17:906:4fcd:b0:abf:48df:bf07 with SMTP id a640c23a62f3a-acabc24ab2bmr15261166b.15.1744231049576;
        Wed, 09 Apr 2025 13:37:29 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:29 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v4 00/32] Samsung S2MPG10 PMIC MFD-based drivers
Date: Wed, 09 Apr 2025 21:37:21 +0100
Message-Id: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAILa9mcC/2XN0Q6CIBTG8VdpXEc7cECtq96jdSFxVLYSB83Vn
 O8e2kpbl98Zvz8DixQcRXbYDCxQ76LzbRpqu2GXpmxr4s6mzSRIDSgFj/LW1QI4VdoKMhZBIUu
 vu0CVe8yl0zntxsW7D8853Ivp+mngt9ELDtxCsVeYg8whP15dWwa/86FmU6SXa1gsUCZotLJEi
 JXJzB/EBSpY/YhvKA1q0JQVP3Acxxc/uUWEEQEAAA==
X-Change-ID: 20250321-s2mpg10-ef5d1ebd3043
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

This series adds initial support for the Samsung S2MPG10 PMIC using the
MFD framework. This is a PMIC for mobile applications and is used on
the Google Pixel 6 and 6 Pro (oriole / raven).

*** dependency note ***

To compile, this depends on the Samsung ACPM driver in Linux next with
the following additional patches:
https://lore.kernel.org/all/20250324-acpm-atomic-v2-0-7d87746e1765@linaro.org/
https://lore.kernel.org/all/20250319-acpm-fixes-v2-0-ac2c1bcf322b@linaro.org/
https://lore.kernel.org/all/20250327-acpm-children-v1-0-0afe15ee2ff7@linaro.org/

*** dependency note end ***

+++ Kconfig update +++

There is a Kconfig symbol update in this series, because the existing
Samsung S2M driver has been split into core and transport (I2C & ACPM)
parts. CONFIG_MFD_SEC_CORE is now truly a core driver, and
the I2C code that was part of it is now enabled via CONFIG_MFD_SEC_I2C.

This was necessary because unlike the other S2M PMICs, S2MPG10 doesn't
talk via I2C, but via the Samsung ACPM firmware.

+++ Kconfig update end +++

This series must be applied in-order, due to interdependencies of some
of the patches. There are also various cleanup patches to the S2M
drivers. I've kept them ordered as:
  * DT bindings (patches 1 ... 3)
  * s2m mfd prep for adding S2MPG10 support (patches 4 ... 7)
  * split S2M mfd driver into s2m-core and s2m-i2c, including the
    kconfig symbol update (patch 8)
  * S2MPG10 core driver (patch 9)
  * s2m mfd driver cleanup patches (patches 10 ... 23)
  * S2MPG10 clock driver (patch 24)
  * s2m RTC prep for adding S2MPG10 (patch 25 ... 26)
  * S2MPG10 RTC driver (patch 27)
  * s2m RTC cleanup patches (patches 28 ... 31)

I realise these are many, but since some prep-work was required to be
able to add S2MPG anyway, I wanted to get the cleanup patches in as
well :-) Let me know if I should postpone them to a later date instead.

The S2MPG10 includes buck converters, various LDOs, power meters, RTC,
clock outputs, and additional GPIOs interfaces.

This series adds support in the top-level device driver, and for the
RTC and clock. Importantly, having the RTC driver allows to do a proper
reset of the system. Drivers or driver updates for the other components
will be added in future patches.

This will need a DT update for Oriole / Raven to enable this device. I
will send that out separately.

Cheers,
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v4:
- various updates to sec-acpm (patch 9, Lee)
- cache enum type in patch 25 (Krzysztof)
- collect tags
- Link to v3: https://lore.kernel.org/r/20250403-s2mpg10-v3-0-b542b3505e68@linaro.org

Changes in v3:
- Krzysztof:
  - keep 'regulators' subnode required even for s2mpg10
  - drop '$ref' and 'unevaluatedProperties' from pmic subnode, use
    'additionalProperties' instead
  - add some regulators to examples since s2mpg10 requires them as of
    v3
- sec-acpm:
  - use an enum for struct sec_acpm_bus_context::type
  - consistent name space for all functions sec_pmic_acpm_... to be
    similar to i2c and consistent in this file
- Link to v2: https://lore.kernel.org/r/20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org

Changes in v2:
- Rob:
  - make PMIC node a child of ACPM, and all related changes (binding,
    driver)
- Krzysztof:
  - merge defconfig updates into patch changing the symbols (patch 8)
  - split MODULE_AUTHOR update into a separate patch
  - better alignment fix (patch 11)
  - merge two s2dos05/s2mpu05 related patches into one (patch 14)
- myself:
  - keep PMIC DT parsing in core, not in transport driver
  - several updates in sec-acpm.c, see separate entries in patch 9
  - fix typo in patch 17
  - collect tags
- Link to v1: https://lore.kernel.org/r/20250323-s2mpg10-v1-0-d08943702707@linaro.org

---
André Draszik (32):
      dt-bindings: mfd: samsung,s2mps11: add s2mpg10
      dt-bindings: clock: samsung,s2mps11: add s2mpg10
      dt-bindings: firmware: google,gs101-acpm-ipc: add PMIC child node
      mfd: sec-core: Drop non-existing forward declarations
      mfd: sec: Sort includes alphabetically
      mfd: sec: Update includes to add missing and remove superfluous ones
      mfd: sec: Move private internal API to internal header
      mfd: sec: Split into core and transport (i2c) drivers
      mfd: sec: Add support for S2MPG10 PMIC
      mfd: sec: Merge separate core and irq modules
      mfd: sec-common: Fix multiple trivial whitespace issues
      mfd: sec-i2c: Sort struct of_device_id entries and the device type switch
      mfd: sec: Use dev_err_probe() where appropriate
      mfd: sec-i2c: s2dos05/s2mpu05: Use explicit regmap config and drop default
      mfd: sec-irq: s2dos05 doesn't support interrupts
      mfd: sec-common: Don't ignore errors from sec_irq_init()
      mfd: sec-i2c: Rework platform data and regmap instantiating
      mfd: sec: Change device_type to int
      mfd: sec: Don't compare against NULL / 0 for errors, use !
      mfd: sec-common: Use sizeof(*var), not sizeof(struct type_of_var)
      mfd: sec-common: Convert to using MFD_CELL macros
      mfd: sec-irq: Convert to using REGMAP_IRQ_REG() macros
      mfd: sec: Add myself as module author
      clk: s2mps11: add support for S2MPG10 PMIC clock
      rtc: s5m: cache device type during probe
      rtc: s5m: prepare for external regmap
      rtc: s5m: add support for S2MPG10 RTC
      rtc: s5m: fix a typo: peding -> pending
      rtc: s5m: switch to devm_device_init_wakeup
      rtc: s5m: replace regmap_update_bits with regmap_clear/set_bits
      rtc: s5m: replace open-coded read/modify/write registers with regmap helpers
      MAINTAINERS: add myself as reviewer for Samsung S2M MFD

 .../devicetree/bindings/clock/samsung,s2mps11.yaml |   1 +
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   |  35 ++
 .../devicetree/bindings/mfd/samsung,s2mps11.yaml   |  26 +-
 MAINTAINERS                                        |   3 +-
 arch/arm/configs/exynos_defconfig                  |   2 +-
 arch/arm/configs/multi_v7_defconfig                |   2 +-
 arch/arm/configs/pxa_defconfig                     |   2 +-
 arch/arm64/configs/defconfig                       |   2 +-
 drivers/clk/clk-s2mps11.c                          |   8 +
 drivers/mfd/Kconfig                                |  35 +-
 drivers/mfd/Makefile                               |   5 +-
 drivers/mfd/sec-acpm.c                             | 442 +++++++++++++++++++
 drivers/mfd/sec-common.c                           | 301 +++++++++++++
 drivers/mfd/sec-core.c                             | 481 ---------------------
 drivers/mfd/sec-core.h                             |  23 +
 drivers/mfd/sec-i2c.c                              | 239 ++++++++++
 drivers/mfd/sec-irq.c                              | 460 +++++++-------------
 drivers/rtc/rtc-s5m.c                              | 197 ++++++---
 include/linux/mfd/samsung/core.h                   |   7 +-
 include/linux/mfd/samsung/irq.h                    | 103 +++++
 include/linux/mfd/samsung/rtc.h                    |  37 ++
 include/linux/mfd/samsung/s2mpg10.h                | 454 +++++++++++++++++++
 22 files changed, 2001 insertions(+), 864 deletions(-)
---
base-commit: f58dd835f82a5dda6c9d3895ee6f15016431fb1f
change-id: 20250321-s2mpg10-ef5d1ebd3043

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


