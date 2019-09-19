Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F06B5B744A
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 19 Sep 2019 09:38:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726566AbfISHii (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 19 Sep 2019 03:38:38 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35942 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbfISHii (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Sep 2019 03:38:38 -0400
Received: by mail-wm1-f65.google.com with SMTP id m18so253928wmc.1;
        Thu, 19 Sep 2019 00:38:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Y6zSWuxS8jgyDbyMqezvXVURezmzAxVKdd2OMOE7VDY=;
        b=Q98K4MXgI2ofMOUzG0L/WgzRc2zT2vPuK0DYmLcMZR2zG0ydoOzI17+zvvHJXHIGDg
         s8DX5nBd9UmT+vtMTK4w7UlRYprZqAqgA7BWtgeOFSUVitF/M36qiRvR0QUjR8Cn5FHW
         DJf3nqnldyDXCsvBU2SsEwI9evQeUhIr+iIB0vae9Bx67OYX/osLu8oSoZeRYUQyClbw
         mjZzIdAh4Xk+cJ3G2JfDQ8qr2sljC9gUnmThcLPv3mk8lMn0/CB6pCsCGeyr+Z9Z375m
         lp2x/ao1b6DARtYEkXXjsUGVJjsNUMq6lp34EJB5UXOEeVjEJiNfPcg4h5+hLfREfjHU
         xHAQ==
X-Gm-Message-State: APjAAAX0dqyh17Cgz7/CWInYmNFZkHsX5CtQQ+BoM91rmAuV3y7xR66G
        qhbV8wLrBIo7H0mhv4PMLuZp7Yhi
X-Google-Smtp-Source: APXvYqzeq1U2LjJ1HD4/VWXclkN5qptlSoaU/lte93RCCam6t7j6L/Q8uKt9u97GzYcvPFW7th/KiA==
X-Received: by 2002:a7b:c5ce:: with SMTP id n14mr1515680wmk.17.1568878715640;
        Thu, 19 Sep 2019 00:38:35 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id t203sm6892411wmf.42.2019.09.19.00.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 00:38:34 -0700 (PDT)
Date:   Thu, 19 Sep 2019 09:38:32 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     broonie@kernel.org, lgirdwood@gmail.com,
        ckeepax@opensource.cirrus.com, sbkim73@samsung.com,
        alsa-devel@alsa-project.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com
Subject: Re: [PATCH v1 1/9] ASoC: wm8994: Do not register inapplicable
 controls for WM1811
Message-ID: <20190919073832.GA13195@pi3>
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104653eucas1p2e23ccbd05b3b780300adc9f4cb7a4c49@eucas1p2.samsung.com>
 <20190918104634.15216-2-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190918104634.15216-2-s.nawrocki@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Sep 18, 2019 at 12:46:26PM +0200, Sylwester Nawrocki wrote:
> In case of WM1811 device there are currently being registered controls
> referring to registers not existing on that device.
> It has been noticed when getting values of "AIF1ADC2 Volume", "AIF1DAC2
> Volume" controls was failing during ALSA state restoring at boot time:
>  "amixer: Mixer hw:0 load error: Device or resource busy"
> 
> Reading some registers through I2C was failing with EBUSY error and indeed
> those registers were not available according to the datasheet.
> 
> To fix this controls not available on WM1811 are moved to a separate array
> and registered only for WM8994 and WM8958.
> 
> There are some further differences between WM8994 and WM1811, e.g. registers
> 603h, 604h, 605h, which are not covered in this patch.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/codecs/wm8994.c | 43 +++++++++++++++++++++++----------------
>  1 file changed, 26 insertions(+), 17 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

