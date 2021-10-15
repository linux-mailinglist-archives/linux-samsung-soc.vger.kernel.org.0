Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C037C42F699
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 15 Oct 2021 17:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240324AbhJOPJn (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 15 Oct 2021 11:09:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:57282 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233121AbhJOPJm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 15 Oct 2021 11:09:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9AEF161056;
        Fri, 15 Oct 2021 15:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634310454;
        bh=VqVN67UtuHpTrgFPMCOrupVQ95C6IzxTdbZV92zwU7s=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=lMLfXe+pqpWUumfOHLTB6cnWR+wC+Yu0aDd8RD11AzyPN1Z8oSA4bZg33zYvBqE/9
         Kl3VsZHTO/cPRSsYfBeAhrM6fCENx/CAzzg2vA7omGCorZEuIPhJl8PQyudSB+dXPb
         76ubY18qNUC1NCEs+vd1Hmf2EPh89g9EVObAPzpncBf4Fb5tbopdQb8inWwoKJ2KZC
         27cF3zU0HO0QBe3n51JGtC5CAOzPYNDUfcbCjA+EKHosyD2NwZGMd1B8904N/RRop9
         OAXzDuMR4qFmBZymzrPmExyrHWBd1gXPGjsxhWXIShE+fQxPJKr4yIvx73JZgTotSU
         0Qz7eWRy848Pw==
Subject: Re: [PATCH v4 1/2] [RFT] clk: samsung: add support for CPU clocks
To:     Will McVicker <willmcvicker@google.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     kernel-team@android.com,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20211014195347.3635601-1-willmcvicker@google.com>
 <20211014195347.3635601-2-willmcvicker@google.com>
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <7204d800-17f8-1903-a76b-eea6cccba718@kernel.org>
Date:   Fri, 15 Oct 2021 17:07:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211014195347.3635601-2-willmcvicker@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 14.10.2021 21:53, Will McVicker wrote:
> Adds 'struct samsung_cpu_clock' and corresponding CPU clock registration
> function to the samsung common clk driver. This allows samsung clock
> drivers to register their CPU clocks with the samsung_cmu_register_one()
> API.
> 
> Currently the exynos5433 apollo and atlas clks have their own custom
> init functions to handle registering their CPU clocks. With this patch
> we can drop their custom CLK_OF_DECLARE functions and directly call
> samsung_cmu_register_one().
> 
> Signed-off-by: Will McVicker <willmcvicker@google.com>

Patch applied, thank you.
