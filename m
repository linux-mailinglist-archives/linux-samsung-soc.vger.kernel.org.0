Return-Path: <linux-samsung-soc+bounces-1623-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF68843DFF
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 31 Jan 2024 12:12:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E4481F244E0
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 31 Jan 2024 11:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 574AB7BB15;
	Wed, 31 Jan 2024 11:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="l4B7jdgS"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7467BB1A;
	Wed, 31 Jan 2024 11:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706699428; cv=none; b=p/aHO3/fH3hZobc3DWJRtYF+Y0kPTpfs81MazpSBJ3xeLJFOQVmlAHF4T0cJ1hSelGrAEj9nKnbKmRBPDsY6SKWSYp4x5vWCIrb9YiXc2Lry7qLr8Nh8ZpLvi2s2LBTNBVEfXUZSa8thsEToSm52mmkN3ZovZPgi7pRfdmK1Rzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706699428; c=relaxed/simple;
	bh=2aMh3wOVlqpU6igYMIpqzplWbecfTNjZwrEdrt9ImGI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rd6pxEkWDnX/nQegWYWB18TlifgMaFkzbBSn9g8e1unD5QkfkggALOqZc1JlITGuezVQYtmAYD9f5KPZbOJbeQPLzKzHymONFbYBTHfeFawZPz5QLdxnXnJsSIls0ZrGS0oKxEs2eYtK/hhiX1/WcUm5K/RLSi84F1tVagTq0aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=l4B7jdgS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40VAqrvi007444;
	Wed, 31 Jan 2024 11:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=eu4+fj6D3iVrbZw4NhJ6j+Qbrx8bAr3vCJR8zRmV4mQ=; b=l4
	B7jdgSAkuijaaKRNlOS7YDOhSpTxT/v3DDSh7MGPs8+gfHI1kohtWwPMPzqcypTZ
	uSN8IFay+37ZPV4rHzz02FtU1j5Qicl5inXAF1FEOqXIvGxxKjXtqXhLjIJ5TGZF
	xEepTxzCHYyzbAN+HLyhg7dZAE2EPaOdH6er1dwfXu24/87VqFyS+MlwUbQajsNc
	2HBmE0uO9r9vKsCg4dXMBD5MoLiuBZyEffrTPrcWVg1PLTHp1csz8Vgjxdd8D8Mb
	jQ08bqw5OoCLsWOXsf0QIQkAVQHcoLK1zw94n6BeyPCJkYjk1ElYKAH0vWBujqjq
	jg7UQhdSTIP0kSOCFLSw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vyb0csgrk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 11:10:05 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40VBA4Su019587
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 11:10:04 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 31 Jan 2024 03:09:55 -0800
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: <corbet@lwn.net>, <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <keescook@chromium.org>, <tony.luck@intel.com>,
        <gpiccoli@igalia.com>, <mathieu.poirier@linaro.org>, <vigneshr@ti.com>,
        <nm@ti.com>, <matthias.bgg@gmail.com>, <kgene@kernel.org>,
        <alim.akhtar@samsung.com>, <bmasney@redhat.com>
CC: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_mojha@quicinc.com>
Subject: [PATCH v8 09/10] pstore/ram: Add ramoops information notifier support
Date: Wed, 31 Jan 2024 16:38:36 +0530
Message-ID: <20240131110837.14218-10-quic_mojha@quicinc.com>
X-Mailer: git-send-email 2.43.0.254.ga26002b62827
In-Reply-To: <20240131110837.14218-1-quic_mojha@quicinc.com>
References: <20240131110837.14218-1-quic_mojha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3fMz-JiJ9WgO2rLSLiL_IJ8WvLdp5K0s
X-Proofpoint-ORIG-GUID: 3fMz-JiJ9WgO2rLSLiL_IJ8WvLdp5K0s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_06,2024-01-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401310084

Client like minidump is interested in knowing ramoops
individual zone addresses and their size so that it
could register them with its table.

Let's introduce a info notifier in ramoops which
gets called when ramoops driver probes successfully
and it passes the ramoops region information to the
passed callback by the client and If the call for
ramoops ready register comes after ramoops probe
than call the callback directly.

Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
 fs/pstore/ram.c            | 114 +++++++++++++++++++++++++++++++++++++
 include/linux/pstore_ram.h |  15 +++++
 2 files changed, 129 insertions(+)

diff --git a/fs/pstore/ram.c b/fs/pstore/ram.c
index 1faf0835700b..bd94c11e43ff 100644
--- a/fs/pstore/ram.c
+++ b/fs/pstore/ram.c
@@ -22,6 +22,8 @@
 #include <linux/of_address.h>
 #include <linux/memblock.h>
 #include <linux/mm.h>
+#include <linux/mutex.h>
+#include <linux/notifier.h>
 
 #include "internal.h"
 #include "ram_internal.h"
@@ -101,6 +103,19 @@ struct ramoops_context {
 	unsigned int ftrace_read_cnt;
 	unsigned int pmsg_read_cnt;
 	struct pstore_info pstore;
+	struct blocking_notifier_head ramoops_notifiers;
+	bool ramoops_ready;
+	/*
+	 * Lock to serialize access to ramoops_ready and to not
+	 * miss any ongoing notifier registration while ramoops
+	 * probe is in progress.
+	 */
+	struct mutex lock;
+};
+
+struct ramoops_backend {
+	struct	notifier_block nb;
+	int	(*fn)(const char *name, int id, void *vaddr, phys_addr_t paddr, size_t size);
 };
 
 static struct platform_device *dummy;
@@ -501,6 +516,8 @@ static struct ramoops_context oops_cxt = {
 		.write_user	= ramoops_pstore_write_user,
 		.erase	= ramoops_pstore_erase,
 	},
