Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87A60747F86
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  5 Jul 2023 10:24:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231542AbjGEIYL (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 5 Jul 2023 04:24:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231561AbjGEIYJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Jul 2023 04:24:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 594C11732
        for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Jul 2023 01:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688545388;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=TdhQb+Syo7axqoDqvE+d+9JDiCWJ3NaRZrNyouSZxA4=;
        b=BQ53SPYW6e9ueCxnezioiP3wCksnsweCDsB/IbYD6gDEAvYCyaK6WUFGYFI/7GMp3UBwsI
        F9Q/kKWlmZnxoEZTfaO++Z9FHhjNuNDRhal76ehQmLwSrzenP3LItNGF9+HGHO3hEJFlTh
        frnnsv2xpsN8XDwpP9h5HDSsa0iB71k=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-314-b1LS7kHXOFOB-OaaCPNk4g-1; Wed, 05 Jul 2023 04:23:07 -0400
X-MC-Unique: b1LS7kHXOFOB-OaaCPNk4g-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2b6fbf1305fso11309611fa.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Jul 2023 01:23:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688545385; x=1691137385;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TdhQb+Syo7axqoDqvE+d+9JDiCWJ3NaRZrNyouSZxA4=;
        b=VFQy4xgGfZLX2RYzoFGpz7n4066nj0iht9W4oSuWzWbyp4UtJelWyGrqOdf3ZZPbET
         npI2lYGBAbKuUVj0jKyVMPrNnmPFsSBbS7eDuE0zC7BwoWMETnsuJzqpolFizYZSyPdt
         1DZXaKKwdsU123mBKq63Kru++R757p+iWfU9tLE6It9iFj/UvoIrkhHJtIlz/UXCWPW9
         bj1Og+LUL8qc10nrZB8r9H58bxgoWiPipPHzBGxpqN+s8N/xsuI3flK4URf7Qt1eb9fw
         bATUL1RL3WgJxP9ng/GnsAvnadvL3vbfuEoR9uBYPVbecVFNGVzjCjmnRtKvsDjkQvyP
         +zHA==
X-Gm-Message-State: ABy/qLYEnMhlYZbfEVZ6FFEefXvuWDCCqEpWIbukp3bwbH8L7AtIRzhH
        d6BtYEafHNcP2idxXbVYboT5T8ilffmvwmPiEuRSRV+NRKvbwWVgasoxN0kUoXchKsjp+uofOhz
        pJ8JJ49j+SnYhgsHxBDULPz6YjguPDkwC4EBFE30=
X-Received: by 2002:a2e:8095:0:b0:2b6:a344:29cf with SMTP id i21-20020a2e8095000000b002b6a34429cfmr10093150ljg.17.1688545385617;
        Wed, 05 Jul 2023 01:23:05 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGDvUCFfme/Nn/ZdctOdvEvefSFNX7STUaOhlHec73G4bbSvs9bTxRZM7iY07V1SqMwOI36OA==
X-Received: by 2002:a2e:8095:0:b0:2b6:a344:29cf with SMTP id i21-20020a2e8095000000b002b6a34429cfmr10093130ljg.17.1688545385203;
        Wed, 05 Jul 2023 01:23:05 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id r13-20020a05600c458d00b003fa9a00d74csm1422474wmo.3.2023.07.05.01.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 01:23:04 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 01/10] fbdev: Add fb_ops init macros for framebuffers in
 DMA-able memory
In-Reply-To: <20230704160133.20261-2-tzimmermann@suse.de>
References: <20230704160133.20261-1-tzimmermann@suse.de>
 <20230704160133.20261-2-tzimmermann@suse.de>
Date:   Wed, 05 Jul 2023 10:23:03 +0200
Message-ID: <875y6ysr6g.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Add initializer macros for struct fb_ops for framebuffers in DMA-able
> memory areas. Also add a corresponding Kconfig token. As of now, this
> is equivalent to system framebuffers and mostly useful for labeling
> drivers correctly.
>
> A later patch may add a generic DMA-specific mmap operation. Linux
> offers a number of dma_mmap_*() helpers for different use cases.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Helge Deller <deller@gmx.de>
> ---
>  drivers/video/fbdev/Kconfig |  8 ++++++++
>  include/linux/fb.h          | 13 +++++++++++++
>  2 files changed, 21 insertions(+)
>
> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index cecf15418632..f14229757311 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -168,6 +168,14 @@ config FB_DEFERRED_IO
>  	bool
>  	depends on FB
>  
> +config FB_DMA_HELPERS
> +	bool
> +	depends on FB
> +	select FB_SYS_COPYAREA
> +	select FB_SYS_FILLRECT
> +	select FB_SYS_FOPS
> +	select FB_SYS_IMAGEBLIT
> +
>  config FB_IO_HELPERS
>  	bool
>  	depends on FB
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index 1d5c13f34b09..1191a78c5289 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -594,6 +594,19 @@ extern ssize_t fb_sys_write(struct fb_info *info, const char __user *buf,
>  	__FB_DEFAULT_SYS_OPS_DRAW, \
>  	__FB_DEFAULT_SYS_OPS_MMAP
>  
> +/*
> + * Helpers for framebuffers in DMA-able memory
> + */
> +

The comment for I/O memory helpers says:

/*
 * Initializes struct fb_ops for framebuffers in I/O memory.
 */

I think that would be good to have consistency between these two,
so something like:

/*
 * Initializes struct fb_ops for framebuffers in DMA-able memory.
 */

> +#define __FB_DEFAULT_DMA_OPS_RDWR \
> +	.fb_read	= fb_sys_read, \
> +	.fb_write	= fb_sys_write
> +
> +#define __FB_DEFAULT_DMA_OPS_DRAW \
> +	.fb_fillrect	= sys_fillrect, \
> +	.fb_copyarea	= sys_copyarea, \
> +	.fb_imageblit	= sys_imageblit
> +

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

