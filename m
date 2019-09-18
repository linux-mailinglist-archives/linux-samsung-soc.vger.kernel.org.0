Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDF88B6659
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 18 Sep 2019 16:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731279AbfIROqI (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 18 Sep 2019 10:46:08 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:20194 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731213AbfIROqH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 18 Sep 2019 10:46:07 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x8IEhrtO014963;
        Wed, 18 Sep 2019 09:45:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=/PkaBLjqrZnFFsfMPPGd9OsWu3s/ywG4YE1D4v04UF0=;
 b=KNsjjCzjN0eYGWBtNt8IsihwEEOw+70uSyugZ0kv4joMGKCtiFwEvgTMkhLxd/D7Z6Gt
 IKyQS2IiQJ/ik5Cmr58H+9KB2pABeU5wxjBfk9D3Z72k0MuEj3GbIXnOaRodFAbOlAW4
 rTNNLEBrIFSDUmufaua6aKqlHwAtb/ZZTKG1bkQEWrksB+gqOidoWY2aTmwcnXjw4Z16
 SpmXlDMRH4xYQktdSCWQ+QwSGqF5zJvlMvPCg6KL5mYh9u0u2FcnXTxHUOSl9PkOsSHK
 7h+EKzC22PJ+1sHzE64SMmgtsNFSQOd8Nv5XqtV9o7ancveMqRewd0rrIwGSc4mYKWMf /A== 
Authentication-Results: ppops.net;
        spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
        by mx0a-001ae601.pphosted.com with ESMTP id 2v382qs8fs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Wed, 18 Sep 2019 09:45:55 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 18 Sep
 2019 15:45:53 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Wed, 18 Sep 2019 15:45:53 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9044B2C3;
        Wed, 18 Sep 2019 14:45:53 +0000 (UTC)
Date:   Wed, 18 Sep 2019 14:45:53 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
CC:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <krzk@kernel.org>,
        <sbkim73@samsung.com>, <alsa-devel@alsa-project.org>,
        <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <b.zolnierkie@samsung.com>,
        <m.szyprowski@samsung.com>
Subject: Re: [PATCH v1 7/9] ASoC: samsung: arndale: Add support for WM1811
 CODEC
Message-ID: <20190918144553.GJ10204@ediswmail.ad.cirrus.com>
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104705eucas1p1c01dc05bff199188677915e2bb8f7472@eucas1p1.samsung.com>
 <20190918104634.15216-8-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190918104634.15216-8-s.nawrocki@samsung.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com include:spf.protection.outlook.com
 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 bulkscore=0 adultscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 phishscore=0 mlxscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1908290000
 definitions=main-1909180146
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Sep 18, 2019 at 12:46:32PM +0200, Sylwester Nawrocki wrote:
> The Arndale boards come with different types of the audio daughter
> board.  In order to support the WM1811 one we add new definition of
> an ASoC card which will be registered when the driver matches on
> "samsung,arndale-wm1811" compatible.  There is no runtime detection of
> the audio daughter board type at the moment, compatible string of the
> audio card needs to be adjusted in DT, e.g. by the bootloader,
> depending on actual audio board (CODEC) used.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> -static const struct of_device_id samsung_arndale_rt5631_of_match[] __maybe_unused = {
> -	{ .compatible = "samsung,arndale-rt5631", },
> -	{ .compatible = "samsung,arndale-alc5631", },
> +static const struct of_device_id arndale_audio_of_match[] __maybe_unused = {

If your removing the of_match_ptr below I think the
__maybe_unused should be removed as well.

Thanks,
Charles

> +	{ .compatible = "samsung,arndale-rt5631",  .data = &arndale_rt5631 },
> +	{ .compatible = "samsung,arndale-alc5631", .data = &arndale_rt5631 },
> +	{ .compatible = "samsung,arndale-wm1811",  .data = &arndale_wm1811 },
>  	{},
>  };
> -MODULE_DEVICE_TABLE(of, samsung_arndale_rt5631_of_match);
> +MODULE_DEVICE_TABLE(of, arndale_of_match);
>  
>  static struct platform_driver arndale_audio_driver = {
>  	.driver = {
> -		.name   = "arndale-audio",
> +		.name = "arndale-audio",
>  		.pm = &snd_soc_pm_ops,
> -		.of_match_table = of_match_ptr(samsung_arndale_rt5631_of_match),
> +		.of_match_table = arndale_audio_of_match,
