Return-Path: <linux-samsung-soc+bounces-5635-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F09FE9E5DB3
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  5 Dec 2024 18:54:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1C3B1685D7
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  5 Dec 2024 17:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C848229B07;
	Thu,  5 Dec 2024 17:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tz8xlXkP"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E99E22579E
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Dec 2024 17:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733421235; cv=none; b=a6pOf9Mr5ftzLXy7Qtm5scZB7KLEBgW6d6ntjgS+4uWW7llZItyx0j19HXvNJjcWWMeE63fZPkdvDUWTMrW1ZrwEp9hV98arDLUS9XAQFKyp79ahanRFNNNW2AnEFUlcQwqZBOCj0YDQiqS3sg3yRumpcVL3NVZVeq+0O5IEGGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733421235; c=relaxed/simple;
	bh=qbI30OBjhcxwx7q9m0h147szVhKqEGEII+V2vpiK3Z0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=avsqQXFPDTq5MNflOb6X1djNOiDDiFFgJ5pKSXO7cUJGQF788pf25GCW+1aCqoOhtg5dcLRC1vEzy49tyiXV8kxw0OnqzFlLxlAtKFCQKicaAOOyglMnfvolZN0uzJe/Brcvzds2wQffXCuBEPVMviwUk4BWpgOmy2vHorfm/Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tz8xlXkP; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-382610c7116so740452f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Dec 2024 09:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733421231; x=1734026031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3SFWaJN6iUZOCWA2ld6WDlPCU4xlYdVi3yzQATc9LpI=;
        b=tz8xlXkPDHWG5JiT5HAhsN5bVF241igwgu6MSfUrdgAQtGjepWEESdVteV5ZTvcNvn
         bDRtsTQe4ZXufKdWMtJ6xtLb0Qg0yTjyLjuvyyl1jEKKkpoaINnlrOKKUlGxIXzXRNP3
         4XpBAcmtCqkSi9h6NatgeG+zQdQXRZm+rB323q6WoELbeBsnYGXfJaV2VdN0LyD1Zv1j
         zIz1NaIgOj186S+/MlYDh6rcsMI1BEL/8APkhoJQnCHhBmvy8dD7JgQZ8yVRxaND24C/
         qRIkq1ghNTknBuuRaKfp29Ko7dHttC1Cg/AI/1cBg4JuHlqwzJP8lUD1Pi10xBKeoMNN
         +/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733421231; x=1734026031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3SFWaJN6iUZOCWA2ld6WDlPCU4xlYdVi3yzQATc9LpI=;
        b=mFI/NCLHbHbde4HHy3IPSDs5M+EUtvImMiQ2PTwJ736Jirwz5HwZg7E+lON35msClj
         e0Y6aHyma2AAnQUpE43obZShcrDGFnofnvANaFmsLok719qhKG39BDQp6mtWIZoOy84o
         bFSff7fC2iJPhE3cWD41x2MJVGHpC9rg0aakNfgIXaaG6BqLEHkvwf3dCMDyPt/par1D
         513X+t3Q5Rs+rwSMit59StW2TP/3Q0+bGPwGxfa1nxJS76l5NbhcGY21xZG31vJ7m23K
         +TCA2mzfirn0YvlFX824FwitXe6/7UWsYPZJBnH4fQdy4Q64hP/iBKT81qmVux63wpe0
         cbHQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4tiSlir4QcKmnUZTl7JToJ5MLxdBoxynpFSjRJUl1Fmtf7s3dk2kxq8vujyK/kCjbgf87upW5zxQkRT0kgSeEQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPOFOwhE34Ii2Z9bJinpDrNiqAoATTaoo0zhdY6CBXRM+1v0Ie
	MFq94MePsmpvzK7GL3i4ff3VzKl2sU+D44DOkWASAw/BKBNORPsVvtGW7+CUYXc=
X-Gm-Gg: ASbGncuSpTNf95wKhd/MHFPCTnOgoE9C0K9YgUkVkoTuUBEkLThVbZMdglfIXbu4zLD
	p1M5jeXu1r+t4UWBDvJ39eKpBkePqWBIm87gALfroCcK16OUdq1XrQS9gVw3eqEDqHO3Var+TFX
	4HVP9VG78TPX5HdFgDGLWMvSmi3JMBCxVliyuLRgwz2IBXK9WmJsqniS8gWBKBP4tsPHarnfTOS
	rbNZaIae9qoA9JEAXajPl2CB082oEvJiBTiFzsz1yfqkoj1T8MuFkfbhg6RsBEI2m5g91fImizL
	FBWt+hTkL7oHrEt5/xxM7SortasbisnZ
X-Google-Smtp-Source: AGHT+IEec/rRs9c/nIkgw/veVutPgqG29GeHUenMj7OcD7RSQWGRIcm6Ku8BN6SDMa0j2fszuAy58A==
X-Received: by 2002:a5d:47cb:0:b0:385:e8b0:df13 with SMTP id ffacd0b85a97d-385fd437301mr10448565f8f.40.1733421230470;
        Thu, 05 Dec 2024 09:53:50 -0800 (PST)
Received: from ta2.c.googlers.com.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d5280fc4sm67882835e9.24.2024.12.05.09.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 09:53:49 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	peter.griffin@linaro.org,
	javierm@redhat.com,
	tzimmermann@suse.de,
	daniel.lezcano@linaro.org,
	vincent.guittot@linaro.org,
	ulf.hansson@linaro.org,
	arnd@arndb.de,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 2/3] firmware: add exynos ACPM protocol driver
Date: Thu,  5 Dec 2024 17:53:44 +0000
Message-ID: <20241205175345.201595-3-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241205175345.201595-1-tudor.ambarus@linaro.org>
References: <20241205175345.201595-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Alive Clock and Power Manager (ACPM) Message Protocol is defined for
the purpose of communication between the ACPM firmware and masters
(AP, AOC, ...). ACPM firmware operates on the Active Power Management
(APM) module that handles overall power activities.

ACPM and masters regard each other as independent hardware component and
communicate with each other using mailbox messages and shared memory.

