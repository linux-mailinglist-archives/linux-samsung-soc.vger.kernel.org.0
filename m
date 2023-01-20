Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E148674DFC
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 20 Jan 2023 08:24:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230095AbjATHY1 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 20 Jan 2023 02:24:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230098AbjATHYX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Jan 2023 02:24:23 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DF5779EAD
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Jan 2023 23:24:15 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id q8so3274119wmo.5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Jan 2023 23:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GesNmtHa6aQtBhnAwvoqZM4E2zDjhjZA8qJvFc9rfSA=;
        b=xMiaRd4+8sUatrUSZz5VVPoHPnJiuUczfMH6Qqzw/uQ1SnkNcJEu0V3T802k+3msez
         kCJUo3BnEih/t1a+3LqeI+e/OKmTJ1Gt766lVYmi2cthJG89ByzugJvWZeOE3BhnXROL
         M5/78rsJB9Plu6+dK0q+Wl9gzWWErI50s2g6bgqkNmJaADc5eBLBERlyJQVQxvG6w7tx
         GqUBAj+PRZGeQieqpRH4EAAisgYSP3pmE4p6s5Ku0bRDKG4dmsE1ABYmp6yhd0PfCxLz
         hXzLZIdBpsoZZGE1SONhO5s2uLUSRohtGepG5pS2afGRxk+7cQq991stQ3IVoW6RzgKs
         hfWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GesNmtHa6aQtBhnAwvoqZM4E2zDjhjZA8qJvFc9rfSA=;
        b=uR60377KAsZ2hn9U13Xnmxh1JVuNXRAKlUWB6e1MsHxwPCt+9Dq8g1zVKHF275iYhh
         3bqD/FwpCQRrU/Kqevr87GtdDxeIpzcxvb+uK/dnvg9pYyKWK5/fQOoNyF/6mm3t4QXF
         oLBX4PEnfXUCmXexaJXz2Kywkbm/3fogBpprVGDw40E9iPUU+TtQEFq50jMHXbuhxVwQ
         7He1UbYqCkO7KKilATQDN/gVup7/rfOoy1WRyMd+Ymn9J18Kd/x6rhlzzjrT4HRaraub
         8EKIR5MzHH9Xu7rtD5n9JX0j/2QHK3U51wtNHOI9xBZt0xF+QD18yuh2WjEVqAIDUOis
         XOnA==
X-Gm-Message-State: AFqh2kqzh31kKgJUXdS1OVB0YdedpSu1oPclHSNzmUPEAgO/OB8eCuLe
        L4N4xoSnZA2rLejAc9T/Vf0GirCXrRuRtirt
X-Google-Smtp-Source: AMrXdXuOfe6NLgJMULnPHX37n5uuWPkt1bVE2lokMgpk5vYtjRxfphFFUK9VakAAaXk4tHspPRZGKA==
X-Received: by 2002:a05:600c:1d12:b0:3db:53f:baea with SMTP id l18-20020a05600c1d1200b003db053fbaeamr12781705wms.6.1674199453738;
        Thu, 19 Jan 2023 23:24:13 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q11-20020a05600000cb00b002be53aa2260sm1450559wrx.117.2023.01.19.23.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 23:24:13 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Tomasz Figa <tomasz.figa@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-samsung-soc@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH] ARM: s3c: fix s3c64xx_set_timer_source prototype
Date:   Fri, 20 Jan 2023 08:24:11 +0100
Message-Id: <167419944210.139121.12555885098749511339.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230118090224.2162863-1-arnd@kernel.org>
References: <20230118090224.2162863-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 18 Jan 2023 10:02:12 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The prototype does not match the definition, as gcc-13 points
> out:
> 
> arch/arm/mach-s3c/s3c64xx.c:169:13: error: conflicting types for 's3c64xx_set_timer_source' due to enum/integer mismatch; have 'void(unsigned int,  unsigned int)' [-Werror=enum-int-mismatch]
>   169 | void __init s3c64xx_set_timer_source(unsigned int event, unsigned int source)
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~
> In file included from arch/arm/mach-s3c/s3c64xx.c:50:
> arch/arm/mach-s3c/s3c64xx.h:62:20: note: previous declaration of 's3c64xx_set_timer_source' with type 'void(enum s3c64xx_timer_mode,  enum s3c64xx_timer_mode)'
>    62 | extern void __init s3c64xx_set_timer_source(enum s3c64xx_timer_mode event,
>       |                    ^~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Applied, thanks!

[1/1] ARM: s3c: fix s3c64xx_set_timer_source prototype
      https://git.kernel.org/krzk/linux/c/5bf52f5e4d12b8109f348cab60cb7d51092c4270

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
