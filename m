Return-Path: <linux-samsung-soc+bounces-4212-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F3E94CB08
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  9 Aug 2024 09:16:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 235E11F23E6E
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  9 Aug 2024 07:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F352B16C878;
	Fri,  9 Aug 2024 07:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Qk68SN/r"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2057.outbound.protection.outlook.com [40.107.104.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300FC33D1;
	Fri,  9 Aug 2024 07:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723187777; cv=fail; b=RrntMwXaEUNcPuIekkVo91AWvpATAfRpkJQ1oWqlwq/kLmwKexij8Fd426MAHeczjJ7IOmFFg4VDYaum6m1YycCKPwSTJbftDEkXua/kGlFYZk+VU0ZJ3Y9PfE1njxGf11HGXbvM0yZceVVgUOgerY5Cb3TLX7I9oAV33x9nn4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723187777; c=relaxed/simple;
	bh=IUYVmZDNNZXgINLn7QlSeRqWd5mPDIpe8/+xYu63x0c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qItwOkLwzZu1XjcNlHJGk5zVAnLqRZFgxPQS1/miFOZ29fzVaOBg31QQQEIzZDFRqbCc4NaxgO4XzEtwtPaGPEw5OJlptp4K0JiJgbu5mOMYjyTI21WYalyOu47IkC11UD2daXbd+NuKWjENQNcppuEKYbeLePXig0GqH/0wd7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Qk68SN/r; arc=fail smtp.client-ip=40.107.104.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J/6Ns/n4JYNsVFz80hmSFiKOREW8UUeiz9QgePvMiydd7YUHJNsYRRWVL6ToJZgQvE1TO0nyNjK2rU9apjdmHlk3h4MN+xLTesZEV/zz5d8mfnzj6U9tNvpKkxTKSluhVD3jOq61xxdMSxMES9pGEfccPwXdcsxNcaKhZWwUtF/vttyx0SUFeUOQCWBJ2jwRYsANXuco9nhZaAiYfEIWFdhfGm2ozlppMO2KOZZznlwrAyFIPpOtgS6HsYz05HT/VroU5aB7FQzuW5keKXMFjD3pSqTJYBL4HgZ7b1VF36A6MsmTFd14KVGPemL+vJeaJPvRiWiLQmzveCkEpBXofQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUYVmZDNNZXgINLn7QlSeRqWd5mPDIpe8/+xYu63x0c=;
 b=n+WE9lMxGCf1qsYVjYuCyj0hxPKkJSNCccIwJSCAH3nEAf0O6cXMXW3jXGDqTEeOmrWUpwJO5X2XjbHXDwSLuDkZo4xscYGGiiultc3Vjxp4rmomBc3a00MEt0y2ZqKs+c5YIREOh1SidfNePhAGqagFoKNmeUju3phKNaLWurmQnJ46KeDm26HFpLmNQ9kJrqe9x4aivOfRwtosSW+muqok7AcKDBj2Svm4XL1tw7vZqRMEjeNg2fW8x+nJ2+l2XCqsRWY4srkueoK+jW1m9a3B+8TC8v9I3KFhc1JmUVrQB0Tut/uiBRjk2bHLCgQYiF/SReIeokPT4HQ7Sg+zCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUYVmZDNNZXgINLn7QlSeRqWd5mPDIpe8/+xYu63x0c=;
 b=Qk68SN/rMLCTSJVIDMS64e/5vgTHvxm3YhjJCoYuZ1Yejq76QUgm/jTSCuhn5NGKDcKO89iS3J+Loxs2UO5fniqQEvTDB/vXHj5p4glOLt5J1SNupWe0jcr0p+x1Li5PPyxuO2PpClDuAugx2NVOV5rHME0gIqCBVO2n2Mg1usRNTbI5PRVI+wMIvx0+qzW6zCOUZN/N9Lq5fY2c+veq7PVjKYoN4wTpVmJeyPGKjqNZu67pIJSHArq6xpC0/Ddq6WfE1oHhN2KX4LKaejtESgf8X2do3BYMh7D9qHywgba7HTJAVisKmWxlXllQPcMf/GwnD0U5BVA2D3dWTuv+BQ==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8685.eurprd04.prod.outlook.com (2603:10a6:102:21c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15; Fri, 9 Aug
 2024 07:16:10 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.7849.015; Fri, 9 Aug 2024
 07:16:10 +0000
From: Peng Fan <peng.fan@nxp.com>
To: =?utf-8?B?QW5kcsOpIERyYXN6aWs=?= <andre.draszik@linaro.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Peter
 Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi
	<cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Sam Protsenko
	<semen.protsenko@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Abel
 Vesa <abelvesa@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
CC: Will McVicker <willmcvicker@google.com>, "kernel-team@android.com"
	<kernel-team@android.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org"
	<linux-samsung-soc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: RE: [PATCH v6 01/20] clk: bump stdout clock usage for earlycon
Thread-Topic: [PATCH v6 01/20] clk: bump stdout clock usage for earlycon
Thread-Index: AQHa6aE+ihq9zzVGLUK5uxX3bJggI7Iegxvw
Date: Fri, 9 Aug 2024 07:16:10 +0000
Message-ID:
 <PAXPR04MB8459F99475C289A827987AF588BA2@PAXPR04MB8459.eurprd04.prod.outlook.com>
References:
 <20240808-gs101-non-essential-clocks-2-v6-0-e91c537acedc@linaro.org>
 <20240808-gs101-non-essential-clocks-2-v6-1-e91c537acedc@linaro.org>
In-Reply-To:
 <20240808-gs101-non-essential-clocks-2-v6-1-e91c537acedc@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|PAXPR04MB8685:EE_
x-ms-office365-filtering-correlation-id: 1221dbcf-8795-4e26-4771-08dcb843254c
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?d3A1akpOcWluREZNV0FYeE5OYjdVcFVEWVpOcGxLK2xZZ1BFWUpBSERsb1U2?=
 =?utf-8?B?NjJuZGl5WVVNOVpNQzlaNmFoczh4VDQ0dGJNWVFCUk9EMEVzekpxbUh3K1Rk?=
 =?utf-8?B?TURjV0NmZnFLaGZKdnFGa0xRaWsyemk4RnpOS3FFSEVFQlVkeTIwbXQySkli?=
 =?utf-8?B?eGpKWHk0UEhrWFNSQUFIZzR6UklQcVNReE5NNXpBdVNJSE9FeWhIaldLdUxS?=
 =?utf-8?B?bmVqcWtFdkxIQmh6dmsxcUV1dnNuQjVRVlNUZjEydjFRMTJkQUt3K3B5UkpP?=
 =?utf-8?B?OXFmRTNWOXBuNzBLM2VsN3MzV1pzWmxQbTJlSUdQdUFiQnVpZ29IRTMxd2FV?=
 =?utf-8?B?clRuZFEwZUtIYkVCK0wzRHdHdUUyWG94QWRZT3poWGpRMkZ1eHdzUVM0dnZN?=
 =?utf-8?B?d1lWYStIaUJUMCsxbEh6MXZNY2x3NVFzeFNtNzlzWm5GMW9BbVRMQXZ2ZWV1?=
 =?utf-8?B?WVhJQithT2ZBdjZDZVlIVzN2Wm5ETjFvblhhZ0NWWGJVS1B3bnd4ZGFFSnZy?=
 =?utf-8?B?ZHdVV0NBcStDZE9UbDlHaUZOd1NZTTVyWWVONnZJOGZrckxpSG51RWk0NVc4?=
 =?utf-8?B?N3hSWngxemZBVUdKTWt0d3poUWtyamxESVJPYXd3MGF6dGx5cUZTZzZuWWJH?=
 =?utf-8?B?cmFYYTZGdVR2VDM2Q0lGclF1UTlaQ1pLd2VKUS9OM3JWdVBWemVGbm04T0RL?=
 =?utf-8?B?ZnVUK1lpMUhDdkR5aWFDM1dzb2ljVUwrazE1dXpQWjAwRzJuZ0hKdlhGa3pI?=
 =?utf-8?B?ZExoOC93SVRoVDNYZ09LYjd2TWNMY3VoRDJZN1FxWGVxY3hHcm1XeTgwaklM?=
 =?utf-8?B?bDlPTEI5cnh2ZStudzdpcXdUS0lwYzVvOERTMkhHR2VJejhQNWxaSVVYSEN3?=
 =?utf-8?B?dWFUU2o4dHR4cGNDditZV01Pc1JZQ2FPc21BMTFuZUtYR3lVUUdxM2xuMHJX?=
 =?utf-8?B?SXpwT2VqR1docUsrS25ZVjJFY2Y1UmNBZm9KcUJ4OGlUOTNFRUhKeDNKMzEx?=
 =?utf-8?B?MkFWSk5iM2lpYXV5WlMvWEJKWWkwMllPM21JWUFUODJ2bURFRVhhMFlSQlF4?=
 =?utf-8?B?RHNDRXZ0NGo0cDBIKy9zalRKTGV1OG9jZzJkbnFkWHBTblVCNjZmZFE1VjlT?=
 =?utf-8?B?aE0ydStDS0FQWXcxc05jcmF0QVlhQjhZQ05ubllwVkhVZDVXWkM2NnBLVUhu?=
 =?utf-8?B?T1VGK2NLM3djSGZkSkQ0dW10Z2RwZVNrNElkZHNtSEM2UFd3UEtvWExKMzdu?=
 =?utf-8?B?aHhHQjZyWEx2bG1Zam9hanRMSXlGMy9halpmeUhTbWhVS3FaUDh4T1dGY0FO?=
 =?utf-8?B?M0JjQjRBemZOMzVVMzVDZk9CRTVXYzBBTUxvQXRzeXVnRzVReHhPbTBEQ09y?=
 =?utf-8?B?ZzFEOWJiQ2x0RlBWTlR3SHZjelpma2t6cjZkZ3VkV0NmdkFGUGRGWlNHb25S?=
 =?utf-8?B?dUtEQWdtajZWdzduZ2Z5Z3hnbkpEbDZXeTlXbzAzbVRzcGMyTFkwcmtaRy9O?=
 =?utf-8?B?dzBGdUdyNUsrOWNXaHJ4cjRyMXM2TDlmS0hqUS9wTy8zT3k4VFgzQTRxSXVQ?=
 =?utf-8?B?anNjRE1CS3B3L2RUelh4NXpTN05sRUxGV1NYN2NiS3YwWDU5a2ZXNzJRbVZY?=
 =?utf-8?B?bS9EZHgwd0xlQi9NMGFpc2lQUEpnOUp0RjNUM3dZdHJvalFHbzRmZWJxTUNm?=
 =?utf-8?B?Q3ZKbGoxTHVOZjBwWnM2cytBTjIzbzZ0RlFpZUlYanYwcHlKQnRUdm85WFVU?=
 =?utf-8?B?NFo2OEUwdlB5NUpkRmR6dUdMbUltTnJUTlFlcyt5MWJvMDVJUkRNeThNWUxE?=
 =?utf-8?B?YmxYaDVFREpyUUpvdWFLVWc5RjBzS0lUaVZxYXhrVkZBeW1Kd256OU5pS1U5?=
 =?utf-8?B?dlR6VU9WZnhOY3RsdlFiV09mcXE2Ti9zSTk0a0NGRTdqblRSY0hwWWlwY0tp?=
 =?utf-8?Q?9zhVvArnLc8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?STNobDJ4Y2ppNWNzbUtMQ3MrSkxqNDViT2IzUnhjMXJxa3hhVGcvRzM3NFk4?=
 =?utf-8?B?ay9uVGJvbDkrMzNkSytwMnp2VGx2OWQ0MkptQ3ZaSDVZUjJET0t1WXhxRmdX?=
 =?utf-8?B?NVdYV3JxZGJkZzFoS3dJUHFVUTZHMVY2TWU4cEZKMXQ2VFF0WFA3NVU2UGxT?=
 =?utf-8?B?eVZ4YysyUHIzMXY4SlZ5L3BsV1hSRStaenpUNTNRYVovMTNSbXdsWUw4WDYx?=
 =?utf-8?B?ckRsUDNDbVlxejBaa3YvOXoxWEdxRUlZZUpEM09DbjFxRWpSQ0J0Q01icEgw?=
 =?utf-8?B?RVUwM3lUaG5hZmxjR0pkcjRvb1F0VmRXRyt2MEtnMUk1cHV0U1JMcWs3b002?=
 =?utf-8?B?TlRrci9sZGhtZDdHZHVpODhDMEQ4MWZOZzdSRklpSVBEblJvaTdYSmtHNGFi?=
 =?utf-8?B?bmJodkI5REphbDNCVHZhTU5MOXBOOTJoa3BuZEJqUzdBRXV2a01KV0J0SGVl?=
 =?utf-8?B?MElwemJucGFMdVNkTEdTYlRhTUhZUnJnQzFVdHJGM1A2VFRGZ0ZSVEptekUy?=
 =?utf-8?B?TEdqM3JTd1V4TmdZUU5uWVpLbklUcFVHamF2dFZIc1BGdk95N1E5ajBucWtN?=
 =?utf-8?B?UGtHYjdFOTN5MUZVdC9RaVZIRHY2QVpPbmdDS0I0RlBrVGRvOC81RTE5OUg5?=
 =?utf-8?B?SmpwY2U0cGkxTGxRTVk5NWNoRGRjUnZOdEpRa0Iya3lsVHcyS2xwYUtvdWxD?=
 =?utf-8?B?cEpuVkVQUS8rNkRwNXBRQkpCYjdWdkYzVXArVDFpZG1FYzNPWE8wUzhhcERx?=
 =?utf-8?B?aEs5aGFtc3JoNEpUdmg5Q0gzN29FcEcwdkx3YW1hUmJwa1lBNFNpSVhUL3JS?=
 =?utf-8?B?WnVLOUs3eFpvR1d6c0trcVIyS1RTRDFOZzJYeTg5Wm51VjFmL05wQ01MSjR1?=
 =?utf-8?B?SStSWjNKeGptTTZOZkcxVW9Ucmd6Q0VYZTRNVzVlU2FFUGNTM0xZdWhkRlZI?=
 =?utf-8?B?aUlWSFllNVg5NU4rU2lmRmpCbjlka0dYVVNGclRTU3pKT0tsN0NKWnNpcnpB?=
 =?utf-8?B?c0Q1dXZaTStGVXJtOGVzT3Fzckg5Q0NZd0ZjMm9tcU9ZNG4xZVNRVnU3M1I1?=
 =?utf-8?B?UHJOU1BwbU1mUDFpNmxzVWVIWHh2VlExd0xpOGlvTlV1anRMbk0yaGMrWWp6?=
 =?utf-8?B?L0RLMWp1RGZ6bjFrdXpHWDZrUkRUQ0pIWWtJNVlxb0tBUDJRWFhrcFhaejBl?=
 =?utf-8?B?TXhySllPNURRSHJSckpwUkpLUm9ZTW5OZE1KRnZJZXJ5blNRUEhkTFZMeVAz?=
 =?utf-8?B?UEIxVU5PdEpVaTU3R1ZvNDV0UlZYeVFsQjRHNCtaOTd5YlZLRkptcUplU0R2?=
 =?utf-8?B?aEVnaElBT2pHd1daaURpODN4eDJYRGhRQjNrVjMwbzhmVmxwa0t5cnBXcTgz?=
 =?utf-8?B?NVdnczBlVkVnbVJ4WmhoNU9ZNUp3MXBSZU9zVE1pQlpQNjhaNmRTamJxdDQv?=
 =?utf-8?B?MUVpTktWZGVxa29PaTBpUndIYTQ4bEtDT3ZGdjRZSWJwK0NWZUswL2JGMExy?=
 =?utf-8?B?NnEzSnltbVEvcmFEdi9wNWsvRjV5bzZqdjJyeEJPKzBkbHRIVHlTTEEwWHhL?=
 =?utf-8?B?aUhnT2EzQ0IxTXVoYmhJTmhBbkZyNGxPZFpGMnFqZlVTaTU2N00wamFweTNz?=
 =?utf-8?B?d1NyM25uNWpOQ1RxVUkzbXBBZWtzS000NlFiSkVPejA3bUhoM3VxM3lrTjd1?=
 =?utf-8?B?TTBGb01Pd04rZzFOdGpBOFhNUEJ3cm9oOERQRW1ZVzNSYys5d2x2elFaWUJm?=
 =?utf-8?B?UTkwVEtJcVNsYnhRK050TTlqUTZXTWFPUmcwY3dnRnJOc1RVK3ROd0ROSjlS?=
 =?utf-8?B?Z3A3L3Y0T3RWMkxocjEyNmFBdnMxLzdqd0ZoNkVGTXJNdkxZeW04RWZZOUVY?=
 =?utf-8?B?MWptbk5mWnVCT2ZRMWkzUldaV2xlMmU2STNESGVsY3dLRFMzeEc3aU1tdHN3?=
 =?utf-8?B?Z3JzWElkWHlnZUhPMzEydi9xWnFFT3ExZ3FESFVZditFcVl2R1dhc0xWOG1R?=
 =?utf-8?B?THUwcUNSR0ZubzYrSnQvUWhkNnRlT3hOUHpFRmwzRXFGQTdiUFFaa2pKcnQ1?=
 =?utf-8?B?K0taTEFRVURMN253RVJiczVtRzQ2MjF6RDluWk9xZUsrU3lNVTFaaXQwS1ow?=
 =?utf-8?Q?e1fE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1221dbcf-8795-4e26-4771-08dcb843254c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2024 07:16:10.7529
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ybjEuNPT3F3anPW9kyNXCJ/5LuSEfO9+UMVkF+ykbV/BlHu/eRgvLzjlcYsioe4wvaRyEQtcc/7pQPb2jl5CGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8685

PiBTdWJqZWN0OiBbUEFUQ0ggdjYgMDEvMjBdIGNsazogYnVtcCBzdGRvdXQgY2xvY2sgdXNhZ2Ug
Zm9yIGVhcmx5Y29uDQo+IA0KPiBPbiBzb21lIHBsYXRmb3JtcywgZWFybHljb24gZGVwZW5kcyBv
biB0aGUgYm9vdGxvYWRlciBzZXR1cCBzdGRvdXQNCj4gY2xvY2tzIGJlaW5nIHJldGFpbmVkLiBJ
biBzb21lIGNhc2VzIHN0ZG91dCBVQVJUIGNsb2NrcyAob3IgdGhlaXINCj4gcGFyZW50cykgY2Fu
IGdldCBkaXNhYmxlZCBkdXJpbmcgbG9hZGluZyBvZiBvdGhlciBkcml2ZXJzIChlLmcuIGkyYykN
Cj4gY2F1c2luZyBlYXJseWNvbiB0byBzdG9wIHRvIHdvcmsgc29tZXRpbWUgaW50byB0aGUgYm9v
dCwgaGFsdGluZyB0aGUNCj4gd2hvbGUgc3lzdGVtLg0KPiANCj4gU2luY2UgdGhlcmUgYXJlIGF0
IGxlYXN0IHR3byBwbGF0Zm9ybXMgd2hlcmUgdGhhdCBpcyB0aGUgY2FzZSwgaS5NWCBhbmQNCj4g
dGhlIEV4eW5vcy1kZXJpdmF0aXZlIGdzMTAxLCB0aGlzIHBhdGNoIGFkZHMgc29tZSBsb2dpYyB0
byB0aGUgY2xrIGNvcmUNCj4gdG8gZGV0ZWN0IHRoZXNlIGNsb2NrcyBpZiBlYXJseWNvbiBpcyBl
bmFibGVkLCB0byBidW1wIHRoZWlyIHVzYWdlIGNvdW50DQo+IGFzIHBhcnQgb2Ygb2ZfY2xrX2Fk
ZF9od19wcm92aWRlcigpIGFuZCBvZl9jbGtfYWRkX3Byb3ZpZGVyKCksIGFuZCB0bw0KPiByZWxl
YXNlIHRoZW0gYWdhaW4gYXQgdGhlIGVuZCBvZiBpbml0Lg0KPiANCj4gVGhpcyB3YXkgY29kZSBk
dXBsaWNhdGlvbiBpbiBhZmZlY3RlZCBwbGF0Zm9ybXMgY2FuIGJlIGF2b2lkZWQuDQo+IA0KPiBU
aGUgZ2VuZXJhbCBpZGVhIGlzIGJhc2VkIG9uIHNpbWlsYXIgY29kZSBpbiB0aGUgaS5NWCBjbG9j
ayBkcml2ZXIsIGJ1dA0KPiB0aGlzIGhlcmUgaXMgYSBiaXQgbW9yZSBnZW5lcmljIGFzIGluIGdl
bmVyYWwgKGUuZy4gb24gZ3MxMDEpIGNsb2NrcyBjYW4NCj4gY29tZSBmcm9tIHZhcmlvdXMgZGlm
ZmVyZW50IGNsb2NrIHVuaXRzIChkcml2ZXIgaW5zdGFuY2VzKSBhbmQgdGhlcmVmb3JlDQo+IGl0
IGNhbiBiZSBuZWNlc3NhcnkgdG8gcnVuIHRoaXMgY29kZSBtdWx0aXBsZSB0aW1lcyB1bnRpbCBh
bGwgcmVxdWlyZWQNCj4gc3Rkb3V0IGNsb2NrcyBoYXZlIHByb2JlZC4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IEFuZHLDqSBEcmFzemlrIDxhbmRyZS5kcmFzemlrQGxpbmFyby5vcmc+DQo+IA0KPiAt
LS0NCj4gdjY6DQo+ICogZHJvcCBhIHN0cmF5ICNpbmNsdWRlIGZyb20gZHJpdmVycy9jbGsvc2Ft
c3VuZy9jbGstZ3MxMDEuYw0KPiAtLS0NCj4gIGRyaXZlcnMvY2xrL2Nsay5jIHwgMTI5DQo+ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEyOSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9jbGsvY2xrLmMgYi9kcml2ZXJzL2Nsay9jbGsuYyBpbmRleA0KPiA3MjY0Y2Y2MTY1Y2Uu
LjAzYzVkODBlODMzYyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9jbGsvY2xrLmMNCj4gKysrIGIv
ZHJpdmVycy9jbGsvY2xrLmMNCj4gQEAgLTQ5MjMsNiArNDkyMywxMzEgQEAgc3RhdGljIHZvaWQN
Cj4gY2xrX2NvcmVfcmVwYXJlbnRfb3JwaGFucyh2b2lkKQ0KPiAgCWNsa19wcmVwYXJlX3VubG9j
aygpOw0KPiAgfQ0KPiANCj4gKy8qKg0KPiArICogc3RydWN0IG9mX2Nsa19zdGRvdXRfY2xrcyAt
IGhvbGRzIGRhdGEgdGhhdCBpcyByZXF1aXJlZCBmb3IgaGFuZGxpbmcNCj4gK2V4dHJhDQo+ICsg
KiByZWZlcmVuY2VzIHRvIHN0ZG91dCBjbG9ja3MgZHVyaW5nIGVhcmx5IGJvb3QuDQo+ICsgKg0K
PiArICogT24gc29tZSBwbGF0Zm9ybXMsIGVhcmx5Y29uIGRlcGVuZHMgb24gdGhlIGJvb3Rsb2Fk
ZXIgc2V0dXANCj4gc3Rkb3V0DQo+ICtjbG9ja3MNCj4gKyAqIGJlaW5nIHJldGFpbmVkLiBJbiBz
b21lIGNhc2VzIHN0ZG91dCBVQVJUIGNsb2NrcyAob3IgdGhlaXIgcGFyZW50cykNCj4gK2NhbiBn
ZXQNCj4gKyAqIGRpc2FibGVkIGR1cmluZyBsb2FkaW5nIG9mIG90aGVyIGRyaXZlcnMgKGUuZy4g
aTJjKSBjYXVzaW5nIGVhcmx5Y29uDQo+ICt0byBzdG9wDQo+ICsgKiB0byB3b3JrIHNvbWV0aW1l
IGludG8gdGhlIGJvb3QsIGhhbHRpbmcgdGhlIHN5c3RlbS4NCj4gKyAqDQo+ICsgKiBIYXZpbmcg
bG9naWMgdG8gZGV0ZWN0IHRoZXNlIGNsb2NrcyBpZiBlYXJseWNvbiBpcyBlbmFibGVkIGhlbHBz
DQo+ICt3aXRoIHRob3NlDQo+ICsgKiBjYXNlcyBieSBidW1waW5nIHRoZWlyIHVzYWdlIGNvdW50
IGR1cmluZyBpbml0LiBUaGUgZXh0cmEgdXNhZ2UNCj4gK2NvdW50IGlzDQo+ICsgKiBsYXRlciBk
cm9wcGVkIGF0IHRoZSBlbmQgb2YgaW5pdC4NCj4gKyAqDQo+ICsgKiBAYnVtcF9yZWZzOiB3aGV0
aGVyIG9yIG5vdCB0byBhZGQgdGhlIGV4dHJhIHN0ZG91dCBjbG9jaw0KPiByZWZlcmVuY2VzDQo+
ICsgKiBAbG9jazogbXV0ZXggcHJvdGVjdGluZyBhY2Nlc3MNCj4gKyAqIEBoYXZlX2FsbDogd2hl
dGhlciBvciBub3Qgd2UgaGF2ZSBhY3F1aXJlZCBhbGwgY2xvY2tzLCB0byBoYW5kbGUNCj4gY2Fz
ZXMgb2YNCj4gKyAqICAgICAgICAgICAgY2xvY2tzIGNvbWluZyBmcm9tIGRpZmZlcmVudCBkcml2
ZXJzIC8gaW5zdGFuY2VzDQo+ICsgKiBAY2xrczogY2xvY2tzIGFzc29jaWF0ZWQgd2l0aCBzdGRv
dXQNCj4gKyAqIEBuX2Nsa3M6IG51bWJlciBvZiBjbG9ja3MgYXNzb2NpYXRlZCB3aXRoIHN0ZG91
dCAgKi8gc3RhdGljIHN0cnVjdA0KPiArb2ZfY2xrX3N0ZG91dF9jbGtzIHsNCj4gKwlib29sIGJ1
bXBfcmVmczsNCj4gKw0KPiArCXN0cnVjdCBtdXRleCBsb2NrOw0KPiArCWJvb2wgaGF2ZV9hbGw7
DQo+ICsJc3RydWN0IGNsayAqKmNsa3M7DQo+ICsJc2l6ZV90IG5fY2xrczsNCj4gK30gb2ZfY2xr
X3N0ZG91dF9jbGtzID0gew0KPiArCS5sb2NrID0gX19NVVRFWF9JTklUSUFMSVpFUihvZl9jbGtf
c3Rkb3V0X2Nsa3MubG9jayksDQo+ICt9Ow0KPiArDQo+ICtzdGF0aWMgaW50IF9faW5pdCBvZl9j
bGtfYnVtcF9zdGRvdXRfY2xvY2tzX3BhcmFtKGNoYXIgKnN0cikgew0KPiArCW9mX2Nsa19zdGRv
dXRfY2xrcy5idW1wX3JlZnMgPSB0cnVlOw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiArX19zZXR1
cCgiZWFybHljb24iLCBvZl9jbGtfYnVtcF9zdGRvdXRfY2xvY2tzX3BhcmFtKTsNCj4gK19fc2V0
dXBfcGFyYW0oImVhcmx5cHJpbnRrIiwgb2ZfY2xrX2tlZXBfc3Rkb3V0X2Nsb2Nrc19lYXJseXBy
aW50aywNCj4gKwkgICAgICBvZl9jbGtfYnVtcF9zdGRvdXRfY2xvY2tzX3BhcmFtLCAwKTsNCj4g
Kw0KPiArc3RhdGljIHZvaWQgb2ZfY2xrX2J1bXBfc3Rkb3V0X2Nsb2Nrcyh2b2lkKSB7DQo+ICsJ
c2l6ZV90IG5fY2xrczsNCj4gKw0KPiArCS8qDQo+ICsJICogV2Ugb25seSBuZWVkIHRvIHJ1biB0
aGlzIGNvZGUgaWYgcmVxdWlyZWQgdG8gZG8gc28gYW5kIG9ubHkNCj4gZXZlcg0KPiArCSAqIGJl
Zm9yZSBsYXRlIGluaXRjYWxscyBoYXZlIHJ1bi4gT3RoZXJ3aXNlIGl0J2QgYmUgaW1wb3NzaWJs
ZSB0bw0KPiBrbm93DQo+ICsJICogd2hlbiB0byBkcm9wIHRoZSBleHRyYSBjbG9jayByZWZlcmVu
Y2VzIGFnYWluLg0KPiArCSAqDQo+ICsJICogVGhpcyBnZW5lcmFsbHkgbWVhbnMgdGhhdCB0aGlz
IG9ubHkgd29ya3MgaWYgb24gYWZmZWN0ZWQNCj4gcGxhdGZvcm1zDQo+ICsJICogdGhlIGNsb2Nr
IGRyaXZlcnMgaGF2ZSBiZWVuIGJ1aWx0LWluIChhcyBvcHBvc2VkIHRvIGJlaW5nDQo+IG1vZHVs
ZXMpLg0KPiArCSAqLw0KPiArCWlmICghb2ZfY2xrX3N0ZG91dF9jbGtzLmJ1bXBfcmVmcykNCj4g
KwkJcmV0dXJuOw0KPiArDQo+ICsJbl9jbGtzID0gb2ZfY2xrX2dldF9wYXJlbnRfY291bnQob2Zf
c3Rkb3V0KTsNCj4gKwlpZiAoIW5fY2xrcyB8fCAhb2Zfc3Rkb3V0KQ0KPiArCQlyZXR1cm47DQo+
ICsNCj4gKwltdXRleF9sb2NrKCZvZl9jbGtfc3Rkb3V0X2Nsa3MubG9jayk7DQo+ICsNCj4gKwkv
Kg0KPiArCSAqIFdlIG9ubHkgbmVlZCB0byBrZWVwIHRyeWluZyBpZiB3ZSBoYXZlIG5vdCBzdWNj
ZWVkZWQNCj4gcHJldmlvdXNseSwNCj4gKwkgKiBpLmUuIGlmIG5vdCBhbGwgcmVxdWlyZWQgY2xv
Y2tzIHdlcmUgcmVhZHkgZHVyaW5nIHByZXZpb3VzDQo+IGF0dGVtcHRzLg0KPiArCSAqLw0KPiAr
CWlmIChvZl9jbGtfc3Rkb3V0X2Nsa3MuaGF2ZV9hbGwpDQo+ICsJCWdvdG8gb3V0X3VubG9jazsN
Cj4gKw0KPiArCWlmICghb2ZfY2xrX3N0ZG91dF9jbGtzLmNsa3MpIHsNCj4gKwkJb2ZfY2xrX3N0
ZG91dF9jbGtzLm5fY2xrcyA9IG5fY2xrczsNCj4gKw0KPiArCQlvZl9jbGtfc3Rkb3V0X2Nsa3Mu
Y2xrcyA9DQo+IGtjYWxsb2Mob2ZfY2xrX3N0ZG91dF9jbGtzLm5fY2xrcywNCj4gKw0KPiBzaXpl
b2YoKm9mX2Nsa19zdGRvdXRfY2xrcy5jbGtzKSwNCj4gKwkJCQkJICAgICAgR0ZQX0tFUk5FTCk7
DQo+ICsJCWlmICghb2ZfY2xrX3N0ZG91dF9jbGtzLmNsa3MpDQo+ICsJCQlnb3RvIG91dF91bmxv
Y2s7DQo+ICsJfQ0KPiArDQo+ICsJLyogYXNzdW1lIHRoYXQgdGhpcyB0aW1lIHdlJ2xsIGJlIGFi
bGUgdG8gZ3JhYiBhbGwgcmVxdWlyZWQNCj4gY2xvY2tzICovDQo+ICsJb2ZfY2xrX3N0ZG91dF9j
bGtzLmhhdmVfYWxsID0gdHJ1ZTsNCj4gKwlmb3IgKHNpemVfdCBpID0gMDsgaSA8IG5fY2xrczsg
KytpKSB7DQo+ICsJCXN0cnVjdCBjbGsgKmNsazsNCj4gKw0KPiArCQkvKiB3ZSBtaWdodCBoYXZl
IGdyYWJiZWQgdGhpcyBjbG9jayBpbiBhIHByZXZpb3VzDQo+IGF0dGVtcHQgKi8NCj4gKwkJaWYg
KG9mX2Nsa19zdGRvdXRfY2xrcy5jbGtzW2ldKQ0KPiArCQkJY29udGludWU7DQo+ICsNCj4gKwkJ
Y2xrID0gb2ZfY2xrX2dldChvZl9zdGRvdXQsIGkpOw0KPiArCQlpZiAoSVNfRVJSKGNsaykpIHsN
Cj4gKwkJCS8qIHJldHJ5IG5leHQgdGltZSBpZiBjbG9jayBoYXMgbm90IHByb2JlZCB5ZXQNCj4g
Ki8NCj4gKwkJCW9mX2Nsa19zdGRvdXRfY2xrcy5oYXZlX2FsbCA9IGZhbHNlOw0KPiArCQkJY29u
dGludWU7DQo+ICsJCX0NCj4gKw0KPiArCQlpZiAoY2xrX3ByZXBhcmVfZW5hYmxlKGNsaykpIHsN
Cj4gKwkJCWNsa19wdXQoY2xrKTsNCj4gKwkJCWNvbnRpbnVlOw0KPiArCQl9DQo+ICsJCW9mX2Ns
a19zdGRvdXRfY2xrcy5jbGtzW2ldID0gY2xrOw0KPiArCX0NCj4gKw0KPiArb3V0X3VubG9jazoN
Cj4gKwltdXRleF91bmxvY2soJm9mX2Nsa19zdGRvdXRfY2xrcy5sb2NrKTsNCj4gK30NCj4gKw0K
PiArc3RhdGljIGludCBfX2luaXQgb2ZfY2xrX2Ryb3Bfc3Rkb3V0X2Nsb2Nrcyh2b2lkKSB7DQo+
ICsJZm9yIChzaXplX3QgaSA9IDA7IGkgPCBvZl9jbGtfc3Rkb3V0X2Nsa3Mubl9jbGtzOyArK2kp
IHsNCj4gKwkJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKG9mX2Nsa19zdGRvdXRfY2xrcy5jbGtzW2ld
KTsNCj4gKwkJY2xrX3B1dChvZl9jbGtfc3Rkb3V0X2Nsa3MuY2xrc1tpXSk7DQo+ICsJfQ0KPiAr
DQo+ICsJa2ZyZWUob2ZfY2xrX3N0ZG91dF9jbGtzLmNsa3MpOw0KPiArDQo+ICsJLyoNCj4gKwkg
KiBEbyBub3QgdHJ5IHRvIGFjcXVpcmUgc3Rkb3V0IGNsb2NrcyBhZnRlciBsYXRlIGluaXRjYWxs
cywgZS5nLg0KPiArCSAqIGR1cmluZyBmdXJ0aGVyIG1vZHVsZSBsb2FkaW5nLCBhcyB3ZSB0aGVu
IHdvdWxkbid0IGhhdmUgYQ0KPiB3YXkgdG8NCj4gKwkgKiBkcm9wIHRoZSByZWZlcmVuY2VzIChh
bmQgYXNzb2NpYXRlZCBhbGxvY2F0aW9ucykgZXZlciBhZ2Fpbi4NCj4gKwkgKi8NCj4gKwlvZl9j
bGtfc3Rkb3V0X2Nsa3MuYnVtcF9yZWZzID0gZmFsc2U7DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4g
K30NCj4gK2xhdGVfaW5pdGNhbGxfc3luYyhvZl9jbGtfZHJvcF9zdGRvdXRfY2xvY2tzKTsNCg0K
SWYgdGhlIHVhcnQgZHJpdmVyIGlzIGJ1aWx0IGFzIG1vZHVsZSwgdGhpcyBtaWdodCBicmVhayBl
YXJseWNvbi4NCkJlZm9yZSB1YXJ0IGRyaXZlciBsb2FkZWQsIGNsayBkaXNhYmxlZCBwZXIgbXkg
dW5kZXJzdGFuZGluZy4NCg0KPiArDQo+ICAvKioNCj4gICAqIHN0cnVjdCBvZl9jbGtfcHJvdmlk
ZXIgLSBDbG9jayBwcm92aWRlciByZWdpc3RyYXRpb24gc3RydWN0dXJlDQo+ICAgKiBAbGluazog
RW50cnkgaW4gZ2xvYmFsIGxpc3Qgb2YgY2xvY2sgcHJvdmlkZXJzIEBAIC01MDMxLDYgKzUxNTYs
OA0KPiBAQCBpbnQgb2ZfY2xrX2FkZF9wcm92aWRlcihzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLA0K
PiANCj4gIAlmd25vZGVfZGV2X2luaXRpYWxpemVkKCZucC0+Zndub2RlLCB0cnVlKTsNCj4gDQo+
ICsJb2ZfY2xrX2J1bXBfc3Rkb3V0X2Nsb2NrcygpOw0KPiArDQo+ICAJcmV0dXJuIHJldDsNCj4g
IH0NCj4gIEVYUE9SVF9TWU1CT0xfR1BMKG9mX2Nsa19hZGRfcHJvdmlkZXIpOw0KPiBAQCAtNTA3
Myw2ICs1MjAwLDggQEAgaW50IG9mX2Nsa19hZGRfaHdfcHJvdmlkZXIoc3RydWN0DQo+IGRldmlj
ZV9ub2RlICpucCwNCj4gDQo+ICAJZndub2RlX2Rldl9pbml0aWFsaXplZCgmbnAtPmZ3bm9kZSwg
dHJ1ZSk7DQo+IA0KPiArCW9mX2Nsa19idW1wX3N0ZG91dF9jbG9ja3MoKTsNCg0KSWYgY2xvY2sg
ZHJpdmVyIGlzIGJ1aWx0IGFzIG1vZHVsZSwgIHRoZSB3aWxsIG1ha2UgdGhlDQpjbG9ja3Mgd2ls
bCBiZSBhbHdheXMgZW5hYmxlZCwgaWYgbXkgdW5kZXJzdGFuZGluZyBpcyBjb3JyZWN0Lg0KDQoN
ClJlZ2FyZHMsDQpQZW5nLg0KDQo+ICsNCj4gIAlyZXR1cm4gcmV0Ow0KPiAgfQ0KPiAgRVhQT1JU
X1NZTUJPTF9HUEwob2ZfY2xrX2FkZF9od19wcm92aWRlcik7DQo+IA0KPiAtLQ0KPiAyLjQ2LjAu
cmMyLjI2NC5nNTA5ZWQ3NmRjOC1nb29nDQoNCg==

