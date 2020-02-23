Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4E9A1698B5
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 23 Feb 2020 17:57:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbgBWQ5P (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 23 Feb 2020 11:57:15 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:37414 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726208AbgBWQ5O (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 23 Feb 2020 11:57:14 -0500
Received: by mail-ed1-f67.google.com with SMTP id t7so9041235edr.4
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Feb 2020 08:57:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2FzUXwUXf0lBCtUoB2+Zk/V+RMw6Km7pdObzYLoiZXs=;
        b=R/vxNKyWvqIVbs7IhSaHlIpUKl1m11vSnipwh2WuE4aOSv8jluAw8K9cP5Lb45KklB
         807A3T7TySBPRV+25N7lNwKfExxMHNjSrimTdfilqeIw2qUaNSF6Q4bzvejn1dN8/PJU
         58VerouTjpVjuCASNxYsFPaFY2IjPF8xY8UUaGvSCO2BjgQfzhSpSWWFcOohSAmI7beu
         1eDGE0O2hHOFJYiRjk0RKxC99IB2L81MuFZ4YL2loJw55J5btLhprtZTkqjv5rW6OcLh
         G2adQn2oFYL/74XndCPtjPWPq9QqPpc2CquFGiktkBrYJwbTJSmrLjouej+7qWRvOThu
         i5NA==
X-Gm-Message-State: APjAAAX2+Ad/75TlOpoAB4Bkz89llGroLTZ8bFQiABsMo+JpPk5cDxvl
        GLOR1mRZnjzFyTqQyhEQ6X4=
X-Google-Smtp-Source: APXvYqyOo0dhJi0ljKlS2mm3pUScux4AdVQAWIhSfroT9MPvHdzH1K0V1xjOTNYaFi+8cYm6679tdA==
X-Received: by 2002:a05:6402:1c95:: with SMTP id cy21mr42693316edb.73.1582477033011;
        Sun, 23 Feb 2020 08:57:13 -0800 (PST)
Received: from kozik-lap ([194.230.155.125])
        by smtp.googlemail.com with ESMTPSA id p16sm824635edr.83.2020.02.23.08.57.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Feb 2020 08:57:12 -0800 (PST)
Date:   Sun, 23 Feb 2020 17:57:10 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 1/2] ARM: dts: exynos: Fix MMC regulator on Arndale5250
 board
Message-ID: <20200223165710.GA12143@kozik-lap>
References: <CGME20200220142814eucas1p2a230d064c9cebcc029ce12b228fd31ac@eucas1p2.samsung.com>
 <20200220142806.19340-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200220142806.19340-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Feb 20, 2020 at 03:28:05PM +0100, Marek Szyprowski wrote:
> According to the schematic, both eMMC and SDMMC use dedicated fixed
> regulators connected directly to the DC5V and MAIN_DC rails. Remove the
> GPX1-1 line assigned to the MMC regulator, because such control
> connection doesn't exist. Also change its name to VDD_MMC to avoid
> conflict with LDO18 output of S5M8767 PMIC.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250-arndale.dts | 4 +---

Thanks, applied.

Best regards,
Krzysztof

