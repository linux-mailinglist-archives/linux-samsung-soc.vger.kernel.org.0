Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA743BB159
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 23 Sep 2019 11:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407084AbfIWJZa (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 23 Sep 2019 05:25:30 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:27944 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2407083AbfIWJZ3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Sep 2019 05:25:29 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x8N9OhOp004541;
        Mon, 23 Sep 2019 04:25:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=OenETI2BlyjKLCH8My5ZcKXoQz9o782ZPMAD8kB1A9Y=;
 b=I9VIqGAavSGxcFxwBs8KSWLUHZ/NGrnt9Enxz4YMZe57fIC9yRlsXcpDYcQ9PeQz6vuJ
 AQhDwBRlmZ8N0DDZ9R8zJuwmzo1gLhalJN1DsDJs4aPzBzc+UPobGnu9fLwXycJriV8N
 wObM9s9Ln1DMN0J3VNgcoPgB4epsjdqLFB8vUQVMaZiCm8/DhtIwaKoeBa4W7q4I/E05
 LnQOvjk+HoxJbsQzxKu52f1swLW8rvNdfqZLKDSc86J/AK7kjdRVAd9eXmVZwrCw5Lu4
 0DEXCk58FQjeywMSNNdNddmbO49xyFYumqlP2DfCS9aKR2M4qfD2DC8L4N0oqhZUrM5g CA== 
Authentication-Results: ppops.net;
        spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
        by mx0a-001ae601.pphosted.com with ESMTP id 2v5h9238qa-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 23 Sep 2019 04:25:19 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 23 Sep
 2019 10:25:17 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Mon, 23 Sep 2019 10:25:17 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 612982C1;
        Mon, 23 Sep 2019 09:25:17 +0000 (UTC)
Date:   Mon, 23 Sep 2019 09:25:17 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
CC:     <krzk@kernel.org>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <sbkim73@samsung.com>, <alsa-devel@alsa-project.org>,
        <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <b.zolnierkie@samsung.com>,
        <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 03/10] ASoC: wm8994: Add support for setting MCLK
 clock rate
Message-ID: <20190923092517.GO10204@ediswmail.ad.cirrus.com>
References: <20190920130218.32690-1-s.nawrocki@samsung.com>
 <CGME20190920130316eucas1p2de713006a13c62c0b895c2e33e0d14c7@eucas1p2.samsung.com>
 <20190920130218.32690-4-s.nawrocki@samsung.com>
 <7334ce45-f192-4421-aa3d-d142582153ef@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7334ce45-f192-4421-aa3d-d142582153ef@samsung.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com include:spf.protection.outlook.com
 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 priorityscore=1501
 adultscore=0 mlxlogscore=742 bulkscore=0 phishscore=0 clxscore=1015
 impostorscore=0 spamscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1908290000
 definitions=main-1909230094
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Sep 23, 2019 at 11:10:48AM +0200, Sylwester Nawrocki wrote:
> On 9/20/19 15:02, Sylwester Nawrocki wrote:
> > Extend the set_sysclk() handler so we also set frequency of the MCLK1,
> > MCLK2 clocks through clk API when those clocks are specified in DT.
> > 
> > Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Sorry, I squashed other patch to this one but forgot to remove above tags, 
> not sure if those still stand as there was rather significant change in 
> the patch. 
> 

I am happy with my tag being there.

Thanks,
Charles
