Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72F3125AF98
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  2 Sep 2020 17:42:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728337AbgIBPls (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 2 Sep 2020 11:41:48 -0400
Received: from mail-ej1-f66.google.com ([209.85.218.66]:34109 "EHLO
        mail-ej1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728382AbgIBPlc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Sep 2020 11:41:32 -0400
Received: by mail-ej1-f66.google.com with SMTP id d26so7356155ejr.1;
        Wed, 02 Sep 2020 08:41:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1xXVqQjAqOVPgtcZl42fAfsWErSM00VQqzmCqs7NOo8=;
        b=Ienxv3l5c+79q9Grjy+DlYD4zgcLd19XznMDxSMK3MOr+bXWnXKCvNhWSUgwSeHCwA
         N28L6AaUbf3HBnhBO724XpFoGfYMC9R0/ssDMbn7M6DAJcwa3ctw3NOxVxX+bHG28oRI
         JsAQ+GusHKkRhMa0hrex1iw9pq7dRzDxEohl8DSLzjAae5i6LqMyUCV1w7KFsOETFQnk
         Mxr7ItofMVQ15EuJXwYlEgxOnDIj0xffAeEEMG6N2Zp+LF0OtlF4cFES3bXtMBkbPi3s
         avVq4ETFeOxndDnQudArEIEvpPUINTPTNWSxz+HoUWX8uOxzUJSA/3mo37j4gvw0Mx/c
         OEJg==
X-Gm-Message-State: AOAM531zWAAp87UgXz75CHNd5VqTFGxGAzkn97aC48JEaRG0AIQvJQEy
        cl0SFxVW/hMaqi5w9lTtv8c=
X-Google-Smtp-Source: ABdhPJzMvJ052zqv6VUIRhYkxSS7d2AEeVKY+RQ81YHfSyreeVsyWOLXRDdmR1rNQ0vOFdNaAwLaRw==
X-Received: by 2002:a17:906:52c2:: with SMTP id w2mr590678ejn.389.1599061290243;
        Wed, 02 Sep 2020 08:41:30 -0700 (PDT)
Received: from kozik-lap ([194.230.155.106])
        by smtp.googlemail.com with ESMTPSA id w7sm4726747ejy.4.2020.09.02.08.41.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Sep 2020 08:41:29 -0700 (PDT)
Date:   Wed, 2 Sep 2020 17:41:26 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Denis GNUtoo Carikli <GNUtoo@cyberdimension.org>,
        Simon Shields <simon@lineageos.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: Re: [PATCH 08/33] ARM: dts: exynos: Add and enable 32 kHz modem
 clock in Galaxy I9100
Message-ID: <20200902154126.GC21503@kozik-lap>
References: <20200830135200.24304-1-krzk@kernel.org>
 <20200830135200.24304-8-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200830135200.24304-8-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, Aug 30, 2020 at 03:51:35PM +0200, Krzysztof Kozlowski wrote:
> The PMIC has a 32768 Hz clock used by the modem which is implemented by
> driver as a regulator.  Add and enable it to be sure modem get's its
> signal.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/boot/dts/exynos4210-i9100.dts | 5 +++++
>  1 file changed, 5 insertions(+)

Applied all 1-8. Skipping 9th patch.

Best regards,
Krzysztof
