Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B063D41CCC2
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 29 Sep 2021 21:43:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344209AbhI2TpL (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 29 Sep 2021 15:45:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59323 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244887AbhI2TpL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Sep 2021 15:45:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632944609;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YCWzATh90nv8p2ocW1eVJFpVHou7gsWyZPUA/QFvJIQ=;
        b=YgisNeKMt18Ox1/yK6TxKpSxPUsa2vxQvDVzrcZrlYxPkgQMMMQ6o7IYS1o7Akwp8flWLw
        PNKEgy8/mcd/p8YyTmA4Psw1YnVVNXNrXankRbeQa5ADooa+cOKFK5HYyiYIjfAgDSIww4
        jt+Z1vCYj/GpWfNFQUytE9wM94mrVhQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-MwEaI-ddOAav3mSWNHtysw-1; Wed, 29 Sep 2021 15:43:27 -0400
X-MC-Unique: MwEaI-ddOAav3mSWNHtysw-1
Received: by mail-ed1-f69.google.com with SMTP id d11-20020a50cd4b000000b003da63711a8aso3559117edj.20
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Sep 2021 12:43:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YCWzATh90nv8p2ocW1eVJFpVHou7gsWyZPUA/QFvJIQ=;
        b=gBYeRsXJVDUp465UP8h+ygxmn9jbIIdjkyUkj1jDG5JhlRa0MCqVu9bV5m3lVw0oRy
         dlCx80lUM0adaXAs632FPHkg8GkqtQuRv1CopypMSISkgbvYAt/ZNIIz6w3u3qRhewch
         ZeHqnOuqZrtezY1BEuWT4k5qz8E3WF6PJaQ/7zd0KYnbqGwkAnY9d58LVP6SPmlW4k7H
         nczHG+z5noqz1nyobaQnRWhnQ+kep7hG9eSaKkcg2s8X8GkxZIv94FvmBdr9Bci7z5gm
         mluoCDBzJ0yap7oTn2q3VqJYKMi5RfN+m8E65y21BwYygnRuIPCxVbbIRZXE/SNxlPAd
         Ba2Q==
X-Gm-Message-State: AOAM531qJgdzWaHGcv+Ayo/j4CXc0HuRMS+Hehkbb3wAR6BD612Q/LnL
        BEEvOtulU4ioUVKCrbqBJqWbp0KvOno6dxcShYP304xVvi/GcdpZO5fVthvsRpym3Xeb+WD9UQA
        tmTA3C6m8MPXfnpmtocigq5dEW6xAQfs=
X-Received: by 2002:a50:d84c:: with SMTP id v12mr2076735edj.201.1632944606631;
        Wed, 29 Sep 2021 12:43:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2KNWIMtkb2GNqo6HSlRR9Tgt5ei0/8qjYJhVMikfKe4RUnD+Ws3b7fvQL5tSjjyx87Vu21Q==
X-Received: by 2002:a50:d84c:: with SMTP id v12mr2076714edj.201.1632944606441;
        Wed, 29 Sep 2021 12:43:26 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id b27sm468013ejq.34.2021.09.29.12.43.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Sep 2021 12:43:26 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] power: supply: max17042_battery: use VFSOC for
 capacity when no rsns
To:     Henrik Grimler <henrik@grimler.se>, sre@kernel.org,
        m.szyprowski@samsung.com, krzysztof.kozlowski@canonical.com,
        sebastian.krzyszkowiak@puri.sm, linux-pm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     stable@vger.kernel.org, Wolfgang Wiedmeyer <wolfgit@wiedmeyer.de>
References: <20210929181418.4221-1-henrik@grimler.se>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <be608922-ef03-da35-c65c-575f301b596b@redhat.com>
Date:   Wed, 29 Sep 2021 21:43:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210929181418.4221-1-henrik@grimler.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On 9/29/21 8:14 PM, Henrik Grimler wrote:
> On Galaxy S3 (i9300/i9305), which has the max17047 fuel gauge and no
> current sense resistor (rsns), the RepSOC register does not provide an
> accurate state of charge value. The reported value is wrong, and does
> not change over time. VFSOC however, which uses the voltage fuel gauge
> to determine the state of charge, always shows an accurate value.
> 
> For devices without current sense, VFSOC is already used for the
> soc-alert (0x0003 is written to MiscCFG register), so with this change
> the source of the alert and the PROP_CAPACITY value match.
> 
> Fixes: 359ab9f5b154 ("power_supply: Add MAX17042 Fuel Gauge Driver")
> Cc: <stable@vger.kernel.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Suggested-by: Wolfgang Wiedmeyer <wolfgit@wiedmeyer.de>
> Signed-off-by: Henrik Grimler <henrik@grimler.se>
> ---
> Changes in v2:
> Re-write commit message to highlight that VFSOC is already used for
> alert, after Krzysztof's comments

Thanks, both patches looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.


Regards,

Hans


> ---
>  drivers/power/supply/max17042_battery.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/power/supply/max17042_battery.c b/drivers/power/supply/max17042_battery.c
> index 8dffae76b6a3..5809ba997093 100644
> --- a/drivers/power/supply/max17042_battery.c
> +++ b/drivers/power/supply/max17042_battery.c
> @@ -313,7 +313,10 @@ static int max17042_get_property(struct power_supply *psy,
>  		val->intval = data * 625 / 8;
>  		break;
>  	case POWER_SUPPLY_PROP_CAPACITY:
> -		ret = regmap_read(map, MAX17042_RepSOC, &data);
> +		if (chip->pdata->enable_current_sense)
> +			ret = regmap_read(map, MAX17042_RepSOC, &data);
> +		else
> +			ret = regmap_read(map, MAX17042_VFSOC, &data);
>  		if (ret < 0)
>  			return ret;
>  
> 
> base-commit: 5816b3e6577eaa676ceb00a848f0fd65fe2adc29
> 

