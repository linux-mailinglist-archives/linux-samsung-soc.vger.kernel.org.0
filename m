Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8354708C99
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 19 May 2023 02:04:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbjESAEV (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 18 May 2023 20:04:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjESAEU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 18 May 2023 20:04:20 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8775C10C2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 18 May 2023 17:04:17 -0700 (PDT)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20230519000414epoutp0412dced101b8a9655d979f85beef911ed~gYpVm_io61080410804epoutp042
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 May 2023 00:04:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20230519000414epoutp0412dced101b8a9655d979f85beef911ed~gYpVm_io61080410804epoutp042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1684454654;
        bh=2AijH5HOaxXZ4vo+kJjwog9GPiJsBSUF13XmUyNUTZE=;
        h=From:To:Cc:Subject:Date:References:From;
        b=thjPKrjnTw+rTrnOrhkeeomJbjqAo50NP+NE4a0C95fLlcGIZ1cEJ0jbq5+eFst0V
         +8Y7FJQFKIL1vn+ebYtm7v5uC0n/WEYm5wbep/aIWYa6I2XZRHznOXoJhCXXlhchzw
         G68QLcHPUJMUAgigtzYZEr3v8JcWf/ZLrOKzLp5k=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20230519000414epcas1p2ab039a3b314177b99a82dab48b636430~gYpVRAhsn2846028460epcas1p2O;
        Fri, 19 May 2023 00:04:14 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.38.237]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4QMnBj12MWz4x9QB; Fri, 19 May
        2023 00:04:13 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
        epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
        6B.50.48553.8FCB6646; Fri, 19 May 2023 09:04:08 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
        20230519000408epcas1p4f5d90f588e7250d2d168d2943adef4f7~gYpPrjl4W2375523755epcas1p4X;
        Fri, 19 May 2023 00:04:08 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20230519000408epsmtrp2353f11e9b46c0602a417a678fb480faa~gYpPrBvBE2834628346epsmtrp2I;
        Fri, 19 May 2023 00:04:08 +0000 (GMT)
X-AuditID: b6c32a39-509937000001bda9-0b-6466bcf8db11
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        FD.EB.28392.7FCB6646; Fri, 19 May 2023 09:04:07 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.211]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20230519000407epsmtip231e4cf660112a7a067dd13021200155c~gYpPbrrFY0284802848epsmtip2I;
        Fri, 19 May 2023 00:04:07 +0000 (GMT)
