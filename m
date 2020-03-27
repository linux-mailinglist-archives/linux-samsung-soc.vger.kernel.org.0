Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35FDF1957B0
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 27 Mar 2020 14:03:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbgC0NDc (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 27 Mar 2020 09:03:32 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:43023 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726758AbgC0NDc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 27 Mar 2020 09:03:32 -0400
Received: by mail-ed1-f67.google.com with SMTP id bd14so10953465edb.10
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Mar 2020 06:03:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Lq31OEriFaId2IVJsF62zaK87Lp87IUasBMkkmgempw=;
        b=j1h+eDEBLyzhzPD38QnowWX+0s9ZJcM1rNUl+JX+9cnIVSkRiZjbHonpLy7HX3jJo+
         Tav4N5oX/1wkyYK0UJpXzQhNd1XduchyYU1sEmI6o+Rg/IHGEpwsH8I/TQ/ddGrYDfkI
         0fp8OxeYgqLS3FJKcYgdTg/k+BH3EvrPCnvmjze+AkfXxJeIEF+YrMIgj/sYAZXICrrJ
         BbyU8W+AippSU2BzHv+buD4FFAcNGeu8CSF4cab98sgPGVNCgN+/sTom115Kdl3DIt1L
         QqMHoA425om3Nr4Ph1BLPTopMFxortiZPg4YPxMbhKikcbHJ61yaD00LGZhXM8kK5hXb
         4MNw==
X-Gm-Message-State: ANhLgQ114ZChXkH9vFWY75nmQ/LswAGKxHOK4ACqrEldGVz7LzWH9Wjb
        i6iPvE/uA50yfC3gY6Fsd03yADcm
X-Google-Smtp-Source: ADFU+vusIDB1tlK/HKLm2AOVcc6tfhc07jn64PE1X1Weq+49sAJasxFe6ZVioWt1BEecsjRgUc+f/g==
X-Received: by 2002:a50:9eaf:: with SMTP id a44mr13510158edf.58.1585314211113;
        Fri, 27 Mar 2020 06:03:31 -0700 (PDT)
Received: from kozik-lap ([194.230.155.125])
        by smtp.googlemail.com with ESMTPSA id yh26sm714663ejb.84.2020.03.27.06.03.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Mar 2020 06:03:30 -0700 (PDT)
Date:   Fri, 27 Mar 2020 14:03:28 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v2 1/4] ARM: dts: exynos: Enable WLAN support for the
 UniversalC210 board
Message-ID: <20200327130328.GA9596@kozik-lap>
References: <CGME20200327130011eucas1p1c82b341aff9583d8e9c11fad9d8a64f4@eucas1p1.samsung.com>
 <20200327130005.20340-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200327130005.20340-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Mar 27, 2020 at 02:00:05PM +0100, Marek Szyprowski wrote:
> Add a node for BCM4330/2 SDIO chip on SDHCI bus #3 and the required MMC
> power sequence node for the Exynos4210-based UniversalC210 board.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  .../boot/dts/exynos4210-universal_c210.dts    | 28 +++++++++++++++++++

Thanks, applied.

Best regards,
Krzysztof

