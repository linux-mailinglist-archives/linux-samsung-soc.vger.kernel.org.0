Return-Path: <linux-samsung-soc+bounces-7776-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 982DCA79F03
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  3 Apr 2025 11:00:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C9FB16E397
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  3 Apr 2025 09:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF88D2475C8;
	Thu,  3 Apr 2025 08:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="levw/Q2B"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2AF24291A
	for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Apr 2025 08:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670748; cv=none; b=FdQBzb1vlCJujSCzbjfevt7LQpX88FJbCetFwRZtiB19kNWCJdDV4JjLpaJnB7VQiIb/zbEwZ/Uni9mrLT2+uK9zP49ymHOEOK/JVDqHeZQlON5xEoHekvnRL6ALabajm6QDN2apHZDWrMVv3s1elVqg1n83G/BSOmVI2fLg1dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670748; c=relaxed/simple;
	bh=IlL7av/XZ94MO9yKdjGRUMlQhb8Bpg73uC0VJ87ssYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=STKM6G4n3D7SvA+ebtplSFomjRk5SPIDSeqGLBz+WDvLnZNNkmLNHy276s39AzHES+a6D7ZWuiwuf5X+3DnKbtpHPh7wJ566RXpUpCICWSbem8CsU54kTBHhZZpmndkePukFCUJ4OqCjkOQV5dFEckEtPJAu3jwymNbJf25tbTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=levw/Q2B; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac41514a734so109025266b.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Apr 2025 01:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670744; x=1744275544; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6nQmrd18TxOApmP9ZbnJeIx1ckVKc9UGQ9P+sqT3y24=;
        b=levw/Q2BARYjso4u1EbIZt9wvNnTI1sRcgYNjuDoMU66nukLmh7AUGwFJ2nMQNk8E1
         IZBYBrWgogNkLp+w0WoA4Rnwae6WrMZZLAJV6LW/PV6PaREwMj/Y7zkuaQdntxoYrboN
         +NwQOfrKEew0K7EhHJkSg9t07MrnCGpAyi4Lm+XHuTOCJz/ATffcU8r+U4g8hmrxxBNU
         sGgucLCRMNX1DbRoJzuxpaanT5XjWNZnDV4pnhgmdQ/Vi7xpWNno0ViMcVZ4Tfr6eYO8
         1hoH1NCSd6jQBQMxWcgpH1rpEYINplQkHKsB+S8rxQR/ZAzPYsxaZWB9pO+esvU8wAE6
         tUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670744; x=1744275544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6nQmrd18TxOApmP9ZbnJeIx1ckVKc9UGQ9P+sqT3y24=;
        b=L7RklbDspO8FGYKvU//n8gSFynFSJdxmJc/0oIQiHgrMLsA6kRUqtb3wnv+5Cti+10
         o0lNUyqIvC+cOt0G6825tjWwNl6xCZcyFrv0lD5fWvqc6WrVcfJus8Gz874LaxJDcwap
         1V9e4GcTPGgTi/TIRdceceAItZh64bN95rNpP6EpDFTRrDSek1650hDb2BzuqRNtRS4k
         8RWnRUrRMziRuqBBl1sk6TzUu5vKK1VoaLCZI8K9CQlvFq0RxKfbwxi/6qcIe2vIGwSD
         4Fw9265QPopJkT2/swD1B7HhoRBBiqEz3yl3em1ou9A2Scl2BU1Ys5GLqRk+vVxAZBq8
         3P1w==
X-Forwarded-Encrypted: i=1; AJvYcCWUQ3JsDcEVkNZ9MghSuDUIlnK3BM16o51HnSNcAPvdotKLvJXrVZszHTdXj1vtUqiYWBlUM5Bp/rWChVCYv4t9hA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVw/SCo8TN10aOGX1nu5dDf0EZEBkqyKc6CGdqdoEDIek0ZqPm
	arSYnBPLSu0SsxewW8bp4JC8F5qpqJBw7Ezidsp/JCEqsVPH8YzKkP59o7Hph8E=
X-Gm-Gg: ASbGncvipJgSsj/y5eLgwYafiGlcXIxY8UccTDBVDbiGitsKN6XdLkLr/5pjK2g2laW
	SqWMfwQcT0XOIwtG9H+Z2jFF1JdTi0b0qWzbqSWLqb37SybB28tucWe7TbdlHbF3SliiuxEv+Jv
	aC+9voOsXW40EF0lom2yRzH5wgDhNQ+wWszX5DG10iTGbm/JhuGyaNpk87JG5rIWCRZ9Pe/tDle
	fLmNBXMVD6SkecZtuh6ur/QxKKZ7yzceH0bIhlSphufSRq3k/MAp4EBfTTgwctsL3c3LngMEqnc
	AEUIzHTz8buwK9w//mWWy5OBfBqQ75Ideidrs/KBTtG7fBpZg2uaR39qFahdniResGaZIT3rvSI
	LoFOpXRMGzRjIUzi6O+lEkm+BHjJI
X-Google-Smtp-Source: AGHT+IGIWTCEvGgQQzD/67aqQ+onG4uBURQ37h1HwUWRbYYu+VD7A44v+HEWQ+TW3vqt1mLDE4QMoQ==
X-Received: by 2002:a17:906:c153:b0:ac6:fcdd:5a97 with SMTP id a640c23a62f3a-ac7a1972b9emr446196566b.48.1743670743773;
        Thu, 03 Apr 2025 01:59:03 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:03 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:58:59 +0100
Subject: [PATCH v3 07/32] mfd: sec: move private internal API to internal
 header
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-7-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
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


