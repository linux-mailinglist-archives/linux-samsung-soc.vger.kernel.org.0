Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9912E217617
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  7 Jul 2020 20:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728290AbgGGSNO (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 7 Jul 2020 14:13:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728246AbgGGSNO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jul 2020 14:13:14 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D48A9C061755
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jul 2020 11:13:13 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id o8so64585wmh.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jul 2020 11:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=v3SJG/oKrNkhQPAH5DvCsSZIxftjRT3Cf/rO54lasVQ=;
        b=bCRBoKrbpz2rdJ2nV9KaHR11LkMNbRQZQEVMoGlk92r+cnRoIKV0xwny5KmjnouEw2
         PGjjYvz0cp3e4NPnqvT2tAUoOV3Naj9K1Bd7pMl4clrjmtJMAhJxBsb4OagAywJxhw0O
         vIc+B7bV6kYwba5VmkvKBqZXiZQCl4gWoOjho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=v3SJG/oKrNkhQPAH5DvCsSZIxftjRT3Cf/rO54lasVQ=;
        b=V7JMPrFEHO9jNNu8XIfiX7+T6JLBG/ey0d4pzg+tjpi6M/HFkzTOitUReE7jbjb4ep
         u2YgBM9ErxxTEr9LoTRK6fukMQNmw8AXYZnSC57BKBbj7VeIoJ2+DVAMh/ADfIHLCv+8
         +zA9+aT3t6JUqRvpNp1NBc7GlVac+1uO1HHCpobdnxAgtpU+K0TwfgLuqdy1D4oOtere
         /Ei5Ooe1M3ZgmImvPR9+Ry+IKX1c8PoNDM7kJ+5fKHyNUR1YTHKLeYKES31u43Hm+J2J
         sE7jDNdm0wT6ACiYmorTwCaOUNN2EOaV5CjSRFfoafjcJQk8OZ8enHw/nsYc8n8qXyYV
         a9LQ==
X-Gm-Message-State: AOAM53061QNsZD3Gsq0HKhZ0Ysf13W23iZckzDazsD6kidXAY9ZMMGU1
        FwzBuXnBD2Q6iQPH4YQIf/muEg==
X-Google-Smtp-Source: ABdhPJyY4ArGzU3O1VyBKhNP66gJlaXeKhOfIGNgIYcjZ8G2lNPTEGosc7euLKL3vZCGs4EG+Vg8/Q==
X-Received: by 2002:a1c:1d04:: with SMTP id d4mr5754189wmd.156.1594145592650;
        Tue, 07 Jul 2020 11:13:12 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id q3sm1942110wmq.22.2020.07.07.11.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 11:13:12 -0700 (PDT)
Date:   Tue, 7 Jul 2020 18:13:10 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Jonathan Bakker <xc-racer2@live.ca>
Cc:     kyungmin.park@samsung.com, s.nawrocki@samsung.com,
        mchehab@kernel.org, kgene@kernel.org, krzk@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/11] media: exynos4-is: Improve support for sensors
 with multiple pads
Message-ID: <20200707181310.GE2621465@chromium.org>
References: <20200426022650.10355-1-xc-racer2@live.ca>
 <BN6PR04MB06604D29C9F66EB53FB17581A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN6PR04MB06604D29C9F66EB53FB17581A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Jonathan,

On Sat, Apr 25, 2020 at 07:26:44PM -0700, Jonathan Bakker wrote:
> Commit 1c9f5bd7cb8a ("[media] s5p-fimc: Add support for sensors with
> multiple pads") caught the case where a sensor with multiple pads was
> connected via CSIS, but missed the case where the sensor was directly
> connected to the FIMC.
> 
> This still assumes that the last pad of a sensor is the source.
> 
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
> ---
>  drivers/media/platform/exynos4-is/media-dev.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Thank you for the patch. Please see my comments inline.

> diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
> index 5c32abc7251b..b38445219c72 100644
> --- a/drivers/media/platform/exynos4-is/media-dev.c
> +++ b/drivers/media/platform/exynos4-is/media-dev.c
> @@ -991,7 +991,8 @@ static int fimc_md_create_links(struct fimc_md *fmd)
>  
>  		case FIMC_BUS_TYPE_ITU_601...FIMC_BUS_TYPE_ITU_656:
>  			source = &sensor->entity;
> -			pad = 0;
> +			/* Assume the last pad is the source */
> +			pad = sensor->entity.num_pads - 1;

Is 0 really any worse than num_pads - 1? This sounds like quite an ugly
hack.

Could you iterate over the pads of the sensor entity and explicitly find
a source pad instead?

Best regards,
Tomasz
