Return-Path: <linux-samsung-soc+bounces-7668-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD30A74AE1
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 28 Mar 2025 14:40:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89C1B1B62F00
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 28 Mar 2025 13:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7474321B9DC;
	Fri, 28 Mar 2025 13:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LaphHLOu"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0DC1922F5
	for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Mar 2025 13:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168663; cv=none; b=qHewwHgeAzdjIVunQZgSkzUsNfi9rRvyWcrT5AqLzZE1k0b0iBiXZrd+dlRyl3q1GPcNwojDeIlUnhP2J3j4dRwiUf4XeZORlINyo0JCrtuyEAvftpVyYdnA3McAnY3Kc2iVAsW4LLDkvebqE3TDHO0b7s3UNcutTUY03+TM30g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168663; c=relaxed/simple;
	bh=IlL7av/XZ94MO9yKdjGRUMlQhb8Bpg73uC0VJ87ssYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wp5D4/PbDyaGN2tw6n3ZOYq5Q3dvLapsknNZR/coy76cQ5BJBaYinnK/AQAgaPX0/hs2s7PvcqVqUFfUGwcMRZ4vd8FKDgdveZH086YpdaKjuQGRBWbE3CJqB18dBHO5f5iNZL65ngUBMSRnxSy5Q2XNQfCRGp6giY5NSI1OXeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LaphHLOu; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e614da8615so4053786a12.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Mar 2025 06:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168657; x=1743773457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6nQmrd18TxOApmP9ZbnJeIx1ckVKc9UGQ9P+sqT3y24=;
        b=LaphHLOunJ6nLTDCb1/Fq2N2erxfLlZF7ClL/o0i7MrqyJ+vfSmrQY5kzaD+OTI+Z2
         5Vdi+EmToMY+v2ukteM21QA0dEOWxe2Dpf6DtTiU59v/rTPxLnxY6tTwgWPRo+G9VFyj
         Il9SftqQsZ0dZHPCl4GThYFPu5zxIe2/WWrQ50Mt765HMF7yewC5HKG8RdhWRKOORdkz
         v8v0pQwLqWSu+A9RyNJjf1mWvt/1ejX/Q9wV5jvOS5Qs1q5cuMMGJTwkGt6pDC5/Qc+X
         lfkb8EE7AWwQ2k0NdyNEyPx2u7wO+usSIxqKPeqns8CBJtVzVW6tTNXMLpZILzx9pnW6
         U7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168657; x=1743773457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6nQmrd18TxOApmP9ZbnJeIx1ckVKc9UGQ9P+sqT3y24=;
        b=VglSdff0dHSIKVoC9YqO+vgI/ktw7Ck6tkOBqSNK5Yjw5gHn0fOLc770frVAHLxKn7
         maGr8Ce8ziTEgx8yBfIEr3noppg/qFoky0UIBRFST1Og0caTfXRn9sl9jzK+tLAwxlZM
         XKorfTwfcpMFHLZ1oBfeyL/22/VEG5PWn0l/pyYREGGpMM6F2kSkP/I/fiqfeyzgam35
         3RMJ8kfRvYG4vPnwmQiJhd23Sg16sf72A6R6SoiA17Qe678R4oK2YB9tY/YSPRp7xK7L
         1IAHxeYR8SRFRDRfEpeLK1/RGC/ybIPIGXixUEIJcIwmh+D9tI1dC2uCFZ8EIa/OCEZr
         wDOg==
X-Forwarded-Encrypted: i=1; AJvYcCV/GoSR7Kc8zNwIxxEklxT8J2iIZ9SsndzPOSXfqjoEm7dgRZsPcQGbSJYyF08CptPcugCCHW3mGp7R9fwz65vouA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOD0GvQsd5MPvAAJjghUHDQkh7m0VswjFn+8+MI4fEwQ2PvUEN
	mCdZx2dzxV6dzvnNzXH4RrIl5nIwuuw32e+QIsiLEbWfm9H74bNqWfO2yjFSEfE=
