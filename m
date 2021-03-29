Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F83A34D12F
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 29 Mar 2021 15:32:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231684AbhC2Nbg (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 29 Mar 2021 09:31:36 -0400
Received: from mail-bn7nam10on2073.outbound.protection.outlook.com ([40.107.92.73]:61025
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229674AbhC2NbF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 29 Mar 2021 09:31:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WN3KpaI/KUoHNYei/mKD6AONTfr9+in7gsu2bwMosB4FZomjkEgYU5ctSyjKc5iGLDsSXxrAQ25JPqBo25f4GZyBgPqOsYIn/dCIsmhkqpzf52zYBP+57AmpCowjvuuNUTTYuxmf1Wv8wx4eidZQt/piWhC7IBMP4p+22IOiB3IHEHEjYn2rHWYP1bRMXcAiTr7em+tkqaSmXuQ2DxxHSfRi4VSk4qXeMvfNGZITyc8hfBz1udHx67bD/7R11LSAqHQrNIMD1vEdf33oK3xE2xd+l5BWqDOC1Bjtvuy0maK4Dvd+IHE4/YzsuI+BB6lddX0KLfetq2+Bwh5hdcV3Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTLn346IjWxV4VS1FoDii/oSx/eHDkgeqWUSvioI81M=;
 b=g5qO9xDezZmU++V5EOo2ICGpFsQQV7Og0diOpD5aGoUfufqSeoosddzCnkmkJqDqKVYPJ/mn/r7pqk8cJNejusQJjaeiCAE7pCBd+Bdy85u7Dd431BYfPwnyjx8bb6hWdDosYT0Ngy6/mU7+4XjiBdxZvcRl8GKXtamdhbesbYY9AMfgK+lib986e3mza5rr9URbpmdeXrYDBU1y4CyASWOM3rEozVlXzf9y5bLn0TReRpsKylrtWsA1WDdz64s2dkVhptaR8eR0SWG9mRIzGb/LMdWqyIxuIA94CGeHQlOE8xeoQBLgl3AgUNmaEH5373gKGDSIFbyL++R+cER6rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTLn346IjWxV4VS1FoDii/oSx/eHDkgeqWUSvioI81M=;
 b=mCAfewv3dR8awIRR6KMxNu6C7mZsxlq7aH7elQEmZNkyD4rEJipu9xE62m01tLaUl6Hzk/s8ihMyI4RF5HBlvfEvkRp5HxUWDh/p8TC/r0WHhMxuUh1urKVw0RqWlC9Y7lzbpRJOj0drMH7+yGJdkcA9xtDgG8qYFtQaPCxbNOEd2IrocRvz1Rzc9kliKNmyq/VHWHgp4jFKdxLCgYPCFwJEWmVB6knH/+VDVrY/pvFMuk0AXog43+5xRiwCIeglIXUCneberi6Fnsyi0V98HHllYOpIiLXfHme8wNZZpY+LCt4/CmS4Nm/ow7rt381tI8xK7dvRvM3rfOfdwtuSUQ==
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM5PR12MB2488.namprd12.prod.outlook.com (2603:10b6:4:b5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.33; Mon, 29 Mar
 2021 13:31:03 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 13:31:03 +0000
Date:   Mon, 29 Mar 2021 10:31:01 -0300
From:   Jason Gunthorpe <jgg@nvidia.com>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        3pvd@google.com, Jann Horn <jannh@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Peter Xu <peterx@redhat.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: [PATCH 3/3] mm: unexport follow_pfn
Message-ID: <20210329133101.GA1168973@nvidia.com>
References: <20210316153303.3216674-1-daniel.vetter@ffwll.ch>
 <20210316153303.3216674-4-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210316153303.3216674-4-daniel.vetter@ffwll.ch>
X-Originating-IP: [142.162.115.133]
X-ClientProxiedBy: MN2PR07CA0010.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::20) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.115.133) by MN2PR07CA0010.namprd07.prod.outlook.com (2603:10b6:208:1a0::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend Transport; Mon, 29 Mar 2021 13:31:03 +0000
Received: from jgg by mlx with local (Exim 4.94)        (envelope-from <jgg@nvidia.com>)        id 1lQryv-004u7T-T4; Mon, 29 Mar 2021 10:31:01 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0b2712d-2745-44c2-e2a0-08d8f2b6e610
X-MS-TrafficTypeDiagnostic: DM5PR12MB2488:
X-Microsoft-Antispam-PRVS: <DM5PR12MB248848F3809B3FC52FA5D97EC27E9@DM5PR12MB2488.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EyU4LkmpzpXIjt+MA5A4scn0IKfzO9K5m67ELa44p5ohLE4ExaymvWt7LRpUfPWSpcImLS/UFWDnZ8dVQA28+6p812YaG/MtTftvqSH0sYGyDDkQSp71mAwbP4DqF3OAmdjq8pg+bcguV/K0F2GVvP423q4Vh2ITn6SJ8BwFG0X58CBrtNdDyYFhjRONNSE0S+vqaW1YrwohdtnPSVaSqWb26CQjqdpGzOUC4Iv/Z7AMhTmSTFGnVfmD2SdnFWTJfPNJ2LzNN2nIt8Qnk2/3KyUL+rlJYxUTTqrNYhkhLzJBbDouEX6E9OdOrFzY0c0HpT5MtjQVs/WRT+2+T7yUNgMqTGS7v9ADtxaZHl/vQ9HOaAtadAcwQ6ieNoPjsOqolHlK5/tp+WJ5vxAtqeVfkXzmlo0YXXyxWLVeyKACj9PH35kwuUzPCXjwIlHxi5pDmZdFXi7RKFR3di5OlAojhxCowsQdlZM5eIthXmctsznnMYvsGeiF2Qakq190vVsB3CaduAv3UNUJ4Bc5iuG2I+xTxfIqQQoEjVbjYOezOvcXArJQhNXiJuNFHVxH5/h9+pevNd4PwwlsI0lLUhRVWrtYxo1T1KR9/QJ3kTbTNkZLeInXtQnGV/th2nsoHIAZglUBCi9rPlYdEBf42BkHHzRbFvrmu49sE8XHydu6s34=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3834.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(426003)(38100700001)(86362001)(9786002)(4326008)(26005)(2906002)(54906003)(6916009)(66556008)(66946007)(9746002)(66476007)(1076003)(33656002)(8676002)(8936002)(5660300002)(186003)(83380400001)(36756003)(478600001)(2616005)(316002)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?y4rCj05RM5GeuvFqVHQNH+Tpx6+zpdc0IRM5/DX5HWZokauolDO/Rt7Y+IYP?=
 =?us-ascii?Q?ShLmOJCyGR8U7KT1HBopee6tBEntxqvGp9DRdIg3NCYKZwFUGcN/8iBhVOEB?=
 =?us-ascii?Q?O5Po+OifrsDBpcgwrpl1OWLA5Em4NJToUMe4MhGI3YwV3qn7671K7V04L7jm?=
 =?us-ascii?Q?Yr0a5VwXA24AfjnZ0Vbt0ENGsYdt6qrDVBzNF2Lg7KsVL3cs9Irg/6uQIw+j?=
 =?us-ascii?Q?Bx3gow9owWI60HDR9ouPY54FNzW/MUB461wj8CylsTLibC9LQ2aqAmAAPPaF?=
 =?us-ascii?Q?PR3OnnMRIL3OF1GHokAmGzQvFv/4VH7cJpysqnEBkWbXUhBkYLlRe+2VqB9q?=
 =?us-ascii?Q?0mCiLBRGJCBU+ENGnS1IAZX8a/XQvPNMs+7HCundV2MsM18vKM6J1spKx8g9?=
 =?us-ascii?Q?QoCxZ9bdoXp+7WgvrWkL11ZEyKmPkZ1kJOxKSIbfCRF6MsdFH0A9J1EPFwE3?=
 =?us-ascii?Q?RyjpYwCF8X4jy0Cdfh3VNWH7CTlfDSA9JMlNdtoA3OSfSrk9hZ3aFbcTGtzt?=
 =?us-ascii?Q?SD+aSIANnYs/IGnjHdSZFOEkGfOZktHMZ6uTy4RJ1UB4+tXch6w1KCzkyL3/?=
 =?us-ascii?Q?bcP7XqmftHZ/5MUL1by+vmmCgw1Q7snXVq3zdcO+Nx/umzZpIIxHf0CDMLRC?=
 =?us-ascii?Q?hGAooFJpWWb+iI9SxxJ5YbHPpjJ1XKVsuN+xweZ5n1maHAm74J9/8oex7Wh0?=
 =?us-ascii?Q?jGjo9auXKGl2N5BF5NleqDp8MUdd7o3l7ksun22nyXIRFh1k2L+CmMmHCEwk?=
 =?us-ascii?Q?zY1jHp9ATDZDNcPjd0BWtXsSeczVrHbMtOniTQ9FrFt4HQ7snMpHFnKYQj5+?=
 =?us-ascii?Q?taTnpOXQ1Pi8duokK5zvcmdHwtJJgD4AYhZF9Z0QeQiJynOfXs8ojR/HGtdf?=
 =?us-ascii?Q?PxWh6oEUYdI1pmyCUsZLej8wiID7j0Xweyll76DmQyntdK/Ri/lM4wlREopM?=
 =?us-ascii?Q?bCj+23/45nrT9D/sDP2mfcgBlwB5ArrnaG7kDMvvAITQYUdX8bdSHXVGy/yz?=
 =?us-ascii?Q?1XkP5bjWwBGyWqC8otDyulLswvbKL2rPhOH7GS+Ta+O9Fu/JN61x+wB6Pd9N?=
 =?us-ascii?Q?aHkFBBPpXzivqJ3nm7qsVZOIQnVJ+jECCje3Py6ARXNnwCkOduMTqN4BQviL?=
 =?us-ascii?Q?nqtAx+m4zkmf5ypSxRVJO2KVUhr7XQwSfHQaGheEhS3FqupATHGOOkSCjC0a?=
 =?us-ascii?Q?fvwAKO6ZqSacozA/bSPW4GvGwnEFCuvHiHZHKQKJqsD0NNAbgJ9ZEJiyGXBJ?=
 =?us-ascii?Q?03Pz0RyeWzkCwrmLlXkqaeL5vTagi3zaKN7jWZKtvmWEWdVsyOQ6H6pFqv+/?=
 =?us-ascii?Q?yfxD2E9tabKDcHpu0APCMIofUonSWRgyNXx0YQNciMDfZw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0b2712d-2745-44c2-e2a0-08d8f2b6e610
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 13:31:03.3769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JnCj+Axv+YQc/MsISWQmkylmEejxitOBoLnXgnXb5R41XfuYi8sqgmiUViUbzYYj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2488
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Mar 16, 2021 at 04:33:03PM +0100, Daniel Vetter wrote:
> Both kvm (in bd2fae8da794 ("KVM: do not assume PTE is writable after
> follow_pfn")) and vfio (in 07956b6269d3 ("vfio/type1: Use
> follow_pte()")) have lost their callsites of follow_pfn(). All the
> other ones have been switched over to unsafe_follow_pfn because they
> cannot be fixed without breaking userspace api.
> 
> Argueably the vfio code is still racy, but that's kinda a bigger

vfio and kvm

> picture. But since it does leak the pte beyond where it drops the pt
> lock, without anything else like an mmu notifier guaranteeing
> coherence, the problem is at least clearly visible in the vfio code.
> So good enough with me.
> 
> I've decided to keep the explanation that after dropping the pt lock
> you must have an mmu notifier if you keep using the pte somehow by
> adjusting it and moving it into the kerneldoc for the new follow_pte()
> function.
> 
> Cc: 3pvd@google.com
> Cc: Jann Horn <jannh@google.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: linux-mm@kvack.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: kvm@vger.kernel.org
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> --- 
>  include/linux/mm.h |  2 --
>  mm/memory.c        | 26 +++++---------------------
>  mm/nommu.c         | 13 +------------
>  3 files changed, 6 insertions(+), 35 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
