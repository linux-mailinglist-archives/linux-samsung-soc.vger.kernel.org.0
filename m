Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47878B6626
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 18 Sep 2019 16:32:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731257AbfIROcO (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 18 Sep 2019 10:32:14 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:48108 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731242AbfIROcN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 18 Sep 2019 10:32:13 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x8IEEBG9005771;
        Wed, 18 Sep 2019 09:32:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=85mW0bFWiiIVuyJiPKM02zlJFmWQIMDT9ECHIvX0eJQ=;
 b=AaegY7/Y2PorFSTmv1tusBxEPcjnGNa9+O9pQlrOHZyxaS1oObNe3xbsuJ77XJt/FytV
 ai5CyyauW39nVL7SDis0U7KeZSzTKukIKufMtwUoShvJHhUZ499pdnyNTQ9hgdcuNZNm
 du3u6jEfTBhbFrgSnvrOqZyLQsWUoplVxmY+J8DGixg89IL6RhcQuZ5T8NSyTxOMmzaF
 iS2eg/unL2hWZkWN3ugb5aVWRjRWBC+8I99UdPS8P0+6z8y4no2c5/uJ5dxBQlJZFWZy
 YhU8Efld9uy/LdmNvghxltvCz0tRAeEG95akwMHhZqqioH5bHXF0zOI50aMkGMJSNBfE RA== 
Authentication-Results: ppops.net;
        spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
        by mx0b-001ae601.pphosted.com with ESMTP id 2v37m197ex-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Wed, 18 Sep 2019 09:31:59 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 18 Sep
 2019 15:31:57 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Wed, 18 Sep 2019 15:31:57 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DA4CD2C3;
        Wed, 18 Sep 2019 14:31:57 +0000 (UTC)
Date:   Wed, 18 Sep 2019 14:31:57 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
CC:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <krzk@kernel.org>,
        <sbkim73@samsung.com>, <alsa-devel@alsa-project.org>,
        <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <b.zolnierkie@samsung.com>,
        <m.szyprowski@samsung.com>
Subject: Re: [PATCH v1 4/9] ASoC: wm8994: Add support for MCLKn clock gating
Message-ID: <20190918143157.GH10204@ediswmail.ad.cirrus.com>
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104700eucas1p1ef0775632f5c7259fb54cab8efc96c50@eucas1p1.samsung.com>
 <20190918104634.15216-5-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190918104634.15216-5-s.nawrocki@samsung.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com include:spf.protection.outlook.com
 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1908290000
 definitions=main-1909180144
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Sep 18, 2019 at 12:46:29PM +0200, Sylwester Nawrocki wrote:
> As an intermediate step before covering the clocking subsystem
> of the CODEC entirely by the clk API add handling of external CODEC's
> master clocks in DAPM events when the AIFn clocks are sourced directly
> from MCLKn; when FLLn are used we enable/disable respective MCLKn
> before/after FLLn is enabled/disabled.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> @@ -2260,8 +2321,28 @@ static int _wm8994_set_fll(struct snd_soc_component *component, int id, int src,
>  	/* Clear any pending completion from a previous failure */
>  	try_wait_for_completion(&wm8994->fll_locked[id]);
>  
> +	switch (src) {
> +	case WM8994_FLL_SRC_MCLK1:
> +		mclk = control->mclk[0].clk;
> +		break;
> +	case WM8994_FLL_SRC_MCLK2:
> +		mclk = control->mclk[1].clk;
> +		break;
> +	default:
> +		mclk = NULL;
> +	}
> +
>  	/* Enable (with fractional mode if required) */
>  	if (freq_out) {
> +		if (mclk) {
> +			ret = clk_prepare_enable(mclk);
> +			if (ret < 0) {
> +				dev_err(component->dev,
> +					"Failed to enable MCLK for FLL%d\n",
> +					id + 1);
> +				return ret;
> +			}
> +		}
>  		/* Enable VMID if we need it */
>  		if (!was_enabled) {
>  			active_reference(component);
> @@ -2315,6 +2396,8 @@ static int _wm8994_set_fll(struct snd_soc_component *component, int id, int src,
>  
>  			active_dereference(component);
>  		}
> +		if (mclk)
> +			clk_disable_unprepare(mclk);

I don't think this works in the case of changing active FLLs.
The driver looks like it allows changing the FLL configuration
whilst the FLL is already active in which case it you would have
two wm8994_set_fll calls enabling the FLL but only a single one
disabling it. Resulting in the FLL being off but the MCLK being
left enabled.

Thanks,
Charles
