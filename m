Return-Path: <linux-samsung-soc+bounces-902-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7D081FE1E
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 29 Dec 2023 09:26:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 690C91C22252
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 29 Dec 2023 08:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E7D67488;
	Fri, 29 Dec 2023 08:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aOqXoKGX"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F367748C
	for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Dec 2023 08:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40b5155e154so88193815e9.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Dec 2023 00:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703838369; x=1704443169; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Zy9HLDIospVcZEEywZ1tjMTB2/rn+P2RmUKOnwfON4=;
        b=aOqXoKGXiZIKKoX7HpGyi1+em3uB8mMKv4v8FBMhj+Y/F2a5+YwWrJSpKpI+u8qUTS
         BG3BXVBjVCLMoUHCu8EsJsDGq/Huz2xV9bYlqn3j7rLXFNbfvbVdYoPB59HJMeuaxr5g
         jy6oZ4KdGNynk58HY7reRW/gwEZK0SuxXlu4xgoEzWcFCvtcmXN33F+5xTDqJawwO4PF
         AldMVyeYkyhswBjFEraNeR5YyqD5cUep3kKZl/ctHnwtCkgwcxCYgrFZUPQVvzY4zrco
         Cdz0kL9+FJhdBw7/AFrA8/Z77mLQZ3T3O6vGAt/UFJ5X07awfjgfEVSg2xxH7xyQfYbV
         YNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703838369; x=1704443169;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Zy9HLDIospVcZEEywZ1tjMTB2/rn+P2RmUKOnwfON4=;
        b=QBD7+4OPCx9wxqtWPSX4DD2Y3pGjjLhHGWwtaRCJd15TBQhKVwhAIHGWhibuqS3QAs
         YdE4JQrMmrLlCuhJXjE3Tu3nanDukbGcjySRETe10u0qQsoWqtCOODV4WHxygEfXzxOo
         NcQIli0g8apfgk1bGaic+RALymA6bgbj4okLdV9nl/Jn8hms/9ezG42+AA8bkQF0ua+H
         /Won5iGTgOpAYJlC19Eodp5N9dYY/svQXKD21WgQNtQtPRUXDL60cVqT6ogzRFRKhRg5
         RdYWj32xQEU13RpRT1CYehFPa+cERGnQLiaJ/mW9X5y65QStL5S9NhWVXnzR9UhfnSRJ
         nb+Q==
X-Gm-Message-State: AOJu0Yw+EVETmx+ZiQ2f0id9eFrkMJO8oDBJjc6IbYdxneLChe4uxt/n
	36WW04tTPXVKGWHNxx/CmfZpVNUJoFDORg==
X-Google-Smtp-Source: AGHT+IHUUK0DYjVoqdFnCE/Ca7a7REuYr/m8pBSbIhjRBEfKIGIhU+OZS45L2KONb6SjsiDMFSlbRQ==
X-Received: by 2002:a05:600c:4f09:b0:40d:5ae9:6935 with SMTP id l9-20020a05600c4f0900b0040d5ae96935mr2420383wmq.137.1703838369389;
        Fri, 29 Dec 2023 00:26:09 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id iw13-20020a05600c54cd00b0040d5d6de328sm8617370wmb.7.2023.12.29.00.26.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Dec 2023 00:26:08 -0800 (PST)
Message-ID: <0c288847-b495-44e4-a5c5-5e7a4e83a444@linaro.org>
Date: Fri, 29 Dec 2023 08:26:06 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/12] arm64: dts: exynos: gs101: update USI UART to
 use peric0 clocks
Content-Language: en-US
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 peter.griffin@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 sboyd@kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org,
 alim.akhtar@samsung.com, gregkh@linuxfoundation.org, jirislaby@kernel.org,
 s.nawrocki@samsung.com, tomasz.figa@gmail.com, cw00.choi@samsung.com,
 arnd@arndb.de, semen.protsenko@linaro.org
Cc: saravanak@google.com, willmcvicker@google.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org, kernel-team@android.com
References: <20231228125805.661725-1-tudor.ambarus@linaro.org>
 <20231228125805.661725-11-tudor.ambarus@linaro.org>
 <5a961a6992d7661e6c7589496438cad7b68d4f5a.camel@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <5a961a6992d7661e6c7589496438cad7b68d4f5a.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 12/28/23 14:22, André Draszik wrote:
> Hi Tudor,

Hi, Andre'!
> 
> On Thu, 2023-12-28 at 12:58 +0000, Tudor Ambarus wrote:
>>
>> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>> [...]
>> @@ -380,7 +373,8 @@ serial_0: serial@10a00000 {
>>  				reg = <0x10a00000 0xc0>;
>>  				interrupts = <GIC_SPI 634
>>  					      IRQ_TYPE_LEVEL_HIGH 0>;
>> -				clocks = <&dummy_clk 0>, <&dummy_clk 0>;
>> +				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_CLK_PERIC0_USI0_UART_CLK>,
>> +					 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_0>;
> 
> I suspect these two should be the other way around, given the clock-names below?

These ones look sane to me. The clocks on the USI parent as well. USI
datasheet says that IPCLK is the protocol operating clock and PCLK the
APB clock. In the serial driver clk_uart_baud0 (IPCLK) is used as the
operating clock, all fine here.

Tell if you still think otherwise. Thanks!
ta

> 
>>  				clock-names = "uart", "clk_uart_baud0";
>>  				samsung,uart-fifosize = <256>;
>>  				status = "disabled";
> 
> Cheers,
> A.

