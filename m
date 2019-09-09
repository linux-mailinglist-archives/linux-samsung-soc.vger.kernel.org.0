Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D9EBADF2A
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  9 Sep 2019 20:55:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727410AbfIISzw (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 9 Sep 2019 14:55:52 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41924 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727164AbfIISzw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Sep 2019 14:55:52 -0400
Received: by mail-wr1-f66.google.com with SMTP id h7so14259918wrw.8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Sep 2019 11:55:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ra/gV8lPXO5Wh+Vb60+O0aQkihf+QKY6CFPEg3Fy55M=;
        b=bK8Rm6+a4QHLmk2gUvyvjReaEvXSWSqQAsuMXvm8aKAXiS5FOsv2vsmtPF96mxAE3Z
         N6LWMvA1I9Lpfol3gFG9lcnXq+eGampPTVdmwXn8p83esX/aKpV77dvRFsjK5LXbSFnP
         t5SH1qZfCqdjYbBWwYQlRgEE41rrM+GLQ6lFSHZSRg3Yn4duTQgh+o86em1mayPZ1oPP
         up9DFpNfS/uzgwlbtA3qzQpfa/20jjtkQ4XM28g9ME69zIZh0u6RvsYe3L7iexCnc3LB
         WRfNCuL9RNc3Cdjv/258YficpCPZVKBAU9Cj+BeclXfJavUxBbDPKFxW87Q+PB5MRkt1
         R57A==
X-Gm-Message-State: APjAAAUdeXF03/OS8azW3yR0r9mikrkHBZXCxqaq6rmmrj1KKStEqwM2
        eWYRcu5EG06f/fd/ors+LAEY9gJ1
X-Google-Smtp-Source: APXvYqyxVVDbLBd/lmNb4rlXWNpQ7yGIHb1PMpq6KlcPnN//NYJPYejDZJ4hsW8yo4QfV3ZZexu8Gg==
X-Received: by 2002:a5d:6506:: with SMTP id x6mr836883wru.22.1568055349493;
        Mon, 09 Sep 2019 11:55:49 -0700 (PDT)
Received: from kozik-lap ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id s26sm28793706wrs.63.2019.09.09.11.55.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2019 11:55:48 -0700 (PDT)
Date:   Mon, 9 Sep 2019 20:55:47 +0200
From:   "krzk@kernel.org" <krzk@kernel.org>
To:     Yao Lihua <ylhuajnu@outlook.com>
Cc:     "kgene@kernel.org" <kgene@kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] ARM: SAMSUNG: Fix system restart support on s3c6410
Message-ID: <20190909185547.GC10091@kozik-lap>
References: <BY5PR12MB3699F7EF4920F878F3096DE7C4B50@BY5PR12MB3699.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <BY5PR12MB3699F7EF4920F878F3096DE7C4B50@BY5PR12MB3699.namprd12.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, Sep 07, 2019 at 03:30:01AM +0000, Yao Lihua wrote:
> From: Lihua Yao <ylhuajnu@outlook.com>
> 
> S3C6410 system restart is triggered by watchdog reset.
> 
> Fixes: 9f55342cc2de ("ARM: dts: s3c64xx: Fix infinite interrupt in soft mode")
> Signed-off-by: Lihua Yao <ylhuajnu@outlook.com>
> ---
>  arch/arm/plat-samsung/watchdog-reset.c | 1 +

Thanks, applied.

Best regards,
Krzysztof

