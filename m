Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FA1FD3093
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 10 Oct 2019 20:41:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbfJJSlF (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 10 Oct 2019 14:41:05 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:43864 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726489AbfJJSlE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Oct 2019 14:41:04 -0400
Received: by mail-oi1-f194.google.com with SMTP id t84so5808880oih.10;
        Thu, 10 Oct 2019 11:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XmWVPPP865LCrxGXKVMx+awlUtO1lgx35IM/Tkg3d/4=;
        b=eoT/bWUPn7NoTvOY/2jwtFZD/F5hKCCwpQowzBZCD+kN2ufrKaiu7XfmBv2agV0KL1
         C++LYgthWufWKOps4h65S12q2lCF2Tn956VkR1E/rgNc0TsrXHtZy/XMJ7Hii1RtpPte
         NMXH8XomxbnmmTAZpHKS2F1ftlEhfgnVzBNFH5E/LsuFWBDj/5RZzeAILaMlPm/vK4qv
         WCRMB8JrFjd2pyoyCkKXEuHNXFIiIUCUoaiaask7auM5Dste3kx+Dcv737K5rFJZy3IE
         GJJgvGy+Lh1PPkFM+OaryqrRqOgwuUMYikpjkJK+8ZQLVtPVvJTJA9emW2AiovSm9V3C
         FzGw==
X-Gm-Message-State: APjAAAUWjrtc70KWnzGv1HGzD3aNyA/27LxtqNEQk1wOtVa3glFxef2e
        LYgJp5GYlICUpX2HPA60tw==
X-Google-Smtp-Source: APXvYqyhnaWIZALC+KGjjdwYuY6XqSa0t4X1o/I5FP/w0EG3/e1rUV3ELAxXyTApAAYjD9jmtuIQiQ==
X-Received: by 2002:aca:a9ca:: with SMTP id s193mr9116907oie.85.1570732863751;
        Thu, 10 Oct 2019 11:41:03 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t10sm1836170oib.49.2019.10.10.11.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 11:41:02 -0700 (PDT)
Date:   Thu, 10 Oct 2019 13:41:02 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: rng: exynos4-rng: Convert Exynos PRNG
 bindings to json-schema
Message-ID: <20191010184102.GA16673@bogus>
References: <20191002161340.11846-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191002161340.11846-1-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed,  2 Oct 2019 18:13:40 +0200, Krzysztof Kozlowski wrote:
> Convert Samsung Exynos Pseudo Random Number Generator bindings to DT
> schema format using json-schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v2:
> 1. Add additionalProperties false,
> 2. Include clock header and use defines instead of clock numbers.
> 
> Changes since v1:
> 1. Indent example with four spaces (more readable).
> ---
>  .../bindings/rng/samsung,exynos4-rng.txt      | 19 --------
>  .../bindings/rng/samsung,exynos4-rng.yaml     | 45 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 46 insertions(+), 20 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rng/samsung,exynos4-rng.txt
>  create mode 100644 Documentation/devicetree/bindings/rng/samsung,exynos4-rng.yaml
> 

Applied, thanks.

Rob
