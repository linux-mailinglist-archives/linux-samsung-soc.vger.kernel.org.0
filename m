Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 263911A8EF3
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 15 Apr 2020 01:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733181AbgDNXNK (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 14 Apr 2020 19:13:10 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:43764 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729358AbgDNXNJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 14 Apr 2020 19:13:09 -0400
Received: by mail-oi1-f196.google.com with SMTP id j16so11979822oih.10;
        Tue, 14 Apr 2020 16:13:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VvYN+POzUP/HxZIW68dFGmEkR5GANu8XsXmHkqwh3r4=;
        b=LuYvRXYeP411lHfgR4fLTUPU7Og85b7wQxEkF2BBtbTvlzLrtELtbYrXQ0IwZQ1J2o
         6vhiT5fDDdNlnVLNr+/DU3LgmscXOzpPiHDXL+oRf/95CZey2gmLM651cchi+GHUAxmI
         brIgLwKhPZkR8dfeI47chcH18/I/VYav0iVOUqPf/QQy4LSDI6pGaABXfEK1kdUeOsGI
         /VQqbNMwhYPFg4O3NmLPpwQaTEi2PNJHEBp0W13QXisQsda464B95Ezhc1U5hRod9cgQ
         xitniWvRx5odmlTfrdFBgb1yD6OY877KFoF8V0Ji56liLQCsmYdOp4bl4OSzlJACvC35
         IZMA==
X-Gm-Message-State: AGi0PubKXB/F40v1Z6NJLiQswXheK3goSsq678YJXWy2IsAFbqZXdxcz
        I8utuO3hCf7WTBU4tc1FzQ==
X-Google-Smtp-Source: APiQypK61RTHR9kuSvlYPwIECBbuocsSAp6KyPuha5OGWWkV7afY5lGlf+sLaVr7JcOhZjc7RQrgHw==
X-Received: by 2002:aca:403:: with SMTP id 3mr12694157oie.166.1586905989246;
        Tue, 14 Apr 2020 16:13:09 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i7sm5911183otl.12.2020.04.14.16.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 16:13:08 -0700 (PDT)
Received: (nullmailer pid 9163 invoked by uid 1000);
        Tue, 14 Apr 2020 23:13:06 -0000
Date:   Tue, 14 Apr 2020 18:13:06 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hyunki Koo <hyunki00.koo@samsung.com>
Subject: Re: [PATCH] dt-bindings: memory-controllers: exynos-srom: Remove
 unneeded type for reg-io-width
Message-ID: <20200414231306.GA9106@bogus>
References: <20200406104554.29773-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200406104554.29773-1-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon,  6 Apr 2020 12:45:54 +0200, Krzysztof Kozlowski wrote:
> 'reg-io-width' property is an enum so there is no need to specify its
> type.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../devicetree/bindings/memory-controllers/exynos-srom.yaml   | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Applied, thanks.

Rob
