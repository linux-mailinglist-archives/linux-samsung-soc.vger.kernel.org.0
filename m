Return-Path: <linux-samsung-soc+bounces-2765-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E62788A5215
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 15 Apr 2024 15:45:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74BDFB2660F
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 15 Apr 2024 13:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C8D73196;
	Mon, 15 Apr 2024 13:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Dy752Knc"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798483C3C
	for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Apr 2024 13:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713188717; cv=none; b=L2txb2+RZpSyqozXgZszr2Xu5xGqvZ/waPrxWVULHJ70+NA7pwuwQlcjawJrvdOiQkb8GZDyiMtbi3Nrk0pfdCxbk1ojc0Wu6WCHHq7NvUbu8FeY/DfYAZ9FpFQ4F9Fe5pt4uZsbKWA3b5x4YKcy/LW1JITP2+lnuyFZr++2FbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713188717; c=relaxed/simple;
	bh=z32CIwWQD4JoiW1WeMXZvCwEz34iuVgxLb9gsZ5i56w=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rNAlZLQGv6u3uEYRDioRtoPmKQesAA5e8bs5opgkyOsaG8liG3lPIi764Wk+jq94yy0yNs52sx54ezWjE/MeYc75wdFuxnwcKZ6d9Tc938KBvqrrWGehyQnywbDtepJnBr/FVvZnT8GCU1T1jTq24uH3q82aR7X8v4CenekgITs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Dy752Knc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43FDgHLp032713;
	Mon, 15 Apr 2024 13:45:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=qcppdkim1; bh=yhE0N2GTjzloNk8jSE6bL
	1E7cB8XApNZKK5EefZJ4P4=; b=Dy752KncX+0qPUtwl62xGFwJu/DOlByTMSyRV
	RwDnVwOE2JbPaOKtAnnuZ4KDvEtt96WpkJdEuSqG3Z81yMGtE1tR/JZg0/65ba+L
	uxKdfeWJY5EYSG7hct3G3MU/VXT0J5qwUObOKD72jcfdItNgQITAWAaQiyLD3wtU
	qTZa0QlwsrBItBOEfCjUkZos6vP8ZSmi37nZEqU/sC5G1kLjpyRWmFF4oeoVU9+u
	tZ6b38LS+iFCIGmf+tCxaaDJD/Hsiyzo7vaanv75QPxJjYuzAcmgMxIKlKlnH+e3
	zVS2p75tmrlqh/enbvxgsTGVThcfHpx2me1Ug9jnaB1kKNFJA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xh5bsr05j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Apr 2024 13:45:05 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43FDj3v4031752
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Apr 2024 13:45:03 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 15 Apr 2024 06:45:03 -0700
Date: Mon, 15 Apr 2024 06:45:02 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Rob Herring <robh@kernel.org>
CC: <soc@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli
	<florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list
	<bcm-kernel-feedback-list@broadcom.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Tsahee Zidenberg <tsahee@annapurnalabs.com>,
        Antoine Tenart
	<atenart@kernel.org>,
        Khuong Dinh <khuong@os.amperecomputing.com>,
        Liviu
 Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo
 Pieralisi <lpieralisi@kernel.org>,
        Ray Jui <rjui@broadcom.com>, Scott Branden
	<sbranden@broadcom.com>,
        Robert Richter <rric@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>,
        Li Yang <leoyang.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "Paul J. Murphy"
	<paul.j.murphy@intel.com>,
        Daniele Alessandrelli
	<daniele.alessandrelli@intel.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory
 Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth
	<sebastian.hesselbarth@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Thierry
 Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Andreas =?iso-8859-1?Q?F=E4rber?=
	<afaerber@suse.de>,
        Heiko Stuebner <heiko@sntech.de>, Orson Zhai
	<orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan
 Zhang <zhang.lyra@gmail.com>,
        Jisheng Zhang <jszhang@kernel.org>,
        Alim Akhtar
	<alim.akhtar@samsung.com>, <linux-fsd@tesla.com>,
        Michal Simek
	<michal.simek@amd.com>, <devicetree@vger.kernel.org>,
        <linux-rpi-kernel@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-realtek-soc@lists.infradead.org>,
        <linux-rockchip@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH] arm/arm64: dts: Drop "arm,armv8-pmuv3" compatible usage
Message-ID: <Zh0vXinxy7woerJQ@hu-bjorande-lv.qualcomm.com>
References: <20240412222857.3873079-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240412222857.3873079-1-robh@kernel.org>
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: anep3cOZZbefLkEXjJhwpqdl-o9hjFoO
X-Proofpoint-GUID: anep3cOZZbefLkEXjJhwpqdl-o9hjFoO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-15_11,2024-04-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=522
 priorityscore=1501 spamscore=0 clxscore=1011 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404150089

On Fri, Apr 12, 2024 at 05:28:51PM -0500, Rob Herring wrote:
[..]
>  arch/arm64/boot/dts/qcom/qcm2290.dtsi                | 2 +-
>  arch/arm64/boot/dts/qcom/qdu1000.dtsi                | 2 +-
>  arch/arm64/boot/dts/qcom/sdm630.dtsi                 | 2 +-
>  arch/arm64/boot/dts/qcom/sdx75.dtsi                  | 2 +-

Acked-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

