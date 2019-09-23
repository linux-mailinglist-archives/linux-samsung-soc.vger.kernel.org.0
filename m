Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEA81BB131
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 23 Sep 2019 11:16:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731670AbfIWJQt (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 23 Sep 2019 05:16:49 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45445 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730121AbfIWJQt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Sep 2019 05:16:49 -0400
Received: by mail-wr1-f67.google.com with SMTP id r5so12995770wrm.12;
        Mon, 23 Sep 2019 02:16:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eUZTQEw4J0qVIA2fDKv3wKt2hX7/DxEBMom/U6HeJCA=;
        b=N/cEFqQDG/hhkIEtHHciF8USLjg74HjhuqS8OBBWPp3Lxi9unwN9Wf/VAs2g//3m/f
         HAaoLTF1syxzHz6YoOObRmxj20IcGMlYogohfjYFVwMxhIgymtuiVx5TWowRgdKF+GLM
         yJviEiUWZqnXgdH+oOmpvLYHyEwRUujXOzPtcsyHKf+jYJJJiLdhyFQiBJhQReTjBowL
         018cAgwZQDNBf2mwYQ0E2Tj8TAHcRgKT7iuhyqEVX/Ji6EFevyV6h/teq0TOkMZLgYYT
         uGcoK6QBCIiuqUvUYeESIfpmKX+zGraeUjx0SYR1BtBJUAB2v2nw3qlL8prI4uv0ldtl
         Zf9A==
X-Gm-Message-State: APjAAAUaUJwQrwn7TyPcSMNSxy9YnGT1w8dcywitKnz7C6LkKO6dXG5y
        8i8K7Zy6EUme9Lw6t0szCHg=
X-Google-Smtp-Source: APXvYqy/K8AUiDccc2Dhtcu7DPXS49zP6PhLDw4ZT1thoebNST6dXSKJcAdR933mVGIR+GOsw17Now==
X-Received: by 2002:adf:e9ce:: with SMTP id l14mr13891459wrn.264.1569230206656;
        Mon, 23 Sep 2019 02:16:46 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id y19sm9238322wmi.13.2019.09.23.02.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2019 02:16:25 -0700 (PDT)
Date:   Mon, 23 Sep 2019 11:16:22 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     broonie@kernel.org, lgirdwood@gmail.com,
        ckeepax@opensource.cirrus.com, sbkim73@samsung.com,
        alsa-devel@alsa-project.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com
Subject: Re: [PATCH v2 07/10] ASoC: samsung: arndale: Add support for WM1811
 CODEC
Message-ID: <20190923091622.GC4577@pi3>
References: <20190920130218.32690-1-s.nawrocki@samsung.com>
 <CGME20190920130321eucas1p2efe85adb3df4c546a7d81326b4c75873@eucas1p2.samsung.com>
 <20190920130218.32690-8-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190920130218.32690-8-s.nawrocki@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Sep 20, 2019 at 03:02:16PM +0200, Sylwester Nawrocki wrote:
> The Arndale boards come with different types of the audio daughter
> board.  In order to support the WM1811 one we add new definition of
> an ASoC card which will be registered when the driver matches on
> "samsung,arndale-wm1811" compatible.  There is no runtime detection of
> the audio daughter board type at the moment, compatible string of the
> audio card needs to be adjusted in DT, e.g. by the bootloader,
> depending on actual audio board (CODEC) used.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> Changes since v1:
>  - removed unneeded __maybe_used attribute
> ---
>  sound/soc/samsung/Kconfig          |  2 +
>  sound/soc/samsung/arndale_rt5631.c | 85 +++++++++++++++++++++++++-----
>  2 files changed, 74 insertions(+), 13 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

