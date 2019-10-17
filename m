Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF80DA5B7
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 17 Oct 2019 08:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406913AbfJQGnC (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 17 Oct 2019 02:43:02 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38216 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726891AbfJQGnC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 17 Oct 2019 02:43:02 -0400
Received: by mail-pf1-f193.google.com with SMTP id h195so978491pfe.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Oct 2019 23:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=v1tsE/i22fykGeq4lfZ46USRZ236n/tqtjmeKNn1XGw=;
        b=B8sekKbZBmry7+sPAy9q+xCmQ6T0Z7VUGC5wIGJnLggtOWKj7ZZDni9IeYm2gtextx
         ukuKpDtv3M1hCZMSWYPXTz2Et8wjkOq2y2Tk06Uazd3src3zT51nBeNYFHwoot6QNaeE
         Pn9JzFI31+vZzBBGZJZmeBTNH+Auu/4Vq8rzLb7URIZnH0wnyp5BkKlTtlNTP5wLMwvC
         fObndpRt2n20mfUGLtSIdMoNCzzmhN7kzUo0O6S9cbXxNosRajdtjzlHUEECP0OACP3G
         0IqVWEg5pE8Cl81gMff6IzlQXycwa5Vwx/iJ0R8LeHp2SCij4zgNqjWHHZ4fsV2YtiKT
         TKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=v1tsE/i22fykGeq4lfZ46USRZ236n/tqtjmeKNn1XGw=;
        b=dGaPqj9yfeqizPUR1azsDPYnNX/m0g7mqzyB4+1YTL7Agv0dYwSwR7D8uNtW6L1Ghk
         NGr8BGLcgYuSO1TTL2LK4BIDtEXTKtlwuTe+AOhDGh3VeDu1aVgnLFn4VqSHIzinctrD
         SKHq2IvIZqaSY4RqOlMCJFKQFBRkx6sxSbp44ihDKL/DSf48lPMH1g5Qz+Xh/uOxp76a
         3RquFUU3YN+UbG0T3shP5Xulxw0Ik3ZzQo8ym2C5T6CCTO4757eftFnK+Z77VKD/hl9s
         xK0USFnbosUk+3A7LfmCg/WGAxSl3aZtfqq/pBp5WyapbdOoZCPzk3LjXigi1BdOU9HW
         JBgQ==
X-Gm-Message-State: APjAAAUx/WjL/qMuviLafEskkjLY5Of3i1aUEJaHOZOLAwbUhTGy2hhy
        DIwgtNVXrCvVGUODcEI1lw1HCw==
X-Google-Smtp-Source: APXvYqyRtngW2yMCZZkoEQXLA1L6wPdZIAWGztmKH1IGUnDAdstQ8/PHr2ntupuE+fzATQ+j5fa0zA==
X-Received: by 2002:a63:e802:: with SMTP id s2mr2362627pgh.188.1571294581697;
        Wed, 16 Oct 2019 23:43:01 -0700 (PDT)
Received: from localhost ([122.172.151.112])
        by smtp.gmail.com with ESMTPSA id v4sm1426983pff.181.2019.10.16.23.43.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Oct 2019 23:43:00 -0700 (PDT)
Date:   Thu, 17 Oct 2019 12:12:58 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     krzk@kernel.org, vireshk@kernel.org, robh+dt@kernel.org,
        sboyd@kernel.org, roger.lu@mediatek.com, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        b.zolnierkie@samsung.com, m.szyprowski@samsung.com,
        Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v5 1/4] PM / OPP: Support adjusting OPP voltages at
 runtime
Message-ID: <20191017064258.yfbh7iz3pbzfhdvr@vireshk-i7>
References: <20191016145756.16004-1-s.nawrocki@samsung.com>
 <CGME20191016145810eucas1p1b31400c9b2e7f30cdf6deeb4ccee2788@eucas1p1.samsung.com>
 <20191016145756.16004-2-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191016145756.16004-2-s.nawrocki@samsung.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 16-10-19, 16:57, Sylwester Nawrocki wrote:
> From: Stephen Boyd <sboyd@codeaurora.org>
> 
> On some SoCs the Adaptive Voltage Scaling (AVS) technique is
> employed to optimize the operating voltage of a device. At a
> given frequency, the hardware monitors dynamic factors and either
> makes a suggestion for how much to adjust a voltage for the
> current frequency, or it automatically adjusts the voltage
> without software intervention. Add an API to the OPP library for
> the former case, so that AVS type devices can update the voltages
> for an OPP when the hardware determines the voltage should
> change. The assumption is that drivers like CPUfreq or devfreq
> will register for the OPP notifiers and adjust the voltage
> according to suggestions that AVS makes.
> 
> This patch is derived from [1] submitted by Stephen.
> [1] https://lore.kernel.org/patchwork/patch/599279/
> 
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> [s.nawrocki@samsung.com: added handling of OPP min/max voltage]
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  drivers/opp/core.c     | 69 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/pm_opp.h | 13 ++++++++
>  2 files changed, 82 insertions(+)

Applied. Thanks.

-- 
viresh
