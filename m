Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B55F253429
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 26 Aug 2020 17:59:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726988AbgHZP5v (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 26 Aug 2020 11:57:51 -0400
Received: from mail-ej1-f68.google.com ([209.85.218.68]:34209 "EHLO
        mail-ej1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726840AbgHZP52 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 Aug 2020 11:57:28 -0400
Received: by mail-ej1-f68.google.com with SMTP id d26so3601415ejr.1;
        Wed, 26 Aug 2020 08:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=45MPvxSTPW26+XDfgYCIUeSzgGp+rsYJNL1Xl/Rrc7s=;
        b=L1IkuHH/tdLs91wySmKRLjfhnRiKDjGiDA4+Hjin5wIhV/kOYPdQAxnUaqmmkGXdCL
         ozpHXCY5Svodwvd01YI/5CZIcQ4l8/X9HxxgVfalNcBglDZBggp67z00pZYiv3zAdEuY
         OTATIjMg1fTH4Av0YIkX2/wyXfOEt+5QP+mF0b0LkzR9zDB2jeA1uPIyWIltOVG2Zbo8
         M6YrZc587v9/GXNR54Z1DE05KPz2f5KQxSuHik6mn0NG3t47vPPoLFdnrCr5XwNKV3f5
         hj++9fnl6DSYfxVw5LfgqG5g/cViBZ+vpsEnZXKZXTpdnLvMOLN52TShbanvhBdTCa2H
         olkQ==
X-Gm-Message-State: AOAM53330SwVVx+2vjptReIKwL2o2iPJucF4eg/s1nDbKDgd1NiSCrky
        nB7J+575fWJKda+pzOYNc5s=
X-Google-Smtp-Source: ABdhPJwogQw5qIsL7Fpbti7NmegdVYPyyDOLGY4F/NiL6nihkqrZkmsf+wLzabOVGtOxQ+zQF8NZAA==
X-Received: by 2002:a17:906:1404:: with SMTP id p4mr16196580ejc.256.1598457446440;
        Wed, 26 Aug 2020 08:57:26 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
        by smtp.googlemail.com with ESMTPSA id v17sm2590422eju.22.2020.08.26.08.57.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Aug 2020 08:57:25 -0700 (PDT)
Date:   Wed, 26 Aug 2020 17:57:23 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Tomasz Duszynski <tomasz.duszynski@octakon.com>
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
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 11/16] iio: chemical: scd30: Simplify with dev_err_probe()
Message-ID: <20200826155723.GA31748@kozik-lap>
References: <20200826145153.10444-1-krzk@kernel.org>
 <20200826145153.10444-11-krzk@kernel.org>
 <20200826153434.GA7468@arch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200826153434.GA7468@arch>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Aug 26, 2020 at 05:34:34PM +0200, Tomasz Duszynski wrote:
> On Wed, Aug 26, 2020 at 04:51:48PM +0200, Krzysztof Kozlowski wrote:
> > Common pattern of handling deferred probe can be simplified with
> > dev_err_probe().  Less code and also it prints the error value.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  drivers/iio/chemical/scd30_core.c | 10 +++-------
> >  1 file changed, 3 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/iio/chemical/scd30_core.c b/drivers/iio/chemical/scd30_core.c
> > index eac76972f83e..92358797796d 100644
> > --- a/drivers/iio/chemical/scd30_core.c
> > +++ b/drivers/iio/chemical/scd30_core.c
> > @@ -705,13 +705,9 @@ int scd30_probe(struct device *dev, int irq, const char *name, void *priv,
> >  	indio_dev->available_scan_masks = scd30_scan_masks;
> >
> >  	state->vdd = devm_regulator_get(dev, "vdd");
> > -	if (IS_ERR(state->vdd)) {
> > -		if (PTR_ERR(state->vdd) == -EPROBE_DEFER)
> > -			return -EPROBE_DEFER;
> > -
> > -		dev_err(dev, "failed to get regulator\n");
> > -		return PTR_ERR(state->vdd);
> > -	}
> > +	if (IS_ERR(state->vdd))
> > +		return dev_err_probe(dev, PTR_ERR(state->vdd),
> > +				     "failed to get regulator\n");
> 
> I'd say that removing like break would slightly improve readability.
> Besides, staying within 100 columns seems socially acceptable now.
> Otherwise,
> 
> Acked-by: Tomasz Duszynski <tomasz.duszynski@octakon.com>

Indeed. Although 80 is still mentioned as preferred (in commit bdc48fa11
and in coding style) but here having longer line would be better.

I guess this could be fixed up easily when applying but if resend is
wanted, let me know.

Best regards,
Krzysztof
