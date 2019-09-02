Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 444DFA5A45
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  2 Sep 2019 17:13:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731370AbfIBPNA (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 2 Sep 2019 11:13:00 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37453 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731000AbfIBPNA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 Sep 2019 11:13:00 -0400
Received: by mail-wr1-f66.google.com with SMTP id z11so14390089wrt.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Sep 2019 08:12:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wvswuEEcRnSABaQPF4+btc5uyXU4LrVLD6tvQ/40hfo=;
        b=rzbI/CuruaqVQ9d0/AyMfgKq5bmNXy165/ZFjUprgxYhrC+gt7aOK80Ka9nn7re8bO
         7awWUsBh1sL4v+1sFEjXbNsqcuIjfekIV+PsDgaLqLYgvKw1mq7qx5b0JcEsRX1PL9Av
         uqwk3IIGmId1OAc3RCCZcn/2Qtf5rSgjEke6fmyDqg0+9wjAluQtube4zOyim/qaKw5Z
         UJqDCiwzrzndqc7i/N//8LRV2t0QPR6yVcv67V1bLPQor+97XiLg/g4Ow/yfvDvthsxx
         845uN5dxt1wHzJd/2gosc9ID3DiosgFp6uapDL6iImjSx1eSU185XlXcCrSWOSk7Db5a
         AYkA==
X-Gm-Message-State: APjAAAUyMvmM+oVG8TrSMhgt4KA3bZTMT26fosG0sPbk+e41ZqJvKbsd
        8iSw8ED5NfImI2aoxbyBclg=
X-Google-Smtp-Source: APXvYqxyOZgnclFx9omTjWdtkUYrkisqiFcyLv2Wz2LCqMxVjcFpvxYM1bTAvA+r+4PzsT1cPbsJAg==
X-Received: by 2002:adf:f812:: with SMTP id s18mr27250963wrp.32.1567437178164;
        Mon, 02 Sep 2019 08:12:58 -0700 (PDT)
Received: from kozik-lap ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id 23sm11888965wmo.13.2019.09.02.08.12.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Sep 2019 08:12:57 -0700 (PDT)
Date:   Mon, 2 Sep 2019 17:12:55 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH] ARM: dts: exynos: Mark LDO10 as always-on on Peach
 Pit/Pi Chromebooks
Message-ID: <20190902151255.GA9289@kozik-lap>
References: <CGME20190830125255eucas1p1f39a9d097c3774857788b55e79b4e7c4@eucas1p1.samsung.com>
 <20190830125242.10008-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190830125242.10008-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Aug 30, 2019 at 02:52:42PM +0200, Marek Szyprowski wrote:
> Commit aff138bf8e37 ("ARM: dts: exynos: Add TMU nodes regulator supply for
> Peach boards") assigned LDO10 to Exynos Thermal Measurement Unit, but it
> turned out that it supplies also some other critical parts and board
> freezes/crashes when it is turned off.
> 
> The mentioned commit made Exynos TMU a consumer of that regulator and in
> typical case Exynos TMU driver keeps it enabled from early boot. However
> there are such configurations (example is multi_v7_defconfig), in which
> some of the regulators are compiled as modules and are not available from
> early boot. In such case it may happen that LDO10 is turned off by
> regulator core, because it has no consumers yet (in this case consumer
> drivers cannot get it, because the supply regulators for it are not yet
> available). This in turn causes the board to crash. This patch restores
> 'always-on' property for the LDO10 regulator.
> 
> Fixes: aff138bf8e37 ("ARM: dts: exynos: Add TMU nodes regulator supply for Peach boards")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420-peach-pit.dts | 1 +
>  arch/arm/boot/dts/exynos5800-peach-pi.dts  | 1 +

Thanks, applied.

Best regards,
Krzysztof

