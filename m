Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3C4EB7CD6
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 19 Sep 2019 16:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389348AbfISObd (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 19 Sep 2019 10:31:33 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:30914 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2388872AbfISObc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Sep 2019 10:31:32 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x8JETFWh020368;
        Thu, 19 Sep 2019 09:31:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=PupjcNRQ2lxRP0e4ia7WEj2POWDctVOG0nBQBB08VYk=;
 b=J9buVC0Zz24St63xLUxx42wcaPWcFSJ06NxtMhirEAqaTpZowp4vkWR5cyxEhD72qaHS
 3TC0FbJNBs9vblA8iPqYlUzVKbJbU8h3HPyGK22qQEmqOnrx5OrzgICPi8MZV9bkw7Zd
 MyF8HadxeGI/zSooHeNn7CVWfP5YJk28OpEwNECWgPcoXdswkiCGwTiRMMj9CUGyAaYt
 maRdCjfHS1q54R3kZ0p1D7Q6PEu0SjGTDTro5S8Ix5D0eCw9+dpLMOTeNz9GfBMfsLtG
 XBbcorQdVMC6a/kI7lJ2FDP/gZ1fiR35zzOGoP/5x8flkvVYRTsoVDxx8p3Ee/ehlmHo GA== 
Authentication-Results: ppops.net;
        spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
        by mx0a-001ae601.pphosted.com with ESMTP id 2v3vbhs7sk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 19 Sep 2019 09:31:19 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 19 Sep
 2019 15:31:16 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Thu, 19 Sep 2019 15:31:16 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id BD7042C3;
        Thu, 19 Sep 2019 14:31:16 +0000 (UTC)
Date:   Thu, 19 Sep 2019 14:31:16 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Mark Brown <broonie@kernel.org>
CC:     Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        <lgirdwood@gmail.com>, <sbkim73@samsung.com>,
        <alsa-devel@alsa-project.org>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <b.zolnierkie@samsung.com>,
        <m.szyprowski@samsung.com>
Subject: Re: [PATCH v1 2/9] mfd: wm8994: Add support for MCLKn clock control
Message-ID: <20190919143116.GL10204@ediswmail.ad.cirrus.com>
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104656eucas1p1d9cad1394b08d05a99151c4fbc9425ce@eucas1p1.samsung.com>
 <20190918104634.15216-3-s.nawrocki@samsung.com>
 <20190919075924.GB13195@pi3>
 <20190919125020.GJ3642@sirena.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190919125020.GJ3642@sirena.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com include:spf.protection.outlook.com
 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=938
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1909190137
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Sep 19, 2019 at 01:50:20PM +0100, Mark Brown wrote:
> On Thu, Sep 19, 2019 at 09:59:24AM +0200, Krzysztof Kozlowski wrote:
> > On Wed, Sep 18, 2019 at 12:46:27PM +0200, Sylwester Nawrocki wrote:
> > > The WM1811/WM8994/WM8958 audio CODEC DT bindings specify two optional
> > > clocks: "MCLK1", "MCLK2". Add code for getting those clocks in the MFD
> > > part of the wm8994 driver so they can be further handled in the audio
> > > CODEC part.
> 
> > I think these are needed only for the codec so how about getting them in
> > codec's probe?
> 
> Yeah.  IIRC when these were added a machine driver was grabbing them.  I
> don't think that machine driver ever made it's way upstream though.

If you mean for the Arizona stuff, the machine driver using that
was sound/soc/samsung/tm2_wm5110.c. Sylwester upstreamed it along
with the patches.

I think on wm8994 the clocks probably are only needed by the
audio part of the driver, so probably can be moved in there,
although as a disclaimer I have done a lot less with parts
of that era. However on Arizona the clocking is needed from
various parts of the driver so couldn't be moved exclusively
to the codec driver.

Thanks,
Charles
