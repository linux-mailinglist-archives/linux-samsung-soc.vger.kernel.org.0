Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E05AA195703
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 27 Mar 2020 13:21:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbgC0MVY (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 27 Mar 2020 08:21:24 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:35530 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727347AbgC0MVX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 27 Mar 2020 08:21:23 -0400
Received: by mail-ed1-f67.google.com with SMTP id a20so10868060edj.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Mar 2020 05:21:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TrZcqdYFx4XfO7sWENUpv/Cp1NjE+IJdJkUVXSkL7Wo=;
        b=oNMdVnF+e6VFl15gbeogFlhqd7qEsHD2BuXgRq4VLxqteN7Fk1AcvdCCDwMOlqccjy
         yz+Wpu2cUYOQ5ZsV9TzyF5QzPSqu1aN+VT3Xry3uoYaExFVwGZIMxBgbrgw0fY9YRsdG
         BEKV2ngp/oAfR/8k6PDgS/2CLwBZfBZW91YvO1sHtvgjpaWAzReNDa7BTm8Siusdz1rT
         o/3UJNdx/oyRzQ/1qPbqOZBLRj8VY51wFs7cr5Ah5FjZi+cap5eWcv1aWv5NVYjxFwY/
         nQEVeKByFma5QqkdRfmMecNJlSAox7Lb9yMzYdmxofIQFT+ufXZzP5PlQb3GRf930a4+
         SDbw==
X-Gm-Message-State: ANhLgQ363F2A9fAS8G+F9ZopMSotQM97tnT9wUgUvUlO6BlNLwxcz1rm
        wiOtLMI9lTl7N8FD8Hnmg+JJ3NJ3
X-Google-Smtp-Source: ADFU+vta2a0F5yr8c9ElswL+qWQQv+d78ii7TiRD4KejPrEav5fMIjnj1Luj3hIP6oS0/dG8RdYGCg==
X-Received: by 2002:a50:99c4:: with SMTP id n4mr13287303edb.187.1585311681674;
        Fri, 27 Mar 2020 05:21:21 -0700 (PDT)
Received: from kozik-lap ([194.230.155.125])
        by smtp.googlemail.com with ESMTPSA id a4sm835646edq.28.2020.03.27.05.21.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Mar 2020 05:21:20 -0700 (PDT)
Date:   Fri, 27 Mar 2020 13:21:19 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 1/4] ARM: dts: exynos: Enable WLAN support for the
 UniversalC210 board
Message-ID: <20200327122119.GC7233@kozik-lap>
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

Thanks, applied (for late pull).

Best regards,
Krzysztof

