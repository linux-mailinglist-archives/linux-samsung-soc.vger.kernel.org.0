Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D25A6427E0
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  5 Dec 2022 12:55:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbiLELzb (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 5 Dec 2022 06:55:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230307AbiLELzR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 5 Dec 2022 06:55:17 -0500
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2092.outbound.protection.outlook.com [40.107.13.92])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82CD7283
        for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Dec 2022 03:55:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CBWHs2gAxNZDNeKDIfHquZwPlzj+OGGd1EW9TaFIGeGT0hdxthrirs3orxBvbhdOdk+fKVUS+qVDY+5Fg0HtTNV1Q0rCaIKDHYJ/RyzsMHb0Bn+Y6mBT+tT19klipLIY3Y/F/DVdBEOuPqT0K9T4GnRDjpR11rJi7j98ttmZLepZOcd1ApGa3QGRPglAWlJKEG8rNBYXuKVWu6tSmN/+zJV1kCIz8Jug925LTNbzb9H/Dwkcwy7pnAyHOYgsmtGpgZj8I2iRK48n4nRp2Ywu74WCMq1OF/CTIZObei9pJTat+tUsvXg1h6DVGGYRgtGn5fhJ/A+/0dBxBbQYzjm8eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EEp38+7vC0AkKY7hhqWBgrL3z3oeJbUN+JM+pWMJRW0=;
 b=nW9+zZLB52Yvl0JAiA2Am1FHmAUerDX9Inm04SxX9ATCjKYzT75a5CBNmF8MDTiXdOSChyeYK5TJ52w0K6Ft21LVnPqgRvNLfuyN7JVmisukavW89a0kXP2DiZtKAE4bLCeznz7ukf3Ugv8b4L1aNOWgLjr4yiZ/2vzW4jcqicYazzzgMsIXxULFk5K6qh0Z+G7b2gsSW/LLwzsgdJ7ImxLV0Cx182C+a7u1Vt12yWHcUAVNWewJ+Kioc6jtJKm6FDIWjARhVTLhibnfWpBl5/c3mS6uqk1+WUTqzE4sm4A1F5dTE1xu2FA78OSw4K8eg7oclbweaOxeR1ReSwsbLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EEp38+7vC0AkKY7hhqWBgrL3z3oeJbUN+JM+pWMJRW0=;
 b=NE8nfmbBs937IcKbMB4SdelIc1rUOw+mwbQLo6fMle1K7k2Xq2WkdR9zag6WyDHI+mMgIo1h/0r86t3g4CoGCaHbIE0knWiaIAxsLpNFQ/+svAjYTwN6YOJsKV0hihxgnEQTEFk21gHbUPVVVFL5VNMNBIwA/7kLlhT/dhELCsM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AM0PR10MB3282.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:187::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Mon, 5 Dec
 2022 11:55:12 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6%6]) with mapi id 15.20.5880.013; Mon, 5 Dec 2022
 11:55:12 +0000
Message-ID: <b17cd773-aa63-8603-97ac-968b7b1467d9@kontron.de>
Date:   Mon, 5 Dec 2022 12:55:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v8 01/14] drm: exynos: dsi: Fix MIPI_DSI*_NO_* mode flags
Content-Language: en-US
To:     Marek Vasut <marex@denx.de>,
        Nicolas Boichat <drinkcat@chromium.org>
Cc:     Jagan Teki <jagan@amarulasolutions.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Fancy Fang <chen.fang@nxp.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        =?UTF-8?Q?S=c3=a9bastien_Szymanski?= 
        <sebastien.szymanski@armadeus.com>
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <20221110183853.3678209-2-jagan@amarulasolutions.com>
 <CANMq1KCHQExVVp1jHjhRB2pMqeFFE1Cg1GVmnN83v=z1KzJt0Q@mail.gmail.com>
 <CAMty3ZBC3pbWf4yixjv4DZWFR+fYkPctiL3hzubgY8RF4ZGHmA@mail.gmail.com>
 <CANMq1KDmF+cMo8qZh7UyM1vyZ6BD_cFPc6j2MNMNPFiutqxL3w@mail.gmail.com>
 <c82a77f3-17a1-1b59-96da-924daae3678c@denx.de>
 <CANMq1KBMJDcfcbfYGtRj+MDJgFKg_i5Rw6ZJuoZy0D_kzkob3Q@mail.gmail.com>
 <ef265fa0-dea9-f7c6-3800-ad0353a838b8@denx.de>
