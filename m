Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3BC7A6228
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  3 Sep 2019 09:03:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbfICHDN (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 3 Sep 2019 03:03:13 -0400
Received: from mail-eopbgr20084.outbound.protection.outlook.com ([40.107.2.84]:18852
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726200AbfICHDM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Sep 2019 03:03:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6+96qWutJDVftuqZtTL58GvUniJ4I3cb2rp4LPbJlo=;
 b=gYDQSuUX0U/JSf5Vd7HgtR6pKdVRg7mO+1gqnoAe5kwow6ANaWpx5CmuwzqKsMqUR/t521AIDnq9mkG43NkrLcO1HbtuZQeik35f5+DRx8W4psG82mmayhW28DtJSuba6tlao3OGCkgjBFN7AzIHxEyqo637zOgJaYI9OCLSDqw=
Received: from VI1PR08CA0152.eurprd08.prod.outlook.com (2603:10a6:800:d5::30)
 by DB6PR0802MB2598.eurprd08.prod.outlook.com (2603:10a6:4:97::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.20; Tue, 3 Sep
 2019 07:03:05 +0000
Received: from VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::205) by VI1PR08CA0152.outlook.office365.com
 (2603:10a6:800:d5::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.19 via Frontend
 Transport; Tue, 3 Sep 2019 07:03:05 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=temperror action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT007.mail.protection.outlook.com (10.152.18.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Tue, 3 Sep 2019 07:03:03 +0000
Received: ("Tessian outbound f83cc93ed55d:v27"); Tue, 03 Sep 2019 07:03:03 +0000
X-CR-MTA-TID: 64aa7808
Received: from 865888059ae1.1 (ip-172-16-0-2.eu-west-1.compute.internal [104.47.9.53])
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 74D09C1B-A1D3-446C-BE55-FB888082ED95.1;
        Tue, 03 Sep 2019 07:02:58 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-ve1eur03lp2053.outbound.protection.outlook.com [104.47.9.53])
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 865888059ae1.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
    Tue, 03 Sep 2019 07:02:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WbZWDLaEjTX0KHQbsmUujg3Ug5EJMu5nywFkwWLYxlTwmZowLUVhPmNRT4z0AQSkXW/h/Gsn+8kBzGzuFqwQJWP+GXb6DLOlM3mz15KvIgNDJA0TlkEILBRcU6kRMfipFRfCqS5b7/VqBmufsX4r7mNkZjR4Df47x/8osRWQ9tpNV7D6wtBHWhurxN8J8fd7MshWt02yQ1jxG5M8TB4t9JXKPnXVx07SWwrdj0s6XbLFtDMoQtUs2vMOu9fiwA7DlUXNolUrkZR3h+cwzAsa5LyHRxc25jDFAj/oXXUKtoBMtJd5BDTRx+w8QDd2GTY+wtRFunH2laRpNfx+RRVHuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNy8POUWiJHAJEjqJdOxzZakTTS50gkZcZ0+CNdqKsc=;
 b=NG/qJmsB6kOkXa9ywcSEswyDeElJJ7ZBY2iedCIwo7dCqYkNoX0BDAmygHIYAvl0CDaWccigKgTCZRtc9P9Uv0MicsRRc7cVA7/hWhNzYhy1ZQoQHzBij+JkwJK+t/YdyK2vMWIkKuqokj19YBC2XcAhK8erghwhPlfK2rpXuml/N7ofW4E+uXC07H/Avd5lalrBM8eYSuaTDP5uUWQvjwbEIihzFnmBKH2jBJ3laIeDCq1z6njYlzSt09jBAz8BvOApvjRo53d0kzIml+TG2Uh+O9yVNvj4E9dmDLzEqxsRJ+sqWxwxfclY5kJKGtTtN7xEdF6QhcAOsvxBeMW7ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNy8POUWiJHAJEjqJdOxzZakTTS50gkZcZ0+CNdqKsc=;
 b=sgiAD1wZkvhUi0FYPDL35eEPyVIXhzs4CBiv/zSlLFKyRL2rP/Q9BzCs4WfEgVyjIuWiFS8cgUEL+v9bPqkEi0KXh5CLkS9hzE9bVdRdgpgvMxlESv/058za6lW6l437dhjwIcXpEYjBggg0rmA3M9oQTKuawLxJn1K0Z+gxs/Y=
Received: from VE1PR08MB4685.eurprd08.prod.outlook.com (10.255.115.74) by
 VE1PR08MB4975.eurprd08.prod.outlook.com (10.255.158.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Tue, 3 Sep 2019 07:02:56 +0000
Received: from VE1PR08MB4685.eurprd08.prod.outlook.com
 ([fe80::5571:6993:1e70:b697]) by VE1PR08MB4685.eurprd08.prod.outlook.com
 ([fe80::5571:6993:1e70:b697%4]) with mapi id 15.20.2220.021; Tue, 3 Sep 2019
 07:02:56 +0000
From:   Guillaume Gardet <Guillaume.Gardet@arm.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
CC:     "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH V3 1/5] dt-bindings: gpu: mali-midgard: Add samsung
 exynos5250 compatible
Thread-Topic: [PATCH V3 1/5] dt-bindings: gpu: mali-midgard: Add samsung
 exynos5250 compatible
Thread-Index: AQHVXyAQ86MZq6d3AUGp1lK4+DJYuKcYiM8AgAECO4CAAAGEMA==
Date:   Tue, 3 Sep 2019 07:02:56 +0000
Message-ID: <VE1PR08MB468570F2B6851C4CD3E80A5083B90@VE1PR08MB4685.eurprd08.prod.outlook.com>
References: <20190725083433.6505-1-guillaume.gardet@arm.com>
 <20190830104502.7128-1-guillaume.gardet@arm.com>
 <20190830104502.7128-2-guillaume.gardet@arm.com>
 <20190902153146.GB9289@kozik-lap>
 <CAJKOXPe8QDzDoM4sKva0qrVUA7EMTR7FO5jGut+Paw9mAcdfAw@mail.gmail.com>
In-Reply-To: <CAJKOXPe8QDzDoM4sKva0qrVUA7EMTR7FO5jGut+Paw9mAcdfAw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: a3aeac83-2499-445e-8a14-f5bf7d9644d3.1
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Guillaume.Gardet@arm.com; 
x-originating-ip: [2a01:e0a:d7:1620:9c42:54a9:8a93:a8f1]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 813593c2-d268-459a-32d2-08d7303cc3ec
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VE1PR08MB4975;
X-MS-TrafficTypeDiagnostic: VE1PR08MB4975:|DB6PR0802MB2598:
X-Microsoft-Antispam-PRVS: <DB6PR0802MB259873C3208A455D59CA8D8283B90@DB6PR0802MB2598.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
x-forefront-prvs: 01494FA7F7
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;SFS:(10009020)(4636009)(136003)(376002)(366004)(39860400002)(396003)(346002)(13464003)(189003)(199004)(256004)(74316002)(76176011)(7696005)(6436002)(186003)(305945005)(6116002)(71200400001)(7736002)(8676002)(446003)(8936002)(46003)(71190400001)(81156014)(81166006)(33656002)(478600001)(6506007)(486006)(102836004)(476003)(11346002)(14454004)(229853002)(54906003)(4326008)(55016002)(66946007)(66556008)(86362001)(66476007)(76116006)(52536014)(53546011)(5660300002)(53936002)(2906002)(316002)(6916009)(64756008)(25786009)(99286004)(6246003)(9686003)(66446008);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR08MB4975;H:VE1PR08MB4685.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: 4Xe+q4PZOdI5IynOQoYkGVZZdZn5L4ppxeKs6dkGFhWohBc59/Tncq01ABWmsI+H3CqVPheZWLjNjSVHN0W9Xxt6Wc6ZhqNhiH6n3NKlqcyI2K/bHdudHA9Wiakp/pcGN1fLHKSxSRpDH/ELEvTcnzwHZ31wYZejJXfYd04qbm+iROo/ApxGU4dV4PBSrNOXvrGyO8nliMq8CkfgKSs9xg5BJ7pe/3fIM8y4Rudq9Kk7zebacWguQBlo3378qyrpoiMkbZo/skul3MfgseeJnA3nsp+8+UI3zpBwQ/+wtXgXMMuskzKJb67w7UMPjX8Ac23B1/GPeDemVFQ4w78K9jrYejBQjXnkw4f3AQTtLUyZUvBUzuFGjv8tCJ/aYIEUyBOGbmgEo6HpYL4S01UIpwCD+Qy6NhP2ZvBMdY0q70s=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4975
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guillaume.Gardet@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(346002)(376002)(39860400002)(396003)(136003)(2980300002)(199004)(40434004)(13464003)(189003)(229853002)(70586007)(4326008)(74316002)(8936002)(26005)(99286004)(6862004)(107886003)(76176011)(316002)(6246003)(81156014)(81166006)(36906005)(8676002)(70206006)(52536014)(6116002)(54906003)(25786009)(2486003)(23676004)(5660300002)(186003)(356004)(126002)(486006)(336012)(33656002)(446003)(63370400001)(63350400001)(436003)(86362001)(76130400001)(478600001)(26826003)(50466002)(14454004)(14444005)(5024004)(53546011)(6506007)(55016002)(2906002)(9686003)(7736002)(22756006)(305945005)(7696005)(476003)(11346002)(47776003)(102836004);DIR:OUT;SFP:1101;SCL:1;SRVR:DB6PR0802MB2598;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:TempError;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;MX:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 491415ed-571a-4a91-376f-08d7303cbfb4
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB6PR0802MB2598;
X-Forefront-PRVS: 01494FA7F7
X-Microsoft-Antispam-Message-Info: 0DWJf3llvx7cJinhG8NpKsiQKeH5z3qAo1pTsP3aBL0cy5DEAuVX41VPRKLjGA9+aoNmmYB48exjRl3TSOE9EfGGymUbxFRSlDDI+u9U332o2qJaaWRnXA1oYyr2bZKIecH84sW9glU8HTAK/GOvqsqDT1oJaO2OJKN1C9UPzzsADOpk39FdVCa2JrEHbd/wCFWfLuXwItSDRxjyJvstxOBiWc6Q1yBNBHL0CwlPAIQqmm5T9MbpJ/AUTwyb/Qyk2U3toXdwZksXIiVd4JjmFyVSA3yr8DuwQYEglD/9sRweb5UNNmH36JNr05GwOB7FrNYqOaSbkW2vFTdIljn2eEtPH7pbF5EcR4ZIHfmnABN62nVGo0e7Q1DKbW4hg+6tyM5/WBXHchPaOn6t7zZM8jYEjqM7H6gYm8HeYYgtjtE=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2019 07:03:03.8151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 813593c2-d268-459a-32d2-08d7303cc3ec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2598
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiAwMyBTZXB0ZW1iZXIgMjAxOSAwODo1Ng0K
PiBUbzogR3VpbGxhdW1lIEdhcmRldCA8R3VpbGxhdW1lLkdhcmRldEBhcm0uY29tPg0KPiBDYzog
bGludXgtc2Ftc3VuZy1zb2NAdmdlci5rZXJuZWwub3JnOyBLdWtqaW4gS2ltIDxrZ2VuZUBrZXJu
ZWwub3JnPjsNCj4gTWFyZWsgU3p5cHJvd3NraSA8bS5zenlwcm93c2tpQHNhbXN1bmcuY29tPjsg
bGludXgtYXJtLQ0KPiBrZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIFYzIDEvNV0gZHQtYmluZGluZ3M6IGdwdTogbWFsaS1taWRnYXJkOiBBZGQgc2Ftc3Vu
Zw0KPiBleHlub3M1MjUwIGNvbXBhdGlibGUNCj4NCj4gT24gTW9uLCAyIFNlcCAyMDE5IGF0IDE3
OjMxLCBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiA+DQo+
ID4gT24gRnJpLCBBdWcgMzAsIDIwMTkgYXQgMTI6NDQ6NThQTSArMDIwMCwgR3VpbGxhdW1lIEdh
cmRldCB3cm90ZToNCj4gPiA+IEFkZCAic2Ftc3VuZyxleHlub3M1MjUwLW1hbGkiIGJpbmRpbmcu
DQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogR3VpbGxhdW1lIEdhcmRldCA8Z3VpbGxhdW1l
LmdhcmRldEBhcm0uY29tPg0KPiA+ID4NCj4gPiA+IENjOiBLdWtqaW4gS2ltIDxrZ2VuZUBrZXJu
ZWwub3JnPg0KPiA+ID4gQ2M6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4N
Cj4gPiA+IENjOiBNYXJlayBTenlwcm93c2tpIDxtLnN6eXByb3dza2lAc2Ftc3VuZy5jb20+DQo+
ID4gPiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnDQo+ID4gPiAtLS0N
Cj4gPiA+IFYzIGNoYW5nZXM6DQo+ID4gPiAgICogYWRkIGR0LWJpbmRpbmdzIGJlZm9yZSBub2Rl
IGluIGRldmljZSB0cmVlDQo+ID4gPiBWMiBjaGFuZ2VzOg0KPiA+ID4gICAqIG5ldyBmaWxlDQo+
ID4gPg0KPiA+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1h
bGktbWlkZ2FyZC50eHQgfCAxICsNCj4gPg0KPiA+IFRoYW5rcywgZW50aXJlIHNldCBhcHBsaWVk
ICh3aXRoIHJlLW9yZGVyaW5nIGFuZCBtaW5vciBkZXNjcmlwdGlvbg0KPiA+IGNoYW5nZXMpLg0K
Pg0KPiBIaSBHdWlsbGF1bWUsDQoNCkhpLA0KDQo+DQo+IEkgYXBwbGllZCB5ZXN0ZXJkYXkgZW50
aXJlIHBhdGNoc2V0IGJ1dCB0aGlzIGR0LWJpbmRpbmdzIHBhdGNoIGNhdXNlcyBiaWcNCj4gbWVy
Z2UgY29uZmxpY3Qgd2hpY2ggd2lsbCBub3QgYmUgcmVhc29uYWJsZSB0byByZXNvbHZlIGJ5IExp
bnVzLg0KPiBDYW4geW91IHJlYmFzZSB0aGlzIHBhdGNoIG9uIHRvcCBvZiBsYXRlc3QgbGludXgt
bmV4dD8gQmFzaWNhbGx5IHlvdSB3b3VsZA0KPiBuZWVkIHRvIGFkZCByZXNwZWN0aXZlIGVudHJp
ZXMgdG8gbmV3IFlBTUwgZmlsZToNCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2dwdS9hcm0sbWFsaS1taWRnYXJkLnlhbWwNCj4NCj4gU2VuZCBpdCB0byByZWd1bGFyIGR0LWJp
bmRpbmdzIG1haW50YWluZXJzIChzY3JpcHRzL2dldF9tYWludGFpbmVycy5wbCkuDQoNCklJVUMs
IEkganVzdCBuZWVkIHRvIHJlc2VuZCB0aGlzIHBhdGNoICgxLzUpIHJlYmFzZWQgdG8gdXNlIHlh
bWwsIGluc3RlYWQgb2YgdHh0LCBubyBuZWVkIHRvIHJlc2VuZCBvdGhlciBwYXRjaGVzLCByaWdo
dD8NCg0KUmVnYXJkcywNCkd1aWxsYXVtZQ0KDQo+DQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6
dG9mDQpJTVBPUlRBTlQgTk9USUNFOiBUaGUgY29udGVudHMgb2YgdGhpcyBlbWFpbCBhbmQgYW55
IGF0dGFjaG1lbnRzIGFyZSBjb25maWRlbnRpYWwgYW5kIG1heSBhbHNvIGJlIHByaXZpbGVnZWQu
IElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIHBsZWFzZSBub3RpZnkgdGhl
IHNlbmRlciBpbW1lZGlhdGVseSBhbmQgZG8gbm90IGRpc2Nsb3NlIHRoZSBjb250ZW50cyB0byBh
bnkgb3RoZXIgcGVyc29uLCB1c2UgaXQgZm9yIGFueSBwdXJwb3NlLCBvciBzdG9yZSBvciBjb3B5
IHRoZSBpbmZvcm1hdGlvbiBpbiBhbnkgbWVkaXVtLiBUaGFuayB5b3UuDQo=
