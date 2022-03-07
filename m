Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A569C4CF4DF
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  7 Mar 2022 10:23:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233116AbiCGJYI (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 7 Mar 2022 04:24:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237335AbiCGJXp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Mar 2022 04:23:45 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C36C527D1
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Mar 2022 01:22:50 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id b5so22174591wrr.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Mar 2022 01:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=2H3bOlfOoJGazb69yKfS/sfq+9Q8+S0RoO93d6v477E=;
        b=qitkM+VpPRyZ/7PZxnPXOdyD3DXCy+67o2nET6cp2jEHCTTb96yr41T9AXJKcRZ1hp
         WtyeZpk2YKhEzas9JXy9ICW3KI0X/3Wzyc9WDibpfnb2G0CE29bV37s7HfSgRyeLO5rA
         FuhXPOGGHm96mkDBm7ZmCjkUpIRg3diZIX12Q4cPLHN76zYpmUyPawOfOhTZ6ydVkIn1
         M94R2/vtVzuXVSv/qfYLNWiXAfxND42doEg7n4P7aZnq0s4onroDm9r77+mxTEyAYZEI
         5Gg/6aJSHVh+Ow4TQE49JKlw+ShZ7Oe+tU1tMGw8k8jBgPxnFLR0W/cmlWWDaL/tG9pN
         fTcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=2H3bOlfOoJGazb69yKfS/sfq+9Q8+S0RoO93d6v477E=;
        b=GUQooE9kxBVg3UyS/EF2pGXIozb9BdnRmIfQ+UglXUp/hj+kPsXlkIecKCIAEWuoPG
         5WxitAl8FrARgHbf3AiZxJwv+AFlVhMR/VSYM2IF7aH33uNSpGvbRCa0EWv+iRddGsGI
         RiNWWz2YMpzYEzCqZFa3zfNGhJ2yJ9lgiFFBbVRHqRal7T57dI/1cVwj9/yM9ibEJlWc
         XT+Ge45koeG2OZGGXgTshrs5/U2hnFfn3SbOb7SU6G6FsIBD7Ob6doj2t35SXO4cl6UO
         dKfxtyEeclUIiGeH+WdLSrD8lOKKx6SB2tGUw3cXeurjBbGyZI8hvgYkIN5nOS6N/rXN
         rTPg==
X-Gm-Message-State: AOAM530Qav0Q2jCCgjuOQPbOIkV5ca1Z7sExgwjOr63WYmWO13ZRTSOh
        VaZZWZzNNraAIrNUW2DcCGxMuA==
X-Google-Smtp-Source: ABdhPJxPhwAw8l9WqBnwJbxiH9KL3OutpuQdPLX3w899jAz9Onsp44AI9k8My/RHezDWBSOGBG/UKw==
X-Received: by 2002:a5d:5449:0:b0:1f0:1a0c:963f with SMTP id w9-20020a5d5449000000b001f01a0c963fmr7231900wrv.98.1646644968650;
        Mon, 07 Mar 2022 01:22:48 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id b1-20020a5d40c1000000b001f1dd6ea504sm5440695wrq.59.2022.03.07.01.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 01:22:48 -0800 (PST)
Date:   Mon, 7 Mar 2022 09:22:46 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Pratyush Yadav <p.yadav@ti.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 4/4] spi: s3c64xx: allow controller-data to be optional
Message-ID: <YiXO5plQdpsVfwo1@google.com>
References: <20220124082347.32747-1-krzysztof.kozlowski@canonical.com>
 <20220124082347.32747-5-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220124082347.32747-5-krzysztof.kozlowski@canonical.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 24 Jan 2022, Krzysztof Kozlowski wrote:

> The Samsung SoC SPI driver requires to provide controller-data node
> for each of SPI peripheral device nodes.  Make this controller-data node
> optional, so DTS could be simpler.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Andi Shyti <andi@etezian.org>
> ---
>  drivers/spi/spi-s3c64xx.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
