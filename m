Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3A7B19572D
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 27 Mar 2020 13:37:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbgC0MhW (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 27 Mar 2020 08:37:22 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:46457 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726515AbgC0MhW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 27 Mar 2020 08:37:22 -0400
Received: by mail-ed1-f68.google.com with SMTP id cf14so10839567edb.13
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Mar 2020 05:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7VTYeksnyafrQ63PBTH7kJUePqTvfGre9YZNz1Kqfq4=;
        b=Oyf4HHLkjPnr6+Q61oKsoYF4gNJEoodUA30qd4L6ueJaIyskamnxdCjm/vKdAum6v5
         xGT8S90a9amtulxroGhaBXU1Q5tg5OE/tSBTvj28Lr1uxK7e2mVZIJZiV3t/qGELt7zF
         XbuxHkGb80H1XNsKqpVdrxASo8jelhIOkLmrtpTS6i6TQHDNI3KhUCoR6Ak3ykNT1OV4
         pZWOGmyu3+bsh46ulmkV0mCrP3Qg3L3l3xMv5w4Dr6S0EGkr/BmmWkfg0QhE+p9tYnbh
         KpXwOH67bX8fnawm+hSO3GEuEjjgf950RVaIPpxK5MnH2QpV2vqBVsBypaRd2FwRsA31
         0VCQ==
X-Gm-Message-State: ANhLgQ1ZWG2QDgMPJfKkQC/rPZ+Bogy4Cl9VrB076LQ/eWJvvvSYEVAx
        a6WJzWBLsAfJo4BwVJXmnTg=
X-Google-Smtp-Source: ADFU+vsCjzadv3OYPRPiolrApDvCJRBGtCyf8GkehCqzl07p2ZFJrzPz857XHxbirOBvarZT4Hde8g==
X-Received: by 2002:a17:906:2451:: with SMTP id a17mr11812191ejb.79.1585312640019;
        Fri, 27 Mar 2020 05:37:20 -0700 (PDT)
Received: from kozik-lap ([194.230.155.125])
        by smtp.googlemail.com with ESMTPSA id v6sm856848edx.18.2020.03.27.05.37.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Mar 2020 05:37:19 -0700 (PDT)
Date:   Fri, 27 Mar 2020 13:37:17 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos: Correct the MAX8997 interrupts on the
 Trats board
Message-ID: <20200327123717.GI7233@kozik-lap>
References: <CGME20200326150814eucas1p1e4133a361a23385aa3fdf940980bdfce@eucas1p1.samsung.com>
 <20200326150806.27221-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200326150806.27221-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Mar 26, 2020 at 04:08:06PM +0100, Marek Szyprowski wrote:
> Remove the 'interrupts' and 'interrupts-parent' properties, which have
> been superseded by the interrupts-extended property. While touching this,
> fix the interrupts flags to correctly describe the hardware.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4210-trats.dts | 5 ++---

Thanks, applied.

Best regards,
Krzysztof

