Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76A1A5EC658
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 27 Sep 2022 16:34:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232444AbiI0Odv (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 27 Sep 2022 10:33:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232469AbiI0OdH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 27 Sep 2022 10:33:07 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B52DA82623
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Sep 2022 07:33:03 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id e18so6662109wmq.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Sep 2022 07:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=YzUTWEHUQYeukAyJEfTuM3PzyJlxwwnF0DoykmVbPWw=;
        b=aaJjumvNEBmO1pdqhzLUg45NBZhTSmGrIjUIvzX5EMVjt3/hYkgkgZt5Gg3aTUuSH5
         hWBl9VrxJGUtRE6gwub6BebrvJ/P+pALn7oOqeTQAMLKl6SQI6YsEgEB5UiG+YFhIu10
         0F51+qNmFxwByMXyhJb4fMML5XtZEVNijQrzBAKc0lJoAF+QnaD3RE3EUgUtKUJDacdM
         ttEchCaS2ZQs4A/ZmmxZw2NpHGuxH2E91NRkNUk/qkKETwCePwXv54dflV0AD4cCPw1a
         iV5wysatnt4wAYko9Sh1QCPbOfvXQZbo3n3v49fNUa6CiOAeZ8XXWm540NMZ82itxZb9
         VirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=YzUTWEHUQYeukAyJEfTuM3PzyJlxwwnF0DoykmVbPWw=;
        b=bENdsqArYTofv3E7k4/ymtLMTeD3i7jk1JNoyE80gXagZMPNrjiXe6J589Mq0xUHPs
         hXSv8RjtJp3DC9p6ugDacriue6AbRmuAW/HXOe86F3pHBDLs9aBiL1OcuyI9lCD6mOD9
         5sBfCPSjNw3lOkQrql1FuM8CvBvkpeDlmltuwS9+GJGNxIznWn7H0IQR/9KBpZSYivaJ
         9drj0yUOrB0/bd+vnQNTXajDsQjmbP3+S/eDZ23irDMrhyfUubLLb5BhnI+t0FPeEmT+
         qAhYVxVPNKQQul/EFDOmnkD03/2blmg1BBF3EUbceeNCCrvLny1ruwPbbwEHsQXpUlfB
         PZ9A==
X-Gm-Message-State: ACrzQf0r5DqPVbw1Wzm39slZgOKDrwhW/MPEWiHsIFSG4Ex4ULfgpEzS
        NEXt6t2UaVOOw5Mqzbui5xx69w==
X-Google-Smtp-Source: AMsMyM5AJFAJVhSq7o/pFKDyWc1CQ6N8nrzebmubgUQtwJScCNIuDHbeaDWWJ2PNPq5i0lLwMTTn/w==
X-Received: by 2002:a05:600c:35c5:b0:3b4:bf50:f84a with SMTP id r5-20020a05600c35c500b003b4bf50f84amr2894313wmq.22.1664289181760;
        Tue, 27 Sep 2022 07:33:01 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id l6-20020a05600c4f0600b003b4924493bfsm17518371wmq.9.2022.09.27.07.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 07:33:01 -0700 (PDT)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     daniel.lezcano@linaro.org, rafael@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        rui.zhang@intel.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Amit Kucheria <amitk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C,
        S5P AND EXYNOS ARM ARCHITECTURES)
Subject: [PATCH v6 08/29] thermal/drivers/exynos: of_thermal_get_ntrips()
Date:   Tue, 27 Sep 2022 16:32:18 +0200
Message-Id: <20220927143239.376737-9-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927143239.376737-1-daniel.lezcano@linaro.org>
References: <20220927143239.376737-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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

