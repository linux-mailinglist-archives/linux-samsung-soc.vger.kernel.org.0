Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D332E17360B
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 28 Feb 2020 12:31:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbgB1Lba (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 28 Feb 2020 06:31:30 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:36830 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbgB1Lb3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 28 Feb 2020 06:31:29 -0500
Received: by mail-ed1-f65.google.com with SMTP id j17so2979313edp.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Feb 2020 03:31:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=s06gTDtg/+91iVR7SFC4D41arfeCaTJ8f9QzMxQOUv8=;
        b=Qvp7wvMK8AmPTKbRNcIAVIX5K+fyWCvejgfP5hKIj6sL4p0UQ2jro4FBgtqUFR54JR
         jB2uXByPpFY4Y3/uDc0FVBr/QjXQUjsygv6Yp0JqWq5ePwyzXo6egqxr/bbkKuuxp/X6
         lcgt15Q/Z+JOqUsxC1UreWKoNG93XqWFJDysRHXauC6mnXGyEsBBLVUTUMFYw+GX6tA+
         NZeUi6NFSvmS9HwmhZDyxn1sAPdWfBWy3MrySzsOtQIsyQ5EPJ5dGTq3o+kVwQCfXnON
         NC97OdkDSyAF6+SWGIu+uR3XK+lHDuJsZlLTk/dOXtLhbjuKvxzyt4y/gNy7rukagMGJ
         2Onw==
X-Gm-Message-State: APjAAAUjy/q9p7Mtmn0XfVS/6wd0sZPB9LktC127V2rJQnwEIFsphMKp
        hJUsVbMlpyQ5AP1VNGs64k8=
X-Google-Smtp-Source: APXvYqzGBaIZxd3oIYOuotg30sQRx11BQSlHMicAEvdwujYgc/hpgMgWcI+FsNXjm2462AQIfMD8Cg==
X-Received: by 2002:aa7:d712:: with SMTP id t18mr3853034edq.0.1582889487948;
        Fri, 28 Feb 2020 03:31:27 -0800 (PST)
Received: from pi3 ([194.230.155.125])
        by smtp.googlemail.com with ESMTPSA id t11sm518007edj.78.2020.02.28.03.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 03:31:26 -0800 (PST)
Date:   Fri, 28 Feb 2020 12:31:24 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Sangbeom Kim <sbkim73@samsung.com>,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2] ASoC: samsung: Silence warnings during deferred probe
Message-ID: <20200228113124.GB9458@pi3>
References: <CGME20200228101124eucas1p1f6ab761a38f4a953a4eeed89859fcf4a@eucas1p1.samsung.com>
 <20200228101120.28819-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200228101120.28819-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Feb 28, 2020 at 11:11:20AM +0100, Marek Szyprowski wrote:
> Don't confuse user with meaningless warning about the failure in getting
> resources and registering card in case of deferred probe.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/samsung/arndale.c        | 4 +++-
>  sound/soc/samsung/littlemill.c     | 2 +-
>  sound/soc/samsung/lowland.c        | 2 +-
>  sound/soc/samsung/odroid.c         | 4 +++-
>  sound/soc/samsung/smdk_wm8994.c    | 2 +-
>  sound/soc/samsung/smdk_wm8994pcm.c | 2 +-
>  sound/soc/samsung/snow.c           | 4 +++-
>  sound/soc/samsung/speyside.c       | 2 +-
>  sound/soc/samsung/tm2_wm5110.c     | 3 ++-
>  sound/soc/samsung/tobermory.c      | 2 +-
>  10 files changed, 17 insertions(+), 10 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

