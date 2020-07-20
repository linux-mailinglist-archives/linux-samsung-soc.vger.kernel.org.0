Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD4F822627F
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 20 Jul 2020 16:49:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728448AbgGTOtR (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 20 Jul 2020 10:49:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726492AbgGTOtR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Jul 2020 10:49:17 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01508C061794
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jul 2020 07:49:17 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id j18so22544664wmi.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jul 2020 07:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=dCQF7F+ay5jXE+ml8xQtj+pq5cdYa6gArESdvwR7ETA=;
        b=HCpPDtGbcoFu+VD6Wp0+UWsSaib1LLMOPAAH4BUmA1Yz7X0dQNyvDQ9rWYEuePSte9
         B91h1832zv4KK0ge7rlwQsZRq0Ijb1vdkCnMGYPABjJkRF+7azS45vDNaGY0EuEkf/O7
         UvIRSgaPcW0FfCCDVvSjr3jrbRlnnc1aNJIbNzsXgz2ijnsAfQ+18iRUAu9MRaCn421/
         YSTaVs9FcR5tu8yP50Ad9fRaVIb6iem9fc4RAcWhFsKhA4UM+suBwZ9JwdIXtgKiPsYt
         xtBOa9SzisvkTY7p8kLd9MV38jsjAdDlnFL38A29RCUu2BAooDorG9o2FEXmEf4qAKPw
         Xyww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=dCQF7F+ay5jXE+ml8xQtj+pq5cdYa6gArESdvwR7ETA=;
        b=qc8sO+rS+5wmZJWip5yVHu9heI+fL8Gv8r/NuL+vkhJI91oBPPPvXFKALtp4AJsjLQ
         fZyD1K9ydDlOQBjqkNiPGu8GkRTpiUVJ4HqJxWSiQ0ri+ut/niDr7Sl8h9P3xGCBYM35
         bvQYtba7SPdibdMKUYu1+q6E3m4jXnQKCKxQrnk7yz9XnsoIJxsNVyWMgysF8P0Fw6e4
         IvikZXFBXjNV18axVY76WXS1FWil4PFYRJ1Y9kLZ/Xnnj54BEfWLFrMGta0IhJsGbuCU
         CYzGfKou8BXonC38ieYjVcDVulmZjLU/jVDqD+7R74Wh7txF6I+h3qUssYmdU2Yb1Gis
         b1NQ==
X-Gm-Message-State: AOAM530hN3sfLGHcgRcuQLbZiR9oPFqYV52//BMgeVzQBrkHG58ZdFgE
        67J7oavvthUNALtHyxsMx6ySMw==
X-Google-Smtp-Source: ABdhPJzxdQKiviMvc7XJrEXZImwhFkzx66E/hxLhzoh7GRWAPmpapWv7ZiBJ3X3FKjDayEJTMuNq/g==
X-Received: by 2002:a1c:2702:: with SMTP id n2mr21565244wmn.123.1595256555699;
        Mon, 20 Jul 2020 07:49:15 -0700 (PDT)
Received: from dell ([2.27.167.94])
        by smtp.gmail.com with ESMTPSA id b8sm2591228wrv.4.2020.07.20.07.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 07:49:15 -0700 (PDT)
Date:   Mon, 20 Jul 2020 15:49:13 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kukjin Kim <kgene@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 07/25] pinctrl: samsung: pinctrl-s3c24xx: Fix formatting
 issues
Message-ID: <20200720144913.GC3368211@dell>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
 <20200713144930.1034632-8-lee.jones@linaro.org>
 <20200720142727.GB6747@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200720142727.GB6747@kozik-lap>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 20 Jul 2020, Krzysztof Kozlowski wrote:

> On Mon, Jul 13, 2020 at 03:49:12PM +0100, Lee Jones wrote:
> > Kerneldoc struct titles must be followed by whitespace.  Also attributes
> > need to be in the format '@.*: ' else the checker gets confused.
> > 
> > Fixes the following W=1 kernel build warning(s):
> > 
> >  drivers/pinctrl/samsung/pinctrl-s3c24xx.c:100: warning: cannot understand function prototype: 'struct s3c24xx_eint_domain_data '
> > 
> > Cc: Kukjin Kim <kgene@kernel.org>
> > Cc: Krzysztof Kozlowski <krzk@kernel.org>
> > Cc: Tomasz Figa <tomasz.figa@gmail.com>
> > Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> > Cc: Heiko Stuebner <heiko@sntech.de>
> > Cc: linux-samsung-soc@vger.kernel.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  drivers/pinctrl/samsung/pinctrl-s3c24xx.c | 6 +++---
> 
> Thanks, applied.

This has already been applied and resides in -next.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
