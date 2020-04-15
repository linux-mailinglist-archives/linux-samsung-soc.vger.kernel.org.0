Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D32261AB06F
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 15 Apr 2020 20:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2411724AbgDOSRc (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 15 Apr 2020 14:17:32 -0400
Received: from mail-oln040092004101.outbound.protection.outlook.com ([40.92.4.101]:62515
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2406366AbgDOSR2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Apr 2020 14:17:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cKsYw22Jdn4RnDwUfvKUz45jCp4ostZYV6998+bBAWVR59m9+Lqh5FaycLdvzKelwNrL3/oxJMCOt+7fgKmKL2zCnAlLuD73UQUkH/onphbBlJ9V4xleMXU1NaYgUTouRmQWnWHCGg58b9aJ2Kmf3LowihgcEc4/mYl0Bn/Aw2ZrEN7lnzFdLKk5+dPySCQmseZ0FFBFI5Xytr5iUDJdXbFWVMccAvwA7YNaI2VZ2xBewEViebRX9d2uUOogSXCbdcS0NrR3Qd1nWvG1x2KPiWN8CtBWQdkNDrZ5v+JBC0ayps/HKVLGi2gGVMuR1TWlPNMihzeG5QyC1lZ2g/P/jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6qm0J12ynSYfizp+lk8C4gGwJh5pUu+JJ25HKljGqzc=;
 b=YAJEDDH1MbPFwDcV7ZLTWrHltNrze0V4ZdyUAjuLozgS2S+YjKXMRnsTDhB4Ul/zu6IvENJWHkGe/Z1W1prwSuz4OKKfkihJBuQo2fV4yVni78e3HgPY4rU1NQPZ44XU1As89Y3DwM3kD4ocN+PiF87xp3BQ7Lzu8BtIjgplTHbUChJoE0f+D4KwqIt4ikXNgGny1iToCrBLSegTXZ4iiSWLQx+GFXF+qmrXJ1fCzFaKJejzWLMFAGm0aDHpWPJApsMNbwmg9NIQEVag8w07Xr2g+/l1RFQhqeb/6aRJSbf4QjfPj/q7ldcL0bG4WHGm8JDVdDsKyZtQaDxT29bk1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=live.ca; dmarc=pass action=none header.from=live.ca; dkim=pass
 header.d=live.ca; arc=none
Received: from BL2NAM02FT046.eop-nam02.prod.protection.outlook.com
 (10.152.76.51) by BL2NAM02HT009.eop-nam02.prod.protection.outlook.com
 (10.152.77.83) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Wed, 15 Apr
 2020 18:17:22 +0000
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 (2a01:111:e400:7e46::53) by BL2NAM02FT046.mail.protection.outlook.com
 (2a01:111:e400:7e46::118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend
 Transport; Wed, 15 Apr 2020 18:17:22 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:8BD68E2A26C952ABD585DB347D4BADB994C1700DADB921EE431499921C4B8EA2;UpperCasedChecksum:85458A7AC59CC987BE425960761D72725327EDA927052EB94E85E11BFC6396EB;SizeAsReceived:10107;Count:50
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::ad10:4127:4bc8:76fc]) by BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::ad10:4127:4bc8:76fc%6]) with mapi id 15.20.2900.028; Wed, 15 Apr 2020
 18:17:22 +0000
Subject: Re: [PATCH v6 08/12] arm: dts: s5pv210: Add G3D node
To:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Philipp Rossak <embed3d@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-omap@vger.kernel.org, openpvrsgx-devgroup@letux.org,
        letux-kernel@openphoenux.org, kernel@pyra-handheld.com,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>
References: <cover.1586939718.git.hns@goldelico.com>
 <b6733f80546bf3e6b3799f716b9c8e0f407de03d.1586939718.git.hns@goldelico.com>
 <CAJKOXPcb9KWNAem-CAx_zCS+sZoEHYc0J8x0nk1xjY9hD4-M4w@mail.gmail.com>
 <AB9B8741-CFF7-414D-9489-D381B539538D@goldelico.com>
From:   Jonathan Bakker <xc-racer2@live.ca>
Message-ID: <BN6PR04MB0660640B15550F75C8CCD4DEA3DB0@BN6PR04MB0660.namprd04.prod.outlook.com>
Date:   Wed, 15 Apr 2020 11:17:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <AB9B8741-CFF7-414D-9489-D381B539538D@goldelico.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR12CA0067.namprd12.prod.outlook.com
 (2603:10b6:300:103::29) To BN6PR04MB0660.namprd04.prod.outlook.com
 (2603:10b6:404:d9::21)
