Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ECEC25EDDF
	for <lists+linux-samsung-soc@lfdr.de>; Sun,  6 Sep 2020 14:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728767AbgIFM4t (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 6 Sep 2020 08:56:49 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35400 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728692AbgIFM4r (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 6 Sep 2020 08:56:47 -0400
Received: by mail-wr1-f66.google.com with SMTP id e16so11918728wrm.2;
        Sun, 06 Sep 2020 05:56:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hi7cBM4dNM9ZHTX+OEtEOLbKuZNyphhpJQFbp8c82F0=;
        b=psyJwrhfZi/7k3J/aha5qFqRHUIA/FCqaA7ft9sTAZjRKzFT52M2TC7UceCpDxvWR+
         0iLybJKP5hM86HS+OQ9BWxOFEKtCdJt5lvRKOJ3C7wlfLkigWyzFXvgzE4L4MyIwlscx
         7EwVHztgOtOHpQdXlhJq4RAfa2/3f+ZUtfYuHjFME+wdbUiEpd34K3FQREgVOJBqiLxp
         mMLvtAEXN1zZRMZgAv53E+OEpgCiGU5nG2HHZtb4sijh3YoTPuof9CJ+m74cmTJAaBPT
         5uMaIhapqUVEDqEuEM0cTGFbPNp+GCkk4dAtZ9ZVTQfS3/giI597sPyRZN/owaHbdwIi
         CGVg==
X-Gm-Message-State: AOAM531ptw7a4CXdSLhNJ5ucOc/7Qc2qhgB0jy1CLbtG5yQGBD2wEeHi
        AE5IAbfkKVBvKvIciruzL8k=
X-Google-Smtp-Source: ABdhPJxC3li2Jb9IyuHE1as9vdJHPOx3it1FByEPx+L86HG7S+i3qvEFts/MuiNOJYEgMcg2x1oKeg==
X-Received: by 2002:a5d:4bcf:: with SMTP id l15mr16631440wrt.384.1599397004569;
        Sun, 06 Sep 2020 05:56:44 -0700 (PDT)
Received: from kozik-lap ([194.230.155.174])
        by smtp.googlemail.com with ESMTPSA id f14sm23696587wrv.72.2020.09.06.05.56.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 06 Sep 2020 05:56:43 -0700 (PDT)
Date:   Sun, 6 Sep 2020 14:56:40 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: Re: [PATCH v2 2/3] ARM: dts: exynos: Add assigned clock parent to
 CMU in Exynos4412 Odroid
Message-ID: <20200906125640.GB4829@kozik-lap>
References: <20200903181425.5015-1-krzk@kernel.org>
 <CGME20200903181440eucas1p251f5f467fdacf8d74d3c20418052eb38@eucas1p2.samsung.com>
 <20200903181425.5015-2-krzk@kernel.org>
 <d5468bf5-516f-58a8-4544-fe7fc377e7b1@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d5468bf5-516f-58a8-4544-fe7fc377e7b1@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Sep 04, 2020 at 09:02:23AM +0200, Marek Szyprowski wrote:
> Hi Krzysztof,
> 
> On 03.09.2020 20:14, Krzysztof Kozlowski wrote:
> > Commit 68605101460e ("ARM: dts: exynos: Add support for audio over HDMI
> > for Odroid X/X2/U3") added assigned clocks under Clock Management Unit.
> >
> > However the dtschema expects "clocks" property if "assigned-clocks" are
> > used.  Add reference to input clock, the parent used in
> > "assigned-clock-parents" to silence the dtschema warnings:
> >
> >    arch/arm/boot/dts/exynos4412-odroidu3.dt.yaml: clock-controller@10030000: 'clocks' is a dependency of 'assigned-clocks'
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >   arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> > index ca3c78e0966c..9375df064076 100644
> > --- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> > +++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> > @@ -120,6 +120,7 @@
> >   };
> >   
> >   &clock {
> > +	clocks = <&clock CLK_FOUT_EPLL>;
> 
> This should be one of xusbxti or xxti, because this is the proper input 
> clock for the clock controller. However in case of Exynos4, those clocks 
> needs much more cleanup. For the historical reasons, they don't use 
> generic 'fixed-clock' property, but the custom one and they are no 
> instantiated by clock framework, but the exynos4 clock driver...

Indeed, so it would be like:

&clock {
	clocks = <&clock CLK_XUSBXTI>;
};

... or convert the driver to take external clocks while keeping the ABI
(and being bisectable).

Best regards,
Krzysztof


> 
> >   	assigned-clocks = <&clock CLK_FOUT_EPLL>;
> >   	assigned-clock-rates = <45158401>;
> >   };
> 
> Best regards
> -- 
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
> 
