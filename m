Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1ED881711E4
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 27 Feb 2020 09:04:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728430AbgB0IE2 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 27 Feb 2020 03:04:28 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:41788 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726999AbgB0IE2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 27 Feb 2020 03:04:28 -0500
Received: by mail-ed1-f67.google.com with SMTP id c26so2146320eds.8
        for <linux-samsung-soc@vger.kernel.org>; Thu, 27 Feb 2020 00:04:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vnXqlO5qYygnxVPzTu5HIo1r14nORQF46kzveUPjQ8w=;
        b=DmT95IpxBbai1QFSlz7Y1Q4E3sy9eBW6Z4DcCB6LlhEU4S62YP275hG9gT9BwJYXgc
         l9dAwmyi6P/6Bqse8HwYM8+nUUbGMhm7+1Pr9c7bBN9axdjaCf3DGi3WqHx68M3wOlXF
         GD1tf3jANmVcwmI2Ok/vFVSaTTGxWUD/8Y4tSczJ5OFGDS1dRpZKOAIT4MhVpICsLNi0
         D991hWcXbWRL+kz/8kyuWLbKF679Rq3Iua8afTD5vhCPEe201aRMX8R4ZrT9aqSsxSx3
         FOP14OnyBND+pyaM9mMST9zz4zxC+lujKiOtAFILLuZ03DlZ4vJWj75TzObvYSJhTX9h
         keRA==
X-Gm-Message-State: APjAAAUuvHxYg/lrm5dpLwtd+Jrw++Bk7KFqv2yJ3nCT+b9aGjkVQzYy
        DQgMPK9UUNimg2LInWkmsV8=
X-Google-Smtp-Source: APXvYqzlarsX1ty4kym88bwhoDlOh9LwG5i9aGRqpmdhVDmhhTW+frMYte2HrFnOV/lW+TS4Xs2f1Q==
X-Received: by 2002:a05:6402:16dc:: with SMTP id r28mr2020730edx.268.1582790666414;
        Thu, 27 Feb 2020 00:04:26 -0800 (PST)
Received: from pi3 ([194.230.155.125])
        by smtp.googlemail.com with ESMTPSA id q5sm283970edb.70.2020.02.27.00.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 00:04:25 -0800 (PST)
Date:   Thu, 27 Feb 2020 09:04:23 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2] drm/exynos: dsi: propagate error value and silence
 meaningless warning
Message-ID: <20200227080423.GA7853@pi3>
References: <CGME20200227070649eucas1p15dcf4847b369fc20bd2a96f697b1173b@eucas1p1.samsung.com>
 <20200227070637.4115-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200227070637.4115-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Feb 27, 2020 at 08:06:37AM +0100, Marek Szyprowski wrote:
> Properly propagate error value from devm_regulator_bulk_get() and don't
> confuse user with meaningless warning about failure in getting regulators
> in case of deferred probe.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> v2: rephrased commit message
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

