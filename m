Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84A22766771
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 28 Jul 2023 10:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233681AbjG1InT (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 28 Jul 2023 04:43:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235006AbjG1InI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 28 Jul 2023 04:43:08 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D297211C
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Jul 2023 01:43:07 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-313e742a787so1248045f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Jul 2023 01:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690533785; x=1691138585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XefDwdmJhmIgEl/194PiKJwS8r6L9nv+FRGjWnfya3Y=;
        b=vFykQt4F4DBoPtCwar7sh+TG8+xkGD/5SYh6TFyAamxQKaRxIg97BpncyOQkJhH7Ay
         MLMsbMqDPNn6rixw/ak10xnhiUINbviBE3cXVWpFPowjc0e8TOn9vPuHgNMVDlTkFODZ
         gUi7j9xsfNhItlpUalecUasUR+uitk5UfEZOQBhxGSe74ZRCUBRJMkG1MrpYptocdYnT
         STHUmm916Uj75NysvtvyC3kI+4Q3qhVQ3bwwdOhmGrGwDwQzSpYgyX1dXSrrUO7YpCEq
         dTyqFRHLi8n8VlnOzzI9Iod8lISHUoYuFC+Rx5vboYbbLD9Wy1MURU4XtMVBnhRniDsG
         NIXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690533785; x=1691138585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XefDwdmJhmIgEl/194PiKJwS8r6L9nv+FRGjWnfya3Y=;
        b=UFNxW/r4wxjQOSxeWlgP8d46milCxDBm99RoK3zMXZ9jyKHumpGzmcEmHwrGBIWBMw
         i79goPn7yOK66ak+IY9lj/jrzKjsaYo7xVBuL0CdGlQQ6dJcn0I2avypjSmgf8+E0h+f
         dohWmGTfZeUBVM3XNBVQghvyykMPvQ05WW4l9TEa/JBlSYpmKYJ963ws6OXw2Fvvq7cp
         Vd32I2MBRW1UpAiNVkgd6vpeS/E1E19/sKRCbS10cbbCpwIHH+PIHXlJS0CtVhPH4xEK
         Rn5u2mt5VVcsUcnUxvTpNrYR4ulKEWPlVzkUKrTW5kDYu6Zt+3iQ9n+uerrLf0hW/R0P
         3NWw==
X-Gm-Message-State: ABy/qLYpKZzvesxn/6IPCiyiqNGCGeLTVUVI15ar4vxrKcQCSXku1nZ3
        jPcDlGNJPpxGsZGLl39oIwWTQQ==
X-Google-Smtp-Source: APBJJlGU2TyMSosKi4c1lWqcsdN/7KrKPB/3haS5mBuYm6KPItpsqP0bVmnyXY6u+6XJjGMUv+FJbw==
X-Received: by 2002:a05:6000:114b:b0:313:f38d:555f with SMTP id d11-20020a056000114b00b00313f38d555fmr1249530wrx.24.1690533785567;
        Fri, 28 Jul 2023 01:43:05 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id g18-20020a5d6992000000b0031134bcdacdsm4183461wru.42.2023.07.28.01.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 01:43:05 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: mfd: Un-support Maxim and Samsung PMIC drivers
Date:   Fri, 28 Jul 2023 10:43:01 +0200
Message-Id: <169053368548.11881.1252357994598966736.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230714050313.8424-1-krzysztof.kozlowski@linaro.org>
References: <20230714050313.8424-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Fri, 14 Jul 2023 07:03:13 +0200, Krzysztof Kozlowski wrote:
> Since few years no one is really paid to support drivers for: Maxim
> MUICs/PMICs for Exynos based boards and Samsung PMICs.  Correct the
> status to keep them as maintained.
> 
> 

Hi Lee,

I sent it around two weeks ago. It wasn't picked up, so maybe everyone expects
me to take it via Samsung SoC... so I took it.

I hope it is okay, if not, let me know and I will drop it.

Applied, thanks!

[1/1] MAINTAINERS: mfd: Un-support Maxim and Samsung PMIC drivers
      https://git.kernel.org/krzk/linux/c/eecff3319287179032600eeec5fa357a53ae0fe1

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
