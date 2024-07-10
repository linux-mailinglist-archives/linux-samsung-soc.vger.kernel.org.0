Return-Path: <linux-samsung-soc+bounces-3775-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C67B92D2E1
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 10 Jul 2024 15:33:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ABC6CB277C2
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 10 Jul 2024 13:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61EBB192B87;
	Wed, 10 Jul 2024 13:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bnZZ9ovH"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EF1192477
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jul 2024 13:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720618418; cv=none; b=Wl+ezR8lCWG2W8KlLYh+zhS7rbR1A4BtHKM3DK/nSQ+5OaIUji9Dd35o3FkuicW1ergQ92W1Q7a7qUuG51NN/9Dwe8MjLpALMBvLTWY7i+R3A4ZqpKLgj/ReM2Fzto3/WR2G00ytjdXPicPRpVo7PvRolCZFLMuzkK177zmyPNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720618418; c=relaxed/simple;
	bh=FhnvB485w1HY1BpYWf4IIAKXmnfOo2Ex9Gt1bbXVihk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RmQ83zjjJS16KGFSTOD7avtSbQfATCIeWsAC46mMFpK71UNoNoT/G+BubTsmUDOxVjExZ1fS0L7yHGydLF7s04rMsS6nnctegGDuG1p41Gagwd6juAOHVzFNHdjFvv/7e58v0RamTaBEOtrarVVXjAvcP08FK4yi8aPjPrMEs1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bnZZ9ovH; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-59589a9be92so2151710a12.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jul 2024 06:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720618415; x=1721223215; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1y6QWcxBkpL8sLlZ7Lnp0OFscz5jEsI1SABkkWAxiaY=;
        b=bnZZ9ovHIb4KvV0wOL1seVMxVb9Zha3DLWqFwsd7SB3AnWWHFZh7HzOq+J9uLJMIBk
         H1uqNT3roydNOumH6isYxACDbHYFfKySDxIwjfd9FHMbGOeULqKgt6DQxfWb+9MN7M47
         J0AXFXT4MG7FH6usitKbV7Ib7QibPL7y3uUFffQD/DL4IUQAAsqUVOXQ5SNDgTSZtipw
         UxWT2I/e8oc9n7/PpyMqZWEYZm++pDkut5KdRz91n4wJo+zYO5d8cMxH+I3EYYD7qyeG
         1FtzQwiEInr80t7Tc55eo/IP7iizDEBpS1yXS03jdClLaZH1orerHZJLxHIQImpIoeAK
         qawg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720618415; x=1721223215;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1y6QWcxBkpL8sLlZ7Lnp0OFscz5jEsI1SABkkWAxiaY=;
        b=UdKej/Eg4aCMn2pk3DY7yA0WkLEdENJtwOzfQJv3zwORkGTdC3f/UA0LEg2j1LEljB
         am+lTUdMBOHU5IuJp59iS2WZFhTm9MBN/qoFuPkNTirkkzCLiM7HsHzyGlGgBCXp9bfq
         G2ALzxMXOECQa39qCcV/OgpUORWng6ZV0FP835b99Vb7Jq9KVBb+ID7pOjw1W4rX9Zl4
         JMEE5iC+u/6KzyF286ZUbE5uwva3wAEEu79rqhSU6B1ln8qq6cHIiuRzLSSPomVvnNvk
         FJh7SKF9slVOD8/QMChWciCS20hrpNpP0j4GkWuinS1pAE3ldmiP7pEVB0nvOdbXCV9J
         K3xQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy0DMVq/gi9wmnbd2tiJZExiqxW5J1ukelkqfklaWQKW7Pe02k4FKsUo3jmYRZg1aA6DmS/V+CORjv2ULXDQPsWI1qAqfCFYo3mzPdZoVISkc=
X-Gm-Message-State: AOJu0Yza3iQ3U8HWh72GSt7sYbLZvg1fkuKbz9Wt2nt36qA45Q1b88Bn
	caJwQwCS30rAG9rvtP+/xPCsberZB70Rzik9lsUU75iz3rNGPjXdiLq8CnZ6ymkchFZrCwvPWKs
	vT64=
X-Google-Smtp-Source: AGHT+IEEff496JavyqfJq2LbrLMOXmUgoqw2wNiKA4XmY54IbkKvb8k1RWAvkt+sVr9kiG7HW6bnWA==
X-Received: by 2002:a05:6402:b19:b0:58d:842:6272 with SMTP id 4fb4d7f45d1cf-594bb67e9demr2995655a12.25.1720618414622;
        Wed, 10 Jul 2024 06:33:34 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-594bc4e81a6sm2220643a12.49.2024.07.10.06.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 06:33:34 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 10 Jul 2024 14:33:29 +0100
