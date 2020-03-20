Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDE7518CA93
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 20 Mar 2020 10:43:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbgCTJnp (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 20 Mar 2020 05:43:45 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:46308 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726602AbgCTJno (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Mar 2020 05:43:44 -0400
Received: by mail-ed1-f65.google.com with SMTP id ca19so6332829edb.13;
        Fri, 20 Mar 2020 02:43:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Mk3s5g9LU/2LF49QpiOVlm1YQB1p4hRZiB2SBGyS1Rg=;
        b=Pbgfx54PPi9NoEhsX4ycbEiDT1W+9FwFAFEZdXPWVtB0Z6RH1uO2sK29izWPzzQHS5
         AnZ93H6Yn9Hc4pv/8qrlKDEEgGRdOZyzzdrSSnT8oZy1pErYJPsUNdGQIfclD1uMaDtm
         DGcAZXkUo+J1TqsZfMlYYtvULRvyu1/f8TFFYWc1r6stt4qRDA6GHHhiZE0cxL8WP9vu
         /BEgEkwYUB7yv1hos18g9LD1ruATAYBOXIbBJiMoSLQptg+YTiKE9oPmf7Me4rSdX/of
         uc5FigKlJqxkx5ehHhOF5EndLO4hkzqE51nuUhKf/O/6O7URSoxSxC6cecOmf80P9OEI
         7aIg==
X-Gm-Message-State: ANhLgQ0KbgVbFbpEzCQXo0g+gUE4SJ1nSk9pSLCifu3RT5dQ2pqwX/An
        iRQ8L8EP89xImKHtGNxtTzU=
X-Google-Smtp-Source: ADFU+vvfbrYk4IAPU07kklFqUnr/Dobh6VAeD25kkWfv6Ll1pmLkppDs5xtDBx4Uf6lrXVFxzavLJg==
X-Received: by 2002:a50:f743:: with SMTP id j3mr6992962edn.22.1584697422721;
        Fri, 20 Mar 2020 02:43:42 -0700 (PDT)
Received: from kozik-lap ([194.230.155.125])
        by smtp.googlemail.com with ESMTPSA id b26sm316874eje.18.2020.03.20.02.43.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Mar 2020 02:43:42 -0700 (PDT)
Date:   Fri, 20 Mar 2020 10:43:39 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Kukjin Kim <kgene@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stenkin Evgeniy <stenkinevgeniy@gmail.com>,
        Jonas Heinrich <onny@project-insanity.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] ARM: DTS: Add devicetree file for the Galaxy S2
Message-ID: <20200320094339.GB12976@kozik-lap>
References: <20200319173411.20607-1-paul@crapouillou.net>
 <20200319173411.20607-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200319173411.20607-2-paul@crapouillou.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Mar 19, 2020 at 06:34:11PM +0100, Paul Cercueil wrote:
> From: Stenkin Evgeniy <stenkinevgeniy@gmail.com>
> 
> Add devicetree file for the Exynos 4210 based Galaxy S2 (i9100 version).
> 
> Signed-off-by: Stenkin Evgeniy <stenkinevgeniy@gmail.com>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Notes:
>     v2: - Change i9100 to GT-I9100
>         - Remove redundant description in header
>     	- Add chosen node with stdout-path
>     	- Rename regulator nodes since there was no regulator-2
>     	- Rename i2c-gpio-3 to i2c-gpio
>     	- Use IRQ_TYPE_EDGE_FALLING instead of hardcoded '2'
>         - Remove spi-cpol, spi-cpha as they glitch the LCD panel
>     	- Make CS gpio active-low
>     	- Update ehci node to add 'phys' instead of ports
>     	- Remove duplicated ehci node
>     	- Reorder nodes to appear in alphabetical order
>     	- Remove useless newlines
>     	- Remove regulator provided to touchscreen node since it does not expect any
>     
>     v3: - Change CPU regulator name to VARM_1.2V_C210 as in the datasheet
>         - Remove unused gpios for the max8997 pmic
>         - Remove redundant interrupts/interrupt-parent for max8997 pmic
> 
>  arch/arm/boot/dts/Makefile             |   1 +
>  arch/arm/boot/dts/exynos4210-i9100.dts | 768 +++++++++++++++++++++++++
>  2 files changed, 769 insertions(+)

Thanks, applied to dt-late. I already sent a pull request so this might
need to wait till next cycle. In such case I will carry this over merge
window.

Best regards,
Krzysztof

