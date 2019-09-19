Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 503FBB74A2
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 19 Sep 2019 10:01:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730118AbfISIBh (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 19 Sep 2019 04:01:37 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35686 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727815AbfISIBh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Sep 2019 04:01:37 -0400
Received: by mail-wm1-f65.google.com with SMTP id y21so2805245wmi.0;
        Thu, 19 Sep 2019 01:01:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9l/Q4EUeY/MLFd+AQm4TkiqnhshHiOklBHU3BARdFdE=;
        b=Au1Ph6HyOIPbtWr2FozALMip5jr9nWBwf4Jf8Tdb68qVlgTawuCehpI/skIPxyllYK
         JkWRaYhZR4gwPqEI0KlFqeCenA+OakuCbYQud8T+GjDjii5GNWWATRhDeV/KzGhTNF95
         F/WsoxnQLYRU8ZaGfD52W0a6eCV1JJnmxWh97aRms+4xjdDs8jJP2KUxVmYDohAm02t/
         EyUVMo5EBU86yOeZnfBOiq25ycJB0dSRydKApBSo0ATG4NcgfrOUcxDoe/0OXBgTHuxL
         aY33EjX7alb3FWsctMLkI8QbfCWh4FXzlZDFzEHucOLEGgWNevsTEcs5hM6Gni4CHVxI
         OBlg==
X-Gm-Message-State: APjAAAWLPuG1LzOaJ9vlHwpbk+Hqq8qdnpY/m0lUT7GNsrCwlQP/d1tQ
        /rqPXCfsU/sxqisdI4tcgeU=
X-Google-Smtp-Source: APXvYqwkmLUV4hPJJcWaqDDccNR6SsgGU7jssMHyEYDdwsyrDM+pO+zL1vqcxlXKfE+aZippLMXTaw==
X-Received: by 2002:a05:600c:291c:: with SMTP id i28mr1559297wmd.98.1568880094991;
        Thu, 19 Sep 2019 01:01:34 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id u10sm15352265wrg.55.2019.09.19.01.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 01:01:33 -0700 (PDT)
Date:   Thu, 19 Sep 2019 10:01:31 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     broonie@kernel.org, lgirdwood@gmail.com,
        ckeepax@opensource.cirrus.com, sbkim73@samsung.com,
        alsa-devel@alsa-project.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com
Subject: Re: [PATCH v1 5/9] ASoC: samsung: arndale: Simplify DAI link
 initialization
Message-ID: <20190919080131.GD13195@pi3>
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104702eucas1p213070d06c69c4836d15d071b1926e60d@eucas1p2.samsung.com>
 <20190918104634.15216-6-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190918104634.15216-6-s.nawrocki@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Sep 18, 2019 at 12:46:30PM +0200, Sylwester Nawrocki wrote:
> There is only one DAI link so we can drop an unnecessary loop statement.
> Use card->dai_link in place of direct static arndale_rt5631_dai[] array
> dereference as a prerequisite for adding support for other CODECs.
> Unnecessary assignment of dai_link->codecs->name to NULL is removed.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/samsung/arndale_rt5631.c | 42 ++++++++++++------------------
>  1 file changed, 17 insertions(+), 25 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

