Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6656368E12E
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  7 Feb 2023 20:29:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbjBGT3q (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 7 Feb 2023 14:29:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230374AbjBGT3i (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Feb 2023 14:29:38 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7265D3EC6C
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Feb 2023 11:29:19 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id g6so6655549wrv.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Feb 2023 11:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hO5H0Nap/rA7n7JTyZf5zLflpWg3VbovGW4CVXHbCK4=;
        b=pi4BF1tbHVMh6DjSFOMxLSqBN7I485NtNf0wtShJCIWnuaPJ1f+bgaEDoNbCtkr81P
         f398/d5NXSkauPmUCVmc+LrJEKlAtIQaqZ1NlWqxiFzloxtTDDy+JvF23rABn9SPckmX
         xdnzhKBvnzygCFIbPXg+gaaVni3QrF1kpeRhNvaHHYaXv5i+CHjin9TSk5kWBDmjjx1M
         rLYmEM5m6Ypk46Mpx/si2EX6QHrzjaYIPSVzwBQIyrD3mgKANQx6RgAmpTBy0y6d7W7m
         hWFRLQgH4iFYKmxYtYEnxBgzEkbSMB5SlQ3IEkb6BVzdp3ZCEuF29ttomF4LHFyP4kRu
         DWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hO5H0Nap/rA7n7JTyZf5zLflpWg3VbovGW4CVXHbCK4=;
        b=XVyIZVLV2dE2NYnHK2YvKlpl441JZRPOL4Nso8vvVrn/0b59rYYqi3miuIaO/ebQH4
         NaiQXi7uuECiWHpXqQ5FtlV+KTPVOgkYr19p3Oious5V1nmJ4iZEWU+3I3ZdaiXH9+iH
         OHsA8hh7sdKone/AAeLAEFExGh1frDpUmLqTVHUH+ozPKBD7u0rpYEzDCf0wOMk8VRl6
         v8dNQDWrULtvei3pI2qa2m47nBOzHWjWSX7axoKPa8F0J2MJJokPMs1Ij1Ia+AVt5VtA
         NXpNPrleUkBWoPpP18080E5IqPMWit41FePEZ3Pmv+2zgi45E22OzV3REWHfHGu3lCjc
         iMiA==
X-Gm-Message-State: AO0yUKXovbWb2VfZuYTrXnyBFaxyy1QuocGx42p86n/5JxF8aAKLaQ73
        MK3v6s4MGQFAJs2f6wLU30EqeA==
X-Google-Smtp-Source: AK7set/G1foflXy9cnv/SVtLj/1btjN14gR0xivM/JvDx2dXNtmiHGcQQSiLDGKmOFsiTQVsmg1BoA==
X-Received: by 2002:a5d:6941:0:b0:2bf:cfbd:44be with SMTP id r1-20020a5d6941000000b002bfcfbd44bemr3491040wrw.69.1675798157787;
        Tue, 07 Feb 2023 11:29:17 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id bd16-20020a05600c1f1000b003db0ee277b2sm19858623wmb.5.2023.02.07.11.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 11:29:17 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] media: samsung: exynos4-is: drop simple-bus from compatibles
Date:   Tue,  7 Feb 2023 20:29:13 +0100
Message-Id: <20230207192914.549309-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

The FIMC camera node wrapper is not a bus, so using simple-bus fallback
compatible just to instantiate its children nodes was never correct.
Driver should explicitly populate all its children devices.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/samsung/exynos4-is/media-dev.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/samsung/exynos4-is/media-dev.c b/drivers/media/platform/samsung/exynos4-is/media-dev.c
index 98a60f01129d..70c4ca7844d3 100644
--- a/drivers/media/platform/samsung/exynos4-is/media-dev.c
+++ b/drivers/media/platform/samsung/exynos4-is/media-dev.c
@@ -1440,6 +1440,10 @@ static int fimc_md_probe(struct platform_device *pdev)
 	if (!fmd)
 		return -ENOMEM;
 
+	ret = devm_of_platform_populate(dev);
+	if (ret < 0)
+		return -ENOMEM;
+
 	spin_lock_init(&fmd->slock);
 	INIT_LIST_HEAD(&fmd->pipelines);
 	fmd->pdev = pdev;
-- 
2.34.1

