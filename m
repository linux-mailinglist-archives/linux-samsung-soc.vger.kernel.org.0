Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0000F255488
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 28 Aug 2020 08:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbgH1Gcc (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 28 Aug 2020 02:32:32 -0400
Received: from mail-ej1-f66.google.com ([209.85.218.66]:33659 "EHLO
        mail-ej1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725849AbgH1Gcc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 28 Aug 2020 02:32:32 -0400
Received: by mail-ej1-f66.google.com with SMTP id a21so81544ejp.0;
        Thu, 27 Aug 2020 23:32:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iJ6Jz3iSoebkwphXOK+PaTApY88wa2v9adyL9D4joAI=;
        b=VlZC1lTkgWmWLiZOEFUikdRKK1YgtkMrW+FMEV7L9il2uZ4y3hKwdC8MfIn+9L3I3B
         f4kqXeQLG9bla22AyLfKE+lLv6HRoa7HK7HF3WzpWpgXAP6e/uMj3nLZfdcBpFNh8dnR
         5lRB6WhAvjvw48fjQqWLV/LmzB7NDSmfuMLkQf75EGp2dDBjZybj97ptSj4yj5jTaj6O
         +h7pKRHTsC0zLWvQ+yl+kx8CCsmHhq1OJrm6bjP60n8T2hnvwWNWMHu1ZPUdS1HH5q5R
         v33nMcI90t5bJzxE0tLBX/Qr1XO9GvpK8BGY/1CYAyOGP0IIJBDoa/Kwzc8QjP3zDuPm
         GutQ==
X-Gm-Message-State: AOAM5308mwed2QRDHiMzc3CHbwkU6V768F393aLRuiI8qjYUqlblx+1Q
        vpr7PfRLCG1b3kP4DY/QtGHtDPW00XVKs0HX
X-Google-Smtp-Source: ABdhPJzl0qJn7ybQfapFfD4JkE3UKFatZaQGsEJmVNgsEi7UXwduBVsx4zJFgcla8Z5fo4Kh75OgMg==
X-Received: by 2002:a17:906:5f8f:: with SMTP id a15mr266055eju.291.1598596349754;
        Thu, 27 Aug 2020 23:32:29 -0700 (PDT)
Received: from pi3 ([194.230.155.216])
        by smtp.googlemail.com with ESMTPSA id i35sm149056edi.41.2020.08.27.23.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 23:32:29 -0700 (PDT)
Date:   Fri, 28 Aug 2020 08:32:26 +0200
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
Subject: Re: [PATCH 1/3] clk: samsung: Add clk ID definitions for the CPU
 parent clocks
Message-ID: <20200828063226.GA17406@pi3>
References: <CGME20200826171539eucas1p2e999972d3e7dd6dd701e312548933e87@eucas1p2.samsung.com>
 <20200826171529.23618-1-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200826171529.23618-1-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Aug 26, 2020 at 07:15:27PM +0200, Sylwester Nawrocki wrote:
> Add clock ID definitions for the CPU parent clocks for SoCs
> which don't have such definitions yet. This will allow us to
> reference the parent clocks directly by cached struct clk_hw
> pointers in the clock provider, rather than doing clk lookup
> by name.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  include/dt-bindings/clock/exynos5250.h | 4 +++-
>  include/dt-bindings/clock/exynos5420.h | 5 +++++
>  2 files changed, 8 insertions(+), 1 deletion(-)


Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
