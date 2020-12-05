Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB1632CFBC1
	for <lists+linux-samsung-soc@lfdr.de>; Sat,  5 Dec 2020 16:36:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbgLEPZT (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 5 Dec 2020 10:25:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:44128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726871AbgLEO73 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 5 Dec 2020 09:59:29 -0500
From:   Krzysztof Kozlowski <krzk@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] [v2] clk: samsung: mark PM functions as __maybe_unused
Date:   Sat,  5 Dec 2020 15:14:01 +0100
Message-Id: <160717762368.10558.8515675598564010108.b4-ty@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201204091616.4128366-1-arnd@kernel.org>
References: <20201204091616.4128366-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 4 Dec 2020 10:16:11 +0100, Arnd Bergmann wrote:
> The use of SIMPLE_DEV_PM_OPS() means that the suspend/resume
> functions are now unused when CONFIG_PM is disabled:
> 
> drivers/clk/samsung/clk-exynos-clkout.c:219:12: error: 'exynos_clkout_resume' defined but not used [-Werror=unused-function]
>   219 | static int exynos_clkout_resume(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~
> drivers/clk/samsung/clk-exynos-clkout.c:210:12: error: 'exynos_clkout_suspend' defined but not used [-Werror=unused-function]
>   210 | static int exynos_clkout_suspend(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Applied, thanks!

[1/1] clk: samsung: mark PM functions as __maybe_unused
      commit: 4c44274ee457e3f7012dc532c8c9cc8964a82612

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>
