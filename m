Return-Path: <linux-samsung-soc+bounces-234-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3F17FD3D8
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 29 Nov 2023 11:16:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F1811C211EA
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 29 Nov 2023 10:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 061321A262;
	Wed, 29 Nov 2023 10:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MERiSA2b"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 708FA10C9
	for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Nov 2023 02:16:38 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-54af1daf6a9so1387154a12.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Nov 2023 02:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701252997; x=1701857797; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mtc4c0Qc+Eu0vsDQ9fqBtQVu0ExHjq28ELJTpnawBxM=;
        b=MERiSA2bxjaTVu07Yoiisg2NJ1EodPqrjYQXxeNoubGDYiqbXmJtEVKKluyELdhmNi
         iLtf72ngS4TfJjXz++Wkzgic36vMxIphu50AM9lnuvfijZa4hcfOd4gMk76vPaXCrzen
         o3+AZ8KidYf2mjHRBLvR1yFCw1OJrHqNze5GJz8Fr8lWu3GvFPPnMSI9kGUI1rzh82EJ
         3bQofIqmvr3P+qAIys2yqwVAlxWfsRfQ0Dak9nEEnNWWLfCk72Cbd5TG53gTeZ3Qsx/e
         DY8+yXs9yXc+ExwOCfhnXfnZuGXgYqlbx1+GsL/2cwM148H0L9HI8SYggtHN2TNpEZ+P
         Zt8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701252997; x=1701857797;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mtc4c0Qc+Eu0vsDQ9fqBtQVu0ExHjq28ELJTpnawBxM=;
        b=Wvyqg7NkWdAzK6sHwSwVWNai/rkuLWl0ve7I5pof2e80B/MBGaP4VqXrKzC3eEBZus
         EVgd6uEeMX59TGxhUTJYXF6gxQ7u/31dHDQj/akhP9f/RoJDt4LJziQiPmOljlYfqRbr
         lMdnp80JpyGmBTi/yDrq9FLrPEuPBboIYESwV92m4GqcFVUh54kht7G2yvg+4ozjovXU
         XCCBEmkZANPBZw+7/gBXLgIJdib/wwI1B1XqlPIw/8sMRVR1P60ob5Ea/4/mXBR/CqMk
         nfuSv2ek/a2ijPcAVpFUTs/5vJXBOWrBh1JUEOKtp55Pv3Py+BGTPtFw0hPP/HV5/HZQ
         AWVw==
X-Gm-Message-State: AOJu0YwOXRa0k9oQ0V6F/HQh5Xjki5JOTYzXuK1uX59SkglWbX1kfl+8
	ORvWGlplGiEQFbHlYzzKObvRvA==
X-Google-Smtp-Source: AGHT+IGu/8SPkF/vFZGrEhiHZ4PgqS2y+L0isIf4cuQ2LgVvEv7goCfc9sLO+3AtcNQJ40HNnSWJnQ==
X-Received: by 2002:aa7:d8d8:0:b0:54b:346d:cf00 with SMTP id k24-20020aa7d8d8000000b0054b346dcf00mr11346439eds.18.1701252996881;
        Wed, 29 Nov 2023 02:16:36 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id c21-20020a056402101500b0053e5f67d637sm7175580edu.9.2023.11.29.02.16.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 02:16:36 -0800 (PST)
Message-ID: <b606b44d-6b2f-4b0f-912d-b73847073616@linaro.org>
Date: Wed, 29 Nov 2023 11:16:34 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs: dt-bindings: add DTS Coding Style document
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Andrew Davis <afd@ti.com>, Andrew Lunn <andrew@lunn.ch>,
 Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>, Jonathan Corbet <corbet@lwn.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Michal Simek
 <michal.simek@amd.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Nishanth Menon <nm@ti.com>, Olof Johansson <olof@lixom.net>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org
References: <20231125184422.12315-1-krzysztof.kozlowski@linaro.org>
 <CAMuHMdUYEwMuxJ2Xx=KRVKneRT-e+uHz8LE1JVY5zLDkWksqKw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAMuHMdUYEwMuxJ2Xx=KRVKneRT-e+uHz8LE1JVY5zLDkWksqKw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/11/2023 15:19, Geert Uytterhoeven wrote:
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/dts-coding-style.rst
> 
>> +       /* SoC DTSI */
>> +
>> +       / {
>> +               cpus {
>> +                       /* ... */
>> +               };
>> +
>> +               psci {
>> +                       /* ... */
>> +               };
>> +
>> +               soc@ {
> 
> "soc@" is invalid, that should be "soc".

soc@0 is valid.

> 
> As the "soc" node is special, you may want to elaborate:
> 
>                 compatible = "simple-bus";
>                 #address-cells = <1>;
>                 #size-cells = <1>;
>                 ranges;

but then we go to missing address/size cells in root node. Your comment
is in general correct, but what you propose here is not a coding style,
but DTS correctness and I only wanted to show the order of nodes. dtc
already enforces the proper unit addresses, ranges and cells.

> 
>> +                       dma: dma-controller@10000 {
>> +                               /* ... */
>> +                       };
>> +
>> +                       clk: clock-controller@80000 {
>> +                               /* ... */
>> +                       };
>> +               };
>> +       };
>> +
>> +       /* Board DTS - alphabetical order */
>> +
>> +       &clk {
>> +               /* ... */
>> +       };
>> +
>> +       &dma {
>> +               /* ... */
>> +       };
>> +
>> +       /* Board DTS - alternative order, keep as DTSI */
>> +
>> +       &dma {
>> +               /* ... */
>> +       };
>> +
>> +       &clk {
>> +               /* ... */
>> +       };
> 
> IMO that alternative order is hard to review: you need to have multiple
> files open.  It will also make validation hard, as you can only validate
> the end result, not individual files.

Rob commented on this - tools (will) solve the issue. :)

> 
> Anyway, this is already quite usable so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

Best regards,
Krzysztof


