Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B3995A2295
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 26 Aug 2022 10:07:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343535AbiHZIHB (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 26 Aug 2022 04:07:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245184AbiHZIHA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 26 Aug 2022 04:07:00 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D6F6D474E
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Aug 2022 01:06:57 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id w19so1694082ejc.7
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Aug 2022 01:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=EFxNeR78FI3l0OC7HZl6P9i468zpQHaQ3saZGSwaod0=;
        b=uFWdeiGlLmROCVF+abK6O/n+PsbMttVes6THDJ8y2LAohfjd6WA5TiVYxHj9GMiEz/
         /o2V0PIbRDule0ccYIFRdZqGaS9X6IIiTK5sAY+4lr1s+PApBmbeMsf7OoMrRngJUAci
         edcD4w4NCdSLmcDx6yybnDfSf6SiGAgoLVS/GZvRyKoMrkMjOKtyciatt+Ty2YNT8HGU
         W2ZfCiIBS5BvuTIcEt6NeCnP+KlL1qfENeyWPlxMhtoJQoctwMLSzjoreyHbpHL1pS28
         rkXNjwvoCskyZQU3peT9/0ORJnwuJxAG5hncEAo/N+YUhHmm+S22atJYioIyqr7giWqe
         M0Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=EFxNeR78FI3l0OC7HZl6P9i468zpQHaQ3saZGSwaod0=;
        b=XuNsTfq29WkJXC9KVrwkUQtM31uAhjaJohrk6+qDW801NWeze5rt06GVHH8cBMNCjX
         H6e8p4IjCTNb8CIrP8/gidm9f7Z4BI/994zaOJcIQ72x+Uia7b6/+pGw1gkvA1inTbzp
         oGzFFukVUyh6+MMIRHs5u4NhO0FOax5vjYQ6vgjf8AKPlsSjJFIaRCnrJ38GUnX3DPvv
         GGAvXx+JHiP90n3fdx5P6PfXd/jdAMTZKeLr5+xN2nv7VLaSBQqD8YYb9btFzOvUtGnx
         UvchJYyt3uL8FMUWfRayE9i3eegKBx4r6o99uYPFMJx4vBhT4AR/uO8aK07LXdAfIriA
         +NJA==
X-Gm-Message-State: ACgBeo01Iq6ddQVR+9f1al29IXNoilawVXSslWMzf1UnlGm4+xEX8uwX
        lzm7Rhag4u3Dsyx3qy+YTaHlgaKa01rsq0LGthsTrg==
X-Google-Smtp-Source: AA6agR7jN7XyheMHhzyh7YMEy8KcA8oU9ydIho7xiM2GGzQ4ny4ssMEayxNW/Er2QZsizb6/p3b/jGMLqTYIWr3h2tY=
X-Received: by 2002:a17:906:478f:b0:73d:7919:b23 with SMTP id
 cw15-20020a170906478f00b0073d79190b23mr4413839ejc.690.1661501216423; Fri, 26
 Aug 2022 01:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220816133016.77553-1-krzysztof.kozlowski@linaro.org> <20220816133016.77553-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220816133016.77553-2-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 26 Aug 2022 10:06:45 +0200
Message-ID: <CACRpkdYDAY-OA=YJU4J=-16PNmYb9LdnowFoMSbhQHKqNWxmVA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: pinctrl: samsung: stop using bindings
 header with constants
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Aug 16, 2022 at 3:30 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The bindings header with pin controller register values is being
> deprecated and DTS already switched to a DTS-local header.
>
> Do not reference the bindings header in schema and replace the defines
> with raw values.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Looks good to me:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

I expect this to come to me with some pull request later.

Yours,
Linus Walleij
