Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E70EDB77A
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 17 Oct 2019 21:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436755AbfJQT2Q (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 17 Oct 2019 15:28:16 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:34427 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393438AbfJQT2Q (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 17 Oct 2019 15:28:16 -0400
Received: by mail-oi1-f195.google.com with SMTP id 83so3193567oii.1;
        Thu, 17 Oct 2019 12:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SqAFHmUiEpU5rAmf8Tug9HDaQyGE8/7zvO3FldJ1AqM=;
        b=Wka6aIl5cs5n1XdkVNOuJhfT8xZbmwZdcn6nCgs7yi91vRG8g3T18SKf9px3rtNoGM
         oYtV2gI5irD7APhSu2G2Xqjd+gSM/EIzVF6Sxuj9U5kNxKgiWf9PYuAsnWDQwRGi/pSn
         7D/y+ZUVN4h7AhBYFQTi1t4RVnMToOwg4b5fEaTM6d2/59NxCKWHij0m+mXl9YngB4lE
         jn/3nL8QrQAhqYU+qwvp9CXN9YitjZ6pZUP3Oan9NLrF/n9jEE2oWqD2R2wqSI/J1aZq
         xUaFU89UsXEMy2jmCXNo/dH91lvdGptjQsSWaKZOu59xaxJhv1z5N3KB7jK7Ti46s3e/
         B/Ig==
X-Gm-Message-State: APjAAAWCxeQ5XZ6P6sKLPc3UoGJoIRimlTyBHvKbr+JRnUoPy78ie2+L
        Bz4sIXcnnzK/OtGTI/Ast0mPG08=
X-Google-Smtp-Source: APXvYqwB11uurv4LKiBTMRl3GG7b35sfh5jfB3nvxXh730JUGJ8/aXCy41c7F0cQoRKMXbYcf965bg==
X-Received: by 2002:a54:4582:: with SMTP id z2mr4497593oib.53.1571340495419;
        Thu, 17 Oct 2019 12:28:15 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b31sm818240otc.70.2019.10.17.12.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 12:28:14 -0700 (PDT)
Date:   Thu, 17 Oct 2019 14:28:14 -0500
From:   Rob Herring <robh@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mark Brown <broonie@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Maciej Falkowski <m.falkowski@samsung.com>
Subject: Re: [PATCH v2] dt-bindings: sound: Convert Samsung Exynos Odroid
  XU3/XU4 audio complex to dt-schema
Message-ID: <20191017192814.GA11356@bogus>
References: <CGME20191017100534eucas1p1407cf6ef5606d6bd6a4140502cc95984@eucas1p1.samsung.com>
 <20191017100529.4183-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191017100529.4183-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 17 Oct 2019 12:05:29 +0200, Marek Szyprowski wrote:
> From: Maciej Falkowski <m.falkowski@samsung.com>
> 
> Convert Samsung Exynos Odroid XU3/XU4 audio complex with MAX98090 codec
> to newer dt-schema format.
> 
> 'clocks' property is unneeded in the bindings and is left undefined in 'properties'.
> 
> 'samsung,audio-widgets' and 'samsung,audio-routing' are optional from driver
> perspective and they are set as unrequired.
> 
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> [mszyprow: reordered non-standard properties]
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  .../bindings/sound/samsung,odroid.txt         | 54 -----------
>  .../bindings/sound/samsung,odroid.yaml        | 91 +++++++++++++++++++
>  2 files changed, 91 insertions(+), 54 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/samsung,odroid.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/samsung,odroid.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
