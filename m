Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FA6CA5A9B
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  2 Sep 2019 17:32:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725941AbfIBPbv (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 2 Sep 2019 11:31:51 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39508 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbfIBPbv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 Sep 2019 11:31:51 -0400
Received: by mail-wm1-f67.google.com with SMTP id n2so13662952wmk.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Sep 2019 08:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gkZHYuF0hVorf0fdje3PgAdvpFgAOB5Pw0cF51olljc=;
        b=lu2bQz+XsB8LKO39Y6ew3rtjv925dpklbrITt7BJFMtbUJetjqe75AwJypMsodTYwH
         DoV/0hn3P80WIGvNEU8ZFIhE7Kufvcn8qgaN6BG0M6HQkS7bIQ0liNcazbnLa0xnnns6
         oDJr/oDfXtIUTGRjFSWHCbRHCqmMKkFbfYP0P4e5+PNMpu+0uZj88GI6hlHDT+8BJgCe
         qbma+3eKqOYOxQ+15S/WfTsiG0vxef1t7cTQrgqg2KeqOrjcVtltNxcSjWSl1wUZqzhv
         IgyEDZqqEfEISmuWL7XXuTZlLmOFQ4DIQ8EF0IkuPWjoNNddDAFHNV6mmlSmwTGL7d16
         UhLw==
X-Gm-Message-State: APjAAAVqp+WzFdDxafQVYRtY7GVAub52DYIckOnAryZXvQRfMxoOsE5a
        0rQGnF+mTRhoQZ9A/G+C67GdAfUn
X-Google-Smtp-Source: APXvYqwjDWARCaw729SYN0Yt88CoFaEoD3zpxpK06WxNryigENZvFN+F5K4KMpvwwe/ikK8K1glJXA==
X-Received: by 2002:a1c:ca0b:: with SMTP id a11mr2728529wmg.87.1567438309268;
        Mon, 02 Sep 2019 08:31:49 -0700 (PDT)
Received: from kozik-lap ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id d18sm18264208wra.91.2019.09.02.08.31.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Sep 2019 08:31:48 -0700 (PDT)
Date:   Mon, 2 Sep 2019 17:31:46 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Guillaume Gardet <guillaume.gardet@arm.com>
Cc:     linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V3 1/5] dt-bindings: gpu: mali-midgard: Add samsung
 exynos5250 compatible
Message-ID: <20190902153146.GB9289@kozik-lap>
References: <20190725083433.6505-1-guillaume.gardet@arm.com>
 <20190830104502.7128-1-guillaume.gardet@arm.com>
 <20190830104502.7128-2-guillaume.gardet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190830104502.7128-2-guillaume.gardet@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Aug 30, 2019 at 12:44:58PM +0200, Guillaume Gardet wrote:
> Add "samsung,exynos5250-mali" binding.
> 
> Signed-off-by: Guillaume Gardet <guillaume.gardet@arm.com>
> 
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> V3 changes:
>   * add dt-bindings before node in device tree
> V2 changes:
>   * new file
> 
>  Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt | 1 +

Thanks, entire set applied (with re-ordering and minor description
changes).

Best regards,
Krzysztof

