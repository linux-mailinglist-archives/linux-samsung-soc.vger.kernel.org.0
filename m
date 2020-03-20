Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D2F518CA8A
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 20 Mar 2020 10:42:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726778AbgCTJmn (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 20 Mar 2020 05:42:43 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:46154 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726690AbgCTJmn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Mar 2020 05:42:43 -0400
Received: by mail-ed1-f65.google.com with SMTP id ca19so6329884edb.13;
        Fri, 20 Mar 2020 02:42:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Uw3wiA4XeWZolh1RPXWdN7r53j8eX1MbrQwMp9+W42I=;
        b=ddcAflNcaRhRoefO9tYt0CoC0Lp1qdAM0WcRIK+lvP9ThVacFJOebztUQlMFUas1yA
         ZP69eLlTsWCzbUiDp/u6lhA5WzDDWg0v3NwWuhrnkhfmNypcrGCg17kpW/fJ1QId7/xp
         KPL9jkNOxSTYSm89/kiF668vn7YjZcj8eDrvW2a3FizrkQkGtwVeIZNID6wORLDMfOXj
         PzA5U+tOHXlbgyQMU/bZXEG3x3Wvu/3nHxWiJ8dCqXrrafBV3mMb8gmD8hJAk19mG1H5
         xx/0MYW3tjmOq+d8Ucu+9yFU8dZBX/NadxnFUVnzLQ9M9L3+JO3OhWdBLy9Ln0FoZTkQ
         /jvQ==
X-Gm-Message-State: ANhLgQ3Nj+9yk8fDlMVmWVQna8cPB/98WYmu69t0v7flje0Wra+/4OBR
        m3OBo2GZAY3BNow8942hM+o=
X-Google-Smtp-Source: ADFU+vvsdpCNQuAuqnydlRyT9uYaTSVC3y6hyyG9AUkhW3Gml3Uvhp0Evu01XfV356gRQDmWS8eRtg==
X-Received: by 2002:aa7:c9cb:: with SMTP id i11mr7183183edt.320.1584697360968;
        Fri, 20 Mar 2020 02:42:40 -0700 (PDT)
Received: from kozik-lap ([194.230.155.125])
        by smtp.googlemail.com with ESMTPSA id p7sm298473ejr.62.2020.03.20.02.42.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Mar 2020 02:42:40 -0700 (PDT)
Date:   Fri, 20 Mar 2020 10:42:38 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Kukjin Kim <kgene@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stenkin Evgeniy <stenkinevgeniy@gmail.com>,
        Jonas Heinrich <onny@project-insanity.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm/samsung: Add compatible string
 for the Galaxy S2
Message-ID: <20200320094238.GA12976@kozik-lap>
References: <20200319173411.20607-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200319173411.20607-1-paul@crapouillou.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Mar 19, 2020 at 06:34:10PM +0100, Paul Cercueil wrote:
> Add compatible string for the Samsung Galaxy S2 (i9100 version), which
> is an Exynos 4210 based device.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
> 
> Notes:
>     v2: Move compatible string so that the list is sorted in alphabetical order
>     
>     v3: No change
> 
>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +

Thanks, applied.

Best regards,
Krzysztof

