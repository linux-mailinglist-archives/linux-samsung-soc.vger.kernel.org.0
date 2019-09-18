Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0B61B638F
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 18 Sep 2019 14:51:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727435AbfIRMvd (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 18 Sep 2019 08:51:33 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:37644 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725902AbfIRMvc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 18 Sep 2019 08:51:32 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x8ICoU91017902;
        Wed, 18 Sep 2019 07:51:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=wKNZX+fj//vdEHFqSAQU3SGsvWPgOaqjf7mXMYHKHtA=;
 b=DBPfGb5Ty99fs6NTUCeP5VmjS6XlkxKjLlro1crnhMBur6B/acJM51Y3ct6p3IoPwkxT
 2gZkupAM3wEUKIdiCShn9s/7/Vtk3pkzbrXwLMjjd4lwdXb2UfZGQVJlWW+P8Q1s6DWk
 UhC1vgmUy9w2IjY6gYSgmhwdiTXhrqnaVZxWooBW55dlT22kRGhmmbvtAjPtAis3pj4r
 BMI2muINEbh8bX1tw8l0se0DMXtvMi/ilKazRPJp2YTQyLtzcyezuhHzLz3B5jXGVYiI
 L7FdAxNl9xiKV13umechSyzQA1RrgQ0SB3Sfw0E3lDOsugEu5fLjvEy5/Yw2dwnBlsLA Mg== 
Authentication-Results: ppops.net;
        spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
        by mx0a-001ae601.pphosted.com with ESMTP id 2v382qs2jw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Wed, 18 Sep 2019 07:51:16 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 18 Sep
 2019 13:51:14 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Wed, 18 Sep 2019 13:51:14 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 247822C1;
        Wed, 18 Sep 2019 12:51:14 +0000 (UTC)
Date:   Wed, 18 Sep 2019 12:51:14 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
CC:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <krzk@kernel.org>,
        <sbkim73@samsung.com>, <alsa-devel@alsa-project.org>,
        <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <b.zolnierkie@samsung.com>,
        <m.szyprowski@samsung.com>
Subject: Re: [PATCH v1 1/9] ASoC: wm8994: Do not register inapplicable
 controls for WM1811
Message-ID: <20190918125114.GE10204@ediswmail.ad.cirrus.com>
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104653eucas1p2e23ccbd05b3b780300adc9f4cb7a4c49@eucas1p2.samsung.com>
 <20190918104634.15216-2-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190918104634.15216-2-s.nawrocki@samsung.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com include:spf.protection.outlook.com
 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 bulkscore=0 adultscore=0 spamscore=0 mlxlogscore=884 impostorscore=0
 phishscore=0 mlxscore=0 clxscore=1011 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1908290000
 definitions=main-1909180131
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Sep 18, 2019 at 12:46:26PM +0200, Sylwester Nawrocki wrote:
> In case of WM1811 device there are currently being registered controls
> referring to registers not existing on that device.
> It has been noticed when getting values of "AIF1ADC2 Volume", "AIF1DAC2
> Volume" controls was failing during ALSA state restoring at boot time:
>  "amixer: Mixer hw:0 load error: Device or resource busy"
> 
> Reading some registers through I2C was failing with EBUSY error and indeed
> those registers were not available according to the datasheet.
> 
> To fix this controls not available on WM1811 are moved to a separate array
> and registered only for WM8994 and WM8958.
> 
> There are some further differences between WM8994 and WM1811, e.g. registers
> 603h, 604h, 605h, which are not covered in this patch.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
