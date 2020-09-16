Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A640A26C643
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 16 Sep 2020 19:41:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727349AbgIPRlT (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 16 Sep 2020 13:41:19 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36724 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727346AbgIPRlH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Sep 2020 13:41:07 -0400
Received: by mail-lf1-f65.google.com with SMTP id x69so7905881lff.3;
        Wed, 16 Sep 2020 10:41:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7K53KnV3RB0dBmHomdKTRhU0IiLbQ4+LVNa0ye9IqpI=;
        b=XO0jE2YWluxGLF1NkWeNI5+guceqtHhyq2y8vSqFOHO6wPOmi8GNrHdH4Ia14eDIiX
         NTAo0sQt66iT/hOhjwGV4EvNUMYy6CTGAi+6V9EuOw4tWA4aJpIRGVa13u4sHtgV3o3y
         mJmxBJ0RQGnQ18Iwk72z5wkooPM0qQizoXbDWGM6jgB9J0b5WgC6cgjKGb2Pvw349DcB
         gdvwB63FDpUgEsREmvK9PIVc75ImXto1WZGEFN+0rINhA2vECBH0YZgdbVaHOv09Qe/K
         xJeO0DETnXqlVnd7MceBDZ6W2Nj/h5qWjCkaCvErVMalawjDf4nATXUSR13MQ6hB47Tt
         Hcpw==
X-Gm-Message-State: AOAM533/LQ7ONQ6ZFTILxEObzINjk31zJyxwjHssqc46Ke6/1QWyyIhB
        5L8iz3PpnU5ckQDHxe22+QK82kaIrAMuN+vF
X-Google-Smtp-Source: ABdhPJxBtful0Z+qE+L5pXwSxbO+yea+lOU0v+qNQxTnSCG1x8dx7LmcGHJsv0G0v/GE5JcpanqZ4A==
X-Received: by 2002:adf:f084:: with SMTP id n4mr4551624wro.26.1600276345057;
        Wed, 16 Sep 2020 10:12:25 -0700 (PDT)
Received: from kozik-lap ([194.230.155.191])
        by smtp.googlemail.com with ESMTPSA id n11sm34074076wrx.91.2020.09.16.10.12.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Sep 2020 10:12:24 -0700 (PDT)
Date:   Wed, 16 Sep 2020 19:12:21 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Inki Dae <inki.dae@samsung.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 5/6] ARM: dts: exynos: Align OPP table name with
 dt-schema
Message-ID: <20200916171221.GC19427@kozik-lap>
References: <20200903191438.12781-1-krzk@kernel.org>
 <20200903191438.12781-5-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200903191438.12781-5-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Sep 03, 2020 at 09:14:37PM +0200, Krzysztof Kozlowski wrote:
> Device tree nodes should have hyphens instead of underscores.  This is
> also expected by the bindings.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. New patch
> ---
>  arch/arm/boot/dts/exynos4412.dtsi | 16 ++++++++--------
>  arch/arm/boot/dts/exynos5250.dtsi |  2 +-
>  2 files changed, 9 insertions(+), 9 deletions(-)

Applied.

Best regards,
Krzysztof

