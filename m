Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED4A27C5C14
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 11 Oct 2023 20:50:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235255AbjJKSuZ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 11 Oct 2023 14:50:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233215AbjJKStp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 11 Oct 2023 14:49:45 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA105B6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Oct 2023 11:49:41 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-327be5fe4beso140470f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Oct 2023 11:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697050180; x=1697654980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPOqcX4Ej3m/0HUVtDwdhQHY2aoTOsl6XS4JtvFqWa4=;
        b=HCp+NejKIXCPnaGIrL0A98TSdqAPmxmjME+co5hUbjCFh/oE+kOquYpmwfxIVBS5SK
         gWP5pPdHXfiAr93jpqc/NnimXuGSHkpwZ2w0pYe2XzfBw2qmIaATgTLuBmfC5g+lTwSI
         gj9uAH+PAyIoU+aVTQuYULroDuiyXs/h6pkYEZNyDBz2uMTMz6Zzzt9om2/FaY4sC+4o
         hT/PYTvbNr/2tEZ3qfDEUkejBQIX7pkBYJQinPWokRELAoFviF1ByOEd8U8tCm4mNDRW
         1g6PI2ABJii8QRFdbRJkDucLpmofVWHsVDy5IMk7d+6AXUqyjp3Ba+LY2Im426DNayPh
         qo9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697050180; x=1697654980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RPOqcX4Ej3m/0HUVtDwdhQHY2aoTOsl6XS4JtvFqWa4=;
        b=DNygIUa8D9dMrextQJlQ/opV+8D5Dc+qpdfH4z0jDgoxOMOT4LEi2e4LhgrJU+vd9E
         2s+o6nicGWZQMA2iIELEo8QbQxa2ZL2nJJYcYi05WYz1w5zGdnylx7D64w8WLVewUhAS
         NDfH0uBBA2iUaC2Vq+GY2dAIpBeXh4Y62ZC06L0P26MzBEZJMvCdXj9/cJO5AnWEn2vx
         1qOmL/At9BomyZuuiLAyqAEPafEHKPtn6StybFn05ZWpGuHcGgE7JX7tvlrTpmdvjSyx
         Yx7Ur+KtF6+wsalPaX8QelT9aDbyRJ+kqbOcFM5o9K47T1t/PJFk1DVnxEhevV6gxD+o
         Ai3Q==
X-Gm-Message-State: AOJu0YwJZfuviLFB310E2o+oicZRLHxd33wUqZ4+y/bbmp/uvxfczE8D
        NDl1eV4r04Bo/nW14ROMlwyn8A==
X-Google-Smtp-Source: AGHT+IHMpRgHoDBgn+LyjOsF0XISdxPj15/7N1fcJz0HY1O6F/N9a70SS/9n712bMEfg3/3wUNNJCg==
X-Received: by 2002:adf:e189:0:b0:32d:87b6:14d2 with SMTP id az9-20020adfe189000000b0032d87b614d2mr2360731wrb.31.1697050180253;
        Wed, 11 Oct 2023 11:49:40 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id v6-20020adff686000000b0031980294e9fsm16003875wrp.116.2023.10.11.11.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 11:49:39 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: [PATCH v3 19/20] arm64: defconfig: Enable Google Tensor SoC
Date:   Wed, 11 Oct 2023 19:48:22 +0100
Message-ID: <20231011184823.443959-20-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
In-Reply-To: <20231011184823.443959-1-peter.griffin@linaro.org>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add the Google Tensor SoC to the arm64 defconfig

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5315789f4868..8a34603b1822 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -41,6 +41,7 @@ CONFIG_ARCH_BCMBCA=y
 CONFIG_ARCH_BRCMSTB=y
 CONFIG_ARCH_BERLIN=y
 CONFIG_ARCH_EXYNOS=y
+CONFIG_ARCH_GOOGLE_TENSOR=y
 CONFIG_ARCH_SPARX5=y
 CONFIG_ARCH_K3=y
 CONFIG_ARCH_LG1K=y
-- 
2.42.0.655.g421f12c284-goog

