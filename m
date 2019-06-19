Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF7794BF78
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 19 Jun 2019 19:19:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbfFSRTX (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 19 Jun 2019 13:19:23 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35257 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbfFSRTX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 19 Jun 2019 13:19:23 -0400
Received: by mail-wr1-f67.google.com with SMTP id m3so105694wrv.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jun 2019 10:19:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YSHXApb/QZTy9FH4NqMivJMJI0my9DBc54bc3V6ZLlU=;
        b=mxli9RKZ7QLrVlOyK1Nqn1PKKYyecN8U72MbC3UywuytzvB2ipl/m5QRrIUgWhiccg
         loPFv1rzhfR8conUEEQ1LZfOmPr7BJodfLV8rSoO8hxmP4WpZV3Drtv5YBSxzO53CTE6
         gtwbYyWwIIaQyE3/ygMoN5JEGIgmWDTq/lbgcNVANfGlZJ+ySlU4Hp05bVGivKkJ4rNT
         lWkwlqQbVmTa752Y5CMGio25QFJUJcjbgOlF5KwLKlGuMxUFF4yGRpJ6nc9jJXswKSVu
         qeD5X1XYPw2W8DsmB3blq5TMQNWWrhU7qE53sGkvpGUITvuZ329BjrBbrzf0euqKO6jv
         12ug==
X-Gm-Message-State: APjAAAUPNk3q8Lx3pKSENLV3HRG4h7dOlpRvQZVSju89pHKhNfWChNPK
        ijEbLMTUrXHkZvfkQbTvd7+CMWhR
X-Google-Smtp-Source: APXvYqwty5Jfr1k3SfjRZOwaKl9aqzAMOMJYJNBmXyW+H/bMRuMbgg5Saekb/fuB24oIyl8AT3kc9w==
X-Received: by 2002:a05:6000:1203:: with SMTP id e3mr22889711wrx.300.1560964760735;
        Wed, 19 Jun 2019 10:19:20 -0700 (PDT)
Received: from kozik-lap ([194.230.155.186])
        by smtp.googlemail.com with ESMTPSA id z126sm1166666wmb.32.2019.06.19.10.19.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jun 2019 10:19:19 -0700 (PDT)
Date:   Wed, 19 Jun 2019 19:19:18 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
Cc:     Kukjin Kim <kgene@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Simon Shields <simon@lineageos.org>
Subject: Re: [PATCH][v2] ARM: dts: exynos: add flash support to galaxy-s3
 boards
Message-ID: <20190619171918.GA24076@kozik-lap>
References: <20190615170428.GA3447@kozik-lap>
 <20190618001742.2828-1-GNUtoo@cyberdimension.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190618001742.2828-1-GNUtoo@cyberdimension.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Jun 18, 2019 at 02:17:42AM +0200, Denis 'GNUtoo' Carikli wrote:
> From: Simon Shields <simon@lineageos.org>
> 
> The galaxy s3 boards use an aat1290 to control the flash LED.
> This patch adds the relevant device tree configuration to use it.
> 
> Signed-off-by: Simon Shields <simon@lineageos.org>
> Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org> [rebase]
> ---
>  arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi | 32 +++++++++++++++++++++
>  1 file changed, 32 insertions(+)

Thanks, applied.

Best regards,
Krzysztof

