Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11210195704
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 27 Mar 2020 13:22:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbgC0MWF (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 27 Mar 2020 08:22:05 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:39850 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbgC0MWF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 27 Mar 2020 08:22:05 -0400
Received: by mail-ed1-f68.google.com with SMTP id a43so10818801edf.6
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Mar 2020 05:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CJtx9Mb4ATR8ydc7+qIQgKuACOkYBLoKgCJJpk0dhnA=;
        b=mWzTcghdNA14flcumDeJ9CB2bqR77uPRlQlb2XnAiqtVdQ+pDO70ZUnDwWtg7o2X3K
         faDRlgJeZN3whAGieOL1vrrQrJDuacvf5LTHRFC9gCWtTEagc/CY1R4vkMn1oDKHjgqS
         d+lFWitilTfkxQeb0sjrXPlll9KJn+cb/VYrcm9ZSGfSoWPnklMPN9hgTj5Z9g/M/Lqd
         zzzwffUTxXJVYV+ZBnbPGDiaw4WhlxS6rvm/0N8ZHu3zs216OXvNs+66xNDcaTmCOS7y
         CViMyDynvZBa5+Z2ab4//RfQ4pG/+4H3QYrPY1O3mmhpWASCYKm9PYVGXvq8efIuiEnQ
         8xWQ==
X-Gm-Message-State: ANhLgQ2imIEVpmYHsVzVCDylmiOg3X2VWjuu9BEWZZF5UhphBIwP00/l
        KtNKWLmL0Zf434qmHIg/bXpOhDdA
X-Google-Smtp-Source: ADFU+vvTZvPJmx39GNwI9xmdOcGF/6LYmUMlz9ekC1oM4pOIn0WOZFq3S7VQv2L7TfMSnluJ6EoQew==
X-Received: by 2002:a05:6402:309a:: with SMTP id de26mr12971159edb.51.1585311723642;
        Fri, 27 Mar 2020 05:22:03 -0700 (PDT)
Received: from kozik-lap ([194.230.155.125])
        by smtp.googlemail.com with ESMTPSA id g21sm837668eds.38.2020.03.27.05.22.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Mar 2020 05:22:02 -0700 (PDT)
Date:   Fri, 27 Mar 2020 13:22:01 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 2/4] ARM: dts: exynos: Enable WLAN support for the Trats
 board
Message-ID: <20200327122201.GD7233@kozik-lap>
References: <20200326094626.28308-1-m.szyprowski@samsung.com>
 <CGME20200326094635eucas1p2220473a93430f9319130dfc2449033b7@eucas1p2.samsung.com>
 <20200326094626.28308-3-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200326094626.28308-3-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Mar 26, 2020 at 10:46:24AM +0100, Marek Szyprowski wrote:
> Add a node for BCM4330/3 SDIO chip on SDHCI bus #3 and the required MMC
> power sequence node for the Exynos4210-based Trats board.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4210-trats.dts | 29 ++++++++++++++++++++++++++

Thanks, applied.

Best regards,
Krzysztof

