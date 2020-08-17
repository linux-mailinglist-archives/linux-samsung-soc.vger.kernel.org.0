Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB07B2473E1
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 17 Aug 2020 21:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404043AbgHQTCh (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 17 Aug 2020 15:02:37 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:34422 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730767AbgHQPrI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 17 Aug 2020 11:47:08 -0400
Received: by mail-ed1-f68.google.com with SMTP id bs17so12661756edb.1;
        Mon, 17 Aug 2020 08:47:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2OOPWwPf31u6+1Sjh8PXYKYbvJooZ2RmnVEA6ydXQrY=;
        b=g0scn3MQs7n0ElgSHwKEqhXX6rn/e91P3ryksEADiLu/oLo8HIAoQE37r2TzHbeIBC
         NSHtwO2pynF3wu2qkJKBL1DT7z1XnJhUf5y09hPseictMuFBkNneUJ+exgHhvNgObac3
         wJvGICe8vN6ZzTlbJdMEQUJsrVwheZaj3kbQHdSicExjJicKLiN7WL2lhEMw/JE4CyQk
         5XENVeYbDqo0sulPnxmzqQBXBAQSLz0nGCeYWpA356KGtrEevRusWWVjSZZPu/G4w+HP
         prD1r7x9HQLNTYRsQMsajzXhPJXT9Z8iUSiTRAf6BtAdYR614TyaO1NEPXw9tV5ZnHp3
         b+Xg==
X-Gm-Message-State: AOAM532xVxk+0qVXyH2jh1auRUJ4i6BTN6i76qJxXY6TaYu9QtOyiXqI
        hqR5+P9Hnznfu4S+mHqQyy0=
X-Google-Smtp-Source: ABdhPJwOhH8zi3STLsH1df8QWrCEbCpmOqWgZF/tMl4CTwAQjaelnyAYR/xa735yAwg3DI1So6yFhA==
X-Received: by 2002:aa7:d410:: with SMTP id z16mr15198853edq.287.1597679227376;
        Mon, 17 Aug 2020 08:47:07 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
        by smtp.googlemail.com with ESMTPSA id v13sm14947106edl.9.2020.08.17.08.47.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Aug 2020 08:47:06 -0700 (PDT)
Date:   Mon, 17 Aug 2020 17:47:04 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     broonie@kernel.org, simon@lineageos.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 3/3] ARM: dts: exynos: Add sound support to Midas
Message-ID: <20200817154704.GB15887@kozik-lap>
References: <20200728131111.14334-1-s.nawrocki@samsung.com>
 <CGME20200728131152eucas1p1d6794f603d1c3474eb6a7bfad04cec6b@eucas1p1.samsung.com>
 <20200728131111.14334-3-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200728131111.14334-3-s.nawrocki@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Jul 28, 2020 at 03:11:11PM +0200, Sylwester Nawrocki wrote:
> From: Simon Shields <simon@lineageos.org>
> 
> Update the never-mainlined "samsung,trats2-audio" binding and instead
> use the new "samsung,midas-audio" binding.
> 
> Signed-off-by: Simon Shields <simon@lineageos.org>
> [s.nawrocki: fixed DAPM routing entries for MICBIAS1/2, adjusted to
>  new cpu/codec binding, corrected the regulator nodes indexing]
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> Changes for v3:
>  - none.
> 
> Changes for v2:
>  - reordering to maintain alphabetical order,
>  - corrected the fixed voltage regulator nodes indexing,

Thanks, applied.

Best regards,
Krzysztof

