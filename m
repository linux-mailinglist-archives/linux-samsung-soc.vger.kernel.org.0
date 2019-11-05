Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C7B3F062A
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  5 Nov 2019 20:43:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390802AbfKETnA (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 5 Nov 2019 14:43:00 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:37604 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390893AbfKETnA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 5 Nov 2019 14:43:00 -0500
Received: by mail-oi1-f193.google.com with SMTP id y194so18703709oie.4;
        Tue, 05 Nov 2019 11:42:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5Pu4OrE4K395x5nbpd+Cxz5TnD1x0ZYI5bC4xcqiIR0=;
        b=JNMrC84KxdGXfILVX9RhPXCC8Q9BYNzNB+Zu0sskZD/5kjX/KYd3tuwLnHIfR3T7O6
         85OQ0i5EvASW8MKBxkXIyDXenMWPKfAr6fSDqkQF7wl33Wdpe4I0u0sXvQ8hG/qUSMRh
         lmt4lXquYfvzdi3Zs2dAGZ+vnF0XZdstP4o/YzJp/XsW6eq3m/He/pYwhGMcbL79DFBI
         6bGLu64SaOIZySJHb5V/F+Kj0WmAfdZ3rUmbzpICJ+NkE61acdrcwC1ljyiaVnNyKSNh
         lX6Nvnqj++p3QoqH9QDWhfl/7RGYJjlzppDY2Rm4+lpQZaJovsEycy+nb4yCHBsNYp/m
         UqYw==
X-Gm-Message-State: APjAAAXVFPT/JD0qCmGZ4QQaXdqPHzvPRetkiYBSsx7yDAYrNrLou2cU
        h05RaYdrK7mfIocsowQ6xg==
X-Google-Smtp-Source: APXvYqwYe+tnDrfr4RSjoqyyhwqH3QE61rOcmw20rYatfALydaTmRWxeZcywYJxSB7Lbx0p2zYxoqw==
X-Received: by 2002:aca:f1c5:: with SMTP id p188mr536700oih.125.1572982979431;
        Tue, 05 Nov 2019 11:42:59 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 32sm6576711ott.43.2019.11.05.11.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 11:42:58 -0800 (PST)
Date:   Tue, 5 Nov 2019 13:42:58 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Kevin Hilman <khilman@baylibre.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: power: Convert Generic Power Domain
 bindings to json-schema
Message-ID: <20191105194257.GA16066@bogus>
References: <20191030173216.5993-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191030173216.5993-1-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 30 Oct 2019 18:32:15 +0100, Krzysztof Kozlowski wrote:
> Convert Generic Power Domain bindings to DT schema format using
> json-schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> 
> ---
> 
> Changes since v2:
> 1. Keep description of consumers in power-domain.txt,
> 2. Rename power_domain.txt to power-domain.txt,
> 3. Indent example with four spaces (more readable).
> 
> Changes since v1:
> 1. Select all nodes for consumers,
> 2. Remove from consumers duplicated properties with dt-schema,
> 3. Fix power domain pattern,
> 4. Remove unneeded types.
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../devicetree/bindings/arm/arm,scmi.txt      |   2 +-
>  .../devicetree/bindings/arm/arm,scpi.txt      |   2 +-
>  .../bindings/arm/freescale/fsl,scu.txt        |   2 +-
>  .../bindings/clock/renesas,cpg-mssr.txt       |   2 +-
>  .../bindings/clock/ti/davinci/psc.txt         |   2 +-
>  .../firmware/nvidia,tegra186-bpmp.txt         |   2 +-
>  .../bindings/power/amlogic,meson-gx-pwrc.txt  |   2 +-
>  .../devicetree/bindings/power/fsl,imx-gpc.txt |   2 +-
>  .../bindings/power/fsl,imx-gpcv2.txt          |   2 +-
>  .../{power_domain.txt => power-domain.txt}    |  95 +------------
>  .../bindings/power/power-domain.yaml          | 133 ++++++++++++++++++
>  .../bindings/power/renesas,sysc-rmobile.txt   |   2 +-
>  .../bindings/power/xlnx,zynqmp-genpd.txt      |   2 +-
>  .../bindings/soc/bcm/brcm,bcm2835-pm.txt      |   2 +-
>  .../bindings/soc/mediatek/scpsys.txt          |   2 +-
>  .../bindings/soc/ti/sci-pm-domain.txt         |   2 +-
>  MAINTAINERS                                   |   2 +-
>  17 files changed, 149 insertions(+), 109 deletions(-)
>  rename Documentation/devicetree/bindings/power/{power_domain.txt => power-domain.txt} (51%)
>  create mode 100644 Documentation/devicetree/bindings/power/power-domain.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
