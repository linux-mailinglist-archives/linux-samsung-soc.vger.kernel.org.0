Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF0791C2192
	for <lists+linux-samsung-soc@lfdr.de>; Sat,  2 May 2020 01:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728080AbgEAXvk (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 1 May 2020 19:51:40 -0400
Received: from mail-dm6nam12olkn2016.outbound.protection.outlook.com ([40.92.22.16]:44769
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728025AbgEAXvj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 1 May 2020 19:51:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rkz5DoYW4wbkLPyCYjOTekjr3MCjXvuqgCDohJ69Byntst5dEqRXq/3eSPxxd94TVNHeeKvvqQ+xAOqS184g+RSXTJMkh+yZ4fI7waeylR3ZUUzs8FpRs9KD/KniHbHZsZMRMOxYKcDSh5qrGxRjODuLem6mheGxgBaPmfBzQ9X0j3sWb5Y73HSu44TvsE0ETnoq9Vw1YPL+R7CY9AAI8LtwZnRgc0LgQjMu+6KZpyVnA4vSE7Cwn/G0g4P8lBxSadWQWpp2KQbSn8taXnxgtqUDXiavOS65iB95dHH/SNH+cFWXclhlK0uDRIM0cQWlj1XKcPQX9ioOFLot10M6dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7ZjxXV6hRTArMKzwUdmWj9mjVn0DHbIyI4io8aPZbY=;
 b=XsPcaMOQvh5nODZppqx7STAoEmTW8b/UrlG7Xc7+00v+05SWa7FRpG7O9Pn3RQ3TGAyfRJTWmrtdwR5wtFx3sAVcuppCScjFpxqZm6JL5K+Y+Pxzz4Nsx2ZCNivxPXjVkzLr0wfqZNmPh9i9Vd2TL12AOGvIK+daXe7nUy2utHtzJ6f6jqq1iJEap0bsNWhqD08eyVjcnUWBtFcCAQ9NyB/MG/iLeT4cvdc8Ior/D17YfoXLQe18qFsRNCF8mScrR1R9J1K9R6dJNtk00X+hH40RRqeVTcDRo9ZcCpgiC9itOPvSMkyMxjYlz1xnA4eu3+nBh+2DfF1IwpMBzRYRuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=live.ca; dmarc=pass action=none header.from=live.ca; dkim=pass
 header.d=live.ca; arc=none
Received: from DM6NAM12FT056.eop-nam12.prod.protection.outlook.com
 (2a01:111:e400:fc64::43) by
 DM6NAM12HT052.eop-nam12.prod.protection.outlook.com (2a01:111:e400:fc64::85)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.12; Fri, 1 May
 2020 23:51:38 +0000
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 (2a01:111:e400:fc64::46) by DM6NAM12FT056.mail.protection.outlook.com
 (2a01:111:e400:fc64::460) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.12 via Frontend
 Transport; Fri, 1 May 2020 23:51:38 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:153A132993A5AD49D21AE72C1130A05CFE78ED357966072A317665B00A7C40E6;UpperCasedChecksum:597B554E6CAC7BDE018FD5928A0A1465794AC4B716BE6EE4930E2DBEA25D61CF;SizeAsReceived:7851;Count:50
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::ad10:4127:4bc8:76fc]) by BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::ad10:4127:4bc8:76fc%6]) with mapi id 15.20.2958.027; Fri, 1 May 2020
 23:51:38 +0000
From:   Jonathan Bakker <xc-racer2@live.ca>
To:     kgene@kernel.org, krzk@kernel.org, robh+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Jonathan Bakker <xc-racer2@live.ca>
Subject: [PATCH v2 16/18] ARM: dts: s5pv210: Correct FIMC definitions
Date:   Fri,  1 May 2020 16:50:17 -0700
Message-ID: <BN6PR04MB0660F32A1A46FAF8CF5A52EBA3AB0@BN6PR04MB0660.namprd04.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200501235019.24022-1-xc-racer2@live.ca>
References: <20200426183604.28494-1-xc-racer2@live.ca>
 <20200501235019.24022-1-xc-racer2@live.ca>
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MWHPR17CA0058.namprd17.prod.outlook.com
 (2603:10b6:300:93::20) To BN6PR04MB0660.namprd04.prod.outlook.com
 (2603:10b6:404:d9::21)
