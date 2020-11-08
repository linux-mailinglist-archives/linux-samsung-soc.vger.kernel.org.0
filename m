Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E81472AAD19
	for <lists+linux-samsung-soc@lfdr.de>; Sun,  8 Nov 2020 20:01:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728820AbgKHTBT convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 8 Nov 2020 14:01:19 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:37617 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727570AbgKHTBS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 8 Nov 2020 14:01:18 -0500
Received: by mail-ed1-f66.google.com with SMTP id cq7so6257351edb.4;
        Sun, 08 Nov 2020 11:01:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=rf8SABzfQsJaazgSJTAJXSY+0MhV6XCRywYCezqPpp0=;
        b=iyc/EVI4plMjuyT0zPqSnQ0SupGtdBn98h8em8cI+Jj812cZUZyc6pORBawFSFk8nU
         6Mx6BEjYUvGXCh5bYYw/ScHmbNu64NIgPp4HTrGZC83SZtPZHQ1jAoHMi2vmhAcNH4e6
         MaPYs/l3BjG9g3qCxIKz+1EBV/IyxpLQtC/zcr+Ss33/0uBPZSIKpb3uOAPAGQKPbny+
         0FyAK4Nk/T6NMKrttSwRsh7LGXHJtLksh75sYly/u7qvFK8m7uIPZgX2biIfu1NZag1Y
         gzE4wBYu2eC0vUPqArtNsgAXkPCv6pA1Ue0jN7k0NYHtkP4mnJJejK8wu9M71+qSJPPO
         /kQA==
X-Gm-Message-State: AOAM530rD+ETTg6JmPIpb3SzlViKO2wWAueJEn04lMdywQIaQbuJJIAO
        cBUt70TM00ApRLyvZGys2NI=
X-Google-Smtp-Source: ABdhPJxsxh4jH9DO3X7CbBQQCXH23LJIvCVclMB3yisqew2iZYDINpjQ+6K5/JMVT2WYrqTku0Q8RQ==
X-Received: by 2002:a50:ed96:: with SMTP id h22mr11507251edr.336.1604862077263;
        Sun, 08 Nov 2020 11:01:17 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id r20sm5787660edq.6.2020.11.08.11.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 11:01:16 -0800 (PST)
Date:   Sun, 8 Nov 2020 20:01:14 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Cc:     kgene@kernel.org, alim.akhtar@samsung.com, robh+dt@kernel.org,
        a.kesavan@samsung.com, naveenkrishna.ch@gmail.com,
        thomas.ab@samsung.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: exynos: Correct psci compatible used
 on Exynos7
Message-ID: <20201108190114.GB28948@kozik-lap>
References: <20201107133926.37187-1-pawel.mikolaj.chmiel@gmail.com>
 <20201107133926.37187-2-pawel.mikolaj.chmiel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20201107133926.37187-2-pawel.mikolaj.chmiel@gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, Nov 07, 2020 at 02:39:26PM +0100, Paweł Chmiel wrote:
> It's not possible to reboot or poweroff Exynos7420 using PSCI. Instead
> we need to use syscon reboot/poweroff drivers, like it's done for other
> Exynos SoCs. This was confirmed by checking vendor source and testing it
> on Samsung Galaxy S6 device based on this SoC.
> 
> To be able to use custom restart/poweroff handlers instead of PSCI
> functions, we need to correct psci compatible. This also requires us to
> provide function ids for CPU_ON and CPU_OFF.
> 
> Fixes: fb026cb65247 ("arm64: dts: Add reboot node for exynos7")
> Fixes: b9024cbc937d ("arm64: dts: Add initial device tree support for exynos7")
> Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
> ---
> Changes from v1:
>   - Split into two separate patches.
> ---
>  arch/arm64/boot/dts/exynos/exynos7.dtsi | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Thanks, applied.

Best regards,
Krzysztof

