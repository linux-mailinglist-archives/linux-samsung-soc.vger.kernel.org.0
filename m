Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF7EB6B546A
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 10 Mar 2023 23:30:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231982AbjCJWaN (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 10 Mar 2023 17:30:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232100AbjCJW3y (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 10 Mar 2023 17:29:54 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38B65125DBF
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Mar 2023 14:29:20 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id x3so26395681edb.10
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Mar 2023 14:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678487360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p4C8ul8r4FTTSiZJ472TZ7PsXvPEhmFf5+M7zLcSIw8=;
        b=rrEwy1/EkKM2hXYDjXm39vr4v4A3eFp0vxvvErw0JyGtOLyGzIPJjSe+i9/9yBHwBo
         ggaHhX0ARMHrz05m76okNh3eCxxkXswhGfFQlh8eLEaz5q4totxmsxrVKzzBcVPBlD/r
         43Om/8th0/4GENyp64/VX1I0z8locQldE8GoKn//2LSXEUixCVdNQJcwBsfbBKvRF4Nw
         1L0+7vFPvhd6M4ExGtj4xFecNGFGuBJbBwpaN5Ez6o4kPkYXI5CclN4jOfC5FSg96/K5
         A3HVNgymCz5jus/z1ws+Kq28D+AiPQyBaTjxTt2vechjWxkcXHoPWEnZqCMB8j+ZvSaF
         TWUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678487360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p4C8ul8r4FTTSiZJ472TZ7PsXvPEhmFf5+M7zLcSIw8=;
        b=zytjmxTbKgaZ6vlfEb83STvqU2ATMT+OMfIHv4Q/jtsTaeZjcIHwfHNjH660PD8YEo
         9WXC1SQzrwlC9QFgAkmFvIQJdRopG1NdtNBthFPzGROjvsOT+6F5Iltgeq1WcWc6YzML
         mpzLY1J1w6i2oliNWTzp63sUDSYeAnuEPESkzP2Mz44tW8yb1Jp5823l8vF2+qpFHJFs
         sJdFuwmI33KyaLMzY3jAxsZhew7f7qqO0YTcr96KR6NkDdvpAQItfgB9iZ8JDZ8j/Vad
         Nc/c3YgS7F3VYuT9ydvRZonfO89DEk+FqscgHVBzlsNUwkGbVksO1xmqPqOqZlnvn/ih
         emkw==
X-Gm-Message-State: AO0yUKXsEE6fJx6rumcTcPt5euDo3D/RnF40on3o36IDpIC/90EniR5d
        8jPfrarJH4VGaSozuRwDdYR1Aw==
X-Google-Smtp-Source: AK7set9Dxapp5m7YmqmEU473go9gZsJAewh+nBqHr15xGDvrxDQqScmrTjf4oppgDcLOYI+pKl+ozg==
X-Received: by 2002:a17:906:3002:b0:8b2:fb3d:9f22 with SMTP id 2-20020a170906300200b008b2fb3d9f22mr25973054ejz.33.1678487360596;
        Fri, 10 Mar 2023 14:29:20 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id x101-20020a50baee000000b004aeeb476c5bsm525467ede.24.2023.03.10.14.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:29:20 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Mark Brown <broonie@kernel.org>, Kamal Dasu <kdasu.kdev@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Heiko Stuebner <heiko@sntech.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andi Shyti <andi@etezian.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH 16/16] spi: rspi: Mark OF related data as maybe unused
Date:   Fri, 10 Mar 2023 23:28:57 +0100
Message-Id: <20230310222857.315629-16-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
References: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Driver can match via ID or OF ID table, thus several OF-related methods
will be unused.  Mark the OF structures as __maybe_unused so compiler
can drop them:

  drivers/spi/spi-rspi.c:1203:29: error: ‘qspi_ops’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/spi/spi-rspi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-rspi.c b/drivers/spi/spi-rspi.c
index f494c86bafea..4724854e6726 100644
--- a/drivers/spi/spi-rspi.c
+++ b/drivers/spi/spi-rspi.c
@@ -1190,7 +1190,7 @@ static const struct spi_ops rspi_ops = {
 	.num_hw_ss =		2,
 };
 
-static const struct spi_ops rspi_rz_ops = {
+static const struct spi_ops rspi_rz_ops __maybe_unused = {
 	.set_config_register =	rspi_rz_set_config_register,
 	.transfer_one =		rspi_rz_transfer_one,
 	.min_div =		2,
@@ -1200,7 +1200,7 @@ static const struct spi_ops rspi_rz_ops = {
 	.num_hw_ss =		1,
 };
 
-static const struct spi_ops qspi_ops = {
+static const struct spi_ops qspi_ops __maybe_unused = {
 	.set_config_register =	qspi_set_config_register,
 	.transfer_one =		qspi_transfer_one,
 	.extra_mode_bits =	SPI_TX_DUAL | SPI_TX_QUAD |
@@ -1212,8 +1212,7 @@ static const struct spi_ops qspi_ops = {
 	.num_hw_ss =		1,
 };
 
-#ifdef CONFIG_OF
-static const struct of_device_id rspi_of_match[] = {
+static const struct of_device_id rspi_of_match[] __maybe_unused = {
 	/* RSPI on legacy SH */
 	{ .compatible = "renesas,rspi", .data = &rspi_ops },
 	/* RSPI on RZ/A1H */
@@ -1225,6 +1224,7 @@ static const struct of_device_id rspi_of_match[] = {
 
 MODULE_DEVICE_TABLE(of, rspi_of_match);
 
+#ifdef CONFIG_OF
 static void rspi_reset_control_assert(void *data)
 {
 	reset_control_assert(data);
-- 
2.34.1

