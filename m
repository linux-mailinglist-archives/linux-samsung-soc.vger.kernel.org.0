Return-Path: <linux-samsung-soc+bounces-1048-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6EC8326E4
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 19 Jan 2024 10:43:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 308EDB2421B
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 19 Jan 2024 09:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AFA63C474;
	Fri, 19 Jan 2024 09:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XhvwkYrR"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAF23BB5F
	for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Jan 2024 09:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705657412; cv=none; b=CkIE7xnzXsi3xvRJUxxBlD4QmtqdKh6Y9mO5lha3/VkOKdxFiUfDaxNjJtrOIpTI2EbXOr0gxslV56ASbgQ2KRQS/pYB2vf175cX9pA0I24vrOjNG+ql62JyfMXrye1PodH4+bDfR1CT+ArOCDtwqLT574T90Jv7sS6frsqVcHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705657412; c=relaxed/simple;
	bh=MyrGdixOQh5+O6FNsPkwb0T9MuBcR2dqrxMCHIVf4FI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pUk2CahQuu5vsaX8auFNlmHs+t77oVHRB01s2PGTjPuGcUFDp3igRbuWlaFpn+pvw04u+1UPIGA6/E89msTYNi5v6oY5Qd47tZvnTCxG1DP/m5P2XRDU2RkCEQFihc5xzSJ4qUn0k8yD9dnuuMk5Q2fkPZlAobxm5RequG0zwg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XhvwkYrR; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-55783b7b47aso696041a12.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Jan 2024 01:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705657407; x=1706262207; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O9OhX22hl+mcohFKfAH6L7j9MpKXYgZSlRgX13omB5c=;
        b=XhvwkYrRv1rIfa9euloU5OA307mjMNKX+OYz+tANigklrWQg0K8ozkOsBOTdWf07GW
         xy+yfs1u8yqWo7/K5wQC+XZUJmPfne3nqeEHD89rkeNDet50AlxPjBfHMrcjNIb0EPKI
         ONAq1YRJXNEHvc5jGS4y2OY1F5J5XYpr9KJbthbp0p5blCayAvgwtYsEhe7BN4E/lnG9
         ZEYVk6aXEWAq+hHt6UxsAuh03/fYCwAKinkbicZNkJuvd+XD9dM0reN7GrrB96b5NTzj
         v+VmjkZwf4d29/qJ++U5jeypbqyOqNAex5O5sLB54sSdhCnitKq98CEjIjs4A//NitUu
         RCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705657407; x=1706262207;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O9OhX22hl+mcohFKfAH6L7j9MpKXYgZSlRgX13omB5c=;
        b=ewfW0jDt8y12B8sJSWM/eq40WJL6yHlOd6JLGWbJggNGlGdfkR8v3pxVTrxKd72wZh
         2pqPu8VXgVPVwPjaD2DNk7BksqRrf2JR2TqlMRGzoEoowv/FOuBzmmXJUkmgzt4vFo24
         rRIjKD1e3NU0Ebc+qPGq965hN8s2cIkGkkAURIp8ybxM8ovC4CxB+8mTRQy0+TGU2rch
         JbRXKw165y86G4PsBH0pWZll3/D4WU2LQDpmFufIkeasJQS75Qeo36bIySi48axq+woj
         YztKKogt1v03kRqvXiOrlqk4awu1NQs/QmM/B02VcNAzm4RhhDXEa4ibxZnqZXfc3UW/
         gE+w==
X-Gm-Message-State: AOJu0Yz3rDQLNMSz5LzqYunr0W/axq/GizXaetZF8pk6C26rGBryHORi
	ykvjWvMt3w55z2Z4oiD5UA3y5FhlbusdKaqOG9LCxZPelj5uumffAihroWO1yRM=
X-Google-Smtp-Source: AGHT+IG2R86stteJmE6OKBrwM4yRlJjCaIoxlvGGlyTrsOLeAz965gWmbFA8ZpAMLP0yP+DiJ7Tinw==
X-Received: by 2002:a17:907:9871:b0:a27:a258:f340 with SMTP id ko17-20020a170907987100b00a27a258f340mr1241557ejc.65.1705657407623;
        Fri, 19 Jan 2024 01:43:27 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id wb3-20020a170907d50300b00a2cc6398083sm9055432ejc.10.2024.01.19.01.43.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jan 2024 01:43:27 -0800 (PST)
