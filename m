Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFBC424E7F7
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 22 Aug 2020 16:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727856AbgHVOxA (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 22 Aug 2020 10:53:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726728AbgHVOw7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 22 Aug 2020 10:52:59 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D84E7C061574
        for <linux-samsung-soc@vger.kernel.org>; Sat, 22 Aug 2020 07:52:58 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id bs17so3996523edb.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 22 Aug 2020 07:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CzryhHj21VyQdaYbcJxzbCkh7ulFs1srWgrHkgzAcig=;
        b=hQ1o/5Y/4q/t5eH3b4oYTYS+j6BBmkvOvdk5CSuEea3VwBeU0OHljITtVxIcC4vCHt
         hfi4dXK+MeSKZ8VyzL7H09BrJ26pay6jyq9e2S1ZF2jeZP2zkBclgH21+JM5LbigzrSk
         FgyEqMOA+E5uPzvp6H3iKBc585YiZLE6fvqFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CzryhHj21VyQdaYbcJxzbCkh7ulFs1srWgrHkgzAcig=;
        b=r97ZBo4HzLBqtHiD7uWpLTGNNO/TyYPjqbj9wSuCQYNTC9J997hyCU+XwqbpCsREBh
         843xUufDXxuzwf7SOlr4GUQXwenOp2XPTPQhrwohP06f2J9uDAadnbNUrw3cMbDojcy8
         QBwX43S4VDkI3bzyY4WljyUOge+5uBVpzC+ZI2+kFsXxGxdHydo1kZhAJ6cDC65SKIpy
         XNsJw4K9JfqOb0b4b/71N0ON3xrCt6SPZEBPFcm/uEjsxO+5y9hGZbQiXqDHf69MeV70
         c6+OxqEp1mrRk1tTj8YRG+KVferY4rqDXaBBn51ntuVuD1b6UhlAk2M+4rE1Qgd/LEXW
         6xTQ==
X-Gm-Message-State: AOAM5321oJ4SvgwtkxB5Zeb2QSpnZSCPGfByhRgEQV3xsqljbpSdGwUR
        TGciOmmwCvYpdQkgc+Dr0ZtlnEgQBV0W1Q==
X-Google-Smtp-Source: ABdhPJzTg+wqvbLLd44aD4ku9zMnqEgkDUmzY48XqnBpCDphosp3K+W3v4Fn1GjlQAezsKVHVbJBGQ==
X-Received: by 2002:a50:ee0a:: with SMTP id g10mr7185867eds.289.1598107976037;
        Sat, 22 Aug 2020 07:52:56 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id k25sm112437edx.96.2020.08.22.07.52.54
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Aug 2020 07:52:54 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id a15so4499278wrh.10
        for <linux-samsung-soc@vger.kernel.org>; Sat, 22 Aug 2020 07:52:54 -0700 (PDT)
X-Received: by 2002:a5d:6744:: with SMTP id l4mr7904439wrw.105.1598107973784;
 Sat, 22 Aug 2020 07:52:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200821161401.11307-1-l.stelmach@samsung.com>
 <CGME20200821161407eucas1p249e4833b8839f717cc2a496ab43bb8a2@eucas1p2.samsung.com>
 <20200821161401.11307-8-l.stelmach@samsung.com> <20200822124325.GF20423@kozik-lap>
In-Reply-To: <20200822124325.GF20423@kozik-lap>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Sat, 22 Aug 2020 16:52:40 +0200
X-Gmail-Original-Message-ID: <CAAFQd5CmPXDsOWmPBS+z5McxGvn+L2nkV2Wh934Bq7xY6DMO4A@mail.gmail.com>
Message-ID: <CAAFQd5CmPXDsOWmPBS+z5McxGvn+L2nkV2Wh934Bq7xY6DMO4A@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] spi: spi-s3c64xx: Ensure cur_speed holds actual
 clock value
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
        Kukjin Kim <kgene@kernel.org>, Andi Shyti <andi@etezian.org>,
        Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, Aug 22, 2020 at 2:43 PM Krzysztof Kozlowski <krzk@kernel.org> wrote=
:
>
> On Fri, Aug 21, 2020 at 06:13:59PM +0200, =C5=81ukasz Stelmach wrote:
> > cur_speed is used to calculate transfer timeout and needs to be
> > set to the actual value of (half) the clock speed for precise
> > calculations.
>
> If you need this only for timeout calculation just divide it in
> s3c64xx_wait_for_dma().

Division is not the point of the patch. The point is that
clk_set_rate() that was originally there doesn't guarantee that the
rate is set exactly. The rate directly determines the SPI transfer
speed and thus the driver needs to use the rate that was actually set
for further calculations.

> Otherwise why only if (cmu) case is updated?

Right, the !cmu case actually suffers from the same problem. The code
divides the parent clock rate with the requested speed to obtain the
divider to program into the register. This is subject to integer
rounding, so (parent / (parent / speed)) doesn't always equal (speed).

>
> You are also affecting here not only timeout but
> s3c64xx_enable_datapath() which is not mentioned in commit log. In other
> words, this looks wrong.

Actually this is right and fixes one more problem, which I didn't spot
when looking at this code when I suggested the change (I only spotted
the effects on timeout calculation). The rounding error might have
caused wrong configuration there, because e.g. 30000000 Hz could be
requested and rounded to 28000000 Hz. The former is a threshold for
setting the S3C64XX_SPI_CH_HS_EN bit, but the real frequency wouldn't
actually require setting it.

Best regards,
Tomasz

>
> Best regards,
> Krzysztof
>
> >
> > Cc: Tomasz Figa <tfiga@chromium.org>
> > Signed-off-by: =C5=81ukasz Stelmach <l.stelmach@samsung.com>
> > ---
> >  drivers/spi/spi-s3c64xx.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> > index 02de734b8ab1..89c162efe355 100644
> > --- a/drivers/spi/spi-s3c64xx.c
> > +++ b/drivers/spi/spi-s3c64xx.c
> > @@ -626,6 +626,7 @@ static int s3c64xx_spi_config(struct s3c64xx_spi_dr=
iver_data *sdd)
> >               ret =3D clk_set_rate(sdd->src_clk, sdd->cur_speed * 2);
> >               if (ret)
> >                       return ret;
> > +             sdd->cur_speed =3D clk_get_rate(sdd->src_clk) / 2;
> >       } else {
> >               /* Configure Clock */
> >               val =3D readl(regs + S3C64XX_SPI_CLK_CFG);
> > --
> > 2.26.2
> >
