Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1292874E3D
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 25 Jul 2019 14:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387994AbfGYMhw (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 25 Jul 2019 08:37:52 -0400
Received: from mail-eopbgr130087.outbound.protection.outlook.com ([40.107.13.87]:34386
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387879AbfGYMhv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 25 Jul 2019 08:37:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZlwf1hXVkhQMBZrWBDpxQjC3Q8TyWh1RJy/zd/m02o=;
 b=XhjuyrA/Wy4NGdamLojkRxq8B2kgUHT7I+0udWAc1OsDYoFC73dY8yJwABlwP5q2Mb3epsnsCPVINNvmqOkAo+qFZCjfmOlbxQ77SUfzh6WBvFkNYR87WD+hFsUER6gjB7CibxwEtk2+p9PHWjHRKXGZQIydj6BuSG0KoqiBC0s=
Received: from DB7PR08CA0033.eurprd08.prod.outlook.com (2603:10a6:5:16::46) by
 VE1PR08MB4959.eurprd08.prod.outlook.com (2603:10a6:803:110::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.10; Thu, 25 Jul
 2019 12:37:41 +0000
Received: from DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::202) by DB7PR08CA0033.outlook.office365.com
 (2603:10a6:5:16::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2094.15 via Frontend
 Transport; Thu, 25 Jul 2019 12:37:41 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=temperror action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT056.mail.protection.outlook.com (10.152.21.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 25 Jul 2019 12:37:40 +0000
Received: ("Tessian outbound cc8a947d4660:v26"); Thu, 25 Jul 2019 12:37:40 +0000
X-CR-MTA-TID: 64aa7808
Received: from e450f2cfdf6b.1 (ip-172-16-0-2.eu-west-1.compute.internal [104.47.10.59])
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4C744644-F8E4-4160-AB4D-3D9D79FC1177.1;
        Thu, 25 Jul 2019 12:37:35 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (mail-db5eur03lp2059.outbound.protection.outlook.com [104.47.10.59])
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e450f2cfdf6b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 25 Jul 2019 12:37:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SvJ0/6/87f3zy0yU+m6aDjDm82fEJbp7OBdja+Vl20Dhf8zXTVScruvyTPtgeYrQJGEzh8j7RSVsZN5LNrZyRdnyN23XqMIIjEhqGNcEk2fgXZp/yzQXidyBv7QlJJ9YFtMgX+DGeMhDUPKLN3FPY/fnSTld6MXkmG+R1h1b189NHJ723urZ3/46Tp/CePJ7Hi6cepGGoaoc467oh0A09lO2YN2EB4gg5pimQjfqiXCTXVzXChoOISyM9xglbIKsKKici4bQzkPcqQ6AHpqpSKWemfXKdDiD/qxYr2tp8DAUwTWp+ELZMpRI5W7rNmYybpQcEoByQP3cYm4XUf9wNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6ici73WRQ6aapnfN0pN82kcI3W4UvYYYG4IohtpfwA=;
 b=dSzQ4RVUWSGkZLr1ckSkSm1LglvnvbTjY9XGvCTvNXXsN/Ddw2fcwrAYuAp8I/ZgCU7Hs0cW0BUAoxSoFWoFJSA9QX2dYkkHhXf35eu6v1Bs9AzsmWuXUFjyAoYAm7W9MKdkXBxJwDdESQVLQp+cPdll4BJ9N9W+heDhp52+2TBDN9CoesmxgWxoYT3ltbIeA7oxH5HpSQSG5Zu+ayGeJu21JpDQVqBkBCxmlzG9B9Ju6vkp3NHi2YfuftJBMbsEcN/WOnRNsKSuJ9DpTeNX0vrjrsPa4YU49Ie3iRph55ULWCbRyTRUq9+mF47YL+iOKHRFR+HLF+QLil+w/oeDGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6ici73WRQ6aapnfN0pN82kcI3W4UvYYYG4IohtpfwA=;
 b=OXAn7QhW5siQJlUGKigv6hGsqW2VHRNCBcas+UlVZz69xDcAyaCAkPHf062Sjf6JmTddkqMnLWcryIIwhJ8sx12zNFcJR5HAtJkEW+QMHduTIS2dCQdnuNA0rQTZoaBf6mNkZZ67U97hCazNaQhfuxqyyc2p7JDmPKUd8SrVRos=
Received: from DBBPR08MB4678.eurprd08.prod.outlook.com (10.255.78.151) by
 DBBPR08MB4315.eurprd08.prod.outlook.com (20.179.41.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.11; Thu, 25 Jul 2019 12:37:34 +0000
Received: from DBBPR08MB4678.eurprd08.prod.outlook.com
 ([fe80::604c:b27f:b6bb:6f96]) by DBBPR08MB4678.eurprd08.prod.outlook.com
 ([fe80::604c:b27f:b6bb:6f96%4]) with mapi id 15.20.2115.005; Thu, 25 Jul 2019
 12:37:33 +0000
From:   Guillaume Gardet <Guillaume.Gardet@arm.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
CC:     "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH V2 1/2] arm: dts: exynos: Add GPU/Mali T604 node to
 exynos5250
Thread-Topic: [PATCH V2 1/2] arm: dts: exynos: Add GPU/Mali T604 node to
 exynos5250
Thread-Index: AQHVQsPd2Ory/uMusEic8k7RRdTNRabbMAoAgAABPkCAABGsAIAAAMlw
Date:   Thu, 25 Jul 2019 12:37:33 +0000
Message-ID: <DBBPR08MB46788EBBB3BF3BB8C54FAD1283C10@DBBPR08MB4678.eurprd08.prod.outlook.com>
References: <20190724072008.6272-1-guillaume.gardet@free.fr>
 <20190725083433.6505-1-guillaume.gardet@arm.com>
 <CAJKOXPejSxxH5DJPyEHTt=VEOdVgiXOm1c3MKKir-qRxtDcLLA@mail.gmail.com>
 <DBBPR08MB4678546DF9EE76EE6427DBB783C10@DBBPR08MB4678.eurprd08.prod.outlook.com>
 <CAJKOXPdLd5C0FPwijGwTWW9t46exysdqgeb07txPhp-f_b5DFA@mail.gmail.com>
In-Reply-To: <CAJKOXPdLd5C0FPwijGwTWW9t46exysdqgeb07txPhp-f_b5DFA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 9ca59ba5-3caf-476b-9730-0c4adda7ef52.1
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Guillaume.Gardet@arm.com; 
x-originating-ip: [2a01:e0a:d7:1620:a088:a1e8:d605:49de]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 0e9e0397-0630-47f0-79b1-08d710fce1c5
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DBBPR08MB4315;
X-MS-TrafficTypeDiagnostic: DBBPR08MB4315:|VE1PR08MB4959:
X-MS-Exchange-PUrlCount: 2
X-Microsoft-Antispam-PRVS: <VE1PR08MB49597D9BCC85CA007904C8C483C10@VE1PR08MB4959.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 0109D382B0
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(189003)(199004)(13464003)(46003)(74316002)(478600001)(486006)(2906002)(476003)(446003)(76176011)(256004)(229853002)(6246003)(305945005)(7736002)(71200400001)(71190400001)(14444005)(11346002)(6436002)(81156014)(53546011)(6506007)(7696005)(66946007)(66476007)(64756008)(66556008)(76116006)(4326008)(54906003)(81166006)(6116002)(99286004)(8936002)(14454004)(186003)(25786009)(86362001)(6916009)(102836004)(66446008)(5660300002)(33656002)(966005)(316002)(52536014)(55016002)(68736007)(8676002)(9686003)(6306002)(53936002);DIR:OUT;SFP:1101;SCL:1;SRVR:DBBPR08MB4315;H:DBBPR08MB4678.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: qBcMaK0aV4tKVM4Z/TIJJRel36kUeXDPITxPWTBbg8gU0KxfTVF4AaSqFq8qy+0QYgnMYQJUvfwkjO27Ei4tkNRe0VvNHX+tWv8G7HvoIZngYaSCXdD7/ucomqNCtfeVyltOpyzUtWigy9SIZ1ODBg8URvbt1INWch17NeBtz/WjFT8LWnny5/GHbtwqejejmYIoSQ0umxm6FMEba5YXfotlx+ued9NvPvpckgu/iAM81XGgfveAsI4J4NNlKJEAXS9ue9uDa7Zjwx6I+GHloopn94nnoY+KU+su0CyOZd1dsz0BA3vfRhDNYFn3BrkhZMssclt6aZmotDRUqcA0ach8I3x7Aj/tIQ3SMAOXWCOwxP3EnfZELLwYBmhC6GMpLuk+edcvhXytw7LzEoSlcQZT8gsyikVysNv9wz81b/Y=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4315
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guillaume.Gardet@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(396003)(39860400002)(376002)(136003)(346002)(2980300002)(13464003)(199004)(189003)(40434004)(4326008)(47776003)(6862004)(229853002)(7736002)(63370400001)(11346002)(966005)(446003)(486006)(126002)(81156014)(8676002)(14444005)(52536014)(5660300002)(81166006)(5024004)(336012)(14454004)(86362001)(50466002)(74316002)(478600001)(6246003)(316002)(26826003)(107886003)(76130400001)(25786009)(305945005)(22756006)(8936002)(9686003)(356004)(55016002)(6306002)(186003)(102836004)(2906002)(436003)(26005)(63350400001)(99286004)(7696005)(23676004)(54906003)(76176011)(2486003)(476003)(6506007)(70206006)(33656002)(6116002)(53546011)(70586007);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR08MB4959;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:TempError;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;MX:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: ee37060e-b2ac-43eb-5189-08d710fcde14
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:VE1PR08MB4959;
X-Forefront-PRVS: 0109D382B0
X-Microsoft-Antispam-Message-Info: lFZGFrvLroAmgSw3+cmdS9a/W1CMUn3aOhh4bum35hCpinmvOfTZidNucmKV9jtftQL9ib1zsHMHt5jvAj9vxq58oKVYLtzLMCiFaewQZBqfjtt8N/SFhAtG6X2G6na7qrBlAxGcoB05pBYYbaK3flWexSFYUW3uE3Oulu3qz9up6IM4h1hxby4aXUDHuyPEdBiG8ZaVxfQuLaup9kt3zp2eQykf4PJk6qgc+91LpcKq4xIo53vcKd/T4wuphe/RbCTFc4NStfTu5ptMhYQXXb6wZ6yUGRBXieAE5495NoIdQgkE2bakxnuSmER6LHRuyb+0cb9r91tdMhnNchkTEUYtBD0Jr+NJYF9g+/XtyMYoy90XtTEXDotD/KT4LLhe/9BKDyiuywpDyyqnUH7gW+m3or0+VB+JLI7nkiLbt+8=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2019 12:37:40.1282
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e9e0397-0630-47f0-79b1-08d710fce1c5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4959
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiAyNSBKdWx5IDIwMTkgMTQ6MjcNCj4gVG86
IEd1aWxsYXVtZSBHYXJkZXQgPEd1aWxsYXVtZS5HYXJkZXRAYXJtLmNvbT4NCj4gQ2M6IGxpbnV4
LXNhbXN1bmctc29jQHZnZXIua2VybmVsLm9yZzsgS3VramluIEtpbSA8a2dlbmVAa2VybmVsLm9y
Zz47IGxpbnV4LQ0KPiBhcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gU3ViamVjdDog
UmU6IFtQQVRDSCBWMiAxLzJdIGFybTogZHRzOiBleHlub3M6IEFkZCBHUFUvTWFsaSBUNjA0IG5v
ZGUgdG8NCj4gZXh5bm9zNTI1MA0KPg0KPiBPbiBUaHUsIDI1IEp1bCAyMDE5IGF0IDEzOjM1LCBH
dWlsbGF1bWUgR2FyZGV0IDxHdWlsbGF1bWUuR2FyZGV0QGFybS5jb20+DQo+IHdyb3RlOg0KPiA+
DQo+ID4NCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206
IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4NCj4gPiA+IFNlbnQ6IDI1IEp1
bHkgMjAxOSAxMzoxOQ0KPiA+ID4gVG86IEd1aWxsYXVtZSBHYXJkZXQgPEd1aWxsYXVtZS5HYXJk
ZXRAYXJtLmNvbT4NCj4gPiA+IENjOiBsaW51eC1zYW1zdW5nLXNvY0B2Z2VyLmtlcm5lbC5vcmc7
IEt1a2ppbiBLaW0NCj4gPiA+IDxrZ2VuZUBrZXJuZWwub3JnPjsgbGludXgtIGFybS1rZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZw0KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCBWMiAxLzJdIGFy
bTogZHRzOiBleHlub3M6IEFkZCBHUFUvTWFsaSBUNjA0IG5vZGUNCj4gPiA+IHRvDQo+ID4gPiBl
eHlub3M1MjUwDQo+ID4gPg0KPiA+ID4gT24gVGh1LCAyNSBKdWwgMjAxOSBhdCAxMDozNCwgR3Vp
bGxhdW1lIDxndWlsbGF1bWUuZ2FyZGV0QGFybS5jb20+DQo+IHdyb3RlOg0KPiA+ID4gPg0KPiA+
ID4gPiBGcm9tOiBHdWlsbGF1bWUgR0FSREVUIDxndWlsbGF1bWUuZ2FyZGV0QGFybS5jb20+DQo+
ID4gPiA+DQo+ID4gPiA+IEFkZCBub2RlcyBmb3IgR1BVIChNYWxpIFQ2MDQpIHRvIEV4eW5vczUy
NTAuDQo+ID4gPiA+IFRlc3RlZCB3aXRoIGttc2N1YmUgYW5kIGdsbWFyazItZXMyLWRybSBvbiBD
aHJvbWVib29rIHNub3cuDQo+ID4gPiA+IExvYWQgdGVzdGVkIG9uIGFybmRhbGUgYm9hcmQuDQo+
ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEd1aWxsYXVtZSBHQVJERVQgPGd1aWxsYXVt
ZS5nYXJkZXRAYXJtLmNvbT4NCj4gPiA+ID4NCj4gPiA+ID4gQ2M6IEt1a2ppbiBLaW0gPGtnZW5l
QGtlcm5lbC5vcmc+DQo+ID4gPiA+IENjOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5l
bC5vcmc+DQo+ID4gPiA+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcN
Cj4gPiA+ID4gLS0tDQo+ID4gPiA+IFYyIGNoYW5nZXM6DQo+ID4gPiA+ICAgKiBtb3ZlIG1hbGkg
bm9kZSBhcyAvc29jIHN1Yi1ub2RlDQo+ID4gPiA+ICAgKiBtb3ZlIGdwdV9vcHBfdGFibGUgYXMg
bWFsaSBzdWItbm9kZQ0KPiA+ID4gPiAgICogbWlub3Igc3R5bGUgdXBkYXRlcw0KPiA+ID4gPiAg
ICogdGVzdCBvbiBhcm5kYWxlIGJvYXJkDQo+ID4gPiA+ICAgKiBlbmFibGUgYnkgZGVmYXVsdA0K
PiA+ID4NCj4gPiA+IEkgd2FzIG5vdCBzcGVjaWZpYyBlbm91Z2guIEl0IGNhbiBzdGF5IGRpc2Fi
bGVkIGluIHRoZSBEVFNJIGJlY2F1c2UNCj4gPiA+IG5vdCBhbGwgcmVzb3VyY2VzIGFyZSBwcm92
aWRlZC4gVGhlIGJvYXJkIERUU2VzIChhbGwgb3Igb25lcyB3aGljaA0KPiA+ID4gYXJlDQo+ID4g
PiB0ZXN0ZWQpIHdpbGwgZW5hYmxlIGl0IGFuZCBwcm92aWRlIG1pc3NpbmcgcmVzb3VyY2VzIC0g
bWFsaS1zdXBwbHkuDQo+ID4NCj4gPiBJIHRoaW5rIGFsbCByZXNvdXJjZXMgYXJlIHByb3ZpZGVk
LCBzaW5jZSBubyBtYWxpLXN1cHBseSBwcm9wZXJ0eSBpcyBuZWVkZWQgaGVyZS4NCj4NCj4gTm8s
IHJlZ3VsYXRvciBpcyBub3QgcHJvdmlkZWQuIE9uIGFsbCBFeHlub3MgYm9hcmRzIE1hbGkgdXNl
cyBpdHMgb3duIGRlZGljYXRlZA0KPiByZWd1bGF0b3IgKGFuZCBzb21ldGltZXMgYWRkaXRpb25h
bCBvbmUpLiBJdCB3b3JrZWQgaW4geW91ciBjYXNlIGJlY2F1c2UgdGhlDQo+IHJlZ3VsYXRvciB3
YXMgc2V0IGFzIGFsd2F5cy1vbiBidXQgdGhpcyBpcyBhIHdvcmthcm91bmQgZm9yIGxhY2sgb2Yg
Y29uc3VtZXJzLg0KPiBPbmNlIHRoZXJlIGlzIGEgY29uc3VtZXIsIHRoZSByZWd1bGF0b3Igc2hv
dWxkIG5vdCBiZSBhbHdheXMtb24gdG8gc2F2ZSB0aGUNCj4gZW5lcmd5IHdoZW4gbm90IHVzZWQu
DQoNCkkgZG8gbm90IGhhdmUgdGhlIHJlcXVpcmVkIGluZm8gaGVyZS4gRG8geW91IGhhdmUgaXQs
IG9yIGNvdWxkIEkgc2tpcCB0aGUgbWFsaS1zdXBwbHkgZm9yIG5vdz8NCg0KPg0KPiA+IFNvLCBJ
IGNhbiBlaXRoZXIgZW5hYmxlIGl0IGJ5IGRlZmF1bHQgZm9yIGFsbCBleHlub3M1MjUwIHBsYXRm
b3JtcyB0aGVyZSwgb3IgSSBjYW4NCj4gZW5hYmxlIGl0IG9ubHkgZm9yIEFybmRhbGUgYm9hcmQg
YW5kIENocm9tZWJvb2sgc25vdy4gV2hhdCBkbyB5b3UgcHJlZmVyPw0KPg0KPiBUaGVuIHBsZWFz
ZSBlbmFibGUgaXQgb24gdGVzdGVkIHBsYXRmb3Jtcy4NCg0KT2suDQoNCj4NCj4gPg0KPiA+ID4g
SnVzdCBsaWtlOg0KPiA+ID4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2MNCj4gPiA+IG9tbWl0Lz9pZD1mDQo+ID4gPiAw
YTYyMDhiOTBiZGQ0NGY0OGY1NzE4YzhiYjBlYjFlNzYzZDE0YzANCj4gPiA+DQo+ID4gPiA+ICAg
KiBhZGQgZHQgYmluZGluZ3MsIGluIGEgc2VwYXJhdGUgcGF0Y2gNCj4gPiA+DQo+ID4gPiBQdXQg
dGhlIGJpbmRpbmdzIGJlZm9yZSBEVFMgY2hhbmdlLg0KPiA+DQo+ID4gWWVzLCBtYWtlcyBzZW5z
ZS4NCj4gPg0KPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gIGFyY2gvYXJtL2Jvb3QvZHRzL2V4eW5v
czUyNTAuZHRzaSB8IDQ3DQo+ID4gPiA+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysN
Cj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCspDQo+ID4gPiA+DQo+ID4g
PiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9leHlub3M1MjUwLmR0c2kNCj4gPiA+
ID4gYi9hcmNoL2FybS9ib290L2R0cy9leHlub3M1MjUwLmR0c2kNCj4gPiA+ID4gaW5kZXggZDVl
MDM5MmI0MDllLi5mN2YzNGQ0NjliZGUgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2FyY2gvYXJtL2Jv
b3QvZHRzL2V4eW5vczUyNTAuZHRzaQ0KPiA+ID4gPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9l
eHlub3M1MjUwLmR0c2kNCj4gPiA+ID4gQEAgLTMyOCw2ICszMjgsNTIgQEANCj4gPiA+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgaW9tbXVzID0gPCZzeXNtbXVfcm90YXRvcj47DQo+ID4gPiA+
ICAgICAgICAgICAgICAgICB9Ow0KPiA+ID4gPg0KPiA+ID4gPiArICAgICAgICAgICAgICAgbWFs
aTogZ3B1QDExODAwMDAwIHsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0
aWJsZSA9ICJzYW1zdW5nLGV4eW5vczUyNTAtbWFsaSIsICJhcm0sbWFsaS10NjA0IjsNCj4gPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MTE4MDAwMDAgMHg1MDAwPjsNCj4g
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDExOCBJ
UlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDxHSUNfU1BJIDExOSBJUlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4gPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxHSUNfU1BJIDExNyBJUlFfVFlQRV9M
RVZFTF9ISUdIPjsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0LW5h
bWVzID0gImpvYiIsICJtbXUiLCAiZ3B1IjsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgY2xvY2tzID0gPCZjbG9jayBDTEtfRzNEPjsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgY2xvY2stbmFtZXMgPSAiZzNkIjsNCj4gPiA+DQo+ID4gPiBBY2NvcmRpbmcgdG8gYmlu
ZGluZ3MgdGhpcyBpcyBub3QgcHJvcGVyIGNsb2NrIG5hbWUuIEkgd29uZGVyIHdoeSBpdA0KPiA+
ID4gd2FzIHdvcmtpbmcuLi4gaXQgc2VlbXMgdGhlIGRyaXZlciBleHBlY3RzIGZpcnN0IGNsb2Nr
IHRvIGJlIGFsd2F5cyB0aGUgY29yZQ0KPiBjbG9jay4NCj4gPg0KPiA+IFllcywgaXQgd29ya3Ms
IGJlY2F1c2UgMXN0IGNsb2NrIGlzIGFzc3VtZWQgdG8gYmUgdGhlIGNvcmUgY2xvY2suDQo+ID4g
Q2xvY2sgbmFtZXMgYXJlIG9wdGlvbmFsIGFuZCBjb3VsZCBiZSBvbWl0dGVkIGFzIGluDQo+ID4g
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMv
bGludXguZ2l0L3RyZQ0KPiA+IGUvYXJjaC9hcm0vYm9vdC9kdHMvcmszMjg4LmR0c2k/aD12NS4z
LXJjMSNuMTI4NA0KPiA+IE5vdCBzdXJlIGlmIGl0IHdvdWxkIGJlIGJldHRlciB0byByZW5hbWUg
aXQgdG8gJ2NvcmUnLCBvciAganVzdCBza2lwIGl0PyBBbnkgb3Bpbmlvbj8NCj4NCj4gVGhlIGRy
aXZlciBjYW4gY2hhbmdlIGFueXRpbWUgYW5kIGl0IG1pZ2h0IGxvb2sgZm9yICJjb3JlIiBzbyBE
VFMgc2hvdWxkIGZvbGxvdw0KPiB0aGUgYmluZGluZ3MuIEFkZGl0aW9uYWxseSwgUGFuZnJvc3Qg
bWlnaHQgYmVoYXZlIGRpZmZlcmVudGx5IHRoYW4gQXJtIGRyaXZlci4gU28NCj4gImNvcmUiIHBs
ZWFzZS4NCg0KT2suDQoNClRoYW5rcywNCkd1aWxsYXVtZQ0KDQo+DQo+IEJlc3QgcmVnYXJkcywN
Cj4gS3J6eXN6dG9mDQpJTVBPUlRBTlQgTk9USUNFOiBUaGUgY29udGVudHMgb2YgdGhpcyBlbWFp
bCBhbmQgYW55IGF0dGFjaG1lbnRzIGFyZSBjb25maWRlbnRpYWwgYW5kIG1heSBhbHNvIGJlIHBy
aXZpbGVnZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIHBsZWFzZSBu
b3RpZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseSBhbmQgZG8gbm90IGRpc2Nsb3NlIHRoZSBjb250
ZW50cyB0byBhbnkgb3RoZXIgcGVyc29uLCB1c2UgaXQgZm9yIGFueSBwdXJwb3NlLCBvciBzdG9y
ZSBvciBjb3B5IHRoZSBpbmZvcm1hdGlvbiBpbiBhbnkgbWVkaXVtLiBUaGFuayB5b3UuDQo=
