Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A66A1833B6
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  6 Aug 2019 16:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732897AbfHFOPx (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 6 Aug 2019 10:15:53 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34727 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732895AbfHFOPx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 6 Aug 2019 10:15:53 -0400
Received: by mail-lf1-f66.google.com with SMTP id b29so54037857lfq.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Aug 2019 07:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sAIRh0zHCkxzUmxSyq4qdiGiTcGIDNFzc3TNynpsgqk=;
        b=E2Wc85sLfivMU4AaCneNl6LCApr1GrJtCEc8ojybQ7Z4JKOMkTX06Un7zgIDoQQb6+
         6vGIgLwWWDOA62UzA4bpo0CrCe7PnH02iRtfPaN7kS1BhzYyDFD4Lc/w6uBmKmyepx3t
         hwdxXtIIH1ol5XXIUCjaCG9CtUKpjyQR+XqGrbI0yYK1whN/UZT7myGqfhLOzI2V7+DV
         7LggCCWyMn9I8J1CCfg7ozwxE30C//brOpGIMtNuUaUYM3jzowZpPqd9SBI+6PpNABrF
         EZay1BlpSDwastDS1SVWap2cMmM2NjJzWQ369b7XgPCsh+xSWfkg2CaG+BvdyWXr4hY4
         UWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sAIRh0zHCkxzUmxSyq4qdiGiTcGIDNFzc3TNynpsgqk=;
        b=iUr1wqgQqwScx24jihH+zdXXzGffKcUsbmoGcMhymroB8SzYfLl/Q8iuR3TQZqJrSy
         IHLvxN9LZphGIP6R6XqA1PJIxpiAgJjGzN4MC+SHxLWcQ8ePbk7kkrbGb4r0D9LJTN6J
         kC6YWtcd4tDcfdSbqL2zqFFQBTvagso5Zls0j0Lm/RjcbDeBltlPUK24HjGKBUPRM4Y2
         2DJLOq2XISeTA04DiGWT4AJGAmaITqLAk7J8Rrh9Gx1Jg3MdmKoVbq3z0JFKFvXAR+gw
         0soik8sQNzoKzhNvvrt5PodRkDfPOhYja+QeEiYGzCkNyqovSJIijEV/Ak2fG6PwakPq
         9UCg==
X-Gm-Message-State: APjAAAWr5V6cgGTt3gb1H82bv2zboBheB7GGH8tlU03r4JqpTDq0q7gK
        KXAU8ycMkKtbKIl78ROTPfxAwDcK8L/+jP0bEYyVTg==
X-Google-Smtp-Source: APXvYqwa7eUgjmF+/YyxXU15VYYv+720bBdbuzkjozsLAQLMlpvCf9Pylm6GgktGjdxlqgSSV2RTz8KoVio2DmPxnIo=
X-Received: by 2002:ac2:4c07:: with SMTP id t7mr2453376lfq.152.1565100951048;
 Tue, 06 Aug 2019 07:15:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190805162710.7789-1-krzk@kernel.org>
In-Reply-To: <20190805162710.7789-1-krzk@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 6 Aug 2019 16:15:38 +0200
Message-ID: <CACRpkda8P522pkxctZbf2Ut13V6Rzx=mSYsRuHv0BvPyF6q1gA@mail.gmail.com>
Subject: Re: [PATCH 1/4] pinctrl: samsung: Fix device node refcount leaks in
 Exynos wakeup controller init
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>, notify@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Aug 5, 2019 at 6:27 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> In exynos_eint_wkup_init() the for_each_child_of_node() loop is used
> with a break to find a matching child node.  Although each iteration of
> for_each_child_of_node puts the previous node, but early exit from loop
> misses it.  This leads to leak of device node.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

I assume you're collecting these for a pull request to me
at some later point, all look good to me.

Yours,
Linus Walleij