From:   Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <ef265fa0-dea9-f7c6-3800-ad0353a838b8@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::7) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AM0PR10MB3282:EE_
X-MS-Office365-Filtering-Correlation-Id: f1b52cfb-1312-4870-0404-08dad6b79102
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E5eY8S9P3+D7jmhG7N+JAoOz4MGcOzEJCyqk2uJMJ2K7X6ppklAqZUdL9413Yy5cgI1xYWvIU+m9ZUpIk3cpHXDgD87GiVZGMS9/DliD1NcrbxO3qid42sWLKiwRNUHdkh1tkOHNzd0wX1L4jrHWYmpv/3K2NdzOx5Fq8WSqvyfWaf7kmrgsj5LthYEO62b+BpPVCoEUYP96f88Yio3oeU57sfdVBtS6+aAmV4hatYbFdHjQ6dFHHvqpj4J56UVNL8YWVogocczRkJlfmqR/f+4OeGdRNZpAto//0OmwTKuAlZvx9wrj8Uz76tZ+OHtM/7Qbgr3qItDGa69TDAkkAdz4rKRmfAxHTXU965xglcxfDAPg5qhI3bKIC2SSz71IzIK4U9ULR1rvm9P8V1x5q681mH50m7g0K3Vp2lfcs8CrFBXfcfv/dzgyu0fbFJ3IUgkion1BoOS7wlM/sLXR6fCKCB1tp8HbtxYQLSzD5CBRCL84mGEEcYWmS7n/tIWu6iZgcknvaSozV86mtCfoBco/F3cYnZfP70sVtXGl5J+fDzK7yyW1XtjLWWg+29XtzlBSfSWqSs8UP0EsOE/F/kjHTq9yJpjX5crB796u0MV0y3y5dsr/SpPz1O7+RJgAxgEUurNyu3gvXPtPn5XKtjCYpn0SWx0Q47etOIDBpneV99HtmrruKx7B97XVsjRGxA4JbPnnvck4+1qS5AWwv8x6En/3+wBtAxUbnAARUDQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(39860400002)(346002)(396003)(376002)(451199015)(31696002)(38100700002)(7416002)(5660300002)(41300700001)(2906002)(8936002)(4326008)(44832011)(86362001)(8676002)(53546011)(6506007)(6512007)(186003)(6666004)(316002)(54906003)(110136005)(2616005)(66946007)(66476007)(66556008)(6486002)(478600001)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0xDSFp6OHdmejNsUVZIdUh6akNlTmVFbjhIR0Y2TjQrVjVyTmU3LzZ0RnR6?=
 =?utf-8?B?ZHNUTGJwdXY0L3VyVHI1c2xLSTY2ZUxjYlZHL3NjQUNORDlmR0l1QkhXSlA1?=
 =?utf-8?B?VHhjZWJHUlE5U1VvZ2pvcVUzbGk2TlUyZVR4TFdMSjlIRG5XUTJBckM4NVJm?=
 =?utf-8?B?aHdETnp2VjFkdUl5Q0NDYzBjQjd6K0YwcW5FdGMyTWlMdlJINFFBd003WXlP?=
 =?utf-8?B?eTBOQVZQd29YaVZKR1orTFhpbXp2aG1TVHVLY2dLMjBzSGpCMXd5bHovODJL?=
 =?utf-8?B?VFJXbXJPbzFVT1kyTVJBdzJEcENhYjdyUXN1a3JDME5WR0taWjUrZG5SMXUx?=
 =?utf-8?B?bHp5VmdmcFNyZ1Z0cXZRZjVOc2R1R1RMdHFXNitXa2o4UHZtSnlPQ0ZUTkRu?=
 =?utf-8?B?MjBRTFdhQkVVRHl5UDdRSy9LWXVrYm50NVBMcGxhdk4rV2Q0S0lXdkJBdFJD?=
 =?utf-8?B?d1RqejFpTUl6V3phRmREaWFvSmcvNTM5ZEh5TUVaeG1JbUF3SGRVTTN0d3Ez?=
 =?utf-8?B?VW9OWXZ0dzl0NVJRUDBJRG56clFQbTRMWnplNWltUGk0YmJ3TmJXV1VUa3hX?=
 =?utf-8?B?SGlVMHk0R05FZVJrTGxVRFFqbVhVYXJ6bUpMQnkyNlFHWWFqcGlqalE0TEFu?=
 =?utf-8?B?YThzQm1KVDNFMjhka2tqWmxyOVR6SUZzTjEvTkdnTTJSb0gxdURndTFsNmph?=
 =?utf-8?B?a0cwb3NBdzY3dGlFQlBGZTdwaVBMNG9paTRURlM1U3JNZjh6S2ZuZ1NSdW5B?=
 =?utf-8?B?cExoZ1d5NmtwUUpYK2xkQysrVnRaWEhmUjhqWmlCeDYwMUJpZVI0ZENLNVk2?=
 =?utf-8?B?dkNleGIvclFzOXc3WE5xK1pmNFU5SkM5SURZcFgwOWh1WUtoVGRCb0FmWlZT?=
 =?utf-8?B?eGJOYjQxMGk4Ti90V2EzLzRsR2VrRms2VFFpVi80RGpaWHBEWUpkSlIrQ0pj?=
 =?utf-8?B?bWFBeUt3N01UdnVndTdJUkx5Ly9jbFVnRHkwSFVIK25UNW4wQVpnM2crMXBs?=
 =?utf-8?B?Tng2L05NUHBicUdqUldmb1VyMEgwdnZuVEt0bFdQc3BFa0N0NjNEMVo0M05h?=
 =?utf-8?B?b3FFL21pRGJNUGxJeGlSSHRkcmU4OFZFNkhLa0V0QTNuTDdhN3o5SG5MK2R4?=
 =?utf-8?B?aWJrYjNKbzRILys0Wnl0dVBuYW5HSUZWU3p0UWpISUJhUjhKSlltT0l6cTVk?=
 =?utf-8?B?UFFZZWJGMDlXMWlJVWtkdkhDSmpkSk0rV1BDdTRtTTlGMzRMb0RMRHU1b1M4?=
 =?utf-8?B?d1pncjRoeFJIZTErUXBnSW9mOVdNcThtZ1E5K3p4a09SZ3NaYUM1ek1WK2wy?=
 =?utf-8?B?WW1qWW5ZVk1BeXJwSjRxMk04THFtTVFQMldsb0hIclBrQWU3UUg4aXN6cVpr?=
 =?utf-8?B?bjFmM0oyT2ZkUWlTdGY0S1BXWGJ0dXNIalFZbWYyTTFqS3VScytXdHJyaGxB?=
 =?utf-8?B?QkVXUW1RK2wwZ2Y5MW5MUXRWTG1nbHVqZ2xJWnZnUXpoYjJiMHF4NlIvcm44?=
 =?utf-8?B?NWZmRXk0UDBhTGRRc3REcXhjQThZT1J1UTNhRUdoU2s1YkEySEJ5cGRHUTY1?=
 =?utf-8?B?eitsVnpza2VOaVBMSDlXNzhYcEM3b1ZkR2JRVExISGFDWGJqTFFzODlHUXF0?=
 =?utf-8?B?SXdncGpNY2pHYVFqNzFXTTdmUUhqaGk3R3c1MEk0M0dYVjBQTytmK3VBOGhI?=
 =?utf-8?B?QTJ5eWt5WW0zUk45NEV4cWJQZzF1d3FzSU5JZXpPZmZoWVVoRE9KTm9DVGx0?=
 =?utf-8?B?bU0yRnNTaDJSYWIzWiswNTRNMHZrL0dGS0plWVJYajFldDlqMnJBQ0xsWTE5?=
 =?utf-8?B?STk0QzNHKzR1dmFuMmszcDhhdzczYkdnZTJxVzE4VUhnNUdIZVh3ai9mN3BG?=
 =?utf-8?B?YjV1SXFlVEg4UnE0ZDRNeENhS0ZJN3NheEE4cjNDQ3ZwWi82ZTBTOUdKQ2pN?=
 =?utf-8?B?MWI3THdOS1FobkRSZEJiOWhETmozZFRFcXpxSlNHM0VXMm5XODNRN0hUUit0?=
 =?utf-8?B?UmFtZ0lCVlZMd3F5bWw3SlF4U2MxZG03WUVyUGhBeTNUYW55bkRPTVBBeHZR?=
 =?utf-8?B?RjIrZzJaSUFORzVldXg1QUFNZjZ2ZkNpblV1RkcwMWhhWXVFZDNRTWttSFVt?=
 =?utf-8?B?R0IwK2JPUmZTaHZsRy9HQ29pY1RQdE9JREExMmJ6bC9iWnZ2K3Uvc0FqTlpy?=
 =?utf-8?Q?0Nq+eCeFPEkw+BKhRd3+V7XPVX7iWcxE1yqUgPRxYMbT?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f1b52cfb-1312-4870-0404-08dad6b79102
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 11:55:12.7783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +6FlFaBqr7hq/p/m69wd1IM8iH1LdYFRNxY5/XaZabW0iNl/MaAiFM+f3jCa4Z3A4RLWbh5Rbdr2aTRch4HhFmBtgQDpauBbTkDLusV5DfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3282
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 14.11.22 04:16, Marek Vasut wrote:
> On 11/14/22 02:11, Nicolas Boichat wrote:
>> On Sun, Nov 13, 2022 at 8:29 AM Marek Vasut <marex@denx.de> wrote:
>>>
>>> On 11/11/22 13:12, Nicolas Boichat wrote:
>>>
>>> [...]
>>>
>>>>>> BTW, are you sure DSIM_HSE_MODE is correct now?
>>>>>
>>>>> Yes, we have tested in imx8m platforms as well. Sébastien Szymanski
>>>>> initially observed this issue on the imx8m platform.
>>>>
>>>> I'll repeat, are you sure about HSE specifically? You invert the
>>>> polarity for HBP, HFP, and HSA, which makes sense given your patch
>>>> 02/14.
>>>>
>>>> I'm concerned about HSE. Is the bit really a disable bit?
>>>> MIPI_DSI_MODE_VIDEO_HSE is supposed to be an enable flag, so you
>>>> should not do `reg |= DSIM_HSE_DISABLE;`, probably.
>>>
>>> I suspect the HSE bit is a misnomer, but its handling in the driver is
>>> correct.
>>>
>>> i.MX 8M Plus Applications Processor Reference Manual, Rev. 1, 06/2021
>>> Page 5436
>>>
>>> 23 HseDisableMode
>>>
>>> In Vsync pulse and Vporch area, MIPI DSI master transfers only Hsync
>>> start packet to MIPI DSI slave at MIPI DSI spec 1.1r02. This bit
>>> transfers Hsync end packet in Vsync pulse and Vporch area (optional).
>>>
>>> 0 = Disables transfer
>>> 1 = Enables transfer
>>>
>>> In command mode, this bit is ignored.
>>
>> Okay. I'd suggest adding a comment in the code, it'd be so tempting to
>> attempt to "fix" this as the if/or pattern looks different from the
>> others.
>>
>> But it's up to you all.
> 
> I agree. Clearly the discrepancy is confusing and leads to mistakes.

+1 for a comment in the code that explains the misnamed bit.

Otherwise:

Reviewed-By: Frieder Schrempf <frieder.schrempf@kontron.de>
