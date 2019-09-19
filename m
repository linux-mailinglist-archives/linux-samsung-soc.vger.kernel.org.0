Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8F00B7CDD
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 19 Sep 2019 16:33:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731606AbfISOdS (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 19 Sep 2019 10:33:18 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:57980 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727273AbfISOdR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Sep 2019 10:33:17 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x8JETdu7021634;
        Thu, 19 Sep 2019 09:33:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=FDaRypo+j50YgitERnDEc/xIOK+On/bG2ssjyX0M/i4=;
 b=p/PV8zwgYla3Sy/5w7AeTL//Lb1T/M5K0+5et5m42Bjv2CLYgdw4qNq+aJYne+XBxpfq
 hW54vj2s/XzZ1O5EMZycwqN9S5plpShMN54hrxKu/L/V96w9K9SswKsazCAKb4pAYFDI
 7kVJ/5nguTGWzKKoG1ihlK2dbiCbIrTu4Yqu3AUs88B0p6TAh6e8wAVhaVjDDqjJRYe7
 HpXjn2KZg9PQA29UG1Cz6BPlRpmoVYDmJCfgn5p432ENYJt5+Y9i6ppZkufgmc8/ScmZ
 GcdOjIGR6KypbZt2Vdg9ZO6bX0d93HahAjWHZv2xNaOQb5HFzN0k0B50wzfQQBpRNo+x +A== 
Authentication-Results: ppops.net;
        spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
        by mx0b-001ae601.pphosted.com with ESMTP id 2v3vbh15s9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 19 Sep 2019 09:33:03 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 19 Sep
 2019 15:33:01 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Thu, 19 Sep 2019 15:33:01 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9CF4C2C5;
        Thu, 19 Sep 2019 14:33:01 +0000 (UTC)
Date:   Thu, 19 Sep 2019 14:33:01 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
CC:     <devicetree@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-samsung-soc@vger.kernel.org>, <b.zolnierkie@samsung.com>,
        <sbkim73@samsung.com>, <patches@opensource.cirrus.com>,
        <broonie@kernel.org>, <lgirdwood@gmail.com>, <krzk@kernel.org>,
        <robh+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <m.szyprowski@samsung.com>
Subject: Re: [PATCH v1 4/9] ASoC: wm8994: Add support for MCLKn clock gating
Message-ID: <20190919143301.GM10204@ediswmail.ad.cirrus.com>
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104700eucas1p1ef0775632f5c7259fb54cab8efc96c50@eucas1p1.samsung.com>
 <20190918104634.15216-5-s.nawrocki@samsung.com>
 <20190918143157.GH10204@ediswmail.ad.cirrus.com>
 <717b3f94-1a24-a407-398f-6a476cf7ff69@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <717b3f94-1a24-a407-398f-6a476cf7ff69@samsung.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com include:spf.protection.outlook.com
 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1908290000
 definitions=main-1909190137
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Sep 19, 2019 at 01:58:35PM +0200, Sylwester Nawrocki wrote:
> On 9/18/19 16:31, Charles Keepax wrote:
> >> @@ -2315,6 +2396,8 @@ static int _wm8994_set_fll(struct snd_soc_component *component, int id, int src,
> >>  
> >>  			active_dereference(component);
> >>  		}
> >> +		if (mclk)
> >> +			clk_disable_unprepare(mclk);
> >
> > I don't think this works in the case of changing active FLLs.
> > The driver looks like it allows changing the FLL configuration
> > whilst the FLL is already active in which case it you would have
> > two wm8994_set_fll calls enabling the FLL but only a single one
> > disabling it. Resulting in the FLL being off but the MCLK being
> > left enabled.
> 
> Indeed I missed this scenario, or rather assumed it won't be used.
> But since the driver allows reconfiguring active FLLs we should make
> sure such use case remains properly supported.
> 
> What I came up so far as a fix is reading current FLL refclk source and 
> if FLL was enabled with that source disabling refclk, before we change FLL 
> configuration to new one.  So we have clk_disable_unprepare(MCLK) more 
> closely following FLL enable bit changes.  I have tested it and it seems 
> to work - something like below. Do you think it makes sense?
> 

Yeah I think that looks good, it is very similar to what we did
on Arizona and I haven't found any problems with that yet :-)

Thanks,
Charles
