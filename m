Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 887397B30D3
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 29 Sep 2023 12:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233014AbjI2Kqe (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 29 Sep 2023 06:46:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232925AbjI2Kqd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 29 Sep 2023 06:46:33 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C51C31A8
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Sep 2023 03:46:30 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-307d20548adso12323028f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Sep 2023 03:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695984389; x=1696589189; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PomosRj11Rw7FzKt/a27wORhob1DvLPTYexDbFcMqUs=;
        b=INsUeXM1TY6KKYp8pfy65YcGDbN/CIe+8uhc4oxq3hOMsUNEwGtUUv0XMKTV8m8oPC
         aZ09sdIQjreGeD/XHyXqLTnJtuySXWQyNkVtkfXRqddC3PsfM1cy5zoWu0f+/LyAvtBD
         vydADrdEkX/OWdFENKaD4dxEHiyZZsIb2t/5nXGO5ej6gGQHMYGMdgKGZ0kqrVptxQmN
         PjPHe4glEDpeJTCOLurGNnlMfQUmtHKULfozGxdI3sMkJjwdS7p9Oi50iNoRqDQ76Dke
         VrPFrMb7gqG85PoFxQfNaoUag55ZDMk8i8Fp5RitocNzqKPyqgVyAyXCHQ0ETQHapuNK
         7Q3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695984389; x=1696589189;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PomosRj11Rw7FzKt/a27wORhob1DvLPTYexDbFcMqUs=;
        b=QL/PsseUb93i+4PORNb/GDVqVpMgndXHRDU79B/J2mHw2GatHQJtQhNpl4GL/luLl8
         y2GxorrWGsFUHepuHWiZtLiYsnC+BIc8L6cmlSgwfTlxc2MyooSjYeo0tUce+m8qVkIm
         YwIvHYRyce83ktOQ8KHSfwJt+s1V3TmeoFykm6AUzOtS0KAVZsHREMyhaTuu7mozioqL
         1PX5EiRYJjvaBM2L2e3Gv+Bh+8HPCvbEameA/00XL08BrecJCEYpLQ1R7ZTv3knqd2B5
         TqooaBWjSbC/PBSh/l25PhFBZXTBxf9JOHfBrs53HdkGQg1yMozWxST2BX2Kcj1ICHxV
         Fm4g==
X-Gm-Message-State: AOJu0YyhhmBZww6LqHRDZClXsFXTLLo4GBq8oPmfoeF5x+hUw7x19jgy
        vX/sDw3btlOBO7ct/uNBRh8w0g==
X-Google-Smtp-Source: AGHT+IHBLhu5LKmDqs0T5cSdi68jCaHZTesf9t3PrH+Vv6MsavFenUPBewzcl5FLn6EjfCUg4Sdw9g==
X-Received: by 2002:adf:f1c9:0:b0:31f:e428:8a4d with SMTP id z9-20020adff1c9000000b0031fe4288a4dmr3556690wro.33.1695984389171;
        Fri, 29 Sep 2023 03:46:29 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0? ([2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0])
        by smtp.googlemail.com with ESMTPSA id s28-20020adfa29c000000b003232f167df5sm10830720wra.108.2023.09.29.03.46.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Sep 2023 03:46:28 -0700 (PDT)
Message-ID: <67a7d507-7025-ee3e-f388-0a96e11eae41@linaro.org>
Date:   Fri, 29 Sep 2023 12:46:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 4/7] thermal: exynos: simplify regulator
 (de)initialization
Content-Language: en-US
To:     m.majewski2@samsung.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc:     Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        ALIM AKHTAR <alim.akhtar@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
References: <bf9a07ff-5628-05ab-2362-a917d3d38313@linaro.org>
 <20230911133435.14061-1-m.majewski2@samsung.com>
 <20230911133435.14061-5-m.majewski2@samsung.com>
 <CGME20230911133616eucas1p10c5eeb0f0240dde975ccc5935cb5c311@eucms1p2>
 <20230926110239eucms1p2b539245c5b10591def4cd15f14896ad6@eucms1p2>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230926110239eucms1p2b539245c5b10591def4cd15f14896ad6@eucms1p2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 26/09/2023 13:02, Mateusz Majewski wrote:
> Hi,
> 
>> This is not equivalent. If regulator is provided and enable fails, the
>> old code is nicely returning error. Now, it will print misleading
>> message - failed to get regulator - and continue.
>>
>> While this simplifies the code, it ignores important running condition -
>> having regulator enabled.
> 
> Would doing this be correct?
> 
> ret = devm_regulator_get_enable_optional(&pdev->dev, "vtmu");
> switch (ret) {
> case 0:
> case -ENODEV:

Not sure to understand why -NODEV is not an error

> 	break;
> case -EPROBE_DEFER:
> 	return -EPROBE_DEFER;
> default:
> 	dev_err(&pdev->dev, "Failed to get enabled regulator: %d\n",
> 		ret);
> 	return ret;
> }

ret = devm_regulator_get_enable_optional(&pdev->dev, "vtmu");
if (ret < 0) {
	if (ret != EPROBE_DEFER)
		dev_err(&pdev->dev, "Failed to get enabled regulator: %d\n", ret);
	return ret;
}

??

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

