Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFCD74CF343
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  7 Mar 2022 09:10:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236151AbiCGIKn (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 7 Mar 2022 03:10:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236111AbiCGIKb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Mar 2022 03:10:31 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FE014CD55
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Mar 2022 00:09:37 -0800 (PST)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8269A3F628
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Mar 2022 08:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646640574;
        bh=h6f9aBRuD6q6vAjPoDeH1HVvyeu4tZHUHi6lgSytsOc=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=GHUm6EZwNhvNRuXBVYSgyEUpitDEdD2q2eDjjVfnriF+er10b/ICWsg5sXe1z2/Lv
         IpigH8XQZwR8DA5QfPWBziAt9LIAjZqIStyloUw5RyNUf7Udax3hM5vEZMeUCh0LaS
         SkpNBfToB5jj+3nr9576yK7glQAufAtz89fDTzukahaciQSk/PH79h+LWV6VAELgiQ
         XUlcEPvt1ZzKr9hpL5P5hVm1t43aO2OxSTRDjx6Zs7zr0D/sTk3NBqefAqs2AmOBPv
         WPbGy/y4IkDvuKWKuFh81tQ3Fb14aQw8YcWpDkJES1k2so28zJRZML3fPxJ+1TsLUS
         8TcPxn3XrVK7Q==
Received: by mail-ej1-f72.google.com with SMTP id hx13-20020a170906846d00b006db02e1a307so1531602ejc.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Mar 2022 00:09:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h6f9aBRuD6q6vAjPoDeH1HVvyeu4tZHUHi6lgSytsOc=;
        b=hhuP6mFz3upNSP+RifgrIT2vUCCVx2DU/q7Y3ICciMIQDh1C3x6Ml41GMWrpoJ+eTB
         2k0L+GNrwIb4sXe9x39ONomDlVEARxRi1KOVNeHbvYXJPU9wrirHk3YMR5G7VU75fKI4
         7yK9ZPubmKr70jOAF/w+Hjm8GIbyjVh3YjsrSjZNgHB+NofGk7PNCjnpf4MIjV0XtyWV
         xIDdvtS9aZiqPPpYaKsUaLC/QXRIN2yt+AY4OSrfBPG4F0n2loPxB3NyINa8plmMXksT
         aSjOeZg1YcmQBb0A2jMaX5nVbvWzecCV7TU0MqtdHyh+QkeaU1yXSDrZUs+aktEJR9BT
         UW/g==
X-Gm-Message-State: AOAM531ngd35AK22Z8fHgGG1royGI/nheyfxWE1my6I6R9mtvQxfqSYW
        S0SZIaHwK2wFXkAw/Eue8EX55UxCGP9dqU7+wlJdMtjyWuO8rdtM1Sp2YdsCwcLpsUvonPvFLxD
        WO1wmBXt9L2c85b2gNkQAoq/YmgfZFfviuSGZpjn2ap557Hn1
X-Received: by 2002:a17:906:1158:b0:6d0:562b:d8ee with SMTP id i24-20020a170906115800b006d0562bd8eemr8318855eja.78.1646640573848;
        Mon, 07 Mar 2022 00:09:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJFERfDAzIzSbz/jjP+nZrQWV1hE6APZaomrEaakxaIYDNfhbNIVLeDnfdSIfagKkLTgaiSg==
X-Received: by 2002:a17:906:1158:b0:6d0:562b:d8ee with SMTP id i24-20020a170906115800b006d0562bd8eemr8318840eja.78.1646640573600;
        Mon, 07 Mar 2022 00:09:33 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id fq14-20020a1709069d8e00b006da650af5a9sm4472594ejc.3.2022.03.07.00.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 00:09:32 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/7] tty: serial: samsung: constify variables and pointers
