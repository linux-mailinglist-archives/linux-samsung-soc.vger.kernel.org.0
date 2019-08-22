Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 193A099E90
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 22 Aug 2019 20:20:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388966AbfHVSRj (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 22 Aug 2019 14:17:39 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53243 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbfHVSRi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 22 Aug 2019 14:17:38 -0400
Received: by mail-wm1-f67.google.com with SMTP id o4so6561173wmh.2;
        Thu, 22 Aug 2019 11:17:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Nmm5xSsdg+3DXP0y9SGhbKr0D2Shw9KeHFgV8+AhiWw=;
        b=lyWSjYdC+GnwEeth1fgltAcpFcGa8hI+EIQRnJF4NSmQqIf7MbexgwjOQiqxo52Hk9
         GikorLi6dVsX8HoXC98yCEgwLCvXa+a9z0BM87tCm2Y7H7d31KNOr9pEmnNzUzHwUDzi
         RiA0Okw+3EtqFVwgj+g9PP+mOzsRezBHeo71/PnUSbWZN42evdiL1BwoKT4/xInHYHa9
         hvRgmKK9YutW5kh9oQbN8/v8VTc3ZJZVkC9NbyK0KDegu+5mRJWHfu6onExf3xhj0HEu
         wunQ2O241QWI+A5uDJzC6CDvnn/a4Y6q1M7z1YWVrGXjWYPIAtGcT2oWNrEYmN9XNVl7
         zPBA==
X-Gm-Message-State: APjAAAWbxUTbBcpsFm2TZv+bIvFwuNC3/g+jAqGG5LjoeXDUOZ6LZEk+
        eCJHVGt8dhWYoceGc5/Nigo=
X-Google-Smtp-Source: APXvYqyu9GgxoCnAVdYS6e/5Pmk9monb4AeTFRrT53+dWP0KeFzokynTAzs8v5+CLNpGA1a1MvCqvg==
X-Received: by 2002:a7b:c0d0:: with SMTP id s16mr387786wmh.65.1566497856962;
        Thu, 22 Aug 2019 11:17:36 -0700 (PDT)
Received: from kozik-lap ([194.230.147.11])
        by smtp.googlemail.com with ESMTPSA id c11sm216987wrs.86.2019.08.22.11.17.35
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Aug 2019 11:17:36 -0700 (PDT)
Date:   Thu, 22 Aug 2019 20:17:33 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     kgene@kernel.org, pankaj.dubey@samsung.com,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        b.zolnierkie@samsung.com, m.szyprowski@samsung.com
Subject: Re: [PATCH v2] soc: samsung: Select missing dependency for
 EXYNOS_CHIPID
Message-ID: <20190822181733.GA10900@kozik-lap>
References: <20190821150711.31398-1-s.nawrocki@samsung.com>
 <CGME20190821153936eucas1p22cd1a6105806cb5ad7b43252852fec05@eucas1p2.samsung.com>
 <20190821153926.12297-1-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190821153926.12297-1-s.nawrocki@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Aug 21, 2019 at 05:39:26PM +0200, Sylwester Nawrocki wrote:
> The chipid driver uses the MFD syscon API but it was not covered
> properly in Kconfig.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  drivers/soc/samsung/Kconfig | 1 +

Thanks, applied.

Best regards,
Krzysztof

