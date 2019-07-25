Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92D9674D2C
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 25 Jul 2019 13:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391971AbfGYLfu (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 25 Jul 2019 07:35:50 -0400
Received: from mail-eopbgr10044.outbound.protection.outlook.com ([40.107.1.44]:39042
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2391976AbfGYLft (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 25 Jul 2019 07:35:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPLPZHbswebneZpYR7tUOaXhakSlgF8HIGmqvp3+a9Y=;
 b=VgHoPOW3P41m3qJWEmTv0DR5UlmPDUNKCyS/cTU+pfLP7+oOCr7hsi4mD1ibL7wkmpa2x2Fzf8LM4GNYilDN2poFw5beGtzMyVzieSO1mx5V0oVq4DdlBnM6TnyVjmk3KfV9fxfWaFymO4K1PpZLageTy+J3DKXjSBkCwNX1mxQ=
Received: from DB6PR0802CA0045.eurprd08.prod.outlook.com (2603:10a6:4:a3::31)
 by HE1PR0802MB2603.eurprd08.prod.outlook.com (2603:10a6:3:e0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16; Thu, 25 Jul
 2019 11:35:41 +0000
Received: from AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::203) by DB6PR0802CA0045.outlook.office365.com
 (2603:10a6:4:a3::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2094.15 via Frontend
 Transport; Thu, 25 Jul 2019 11:35:40 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=temperror action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT038.mail.protection.outlook.com (10.152.17.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 25 Jul 2019 11:35:39 +0000
Received: ("Tessian outbound 1e6e633a5b56:v26"); Thu, 25 Jul 2019 11:35:39 +0000
X-CR-MTA-TID: 64aa7808
Received: from 586fe86e435c.1 (ip-172-16-0-2.eu-west-1.compute.internal [104.47.4.57])
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 37EA1FD9-D6C1-4EF1-85C3-0BA5AA661F31.1;
        Thu, 25 Jul 2019 11:35:34 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-am5eur02lp2057.outbound.protection.outlook.com [104.47.4.57])
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 586fe86e435c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 25 Jul 2019 11:35:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbwLIH7xwrSaAjFar9s1lbn/XE+PB6aPOdnuDvYJQtLc8/aJKRfzLBLA/fkV5JxkDRNGSba41JkxrqeKVoxSsZNLHCko6D3pXYYgZAdwyQAdwKpR/bIAcryG6jcS7ufAeURYqi7Xp2z1G7GOyfC04Fx6Suppt+KN/phyejN+j0DuWtl1P2XqFJ6X25jGofIvszhrN+LdeAYOwD6t0u2eZ18KXuyI1ZJrzvvEwwUn3mF2ETctLLTyajfl60BeNM5Tl3QXhb6HLynxQPlc1WYxFEmYnkyA9TjW4iPhQ+lqkKeP2sJ8yhJC7UmLaMns9a+xNErBm57XXtjQP1XdBvUhng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tlaojCevQ+oD0BSnnu8LsnmbYk/RnABLQb+DuWJMqIM=;
 b=nawg+5ftOB0vRUL3TXhJHXsIaiL2IrN0BsVpl8gXW9ergvcxegn0pCUXlZl21Og9/62Thoi0Q2qnaQlP24VtS+wZlkCWDyyEfc38aZFuPmohrou5ZVZE9DF/9hss5K6oUfSz2IQ8ygrc4rKr7QULgSivswEy4qxMf3zDCIT1ZrJgas5KbidxqfkMwEyVS6HWNCJ/EDoq/BLVi1JAfEcHVprGwu0Btl1QZxrV3RSypoSFpgeQyq98Nf30nKBZJRCrUszYzgafNBEOmM4SU6jO6zVyz75q3NMAcsbj0jmiQthhh54EZyaBKLFGes0pIoh6Y+mzhuRpEYdCbikg8Fzk3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tlaojCevQ+oD0BSnnu8LsnmbYk/RnABLQb+DuWJMqIM=;
 b=X6rfyIU8QkwqE5g2Rc2f26Z1XKm1zKBEwPyfSsQUfrXvxw5VzoxLQh2WxaS4kQFRHLPfN2Inktll8sl7R5EcfNNwwTwKNWBj9QNVfZdCiVS+hdFerlO6IMrnVcFZk0uNnWmuaMqAWaaRN+I6VemUE1gm+FwrUc0QJe5IV6bbCX0=
Received: from DBBPR08MB4678.eurprd08.prod.outlook.com (10.255.78.151) by
 DBBPR08MB4394.eurprd08.prod.outlook.com (20.179.42.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Thu, 25 Jul 2019 11:35:33 +0000
Received: from DBBPR08MB4678.eurprd08.prod.outlook.com
 ([fe80::604c:b27f:b6bb:6f96]) by DBBPR08MB4678.eurprd08.prod.outlook.com
 ([fe80::604c:b27f:b6bb:6f96%4]) with mapi id 15.20.2115.005; Thu, 25 Jul 2019
 11:35:33 +0000
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
Thread-Index: AQHVQsPd2Ory/uMusEic8k7RRdTNRabbMAoAgAABPkA=
Date:   Thu, 25 Jul 2019 11:35:33 +0000
Message-ID: <DBBPR08MB4678546DF9EE76EE6427DBB783C10@DBBPR08MB4678.eurprd08.prod.outlook.com>
References: <20190724072008.6272-1-guillaume.gardet@free.fr>
 <20190725083433.6505-1-guillaume.gardet@arm.com>
 <CAJKOXPejSxxH5DJPyEHTt=VEOdVgiXOm1c3MKKir-qRxtDcLLA@mail.gmail.com>
In-Reply-To: <CAJKOXPejSxxH5DJPyEHTt=VEOdVgiXOm1c3MKKir-qRxtDcLLA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 04d9e3e1-5b5d-4148-95e4-48c8e4e62f7d.0
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Guillaume.Gardet@arm.com; 
x-originating-ip: [2a01:e0a:d7:1620:a088:a1e8:d605:49de]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 63fa0723-949c-48a5-8c79-08d710f43825
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DBBPR08MB4394;
X-MS-TrafficTypeDiagnostic: DBBPR08MB4394:|HE1PR0802MB2603:
X-MS-Exchange-PUrlCount: 2
X-Microsoft-Antispam-PRVS: <HE1PR0802MB2603989EEF8E0360653AD03783C10@HE1PR0802MB2603.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 0109D382B0
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;SFS:(10009020)(4636009)(136003)(396003)(366004)(376002)(39860400002)(346002)(199004)(189003)(13464003)(11346002)(86362001)(5660300002)(102836004)(476003)(8936002)(81166006)(81156014)(46003)(71200400001)(71190400001)(7736002)(53936002)(25786009)(305945005)(9686003)(74316002)(8676002)(486006)(446003)(6436002)(6916009)(53546011)(6306002)(14444005)(6506007)(68736007)(186003)(229853002)(55016002)(99286004)(316002)(966005)(478600001)(54906003)(76116006)(64756008)(66946007)(66446008)(52536014)(6116002)(76176011)(7696005)(66476007)(6246003)(66556008)(2906002)(256004)(33656002)(4326008)(14454004);DIR:OUT;SFP:1101;SCL:1;SRVR:DBBPR08MB4394;H:DBBPR08MB4678.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: TU67XyfN4Qr1U3TqmamOxKamSLfH0zdBcoxgotSr3bl9ckpmOy+jS5pBURv6Vf2PfcZeryDPVP70CizcLQWNb33tMSkNU5Zh45jJeJhWIiJFK9WrRr460JH0Aqm6gPK/SGHsya9BYSAd6F4sJcXMdhzKZiTjzlJ5RFYBiynL2tfkaNIyyGupbxn8NOEzzFTjkwjPkSbiEzriDbtPaNy691kI94P5Y2+O4KlRH4vvW1PoI0Uy9jdVsaG6Hom/XjodHmxboK12wiMcmqNj30SMiLRF39mskHryYmY0RRfs5pgx3rXrDKaNGjEayqyLVY2VDplEtNdyPNAgR4K2cIztI7qOMiihk6HMzF22q4tZEgil5DDeXvZugW0DLre7mm0n4ni+zYsrOHjRFljUs9CMhPV0qgDnao88/+GtLSt/V6U=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4394
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guillaume.Gardet@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(376002)(396003)(136003)(39860400002)(346002)(2980300002)(13464003)(199004)(40434004)(189003)(6246003)(8936002)(6862004)(126002)(476003)(186003)(47776003)(81166006)(446003)(63350400001)(99286004)(63370400001)(81156014)(33656002)(11346002)(478600001)(2906002)(76176011)(14454004)(486006)(26005)(102836004)(22756006)(53546011)(436003)(229853002)(26826003)(54906003)(305945005)(55016002)(4326008)(5660300002)(107886003)(966005)(76130400001)(316002)(9686003)(8676002)(36906005)(356004)(5024004)(7696005)(86362001)(70206006)(14444005)(23676004)(336012)(25786009)(70586007)(2486003)(7736002)(6506007)(6116002)(50466002)(52536014)(74316002)(6306002);DIR:OUT;SFP:1101;SCL:1;SRVR:HE1PR0802MB2603;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:TempError;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;MX:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 158996c7-8bfc-4177-a636-08d710f43454
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:HE1PR0802MB2603;
X-Forefront-PRVS: 0109D382B0
X-Microsoft-Antispam-Message-Info: fuUz3HgYhvM+DJ4lcVPTvM62fH9IC9oV8z1rf1suU4ED7WxHMSwDLTAB5TtWPwm4KwF/Dgx5QgDeN5hlVtgXuFehSMNS9o4OjaxOW5JPnluZ7xLtQ44oLQ+LiGqsK98ludjKOLvxpDc5YqSPgHnZrR9+3j6qaCenK1P2nt53v7dquIHKWWvtsk37jWIYZ3iCsITAKqKuMLcWFdMUtudJ/PKwVUCxCCsrf8X/1F0Pr8JF7BMsjgdjfCMg/bsouIZyE7qvwjsw4OgPdeYJlIHScoM4ykLjbnR0QHEcChVcNL4C1LebCgd/TLr3DB67Bky8Ut1VwY7kv5HnMApTxSCUQE/vPdlB4NYuJhhtQxBrGHqNP5w3YqDGGhe+xCTbnGjhcqQfcYiLCCE22/qMNYTGwpWKGSUsUMtasmyQ1GtSxGU=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2019 11:35:39.5533
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63fa0723-949c-48a5-8c79-08d710f43825
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2603
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiAyNSBKdWx5IDIwMTkgMTM6MTkNCj4gVG86
IEd1aWxsYXVtZSBHYXJkZXQgPEd1aWxsYXVtZS5HYXJkZXRAYXJtLmNvbT4NCj4gQ2M6IGxpbnV4
LXNhbXN1bmctc29jQHZnZXIua2VybmVsLm9yZzsgS3VramluIEtpbSA8a2dlbmVAa2VybmVsLm9y
Zz47IGxpbnV4LQ0KPiBhcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gU3ViamVjdDog
UmU6IFtQQVRDSCBWMiAxLzJdIGFybTogZHRzOiBleHlub3M6IEFkZCBHUFUvTWFsaSBUNjA0IG5v
ZGUgdG8NCj4gZXh5bm9zNTI1MA0KPg0KPiBPbiBUaHUsIDI1IEp1bCAyMDE5IGF0IDEwOjM0LCBH
dWlsbGF1bWUgPGd1aWxsYXVtZS5nYXJkZXRAYXJtLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBGcm9t
OiBHdWlsbGF1bWUgR0FSREVUIDxndWlsbGF1bWUuZ2FyZGV0QGFybS5jb20+DQo+ID4NCj4gPiBB
ZGQgbm9kZXMgZm9yIEdQVSAoTWFsaSBUNjA0KSB0byBFeHlub3M1MjUwLg0KPiA+IFRlc3RlZCB3
aXRoIGttc2N1YmUgYW5kIGdsbWFyazItZXMyLWRybSBvbiBDaHJvbWVib29rIHNub3cuDQo+ID4g
TG9hZCB0ZXN0ZWQgb24gYXJuZGFsZSBib2FyZC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEd1
aWxsYXVtZSBHQVJERVQgPGd1aWxsYXVtZS5nYXJkZXRAYXJtLmNvbT4NCj4gPg0KPiA+IENjOiBL
dWtqaW4gS2ltIDxrZ2VuZUBrZXJuZWwub3JnPg0KPiA+IENjOiBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnprQGtlcm5lbC5vcmc+DQo+ID4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZw0KPiA+IC0tLQ0KPiA+IFYyIGNoYW5nZXM6DQo+ID4gICAqIG1vdmUgbWFsaSBub2Rl
IGFzIC9zb2Mgc3ViLW5vZGUNCj4gPiAgICogbW92ZSBncHVfb3BwX3RhYmxlIGFzIG1hbGkgc3Vi
LW5vZGUNCj4gPiAgICogbWlub3Igc3R5bGUgdXBkYXRlcw0KPiA+ICAgKiB0ZXN0IG9uIGFybmRh
bGUgYm9hcmQNCj4gPiAgICogZW5hYmxlIGJ5IGRlZmF1bHQNCj4NCj4gSSB3YXMgbm90IHNwZWNp
ZmljIGVub3VnaC4gSXQgY2FuIHN0YXkgZGlzYWJsZWQgaW4gdGhlIERUU0kgYmVjYXVzZSBub3Qg
YWxsDQo+IHJlc291cmNlcyBhcmUgcHJvdmlkZWQuIFRoZSBib2FyZCBEVFNlcyAoYWxsIG9yIG9u
ZXMgd2hpY2ggYXJlDQo+IHRlc3RlZCkgd2lsbCBlbmFibGUgaXQgYW5kIHByb3ZpZGUgbWlzc2lu
ZyByZXNvdXJjZXMgLSBtYWxpLXN1cHBseS4NCg0KSSB0aGluayBhbGwgcmVzb3VyY2VzIGFyZSBw
cm92aWRlZCwgc2luY2Ugbm8gbWFsaS1zdXBwbHkgcHJvcGVydHkgaXMgbmVlZGVkIGhlcmUuDQpT
bywgSSBjYW4gZWl0aGVyIGVuYWJsZSBpdCBieSBkZWZhdWx0IGZvciBhbGwgZXh5bm9zNTI1MCBw
bGF0Zm9ybXMgdGhlcmUsIG9yIEkgY2FuIGVuYWJsZSBpdCBvbmx5IGZvciBBcm5kYWxlIGJvYXJk
IGFuZCBDaHJvbWVib29rIHNub3cuIFdoYXQgZG8geW91IHByZWZlcj8NCg0KPiBKdXN0IGxpa2U6
DQo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZh
bGRzL2xpbnV4LmdpdC9jb21taXQvP2lkPWYNCj4gMGE2MjA4YjkwYmRkNDRmNDhmNTcxOGM4YmIw
ZWIxZTc2M2QxNGMwDQo+DQo+ID4gICAqIGFkZCBkdCBiaW5kaW5ncywgaW4gYSBzZXBhcmF0ZSBw
YXRjaA0KPg0KPiBQdXQgdGhlIGJpbmRpbmdzIGJlZm9yZSBEVFMgY2hhbmdlLg0KDQpZZXMsIG1h
a2VzIHNlbnNlLg0KDQo+DQo+ID4NCj4gPiAgYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNTI1MC5k
dHNpIHwgNDcNCj4gPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9h
cm0vYm9vdC9kdHMvZXh5bm9zNTI1MC5kdHNpDQo+ID4gYi9hcmNoL2FybS9ib290L2R0cy9leHlu
b3M1MjUwLmR0c2kNCj4gPiBpbmRleCBkNWUwMzkyYjQwOWUuLmY3ZjM0ZDQ2OWJkZSAxMDA2NDQN
Cj4gPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9leHlub3M1MjUwLmR0c2kNCj4gPiArKysgYi9h
cmNoL2FybS9ib290L2R0cy9leHlub3M1MjUwLmR0c2kNCj4gPiBAQCAtMzI4LDYgKzMyOCw1MiBA
QA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGlvbW11cyA9IDwmc3lzbW11X3JvdGF0b3I+
Ow0KPiA+ICAgICAgICAgICAgICAgICB9Ow0KPiA+DQo+ID4gKyAgICAgICAgICAgICAgIG1hbGk6
IGdwdUAxMTgwMDAwMCB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9
ICJzYW1zdW5nLGV4eW5vczUyNTAtbWFsaSIsICJhcm0sbWFsaS10NjA0IjsNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICByZWcgPSA8MHgxMTgwMDAwMCAweDUwMDA+Ow0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSAxMTggSVJRX1RZUEVfTEVWRUxf
SElHSD4sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxHSUNfU1BJ
IDExOSBJUlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgPEdJQ19TUEkgMTE3IElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGludGVycnVwdC1uYW1lcyA9ICJqb2IiLCAibW11IiwgImdwdSI7
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZjbG9jayBDTEtfRzNEPjsN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJnM2QiOw0KPg0KPiBB
Y2NvcmRpbmcgdG8gYmluZGluZ3MgdGhpcyBpcyBub3QgcHJvcGVyIGNsb2NrIG5hbWUuIEkgd29u
ZGVyIHdoeSBpdCB3YXMNCj4gd29ya2luZy4uLiBpdCBzZWVtcyB0aGUgZHJpdmVyIGV4cGVjdHMg
Zmlyc3QgY2xvY2sgdG8gYmUgYWx3YXlzIHRoZSBjb3JlIGNsb2NrLg0KDQpZZXMsIGl0IHdvcmtz
LCBiZWNhdXNlIDFzdCBjbG9jayBpcyBhc3N1bWVkIHRvIGJlIHRoZSBjb3JlIGNsb2NrLg0KQ2xv
Y2sgbmFtZXMgYXJlIG9wdGlvbmFsIGFuZCBjb3VsZCBiZSBvbWl0dGVkIGFzIGluIGh0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4Lmdp
dC90cmVlL2FyY2gvYXJtL2Jvb3QvZHRzL3JrMzI4OC5kdHNpP2g9djUuMy1yYzEjbjEyODQNCk5v
dCBzdXJlIGlmIGl0IHdvdWxkIGJlIGJldHRlciB0byByZW5hbWUgaXQgdG8gJ2NvcmUnLCBvciAg
anVzdCBza2lwIGl0PyBBbnkgb3Bpbmlvbj8NCg0KVGhhbmtzLA0KR3VpbGxhdW1lDQoNCj4NCj4g
QmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCklNUE9SVEFOVCBOT1RJQ0U6IFRoZSBjb250ZW50
cyBvZiB0aGlzIGVtYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgYXJlIGNvbmZpZGVudGlhbCBhbmQg
bWF5IGFsc28gYmUgcHJpdmlsZWdlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lw
aWVudCwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5IGFuZCBkbyBub3QgZGlz
Y2xvc2UgdGhlIGNvbnRlbnRzIHRvIGFueSBvdGhlciBwZXJzb24sIHVzZSBpdCBmb3IgYW55IHB1
cnBvc2UsIG9yIHN0b3JlIG9yIGNvcHkgdGhlIGluZm9ybWF0aW9uIGluIGFueSBtZWRpdW0uIFRo
YW5rIHlvdS4NCg==
