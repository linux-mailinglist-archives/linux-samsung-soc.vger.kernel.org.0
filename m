Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0657D64D87D
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 15 Dec 2022 10:23:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbiLOJXM (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 15 Dec 2022 04:23:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbiLOJXL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 15 Dec 2022 04:23:11 -0500
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2107.outbound.protection.outlook.com [40.107.20.107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29D524A047
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Dec 2022 01:23:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=koChMRRvMJfg2VKL8VMibOdlbzhxpKOOa3kc68d8A9+YY6G9ETOUURftIE2xvffih0I7jziJOL+kBj05re/NPuAx+BAv1Votkq8irsqacV5j8AhXDriY3gckFaUZqXvva9f1kU4PkqOfKU8cmrWodAh0ZDx6qBb+9qZhCqsMF2gUS9L6Tg/JU47uoGCIRnMWTtGe5KDpWepeHHqgCn3q4Vce6sWCPEqrZPre6yliYmMiVva2Koe0U55XcYSkmYL1GiHFqv42+KW+h7S9iU6HmpkdHP8Aj8h+T7osZZjmyQ7XeIz/nmgzTSemj1EASq08UvdxJeof1LwJdaQcI+C4Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uFmFqRmoTkrIMC1aqgm8nPXlEV8ruBdpsuWinJmaoAA=;
 b=ZPeKVGhsEfxAQa87oAC11XR42GOWdlDiDVN0V5Tg8yU8IaQYfgVO5iiVbr4LG4bb+LXa7mHlar0X7328crmH2ebq1/U+vIiDoGotelozWUQrUY3mXhgXA/+ddCeS5MH+XZllcJdk8N59/r3oxC1s8WA3BLVkiEdcCMB43eMRR5egF1jnfrxJw9s7E0xUlsxXk2SYTrllmd2NJ9Mwef6ifP0Z1MvRz6eqA1YuAFHuY7hJ7eVZUfh6iZGTyZKHXPDpcsh2BGsNVo4Bs84va+ILhUH8c3qtKiBG/TA05E5CLjzzQWdG90YUJ4vbeyg3e6TymW1P2CyKWKmT2M4QRNg3Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFmFqRmoTkrIMC1aqgm8nPXlEV8ruBdpsuWinJmaoAA=;
 b=dIcIi6Apt2MAVAC+Ped1fbD4ufPLUdLmSODmvB7wJthT8ES/HBn0O3FGZJkEiBjAyg8nEvuFTa020OD7opHcYToMdXYQG7mn3EDVcbybwNz2SBbDc5WLeEJhRKNEfyvDtaY33r5OX2Jv0iRw/R7ejrfMVrcoc1hlywK8xAch19s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by DU0PR10MB6899.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:466::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Thu, 15 Dec
 2022 09:23:04 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6%5]) with mapi id 15.20.5880.019; Thu, 15 Dec 2022
 09:23:04 +0000
Message-ID: <e0556056-aa8c-d8fe-a22f-701b8f44936a@kontron.de>
Date:   Thu, 15 Dec 2022 10:23:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v10 18/18] drm: bridge: samsung-dsim: Add i.MX8M Plus
 support
Content-Language: en-US
To:     Jagan Teki <jagan@amarulasolutions.com>,
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
        Marek Vasut <marex@denx.de>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
 <20221214125907.376148-19-jagan@amarulasolutions.com>
