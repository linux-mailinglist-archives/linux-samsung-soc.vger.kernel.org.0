Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50C9F25AF72
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  2 Sep 2020 17:39:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727895AbgIBPjG (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 2 Sep 2020 11:39:06 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:44620 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728419AbgIBPjE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Sep 2020 11:39:04 -0400
Received: by mail-ed1-f68.google.com with SMTP id b12so5374991edz.11;
        Wed, 02 Sep 2020 08:39:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=f9RVe5a3WOs0Z8G5noGYlG05SPy10EgM9kuZ1XKP0v8=;
        b=l8Nag+P9r223wmyFr7qY8X+gw9l20G0BT44BgdIUfxEp7DzHrV4cco97OGvCxB2V4n
         SlK9FoakxZyC8iV/hqTGXoaIpQu82IQtisM7pAE9qFf/KDpjSnRokDQI/pM6SWFG7puY
         sZJvq9dzyqopW8gpe/rJYSRozGR8T1YhcIFGOQp20ze2khb5Pu0smdrNFjGizwILEjnM
         e7k6uKlvB2r7F6jby/PC8DeE9ulweHBzXRi0H6z80/A1yhmC8PZ8EVXjzVBTBFMEmJ7C
         fAQ+4AIUw6eZ04MK8QKvjNfV5G/B5aH23pYaaWReEjLvxWxP3iKv6fRbeX5LnxyShKjc
         ma8A==
X-Gm-Message-State: AOAM532a+/1hTroe6rXnhZCRUUFbwzCmXV1iqFpO/8WkBY+mASeGjxqx
        15MrDdObXKIUklFBozKpCWs=
X-Google-Smtp-Source: ABdhPJzKmSdWZbHw7WTs7nAsmR+RbtPdB69nq6cY5TRzrRXgEYKypAGDu5XWn+Um1XF7iPrL71nPNw==
X-Received: by 2002:a50:d2d1:: with SMTP id q17mr636013edg.167.1599061141702;
        Wed, 02 Sep 2020 08:39:01 -0700 (PDT)
Received: from kozik-lap ([194.230.155.106])
        by smtp.googlemail.com with ESMTPSA id w11sm4370550edx.81.2020.09.02.08.39.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Sep 2020 08:39:01 -0700 (PDT)
Date:   Wed, 2 Sep 2020 17:38:58 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Denis GNUtoo Carikli <GNUtoo@cyberdimension.org>,
        Simon Shields <simon@lineageos.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: Re: [PATCH 01/33] ARM: dts: exynos: Silence i2c-gpio dtschema
 warning in Galaxy I9100
Message-ID: <20200902153858.GB21503@kozik-lap>
References: <20200830135200.24304-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200830135200.24304-1-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, Aug 30, 2020 at 03:51:28PM +0200, Krzysztof Kozlowski wrote:
> The name of I2C controller over GPIO lines node ends with '-gpio' which
> confuses dtschema:
> 
>   /arch/arm/boot/dts/exynos4210-i9100.dt.yaml: /: i2c-gpio:
>     {'compatible': ['i2c-gpio'], ...  'maxim,over-volt': [[4500]]}} is not of type 'array'
>     From schema: lib/python3.6/site-packages/dtschema/schemas/gpio/gpio-consumer.yaml
> 
> Add a '-0' suffix to silence it.  This pattern on naming i2c-gpio is
> already present in many other dts.  No functional change.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/boot/dts/exynos4210-i9100.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied.

Best regards,
Krzysztof

