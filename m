Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87559C361A
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  1 Oct 2019 15:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388343AbfJANnx (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 1 Oct 2019 09:43:53 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:42450 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726710AbfJANnx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 1 Oct 2019 09:43:53 -0400
Received: by mail-oi1-f195.google.com with SMTP id i185so14389423oif.9;
        Tue, 01 Oct 2019 06:43:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/yW/ATB8FIjR5Cn9PtmrhJch8B9sWOBgNXx/ALh7kW4=;
        b=E18fH9sa/0gktENzebkANfCYZJZ5A3qaITl2rgtVnwwkwGFmt3/Y24ExDlVO+JOnas
         /F89GL0RIaZTkvurgZPleIS5l317Jejxg7QcCuyMQ9T8B55VTjNR55itDgGnbf4njSBt
         e8JsvR4SEHwXmSXd0b1MaomnjbqnZg/1kzk7vpUjwFV8Vnf2UcelcOjsZdWWVI11L9O2
         VjuLVaIwbaqzu0aeiKFPMKNr6Jj4dRc8iG8pMtJBqUbmC+lNSVtotWG7VYdI5sYBdOgW
         54uxCkJiwLW1iQSToUegw5pQWJ71tOZ2iP6SvWSrKw6CdXqwLLnphN1xT7I64Ar/TBnd
         GZOg==
X-Gm-Message-State: APjAAAUp7Z2AqAR+2XnRaaZfotsK9Y8NjMXfGQkUkDolIF6Q/ODkSW7t
        i+LSPtRI1OO6vbko6ZrRZEwqqf7djw==
X-Google-Smtp-Source: APXvYqxH2El57SgxyxkgxKtPK7pxEqgYVY65LB7/f68E0xMJaKaZcvMhKHFXAxY2wZestrQ0pvaG5g==
X-Received: by 2002:aca:5186:: with SMTP id f128mr3881842oib.107.1569937432345;
        Tue, 01 Oct 2019 06:43:52 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f12sm4950926oij.1.2019.10.01.06.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 06:43:51 -0700 (PDT)
Date:   Tue, 1 Oct 2019 08:43:51 -0500
From:   Rob Herring <robh@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Maciej Falkowski <m.falkowski@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v3] dt-bindings: gpu: Convert Samsung Image Scaler to
  dt-schema
Message-ID: <20191001134351.GA21744@bogus>
References: <CGME20190927143314eucas1p2d419866cd740207426cd37cb6fdff468@eucas1p2.samsung.com>
 <20190927143306.12133-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190927143306.12133-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 27 Sep 2019 16:33:06 +0200, Marek Szyprowski wrote:
> From: Maciej Falkowski <m.falkowski@samsung.com>
> 
> Convert Samsung Image Scaler to newer dt-schema format.
> 
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> v3:
> - Fixed description of 'clocks' property:
> rather than 'mscl clock', 'pclk clock'
> - Added empty line within if-else statement
> - Added 'additionalProperties: false'
> - Listed all missing 'properties' in properties scope
> 
> Best regards,
> Maciej Falkowski
> ---
>  .../bindings/gpu/samsung-scaler.txt           | 27 -------
>  .../bindings/gpu/samsung-scaler.yaml          | 81 +++++++++++++++++++
>  2 files changed, 81 insertions(+), 27 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpu/samsung-scaler.txt
>  create mode 100644 Documentation/devicetree/bindings/gpu/samsung-scaler.yaml
> 

Applied, thanks.

Rob
