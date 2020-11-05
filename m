Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C58742A86CE
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  5 Nov 2020 20:10:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726996AbgKETKh (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 5 Nov 2020 14:10:37 -0500
Received: from mail-ej1-f66.google.com ([209.85.218.66]:43447 "EHLO
        mail-ej1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726729AbgKETKh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Nov 2020 14:10:37 -0500
Received: by mail-ej1-f66.google.com with SMTP id k3so4177346ejj.10
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Nov 2020 11:10:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tRibzqo8gfNOajO4BFJen/9TV3o7aVc+XOv+V22phtQ=;
        b=TJFCrDkg1cm3yHc/E70QF125tZ9EpszkUGqjDfytxPLoRAJd+avXMU0cONcoCgnHNu
         aWsjiY6xv2yH15D2QIajOwRf7HnfHBApq/zD0BbdI4gK0o6BxT9s3oSXBnrlDE6atClT
         EprDWSGTDtkHOFO9ycBZqVN7iPL2uzXygt2iyeaqu/jwJ2zHY1EkeMmg1xBQMM6VgDyT
         QvBIXfdCUsp5wimt784wo3LBCjp5PW12pm46VxT5gk1zUC243pRZXKv5BDStxAqoz4V+
         EHwdaWhjRccjXh+eNlE7Kpfsp+ezLYv3P2aN9nzkgEe2wqXxVqaRzdLvBILNA+q9f4Uk
         zbog==
X-Gm-Message-State: AOAM530+FykuX6rGZeOuFzTgFB7PUUIOKVXtFkhRMsaDFczPs6rHt4F6
        mAeqet+q/1d7co2HrfRgHjM+N/bws09Hfg==
X-Google-Smtp-Source: ABdhPJxsNU4eRZzlR2xpZHicpssES24UtJafOyj7LtHyJDV/XxBthcJtWB2qql23e2/NmaHk0WIfVw==
X-Received: by 2002:a17:906:7805:: with SMTP id u5mr3941111ejm.379.1604603434915;
        Thu, 05 Nov 2020 11:10:34 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id f24sm1472165edx.90.2020.11.05.11.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 11:10:33 -0800 (PST)
Date:   Thu, 5 Nov 2020 20:10:32 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos: Enable DWC2 dual-role support on
 OdroidU3+ boards
Message-ID: <20201105191032.GA226037@kozik-lap>
References: <CGME20201103140221eucas1p1c4479a8a89e7e9a05c7582462d79e5c7@eucas1p1.samsung.com>
 <20201103140214.21690-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201103140214.21690-1-m.szyprowski@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Nov 03, 2020 at 03:02:14PM +0100, Marek Szyprowski wrote:
> MicroUSB port on OdroidU3+ boards can operate both as peripheral or as
> host port. Till now it was configured as pheriperal only port, but it
> turned out that the DWC2 driver code already handles everything needed to
> support USB role-switch, so switch it to dual-role (OTG) mode. This has
> no effect on OdroidU3 (with 'plus') and OdroidX2, which doesn't have USB
> needed ID pin and VBUS wiring. Those will still operate correctly in
> pheriperal mode only.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi |  1 -
>  arch/arm/boot/dts/exynos4412-odroidu3.dts       | 14 ++++++++++++++
>  arch/arm/boot/dts/exynos4412-odroidx.dts        |  4 ++++

Thanks, applied with corrected 'without', Anand's tag and node named
just "regulator-1" (X has one and it is more generic).

Best regards,
Krzysztof

