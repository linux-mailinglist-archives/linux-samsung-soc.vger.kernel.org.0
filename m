Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99CAC2995AD
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 26 Oct 2020 19:47:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1790226AbgJZSr0 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 26 Oct 2020 14:47:26 -0400
Received: from mail-ej1-f65.google.com ([209.85.218.65]:42235 "EHLO
        mail-ej1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1790283AbgJZSrZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Oct 2020 14:47:25 -0400
Received: by mail-ej1-f65.google.com with SMTP id h24so15151165ejg.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2020 11:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3YnnUz0+Pk6Z91jHxKlijyOx6WgevbM7lII/8O4oOe0=;
        b=qUjhWyhYorS7281XY2oyKquMnxmQDXzX5ApXevtuoMVL7RZVugxK1yJ00sthGVjbzq
         dJ1XTYU1jdUKH9berHl6GdgfIE1BRAKAnUbLnMoZaIpfHO1eklFHPhow8xmbJiKCnu3G
         rtqENdU0OmlFCFegFqd94KRibGcARzm5dTbGr/tDKyT4H19vAE74pwCKgdMfq0feYAvg
         ef8hcp9Rmcb6MpGaQdkozI2jjDYfKMzFsweye+8VjeRJ06xmFd9PFiiPdJTqpT4l8fKT
         oZysZNTeygbY4OsMNY2cT+7SPUyxFJs/gumKt/0Fvgdyd84A8h5oEBWfsmbvwTCGI1xe
         kx/g==
X-Gm-Message-State: AOAM530vzFpuIPvXypG64B93eQwvOehSX3ch0ENGL9cYshZtvaJJ6Sqb
        FUo6/wI0za3UtdbPpC+I45zhrpnS7vo=
X-Google-Smtp-Source: ABdhPJwGYbVPsYkzsUvnrTVG0NjxB9wgG1woSR2Haij9c2+LABVkHwzjgdrn005isFINyR2G+OTiig==
X-Received: by 2002:a17:906:c78a:: with SMTP id cw10mr17610071ejb.478.1603738044356;
        Mon, 26 Oct 2020 11:47:24 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id rs18sm6361873ejb.69.2020.10.26.11.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 11:47:23 -0700 (PDT)
Date:   Mon, 26 Oct 2020 19:47:21 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: exynos_defconfig: enable sound driver for Midas
 platform
Message-ID: <20201026184721.GB165725@kozik-lap>
References: <CGME20201009134902eucas1p235927ef59cc78854e34d2c1f4700c29b@eucas1p2.samsung.com>
 <20201009134855.4520-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201009134855.4520-1-m.szyprowski@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Oct 09, 2020 at 03:48:55PM +0200, Marek Szyprowski wrote:
> Sound driver for Midas platform (Exnyos4412 SoC based) has been recently
> merged, so enable it for tests like other sound drivers for Exynos based
> boards.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/configs/exynos_defconfig | 1 +

Thanks, applied.

Best regards,
Krzysztof

