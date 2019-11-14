Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7157FFC6F0
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 14 Nov 2019 14:06:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbfKNNGt (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 14 Nov 2019 08:06:49 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46676 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726202AbfKNNGt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Nov 2019 08:06:49 -0500
Received: by mail-pg1-f194.google.com with SMTP id r18so3737635pgu.13;
        Thu, 14 Nov 2019 05:06:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jKxQ3g2QCYw1ETJ7eUyt+P4Yh1YMiRwmIUhbyNGbkvI=;
        b=rLZ3bzbEbWhNLHL4Ssj2NSpg4wSwAIR1dlqCuNj2rYva0CZYBW3HcGF5jLDifxbHQu
         i2SJGfcBmmzDZmvIWCdfTNcX7TK2px7OJedspXOuxXiqoDF0Aj6Xe7vnvG9GmloMCOen
         j85OgtPLNbWvFpfh+7yk4VSYtTalzE/MVF/6qkHSRLvoRiyVFlTS9gT8ua3nHZ+y0N+W
         n/6GrxBzCjbqZn0ZCBATFwMxJJH1Oz+uiW+BMbgXDWAny5xnBtZLRzVCxy1L+hMu/6sU
         7hCVI9DXnnbxOxKdD/W+bcaYw+HjcNeFKCvsl8SDX/iscqoc+IoLVI7eAEmqRwK4JizL
         h2xw==
X-Gm-Message-State: APjAAAXMcebFkveW4ATYo1Tova328DDjlgcyYBZ3UPqhecBHEcTscyEw
        wBHlwNEplUw50K4IY4drsO0=
X-Google-Smtp-Source: APXvYqz6HcLDXMbPV2kam2Ol4yOZFbMzJdRPhAXcsvJIpmq2YBHH7ZD8SfAkqfvj4SThTSNe5HmhhA==
X-Received: by 2002:a17:90a:e90:: with SMTP id 16mr12337378pjx.65.1573736808378;
        Thu, 14 Nov 2019 05:06:48 -0800 (PST)
Received: from kozik-lap ([118.189.143.39])
        by smtp.googlemail.com with ESMTPSA id fz12sm5781898pjb.15.2019.11.14.05.06.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2019 05:06:47 -0800 (PST)
Date:   Thu, 14 Nov 2019 14:06:43 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marian Mihailescu <mihailescu2m@gmail.com>
Cc:     linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, kgene@kernel.org
Subject: Re: [PATCH v5] ARM: dts: exynos5420: add mali dt node and enable
 mali on Odroid XU3/4
Message-ID: <20191114130643.GB3084@kozik-lap>
References: <20191114000900.26962-1-mihailescu2m@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191114000900.26962-1-mihailescu2m@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Nov 14, 2019 at 10:39:00AM +1030, Marian Mihailescu wrote:
> Add device tree node for Mali GPU for Exynos 542x SoC.
> GPU is disabled by default, and is enabled for each board after the
> regulator is defined. Tested on Odroid-XU4.
> 
> Signed-off-by: Marian Mihailescu <mihailescu2m@gmail.com>
> ---
> 
> Changes since v4:
> - fixed so it applies for latest 5.4-rc7
> 
> Changes since v3:
> - fixed compatible to match bindings
> 
> Changes since v2:
> - separate patch for bindings
> - fixed bindings typo
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
> ---
>  arch/arm/boot/dts/exynos5420.dtsi             | 50 +++++++++++++++++++++++++++
>  arch/arm/boot/dts/exynos5422-odroid-core.dtsi |  6 +++-
>  2 files changed, 55 insertions(+), 1 deletion(-)

Again tried to apply... but it causes new DTS warnings:

arch/arm/boot/dts/exynos5420.dtsi:692.19-695.7: Warning (unit_address_vs_reg): /soc/gpu@11800000/opp-table/opp@177000000: node has a unit name, but no reg property

Send the patches passing checkpatch and not introducing warnings (make
dtbs W=1).

Best regards,
Krzysztof

