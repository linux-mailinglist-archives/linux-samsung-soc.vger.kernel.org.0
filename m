Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA5DE7F1D50
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 20 Nov 2023 20:31:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbjKTTbX (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 20 Nov 2023 14:31:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbjKTTbW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Nov 2023 14:31:22 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D0DCCA
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Nov 2023 11:31:18 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9d10972e63eso650858966b.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Nov 2023 11:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700508676; x=1701113476; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aSVotS49d/36yA5tzTUTHDX/PosQTkAamLhbxQgGhzk=;
        b=j7PKgDAthzKKasQqQzlziXI9DPBo/fZbc0E9SDesysQ8QaGSLDAJCw3WZCBezyKaH/
         yaAbG6pulPKk20j7ZPFJoCPSWIBMCTlgg8BNgCzY3zYWa8zfM2VBaWqYYdxCCBkJVS7z
         +UGZ5iaH/WMYf9DGqM6xfxXHDxTy9/BzWAfjgeTHX7Ydm9NmxmMMkRcDOAeh1DJuZ5NK
         JhEzmiop4r2MrUsK0rfPo1ndm8pr4xt65vv/P+1Hyh1yV5bUBDZmuAC4UGcWaeYehN9+
         +5Kvs5lB3MqbhntPi3BNNsbZ2oaeya3KgxcFlqwVTQ4lpzQsrRzAvuneMyFmhxnx9NaF
         a8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700508676; x=1701113476;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aSVotS49d/36yA5tzTUTHDX/PosQTkAamLhbxQgGhzk=;
        b=vMWS/3lBZApdCcSLSFANyGbFqlgC1nwN8yvvVABPsjj7qN59FXshdgYEe0NhOY1tm7
         +PheQ0QF7Rf1WXY1N0r0qXa3hJWZjwycvTyoJF4oKI27e1XVenYJial6j/q7k9+u+qIK
         hZ1I40TMlAjTU8wkDjavQE12UqP0Ozie46ISuBpzmVn9NdHzxRUPM2v5zxDpgg7x9990
         Fgv1JuT8op8FoT0p7NX2rK+rZKm24D09PWy6Sa605C89yYp2ll4cIJGQVOwXyKsqZ0Q2
         nv8ldw8igO68ZYW1CmKjgwwJCqeMGOsynKYeWVIwbCM3tXXzJJzkWnwVFLgGMl2BWTG9
         zhAQ==
X-Gm-Message-State: AOJu0YyG2Znzp8USkMSb+Cmn5oVGPpZhSKZeQ3Hx3RK0Ta+X6aS4XCP4
        XrINJo/p7ksxWYGlp9rNGT4ryg==
X-Google-Smtp-Source: AGHT+IHf8NrqouxYhlMoKQdA5WAg5kK1bQnqIvg5KQ+C7VVfL7D37N0/kUgcv6pwOVqEUG4ADLcZJA==
X-Received: by 2002:a17:906:10b:b0:9e6:59d5:820d with SMTP id 11-20020a170906010b00b009e659d5820dmr6066678eje.2.1700508676462;
        Mon, 20 Nov 2023 11:31:16 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.11])
        by smtp.gmail.com with ESMTPSA id dv8-20020a170906b80800b009fdc15b5304sm1692803ejb.102.2023.11.20.11.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 11:31:15 -0800 (PST)
Message-ID: <acfdce81-f117-4a1a-a9fe-e2b4b8922adb@linaro.org>
Date:   Mon, 20 Nov 2023 20:31:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: dt-bindings: add DTS Coding Style document
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Michal Simek <michal.simek@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, Andrew Davis <afd@ti.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Heiko Stuebner <heiko@sntech.de>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Nishanth Menon <nm@ti.com>, Olof Johansson <olof@lixom.net>,
        linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20231120084044.23838-1-krzysztof.kozlowski@linaro.org>
 <19358871-009d-4498-9c13-90d5338b1e9f@amd.com>
 <76fa8f61-fe31-4040-a38d-cc05be3f4f17@linaro.org>
 <CAMuHMdW4WPJT0Km7w8RWrGJaztk6QDGoFAn0bdGbrEsw81R1FA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAMuHMdW4WPJT0Km7w8RWrGJaztk6QDGoFAn0bdGbrEsw81R1FA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20/11/2023 20:18, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Mon, Nov 20, 2023 at 3:53 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>> On 20/11/2023 15:01, Michal Simek wrote:> >
>>> On 11/20/23 09:40, Krzysztof Kozlowski wrote:
>>>> Document preferred coding style for Devicetree sources (DTS and DTSI),
>>>> to bring consistency among all (sub)architectures and ease in reviews.
> 
>>>> +Organizing DTSI and DTS
>>>> +-----------------------
>>>> +
>>>> +The DTSI and DTS files should be organized in a way representing the common
>>>> +(and re-usable) parts of the hardware.  Typically this means organizing DTSI
>>>> +and DTS files into several files:
>>>> +
>>>> +1. DTSI with contents of the entire SoC (without nodes for hardware not present
>>>> +   on the SoC).
>>>> +2. If applicable: DTSI with common or re-usable parts of the hardware (e.g.
>>>> +   entire System-on-Module).
>>>
>>> DTS/DTSI - SOMs can actually run as they are that's why it is fair to say that
>>> there doesn't need to be DTS representing the board.
>>
>> I have never seen a SoM which can run without elaborate hardware-hacking
>> (e.g. connecting multiple wires to the SoM pins). The definition of the
>> SoM is that it is a module. Module can be re-used, just like SoC.
> 
> /me looks at his board farm...
> 
> The Renesas White-Hawk CPU board can be used standalone, and has a
> separate power input connector for this operation mode.  As it has RAM,
> Ethernet, serial console, eMMC, and even mini-DP, it can serve useful
> purposes on its own.
> I agree it's not a super-good example, as the board is not really a
> "SoM", and we currently don't have r8a779g0-white-hawk-cpu.dts, only
> r8a779g0-white-hawk-cpu.dtsi.
> 
> The RZ/A2M CPU Board is a real SoM, which can be powered over USB.
> It has less standard connectors (microSD, USB, MIPI CSI-2), but still
> sufficient features to be usable on its own.
> Again, we're doing a bad job, as we only have a DTS for the full eval
> board (r7s9210-rza2mevb.dts).
> 
> I guess there are (many) other examples...

OK, I never had such in my hands. Anyway, the SoM which can run
standalone  has a meaning of a board, so how exactly you want to
rephrase the paragraph?

Best regards,
Krzysztof

