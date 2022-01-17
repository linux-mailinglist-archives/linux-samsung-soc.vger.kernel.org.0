Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68B76490F0B
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 17 Jan 2022 18:16:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243740AbiAQROT (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 17 Jan 2022 12:14:19 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:52986
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242893AbiAQRLU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 17 Jan 2022 12:11:20 -0500
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C55C63F313
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jan 2022 17:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642439478;
        bh=rYVFCe9pl7AFup8bHTYfW3/P3SXGC/+nyEtQsAxutfY=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=Oac+hn9eUEvafikHjXR4nfWdTPZdIab1KyPdEB2QFpwtztZoIG/giJc6lXC2AJjsU
         Ktqz/LAqJyLgDCdL83SEend9MBm16b49OoN01EYRTRW2VlCQ6eXdVpMDrvMx2A4ikL
         0TI1nyzxC12/bgqXDuT7Lhg/bqAfl1I/S7VERyFM9iwpmbsX/U2MLqshK0QcNF6ybl
         Kf2qTrI/fkPWsXlpRzuK6lg9j7Sk+LD7rVhe8M41xkApcac74af0K0EbCpCcacs+B7
         ocqVWCl0+8E+dho1gKsALjBVEIQOitXwueJSK8kjtQN8JopStSX8ir8eE0O0vEWwTx
         FIB9qiVgyqgZA==
Received: by mail-ed1-f69.google.com with SMTP id c11-20020a056402120b00b0040321cea9d4so1580268edw.23
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jan 2022 09:11:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rYVFCe9pl7AFup8bHTYfW3/P3SXGC/+nyEtQsAxutfY=;
        b=BEDC+7pOGR22U32JU5Sa8y0jo5aDHHT+V5vfYq0AP8fD/xKQvVmQWhVg1VX0KGKC+U
         kg41L5sUgq4b5ndwWzX+fy/xLWMekXLK/AZBu+A7pccVKw4W5Sy7mwbCsXAKkWJHC00K
         eu2UgqVFP77VDfjZXl9cneu0rSd8PgI+RhbeZJ6BXLt8eQIRgMf4IdtyfG2Flz6JqfWt
         v9Zu/aQ6ZF+1NgOlVbkVi4y2OQzc2hlXIuhozpjQZljAqS3mN6rlmifa+q23BYHaeHLr
         w4++CmV4sxWyKPT6XWTBgktdWtyRK4dSdHRK82lbs+85JukaaBwN76j4MxAMaz/C6g5G
         fuzg==
X-Gm-Message-State: AOAM532KKqb2/YZw+I/Jmhry0iSNr2FT9Pc5tSxJsPo4wANLqp4VU5Nq
        Fb5yKLL7jYaoK8mNySJoGwzlfRW//X2sY3COR2Wi3kxGMssDrL2cf2csAesSVz7FsE1LJTa2xop
        F3EeMmLK9D70/dCeNjuTxg8nggG6Gv/i9/tJ/wcfFYYNzsONZ
X-Received: by 2002:a17:907:16a9:: with SMTP id hc41mr17077009ejc.706.1642439478448;
        Mon, 17 Jan 2022 09:11:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdCubmpUIIeWiYR7npGWGTb6d6igWjY9M7lKb/sdt4nQUU2xIQTqvtVmX1TQrgDksa1opr+A==
X-Received: by 2002:a17:907:16a9:: with SMTP id hc41mr17076989ejc.706.1642439478199;
        Mon, 17 Jan 2022 09:11:18 -0800 (PST)
Received: from [192.168.0.40] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id i16sm6191119edu.29.2022.01.17.09.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jan 2022 09:11:17 -0800 (PST)
Message-ID: <b75a0bc9-0423-83cc-11e1-d5e08952cc93@canonical.com>
Date:   Mon, 17 Jan 2022 18:11:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH AUTOSEL 5.16 02/52] clk: samsung: exynos850: Register
 clocks early
Content-Language: en-US
To:     Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        tomasz.figa@gmail.com, cw00.choi@samsung.com,
        mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20220117165853.1470420-1-sashal@kernel.org>
 <20220117165853.1470420-2-sashal@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220117165853.1470420-2-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 17/01/2022 17:58, Sasha Levin wrote:
> From: Sam Protsenko <semen.protsenko@linaro.org>
> 
> [ Upstream commit bcda841f9bf2cddcf2f000cba96f2e27f6f2bdbf ]
> 
> Some clocks must be registered before init calls. For example MCT clock
> (from CMU_PERI) is needed for MCT timer driver, which is registered
> with TIMER_OF_DECLARE(). By the time we get to core_initcall() used for
> clk-exynos850 platform driver init, it's already too late. Inability to
> get "mct" clock in MCT driver leads to kernel panic, as functions
> registered with *_OF_DECLARE() can't do deferred calls. MCT timer driver
> can't be fixed either, as it's acting as a clock source and it's
> essential to register it in start_kernel() -> time_init().
> 
> Let's register CMU_PERI clocks early, using CLK_OF_DECLARE(). CMU_TOP
> generates clocks needed for CMU_PERI, but it's already registered early.
> 
> While at it, let's cleanup the code a bit, by extracting everything
> related to CMU initialization and registration to the separate function.
> 
> Similar issue was discussed at [1] and addressed in commit 1f7db7bbf031
> ("clk: renesas: cpg-mssr: Add early clock support"), as well as in
> drivers/clk/mediatek/clk-mt2712.c.
> 
> [1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20180829132954.64862-2-chris.brandt@renesas.com/
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Link: https://lore.kernel.org/r/20211122144206.23134-1-semen.protsenko@linaro.org
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/clk/samsung/clk-exynos850.c | 70 ++++++++++++++++++++---------
>  1 file changed, 49 insertions(+), 21 deletions(-)
> 

I propose to skip this one.

Backporting it to v5.16 does not hurt but also does not bring any
benefits for the upstream kernel users. There is no support for
mentioned Exynos850 in v5.16.

It could have only meaning for some downstream, out-of-tree kernels
which apply Exynos850 support on top of v5.16, but then they can just
take this patch as well.


Best regards,
Krzysztof
