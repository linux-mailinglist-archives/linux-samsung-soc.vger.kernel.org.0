Return-Path: <linux-samsung-soc+bounces-9364-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E941B04C04
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 15 Jul 2025 01:14:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB4CB4E18CD
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 14 Jul 2025 23:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA444279DAC;
	Mon, 14 Jul 2025 23:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Byi6Oq1m"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F139424337B
	for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Jul 2025 23:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752534670; cv=none; b=N7Pp60GF8W8uQRqgm4oVYrpUzvwGjKA6hMnmxDHgunxnvacQMUzzxSMqkv9hPzDT+uUm6yywPU2XWbW5JH/r8LZc3fApeC1KbH1LiwsuaD0mWzz/JRYRZg0a2Gf4+hE13iJIw9fUOzjnqCBuWimXTRxGGu6uloNFmPB9dwoh1ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752534670; c=relaxed/simple;
	bh=sP4SdeIpSUchjjIZMdqRkrYx1C+VnRkR1jo5U4lQz4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JaV/zUCKO4UMqQIskRPBg7ojAqYv6+uh5EtM77JhJODRKzc70LCsKHghPWV1lM7gcjwyuYe9xP+7GT5Q/Oy8fqwDEKDRwgapC+LM6TvdUXxTTqW59y7C9BIxfp+oW7VmqIIIBxLiLLXGWO4ekscNqjTHuqnnDLUYaHvvQ25DoIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Byi6Oq1m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EI5HOr013389
	for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Jul 2025 23:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lnAbRsgM5Xpw854WTnr2PpxC
	p0fWTNuQo/r6LvQOASo=; b=Byi6Oq1mlQ2Du1UBtBznaIYzQY4p8hL5pynHWdSv
	aTDe7W6x/B7tNhEqPkO5Y+VCzcSxQOtr0SuJfn7PglX+uFZMeALZiw5WrQcMh9rf
	sJ/Mc7HQOsEFmM9uIhSp5TBa7YwgWQ1Y4TrG1gWWLFFEW0WjJs/h8KGUsIHfDcD2
	49jcgELppT87gxfGxfXrNE98HiZW3Wn2N2WeWsSdypESIKNDnuxrp27nFMZzD+bx
	yU9qvwOPSfNE3+VFAsukhHo6roMkV6ATzLPh7u6HFnfVKFPkYJtaWBlZlEnxipRV
	XPQa3LJW0KKZLLpv05ITsY9TLU5AbgQXd0WQ0ZKra56mOQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxax6am-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Jul 2025 23:11:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c7c30d8986so1387325285a.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Jul 2025 16:11:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752534667; x=1753139467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lnAbRsgM5Xpw854WTnr2PpxCp0fWTNuQo/r6LvQOASo=;
        b=Okmnf5ReT/lpcODmlAox5Tz53VJ3U/rdrvR/GH9u4J8QhT4FZy+oRB/bNd9Jzg/1kv
         TE8h+DCE8Cxf5OWzECLU/V5ZCRTmQXHLfJ++YiljAMhkpUQEtTSxtRZe39dtiq0aU0Nf
         2SMurP02tFg4pQU+juk46gpDYTO95miumuQKO49nmapnSzv3S5ZYXpp4RV9kVXJGyJUv
         Tw1+amVskFDsslkF1DKWcpM8JyGxSlVf/2MPE8Ut/H2KBP2+g+YqMEEzY61/cKVsRSGo
         3lknlsQLN38+N1JD1QFAH6yda1JdnVf4P++na0fhQkcdqyJ6gMGET2kNWJ5foWaDoD1b
         jWSA==
X-Forwarded-Encrypted: i=1; AJvYcCXSIxITrpVI78aZn7w7AHxqCLKir+qrFSxGpmz0/yU4TD9+gXni3lO8x4n6m8uq/LUCp/EGN6p41RqJMx+yPRzBTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwygPLRKX3DxtNmiQHsOUaiiDHchB/6iUuN8uHt/tu7gSCtGlB2
	Ln6RIx9G5HjDeU89ahrWxhlQkqqcqdDP0iVGdXjjtC8RivpKd/p0EhfKuyiUN4u4DhC5IGKgw/e
	yf2HsL3q+sUzDbxuB6sdp2dRfjzHJoL/iiussure0FtwsV4XwISLad3s9+MxGySln1Vod1MkLcg
	==
