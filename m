Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62D782166A5
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  7 Jul 2020 08:46:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727107AbgGGGqF (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 7 Jul 2020 02:46:05 -0400
Received: from mail-wm1-f41.google.com ([209.85.128.41]:33692 "EHLO
        mail-wm1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgGGGqF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jul 2020 02:46:05 -0400
Received: by mail-wm1-f41.google.com with SMTP id a6so1028864wmm.0;
        Mon, 06 Jul 2020 23:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LZY4QYexNFxT6TqFL0Caw2AQdp+94mhDbGktkxzUk58=;
        b=aRtzeXJoQq3zvtGUfShYA172LUEHdOCo5dyYJ2ccfSLsGjoJTJEL3yQlcx+sfUwfLW
         CjUoEMhDmRbcvp1bMzKIKHaYx5/OuP/2sBAbCKohVGuGrH27QenaTlvL1mK7p6WDFnAR
         za9CQ6er2rwM/i9UTiQ90LpSk6mD3h3WvB2tOyhk44p8WltT9kSjd94FAsthdlqoy7v3
         I1qNVyUaTRsPkw93XKTrsXHQs2glNUJIawUVO44AFVSDXpcFQeuGHrwdPZtZtueLxQ2r
         H8SFCX/eY081/5mm03Fw761rSCuclieVM/B2GsEBUHoWCLAbULLtx3TuvcFky4kE1BLU
         OHyA==
X-Gm-Message-State: AOAM533PulPs5R/IZx05Ll3g4E7sYZW/9uuror0JX5aIpGuuA0Ve/q8k
        Oc0C3lslU+jU1S85jKBJhZ0=
X-Google-Smtp-Source: ABdhPJziNI/S3TzI2xPuhc6soNVAjOlNsFWHMGrc0DQfWgB7P9NwL35zvKimFDVT4ifwVkQ5s668Ow==
X-Received: by 2002:a1c:804c:: with SMTP id b73mr2530042wmd.59.1594104363178;
        Mon, 06 Jul 2020 23:46:03 -0700 (PDT)
Received: from kozik-lap ([194.230.155.195])
        by smtp.googlemail.com with ESMTPSA id 51sm22103085wrc.44.2020.07.06.23.46.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jul 2020 23:46:02 -0700 (PDT)
Date:   Tue, 7 Jul 2020 08:46:00 +0200
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
Subject: Re: [RFT 3/3] arm64: dts: exynos: Add unit address to soc node and
 move thermal zones on Exynos7
Message-ID: <20200707064600.GD15031@kozik-lap>
References: <20200629193338.29540-1-krzk@kernel.org>
 <20200629193338.29540-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200629193338.29540-3-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Jun 29, 2020 at 09:33:38PM +0200, Krzysztof Kozlowski wrote:
> Add @0 unit address to 'soc' node match its 'reg' property and move the
> thermal zones out of 'soc' to main root as it this is usually not a
> property of a Soc.
> 
> This silences DTC warnings:
> 
>     Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>     Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Not tested on HW.
> ---
>  arch/arm64/boot/dts/exynos/exynos7.dtsi | 20 ++++++++++----------

Applied.

Best regards,
Krzysztof