This protocol library provides the interface for all the client drivers
making use of the features offered by the APM. Add ACPM protocol support.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/Kconfig                      |   1 +
 drivers/firmware/Makefile                     |   1 +
 drivers/firmware/samsung/Kconfig              |  14 +
 drivers/firmware/samsung/Makefile             |   4 +
 drivers/firmware/samsung/exynos-acpm-pmic.c   | 226 +++++
 drivers/firmware/samsung/exynos-acpm-pmic.h   |  24 +
 drivers/firmware/samsung/exynos-acpm.c        | 772 ++++++++++++++++++
 drivers/firmware/samsung/exynos-acpm.h        |  15 +
 .../linux/soc/samsung/exynos-acpm-protocol.h  |  57 ++
 9 files changed, 1114 insertions(+)
 create mode 100644 drivers/firmware/samsung/Kconfig
 create mode 100644 drivers/firmware/samsung/Makefile
 create mode 100644 drivers/firmware/samsung/exynos-acpm-pmic.c
 create mode 100644 drivers/firmware/samsung/exynos-acpm-pmic.h
 create mode 100644 drivers/firmware/samsung/exynos-acpm.c
 create mode 100644 drivers/firmware/samsung/exynos-acpm.h
 create mode 100644 include/linux/soc/samsung/exynos-acpm-protocol.h

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 71d8b26c4103..24edb956831b 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -267,6 +267,7 @@ source "drivers/firmware/meson/Kconfig"
 source "drivers/firmware/microchip/Kconfig"
 source "drivers/firmware/psci/Kconfig"
 source "drivers/firmware/qcom/Kconfig"
+source "drivers/firmware/samsung/Kconfig"
 source "drivers/firmware/smccc/Kconfig"
 source "drivers/firmware/tegra/Kconfig"
 source "drivers/firmware/xilinx/Kconfig"
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index 7a8d486e718f..91efcc868a05 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -33,6 +33,7 @@ obj-y				+= efi/
 obj-y				+= imx/
 obj-y				+= psci/
 obj-y				+= qcom/
+obj-y				+= samsung/
 obj-y				+= smccc/
 obj-y				+= tegra/
 obj-y				+= xilinx/
