Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD83F195784
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 27 Mar 2020 13:51:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727125AbgC0MvQ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 27 Mar 2020 08:51:16 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:43785 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726959AbgC0MvQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 27 Mar 2020 08:51:16 -0400
Received: by mail-ed1-f67.google.com with SMTP id bd14so10904972edb.10
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Mar 2020 05:51:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uKM7aQFph7vibs5PcnmC92EJAJgZub4oyMSspp4KZHY=;
        b=Mks86h4gUNwYmnVsk3komsH7xy220GHsSc2BCMe+BbYjixIE1ZccQyN2b6qAKfEHB8
         xaTuR1eq2VfL2HtXPDQ4i5HTf3kgdVFNayijiu+2yFyN38X/C7q6vte8r9ryyvuMlgZ5
         wBUUdQlGDbT3oMKGDqXjtkbPRa5BImLIB3TVHOghXRrkFK8II6ut62bq+5wAEDDaNfrj
         Vc/O31pdnnKcr8+KSpN2x6TPwRNg4XbpzuKGHLo7X/5YoBibTTWOyW/NZ9oCq/nLNzQF
         p2Rcg1tJUVwe2bi7w41TFmwIjc6nde5eMHrx239nGlcbAu1ATRpcG/jHTCtGRAEvRiJX
         +d6Q==
X-Gm-Message-State: ANhLgQ0lumusGfRnUBv9YlAXMmXpy1ywuoj4NIYb6fXsMfHlyUHA0MYM
        zSZ0DEWhSR6OFtwYVQDJoVplhfqj
X-Google-Smtp-Source: ADFU+vsAdhUWi0kdqNPM7tl0j42PouDBo+62PZfTdFB90S07i0M7IPAzJnw17JgTKjJfbJytvynkUA==
X-Received: by 2002:a05:6402:206e:: with SMTP id bd14mr13402165edb.308.1585313473883;
        Fri, 27 Mar 2020 05:51:13 -0700 (PDT)
Received: from kozik-lap ([194.230.155.125])
        by smtp.googlemail.com with ESMTPSA id r30sm841935edi.75.2020.03.27.05.51.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Mar 2020 05:51:13 -0700 (PDT)
Date:   Fri, 27 Mar 2020 13:51:10 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 1/4] ARM: dts: exynos: Enable WLAN support for the
 UniversalC210 board
Message-ID: <20200327125110.GA28844@kozik-lap>
References: <20200326094626.28308-1-m.szyprowski@samsung.com>
 <CGME20200326094634eucas1p1d02b6124a500b7bac6a9702d93915c42@eucas1p1.samsung.com>
 <20200326094626.28308-2-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200326094626.28308-2-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Mar 26, 2020 at 10:46:23AM +0100, Marek Szyprowski wrote:
> Add a node for BCM4330/2 SDIO chip on SDHCI bus #3 and the required MMC
> power sequence node for the Exynos4210-based UniversalC210 board.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  .../boot/dts/exynos4210-universal_c210.dts    | 28 +++++++++++++++++++

... and dropped. You have multiple checkpatch errors. Please fix them.

Best regards,
Krzysztof

