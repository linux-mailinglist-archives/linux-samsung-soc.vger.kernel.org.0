Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ACDE46F9AF
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 10 Dec 2021 04:53:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236485AbhLJD4m (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 9 Dec 2021 22:56:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236458AbhLJD4m (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Dec 2021 22:56:42 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51584C061746
        for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Dec 2021 19:53:08 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id j5-20020a17090a318500b001a6c749e697so7338391pjb.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Dec 2021 19:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BzSbfZd4JQBrY56BTZ7Ukbk+6z7XGMbbqjBNLXp9q7o=;
        b=UHFsxs1Qanuf6rGkoZ0V/xVRoh9AFiGYUrAsN32lvoaESAlJj78UgYYPbF5vdPL3Bk
         KtVW3YtfGpkBjSpoksdlvQYscYisY6IH/di0J/uQNG3BDGvnY/m8LmuvoBEEFBk/YnIF
         2Tq8LeJWpft5cpTDPJAesyQkERwlynZMDPxlSNUqiTEZgZoCOb5zP54GlSVYZQsZ87dj
         +Sso4/pGzUoeBcWwqToiUeYbiB53AR0hds3lrl1kltJd8c0bqkINPVLqRStgt5o5gC+C
         TzHDzuBGuAZSQY8WYOF67DQc8b2dvJY6XBQVLxc2Xmrn+Qdz7QU87vY3MKifOuGrKs4+
         fN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BzSbfZd4JQBrY56BTZ7Ukbk+6z7XGMbbqjBNLXp9q7o=;
        b=xlkM3KLPx0lmRrCP6XXhIGXsiWOyis0zp7JcJW7TQDhpEspdbrYdcTX8rf1qAvrX+Y
         Q9B71Sf2SmIggGmRtt8MH4TC8jvJw7obxrgg98W0BTywFFZXT2R66s1BhHU5YpDXVAmZ
         fWXr7Yf3E+jHjjZObZDmFcJW6imyJGaQGXsG6XgrJ1ZGkKdbUJvT78gLnARCW4Iynf9j
         YSckrCw/KF7IHYO6QozNKZq11fa+f5+lX0l/sB2c8pSaxyh3PMcZNWjNh46ph0x1vOVH
         YJF6bd+689LXkShER/EzuJdOfBOQiz6sEwhrlvnhrnSc3JSJev8ncGl1UvBwNfVeDdKG
         SVBw==
X-Gm-Message-State: AOAM532JewTOvU8nDnQnjVLnGGawVvjJbKWZNRT03/JEVWRjJLHpOBJ3
        xSXGGjPCKERLMRHqC7rqKjV64w==
X-Google-Smtp-Source: ABdhPJz1NGw0NPJFcUffa8z/0UBVpMhqf1ZVaIjsYAonkfNcQGbolrZHg/tdq7hiD4WTlFandL5Y1w==
X-Received: by 2002:a17:90b:11c1:: with SMTP id gv1mr20848816pjb.208.1639108387855;
        Thu, 09 Dec 2021 19:53:07 -0800 (PST)
Received: from localhost ([106.201.42.111])
        by smtp.gmail.com with ESMTPSA id p124sm1151703pfg.110.2021.12.09.19.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 19:53:07 -0800 (PST)
Date:   Fri, 10 Dec 2021 09:23:05 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Viresh Kumar <vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: Remove unsupported properties for STMPE MFD
Message-ID: <20211210035305.35hhxovruk5otqpg@vireshk-i7>
References: <20211209173009.618162-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211209173009.618162-1-thierry.reding@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 09-12-21, 18:30, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Some users of the STMPE MFD bindings use unsupported properties such as
> "id", "blocks" and "irq-trigger". These look like they may have been
> under discussion at some point but never made it into the bindings that
> were accepted upstream.
> 
> Remove these unknown properties from the device trees to avoid errors
> during validation against the DT schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm/boot/dts/spear1310-evb.dts        | 1 -
>  arch/arm/boot/dts/spear1340-evb.dts        | 2 --
>  arch/arm/boot/dts/spear320-hmi.dts         | 3 ---

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