X-Gm-Gg: ASbGncuMUGHuYOLnSehDEqkrAh+Q067XFjlNMTvY1g3+WpZOpPDYksg59WOJF1tJ1fb
	fir9xpLttdkIzSPgwMgENjZqwmCb8m3LjaTydDz14S3ZuPAAJ55DLQEXyiCCZsIOn5QPpCNcvNN
	bjmbyLN95jf6AwtzH5C2M196FqiR3QYrkOscI+92UQF4tz9Mys7Mq/Wm9RQ4MkEU2o4FdorZ6W9
	gY+QMcsozdK8530WD61VpyZZTBPgoq5EAsLhAL+bYBj0b8HlSodKsOMcZF6ePSIw77ImZa8dxeX
	Y/k4A9krSLEa1Sj/RbK9BXsFgv74lluGiWMMt9DPmci32+SfV5pAMiObmkUxuffHE48AmQc0lPq
	q/FcS0FRjPYsbiN+wTneWduGCB5pc2kSsp0PSi+1Xn3NVbII3+43i
X-Received: by 2002:a05:620a:394d:b0:7e1:f16c:16d6 with SMTP id af79cd13be357-7e1f16c171bmr1319844585a.8.1752534666777;
        Mon, 14 Jul 2025 16:11:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgcpRDGfh0tTeMaTiRAOLif3PtbYVlsrcAaMwHK8S/xvzLSUZaIFYJ4fcz95Qmvjsb6mBB+Q==
X-Received: by 2002:a05:620a:394d:b0:7e1:f16c:16d6 with SMTP id af79cd13be357-7e1f16c171bmr1319837885a.8.1752534666331;
        Mon, 14 Jul 2025 16:11:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b73366sm2094948e87.211.2025.07.14.16.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 16:11:04 -0700 (PDT)
Date: Tue, 15 Jul 2025 02:11:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Elliot Berman <elliotb317@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Andre Draszik <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>,
        linux-rockchip@lists.infradead.org,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v10 01/10] power: reset: reboot-mode: Add device tree
 node-based registration
Message-ID: <5zlix4hfxkz447g6e6imjlatmnf26pvunnsmfkol7mhvropq6o@k7wr6h4hyqtg>
References: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
 <20250710-arm-psci-system_reset2-vendor-reboots-v10-1-b2d3b882be85@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-arm-psci-system_reset2-vendor-reboots-v10-1-b2d3b882be85@oss.qualcomm.com>
X-Proofpoint-GUID: hOIzLc4BuKzmtNXXVkQ0l8avNt9ulbd5
X-Proofpoint-ORIG-GUID: hOIzLc4BuKzmtNXXVkQ0l8avNt9ulbd5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDE2MyBTYWx0ZWRfXzz4NtwZcfxn6
 gv9mxUW47r58u6qKaR0biWA2TAY6S1ba7+yL8x2dVx/kGs0x8CTYmbWob7Co0y15MC3XYQ36toH
 WbLae/EGxZkyWBsxRf0RezK1IztkoqzZf+AM++3IPjUwZxvxBm4OlFWz5udtjOiOouhgew7mPwD
 W8WfTPWCYnmYFriA2Sy8olsvaD8adFLEwO0LtyaH1NMaHEI04LXAXB8Sy3I3eyj9H9CCbFfhzAT
 zHxFab/QJDQQHTRUAL3K48QvMk8OB//CqadK6M0kTWhtfDEzrWYiJ/Qk/UEUTjpEIyOdtgHnYSB
 FEaLPNNKPdqTBpni1p64+z9zI3mgcnbJXgGHO5F9H0Ac1w99187LwVN+pOv3J9Kh248t1x9XhCg
 aU/+/1HNOzJJJBtX5/epRetvEHgigAQboTdWpiahGfa267hZmlN/zqG8wnk8S2RjyBRI2yWw
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=68758e8b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=SZ81-B_MNtUeYvdDzSwA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1011 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140163

On Thu, Jul 10, 2025 at 02:45:43PM +0530, Shivendra Pratap wrote:
> The reboot-mode driver does not have a strict requirement for
> device-based registration. It primarily uses the device's of_node
> to read mode-<cmd> properties and the device pointer for logging.
> 
> Remove the dependency on struct device and introduce support for
> Device Tree (DT) node-based registration. This enables drivers
> that are not associated with a struct device to leverage the
> reboot-mode framework.
> 
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/power/reset/reboot-mode.c | 23 +++++++++++++----------
>  include/linux/reboot-mode.h       |  2 +-
>  2 files changed, 14 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
> index fba53f638da04655e756b5f8b7d2d666d1379535..61f647b23959789a313f3af0bd967abcad45fa43 100644
> --- a/drivers/power/reset/reboot-mode.c
> +++ b/drivers/power/reset/reboot-mode.c
> @@ -12,6 +12,7 @@
>  #include <linux/reboot-mode.h>
>  
>  #define PREFIX "mode-"
> +#define pr_fmt(fmt)	"reboot-mode: " fmt

This wasn't really tested. If I remember correctly, it should be defined
before the first include.

>  
>  struct mode_info {
>  	const char *mode;

-- 
With best wishes
Dmitry