X-Gm-Gg: ASbGncsClDTojmR/jklTRFsqqTn5UseGFAYtlkx2DG26JzoGccimgP7cmijBg5TPk92
	o4xaJ59w2qfY/Y5YxacA5kIDm/tP2q+qi8L17iNqQ2kmaNvkcCeGCocVRwMk/7jaIV6RkplwFJ1
	VcEpVxmPSObcZXuiKu+7UCCYx3p66jQFZM1H/3yOkOmynneAq+ES7L+9ziXjxM1RqD3MznaCp+T
	13Yu1/h1mghV5bNOoPrpgNYFIK4tEAdNbQhFu++TFbhsUr+GUmEqCaJto5fUg5u2HPJbDZGILDQ
	vYxRqTAaDFhbnMsu5A9iCwAb4AzWrfm3Hqd3Epp2z7XmLubJ5OGGg/GgQFuhVE2j/1RkRJMRZ1Z
	k85NqG7ndDkBabEwlLsufC33Ht51rHqiPz6+u52w=
X-Google-Smtp-Source: AGHT+IEDo86URQ/5J1pNelKGYJ8OGydWpyLMuY32LUGaX685CyFB9P3SWcHpHTAbe46LCEULHTzjdg==
X-Received: by 2002:a05:6402:360f:b0:5e8:bcf2:832a with SMTP id 4fb4d7f45d1cf-5edc46379e5mr2912219a12.10.1743168657106;
        Fri, 28 Mar 2025 06:30:57 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:30:56 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:28:53 +0000
Subject: [PATCH v2 07/32] mfd: sec: move private internal API to internal
 header
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-7-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
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

sec_irq_init() is an internal API for the core driver, and doesn't
belong into the public header.

Due to an upcoming split of the driver into a core and i2c driver,
we'll also be adding more internal APIs, which again shouldn't be in
the public header.

Move it into a new internal include.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 MAINTAINERS                      |  2 +-
 drivers/mfd/sec-core.c           |  1 +
 drivers/mfd/sec-core.h           | 15 +++++++++++++++
 drivers/mfd/sec-irq.c            |  1 +
 include/linux/mfd/samsung/core.h |  2 --
 5 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 322ee00547f6e494a96d2495092f72148da22bd0..d4d577b54d798938b7a8ff0c2bdbd0b61f87650f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21407,7 +21407,7 @@ F:	Documentation/devicetree/bindings/mfd/samsung,s5m*.yaml
 F:	Documentation/devicetree/bindings/regulator/samsung,s2m*.yaml
 F:	Documentation/devicetree/bindings/regulator/samsung,s5m*.yaml
 F:	drivers/clk/clk-s2mps11.c
-F:	drivers/mfd/sec*.c
+F:	drivers/mfd/sec*.[ch]
 F:	drivers/regulator/s2m*.c
 F:	drivers/regulator/s5m*.c
 F:	drivers/rtc/rtc-s5m.c
diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index b12020c416aa8bf552f3d3b7829f6a38a773f674..83693686567df61b5e09f7129dc6b01d69156ff3 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -23,6 +23,7 @@
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include "sec-core.h"
 
 static const struct mfd_cell s5m8767_devs[] = {
 	{ .name = "s5m8767-pmic", },
diff --git a/drivers/mfd/sec-core.h b/drivers/mfd/sec-core.h
new file mode 100644
index 0000000000000000000000000000000000000000..b3fded5f02a0ddc09a9508fd49a5d335f7ad0ee7
--- /dev/null
+++ b/drivers/mfd/sec-core.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2012 Samsung Electronics Co., Ltd
+ *                http://www.samsung.com
+ * Copyright 2025 Linaro Ltd.
+ *
+ * Samsung SxM core driver internal data
+ */
+
+#ifndef __SEC_CORE_INT_H
+#define __SEC_CORE_INT_H
+
+int sec_irq_init(struct sec_pmic_dev *sec_pmic);
+
+#endif /* __SEC_CORE_INT_H */
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 3ed2902c3a2634a6ea656d890ecea934053bd192..4d49bb42bd0d109263f485c8b58e88cdd8d598d9 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -18,6 +18,7 @@
 #include <linux/mfd/samsung/s5m8767.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
+#include "sec-core.h"
 
 static const struct regmap_irq s2mps11_irqs[] = {
 	[S2MPS11_IRQ_PWRONF] = {
diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index b7008b50392ab857751b89e0a05d2c27f6306906..8a4e660854bbc955b812b4d61d4a52a0fc2f2899 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -71,8 +71,6 @@ struct sec_pmic_dev {
 	struct regmap_irq_chip_data *irq_data;
 };
 
-int sec_irq_init(struct sec_pmic_dev *sec_pmic);
-
 struct sec_platform_data {
 	struct sec_regulator_data	*regulators;
 	struct sec_opmode_data		*opmode;

-- 
2.49.0.472.ge94155a9ec-goog


