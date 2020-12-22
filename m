Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 661CA2DE3F3
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 18 Dec 2020 15:23:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727392AbgLROXc (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 18 Dec 2020 09:23:32 -0500
Received: from mail-ej1-f47.google.com ([209.85.218.47]:39939 "EHLO
        mail-ej1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727326AbgLROXc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 18 Dec 2020 09:23:32 -0500
Received: by mail-ej1-f47.google.com with SMTP id x16so3440895ejj.7;
        Fri, 18 Dec 2020 06:23:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uQTJTNKkDlbCLDDKXRf++qDs0VZ1SBcgKS9o1XvOdT0=;
        b=nOk2qQzBHBMnSZlYcL00WxhsKUOUSe6Kp8SX9LImV0/ehbQYlRjTKtWkzyvowof0VD
         y9pOK3zgw95vhpZDmIroSJ/OOitsH/dDGL7U3NsB/6KhCl/FimrGMQsxfbj0x0+dFIj+
         kVXwdjkJJGK+cOXWnIR0OaDCD8oqFt0K584vuuL31hWeyn6DDAePLVB09m3WlFNkeHAf
         MzPnXrOGXJllIw+U+XMB46wUgTQlPpgEsg3w8JZByTKHwTSKYLu+SzLYmgXbJPJlgaeL
         cOlf8MNvzSBv9kcfblR16VnYxFJMgriXQedEpA5k1g5kKjXOcuO0MBbQRhOHPKDTehNY
         pNOw==
X-Gm-Message-State: AOAM533kyPODzIsaKythUVKXl27o1UGJNhREylPhgsdpiJaIy37V6ou1
        vgnaEuw//wcOwvN2j1ZsvfY=
X-Google-Smtp-Source: ABdhPJzWcltOgqb/FpdNyYBvgBAhF/XpVWHDKNOqVDXjdPxiNEk4HfWFRZ6FFaQxNhwapxmmrHodYw==
X-Received: by 2002:a17:906:7d91:: with SMTP id v17mr4281139ejo.522.1608301369788;
        Fri, 18 Dec 2020 06:22:49 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id op5sm5566452ejb.43.2020.12.18.06.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 06:22:48 -0800 (PST)
Date:   Fri, 18 Dec 2020 15:22:47 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: Re: [PATCH 9/9] mfd: sec-irq: Do not enforce (incorrect) interrupt
 trigger type
Message-ID: <20201218142247.GA2847@kozik-lap>
References: <20201210212903.216728-1-krzk@kernel.org>
 <CGME20201210212938eucas1p1297b8503e9c059f2bc77c3a429a9114e@eucas1p1.samsung.com>
 <20201210212903.216728-9-krzk@kernel.org>
 <0f1509ef-9ae7-7a77-84b7-360b8f0071c7@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0f1509ef-9ae7-7a77-84b7-360b8f0071c7@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Dec 18, 2020 at 02:25:39PM +0100, Marek Szyprowski wrote:
> On 10.12.2020 22:29, Krzysztof Kozlowski wrote:
> > Interrupt line can be configured on different hardware in different way,
> > even inverted.  Therefore driver should not enforce specific trigger
> > type - edge falling - but instead rely on Devicetree to configure it.
> >
> > The Samsung PMIC drivers are used only on Devicetree boards.
> >
> > Additionally, the PMIC datasheets describe the interrupt line as active
> > low with a requirement of acknowledge from the CPU therefore the edge
> > falling is not correct.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> It looks that this together with DTS change fixes RTC alarm failure that 
> I've observed from time to time on TM2e board!

Great! I'll add this to the commit msg.

Thanks for testing.

Best regards,
Krzysztof


> 
> > ---
> >
> > This patch should wait till DTS changes are merged, as it relies on
> > proper Devicetree.
> > ---
