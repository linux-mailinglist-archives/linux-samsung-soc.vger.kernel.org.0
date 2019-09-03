Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C713A629D
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  3 Sep 2019 09:36:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbfICHgr (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 3 Sep 2019 03:36:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:35560 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726062AbfICHgr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Sep 2019 03:36:47 -0400
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4CB3F22D6D;
        Tue,  3 Sep 2019 07:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567496206;
        bh=/ZTjJoXaezmKCvELPg5M13bzTRrjeyDRmEyX7PWast0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Q9EQAMAxdtvLI6I9H2zoZoXc9fuO41xG7lpAobknvVwlqRQBMNOLc7/EEUc8EccXs
         tHwZueTMsN7AHZA+8uP9KiYbu3oSOzC16EJ0FtFqYEXeILOCuusdX+vyyDywbySWnp
         EwU29NOF9eIabZFG38NKzMg0DZMBmInj9v0yYVTg=
Received: by mail-lf1-f54.google.com with SMTP id u13so12032718lfm.9;
        Tue, 03 Sep 2019 00:36:46 -0700 (PDT)
X-Gm-Message-State: APjAAAWbDmqi4XTf5dNThuzMcKKA3keu/buKRiGpo8Lo/RZYsg7Mc9WK
        75rcbbRf0anse2eTPIZzwfpbRSXgxZj/Sv7CjF4=
X-Google-Smtp-Source: APXvYqzifXzpzCKx3mvtPEOpu4CnO2M7IdhlcbgvKTRfifqBBb8mG9MGhPwuBRwMsOFeRE+/UJIfxT39ocxJMpA+LDU=
X-Received: by 2002:ac2:4853:: with SMTP id 19mr12886366lfy.69.1567496204476;
 Tue, 03 Sep 2019 00:36:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190830104502.7128-2-guillaume.gardet@arm.com> <20190903073300.5927-1-guillaume.gardet@arm.com>
In-Reply-To: <20190903073300.5927-1-guillaume.gardet@arm.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Tue, 3 Sep 2019 09:36:33 +0200
X-Gmail-Original-Message-ID: <CAJKOXPcvAb=DLzaq-MPygWdviOpJ6KOu53R-6xkSsCFJW4xUKQ@mail.gmail.com>
Message-ID: <CAJKOXPcvAb=DLzaq-MPygWdviOpJ6KOu53R-6xkSsCFJW4xUKQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpu: mali-midgard: Add samsung exynos5250 compatible
To:     Guillaume Gardet <guillaume.gardet@arm.com>
Cc:     "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 3 Sep 2019 at 09:33, Guillaume Gardet <guillaume.gardet@arm.com> wrote:
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

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
