Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B4566B5463
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 10 Mar 2023 23:30:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231755AbjCJWaK (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 10 Mar 2023 17:30:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231846AbjCJW3k (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 10 Mar 2023 17:29:40 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E2D7125DB9
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Mar 2023 14:29:17 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id cy23so26356463edb.12
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Mar 2023 14:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678487356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FIaJ3CNzZzvLZoER+JbEXfRFWn2Y0AmXfJ1n98/Pih8=;
        b=fb1NJ83RjyRvSKj0rXB4LrfAGEIsxmSjejZNxPWkM53UJeQEzoPANpAkGjEWOssWNr
         cG8jEKufjok4zpc1P6XdyVx3QaRYE94wyiKjaPDo1STMngh6goWGRQgqTNJFuGRL8o+5
         dosIz0grQHvWJ0qC+Mg5QtyJ9+7JmX4qqgUjvLi6gByOTaDTzKcJoaZCnrt8c/JUl6ae
         oMaPC7T23+IoKlugxJTFWl9dEDgMuAMv7zWHIf32Ky7j9j/+DCTTTzJL+gyTAPENFePG
         yMGr9hnSbko6tWLPskVscE2ZO9vSFofD1V1rjQkrp2iQL55A/d/IUHnCnq+xGpAJ7o7u
         rwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678487356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FIaJ3CNzZzvLZoER+JbEXfRFWn2Y0AmXfJ1n98/Pih8=;
        b=fItRg61cGyEvzTsk4iS/Ns+k/3Vq0MUIw/IF0qwUdrt8ZdLRaDDExpf6fLFLNGs8Al
         mIS86/1x4CRCPipf3gpPd/3E1rGuNnYGbpLG5r7uu2SLhb9VbnMT7SzJFoJzqW5W6Tzy
         PqmvZ76C7Gl74tWGEXlztQM41JWpR2gzpKVX4QxduAejnnuiznkWTv6H4GZSmBoy+eIr
         b3rwzSAxpZgoIbDySdhS8zmb6konbbYe+eok6yLV/eBKELDrN4ehyLqhpNPOnLugDKhC
         MYRdaKcoxK0SnWWIbEptKk8ixgc+IIh4SLy2YsjxxVp6j+nXkvFNoPDVtc09UXPWtJG2
         /Glw==
X-Gm-Message-State: AO0yUKWIWVca9CdDVHqD9Dfo14m6R2BSMbt76ee2ub+56bD3KSGM1GOa
        lMl3+gS1qrF4al/MmpipOH9BnQ==
X-Google-Smtp-Source: AK7set9oOs+ouUsV12VicHtBBZ+mnisQzcWRj4a6R7IcGKs+Ki++e/B2Xo1UC0guT3zbocHXFlq8Rg==
X-Received: by 2002:aa7:dcc8:0:b0:4fa:57bf:141a with SMTP id w8-20020aa7dcc8000000b004fa57bf141amr213950edu.32.1678487356567;
        Fri, 10 Mar 2023 14:29:16 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id x101-20020a50baee000000b004aeeb476c5bsm525467ede.24.2023.03.10.14.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:29:16 -0800 (PST)
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
Subject: [PATCH 13/16] spi: bcm-qspi: Mark OF related data as maybe unused
Date:   Fri, 10 Mar 2023 23:28:54 +0100
Message-Id: <20230310222857.315629-13-krzysztof.kozlowski@linaro.org>
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

The driver can be compile tested with !CONFIG_OF making certain data
unused:

  drivers/spi/spi-bcm-qspi.c:1460:34: error: ‘bcm_qspi_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/spi/spi-bcm-qspi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-bcm-qspi.c b/drivers/spi/spi-bcm-qspi.c
index 0eee574d3e1f..1de1b669fc96 100644
--- a/drivers/spi/spi-bcm-qspi.c
+++ b/drivers/spi/spi-bcm-qspi.c
@@ -1457,7 +1457,7 @@ static const struct bcm_qspi_data bcm_qspi_spcr3_data = {
 	.has_spcr3_sysclk = true,
 };
 
-static const struct of_device_id bcm_qspi_of_match[] = {
+static const struct of_device_id bcm_qspi_of_match[] __maybe_unused = {
 	{
 		.compatible = "brcm,spi-bcm7445-qspi",
 		.data = &bcm_qspi_rev_data,
-- 
2.34.1

