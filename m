Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF405748017
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  5 Jul 2023 10:50:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231912AbjGEIuZ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 5 Jul 2023 04:50:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230453AbjGEIuY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Jul 2023 04:50:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77DD81713
        for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Jul 2023 01:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688546984;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mygE2eC1+1F6RcP4Lm9OLsM0G/twLQqV8R8dIF6r2eA=;
        b=J/YsifluszoJ343eM3UBt1Wy4p+tKaqfCyTi5o3g2JPs6eCM71LWJ5TF/U6pkD6uic/Ege
        R7vAlgWY/QK5nfalTqHLcNKWMvCqXhROtTyMV8IUyLWP07Y2oIjV1QWmxsiIlDz4Frh7PG
        Jh9oDtvY2DvxhL8JoBHbZHBkxNNng6I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-zxXDZyL8OgaxLqBQ0YEZog-1; Wed, 05 Jul 2023 04:49:43 -0400
X-MC-Unique: zxXDZyL8OgaxLqBQ0YEZog-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-314256aedcbso2534467f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Jul 2023 01:49:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688546982; x=1691138982;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mygE2eC1+1F6RcP4Lm9OLsM0G/twLQqV8R8dIF6r2eA=;
        b=cWpUf2YnetKUkIoAKYxwl+L/TA+kbVG/WmQH+rM4vGuZXB3Z+W7bhpTXi9GZ2hu7Tp
         h0FV6OYgKERMfIfLzDkASbbnil25yvVIN6144/mkJbVASVzR2fKFQoXv2GYy7FMkQBgE
         UrzPqNJGF1+eBdumqZM7bJpLn+DGe9Fkt88RHi4rOMUqH2AhEEVFFiBOSGvhtQZR4Bzj
         RNqx9q0Qe1EJOFUj92nPO2ifH1hFC91gykAe1IZxcJvHNi7H1qthFaQuHNblssi7exac
         owWWcAYW0Bge1VsD51w+MwciBwrTF7hjPF0LmvhCDeC4aVz6OpjNJOuzFBcJDrJ51I/t
         ihZg==
X-Gm-Message-State: ABy/qLYMxUBh/uOh4GupjQHplJzaP3Ohd0gw5g2JeoZbrT2zEAU1l6B6
        DzXoPXZY97O83gOyp5AQyvtAY1V5SSsIimPpFpUkyE3GDRoPzdJH6ViuEW9TlWERDdsWayMzIy4
        dJb9TkiQYIqUKypK5QSnew4ElDxz9/aRAGua+kTgtYQ==
X-Received: by 2002:adf:e44d:0:b0:313:f97c:d87f with SMTP id t13-20020adfe44d000000b00313f97cd87fmr12842675wrm.67.1688546982145;
        Wed, 05 Jul 2023 01:49:42 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHiFHQIX6+LSUFE4lngdNXwrF3KteEAZwZqL0tALqI5G9uCMk9AA+C1J9hJqpvVRrGAzg2C2Q==
X-Received: by 2002:adf:e44d:0:b0:313:f97c:d87f with SMTP id t13-20020adfe44d000000b00313f97cd87fmr12842658wrm.67.1688546981884;
        Wed, 05 Jul 2023 01:49:41 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id x18-20020adff0d2000000b003141e86e751sm14564867wro.5.2023.07.05.01.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 01:49:41 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH 06/10] drm/exynos: Set fbdev flags
In-Reply-To: <20230704160133.20261-7-tzimmermann@suse.de>
References: <20230704160133.20261-1-tzimmermann@suse.de>
 <20230704160133.20261-7-tzimmermann@suse.de>
Date:   Wed, 05 Jul 2023 10:49:40 +0200
Message-ID: <87r0pmrbdn.fsf@minerva.mail-host-address-is-not-set>
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

> Set fbdev default flags FBNFO_DEFAULT and mark the framebuffer with

FBINFO_DEFAULT, or did you meand FBINFO_FLAG_DEFAULT (the flag your patch
is actually using) ?

I just noticed that are the same... and in patch 04/10 you used the former
for the tegra driver, but here you are using the latter. Is on purpose or
just a mistake ?

> FBINFO_VIRTFB. The framebuffer range is in DMA-able memory and should
> be accessed with the CPU's regular memory ops.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> index 7ca3424b59ce..28dc398d6e10 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> @@ -72,6 +72,7 @@ static int exynos_drm_fbdev_update(struct drm_fb_helper *helper,
>  		return PTR_ERR(fbi);
>  	}
>  
> +	fbi->flags = FBINFO_FLAG_DEFAULT;

The #define FBINFO_FLAG_DEFAULT	FBINFO_DEFAULT seems to be there since the
original v2.6.12-rc2 git import in commit 1da177e4c3f4, so is hard to know
why was introduced. FBINFO_DEFAULT is more used, I will just stick to that:

$ git grep FBINFO_DEFAULT | wc -l
92

$ git grep FBINFO_FLAG_DEFAULT | wc -l
38

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

