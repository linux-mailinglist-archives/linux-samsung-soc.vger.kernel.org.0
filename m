Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A55966080BA
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 21 Oct 2022 23:26:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbiJUV0K (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 21 Oct 2022 17:26:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbiJUV0J (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 21 Oct 2022 17:26:09 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD1CF29CBA9
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Oct 2022 14:26:07 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id r14so10547050edc.7
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Oct 2022 14:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xCqroRj7r9Xlsb6d8RG/ZHM/JuXocYTSP7QwvVjvMzo=;
        b=sTb83LqjhVBp4zTmYFeQLBUyRdfXTM8c6xub72USZc3xE5G0wAXwwvgf+gVZEWZXDF
         d8UlZ6SDLzQ7fNHv4oidAVUUw8HSiiO/jsmWMEUpc6j4vBpLeme8OKgOX2A5dh1VbJ9g
         /jNuTZ4T4ZQkBWdZG9R9/ZzMTrb8fUICUnOWfSiYde6yWXFfkLDmeH0r/7RCOQOhTj0x
         NU7tNYxShOA1MXVV1N4/kIngRmUWVTa/BORp0+Iq3tIZZzvdvKi4shg5/45TnRRnybul
         smNanB3Oz/yX7TLR1jP80YzhdzCdFS+988GPZkd7kn3yIdsO3IgkV6s9NFPcl5o/Ulqr
         feIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xCqroRj7r9Xlsb6d8RG/ZHM/JuXocYTSP7QwvVjvMzo=;
        b=CDKlyChRct68wx6dxZPQUHhhTqGsnpMssCMbv11/xmAO4smPrIRjgFjjRrcfk3ObRn
         nDIp49T0Hkw5bwfuKadVksL4y77G//yvjlgipbxpVu6qIH0loqnBBiQlrTuzhhl1t9ob
         /A3gGnO9JsMIOUE7/HBSXbAYjZwUnj1r2N4kqKL4znITWafF3dhlTulbAnTRYUHDXHxu
         LlyxSfBCRKrF9kQ1sYfDM7OGY25HsLxe5A80+z9r+XNKrHsoaFweTOZ6BH+r8cF9br7u
         XWmYK36I/bY9PSgRK4ZNn+MtZIMelO1/23kXivzMCENn46VH+2vwzaG/8nGJMor1hV8N
         6cWg==
X-Gm-Message-State: ACrzQf184oLi63dogxz0RXyVXESj/2Nfc7mt716neFJgkNp+hcyoOdal
        2+LSd2OdQRp2Oyj96IKRpwgQ1cN7ljdPh8Spii1AtQ==
X-Google-Smtp-Source: AMsMyM7dXJXcD1WC1iZAQS/l9Wr9Un5ATWzX3y+92lsj+xIQKFcTdBo6Meet+7l2j3KldUmrh+pOTiIPGnKR+4MHW3U=
X-Received: by 2002:a05:6402:1cca:b0:460:7d72:8f2 with SMTP id
 ds10-20020a0564021cca00b004607d7208f2mr9835743edb.205.1666387566346; Fri, 21
 Oct 2022 14:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <20221021202254.4142411-1-arnd@kernel.org> <20221021203329.4143397-18-arnd@kernel.org>
In-Reply-To: <20221021203329.4143397-18-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Oct 2022 23:25:55 +0200
Message-ID: <CACRpkdYynbEUcj2-YbeSv1u74jWxmR2MwzVRF1G5+UTFTmXUdA@mail.gmail.com>
Subject: Re: [PATCH 18/21] pinctrl: remove s3c24xx driver
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Oct 21, 2022 at 10:51 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The s3c24xx platform was removed, so this driver has no
> remaining users.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
