Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2E5DA5AD9
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  2 Sep 2019 17:54:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725830AbfIBPya (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 2 Sep 2019 11:54:30 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51136 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbfIBPy1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 Sep 2019 11:54:27 -0400
Received: by mail-wm1-f67.google.com with SMTP id c10so3201408wmc.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Sep 2019 08:54:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CDEjyCo5ZOdNRThV6Hb6ycwISVyUSHmo+4YRzMBGWHg=;
        b=QI/SKzYA/M0yRbX9efDj35a7NFZWz1iv8DyXbIa1IVKYen3vCUYzIx+Ox9vkyT1WB6
         KujfUlpNXssKxG+aC7AR1q7IV5opT9h5EZ6xjuauu8JoFssi3DUYOoVPACDbpat1GitR
         XL2s75nrL+QhWS0JaDz2KPgVOmxOViizJSNe210zXG4ZCp8q+YuI4CVQv700IIFXPVjy
         3HMUdOxl3/2aNntu3hu3UP2vZMEgyjVqWiz9KRA8YfDLX4T5ZeCCw7qu2hkw3AP9jBLm
         qBRPCSWkvORj02h4Xsq68rWR425IArvJov/A5WKSsPOd5YlMS/iKzsMTwulI2ONQWYco
         oc3w==
X-Gm-Message-State: APjAAAXhVF8e4KB+UgGeikQFkUpzvmprKg72up2sm+zSknXmVIP5DCwY
        8aUW8+I+3bi9pFOHm2+XAyyhoyjL
X-Google-Smtp-Source: APXvYqx5FbD9fwB4WVj+9PkR1nusoj7UGQlQJlM6QgP3CAXQpfNCDUCzlNmAdaCWo6vT+tMLowM9zQ==
X-Received: by 2002:a1c:f50c:: with SMTP id t12mr37157794wmh.49.1567439665822;
        Mon, 02 Sep 2019 08:54:25 -0700 (PDT)
Received: from kozik-lap ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id b194sm34131397wmg.46.2019.09.02.08.54.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Sep 2019 08:54:25 -0700 (PDT)
Date:   Mon, 2 Sep 2019 17:54:23 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Make MAX77802 regulator driver
 built-in
Message-ID: <20190902155423.GC9289@kozik-lap>
References: <CGME20190830130425eucas1p1b6806fad77366797271e70ce8ef4d296@eucas1p1.samsung.com>
 <20190830130416.10420-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190830130416.10420-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Aug 30, 2019 at 03:04:16PM +0200, Marek Szyprowski wrote:
> Maxim 77802 PMIC is a main PMIC for the following Exynos5 based boards:
> Odroid XU, Chromebook Pit and Chromebook Pi. Driver for its voltage
> regulator is needed very early during boot to properly instantiate SD/MMC
> devices and mount rootfs, so change that driver to be compiled-in.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/configs/multi_v7_defconfig | 2 +-

Thanks, applied.

Best regards,
Krzysztof

