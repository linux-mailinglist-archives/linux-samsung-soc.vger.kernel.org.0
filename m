Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2CF06458A6
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  7 Dec 2022 12:12:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230093AbiLGLLz (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 7 Dec 2022 06:11:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbiLGLLL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Dec 2022 06:11:11 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C79574E421
        for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Dec 2022 03:10:48 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id h10so20480077ljk.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Dec 2022 03:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I/R5XEHqvCv/dBJza85IzDRA+R2OE43AsS1vbZaQBr0=;
        b=MFZC1oy5osqOw+1EcI33RRoMIrqyMvVdz9q1tlc8qEYjRXYLFL0ElS1kzbNBPCEmvq
         hH3ubXPSURQsejaawIOjYBWA8SkQgo2PWeeh+2OdmmXunDnnSKNqIm3Zgq5H+mhqNKFo
         2BYO334lgakhlywxAJokep+bQ9dq90AkgJ8D+v5H950Jyk4uTCMPFX8h8LzzucaGdQ1e
         IveDyC7Xwf/QpPxtifO7GV+IY2J9tz8dFShJdiHyT9em1eLDn2I11oM/xAZb6FTnwcKH
         tkfzMlVQQyAga+IdD+cRX+tZgSsUR2J41sJclHSggdk4bkYFCblwDrMytVs4REXp4Ix6
         W7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I/R5XEHqvCv/dBJza85IzDRA+R2OE43AsS1vbZaQBr0=;
        b=fguVNMjpD46d0D8j6yWgost/YHnyIBzjKR7s/xE0EthG/26yKfoxMsi1WDRxMmmM6N
         IEcm9BJOe5dE6YttCOkHzt3jqiSjRBniXBDeAp7ZEQcDV+ORFt8+GKt4bitkpEU114iN
         Xua2QPXnm09eY9NGP0uClx7Ky8BmKnTLw4HRYOUp0o/78HZQjUWzoDYtpoplKf6kNhcT
         T7QVdDTuaiMqaxBS2g2Bnch6TMc3FRkNr1DtvoOEAcP/Gg08wdGhlH7mhQnqRYz5RDBt
         lXKo7Mc/Jvth2lQbGcXGwKMFfSmA0iNTV4RoGxqgBVMJxm4ydJchUOrax/Fy8pa0VQbj
         ayrQ==
X-Gm-Message-State: ANoB5pmZYbVWWfFLkcNlojlMl88orvD6NRmPzz07QEhpc3iJZ3G8wKw7
        dFC5bEe0r7c+3ZBHkCRVeG72bw==
X-Google-Smtp-Source: AA0mqf5p3BNj3uFb2TP1cT3jHeb6hwLnSTS2eYcwieYUGt8yyC0uxli65OWvuygEPrZf2y0huoo+dQ==
X-Received: by 2002:a2e:808e:0:b0:27a:1e62:6fb5 with SMTP id i14-20020a2e808e000000b0027a1e626fb5mr323775ljg.58.1670411447010;
        Wed, 07 Dec 2022 03:10:47 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m4-20020a056512114400b00492e3c8a986sm2792625lfg.264.2022.12.07.03.10.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Dec 2022 03:10:46 -0800 (PST)
Message-ID: <ee0d323c-cd55-c486-500e-93dc693ade3f@linaro.org>
Date:   Wed, 7 Dec 2022 12:10:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [Patch v4 2/2] arm64: dts: fsd: Add MCAN device node
Content-Language: en-US
To:     Vivek Yadav <vivek.2311@samsung.com>, rcsekar@samsung.com,
        krzysztof.kozlowski+dt@linaro.org, wg@grandegger.com,
        mkl@pengutronix.de, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, pankaj.dubey@samsung.com,
        ravi.patel@samsung.com, alim.akhtar@samsung.com,
        linux-fsd@tesla.com, robh+dt@kernel.org
Cc:     linux-can@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        aswani.reddy@samsung.com, sriranjani.p@samsung.com
References: <20221207100632.96200-1-vivek.2311@samsung.com>
 <CGME20221207100700epcas5p408c436aaaf0edd215b54f36f500cd02c@epcas5p4.samsung.com>
 <20221207100632.96200-3-vivek.2311@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221207100632.96200-3-vivek.2311@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/12/2022 11:06, Vivek Yadav wrote:
> Add MCAN device node and enable the same for FSD platform.
> This also adds the required pin configuration for the same.
> 
> Signed-off-by: Sriranjani P <sriranjani.p@samsung.com>
> Signed-off-by: Vivek Yadav <vivek.2311@samsung.com>

This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions. However, there's no need to repost patches *only* to add the
tags. The upstream maintainer will do that for acks received on the
version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.


Applied for v6.3.

Best regards,
Krzysztof

