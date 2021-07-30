Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E76033DBB12
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 30 Jul 2021 16:49:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239352AbhG3Otd (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 30 Jul 2021 10:49:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239340AbhG3Otc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 30 Jul 2021 10:49:32 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B961C0613C1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Jul 2021 07:49:27 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id d6so5910046edt.7
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Jul 2021 07:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VTDgPgWodE/cSRF6bHIc6D1D5Dn1jvPwRYXuY/lAMLo=;
        b=TkueiDTdOMqYTmTxIiWclFQDmAoJQIi9pKg/pDn4T1rA2VjfILkGJNRgYCunu870MP
         qypWhzFqenbxNDZV4QPpZvTBiL0T6ZzwAkBRHMaovinMWM8mTUwcZ1jc6pskjFipGKIM
         IXhUOo6SBJYFp2Yht0rWwR6rKjHOixSLarchv5uf56EVbCILFXRb+G0Y547em6aa4I8/
         BqZr3+joyNVs85IjpkswpDcIjciP+mlO9g6EoGxO1/d3NIEJTlZbuskA5bb08gAkGtd4
         2oFBaMMAzmc1lYRJdhu9xkPqeQH6gQLUdBaAq+YpDbbvFgnFduiJnZeySi1IBccyGB81
         Sgjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VTDgPgWodE/cSRF6bHIc6D1D5Dn1jvPwRYXuY/lAMLo=;
        b=OjM0a/RvTUfVSmkIrJk5GDZeDW09VjYOjbf74/CMbjhZFtNxWzJW4RlUgWQ26Cxmlu
         5EmV3LLSAZxBk32MlmnQdY4DSWDkpC+UXUqpasPra2na8Js2QI9s7A4HKLQPe2oLJE8G
         s7bUGjEBeDuy4Hy1Fb+Owbh7dy8yyDkYpUgNkp6YNtDuC7qfdy/w9aMQi5XvEYaH2/oe
         Q/XhWqxN/UYPKMNpr8HfcegTAIEoXdUwywyuxOkXXzyd4T/Gh5TEhl/8QLxsfT3kBeje
         Mw1s7iD0u5Tr1zAlNHt1rhCD5sMkvw/bq5Io3K0tXw8ZwOMvWsKggwokvmsZZ9ap/sPj
         x13A==
X-Gm-Message-State: AOAM533pCovxoGeGR1AbcLbGhs00W0LU8kcMr0Bj8pUfMi3qx0HVQ2Fa
        t/hLMpRYvodLz8nhXcNHrZCqIA==
X-Google-Smtp-Source: ABdhPJwQ3Vu/iMAI2TwOY1RDcotd+8kXvX1qj2ZROjO1I6ex2OtKHUvLBmtYk8c0mf//n0KTncs5Fw==
X-Received: by 2002:a05:6402:31ba:: with SMTP id dj26mr3436625edb.252.1627656565567;
        Fri, 30 Jul 2021 07:49:25 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id o17sm629581ejb.84.2021.07.30.07.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 07:49:25 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
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
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: [PATCH 01/12] pinctrl: samsung: Fix pinctrl bank pin count
Date:   Fri, 30 Jul 2021 17:49:11 +0300
Message-Id: <20210730144922.29111-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210730144922.29111-1-semen.protsenko@linaro.org>
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Jaehyoung Choi <jkkkkk.choi@samsung.com>

Commit 1abd18d1a51a ("pinctrl: samsung: Register pinctrl before GPIO")
changes the order of GPIO and pinctrl registration: now pinctrl is
registered before GPIO. That means gpio_chip->ngpio is not set when
samsung_pinctrl_register() called, and one cannot rely on that value
anymore. Use `pin_bank->nr_pins' instead of `pin_bank->gpio_chip.ngpio'
to fix mentioned inconsistency.

Fixes: 1abd18d1a51a ("pinctrl: samsung: Register pinctrl before GPIO")
Signed-off-by: Jaehyoung Choi <jkkkkk.choi@samsung.com>
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/pinctrl/samsung/pinctrl-samsung.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 376876bd6605..2975b4369f32 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -918,7 +918,7 @@ static int samsung_pinctrl_register(struct platform_device *pdev,
 		pin_bank->grange.pin_base = drvdata->pin_base
 						+ pin_bank->pin_base;
 		pin_bank->grange.base = pin_bank->grange.pin_base;
-		pin_bank->grange.npins = pin_bank->gpio_chip.ngpio;
+		pin_bank->grange.npins = pin_bank->nr_pins;
 		pin_bank->grange.gc = &pin_bank->gpio_chip;
 		pinctrl_add_gpio_range(drvdata->pctl_dev, &pin_bank->grange);
 	}
-- 
2.30.2