From:   Inki Dae <inki.dae@samsung.com>
To:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     Inki Dae <inki.dae@samsung.com>
Subject: [PATCH] drm/exynos: vidi: fix a wrong error return
Date:   Fri, 19 May 2023 09:04:07 +0900
Message-Id: <20230519000407.60744-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMKsWRmVeSWpSXmKPExsWy7bCmge6PPWkpBveOyVhc+fqezWLS/Qks
        FjPO72NyYPa4332cyaNvyypGj8+b5AKYo7JtMlITU1KLFFLzkvNTMvPSbZW8g+Od403NDAx1
        DS0tzJUU8hJzU22VXHwCdN0yc4AWKSmUJeaUAoUCEouLlfTtbIryS0tSFTLyi0tslVILUnIK
        TAv0ihNzi0vz0vXyUkusDA0MjEyBChOyM9oPf2Uu6GOv6Nl9ga2B8TdrFyMnh4SAicT+zq3s
        XYxcHEICOxglGvuns4EkhAQ+MUrM+VEDkfjMKDH7wjQ2mI7X3/pZIRK7GCVuHT3ECOF8YZR4
        N6WZEaSKTUBVYuKK+2AdIgJuEk2HZ4LtYxZQlrjYv5QZxBYWsJZYN3sNmM0CVD917jYWEJtX
        wFJi7t1LjBDb5CVmXvrODhEXlDg58wkLxBx5ieats5lBFksILGKXmPLyDlSDi8TqB89ZIGxh
        iVfHt7BD2FISn9/tZYNomMwocef6ChYIZwajxOGf16G6jSX2L53M1MXIAbRCU2L9Ln2IsKLE
        zt9zGSE280m8+9rDClIiIcAr0dEmBFGiJHHs4g2oKRISF5ZMhAaXh8S3M4+hYRor8WbaQtYJ
        jPKzkPwzC8k/sxAWL2BkXsUollpQnJueWmxYYAqP1uT83E2M4NSmZbmDcfrbD3qHGJk4GA8x
        SnAwK4nwBvYlpwjxpiRWVqUW5ccXleakFh9iNAWG8ERmKdHkfGByzSuJNzSxNDAxMzI2sTA0
        M1QS5/3yVDtFSCA9sSQ1OzW1ILUIpo+Jg1OqgSnSh12KZ5pHkOe3aS5z7VynRDN43LzEd/ZT
        rfp1CfZfAWVCpz73+3m8+jzb8KqDvX/rpvg5bAvmuaTGztxy+7dOyb13wWaTLXUuSc645zX5
        PMNpG4kLPpez7ikudulkNd/DtdLv4NPurXNV2u4F5NmmxB6ZeIBnd1Vs8sZPcVPyjr19/eDl
        59S1gi+7V989+mv9vov1CWtDefbeqWZO3P7lUsjK9eYz9J99PyHVsM3Jd91bLT4uCaeW7DWv
        aqv3P70RkWR9/77C57XFff5hE62V+u1f/WJVi9jBsTDBXZd5JufLdYsviFxf8ma/JoPn1ss3
        l8crFs5ifi2kWZb26OPDuj4GLQaxzuWCRs/vq6srsRRnJBpqMRcVJwIANr62svYDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjluLIzCtJLcpLzFFi42LZdlhJXvf7nrQUgzcN1hZXvr5ns5h0fwKL
        xYzz+5gcmD3udx9n8ujbsorR4/MmuQDmKC6blNSczLLUIn27BK6M9sNfmQv62Ct6dl9ga2D8
        zdrFyMkhIWAi8fpbP5gtJLCDUWLPatEuRg6guITElq0cEKawxOHDxV2MXEAVnxgl/rc9Ygcp
        ZxNQlZi44j4biC0i4CHR/O04WJxZQFniYv9SZhBbWMBaYt3sNWA2C1D91LnbWEBsXgFLibl3
        LzFCnCAvMfPSd3aIuKDEyZlPWCDmyEs0b53NPIGRbxaS1CwkqQWMTKsYJVMLinPTc4sNC4zy
        Usv1ihNzi0vz0vWS83M3MYKDTEtrB+OeVR/0DjEycTAeYpTgYFYS4Q3sS04R4k1JrKxKLcqP
        LyrNSS0+xCjNwaIkznuh62S8kEB6YklqdmpqQWoRTJaJg1OqgYkpy6ah0ZNHaX2HqVHQSdGC
        ip7CJ65i3TObD8fW5jCdmSB5OnjGKdseLQ8lb4eJQrve7Zvwm8Ver+lallWjWISW7fy1NS0h
        y5pLd8/kfXxlQuDW9fMsF9c+mzjly7Mo9sO8KdtU5SY8qbOsO+ySJrtZIbXzw97PUxbps02v
        1WRaapIrGzhzTmvcy46MrzuDN2yesWY+r8iRGw+m1i26GB13XTl5U0V23p4tvZefLH3y8zdr
        mKZDffw1z+qvP0X/ClbteeX89krnoYCT2XMaOVkfOH9XivgYoXVG/vPK+jKF937bHtfeYp75
        L9Mye5/q7co/c8TV3sTNDrRKm649iembcHjlZMeCWSlxG5k8jiuxFGckGmoxFxUnAgDo4K0/
        oQIAAA==
X-CMS-MailID: 20230519000408epcas1p4f5d90f588e7250d2d168d2943adef4f7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230519000408epcas1p4f5d90f588e7250d2d168d2943adef4f7
References: <CGME20230519000408epcas1p4f5d90f588e7250d2d168d2943adef4f7@epcas1p4.samsung.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Fix a wrong error return by dropping an error return.

When vidi driver is remvoed, if ctx->raw_edid isn't same as fake_edid_info
then only what we have to is to free ctx->raw_edid so that driver removing
can work correctly - it's not an error case.

Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 4d56c8c799c5..f5e1adfcaa51 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -469,8 +469,6 @@ static int vidi_remove(struct platform_device *pdev)
 	if (ctx->raw_edid != (struct edid *)fake_edid_info) {
 		kfree(ctx->raw_edid);
 		ctx->raw_edid = NULL;
-
-		return -EINVAL;
 	}
 
 	component_del(&pdev->dev, &vidi_component_ops);
-- 
2.25.1

