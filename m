Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02D17255AC1
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 28 Aug 2020 15:04:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729172AbgH1NEQ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 28 Aug 2020 09:04:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726904AbgH1NEJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 28 Aug 2020 09:04:09 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA02BC061264
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Aug 2020 06:04:07 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id g6so1191919ljn.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Aug 2020 06:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kY6QohH0kHOg+QzN8imLnNqmKHUkcybm8RndPGRcKBY=;
        b=hEEhM6bXCEN77L0tGNTDS6zmOH04mOyuhnqNM5uPZYN0gYXTGXcdFAqeulpAUvxcWh
         DCCXZNQm2W0N8pG5Q4oIUMSHcG+kSdHUexRSjlZzGNpsRL+09rLkUl8e9Ty9YRfA8xg/
         zsviZhnOWi6K/8Se0ecZs49+o1JpUI0ouq1tOYIBK9lk72V2kJL3oTdKTp7G9JLHHmCA
         VJ/Py+m0DYy20mN5LcZ9yqol6X9R+XQ9ZjGCIZvBAxdw3UZj0mnfSalWOQd4EIPK36wE
         c7pd+QX7k2WKJoKBmSKL/j1M50mHmPityogf7HshbDgyYj4WAlQiauK+oot7jpk5Wut7
         R1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kY6QohH0kHOg+QzN8imLnNqmKHUkcybm8RndPGRcKBY=;
        b=d6vPOr4GkOY+iZ5BOlPxkNjA3CzTzPN0Kc4h3/Hzs2MgUYPwnQH1K8ogZJECJVrfOW
         RA6hvDDHO0QGWyO5MNSXbvw4DnHh2YZCCa+tSf5EGXPE3cx9fB3sapGJPK6lMCpAbQwG
         6eLIPXkafAdLTiXQgz5KJtMkl+oqddKviAGhBKHV7zc18w5QIL2PaPrHKrQwDRyjSt6i
         HIrA+QM3Z6HcqK1C7fAq4G3Ygwn0ZpVG/4MgoNKRzWO/W0hQm/jBNtKf0xss7voM3f6a
         XV529yVMOPi4NbLv71rn6A/5GT4615QB4mdCOzfx5+2UH/YWQHoi+0Y+ICe0qVWbY1w5
         17ZQ==
X-Gm-Message-State: AOAM5300BokDcNcUI7amHP7+m00ALJuuPxxxx/+v2Au5e+QAB6xQUjJo
        KcY3dZUH4q9GoOYpYRL3qmYp/6Q7oMAZiMi5/YsuTw==
X-Google-Smtp-Source: ABdhPJwsd1zLLYUQfLBwKIUDzPngm5BPAn1Oi62bpRLI87FQeo/xi46FUBxuYdvnnmkfHALpRVoAob1SKb1fomVrKmQ=
X-Received: by 2002:a2e:6a17:: with SMTP id f23mr772794ljc.338.1598619846247;
 Fri, 28 Aug 2020 06:04:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200826145153.10444-1-krzk@kernel.org> <20200826145153.10444-16-krzk@kernel.org>
In-Reply-To: <20200826145153.10444-16-krzk@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Aug 2020 15:03:55 +0200
Message-ID: <CACRpkdarHXwpNfVqODTn3ZZ02W5GTfynQDL3=Y+Mg8ytY8SOvA@mail.gmail.com>
Subject: Re: [PATCH 16/16] iio: magnetometer: ak8974: Simplify with dev_err_probe()
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Peter Rosin <peda@axentia.se>, Kukjin Kim <kgene@kernel.org>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Beniamin Bia <beniamin.bia@analog.com>,
        Tomasz Duszynski <tomasz.duszynski@octakon.com>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Aug 26, 2020 at 4:53 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
