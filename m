Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C29DDBAFF4
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 23 Sep 2019 10:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731871AbfIWIv1 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 23 Sep 2019 04:51:27 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:54418 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731734AbfIWIv0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Sep 2019 04:51:26 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x8N8nBFA006747;
        Mon, 23 Sep 2019 03:51:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=BjpMtBhJnZ6yh/cP1ZHvKQ1eEYxgByGKmNnK9h7ukFI=;
 b=FV0NWlKenyfQ9wRSBC+FzmSlIWKuiRI5Huzbh6gvWWvoXO2gD/MN+NfF2krpBpML4N6M
 vP919MnDOvEPBvrmYJHA38ERSbU8z7JljFdu0QF99uvs5N08V/FFZ4rTIOVZpbUQOQWg
 IhkSdYUbeqY44JdXjW5l2M10rM2RSwjI3KO6pZBxjQOS+CbCbOK+oPMPrIqzaywuHQ9E
 KMa9fZttu5DiKPOdrKWPk21QDsUQTW2flraMGhF85jp2OutEl2eL0+UFcPZTbZ/n02kh
 4O/kWd5xpPyPvac32mQ8jOZCv+Q7j+w6pkr5/3bhtuSHlRC+MhR1/3ZeVdYIQGiaaqQL Eg== 
Authentication-Results: ppops.net;
        spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
        by mx0a-001ae601.pphosted.com with ESMTP id 2v5h923796-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 23 Sep 2019 03:51:08 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 23 Sep
 2019 09:51:05 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Mon, 23 Sep 2019 09:51:05 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B94A02B3;
        Mon, 23 Sep 2019 08:51:05 +0000 (UTC)
Date:   Mon, 23 Sep 2019 08:51:05 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
CC:     <broonie@kernel.org>, <krzk@kernel.org>, <lgirdwood@gmail.com>,
        <sbkim73@samsung.com>, <alsa-devel@alsa-project.org>,
        <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <b.zolnierkie@samsung.com>,
        <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 04/10] ASoC: wm8994: Add support for MCLKn clock gating
Message-ID: <20190923085105.GN10204@ediswmail.ad.cirrus.com>
References: <20190920130218.32690-1-s.nawrocki@samsung.com>
 <CGME20190920130317eucas1p188d724710077d704f768798c6555c741@eucas1p1.samsung.com>
 <20190920130218.32690-5-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190920130218.32690-5-s.nawrocki@samsung.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com include:spf.protection.outlook.com
 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 priorityscore=1501
 adultscore=0 mlxlogscore=943 bulkscore=0 phishscore=0 clxscore=1015
 impostorscore=0 spamscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1908290000
 definitions=main-1909230089
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Sep 20, 2019 at 03:02:13PM +0200, Sylwester Nawrocki wrote:
> As an intermediate step before covering the clocking subsystem
> of the CODEC entirely by the clk API add handling of external CODEC's
> master clocks in DAPM events when the AIFn clocks are sourced directly
> from MCLKn; when FLLn are used we enable/disable respective MCLKn
> before/after FLLn is enabled/disabled.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---

Looks good to me:

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