+	.ramoops_notifiers = BLOCKING_NOTIFIER_INIT(oops_cxt.ramoops_notifiers),
+	.lock   = __MUTEX_INITIALIZER(oops_cxt.lock),
 };
 
 static void ramoops_free_przs(struct ramoops_context *cxt)
@@ -666,6 +683,98 @@ static int ramoops_init_prz(const char *name,
 	return 0;
 }
 
+static int __ramoops_info_notifier(struct ramoops_context *cxt, int (*fn)(const char *,
+				   int, void *, phys_addr_t, size_t))
+{
+	struct persistent_ram_zone *prz;
+	int ret;
+	int i;
+
+	for (i = 0; i < cxt->max_dump_cnt; i++) {
+		prz = cxt->dprzs[i];
+		ret = fn("dmesg", i, prz->vaddr, prz->paddr, prz->size);
+		if (ret < 0)
+			goto err;
+	}
+
+	if (cxt->console_size) {
+		prz = cxt->cprz;
+		ret = fn("console", 0, prz->vaddr, prz->paddr, prz->size);
+		if (ret < 0)
+			goto err;
+	}
+
+	for (i = 0; i < cxt->max_ftrace_cnt; i++) {
+		prz = cxt->fprzs[i];
+		ret = fn("ftrace", i, prz->vaddr, prz->paddr, prz->size);
+		if (ret < 0)
+			goto err;
+	}
+
+	if (cxt->pmsg_size) {
+		prz = cxt->mprz;
+		ret = fn("pmsg", 0, prz->vaddr, prz->paddr, prz->size);
+		if (ret < 0)
+			goto err;
+	}
+
+err:
+	return ret;
+}
+
+static int ramoops_info_notifier(struct notifier_block *nb, unsigned long event,
+				 void *data)
+{
+	struct ramoops_backend *b_info = container_of(nb, struct ramoops_backend, nb);
+	struct ramoops_context *cxt = data;
+
+	return __ramoops_info_notifier(cxt, b_info->fn);
+}
+
+void *register_ramoops_info_notifier(int (*fn)(const char *, int,
+				     void *, phys_addr_t, size_t))
+{
+	struct ramoops_context *cxt = &oops_cxt;
+	struct ramoops_backend *b_info;
+
+	mutex_lock(&cxt->lock);
+	/*
+	 * There is no need to register callback if ramoops probe
+	 * is already done instead, call the callback directly
+	 */
+	if (cxt->ramoops_ready) {
+		mutex_unlock(&cxt->lock);
+		__ramoops_info_notifier(cxt, fn);
+		return NULL;
+	}
+
+	b_info = kzalloc(sizeof(*b_info), GFP_KERNEL);
+	if (!b_info) {
+		b_info = ERR_PTR(-ENOMEM);
+		goto out;
+	}
+
+	b_info->fn = fn;
+	b_info->nb.notifier_call = ramoops_info_notifier;
+	blocking_notifier_chain_register(&cxt->ramoops_notifiers, &b_info->nb);
+
+out:
+	mutex_unlock(&cxt->lock);
+	return b_info;
+}
+EXPORT_SYMBOL_GPL(register_ramoops_info_notifier);
+
+void unregister_ramoops_info_notifier(void *b_info)
+{
+	struct ramoops_context *cxt = &oops_cxt;
+	struct ramoops_backend *tmp = b_info;
+
+	mutex_lock(&cxt->lock);
+	blocking_notifier_chain_unregister(&cxt->ramoops_notifiers, &tmp->nb);
+	mutex_unlock(&cxt->lock);
+}
+EXPORT_SYMBOL_GPL(unregister_ramoops_info_notifier);
+
 /* Read a u32 from a dt property and make sure it's safe for an int. */
 static int ramoops_parse_dt_u32(struct platform_device *pdev,
 				const char *propname,
@@ -915,6 +1024,11 @@ static int ramoops_probe(struct platform_device *pdev)
 	ramoops_pmsg_size = pdata->pmsg_size;
 	ramoops_ftrace_size = pdata->ftrace_size;
 
+	mutex_lock(&cxt->lock);
+	cxt->ramoops_ready = true;
+	mutex_unlock(&cxt->lock);
+	blocking_notifier_call_chain(&cxt->ramoops_notifiers, 0, cxt);
+
 	pr_info("using 0x%lx@0x%llx, ecc: %d\n",
 		cxt->size, (unsigned long long)cxt->phys_addr,
 		cxt->ecc_info.ecc_size);
diff --git a/include/linux/pstore_ram.h b/include/linux/pstore_ram.h
index 1efff7a38333..7e27cfc09243 100644
--- a/include/linux/pstore_ram.h
+++ b/include/linux/pstore_ram.h
@@ -39,6 +39,21 @@ struct ramoops_platform_data {
 	struct persistent_ram_ecc_info ecc_info;
 };
 
+#if IS_ENABLED(CONFIG_PSTORE_RAM)
+void *register_ramoops_info_notifier(int (*fn)(const char *name, int id,
+				     void *vaddr, phys_addr_t paddr,
+				     size_t size));
+void unregister_ramoops_info_notifier(void *nb_cookie);
+#else
+static inline void *register_ramoops_info_notifier(int (*fn)(const char *name, int id,
+						   void *vaddr, phys_addr_t paddr,
+						   size_t size))
+{
+	return NULL;
+}
+static inline void unregister_ramoops_info_notifier(void *nb_cookie) { }
+#endif
+
 #ifdef CONFIG_PSTORE_DYNAMIC_RAMOOPS
 void __init setup_dynamic_ramoops(void);
 #else
-- 
2.43.0.254.ga26002b62827