X-Microsoft-Original-Message-ID: <20200501235019.24022-17-xc-racer2@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jon-hp-6570b.telus (2001:569:fb68:9c00:8067:f823:1e15:7520) by MWHPR17CA0058.namprd17.prod.outlook.com (2603:10b6:300:93::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend Transport; Fri, 1 May 2020 23:51:36 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200501235019.24022-17-xc-racer2@live.ca>
X-TMN:  [JJyT/8ZrxzfYYwrPn8S28pUPSmHK7BKM1TF1QgzQYWNBx6aL9SxKqEGEVpwVNmdy]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 50
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: f758242e-c207-404d-f759-08d7ee2a966a
X-MS-TrafficTypeDiagnostic: DM6NAM12HT052:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8l/oytQJZDS25KlY2sTD7oWP2WIzWAaCUhxivZHIrIcTQDydk6wkqX06u7yewlpOLUxEW5DxPKxsZUEPXQNBgmxSWaxpazq6V0CllfacwTD9SGEqPmJP1YnYWRfFW52MnukB1M2Lq4pbJKCJes5GkAsG87eEAOjlykn2mw8hxHb7kX+wQv93hwNY+yxxaukQMvSjU3hHyd/iMNUFigXLPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR04MB0660.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: gz8LJk4jljtAbqrODqA6mab6ykVm2duBElvy1KH0rHF8sPklBtrt6RtYB2m0rcUnv6ApfR0J5nRvGtgH7qIYFuH6ryAcDJWtxhMvofpeIEe841cJtvTHs7bnF4B5/ocXD67i/4l1No/Tf+ohMRhw1q307hH2rrHsdsq1sCZZANYul1vpuOsuDBKyM1PEsVpO6rSvUgFUcVbm0fTqdsCDpg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f758242e-c207-404d-f759-08d7ee2a966a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2020 23:51:38.0702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM12HT052
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The extended mainscaler is only available on FIMC1 and there
are minimum pixel alignments that differ from the default.
Additionally, the cam-if interface is available on all three
while FIMC2 has no rotators.  The lcd-wb interface is supported
on FIMC1.

Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>

---
Changes from v1
- Replace moved line to where it originally was
---
 arch/arm/boot/dts/s5pv210.dtsi | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
index 30a0c39a310f..1b0ee884e91d 100644
--- a/arch/arm/boot/dts/s5pv210.dtsi
+++ b/arch/arm/boot/dts/s5pv210.dtsi
@@ -626,7 +626,7 @@
 				clock-names = "fimc",
 						"sclk_fimc";
 				samsung,pix-limits = <4224 8192 1920 4224>;
-				samsung,mainscaler-ext;
+				samsung,min-pix-alignment = <16 8>;
 				samsung,cam-if;
 			};
 
@@ -640,8 +640,10 @@
 				clock-names = "fimc",
 						"sclk_fimc";
 				samsung,pix-limits = <4224 8192 1920 4224>;
+				samsung,min-pix-alignment = <1 1>;
 				samsung,mainscaler-ext;
 				samsung,cam-if;
+				samsung,lcd-wb;
 			};
 
 			fimc2: fimc@fb400000 {
@@ -653,9 +655,10 @@
 						<&clocks SCLK_FIMC2>;
 				clock-names = "fimc",
 						"sclk_fimc";
-				samsung,pix-limits = <4224 8192 1920 4224>;
-				samsung,mainscaler-ext;
-				samsung,lcd-wb;
+				samsung,pix-limits = <1920 8192 1280 1920>;
+				samsung,min-pix-alignment = <16 8>;
+				samsung,rotators = <0>;
+				samsung,cam-if;
 			};
 		};
 
-- 
2.20.1

