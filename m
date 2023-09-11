Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C3BE79AE31
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 12 Sep 2023 01:42:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348979AbjIKVcC (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 11 Sep 2023 17:32:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236915AbjIKLjk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 11 Sep 2023 07:39:40 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38E8112E
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Sep 2023 04:39:36 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5230a22cfd1so5548958a12.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Sep 2023 04:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694432374; x=1695037174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NH52jm7IMEAL8WOz6GO3ZaoQovB8Mynr78vb+JMDDFY=;
        b=dlsaDdLmTnO+W0e37aC6HgwwgZarPRRgTspzC1fN4w5DgQ+0cFNdeMzDxbS72s0Huk
         3JZEVJwZqj4hcWLx6lHYojIuAXmSWTZNHoUAQEXIi1Vb8Bektaz2aZy/28ikywNUTBvP
         JHblECpaQ6B+l6Yw53krsMwk52pHAhoxXCPfgaEsqxVNOcNAPbP0dF96FQXxG8kI/c+D
         M9lg1uVpqUpEfm6afMhjQHOCX8QkzBBKSLYDMOu+B+vwv1ps9EP/Cj942BpuS+Lei3nG
         MXdQX8FtVPt0WSrkvs2pr5AKU40908hFHgAY3lObRCsATw5MOjLdz/3BmQSaTY21uGN5
         DK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694432374; x=1695037174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NH52jm7IMEAL8WOz6GO3ZaoQovB8Mynr78vb+JMDDFY=;
        b=NYdSEBqqp7inbK/v/sv+gP2cUppT6yV4oFPIPEo/BXmsAXpamQJ8mm4ZNly8YEdc5q
         rYyWVm+bQhr032D1slwODfxXyvdd446GJK2xlp1ByGhV9eny25M4brs0xApVjZwvbx8l
         q4iTvll7OtuIosrXfq5AsHwq4+rizczwnFeRFDzypdPsC2oQlAJcK6C9uFqC0ETyaL5M
         A/Ii+7vlqPfw1JzazNmJzYtvgPUr9jEgPTgztHwT6PZM0MHQT4TnObQH2+l3gzEo8bo7
         2VH3ASAtHZ3AP/Js/Rgmq892IE377nNzQqNe+/60eiAvlet8QzO8+TtDF4+sIXkmrYDm
         zgJw==
X-Gm-Message-State: AOJu0YyqE+U0ieFhfXYV8QuxxxerWXR+CzMWd0jKGmJapiDCNGv4AV0Y
        6ka+Cv/qhMtJ+lSUh3NW3n2CpA==
X-Google-Smtp-Source: AGHT+IHQzJx0OOWqneHLnfwmUEWkbPQlTh6C51/9DolgrjBu0no1cVmvFHk2fPX1jxefFnGnxXt14A==
X-Received: by 2002:aa7:d054:0:b0:522:b112:6254 with SMTP id n20-20020aa7d054000000b00522b1126254mr7592357edo.4.1694432374700;
        Mon, 11 Sep 2023 04:39:34 -0700 (PDT)
Received: from krzk-bin.. ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id g15-20020a056402180f00b00523b1335618sm4431003edy.97.2023.09.11.04.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 04:39:34 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        JaeHun Jung <jh0801.jung@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm64: dts: exynos: Enable USB for E850-96 board
Date:   Mon, 11 Sep 2023 13:39:25 +0200
Message-Id: <169443234709.34398.2292674968084168960.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230825215445.28309-1-semen.protsenko@linaro.org>
References: <20230825215445.28309-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Fri, 25 Aug 2023 16:54:43 -0500, Sam Protsenko wrote:
> This patch series enables USB gadget, USB host and Ethernet support for
> E850-96 board. The most major change was done in USB PHY driver, as the
> register layout of PHY block in Exynos850 is very different from
> Exynos5 one.
> 
> Changes in v2:
>   - Removed already applied patches from the patch series
>   - Rebased on top of latest linux-next
>   - Put ranges after compatible in usbdrd node (patch #1)
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: exynos: Enable USB in Exynos850
      https://git.kernel.org/krzk/linux/c/2f911ca41e519dc5986f9483d3e15df4802b64f5
[2/2] arm64: dts: exynos: Enable USB support on E850-96 board
      https://git.kernel.org/krzk/linux/c/f2951ee8f7bcdb3844ffe6e54b0601ad8fa58640

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
