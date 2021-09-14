Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78CB540B080
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 14 Sep 2021 16:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233309AbhINOYh (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 14 Sep 2021 10:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233338AbhINOYf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 14 Sep 2021 10:24:35 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AEEDC061764
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Sep 2021 07:23:18 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id g14so24207865ljk.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Sep 2021 07:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JujpZaikMMevY8hhCqH/hKO/zBJYMZ/j4U4Qz2KhW34=;
        b=sbR73ETHcJ0IxzzKe6OUCJ2Hs5twwz2oM13CzLwDXbh20/HlWA0gf0Cr/MTPpi4UOH
         fR3aJBjQQuTvFplnFmUiKL641yJPmwkTsaC/4ur99YPYrXuJUtd+vqI9sDp8ZRGI6/7D
         gxP1YQkrAo+NclbHesmraGMjIICYArX4QkOG8RoaCYuJV0LSqkB5adT1OImlBK4idWBg
         FOw7uqAEWCgmtMAHkg/eQLkLNMZnFv2TOivrbAcEYSdqx91YsfawPko0yiTQHgddJ7PN
         SOgKBQ77pU35/mXcrJeuTatWu8hCqsnmEzRR7R0apmmuzr2XfxqkXdU8SJGhTmmgGBXr
         P+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JujpZaikMMevY8hhCqH/hKO/zBJYMZ/j4U4Qz2KhW34=;
        b=cXti2TDrt0SUfeiKyEyqB6ItuKzWBazOgvuCKaxJwElrsSiGjNlqVzLR4kFNkvN7/o
         sY4LSKRXp3PO+2qAWOI78vsdfGkU+nY/L3zqDBICsKH2cCQI10xlETGowq47yyshuBsm
         Zqlv6pmnUnnuoINsZHLv2Pyso4rp4dk55ZSKy32ggB3JTVgtHGU+iBfwOUHcAqBnGrfT
         OnbsilfF36kqB2LTJ+1wvbOAwbjDVvO4slR+DSU/PV7/wyPNaCpJvqmxdqODj2J5+DJ2
         bW8Ie6vvDHX75S5reHz9q6RWNgdQR6RKFMDHVr+Kmxg1Z79duJidunrXZYWrXVhdpsJ5
         TOLA==
X-Gm-Message-State: AOAM530zxOmjleNpr77T7QxyYghcSB17O3u1Sw/bEpxV4h1tw1WmTY6f
        8Dqm3YQNoePR0orRUH0MiI8HlKWyz1EdVhvw
X-Google-Smtp-Source: ABdhPJzAjiJ0v7ayBbIHxT4Urg/v0A5EUKeXvz4EebS/7cNeA0bHkgoDOYpKn1i1YQw9w1HnrAImTQ==
X-Received: by 2002:a2e:b894:: with SMTP id r20mr15175355ljp.291.1631629396573;
        Tue, 14 Sep 2021 07:23:16 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id k12sm1318078ljm.65.2021.09.14.07.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 07:23:16 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jiri Slaby <jirislaby@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] tty: serial: samsung: Improve naming for common macro
Date:   Tue, 14 Sep 2021 17:23:15 +0300
Message-Id: <20210914142315.26596-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Having "_USI" suffix in EXYNOS_COMMON_SERIAL_DRV_DATA_USI() macro is
confusing. Rename it to just EXYNOS_COMMON_SERIAL_DRV_DATA() and provide
USI registers availability for all Exynos variants instead.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/tty/serial/samsung_tty.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index e2f49863e9c2..542b7e2b99dc 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -2780,7 +2780,7 @@ static struct s3c24xx_serial_drv_data s5pv210_serial_drv_data = {
 #endif
 
 #if defined(CONFIG_ARCH_EXYNOS)
-#define EXYNOS_COMMON_SERIAL_DRV_DATA_USI(_has_usi)		\
+#define EXYNOS_COMMON_SERIAL_DRV_DATA(_has_usi)			\
 	.info = &(struct s3c24xx_uart_info) {			\
 		.name		= "Samsung Exynos UART",	\
 		.type		= TYPE_S3C6400,			\
@@ -2804,21 +2804,18 @@ static struct s3c24xx_serial_drv_data s5pv210_serial_drv_data = {
 		.has_fracval	= 1,				\
 	}							\
 
-#define EXYNOS_COMMON_SERIAL_DRV_DATA				\
-	EXYNOS_COMMON_SERIAL_DRV_DATA_USI(0)
-
 static struct s3c24xx_serial_drv_data exynos4210_serial_drv_data = {
-	EXYNOS_COMMON_SERIAL_DRV_DATA,
+	EXYNOS_COMMON_SERIAL_DRV_DATA(0),
 	.fifosize = { 256, 64, 16, 16 },
 };
 
 static struct s3c24xx_serial_drv_data exynos5433_serial_drv_data = {
-	EXYNOS_COMMON_SERIAL_DRV_DATA,
+	EXYNOS_COMMON_SERIAL_DRV_DATA(0),
 	.fifosize = { 64, 256, 16, 256 },
 };
 
 static struct s3c24xx_serial_drv_data exynos850_serial_drv_data = {
-	EXYNOS_COMMON_SERIAL_DRV_DATA_USI(1),
+	EXYNOS_COMMON_SERIAL_DRV_DATA(1),
 	.fifosize = { 256, 64, 64, 64 },
 };
 
-- 
2.30.2

