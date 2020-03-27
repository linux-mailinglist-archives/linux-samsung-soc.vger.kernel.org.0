Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12523195594
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 27 Mar 2020 11:47:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727254AbgC0KrA (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 27 Mar 2020 06:47:00 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:42472 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbgC0KrA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 27 Mar 2020 06:47:00 -0400
Received: by mail-ed1-f65.google.com with SMTP id cw6so9755282edb.9
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Mar 2020 03:47:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PLGk8xpVlq6jprbGmxdPWoYeK18WktU86NZ+qSkaFFw=;
        b=EeGMG3Uv6t5etczFc0h+GQePpFfeL0fGLgsZZNTbWrUA/XuggGkZWCrI5YsM4wwfTQ
         x6KSkJLGTPpSMLH7C7Sk6sQk+SF4LyfAKBOHw2KSZTSGXw5NgN+zMj+deVFvzoTsqzem
         OfO+7gRiDgbTz7i+iQWTuhhd0KfBxvwmcjDP9mkzDZ2Vm7i8QO4E5657zRDqyJH6kA6F
         2O3TcG3mz/j8C1EuWR7qdPLAdFRQO5PbVD1+IZF1RWlhkcF8uS64BWJBzy8q0YnNUL+t
         Gz4Chw7C5NOzqxh6CudvIx0o6Gfj3nD9SZgddawa0xuwOaB/9zstLRDDIs2Ba/yy2/Vl
         BmFQ==
X-Gm-Message-State: ANhLgQ2RSy4H4BiqXJy86W8Qt3ZB/8rAFBBdNs4IALMHkAp+0sTYyO7K
        leiNIYtJDebTR4+RjagyAo2mhtB/
X-Google-Smtp-Source: ADFU+vv1WThX9e1IXSvqpQG3F9ssBYs71qwOQzP+WHXPlRQrPST4gdvdgJ6B/7G9C55MBNppJz/07A==
X-Received: by 2002:a17:906:6844:: with SMTP id a4mr11902417ejs.248.1585306019438;
        Fri, 27 Mar 2020 03:46:59 -0700 (PDT)
Received: from kozik-lap ([194.230.155.125])
        by smtp.googlemail.com with ESMTPSA id v17sm796994edb.27.2020.03.27.03.46.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Mar 2020 03:46:58 -0700 (PDT)
Date:   Fri, 27 Mar 2020 11:46:56 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 1/2] ARM: dts: exynos: Enable Bluetooth support for
 Rinato board
Message-ID: <20200327104656.GA7233@kozik-lap>
References: <CGME20200326083528eucas1p2f2e265f3776e4d34116f36b68d07731c@eucas1p2.samsung.com>
 <20200326083524.19577-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200326083524.19577-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Mar 26, 2020 at 09:35:23AM +0100, Marek Szyprowski wrote:
> Add a node for the BCM43342A Bluetooth chip on the serial bus #0 on
> the Exynos3250-based Rinato board.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos3250-rinato.dts | 9 +++++++++

Thanks, applied for late push (might miss this merge window).

Best regards,
Krzysztof

