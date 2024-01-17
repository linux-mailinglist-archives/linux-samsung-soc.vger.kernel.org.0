Return-Path: <linux-samsung-soc+bounces-1038-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C24830A27
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 17 Jan 2024 16:57:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F3621F229EE
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 17 Jan 2024 15:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9F0421A17;
	Wed, 17 Jan 2024 15:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C7l9sRiP"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038511DFED
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Jan 2024 15:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705507051; cv=none; b=stMIe9XDxJew46B+T+KYJn2zsjyU+LHCkfWPtvv/vugDXG6dAmdGPghCBNjzcbPRMlv9IzsocU3vOlHFQGK36WW7bupsMXg7kxTFsHNNIWLtT35G0dfV4WJol7t03mmyqpmHZTY6IOhAitdKP5viEORsMq8NpvjLwE1RLZjuALU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705507051; c=relaxed/simple;
	bh=YZSDBC9+KPF7Wl3+CiiBGJ9/g0tRY0jQC6dbTncn4kY=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:
	 To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=FmaPWIYg5uQCT259U2eN38jmptMJqjsSGpbTLLo0hl3l7gMe0ZOHQ6R8yAdH5L/DQGyX1Pwrzl6OLYhGKj2cd6oZ7D3bE2l53j6GCzbLas7uFUyWIe2DYPHok0+28Zv68cbFfZdCfNjIt2+x1qFN0lJ331oVuDj7aNtbe+SgPFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C7l9sRiP; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-559edcf25a3so499193a12.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Jan 2024 07:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705507048; x=1706111848; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ggdLDKfa8bA36v/1BkTqscUyoObsQtwNJJXtjaWJBcg=;
        b=C7l9sRiPMjsRSRtL2rWMTLvgjXRoSMTozWfrBuzynAl9wpeXlwEm6G7lRqtshjrPa9
         ecYtC/LdMAGyoBt1qNa1mc2JhJIxKTPUKDyO1ruEos8bxxY0sxaAUeGoCiDcTfQEzmXU
         +BVj5CCuRT66VAdfWVmIw28px4aGzva/5armIKRKYfg+9VUF/0up16CAyJFECaMmCFdK
         liLCerEu3teU8qJSTpIRFhv0nTBBxbkVAK9EkkuuKq7n7dzX3WFpTu+JyBsifnbS87Sf
         kapMWn4ZUZuMSyUcIvfQyGmRZexNIvfGcz4+wb/7IyHEYOjbwyFtn7Hmfd5mfPbsLbt+
         QMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705507048; x=1706111848;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ggdLDKfa8bA36v/1BkTqscUyoObsQtwNJJXtjaWJBcg=;
        b=RfuYrhK8mi/tcbASE9LwCoIRKIopAcA6BIm0ILou1Xfotb0aUpXZ9QT8d2ZDy+EfNM
         c/iAUFuPnMu/MOq02OlpXYoPw6YPKNWpRebYOeBduANXwdxhBEi0bSIBNbQSVoYWCfUs
         p/A4kZg1ilaEhNGAmx/PK3T1eXTZW32ccIapwosVj4zfZhOjNMMeU6h+NihEzQ2FLjo4
         Y7QKfB/QcB2WJcg4mKZB7u6PAI2erUHMeM5azVscg2u4nHeqOk1wZqTiyspSgFD+HrJe
         X7oR7EL72R0NfD/7y8mOTlxnakIiWRMu61hHcDhKwe9oulDwafMHxQOU9nVWhUjx5YJk
         DnNQ==
X-Gm-Message-State: AOJu0YyEMMcP5S97KmMosJMPBB0tMDV95FqerQl0YTU4Qwlc4ivn2iGE
	Ft23sWeGVDAt6ZnEDQ01ZHY6sjmGddUugQ==
X-Google-Smtp-Source: AGHT+IHV1KaQwkEA0TRqJfkbwy6MKJIIXo+FOk8S9X0wUrNS7J7UJ6dt+nK9OglzCCFzMEbMjHWVTw==
X-Received: by 2002:a05:6402:2025:b0:559:d04b:dad2 with SMTP id ay5-20020a056402202500b00559d04bdad2mr814690edb.34.1705507048298;
        Wed, 17 Jan 2024 07:57:28 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id s7-20020a056402014700b005593b14af3csm4513778edu.84.2024.01.17.07.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jan 2024 07:57:27 -0800 (PST)
Message-ID: <675ff8e3-2494-46b1-b826-65d4504869fa@linaro.org>
Date: Wed, 17 Jan 2024 15:57:26 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/18] tty: serial: samsung: return bool for
 s3c24xx_serial_console_txrdy()
Content-Language: en-US
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com,
 gregkh@linuxfoundation.org, jirislaby@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com,
 willmcvicker@google.com
References: <20240110102102.61587-1-tudor.ambarus@linaro.org>
 <20240110102102.61587-15-tudor.ambarus@linaro.org>
 <CAPLW+4=O2OaDsC7KNeLPt4UC-OLjD3_VVL1xL6PnrOBPUmcDrw@mail.gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAPLW+4=O2OaDsC7KNeLPt4UC-OLjD3_VVL1xL6PnrOBPUmcDrw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 1/16/24 18:54, Sam Protsenko wrote:
> On Wed, Jan 10, 2024 at 4:25 AM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>>
>> s3c24xx_serial_console_txrdy() returned just 0 or 1 to indicate whether
>> the TX is empty or not. Change its return type to bool.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  drivers/tty/serial/samsung_tty.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
>> index 63e993bed296..37c0ba2a122c 100644
>> --- a/drivers/tty/serial/samsung_tty.c
>> +++ b/drivers/tty/serial/samsung_tty.c
>> @@ -2183,7 +2183,7 @@ static const struct dev_pm_ops s3c24xx_serial_pm_ops = {
>>
>>  static struct uart_port *cons_uart;
>>
>> -static int
>> +static bool
>>  s3c24xx_serial_console_txrdy(struct uart_port *port, u32 ufcon)
>>  {
>>         const struct s3c24xx_uart_info *info = s3c24xx_port_to_info(port);
>> @@ -2193,13 +2193,13 @@ s3c24xx_serial_console_txrdy(struct uart_port *port, u32 ufcon)
>>                 /* fifo mode - check amount of data in fifo registers... */
>>
>>                 ufstat = rd_regl(port, S3C2410_UFSTAT);
>> -               return (ufstat & info->tx_fifofull) ? 0 : 1;
>> +               return !(ufstat & info->tx_fifofull);
>>         }
>>
>>         /* in non-fifo mode, we go and use the tx buffer empty */
>>
>>         utrstat = rd_regl(port, S3C2410_UTRSTAT);
>> -       return (utrstat & S3C2410_UTRSTAT_TXE) ? 1 : 0;
>> +       return !!(utrstat & S3C2410_UTRSTAT_TXE);
> 
> Again, personally I think !! is just clutters the code here, as the
> function already returns bool. Other than that:
> 

Indeed, I'll update. Thanks!
ta

