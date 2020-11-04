Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9203A2A649A
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  4 Nov 2020 13:43:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729421AbgKDMnc (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 4 Nov 2020 07:43:32 -0500
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:56746 "EHLO
        wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726527AbgKDMnc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Nov 2020 07:43:32 -0500
Received: from [2003:a:659:3f00:1e6f:65ff:fe31:d1d5] (helo=hermes.fivetechno.de); authenticated
        by wp126.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        id 1kaI8P-0007os-6I; Wed, 04 Nov 2020 13:43:29 +0100
X-Virus-Scanned: by amavisd-new 2.11.1 using newest ClamAV at
        linuxbbg.five-lan.de
Received: from [192.168.34.101] (p5098d998.dip0.t-ipconnect.de [80.152.217.152])
        (authenticated bits=0)
        by hermes.fivetechno.de (8.15.2/8.14.5/SuSE Linux 0.8) with ESMTPSA id 0A4ChSIl013261
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
        Wed, 4 Nov 2020 13:43:28 +0100
Subject: Re: [PATCH] ARM: dts: exynos: Assign a fixed index to mmc devices on
 exynos4412 based ODROID boards
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CGME20201104102634eucas1p2ec7b705dd5092afa25d9877d1014f46a@eucas1p2.samsung.com>
 <20201104102558.11070-1-m.reichl@fivetechno.de>
 <efe8a911-6072-59fb-8a8e-d5cdb4352cab@samsung.com>
From:   Markus Reichl <m.reichl@fivetechno.de>
Organization: five technologies GmbH
Message-ID: <eb699efe-8976-e697-8b69-0805aec058cc@fivetechno.de>
Date:   Wed, 4 Nov 2020 13:43:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <efe8a911-6072-59fb-8a8e-d5cdb4352cab@samsung.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;m.reichl@fivetechno.de;1604493811;d15a78fe;
X-HE-SMSGID: 1kaI8P-0007os-6I
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Marek,

Am 04.11.20 um 13:25 schrieb Marek Szyprowski:
> Hi Markus,
> 
> On 04.11.2020 11:25, Markus Reichl wrote:
>> Recently introduced async probe on mmc devices can shuffle block IDs.
>> Pin them to fixed values to ease booting in evironments where UUIDs ar not practical.
>> Use newly introduced aliases for mmcblk devices from [1].
>>
>> [1]
>> https://patchwork.kernel.org/patch/11747669/
>>
>> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
>> ---
>>   arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>> index a5c1ce1e396c..aa10d5bc7e1c 100644
>> --- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>> +++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>> @@ -13,6 +13,11 @@
>>   #include "exynos-mfc-reserved-memory.dtsi"
>>   
>>   / {
>> +	aliases {
>> +		mmc0 = &sdhci_2;
>> +		mmc1 = &mshc_0;
> 
> Like in the OdroidXU3-family patch, I would use 0 for the eMMC (mshc_0)
> and 2 for the SD-card (sdhci_2).

This would break present and long standing  boot ordering in mainline, which is
mmcblk0 = SD-card and
mmcblk1 = eMMC

Still desired?

> 
>> +	};
>> +
>>   	chosen {
>>   		stdout-path = &serial_1;
>>   	};
> 
> Best regards
> 

Gruß,
-- 
Markus Reichl
