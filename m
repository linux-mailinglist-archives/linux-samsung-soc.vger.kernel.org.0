Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90376473BB
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 16 Jun 2019 10:16:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbfFPIQC (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 16 Jun 2019 04:16:02 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38611 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbfFPIQC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 16 Jun 2019 04:16:02 -0400
Received: by mail-wr1-f66.google.com with SMTP id d18so6634371wrs.5;
        Sun, 16 Jun 2019 01:16:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=01Gsa3Id8CMAcrAm2eou8d6m+tKtF0p1DTjOg5KEKlc=;
        b=Syaie4cpCwCBuHUvYJ6GEywssGYuQmA0eCTRo49sjPzP1s1F4rIXyXytsMbOU6Rgjw
         vzVyShorQcGhbzM7zqJX+xy4K10FSO7oVVpA3RESokXigy4ogrFeCGF5Sx7lNBgfX1Jh
         Y7lGmezGP7fZx5huK+60gZYoOYiVmxPIXaAxAgl2QTZbKRPw4Ng6lXOFEV4L3sS16Wxv
         3c5W5hCn9mmiykre64VWLAD84MrACfgU0pdY0h1qlMOnpigK9dCMyZHdSs6AyUlD3qQE
         SiYvsqQUv9KM9JdcVyeXQl+jYSX0CsaxElx5ype/3pVA5mp9tw+Ww5qSh24ugOQYy9as
         4R7g==
X-Gm-Message-State: APjAAAVE1ax5pSJTGE/49VY/p9Y0uiSqvajQ7tQqfX7ZPufZPR5fwGcT
        TbdaiaQOpGGM8uKpHotZ0kk=
X-Google-Smtp-Source: APXvYqxATaOreJ64gZqKr1ZADSyl6aWSJgWFB9oHlNrQXSSjWVT8raTQwwJaAcjxe+B8VCxFKoLukw==
X-Received: by 2002:a05:6000:112:: with SMTP id o18mr5271656wrx.153.1560672960065;
        Sun, 16 Jun 2019 01:16:00 -0700 (PDT)
Received: from kozik-lap ([194.230.155.186])
        by smtp.googlemail.com with ESMTPSA id z5sm6781677wrh.16.2019.06.16.01.15.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Jun 2019 01:15:59 -0700 (PDT)
Date:   Sun, 16 Jun 2019 10:15:57 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Joseph Kogut <joseph.kogut@gmail.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, kgene@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: gpu: add Exynos Mali vendor specifics
Message-ID: <20190616081557.GA3826@kozik-lap>
References: <20190614203144.3850-1-joseph.kogut@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190614203144.3850-1-joseph.kogut@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Jun 14, 2019 at 01:31:43PM -0700, Joseph Kogut wrote:
> Document vendor specific compatible string for Mali gpus on Exynos SoCs.
> 
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
> index 1b1a74129141..a9704c736d07 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
> @@ -18,6 +18,7 @@ Required properties:
>      + "amlogic,meson-gxm-mali"
>      + "rockchip,rk3288-mali"
>      + "rockchip,rk3399-mali"
> +    + "samsung,exynos-mali"

Are there any driver differences for Exynos? If not then why adding
another compatible?

Best regards,
Krzysztof

>  
>  - reg : Physical base address of the device and length of the register area.
>  
> -- 
> 2.22.0
> 
