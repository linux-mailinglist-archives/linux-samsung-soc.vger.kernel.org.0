Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 350EC7338FB
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 16 Jun 2023 21:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345924AbjFPTDt (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 16 Jun 2023 15:03:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345860AbjFPTDo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Jun 2023 15:03:44 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C7AF3C0D;
        Fri, 16 Jun 2023 12:03:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/U7zB8Lkz9Ze+QkQENbB7wSoK9bJV8PF2i+ONjqq2yrWjpWEsNqAjkYSGCv4HmpFounCHQr0bAWSakCYqUzG/lUNnG4iJUu7ZLF8CbpqU0HaTdQ6c+uUQGX5FZzTR8nRpptzRklcmSjSYverOnUAkUyCHjXIb4dAav7FshonHPRHfMhEQANZ/SeiZAqu69vJUnWgQNkbHqZBsZM230A95NVJNXVniY8iEvDeby03yzXxGPxvnfOam5lkcoNBA4MQ+JnYZG1rq5d4RA1TU02bVyVil35NgY1Bb60My+7qZjWo+se9WT+k5hmOI8XxEVMELi0hPrVFnh2qWIaLsJ0xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cE3gP3IT7L/AsvWvDwFn9+Dm0y7PEvGc1+Rm0rxcwBk=;
 b=MWjsF2qWwI1bozBsJB/syuSkxeikSiNal16HhAiATdtWGeRzmv4rhGU7cR8dF/Woaa5FhXnf5inMSQzMZ5WN7NiipUGzMvhgy+Rr7QBONVLe5zWJo5M77XrTRy/0uEvMImJrfCcNvDdGGHhiHESYJxbYCQZ1y8albDUrr1ClM904ky/k6gxIJzcUoZaiM9UsW0Az+cVpBGm/NMF7INVnfh+6hSUITk0qdKhLi9N1D4LETCEPRiWAxfq+8q2YD9T40umB7nh1ZS3g7LjGB2rkrdDarmKnLXmL6pqzhjQybnMg7btbiJhWaW7tckXdIBlucA6qjjcD7WR1xlATrFVoEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cE3gP3IT7L/AsvWvDwFn9+Dm0y7PEvGc1+Rm0rxcwBk=;
 b=KpNYjQTyzaLJdgiC2LTxLZwWb6CmlePMaTvxMslvEH8THLBLvPdUsGodIjdBRLUPrDqTa/6mr9qER2N2CfvrSutwoAOUIu1nbLYn9gRpNQNlNO+JommC8tUY5+gNv4r3qQM9KoGJMDvaLrqrkY3aumNUmy5fnmEMFK6cNsFln9VyPST3/LvFH5YPY+c1taIHg91DZZuexlFQXo1UWUaPWSKRgfwK7Im/vHL0zgIAMzeusgCMfjqLflb+tr+8ErI0ObxjCbassvQprinD4lrHBiazY13UDSbzvua4TcSY/tDOdYjHUipKNSvVhwQ2J3EyOStWfB1+uljvhYTm/vjADg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Fri, 16 Jun
 2023 19:03:03 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%7]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 19:03:03 +0000
From:   Jason Gunthorpe <jgg@nvidia.com>
To:     Andy Gross <agross@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bjorn Andersson <andersson@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Joerg Roedel <joro@8bytes.org>,
        Kevin Tian <kevin.tian@intel.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        linuxppc-dev@lists.ozlabs.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
        Yong Wu <yong.wu@mediatek.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     Lu Baolu <baolu.lu@linux.intel.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Steven Price <steven.price@arm.com>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH v4 08/25] iommu: Reorganize iommu_get_default_domain_type() to respect def_domain_type()
Date:   Fri, 16 Jun 2023 16:02:37 -0300
Message-Id: <8-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR20CA0041.namprd20.prod.outlook.com
 (2603:10b6:208:235::10) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ1PR12MB6051:EE_
