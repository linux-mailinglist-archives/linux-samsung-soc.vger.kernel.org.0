Return-Path: <linux-samsung-soc+bounces-4971-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD12D9A291B
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 17 Oct 2024 18:37:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CDA3285AE2
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 17 Oct 2024 16:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E02221DEFDA;
	Thu, 17 Oct 2024 16:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wq/Qf5Nh"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0FE1DF725
	for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Oct 2024 16:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729183026; cv=none; b=rHu6fMpY/yU7O1NjJgR6hxkCeRS64JHTIFDE/Xto7tEwREJEACra8njXx7ZGN8ZrSEq51Fm+OBIlNpbGwy10UdTfD7z/DYDlCk4ieNdHA4VQXRKoZbe0OcO9m/17YKXbK8sabIvo4yCAXrYixFBZNL3EWnkFzMFZ9rvhqt7qvJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729183026; c=relaxed/simple;
	bh=pEAg3BV8hVbp6/IvhRT9mnW0VxRpwj8+ykLv61h9LEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UWbCKaO+nJl3pwQfHTkLoPb3420789Mv7kf+FmUXiBP5y8L5ko3CDK1kHcEZbUVkjPuaGmHkIO52B/A1q91GsWhcCQs1OZQewsB59xwaevZZccnrgo84ijLs7Z1aOamcON8rOLvfAA58ZpYaz2/yR7Z4aWdo1YgySPF+FuyP3N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wq/Qf5Nh; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37d6ff1cbe1so881237f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Oct 2024 09:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729183020; x=1729787820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vrs/rkcHckY0+9RCZ7gIRsGkHSYprTIMbd0b9dYUHdY=;
        b=Wq/Qf5NhGmtwmB6ASrnEIc/fktCdOe+l59pTdi57lPJvGcfq5+dktm7UtIln4oEZqF
         UHtjvtobbSDcmshFg3loEzbyz2QEVYo5FodePPPghhjYGNtWLnUUnUsS299akDaTAwTR
         gSx+GCiXs9SFmKdNRnoN+mU+YnhJEzpa00NlA2cNCRtjC5vAnFAk8UhPdSQPzUFlf7h8
         kWdjizHLZ5z+nFf7hp0koPZTCxHwcABv38ZGb8vw9T+E838dEaQETKcNsm7dP/SGCti8
         lIi7jxxBdyLhlCaSMZFS6QaZH1I7FsyGTocXo03JOdHI0q8a+MV01TmsBJ+1xDhY5qML
         E3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729183020; x=1729787820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vrs/rkcHckY0+9RCZ7gIRsGkHSYprTIMbd0b9dYUHdY=;
        b=VjwBZWpxKdxhSvhfPCwHmMoe7w2mgcyGp9zCUUpCpAzk2i5PV63wmYA8Qts7QNpO/m
         fKT/I7icpoL4ZxmKOY3wzX8ePch6mKyM6w/gN/G1Hj20OPPqngZpHR1CaEx86X0PJAs4
         9dmvkQIhfYp/ovvWmYgrUQFBJygEM+VnQinejTdAP/9jgc0PJpUyyAGdyOlssNs/INpd
         4lr1yLjZhP9GNIQTEDY8ouF896fAZPp5gKnKOQ/9Fx9hx9Y/SLx3zTFD5DsIhO65CvHN
         M++qsTKiThpeHULr8lvh8TE8UmDoyibi+IV4HhR7r0kGjayXC+IsFnUH4iLlwVaAmdbQ
         /AnQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1KOiqvfbOSvJnSCN7y/HTwWOIz0IStIPGmnG3yT4KWKgSlg7UxETYwJQby8pY5WaNbUDmaA2My0nnDfRu/SKFdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpU9SaWxha7/E9KoZXq0t+9GcJhxRo7ZhOP8HgXJ8Qd+o4g2S/
	HiCWCtCv5DxfwbK+5FGQ9Vo/uyT7qV05oY/Rm0ZgIzt6pDR10GG4qdsq57NU3QU=
X-Google-Smtp-Source: AGHT+IFOyIaYXdCCszo26xoFWnT8Xt5gQHbaygrlHmrifbKPqO9ZzqbIREvSzDxmIyeAWqKvR2U+hA==
X-Received: by 2002:a5d:46d1:0:b0:37d:4d31:e86c with SMTP id ffacd0b85a97d-37d5529f0b7mr13944451f8f.44.1729183020361;
        Thu, 17 Oct 2024 09:37:00 -0700 (PDT)