Date:   Mon,  7 Mar 2022 09:09:24 +0100
Message-Id: <20220307080925.54131-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220307080810.53847-1-krzysztof.kozlowski@canonical.com>
References: <20220307080810.53847-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Constify variables, data pointed by several pointers and
"udivslot_table" static array.  This makes code a bit safer.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Jiri Slaby <jirislaby@kernel.org>
---
 drivers/tty/serial/samsung_tty.c | 46 ++++++++++++++++----------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index b9783d8fb440..3ffae912217c 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -164,7 +164,7 @@ static void s3c24xx_serial_tx_chars(struct s3c24xx_uart_port *ourport);
 #define portaddrl(port, reg) \
 	((unsigned long *)(unsigned long)((port)->membase + (reg)))
 
-static u32 rd_reg(struct uart_port *port, u32 reg)
+static u32 rd_reg(const struct uart_port *port, u32 reg)
 {
 	switch (port->iotype) {
 	case UPIO_MEM:
@@ -179,7 +179,7 @@ static u32 rd_reg(struct uart_port *port, u32 reg)
 
 #define rd_regl(port, reg) (readl_relaxed(portaddr(port, reg)))
 
-static void wr_reg(struct uart_port *port, u32 reg, u32 val)
+static void wr_reg(const struct uart_port *port, u32 reg, u32 val)
 {
 	switch (port->iotype) {
 	case UPIO_MEM:
@@ -195,7 +195,7 @@ static void wr_reg(struct uart_port *port, u32 reg, u32 val)
 
 /* Byte-order aware bit setting/clearing functions. */
 
-static inline void s3c24xx_set_bit(struct uart_port *port, int idx,
+static inline void s3c24xx_set_bit(const struct uart_port *port, int idx,
 				   unsigned int reg)
 {
 	unsigned long flags;
@@ -208,7 +208,7 @@ static inline void s3c24xx_set_bit(struct uart_port *port, int idx,
 	local_irq_restore(flags);
 }
 
-static inline void s3c24xx_clear_bit(struct uart_port *port, int idx,
+static inline void s3c24xx_clear_bit(const struct uart_port *port, int idx,
 				     unsigned int reg)
 {
 	unsigned long flags;
@@ -221,19 +221,19 @@ static inline void s3c24xx_clear_bit(struct uart_port *port, int idx,
 	local_irq_restore(flags);
 }
 
-static inline struct s3c24xx_uart_port *to_ourport(const struct uart_port *port)
+static inline struct s3c24xx_uart_port *to_ourport(struct uart_port *port)
 {
 	return container_of(port, struct s3c24xx_uart_port, port);
 }
 
 /* translate a port to the device name */
 
-static inline const char *s3c24xx_serial_portname(struct uart_port *port)
+static inline const char *s3c24xx_serial_portname(const struct uart_port *port)
 {
 	return to_platform_device(port->dev)->name;
 }
 
-static int s3c24xx_serial_txempty_nofifo(struct uart_port *port)
+static int s3c24xx_serial_txempty_nofifo(const struct uart_port *port)
 {
 	return rd_regl(port, S3C2410_UTRSTAT) & S3C2410_UTRSTAT_TXE;
 }
@@ -358,7 +358,7 @@ static void s3c24xx_serial_tx_dma_complete(void *args)
 
 static void enable_tx_dma(struct s3c24xx_uart_port *ourport)
 {
-	struct uart_port *port = &ourport->port;
+	const struct uart_port *port = &ourport->port;
 	u32 ucon;
 
 	/* Mask Tx interrupt */
@@ -387,7 +387,7 @@ static void enable_tx_dma(struct s3c24xx_uart_port *ourport)
 
 static void enable_tx_pio(struct s3c24xx_uart_port *ourport)
 {
-	struct uart_port *port = &ourport->port;
+	const struct uart_port *port = &ourport->port;
 	u32 ucon, ufcon;
 
 	/* Set ufcon txtrig */
@@ -580,9 +580,9 @@ static inline const struct s3c24xx_uart_info
 }
 
 static inline const struct s3c2410_uartcfg
-	*s3c24xx_port_to_cfg(struct uart_port *port)
+	*s3c24xx_port_to_cfg(const struct uart_port *port)
 {
-	struct s3c24xx_uart_port *ourport;
+	const struct s3c24xx_uart_port *ourport;
 
 	if (port->dev == NULL)
 		return NULL;
@@ -591,7 +591,7 @@ static inline const struct s3c2410_uartcfg
 	return ourport->cfg;
 }
 
-static int s3c24xx_serial_rx_fifocnt(struct s3c24xx_uart_port *ourport,
+static int s3c24xx_serial_rx_fifocnt(const struct s3c24xx_uart_port *ourport,
 				     unsigned long ufstat)
 {
 	const struct s3c24xx_uart_info *info = ourport->info;
@@ -947,8 +947,8 @@ static irqreturn_t s3c24xx_serial_tx_irq(int irq, void *id)
 /* interrupt handler for s3c64xx and later SoC's.*/
 static irqreturn_t s3c64xx_serial_handle_irq(int irq, void *id)
 {
-	struct s3c24xx_uart_port *ourport = id;
-	struct uart_port *port = &ourport->port;
+	const struct s3c24xx_uart_port *ourport = id;
+	const struct uart_port *port = &ourport->port;
 	unsigned int pend = rd_regl(port, S3C64XX_UINTP);
 	irqreturn_t ret = IRQ_HANDLED;
 
@@ -966,8 +966,8 @@ static irqreturn_t s3c64xx_serial_handle_irq(int irq, void *id)
 /* interrupt handler for Apple SoC's.*/
 static irqreturn_t apple_serial_handle_irq(int irq, void *id)
 {
-	struct s3c24xx_uart_port *ourport = id;
-	struct uart_port *port = &ourport->port;
+	const struct s3c24xx_uart_port *ourport = id;
+	const struct uart_port *port = &ourport->port;
 	unsigned int pend = rd_regl(port, S3C2410_UTRSTAT);
 	irqreturn_t ret = IRQ_NONE;
 
@@ -1499,7 +1499,7 @@ static unsigned int s3c24xx_serial_getclk(struct s3c24xx_uart_port *ourport,
  * This table takes the fractional value of the baud divisor and gives
  * the recommended setting for the UDIVSLOT register.
  */
-static u16 udivslot_table[16] = {
+static const u16 udivslot_table[16] = {
 	[0] = 0x0000,
 	[1] = 0x0080,
 	[2] = 0x0808,
@@ -1675,7 +1675,7 @@ static void s3c24xx_serial_set_termios(struct uart_port *port,
 
 static const char *s3c24xx_serial_type(struct uart_port *port)
 {
-	struct s3c24xx_uart_port *ourport = to_ourport(port);
+	const struct s3c24xx_uart_port *ourport = to_ourport(port);
 
 	switch (ourport->info->type) {
 	case TYPE_S3C24XX:
@@ -2450,7 +2450,7 @@ s3c24xx_port_configured(unsigned int ucon)
 
 static int s3c24xx_serial_get_poll_char(struct uart_port *port)
 {
-	struct s3c24xx_uart_port *ourport = to_ourport(port);
+	const struct s3c24xx_uart_port *ourport = to_ourport(port);
 	unsigned int ufstat;
 
 	ufstat = rd_regl(port, S3C2410_UFSTAT);
@@ -2935,7 +2935,7 @@ module_exit(samsung_serial_exit);
  * Early console.
  */
 
-static void wr_reg_barrier(struct uart_port *port, u32 reg, u32 val)
+static void wr_reg_barrier(const struct uart_port *port, u32 reg, u32 val)
 {
 	switch (port->iotype) {
 	case UPIO_MEM:
@@ -2951,15 +2951,15 @@ struct samsung_early_console_data {
 	u32 txfull_mask;
 };
 
-static void samsung_early_busyuart(struct uart_port *port)
+static void samsung_early_busyuart(const struct uart_port *port)
 {
 	while (!(readl(port->membase + S3C2410_UTRSTAT) & S3C2410_UTRSTAT_TXFE))
 		;
 }
 
-static void samsung_early_busyuart_fifo(struct uart_port *port)
+static void samsung_early_busyuart_fifo(const struct uart_port *port)
 {
-	struct samsung_early_console_data *data = port->private_data;
+	const struct samsung_early_console_data *data = port->private_data;
 
 	while (readl(port->membase + S3C2410_UFSTAT) & data->txfull_mask)
 		;
-- 
2.32.0

