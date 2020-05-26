Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6F6D1A6520
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 13 Apr 2020 12:22:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727914AbgDMKWr (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 13 Apr 2020 06:22:47 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:39572 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727813AbgDMKWq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Apr 2020 06:22:46 -0400
Received: by mail-ed1-f68.google.com with SMTP id a43so11386019edf.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Apr 2020 03:22:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pwP7u9356HICdul3WrwgiXNRZ4gU042dmpG5p2MC8XQ=;
        b=aEGGABy4W54liAFExrx8AaZZ5rgW7Wwg7zSQOT7wteH/LFGm610la5CmtqiWjXqnpR
         yMj1lyS/+iW+j7hjDpa+eZWUAQfWMt7I51WFf8nIwGNcVovtd0Y+8p6lgqGSqZ91/8fD
         f4slpJjnrebCnJ8QGJkEhJOSZrq8jJJXuYAxkcEPFK0Y77KPzU2r1WRa5W4xHEltgZBi
         a4n+znUDlxzvx8yhI1vYfU1G6bKOlDyCFZgPBkghJlGDEI5Kr9LpiSJYx+txa+k6A6Jb
         xbjIvNZW0wgGchi0PfmiJ5GfKwlGNPUDVLIT+tC4PiuzTRfrgEnphlGThyRygS7CZGBZ
         VG6w==
X-Gm-Message-State: AGi0PubdA3KieHiW8D1Y7Bpf8hSoS8FN3k1bQdt/oMfr0yUUnmA1wZ/e
        kte6IsvC3IsAC/kTBQLHxCA=
X-Google-Smtp-Source: APiQypIfsUADGKnbBAqg35sP83ncJl1d9WOPpPOHKuet5wfuvuHw9IjS5BxeVSb6KiwuXxgBiAX8zA==
X-Received: by 2002:aa7:d786:: with SMTP id s6mr15256424edq.306.1586773364805;
        Mon, 13 Apr 2020 03:22:44 -0700 (PDT)
Received: from kozik-lap ([194.230.155.125])
        by smtp.googlemail.com with ESMTPSA id j14sm1578587ejy.72.2020.04.13.03.22.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Apr 2020 03:22:43 -0700 (PDT)
Date:   Mon, 13 Apr 2020 12:22:41 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 4/4] ARM: exynos_defconfig: Compile MAC80211/CFG80211 as
 modules
Message-ID: <20200413102241.GB10535@kozik-lap>
References: <20200326094626.28308-1-m.szyprowski@samsung.com>
 <CGME20200326094635eucas1p2fab15692c98fc148388a6922dc0d121f@eucas1p2.samsung.com>
 <20200326094626.28308-5-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200326094626.28308-5-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Mar 26, 2020 at 10:46:26AM +0100, Marek Szyprowski wrote:
> MAC80211/CFG80211 framework requires loading regulatory.db from
> /lib/firmware directory, so it makes very little sense to have it
> built-in. Change it to be built as modules to let it properly load the
> needed firmware/db files. As a side effect of this change, the size of
> the compressed modules on SquashFS increased significantly from 27MiB
> to 38MiB, so increase the size of BLK_DEV_RAM to allow the modules to
> fit into it.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/configs/exynos_defconfig | 6 +++---

Thanks, applied.

Best regards,
Krzysztof

