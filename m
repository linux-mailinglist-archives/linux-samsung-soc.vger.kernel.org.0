Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA4B16B5467
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 10 Mar 2023 23:30:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231974AbjCJWaM (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 10 Mar 2023 17:30:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232095AbjCJW3x (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 10 Mar 2023 17:29:53 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BBD6125D92
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Mar 2023 14:29:20 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id ec29so26470095edb.6
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Mar 2023 14:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678487359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/3O5N03pwwa5CISBXEL2uh41ANV84DtyZX9Qqc/gvOE=;
        b=k/86A8NzfMfImxqB7+KDGVg/tynJ0FVCkA4dmZsWIIwO7Ykre8VGNhhLmaoZxK5KT6
         H3l6ZZCxmyioRniLqshH544hiliBpuPql4rrcaGN9SPUaoBgt/mYjvy3lFkcooWp+CQj
         /cZd6t1wB+DD9btEFmW4rhD/UxwGgSLeoP8+6PQdjvt2yfEZsUiYi1auwiNr2YRkL0Ae
         eGYX/hpVFD0YR9ZjOD9aXNAFS55flsLUNlQ/EodMAcU9+jDwOEUYGcDlVb/I+8XQi7AC
         +dBZ6c8c6uYJIAAEPOJ4odu80gqrKfSiQSXkSlCWkyr1U2hFPRdYKsgGWKGkJMfxst9s
         c+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678487359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/3O5N03pwwa5CISBXEL2uh41ANV84DtyZX9Qqc/gvOE=;
        b=jYnroiPxK26GLc0E1VjigTIjFpPh2X0FTIZMqjYkxwjXK/YFQfIDI2Il/WgMpWBJoC
         zSvkFpQ3yfoZeKvMhnTVIAoUcCI3cIEaSeUgLmJ+OIZwjbvUPifqrCD8nc+IB/s6B9WX
         3+Jj+epv80kcskty0jq5EQVyEyUsPE7Au7mzY4f1bWfkxoAiVuupmF2SV01Jpx/lo1FP
         /48MIDlh7eeuICiCKBTFpk/M8RsUMA4Pu3WVd/EepuexGSK29kKbCSzq7GX47aLOHllR
         BCpMxUjbpe0vPR06t+nrSFBUHMGvSoIhp1kto+Hg2HmUsGUbIjwBbqWlRXeBUcc8dAqA
         exSg==
X-Gm-Message-State: AO0yUKUJ/KmtlkEiTN6Yu0xbdb/jH/ZQ51b49GN96v715HtQLiXJJkhb
        aI8vZAboir9UfZnbE+8MHJFrTA==
X-Google-Smtp-Source: AK7set9Rvn4y0BGnLTV87CbBg91zcO1xpeU2J1xLOi9EFaaPOkq+Z2ChtSGd5/YJsuzGlHU4/phxIA==
X-Received: by 2002:a05:6402:3d9:b0:4af:69e2:529f with SMTP id t25-20020a05640203d900b004af69e2529fmr26991968edw.27.1678487359382;
        Fri, 10 Mar 2023 14:29:19 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id x101-20020a50baee000000b004aeeb476c5bsm525467ede.24.2023.03.10.14.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:29:18 -0800 (PST)
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
Subject: [PATCH 15/16] spi: sc18is602: Mark OF related data as maybe unused
Date:   Fri, 10 Mar 2023 23:28:56 +0100
Message-Id: <20230310222857.315629-15-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
References: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The driver can be compile tested with !CONFIG_OF making certain data
unused:

  drivers/spi/spi-sc18is602.c:318:34: error: ‘sc18is602_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/spi/spi-sc18is602.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-sc18is602.c b/drivers/spi/spi-sc18is602.c
index 983b3621bc2a..5c2c255f70e8 100644
--- a/drivers/spi/spi-sc18is602.c
+++ b/drivers/spi/spi-sc18is602.c
@@ -315,7 +315,7 @@ static const struct i2c_device_id sc18is602_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, sc18is602_id);
 
-static const struct of_device_id sc18is602_of_match[] = {
+static const struct of_device_id sc18is602_of_match[] __maybe_unused = {
 	{
 		.compatible = "nxp,sc18is602",
 		.data = (void *)sc18is602
-- 
2.34.1

