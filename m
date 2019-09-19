Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AF44B7495
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 19 Sep 2019 10:00:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388274AbfISIA1 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 19 Sep 2019 04:00:27 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40044 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388273AbfISIA1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Sep 2019 04:00:27 -0400
Received: by mail-wr1-f65.google.com with SMTP id l3so1997328wru.7;
        Thu, 19 Sep 2019 01:00:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XYLP8EKg1aWYrdXosmUlGT0i0haeJe1I34kspHyVEH0=;
        b=KMAbcgWDkMUR8RQ7xbkdqLkR8YjCUxTkvw51oHjO/Z0Jwa/08RF6JU0WUzxX19r7qu
         qR/LZpLpHzqSm2+p5Zb8551pxERA0pIZdZo10IF9NL2RcKuHHvViBkat8uWzSokEEp6C
         eoHjHDAr2ydjD1PvftfCOgbYqDyF+GTox6UWTwRme58hwS3Ooiu/iksLnZotQhl9Ot82
         j4wNik19IONubogYL0jTV2iGNtJPjdBre/yx322ZAJG16exUlY7JAUmvyzJKs23h0Q1W
         1TlKUdc4WSdT6A9+eqCDsXu4cZu/ky3LqgCyjq2CllY8x5xX/fympC62aoHvFKGsohBW
         9aOw==
X-Gm-Message-State: APjAAAVFt5vE5JQTtergTaErVVI474d1ppV3rOd5d5O6U8gzRgxJw/2V
        S5ei66hB47QTl1+rnAM4eU0=
X-Google-Smtp-Source: APXvYqxkZJuMnz/5Yv5b+cZRtdqNk41lsPPfWQ5dJ873pZVxw48691hLCmWcac5LtqPWpbV9fXoJ9Q==
X-Received: by 2002:adf:f50d:: with SMTP id q13mr6370586wro.187.1568880025167;
        Thu, 19 Sep 2019 01:00:25 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id u10sm15346109wrg.55.2019.09.19.01.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 01:00:24 -0700 (PDT)
Date:   Thu, 19 Sep 2019 10:00:21 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     broonie@kernel.org, lgirdwood@gmail.com,
        ckeepax@opensource.cirrus.com, sbkim73@samsung.com,
        alsa-devel@alsa-project.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com
Subject: Re: [PATCH v1 3/9] ASoC: wm8994: Add support for setting MCLKn clock
 rate
Message-ID: <20190919080021.GC13195@pi3>
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104658eucas1p2c1f07d3e8b915d8c3a448b80d2af5df0@eucas1p2.samsung.com>
 <20190918104634.15216-4-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190918104634.15216-4-s.nawrocki@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Sep 18, 2019 at 12:46:28PM +0200, Sylwester Nawrocki wrote:
> Extend the set_sysclk() handler so we also set frequency of the MCLK1,
> MCLK2 clocks through clk API when those clocks are specified in DT for
> the device.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/codecs/wm8994.c | 30 +++++++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