Message-ID: <842d36c7-9452-431f-95c4-ff114484d201@linaro.org>
Date: Fri, 19 Jan 2024 09:43:25 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/18] tty: serial: samsung: shrink port feature flags to
 u8
Content-Language: en-US
To: Jiri Slaby <jirislaby@kernel.org>,
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com,
 gregkh@linuxfoundation.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, andre.draszik@linaro.org,
 peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com
References: <20240110102102.61587-1-tudor.ambarus@linaro.org>
 <20240110102102.61587-18-tudor.ambarus@linaro.org>
 <CAPLW+4k091328krLB_KdHyobG-pR--Rt5WaN6c1ccpgdV8ry7Q@mail.gmail.com>
 <76e1dc42-cabe-4925-8aa1-c8f733fb36a2@linaro.org>
 <8f3f85d0-866e-4e5a-8177-05c26c08b278@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <8f3f85d0-866e-4e5a-8177-05c26c08b278@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 1/19/24 09:07, Jiri Slaby wrote:

Hi, Jiri!

> On 19. 01. 24, 9:56, Tudor Ambarus wrote:
>>
>>
>> On 1/16/24 19:03, Sam Protsenko wrote:
>>> On Wed, Jan 10, 2024 at 4:25 AM Tudor Ambarus
>>> <tudor.ambarus@linaro.org> wrote:
>>>>
>>>> There's a single flag defined as of now. Shrink the feature flags to u8
>>>> and aim for a better memory footprint for ``struct s3c24xx_uart_info``.
>>>>
>>>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>>>> ---
>>>>   drivers/tty/serial/samsung_tty.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/tty/serial/samsung_tty.c
>>>> b/drivers/tty/serial/samsung_tty.c
>>>> index 5df2bcebf9fb..598d9fe7a492 100644
>>>> --- a/drivers/tty/serial/samsung_tty.c
>>>> +++ b/drivers/tty/serial/samsung_tty.c
>>>> @@ -90,7 +90,7 @@ struct s3c24xx_uart_info {
>>>>
>>>>          /* uart port features */
>>>>
>>>> -       unsigned int            has_divslot:1;
>>>> +       u8                      has_divslot:1;
>>>
>>> But that's already a bit field. Why does it matter which type it is?
>>>
>>
>> If using unsigned int the bitfied is combined with the previous u8
>> fields, whereas if using u8 the bitfield will be independently defined.
>> So no benefit in terms of memory footprint, it's just a cosmetic change
>> to align the bitfield with the previous u8 fields. Allowing u32 for just
>> a bit can be misleading as one would ask itself where are the other
>> bits. Between a u32 bitfield and a bool a u8 bitfield seems like a good
>> compromise.
> 
> Why? What's wrong with bool? bitfields have terrible semantics wrt
> atomic writes for example.
> 

Bool occupies a byte and if more port features will ever be added we'll
occupy more bytes. Here's how the structure will look like with a bool:

struct s3c24xx_uart_info {
	const char  *              name;                 /*     0     8 */
	enum s3c24xx_port_type     type;                 /*     8     4 */
	unsigned int               port_type;            /*    12     4 */
	unsigned int               fifosize;             /*    16     4 */
	u32                        rx_fifomask;          /*    20     4 */
	u32                        rx_fifoshift;         /*    24     4 */
	u32                        rx_fifofull;          /*    28     4 */
	u32                        tx_fifomask;          /*    32     4 */
	u32                        tx_fifoshift;         /*    36     4 */
	u32                        tx_fifofull;          /*    40     4 */
	u32                        clksel_mask;          /*    44     4 */
	u32                        clksel_shift;         /*    48     4 */
	u32                        ucon_mask;            /*    52     4 */
	u8                         def_clk_sel;          /*    56     1 */
	u8                         num_clks;             /*    57     1 */
	u8                         iotype;               /*    58     1 */
	bool                       has_divslot;          /*    59     1 */

	/* size: 64, cachelines: 1, members: 17 */
	/* padding: 4 */
};

What's your preference?
Thanks,
ta

