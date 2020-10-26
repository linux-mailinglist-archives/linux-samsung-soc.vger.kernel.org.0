Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9A6C2995AE
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 26 Oct 2020 19:47:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1790293AbgJZSrs (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 26 Oct 2020 14:47:48 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:44905 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1790292AbgJZSrr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Oct 2020 14:47:47 -0400
Received: by mail-ed1-f68.google.com with SMTP id t20so10518247edr.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2020 11:47:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PrIoCBwzUSlx/THGbiK+CROfQ5406JYfLtuyobBW8KI=;
        b=Vg8GQGzEIKJUkK4xd2pLAR12AoojUldA8dlKiIZvbtjI40uX8C7mqxlCBpCuuqzKZJ
         CXdxwRxYZLWe/Fb1SS2DhYpMDwsYtCeoTS5YA2WwpactgzID6Ve5Ax8G1nTH2BazmU7R
         XqvPPjEABbpeemBkmTDI19w1mPJkQgEK0GOeH7di/Y+OjD6njcEGoS9gCG78L/8izqJs
         V6zNtBacpG7Q9dWyNM9D7b0ZABf6bqS8CrkpDRjRLO0vvMb274zvRkypuQf9doRuI1w0
         FKmM2cKCMb9ANFQn45kiaycz96xKSJUHwx2eTSpsDKfeaqgQSTDBRwSDFqi2T/9/wHr9
         uEzA==
X-Gm-Message-State: AOAM533y8LdcXDcZYS1GUioBmY14rzh8gcjA3TPQav2RDhO0CzrtU34k
        4FuRtf4ePlMBTelm+09BomatZpNZiLY=
X-Google-Smtp-Source: ABdhPJz440vSMSbMt3MdqMB5KptjZQEwKVgN5NqZJ2MeFeLQ1OFnRBqMC0zPujKB2b7M6CjiL9bNxg==
X-Received: by 2002:a05:6402:2292:: with SMTP id cw18mr17583774edb.112.1603738065023;
        Mon, 26 Oct 2020 11:47:45 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id h4sm5602680edj.1.2020.10.26.11.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 11:47:44 -0700 (PDT)
Date:   Mon, 26 Oct 2020 19:47:42 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: multi_v7_defconfig: enable sound driver for Midas
 platform
Message-ID: <20201026184742.GC165725@kozik-lap>
References: <CGME20201009134913eucas1p26b18e593aaa4dcbf54fcec7218abba3f@eucas1p2.samsung.com>
 <20201009134907.4578-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201009134907.4578-1-m.szyprowski@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Oct 09, 2020 at 03:49:07PM +0200, Marek Szyprowski wrote:
> Sound driver for Midas platform (Exnyos4412 SoC based) has been recently
> merged, so enable it for tests like other sound drivers for Exynos based
> boards.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/configs/multi_v7_defconfig | 1 +
>  1 file changed, 1 insertion(+)

Thanks, applied.

Best regards,
Krzysztof

