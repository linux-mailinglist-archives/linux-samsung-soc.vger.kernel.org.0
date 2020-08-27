Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AF0625493B
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 27 Aug 2020 17:22:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728647AbgH0Las (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 27 Aug 2020 07:30:48 -0400
Received: from mail-ej1-f68.google.com ([209.85.218.68]:46824 "EHLO
        mail-ej1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728358AbgH0L37 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 27 Aug 2020 07:29:59 -0400
Received: by mail-ej1-f68.google.com with SMTP id d11so7096502ejt.13;
        Thu, 27 Aug 2020 04:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iXm+BK1XseUH+QiQCNWCtflu2oIe/pb8DPKprrM24Fk=;
        b=VmNKZOqsUZdpT6TBH75t1vcMfIHLkE16hloBQvND4FbjDgASpyiOz0zWfOhyiyvAEs
         8ZB7VDuPlJoM85ibGG3i+nWTIQbbdxeuhrugWX2o1GH9espsJBV7HCkAGSdbac08coo5
         xyvOgIFJGqwUr/+/YpLHxAQY85AALYDeAqvBAl4RRgSCLyRObwGVp43sFaJ2FEUZFO3u
         C7o5g28NUuJNJ6SogaCA8FWd/a+1QLBF1haZcKCO144Nn6wpblkgcUOLib3jyrpzoA1E
         brKVllNZL6yhpdtoUrgk2zGzm13F108hludGk2liBsH2WdTKi+BljjvKwYTZJtTZprbz
         6oNQ==
X-Gm-Message-State: AOAM531m5sX5kVRNUkmuzAUiIAj5Ftaqqb/jqqBwjYQ4SXuhqpMx/4Sz
        fxDUM8BL4dKSDcVpVXgntaqNuj3y8lj2sQ==
X-Google-Smtp-Source: ABdhPJyEwtZ0NCeIt0EbDqNivfcPk1e08kNJdKFzd3GWd/Lf1IHJnIxd+vov5vkjwPfN2ooxo9kx2A==
X-Received: by 2002:a17:906:8d8:: with SMTP id o24mr19868792eje.384.1598527743036;
        Thu, 27 Aug 2020 04:29:03 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
        by smtp.googlemail.com with ESMTPSA id o8sm1631358eji.34.2020.08.27.04.29.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Aug 2020 04:29:02 -0700 (PDT)
Date:   Thu, 27 Aug 2020 13:28:59 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
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
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 01/16] iio: accel: bma180: Simplify with dev_err_probe()
Message-ID: <20200827112859.GA11849@kozik-lap>
References: <20200826145153.10444-1-krzk@kernel.org>
 <20200827122605.0000770f@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200827122605.0000770f@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Aug 27, 2020 at 12:26:05PM +0100, Jonathan Cameron wrote:
> On Wed, 26 Aug 2020 16:51:38 +0200
> Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
> > Common pattern of handling deferred probe can be simplified with
> > dev_err_probe().  Less code and also it prints the error value.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Please make sure to send v2 to linux-iio@vger.kernel.org

Sure, my bad.

Best regards,
Krzysztof
