Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0455D1B22FA
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 21 Apr 2020 11:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbgDUJhy (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 21 Apr 2020 05:37:54 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:42406 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbgDUJhy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Apr 2020 05:37:54 -0400
Received: by mail-ed1-f66.google.com with SMTP id s10so9732358edy.9;
        Tue, 21 Apr 2020 02:37:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pUIbDFhJqr/9wTzVT1i+Z8HZyJJH5JjwfcGGQ9Cylwo=;
        b=gtfUmLIhaRdUaaAxv6f+jqA6EhUhRf7dSYmaQAs0i0uvinneZm5v6aGjnahZqnSBlG
         bddhXZEIsVPXMLw1dZhVFTf28zfXVbgcUG96Z+1C5xs241tU6VZOZpu/7pjOoy8b5AqF
         AZETOAmkdcbW7YyFDnRW0DTajdH98ND8bdImDUi8tIZvrGvlhE6KJR8j1aGk58anIgQ+
         +oYjLXVEgM60E8lhB/UJF1/3dQmQo5rndygYZ9UMWU3krV3/oWrvcBySRzT/aPDPnmKU
         TyuoVDIHX+EklIdBfft2rCShdoA58J4jNgFxh6M3OVDY9psrqhwUEe6KCleUKeDc3QX1
         Sl2g==
X-Gm-Message-State: AGi0PuaI0ovHPULDv8s6U0Bu3WtjQvNZSYJDfwtxFNRBPNXqUpmxv9B/
        mzTAg8h0/jD8peqKkm+JSIg=
X-Google-Smtp-Source: APiQypLey0EZfhN+xSWm9hifQNy4VwGD3CtpJ8LAoBR+n0J7QuYWrrulY3K53UdHJhYaiDQtDSTYug==
X-Received: by 2002:a05:6402:b03:: with SMTP id bm3mr17363469edb.299.1587461872371;
        Tue, 21 Apr 2020 02:37:52 -0700 (PDT)
Received: from kozik-lap ([194.230.155.125])
        by smtp.googlemail.com with ESMTPSA id k33sm279519edc.18.2020.04.21.02.37.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 02:37:51 -0700 (PDT)
Date:   Tue, 21 Apr 2020 11:37:49 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Tang Bin <tangbin@cmss.chinamobile.com>
Cc:     kgene@kernel.org, linux@armlinux.org.uk,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shengju Zhang <zhangshengju@cmss.chinamobile.com>
Subject: Re: [PATCH] ARM: samsung: Use devm_platform_ioremap_resource() to
 simplify code
Message-ID: <20200421093749.GA30127@kozik-lap>
References: <20200419070607.15488-1-tangbin@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200419070607.15488-1-tangbin@cmss.chinamobile.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, Apr 19, 2020 at 03:06:07PM +0800, Tang Bin wrote:
> Use devm_platform_ioremap_resource() instead of
> platform_get_resource()+ devm_ioremap_resource().
> 
> Signed-off-by: Shengju Zhang <zhangshengju@cmss.chinamobile.com>
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---
>  arch/arm/plat-samsung/adc.c | 4 +---

Thanks, applied.

Best regards,
Krzysztof