X-Microsoft-Original-Message-ID: <ada9183b-f363-cd20-1f9d-386525b03c95@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2001:569:fb67:7300:9f89:4b96:de0b:cd14] (2001:569:fb67:7300:9f89:4b96:de0b:cd14) by MWHPR12CA0067.namprd12.prod.outlook.com (2603:10b6:300:103::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend Transport; Wed, 15 Apr 2020 18:17:19 +0000
X-Microsoft-Original-Message-ID: <ada9183b-f363-cd20-1f9d-386525b03c95@live.ca>
X-TMN:  [U2G2OSqe5A/BZuCGGWOHtqUzj1cujfbs+umOObyOl+oDyfyAAsfjGd2eoRhHsiD0]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 50
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 30933129-d48e-48d1-e9cf-08d7e1693dc0
X-MS-TrafficTypeDiagnostic: BL2NAM02HT009:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gp3BiXN1m8OUI9TUXrEcbDnQB9zzSz88GXXW103qz0KuM0Zg94zLf6W4p8efgOxI+d1OTcBJWheBrYX+EXRjQqwvqFsw9BKU8x8PDiXbg+A9uYvM+ON6CYgpKaLMavDNOS2PBRFsMEMoh4nsPl2JNIU32k+fiP80519ML+w0mr2AiKu4hq9DKSuj3uCh4XfC
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR04MB0660.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: onrRf+pkiHCwQy/Q/3gVZHQrKcjInLcW20cEMXd8uF4+NSQTUzhoAODCmzzeqGGFuHe/zVe8a2ePYbAQOV+elESnWpx/32G/WpIdgoaQzZqmqgDfNtQuLL5el+yr8OIEKZay23wVidb4uYhu3EG3Qj4/1dq5ob2hBKDtEnHjWZqwpaXJ7zBJh8HkRPf149AVYqJ0G2rdUOLqlHjnyczX4w==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30933129-d48e-48d1-e9cf-08d7e1693dc0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2020 18:17:22.5620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2NAM02HT009
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Nikolaus,

On 2020-04-15 5:50 a.m., H. Nikolaus Schaller wrote:
> 
>> Am 15.04.2020 um 13:49 schrieb Krzysztof Kozlowski <krzk@kernel.org>:
>>
>> On Wed, 15 Apr 2020 at 10:36, H. Nikolaus Schaller <hns@goldelico.com> wrote:
>>>
>>> From: Jonathan Bakker <xc-racer2@live.ca>
>>>
>>> to add support for SGX540 GPU.
>>
>> Do not continue the subject in commit msg like it is one sentence.
>> These are two separate sentences, so commit msg starts with capital
>> letter and it is sentence by itself.
>>

Sorry, that's my fault, I should know better.

Nikolaus took this from my testing tree and I apparently didn't have it in
as good as state as I should have.

>>> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
>>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>> ---
>>> arch/arm/boot/dts/s5pv210.dtsi | 15 +++++++++++++++
>>> 1 file changed, 15 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
>>> index 2ad642f51fd9..e7fc709c0cca 100644
>>> --- a/arch/arm/boot/dts/s5pv210.dtsi
>>> +++ b/arch/arm/boot/dts/s5pv210.dtsi
>>> @@ -512,6 +512,21 @@ vic3: interrupt-controller@f2300000 {
>>>                        #interrupt-cells = <1>;
>>>                };
>>>
>>> +               g3d: g3d@f3000000 {
>>> +                       compatible = "samsung,s5pv210-sgx540-120";
>>> +                       reg = <0xf3000000 0x10000>;
>>> +                       interrupt-parent = <&vic2>;
>>> +                       interrupts = <10>;
>>> +                       clock-names = "sclk";
>>> +                       clocks = <&clocks CLK_G3D>;
>>
>> Not part of bindings, please remove or add to the bindings.
> 
> Well, the bindings should describe what is common for all SoC
> and they are quite different in what they need in addition.
> 
> Thererfore we have no "additionalProperties: false" in the
> bindings [PATCH v6 01/12].
> 
>>
>>> +
>>> +                       power-domains = <&pd S5PV210_PD_G3D>;
>>
>> Ditto
> 
> In this case it might be possible to add the clock/power-domains
> etc. to a wrapper node compatible to "simple-pm-bus" or similar
> and make the gpu a child of it.
> 
> @Jontahan: can you please give it a try?
> 
> 

The power-domains comes from a (so far) non-upstreamed power domain driver
for s5pv210 that I've been playing around with.  It's not necessary for proper
operation as it's on by default.

Looking at simple-pm-bus, I don't really understand its purpose.  Is it a way of separating
out a power domain from a main device's node?  Or is it designed for when you have multiple
devices under the same power domain?

Nikolaus, I can regenerate a proper patch for you if you want that's not based on my testing tree.

>>
>>> +
>>> +                       assigned-clocks = <&clocks MOUT_G3D>, <&clocks DOUT_G3D>;
>>> +                       assigned-clock-rates = <0>, <66700000>;
>>> +                       assigned-clock-parents = <&clocks MOUT_MPLL>;
>>
>> Probably this should have status disabled because you do not set
>> regulator supply.

I don't believe there is a regulator on s5pv210, if there is, then it is a
fixed regulator with no control on both s5pv210 devices that I have.

The vendor driver did use the regulator framework for its power domain
implementation, but that definitely shouldn't be upstreamed.

> BR and thanks,
> Nikolaus
> 

Thanks,
Jonathan
