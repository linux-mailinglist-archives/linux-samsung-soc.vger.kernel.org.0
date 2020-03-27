Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD7D8195729
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 27 Mar 2020 13:36:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbgC0MgL (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 27 Mar 2020 08:36:11 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:34551 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726515AbgC0MgL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 27 Mar 2020 08:36:11 -0400
Received: by mail-ed1-f66.google.com with SMTP id i24so10903534eds.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Mar 2020 05:36:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zQNfOcq0LhESokmW3ZeY94EXEEzQRzubY2cVjaREQH0=;
        b=duz8ekHuiPU404rknsfcYmFng3Zu/yUUZWArS15RguomSJGIM9vgFm6xErB6/uOOLf
         zT7QaDWBk2boXJJWDw4kHdyhiMj6WaY7PID5XVOCZyj6i/I1kLS9kho7XLMmijWK06eP
         4uqs/CDapQAB4+OvgJhdHF/SEEV+3RaE1jdwSOBeiLPRdjMHQqSGtOZobMT8PlwK10ps
         6gmMvocVQJMoFn5Q5pajol/bD92oDyEcq5/CSfEe1BD0sgswIDzEAYi5A8d5InxiTzb+
         FxZbcQQG/KAh7QWbloEPNVttBZs5VYRwzZE2onIFFJTA0XkfqC2AceefhAXMfIUdvcmF
         /5Rw==
X-Gm-Message-State: ANhLgQ2K4hLlA1nqLWmh1dItX4KcgYYVIgFbnokl4asb+DtcRKYXTU2+
        2Fa+mmolXFGwjW5WF9zuiUD1MxP2
X-Google-Smtp-Source: ADFU+vsQ6ZNjbh8K6uJZ61acscRMO2VGAVdyB7WD8WJQUoUA89uF6WuXdQ6FcUu7lJNVywtiW+E5lQ==
X-Received: by 2002:a17:906:4953:: with SMTP id f19mr12629401ejt.94.1585312569098;
        Fri, 27 Mar 2020 05:36:09 -0700 (PDT)
Received: from kozik-lap ([194.230.155.125])
        by smtp.googlemail.com with ESMTPSA id b72sm830494edf.95.2020.03.27.05.36.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Mar 2020 05:36:08 -0700 (PDT)
Date:   Fri, 27 Mar 2020 13:36:06 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos: Correct regulator names
Message-ID: <20200327123606.GH7233@kozik-lap>
References: <CGME20200326144507eucas1p20db20c7a53d01d0218e7dc71121cba94@eucas1p2.samsung.com>
 <20200326144455.25893-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200326144455.25893-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Mar 26, 2020 at 03:44:55PM +0100, Marek Szyprowski wrote:
> Both CPU-freq and dev-freq drivers support proper regulator lookup from
> device-tree, so the early introduced hacks for registering main ARM VDD
> regulator under 'vdd_arm' name are no longer needed. Similar for devfreq.
> Fix this by removing the obsolete comments and changing the regulator
> names to the one, which match the schematics and style for the given
> board.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4210-origen.dts         |  7 +------
>  arch/arm/boot/dts/exynos4210-trats.dts          |  7 +------
>  arch/arm/boot/dts/exynos4210-universal_c210.dts |  2 +-
>  arch/arm/boot/dts/exynos4412-midas.dtsi         |  8 ++++----
>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi |  8 ++++----
>  arch/arm/boot/dts/exynos4412-origen.dts         | 14 +++++++-------
>  arch/arm/boot/dts/exynos5250-arndale.dts        |  8 ++++----
>  arch/arm/boot/dts/exynos5420-arndale-octa.dts   |  2 +-

Thanks, applied.

Best regards,
Krzysztof

