Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 530CB55D7E0
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 28 Jun 2022 15:19:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234612AbiF0L3I (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 27 Jun 2022 07:29:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235342AbiF0L2S (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Jun 2022 07:28:18 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8817065F1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jun 2022 04:27:21 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id mf9so18590782ejb.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jun 2022 04:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=k9MqrgbTTsXE60HbuKbGjuo6KUb+HHzI3Nv+d6/bKwA=;
        b=QUir81qMaYP+mC5/auH1wh0jOh3yq9CN496pJ8QGCqWFm2OHK4EnzayglPYC9ITq92
         3A03iphTi0z7RARpGijh7Ir7vgQYX30BgGpcRo7c59vqztzxCRMjvS5dn79iD5qLa/de
         OuTw2/k6yXDxnE4C985WZauv8ltVQr3g6HXKKSU7HPmyg737PUQml7wkBwgChUZXyTrM
         RDXFpMDPhpl+MkCUheIxg78NuCN/JPv6JBXz/IXrCXx9R2wMUdH4YFuqiLMLVC5IqwCC
         S6SKoSWKt4VH8ezJ4Q0CgmBP2qOlazjqh9zWX51K/rsgrSLXiAuN7VMVlRxShmi7Nk3k
         LCiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=k9MqrgbTTsXE60HbuKbGjuo6KUb+HHzI3Nv+d6/bKwA=;
        b=E3YzFf23MLqn2/bNWPnmDZsWFmZBDi8qIBzYIGBze4W0vmdawHf555yVq5BXmF5Ngu
         heaIvlePnKwVdgrzdTCtKBFeadMSpc/IFUfhpPKCRbO3jLBEnNUccwr6fQMwlCdTBdpJ
         P2YKs6pgwO4WzF9yDOs5HNE62CUReayU4QU2dVrUbXKnBmgNx+C5Yz8qKpYZQay/EB/H
         Hq6Fp6fX3C04RT2VItaihISjSpQtauFoSVh/p4MPC+lzpCCbdDxGIF0Bj6KH57Wmed0g
         FR3MPg4dlYj7mm0FAEOqPFIE9c+U48iAxnYgpRW+01OFquDPmcJKAHK2p2R7LNDTNc8a
         4/jg==
X-Gm-Message-State: AJIora/dPgKoPQSBMM4UzTBaVF0eJXnneDB7Ww15IWBgimGrPu0uKzxM
        eO1XJWTWvuqmMHJQal9RbUmsSA==
X-Google-Smtp-Source: AGRyM1sDeQlNdncRDGUq02uGdhU8155q4AIyhTwBjOFr411GSJDA30FUo0IQZdOFbJRU7iR2YnvaDQ==
X-Received: by 2002:a17:907:930:b0:711:da36:62f7 with SMTP id au16-20020a170907093000b00711da3662f7mr12292917ejc.468.1656329240170;
        Mon, 27 Jun 2022 04:27:20 -0700 (PDT)
Received: from [192.168.0.249] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id s17-20020a1709060c1100b00722e52d043dsm4964746ejf.114.2022.06.27.04.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 04:27:19 -0700 (PDT)
Message-ID: <312a5c20-e67b-b965-c4fe-a14027d6398c@linaro.org>
Date:   Mon, 27 Jun 2022 13:27:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] tty: serial: samsung_tty: set dma burst_size to 1
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jiri Slaby <jirislaby@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Hector Martin <marcan@marcan.st>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>
References: <CGME20220627065344epcas2p47a12d290f985e39178b560a6f1e53807@epcas2p4.samsung.com>
 <20220627065113.139520-1-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220627065113.139520-1-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 27/06/2022 08:51, Chanho Park wrote:
> The src_maxburst and dst_maxburst have been changed to 1 but the settings
> of the UCON register aren't changed yet. They should be changed as well
> according to the dmaengine slave config.
> 
> Fixes: aa2f80e752c7 ("serial: samsung: fix maxburst parameter for DMA transactions")
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  drivers/tty/serial/samsung_tty.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
