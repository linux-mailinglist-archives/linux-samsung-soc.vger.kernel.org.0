Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9643690622
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  9 Feb 2023 12:10:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbjBILKt (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 9 Feb 2023 06:10:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbjBILKs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Feb 2023 06:10:48 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D2EE12F32
        for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Feb 2023 03:10:47 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id d14so1363986wrr.9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Feb 2023 03:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wAHgUFFB8B91xSxCVq9O+/tpcsV4Moe9Qo0Y3nmJ+sY=;
        b=klB0nkBqN03kCUxivHzjIIPKYz3tiTdD1IGyymPdM7uLF19Of6GMX4e0XD6gYLv8ko
         vKs7U0CqFUPQTQYf0ZZg2rsr9FVygckISOHJ8pMLQ7McVJvzY9GUf21k+GnV39MJiPvb
         4qSfbRyd8uWKzz2W/mtxf3tUBE1sorFXeJijcENVzb09IWo+6MQ1UAyRNymdiu/+vcAX
         asS4mATnWYFw4FX5epYC3+ZXCroYbE5s+O5j38kxcQ4VvIe02SVkh55x186chyXlR2x+
         csqNBF6PiyGV7GbHTK0rx7nF2XIE3J1VNCVztYlfFJvCOZ+4j9f19t3cFt7V6doYtz3H
         DSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wAHgUFFB8B91xSxCVq9O+/tpcsV4Moe9Qo0Y3nmJ+sY=;
        b=LknOoj2Kke85KvVD+qGDkp3UngXJIHD5PXVtfQPaR6zjWGs1Lp3VHAsPokS7EgGvXc
         GuA5MHx2xa7rwy/FLRyG6Hb3FGRSkdvb0ExjXcuaQOshxSCc2hKIZ+pH0gRoVybyTf3/
         e/g7C9M+93x/SW+F+2ki0tXGCIrEsdxdzUcq7jgBr0vvU6BzHe8VMgyArCYvfVbwZTZT
         yU5GZX87QLNFTPU9S+YB/H/NWNQzZjQx7etBal055nZcWUkZxjLNy9SIe9CXQuin2yhn
         ZgAsd9o5CmmRnDAnMVwD14+fm2zn7FvaPOkyOBQ1CAAvMojV/TXntEetLjeyxp+f+YX2
         HXew==
X-Gm-Message-State: AO0yUKVzkl2Q6FikwaXfyGmqZLb7H4GCpwlqhV7ZNfPuTBXe2RC6FVfG
        TYz9Z7FH1Lwo+SKPuYCrKIOvVA==
X-Google-Smtp-Source: AK7set/cAuKdrLZsyfQPNQ8/RUFqsxEyxq7hdoyt6Ega0UXCf/gkDIxPgyUWXUzROVcG3VsnXfbIYg==
X-Received: by 2002:adf:d0c7:0:b0:2c3:d9cf:f406 with SMTP id z7-20020adfd0c7000000b002c3d9cff406mr10269635wrh.13.1675941045569;
        Thu, 09 Feb 2023 03:10:45 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q13-20020adff94d000000b002be099f78c0sm963207wrr.69.2023.02.09.03.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 03:10:45 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: exynos: correct SPI nor compatible in SMDKv310
Date:   Thu,  9 Feb 2023 12:10:37 +0100
Message-Id: <167594102110.781687.10084161117064383763.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230208164942.387390-1-krzysztof.kozlowski@linaro.org>
References: <20230208164942.387390-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

On Wed, 8 Feb 2023 17:49:41 +0100, Krzysztof Kozlowski wrote:
> SPI NOR flash compatible should come with generic jedec,spi-nor fallback
> and proper vendor prefix:
> 
>   exynos4210-smdkv310.dtb: /soc/spi@13940000/flash@0: failed to match any schema with compatible: ['w25x80']
> 
> 

Applied, thanks!

[1/2] ARM: dts: exynos: correct SPI nor compatible in SMDKv310
      https://git.kernel.org/krzk/linux/c/44ffd27d83042e31c4dd85c148204b7610f0dc6c
[2/2] ARM: dts: exynos: correct SPI nor compatible in SMDK5250
      https://git.kernel.org/krzk/linux/c/428218307dd2ef175314f39f141beb93163ae1ca

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
