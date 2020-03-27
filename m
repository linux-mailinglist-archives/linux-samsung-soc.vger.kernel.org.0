Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA036195796
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 27 Mar 2020 13:57:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbgC0M5p (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 27 Mar 2020 08:57:45 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:35834 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbgC0M5o (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 27 Mar 2020 08:57:44 -0400
Received: by mail-ed1-f65.google.com with SMTP id a20so11019729edj.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Mar 2020 05:57:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NcKjqN1upaqpzE7za+ZtrNWOhsaRpf6a7xwnMWAmkR4=;
        b=aV5dGABwrRKJEv8G4EU86fOj7v3PkqaaLC5GVCvFVbYH68oW1VnTY4f1G0ZHd8edC4
         hXB9my5e7uCNe6AMQ3BBH+SI/rtqJBWuZPTtNhsmWt5dOabATFIjr7OZyy0bMalTLcBs
         6YNQtidtPOBgi1xJHeZ5qhZUckzjNnm9lvSo5FICgoxTaK37kyUv5/ZLs/Yoz4jmSv7b
         Iyk2KKLl1H4lVt5geCEGd9kJOQ+wBbVgOlSizCXUH9m76Dt4x1NGCsnaeQ2CG1UUcO09
         3nJ2rIk+J+XgvnocA5MxWpQHY57Mhn3dj7sQM4KSb11S/EBErRwc4K98Swz5lJGAkkhe
         XVzg==
X-Gm-Message-State: ANhLgQ1R/v4aYT3j0diuQBWHfouSKoNqFt9ldvbS5TelIp9QYb+PTALa
        R9DaoeN/R7DFBMO5H66yNAc=
X-Google-Smtp-Source: ADFU+vu2GEC9lGI/ciBrzSkuZwvz8iXI2Q3MfZSzDT2KGzA9LLv47nSNVVI3aQVOfT0P4H4pkOaebw==
X-Received: by 2002:a17:906:784c:: with SMTP id p12mr12261748ejm.296.1585313861788;
        Fri, 27 Mar 2020 05:57:41 -0700 (PDT)
Received: from kozik-lap ([194.230.155.125])
        by smtp.googlemail.com with ESMTPSA id j8sm743713ejd.91.2020.03.27.05.57.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Mar 2020 05:57:41 -0700 (PDT)
Date:   Fri, 27 Mar 2020 13:57:39 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v2 3/4] ARM: dts: exynos: Enable WLAN support for the
 Rinato board
Message-ID: <20200327125739.GA9886@kozik-lap>
References: <CGME20200327125321eucas1p2bdd8cc5b224c24f6e3eeac6f9c38ce41@eucas1p2.samsung.com>
 <20200327125317.19955-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200327125317.19955-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Mar 27, 2020 at 01:53:17PM +0100, Marek Szyprowski wrote:
> Add a node for BCM43342A SDIO chip on MSHC bus #1 and the required MMC
> power sequence node for the Exynos3250-based Rinato board.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos3250-rinato.dts | 34 +++++++++++++++++++++++++

Thanks, applied.

Best regards,
Krzysztof

