Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B52DB6398
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 18 Sep 2019 14:54:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731311AbfIRMyt (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 18 Sep 2019 08:54:49 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:22058 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729333AbfIRMyt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 18 Sep 2019 08:54:49 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x8ICsbtm031103;
        Wed, 18 Sep 2019 07:54:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=13RYjTpIb0kBseBOnzm4zjz1SptlMzV+30Q8nl5N5ww=;
 b=MuRgHPO+yDFw6h/GA/126LtZbd49VGvfwxM0iXQIHWWwEy65n/vzqKOHBKf2hNQ7xegf
 MXrO5BIOyTASHfS6oc22raXYhxdJHTw59TbCdYFggWl1/rO0cqx28ZkABUi1f4poXFdd
 XIzjLijqKxpPvneqi7LZ+etAm/h4yCxXi4JExUzYFpI/WYGqyzNWFiuAl6GF/V35lEO6
 ksvaQy6Jx0M+MlAXwiEaXN/Pn2LsBQ9OTb8zyDhb7OStcQN3sJJkCq7GuvSCW0jTsuaK
 E1PMt6y5bkYJS8fu4n7iWp12Ok6UDayArEz+yFWcB9YZTud3451dc9TKm+7CcdhOj7bD qw== 
Authentication-Results: ppops.net;
        spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
        by mx0b-001ae601.pphosted.com with ESMTP id 2v37m192gu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Wed, 18 Sep 2019 07:54:37 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 18 Sep
 2019 13:54:35 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Wed, 18 Sep 2019 13:54:35 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D070F2C1;
        Wed, 18 Sep 2019 12:54:35 +0000 (UTC)
Date:   Wed, 18 Sep 2019 12:54:35 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
CC:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <krzk@kernel.org>,
        <sbkim73@samsung.com>, <alsa-devel@alsa-project.org>,
        <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <b.zolnierkie@samsung.com>,
        <m.szyprowski@samsung.com>, <lee.jones@linaro.org>
Subject: Re: [PATCH v1 2/9] mfd: wm8994: Add support for MCLKn clock control
Message-ID: <20190918125435.GF10204@ediswmail.ad.cirrus.com>
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104656eucas1p1d9cad1394b08d05a99151c4fbc9425ce@eucas1p1.samsung.com>
 <20190918104634.15216-3-s.nawrocki@samsung.com>
 <49ef7282-3765-9149-285d-a4025417eb58@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <49ef7282-3765-9149-285d-a4025417eb58@samsung.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com include:spf.protection.outlook.com
 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=853 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1908290000
 definitions=main-1909180132
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Sep 18, 2019 at 12:59:28PM +0200, Sylwester Nawrocki wrote:
> On 9/18/19 12:46, Sylwester Nawrocki wrote:
> > The WM1811/WM8994/WM8958 audio CODEC DT bindings specify two optional
> > clocks: "MCLK1", "MCLK2". Add code for getting those clocks in the MFD
> > part of the wm8994 driver so they can be further handled in the audio
> > CODEC part.
> > 
> > Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> > ---
> >  
> > +	wm8994->mclk[WM8994_MCLK1].id = "MCLK1";
> > +	wm8994->mclk[WM8994_MCLK2].id = "MCLK2";
> > +
> > +	ret = devm_clk_bulk_get_optional(wm8994->dev, ARRAY_SIZE(wm8994->mclk),
> > +					 wm8994->mclk);
> > +	if (ret != 0)
> > +		return ret;

Would be nice to print a message here as well, make it clear what
failed in the log. Apart from that minor nit:

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