diff --git a/drivers/firmware/samsung/Kconfig b/drivers/firmware/samsung/Kconfig
new file mode 100644
index 000000000000..eed8cd8a677b
--- /dev/null
+++ b/drivers/firmware/samsung/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config EXYNOS_ACPM_PROTOCOL
+	tristate "Exynos Alive Clock and Power Manager (ACPM) Message Protocol"
+	depends on ARCH_EXYNOS || COMPILE_TEST
+	depends on EXYNOS_MBOX
+	help
+	  Alive Clock and Power Manager (ACPM) Message Protocol is defined for
+	  the purpose of communication between the ACPM firmware and masters
+	  (AP, AOC, ...). ACPM firmware operates on the Active Power Management
+	  (APM) module that handles overall power activities.
+
+	  This protocol library provides interface for all the client drivers
+	  making use of the features offered by the APM.
diff --git a/drivers/firmware/samsung/Makefile b/drivers/firmware/samsung/Makefile
new file mode 100644
index 000000000000..7b4c9f6f34f5
--- /dev/null
+++ b/drivers/firmware/samsung/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+acpm-protocol-objs			:= exynos-acpm.o exynos-acpm-pmic.o
+obj-$(CONFIG_EXYNOS_ACPM_PROTOCOL)	+= acpm-protocol.o
diff --git a/drivers/firmware/samsung/exynos-acpm-pmic.c b/drivers/firmware/samsung/exynos-acpm-pmic.c
new file mode 100644
index 000000000000..371fd67cd56d
--- /dev/null
+++ b/drivers/firmware/samsung/exynos-acpm-pmic.c
@@ -0,0 +1,226 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2020 Samsung Electronics Co., Ltd.
+ * Copyright 2020 Google LLC.
+ * Copyright 2024 Linaro Ltd.
+ */
+#include <linux/bitfield.h>
+#include <linux/module.h>
+#include <linux/sched/clock.h>
+#include <linux/soc/samsung/exynos-acpm-protocol.h>
+#include <linux/types.h>
+
+#include "exynos-acpm.h"
+#include "exynos-acpm-pmic.h"
+
+#define ACPM_PMIC_CHANNEL		GENMASK(15, 12)
+#define ACPM_PMIC_TYPE			GENMASK(11, 8)
+#define ACPM_PMIC_REG			GENMASK(7, 0)
+
+#define ACPM_PMIC_RETURN		GENMASK(31, 24)
+#define ACPM_PMIC_MASK			GENMASK(23, 16)
+#define ACPM_PMIC_VALUE			GENMASK(15, 8)
+#define ACPM_PMIC_FUNC			GENMASK(7, 0)
+
+#define ACPM_BULK_SHIFT			8
+#define ACPM_BULK_MASK			GENMASK(7, 0)
+#define exynos_acpm_set_bulk(data, i)					\
+	(((data) & ACPM_BULK_MASK) << (ACPM_BULK_SHIFT * (i)))
+#define exynos_acpm_read_bulk(data, i)					\
+	(((data) >> (ACPM_BULK_SHIFT * (i))) & ACPM_BULK_MASK)
+
+enum exynos_acpm_pmic_func {
+	ACPM_PMIC_READ,
+	ACPM_PMIC_WRITE,
+	ACPM_PMIC_UPDATE,
+	ACPM_PMIC_BULK_READ,
+	ACPM_PMIC_BULK_WRITE,
+};
+
+static void acpm_pmic_init_read_cmd(u32 *cmd, u8 type, u8 reg, u8 chan)
+{
+	cmd[0] = FIELD_PREP(ACPM_PMIC_TYPE, type) |
+		 FIELD_PREP(ACPM_PMIC_REG, reg) |
+		 FIELD_PREP(ACPM_PMIC_CHANNEL, chan);
+	cmd[1] = FIELD_PREP(ACPM_PMIC_FUNC, ACPM_PMIC_READ);
+	cmd[3] = (u32)(sched_clock() / 1000000); /*record ktime ms*/
+}
+
+int acpm_pmic_read_reg(const struct acpm_handle *handle, int acpm_chan_id,
+		       u8 type, u8 reg, u8 chan, u8 *dest)
+{
+	struct acpm_xfer xfer;
+	u32 cmd[4] = {0};
+	int ret;
+
+	acpm_pmic_init_read_cmd(cmd, type, reg, chan);
+
+	xfer.tx.cmd = cmd;
+	xfer.tx.len = sizeof(cmd);
+	xfer.rx.cmd = cmd;
+	xfer.rx.len = sizeof(cmd);
+	xfer.acpm_chan_id = acpm_chan_id;
+
+	ret = acpm_do_xfer(handle, &xfer);
+	if (ret)
+		return ret;
+
+	*dest = FIELD_GET(ACPM_PMIC_VALUE, xfer.rx.cmd[1]);
+
+	return FIELD_GET(ACPM_PMIC_RETURN, xfer.rx.cmd[1]);
+}
+
+static void acpm_pmic_init_bulk_read_cmd(u32 *cmd, u8 type, u8 reg, u8 chan,
+					 u8 count)
+{
+	cmd[0] = FIELD_PREP(ACPM_PMIC_TYPE, type) |
+		 FIELD_PREP(ACPM_PMIC_REG, reg) |
+		 FIELD_PREP(ACPM_PMIC_CHANNEL, chan);
+	cmd[1] = FIELD_PREP(ACPM_PMIC_FUNC, ACPM_PMIC_BULK_READ) |
+		 FIELD_PREP(ACPM_PMIC_VALUE, count);
+}
+
+int acpm_pmic_bulk_read(const struct acpm_handle *handle, int acpm_chan_id,
+			u8 type, u8 reg, u8 chan, u8 count, u8 *buf)
+{
+	struct acpm_xfer xfer;
+	u32 cmd[4] = {0};
+	int i, ret;
+
+	acpm_pmic_init_bulk_read_cmd(cmd, type, reg, chan, count);
+
+	xfer.tx.cmd = cmd;
+	xfer.tx.len = sizeof(cmd);
+	xfer.rx.cmd = cmd;
+	xfer.rx.len = sizeof(cmd);
+	xfer.acpm_chan_id = acpm_chan_id;
+
+	ret = acpm_do_xfer(handle, &xfer);
+	if (ret)
+		return ret;
+
+	ret = FIELD_GET(ACPM_PMIC_RETURN, xfer.rx.cmd[1]);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < count; i++) {
+		if (i < 4)
+			buf[i] = exynos_acpm_read_bulk(xfer.rx.cmd[2], i);
+		else
+			buf[i] = exynos_acpm_read_bulk(xfer.rx.cmd[3], i - 4);
+	}
+
+	return 0;
+}
+
+static void acpm_pmic_init_write_cmd(u32 *cmd, u8 type, u8 reg, u8 chan,
+				     u8 value)
+{
+	cmd[0] = FIELD_PREP(ACPM_PMIC_TYPE, type) |
+		 FIELD_PREP(ACPM_PMIC_REG, reg) |
+		 FIELD_PREP(ACPM_PMIC_CHANNEL, chan);
+	cmd[1] = FIELD_PREP(ACPM_PMIC_FUNC, ACPM_PMIC_WRITE) |
+		 FIELD_PREP(ACPM_PMIC_VALUE, value);
+	cmd[3] = (u32)(sched_clock() / 1000000); /*record ktime ms*/
+}
+
+int acpm_pmic_write_reg(const struct acpm_handle *handle, int acpm_chan_id,
+			u8 type, u8 reg, u8 chan, u8 value)
+{
+	struct acpm_xfer xfer;
+	u32 cmd[4] = {0};
+	int ret;
+
+	acpm_pmic_init_write_cmd(cmd, type, reg, chan, value);
+
+	xfer.tx.cmd = cmd;
+	xfer.tx.len = sizeof(cmd);
+	xfer.rx.cmd = cmd;
+	xfer.rx.len = sizeof(cmd);
+	xfer.acpm_chan_id = acpm_chan_id;
+
+	ret = acpm_do_xfer(handle, &xfer);
+	if (ret)
+		return ret;
+
+	return FIELD_GET(ACPM_PMIC_RETURN, xfer.rx.cmd[1]);
+}
+
+static void acpm_pmic_init_bulk_write_cmd(u32 *cmd, u8 type, u8 reg, u8 chan,
+					  u8 count, u8 *buf)
+{
+	int i;
+
+	cmd[0] = FIELD_PREP(ACPM_PMIC_TYPE, type) |
+		 FIELD_PREP(ACPM_PMIC_REG, reg) |
+		 FIELD_PREP(ACPM_PMIC_CHANNEL, chan);
+	cmd[1] = FIELD_PREP(ACPM_PMIC_FUNC, ACPM_PMIC_BULK_WRITE) |
+		 FIELD_PREP(ACPM_PMIC_VALUE, count);
+
+	for (i = 0; i < count; i++) {
+		if (i < 4)
+			cmd[2] |= exynos_acpm_set_bulk(buf[i], i);
+		else
+			cmd[3] |= exynos_acpm_set_bulk(buf[i], i - 4);
+	}
+}
+
+int acpm_pmic_bulk_write(const struct acpm_handle *handle, int acpm_chan_id,
+			 u8 type, u8 reg, u8 chan, u8 count, u8 *buf)
+{
+	struct acpm_xfer xfer;
+	u32 cmd[4] = {0};
+	int ret;
+
+	acpm_pmic_init_bulk_write_cmd(cmd, type, reg, chan, count, buf);
+
+	xfer.tx.cmd = cmd;
+	xfer.tx.len = sizeof(cmd);
+	xfer.rx.cmd = cmd;
+	xfer.rx.len = sizeof(cmd);
+	xfer.acpm_chan_id = acpm_chan_id;
+
+	ret = acpm_do_xfer(handle, &xfer);
+	if (ret)
+		return ret;
+
+	return FIELD_GET(ACPM_PMIC_RETURN, xfer.rx.cmd[1]);
+}
+
+static void acpm_pmic_init_update_cmd(u32 *cmd, u8 type, u8 reg, u8 chan,
+				      u8 value, u8 mask)
+{
+	cmd[0] = FIELD_PREP(ACPM_PMIC_TYPE, type) |
+		 FIELD_PREP(ACPM_PMIC_REG, reg) |
+		 FIELD_PREP(ACPM_PMIC_CHANNEL, chan);
+	cmd[1] = FIELD_PREP(ACPM_PMIC_FUNC, ACPM_PMIC_UPDATE) |
+		 FIELD_PREP(ACPM_PMIC_VALUE, value) |
+		 FIELD_PREP(ACPM_PMIC_MASK, mask);
+	cmd[3] = (u32)(sched_clock() / 1000000); /*record ktime ms*/
+}
+
+int acpm_pmic_update_reg(const struct acpm_handle *handle, int acpm_chan_id,
+			 u8 type, u8 reg, u8 chan, u8 value, u8 mask)
+{
+	struct acpm_xfer xfer;
+	u32 cmd[4] = {0};
+	int ret;
+
+	acpm_pmic_init_update_cmd(cmd, type, reg, chan, value, mask);
+
+	xfer.tx.cmd = cmd;
+	xfer.tx.len = sizeof(cmd);
+	xfer.rx.cmd = cmd;
+	xfer.rx.len = sizeof(cmd);
+	xfer.acpm_chan_id = acpm_chan_id;
+
+	ret = acpm_do_xfer(handle, &xfer);
+	if (ret)
+		return ret;
+
+	return FIELD_GET(ACPM_PMIC_RETURN, xfer.rx.cmd[1]);
+}
+
+MODULE_AUTHOR("Tudor Ambarus <tudor.ambarus@linaro.org>");
+MODULE_DESCRIPTION("Samsung Exynos ACPM mailbox PMIC protocol driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/firmware/samsung/exynos-acpm-pmic.h b/drivers/firmware/samsung/exynos-acpm-pmic.h
new file mode 100644
index 000000000000..c7ff5fdde25a
--- /dev/null
+++ b/drivers/firmware/samsung/exynos-acpm-pmic.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2020 Samsung Electronics Co., Ltd.
+ * Copyright 2020 Google LLC.
+ * Copyright 2024 Linaro Ltd.
+ */
+#ifndef __EXYNOS_ACPM_MFD_H__
+#define __EXYNOS_ACPM_MFD_H__
+
+#include <linux/types.h>
+
+struct acpm_handle;
+
+int acpm_pmic_read_reg(const struct acpm_handle *handle, int acpm_chan_id,
+		       u8 type, u8 reg, u8 chan, u8 *dest);
+int acpm_pmic_bulk_read(const struct acpm_handle *handle, int acpm_chan_id,
+			u8 type, u8 reg, u8 chan, u8 count, u8 *buf);
+int acpm_pmic_write_reg(const struct acpm_handle *handle, int acpm_chan_id,
+			u8 type, u8 reg, u8 chan, u8 value);
+int acpm_pmic_bulk_write(const struct acpm_handle *handle, int acpm_chan_id,
+			 u8 type, u8 reg, u8 chan, u8 count, u8 *buf);
+int acpm_pmic_update_reg(const struct acpm_handle *handle, int acpm_chan_id,
+			 u8 type, u8 reg, u8 chan, u8 value, u8 mask);
+#endif /* __EXYNOS_ACPM_MFD_H__ */
diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
new file mode 100644
index 000000000000..1b04230942a4
--- /dev/null
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -0,0 +1,772 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2020 Samsung Electronics Co., Ltd.
+ * Copyright 2020 Google LLC.
+ * Copyright 2024 Linaro Ltd.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitmap.h>
+#include <linux/bits.h>
+#include <linux/container_of.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/mailbox_client.h>
+#include <linux/module.h>
+#include <linux/math.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/soc/samsung/exynos-acpm-protocol.h>
+#include <linux/types.h>
+
+#include "exynos-acpm.h"
+#include "exynos-acpm-pmic.h"
+
+#define ACPM_PROTOCOL_SEQNUM	GENMASK(21, 16)
+
+/* The unit of counter is 20 us. 5000 * 20 = 100 ms */
+#define ACPM_POLL_TIMEOUT	5000
+#define ACPM_TX_TIMEOUT_US	500000
+
+/**
+ * struct acpm_shmem - shared memory configuration information.
+ * @reserved:	unused fields.
+ * @chans:	offset to array of struct acpm_chan_shmem.
+ * @reserved1:	unused fields.
+ * @num_chans:	number of channels.
+ */
+struct acpm_shmem {
+	u32 reserved[2];
+	u32 chans;
+	u32 reserved1[3];
+	u32 num_chans;
+};
+
+/**
+ * struct acpm_chan_shmem - descriptor of a shared memory channel.
+ *
+ * @id:			channel ID.
+ * @reserved:		unused fields.
+ * @rx_rear:		rear pointer of APM RX queue (TX for AP).
+ * @rx_front:		front pointer of APM RX queue (TX for AP).
+ * @rx_base:		base address of APM RX queue (TX for AP).
+ * @reserved1:		unused fields.
+ * @tx_rear:		rear pointer of APM TX queue (RX for AP).
+ * @tx_front:		front pointer of APM TX queue (RX for AP).
+ * @tx_base:		base address of APM TX queue (RX for AP).
+ * @qlen:		queue length. Applies to both TX/RX queues.
+ * @mlen:		message length. Applies to both TX/RX queues.
+ * @reserved2:		unused fields.
+ * @poll_completion:	true when the channel works on polling.
+ */
+struct acpm_chan_shmem {
+	u32 id;
+	u32 reserved[3];
+	u32 rx_rear;
+	u32 rx_front;
+	u32 rx_base;
+	u32 reserved1[3];
+	u32 tx_rear;
+	u32 tx_front;
+	u32 tx_base;
+	u32 qlen;
+	u32 mlen;
+	u32 reserved2[2];
+	u32 poll_completion;
+};
+
+/**
+ * struct acpm_queue - exynos acpm queue.
+ *
+ * @rear:	rear address of the queue.
+ * @front:	front address of the queue.
+ * @base:	base address of the queue.
+ */
+struct acpm_queue {
+	void __iomem *rear;
+	void __iomem *front;
+	void __iomem *base;
+};
+
+/**
+ * struct acpm_rx_data - RX queue data.
+ *
+ * @cmd:	pointer to where the data shall be saved.
+ * @n_cmd:	number of 32-bit commands.
+ * @response:	true if the client expects the RX data.
+ */
+struct acpm_rx_data {
+	u32 *cmd;
+	size_t n_cmd;
+	bool response;
+};
+
+#define ACPM_SEQNUM_MAX    64
+
+/**
+ * struct acpm_chan - driver internal representation of a channel.
+ * @cl:		mailbox client.
+ * @chan:	mailbox channel.
+ * @acpm:	pointer to driver private data.
+ * @tx:		TX queue. The enqueue is done by the host.
+ *			- front index is written by the host.
+ *			- rear index is written by the firmware.
+ *
+ * @rx:		RX queue. The enqueue is done by the firmware.
+ *			- front index is written by the firmware.
+ *			- rear index is written by the host.
+ * @tx_lock:	protects TX queue.
+ * @rx_lock:	protects RX queue.
+ * @qlen:	queue length. Applies to both TX/RX queues.
+ * @mlen:	message length. Applies to both TX/RX queues.
+ * @seqnum:	sequence number of the last message enqueued on TX queue.
+ * @id:		channel ID.
+ * @poll_completion:	indicates if the transfer needs to be polled for
+ *			completion or interrupt mode is used.
+ * @bitmap_seqnum: bitmap that tracks the messages on the TX/RX queues.
+ * @rx_data:	internal buffer used to drain the RX queue.
+ */
+struct acpm_chan {
+	struct mbox_client cl;
+	struct mbox_chan *chan;
+	struct acpm_info *acpm;
+	struct acpm_queue tx;
+	struct acpm_queue rx;
+	spinlock_t tx_lock;
+	spinlock_t rx_lock;
+
+	unsigned int qlen;
+	unsigned int mlen;
+	u8 seqnum;
+	u8 id;
+	bool poll_completion;
+
+	DECLARE_BITMAP(bitmap_seqnum, ACPM_SEQNUM_MAX - 1);
+	struct acpm_rx_data rx_data[ACPM_SEQNUM_MAX];
+};
+
+/**
+ * struct acpm_info - driver's private data.
+ * @shmem:	pointer to the SRAM configuration data.
+ * @sram_base:	base address of SRAM.
+ * @chans:	pointer to the ACPM channel parameters retrieved from SRAM.
+ * @dev:	pointer to the exynos-acpm device.
+ * @handle:	instance of acpm_handle to send to clients.
+ * @node:	list head
+ * @num_chans:	number of channels available for this controller.
+ * @users:	number of users of this instance.
+ */
+struct acpm_info {
+	struct acpm_shmem __iomem *shmem;
+	void __iomem *sram_base;
+	struct acpm_chan *chans;
+	struct device *dev;
+	struct acpm_handle handle;
+	struct list_head node;
+	u32 num_chans;
+	/* protected by acpm_list_mutex */
+	int users;
+};
+
+#define client_to_acpm_chan(c) container_of(c, struct acpm_chan, cl)
+#define handle_to_acpm_info(h) container_of(h, struct acpm_info, handle)
+
+/* List of all ACPM devices active in system */
+static LIST_HEAD(acpm_list);
+/* Protection for the entire list */
+static DEFINE_MUTEX(acpm_list_mutex);
+
+/**
+ * acpm_get_rx() - get response from RX queue.
+ * @achan:	ACPM channel info.
+ * @xfer:	reference to the transfer to get response for.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int acpm_get_rx(struct acpm_chan *achan, struct acpm_xfer *xfer)
+{
+	struct acpm_msg *tx = &xfer->tx;
+	struct acpm_msg *rx = &xfer->rx;
+	struct acpm_rx_data *rx_data;
+	const void __iomem *base, *addr;
+	u32 rx_front, rx_seqnum, tx_seqnum, seqnum;
+	u32 i, val, mlen;
+	bool rx_set = false;
+
+	rx_front = readl_relaxed(achan->rx.front);
+	i = readl_relaxed(achan->rx.rear);
+
+	/* Bail out if RX is empty. */
+	if (i == rx_front)
+		return 0;
+
+	base = achan->rx.base;
+	mlen = achan->mlen;
+
+	tx_seqnum = FIELD_GET(ACPM_PROTOCOL_SEQNUM, tx->cmd[0]);
+
+	/* Drain RX queue. */
+	do {
+		/* Read RX seqnum. */
+		addr = base + mlen * i;
+		val = readl_relaxed(addr);
+
+		rx_seqnum = FIELD_GET(ACPM_PROTOCOL_SEQNUM, val);
+		if (!rx_seqnum)
+			return -EIO;
+		/*
+		 * mssg seqnum starts with value 1, whereas the driver considers
+		 * the first mssg at index 0.
+		 */
+		seqnum = rx_seqnum - 1;
+		rx_data = &achan->rx_data[seqnum];
+
+		if (rx_data->response) {
+			if (rx_seqnum == tx_seqnum) {
+				__ioread32_copy(rx->cmd, addr, rx->len / 4);
+				rx_set = true;
+				clear_bit(seqnum, achan->bitmap_seqnum);
+			} else {
+				/*
+				 * The RX data corresponds to another request.
+				 * Save the data to drain the queue, but don't
+				 * clear yet the bitmap. It will be cleared
+				 * after the response is copied to the request.
+				 */
+				__ioread32_copy(rx_data->cmd, addr,
+						rx->len / 4);
+			}
+		} else {
+			clear_bit(seqnum, achan->bitmap_seqnum);
+		}
+
+		i = (i + 1) % achan->qlen;
+	} while (i != rx_front);
+
+	/* We saved all responses, mark RX empty. */
+	writel_relaxed(rx_front, achan->rx.rear);
+
+	/* Flush SRAM posted writes. */
+	readl_relaxed(achan->rx.front);
+
+	/*
+	 * If the response was not in this iteration of the queue, check if the
+	 * RX data was previously saved.
+	 */
+	rx_data = &achan->rx_data[tx_seqnum - 1];
+	if (!rx_set && rx_data->response) {
+		rx_seqnum = FIELD_GET(ACPM_PROTOCOL_SEQNUM,
+				      rx_data->cmd[0]);
+
+		if (rx_seqnum == tx_seqnum) {
+			memcpy(rx->cmd, rx_data->cmd, rx->len);
+			clear_bit(rx_seqnum - 1, achan->bitmap_seqnum);
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * acpm_dequeue_by_polling() - RX dequeue by polling.
+ * @achan:	ACPM channel info.
+ * @xfer:	reference to the transfer being waited for.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int acpm_dequeue_by_polling(struct acpm_chan *achan,
+				   struct acpm_xfer *xfer)
+{
+	bool may_sleep = xfer->flags & ACPM_XFER_MAY_SLEEP;
+	struct device *dev = achan->acpm->dev;
+	struct acpm_msg *tx = &xfer->tx;
+	unsigned long flags;
+	unsigned int cnt_20us = 0;
+	u32 seqnum;
+	int ret;
+
+	seqnum = FIELD_GET(ACPM_PROTOCOL_SEQNUM, tx->cmd[0]);
+
+	do {
+		spin_lock_irqsave(&achan->rx_lock, flags);
+		ret = acpm_get_rx(achan, xfer);
+		spin_unlock_irqrestore(&achan->rx_lock, flags);
+		if (ret)
+			return ret;
+
+		if (!test_bit(seqnum - 1, achan->bitmap_seqnum))
+			return 0;
+
+		/* Determined experimentally. */
+		may_sleep ? usleep_range(20, 30) : udelay(20);
+		cnt_20us++;
+	} while (cnt_20us < ACPM_POLL_TIMEOUT);
+
+	dev_err(dev, "Timeout! ch:%u s:%u bitmap:%lx, cnt_20us = %d.\n",
+		achan->id, seqnum, achan->bitmap_seqnum[0], cnt_20us);
+
+	return -ETIME;
+}
+
+/**
+ * acpm_wait_for_queue_slots() - wait for queue slots.
+ *
+ * @achan:		ACPM channel info.
+ * @next_tx_front:	next front index of the TX queue.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int acpm_wait_for_queue_slots(struct acpm_chan *achan, u32 next_tx_front)
+{
+	u32 val, ret;
+
+	/*
+	 * Wait for RX front to keep up with TX front. Make sure there's at
+	 * least one element between them.
+	 */
+	ret = readl_relaxed_poll_timeout_atomic(achan->rx.front, val,
+						next_tx_front != val, 0,
+						ACPM_TX_TIMEOUT_US);
+	if (ret) {
+		dev_err(achan->acpm->dev, "RX front can not keep up with TX front.\n");
+		return ret;
+	}
+
+	ret = readl_relaxed_poll_timeout_atomic(achan->tx.rear, val,
+						next_tx_front != val, 0,
+						ACPM_TX_TIMEOUT_US);
+	if (ret)
+		dev_err(achan->acpm->dev, "TX queue is full.\n");
+
+	return ret;
+}
+
+/**
+ * acpm_prepare_xfer() - prepare a transfer before writing the message to the
+ * TX queue.
+ * @achan:	ACPM channel info.
+ * @xfer:	reference to the transfer being prepared.
+ */
+static void acpm_prepare_xfer(struct acpm_chan *achan, struct acpm_xfer *xfer)
+{
+	struct acpm_msg *tx = &xfer->tx;
+	struct acpm_rx_data *rx_data;
+
+	/* Prevent chan->seqnum from being re-used */
+	do {
+		if (++achan->seqnum == ACPM_SEQNUM_MAX)
+			achan->seqnum = 1;
+	} while (test_bit(achan->seqnum - 1, achan->bitmap_seqnum));
+
+	tx->cmd[0] |= FIELD_PREP(ACPM_PROTOCOL_SEQNUM, achan->seqnum);
+
+	/* Clear data for upcoming responses */
+	rx_data = &achan->rx_data[achan->seqnum - 1];
+	memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->n_cmd);
+	if (xfer->rx.cmd)
+		rx_data->response = true;
+
+	/* Flag the index based on seqnum. (seqnum: 1~63, bitmap: 0~62) */
+	set_bit(achan->seqnum - 1, achan->bitmap_seqnum);
+}
+
+/**
+ * acpm_wait_for_message_response - an helper to group all possible ways of
+ * waiting for a synchronous message response.
+ *
+ * @achan:	ACPM channel info.
+ * @xfer:	reference to the transfer being waited for.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int acpm_wait_for_message_response(struct acpm_chan *achan,
+					  struct acpm_xfer *xfer)
+{
+	if (achan->poll_completion)
+		return acpm_dequeue_by_polling(achan, xfer);
+
+	dev_err(achan->acpm->dev, "Interrupt mode not supported\n");
+	return -EOPNOTSUPP;
+}
+
+/**
+ * acpm_do_xfer() - do one transfer.
+ * @handle:	pointer to the acpm handle.
+ * @xfer:	transfer to initiate and wait for response.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+int acpm_do_xfer(const struct acpm_handle *handle, struct acpm_xfer *xfer)
+{
+	struct acpm_info *acpm = handle_to_acpm_info(handle);
+	struct acpm_chan *achan = &acpm->chans[xfer->acpm_chan_id];
+	struct acpm_msg *tx = &xfer->tx;
+	u32 idx, tx_front;
+	unsigned long flags;
+	int ret;
+
+	if (!tx->cmd || tx->len > achan->mlen || xfer->rx.len > achan->mlen)
+		return -EINVAL;
+
+	spin_lock_irqsave(&achan->tx_lock, flags);
+
+	tx_front = readl_relaxed(achan->tx.front);
+	idx = (tx_front + 1) % achan->qlen;
+
+	ret = acpm_wait_for_queue_slots(achan, idx);
+	if (ret) {
+		spin_unlock_irqrestore(&achan->tx_lock, flags);
+		return ret;
+	}
+
+	acpm_prepare_xfer(achan, xfer);
+
+	/* Write TX command. */
+	__iowrite32_copy(achan->tx.base + achan->mlen * tx_front, tx->cmd,
+			 tx->len / 4);
+
+	/* Advance TX front. */
+	writel_relaxed(idx, achan->tx.front);
+
+	/* Flush SRAM posted writes. */
+	readl_relaxed(achan->tx.front);
+
+	spin_unlock_irqrestore(&achan->tx_lock, flags);
+
+	ret = mbox_send_message(achan->chan, xfer);
+	if (ret < 0)
+		return ret;
+
+	ret = acpm_wait_for_message_response(achan, xfer);
+
+	/*
+	 * NOTE: we might prefer not to need the mailbox ticker to manage the
+	 * transfer queueing since the protocol layer queues things by itself.
+	 * Unfortunately, we have to kick the mailbox framework after we have
+	 * received our message.
+	 */
+	mbox_client_txdone(achan->chan, ret);
+
+	return ret;
+}
+
+/**
+ * acpm_put_handle() - release the handle acquired by acpm_get_by_phandle.
+ * @handle:	Handle acquired by acpm_get_by_phandle.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int acpm_put_handle(const struct acpm_handle *handle)
+{
+	struct acpm_info *acpm;
+
+	if (IS_ERR(handle))
+		return PTR_ERR(handle);
+	if (!handle)
+		return -EINVAL;
+
+	acpm = handle_to_acpm_info(handle);
+	mutex_lock(&acpm_list_mutex);
+	if (!WARN_ON(!acpm->users))
+		acpm->users--;
+	mutex_unlock(&acpm_list_mutex);
+
+	return 0;
+}
+
+/**
+ * devm_acpm_release() - devres release method.
+ * @dev: pointer to device.
+ * @res: pointer to resource.
+ */
+static void devm_acpm_release(struct device *dev, void *res)
+{
+	const struct acpm_handle **ptr = res;
+	const struct acpm_handle *handle = *ptr;
+	int ret;
+
+	ret = acpm_put_handle(handle);
+	if (ret)
+		dev_err(dev, "failed to put handle %d\n", ret);
+}
+
+/**
+ * acpm_get_by_phandle() - get the ACPM handle using DT phandle.
+ * @np:		device node.
+ * @property:	property name containing phandle on ACPM node.
+ *
+ * Return: pointer to handle on success, ERR_PTR(-errno) otherwise.
+ */
+static const struct acpm_handle *acpm_get_by_phandle(struct device_node *np,
+						     const char *property)
+{
+	struct acpm_handle *handle = NULL;
+	struct device_node *acpm_np;
+	struct acpm_info *info;
+
+	if (!np) {
+		pr_err("I need a device pointer\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	acpm_np = of_parse_phandle(np, property, 0);
+	if (!acpm_np)
+		return ERR_PTR(-ENODEV);
+
+	mutex_lock(&acpm_list_mutex);
+	list_for_each_entry(info, &acpm_list, node) {
+		if (acpm_np == info->dev->of_node) {
+			handle = &info->handle;
+			info->users++;
+			break;
+		}
+	}
+	mutex_unlock(&acpm_list_mutex);
+	of_node_put(acpm_np);
+
+	if (!handle)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	return handle;
+}
+
+/**
+ * devm_acpm_get_by_phandle() - managed get handle using phandle.
+ * @dev:	device pointer requesting ACPM handle.
+ * @property:	property name containing phandle on ACPM node.
+ *
+ * Return: pointer to handle on success, ERR_PTR(-errno) otherwise.
+ */
+const struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev,
+						   const char *property)
+{
+	const struct acpm_handle *handle;
+	const struct acpm_handle **ptr;
+
+	ptr = devres_alloc(devm_acpm_release, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+	handle = acpm_get_by_phandle(dev_of_node(dev), property);
+
+	if (!IS_ERR(handle)) {
+		*ptr = handle;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return handle;
+}
+EXPORT_SYMBOL_GPL(devm_acpm_get_by_phandle);
+
+/**
+ * acpm_chan_shmem_get_params() - get channel parameters and addresses of the
+ * TX/RX queues.
+ * @achan:	ACPM channel info.
+ * @chan_shmem:	__iomem pointer to a channel described in shared memory.
+ */
+static void acpm_chan_shmem_get_params(struct acpm_chan *achan,
+				struct acpm_chan_shmem __iomem *chan_shmem)
+{
+	void __iomem *base = achan->acpm->sram_base;
+	struct acpm_queue *rx = &achan->rx;
+	struct acpm_queue *tx = &achan->tx;
+
+	achan->mlen = readl_relaxed(&chan_shmem->mlen);
+	achan->poll_completion = readl_relaxed(&chan_shmem->poll_completion);
+	achan->id = readl_relaxed(&chan_shmem->id);
+	achan->qlen = readl_relaxed(&chan_shmem->qlen);
+
+	tx->base = base + readl_relaxed(&chan_shmem->rx_base);
+	tx->rear = base + readl_relaxed(&chan_shmem->rx_rear);
+	tx->front = base + readl_relaxed(&chan_shmem->rx_front);
+
+	rx->base = base + readl_relaxed(&chan_shmem->tx_base);
+	rx->rear = base + readl_relaxed(&chan_shmem->tx_rear);
+	rx->front = base + readl_relaxed(&chan_shmem->tx_front);
+
+	dev_vdbg(achan->acpm->dev, "ID = %d poll = %d, mlen = %d, qlen = %d\n",
+		 achan->id, achan->poll_completion, achan->mlen, achan->qlen);
+}
+
+/**
+ * acpm_achan_alloc_cmds() - allocate buffers for retrieving data from the ACPM
+ * firmware.
+ * @achan:	ACPM channel info.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int acpm_achan_alloc_cmds(struct acpm_chan *achan)
+{
+	struct device *dev = achan->acpm->dev;
+	struct acpm_rx_data *rx_data;
+	size_t cmd_size, n_cmd;
+	int i;
+
+	if (achan->mlen == 0)
+		return 0;
+
+	cmd_size = sizeof(*(achan->rx_data[0].cmd));
+	n_cmd = DIV_ROUND_UP_ULL(achan->mlen, cmd_size);
+
+	for (i = 0; i < ACPM_SEQNUM_MAX; i++) {
+		rx_data = &achan->rx_data[i];
+		rx_data->n_cmd = n_cmd;
+		rx_data->cmd = devm_kcalloc(dev, n_cmd, cmd_size, GFP_KERNEL);
+		if (!rx_data->cmd)
+			return -ENOMEM;
+	}
+
+	return 0;
+}
+
+/**
+ * acpm_free_mbox_chans() - free mailbox channels.
+ * @acpm:	pointer to driver data.
+ */
+static void acpm_free_mbox_chans(struct acpm_info *acpm)
+{
+	int i;
+
+	for (i = 0; i < acpm->num_chans; i++)
+		mbox_free_channel(acpm->chans[i].chan);
+}
+
+/**
+ * acpm_channels_init() - initialize channels based on the configuration data in
+ * the shared memory.
+ * @acpm:	pointer to driver data.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int acpm_channels_init(struct acpm_info *acpm)
+{
+	struct acpm_shmem __iomem *shmem = acpm->shmem;
+	struct acpm_chan_shmem __iomem *chans_shmem;
+	struct device *dev = acpm->dev;
+	int i, ret;
+
+	acpm->num_chans = readl_relaxed(&shmem->num_chans);
+	acpm->chans = devm_kcalloc(dev, acpm->num_chans, sizeof(*acpm->chans),
+				   GFP_KERNEL);
+	if (!acpm->chans)
+		return -ENOMEM;
+
+	chans_shmem = acpm->sram_base + readl_relaxed(&shmem->chans);
+
+	for (i = 0; i < acpm->num_chans; i++) {
+		struct acpm_chan_shmem __iomem *chan_shmem = &chans_shmem[i];
+		struct acpm_chan *achan = &acpm->chans[i];
+		struct mbox_client *cl = &achan->cl;
+
+		achan->acpm = acpm;
+
+		acpm_chan_shmem_get_params(achan, chan_shmem);
+
+		ret = acpm_achan_alloc_cmds(achan);
+		if (ret)
+			return ret;
+
+		spin_lock_init(&achan->rx_lock);
+		spin_lock_init(&achan->tx_lock);
+
+		cl->dev = dev;
+
+		achan->chan = mbox_request_channel(cl, achan->id);
+		if (IS_ERR(achan->chan)) {
+			acpm_free_mbox_chans(acpm);
+			return PTR_ERR(achan->chan);
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * acpm_setup_ops() - setup the operations structures.
+ * @acpm:	pointer to the driver data.
+ */
+static void acpm_setup_ops(struct acpm_info *acpm)
+{
+	struct acpm_pmic_ops *pmic_ops = &acpm->handle.ops.pmic_ops;
+
+	pmic_ops->read_reg = acpm_pmic_read_reg;
+	pmic_ops->bulk_read = acpm_pmic_bulk_read;
+	pmic_ops->write_reg = acpm_pmic_write_reg;
+	pmic_ops->bulk_write = acpm_pmic_bulk_write;
+	pmic_ops->update_reg = acpm_pmic_update_reg;
+}
+
+static int acpm_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->of_node;
+	struct device_node *shmem;
+	struct acpm_info *acpm;
+	resource_size_t size;
+	struct resource res;
+	const __be32 *prop;
+	int ret;
+
+	acpm = devm_kzalloc(dev, sizeof(*acpm), GFP_KERNEL);
+	if (!acpm)
+		return -ENOMEM;
+
+	shmem = of_parse_phandle(node, "shmem", 0);
+	ret = of_address_to_resource(shmem, 0, &res);
+	of_node_put(shmem);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to get shared memory.\n");
+
+	size = resource_size(&res);
+	acpm->sram_base = devm_ioremap(dev, res.start, size);
+	if (!acpm->sram_base)
+		return dev_err_probe(dev, -ENOMEM,
+				     "Failed to ioremap shared memory.\n");
+
+	prop = of_get_property(node, "initdata-base", NULL);
+	if (!prop)
+		return dev_err_probe(dev, -EINVAL,
+				     "Parsing initdata_base failed.\n");
+
+	acpm->dev = dev;
+	acpm->shmem = acpm->sram_base + be32_to_cpup(prop);
+
+	ret = acpm_channels_init(acpm);
+	if (ret)
+		return ret;
+
+	acpm_setup_ops(acpm);
+
+	INIT_LIST_HEAD(&acpm->node);
+	mutex_lock(&acpm_list_mutex);
+	list_add_tail(&acpm->node, &acpm_list);
+	mutex_unlock(&acpm_list_mutex);
+
+	platform_set_drvdata(pdev, acpm);
+
+	return 0;
+}
+
+static const struct of_device_id acpm_match[] = {
+	{ .compatible = "google,gs101-acpm-ipc" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, acpm_match);
+
+static struct platform_driver acpm_driver = {
+	.probe	= acpm_probe,
+	.driver	= {
+		.name = "exynos-acpm-protocol",
+		.of_match_table	= of_match_ptr(acpm_match),
+	},
+};
+module_platform_driver(acpm_driver);
+
+MODULE_AUTHOR("Tudor Ambarus <tudor.ambarus@linaro.org>");
+MODULE_DESCRIPTION("Samsung Exynos ACPM mailbox protocol driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/firmware/samsung/exynos-acpm.h b/drivers/firmware/samsung/exynos-acpm.h
new file mode 100644
index 000000000000..a03adcd260f5
--- /dev/null
+++ b/drivers/firmware/samsung/exynos-acpm.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2020 Samsung Electronics Co., Ltd.
+ * Copyright 2020 Google LLC.
+ * Copyright 2024 Linaro Ltd.
+ */
+#ifndef __EXYNOS_ACPM_H__
+#define __EXYNOS_ACPM_H__
+
+struct acpm_handle;
+struct acpm_xfer;
+
+int acpm_do_xfer(const struct acpm_handle *handle, struct acpm_xfer *xfer);
+
+#endif /* __EXYNOS_ACPM_H__ */
diff --git a/include/linux/soc/samsung/exynos-acpm-protocol.h b/include/linux/soc/samsung/exynos-acpm-protocol.h
new file mode 100644
index 000000000000..762783af7617
--- /dev/null
+++ b/include/linux/soc/samsung/exynos-acpm-protocol.h
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2020 Samsung Electronics Co., Ltd.
+ * Copyright 2020 Google LLC.
+ * Copyright 2024 Linaro Ltd.
+ */
+
+#ifndef __EXYNOS_ACPM_PROTOCOL_H
+#define __EXYNOS_ACPM_PROTOCOL_H
+
+#include <linux/types.h>
+
+struct acpm_msg {
+	u32 *cmd;
+	size_t len;
+};
+
+struct acpm_xfer {
+	struct acpm_msg tx;
+	struct acpm_msg rx;
+	int acpm_chan_id;
+#define ACPM_XFER_MAY_SLEEP     BIT(0)
+	u32 flags;
+};
+
+struct acpm_handle;
+
+struct acpm_pmic_ops {
+	int (*read_reg)(const struct acpm_handle *handle, int acpm_chan_id,
+			u8 type, u8 reg, u8 chan, u8 *dest);
+	int (*bulk_read)(const struct acpm_handle *handle, int acpm_chan_id,
+			 u8 type, u8 reg, u8 chan, u8 count, u8 *buf);
+	int (*write_reg)(const struct acpm_handle *handle, int acpm_chan_id,
+			 u8 type, u8 reg, u8 chan, u8 value);
+	int (*bulk_write)(const struct acpm_handle *handle, int acpm_chan_id,
+			  u8 type, u8 reg, u8 chan, u8 count, u8 *buf);
+	int (*update_reg)(const struct acpm_handle *handle, int acpm_chan_id,
+			  u8 type, u8 reg, u8 chan, u8 value, u8 mask);
+};
+
+struct acpm_ops {
+	struct acpm_pmic_ops pmic_ops;
+};
+
+/**
+ * struct acpm_handle - Reference to an initialized protocol instance
+ * @ops:
+ */
+struct acpm_handle {
+	struct acpm_ops ops;
+};
+
+struct device_node;
+
+const struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev,
+						   const char *property);
+#endif /* __EXYNOS_ACPM_PROTOCOL_H */
-- 
2.47.0.338.g60cca15819-goog


