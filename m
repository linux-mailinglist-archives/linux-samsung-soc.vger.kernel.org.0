Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC671CCF83
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 11 May 2020 04:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729556AbgEKCOk (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 10 May 2020 22:14:40 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:34213 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729408AbgEKCOD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 10 May 2020 22:14:03 -0400
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20200511021400epoutp0269bc72cf7338c0057a23228ceb6db2eb~N14wvc-6H3178831788epoutp02w
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 May 2020 02:14:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20200511021400epoutp0269bc72cf7338c0057a23228ceb6db2eb~N14wvc-6H3178831788epoutp02w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1589163240;
        bh=4V8Pkuf0es9YJ6H7KkLlM7j/1ZRe4U2UUspvwS7zT7Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NSAnM0lNfOUdkwgh0y3SrPHGd9Df8IkTp2x6qohH2OMp7w06ug2HnkfnhgitYP7Vm
         Fp0CvkF8qjKgSG9t46nj7E6V0AxywUYXH7d3jCKMDcM3jIJLBn22j+ujcxmKkOwemp
         zV8mrxIHVS/ys01NMC76XXF7KoxpDe9mfx30Mi14=
Received: from epsmges5p2new.samsung.com (unknown [182.195.42.74]) by
        epcas5p4.samsung.com (KnoxPortal) with ESMTP id
        20200511021359epcas5p4d12cce62311338b30fcef63a4dede3f4~N14v6j7V03064630646epcas5p4U;
        Mon, 11 May 2020 02:13:59 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
        epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        31.AE.23569.7E4B8BE5; Mon, 11 May 2020 11:13:59 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
        20200511021359epcas5p24f652fd652a7b55c1ba90d01c03e8336~N14vlygp72932329323epcas5p2P;
        Mon, 11 May 2020 02:13:59 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200511021359epsmtrp1dd7e5f81707f209a2fccc300938b48e6~N14vjs64Q0628006280epsmtrp1S;
        Mon, 11 May 2020 02:13:59 +0000 (GMT)
X-AuditID: b6c32a4a-3b1ff70000005c11-04-5eb8b4e7d9b0
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        A1.64.25866.7E4B8BE5; Mon, 11 May 2020 11:13:59 +0900 (KST)
Received: from Jaguar.sa.corp.samsungelectronics.net (unknown
        [107.108.73.139]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200511021357epsmtip2f950cf834419353a9dc84e4ee51a79fe~N14te59Y30194601946epsmtip2p;
        Mon, 11 May 2020 02:13:56 +0000 (GMT)
From:   Alim Akhtar <alim.akhtar@samsung.com>
To:     robh@kernel.org
Cc:     devicetree@vger.kernel.org, linux-scsi@vger.kernel.org,
        krzk@kernel.org, avri.altman@wdc.com, martin.petersen@oracle.com,
        kwmad.kim@samsung.com, stanley.chu@mediatek.com,
        cang@codeaurora.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v8 05/10] scsi: ufs: add quirk to fix abnormal ocs fatal
 error
Date:   Mon, 11 May 2020 07:30:26 +0530
Message-Id: <20200511020031.25730-6-alim.akhtar@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200511020031.25730-1-alim.akhtar@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmleLIzCtJLcpLzFFi42LZdlhTQ/f5lh1xBrPbNC0ezNvGZvHy51U2
        i0/rl7FazD9yjtXi/PkN7BY3txxlsdj0+BqrxeVdc9gsZpzfx2TRfX0Hm8Xy4/+YLP7v2cFu
        sXTrTUYHXo/Lfb1MHptWdbJ5bF5S79Fycj+Lx8ent1g8+rasYvT4vEnOo/1AN1MARxSXTUpq
        TmZZapG+XQJXxsonb5kL2vkq5l0qaGA8w93FyMkhIWAi0bj8NmsXIxeHkMBuRom1V+eyQzif
        GCVe/drFDOF8ZpTY8v0zK0zLnQ/zGCESuxgldrfsg2ppYZJ4NfUxO0gVm4C2xN3pW5hAbBEB
        YYkj39oYQWxmgRtMEg9WuoDYwgIBEm13f4JNZRFQlTg0eQZYL6+AjcTZs+eZIbbJS6zecADM
        5hSwlZjWsJ0FZJmEQCeHxJ6729khilwkTk9pZISwhSVeHd8CFZeSeNnfBmRzANnZEj27jCHC
        NRJL5x1jgbDtJQ5cmcMCUsIsoCmxfpc+xJl8Er2/nzBBdPJKdLQJQVSrSjS/uwrVKS0xsbsb
        GiYeEt8nLIaGyQRGiUfNT9knMMrOQpi6gJFxFaNkakFxbnpqsWmBUV5quV5xYm5xaV66XnJ+
        7iZGcDrR8trB+PDBB71DjEwcjIcYJTiYlUR4l+fuiBPiTUmsrEotyo8vKs1JLT7EKM3BoiTO
        m9S4JU5IID2xJDU7NbUgtQgmy8TBKdXAtNZ8rdFf/243jQsNyy0T+8MKU9lz4rxcGr2COidP
        ux4R+UtEXEZis/v9bf7zg9xE/3gvZf+nvkkxclXS2tBnSufXd+YUu1at4f723XvmNOlnFfun
        Lc+8+27SnnSHndx3hGo4u46si9gopb7wyvfq3GuNSqqcUfJHxWrONc6b9fLKXq3Tf4RT+tlW
        694Mkj6/4BODY+vDazeece9+/v/Xwt3bvnyoPmF8ymBFt8J2QZUtLj8K1De4TmwO+/jH8bLW
        8V1W6kcnv7h6w9tcpWTN8WMfM26aTfNvMUn9HrU3+alxvl70M2GBNdZ/2RvvBjDse/llIsvz
        r39db05jXzuRsflLrLVzZpvX9vknGgu2sSixFGckGmoxFxUnAgDR3uHRlgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrELMWRmVeSWpSXmKPExsWy7bCSvO7zLTviDFYeELR4MG8bm8XLn1fZ
        LD6tX8ZqMf/IOVaL8+c3sFvc3HKUxWLT42usFpd3zWGzmHF+H5NF9/UdbBbLj/9jsvi/Zwe7
        xdKtNxkdeD0u9/UyeWxa1cnmsXlJvUfLyf0sHh+f3mLx6NuyitHj8yY5j/YD3UwBHFFcNimp
        OZllqUX6dglcGSufvGUuaOermHepoIHxDHcXIyeHhICJxJ0P8xi7GLk4hAR2MErcOP+FESIh
        LXF94wR2CFtYYuW/5+wQRU1MEndW7wRLsAloS9ydvoUJxBYBKjryrQ2smVngGZPEqYelILaw
        gJ/E5fPb2EBsFgFViUOTZ4D18grYSJw9e54ZYoG8xOoNB8BsTgFbiWkN21lAbCGgmhmbNrNO
        YORbwMiwilEytaA4Nz232LDAKC+1XK84Mbe4NC9dLzk/dxMjOJi1tHYw7ln1Qe8QIxMH4yFG
        CQ5mJRHe5bk74oR4UxIrq1KL8uOLSnNSiw8xSnOwKInzfp21ME5IID2xJDU7NbUgtQgmy8TB
        KdXAZB7Cuv3p4bWcF1pvGhySKIn40vrh/rTPaQl7lEU1G5wdJk6foJ7h3h4o0M5wS6fASINt
        2Rzp+af/S+XHPkl/EP3XhzNUj3XR71SmyzkFf77E9Au+dOTij2YVMTl2bcveu++e6F8/WyQU
        avB7fa7bfbvdCfZMP8/FXqkwVPd7XWp+scfuvvbSf43ul99aH7mx1FFNZrXv5Bmbw5Zw7miu
        WqUi+MCq/Y2ORK8u96aZp759clwqc+pehsf63YvFvjhtvSi8YPopDdOwpuy9a/j/v1/D9OP4
        b7bDt+I7DsV1LPpwomx2+q6Lf2bEr/j+UcJXfOdKz3jnkxdEPO+zznaq8ne3m3NWpmh11B+7
        Vd9bXiqxFGckGmoxFxUnAgASi6fY1QIAAA==
X-CMS-MailID: 20200511021359epcas5p24f652fd652a7b55c1ba90d01c03e8336
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20200511021359epcas5p24f652fd652a7b55c1ba90d01c03e8336
References: <20200511020031.25730-1-alim.akhtar@samsung.com>
        <CGME20200511021359epcas5p24f652fd652a7b55c1ba90d01c03e8336@epcas5p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Kiwoong Kim <kwmad.kim@samsung.com>

Some controller like Exynos determines if FATAL ERROR (0x7)
in OCS field in UTRD occurs for values other than GOOD (0x0)
in STATUS field in response upiu as well as errors that a
host controller can't cover.
This patch is to prevent from reporting command results in
those cases.

Reviewed-by: Avri Altman <avri.altman@wdc.com>
Signed-off-by: Kiwoong Kim <kwmad.kim@samsung.com>
Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 drivers/scsi/ufs/ufshcd.c | 6 ++++++
 drivers/scsi/ufs/ufshcd.h | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index ba093d0d0942..33ebffa8257d 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -4794,6 +4794,12 @@ ufshcd_transfer_rsp_status(struct ufs_hba *hba, struct ufshcd_lrb *lrbp)
 	/* overall command status of utrd */
 	ocs = ufshcd_get_tr_ocs(lrbp);
 
+	if (hba->quirks & UFSHCD_QUIRK_BROKEN_OCS_FATAL_ERROR) {
+		if (be32_to_cpu(lrbp->ucd_rsp_ptr->header.dword_1) &
+					MASK_RSP_UPIU_RESULT)
+			ocs = OCS_SUCCESS;
+	}
+
 	switch (ocs) {
 	case OCS_SUCCESS:
 		result = ufshcd_get_req_rsp(lrbp->ucd_rsp_ptr);
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index a9b9ace9fc72..e1d09c2c4302 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -541,6 +541,12 @@ enum ufshcd_quirks {
 	 * resolution of the values of PRDTO and PRDTL in UTRD as byte.
 	 */
 	UFSHCD_QUIRK_PRDT_BYTE_GRAN			= 1 << 9,
+
+	/*
+	 * This quirk needs to be enabled if the host controller reports
+	 * OCS FATAL ERROR with device error through sense data
+	 */
+	UFSHCD_QUIRK_BROKEN_OCS_FATAL_ERROR		= 1 << 10,
 };
 
 enum ufshcd_caps {
-- 
2.17.1

