Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D20A20ACD4
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 26 Jun 2020 09:14:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727872AbgFZHOE (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 26 Jun 2020 03:14:04 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:45967 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725801AbgFZHOE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 26 Jun 2020 03:14:04 -0400
Received: by mail-ed1-f66.google.com with SMTP id t21so6102388edr.12;
        Fri, 26 Jun 2020 00:14:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mY7VEfODaBnUoEDtRuN2imom2lqWT0mgrtCNgvYDPlg=;
        b=Ieb7tcMX9NyjY/WbChSlqDwXW6F6fMlFOfMu83bdvj4c58dJxdwRmTaYS0Scwwanhi
         ZI4a8Dea3gXmZH5G5aLBIUFiA2Pzx9nV0yJDxbsPgx8S7UpEFOg3yWTuIPJa8fj0Pm52
         bi1fLEAcTbE8a9e213vvISY8iVeOYlBZ2firivLWXD8JJYk4yqkdavA13WyqW4X1vmAC
         j83abanZcw4Vtr248dyg92sNWRnjZ0dIhXZb9AXZ1jxmDyfh4ushVefXaNULdtsIHrnt
         W4zFZ8BmvGAJxXJfnX/BUKy4HLgMDmttcNPaJ/OG10yKtX5hFNOFiBXo0FfU/hpY6MBL
         HsHw==
X-Gm-Message-State: AOAM532sOvQeaB2+GHzDnGMWsfFlyKvExAGgENqgTRiRX6z/GPMrxymT
        tcx7j+cp6QomWV5NxulbKGY=
X-Google-Smtp-Source: ABdhPJwJpYjs1Lf68FS3bJS9+zTJCoFqIRpfWbDWbaYZCQdywsTpWpC9C/RZoXXzptOMgeeyNs1a+w==
X-Received: by 2002:a50:eb06:: with SMTP id y6mr1918299edp.143.1593155642211;
        Fri, 26 Jun 2020 00:14:02 -0700 (PDT)
Received: from kozik-lap ([194.230.155.235])
        by smtp.googlemail.com with ESMTPSA id f1sm19998832edn.66.2020.06.26.00.14.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jun 2020 00:14:01 -0700 (PDT)
Date:   Fri, 26 Jun 2020 09:13:58 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Anand Moon <linux.amoon@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos: Fix L2 cache-controller nodename
Message-ID: <20200626071358.GA21250@kozik-lap>
References: <20200624110435.1150-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200624110435.1150-1-linux.amoon@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Jun 24, 2020 at 11:04:35AM +0000, Anand Moon wrote:
> Fix warning message by changing nodename to 'cache-controller'.
> 
> make ARCH=arm dtbs_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/arm/l2c2x0.yaml
> arch/arm/boot/dts/exynos4210-i9100.dt.yaml: l2-cache-controller@10502000:
> 	$nodename:0: 'l2-cache-controller@10502000' does not match '
> 	^(cache-controller|cpu)(@[0-9a-f,]+)*$'
> arch/arm/boot/dts/exynos4412-i9300.dt.yaml: l2-cache-controller@10502000:
>         $nodename:0: 'l2-cache-controller@10502000' does not match '
>         ^(cache-controller|cpu)(@[0-9a-f,]+)*$'
> 
> Fixes: 56b60b8bce4a ("ARM: 8265/1: dts: exynos4: Add nodes for L2 cache controller")

It is just naming convention introduced with dtschema so there is no
error to fix.  Applied with modified commit msg.

Best regards,
Krzysztof

