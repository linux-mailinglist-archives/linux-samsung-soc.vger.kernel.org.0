Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DB1977BB6F
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 14 Aug 2023 16:23:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231528AbjHNOWp (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 14 Aug 2023 10:22:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231589AbjHNOWP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Aug 2023 10:22:15 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2061.outbound.protection.outlook.com [40.107.237.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8101BE3;
        Mon, 14 Aug 2023 07:22:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NgfAEOr6p+V/X4GMmxKdww3XpAXGtvAFDeLOuErCXrH2nE4eQ/x0VtjFHWRQoHVci1F0ozIJ9wcOmo3EMyKMULEOzRkvwXEVPdkAkt4abJxrYLzMsfxqcyDOfm5smVKng13zJYzwAvZn0p4VvrfHBsQgOi6HNkHiEN9DUUeRHAipBHpjxlM16IC/FAF7uvP+JIGeacPq0MuY/C89Ajxb+S4JpLqcPey7iTDkL4G5529SFDFiPOA0dGPfrYJNchUneSNtQbGLBv5OUx/Sl8SuLQgAfp3w/GzFu5iu6Wh7gzAAvDttxsRFkH4VmM6cYVmxaRiGVBIQpR3ADM7b9Wklbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OefzYpC7Pd4tpcuEpwZDpGJaWX50q3u3CFtKFxg5RNA=;
 b=S7AXWev435tSwCB7hQG2CP7VMEPBJUwQUYTQEv+V4PiLiu1cvPIfpzB6GuBTUFFs5bUa2E2m/uiEUwlG25Hi0oQVlM1ltNJ6GiDPQacj0j2Rw1Vfmz8hEdyuNFtrJgX/Y86EdSPyR5viiwXjQiPzNgoA24jZDAKScnJwDZ1jf3JkcHCUjFBGK5wFPnic38zp2zOfoInJthfLQiyj8eQb6ocnN3O/eKrpwLferxs0URGmAVTS1UeJ2R6MicksOvctqqO2k2vFh9n40tbrPHlh4cowdRNrBVZnWBbIvQomoQ+aiiZVU5SFdZUQQfzf3wHy92HhkE30jAME8bGip7fReQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OefzYpC7Pd4tpcuEpwZDpGJaWX50q3u3CFtKFxg5RNA=;
 b=TAn0ZOVxXz6/CYe2MZDQZBV/QwCcww+E/4L+wYQkZCU+0b4asw/8f6oKJUkidtBpTifdEIDm9hcBnycAnLNpxEF/6hZL1BK7uyJbH+uK7BZ04wPztb51eHHRThnCtDsjPn/aolhhaySED0QcQPisedTJp44ZkGKOkvGS5w++KPuCL/0QNs2lvDP2V30ghnRYyNr9CBavIT6tQNnudS3yqmtAZcF/bmMc4OGNtLx9zwzBaitOhy7GBOeYs9WJDLfKGLBxFChaKT6FLp7+68His5GTMNaAag5qAjx7vTZ/taKXllQPFBaDwB0x/CFyqN1KnDjUiLkJbHRSo0t61hLFYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH0PR12MB7487.namprd12.prod.outlook.com (2603:10b6:510:1e9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Mon, 14 Aug
 2023 14:22:10 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 14:22:10 +0000
Date:   Mon, 14 Aug 2023 11:22:08 -0300
From:   Jason Gunthorpe <jgg@nvidia.com>
To:     Baolu Lu <baolu.lu@linux.intel.com>
Cc:     Andy Gross <agross@kernel.org>,
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
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Steven Price <steven.price@arm.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v6 02/25] iommu: Add IOMMU_DOMAIN_PLATFORM
Message-ID: <ZNo4kGyba/xNFXcw@nvidia.com>
References: <2-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
 <b772c318-80b0-944a-dfe9-beb70127dc88@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b772c318-80b0-944a-dfe9-beb70127dc88@linux.intel.com>
X-ClientProxiedBy: CH0PR03CA0062.namprd03.prod.outlook.com
 (2603:10b6:610:cc::7) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH0PR12MB7487:EE_
X-MS-Office365-Filtering-Correlation-Id: 224c7ab4-7854-41e8-1787-08db9cd1d8c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IvOLb5ED/aOVtkePsqsj7V1WRYNp5cmxS9/y4mWuY0YV42q5Nl1+V5+xcV3hJepvF8Kf0eGTjN/xIhMYQ+VSbDdhF26AI+NVJFoqjn5iRUpjEo5gmtzl3qH9bH72yUnj6rN1lVQ2FKax2jHdEbCzHNsYnj1hp6ycyWwni0tnJ/g9W4aoVvATwk/zre+yvV4rfioaahR3kNy4QCka6OsTXNlbqdXfIuYXoRNoQJdizMg38H0/IAJY0Gn++eXE7yluv+mQo6ZslaO8pkyRDd8x5NO6srbvg760NyusMrR0Q0y2DudBd78mYm++IrDXrspW532MkfHqJRjCry1EYZQ8cTltel3hmOg0FMcGuCv8nA/5Jlm9o+JHZBnJw21X0lslw3pIbSerz6b29I3g3scOJ0EFiX05RrFLZyB1rB99lon+zphzuvlnOxhAueHTkf9xfn6TuIGd6sp45hwDO6MkR0aFte1siCNMRdOACrH2WqyISU8HnGJif1XwVD67kkAH5WlZ+9OjoeJK3qPFDYDK3Kvfm4YnZf+VWcXy+oYjAMSe6b8Bs8PLy4U9Li2VyJ+z
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(366004)(39860400002)(346002)(396003)(186006)(451199021)(1800799006)(54906003)(66556008)(66946007)(6486002)(6512007)(6916009)(478600001)(66476007)(26005)(6506007)(107886003)(41300700001)(7416002)(7406005)(8936002)(5660300002)(38100700002)(86362001)(316002)(8676002)(36756003)(2906002)(2616005)(4326008)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E0K+o6rxXnrshRkoeRe6YUc8YyssWMUnd0TPZLq+RQBjucrwQ76q69i1HshX?=
 =?us-ascii?Q?smSCWhFOxWEIRfm1OWL3hSt/GRmYpW9JiDT1PlExwlRM5dqf5vrVM5CkbXXy?=
 =?us-ascii?Q?6L8zcEFZUbYbAv4xPKKFohi6uL75MGSJMEsmE3S5HVPg77c5KSIWSn1/uJry?=
 =?us-ascii?Q?9fhY3jgmLWHiBnF4ChMy78YdhE0c0GmMuQzGiSG9850RDJTxwfj488fnoomV?=
 =?us-ascii?Q?JRQFVD4loZpS5KkEcsen/OzNlBwh8l/KX+qg4hun+HthgqGQHtLdorXxGVb+?=
 =?us-ascii?Q?QTLb+05y4iA0GBGE4OMDUfa23hShXakF01JP4355yPbwjFQxB6jw4EwjP+kr?=
 =?us-ascii?Q?vyjL9hF7hGxlg3GUyqVG5SFfMGUk4Ne5vBnR/QRp9FAcLwY6DBAg/OhjTGjs?=
 =?us-ascii?Q?p2TZ0rZ59LiLolo0LN3ROfues0ZVaqruVc42084cWA4XRKflqwOckbi/VpJL?=
 =?us-ascii?Q?N6FSC6/SeQ+vblvH2shtf6iJHntIcFtmxbE8lmHiLYUkLRjSikZOylPbTeAq?=
 =?us-ascii?Q?GWrcd8EHru2aNtGaWBuVw7LrcdHdJ5GZsp/WjJM+CzfHO6ZtP4FahnVgB2Gc?=
 =?us-ascii?Q?zWv6f7RNOZujie6QMIkRTxhh2lOn1j6SHvZnU3rJ94tWZZDC43UKiUE776Sl?=
 =?us-ascii?Q?Dr6/vyOKHfPDRM02dUU0L1bZpV43Jhh09r+eiWnOEhGDGdWqSkC4eqiDXmuH?=
 =?us-ascii?Q?vT61HVyGGz68bu5O4IDe+iRKkOM+k12JaH8+S7AFsDlSe52MVJkntwDlnCBv?=
 =?us-ascii?Q?1L6LJHOFjfxVVR8XG4UAR0hEkgjwK1FVBaaLoRwU7a+46r9YzJ7oOFOBctUb?=
 =?us-ascii?Q?fQzx2Jo7xYpJqOrt0u3EExRxG6hTq1QwK89uTJ+hk/WARUzspgqm0SpQ0L6O?=
 =?us-ascii?Q?0jexkSENgD9LMNA+UUQL1yYvzuIBDGZCXPUENQSDrCfiKAmHLiomo+jy+F1E?=
 =?us-ascii?Q?GjNIkdrRH3mChyymnk2jj5okvfm1CQH3Ke2ccbpvPX7Vsu0KR/v+ob1UERNO?=
 =?us-ascii?Q?2ByGAKttnPnt0TA5gy5ZwVhLMZ6JcJcS4Y8qPa4uCC6bSo2+9Ir+r/PDgWIb?=
 =?us-ascii?Q?U5oPyhyoxYsrtIn/hoH/NC5ab7HX48i9bAL8ry9ZoqNHPjQtJCAiLDheod5j?=
 =?us-ascii?Q?mjTsd0Wece9k/9dyTI47ky46LlnVacdUe6YItQnxo0XLu6ySCB/JzRGgNpAi?=
 =?us-ascii?Q?HD0kPRiWsyV8xn04HvLz7oO2glaJxuR+8kjmJ3z3xqxy8fLVKKJpEzJinV1F?=
 =?us-ascii?Q?UQyI3vpVevAmj/6hswanmKD+/yzA8om6GD34nToXmMIoU4sb+95kRvFEnsFL?=
 =?us-ascii?Q?nZIHaR4BV/rSfSZ+M90n0zyk18pGpegHm81HbsWYxFhv1Ybf6TkymhSVkRSX?=
 =?us-ascii?Q?CbxLquTMS7kOFUrfm8fCONuS4YiQZ7l9pn9aLzf1qOBv2pdYUmzKpvUd1i9F?=
 =?us-ascii?Q?GygerYvrsBVobqC8KkYGdMzyMV4/lEMq7XN+CKA1ou8tIN9AzuW1E7QP9YyY?=
 =?us-ascii?Q?oKnVwXRLswbJo9PMEmuBHB3Nne7HSv2JU6k3MjVAmheCEgYrBTAq/sIVTRqa?=
 =?us-ascii?Q?oGeBVw1970fC4OIziQk+JMQXuDC6UzZeOjNQIzvk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 224c7ab4-7854-41e8-1787-08db9cd1d8c3
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 14:22:10.5236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MRjDWak2GRz78rO8bH+ZBu3QUTUPQMjWLyIBbs3xIze1Tb4Udxdh3cCnTuweAw3Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7487
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, Aug 12, 2023 at 09:41:50AM +0800, Baolu Lu wrote:
> > index e05c93b6c37fba..87aebba474e093 100644
> > --- a/include/linux/iommu.h
> > +++ b/include/linux/iommu.h
> > @@ -64,6 +64,7 @@ struct iommu_domain_geometry {
> >   #define __IOMMU_DOMAIN_DMA_FQ	(1U << 3)  /* DMA-API uses flush queue    */
> >   #define __IOMMU_DOMAIN_SVA	(1U << 4)  /* Shared process address space */
> > +#define __IOMMU_DOMAIN_PLATFORM	(1U << 5)
> >   #define IOMMU_DOMAIN_ALLOC_FLAGS ~__IOMMU_DOMAIN_DMA_FQ
> >   /*
> > @@ -81,6 +82,8 @@ struct iommu_domain_geometry {
> >    *				  invalidation.
> >    *	IOMMU_DOMAIN_SVA	- DMA addresses are shared process addresses
> >    *				  represented by mm_struct's.
> > + *	IOMMU_DOMAIN_PLATFORM	- Legacy domain for drivers that do their own
> > + *				  dma_api stuff. Do not use in new drivers.
> >    */
> >   #define IOMMU_DOMAIN_BLOCKED	(0U)
> >   #define IOMMU_DOMAIN_IDENTITY	(__IOMMU_DOMAIN_PT)
> > @@ -91,6 +94,7 @@ struct iommu_domain_geometry {
> >   				 __IOMMU_DOMAIN_DMA_API |	\
> >   				 __IOMMU_DOMAIN_DMA_FQ)
> >   #define IOMMU_DOMAIN_SVA	(__IOMMU_DOMAIN_SVA)
> > +#define IOMMU_DOMAIN_PLATFORM	(__IOMMU_DOMAIN_PLATFORM)
> 
> Nit: As a default domain could be the type of IOMMU_DOMAIN_PLATFORM,
> 
> static const char *iommu_domain_type_str(unsigned int t)
> 
> needs to be updated, so that users can get a right string when reading
> /sys/.../[group_id]/type.

Yeah, I missed that, fix it

Thanks,
Jason