Subject: [PATCH] tty: serial: samsung: add clock comment for earlycon on
 gs101
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240710-samsung_tty-gs101earlycon-v1-1-bd0f8481542a@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKiNjmYC/x3MQQqDMBBA0avIrBuY0RTBq5RSopmkAzaWjIoi3
 t3g8i3+P0A5Cyt01QGZV1GZUgE9Khi+LkU24ouhxtpiS2jU/XRJ8TPPu4lKSOzyuA9TMpbanhr
 04UkeSv/PHGS736/3eV5IQ8KBawAAAA==
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

As pointed out in [1] before, the hand-over between earlycon and serial
console is fragile due to clocking issues:

    ... causing earlycon to stop to work sometime into the boot for two
    reasons:
    * peric0_top1_ipclk_0 requires its parent gout_cmu_peric0_ip to be
      running, but because earlycon doesn't deal with clocks that
      parent will be disabled when none of the other drivers that
      actually deal with clocks correctly require it to be running and
      the real serial driver (which does deal with clocks) hasn't taken
      over yet

    The console UART, and I2C bus 8 are on the same cmu_peric0 controller,
    and that cmu_peric0 has two clocks coming from cmu_top, ip and bus. For
    I2C8 & UART to work, both of these clocks from cmu_top need to to be on
    as they are the parent of the i2c8-(ip|pclk) and uart-(ip|pclk) each.

    The bootloader leaves those clocks running, yes. So earlycon works (for
    a while).

    At some point into the boot, one of two things happens:
    1) Linux will load the i2c driver. That driver does clock handling
    (correctly), it will initialise and then it has nothing to do, therefore
    it disables cmu_peric0's i2c8 ip and pclk clocks. Because at that stage
    nothing appears to be using the cmu_peric0's ip clock (the real serial
    driver hasn't initialised yet), Linux decides to also disable the parent
    ip clock coming from cmu_top.

    At this stage, the earlycon driver stops working, as the parent ip clock
    of the uart ip clock is not running any more. No serial output can be
    observed from this stage onwards. I think what is probably happening is
    that the console uart FIFO doesn't get emptied anymore, and earlycon
    will simply wait forever for space to become available in the FIFO (but
    I didn't debug this).

    Anyway, the boot doesn't progress, the system appears to hang. In any
    case it's not usable as we have no other means of using it at this stage
    (network / usb / display etc.).

    2) Alternatively, the UART driver will load at this stage. Again, it
    will tweak the clocks and after probe it will leave its clocks disabled.
    The serial console driver hasn't taken over at this stage and earlycon
    is still active. Again, the system will hang, because IP and PCLK have
    been disabled by the UART driver. Once the serial console is enabled,
    clocks are being enabled again, but because earlycon is still waiting
    for progress, the boot doesn't progress past disabling ip and pclk. It
    never gets to enabling the serial console (re-enabling the clocks).

    So in both cases we get some output from earlycon, but the system hangs
    once the first consumer driver of an IP attached to cmu_peric0 has
    completed probing.

    ...

    If earlycon is not enabled in kernel command line, everything works
    fine, the kernel buffers its messages and once the real serial console
    driver starts, all messages since boot are being printed.

As requested, add a comment to the code for posterity, so the
information is not lost. The patch referenced in the comment can be
found at [2].

Link: https://lore.kernel.org/all/d45de3b2bb6b48653842cf1f74e58889ed6783ae.camel@linaro.org/ [1]
Link: https://lore.kernel.org/all/20240710-gs101-non-essential-clocks-2-v3-2-5dcb8d040d1c@linaro.org/ [2]
Suggested-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/tty/serial/samsung_tty.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index dc35eb77d2ef..ae2378cfcf84 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -2821,6 +2821,15 @@ static int __init gs101_early_console_setup(struct earlycon_device *device,
 	return s5pv210_early_console_setup(device, opt);
 }
 
+/*
+ * Note that for earlycon to work, the respective ipclk and pclk need to be
+ * running! The bootloader normally leaves them enabled, but the serial
+ * driver will start handling those clocks before the console driver takes
+ * over from earlycon, breaking earlycon. If earlycon is required, please
+ * revert the patch "clk: samsung: gs101: don't mark non-essential (UART)
+ * clocks critical" locally first to mark them CLK_IS_CRITICAL and avoid this
+ * problem.
+ */
 OF_EARLYCON_DECLARE(gs101, "google,gs101-uart", gs101_early_console_setup);
 
 /* Apple S5L */

---
base-commit: 523b23f0bee3014a7a752c9bb9f5c54f0eddae88
change-id: 20240710-samsung_tty-gs101earlycon-417b130df51d

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


