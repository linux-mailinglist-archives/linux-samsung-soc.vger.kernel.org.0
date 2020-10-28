Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 560D429D4AA
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 28 Oct 2020 22:53:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727827AbgJ1Vxz (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 28 Oct 2020 17:53:55 -0400
Received: from mail-ej1-f67.google.com ([209.85.218.67]:34787 "EHLO
        mail-ej1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728613AbgJ1Vxx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 28 Oct 2020 17:53:53 -0400
Received: by mail-ej1-f67.google.com with SMTP id gs25so1071908ejb.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Oct 2020 14:53:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BuyyM/2N8Pq3sjDNwBuD9V5CCeu8Yl6jZhDyQdvFMgo=;
        b=H5qR9ZjDmiKreim4VXvb/wQgq1qhZqam/+j7a1cRLFf/nngFOrTTDKZvVtjVY7xZzO
         bd55FfdFf3tHmihgkp4ufrDK814fLItx7bMKQZF8wwWEWRdXA4ghtKhedFrwjx+We9ev
         dwbAHOeo2Nex3KK3kSkYm9//s9WpUIyUirLtS/Xuq/KmcsIzNmDhsg8O6KEjWWZSxdKf
         4utY1BuRF/VoMubjXQ+H8+OEgvpO2pEMq+cfK/dk3u5vQTmtykkEz4lVEPK2T5p6bTtv
         1XP97c3Em8v2rzzjXmgIwwZbxjekMCGkX+26E+n01cvY99PWvt+0xRa5GIy6d9gXSHNk
         JAGQ==
X-Gm-Message-State: AOAM530z4pmTxb4YvzW0OEdpuaXMFvkEYFZyf4j/yqjHAuwQWpBfWHho
        JtfH3isccPvhW2kCECFh14U7V8lM4Zk0eA==
X-Google-Smtp-Source: ABdhPJypAFec397uCVkkSr9TjGWvvyoI0n+PpkBOGpnKYe0IjswSMRySEL/J43Uk7eSVCdhPmo5HPQ==
X-Received: by 2002:a17:906:284b:: with SMTP id s11mr785249ejc.326.1603915317144;
        Wed, 28 Oct 2020 13:01:57 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id j20sm383274edt.4.2020.10.28.13.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 13:01:56 -0700 (PDT)
Date:   Wed, 28 Oct 2020 21:01:54 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v2] ARM: exynos: Simplify code in Exynos3250 CPU core
 restart path
Message-ID: <20201028200154.GA171974@kozik-lap>
References: <CGME20201027201724eucas1p213868f9a53639d3e03ff81785d3b1c8d@eucas1p2.samsung.com>
 <20201027201716.15745-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201027201716.15745-1-m.szyprowski@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Oct 27, 2020 at 09:17:16PM +0100, Marek Szyprowski wrote:
> exynos_core_restart() is called by secondary CPU boot procedure, used by
> CPU hotplug and coupled CPU idle. Replace of_machine_is_compatible() call
> with a simple SoC revision check.
> 
> of_machine_is_compatible() function performs a dozen of string comparisons
> during the full device tree walk, while soc_is_exynos3250() is a simple
> integer check on SoC revision variable. This change also fixes the

Thanks, applied.

Best regards,
Krzysztof

