Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72D9B2E8D07
	for <lists+linux-samsung-soc@lfdr.de>; Sun,  3 Jan 2021 17:11:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbhACQLb (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 3 Jan 2021 11:11:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:54670 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726008AbhACQLb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 3 Jan 2021 11:11:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 69C18208D5;
        Sun,  3 Jan 2021 16:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609690250;
        bh=7pwVwcDWI1J8DYef1FtdS8qF4NjeZGVQwVyJQpkNTrU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mKtyvKfDJHlG44T9INOu7vi8An13YGcuMRTwR/BOldkmG2G+rOWIKDxi1adEtr8Jx
         BZ8mQe0xZ3QTd7QrcoCN9HIlQ/aivwvynqaapPJxPS5cHHn54oY4X8PQ1Fx28WCdLy
         C0nolhe1mJzk2OIxhluV3xYCYfMLVaiiTou25AkVWPG1OSYwMcLy4sOf0FWZdxeftU
         DaJ8fiWTqp4LFxRFS78Ec9DLEAv32/UXuL7M+KeRDsyyaRvvPOs4zQ7lpTENxZjU7Z
         /5sFtRWCrIuvRPDK66SX6EHhq7pyZcsEzw/9ZgaAtnbBwPysBZX2/R/w2cM6nQ2HOa
         tguBaEhG/iJkw==
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Pankaj Dubey <pankaj.dubey@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: (subset) [PATCH v2 0/4] soc: samsung: exynos-chipid and asv improvements
Date:   Sun,  3 Jan 2021 17:10:44 +0100
Message-Id: <160969021293.28081.2430913792988475716.b4-ty@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201207190517.262051-1-krzk@kernel.org>
References: <20201207190517.262051-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 7 Dec 2020 20:05:13 +0100, Krzysztof Kozlowski wrote:
> Changes since v1:
> 1. Drop patch "soc: samsung: exynos-chipid: initialize later - with
>    arch_initcall" which is now superseded by convertin to a driver.
> 2. Include Marek's patch, just for the reference and rebase.
> 3. Add patch "soc: samsung: exynos-asv: handle reading revision register
>    error".
> 4. Add patch "soc: samsung: exynos-chipid: convert to driver and merge
>    exynos-asv".
> 
> [...]

Applied, thanks!

[4/4] soc: samsung: exynos-chipid: convert to driver and merge exynos-asv
      commit: 352bfbb3e0230c96b2bce00d2ac3f0de303cc7b6

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>
