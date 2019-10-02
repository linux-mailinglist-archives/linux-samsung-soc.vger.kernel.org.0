Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A6DAC8FB6
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  2 Oct 2019 19:20:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728465AbfJBRUb (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 2 Oct 2019 13:20:31 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46306 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726697AbfJBRUb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Oct 2019 13:20:31 -0400
Received: by mail-wr1-f65.google.com with SMTP id o18so20538855wrv.13;
        Wed, 02 Oct 2019 10:20:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HHIl7GcN4vEcWiPV/kc+k0bb9GY+GyE08iX8fWZ3jfQ=;
        b=WBCjWEwX5Pf0QKWzgp4HAzJXXgX4ofx4KPBm91MPpUgijJhKvFp78tsizVHJr0nClM
         lx/bl8NoRwz41cSoLwoPib6P4M1iZcHCZUbULK5zrFVeXuiLfQ9ka/cfz14mbKNL6q/E
         YjpeDGLaMMm/16HfaJW+S9sxvdux8fhXRYdxoOquLHa1sYqOLlEjeyzYcRCZO0+V+ANz
         0QaWRDOYPj8k+cNKGtYXn63luwLpkXmivPMPmJUB5/pkXIyrIl7IB7IraUwCFDetTtsV
         7IpK2I82G1hcmPlrhh95bBv8sTpOkAmTfkJtVu03q9flUWdLVB3L3akwqRTqU0Lm50WS
         MGVQ==
X-Gm-Message-State: APjAAAV09LOkVg88y1EgpjAC4mG2dsP5o3ljKBvlHtQ6vCbc0twWn9VV
        9w5/dzNnTPEQORyIXrB2jBU=
X-Google-Smtp-Source: APXvYqxxarjurJVDg8sOa7I3VttsCWxG/9IRBIDA7rFqTl1ZhKVpbx9bSmVkUQyRWZSN7AUt19cTEg==
X-Received: by 2002:adf:f008:: with SMTP id j8mr3583865wro.75.1570036829185;
        Wed, 02 Oct 2019 10:20:29 -0700 (PDT)
Received: from kozik-lap ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id c18sm13223wrv.10.2019.10.02.10.20.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Oct 2019 10:20:28 -0700 (PDT)
Date:   Wed, 2 Oct 2019 19:20:25 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     broonie@kernel.org, lgirdwood@gmail.com,
        ckeepax@opensource.cirrus.com, sbkim73@samsung.com,
        alsa-devel@alsa-project.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com
Subject: Re: [PATCH v2 10/10] ARM: exynos_defconfig: Enable Arndale audio
 driver
Message-ID: <20191002172025.GB21463@kozik-lap>
References: <20190920130218.32690-2-s.nawrocki@samsung.com>
 <CGME20190920130711eucas1p29497b40981e4e0a24769ced4e06be208@eucas1p2.samsung.com>
 <20190920130702.529-1-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190920130702.529-1-s.nawrocki@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Sep 20, 2019 at 03:07:02PM +0200, Sylwester Nawrocki wrote:
> Enable audio driver for Exynos5250 based Arndale boards to improve
> testing coverage.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  arch/arm/configs/exynos_defconfig | 1 +

Thanks, applied.

Best regards,
Krzysztof

