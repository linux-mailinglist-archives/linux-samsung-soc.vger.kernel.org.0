Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00001B662E
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 18 Sep 2019 16:33:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731290AbfIROdR (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 18 Sep 2019 10:33:17 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:24434 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727056AbfIROdR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 18 Sep 2019 10:33:17 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x8IEEOPG022999;
        Wed, 18 Sep 2019 09:33:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=IZmXWSe7fCfz0I1MMz1NsgH64lfX6epff+8flW4H90A=;
 b=rG2BKVG3DUsT2LEioiZmfBzw+WWhTk/e2KxWhAWUxMCfEyUbBWjNaE/0TLZ0JgT+UGJc
 RCuZ/oWGy4JcXAuOakU0z6i/M0w0WPYGGj2FxXJENgSzdztDA62FiLveYL5KzqocZWi7
 qUTLqdx3WW8yPcM6JAS9Yb8wlX4TsnnkrrBQiy6A7J9140bor/3x4ECydtjPZKIUwqO3
 e1SBSDHFCXViow936CJDdtEnuHat0/rGcNp4nU23gR+ULTAUEP/42VKLwOYckoQ8IDiW
 JxHvPTraQnheis+bS+8tcZPU33RGXzbMpm1tnv8EUSRIwRdoPcduwEDRnKrZ6nIHbh7W dw== 
Authentication-Results: ppops.net;
        spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
        by mx0a-001ae601.pphosted.com with ESMTP id 2v382qs7r6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Wed, 18 Sep 2019 09:33:04 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 18 Sep
 2019 15:33:02 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Wed, 18 Sep 2019 15:33:02 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4386C2C1;
        Wed, 18 Sep 2019 14:33:02 +0000 (UTC)
Date:   Wed, 18 Sep 2019 14:33:02 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
CC:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <krzk@kernel.org>,
        <sbkim73@samsung.com>, <alsa-devel@alsa-project.org>,
        <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <b.zolnierkie@samsung.com>,
        <m.szyprowski@samsung.com>
Subject: Re: [PATCH v1 5/9] ASoC: samsung: arndale: Simplify DAI link
 initialization
Message-ID: <20190918143302.GI10204@ediswmail.ad.cirrus.com>
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104702eucas1p213070d06c69c4836d15d071b1926e60d@eucas1p2.samsung.com>
 <20190918104634.15216-6-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190918104634.15216-6-s.nawrocki@samsung.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com include:spf.protection.outlook.com
 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 bulkscore=0 adultscore=0 spamscore=0 mlxlogscore=717 impostorscore=0
 phishscore=0 mlxscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1908290000
 definitions=main-1909180144
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Sep 18, 2019 at 12:46:30PM +0200, Sylwester Nawrocki wrote:
> There is only one DAI link so we can drop an unnecessary loop statement.
> Use card->dai_link in place of direct static arndale_rt5631_dai[] array
> dereference as a prerequisite for adding support for other CODECs.
> Unnecessary assignment of dai_link->codecs->name to NULL is removed.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
