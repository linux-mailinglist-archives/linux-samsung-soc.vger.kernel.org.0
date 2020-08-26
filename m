Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 181F92534A0
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 26 Aug 2020 18:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbgHZQR0 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 26 Aug 2020 12:17:26 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:38598 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726745AbgHZQRZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 Aug 2020 12:17:25 -0400
Received: by mail-ed1-f66.google.com with SMTP id b2so2248827edw.5;
        Wed, 26 Aug 2020 09:17:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=laWDGcI0X9wsLJOKujDeA1CnpKtg4JiaZl3VvU6mRis=;
        b=Yso8pcDs7StuKbqxo7YfPxzXF+ArWOAdQ7s5J3Di2/5xW4VxZjFl1qv8dkjURDPC8x
         x/7BI+2vIOXPZsAq6S8KKIH/qf1ndtXv7ZQND6vWVGUkRv1OpVkrVcvozih75igf//D3
         +KavaylnD8xSwYW5HGiduFpJ44mxm8dsnRKa1+BPPUdGYJa2AqJkWfrvRBVF9f1mbS9N
         ErIfd5LNCxPhVLcVZ5TnbGCdt3MvF0T3yLSMt7ZHdyBupLGggCOsLYVOh2gdfMa7t+Xg
         Zmc+U9rpNEOY56msVdCMoW+PEbKYsD/CQAy5lpQDq7S0dvWCvVGqWN3CJ5yyhgtdC3tc
         B6fw==
X-Gm-Message-State: AOAM531ReCFTiMTpgYE9Okec05LEG3e1i48ikCqT65udH8h827LEYa3m
        1iRClSdRgAeKAw8lkKmDw+Q=
X-Google-Smtp-Source: ABdhPJwDaFNcHPrTYdLriZtJcxNZ110E7a9YGPHsFImoDK7pqL5BMNNSt1z6y1v86s6eweEOR3zqAQ==
X-Received: by 2002:aa7:d70a:: with SMTP id t10mr12649505edq.161.1598458642874;
        Wed, 26 Aug 2020 09:17:22 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
        by smtp.googlemail.com with ESMTPSA id p9sm2325797ejg.120.2020.08.26.09.17.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Aug 2020 09:17:22 -0700 (PDT)
Date:   Wed, 26 Aug 2020 18:17:19 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Jonathan Cameron <jic23@kernel.org>,
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
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 08/16] iio: adc: stm32: Simplify with dev_err_probe()
Message-ID: <20200826161719.GB31748@kozik-lap>
References: <20200826145153.10444-1-krzk@kernel.org>
 <20200826145153.10444-8-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200826145153.10444-8-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Aug 26, 2020 at 04:51:45PM +0200, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/iio/adc/stm32-adc-core.c  | 62 ++++++++++++-------------------
>  drivers/iio/adc/stm32-adc.c       | 10 ++---
>  drivers/iio/adc/stm32-dfsdm-adc.c | 10 ++---
>  3 files changed, 30 insertions(+), 52 deletions(-)

For this one I have a follow up - I found more of places for conversion.
I will send v2 for this one only.

Best regards,
Krzysztof