From:   Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20221214125907.376148-19-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:22::10) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|DU0PR10MB6899:EE_
X-MS-Office365-Filtering-Correlation-Id: dd87cea8-a889-4e1b-01d4-08dade7df80a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KkKVJ72VH3fqVuw8T/0gklshAvRjmSBTV69COe8UPNemAex5oFnxvyVI/F41iwt4Yl0haDdwD+2mAZ8HUCXnim0bncjxsiY6sX+gs9aeLxkJSR7oxfUMVO/yUUdwxlseXfYIdXX8naFV9H5JqJmwZFiOLJQ24zLj+2fPdSUyIYCE51N3Z+r2EuHG2jfagBKBsFB4Ch4rPlHCJqHWmOP4A2yXgwg7oj0mn1dqRDfwv8XqAqFFsZ9W3viqkpS3k/xJ/5j3PrQjtq80CkkLNVVUfLnGj8BTnq/Wgp6tvBuOe4gI/O5rMElxerQiY3aXa7N7CKYmr5/HvM+VStLy1LZMvq1iUPy1aERjLN2bzxNk4Tc2w534p+huVXO6PDkc+gYryM/iWvKTZhLQTxxwTv9pctu7hKAn4FtTMRHsPoPgz9/fY+YBTIo6p7kG9LfCAtuy6NNUrBlJ9gh/slkkFF0ZJciGpEEljVzcFIOD/CHOkxzMTwlQoWODiygqIqry0erx8gpCoNF5rk0yPKpYr04INEVajEwNWoYCkGQBNOZyrNeI5A7NehQaVMyTHWXnjF6EmgkG4SM+PRf4KHZg9bfLo46DtMSNnPRcpdHXjGFtkMAxH8STtXb0FdiBrltCTB/jH4m+EVqUb0aTiVcivcUQBIgBbK6Hdt8jWZrklKHElN/lwx0I7lWpQWl/Xsa3iw2H84UV1WH7ac8vbhNr112AJ2+xFOy+uO+HxCPelmfBvktJeQmWULFif18/DRa2OFJ7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(376002)(136003)(346002)(39860400002)(451199015)(31686004)(2616005)(54906003)(44832011)(186003)(110136005)(36756003)(2906002)(86362001)(66556008)(31696002)(5660300002)(921005)(66476007)(4326008)(8936002)(4744005)(8676002)(66946007)(316002)(6666004)(6506007)(6512007)(478600001)(7416002)(6486002)(53546011)(38100700002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T21JNWpLVDF6QVh2eE1xa1pOYjd2VXZNVDhTRXpueHFyN1pSZVFWWVBzZytx?=
 =?utf-8?B?bEFNUFNxNUdPUmI5YlJkQVZmYTJheHc2OGVLdmUzT3pMVG5td2l2NFB6c3RL?=
 =?utf-8?B?QzJSbFhtdEZKN1c5K3FJM0RHZThXbUVWSktiT3orTTFJKy9ML3luR0ZhRCtH?=
 =?utf-8?B?cUsrTHhJVXk2RDNGR2FrNGV3RUFaR3FXMDVnMVlFVTMxblorUWtXc1ltN0pB?=
 =?utf-8?B?TTdRYTFzMVF4MERNTGtsUElWZCtuSFZTVlVScU9tZEMrNU8wQU01Wld6bUNX?=
 =?utf-8?B?K0RRWFpvQjNpaG1IL1g0YWRqd2U1aFlRNkZXZ2lJbkdtcWtKTzJpSHg3RkZ0?=
 =?utf-8?B?NWhtUHJnNGlxclpjL0lmYVUwZUl6UW1wOXZTSEdNL01hY1dZS3BUY2hoY3RG?=
 =?utf-8?B?bzBrelJFOUJIb2NFMjFuWEZ6bVc1dUZXOVdNc250SHh5UnlZQXBsV1ZQY3dl?=
 =?utf-8?B?Q2NVeU5yeFNnZ0gyTEhGSG4wdjJWMktxV1crODVNclh0Mis2bzBCd1VQSWVB?=
 =?utf-8?B?VzVNL3VPMmVEN1VLQ1U4dVlENnpHaUZCYlRmbzNaNFRlMkphTUhqVmY2Q1NS?=
 =?utf-8?B?bHNEakpvUjdaa1dMNGJwZDNwRlM1ZUlaajVERWgyMG1kblpiTTlmVVdvRExz?=
 =?utf-8?B?WXl5Q2YrM2hjN052UjRDbFQ5YmMzZGNOcS9KVzhsNnd2MjBJMHpLR2RVSFJa?=
 =?utf-8?B?TW54TUl2WVVCOVA5azludEZRK2YxWWpOTk0xUGFHd01YU3J3azZzeUVRUTRi?=
 =?utf-8?B?VHJTcGUxS2hsZzZSR3hmcWtKK2tQbXNETy9VVFd4NWRKK3RzZ29pWjdNblg1?=
 =?utf-8?B?WkUwSWtzQVVZeS9lK1NpR3ZFZzc1QllKZjFZSUpBaTBDalZPOERuUi8zMDRB?=
 =?utf-8?B?WHVQMzJaeHNEVWVYc2EyWXlXY0NJRjZYK3FLU3JWdjJiY20vcUY5d0VKcXEv?=
 =?utf-8?B?b3h0KzdrL2luRlh6UzA1QS9pOHBTbXdzN2VvcHAyVk5HVTVLQ2IyOThhOUho?=
 =?utf-8?B?MGIxWXduS2JQWHFxRC9YSVYySWtZcnNXZnMvcjVPZXl6SXBHT0xWMzBQK3R1?=
 =?utf-8?B?UmxaUW43MzZoWUxMYjJwVkw4VnFlRlhkemVFRXVMakhyRDJKWU5TdzArRWUv?=
 =?utf-8?B?R2F3d0dHVU8wMEtJOW5tSWZUWExsSy9malhqRmFadUcwZXZGVjFNNTNOeTBE?=
 =?utf-8?B?ZFB0a096YkcrNG5sQ0wxbFc4cGRyWlBBckJqWC9rWDVRNDN4N0s3Sng5dUI0?=
 =?utf-8?B?MFVLYTU3MHp0bDZYMDI1VXlJanBEOElxZGlmMjNYWlhJanY2SGZILzZtWlAv?=
 =?utf-8?B?U3hBbW1CWWt1UVVRSGJ0d0FQTDBvd3phWk11Tk9DbVdUN0xSRTFaSk90eVpP?=
 =?utf-8?B?L25ScDdCcFJHMWtqbkdjR1RWY3RMb21CRmxaM1A2WnRtbUJzakxCWjY5ODRQ?=
 =?utf-8?B?QW4walp0Y1l1dWRobGo4R3JYU3ZzcjZvVm14YktrSlF5S3Q3YUk4a1JVQnBY?=
 =?utf-8?B?b1JRNVFlQk1SOXArUXRPOHlyV3pXTHZ5a0s5QzAwNktIOWxhMm1MQzVjVHhX?=
 =?utf-8?B?WWVLa2xsUW5PRGxqTUVlOFY1cG92aEptR2RPblo3bkk4VEJVeWVXN0dSUDZ5?=
 =?utf-8?B?a3ZQVm1neVhUeThKZVdFL0Rvd3JlSStralJsOFM1M1ZqL2JIcjh3SEJTVm9n?=
 =?utf-8?B?Nmc2RUZ2R0VBblBLNjYyYzJWaXFMbCt2Q3d2VXFtL2c0REdYR0tPUGZXRGF3?=
 =?utf-8?B?Y1V3VVhMMmVDRzdjSTllbGFsdE9aWmZUQlRzSWNUeDVKR05sbGQ1bDM5T0ZC?=
 =?utf-8?B?SEp1eDJrM3BaNmE3ZWJ6dzlhQmZ3cGQ5ZHUvUzFOc2IxV2hkSDN2RzRJTnAx?=
 =?utf-8?B?UFNoM3JiZkxURUZpNG9ScVJJanIzZmNINVNlQ2x1elIyUGdhajlVNUVKYVR0?=
 =?utf-8?B?SWI2SGNtVkpPUWlISXpEc1JpQVR5K1dTanFZazF0U0dqSWMzNWx3UXVTQ1JJ?=
 =?utf-8?B?Nm5Fa2kxM2l4Q1JBTVZheW02WjU4UFJOSVZYTDE3cWV4V2RwbkJjR2VvYTda?=
 =?utf-8?B?NUhPUTBES21PMVMxUnAwT3VQenJUdnYvWklucElIZlZuenpIeVhPUFk5NEFv?=
 =?utf-8?B?K0E5bHlSclpETGRpbFFySld4TUl3M2VjRmVBMCs4MS90RzRhYjlDbjhwVzVj?=
 =?utf-8?Q?q0eS2Cos7fUWoJZ4VUf2HbJENpCLlfLiZHfX2cHsi0ah?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: dd87cea8-a889-4e1b-01d4-08dade7df80a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 09:23:04.0968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0BuwGbO13G9D10vfARY+H0YmJRfmGXh8FoKpx/Yx14FlGAmoiDksqaDHQKf2q7vkb5ZRt28wtaxU6lFiN5TtXe5BEBzBfDDqkDrHhTQKzAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6899
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 14.12.22 13:59, Jagan Teki wrote:
> From: Marek Vasut <marex@denx.de>
> 
> Add extras to support i.MX8M Plus. The main change is the removal of
> HS/VS/DE signal inversion in the LCDIFv3-DSIM glue logic, otherwise
> the implementation of this IP in i.MX8M Plus is very much compatible
> with the i.MX8M Mini/Nano one.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
