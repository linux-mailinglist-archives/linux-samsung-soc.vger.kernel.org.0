Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A926078FCBA
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  1 Sep 2023 13:57:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349283AbjIAL5n (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 1 Sep 2023 07:57:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236908AbjIAL5m (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 1 Sep 2023 07:57:42 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F26EAE7F
        for <linux-samsung-soc@vger.kernel.org>; Fri,  1 Sep 2023 04:57:36 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-99df431d4bfso227863866b.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Sep 2023 04:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693569455; x=1694174255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6aAmuXWpK9R9ONwjhEFCz2euSxwTZnw/oAWjomMKyvU=;
        b=f2vYIcBcqckOcsV+2zw3wA8uXHPCPNHunWh+cwQ7ED+0AivYoIPgf+WLiUMkMBqWZo
         aKwXSqfoA43WvdiB8pumWD4C864g6w+wa5kMctVdz/TzgGMg0O10TnMyWnmWtnVpYMUI
         AWVes0bOS9RNKXiCEjeiXc6vwcL9caNJtw2vguW1Mbb4APJsXn12M24thHJhQuzO3LXV
         tgyirFtMLJGNPTt71l75d0BFHI5wtt7XHhoN1TVedwLiAwvLyVW8QCLrm0n6uRwDTRMJ
         2w2BDc6FZpEx956nkE3CcdBcOB51KbQFAf3bCrhKL7jCVsAjxjkkOkb4Nh4P/yxg3+j2
         DCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693569455; x=1694174255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6aAmuXWpK9R9ONwjhEFCz2euSxwTZnw/oAWjomMKyvU=;
        b=IH0y8NgjFDfOQ5/1HiDS57JIYyU047n3DBf4qz6Jvebp3e3pO5aNnl8R1107f8K6yH
         xYFFsGetVj3rBC0F8kEZK27JCfV27oH+i3LrL2ZO8ufnWCX9KyTuh6LXkRFNFrPqhNQW
         l/tU450Fsg4c6a1zrH72ddpoQL5KcXXm23DVRch1lRVzvhqUc0EmnewQRN4vxTA3fDYL
         LsXCKOTTvVlJq5Tm1r61VyIu0Qn4JnQVQ7G0/N9yL6NaSSVhQCLu8Z30cuv1bjhZq5nq
         UTkqQqfeIzgxwrrV740TRseoBu1RAhb4189vFu/LVs0sDQhW4EnbCJpBpzXuuGqV7SKh
         GKqw==
X-Gm-Message-State: AOJu0YyDEZsZwNKYqLwCm1i9W6+5Nqz/pGVNvz+M9ijsTyTHRUOJEb5i
        Qs06ZbJVdn/I/NEE5bp9svOGBQ==
X-Google-Smtp-Source: AGHT+IE53YnDzQDCbFDcC3Zu5aY62S51MDsbpqPyeKqbHf/Q/JagOF915pEdB+ulrN7nuS6tYG750g==
X-Received: by 2002:a17:907:a068:b0:9a1:cbe5:758c with SMTP id ia8-20020a170907a06800b009a1cbe5758cmr1591640ejc.7.1693569455460;
        Fri, 01 Sep 2023 04:57:35 -0700 (PDT)
Received: from krzk-bin.. (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id h23-20020a1709063c1700b0099d45ed589csm1881248ejg.125.2023.09.01.04.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 04:57:34 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: defconfig: enable syscon-poweroff driver
Date:   Fri,  1 Sep 2023 13:57:32 +0200
Message-Id: <20230901115732.45854-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Enable the generic syscon-poweroff driver used on all Exynos ARM64 SoCs
(e.g. Exynos5433) and few APM SoCs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5315789f4868..ec59174b14db 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -636,6 +636,7 @@ CONFIG_POWER_RESET_MSM=y
 CONFIG_POWER_RESET_QCOM_PON=m
 CONFIG_POWER_RESET_XGENE=y
 CONFIG_POWER_RESET_SYSCON=y
+CONFIG_POWER_RESET_SYSCON_POWEROFF=y
 CONFIG_SYSCON_REBOOT_MODE=y
 CONFIG_NVMEM_REBOOT_MODE=m
 CONFIG_BATTERY_SBS=m
-- 
2.34.1

