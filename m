Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E51B5A653B
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  3 Sep 2019 11:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728500AbfICJcp (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 3 Sep 2019 05:32:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:54170 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726840AbfICJcp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Sep 2019 05:32:45 -0400
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 480B1230F2;
        Tue,  3 Sep 2019 09:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567503164;
        bh=N19Rsm2Plowanw5IPDslRmZ/3k2cHzpGI8qCX6YsUV4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=j7LgIpG91QoJCTR9UK0WtxBN/k/aKeRquXF7LSfSR3O5XLSl8nq2FZ0yOvDBL6wGR
         Y/ccrj0iDNE0zLvaNGaxqIleAtJGvwcVFk5HidpyVJrpa/E2Qe7clq+b1jxOQFQRX/
         Yq82HJ20DnuKVU2kqfaY50ChXpBwe6gY8SGB6Qrc=
Received: by mail-qk1-f174.google.com with SMTP id f13so15078059qkm.9;
        Tue, 03 Sep 2019 02:32:44 -0700 (PDT)
X-Gm-Message-State: APjAAAXQMWGTJuqB7hL+i69mU3HDqsFafVlTRVUnLa+1GGmzc0GrUhBR
        uuSL1sRjAZE2UEqcB4n2lQrpESs8y2cJn6+TxA==
X-Google-Smtp-Source: APXvYqyKDZuIwFDrRc3z4ZslmmdloGpwW7OeQmoAyPuObEV639fe/KLbd1vsGji0BxVufXTxiZj/yfPO078OIFstJWA=
X-Received: by 2002:a37:a48e:: with SMTP id n136mr15623206qke.223.1567503163440;
 Tue, 03 Sep 2019 02:32:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190830104502.7128-2-guillaume.gardet@arm.com> <20190903073300.5927-1-guillaume.gardet@arm.com>
In-Reply-To: <20190903073300.5927-1-guillaume.gardet@arm.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 3 Sep 2019 10:32:32 +0100
X-Gmail-Original-Message-ID: <CAL_JsqJhgU3qLV5SuqYpktiobYLh0up8eis1G42mpNrqu-kB+w@mail.gmail.com>
Message-ID: <CAL_JsqJhgU3qLV5SuqYpktiobYLh0up8eis1G42mpNrqu-kB+w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpu: mali-midgard: Add samsung exynos5250 compatible
To:     Guillaume Gardet <guillaume.gardet@arm.com>
Cc:     linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Sep 3, 2019 at 8:33 AM Guillaume Gardet
<guillaume.gardet@arm.com> wrote:
>
> Add "samsung,exynos5250-mali" binding.
>
> Signed-off-by: Guillaume Gardet <guillaume.gardet@arm.com>
>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied, thanks.

Rob