Received: from ta2.c.googlers.com.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fc11aefsm7710376f8f.93.2024.10.17.09.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 09:36:59 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: jassisinghbrar@gmail.com,
	krzk@kernel.org
Cc: alim.akhtar@samsung.com,
	mst@redhat.com,
	javierm@redhat.com,
	tzimmermann@suse.de,
	bartosz.golaszewski@linaro.org,
	luzmaximilian@gmail.com,
	sudeep.holla@arm.com,
	conor.dooley@microchip.com,
	bjorn@rivosinc.com,
	ulf.hansson@linaro.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	marcan@marcan.st,
	neal@gompa.dev,
	alyssa@rosenzweig.io,
	broonie@kernel.org,
	andre.draszik@linaro.org,
	willmcvicker@google.com,
	peter.griffin@linaro.org,
	kernel-team@android.com,
	vincent.guittot@linaro.org,
	daniel.lezcano@linaro.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 2/2] firmware: add exynos acpm driver
Date: Thu, 17 Oct 2024 16:36:49 +0000
Message-ID: <20241017163649.3007062-3-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
In-Reply-To: <20241017163649.3007062-1-tudor.ambarus@linaro.org>
References: <20241017163649.3007062-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ACPM (Alive Clock and Power Manager) is a firmware that operates on the
APM (Active Power Management) module that handles overall power management
activities. ACPM and masters regard each other as independent
hardware component and communicate with each other using mailbox messages
and shared memory.

The mailbox channels are initialized based on the configuration data
found at a specific offset into the shared memory (mmio-sram). The
configuration data consists of channel id, message and queue lengths,
pointers to the RX and TX queues which are also part of the SRAM, and
whether RX works by polling or interrupts. All known clients of this
driver are using polling channels, thus the driver implements for now
just polling mode.

