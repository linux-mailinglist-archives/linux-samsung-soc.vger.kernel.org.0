Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39A31469189
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  6 Dec 2021 09:30:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239411AbhLFIeU (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 6 Dec 2021 03:34:20 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:37970
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239398AbhLFIeT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 6 Dec 2021 03:34:19 -0500
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 418AA40013
        for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Dec 2021 08:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1638779450;
        bh=TMqqkvVoAtVu1BbDjYoZK1xIEx095VfIUwglYUMppCE=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=e0VUXbkm/qVHPME3B4wMjnhdYMP3GoYoNH4rv7cBWt4iBpORrpim6c1/OOquZFaL+
         C2bJrLD5+xZZ/MGJlb8RICHnlvmqppak6YiS3WYtBEny69jPRbNC+YowIpzT55NtOn
         Y2TZXEjEj6Y/gViUFb5+kCgpdrrgou8ay6ZJtv8q8ZqlzDRLjjAV3pPNSV6AYPJL2x
         Vh3NHIlUCt3OyHrBq7PCKIYu9vc8yHoI76Pd7PHaYpZAtKDLNAvYmWPAlxB3ZYDvI/
         nWxQoFM2dCu1g3Fd1Lfh8/sl00AuHF87Cy+XuT9GFDNEM9xI/Cb2dtC5g1RPXUD0XB
         xzZoAyLIMtolQ==
Received: by mail-lf1-f72.google.com with SMTP id t9-20020a056512068900b00417ba105469so3552804lfe.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Dec 2021 00:30:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TMqqkvVoAtVu1BbDjYoZK1xIEx095VfIUwglYUMppCE=;
        b=qoSj/3jQkVh27asIk0RIeM4siCm9k9KPrMvwDjGo+/wSU3avcif2fo7h3lwmMjXrI2
         vDWLln52qqkQ1NxRdOBLqg4gE6rIUEBCIbP9caJ+qmObB5xxd6NvqtottdVlwkGcDuO6
         vIR0DNvXIkAdzvV2D69OJDnFd1pGG5wXkzuNVk/JQu9LuYkGS7eUqX/9BROq3FdNYhpI
         x6thKoMeqxOQErPWtz5M4nh7DJn4P/tUu0FJzD/AP03GLLHy6NcBpyWP8q7jV/nf489i
         dZKTZMvHfNTcPiWyRhItljKIveccc8hsEBjMObqgWFqPGxbcCk0M7gv7vA5xTA6BIgkL
         RQ/A==
X-Gm-Message-State: AOAM531IT8Ui8frQ2c3vQXp8ogfDUcFwEpK8vCNQw065SXqgypK2I00k
        nsAT2mKnjmwzd53b7SsBj3SxU7u1fn9NVavBVjcKlEzJ+4ttHYVhr+HMIPGfZ3XS6/diyEspbkI
        WbsT73WM32+6HKys8WIo3Qm/QdnOlfqqjKhrCZYxJHXuvqnRs
X-Received: by 2002:a2e:a548:: with SMTP id e8mr33498334ljn.24.1638779449633;
        Mon, 06 Dec 2021 00:30:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxe/goV4O1M8RkFPwEf7OqKkR6GayhXGhlDwSUUTNuoMNkI5f5ksqkuRJRbhwol22uan2oxnw==
X-Received: by 2002:a2e:a548:: with SMTP id e8mr33498316ljn.24.1638779449485;
        Mon, 06 Dec 2021 00:30:49 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id m15sm1296249lfp.9.2021.12.06.00.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 00:30:48 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org,
        Youngmin Nam <youngmin.nam@samsung.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        David Virag <virag.david003@gmail.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>
Subject: Re: (subset) [PATCH v2 RESEND 8/8] arm64: dts: exynos: Rename hsi2c nodes to i2c for Exynos5433 and Exynos7
Date:   Mon,  6 Dec 2021 09:30:45 +0100
Message-Id: <163877944232.78791.17872835189239220303.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211204215820.17378-9-semen.protsenko@linaro.org>
References: <20211204215820.17378-1-semen.protsenko@linaro.org> <20211204215820.17378-9-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, 4 Dec 2021 23:58:20 +0200, Sam Protsenko wrote:
> In Device Tree specification it's recommended to use "i2c" name for I2C
> nodes. Now that i2c-exynos5 dt-schema binding was added, it shows some
> warnings like this when validating HS-I2C nodes:
> 
>     hsi2c@xxxxxxxxx: $nodename:0: 'hsi2c@xxxxxxxx' does not match
>                                   '^i2c(@.*)?'
>     From schema: Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
> 
> [...]

Applied, thanks!

[8/8] arm64: dts: exynos: Rename hsi2c nodes to i2c for Exynos5433 and Exynos7
      commit: 8858f8622e82170ec184971b66c7a455816190f8

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