X-MS-Office365-Filtering-Correlation-Id: 3375e37d-f41d-45c9-d189-08db6e9c4b68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ctwbR8Z+SjBCAK1QHZXGia1glNscT+9fLfcT7BQNWKooOYiWu0zyJQFmKSOuzxA8RczT7B92bIskbyhINPfIN5QKI7U+Pt33tfgzAP4QB2JO93bXRlwIeGTX3Xbm1tGOOubsXMAI6ikNkv388WdF1tx7TBFcZcuHkZfl6rnqdKchZxvthWrSpkAC4Ob5TCxg0UKOayTee8LEhKH3pqTifMbcvl3WJ+EMXYPxoNsbv0iuSSrD1bVL+oBTDiO4OYU1pIRhsTq8w4C1VhL6YWI/+JY1PN6UyisWSfbzPdKU3HYpB7Z4WwOF5BK1qy7HJn/o5zD9SI0+tFtPurl5D9wuZkStvURKFMZHVqrjTCo5dQgHdrFxYxkkYurJLBVY2Ym7LyCNTTLni8/st318zc3ErPIydb86FNsiau/PMjoMWBvcboGav9cxp7BGRLoN5JE7a9xeAsnJADVOXAnJSeC9YnwbKzoIbfWhfj+JYgqCZC9DXiyAwQ46Kh6ETUIFBMzHFSVrGyl0BA2CND7P1I3N3erCi+37rJD8hHbiE+MJIwUjf4qfCz6GFqemBQMNtuGKdNwaoFx+eRbq6Ss6dkBloz31ibRAwomyYum79KsDIdXopJxqu9RCsLBge8vm1i+I
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(451199021)(2906002)(83380400001)(2616005)(36756003)(86362001)(921005)(38100700002)(8676002)(8936002)(5660300002)(107886003)(66556008)(316002)(478600001)(66476007)(66946007)(4326008)(6666004)(6486002)(186003)(7416002)(6506007)(54906003)(7406005)(110136005)(41300700001)(26005)(6512007)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MSOfTVl5XbX1DiejjeY39xPb15HrhqE9webgHXmWrGyRO1VjS+KTv3GmV8y7?=
 =?us-ascii?Q?9vZxbV40aAsKdChEivAYWljtbXMF6tAtw3wCkTFOXud4GRAZPUTvFpYG5bXy?=
 =?us-ascii?Q?soNqHyj2XDtcRJ7m3aCFYGCV80lylwFp3yH8tgwOZTGBELjS0LCQpNFJJeBZ?=
 =?us-ascii?Q?efiUYsgKvlnuMn3FN/xMEikBTjWzPbRrpB7ksfwzueoVZ8P3XTYWNjveNKi9?=
 =?us-ascii?Q?cQeoeiaO2PXZHZv5nMyTI9IfJGQSOeGvHxHEA43SdtaByIHPakK1UtY3xOXx?=
 =?us-ascii?Q?s+3DwivKoEKEno5/ylAFnmyYsE4GU/z/uUPhzTkK9uEc7tobnSknj8Sym3yG?=
 =?us-ascii?Q?q5mr6jUDqVjkVsHhMwAdG1GVOQFe99EH0po2H8suRKoR8gQ5w5lg4MDv22Cg?=
 =?us-ascii?Q?SbK26Pel9IsmQv/kcgsOW/IowHCrAKHJBBlC7cfC+tKE60E5ENVYTooixkyK?=
 =?us-ascii?Q?pD4x8ZaR+GuPEHdW0mFZ5uhtiIdCsC/RT8MieEUvFvmwXGVwKNSKFIcGeyP/?=
 =?us-ascii?Q?By7Iid3nAZUal7Y8/sVJMjH6sk4MtmRu2PEn+Z35jtL0uHzMtA+iaFo8dWbm?=
 =?us-ascii?Q?QdLvkOgfIatj7I0oR6RBlr0t3z4MrBj3LkkGmeHcgQzaVDl81LuOcE/ivr1J?=
 =?us-ascii?Q?QFrxuZt7dkwLQBRk3K7XMh6aF+NTJW5L7aGEDA+0RyfmhBRcejStXx2lAYia?=
 =?us-ascii?Q?plaVxG1yITMpm/gwHC6OIgdhDY1253d0+QWpMGWa32RBGL5B6URHsWhYgqrw?=
 =?us-ascii?Q?HiLRp0ItaO7ZXEhnYi9pD05XOT1mEhZAo0OHcjuVnF7rTGzoDnNkT0LK2Cjq?=
 =?us-ascii?Q?00rNM4dt6L6V0hl8nlTEqNB2gDSV51eKMe1CrASLbkhBNFhL471smnEIt1sS?=
 =?us-ascii?Q?Fu7rUzigPXtM6WsewLOu/t/awp43NmG6ujj4hazJUObr5yWianzASosgBFYb?=
 =?us-ascii?Q?qpnOmcCwm/QUH9YGTUiDmgBAZXP0gcaD1SohTlqIFRJx5W7nTgDTbWlqZBaF?=
 =?us-ascii?Q?ad1Mx99MNFNNy6AYY5w/HaJhAup322QjgoyfsYC5yaNOfr6FJespdN/KHlLP?=
 =?us-ascii?Q?9DUsIvYJ6eHK4Cqi2aSBVaknpB2P1OzQ0N1YPKVBZehZWM17pppAP14ALodz?=
 =?us-ascii?Q?q3QyP37la+PA7G25duC69PAzs/rRS+4sihc9LPzr4LWSyiVZC03Qqm1bzqcT?=
 =?us-ascii?Q?k2mJ6nL9yNb4iDGmAXhw4cNGkDlr6OJpIebQnxq12iCDsr6yzTw24Ob/JSwJ?=
 =?us-ascii?Q?E5xF1LV5lMKT/VZmjiJdAEinqc1iTWVI2BylPqvlxgP13nh+F0nO80TFxTym?=
 =?us-ascii?Q?1iztzSGmHM3aQevC3YZ2nkmXm1tcp4oFPKdyQIDCEb1IYdbAQnZTW0ry0rwi?=
 =?us-ascii?Q?s/mXwYr+QThIHBaXF1C5UqXllJsFrX4q7eBgBVATrL3bJXDob38/vROc4Gne?=
 =?us-ascii?Q?fLn3dP6Nt2rxfoUSDrIO+zPqhivQFbqHhW0jx7k+DJybxoCW9xsqfXxjUDhx?=
 =?us-ascii?Q?aMJBZ0SoLWk0x1d6SCTWrj+Rsr4Exo0cQMOrr+6w/ImSmwQWMHU+SFMV7Poh?=
 =?us-ascii?Q?VOSVCopU0Op5lEhxX3CbkJWUN8ZJ5FEdeI28qRf1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3375e37d-f41d-45c9-d189-08db6e9c4b68
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 19:02:56.4299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1+h/Y+b2tZSZ73W6kQV/hIBurxQgBKcz8cy0L8AG3BWWK9N5S5KbM5Lsr0Ah3QnF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6051
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Except for dart every driver returns 0 or IDENTITY from def_domain_type().