Add support for the exynos acpm core driver. Helper drivers will follow.
These will construct the mailbox messages in the format expected by the
firmware.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/Kconfig                    |   1 +
 drivers/firmware/Makefile                   |   1 +
 drivers/firmware/samsung/Kconfig            |  11 +
 drivers/firmware/samsung/Makefile           |   3 +
 drivers/firmware/samsung/exynos-acpm.c      | 703 ++++++++++++++++++++
 include/linux/mailbox/exynos-acpm-message.h |  21 +
 6 files changed, 740 insertions(+)
 create mode 100644 drivers/firmware/samsung/Kconfig
 create mode 100644 drivers/firmware/samsung/Makefile
 create mode 100644 drivers/firmware/samsung/exynos-acpm.c
 create mode 100644 include/linux/mailbox/exynos-acpm-message.h

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
index 000000000000..f908773c1441
--- /dev/null
+++ b/drivers/firmware/samsung/Kconfig
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config EXYNOS_ACPM
+	tristate "Exynos ACPM (Alive Clock and Power Manager) driver support"
+	select MAILBOX
+	help
+	  ACPM is a firmware that operates on the APM (Active Power Management)
+	  module that handles overall power management activities. ACPM and
+	  masters regard each other as independent hardware component and
+	  communicate with each other using mailbox messages and shared memory.
+	  This module provides the means to communicate with the ACPM firmware.
diff --git a/drivers/firmware/samsung/Makefile b/drivers/firmware/samsung/Makefile
new file mode 100644
index 000000000000..35ff3076bbea
--- /dev/null
+++ b/drivers/firmware/samsung/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_EXYNOS_ACPM)	+= exynos-acpm.o
diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
new file mode 100644
index 000000000000..c3ad4dc7a9e0
--- /dev/null
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -0,0 +1,703 @@
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
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/mailbox_controller.h>
+#include <linux/mailbox/exynos-acpm-message.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#define EXYNOS_ACPM_MCUCTRL		0x0	/* Mailbox Control Register */
+#define EXYNOS_ACPM_INTCR0		0x24	/* Interrupt Clear Register 0 */
+#define EXYNOS_ACPM_INTMR0		0x28	/* Interrupt Mask Register 0 */
+#define EXYNOS_ACPM_INTSR0		0x2c	/* Interrupt Status Register 0 */
+#define EXYNOS_ACPM_INTMSR0		0x30	/* Interrupt Mask Status Register 0 */
+#define EXYNOS_ACPM_INTGR1		0x40	/* Interrupt Generation Register 1 */
+#define EXYNOS_ACPM_INTMR1		0x48	/* Interrupt Mask Register 1 */
+#define EXYNOS_ACPM_INTSR1		0x4c	/* Interrupt Status Register 1 */
+#define EXYNOS_ACPM_INTMSR1		0x50	/* Interrupt Mask Status Register 1 */
+
+#define EXYNOS_ACPM_INTMR0_MASK		GENMASK(15, 0)
+#define EXYNOS_ACPM_PROTOCOL_SEQNUM	GENMASK(21, 16)
+
+/* The unit of counter is 20 us. 5000 * 20 = 100 ms */
+#define EXYNOS_ACPM_POLL_TIMEOUT	5000
+#define EXYNOS_ACPM_TX_TIMEOUT_US	500000
+
+/**
+ * struct exynos_acpm_shmem - mailbox shared memory configuration information.
+ * @reserved:	reserved for future use.
+ * @chans:	offset to array of struct exynos_acpm_shmem_chan.
+ * @reserved1:	reserved for future use.
+ * @num_chans:	number of channels.
+ */
+struct exynos_acpm_shmem {
+	u32 reserved[2];
+	u32 chans;
+	u32 reserved1[3];
+	u32 num_chans;
+};
+
+/**
+ * struct exynos_acpm_shmem_chan - descriptor of a shared memory channel.
+ *
+ * @id:			channel ID.
+ * @reserved:		reserved for future use.
+ * @rx_rear:		rear pointer of RX queue.
+ * @rx_front:		front pointer of RX queue.
+ * @rx_base:		base address of RX queue.
+ * @reserved1:		reserved for future use.
+ * @tx_rear:		rear pointer of TX queue.
+ * @tx_front:		front pointer of TX queue.
+ * @tx_base:		base address of TX queue.
+ * @qlen:		queue length. Applies to both TX/RX queues.
+ * @mlen:		message length. Applies to both TX/RX queues.
+ * @reserved2:		reserved for future use.
+ * @polling:		true when the channel works on polling.
+ */
+struct exynos_acpm_shmem_chan {
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
+	u32 polling;
+};
+
+/**
+ * struct exynos_acpm_queue - exynos acpm queue.
+ *
+ * @rear:	rear address of the queue.
+ * @front:	front address of the queue.
+ * @base:	base address of the queue.
+ */
+struct exynos_acpm_queue {
+	void __iomem *rear;
+	void __iomem *front;
+	void __iomem *base;
+};
+
+/**
+ * struct exynos_acpm_rx_data - RX queue data.
+ *
+ * @cmd:	pointer to where the data shall be saved.
+ * @response:	true if the client expects the RX data.
+ */
+struct exynos_acpm_rx_data {
+	u32 *cmd;
+	bool response;
+};
+
+#define EXYNOS_ACPM_SEQNUM_MAX    64
+
+/**
+ * struct exynos_acpm_chan - driver internal representation of a channel.
+ * @tx:		TX queue. The enqueue is done by the host.
+ *			- front index is written by the host.
+ *			- rear index is written by the firmware.
+ *
+ * @rx:		RX queue. The enqueue is done by the firmware.
+ *			- front index is written by the firmware.
+ *			- rear index is written by the host.
+ * @rx_lock:	protects RX queue. The RX queue is accessed just in
+ *		process context.
+ * @tx_lock:	protects TX queue.
+ * @qlen:	queue length. Applies to both TX/RX queues.
+ * @mlen:	message length. Applies to both TX/RX queues.
+ * @seqnum:	sequence number of the last message enqueued on TX queue.
+ * @id:		channel ID.
+ * @polling:	true when the channel works on polling.
+ * @bitmap_seqnum: bitmap that tracks the messages on the TX/RX queues.
+ * @rx_data:	internal buffer used to drain the RX queue.
+ */
+struct exynos_acpm_chan {
+	struct exynos_acpm_queue tx;
+	struct exynos_acpm_queue rx;
+	struct mutex rx_lock;
+	spinlock_t tx_lock;
+
+	unsigned int qlen;
+	unsigned int mlen;
+	u8 seqnum;
+	u8 id;
+	bool polling;
+
+	DECLARE_BITMAP(bitmap_seqnum, EXYNOS_ACPM_SEQNUM_MAX - 1);
+	struct exynos_acpm_rx_data rx_data[EXYNOS_ACPM_SEQNUM_MAX];
+};
+
+/**
+ * struct exynos_acpm - driver's private data.
+ * @shmem:	pointer to the SRAM configuration data.
+ * @chans:	pointer to the ACPM channel parameters retrieved from SRAM.
+ * @sram_base:	base address of SRAM.
+ * @regs:	mailbox registers base address.
+ * @mbox:	pointer to the mailbox controller.
+ * @wq:		pointer to workqueue.
+ * @dev:	pointer to the exynos-acpm device.
+ * @pclk:	pointer to the mailbox peripheral clock.
+ * @num_chans:	number of channels available for this controller.
+ */
+struct exynos_acpm {
+	struct exynos_acpm_shmem *shmem;
+	struct exynos_acpm_chan *chans;
+	void __iomem *sram_base;
+	void __iomem *regs;
+	struct mbox_controller *mbox;
+	struct workqueue_struct *wq;
+	struct device *dev;
+	struct clk *pclk;
+	u32 num_chans;
+};
+
+/**
+ * struct exynos_acpm_work_data - data structure representing the work.
+ * @mbox_chan:	pointer to the mailbox channel.
+ * @req:	pointer to the mailbox request.
+ * @callback:	pointer to a callback function to be invoked upon
+ *		completion of this request.
+ * @work:	describes the task to be executed.
+ */
+struct exynos_acpm_work_data {
+	struct mbox_chan *mbox_chan;
+	struct mbox_request *req;
+	void (*callback)(struct exynos_acpm_work_data *work_data, int status);
+	struct work_struct work;
+};
+
+static int exynos_acpm_get_rx(struct mbox_chan *mbox_chan,
+			      struct mbox_request *req)
+{
+	struct exynos_acpm_chan *chan = mbox_chan->con_priv;
+	struct exynos_acpm_message *tx = req->tx;
+	struct exynos_acpm_message *rx = req->rx;
+	struct exynos_acpm_rx_data *rx_data;
+	const void __iomem *base, *addr;
+	u32 rx_front, rx_seqnum, tx_seqnum, seqnum;
+	u32 i, val, mlen;
+	bool rx_set = false;
+
+	rx_front = readl_relaxed(chan->rx.front);
+	i = readl_relaxed(chan->rx.rear);
+
+	/* Bail out if RX is empty. */
+	if (i == rx_front)
+		return 0;
+
+	base = chan->rx.base;
+	mlen = chan->mlen;
+
+	tx_seqnum = FIELD_GET(EXYNOS_ACPM_PROTOCOL_SEQNUM, tx->cmd[0]);
+
+	/* Drain RX queue. */
+	do {
+		/* Read RX seqnum. */
+		addr = base + mlen * i;
+		val = readl_relaxed(addr);
+
+		rx_seqnum = FIELD_GET(EXYNOS_ACPM_PROTOCOL_SEQNUM, val);
+		if (!rx_seqnum)
+			return -EIO;
+		/*
+		 * mssg seqnum starts with value 1, whereas the driver considers
+		 * the first mssg at index 0.
+		 */
+		seqnum = rx_seqnum - 1;
+		rx_data = &chan->rx_data[seqnum];
+
+		if (rx_data->response) {
+			if (rx_seqnum == tx_seqnum) {
+				__ioread32_copy(rx->cmd, addr, req->rxlen / 4);
+				rx_set = true;
+				clear_bit(seqnum, chan->bitmap_seqnum);
+			} else {
+				/*
+				 * The RX data corresponds to another request.
+				 * Save the data to drain the queue, but don't
+				 * clear yet the bitmap. It will be cleared
+				 * after the response is copied to the request.
+				 */
+				__ioread32_copy(rx_data->cmd, addr,
+						req->rxlen / 4);
+			}
+		} else {
+			clear_bit(seqnum, chan->bitmap_seqnum);
+		}
+
+		i = (i + 1) % chan->qlen;
+	} while (i != rx_front);
+
+	/* We saved all responses, mark RX empty. */
+	writel_relaxed(rx_front, chan->rx.rear);
+
+	/* Flush SRAM posted writes. */
+	readl_relaxed(chan->rx.front);
+
+	/*
+	 * If the response was not in this iteration of the queue, check if the
+	 * RX data was previously saved.
+	 */
+	rx_data = &chan->rx_data[tx_seqnum - 1];
+	if (!rx_set && rx_data->response) {
+		rx_seqnum = FIELD_GET(EXYNOS_ACPM_PROTOCOL_SEQNUM,
+				      rx_data->cmd[0]);
+
+		if (rx_seqnum == tx_seqnum) {
+			memcpy(rx->cmd, rx_data->cmd, req->rxlen);
+			clear_bit(rx_seqnum - 1, chan->bitmap_seqnum);
+		}
+	}
+
+	return 0;
+}
+
+static int exynos_acpm_dequeue_by_polling(struct mbox_chan *mbox_chan,
+					  struct mbox_request *req)
+{
+	struct exynos_acpm_chan *chan = mbox_chan->con_priv;
+	struct exynos_acpm_message *tx = req->tx;
+	struct device *dev = mbox_chan->mbox->dev;
+	unsigned int cnt_20us = 0;
+	u32 seqnum;
+	int ret;
+
+	seqnum = FIELD_GET(EXYNOS_ACPM_PROTOCOL_SEQNUM, tx->cmd[0]);
+
+	do {
+		ret = mutex_lock_interruptible(&chan->rx_lock);
+		if (ret)
+			return ret;
+		ret = exynos_acpm_get_rx(mbox_chan, req);
+		mutex_unlock(&chan->rx_lock);
+		if (ret)
+			return ret;
+
+		if (!test_bit(seqnum - 1, chan->bitmap_seqnum)) {
+			dev_vdbg(dev, "cnt_20us = %d.\n", cnt_20us);
+			return 0;
+		}
+
+		/* Determined experimentally. */
+		usleep_range(20, 30);
+		cnt_20us++;
+	} while (cnt_20us < EXYNOS_ACPM_POLL_TIMEOUT);
+
+	dev_err(dev, "Timeout! ch:%u s:%u bitmap:%lx, cnt_20us = %d.\n",
+		chan->id, seqnum, chan->bitmap_seqnum[0], cnt_20us);
+
+	return -ETIME;
+}
+
+static void exynos_acpm_done(struct exynos_acpm_work_data *work_data, int status)
+{
+	struct mbox_request *req = work_data->req;
+
+	kfree(work_data);
+	mbox_request_complete(req, status);
+}
+
+static void exynos_acpm_work_handler(struct work_struct *work)
+{
+	struct exynos_acpm_work_data *work_data =
+		container_of(work, struct exynos_acpm_work_data, work);
+	struct mbox_chan *mbox_chan = work_data->mbox_chan;
+	int ret;
+
+	ret = exynos_acpm_dequeue_by_polling(mbox_chan, work_data->req);
+	work_data->callback(work_data, ret);
+}
+
+static struct exynos_acpm_work_data *
+	exynos_acpm_init_work(struct mbox_chan *mbox_chan,
+			      struct mbox_request *req)
+{
+	struct exynos_acpm_work_data *work_data;
+	gfp_t gfp = (req->flags & MBOX_REQ_MAY_SLEEP) ? GFP_KERNEL : GFP_ATOMIC;
+
+	work_data = kmalloc(sizeof(*work_data), gfp);
+	if (!work_data)
+		return ERR_PTR(-ENOMEM);
+
+	work_data->mbox_chan = mbox_chan;
+	work_data->req = req;
+	work_data->callback = exynos_acpm_done;
+	INIT_WORK(&work_data->work, exynos_acpm_work_handler);
+
+	return work_data;
+}
+
+static void exynos_acpm_prepare_request(struct mbox_chan *mbox_chan,
+					struct mbox_request *req)
+{
+	struct exynos_acpm_chan *chan = mbox_chan->con_priv;
+	struct exynos_acpm_message *tx = req->tx;
+	struct exynos_acpm_rx_data *rx_data;
+
+	/* Prevent chan->seqnum from being re-used */
+	do {
+		if (++chan->seqnum == EXYNOS_ACPM_SEQNUM_MAX)
+			chan->seqnum = 1;
+	} while (test_bit(chan->seqnum - 1, chan->bitmap_seqnum));
+
+	tx->cmd[0] |= FIELD_PREP(EXYNOS_ACPM_PROTOCOL_SEQNUM, chan->seqnum);
+
+	/* Clear data for upcoming responses */
+	rx_data = &chan->rx_data[chan->seqnum - 1];
+	memset(rx_data->cmd, 0, sizeof(*(rx_data->cmd)) * chan->mlen);
+	if (req->rx)
+		rx_data->response = true;
+
+	/* Flag the index based on seqnum. (seqnum: 1~63, bitmap: 0~62) */
+	set_bit(chan->seqnum - 1, chan->bitmap_seqnum);
+}
+
+static int exynos_acpm_wait_for_queue_slots(struct mbox_chan *mbox_chan,
+					    u32 next_tx_front)
+{
+	struct exynos_acpm_chan *chan = mbox_chan->con_priv;
+	struct device *dev = mbox_chan->mbox->dev;
+	u32 val, ret;
+
+	/*
+	 * Wait for RX front to keep up with TX front. Make sure there's at
+	 * least one element between them.
+	 */
+	ret = readl_relaxed_poll_timeout_atomic(chan->rx.front, val,
+						next_tx_front != val, 1,
+						EXYNOS_ACPM_TX_TIMEOUT_US);
+	if (ret) {
+		dev_err(dev, "RX front can not keep up with TX front.\n");
+		return ret;
+	}
+
+	ret = readl_relaxed_poll_timeout_atomic(chan->tx.rear, val,
+						next_tx_front != val, 1,
+						EXYNOS_ACPM_TX_TIMEOUT_US);
+	if (ret)
+		dev_err(dev, "TX queue is full.\n");
+
+	return ret;
+}
+
+static int exynos_acpm_send_request(struct mbox_chan *mbox_chan,
+				    struct mbox_request *req)
+{
+	struct exynos_acpm *exynos_acpm = dev_get_drvdata(mbox_chan->mbox->dev);
+	struct exynos_acpm_chan *chan = mbox_chan->con_priv;
+	struct exynos_acpm_message *tx = req->tx;
+	struct exynos_acpm_work_data *work_data;
+	u32 idx, tx_front;
+	unsigned long flags;
+	int ret;
+
+	if (!tx || !tx->cmd || req->txlen > chan->mlen ||
+	    req->rxlen > chan->mlen)
+		return -EINVAL;
+
+	work_data = exynos_acpm_init_work(mbox_chan, req);
+	if (IS_ERR(work_data))
+		return PTR_ERR(work_data);
+
+	spin_lock_irqsave(&chan->tx_lock, flags);
+
+	tx_front = readl_relaxed(chan->tx.front);
+	idx = (tx_front + 1) % chan->qlen;
+
+	ret = exynos_acpm_wait_for_queue_slots(mbox_chan, idx);
+	if (ret)
+		goto exit;
+
+	exynos_acpm_prepare_request(mbox_chan, req);
+
+	/* Write TX command. */
+	__iowrite32_copy(chan->tx.base + chan->mlen * tx_front, tx->cmd,
+			 req->txlen / 4);
+
+	/* Advance TX front. */
+	writel_relaxed(idx, chan->tx.front);
+
+	/* Flush SRAM posted writes. */
+	readl_relaxed(chan->tx.front);
+
+	/* Generate ACPM interrupt. */
+	writel_relaxed(BIT(chan->id), exynos_acpm->regs + EXYNOS_ACPM_INTGR1);
+
+	/* Flush mailbox controller posted writes. */
+	readl_relaxed(exynos_acpm->regs + EXYNOS_ACPM_MCUCTRL);
+
+	spin_unlock_irqrestore(&chan->tx_lock, flags);
+
+	queue_work(exynos_acpm->wq, &work_data->work);
+
+	return -EINPROGRESS;
+exit:
+	spin_unlock_irqrestore(&chan->tx_lock, flags);
+	kfree(work_data);
+	return ret;
+}
+
+static int exynos_acpm_chan_startup(struct mbox_chan *mbox_chan)
+{
+	struct exynos_acpm_chan *chan = mbox_chan->con_priv;
+
+	if (!chan->polling) {
+		dev_err(mbox_chan->mbox->dev, "IRQs not supported.\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct mbox_chan_ops exynos_acpm_chan_ops = {
+	.send_request = exynos_acpm_send_request,
+	.startup = exynos_acpm_chan_startup,
+};
+
+static void __iomem *exynos_acpm_get_iomem_addr(void __iomem *base,
+						void __iomem *addr)
+{
+	u32 offset;
+
+	offset = readl_relaxed(addr);
+	return base + offset;
+}
+
+static void exynos_acpm_rx_queue_init(struct exynos_acpm *exynos_acpm,
+				      struct exynos_acpm_shmem_chan *shmem_chan,
+				      struct exynos_acpm_queue *rx)
+{
+	void __iomem *base = exynos_acpm->sram_base;
+
+	rx->base = exynos_acpm_get_iomem_addr(base, &shmem_chan->tx_base);
+	rx->front = exynos_acpm_get_iomem_addr(base, &shmem_chan->tx_front);
+	rx->rear = exynos_acpm_get_iomem_addr(base, &shmem_chan->tx_rear);
+}
+
+static void exynos_acpm_tx_queue_init(struct exynos_acpm *exynos_acpm,
+				      struct exynos_acpm_shmem_chan *shmem_chan,
+				      struct exynos_acpm_queue *tx)
+{
+	void __iomem *base = exynos_acpm->sram_base;
+
+	tx->base = exynos_acpm_get_iomem_addr(base, &shmem_chan->rx_base);
+	tx->front = exynos_acpm_get_iomem_addr(base, &shmem_chan->rx_front);
+	tx->rear = exynos_acpm_get_iomem_addr(base, &shmem_chan->rx_rear);
+}
+
+static int exynos_acpm_alloc_cmds(struct exynos_acpm *exynos_acpm,
+				  struct exynos_acpm_chan *chan)
+{
+	struct device *dev = exynos_acpm->dev;
+	struct exynos_acpm_rx_data *rx_data;
+	unsigned int mlen = chan->mlen;
+	int i;
+
+	for (i = 0; i < EXYNOS_ACPM_SEQNUM_MAX; i++) {
+		rx_data = &chan->rx_data[i];
+		rx_data->cmd = devm_kcalloc(dev, mlen, sizeof(*(rx_data->cmd)),
+					    GFP_KERNEL);
+		if (!rx_data->cmd)
+			return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int exynos_acpm_chans_init(struct exynos_acpm *exynos_acpm)
+{
+	struct exynos_acpm_shmem_chan *shmem_chans, *shmem_chan;
+	struct exynos_acpm_shmem *shmem = exynos_acpm->shmem;
+	struct mbox_chan *mbox_chan, *mbox_chans;
+	struct exynos_acpm_chan *chan, *chans;
+	struct device *dev = exynos_acpm->dev;
+	int i, ret;
+
+	exynos_acpm->num_chans = readl_relaxed(&shmem->num_chans);
+
+	mbox_chans = devm_kcalloc(dev, exynos_acpm->num_chans,
+				  sizeof(*mbox_chans), GFP_KERNEL);
+	if (!mbox_chans)
+		return -ENOMEM;
+
+	chans = devm_kcalloc(dev, exynos_acpm->num_chans, sizeof(*chans),
+			     GFP_KERNEL);
+	if (!chans)
+		return -ENOMEM;
+
+	shmem_chans = exynos_acpm_get_iomem_addr(exynos_acpm->sram_base,
+						 &shmem->chans);
+
+	for (i = 0; i < exynos_acpm->num_chans; i++) {
+		shmem_chan = &shmem_chans[i];
+		mbox_chan = &mbox_chans[i];
+		chan = &chans[i];
+
+		/* Set parameters for the mailbox channel. */
+		mbox_chan->con_priv = chan;
+		mbox_chan->mbox = exynos_acpm->mbox;
+
+		/* Set parameters for the ACPM channel. */
+		chan->mlen = readl_relaxed(&shmem_chan->mlen);
+
+		ret = exynos_acpm_alloc_cmds(exynos_acpm, chan);
+		if (ret)
+			return ret;
+
+		chan->polling = readl_relaxed(&shmem_chan->polling);
+		chan->id = readl_relaxed(&shmem_chan->id);
+		chan->qlen = readl_relaxed(&shmem_chan->qlen);
+
+		exynos_acpm_rx_queue_init(exynos_acpm, shmem_chan, &chan->rx);
+		exynos_acpm_tx_queue_init(exynos_acpm, shmem_chan, &chan->tx);
+
+		mutex_init(&chan->rx_lock);
+		spin_lock_init(&chan->tx_lock);
+
+		dev_vdbg(dev, "ID = %d poll = %d, mlen = %d, qlen = %d\n",
+			 chan->id, chan->polling, chan->mlen, chan->qlen);
+	}
+
+	/* Save pointers to the ACPM and mailbox channels. */
+	exynos_acpm->mbox->chans = mbox_chans;
+	exynos_acpm->chans = chans;
+
+	return 0;
+}
+
+static const struct of_device_id exynos_acpm_match[] = {
+	{ .compatible = "google,gs101-acpm" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, exynos_acpm_match);
+
+static int exynos_acpm_probe(struct platform_device *pdev)
+{
+	struct device_node *node = pdev->dev.of_node;
+	struct device *dev = &pdev->dev;
+	struct exynos_acpm *exynos_acpm;
+	struct mbox_controller *mbox;
+	struct device_node *shmem;
+	resource_size_t size;
+	struct resource res;
+	const __be32 *prop;
+	int ret;
+
+	exynos_acpm = devm_kzalloc(dev, sizeof(*exynos_acpm), GFP_KERNEL);
+	if (!exynos_acpm)
+		return -ENOMEM;
+
+	mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
+	if (!mbox)
+		return -ENOMEM;
+
+	exynos_acpm->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(exynos_acpm->regs))
+		return PTR_ERR(exynos_acpm->regs);
+
+	shmem = of_parse_phandle(node, "shmem", 0);
+	ret = of_address_to_resource(shmem, 0, &res);
+	of_node_put(shmem);
+	if (ret) {
+		dev_err(dev, "Failed to get shared memory.\n");
+		return ret;
+	}
+
+	size = resource_size(&res);
+	exynos_acpm->sram_base = devm_ioremap(dev, res.start, size);
+	if (!exynos_acpm->sram_base) {
+		dev_err(dev, "Failed to ioremap shared memory.\n");
+		return -ENOMEM;
+	}
+
+	prop = of_get_property(node, "initdata-base", NULL);
+	if (!prop) {
+		dev_err(dev, "Parsing initdata_base failed.\n");
+		return -EINVAL;
+	}
+
+	exynos_acpm->pclk = devm_clk_get(dev, "pclk");
+	if (IS_ERR(exynos_acpm->pclk)) {
+		dev_err(dev, "Missing peripheral clock.\n");
+		return PTR_ERR(exynos_acpm->pclk);
+	}
+
+	ret = clk_prepare_enable(exynos_acpm->pclk);
+	if (ret) {
+		dev_err(dev, "Failed to enable the peripheral clock.\n");
+		return ret;
+	}
+
+	exynos_acpm->wq = alloc_workqueue("exynos-acpm-wq", 0, 0);
+	if (!exynos_acpm->wq)
+		return -ENOMEM;
+
+	exynos_acpm->dev = dev;
+	exynos_acpm->mbox = mbox;
+	exynos_acpm->shmem = exynos_acpm->sram_base + be32_to_cpup(prop);
+
+	ret = exynos_acpm_chans_init(exynos_acpm);
+	if (ret)
+		return ret;
+
+	mbox->num_chans = exynos_acpm->num_chans;
+	mbox->dev = dev;
+	mbox->ops = &exynos_acpm_chan_ops;
+
+	platform_set_drvdata(pdev, exynos_acpm);
+
+	/* Mask out all interrupts. We support just polling channels for now. */
+	writel_relaxed(EXYNOS_ACPM_INTMR0_MASK,
+		       exynos_acpm->regs + EXYNOS_ACPM_INTMR0);
+
+	ret = devm_mbox_controller_register(dev, mbox);
+	if (ret)
+		dev_err(dev, "Failed to register mbox_controller(%d).\n", ret);
+
+	return ret;
+}
+
+static void exynos_acpm_remove(struct platform_device *pdev)
+{
+	struct exynos_acpm *exynos_acpm = platform_get_drvdata(pdev);
+
+	flush_workqueue(exynos_acpm->wq);
+	destroy_workqueue(exynos_acpm->wq);
+	clk_disable_unprepare(exynos_acpm->pclk);
+}
+
+static struct platform_driver exynos_acpm_driver = {
+	.probe	= exynos_acpm_probe,
+	.remove = exynos_acpm_remove,
+	.driver	= {
+		.name = "exynos-acpm",
+		.owner	= THIS_MODULE,
+		.of_match_table	= exynos_acpm_match,
+	},
+};
+module_platform_driver(exynos_acpm_driver);
+
+MODULE_AUTHOR("Tudor Ambarus <tudor.ambarus@linaro.org>");
+MODULE_DESCRIPTION("EXYNOS ACPM mailbox driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mailbox/exynos-acpm-message.h b/include/linux/mailbox/exynos-acpm-message.h
new file mode 100644
index 000000000000..3799868c40b8
--- /dev/null
+++ b/include/linux/mailbox/exynos-acpm-message.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2024 Linaro Ltd.
+ */
+
+#ifndef _LINUX_EXYNOS_ACPM_MESSAGE_H_
+#define _LINUX_EXYNOS_ACPM_MESSAGE_H_
+
+#include <linux/types.h>
+
+/**
+ * struct exynos_acpm_message - exynos ACPM mailbox message format.
+ * @cmd: pointer to u32 command.
+ * @len: length of the command.
+ */
+struct exynos_acpm_message {
+	u32 *cmd;
+	size_t len;
+};
+
+#endif /* _LINUX_EXYNOS_ACPM_MESSAGE_H_ */
-- 
2.47.0.rc1.288.g06298d1525-goog


