Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31C50C0979
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 27 Sep 2019 18:20:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727355AbfI0QUR (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 27 Sep 2019 12:20:17 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:39481 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbfI0QUR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 27 Sep 2019 12:20:17 -0400
Received: by mail-ot1-f68.google.com with SMTP id s22so2725575otr.6;
        Fri, 27 Sep 2019 09:20:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=760YAN5d81LB7MtuI2rYTvWtV8lDfL9KiCZR922ntsw=;
        b=hxNTH2X1AW176CVPqmdDjUL6wmuk67a9//dymK0wQYu2kSQJGS188l3lhBO532sml3
         LdmRVdO6AJHPe87gDsQ/5txmSmO4kbi2XhQOUIs9w9x4F51JHmC8vBoJADfUVxS4hKmS
         fffIWSbNDMnbzcUccppbE3Icj1VEZ3eaeUXCHx+d0cCmm3tAukHbnr9L/kOSNXlcwAXw
         BBIEye9hpKsBnISvIkaSjH/6SG4hZewJuz5lHGf+bXgnkZGchbjsCGvFDhjY/spahlkZ
         ykMgF7rinH/gYx4OOZAtqYNRJeumbIO/XCDz8bA2ns3r10X9763XbTMClh8qJfrWLvmW
         wRfQ==
X-Gm-Message-State: APjAAAWBEQ4fAEdyKNCzm97OnGyzHPadwRSR/IV7Ab2xZPvTMxe2uqXU
        5VYSkTR0xW+L0Zggk5HRdQ==
X-Google-Smtp-Source: APXvYqzAy1747QiwwLmMBZO3T0x3QXlKZhH2mf7OuESKEqpnWXsCf1ZmSpDQzzG/OhyFoJ8khOxQXw==
X-Received: by 2002:a9d:4c8e:: with SMTP id m14mr2073130otf.170.1569601215954;
        Fri, 27 Sep 2019 09:20:15 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k3sm990748otn.38.2019.09.27.09.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2019 09:20:15 -0700 (PDT)
Date:   Fri, 27 Sep 2019 11:20:14 -0500
From:   Rob Herring <robh@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maciej Falkowski <m.falkowski@samsung.com>, krzk@kernel.org,
        mark.rutland@arm.com, robh@kernel.org, a.hajda@samsung.com,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v4] dt-bindings: iommu: Convert Samsung Exynos IOMMU H/W,
  System MMU to dt-schema
Message-ID: <20190927162014.GA2946@bogus>
References: <20190917192113.GA26604@bogus>
 <CGME20190919132002eucas1p19ceac65f49939be3152affb4d6a426a1@eucas1p1.samsung.com>
 <20190919131944.11007-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190919131944.11007-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 19 Sep 2019 15:19:44 +0200, Marek Szyprowski wrote:
> From: Maciej Falkowski <m.falkowski@samsung.com>
> 
> Convert Samsung Exynos IOMMU H/W, System Memory Management Unit
> to newer dt-schema format.
> 
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> v4:
> - Rename commit message to match common style
> - Remove '"pclk", "aclk"' option from clock-names property.
>   Some of bindings are incompatible with that and they will be fixed with
>   another patch.
> - Remove unneeded description of clock-names property.
> - Remove type description from power-domains property as it is
>   already a common property.
> - Rename node names to match generic names,
>   specifically: sysmmu -> iommu, gsc -> scaler
> 
> - Add include directive in examples to include
>   clock macros. This increases readability of the example
>   as clock macros do not have to be substituted with numerical values
>   which makes examples more self-explanatory and natural.
> 
> Best regards,
> Maciej Falkowski
> ---
>  .../bindings/iommu/samsung,sysmmu.txt         |  67 -----------
>  .../bindings/iommu/samsung,sysmmu.yaml        | 108 ++++++++++++++++++
>  2 files changed, 108 insertions(+), 67 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/iommu/samsung,sysmmu.txt
>  create mode 100644 Documentation/devicetree/bindings/iommu/samsung,sysmmu.yaml
> 

Applied, thanks.

Rob
