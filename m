Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1865631354
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 20 Nov 2022 11:31:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbiKTKbv (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 20 Nov 2022 05:31:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbiKTKbs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 20 Nov 2022 05:31:48 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9BBC78190
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Nov 2022 02:31:45 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id c1so14894002lfi.7
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Nov 2022 02:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0OGFENIO3DSQAq7m00vJ/5Y2wI4AbIbEyIhhqocLUF8=;
        b=G34Ax0pxDeb0umq8Wg6bINoXwwg4xrj4gplMlIvhlhJkfWDjRCpDAB0/KcrvlKUOuM
         bcjLjGLw1TYr9l3GciuUlFJvEt+qaAoVZvVtamrkMzA9S/qyU2QXdMi07aMGRH5+thUv
         MxGiUnohfGraIr+OObOUTHxPkkj28ZjUghw+U2LGIaZvBTJ9IQ8/mkUnfTbE7wgukfet
         R0zmP4k3cpRXhIlTwttu/Aj+/AuCbopVR3lnSVwqmPuPqugFqXRgqooYlDyD+Xq9GbU6
         PyE3ejo+lFOiNdUJ/KWtVrGlxmtc04l3PtLHeF3S8TpTc2S/Got65pRsIEp/HsDmLQlt
         7koQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0OGFENIO3DSQAq7m00vJ/5Y2wI4AbIbEyIhhqocLUF8=;
        b=pq9YLXiurdbm8/O6YKTPhmwk0LSJZPBQ+QxMcRfNpevD+si0FQGp3fG7He1l8UM8Yz
         98+NNlC7NiRJwKCA6DKYPVWtjZx8tLph5e4QSaG9tzfvyOybPIqJplnrTmm9XqLhuTrZ
         O0SxJoMFHjjeCi8iktrSP+buV5ag3gc6PiyPhyMMZdi6yAOwLdRemB8xglYcKLwsr6oq
         vq62tRmUZyVF2mxcdjvzSMuywT5XKkoSQu7ekii3Zdn7e41EyzNyrpEpRHkHHM8eYFMq
         Gx3QdXVHgyaPgLl+4yaMUh1h5pqQy7lnZkGf2rTwe1bFSQTIwp2vZvaxdDW9+KQzFFDd
         VRSA==
X-Gm-Message-State: ANoB5pkgBUpVWkj6O65tdaLTvLqoq07gaFf3rti5reAZ5QtoqJOGSmFF
        U53Tc5dwSGsUCqw4R8HA413sxQ==
X-Google-Smtp-Source: AA0mqf6Q6IMpj3NP1GucZRXTNScUlowQod5pAwuxeeweJ7M+4+YKBtZlVjbdYqoZWICNRSEzitXHZw==
X-Received: by 2002:ac2:5dea:0:b0:4b2:2cff:8446 with SMTP id z10-20020ac25dea000000b004b22cff8446mr4560400lfq.572.1668940304033;
        Sun, 20 Nov 2022 02:31:44 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v23-20020a056512349700b004994c190581sm1491384lfr.123.2022.11.20.02.31.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Nov 2022 02:31:43 -0800 (PST)
Message-ID: <f0425349-d965-0a40-0672-27dfbe45eb44@linaro.org>
Date:   Sun, 20 Nov 2022 11:31:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] ARM: s3c: Fix a build error after the s3c24xx dma driver
 was removed
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Arnd Bergmann <arnd@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        dmaengine@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        kernel@pengutronix.de
References: <20221021203329.4143397-14-arnd@kernel.org>
 <20221118215401.505480-1-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221118215401.505480-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 18/11/2022 22:54, Uwe Kleine-König wrote:
> The linux/platform_data/dma-s3c24xx.h header file was removed. It didn't
> declare or define any symbol needed in devs.c though, so the #include
> can just be dropped.
> 
> Fixes: cccc46ae3623 ("dmaengine: remove s3c24xx driver")
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---

The file was not removed... or it should not have been yet. The s3c24xx
dma driver removal should be part of Arnd series taken via SoC ARM.

Best regards,
Krzysztof