The drivers that return IDENTITY have some kind of good reason, typically
that quirky hardware really can't support anything other than IDENTITY.

Arrange things so that if the driver says it needs IDENTITY then
iommu_get_default_domain_type() either fails or returns IDENTITY.  It will
never reject the driver's override to IDENTITY.

The only real functional difference is that the PCI untrusted flag is now
ignored for quirky HW instead of overriding the IOMMU driver.

This makes the next patch cleaner that wants to force IDENTITY always for
ARM_IOMMU because there is no support for DMA.

Tested-by: Steven Price <steven.price@arm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 66 +++++++++++++++++++++----------------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index c8f6664767152d..0c4fc46c210366 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1608,19 +1608,6 @@ struct iommu_group *fsl_mc_device_group(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(fsl_mc_device_group);
 
-static int iommu_get_def_domain_type(struct device *dev)
-{
-	const struct iommu_ops *ops = dev_iommu_ops(dev);
-
-	if (dev_is_pci(dev) && to_pci_dev(dev)->untrusted)
-		return IOMMU_DOMAIN_DMA;
-
-	if (ops->def_domain_type)
-		return ops->def_domain_type(dev);
-
-	return 0;
-}
-
 static struct iommu_domain *
 __iommu_group_alloc_default_domain(const struct bus_type *bus,
 				   struct iommu_group *group, int req_type)
@@ -1761,36 +1748,49 @@ static int iommu_bus_notifier(struct notifier_block *nb,
 static int iommu_get_default_domain_type(struct iommu_group *group,
 					 int target_type)
 {
+	const struct iommu_ops *ops = dev_iommu_ops(
+		list_first_entry(&group->devices, struct group_device, list)
+			->dev);
 	int best_type = target_type;
 	struct group_device *gdev;
 	struct device *last_dev;
+	int type;
 
 	lockdep_assert_held(&group->mutex);
-
 	for_each_group_device(group, gdev) {
-		unsigned int type = iommu_get_def_domain_type(gdev->dev);
-
-		if (best_type && type && best_type != type) {
-			if (target_type) {
-				dev_err_ratelimited(
-					gdev->dev,
-					"Device cannot be in %s domain\n",
-					iommu_domain_type_str(target_type));
-				return -1;
-			}
-
-			dev_warn(
-				gdev->dev,
-				"Device needs domain type %s, but device %s in the same iommu group requires type %s - using default\n",
-				iommu_domain_type_str(type), dev_name(last_dev),
-				iommu_domain_type_str(best_type));
-			return 0;
+		type = best_type;
+		if (ops->def_domain_type) {
+			type = ops->def_domain_type(gdev->dev);
+			if (best_type && type && best_type != type)
+				goto err;
 		}
-		if (!best_type)
-			best_type = type;
+
+		if (dev_is_pci(gdev->dev) && to_pci_dev(gdev->dev)->untrusted) {
+			type = IOMMU_DOMAIN_DMA;
+			if (best_type && type && best_type != type)
+				goto err;
+		}
+		best_type = type;
 		last_dev = gdev->dev;
 	}
 	return best_type;
+
+err:
+	if (target_type) {
+		dev_err_ratelimited(
+			gdev->dev,
+			"Device cannot be in %s domain - it is forcing %s\n",
+			iommu_domain_type_str(target_type),
+			iommu_domain_type_str(type));
+		return -1;
+	}
+
+	dev_warn(
+		gdev->dev,
+		"Device needs domain type %s, but device %s in the same iommu group requires type %s - using default\n",
+		iommu_domain_type_str(type), dev_name(last_dev),
+		iommu_domain_type_str(best_type));
+	return 0;
 }
 
 static void iommu_group_do_probe_finalize(struct device *dev)
-- 
2.40.1

