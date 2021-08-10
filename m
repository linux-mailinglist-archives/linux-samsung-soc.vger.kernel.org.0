Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05E363DBD1D
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 30 Jul 2021 18:34:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbhG3Qe7 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 30 Jul 2021 12:34:59 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:40972
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229758AbhG3Qe6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 30 Jul 2021 12:34:58 -0400
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 28FBA3F322
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Jul 2021 16:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627662893;
        bh=LOZkX2Gn1AlaUpgTb3/KKeIofvF4AshHz3LJwLGMhDk=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=NPQ+KU4iCL7fvE3s9FKGfAC4SHla0KCOsGPHtY8ewTRaglRYNH041fct6BzwMw7cY
         dP657bb0JQqWrjCB2GD/Iwfy2o2q6Zj+juBAJCaipfzf6eTUoo2OEpamt8OvTmfTOe
         Ybbf+WRem6IAvhJQBVMc9fftBiTOp/Zz03CDN6i02rQdeOxulSqrabSGGB8DZ3+a8X
         IVM2Mh/ulhZLyWJQGB5VI8HqplRJB0wnvuy8/8SyL7opc3BS6dSIgS0d/j00NNT4mU
         bPew+ProxjhEWJa71d09pA1ksA47cdm55eFKqF+hDYpiqLx+1zeeokoUeo4+XcJo7F
         L5j9Q80NZiFLQ==
Received: by mail-ej1-f70.google.com with SMTP id qf6-20020a1709077f06b029057e66b6665aso3311038ejc.18
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Jul 2021 09:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LOZkX2Gn1AlaUpgTb3/KKeIofvF4AshHz3LJwLGMhDk=;
        b=Ihw6vTvuUHUViGAi+2UmEDuOBUEfHGr1xtCIPMGIU/vuHtZsYBCOPOSdp7z18SHr7G
         eT+nx3QplkISHR2MaEDdV4XPZRoek389auMX87Y3uRFWx7CyvkJitBNiqfG/jTpXs7oP
         KLB5cFuV2CdA0duWJ+6k+RPYvU89oPTvf1lZy6NmavDi+vLN+ADU7jCDf/f7yIn1vZIY
         wnCjFxk0SsjhvwJLn1iE1C9SKgpqIubZuu6eTE+MZnlv2ABy2EFZiTRw21vNsOL4dikx
         LfezGYwR4ikt59oGw/V4LnHlKPZEopXrM6BhjjPYxKGrMzMVzwntZ1JjBIUs7NyjjkgM
         iP+g==
X-Gm-Message-State: AOAM5313fal1Id9bcKm13wIrRV9L8DwjW+M6BHr4S4NUssR4rpDX0/+o
        004NnskpQhImKsbQmQK84Mw/GVopI15fIFRK3aPUjo658B+CrPbwJmNzzrYnwB/Poa7XQfu1aQB
        3NJdIJ6JTkeWBe82fxhWg/wF0QrbY/c4WZe/uIAtBlgRM7y07
X-Received: by 2002:a17:906:c0d1:: with SMTP id bn17mr3262435ejb.511.1627662892674;
        Fri, 30 Jul 2021 09:34:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAQ3oDEvssRhYOquKsKs0awtj++lTiixkq4+khiYVFew5afUiOqz586WxPl24Q2+jJCRUS5Q==
X-Received: by 2002:a17:906:c0d1:: with SMTP id bn17mr3262411ejb.511.1627662892551;
        Fri, 30 Jul 2021 09:34:52 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id b25sm928440edv.9.2021.07.30.09.34.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jul 2021 09:34:51 -0700 (PDT)
Subject: Re: [PATCH 05/12] tty: serial: samsung: Fix driver data macros style
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
 <20210730144922.29111-6-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <e11d0e60-9bbc-16d2-c8ea-42d3d93e97d1@canonical.com>
Date:   Fri, 30 Jul 2021 18:34:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730144922.29111-6-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 30/07/2021 16:49, Sam Protsenko wrote:
> Make checkpatch happy by fixing this error:
> 
>     ERROR: Macros with complex values should be enclosed in parentheses
> 
> Although this change is made to keep macros consistent with consequent
> patches (adding driver data for new SoC), it's intentionally added as a
> separate patch to ease possible porting efforts in future.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  drivers/tty/serial/samsung_tty.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
