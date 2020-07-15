Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 097E9221634
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 15 Jul 2020 22:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbgGOU1Z (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 15 Jul 2020 16:27:25 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:38816 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727037AbgGOU1Y (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Jul 2020 16:27:24 -0400
Received: by mail-il1-f196.google.com with SMTP id s21so3154131ilk.5;
        Wed, 15 Jul 2020 13:27:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hp5HmzJiHOmmnapmKHc4+WA+MfvOrYT+drbJbUm7gKg=;
        b=UvWVrXvG5O1ipP0/BuhJSeUTg2w4NuvDm5/CRk/3oPyGdD6kZlv+dUwY6NqyTx0Hmo
         aG27HDF4gDLI1MFbZsEoURGvTUdDOGiVPwM85HsZb5rUHPJir6ceIWSToVAHnq+JSo80
         G+4b+4eIpuiUxMpKmMQIwE3nnoxMKna4h8YyAwcAHN7Q/A/223+Z0xOtdMPGkPLxN+EJ
         o/Epsj8Emw/NK+Y5JKn0gmLZqsH0afDGxkqkyPlyPtsOvSHJcA5F6T8f8F1px4/Gl1wE
         FMU94I1fBZoNxsj5lm0I2z7FwKVwVD1aZm4Hk6CB66haopqcoa4JSmc9jptrtlsbtNQQ
         D3RA==
X-Gm-Message-State: AOAM533MDQNGOj2VfwLNbR8bAyys7kPWpTvfiKA/dpuzrKIjGZLP7PN6
        /9LXkWQw67Hz/cJi/TndItyJalotdg==
X-Google-Smtp-Source: ABdhPJxXvFJvhAfWEuKEbOGO1wNXti8nZgtJ+L13uNRdVTDvDYHxTrzya0aAkmOv1Hxo8Ie4S8fOww==
X-Received: by 2002:a05:6e02:13e2:: with SMTP id w2mr1283656ilj.9.1594844843463;
        Wed, 15 Jul 2020 13:27:23 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id c16sm1563716ilh.54.2020.07.15.13.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 13:27:23 -0700 (PDT)
Received: (nullmailer pid 762998 invoked by uid 1000);
        Wed, 15 Jul 2020 20:27:22 -0000
Date:   Wed, 15 Jul 2020 14:27:22 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>,
        linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: arm: samsung: Do not require clkout on
 Exynos5260 and Exynos7
Message-ID: <20200715202722.GA762968@bogus>
References: <20200629203859.17298-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200629203859.17298-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 29 Jun 2020 22:38:59 +0200, Krzysztof Kozlowski wrote:
> The PMU (Power Management Unit) driver is a clkout clock provider (for
> clock signal monitoring) only for certain Exynos SoCs.  It was never
> implemented for Exynos5260 and Exynos7.  This fixes dtschema validator
> warnings like:
> 
>     system-controller@105c0000: '#clock-cells' is a required property
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../devicetree/bindings/arm/samsung/pmu.yaml  | 22 ++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
