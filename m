Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 103E97D5488
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 24 Oct 2023 16:58:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234610AbjJXO63 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 24 Oct 2023 10:58:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234612AbjJXO62 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 24 Oct 2023 10:58:28 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1521FE8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Oct 2023 07:58:26 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-407c3adef8eso39078985e9.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Oct 2023 07:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698159504; x=1698764304; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u3070tuVg4Lvo+woOS/YX5K+Iv976VYg/UJe0l40i+w=;
        b=K1l2sc2yjJWiZqjSxCdEvhZJ1hN0W8OlAubjwK6pduKK650FBEhYLKt8CpLWe0ORjs
         nypDW5xZrYfTegSAxwS5X+T+O6P0rRn6clPxJceAIoN4aLvJ2PQZj1b7JnEcm9Y2dAbr
         3hNsITVo/bYcCirxJ0pDtWB4wCBErCrh9iWhluCC37O7/oE2s8qNt48bLxJFLu0UTZQk
         h/ohloF6oQrcfqEhO6rY8Tyc2U4gAGnkTpvU8HwaNoJWAuXKyDg7yDoRJhhD+n3lVcDy
         NzPt2erQXsQCjdtfOMIhlx/tvK9PprSZcktxkQCbZ86A1ILJtckZvrCHe9NOlnDdWzDY
         O0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698159504; x=1698764304;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u3070tuVg4Lvo+woOS/YX5K+Iv976VYg/UJe0l40i+w=;
        b=SuSJ7ssvkp8+DgqvDOjO3x4Tq6BwO2eEDtQQrcdt7Gxnc8U1jFRZZ7k4q4ChREvUCT
         6eYITKA0wtDX5jF6KxnfTtYk+S33jY1f6CnWG5kvff8BOkCOl/JIQIOXdr+LHJq0iw/B
         7+FT5r1eQkLU37dc2sFPRzamrCkqu9U7Bg34ZKDGg4liyREKlKDenxwRxsCK3C6KQ9gz
         XWYkPumh4cXqNdOcUvmG4BTiwy1bbDAF4GK8W0EBYlU5G/rgvPKjzrWtzAYO7SAD/8JC
         ZlxBsrfRzbDGgHwV1QkNE7WY4yn+FdiHWLWsTj/kJkgyKyGJKhCtGEjrKVznfpDDqXAh
         EFdw==
X-Gm-Message-State: AOJu0YzyMeta187Q8sx26E0j4TToLxKJ5KjC4Uv7qKjMr1H6pjUIB6tG
        annPwqV9n/SLpzuZ359vmW1xXw==
X-Google-Smtp-Source: AGHT+IH/Dm0KGboLUGC1vCPwVc5b2QNfECJ1HZnLdgFic1pTzymhvIa+Qy684EaulSmKz+dt7P1RhQ==
X-Received: by 2002:a05:600c:5115:b0:403:cc64:2dbf with SMTP id o21-20020a05600c511500b00403cc642dbfmr10805190wms.27.1698159504347;
        Tue, 24 Oct 2023 07:58:24 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id az20-20020a05600c601400b004054dcbf92asm12131474wmb.20.2023.10.24.07.58.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 07:58:23 -0700 (PDT)
Message-ID: <fa624966-176a-47d1-937d-8384fda06513@linaro.org>
Date:   Tue, 24 Oct 2023 16:58:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pwm: samsung: Document new member .channel in struct
 samsung_pwm_chip
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>, kernel@pengutronix.de,
        linux-arm-kernel@lists.infradead.org,
        kernel test robot <lkp@intel.com>
References: <20231012210228.1009473-2-u.kleine-koenig@pengutronix.de>
 <169720375693.285367.8034783567173304872.b4-ty@gmail.com>
 <20231013172750.nxcw2ftihpemnymx@pengutronix.de>
 <20231024145524.7qkzrrdm6zg5hfji@pengutronix.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231024145524.7qkzrrdm6zg5hfji@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 24/10/2023 16:55, Uwe Kleine-König wrote:
> Hello,
> 
> On Fri, Oct 13, 2023 at 07:27:50PM +0200, Uwe Kleine-König wrote:
>> On Fri, Oct 13, 2023 at 03:29:35PM +0200, Thierry Reding wrote:
>>> On Thu, 12 Oct 2023 23:02:29 +0200, Uwe Kleine-König wrote:
>>>> Fixes: 4c9548d24c0d ("pwm: samsung: Put per-channel data into driver data")
>>>
>>> Applied, thanks!
>>>
>>> [1/1] pwm: samsung: Document new member .channel in struct samsung_pwm_chip
>>>       commit: 4bb36d126cb3147d6bbfd00242a5b846dacad595
>>
>> You might want to change 4c9548d24c0d to e3fe982b2e4e now that you
>> rewrote your for-next branch.
> 
> This is still open. I wonder there is no automated check that warns if
> there is a Fixes: line in next that doesn't refer to an ancestor.

I am using Greg's/Stephen's scripts in commit hooks:
https://github.com/krzk/tools/blob/master/linux/git-hooks-post-commit
https://github.com/krzk/tools/blob/master/linux/verify_fixes.sh

Happy to receive more ideas during:
https://lpc.events/event/17/contributions/1498/

Best regards,
Krzysztof

