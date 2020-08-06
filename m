Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DF6423E090
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  6 Aug 2020 20:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728298AbgHFSf5 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 6 Aug 2020 14:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726094AbgHFSex (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 6 Aug 2020 14:34:53 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 707E6C061A12
        for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Aug 2020 11:34:40 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id r2so39852189wrs.8
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Aug 2020 11:34:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:resent-from:resent-date:resent-message-id
         :resent-to:dkim-signature:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=P/4Vf8XTg1yEubNoDSMrUtqrSAPvF4rBwDg8gqa3eIo=;
        b=LZRgE7GD55QiO1zbCYW27SJLCEKPPgL1zEs19FfgBRNpGVvsm6XvY+3AQjR41E3Pl0
         lnW4uixrLDtWa/pjBY01mE3xYaw3PSsSl0sGitfC/AtBaGtNwSfwrQsiPEKIH4/UaAeZ
         zwqLDqGZOyVvSnhj0hGnqbyMYAPuxxyyza6DrmGqtjLlMZPbLzbENbNEh64JpfkTW53y
         4ZfExocrtJArhihHsBABp5+vNbWHRZHp13O+gvw2qTQpTq7+4fJxcYyHc/W+65/hGE1N
         56FhD7HwbOexFvSPdu1zTmzpWVhU/k4TUdPYBbB8aC6QC8yDTSxbCogTbiFv0FiyCD8i
         yB3A==
X-Gm-Message-State: AOAM531cpd2zqmWjfsey67O8bPIgbw2IKbOhFny114Rjxyac0AIWPO4M
        qLmsvmiK2TxEnrYjcguM/a7Fzf/rorw=
X-Google-Smtp-Source: ABdhPJwl7GP8UL9Sqeh4KsR69EK2l7RGbHmI/ptcN+vHzlbqipWemULtbL7Wu180tvgqgshCKtcXRA==
X-Received: by 2002:adf:a102:: with SMTP id o2mr8427596wro.319.1596738878693;
        Thu, 06 Aug 2020 11:34:38 -0700 (PDT)
Received: from kozik-lap ([194.230.155.117])
        by smtp.googlemail.com with ESMTPSA id 69sm7765836wmb.8.2020.08.06.11.34.38
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 11:34:38 -0700 (PDT)
Received: by 2002:ab3:1105:0:0:0:0:0 with SMTP id j5csp1541288lta;
        Thu, 6 Aug 2020 11:22:53 -0700 (PDT)
X-Received: by 2002:a62:1cce:: with SMTP id c197mr9367619pfc.267.1596738173375;
        Thu, 06 Aug 2020 11:22:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596738173; cv=none;
        d=google.com; s=arc-20160816;
        b=EESVSEur0rL0vSVS0cKkWj2FpLD86IF4Ydtn7wQb1Qdd60/CO7srCZIFREa7dC/P6i
         o0Xy4VT8On9ciija/OnS3VKOkBL7P8QzQeSYp+rdTqg+9WgCHQuMBk6pnB9qRzkvliHh
         W3EFMphL2W4QJJf6UJD0UHZyytxpPP+IbEekEsaIpLv/1KjtOAS65N0KLqeEIF8Y3wDn
         erjpd0g4WQrg6+pZrb8J1QAdefxBRU2D15ha6rylqXGU2OKveSbhnbCYSYmff5EIgERL
         DTdk9avVeglf94/ut/SB1zYLUQzoRJL/GQqmBf2GA4TppYz3VthZ8JHhLuJMyentwleh
         9uQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature:delivered-to;
        bh=P/4Vf8XTg1yEubNoDSMrUtqrSAPvF4rBwDg8gqa3eIo=;
        b=EK0QJSsd7J8LLVSVJbwRlBVKFbs4W6R+odOo1dOLvzoU3fHTa8qAY7//HZu2MO3xhp
         vXEZsC+LYlFU14osbKoxOXUE+GNpjNnk88BKCPyEOyt5VIRnpemmL39OkRaRTFScmME0
         8wxPaA8hCSSc84gh476MWi7THTJ446P33P7NYzYNfEPsDz4xmIIaYw0SotMfGJ9jcGD9
         ITUAfDD4A8DwNu/VF+BiiwFInXx74igT5aqYgFBOv432KK6G3yGkrRPpQn56m6/EPB+1
         h2TWzwncwyu+xfIFe6IWy3GcDoeSYQvFvgCVv1KXEm38norL0XlVeMlMnIpx9uEOWJsb
         ln3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=default header.b=RnJk8Nw2;
       spf=pass (google.com: domain of krzk@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=krzk@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by mx.google.com with ESMTPS id v20si3904172pgk.407.2020.08.06.11.22.53
        for <k.kozlowski.k+kernel@gmail.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Aug 2020 11:22:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of krzk@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: by mail.kernel.org (Postfix)
        id 7949422D74; Thu,  6 Aug 2020 18:22:53 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7B4C522D70;
        Thu,  6 Aug 2020 18:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596738173;
        bh=e1oSXjKRZ1/t6yaGmxeMpFJIIqxQuITtDtfD3fTgYtQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RnJk8Nw20oovJGOtix16awmixT2stIdDZnn5cCpdsfoPL1ZDrAouFmfTXazZkBryt
         U6+/C4sQrMYB7/RhwqVpMgQSY+Lnf776wVev3iQBKSSjccZfpKA0QCfvg58nAuJV/9
         XLhS2JgfS/EMeK/1j1FFEu/fmUc6n1ay5mUcjoIg=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Sangbeom Kim <sbkim73@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH v2 18/41] ARM: s5pv210: don't imply CONFIG_PLAT_SAMSUNG
Date:   Thu,  6 Aug 2020 20:20:35 +0200
Message-Id: <20200806182059.2431-18-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806181932.2253-1-krzk@kernel.org>
References: <20200806181932.2253-1-krzk@kernel.org>
X-TUID: ipnqe01njWQR
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The plat-samsung directory and mach-s5pv210 can be build
completely independently, so split the two Kconfig symbols
CONFIG_PLAT_SAMSUNG and CONFIG_ARCH_S5PV210.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Ulf Hansson <ulf.hansson@linaro.org>
Acked-by: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/Kconfig.debug        | 6 +++---
 arch/arm/Makefile             | 1 -
 arch/arm/plat-samsung/Kconfig | 2 +-
 drivers/mmc/host/Kconfig      | 2 +-
 drivers/pwm/Kconfig           | 2 +-
 drivers/spi/Kconfig           | 2 +-
 drivers/tty/serial/Kconfig    | 2 +-
 sound/soc/samsung/Kconfig     | 2 +-
 8 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 153a9a35dd20..b4b41f9d246b 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -1005,7 +1005,7 @@ choice
 		  via SCIFA4 on Renesas SH-Mobile AG5 (SH73A0).
 
 	config DEBUG_S3C_UART0
-		depends on PLAT_SAMSUNG || ARCH_EXYNOS
+		depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS
 		select DEBUG_EXYNOS_UART if ARCH_EXYNOS
 		select DEBUG_S3C24XX_UART if ARCH_S3C24XX
 		select DEBUG_S3C64XX_UART if ARCH_S3C64XX
@@ -1017,7 +1017,7 @@ choice
 		  by the boot-loader before use.
 
 	config DEBUG_S3C_UART1
-		depends on PLAT_SAMSUNG || ARCH_EXYNOS
+		depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS
 		select DEBUG_EXYNOS_UART if ARCH_EXYNOS
 		select DEBUG_S3C24XX_UART if ARCH_S3C24XX
 		select DEBUG_S3C64XX_UART if ARCH_S3C64XX
@@ -1029,7 +1029,7 @@ choice
 		  by the boot-loader before use.
 
 	config DEBUG_S3C_UART2
-		depends on PLAT_SAMSUNG || ARCH_EXYNOS
+		depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS
 		select DEBUG_EXYNOS_UART if ARCH_EXYNOS
 		select DEBUG_S3C24XX_UART if ARCH_S3C24XX
 		select DEBUG_S3C64XX_UART if ARCH_S3C64XX
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 826613a20b7d..3997cec8848e 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -234,7 +234,6 @@ machine-$(CONFIG_PLAT_SPEAR)		+= spear
 # by CONFIG_* macro name.
 plat-$(CONFIG_ARCH_OMAP)	+= omap
 plat-$(CONFIG_ARCH_S3C64XX)	+= samsung
-plat-$(CONFIG_ARCH_S5PV210)	+= samsung
 plat-$(CONFIG_PLAT_ORION)	+= orion
 plat-$(CONFIG_PLAT_PXA)		+= pxa
 plat-$(CONFIG_PLAT_S3C24XX)	+= samsung
diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
index a7cb0db1d5cc..13b39684b582 100644
--- a/arch/arm/plat-samsung/Kconfig
+++ b/arch/arm/plat-samsung/Kconfig
@@ -4,7 +4,7 @@
 
 config PLAT_SAMSUNG
 	bool
-	depends on PLAT_S3C24XX || ARCH_S3C64XX || ARCH_S5PV210
+	depends on PLAT_S3C24XX || ARCH_S3C64XX
 	default y
 	select GENERIC_IRQ_CHIP
 	select NO_IOPORT_MAP
diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index ddce8e62280c..9f387daa764a 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -289,7 +289,7 @@ config MMC_SDHCI_TEGRA
 
 config MMC_SDHCI_S3C
 	tristate "SDHCI support on Samsung S3C SoC"
-	depends on MMC_SDHCI && (PLAT_SAMSUNG || ARCH_EXYNOS)
+	depends on MMC_SDHCI && (PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS)
 	help
 	  This selects the Secure Digital Host Controller Interface (SDHCI)
 	  often referrered to as the HSMMC block in some of the Samsung S3C
diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 7dbcf6973d33..9448e4ca8c73 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -410,7 +410,7 @@ config PWM_ROCKCHIP
 
 config PWM_SAMSUNG
 	tristate "Samsung PWM support"
-	depends on PLAT_SAMSUNG || ARCH_EXYNOS || COMPILE_TEST
+	depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
 	help
 	  Generic PWM framework driver for Samsung.
 
diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index c3008e423f59..85619ab64156 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -680,7 +680,7 @@ config SPI_S3C24XX_FIQ
 
 config SPI_S3C64XX
 	tristate "Samsung S3C64XX series type SPI"
-	depends on (PLAT_SAMSUNG || ARCH_EXYNOS || COMPILE_TEST)
+	depends on (PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST)
 	help
 	  SPI driver for Samsung S3C64XX and newer SoCs.
 
diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index 8a0352eb337c..10de494e808a 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -235,7 +235,7 @@ config SERIAL_CLPS711X_CONSOLE
 
 config SERIAL_SAMSUNG
 	tristate "Samsung SoC serial support"
-	depends on PLAT_SAMSUNG || ARCH_EXYNOS || COMPILE_TEST
+	depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
 	select SERIAL_CORE
 	help
 	  Support for the on-chip UARTs on the Samsung S3C24XX series CPUs,
diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index 1431be4ed054..a2221ebb1b6a 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menuconfig SND_SOC_SAMSUNG
 	tristate "ASoC support for Samsung"
-	depends on PLAT_SAMSUNG || ARCH_EXYNOS || COMPILE_TEST
+	depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
 	depends on COMMON_CLK
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
-- 
2.17.1

