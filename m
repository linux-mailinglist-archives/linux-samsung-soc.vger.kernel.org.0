Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 201774EE55A
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  1 Apr 2022 02:28:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243530AbiDAA3v (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 31 Mar 2022 20:29:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243525AbiDAA3u (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 31 Mar 2022 20:29:50 -0400
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47C6924CEFF
        for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Mar 2022 17:28:01 -0700 (PDT)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20220401002759epoutp01b0dfcfe8cbb60cd9bcb726e91bf54b82~hnjKp4Osi1976919769epoutp01J
        for <linux-samsung-soc@vger.kernel.org>; Fri,  1 Apr 2022 00:27:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20220401002759epoutp01b0dfcfe8cbb60cd9bcb726e91bf54b82~hnjKp4Osi1976919769epoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1648772879;
        bh=MgIWLzmWSIBnYNBZNrfdV7dlNnG66lL3CZXpX7HACIw=;
        h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
        b=vJtwTK4+qhxUUNHtfi36ovXZ3hqrghgGrL5PXFhb1KFmIYlK99DMrV28TzxXj2ly2
         c8CaGAvpCepFgW5vpcbyRTUKja2QOeWHgWNvav1oPgXFNsCaNkRVXqWAuXhIs1+U4i
         NssBvhvNRT4oVHP0zCR2xlctAr7123Ukqy+V6njM=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20220401002758epcas2p2515ee6f68b75f93997992f9b05d73934~hnjKHCy-r1219212192epcas2p2I;
        Fri,  1 Apr 2022 00:27:58 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.89]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4KV1Gg09Rrz4x9QF; Fri,  1 Apr
        2022 00:27:55 +0000 (GMT)
X-AuditID: b6c32a45-513ff700000228cc-9e-62464709dea1
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        9F.7A.10444.90746426; Fri,  1 Apr 2022 09:27:53 +0900 (KST)
Mime-Version: 1.0
Subject: [PATCH v3] thermal: exynos: fix masking value for exynos7
 temp_error
Reply-To: hypmean.kim@samsung.com
Sender: Sang Min Kim <hypmean.kim@samsung.com>
From:   Sang Min Kim <hypmean.kim@samsung.com>
To:     "bzolnier@gmail.com" <bzolnier@gmail.com>,
        "krzk@kernel.org" <krzk@kernel.org>,
        "rafael@kernel.org" <rafael@kernel.org>,
        "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
        "amitk@kernel.org" <amitk@kernel.org>,
        "rui.zhang@intel.com" <rui.zhang@intel.com>,
        ALIM AKHTAR <alim.akhtar@samsung.com>,
        "edubezval@gmail.com" <edubezval@gmail.com>
CC:     "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <20220401002153.62648-1-hypmean.kim@samsung.com>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20220401002753epcms2p6cd5882f4909247461434f42e933591af@epcms2p6>
Date:   Fri, 01 Apr 2022 09:27:53 +0900
X-CMS-MailID: 20220401002753epcms2p6cd5882f4909247461434f42e933591af
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-CPGSPASS: Y
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOJsWRmVeSWpSXmKPExsWy7bCmqS6nu1uSwfqluhYP5m1jszg8v8Li
        +5brTBYvD2lazPssazH/yjVWi/PnN7BbbHoMZF3eNYfN4nPvEUaLGef3MVnM/TKV2eLJwz42
        B16PnbPusnss3vOSyWPTqk42jzvX9rB5bF5S79G3ZRWjx+dNcgHsUdk2GamJKalFCql5yfkp
        mXnptkrewfHO8aZmBoa6hpYW5koKeYm5qbZKLj4Bum6ZOUCnKimUJeaUAoUCEouLlfTtbIry
        S0tSFTLyi0tslVILUnIKzAv0ihNzi0vz0vXyUkusDA0MjEyBChOyM1b/ustU8EWp4uq0d+wN
        jA1KXYycHBICJhI/tnxjB7GFBHYwSvRdYupi5ODgFRCU+LtDGCQsLOAvcenpcWaIEkWJlzu2
        M0PE9SRubvwM1somoCPxuPU+UCsXh4jAEyaJ89/PMoI4zAIzmCTOdp1ghVjGKzGj/SkLhC0t
        sX35VkaQZZwCthKH11dChDUkfizrZYawRSVurn7LDmO/PzafEcIWkWi9dxaqRlDiwc/dUHFJ
        iU2Ht0PVV0vc2ricFeQGCYEGRonWb03MILskBPQldlw3hvjRV2L5X1+QchYBVYk/m+ayQVS4
        SOxucwYJMwtoSyxb+BqskVlAU2L9Ln2ICmWJI7dYYF5q2PibHZ3NLMAn0XH4L1x8x7wnTBC2
        qsTOTd3sExiVZyGCeRaSXbMQdi1gZF7FKJZaUJybnlpsVGAIj9jk/NxNjOAUq+W6g3Hy2w96
        hxiZOBgPMUpwMCuJ8F6NdU0S4k1JrKxKLcqPLyrNSS0+xGgK9OREZinR5Hxgks8riTc0sTQw
        MTMzNDcyNTBXEuf1StmQKCSQnliSmp2aWpBaBNPHxMEp1cB0tjrINr/lwE4h/rkXFlnNM9ol
        8+uZ07azkWv4Hy4vWXv+6LFdqVkzfZIFrvx9KaTmovAx6J8mMI6yWRasm9Uv/Fz0nZJO5o1C
        htdmhz37Dp+YJXpw0ZN0/rJ5SZc+PGXJPr7pTEdxeY3dnfmrg95qO+/e5t7ku38O05X+6wY/
        pP5PcDn4+st82Zd134xWS+7arXDJxkql2YbHvidSR/N5qvOpWcd+Cb/dxMFjF5zymnNxTYZM
        28ukb04Fd11vr9m4fR/rA+G+8Lts+qvv66fPYDKYmnH3SPGmQm7uM8q7NlnFxs2elCO8dduq
        W2pHXGT2aXJ+75/1lXeWXbKRenX0ueeXW3nZnN+2N8Sc9t+mxFKckWioxVxUnAgAZtSfJzoE
        AAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220401002131epcas2p320f8513a9bd1413af0ace6c20f2caba6
References: <20220401002153.62648-1-hypmean.kim@samsung.com>
        <CGME20220401002131epcas2p320f8513a9bd1413af0ace6c20f2caba6@epcms2p6>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Modify=C2=A0mask=C2=A0value=C2=A0for=C2=A0the=C2=A0temp_error=C2=A0in=C2=A0=
the=C2=A0sanitize_temp_error()=C2=A0function.=0D=0A=C2=A0=0D=0Asanitize_tem=
p_error=C2=A0masks=C2=A0temp_error2=C2=A0with=C2=A0EXYNOS_TMU_TEMP_MASK(0xf=
f)=C2=A0value=0D=0Aeven=C2=A0in=C2=A0the=C2=A0case=C2=A0of=C2=A0EXYNOS7.=C2=
=A0In=C2=A0addition,=C2=A0when=C2=A0entering=C2=A0the=C2=A0if=C2=A0statemen=
t,=0D=0Aboth=C2=A0temp_error1=C2=A0and=C2=A02=C2=A0are=C2=A0masked=C2=A0wit=
h=C2=A0EXYNOS_TMU_TEMP_MASK(0xff).=0D=0ABy=C2=A0modifying=C2=A0to=C2=A0use=
=C2=A0the=C2=A0previously=C2=A0declared=C2=A0local=C2=A0variable=C2=A0tmu_t=
emp_mask,=0D=0Athe=C2=A0mask=C2=A0value=C2=A0suitable=C2=A0for=C2=A0the=C2=
=A0SOC=C2=A0can=C2=A0be=C2=A0applied.=0D=0A=C2=A0=0D=0AFixes:=C2=A0aef27b65=
8b43=C2=A0(=22thermal:=C2=A0exynos:=C2=A0use=C2=A0sanitize_temp_error()=C2=
=A0in=C2=A0exynos7_tmu_initialize()=22)=0D=0ASigned-off-by:=C2=A0sangmin=C2=
=A0kim=C2=A0<hypmean.kim=40samsung.com>=0D=0AReviewed-by:=C2=A0Krzysztof=C2=
=A0Kozlowski=C2=A0<krzysztof.kozlowski=40linaro.org>=0D=0A---=0D=0A=C2=A0V2=
=C2=A0->=C2=A0V3:=C2=A0Modify=C2=A0the=C2=A0location=C2=A0of=C2=A0fixes=C2=
=A0tag=C2=A0and=C2=A0add=C2=A0reviewed=C2=A0tag=0D=0A=C2=A0V1=C2=A0->=C2=A0=
V2:=C2=A0Add=C2=A0fixes=C2=A0tag=0D=0A=C2=A0=0D=0A=C2=A0drivers/thermal/sam=
sung/exynos_tmu.c=C2=A0=7C=C2=A06=C2=A0+++---=0D=0A=C2=A01=C2=A0file=C2=A0c=
hanged,=C2=A03=C2=A0insertions(+),=C2=A03=C2=A0deletions(-)=0D=0A=C2=A0=0D=
=0Adiff=C2=A0--git=C2=A0a/drivers/thermal/samsung/exynos_tmu.c=C2=A0b/drive=
rs/thermal/samsung/exynos_tmu.c=0D=0Aindex=C2=A0f4ab4c5b4b62..08c63fe5566e=
=C2=A0100644=0D=0A---=C2=A0a/drivers/thermal/samsung/exynos_tmu.c=0D=0A+++=
=C2=A0b/drivers/thermal/samsung/exynos_tmu.c=0D=0A=40=40=C2=A0-243,17=C2=A0=
+243,17=C2=A0=40=40=C2=A0static=C2=A0void=C2=A0sanitize_temp_error(struct=
=C2=A0exynos_tmu_data=C2=A0*data,=C2=A0u32=C2=A0trim_info)=0D=0A=C2=A0=0D=
=0A=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0data->temp_error1=
=C2=A0=3D=C2=A0trim_info=C2=A0&=C2=A0tmu_temp_mask;=0D=0A=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0data->temp_error2=C2=A0=3D=C2=A0((trim_=
info=C2=A0>>=C2=A0EXYNOS_TRIMINFO_85_SHIFT)=C2=A0&=0D=0A-=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0EXYNOS_TMU_TEMP_MASK);=0D=0A+=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0tmu_temp_mask);=0D=0A=C2=A0=0D=0A=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if=C2=A0(=21data->temp_error1=C2=A0=7C=7C=
=0D=0A=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0(data->min_efuse_value=C2=A0>=C2=A0data->temp_error1)=C2=A0=7C=7C=
=0D=0A=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0(data->temp_error1=C2=A0>=C2=A0data->max_efuse_value))=0D=0A-=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0data->temp_error1=C2=A0=3D=C2=A0data->efuse_value=C2=A0&=
=C2=A0EXYNOS_TMU_TEMP_MASK;=0D=0A+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0data->temp_error1=
=C2=A0=3D=C2=A0data->efuse_value=C2=A0&=C2=A0tmu_temp_mask;=0D=0A=C2=A0=0D=
=0A=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if=C2=A0(=21data->=
temp_error2)=0D=0A=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0data->temp_error2=C2=A0=3D=0D=
=0A=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0(data->efuse_value=C2=A0>>=C2=A0EXYNOS_TRIMINFO_85_SHIFT)=C2=A0&=0D=0A-=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0EXYNOS=
_TMU_TEMP_MASK;=0D=0A+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0tmu_temp_mask;=0D=0A=C2=A0=7D=0D=0A=C2=A0=0D=0A=C2=A0stat=
ic=C2=A0int=C2=A0exynos_tmu_initialize(struct=C2=A0platform_device=C2=A0*pd=
ev)=0D=0A--=0D=0A2.9.5=0D=0A=C2=A0=0D=0A=C2=A0
