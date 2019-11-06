Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40476F1791
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  6 Nov 2019 14:46:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729001AbfKFNqC (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 6 Nov 2019 08:46:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:58214 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726673AbfKFNqC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Nov 2019 08:46:02 -0500
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A9E342173B;
        Wed,  6 Nov 2019 13:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573047961;
        bh=9ooMijLLX5vEJI2zDzsStr/RjiYwBZXaTA+1USQBnms=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=pZ6MI4Sa049skPVFLBG3b4ECjI+spwZDDYYLuQmcoCwpX2x/KjjvmuSgGXK94BpMe
         61HVlmpakTvXD/KibUaNPv5EwHV2PyFuUytZDFNH2hgJMvyzlBUTtaYtQXFQbvXchZ
         zKW2nGg7lFjfTJc9Fo5gXzmObjVaF1BaA3riwJuQ=
Received: by mail-qk1-f174.google.com with SMTP id q70so24551147qke.12;
        Wed, 06 Nov 2019 05:46:01 -0800 (PST)
X-Gm-Message-State: APjAAAVONt3z2JA0tx21FP/vsWjuMRZYtOXOc6t1DTcdeqgll3Y+1rMI
        IUIGdcwMWABb8wMPw3HKw8Abaxaymfo+TF3Daw==
X-Google-Smtp-Source: APXvYqzKodA0H+8cMHnbaVAdmWVwHGhTRa20VjkV1siY7MSUKBtGxZ924TlE85C0A3FqVoYNE8H52coUZjb/5ccw+4s=
X-Received: by 2002:a05:620a:205d:: with SMTP id d29mr2070554qka.152.1573047960848;
 Wed, 06 Nov 2019 05:46:00 -0800 (PST)
MIME-Version: 1.0
References: <20191106062511.3262-1-mihailescu2m@gmail.com>
In-Reply-To: <20191106062511.3262-1-mihailescu2m@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 6 Nov 2019 07:45:44 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJeSsih37PrRtE8TgOM4eEv+fwfuaUWDMamM-T32_=5ug@mail.gmail.com>
Message-ID: <CAL_JsqJeSsih37PrRtE8TgOM4eEv+fwfuaUWDMamM-T32_=5ug@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: exynos5420: add mali dt bindings and enable
 mali on Odroid XU3/4
To:     Marian Mihailescu <mihailescu2m@gmail.com>
Cc:     linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kukjin Kim <kgene@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Nov 6, 2019 at 12:25 AM Marian Mihailescu
<mihailescu2m@gmail.com> wrote:
>
> From: memeka <mihailescu2m@gmail.com>
>
> Add device tree bindings and nodes for Mali GPU for Exynos 542x SoC.
> GPU is disabled by default, and is enabled for each board after the regulator
> is defined. Tested on Odroid-XU4.
>
> Changes since v1:
> - used generic node and label for GPU
> - added bindings for compatible
> - fixed irq indentation
> - fixed interrupt-names to match bindings
> - added cooling cells for future TMU connection
> - used generic node and label for GPU opp table
> - removed always-on from SoC GPU regulator
>
> Signed-off-by: Marian Mihailescu <mihailescu2m@gmail.com>
> ---
>  .../devicetree/bindings/gpu/arm,mali-midgard.yaml  |  5 ++-

Split to a separate patch.

>  arch/arm/boot/dts/exynos5420.dtsi                  | 50 ++++++++++++++++++++++
>  arch/arm/boot/dts/exynos5422-odroid-core.dtsi      |  6 ++-
>  3 files changed, 59 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
> index 47bc1ac36426..e8868cb587de 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
> @@ -38,9 +38,12 @@ properties:
>            - enum:
>               - samsung,exynos5433-mali
>            - const: arm,mali-t760
> +      - items:
> +          - enum:
> +             - samsung,exynis5420-mali

exynis?

> +          - const: arm,mali-t628
>
>            # "arm,mali-t624"
> -          # "arm,mali-t628"
>            # "arm,mali-t830"
>            # "arm,mali-t880"
>
