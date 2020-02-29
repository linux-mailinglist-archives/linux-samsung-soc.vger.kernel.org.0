Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CF0A17476E
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 29 Feb 2020 15:42:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbgB2OmN (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 29 Feb 2020 09:42:13 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:46811 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbgB2OmN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 29 Feb 2020 09:42:13 -0500
Received: by mail-ed1-f65.google.com with SMTP id y3so514383edj.13
        for <linux-samsung-soc@vger.kernel.org>; Sat, 29 Feb 2020 06:42:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=r0jYQ9Lkyx2j6UUfLaKBhXDTyzq9tmE/1GtdczOsUmg=;
        b=IlnoN8kUiqadPSUELDy3RwijAg+1lJPh6bSqM0oiHSgBl69ElmP1xO6vHudfn1sl4J
         1fuSaSSqUWBzs/CyvcSfzZVDPnc/dcS656/yjsnTdBcCXg5Fa1Ac9Yu1xFyfrLAiCzmi
         rgEUioE3bxc8ab/bI8AUje9c+iGOX2Rf1UWQ1Uk9x0J8gzRONZUBo4b+VEf288lqiHno
         TtZ7y11IdSHxDgXYoR/nfYFU39kE3FZZ+OxfSiKYCLSOctqE2OQ12koTnhZ0yCtkHGHA
         EDPEPYmj+Zu1lV33N79yjM3NuMs6bhgECFxVRHqgPDx3srFNtsWRgFMy176qBO2+/b+5
         34Tw==
X-Gm-Message-State: APjAAAVuEeG2NdSpsO8IncdaMkN5vumwWzvbQdaUSESgMED+Tdwy4GZ2
        jgnliXERyleAT+Vq0BFGMuKEmKc5nks=
X-Google-Smtp-Source: APXvYqxSu6j1HeGLioc7jEO6e7g1681+/CtfPz5fKSESUS+hzZmpy6IgOolD11yRJqkScFqR7XQQgQ==
X-Received: by 2002:a50:e3c5:: with SMTP id c5mr9007584edm.7.1582987331892;
        Sat, 29 Feb 2020 06:42:11 -0800 (PST)
Received: from kozik-lap ([194.230.155.125])
        by smtp.googlemail.com with ESMTPSA id g31sm699342edd.53.2020.02.29.06.42.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 29 Feb 2020 06:42:11 -0800 (PST)
Date:   Sat, 29 Feb 2020 15:42:09 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] ARM: exynos_defconfig: Add more drivers for
 GalaxyS3/Trats2
Message-ID: <20200229144209.GC29448@kozik-lap>
References: <CGME20200226105720eucas1p183b65dcbc29d25cc8599d7e2ca050e01@eucas1p1.samsung.com>
 <20200226105710.18023-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200226105710.18023-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Feb 26, 2020 at 11:57:10AM +0100, Marek Szyprowski wrote:
> Enable drivers for S5K6A3 and S5C73M3 camera sensors, AAT1290 flash LED,
> Midas-TouchKey and BRCMFMAC SDIO-WIFI modules used on Samsung Galaxy S3
> and Trats2 boards.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/configs/exynos_defconfig | 6 ++++++

Thanks, applied.

Best regards,
Krzysztof

