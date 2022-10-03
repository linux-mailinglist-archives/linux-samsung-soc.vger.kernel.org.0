Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4FDC5F3013
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  3 Oct 2022 14:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbiJCMRg (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 3 Oct 2022 08:17:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbiJCMRf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 3 Oct 2022 08:17:35 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB46237185
        for <linux-samsung-soc@vger.kernel.org>; Mon,  3 Oct 2022 05:17:33 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id y100so13777841ede.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Oct 2022 05:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=UhWZV/mad6F4RpZvlHXFs+zp/JmucbtO6Fa9rpbOMEk=;
        b=xkyPQRCYvXGiLcBvY9yC5upyusGgl/Pv3MufgQUsf9USbnVo9raFRMfG6EjJJk/wFE
         tl0tWn7rkOIQ/XiH2EerwSC6Ran7LO/QW30Neqa0vT/M+U1xgIow98QDUfjds+tlD5aO
         k1nkisLaX+3JU5bE3FkIjA4DCew7aQHqgHSgKolrPgltlM6WFixfDW6kIJ8bXth0RZfs
         hfrH/d4cPAbrNkCtpZI+XVv5qJxkuSw6GQls4cr+h2QmOJC/owme92Nc2NXktmGkA8f/
         KEt4DmiiBxlloKnt3NBCr/Wbx4fP395aSDX5qSZiRPQw25Hd5o/tFNlGkauf/M+xOISZ
         2+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=UhWZV/mad6F4RpZvlHXFs+zp/JmucbtO6Fa9rpbOMEk=;
        b=LBnt4vuWiT0b4DAMZkGpK8JowBCgOSL8QBpO3YJIG3kvcNf2pi0eXfqbWLQ/ZEzKL3
         2MXx9zUMzy4nkcnS9SZLo+3syuutQJ+mCwmh/0iWkwt9gp6ADiE5X4g1TRFPYfbwyTce
         HT8db+J4fL/TE3znEKIwYxts5ZavG4S/x88JsmNyhFb5dqFbyZWl3spXryq2SYccpIST
         RgO17f9qlVfpkr+ZAanQ9cqkIE9+IcJr7v/BL7xU69xXJ+jvD8rXHI8Xdvz2VFkvnHFv
         kU0WQh5d4i2lcKdDBhspU/XnhNnQKNHjRf/WbKYkyD0VMIwgYFVWVYWI+OQ5Jr/cajZQ
         IP7g==
X-Gm-Message-State: ACrzQf1eE7oCfYCwVEE7h3fgjL7sV7Kwle+u8axgij2Jem8q8zz1kEky
        nbhRnf6iTkKqgJdmSbjU+PgrYgILTmBfcAw2hXu3vA==
X-Google-Smtp-Source: AMsMyM5bXQWrSdbav4mhiBEbAe2E6/Y8TidOXR2A9WaFyx6N9CtVVV3NU2QBrVpCbj9WTvew7OeZfg88TE8PBCP3C/Y=
X-Received: by 2002:a05:6402:2690:b0:452:3a85:8b28 with SMTP id
 w16-20020a056402269000b004523a858b28mr17987078edd.158.1664799452346; Mon, 03
 Oct 2022 05:17:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220914034615.1240860-1-cuigaosheng1@huawei.com> <20220914034615.1240860-4-cuigaosheng1@huawei.com>
In-Reply-To: <20220914034615.1240860-4-cuigaosheng1@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 3 Oct 2022 14:17:21 +0200
Message-ID: <CACRpkdZPB9hm7kMUzpMdNu9RP94vgvxkrQ70OGb_Qm8k--2zsQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: ftrace: remove unused ftrace_graph_caller_old() declaration
To:     Gaosheng Cui <cuigaosheng1@huawei.com>
Cc:     rostedt@goodmis.org, mingo@redhat.com, linux@armlinux.org.uk,
        tony@atomide.com, bcousson@baylibre.com, paul@pwsan.com,
        krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com,
        stefan@agner.ch, rmk+kernel@armlinux.org.uk, broonie@kernel.org,
        sebastian.reichel@collabora.co.uk,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Sep 14, 2022 at 5:46 AM Gaosheng Cui <cuigaosheng1@huawei.com> wrote:

> All uses of ftrace_graph_caller_old() were removed by
> commit d3c61619568c ("ARM: 8788/1: ftrace: remove old
> mcount support"), so remove the declaration, too.
>
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Please put this into Russell's patch tracker.

Yours,
Linus Walleij
