Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B4181698B6
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 23 Feb 2020 17:57:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727004AbgBWQ5Y (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 23 Feb 2020 11:57:24 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:34369 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726208AbgBWQ5X (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 23 Feb 2020 11:57:23 -0500
Received: by mail-ed1-f65.google.com with SMTP id r18so9058024edl.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Feb 2020 08:57:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3IUVV3X8OYOYY2TpM5wzIsFDVrlZXoZteTa7Dkbrksg=;
        b=dKwN6JdFW2zYXaJGJJHdbsQiLJQCd1LLGWRSwRTJqtFVDqfIprgF29FremZC/a3l8a
         F+AE1i1vxg+M/JAWCfe4nlSrD5WsmOVTs3cP34trJzTX79mov+NRNQCGpIziwb4+RqCx
         RmxJsvCx25yYb0s4KUynw//QNECRk6J6ysvnStsjkzg8W2nuVZCbTESgKx3Yc4c/IBDs
         QXP6GfmlSHVElogjiZx2Z+Mkh1riHs5OJFWQvLXE/rDAX8b/ne0XEXZu/QhTDwGwnGJm
         q9c9eKCHBzHKWn+LA+/FJgj+ohX6h6mnpJKmY2odJwdiXHI6Vhbnixi+CongswF32Tju
         /pVQ==
X-Gm-Message-State: APjAAAUe2FutBKuTghWqYe46BswRi3h1Mb4ymqgw56RMj15aVdXmzG+1
        g4KBum+r7ePEy5F9Hx57EBKva/xPuBY=
X-Google-Smtp-Source: APXvYqzKtBMES4aeMBsfeOEraN50Si7oSdgC4Fza4oquBbN5g6bzO5zum/u/87EQVMh7OUymtGJsaQ==
X-Received: by 2002:a50:fd93:: with SMTP id o19mr43150142edt.28.1582477040786;
        Sun, 23 Feb 2020 08:57:20 -0800 (PST)
Received: from kozik-lap ([194.230.155.125])
        by smtp.googlemail.com with ESMTPSA id gg24sm652744ejb.68.2020.02.23.08.57.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Feb 2020 08:57:20 -0800 (PST)
Date:   Sun, 23 Feb 2020 17:57:18 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 2/2] ARM: dts: exynos: Make fixed regulators always-on on
 Arndale5250
Message-ID: <20200223165718.GB12143@kozik-lap>
References: <20200220142806.19340-1-m.szyprowski@samsung.com>
 <CGME20200220142816eucas1p2469c4e011e192517b492c0203443234f@eucas1p2.samsung.com>
 <20200220142806.19340-2-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200220142806.19340-2-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Feb 20, 2020 at 03:28:06PM +0100, Marek Szyprowski wrote:
> The fixed regulators defined for Arndale5250 boards have no control lines,
> so mark them as 'always-on' to better describe the hardware and also kill
> the strange messages like 'MAIN_DC: disabling' after boot.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250-arndale.dts | 6 ++++++

Thanks, applied.

Best regards,
Krzysztof

