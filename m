Return-Path: <linux-samsung-soc+bounces-5376-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E729D0F88
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 18 Nov 2024 12:21:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56E51B27332
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 18 Nov 2024 10:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C1861946A8;
	Mon, 18 Nov 2024 10:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GcDkNeqT"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF942B2F2
	for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Nov 2024 10:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731927345; cv=none; b=ACG5cWNOHAKeBWzEEbDTXkUWon8IgBuOOlyiIeyGLgsBF7Z6YKRwQdKwbmHcabPOFoA7sELsaBVrxGY2XaDOs7GgF3xchRpI5zfs0mD7LqvBrW51tM/FZjabH9Jo4xI/sgqb2xH94hg5tNOhAHWpw070QZHtrgub/MPaVidP9z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731927345; c=relaxed/simple;
	bh=ZcFDjxCikiIDehFzhPFoKi4SBUA/t82ryu7kG31flDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ma83/mYei6n0qTIQlV6SH27KzyT1JpjBeUYaFrx3Ifb7clkfY+nEUeTIGh2o6Xu3bTJCQ2UTrNZh/kRWVrHDLIN7PZXVWBzW/xrj3FXWwyf1p7vnQHJUTknxXpxzvuc+23y1vS9fKHU+9IzyH4oApRCRoCcaGiOSynQNJGvUHdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GcDkNeqT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731927342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AnKB6OxF/nzSNsYCRUDY/ZZFnQ2D348/yl+VsYaNxvk=;
	b=GcDkNeqT5VKack3IPySGyQPuLpKb4y9onkzNyDBQUQ9ryFevPCiHUF1rBrC/crGJOpGE0O
	6Kq3KMcxeJBXina+VhhjG4RcUrNxuFQ7+Zha+us3KQZ1wOyurwPqkpQCwLIh8HeAJ3WM2q
	z5CLsCtxCcHyovsxgjXGViIFQmuYgHI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-SLlSSt0qOayc1ar5pwR7lQ-1; Mon, 18 Nov 2024 05:55:40 -0500
X-MC-Unique: SLlSSt0qOayc1ar5pwR7lQ-1
X-Mimecast-MFC-AGG-ID: SLlSSt0qOayc1ar5pwR7lQ
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a9a157d028aso139650866b.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Nov 2024 02:55:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731927339; x=1732532139;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AnKB6OxF/nzSNsYCRUDY/ZZFnQ2D348/yl+VsYaNxvk=;
        b=ITe6esIhUFh3AUMf/FPDu7lBRMqqiGaVupSvDRA5JILyzdIo3DDp9hF8o/K2JwYJUH
         dg3aMcsOEfgZ9MnHTwPiG9uG3Pl1Z6iDSE5lK0u9freSUN8gnul9SwxVNV3eKU0ytNdY
         oBRDKcZyjSS8okSYy+WfLIBQPDsCrsMfa6zV5eKsJY7CH9qWs7cGkLk///h2KjoVsQ8o
         Hhn9Rd3QjMWboeXXgdctZ4W0ZikMBDQha8kaOnc4i5VElIWEf73KMF1Il6dMgU4hFTNc
         PUavlr/kjg2mSwX9D9IyseKg5oMl7/U/K4ZZpl2eHhdp73iv57+kHzzRgrSp8hjYYKYU
         qIlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMoiU9l2XUWclxcTEOfnVlz52xjC1x5lX2y4YDy6uFYbBcNXMxInfCVT8r4Ga2u1WPynkLHu3YV+oVFqnkBCeM8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqYcD3BZZz05ryBLq5fooR76qs623y1sebh1zFEQuSCeTgLAyH
	R5FcfaI0cWrVaCO1Qb5Rw4c+KvWlwSjKo3ZjHF8n6mk1i3WmHP+9yUds7v0hDqbvw1HRomfyUXf
	KlhuyfU9TrHE71mjYUskrJYTKatszaxH7B/tptTvbpiXgnKHmAD3ZL34sgqJTH11CeCLj
X-Received: by 2002:a17:907:d24:b0:a87:31c:c6c4 with SMTP id a640c23a62f3a-aa483420c9dmr1098523066b.24.1731927339056;
        Mon, 18 Nov 2024 02:55:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2vTdiBnn4PitIg3NGPzUBSRlMyCFj1MIDShUo/ICNJU5eRSVBn7pak/o015A12IJGuEwz+g==
X-Received: by 2002:a17:907:d24:b0:a87:31c:c6c4 with SMTP id a640c23a62f3a-aa483420c9dmr1098518766b.24.1731927338635;
        Mon, 18 Nov 2024 02:55:38 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20dffd721sm536956766b.107.2024.11.18.02.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 02:55:38 -0800 (PST)
Message-ID: <322acf33-4569-4e57-a4b5-af60cb0091b7@redhat.com>
Date: Mon, 18 Nov 2024 11:55:36 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] power: supply: max17042: make interrupt shared
To: Dzmitry Sankouski <dsankouski@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
 Purism Kernel Team <kernel@puri.sm>, Sebastian Reichel <sre@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-msm@vger.kernel.org
References: <20241118-b4-max17042-v3-0-9bcaeda42a06@gmail.com>
 <20241118-b4-max17042-v3-1-9bcaeda42a06@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241118-b4-max17042-v3-1-9bcaeda42a06@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dzmitry,

On 18-Nov-24 11:09 AM, Dzmitry Sankouski wrote:
> Fuelgauge blocks often are incorporated in bigger chip,
> which may use only 1 line for interrupts. Make interrupt
> shared.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/power/supply/max17042_battery.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/power/supply/max17042_battery.c b/drivers/power/supply/max17042_battery.c
> index 496c3e1f2ee6..99bf6915aa23 100644
> --- a/drivers/power/supply/max17042_battery.c
> +++ b/drivers/power/supply/max17042_battery.c
> @@ -1103,14 +1103,7 @@ static int max17042_probe(struct i2c_client *client)
>  	}
>  
>  	if (client->irq) {
> -		unsigned int flags = IRQF_ONESHOT;
> -
> -		/*
> -		 * On ACPI systems the IRQ may be handled by ACPI-event code,
> -		 * so we need to share (if the ACPI code is willing to share).
> -		 */
> -		if (acpi_id)
> -			flags |= IRQF_SHARED | IRQF_PROBE_SHARED;
> +		unsigned int flags = IRQF_ONESHOT | IRQF_SHARED | IRQF_PROBE_SHARED;
>  
>  		ret = devm_request_threaded_irq(&client->dev, client->irq,
>  						NULL,
> 


