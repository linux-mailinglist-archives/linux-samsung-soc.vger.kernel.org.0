Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B678D7713F4
	for <lists+linux-samsung-soc@lfdr.de>; Sun,  6 Aug 2023 10:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbjHFI3K (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 6 Aug 2023 04:29:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjHFI3J (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 6 Aug 2023 04:29:09 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1025B1BF9
        for <linux-samsung-soc@vger.kernel.org>; Sun,  6 Aug 2023 01:29:08 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-99bdcade7fbso483664066b.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 06 Aug 2023 01:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691310546; x=1691915346;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=55oKMHK7cfUAjvWBhyAthQvSiE0af+1dehaVDdqDOHE=;
        b=lrbem2akHaoEP1hNXRLxd5L+j636EuxBLZ3WxPWqbqp2DnjQR5Ff6QUQNCRj9gKC5u
         auMutJMofuhNLR0J41euPuzq+aNsbqKiVy1ufEMkK6RNNvdHqZGmoC5I4xirSbBYVBEA
         thBachlkGY6GuAwmvysf39iChCPNMHayfp76gPfgixfHQabmQcyG3/PQuDzGGDcyr+JC
         aZj8k+SUR+MxJ+aNiKaEmHt9Z8jgiQ1nHcXj6z+Fxz1mtYyaSqvvUbwElwnGIrRy23vU
         Lv6MYcRPNGN7y7nPdn3j6B0VPKJH5+jSIr1ag8MmAdkwuEuIu0CRaHf+ugAoOsz2ThkD
         YGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691310546; x=1691915346;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=55oKMHK7cfUAjvWBhyAthQvSiE0af+1dehaVDdqDOHE=;
        b=Xe23zNsPA4bX0pe0rgZ5ghVlh4QFHcU+9uL393ggl28IAbzR19qeMI7SUHsFM/DYXw
         o/xKBB0DNWlBBI5MVtObNtB8XrKD6ZdLEygMOgGP2940M1G0hLwj4gejvO4Va+ZVznbn
         oiN/1nlzvaILUkOHaVjYRszv58MmQdMsbghlI5+VH2VqW5TbtCZSWJWQR+7CHoKD6uIk
         LrYuO93pSWA59K4G4kgwOusaWiZrQJfgvYblpgs72gZCvPFr5g2nimbo1DtuOL1DT0NG
         IWT7ieBKbr9xa0+vVnR1UsRA/cTzUEtNeYpf3j0N2tyVU28p5i0hFLuV4zqle9lYSsL0
         pTIQ==
X-Gm-Message-State: AOJu0Yx9nT5hemdiTiQoXtOO7WsZatZl9wOQdSjX3rijQE/QScWvamZQ
        BjTTXtBVrTnC9pC5UhS1tmqA4w==
X-Google-Smtp-Source: AGHT+IGmNl9aFbtULewFk5HUP7c06MVi+NImcKGO40WOR1/CE5aUF/a1HN/nGwuW7PPaSGEpQ6eX9Q==
X-Received: by 2002:a17:906:3289:b0:988:9ec1:a8c5 with SMTP id 9-20020a170906328900b009889ec1a8c5mr5582947ejw.55.1691310546570;
        Sun, 06 Aug 2023 01:29:06 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.245])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709060c4600b0099bcb44493fsm3694370ejf.147.2023.08.06.01.29.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Aug 2023 01:29:06 -0700 (PDT)
Message-ID: <16047849-1001-4d6f-4995-0fdfc065cded@linaro.org>
Date:   Sun, 6 Aug 2023 10:29:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 4/4] ARM: configs: s5pv210_defconfig: enable IIO
 required by MAX17040
To:     Andi Shyti <andi.shyti@kernel.org>,
        Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     Iskren Chernev <me@iskren.info>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Matheus Castello <matheus@castello.eng.br>,
        Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Stefan Hansson <newbie13xd@gmail.com>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20230731073613.10394-1-clamor95@gmail.com>
 <20230731073613.10394-5-clamor95@gmail.com>
 <20230805224211.qquexvseq24hxcju@intel.intel>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230805224211.qquexvseq24hxcju@intel.intel>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 06/08/2023 00:42, Andi Shyti wrote:
> Hi Svyatoslav,
> 
> On Mon, Jul 31, 2023 at 10:36:13AM +0300, Svyatoslav Ryhel wrote:
>> After adding support for passing temperature data from thermal sensor
>> to MAX17040 it got dependency on CONFIG_IIO. From all defconfigs
>> using MAX17040 only s5pv210_defconfig did not have IIO already enabled
>> so let's enable it to avoid regression.
>>
>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>> ---
>>  arch/arm/configs/s5pv210_defconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/configs/s5pv210_defconfig b/arch/arm/configs/s5pv210_defconfig
>> index 4c1e480b5bbd..24070ee3d43e 100644
>> --- a/arch/arm/configs/s5pv210_defconfig
>> +++ b/arch/arm/configs/s5pv210_defconfig
>> @@ -97,6 +97,7 @@ CONFIG_MMC_SDHCI_S3C_DMA=y
>>  CONFIG_RTC_CLASS=y
>>  CONFIG_RTC_DRV_MAX8998=m
>>  CONFIG_DMADEVICES=y
>> +CONFIG_IIO=y
>>  CONFIG_PWM=y
>>  CONFIG_PWM_SAMSUNG=y
>>  CONFIG_PHY_SAMSUNG_USB2=m
> 
> Should this patch be squashed to the previous patch? I think you
> break bisectability for this board if you enable iio only here.

The defconfig change matters less - distros don't use them - so this
points to the fact that patchset affected the users. All existing users
of max17040 drivers, who do not enable IIO, will have their setups broken.

Best regards,
Krzysztof

