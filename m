Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A4FC2166A3
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  7 Jul 2020 08:46:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727038AbgGGGp1 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 7 Jul 2020 02:45:27 -0400
Received: from mail-wr1-f49.google.com ([209.85.221.49]:36008 "EHLO
        mail-wr1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726540AbgGGGp1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jul 2020 02:45:27 -0400
Received: by mail-wr1-f49.google.com with SMTP id k6so43923765wrn.3;
        Mon, 06 Jul 2020 23:45:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ERqLpgfazVzIw/b9f5OpejET82CJrHcalCz0kjdAajo=;
        b=CXnXL3jwiaoGSsD/91Xrbx9wVqJA5Tx6b+edF5wicjnXGoYMAdWUnICboAq9Iujiv1
         MW/bYNCFEZ0BtK2E3rVq1oKz4BVGwrdbMxHwG2kqoD5HXZnbx1GBoCdlXjw18x0ZrJiU
         FqDlfR5oYYNc8JpOsHM2Wfx3R9LWa3lfKRCL9FXRk3ATJ05ztKBO0i3GnckfDBTZNt1F
         vSZkMMXrxszMd+/L857QOSieYGdrRyJM0sRYB+noWd4mm55+02hvYW9KGfvSkgMecJpf
         6R6ITiOodKGphBeNWmTIKW6XTuNGgfNOGtr24rupBgNGH/vsf0lY5BEw24V1kp+ED6Ku
         rdww==
X-Gm-Message-State: AOAM531p9ZEX1nolP3vrl5IqM+JF0GtfjxxfgU1STrexVDF0TJg8Z7QL
        odbQTaK0HpezUdevoTw8FTQLy7rD
X-Google-Smtp-Source: ABdhPJyt6bbatltHwrOpH4eDbBJl7tfU7hG03iJoVsuknlfh4nEFVlOQ+d8AP38u/MFLWZGiBLeOkA==
X-Received: by 2002:adf:e6c1:: with SMTP id y1mr25302092wrm.116.1594104325131;
        Mon, 06 Jul 2020 23:45:25 -0700 (PDT)
Received: from kozik-lap ([194.230.155.195])
        by smtp.googlemail.com with ESMTPSA id k126sm2232332wmf.3.2020.07.06.23.45.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jul 2020 23:45:24 -0700 (PDT)
Date:   Tue, 7 Jul 2020 08:45:22 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [RFT 2/3] arm64: dts: exynos: Add unit address to soc node on
 Exynos5433
Message-ID: <20200707064522.GC15031@kozik-lap>
References: <20200629193338.29540-1-krzk@kernel.org>
 <20200629193338.29540-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200629193338.29540-2-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Jun 29, 2020 at 09:33:37PM +0200, Krzysztof Kozlowski wrote:
> Add @0 unit address to 'soc' node match its 'reg' property and silence
> DTC warning:
> 
>     Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Not tested on HW.
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 2 +-

Applied.

Best regards,
Krzysztof

