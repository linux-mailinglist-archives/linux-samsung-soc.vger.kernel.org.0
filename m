Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCB2AAABFD
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  5 Sep 2019 21:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389110AbfIETah (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 5 Sep 2019 15:30:37 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54028 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390542AbfIETae (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Sep 2019 15:30:34 -0400
Received: by mail-wm1-f65.google.com with SMTP id q19so4059374wmc.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Sep 2019 12:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2SnnthC9qPoj849L5cEcvDt68pSJT2UuSyXl5Z+polU=;
        b=SW/uWqyEzMk5olNdIXL6uhAruSvmmV/Lpz4TEy0rOO5eCpiN0Bl/v9IyxJ09ynPYwh
         h5S+weJF3IYVA1MIfIWETfrQCYrjAuilCZ5fRQPXf+uwJKoTM7n5xi9A75U22cxBRlkW
         tF8Ooaylnsj8Dio1sKGzfDgE0WHLqK/NuSamG/NwNSUm4PF3/pRwMXa7vj4Z70ZMnDJW
         8sSAVHNno+8PvC4jllXANaO6Enl81KP+sNlPjntwap6ZkwToqHKC04QwUeuGSlu0Mhnc
         OTW9wTRD64HTnWSdUPMFtH8e5aUCiUbtv6U5mgM/lcV4sSxsqNZFJ6cnZyvH33SxaY05
         gaLg==
X-Gm-Message-State: APjAAAWFQSPkLoMXN6fu3LRKED9MYda7dLBL9IU6e0TcL76XCPMGXZjF
        TYfEhZuyaqwqWoQiD7N/4ag=
X-Google-Smtp-Source: APXvYqwxWgjpMLfgRJ3yAOwmNMi4m1NZbyufY90KE64RisFkuqO7be+G1G1yEj8ETKyiBQjYMv6UJw==
X-Received: by 2002:a1c:24c3:: with SMTP id k186mr4276129wmk.126.1567711832177;
        Thu, 05 Sep 2019 12:30:32 -0700 (PDT)
Received: from kozik-lap ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id s19sm6153280wrb.14.2019.09.05.12.30.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Sep 2019 12:30:31 -0700 (PDT)
Date:   Thu, 5 Sep 2019 21:30:29 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH] arm64: dts: exynos: Propagate address/size cell change
 to /memory node
Message-ID: <20190905193029.GA14144@kozik-lap>
References: <CGME20190904084834eucas1p20aff0f98a90b9c6939d9113932919aff@eucas1p2.samsung.com>
 <20190904084829.23944-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190904084829.23944-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Sep 04, 2019 at 10:48:29AM +0200, Marek Szyprowski wrote:
> Commit ef72171b3621 ("arm64: dts: exynos: Remove unneeded address space
> mapping for soc node") changed the address and size cells in root node from
> 2 to 1, but /memory nodes for the affected boards were not updated. This
> went unnoticed on Exynos5433-based TM2(e) boards, because they use u-boot,
> which updates /memory node to the correct values. On the other hand, the
> mentioned commit broke boot on Exynos7-based Espresso board, which
> bootloader doesn't touch /memory node at all.
> 
> Reported-by: Alim Akhtar <alim.akhtar@samsung.com>
> Fixes: ef72171b3621 ("arm64: dts: exynos: Remove unneeded address space mapping for soc node")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 2 +-
>  arch/arm64/boot/dts/exynos/exynos7-espresso.dts       | 2 +-

Thanks, applied.

Best regards,
Krzysztof

