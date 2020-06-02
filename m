Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C05C51EB6F8
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  2 Jun 2020 10:05:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726093AbgFBIFp convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 2 Jun 2020 04:05:45 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:40972 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbgFBIFo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 2 Jun 2020 04:05:44 -0400
Received: by mail-ed1-f65.google.com with SMTP id ce8so3213691edb.8;
        Tue, 02 Jun 2020 01:05:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=SCR2cHiabRKqtkGaERDcoYhLdk1hHk/2OBBAMb5lQNY=;
        b=SSTnPobq3H7q9kcHjP1hoz3gIoOTfh/FbhzMV0W3gdVaWYGlK1CXaS6Scr+EuiZxqI
         BnW0QrTgigImDlbj3stiSD9O1dly0PcGPuKK/65Kj6VFB07XYA0Y5lh4ZKoDU2mVkzWC
         x6r+u07Q17qZxtjEVnnGLardR0ZpdyMFKINLO/BGVVObc3l7oRXmy7h3LU1NO1S7hw47
         s+DzpBiRH8dLDGcO8iKqEp7orR1bJNtdeONuYF6TbV3ExbtwMJNtDN/IErGZq1twgCDi
         dLIoAXb1NciavJJBb2qjpyVMQiPQ/FrzldOhTXhHMi87YvZA1liuw1sMd4v7+jzFN4ia
         V7EQ==
X-Gm-Message-State: AOAM532SDF22FkZyR602bsXyhwmHHy9HiLUxsrCfP+tDA81UfXYrS5xa
        f7q+U7VbNM+NKUhyzXkHt9Q=
X-Google-Smtp-Source: ABdhPJwZlPDhteUZ4oQPMQH3bkm+GkPpXcVWfKiuXmPmtRXf3HlXBuN/miC3BujdGRr/785rYqnlRQ==
X-Received: by 2002:a50:af85:: with SMTP id h5mr17930429edd.86.1591085141913;
        Tue, 02 Jun 2020 01:05:41 -0700 (PDT)
Received: from kozik-lap ([194.230.155.118])
        by smtp.googlemail.com with ESMTPSA id u10sm1177397edb.65.2020.06.02.01.05.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jun 2020 01:05:41 -0700 (PDT)
Date:   Tue, 2 Jun 2020 10:05:38 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     georgi.djakov@linaro.org, cw00.choi@samsung.com,
        a.swigon@samsung.com, myungjoo.ham@samsung.com,
        inki.dae@samsung.com, sw0312.kim@samsung.com,
        b.zolnierkie@samsung.com, m.szyprowski@samsung.com,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH v5 1/6] dt-bindings: exynos-bus: Add documentation
 for interconnect properties
Message-ID: <20200602080538.GA8216@kozik-lap>
References: <20200529163200.18031-1-s.nawrocki@samsung.com>
 <CGME20200529163219eucas1p2d127fe3936921f53f6fe7902e7d14a3e@eucas1p2.samsung.com>
 <20200529163200.18031-2-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20200529163200.18031-2-s.nawrocki@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, May 29, 2020 at 06:31:55PM +0200, Sylwester Nawrocki wrote:
> Add documentation for new optional properties in the exynos bus nodes:
> samsung,interconnect-parent, #interconnect-cells.
> These properties allow to specify the SoC interconnect structure which
> then allows the interconnect consumer devices to request specific
> bandwidth requirements.
> 
> Signed-off-by: Artur Świgoń <a.swigon@samsung.com>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> Changes for v5:
>  - exynos,interconnect-parent-node renamed to samsung,interconnect-parent
> ---
>  Documentation/devicetree/bindings/devfreq/exynos-bus.txt | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
