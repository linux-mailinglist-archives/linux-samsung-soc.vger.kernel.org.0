Return-Path: <linux-samsung-soc+bounces-701-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C4381358B
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 14 Dec 2023 17:01:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E99B61F21A59
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 14 Dec 2023 16:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EA455E0D3;
	Thu, 14 Dec 2023 16:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Guk+6gL5"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 944BE10A
	for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Dec 2023 08:01:23 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a1db6c63028so958920466b.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Dec 2023 08:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702569682; x=1703174482; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D+VFIozAF30zEgKKxFDP3drI06z9zzmO3HV6m4SuiwQ=;
        b=Guk+6gL5FvgbClXZhAqmyYzGq5UH6OfIyUvODkVmFf4vSY3etzuNxe3FtrN7amNL04
         iJbmutKwh+6hUZ7JmeXeaqXqTI8sdd2Bj6lpYFplcA5aJFuSnWQk0ii/jrfMdbifEcnX
         MJMuT8B9XAOKq77C1E6lcI3zFiUh/anFfrNMt6sj7FdMIEvtpdw8zM9w7Cwej01TVWFS
         Et7KTSugVOS4dY8Rwiadpp2X62ezw1yHN9/B1Hp5Ahy2iuMdlah+kQ1BzrZ2OyOZT1Jz
         TKZF2a7uh/FelkBbsieLNB52aPJZdhETqALxPQYlRgUwfsoUkvo1bDNnlomKJ3QeEuXc
         HtAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702569682; x=1703174482;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D+VFIozAF30zEgKKxFDP3drI06z9zzmO3HV6m4SuiwQ=;
        b=nVlL/SXPjS2c4ZaMXQpUccoywlDu0COBdPdgo1C3+72qZKyJ3R3O7zc7HWbKzzTcyP
         RcUII6WJO7ILjClSqxnjjS1f/SPTCNTyuyRlPjgps9kwViq05KkAMWFB7oSi59PcEahc
         FnxKZkyNCixCAlV+E+BWQHqpoijQlIxtCx5jljb3a0xJajPFACPGto6DIZYExNgVJ9Wy
         P3HTezev8c5M1pyGqz640x5d2934MICjPirPC5eKZQLyomATOknjxHIeqjAw4NPfTycO
         f2OHVpdJame9UCey5LazGOKqN+xmtAmp/0FaJOKOFcK/qJRRei+X7jtgt8XuO9Ru5Ljb
         MEOw==
X-Gm-Message-State: AOJu0Yx1cXjvlStPi/KP7vP132zZAOwq5iTR6Lf87CGTd0DPT6oN/fYP
	Wuf2dv2MXCpLHvAWQw9zC0lkBA==
X-Google-Smtp-Source: AGHT+IEMYj7NZTyAlbSayhibN+bIajeem6cYXSSO7+k3rveUzLz3uWXFda+obxiUgnN1c1X2yJymPw==
X-Received: by 2002:a17:907:7ea1:b0:a1e:9d8b:1e7b with SMTP id qb33-20020a1709077ea100b00a1e9d8b1e7bmr6017626ejc.69.1702569682045;
        Thu, 14 Dec 2023 08:01:22 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id ld4-20020a1709079c0400b00a1df88cc7c0sm9445638ejc.182.2023.12.14.08.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 08:01:21 -0800 (PST)
Message-ID: <f3d61c49-1a46-476c-b7a5-6cc6a06a33ed@linaro.org>
Date: Thu, 14 Dec 2023 16:01:18 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] clk: samsung: gs101: mark PERIC0 IP TOP gate clock
 as critical
Content-Language: en-US
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: peter.griffin@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 sboyd@kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org,
 alim.akhtar@samsung.com, gregkh@linuxfoundation.org, jirislaby@kernel.org,
 catalin.marinas@arm.com, will@kernel.org, s.nawrocki@samsung.com,
 tomasz.figa@gmail.com, cw00.choi@samsung.com, arnd@arndb.de,
 andre.draszik@linaro.org, saravanak@google.com, willmcvicker@google.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org
References: <20231214105243.3707730-1-tudor.ambarus@linaro.org>
 <20231214105243.3707730-8-tudor.ambarus@linaro.org>
 <CAPLW+4mNjCbJ+VbKR66DFSkiXHyxdjgvwjN7azxjJQ6UxQikEw@mail.gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAPLW+4mNjCbJ+VbKR66DFSkiXHyxdjgvwjN7azxjJQ6UxQikEw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 12/14/23 15:37, Sam Protsenko wrote:
> On Thu, Dec 14, 2023 at 4:52 AM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>>
>> Testing USI8 I2C with an eeprom revealed that when the USI8 leaf clock
>> is disabled it leads to the CMU_TOP PERIC0 IP gate clock disablement,
>> which then makes the system hang. To prevent this, mark
>> CLK_GOUT_CMU_PERIC0_IP as critical. Other clocks will be marked
>> accordingly when tested.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  drivers/clk/samsung/clk-gs101.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
>> index 3d194520b05e..08d80fca9cd6 100644
>> --- a/drivers/clk/samsung/clk-gs101.c
>> +++ b/drivers/clk/samsung/clk-gs101.c
>> @@ -1402,7 +1402,7 @@ static const struct samsung_gate_clock cmu_top_gate_clks[] __initconst = {
>>              "mout_cmu_peric0_bus", CLK_CON_GAT_GATE_CLKCMU_PERIC0_BUS,
>>              21, 0, 0),
>>         GATE(CLK_GOUT_CMU_PERIC0_IP, "gout_cmu_peric0_ip", "mout_cmu_peric0_ip",
>> -            CLK_CON_GAT_GATE_CLKCMU_PERIC0_IP, 21, 0, 0),
>> +            CLK_CON_GAT_GATE_CLKCMU_PERIC0_IP, 21, CLK_IS_CRITICAL, 0),
> 
> This clock doesn't seem like a leaf clock. It's also not a bus clock.
> Leaving it always running makes the whole PERIC0 CMU clocked, which
> usually should be avoided. Is it possible that the system freezes
> because some other clock (which depends on peric0_ip) gets disabled as
> a consequence of disabling peric0_ip? Maybe it's some leaf clock which
> is not implemented yet in the clock driver? Just looks weird to me
> that the system hangs because of CMU IP clock disablement. It's
> usually something much more specific.

The system hang happened when I tested USI8 in I2C configuration with an
eeprom. After the eeprom is read the leaf gate clock that gets disabled
is the one on PERIC0 (CLK_GOUT_PERIC0_CLK_PERIC0_USI8_USI_CLK). I assume
this leads to the CMU_TOP gate (CLK_CON_GAT_GATE_CLKCMU_PERIC0_IP)
disablement which makes the system hang. Either marking the CMU_TOP gate
clock as critical (as I did in this patch) or marking the leaf PERIC0
gate clock as critical, gets rid of the system hang. Did I choose wrong?

Thanks,
ta
> 
>>         GATE(CLK_GOUT_CMU_PERIC1_BUS, "gout_cmu_peric1_bus",
>>              "mout_cmu_peric1_bus", CLK_CON_GAT_GATE_CLKCMU_PERIC1_BUS,
>>              21, 0, 0),
>> --
>> 2.43.0.472.g3155946c3a-goog
>>

