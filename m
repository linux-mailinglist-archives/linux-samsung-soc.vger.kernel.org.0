Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2C21F84B4
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 13 Jun 2020 20:45:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbgFMSpN (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 13 Jun 2020 14:45:13 -0400
Received: from mail-oln040092004050.outbound.protection.outlook.com ([40.92.4.50]:56033
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726378AbgFMSpL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 13 Jun 2020 14:45:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DdCp7CWlfg0I395goLEGRK178qPatJ+NRc9yU4SWYrEq/l3TvRpllvBBbqg2aH88zTNy2tu5h2hIoUvKQRyBllZDJt/BCNc27fdmuGqQSZzQ8i05Zzzl9AdWtOfuypItnrNkGYzsQq96Qg5c9MPRBi7nzar8XYd0sLcWI6QZBQiGTQM2nJeJNWU3liiP9LOOmiCRqd+Cgd5/gg/ohE1NV9cP/yRoYabcXnDPCOtXwSEmGYNSVWjdijQR+Y5Z7Lx1y+O/wCmSO+/T+gM1Pi9ABYWR/nTVal7tqOOZ+dW+B6dwkAgsd2HWFsZ/hS2PraGFj84/Z/brsoOsVI+nqRBp/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GfWAQq/eyYyrofXUihp5lrUVsOlLv+NB/k6IzgxYowk=;
 b=NBs+RXYuxoiLka+nQ3GWlpZcs4o85H6sgjHsFdeUwquodsXg5NRcxKBv204qFDZ3Ey7T8WSmTqkmhZxTS/PuMNskP0Pk6anKdVKIHAO1Ph15FFqgSh6gZ1aLA5loWQMPxsSe82V0VW+MSAZezpG0lJR1T1v1IdCekeqwoWXTH7/rwSEaXdKvdAbnk/P2hM1GMQhXybA0NshRRDWJUzO34twXH5QcicoYsH53xo3JQeFwANe4uKtCy1MdDD/pAfJygZWBSZRgi0/w2EQRMAr4CF7rFy8IfLILJtt1pwmvIratycPsVwo/40cqTnEB0CQxn9I6h5m8MFPkV55NF5ciLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BL2NAM02FT048.eop-nam02.prod.protection.outlook.com
 (10.152.76.54) by BL2NAM02HT059.eop-nam02.prod.protection.outlook.com
 (10.152.76.211) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Sat, 13 Jun
 2020 18:45:08 +0000
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 (2a01:111:e400:7e46::4a) by BL2NAM02FT048.mail.protection.outlook.com
 (2a01:111:e400:7e46::109) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend
 Transport; Sat, 13 Jun 2020 18:45:08 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:8A49BA7CFB3EBB7820773D23750FFEE0A43C3DFAB8935D19BCE4B359B5050E7F;UpperCasedChecksum:B17E8088141B84EBC9F9A90E0D4E40943B6CE0104AC8151EBCA8020172328FED;SizeAsReceived:7769;Count:49
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383]) by BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383%9]) with mapi id 15.20.3088.026; Sat, 13 Jun 2020
 18:45:08 +0000
From:   Jonathan Bakker <xc-racer2@live.ca>
To:     kgene@kernel.org, krzk@kernel.org, robh+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Jonathan Bakker <xc-racer2@live.ca>
Subject: [PATCH 1/5] ARM: dts: s5pv210: Add interrupt-controller property to gph3
Date:   Sat, 13 Jun 2020 11:44:23 -0700
Message-ID: <BN6PR04MB066056E001AAC1F903B46971A39E0@BN6PR04MB0660.namprd04.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200613184427.23394-1-xc-racer2@live.ca>
References: <20200613184427.23394-1-xc-racer2@live.ca>
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MWHPR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:300:116::32) To BN6PR04MB0660.namprd04.prod.outlook.com
 (2603:10b6:404:d9::21)
X-Microsoft-Original-Message-ID: <20200613184427.23394-2-xc-racer2@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jon-hp-6570b.telus (2001:569:fb68:9c00:8067:f823:1e15:7520) by MWHPR07CA0022.namprd07.prod.outlook.com (2603:10b6:300:116::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend Transport; Sat, 13 Jun 2020 18:45:06 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200613184427.23394-2-xc-racer2@live.ca>
X-TMN:  [FDl2LBaMeOoW0B/1WEHRD/LZ7yYkABA2Dk7ncubYxzU+aSPzsjr15FTtKdHjxe7Q]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 10dcf376-afd3-467a-1e14-08d80fc9e4bd
X-MS-TrafficTypeDiagnostic: BL2NAM02HT059:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YnVz9IsULPG7WHKB8+HCREaelBJ+QRm5QPvtvOd3B42VmTDPXLjEXYgSkEXnW/9UULcPwEX7UytwssU+9HCxqOjNnPbgBcyZzZF1VCTkdC/33WB0ls2CvXkQSXAoEclCnOOhoJgLg7+P40YNKjX4pd4Fd2CtCYUcFHNm9tSzz8KTntjxGe96T3DW+p+r/V2QKSjcfRpJq2T2xiwH5mp1Jg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR04MB0660.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: kwjJG1tIlP/ZG3jLMn7ALl2Llv5KN1Z5mLEfJJ5pHO3P3KKKjjCl/CSm4/lJtExZWzhTSxXAHwzyF7sQaWxWsa4rHMsBCJNkxExP0W8/fFm0s/4uZ9xsC9Kdg7aRyYy7y2IIjZ7yD0KgqTi/108RsjErsdQvVLnH0AuFwE/HBsOO2+ckpWa3zAJkhIAqkNGJQ5xlbar4hbMCnne6IiIfeg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10dcf376-afd3-467a-1e14-08d80fc9e4bd
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2020 18:45:07.9304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2NAM02HT059
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The GPH3 pins on s5pv210 have interrupt support and had the
interrupt-cells property but was missing the interrupt-controller
property.

Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
---
 arch/arm/boot/dts/s5pv210-pinctrl.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/s5pv210-pinctrl.dtsi b/arch/arm/boot/dts/s5pv210-pinctrl.dtsi
index 5e8b66281f01..b8c5172c31dd 100644
--- a/arch/arm/boot/dts/s5pv210-pinctrl.dtsi
+++ b/arch/arm/boot/dts/s5pv210-pinctrl.dtsi
@@ -273,6 +273,8 @@
 	gph3: gph3 {
 		gpio-controller;
 		#gpio-cells = <2>;
+
+		interrupt-controller;
 		#interrupt-cells = <2>;
 	};
 
-- 
2.20.1

