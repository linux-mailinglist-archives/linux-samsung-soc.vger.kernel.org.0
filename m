Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE0595AF179
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  6 Sep 2022 19:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239294AbiIFRBY (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 6 Sep 2022 13:01:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237863AbiIFRAF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 6 Sep 2022 13:00:05 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42EB227B1C
        for <linux-samsung-soc@vger.kernel.org>; Tue,  6 Sep 2022 09:47:50 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id n17-20020a05600c501100b003a84bf9b68bso7800070wmr.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Sep 2022 09:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=YzUTWEHUQYeukAyJEfTuM3PzyJlxwwnF0DoykmVbPWw=;
        b=yDo8TXj9fCjqieUCk3hVb901d8qIcTCqR9xiEQlNyW5Fs0IG+yPdUxPIRDIvAWe4Cz
         P8k9Nwi5MHbjDsvau4h3duQ4A82oDQJiMRKfRlqzbn2PYPQ9z3AiVWc3iPhgd9X9c031
         QBNk1Ht9SI7LqxtIvQVuYxP90AkEvbZBLrkFmgtQ3vb9WJ8XxGyrO5RYgNm//+yF2QbE
         M05Rh+KPe+NdtncAOBLvn/b1PQhnNAI11JfibnUtHQT3zSQDZMpd+hUkdDRfEg7UB9H/
         +r4e+tKyj4i7e003+vo+SJ1kD9FLyEpulApDTmkJv3mvCGbOQ950GeEq6jf9iBUKZ/05
         FgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=YzUTWEHUQYeukAyJEfTuM3PzyJlxwwnF0DoykmVbPWw=;
        b=PBek05JM1GSqgTnUH8jKWjxLghfqNKWnhJDCNlhIpgD0RbxceOkApnur9mzjQ60WwD
         lqReYEZGPFqW8NtfPiYK+w4dJn7G39EY9D4E3WscEAodg+Sy2HHQNCJB9JOXdiU/yfFy
         U/7GJnhZ3VGMqP9GkvDFf1W/hfSkTylfkxN5ZQ5mgggBhi2XRzk1xUVxIQRHsEDt1Dp4
         qJNQu3oUedDLFWasPTkjRO3SdVZyb27bZr8SAq0qYc9fu/Cfn4gI6hwbRpJqZCAifT//
         +qkfAF2Kn6SLFfqCT/1UTS88cScqVomcqMpvwS+zISGzbC0MGXOmjG1mXOcyoC7HjAmW
         Y7kg==
X-Gm-Message-State: ACgBeo3teuPFjix+JxlN/pnJv5UVxkcooMesve3k7X6HLiPsaY6JmNfP
        HhjL3/C5xqTpUoSaUnY5KBz1/g==
X-Google-Smtp-Source: AA6agR67oi4cMlUYeqQPPz6/1Bzsf6GWTinHyeHohnzUkgN6Wlpzl/y8KkFAry44BFgmgKq8e2owfA==
X-Received: by 2002:a05:600c:a4c:b0:39c:34d0:fd25 with SMTP id c12-20020a05600c0a4c00b0039c34d0fd25mr14773449wmq.172.1662482868338;
        Tue, 06 Sep 2022 09:47:48 -0700 (PDT)
Received: from localhost.localdomain (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id e27-20020adf9bdb000000b0021f0ff1bc6csm7426600wrc.41.2022.09.06.09.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 09:47:47 -0700 (PDT)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     daniel.lezcano@linaro.org, rafael@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C,
        S5P AND EXYNOS ARM ARCHITECTURES)
Subject: [PATCH v3 09/30] thermal/drivers/exynos: of_thermal_get_ntrips()
Date:   Tue,  6 Sep 2022 18:46:59 +0200
Message-Id: <20220906164720.330701-10-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906164720.330701-1-daniel.lezcano@linaro.org>
References: <20220906164720.330701-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The thermal core framework allows to get the number of thermal trips,
use it instead of visiting the thermal core structure internals.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/thermal/samsung/exynos_tmu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 0e33d32a9d2e..91e6860b5ec4 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -260,6 +260,7 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
 {
 	struct exynos_tmu_data *data = platform_get_drvdata(pdev);
 	struct thermal_zone_device *tzd = data->tzd;
+	int num_trips = thermal_zone_get_num_trips(tzd);
 	unsigned int status;
 	int ret = 0, temp;
 
@@ -271,12 +272,12 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
 		goto out;
 	}
 
-	if (of_thermal_get_ntrips(tzd) > data->ntrip) {
+	if (num_trips > data->ntrip) {
 		dev_info(&pdev->dev,
 			 "More trip points than supported by this TMU.\n");
 		dev_info(&pdev->dev,
 			 "%d trip points should be configured in polling mode.\n",
-			 (of_thermal_get_ntrips(tzd) - data->ntrip));
+			 num_trips - data->ntrip);
 	}
 
 	mutex_lock(&data->lock);
@@ -289,7 +290,7 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
 		ret = -EBUSY;
 	} else {
 		int i, ntrips =
-			min_t(int, of_thermal_get_ntrips(tzd), data->ntrip);
+			min_t(int, num_trips, data->ntrip);
 
 		data->tmu_initialize(pdev);
 
-- 
2.34.1

