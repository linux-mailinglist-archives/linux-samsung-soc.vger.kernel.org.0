Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27A1D1CA4CB
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  8 May 2020 09:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726771AbgEHHIm (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 8 May 2020 03:08:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726036AbgEHHIm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 May 2020 03:08:42 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D09FC05BD43
        for <linux-samsung-soc@vger.kernel.org>; Fri,  8 May 2020 00:08:41 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id h9so611463wrt.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 May 2020 00:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=DmTzp+J4aS4CxYYhCILNVwYfVehwX/dqCJCx5jKGlEM=;
        b=CEhHuPS/Sdlv7SlOF1Hc4wrg/jxQ0bfVMANuWCZjoRc8dNc/HsdgEoZO7HGBHXwoaf
         ruEIoF3gHK5AY6lSz66A+ROgs5JDNmxQyX5jJA9tVa0h0eLsOpexhZTVa8lNea46FiWB
         /GPsBiQ9zAcTAkVD8gFbnjr8OjE1EkxiL9eto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=DmTzp+J4aS4CxYYhCILNVwYfVehwX/dqCJCx5jKGlEM=;
        b=ocA6oB2lmEH1R3OKWb1tcXcl7CttOq+4Qa61wd8AATe3r8F97hsJly7g/ot1Xjiop7
         X5Gx9G+wNUmo5TcW6j/vwNKs0VV2KDKbO22+CAWT6s+6inzqTPn5aj0gGNHQU11ZRl9j
         1plYvkOgqZb/1aJ/WFuzy6SfG3r8pHFXGIzS/FVCrtx+/3ffPs39sFBRA5YN3WaOhNAG
         U9NCnkRcGbxbb8984pftz93jJv4fYfWVPemVHZY01xQBWytjzYplEo0Ix7rv5dSMmp5K
         XZJEWFWa8lO9OM4AYQYYqZRHGjnPkN9qTiOA81Bw75r9RcycWLxr9bCAAHyCciSQl8/K
         Qwhw==
X-Gm-Message-State: AGi0PuYh4MfKSwT4LemB1/LdkgDX3AslvKDEDwtq9CaRUSQQVv1qNyM5
        hSPWNTCDwfLbgYqGaV9QVVHs4w==
X-Google-Smtp-Source: APiQypIdXHZDbCY1mjOHI7A02KN/NFXcXdx0OSG3FPCPhGoilD6eSlbRaDrFn+uMA+JdV38nVB2Qsw==
X-Received: by 2002:adf:e791:: with SMTP id n17mr1265834wrm.217.1588921720359;
        Fri, 08 May 2020 00:08:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id s24sm12302509wmj.28.2020.05.08.00.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 00:08:39 -0700 (PDT)
Date:   Fri, 8 May 2020 09:08:37 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Colin King <colin.king@canonical.com>
Cc:     Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/exynos: remove redundant initialization to variable
 'start'
Message-ID: <20200508070837.GF1383626@phenom.ffwll.local>
Mail-Followup-To: Colin King <colin.king@canonical.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200507202237.64350-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507202237.64350-1-colin.king@canonical.com>
X-Operating-System: Linux phenom 5.4.0-4-amd64 
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, May 07, 2020 at 09:22:37PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable 'start' is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 902938d2568f..b0b9cb1ec18f 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1150,7 +1150,7 @@ static bool exynos_dsi_transfer_finish(struct exynos_dsi *dsi)
>  {
>  	struct exynos_dsi_transfer *xfer;
>  	unsigned long flags;
> -	bool start = true;
> +	bool start;
>  
>  	spin_lock_irqsave(&dsi->transfer_lock, flags);
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
