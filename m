Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9565A3976A6
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  1 Jun 2021 17:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbhFAPaq (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 1 Jun 2021 11:30:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230523AbhFAPap (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 1 Jun 2021 11:30:45 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 885D8C061756
        for <linux-samsung-soc@vger.kernel.org>; Tue,  1 Jun 2021 08:29:03 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id c5so3616187wrq.9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 01 Jun 2021 08:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=4Fw9dpKXbERV/dKFcemxtYQKsc73Y6U63vbXSE3Oibo=;
        b=MTbzdsjNuV883Tx57hU16YOhd3i7RXIpP8zs8pv0uD50ckDIlzXxIKzXYGr/NNkvot
         rAkly4+qadmOVQKTiYMwLUAc7wS1kBGx6V9seHLHMOocxZIizZE+tUKRoU9/Zy3V4Lxv
         DZ0mRqVgRW60G9feA7VVScu+cle+Jb8WE0PpghvVmneKLpX1tILOaIswrLDS7Hyq/Pb2
         U1PDcaULLVjtvL8e0ih8mmOQwcV0ohxaa1KgjQ4PplyoT67uF3SiXxtyFy/gPo4QAik8
         k2vS6lXxDALL3CnYj2IkklTPL8KVdSvyiDrGXTCji8rWOsMnIUaWByBXXDgxxY+nBvwz
         kHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=4Fw9dpKXbERV/dKFcemxtYQKsc73Y6U63vbXSE3Oibo=;
        b=FitgFlpXdsDG45woHKUIJ51Y/GjcAdVL41joAAr1sKq3wEGLXeDTP9ySPyrXFfl1+y
         2ZaWamq4e5avQ31GmV75jHv8KoHHpQAiHD0syLG7Lai1bTaR7qs3SLQ/esAXzXIpnPaY
         Uvk2MsI4+1trGUy6mXw/YqkrEONC7DEJ/gc67UhBgxKiK/I8SEvQAaUE3xlvvHmAIjuG
         5QvWBsKe4quxZp1H4CfUn1TmNfsyp4dQghiyRFmZPhD9ugRqF1u8UsjuWXtazHod1/zR
         MkO31wiOncAzgFg6kmuLp2DtH073kCvfJAyfo6hfSHnlfULNJmH1EtCylk2tzKWhJWpj
         MHjw==
X-Gm-Message-State: AOAM532HDGubgURgCslXmdMAJ+jJRYIxjnictwTPhFL3Whl6CSh+VyTU
        kKjvzx/1i/Po96wI9rdvLxF1qA==
X-Google-Smtp-Source: ABdhPJwlEHUfYNe8eojetGb5Wl0PUicjjf8/xWeiO5HFCYB0h6dHGOk4lwEoOx8pmGanLLNRuWgvwQ==
X-Received: by 2002:adf:f7d1:: with SMTP id a17mr10628419wrq.84.1622561342123;
        Tue, 01 Jun 2021 08:29:02 -0700 (PDT)
Received: from dell ([91.110.221.249])
        by smtp.gmail.com with ESMTPSA id m132sm2195135wmf.10.2021.06.01.08.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 08:29:01 -0700 (PDT)
Date:   Tue, 1 Jun 2021 16:28:59 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Support Opensource <support.opensource@diasemi.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [RESEND PATCH v2 00/13] Simplify + drop board file support for
 Samsung PMIC
Message-ID: <20210601152859.GB2159518@dell>
References: <20210526124711.33223-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210526124711.33223-1-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 26 May 2021, Krzysztof Kozlowski wrote:

> Hi Lee,
> 
> This is the resend of two previous series, combined together as the
> latter depends on the first:
> https://lore.kernel.org/lkml/20210420113929.278082-1-krzysztof.kozlowski@canonical.com/
> https://lore.kernel.org/lkml/20210420170118.12788-1-krzysztof.kozlowski@canonical.com/
> 
> Everything rebased on latest next.
> 
> This also includes two MFD "Correct kerneldoc" patches which seems to be
> still valid, even though you mentioned they were fixed.
> 
> 
> The Samsung PMIC drivers since long time are used only on devicetree
> platforms (Samsung Exynos) and there are no users with board files.
> 
> Drop the support for board files entirely and depend on OF for matching.
> This makes the code smaller and simpler.
> 
> Best regards,
> Krzysztof
> 
> Krzysztof Kozlowski (13):
>   mfd: max8997: Simplify getting of_device_id match data
>   mfd: max8998: Simplify getting of_device_id match data
>   mfd: da9052: Simplify getting of_device_id match data
>   mfd: da9062: Simplify getting of_device_id match data
>   mfd: sec: Simplify getting of_device_id match data
>   mfd: wm831x: Correct kerneldoc
>   mfd: twl: Correct kerneldoc
>   mfd: sec: Drop support for board files and require devicetree
>   mfd: sec: Remove unused cfg_pmic_irq in platform data
>   mfd: sec: Remove unused device_type in platform data
>   mfd: sec: Remove unused irq_base in platform data
>   mfd: sec: Enable wakeup from suspend via devicetree property
>   mfd: sec: Remove unused platform data members
> 
>  drivers/mfd/Kconfig              |  1 +
>  drivers/mfd/da9052-i2c.c         |  9 +---
>  drivers/mfd/da9062-core.c        | 13 ++----
>  drivers/mfd/max8997.c            |  9 ++--
>  drivers/mfd/max8998.c            |  8 ++--
>  drivers/mfd/sec-core.c           | 70 +++++---------------------------
>  drivers/mfd/sec-irq.c            |  4 +-
>  drivers/mfd/twl-core.c           |  4 +-
>  drivers/mfd/wm831x-core.c        |  2 +-
>  include/linux/mfd/samsung/core.h | 33 ---------------
>  10 files changed, 29 insertions(+), 124 deletions(-)

Applied all except patches 6 and 7, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
