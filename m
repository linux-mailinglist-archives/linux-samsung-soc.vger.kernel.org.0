Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0F6A141189
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 17 Jan 2020 20:17:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729486AbgAQTRN (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 17 Jan 2020 14:17:13 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:34589 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726761AbgAQTRM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 17 Jan 2020 14:17:12 -0500
Received: by mail-ed1-f67.google.com with SMTP id l8so23293672edw.1;
        Fri, 17 Jan 2020 11:17:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=q289yoxQlOvdyPCarK/JLt94pM8vJpLny7OlspvdC2U=;
        b=H/N9VfI5F+VbLCTqqnacmDENlICpxGCWjt6REPeR38+/qQVQw/jaqunYX4EQtJMOv5
         Wf7I+CartBFqqBdY0QACn8tNz8vAhQIbI7ow/r8NjzllLwVW+jOIA3eBfNx7CuARLNDl
         45DHH0MMSa37ppu40s9H3ByX0FdETc20Q+SMVKJS3QtZjeEFrw54sC9nqNkYM0Z56hMH
         y+bhMntkITlfgFd0W+Vcfrwige+WmH6B59AkhLPlMhruW91L+Gg4F0y/KqFWIChrvI47
         7E3ylK5M8XI1pZ6EiI9p/DuobBS7NMPlDdGeHNpn8qvAlCx1QlkDH1dOe/7ethHX8r0/
         WDOA==
X-Gm-Message-State: APjAAAXndD+Pv4eJeDpmdKDGC5CIQiTQgAKI2KU4bEgfEVNtJXXAJ6ls
        GpC+/GvjuXNZx/TxPLxbBeCsLXpu
X-Google-Smtp-Source: APXvYqwIwV5llycBdQcudfguTHQmgxrfze9/6u/R5qMPStRJpwJxV+Lfkzjjyu6VyPmwTeiFqrTg7g==
X-Received: by 2002:a17:906:1ec8:: with SMTP id m8mr9509446ejj.355.1579288630897;
        Fri, 17 Jan 2020 11:17:10 -0800 (PST)
Received: from kozik-lap ([194.230.155.229])
        by smtp.googlemail.com with ESMTPSA id d22sm1035402edp.28.2020.01.17.11.17.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jan 2020 11:17:10 -0800 (PST)
Date:   Fri, 17 Jan 2020 20:17:08 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 3/3] ARM: multi_v7_defconfig: Enable devfreq thermal
 integration
Message-ID: <20200117191708.GB817@kozik-lap>
References: <20200117123448.13807-1-m.szyprowski@samsung.com>
 <CGME20200117123454eucas1p28093460c40e4300d4a58f7809f614135@eucas1p2.samsung.com>
 <20200117123448.13807-3-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200117123448.13807-3-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Jan 17, 2020 at 01:34:48PM +0100, Marek Szyprowski wrote:
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
>  arch/arm/configs/multi_v7_defconfig | 1 +

Thanks, applied.

Best regards,
Krzysztof

