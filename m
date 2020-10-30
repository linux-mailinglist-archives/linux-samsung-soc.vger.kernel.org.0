Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F4AC2A0D5E
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 30 Oct 2020 19:29:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727182AbgJ3S3B (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 30 Oct 2020 14:29:01 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:39895 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727159AbgJ3S3B (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 30 Oct 2020 14:29:01 -0400
Received: by mail-ot1-f66.google.com with SMTP id z16so1232160otq.6;
        Fri, 30 Oct 2020 11:29:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=4NpsA5nA2wkUvE/qMbVrxKKcYwgaHmrECWmxhZM8s1g=;
        b=EcexzSAQaN3At12/qsSeKBhD077+bKN6fKWhhKBZwOnSzHS2bsoLqmIqfvp4ptmNdY
         yMfDbImz0rYI5p+QFpmrWW8C1VIWUuaJ8SbnY7LXfFfRmSqUi7mPu+0wLO4Zn/PjOT1b
         Eqcu2h1wqE96uRewjvC+F6S5IoOkwle91e8FVga1uh7wWvOUeTe0J7GjOvI0RmuUcXSQ
         KlOTX27TzIsThbngimMvMj5NAf0moA4WlMPeeHB8pteHchLa4d6n62PJdEBKOtlyODft
         Zx1+HwpKKKcnztcWWPuKvtIesS4NzfJDPsY1FEYas1jiPD/ti/ww8OuHldpEMxRQzCbe
         uNVw==
X-Gm-Message-State: AOAM5302+fch0tPwRl2mdEmJij9CLfth7XIv2zbIJGf2Cwkbr8Q8udgv
        tOfkafc+izOzBl+MSbD1zg==
X-Google-Smtp-Source: ABdhPJynX3zltj5DTUoFZn8g6ziERx06loOaoDZTEmjUPTdlWKUz2rnW1APosznMybQVAYfB+WoXEA==
X-Received: by 2002:a05:6830:1d4f:: with SMTP id p15mr2229214oth.16.1604082540657;
        Fri, 30 Oct 2020 11:29:00 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b92sm1484287otc.70.2020.10.30.11.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 11:29:00 -0700 (PDT)
Received: (nullmailer pid 4106236 invoked by uid 1000);
        Fri, 30 Oct 2020 18:28:59 -0000
Date:   Fri, 30 Oct 2020 13:28:59 -0500
From:   Rob Herring <robh@kernel.org>
To:     Martin =?iso-8859-1?Q?J=FCcker?= <martin.juecker@gmail.com>
Cc:     krzk@kernel.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, kgene@kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: samsung: document bindings for p4note
 family boards
Message-ID: <20201030182859.GA4106187@bogus>
References: <20201024144421.34435-1-martin.juecker@gmail.com>
 <20201024144421.34435-2-martin.juecker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201024144421.34435-2-martin.juecker@gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, 24 Oct 2020 16:44:17 +0200, Martin J�cker wrote:
> Document the GT-N8010/GT-N8013 device binding and the p4note common
> binding that it is based on.
> 
> Signed-off-by: Martin J�cker <martin.juecker@gmail.com>
> ---
>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml   | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
