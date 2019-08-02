Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A7C67FD18
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  2 Aug 2019 17:11:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729336AbfHBPL3 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 2 Aug 2019 11:11:29 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:46712 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbfHBPL2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 2 Aug 2019 11:11:28 -0400
Received: by mail-ed1-f66.google.com with SMTP id d4so72724286edr.13
        for <linux-samsung-soc@vger.kernel.org>; Fri, 02 Aug 2019 08:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wfiIBOS+brQ1KWbhQkuFy4c67Yaa6GXA+JN7706mnR0=;
        b=LNBcPEbfa5JcdPBN2zelrVyqVY53vR3NhCoWYWHlCv74UczB8O9Lhz3JxAYh4Zl+XX
         7165/ATqNKNV8PMFVHh/M+jczMEl497jJv76COojyBXeMVixRFcICvFkapFkYFfIY1XO
         4JEmk+GCIKHX8GJ5OqxKG9KN2klLT1xJ58DTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=wfiIBOS+brQ1KWbhQkuFy4c67Yaa6GXA+JN7706mnR0=;
        b=N8TntyqHNf91U4kjW0SXPmuQUuPVnlOxrmzPERJGV6hJs6gHQGym4hRWd8mwEdFTUM
         jRdoI7TLEsCySvVClo65d83k+AE1epYQo1CLQIlUuvN8GHl+S7QuNIBBmfYv1pq6V+XJ
         YMKl2/Ak4hmcNiAGCvS2h6mtGNjmFOZJJW8KaOlEjmzvNrnDVcNTbA7RpWS3LIfJuM5S
         yo/IsJ909HSFuXqz0y51CvonMYXk+Tc7gHX11TIXpAGyRiuPssv6hCC1UrOOGaXfTuxy
         np6ITpfMOD8s1pbcF7a5vwEo+axkeJkYB3JeqQnju7q3KgU1eUSmyUq5sVid791tHkZE
         0AfA==
X-Gm-Message-State: APjAAAWbwJ9ifvyzrNMCpoWWObpi5hoPkX75RZ7TK99AyTsrmlHdixH2
        xlxvgU3XQIR+uuQubdCMZts=
X-Google-Smtp-Source: APXvYqxrYyVdPY8z+dGGTHhFI2cVRb44HOuQEw+1X2plnHLLw0MZkLwoSAgjRQbzOvXJSx7X1XmMFQ==
X-Received: by 2002:a50:a56d:: with SMTP id z42mr18488013edb.241.1564758686891;
        Fri, 02 Aug 2019 08:11:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id w35sm18496880edd.32.2019.08.02.08.11.25
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 02 Aug 2019 08:11:26 -0700 (PDT)
Date:   Fri, 2 Aug 2019 17:11:24 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Inki Dae <inki.dae@samsung.com>
Cc:     airlied@linux.ie, linux-samsung-soc@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [GIT PULL] exynos-drm-fixes
Message-ID: <20190802151124.GR7444@phenom.ffwll.local>
References: <CGME20190802083122epcas1p298fb8295a77e3adfa839eec619318591@epcas1p2.samsung.com>
 <1564734791-745-1-git-send-email-inki.dae@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1564734791-745-1-git-send-email-inki.dae@samsung.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Aug 02, 2019 at 05:33:11PM +0900, Inki Dae wrote:
> Hi Dave,
> 
>    Just two fixups which fixes undefined reference error with NOMMU
>    configuration and potential infinite issue of scaler module,
>    and two trivial cleanups.
> 
>    Please kindly let me know if there is any problem.

Please prep -fixes pull request on Thu latest, so this doesn't eat into
w/e or in case there's an issue that needs to be fixed there's just no
time otherwise to make the next -rc.

> 
> Thanks,
> Inki Dae
> 
> The following changes since commit f8981e0309e9004c6e86d218049045700c79d740:
> 
>   Merge tag 'msm-fixes-2019_08_01' of https://gitlab.freedesktop.org/drm/msm into drm-fixes (2019-08-02 10:17:25 +1000)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-for-v5.3-rc3

Applied, thanks.
-Daniel

> 
> for you to fetch changes up to 1bbbab097a05276e312dd2462791d32b21ceb1ee:
> 
>   drm/exynos: fix missing decrement of retry counter (2019-08-02 16:50:18 +0900)
> 
> ----------------------------------------------------------------
> - Two cleanup patches
>   . use dev_get_drvdata for readability instead of platform_get_drvdata
>   . remove redundant assignment to node.
> - Two fixup patches
>   . fix undefined reference to 'vmf_insert_mixed' with NOMMU configuration.
>   . fix potential infinite spin issue by decrementing 'retry' variable in
>     scaler_reset function of exynos_drm_scaler.c
> 
> ----------------------------------------------------------------
> Arnd Bergmann (1):
>       drm/exynos: add CONFIG_MMU dependency
> 
> Colin Ian King (2):
>       drm/exynos: remove redundant assignment to pointer 'node'
>       drm/exynos: fix missing decrement of retry counter
> 
> Fuqian Huang (1):
>       drm/exynos: using dev_get_drvdata directly
> 
>  drivers/gpu/drm/exynos/Kconfig             | 1 +
>  drivers/gpu/drm/exynos/exynos_drm_fimc.c   | 2 +-
>  drivers/gpu/drm/exynos/exynos_drm_g2d.c    | 2 +-
>  drivers/gpu/drm/exynos/exynos_drm_gsc.c    | 2 +-
>  drivers/gpu/drm/exynos/exynos_drm_scaler.c | 4 ++--
>  5 files changed, 6 insertions(+), 5 deletions(-)
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
