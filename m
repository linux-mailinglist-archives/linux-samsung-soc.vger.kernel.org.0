Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADEB025549E
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 28 Aug 2020 08:40:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725969AbgH1Gkv (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 28 Aug 2020 02:40:51 -0400
Received: from mail-ej1-f67.google.com ([209.85.218.67]:43184 "EHLO
        mail-ej1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbgH1Gkv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 28 Aug 2020 02:40:51 -0400
Received: by mail-ej1-f67.google.com with SMTP id m22so54395eje.10;
        Thu, 27 Aug 2020 23:40:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CdphvIxkab/YX1ffuXPnoifp6qWQpQf0APCtuuMP1Lw=;
        b=nX03C9yhufTPAh5mHQQQTIQwn16/VdoduYkKzR9PyE7danmJlLzUlWR4AI7yPYJKgv
         tTy49WHYMQ+okTnF4hohwB1+EuqGjF0aj5SMsThA3QYl5sEl9RWSICe6olHvGiMnCq8d
         CEvNgDOcoc1SI7RwCblu/vcF7T6Ll0HwkQET8vsrs+M+u5x7ahTfocl6+vKPd+KJJL0Z
         Uy6goLsBykTThMqC731YeXo4SwY4oVcmzLqDJQgqnBvY0/tG6ooV7IzjOH2ZaWS/73nb
         aZJHAFAzry3eGtzWCtspwAxDmgOz1BvihfiqwNK7yrDFTwTrk6L4LipnqySG4mBOIpWg
         wkfw==
X-Gm-Message-State: AOAM532Pp89juW6y8TBoi+An54BTV5KS1yT/vwUNQH5P4VcAYVUue0bP
        U8wYS5B71RGle1/qrKUjRUU=
X-Google-Smtp-Source: ABdhPJwTxtk1I8/HNlEgrbvBSVMeu1t34ItwkeBp44qDs/tNjiLPiQBZ1khYH/UgBI7CkJn7BP42qQ==
X-Received: by 2002:a17:906:970e:: with SMTP id k14mr291072ejx.417.1598596848763;
        Thu, 27 Aug 2020 23:40:48 -0700 (PDT)
Received: from pi3 ([194.230.155.216])
        by smtp.googlemail.com with ESMTPSA id 24sm162457edx.35.2020.08.27.23.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 23:40:48 -0700 (PDT)
Date:   Fri, 28 Aug 2020 08:40:45 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     linux-clk@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        m.szyprowski@samsung.com, b.zolnierkie@samsung.com
Subject: Re: [PATCH 3/3] clk: samsung: Use cached clk_hws instead of
 __clk_lookup() calls
Message-ID: <20200828064045.GC17406@pi3>
References: <20200826171529.23618-1-s.nawrocki@samsung.com>
 <CGME20200826171557eucas1p13c960ad6abc814cf53bc125f5c4d9b39@eucas1p1.samsung.com>
 <20200826171529.23618-3-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200826171529.23618-3-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Aug 26, 2020 at 07:15:29PM +0200, Sylwester Nawrocki wrote:
> For the CPU clock registration two parent clocks are required, these
> are now being passed as struct clk_hw pointers, rather than by the
> global scope names. That allows us to avoid  __clk_lookup() calls
> and simplifies a bit the CPU clock registration function.
> While at it drop unneeded extern keyword in the function declaration.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  drivers/clk/samsung/clk-cpu.c        | 37 +++++++++++++++---------------------
>  drivers/clk/samsung/clk-cpu.h        |  6 +++---
>  drivers/clk/samsung/clk-exynos3250.c |  6 ++++--
>  drivers/clk/samsung/clk-exynos4.c    |  7 +++++--
>  drivers/clk/samsung/clk-exynos5250.c |  4 +++-
>  drivers/clk/samsung/clk-exynos5420.c |  6 +++---
>  drivers/clk/samsung/clk-exynos5433.c | 10 ++++++++--
>  7 files changed, 41 insertions(+), 35 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
