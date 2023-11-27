Return-Path: <linux-samsung-soc+bounces-158-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FC37F9EB3
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 27 Nov 2023 12:35:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EE1D280BEE
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 27 Nov 2023 11:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4631A5BB;
	Mon, 27 Nov 2023 11:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pzOCb5Wh"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5951133;
	Mon, 27 Nov 2023 03:35:40 -0800 (PST)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ARAv6rW024162;
	Mon, 27 Nov 2023 11:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=thltlNEte7wqIEWzvgJuzPrT0P4hiM4udr7oHuK7vgY=;
 b=pzOCb5WhOzIYaaP5AGgRNCQeuYwj3DkeOfkB4UUWEPqiEy/gFifVHP03+miYQ3a40kaP
 Ln8MbJx2X5/Sug37juSuUKVfu+JX3o8Qu+bKrK/ZLOfbmUrkiOAFzH10wuX6/1Hg69hp
 lrQuU7+1QxG7Q0NMwwRIvoU5Up5XIXdx1py4gQePscDLh8vj+ti8r+u04ui28v/WoxAX
 afl80q0dVRrcF6tCEJchm1tpwqdd1Ip83IykXBbBLV5j3bg7uFO34KoZ5PB2Fe1LVFtv
 rizOqtfSVyOTJ5M2pbSc0R9yg87LBsGigPCjjS8tddwnXebYro9jjO/7+2xRo4/2QZK0 SA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uk95cc1nx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 11:35:13 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ARBZCvS005980
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 11:35:12 GMT
Received: from hu-pkondeti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 27 Nov 2023 03:35:02 -0800
Date: Mon, 27 Nov 2023 17:04:59 +0530
From: Pavan Kondeti <quic_pkondeti@quicinc.com>
To: Mukesh Ojha <quic_mojha@quicinc.com>
CC: <corbet@lwn.net>, <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <keescook@chromium.org>, <tony.luck@intel.com>, <gpiccoli@igalia.com>,
        <mathieu.poirier@linaro.org>, <vigneshr@ti.com>, <nm@ti.com>,
        <matthias.bgg@gmail.com>, <kgene@kernel.org>,
        <alim.akhtar@samsung.com>, <bmasney@redhat.com>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <kernel@quicinc.com>
Subject: Re: [Patch v6 10/12] pstore/ram: Add dynamic ramoops region support
 through commandline
Message-ID: <ad38fb23-e2a2-448e-bdea-fa0985f82b50@quicinc.com>
References: <1700864395-1479-1-git-send-email-quic_mojha@quicinc.com>
 <1700864395-1479-11-git-send-email-quic_mojha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1700864395-1479-11-git-send-email-quic_mojha@quicinc.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gSQpbWT7UNoVWbbqsLNJRqn82Dqqebju
X-Proofpoint-ORIG-GUID: gSQpbWT7UNoVWbbqsLNJRqn82Dqqebju
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-27_09,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 adultscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311270079

On Sat, Nov 25, 2023 at 03:49:53AM +0530, Mukesh Ojha wrote:
> The reserved memory region for ramoops is assumed to be at a fixed
> and known location when read from the devicetree. This may not be
> required for something like Qualcomm's minidump which is interested
> in knowing addresses of ramoops region but it does not put hard
> requirement of address being fixed as most of it's SoC does not
> support warm reset and does not use pstorefs at all instead it has
> firmware way of collecting ramoops region if it gets to know the
> address and register it with apss minidump table which is sitting
> in shared memory region in DDR and firmware will have access to
> these table during reset and collects it on crash of SoC.
> 
> So, add the support of reserving ramoops region to be dynamically
> allocated early during boot if it is request through command line
> via 'dyn_ramoops_size=<size>' and fill up reserved resource structure
> and export the structure, so that it can be read by ramoops driver.
> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
>  Documentation/admin-guide/ramoops.rst |  7 ++++
>  fs/pstore/Kconfig                     | 15 +++++++++
>  fs/pstore/ram.c                       | 62 ++++++++++++++++++++++++++++++++---
>  include/linux/pstore_ram.h            |  5 +++
>  init/main.c                           |  2 ++
>  5 files changed, 87 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/admin-guide/ramoops.rst b/Documentation/admin-guide/ramoops.rst
> index e9f85142182d..af737adbf079 100644
> --- a/Documentation/admin-guide/ramoops.rst
> +++ b/Documentation/admin-guide/ramoops.rst
> @@ -33,6 +33,13 @@ memory are implementation defined, and won't work on many ARMs such as omaps.
>  Setting ``mem_type=2`` attempts to treat the memory region as normal memory,
>  which enables full cache on it. This can improve the performance.
>  
> +Ramoops memory region can also be allocated dynamically for a special case where
> +there is no requirement to access the logs from pstorefs on next boot instead there
> +is separate backend mechanism like minidump present which has awareness about the
> +dynamic ramoops region and can recover the logs. This is enabled via command line
> +parameter ``dyn_ramoops_size=<size>`` and should not be used in absence of
> +separate backend which knows how to recover this dynamic region.
> +
>  The memory area is divided into ``record_size`` chunks (also rounded down to
>  power of two) and each kmesg dump writes a ``record_size`` chunk of
>  information.
> diff --git a/fs/pstore/Kconfig b/fs/pstore/Kconfig
> index 3acc38600cd1..e13e53d7a225 100644
> --- a/fs/pstore/Kconfig
> +++ b/fs/pstore/Kconfig
> @@ -81,6 +81,21 @@ config PSTORE_RAM
>  
>  	  For more information, see Documentation/admin-guide/ramoops.rst.
>  
> +config PSTORE_DYNAMIC_RAMOOPS_REGION_RESERVATION
> +	bool "Reserve ramoops region dynamically"
> +	select PSTORE_RAM
> +	help
> +	  This enables the dynamic reservation of ramoops region for a special case
> +	  where there is no requirement to access the logs from pstorefs on next boot
> +	  instead there is separate backend mechanism like minidump present which has
> +	  awareness about the dynamic ramoops region and can recover the logs. This is
> +	  enabled via command line parameter dyn_ramoops_size=<size> and should not be
> +	  used in absence of separate backend which knows how to recover this dynamic
> +	  region.
> +
> +	  Note whenever this config is selected ramoops driver will be build statically
> +	  into kernel.
> +

