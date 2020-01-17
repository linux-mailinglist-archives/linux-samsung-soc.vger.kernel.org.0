Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FE45141187
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 17 Jan 2020 20:17:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727573AbgAQTRE (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 17 Jan 2020 14:17:04 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:46050 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726761AbgAQTRE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 17 Jan 2020 14:17:04 -0500
Received: by mail-ed1-f68.google.com with SMTP id v28so23256686edw.12;
        Fri, 17 Jan 2020 11:17:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jxo87amVJ0v7aRGy/Yn9AeY7XnrfD298QHq6bag08Rw=;
        b=M66ewznrS3tzBzv+69pwFz0TFlMksJOwtASzwgM8f0y2M/wX9gKLE4UeWghYtN+o+E
         nsTMnV7LZencaP9Q4r0y0w/xFR4B/eT0+06xAhakX+HfrKRmiBSjxj0qITyCFxYCyitZ
         DhX6/oG8uawO11XQ5SR48XDpFRbFpYmTGRkff6OVfBfhEyGnFvVEpi8LsGMWItutnsUX
         GhuBIomfJtoveL+bEleTshr77oZRRNukwHb7bdcP4rYCH8yvbSDTuvlTy+i89Pu++zTg
         i9pWA66IpCzDzO9IhiiK6GSWpTCVJwlTWjOqTUldsE5uQaAcTbN9uUIlSZx6IW3DKfDi
         z/QA==
X-Gm-Message-State: APjAAAVQHyMsnAifBWknOsYowDqzG+zF77P4ALgW951Xm9sPLZaSYrqS
        NaL1ONH/k0FPqLVwNrAAO5s=
X-Google-Smtp-Source: APXvYqy261GuXtT9jW9nvH7rE956ER4dssCTfL3UchBM938WntCAn7coVwV4aR09M37O4hRJkvSroA==
X-Received: by 2002:a17:906:6942:: with SMTP id c2mr9235157ejs.12.1579288622093;
        Fri, 17 Jan 2020 11:17:02 -0800 (PST)
Received: from kozik-lap ([194.230.155.229])
        by smtp.googlemail.com with ESMTPSA id y19sm922646ejw.65.2020.01.17.11.17.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jan 2020 11:17:00 -0800 (PST)
Date:   Fri, 17 Jan 2020 20:16:58 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 2/3] ARM: exynos_defconfig: Enable devfreq thermal
 integration
Message-ID: <20200117191658.GA817@kozik-lap>
References: <20200117123448.13807-1-m.szyprowski@samsung.com>
 <CGME20200117123454eucas1p1e8f0e527dc39f1e0993b14c7098002e4@eucas1p1.samsung.com>
 <20200117123448.13807-2-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200117123448.13807-2-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Jan 17, 2020 at 01:34:47PM +0100, Marek Szyprowski wrote:
> Panfrost driver provides a devfreq driver for the Mali GPU and allows to
> scale GPU core frequency. Enable support for devfreq thermal integration
> to enable cooling of GPU thermal zone by reducing GPU core frequency.
> 
> This fixes following warning during boot on Exynos5422-based Odroid XU4:
> 
> panfrost 11800000.gpu: [drm:panfrost_devfreq_init] Failed to register cooling device
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/configs/exynos_defconfig | 1 +

Thanks, applied.

Best regards,
Krzysztof

