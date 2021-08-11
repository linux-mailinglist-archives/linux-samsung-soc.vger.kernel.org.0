Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2AE43E8FBF
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 11 Aug 2021 13:49:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237438AbhHKLtI (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 11 Aug 2021 07:49:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237493AbhHKLtD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 11 Aug 2021 07:49:03 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FE03C061386
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Aug 2021 04:48:38 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id t1so3282527edd.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Aug 2021 04:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HPjQiKeY/Pm3cwK5bLlcgaOU8O6PA1oY+1ashl1tZII=;
        b=IBsFx07oFf+vCulkJ+TaU4TZ8+TJY7oRmjHzjramGo3IIB07cb0AjF6zdiGjwHYAW1
         Tqpupcr9JZsUIoJFv1IAonhPLja4SYBbpCNk3GPYB/qAtLnsD0IiIE6ENOhM2pqkGIaI
         DlOftRgyt6Bms1W57ULog+ewElYtugxn1FuQZRM33zfR4PP0cjXG1gn/cJpD6Sa2FwZc
         irT8vkNxP1o74fHgkJXCSPt8ggwKVdCqyPX+/i+Ezu0Tdba8YHfaDLvUnZzFWtmzCevp
         SS4oLTSxNCSMx15LdVhMiCi6HdkCWUNefTItnCF1Y8977X4crqedED2lFf/7d3JVpwmu
         8Kgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HPjQiKeY/Pm3cwK5bLlcgaOU8O6PA1oY+1ashl1tZII=;
        b=WnLcEWG+TTu3yySva4zg32BJffCVvcfgFkrNA430MMvS/3/o5oOns41r3Nq8eT1mXc
         lpw9NU78VS5GZdGnQyJAAWuxOxlP5I3BKmg6H4+oOQzqHRERdfB5Igq6lbP8tR8tW28a
         DmNWb0cd8OwRh3wGEBT7z7tDWkaK7Weqj3hjeSFgTEP3DZHN1ZyPIOzvd7QgiFz2EZI9
         5Ncn0RIq2/baOQX6Z08j8f5RVMpcF7ZJxIMMI+nhv2p5M9UhSNEegLTQehwwftZsClmu
         ZjWybS8hwtuJDIQGGG8P9Xke7JGMPpO4jxGSPvLQ5UrR0xCP9qSzK8s8fLRCFF59lD5g
         Hw9g==
X-Gm-Message-State: AOAM531UO7lhOO+oAMN1JYaxG+refrd94uSJYrtK0ttIIEZ9dBc5w2MX
        nZZoR0yY6r8WDMI2JjAo9jcNkg==
X-Google-Smtp-Source: ABdhPJwwQlTLXrsIYXHANtNL1PihNzfAw6ogeS76lZDqO+9edFnOzfqvWzpuGkVw7nv8oKZ34mb/SA==
X-Received: by 2002:a50:ed05:: with SMTP id j5mr11111037eds.256.1628682516768;
        Wed, 11 Aug 2021 04:48:36 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id lw15sm8073337ejb.50.2021.08.11.04.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 04:48:36 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org
Subject: [PATCH v3 5/7] tty: serial: samsung: Fix driver data macros style
Date:   Wed, 11 Aug 2021 14:48:25 +0300
Message-Id: <20210811114827.27322-6-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210811114827.27322-1-semen.protsenko@linaro.org>
References: <20210811114827.27322-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Make checkpatch happy by fixing this error:

    ERROR: Macros with complex values should be enclosed in parentheses

Although this change is made to keep macros consistent with consequent
patches (adding driver data for new SoC), it's intentionally added as a
separate patch to ease possible porting efforts in future.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v3:
  - None

Changes in v2:
  - Added Reviewed-by tag by Krzysztof Kozlowski

 drivers/tty/serial/samsung_tty.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index b8034c1168e0..130bdc978e93 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -2816,8 +2816,8 @@ static struct s3c24xx_serial_drv_data exynos5433_serial_drv_data = {
 #define EXYNOS4210_SERIAL_DRV_DATA ((kernel_ulong_t)&exynos4210_serial_drv_data)
 #define EXYNOS5433_SERIAL_DRV_DATA ((kernel_ulong_t)&exynos5433_serial_drv_data)
 #else
-#define EXYNOS4210_SERIAL_DRV_DATA (kernel_ulong_t)NULL
-#define EXYNOS5433_SERIAL_DRV_DATA (kernel_ulong_t)NULL
+#define EXYNOS4210_SERIAL_DRV_DATA ((kernel_ulong_t)NULL)
+#define EXYNOS5433_SERIAL_DRV_DATA ((kernel_ulong_t)NULL)
 #endif
 
 #ifdef CONFIG_ARCH_APPLE
-- 
2.30.2