Is there any advantage if we decouple this memory reservation from
pstore ram so that pstore ram can still be compiled as module? Asking
because you explicitly mentioned this limitation.

>  config PSTORE_ZONE
>  	tristate
>  	depends on PSTORE
> diff --git a/fs/pstore/ram.c b/fs/pstore/ram.c
> index 88b34fdbf759..a6c0da8cfdd4 100644
> --- a/fs/pstore/ram.c
> +++ b/fs/pstore/ram.c
> @@ -20,6 +20,7 @@
>  #include <linux/compiler.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> +#include <linux/memblock.h>
>  #include <linux/mm.h>
>  
>  #include "internal.h"
> @@ -103,6 +104,55 @@ struct ramoops_context {
>  };
>  
>  static struct platform_device *dummy;
> +static int dyn_ramoops_size;
> +/* Location of the reserved area for the dynamic ramoops */
> +static struct resource dyn_ramoops_res = {
> +	.name  = "ramoops",
> +	.start = 0,
> +	.end   = 0,
> +	.flags = IORESOURCE_BUSY | IORESOURCE_SYSTEM_RAM,
> +	.desc  = IORES_DESC_NONE,
> +};
> +
> +static int __init parse_dyn_ramoops_size(char *p)
> +{
> +	char *tmp;
> +
> +	dyn_ramoops_size = memparse(p, &tmp);
> +	if (p == tmp) {
> +		pr_err("ramoops: memory size expected\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +early_param("dyn_ramoops_size", parse_dyn_ramoops_size);

should not this code be under
CONFIG_PSTORE_DYNAMIC_RAMOOPS_REGION_RESERVATION?

> +
> +#ifdef CONFIG_PSTORE_DYNAMIC_RAMOOPS_REGION_RESERVATION
> +/*
> + * setup_dynamic_ramoops() - reserves memory for dynamic ramoops
> + *
> + * This enable dynamic reserve memory support for ramoops through
> + * command line.
> + */
> +void __init setup_dynamic_ramoops(void)
> +{
> +	unsigned long long ramoops_base;
> +	unsigned long long ramoops_size;
> +
> +	ramoops_base = memblock_phys_alloc_range(dyn_ramoops_size, SMP_CACHE_BYTES,
> +						 0, MEMBLOCK_ALLOC_NOLEAKTRACE);
> +	if (!ramoops_base) {
> +		pr_err("cannot allocate ramoops dynamic memory (size:0x%llx).\n",
> +			ramoops_size);
> +		return;
> +	}

This error needs to be propagated to ramoops_register_dummy() since it
rely on !dyn_ramoops_size . one way is to set dyn_ramoops_size to 0.

> +
> +	dyn_ramoops_res.start = ramoops_base;
> +	dyn_ramoops_res.end = ramoops_base + dyn_ramoops_size - 1;
> +	insert_resource(&iomem_resource, &dyn_ramoops_res);
> +}
> +#endif
>  
>  static int ramoops_pstore_open(struct pstore_info *psi)
>  {
> @@ -915,14 +965,18 @@ static void __init ramoops_register_dummy(void)
>  
>  	/*
>  	 * Prepare a dummy platform data structure to carry the module
> -	 * parameters. If mem_size isn't set, then there are no module
> -	 * parameters, and we can skip this.
> +	 * parameters. If mem_size isn't set, check for dynamic ramoops
> +	 * size and use if it is set.
>  	 */
> -	if (!mem_size)
> +	if (!mem_size && !dyn_ramoops_size)
>  		return;
>  

If mem_size and dyn_ramoops_size are set, you are taking
dyn_ramoops_size precedence here. The comment is a bit confusing, pls
review it once.

> -	pr_info("using module parameters\n");
> +	if (dyn_ramoops_size) {
> +		mem_size = dyn_ramoops_size;
> +		mem_address = dyn_ramoops_res.start;
> +	}
>  

Overall it Looks good to me. Thanks.

