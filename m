Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 468B0260F42
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  8 Sep 2020 12:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729159AbgIHKEX (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 8 Sep 2020 06:04:23 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:34759 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728726AbgIHKEW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 06:04:22 -0400
Received: by mail-ed1-f68.google.com with SMTP id q21so15415796edv.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Sep 2020 03:04:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=41jdhiY3hGPsJXDGiNMFzyQcSco7x7sF5J0nlworzJ8=;
        b=hmSYbcp1FxtGCRu3ElrwdbTHhbD1kWD/6wlAzylYfqCOimjsHeIx8pJLHron6cQuKn
         j77KQiH3hDZ+WQEW7IO84C7qFv8eEKTiH3AE3dy/mnkcuvOhmgP2QCtQ4ZdnEAxOZbIa
         BsfN9B2VGytpq4EGBwIXUniyg5knsljb0QCATGpQy2yMzY86KqjW4/jLI//m8qbDy7xd
         WYez4uewWBEmUGITaPk4uMuRSnTxndbyyviy2dfDyRrW2fLKOSNTyEiqWUMA4xB5SfPU
         RaF73h7K4SdoHmi6d+m/Wl4bnxQFku6TdBauOyIh082FenigHo9FFoYW4cIvzbsqVy1f
         AkIw==
X-Gm-Message-State: AOAM530z7cH5B7Q55mrpB8lY8+hqFTbWeVOJpd5ohfNWhol5yuu0r/4U
        PyRFdFpzEqms8AEQfEtij2Y=
X-Google-Smtp-Source: ABdhPJyNCAxNOeWrvlOE+pooKSp8STo3Uxon5b0qHcl0481Wh4eZmCwngfJ0RMd2G7FOnFU04fOQcQ==
X-Received: by 2002:aa7:d3da:: with SMTP id o26mr25269429edr.169.1599559460344;
        Tue, 08 Sep 2020 03:04:20 -0700 (PDT)
Received: from pi3 ([194.230.155.174])
        by smtp.googlemail.com with ESMTPSA id g25sm15204818edu.53.2020.09.08.03.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 03:04:19 -0700 (PDT)
Date:   Tue, 8 Sep 2020 12:04:16 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Julia Lawall <julia.lawall@inria.fr>
Cc:     Brian Kim <brian.kim@hardkernel.com>, kbuild-all@lists.01.org,
        Dongjin Kim <tobetter@gmail.com>,
        memeka <mihailescu2m@gmail.com>,
        Yang Deokgyu <secugyu@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kukjin Kim <kgene@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] ODROID-XU4: char: exynos: fix
 platform_no_drv_owner.cocci warnings
Message-ID: <20200908100416.GA24903@pi3>
References: <alpine.DEB.2.22.394.2009081136090.2478@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2009081136090.2478@hadrien>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Sep 08, 2020 at 11:39:51AM +0200, Julia Lawall wrote:
> No need to set .owner here. The core will do it.
> 
> Generated by: scripts/coccinelle/api/platform_no_drv_owner.cocci
> 
> Fixes: be904257f8a9 ("ODROID-XU4: char: exynos: add /dev/gpiomem device for rootless user GPIO access")
> CC: Brian Kim <brian.kim@hardkernel.com>
> Signed-off-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Julia Lawall <julia.lawall@inria.fr>

Hi,

This is a downstream tree with certain non-upstreamable patches, so
nothing to do here for me.

Best regards,
Krzysztof

> ---
> 
> I received some other warnings about this file, but with no details:
> 
> >> drivers/char/exynos-gpiomem.c:231:15-18: ERROR: inst is NULL but
> dereferenced.
> --
> >> drivers/char/exynos-gpiomem.c:231:9-13: ERROR: reference preceded by
> free on line 229
> 
> 
> tree:   https://github.com/tobetter/linux odroid-5.9.y
> head:   1118f1d60573bfbf1eb7ef079fa879a498ba4313
> commit: be904257f8a9bd689b360fa98d3ffc85bdbeb560 [53/69] ODROID-XU4: char: exynos: add /dev/gpiomem device for rootless user GPIO access
> :::::: branch date: 4 hours ago
> :::::: commit date: 4 hours ago
> 
