Return-Path: <linux-samsung-soc+bounces-2355-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0DE88A53C
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 25 Mar 2024 15:51:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DE53BE23EE
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 25 Mar 2024 13:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B76AC13FD7C;
	Mon, 25 Mar 2024 10:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iPeMlSMx"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C926F5A0F1
	for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Mar 2024 08:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711354985; cv=none; b=EMAFCtWGR8szsCxXIAExdXVTV09qRTe3dYJrb5kvbvZoWQuOfteQ24daO+XuTpRktgaNMIkwww14eVsz9lVTvObmHjA2WG0h3rgogtdCnt6/qkkVjlH1dpbhakCmVDKysJ9UVWtd/X7efVwpXuGeNvtFVmpngbbVxyi2YVfG2hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711354985; c=relaxed/simple;
	bh=ijxk0tKRhwDiFDaof0PwkqnS6IfxiZILFA8DV9dkKEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ROquVeN5e8n7q31c/p8jp2rZ8chXsEQl+gypOFsuEie7e+bepK2W84kSSP8ZK3dq9JiOdwOVNtj9OLAPzsSncNFc5LQtZIJX+BHk8omP/xNuRFjUpjCyJefTif03EQtGNfdBzeWxWVVNnJ3b75t+/ry8TdAcYkwJVkXCceMUXQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iPeMlSMx; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-513d4559fb4so5427916e87.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Mar 2024 01:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711354982; x=1711959782; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HMQJ/okPtBULpef79IGqedhpXloJdTUeROtXqmnf/p8=;
        b=iPeMlSMxS/CWYb42zB97f5NvYw3VvbQXnREM3W/XLexDQ2j9T3ogudwo4b/QSX5QWm
         MtzzCOuiN88FfxJ19zUrJHhJgDQC+T4CHsfkRe1XRJkTWoB0sNU0lDJNZrVHKurTQPYb
         JQlwQg6Wx0zkiEkr+6evZiFhbR1QkLs5DKknq/FEFO4nycLcN4OqZ0pok0EoZtpd+Xaf
         Bbo20wYhqPCzy3UyHh3V5r5eDv6o1ph+IlBDeyNbyQI7mg6N45nTMmH+dcB6U1RgvNvU
         VKMZswZ8/3V8G8tSy2gcmdS4S9R1WUozHSb0FDI77Wg82vBdlvu1fPBJ5EeLdWoitU5z
         pOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711354982; x=1711959782;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMQJ/okPtBULpef79IGqedhpXloJdTUeROtXqmnf/p8=;
        b=HVfpbTlvhyzTFNLRMtcFnNP46f8x0xRTEUmCvmbtg1OnxatTtAkUJJHwUl7SxnbCAh
         kEOh1VSSUgTTxVwTL1RgWgvr8QquXtXUFG7aDPYBr6kF2a+f32DyE9cSrZS0uDyv3kDF
         L7b3RNJbm0ku4vslk8/EAnY0a0CGrEJyjrH7uimgbBLXngnezbTiFThsWWyDFT6xOAlb
         3/7P+hN3dg9N4ee/gWqEqtqfsFxnO6Px0R+KH0MHGYaXBe9HVApyQjYj3LH+bHRQsODv
         DedsZQKasegRXkWKvTsC6kOyFOjREEQ1YZpkDVx4VFQZ1xlicHh/PQ+o0K8EaFiW0RHE
         mn5g==
X-Forwarded-Encrypted: i=1; AJvYcCW+bw9MSlHHOdatcGVVDd6BwfH+iqIb2l8sH8lxk+FkMdnnkclWvMsHni8b5S7MfSI9Nd0raLrByXhsI7YINi4jTGTdGmHbuP00PA580UzmTwM=
X-Gm-Message-State: AOJu0Yx+pFL+zUcstCi0tAbiCRRdu6F/o+A1DO5rOwUFdnIY7CgBXwaS
	Vp8OedLxCeSNLp006RzATy9GNWzqKlSqLE/+JDwU+/eFYjJuGX4opLpLRcaWkgE=
X-Google-Smtp-Source: AGHT+IFdGvMO0JyTBK8+IQdjNO3yWH2O2uD959pWJuRDd6A/NJku8pyRlXBpCotrzi2yhfTeFIOEQQ==
X-Received: by 2002:a05:6512:3b1f:b0:513:c9a6:46ce with SMTP id f31-20020a0565123b1f00b00513c9a646cemr5154347lfv.9.1711354981966;
        Mon, 25 Mar 2024 01:23:01 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id bk3-20020a0560001d8300b00341c9956dc9sm3710731wrb.68.2024.03.25.01.22.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 01:23:00 -0700 (PDT)
Message-ID: <3b38abb9-c3ac-4b55-889a-424396f1113d@linaro.org>
Date: Mon, 25 Mar 2024 09:22:59 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: exynos: gs101: define all PERIC USI nodes
To: Tudor Ambarus <tudor.ambarus@linaro.org>, peter.griffin@linaro.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, andre.draszik@linaro.org,
 willmcvicker@google.com, kernel-team@android.com
References: <20240307135912.163996-1-tudor.ambarus@linaro.org>
 <073e5ef5-2a2e-4300-93d6-e25552276e13@linaro.org>
 <73ba6104-aa54-444e-b6c5-7f89d1fa0060@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <73ba6104-aa54-444e-b6c5-7f89d1fa0060@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/03/2024 14:39, Tudor Ambarus wrote:
>>
>>> +				#address-cells = <1>;
>>> +				#size-cells = <0>;
> 
> I'd like to respin this patch. Any preference on coding style for
> #address-cells and #size-cells? I guess they shall be above ranges
> property if present.

No, ranges should be just after reg, because it encodes often the same
or similar information (see also DTS Coding Style). I don't have
guideline, can be anywhere before vendor properties.

> 
>>> +				pinctrl-names = "default";
>>> +				pinctrl-0 = <&hsi2c1_bus>;
>>
>> Please reverse two lines, first pinctrl-0 then pinctrl-names. I know we
> 
> Ok.
> 
>> did not follow this convention till now, but at least new code can be
>> correct. Also clocks should be before pinctrl, so we keep some sort of
>> alphabetical order.
> 
> Ok.
> 
> I guess the order shall be:
> 
> 1. compatible
> 2. reg

3. ranges

> 3. #address-cells (if applicable)
>    #size-cells (if applicable)

> 5. Standard/common properties ordered alphabetically (ex. clocks,
>    interrupts, pinctrl)
> 6. vendor-specific properties
> 7. status (if applicable)
> 

Rest looks fine, thanks.

Best regards,
Krzysztof


