Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE0BD72DD1
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 24 Jul 2019 13:40:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727516AbfGXLkD (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 24 Jul 2019 07:40:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:54228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727409AbfGXLkD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 24 Jul 2019 07:40:03 -0400
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A257022BEA;
        Wed, 24 Jul 2019 11:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563968402;
        bh=Waz30FvbM2bDuciG00WYPrNVQxeN8XFol+6MLZngaDU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=UbDgSp5MCNlE5sgwQ9+EIE7o8SHwMpf+XN4VT6PiWNo6t5C+chmfrADPAC81mnyzB
         lLmezBMZBzexYyBBLromTjhqtQTKq0OCsnLq13HYRjL1N0PQazge1y0S3uzvb70j/g
         CY2l7sN0Vh3XA6XhCjKmPSJf9D1Fd+bQNC9WtNO4=
Received: by mail-lf1-f41.google.com with SMTP id b29so24483102lfq.1;
        Wed, 24 Jul 2019 04:40:01 -0700 (PDT)
X-Gm-Message-State: APjAAAW5d3OgsVcSacdRv7N3+Olybz6wP/sAvCRKKHpbCnTNLhnIKX2Q
        8ES034jbw5iDUVMz9nu1/rz0DlS01SOhbCK7S7o=
X-Google-Smtp-Source: APXvYqx3+A563bA8Nc3lxEu2U+a/qw7GJbEPteETDwnhna9Ox1cYxk6dVWTYQpIDqElHtzAZl4iPfU/mdKjG6U8RDME=
X-Received: by 2002:ac2:4891:: with SMTP id x17mr39260124lfc.60.1563968399768;
 Wed, 24 Jul 2019 04:39:59 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20190722094727eucas1p10041ba25819e6e62d639423a97435f2d@eucas1p1.samsung.com>
 <20190722094646.13342-1-l.luba@partner.samsung.com> <20190722094646.13342-4-l.luba@partner.samsung.com>
In-Reply-To: <20190722094646.13342-4-l.luba@partner.samsung.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 24 Jul 2019 13:39:48 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdue75yF=v5vsawOdfvcCMBDP6HGVXdwngBWE264kGJwg@mail.gmail.com>
Message-ID: <CAJKOXPdue75yF=v5vsawOdfvcCMBDP6HGVXdwngBWE264kGJwg@mail.gmail.com>
Subject: Re: [PATCH v12 3/9] drivers: memory: extend of_memory by LPDDR3 support
To:     Lukasz Luba <l.luba@partner.samsung.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= 
        <b.zolnierkie@samsung.com>, kgene@kernel.org, mark.rutland@arm.com,
        robh+dt@kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
        kyungmin.park@samsung.com,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        s.nawrocki@samsung.com, myungjoo.ham@samsung.com,
        keescook@chromium.org, tony@atomide.com, jroedel@suse.de,
        treding@nvidia.com, digetx@gmail.com, gregkh@linuxfoundation.org,
        willy.mh.wolff.ml@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 22 Jul 2019 at 11:47, Lukasz Luba <l.luba@partner.samsung.com> wrote:
>
> The patch adds AC timings information needed to support LPDDR3 and memory
> controllers. The structure is used in of_memory and currently in Exynos
> 5422 DMC. Add parsing data needed for LPDDR3 support.
> It is currently used in Exynos5422 Dynamic Memory Controller.
>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
> ---
>  drivers/memory/jedec_ddr.h |  61 +++++++++++++++
>  drivers/memory/of_memory.c | 154 +++++++++++++++++++++++++++++++++++++
>  drivers/memory/of_memory.h |  18 +++++
>  3 files changed, 233 insertions(+)
>
> diff --git a/drivers/memory/jedec_ddr.h b/drivers/memory/jedec_ddr.h
> index 4a21b5044ff8..38e26d461bdb 100644
> --- a/drivers/memory/jedec_ddr.h
> +++ b/drivers/memory/jedec_ddr.h
> @@ -29,6 +29,7 @@
>  #define DDR_TYPE_LPDDR2_S4     3
>  #define DDR_TYPE_LPDDR2_S2     4
>  #define DDR_TYPE_LPDDR2_NVM    5
> +#define DDR_TYPE_LPDDR3                6
>
>  /* DDR IO width */
>  #define DDR_IO_WIDTH_4         1
> @@ -169,4 +170,64 @@ extern const struct lpddr2_timings
>         lpddr2_jedec_timings[NUM_DDR_TIMING_TABLE_ENTRIES];
>  extern const struct lpddr2_min_tck lpddr2_jedec_min_tck;
>
> +/*
> + * Structure for timings for LPDDR3 based on LPDDR2 plus additional fields.
> + * All parameters are in pico seconds(ps) unless explicitly indicated
> + * with a suffix like tRAS_max_ns below
> + */
> +struct lpddr3_timings {
> +       u32 max_freq;
> +       u32 min_freq;
> +       u32 tRFC;
> +       u32 tRRD;
> +       u32 tRPab;
> +       u32 tRPpb;
> +       u32 tRCD;
> +       u32 tRC;
> +       u32 tRAS;
> +       u32 tWTR;
> +       u32 tWR;
> +       u32 tRTP;
> +       u32 tW2W_C2C;
> +       u32 tR2R_C2C;
> +       u32 tWL;
> +       u32 tDQSCK;
> +       u32 tRL;
> +       u32 tFAW;
> +       u32 tXSR;
> +       u32 tXP;
> +       u32 tCKE;
> +       u32 tCKESR;
> +       u32 tMRD;
> +};
> +
> +/*
> + * Min value for some parameters in terms of number of tCK cycles(nCK)
> + * Please set to zero parameters that are not valid for a given memory
> + * type
> + */
> +struct lpddr3_min_tck {
> +       u32 tRFC;
> +       u32 tRRD;
> +       u32 tRPab;
> +       u32 tRPpb;
> +       u32 tRCD;
> +       u32 tRC;
> +       u32 tRAS;
> +       u32 tWTR;
> +       u32 tWR;
> +       u32 tRTP;
> +       u32 tW2W_C2C;
> +       u32 tR2R_C2C;
> +       u32 tWL;
> +       u32 tDQSCK;
> +       u32 tRL;
> +       u32 tFAW;
> +       u32 tXSR;
> +       u32 tXP;
> +       u32 tCKE;
> +       u32 tCKESR;
> +       u32 tMRD;
> +};
> +
>  #endif /* __JEDEC_DDR_H */
> diff --git a/drivers/memory/of_memory.c b/drivers/memory/of_memory.c
> index 46539b27a3fb..4f5b8c81669f 100644
> --- a/drivers/memory/of_memory.c
> +++ b/drivers/memory/of_memory.c
> @@ -3,6 +3,12 @@
>   * OpenFirmware helpers for memory drivers
>   *
>   * Copyright (C) 2012 Texas Instruments, Inc.
> + * Copyright (C) 2019 Samsung Electronics Co., Ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.

What's this?

Please, get a independent review or ack for this patch.

Best regards,
Krzysztof
