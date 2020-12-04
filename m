Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BFEF2CF0B3
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  4 Dec 2020 16:28:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730418AbgLDP2o (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 4 Dec 2020 10:28:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:36608 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728701AbgLDP2o (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Dec 2020 10:28:44 -0500
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
Subject: [PATCH] [v2] clk: samsung: mark PM functions as __maybe_unused
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-ID: <3548618a-eb36-bf3a-d589-e06fd5f2111b@kernel.org>
Date:   Fri, 4 Dec 2020 16:27:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The use of SIMPLE_DEV_PM_OPS() means that the suspend/resume
functions are now unused when CONFIG_PM is disabled:

drivers/clk/samsung/clk-exynos-clkout.c:219:12: error: 
'exynos_clkout_resume' defined but not used [-Werror=unused-function]
   219 | static int exynos_clkout_resume(struct device *dev)
       |            ^~~~~~~~~~~~~~~~~~~~
drivers/clk/samsung/clk-exynos-clkout.c:210:12: error: 
'exynos_clkout_suspend' defined but not used [-Werror=unused-function]
   210 | static int exynos_clkout_suspend(struct device *dev)
       |            ^~~~~~~~~~~~~~~~~~~~~

Mark them as __maybe_unused to shut up the otherwise harmless warning.

Fixes: 9484f2cb8332 ("clk: samsung: exynos-clkout: convert to module 
driver")
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: add proper changelog text

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
