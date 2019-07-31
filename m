Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E049B7C50E
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 31 Jul 2019 16:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728410AbfGaOhu (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 31 Jul 2019 10:37:50 -0400
Received: from mail-eopbgr10079.outbound.protection.outlook.com ([40.107.1.79]:3046
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728012AbfGaOht (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 31 Jul 2019 10:37:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tl6rWn8LsL4bvn3WaozDz6Eg/P2ncA5yim6tCNg4q3o=;
 b=cRj2iM9YKtz/6yw27Ha9CaAWXFHd99tvbQbrZAZD9/1AnHdo1Tlqpp8Gt0LTbOZZty9yfXJ+HJ1K1swxijP2iZjx7VfkiF1zFVtrHRlAIwM4Pb2BHS3ytj/zdsRaA8fCvXP6tEltu3BJzTmj72t4qw4i10JgTl3QfvjdUte3iQg=
Received: from VI1PR0802CA0027.eurprd08.prod.outlook.com
 (2603:10a6:800:a9::13) by DB6PR0801MB1846.eurprd08.prod.outlook.com
 (2603:10a6:4:35::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.15; Wed, 31 Jul
 2019 14:37:43 +0000
Received: from DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::201) by VI1PR0802CA0027.outlook.office365.com
 (2603:10a6:800:a9::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2115.14 via Frontend
 Transport; Wed, 31 Jul 2019 14:37:43 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=temperror action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT042.mail.protection.outlook.com (10.152.21.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Wed, 31 Jul 2019 14:37:40 +0000
Received: ("Tessian outbound 40a263b748b4:v26"); Wed, 31 Jul 2019 14:37:40 +0000
X-CR-MTA-TID: 64aa7808
Received: from 1a02873923b9.1 (ip-172-16-0-2.eu-west-1.compute.internal [104.47.14.58])
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9340A4C3-3A02-4F1E-8D18-4A3DB2739420.1;
        Wed, 31 Jul 2019 14:37:35 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58])
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1a02873923b9.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 31 Jul 2019 14:37:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bYw46Y0flRO9KJlfBUv+JlhGXy24HXM42lC2y01hUWQtfiJ9sJqAhaR4WY6kPNzKw6H3STyhfKdW7DMYYIDIWKSAbrbdAHzDDeu4I9uy0Nj7Wu1imE6Y4ts9YJHZT8W/tVqv/RnzYPYKwWjf/vZqr6byxi49H/9MfUkimSaPQYkrWGlAwXtGlo+nNRhC1yHilGnrTa+1OrmLyn5ybQwYlmMjePPCpGMzbIYrAjbwlGhAmMaTqrPmVceBHrDelm+defmuMjan1n4Gnzd+F80Eub3ZkyhxtCdZB6thJevvJX+xRAoTkF1ECiNCuKS1jv7E0195Y1m/XD4jeyd7UJrBuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2yyV/JbufuPqu7AKQM3hDaz4iSaWXWI8ijGz6u4a4tM=;
 b=Xf97Fk0eLDOqp2sZIkwdSK46W8ucuLXyMUrpaJxWxXFKXR5xRHXFxIo1TWDNfZWlCaU6wMh6DZmjrmDdlMchEwgSsEIAuJHHh39Nvk7S6dCqKjmdifokjusLK2KNtvNh+HfTXG6Ry/L0cX/sC+f8iDAa/TGXXy/5wG0P64UwBjE43pO+3w8heVTWWOlKTAZsae4jDzH+QLlmdoc5i92LcfWakD4/uFlRrkm8VxShQxDA/2mFvUc7usmIrv8+PdlMMuh7jktrdhfLcr7GkBIqviltE6O1crumHDVs0tQ80GH9hwh+VstLmO7PLr4p0CgOPvvcFWV0Q9Ri2POZP1ZfeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2yyV/JbufuPqu7AKQM3hDaz4iSaWXWI8ijGz6u4a4tM=;
 b=HaeWuQT69UlPU94MTt/UrG+z2lD7+tjmD4yMM1lYjlDCvW33JtatzFGEjHWo+c7C16sP+OE+l+PQVYLYHPUbFIcVkA2FOl+MfMRaJI20iX5JBXwhlk/qOG3ziPsGPfoJFqUwAUrqFseZx4uGHBJ0JyVerapFm9LxEBolAdqxoDM=
Received: from DBBPR08MB4678.eurprd08.prod.outlook.com (10.255.78.151) by
 DBBPR08MB4362.eurprd08.prod.outlook.com (20.179.42.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.14; Wed, 31 Jul 2019 14:37:34 +0000
Received: from DBBPR08MB4678.eurprd08.prod.outlook.com
 ([fe80::604c:b27f:b6bb:6f96]) by DBBPR08MB4678.eurprd08.prod.outlook.com
 ([fe80::604c:b27f:b6bb:6f96%4]) with mapi id 15.20.2136.010; Wed, 31 Jul 2019
 14:37:34 +0000
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
Thread-Index: AQHVQsPd2Ory/uMusEic8k7RRdTNRabbMAoAgAABPkCAABGsAIAAAMlwgAFzwoCAB/sC4A==
Date:   Wed, 31 Jul 2019 14:37:33 +0000
Message-ID: <DBBPR08MB4678D2A9A042269A8934E84183DF0@DBBPR08MB4678.eurprd08.prod.outlook.com>
References: <20190724072008.6272-1-guillaume.gardet@free.fr>
 <20190725083433.6505-1-guillaume.gardet@arm.com>
 <CAJKOXPejSxxH5DJPyEHTt=VEOdVgiXOm1c3MKKir-qRxtDcLLA@mail.gmail.com>
 <DBBPR08MB4678546DF9EE76EE6427DBB783C10@DBBPR08MB4678.eurprd08.prod.outlook.com>
 <CAJKOXPdLd5C0FPwijGwTWW9t46exysdqgeb07txPhp-f_b5DFA@mail.gmail.com>
 <DBBPR08MB46788EBBB3BF3BB8C54FAD1283C10@DBBPR08MB4678.eurprd08.prod.outlook.com>
 <CAJKOXPevC8GN=te7ub5Voq=dfn2HgJBbb=niVdD-gtWDUsq3Ow@mail.gmail.com>
In-Reply-To: <CAJKOXPevC8GN=te7ub5Voq=dfn2HgJBbb=niVdD-gtWDUsq3Ow@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: ad7012e2-0d06-4c66-acc6-62e51f34eeb4.1
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Guillaume.Gardet@arm.com; 
x-originating-ip: [2a01:e0a:d7:1620:9c42:54a9:8a93:a8f1]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 5be910b9-c321-4efe-155f-08d715c4a40c
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DBBPR08MB4362;
X-MS-TrafficTypeDiagnostic: DBBPR08MB4362:|DB6PR0801MB1846:
X-Microsoft-Antispam-PRVS: <DB6PR0801MB1846A285A9B85F340DB5DF1A83DF0@DB6PR0801MB1846.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 011579F31F
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;SFS:(10009020)(4636009)(366004)(39860400002)(136003)(346002)(376002)(396003)(199004)(189003)(13464003)(66476007)(64756008)(66556008)(99286004)(186003)(6436002)(66946007)(102836004)(478600001)(66446008)(2906002)(52536014)(25786009)(74316002)(7736002)(76176011)(68736007)(305945005)(53546011)(4326008)(7696005)(486006)(6506007)(9686003)(476003)(8676002)(76116006)(46003)(5660300002)(33656002)(55016002)(229853002)(316002)(54906003)(11346002)(6916009)(53936002)(446003)(6246003)(8936002)(14454004)(81156014)(6116002)(81166006)(86362001)(71200400001)(71190400001)(256004);DIR:OUT;SFP:1101;SCL:1;SRVR:DBBPR08MB4362;H:DBBPR08MB4678.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: 8tL+ypk0khDvv/GVZ4o812012g42vL392cOVMH5C3z3KADYDw9C4kq8P4vXu3u7mZkRebOyyPosS1WWe4jhr1JdnIswKN+iT2L2OQbcpeItXtSxDoRnVux8F1j4/JyxqM4q5Ew+xEL6F50vERFnXmFLt4vx33qhBD3Lc7usxjviB3T/60UVKM0dwYMFHmEGRyWR8iRBJT4Eddn6dh71tSw5HguEqK93I+HOCf4B9hCjmlcJYHsNEhfdepAnVtcmgHFf7DCK9U2FnhJhZ4YXtrGmcT848F2mhM8JrK9fyoopxMPhcacdZJ49Ebn/IXFdTvacAjeM/jaCHu0yyTQkn36jCYoUdUIg7bBjsbdjj+cs96G87Yt21nttycTdjiGsVHaG+VAwiuqxv5j1us/fPi1n2dttCw+qKOwGx7UaW6nU=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4362
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guillaume.Gardet@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(396003)(376002)(346002)(136003)(39860400002)(2980300002)(40434004)(13464003)(189003)(199004)(4326008)(476003)(356004)(22756006)(7696005)(55016002)(74316002)(102836004)(2906002)(186003)(229853002)(63350400001)(9686003)(53546011)(8676002)(26005)(305945005)(33656002)(446003)(81166006)(5660300002)(6506007)(5024004)(23676004)(99286004)(2486003)(436003)(25786009)(11346002)(63370400001)(486006)(70586007)(76130400001)(7736002)(76176011)(52536014)(50466002)(81156014)(6862004)(316002)(26826003)(14444005)(8936002)(336012)(14454004)(6116002)(86362001)(54906003)(70206006)(126002)(107886003)(47776003)(478600001)(6246003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB6PR0801MB1846;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:TempError;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;MX:1;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2c67a4bc-d1ab-4634-f60a-08d715c4a01b
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DB6PR0801MB1846;
X-Forefront-PRVS: 011579F31F
X-Microsoft-Antispam-Message-Info: RFJa0Iay+h6FEL69HuK1Oq0zvKxHSQV5QQcqGMX2uVUy5qRKYMqbYG/loOKBCRj78kFTQSVwrHU2/nHYAGbcjgQonJHJtyHLBoT4Im3Gc1c+s9oBmfZaOLmbfSxE6eqwCAV7z88U2CfHan8dk3k/UhILL0TBTC8w4UEoNbyzzrrtSwOIf9uZLWR+qKFmvDfKOdsKAZ20pAQ24bAEQ+oJmUOZOiPTVzaB+rSjIgsygPoUNRx0lIYKb+vWrhDn1eU8QEWaVpTDdoVwjBanRsua/+l5cToOZkZSGtA8aWuikWmbSx5Ag9hNDvGufVWWhBNfg7xPriEj4YqbeaBGUimS+QpTmfVy7otZ38kbTtFmYnJr4WsSPJzRIg8r4VC+L0f1R2TzcwJAFARmOU3weD77KcME0QyJyjSoVqW8HQwdj3o=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2019 14:37:40.5692
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5be910b9-c321-4efe-155f-08d715c4a40c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1846
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiAyNiBKdWx5IDIwMTkgMTI6NDANCj4gVG86
IEd1aWxsYXVtZSBHYXJkZXQgPEd1aWxsYXVtZS5HYXJkZXRAYXJtLmNvbT4NCj4gQ2M6IGxpbnV4
LXNhbXN1bmctc29jQHZnZXIua2VybmVsLm9yZzsgS3VramluIEtpbSA8a2dlbmVAa2VybmVsLm9y
Zz47DQo+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIFYyIDEvMl0gYXJtOiBkdHM6IGV4eW5vczogQWRkIEdQVS9NYWxpIFQ2MDQgbm9k
ZSB0bw0KPiBleHlub3M1MjUwDQo+DQo+IE9uIFRodSwgMjUgSnVsIDIwMTkgYXQgMTQ6MzcsIEd1
aWxsYXVtZSBHYXJkZXQgPEd1aWxsYXVtZS5HYXJkZXRAYXJtLmNvbT4NCj4gd3JvdGU6DQo+ID4g
PiBObywgcmVndWxhdG9yIGlzIG5vdCBwcm92aWRlZC4gT24gYWxsIEV4eW5vcyBib2FyZHMgTWFs
aSB1c2VzIGl0cw0KPiA+ID4gb3duIGRlZGljYXRlZCByZWd1bGF0b3IgKGFuZCBzb21ldGltZXMg
YWRkaXRpb25hbCBvbmUpLiBJdCB3b3JrZWQgaW4NCj4gPiA+IHlvdXIgY2FzZSBiZWNhdXNlIHRo
ZSByZWd1bGF0b3Igd2FzIHNldCBhcyBhbHdheXMtb24gYnV0IHRoaXMgaXMgYQ0KPiB3b3JrYXJv
dW5kIGZvciBsYWNrIG9mIGNvbnN1bWVycy4NCj4gPiA+IE9uY2UgdGhlcmUgaXMgYSBjb25zdW1l
ciwgdGhlIHJlZ3VsYXRvciBzaG91bGQgbm90IGJlIGFsd2F5cy1vbiB0bw0KPiA+ID4gc2F2ZSB0
aGUgZW5lcmd5IHdoZW4gbm90IHVzZWQuDQo+ID4NCj4gPiBJIGRvIG5vdCBoYXZlIHRoZSByZXF1
aXJlZCBpbmZvIGhlcmUuIERvIHlvdSBoYXZlIGl0LCBvciBjb3VsZCBJIHNraXAgdGhlDQo+IG1h
bGktc3VwcGx5IGZvciBub3c/DQo+DQo+IFlvdSBjYW4gZ3Vlc3MgZnJvbSByZWd1bGF0b3IgbmFt
ZSA6KQ0KPiBGb3IgdGhlIEFybmRhbGUsIHRoZSBzY2hlbWF0aWNzIGFyZSBzYXlpbmcgaXQgaXMg
YnVjazQuDQoNClRoYW5rcy4gVGhpcyBpcyBidWNrNCBhcyB3ZWxsIGZvciBzbm93Lg0KDQpPbiBB
cm5kYWxlIGJvYXJkLCBidWNrNCBoYXMgYSBmaXhlZCB2b2x0YWdlIG9mIDFWIGNvbnRyYXJ5IHRv
IHNub3csIHdoaWNoIGxlYWRzIHRvIHRoZSBmb2xsb3dpbmcgZXJyb3I6DQpbICAgMjEuMTMxOTMw
XSBwYW5mcm9zdCAxMTgwMDAwMC5ncHU6IENhbm5vdCBzZXQgdm9sdGFnZSA5MjUwMDAgdVYNCg0K
VGhlIGZvbGxvd2luZyBjaGFuZ2UgZml4ZXMgdGhlIHByZXZpb3VzIGVycm9yOg0KLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICByZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwxMDAwMDAw
PjsNCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVndWxhdG9yLW1heC1taWNyb3Zv
bHQgPSA8MTAwMDAwMD47DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZ3VsYXRv
ci1taW4tbWljcm92b2x0ID0gPDg1MDAwMD47DQorICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDEzMDAwMDA+Ow0KDQpTaG91bGQgSSByZW1v
dmUgYXJuZGFsZSBlbmFibGVtZW50IGZvciBub3cgdW50aWwgdGhpcyBpcyBmaXhlZCBzZXBhcmF0
ZWx5LCBvciBjb3VsZCBJIGFkZCB0aGlzIGZpeHVwIGluIHRoaXMgcGF0Y2ggc2VyaWUsIGFzIGl0
IGlzIHJlbGF0ZWQ/DQoNClJlZ2FyZHMsDQpHdWlsbGF1bWUNCg0KDQo+DQo+IEJlc3QgcmVnYXJk
cywNCj4gS3J6eXN6dG9mDQpJTVBPUlRBTlQgTk9USUNFOiBUaGUgY29udGVudHMgb2YgdGhpcyBl
bWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIGFyZSBjb25maWRlbnRpYWwgYW5kIG1heSBhbHNvIGJl
IHByaXZpbGVnZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIHBsZWFz
ZSBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseSBhbmQgZG8gbm90IGRpc2Nsb3NlIHRoZSBj
b250ZW50cyB0byBhbnkgb3RoZXIgcGVyc29uLCB1c2UgaXQgZm9yIGFueSBwdXJwb3NlLCBvciBz
dG9yZSBvciBjb3B5IHRoZSBpbmZvcm1hdGlvbiBpbiBhbnkgbWVkaXVtLiBUaGFuayB5b3UuDQo=
