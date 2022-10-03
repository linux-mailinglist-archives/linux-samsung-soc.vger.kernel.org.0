Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2CAD5F3142
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  3 Oct 2022 15:30:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbiJCNaJ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 3 Oct 2022 09:30:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbiJCNaI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 3 Oct 2022 09:30:08 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6505A17A8F
        for <linux-samsung-soc@vger.kernel.org>; Mon,  3 Oct 2022 06:30:05 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id b7so9139173wrq.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Oct 2022 06:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=K+1rfxoYuPGVyugbqBQnz5TOkQnrFnazhzmXLe5x1kk=;
        b=YdGNxZrDeq2Ca5oDBn0BNqMa8Pd5/9myYbWwsZv1k5Wac00ZwsjY9ks1spfrTh9gus
         nJhnNAqYRyvk1MbskUc1n3ZLd1vQ4Gmgnde1f1i5FXKrLcBeA3oyS3cWU6V7LQjDxNCz
         /a93+1JnCWlFIaJgJRzWvHGXYj22l54rDzS49oyHOQ3gxGBChSVmMXIoC3DHVQBSMwai
         VPeJY6y0xqGq5+LHjQyl+we/zZzUgsgC9mqqjFmf8216XpWvzoOX9gHfKKcLujhZD1Rx
         Le+8s4Vrd9AwddaQvd0yyQ9JdG4RFrcTsm0UAJ2ll8y0FNkEJuK2hDaOrYbQhXk5uhzv
         NFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=K+1rfxoYuPGVyugbqBQnz5TOkQnrFnazhzmXLe5x1kk=;
        b=jsnLfofdtRZQA8WThm6pE0t0oetxnuaJXhBLVlz3St8JoDTqGAOqaKFIKi6QdBWsqU
         jWGGl2RcQkv6cuzVYSAYr908+qJdROMXuKzH0pG3HrXC0mZJoahgQBg+8qYfO90ONZ3U
         BB0lcGXlCphciDifaf4ip++GpkQTIcvQgAJ0BDAcDVN5wZVag/IntTt8C7nMCaTnM1US
         NySAek8x7TK7LB1atxQsEPuqJ9npuZHg0FundQv/xoDEZ5fN3JP06prlJfaqrN/lnA6L
         IWJmx7YZUWugt0maWrZq/JnTArUr4Z1MQ91R/jtWvZKSxMNzZBZi5VLlqZ9ELako8xYz
         cMlw==
X-Gm-Message-State: ACrzQf3ALqQu8V7jH0vA2rrlePNy604Rf90O74IUnH0pz2l6qclgRVxC
        07FBm/HBl9mU5JxC2xMTH/1xtg==
X-Google-Smtp-Source: AMsMyM66s2c6ioMSZWAOxcHBd1FcbmLW5V+HHMEDhVA8STfMvwpfd9at2Qn2qlj4JsImewOqQjoK3A==
X-Received: by 2002:a5d:65c4:0:b0:22c:dbdd:7177 with SMTP id e4-20020a5d65c4000000b0022cdbdd7177mr11291303wrw.470.1664803803837;
        Mon, 03 Oct 2022 06:30:03 -0700 (PDT)
Received: from mai.. ([2a05:6e02:1041:c10:f3a:9f5e:1605:a75a])
        by smtp.gmail.com with ESMTPSA id m21-20020a05600c4f5500b003a5f54e3bbbsm18379931wmq.38.2022.10.03.06.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 06:30:03 -0700 (PDT)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     daniel.lezcano@linaro.org, rafael@kernel.org,
        m.szyprowski@samsung.com
Cc:     Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-pm@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
        linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C,
        S5P AND EXYNOS ARM ARCHITECTURES),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] thermal/drivers/exynos: Fix NULL pointer dereference when getting the critical temp
Date:   Mon,  3 Oct 2022 15:29:43 +0200
Message-Id: <20221003132943.1383065-1-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <4e4d873b-4a40-334a-34e7-defb0fcc4e6b@samsung.com>
References: <4e4d873b-4a40-334a-34e7-defb0fcc4e6b@samsung.com>
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

The driver is assuming the get_critical temperature exists as it is
inherited by the thermal of ops. But this one has been removed in
favor of the generic one.

Use the generic thermal_zone_get_crit_temp() function instead

Fixes: 13bea86623b ("thermal/of: Remove of_thermal_get_crit_temp(")
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/thermal/samsung/exynos_tmu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 5a1ffe2f3134..37465af59262 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -264,9 +264,8 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
 	unsigned int status;
 	int ret = 0, temp;
 
-	if (data->soc != SOC_ARCH_EXYNOS5433) /* FIXME */
-		ret = tzd->ops->get_crit_temp(tzd, &temp);
-	if (ret) {
+	ret = thermal_zone_get_crit_temp(tzd, &temp);
+	if (ret && data->soc != SOC_ARCH_EXYNOS5433) { /* FIXME */
 		dev_err(&pdev->dev,
 			"No CRITICAL trip point defined in device tree!\n");
 		goto out;
-- 
2.34.1

